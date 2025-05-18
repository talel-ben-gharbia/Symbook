<?php

namespace App\Controller;

use Stripe\Stripe;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class StripeController extends AbstractController
{
    #[Route('/payment/success', name: 'app_stripe_success')]
    public function success(): Response
    {
        return $this->render('order/success.html.twig');
    }

    #[Route('/payment/cancel', name: 'app_stripe_cancel')]
    public function cancel(): Response
    {
        return $this->render('order/cancel.html.twig');
    }

    #[Route('/stripe/notif', name: 'app_stripe_notif', methods: ['POST'])]
    public function notification(Request $request): Response
    {
        Stripe::setApiKey($_ENV['STRIPE_SECRET']); // okay but not ideal

        $endpointSecret = $_ENV['STRIPE_ENDPOINT_SECRET'];
        $payload = $request->getContent();
        $sigHeader = $request->headers->get('stripe-signature');
        $event = null;

        try {
            $event = \Stripe\Webhook::constructEvent(
                $payload,
                $sigHeader,
                $endpointSecret
            );
        } catch (\UnexpectedValueException $e) {
            return new Response('Invalid payload', 400);
        } catch (\Stripe\Exception\SignatureVerificationException $e) {
            return new Response('Invalid signature', 400);
        }

        switch ($event->type) {
            case 'payment_intent.succeeded':
                $paymentIntent = $event->data->object;
                file_put_contents(
                    __DIR__ . '/../../var/log/stripe_payment_' . uniqid() . '.log',
                    json_encode($paymentIntent)
                );

                break;

            case 'payment_method.attached':
                // Not needed unless you're handling saved cards
                break;

            default:
                // Unhandled event type
                break;
        }

        return new Response('Webhook received', 200);
    }
}
