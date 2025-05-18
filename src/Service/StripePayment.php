<?php

namespace App\Service;

use Stripe\Checkout\Session;
use Stripe\Stripe;

class StripePayment
{
    private string $stripeSecretKey;

    private ?string $stripeRedirectUrl = null;

    public function __construct(string $stripeSecretKey)
    {
        $this->stripeSecretKey = $stripeSecretKey;
    }

    /**
     * Start Stripe payment session with metadata to track user and order.
     *
     * @param array $orderData The order data including 'items' array
     * @param int $userId The ID of the customer making the order
     * @param float $shippingCost Shipping cost, default 0
     */
    public function startPayment(array $orderData, int $userId, float $shippingCost = 0): void
    {
        Stripe::setApiKey($this->stripeSecretKey);

        $lineItems = [];

        $cartItems = $orderData['items'] ?? [];

        foreach ($cartItems as $item) {
            $lineItems[] = [
                'price_data' => [
                    'currency' => 'usd',
                    'product_data' => [
                        'name' => $item['title'],
                    ],
                    'unit_amount' => intval($item['price'] * 100), // Stripe uses cents
                ],
                'quantity' => $item['quantity'],
            ];
        }

        if ($shippingCost > 0) {
            $lineItems[] = [
                'price_data' => [
                    'currency' => 'usd',
                    'product_data' => ['name' => 'Shipping'],
                    'unit_amount' => intval($shippingCost * 100),
                ],
                'quantity' => 1,
            ];
        }

        try {
            $session = Session::create([
                'payment_method_types' => ['card'],
                'line_items' => $lineItems,
                'mode' => 'payment',
                'cancel_url' => 'http://127.0.0.1:8000/payment/cancel',
                'success_url' => 'http://127.0.0.1:8000/order/confirm',
                'metadata' => [
                    'customer_id' => $userId,
                    'order_data' => json_encode($orderData),
                ],
            ]);
            $this->stripeRedirectUrl = $session->url;
        } catch (\Exception $e) {
            // Log or show the error
            dump($e->getMessage());
            die(); // stop and see the error
        }
    }

    public function getStripeRedirectUrl(): string
    {
        return $this->stripeRedirectUrl ?? '/';
    }
}
