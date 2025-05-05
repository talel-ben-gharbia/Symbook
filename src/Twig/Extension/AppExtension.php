<?php

namespace App\Twig\Extension;

use App\Entity\Category;
use App\Twig\Runtime\AppExtensionRuntime;
use Doctrine\ORM\EntityManagerInterface;
use Twig\Extension\AbstractExtension;
use Twig\TwigFilter;
use Twig\TwigFunction;

class AppExtension extends AbstractExtension
{
    private EntityManagerInterface $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    public function getFunctions(): array
    {
        return [
            new TwigFunction('get_categories', $this->getCategories(...)),
        ];
    }

    public function getCategories(): array
    {
        return $this->entityManager->getRepository(Category::class)->findAll();
    }
}