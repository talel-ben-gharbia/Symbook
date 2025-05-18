<?php

namespace App\Controller;

use App\Entity\Book;
use App\Entity\Order;
use App\Entity\User;
use App\Form\OrderType;
use App\Repository\BookRepository;
use App\Repository\OrderRepository;
use App\Service\StripePayment;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bridge\Doctrine\Attribute\MapEntity;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Bundle\SecurityBundle\Security;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Address;
use Symfony\Component\Routing\Attribute\Route;


final class OrderController extends AbstractController
{
    #[Route('admin/order', name: 'app_order_index', methods: ['GET'])]
    public function index(OrderRepository $orderRepository): Response
    {
        return $this->render('order/index.html.twig', [
            'orders' => $orderRepository->findAll(),
        ]);
    }

    #[Route('/order/online', name: 'add_order_online')]
    public function addOrderOnline(
        Request $request,
        SessionInterface $session,
        Security $security,
        StripePayment $payment,
        EntityManagerInterface $entityManager
    ): Response {
        $cart = $session->get('cart', []);

        if (empty($cart)) {
            $this->addFlash('warning', 'Your cart is empty!');
            return $this->redirectToRoute('app_cart');
        }

        $user = $security->getUser();
        $orderItems = [];
        $total = 0;

        foreach ($cart as $bookId => $quantity) {
            $book = $entityManager->getRepository(Book::class)->find($bookId);
            if (!$book) {
                continue;
            }

            $subtotal = $book->getPrice() * $quantity;
            $total += $subtotal;

            $orderItems[] = [
                'book_id'   => $book->getId(),
                'title'     => $book->getTitle(),
                'author'    => $book->getAuthor(),
                'imageUrl'  => $book->getImageUrl(),
                'price'     => $book->getPrice(),
                'quantity'  => $quantity,
                'subtotal'  => $subtotal,
            ];
        }

        $orderData = [
            'items' => $orderItems,
            'payment_method' => 'online',
            // add other order info here if needed
        ];

        // Start Stripe payment and pass full order data & user id
        $payment->startPayment($orderData, $user->getId(), 7); // 7 = shipping cost

        // Save pending order data in session to be confirmed after payment success
        $session->set('pending_order', [
            'customer_id' => $user->getId(),
            'order_data' => $orderData,
            'total' => $total + 7,
            'status' => 'pending',
        ]);

        // Redirect to Stripe checkout page
        return $this->redirect($payment->getStripeRedirectUrl());
    }

    #[Route('/order/confirm', name: 'order_confirm')]
    public function confirmOrder(
        Request $request,
        SessionInterface $session,
        EntityManagerInterface $entityManager,
        Security $security,
        MailerInterface $mailer
    ): Response {
        $pendingOrder = $session->get('pending_order');
        if (!$pendingOrder) {
            $this->addFlash('error', 'No pending order found.');
            return $this->redirectToRoute('app_cart');
        }

        // Load user entity again (optional, or use security)
        $user = $security->getUser();

        // Create order only after payment success
        $order = new Order();
        $order->setCustomer($user);
        $order->setOrderDate(new \DateTimeImmutable());
        $order->setOrderItems($pendingOrder['order_data']);
        $order->setTotal($pendingOrder['total']);
        $order->setStatus('processing');

        $entityManager->persist($order);
        $entityManager->flush();

        // Clear cart and pending order from session
        $session->remove('cart');
        $session->remove('pending_order');

        // Send confirmation email
        $email = (new TemplatedEmail())
            ->from(new Address('support@bookverse.com', 'BookVerse Support'))
            ->to(new Address($user->getEmail(), $user->getUserName() ?? 'Customer'))
            ->subject('Order Confirmation - BookVerse')
            ->htmlTemplate('mail/orderConfirm.html.twig')
            ->context([
                'order' => $order,
                'user' => $user,
            ]);

        $mailer->send($email);

        $this->addFlash('success', 'Your order has been confirmed. Thank you!');
        return $this->render('order/success.html.twig', [
            'order' => $order,
            'user' => $user,
        ]);
    }



