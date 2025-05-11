<?php

namespace App\Controller;

use App\Entity\Book;
use App\Entity\Order;
use App\Form\OrderType;
use App\Repository\OrderRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Bundle\SecurityBundle\Security;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
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

    #[Route('/order/add', name: 'add_order')]
    public function addOrder(SessionInterface $session, EntityManagerInterface $em, Security $security): Response
    {
        $cart = $session->get('cart', []);
        if (empty($cart)) {
            $this->addFlash('warning', 'Your cart is empty!');
            return $this->redirectToRoute('app_cart');
        }

        $orderItems = [];
        $total = 0;

        foreach ($cart as $bookId => $quantity) {
            $book = $em->getRepository(Book::class)->find($bookId);
            if (!$book) {
                continue; // skip if book doesn't exist
            }

            $orderItems[] = [
                'book_id' => $book->getId(),
                'title' => $book->getTitle(),
                'author' => $book->getAuthor(),
                'imageUrl' => $book->getImageUrl(),
                'price' => $book->getPrice(),
                'quantity' => $quantity,
                'subtotal' => $book->getPrice() * $quantity,
            ];

            $total += $book->getPrice() * $quantity;
        }


        $order = new Order();
        $order->setCustomer($security->getUser());
        $order->setOrderDate(new \DateTime());
        $order->setOrderItems($orderItems); 
        $order->setTotal($total);
        $order->setStatus('pending');

        $em->persist($order);
        $em->flush();

        $session->remove('cart');

        $this->addFlash('success', 'Order placed successfully!');
        return $this->redirectToRoute('app_book_public_index');
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
}
