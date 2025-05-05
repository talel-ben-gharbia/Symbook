<?php

namespace App\Controller;

use App\Entity\User;
use Doctrine\ORM\EntityManagerInterface;
use Psr\Log\LoggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\UriSigner;
use Symfony\Component\Routing\Annotation\Route;

class VerificationController extends AbstractController
{
    #[Route('/verify-email', name: 'app_verify_email')]
    public function verifyEmail(
        Request $request,
        EntityManagerInterface $em,
        UriSigner $uriSigner,
        LoggerInterface $logger
    ): Response {
        $email = $request->query->get('email');
        $token = $request->query->get('token');

        // Verify the URL signature
        if (!$uriSigner->check($request->getUri())) {
            $logger->warning('Invalid or tampered verification URL for email: ' . $email);
            $this->addFlash('error', 'Invalid or expired verification link.');
            return $this->redirectToRoute('app_home');
        }

        $user = $em->getRepository(User::class)->findOneBy([
            'email' => $email,
            'verificationToken' => $token,
        ]);

        if (!$user) {
            $logger->warning('Invalid verification token or user not found for email: ' . $email);
            $this->addFlash('error', 'Invalid or expired verification link.');
            return $this->redirectToRoute('app_home');
        }

        if ($user->isVerified()) {
            $logger->info('Email already verified for user: ' . $email);
            $this->addFlash('info', 'Your email is already verified. Please log in.');
        } else {
            $user->setIsVerified(true);
            $user->setVerificationToken(null);
            $em->flush();
            $logger->info('Email verified for user: ' . $email);
            $this->addFlash('success', 'Your email has been verified. Please log in.');
        }

        return $this->redirectToRoute('app_home');
    }
}