    #[Route('/order/cash', name: 'add_order_cash')]
    public function addOrderCash(
        Request $request,
        SessionInterface $session,
        EntityManagerInterface $entityManager,
        Security $security,
        MailerInterface $mailer
    ): Response {
        $cart = $session->get('cart', []);

        if (empty($cart)) {
            $this->addFlash('warning', 'Your cart is empty!');
            return $this->redirectToRoute('app_cart');
        }

        // Get form data
        $address = $request->request->get('address');
        $phone = $request->request->get('phone');

        // Validate form data
        if (!$address || !$phone) {
            $this->addFlash('error', 'Please provide your delivery address and phone number.');
            return $this->redirectToRoute('app_cart');
        }

        $user = $security->getUser();
        $orderItems = [];
        $total = 0;

        foreach ($cart as $bookId => $quantity) {
            $book = $entityManager->getRepository(Book::class)->find($bookId);
            if (!$book) {
                continue;
            }

            $subtotal = $book->getPrice() * $quantity;
            $total += $subtotal;

            $orderItems[] = [
                'book_id'   => $book->getId(),
                'title'     => $book->getTitle(),
                'author'    => $book->getAuthor(),
                'imageUrl'  => $book->getImageUrl(),
                'price'     => $book->getPrice(),
                'quantity'  => $quantity,
                'subtotal'  => $subtotal,
            ];
        }

        // Create order data with delivery information
        $orderData = [
            'items' => $orderItems,
            'delivery_info' => [
                'address' => $address,
                'phone' => $phone
            ],
            'payment_method' => 'cash'
        ];

        $order = new Order();
        $order->setCustomer($user);
        $order->setOrderDate(new \DateTimeImmutable());
        $order->setOrderItems($orderData);
        $order->setTotal($total + 7);
        $order->setStatus('pending');

        $entityManager->persist($order);
        $entityManager->flush();

        $session->remove('cart');

        $email = (new TemplatedEmail())
            ->from(new Address('support@bookverse.com', 'BookVerse Support'))
            ->to(new Address($user->getEmail(), $user->getUserName() ?? 'Customer'))
            ->subject('Order Confirmation - BookVerse')
            ->htmlTemplate('mail/orderConfirmCash.html.twig')
            ->context([
                'order' => $order,
                'user' => $user,
                'orderData' => $orderData // Pass the complete order data
            ]);

        $mailer->send($email);

        return $this->redirectToRoute('order_cash_confirmation', ['id' => $order->getId()]);
    }

    #[Route('/order/cash/confirmation/{id}', name: 'order_cash_confirmation')]
    public function cashConfirmation(Order $order): Response
    {
        // Ensure the current user is the owner of this order
        if ($this->getUser() !== $order->getCustomer()) {
            throw $this->createAccessDeniedException('You are not authorized to view this order.');
        }

        // Get the order items data which includes delivery info
        $orderData = $order->getOrderItems();

        return $this->render('order/cash_confirmation.html.twig', [
            'order' => $order,
            'orderData' => $orderData
        ]);
    }




    #[Route('admin/order/{id}', name: 'app_order_show', methods: ['GET'])]
    public function show(Order $order): Response
    {
        return $this->render('order/show.html.twig', [
            'order' => $order,
        ]);
    }

    #[Route('order/{id}/edit', name: 'app_order_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Order $order, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(OrderType::class, $order);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_order_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('order/edit.html.twig', [
            'order' => $order,
            'form' => $form,
        ]);
    }

    #[Route('/user/{userId}/order/{orderId}', name: 'app_order_public_show', methods: ['GET'])]
    public function publicShow(
        #[MapEntity(id: 'userId')] User $user,
        #[MapEntity(id: 'orderId')] Order $order
    ): Response {
        return $this->render('order/show_public.html.twig', [
            'order' => $order,
            'user' => $user,
        ]);
    }
}
