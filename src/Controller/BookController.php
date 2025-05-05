<?php

namespace App\Controller;

use App\Entity\Book;
use App\Form\BookType;
use App\Repository\BookRepository;
use App\Repository\CategoryRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;


final class BookController extends AbstractController
{
    #[Route('/book', name: 'app_book_public_index', methods: ['GET'])]
    public function publicIndex(BookRepository $bookRepository, CategoryRepository $categoryRepository): Response
    {
        $books = $bookRepository->findAll();
        $categories = $categoryRepository->findAll();
        return $this->render('book/public_index.html.twig', [
            'books' => $books,
            'categories' => $categories,
        ]);
    }

    #[Route('/book/{id}', name: 'app_book_public_show', methods: ['GET'])]
    public function publicShow(Book $book, BookRepository $bookRepository): Response
    {
        $books = $bookRepository->findAll(); // For "You May Also Like" section
        return $this->render('book/public_show.html.twig', [
            'book' => $book,
            'books' => $books,
        ]);
    }

    #[Route('/book/search', name: 'app_book_search', methods: ['GET'])]
    public function search(Request $request, BookRepository $bookRepository): JsonResponse
    {
        $query = $request->query->get('q', '');
        $type = $request->query->get('type', 'all');
        $category = $request->query->get('category', 'all');
        $sort = $request->query->get('sort', 'newest');
        $page = $request->query->get('page', 1);
        $limit = $request->query->get('limit', 12);

        $qb = $bookRepository->createQueryBuilder('b')
            ->leftJoin('b.category', 'c');

        if ($query) {
            switch ($type) {
                case 'title':
                    $qb->andWhere('b.title LIKE :query')
                        ->setParameter('query', '%' . $query . '%');
                    break;
                case 'author':
                    $qb->andWhere('b.author LIKE :query')
                        ->setParameter('query', '%' . $query . '%');
                    break;
                case 'category':
                    $qb->andWhere('c.name LIKE :query')
                        ->setParameter('query', '%' . $query . '%');
                    break;
                default:
                    $qb->andWhere('b.title LIKE :query OR b.author LIKE :query OR c.name LIKE :query')
                        ->setParameter('query', '%' . $query . '%');
            }
        }

        if ($category !== 'all') {
            $qb->andWhere('c.name = :category')
                ->setParameter('category', $category);
        }

        switch ($sort) {
            case 'price-low':
                $qb->orderBy('b.price', 'ASC');
                break;
            case 'price-high':
                $qb->orderBy('b.price', 'DESC');
                break;
            case 'title-asc':
                $qb->orderBy('b.title', 'ASC');
                break;
            case 'title-desc':
                $qb->orderBy('b.title', 'DESC');
                break;
            default:
                $qb->orderBy('b.id', 'DESC');
        }

        $totalQuery = clone $qb;
        $total = count($totalQuery->getQuery()->getResult());

        $qb->setFirstResult(($page - 1) * $limit)
            ->setMaxResults($limit);

        $books = $qb->getQuery()->getResult();

        $formattedBooks = [];
        foreach ($books as $book) {
            $formattedBooks[] = [
                'id' => $book->getId(),
                'title' => $book->getTitle(),
                'author' => $book->getAuthor(),
                'price' => $book->getPrice(),
                'description' => $book->getDescription(),
                'imageUrl' => $book->getImageUrl(),
                'category' => $book->getCategory() ? $book->getCategory()->getName() : 'Uncategorized',
                'viewUrl' => $this->generateUrl('app_book_show', ['id' => $book->getId()]),
            ];
        }

        return new JsonResponse([
            'books' => $formattedBooks,
            'total' => $total,
            'pages' => ceil($total / $limit),
            'page' => $page,
        ]);
    }


    #[Route('admin/book' ,name: 'app_book_index', methods: ['GET'])]
    public function index(BookRepository $bookRepository): Response
    {
        return $this->render('book/index.html.twig', [
            'books' => $bookRepository->findAll(),
        ]);
    }

    #[Route('admin/book/new', name: 'app_book_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $book = new Book();
        $form = $this->createForm(BookType::class, $book);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($book);
            $entityManager->flush();

            return $this->redirectToRoute('app_book_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('book/new.html.twig', [
            'book' => $book,
            'form' => $form,
        ]);
    }

    #[Route('admin/book/{id}', name: 'app_book_show', methods: ['GET'])]
    public function show(Book $book): Response
    {
        return $this->render('book/show.html.twig', [
            'book' => $book,
        ]);
    }

    #[Route('admin/book/{id}/edit', name: 'app_book_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Book $book, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(BookType::class, $book);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_book_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('book/edit.html.twig', [
            'book' => $book,
            'form' => $form,
        ]);
    }

    #[Route('admin/book/{id}', name: 'app_book_delete', methods: ['POST'])]
    public function delete(Request $request, Book $book, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$book->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($book);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_book_index', [], Response::HTTP_SEE_OTHER);
    }
}
