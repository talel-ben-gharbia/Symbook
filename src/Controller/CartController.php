<?php

namespace App\Controller;

use App\Repository\BookRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CartController extends AbstractController
{
    private $requestStack;

    public function __construct(RequestStack $requestStack)
    {
        $this->requestStack = $requestStack;
    }

    #[Route('/cart', name: 'app_cart')]
    public function index(BookRepository $bookRepository): Response
    {
        $session = $this->requestStack->getSession();
        $cart = $session->get('cart', []);
        $cartItems = [];
        $total = 0;

        foreach ($cart as $id => $quantity) {
            $book = $bookRepository->find($id);
            if ($book) {
                $cartItems[] = [
                    'book' => $book,
                    'quantity' => $quantity,
                ];
                $total += $book->getPrice() * $quantity;
            }
        }

        return $this->render('cart/index.html.twig', [
            'items' => $cartItems,
            'total' => $total,
        ]);
    }

    #[Route('/cart/partial', name: 'cart_partial')]
public function cartPartial(BookRepository $bookRepository): Response
{
    $session = $this->requestStack->getSession();
    $cart = $session->get('cart', []);
    $cartItems = [];
    $total = 0;

    foreach ($cart as $id => $quantity) {
        $book = $bookRepository->find($id);
        if ($book) {
            $cartItems[] = [
                'book' => $book,
                'quantity' => $quantity,
            ];
            $total += $book->getPrice() * $quantity;
        }
    }

    return $this->render('cart/cart_content.html.twig', [
        'items' => $cartItems,
        'total' => $total,
    ]);
}

    #[Route('/cart/add/{id}', name: 'cart_add')]
    public function add(int $id, BookRepository $bookRepository): Response
    {
        $session = $this->requestStack->getSession();
        $book = $bookRepository->find($id);

        if (!$book) {
            $this->addFlash('error', 'Book not found.');
            return $this->redirectToRoute('app_book_public_index'); // Adjust this route as needed
        }

        $cart = $session->get('cart', []);
        $cart[$id] = ($cart[$id] ?? 0) + 1; // Increment quantity for this book ID
        $session->set('cart', $cart);

        // Temporary debug output (comment out or remove in production)
        // dump($session->get('cart'));
        return $this->redirectToRoute('app_cart');
    }

    #[Route('/cart/decrement/{id}', name: 'cart_decrement')]
    public function decrement(int $id): Response
    {
        $session = $this->requestStack->getSession();
        $cart = $session->get('cart', []);

        if (isset($cart[$id])) {
            $cart[$id]--;
            if ($cart[$id] <= 0) {
                unset($cart[$id]);
            }
            $session->set('cart', $cart);
        }

        return $this->redirectToRoute('app_cart');
    }

    #[Route('/cart/remove/{id}', name: 'cart_remove')]
    public function remove(int $id): Response
    {
        $session = $this->requestStack->getSession();
        $cart = $session->get('cart', []);

        if (isset($cart[$id])) {
            unset($cart[$id]);
            $session->set('cart', $cart);
        }

        return $this->redirectToRoute('app_cart');
    }

    #[Route('/cart/clear', name: 'cart_clear')]
    public function clear(): Response
    {
        $session = $this->requestStack->getSession();
        $session->remove('cart');
        return $this->redirectToRoute('app_cart');
    }

    #[Route('/test-session', name: 'test_session')]
    public function testSession(): Response
    {
        $session = $this->requestStack->getSession();
        $session->set('test', 'Session Works!');
        return new Response('Session test: ' . $session->get('test'));
    }
}