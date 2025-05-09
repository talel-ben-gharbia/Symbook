<?php

namespace App\Security;

use App\Entity\User;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Mailer\MailerInterface;
use SymfonyCasts\Bundle\VerifyEmail\Exception\VerifyEmailExceptionInterface;
use SymfonyCasts\Bundle\VerifyEmail\VerifyEmailHelperInterface;
use Psr\Log\LoggerInterface;

class EmailVerifier
{
    public function __construct(
        private VerifyEmailHelperInterface $verifyEmailHelper,
        private MailerInterface $mailer,
        private EntityManagerInterface $entityManager,
        private LoggerInterface $logger
    ) {
    }

    public function sendEmailConfirmation(string $verifyEmailRouteName, User $user, TemplatedEmail $email): void
    {
        try {
            $signatureComponents = $this->verifyEmailHelper->generateSignature(
                $verifyEmailRouteName,
                (string) $user->getId(),
                (string) $user->getEmail(),
                ['id' => $user->getId()]
            );

            // Merge signature data into the email context
            $email->context(array_merge($email->getContext(), [
                'signedUrl' => $signatureComponents->getSignedUrl(),
                'expiresAtMessageKey' => $signatureComponents->getExpirationMessageKey(),
                'expiresAtMessageData' => $signatureComponents->getExpirationMessageData(),
            ]));

            // Log the full context for debugging
            $this->logger->info('Email context for ' . $user->getEmail() . ': ' . json_encode($email->getContext()));
            $this->logger->info('Confirmation email sending to ' . $user->getEmail());

            // Send the email
            $this->mailer->send($email);

            $this->logger->info('Confirmation email successfully sent to ' . $user->getEmail());
        } catch (\Exception $e) {
            $this->logger->error('Failed to send confirmation email to ' . $user->getEmail() . ': ' . $e->getMessage());
            throw $e;
        }
    }

    /**
     * @throws VerifyEmailExceptionInterface
     */
    public function handleEmailConfirmation(Request $request, User $user): void
    {
        try {
            $this->verifyEmailHelper->validateEmailConfirmationFromRequest(
                $request,
                (string) $user->getId(),
                (string) $user->getEmail()
            );

            $user->setIsVerified(true);
            $this->entityManager->persist($user);
            $this->entityManager->flush();

            $this->logger->info('Email verified for user: ' . $user->getEmail());
        } catch (VerifyEmailExceptionInterface $e) {
            $this->logger->error('Email verification failed for ' . $user->getEmail() . ': ' . $e->getReason());
            throw $e;
        }
    }
}
