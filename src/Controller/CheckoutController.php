<?php

namespace App\Controller;

use App\Entity\Book;
use Doctrine\ORM\EntityManagerInterface;
use Stripe\Checkout\Session as StripeCheckoutSession;
use Stripe\Stripe;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Bundle\SecurityBundle\Security;
use Symfony\Component\HttpFoundation\Response;

class CheckoutController extends AbstractController
{
    #[Route('/checkout', name: 'checkout', methods: ['GET'])]
    public function checkout(SessionInterface $session, EntityManagerInterface $em, Security $security): RedirectResponse
    {
        // Retrieve cart items from session
        $cart = $session->get('cart', []);
        if (empty($cart)) {
            $this->addFlash('warning', 'Your cart is empty!');
            return $this->redirectToRoute('app_cart');
        }

        // Calculate total price for checkout session
        $lineItems = [];
        $total = 0;

        foreach ($cart as $bookId => $quantity) {
            $book = $em->getRepository(Book::class)->find($bookId);
            if ($book) {
                $lineItems[] = [
                    'price_data' => [
                        'currency' => 'usd',  // Specify currency
                        'product_data' => [
                            'name' => $book->getTitle(),
                            'images' => [$book->getImageUrl()],
                        ],
                        'unit_amount' => $book->getPrice() * 100,  // Price in cents
                    ],
                    'quantity' => $quantity,
                ];

                $total += $book->getPrice() * $quantity;
            }
        }

        // Initialize Stripe with your secret key
        Stripe::setApiKey($_ENV['']);
        try {
            // Create Stripe checkout session
            $session = StripeCheckoutSession::create([
                'payment_method_types' => ['card'],
                'line_items' => $lineItems,
                'mode' => 'payment',
                'success_url' => $this->generateUrl('checkout_success', [], true),
                'cancel_url' => $this->generateUrl('checkout_cancel', [], true),
            ]);

            // Redirect the user to Stripe checkout page
            return $this->redirect($session->url);
        } catch (\Exception $e) {
            $this->addFlash('error', 'Error creating Stripe checkout session: ' . $e->getMessage());
            return $this->redirectToRoute('app_cart');
        }
    }

    #[Route('/checkout/success', name: 'checkout_success')]
    public function success(): Response
    {
        // Handle successful checkout here (e.g., update order status)
        $this->addFlash('success', 'Payment successful!');

        return $this->redirectToRoute('app_book_public_index');  // Redirect to a thank-you page or homepage
    }

    #[Route('/checkout/cancel', name: 'checkout_cancel')]
    public function cancel(): Response
    {
        // Handle checkout cancellation here
        $this->addFlash('error', 'Payment cancelled!');

        return $this->redirectToRoute('app_cart');  // Redirect back to the cart
    }
}
