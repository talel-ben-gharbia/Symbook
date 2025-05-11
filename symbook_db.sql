-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 11 mai 2025 à 13:42
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `symbook_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `stock` int(11) NOT NULL,
  `foundation` date NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `book`
--

INSERT INTO `book` (`id`, `title`, `author`, `description`, `price`, `image_url`, `stock`, `foundation`, `category_id`) VALUES
(1, 'Pride and Prejudice', 'Jane Austen', 'A romantic novel that charts the emotional development of the protagonist Elizabeth Bennet, who learns the error of making hasty judgments and comes to appreciate the difference between the superficial and the essential.', 30.00, 'https://books.google.tn/books/content?id=s1gVAAAAYAAJ&pg=PP1&img=1&zoom=3&hl=en&sig=ACfU3U3_OhpyWi8T7D1caoRH-59Tvgn1jw&w=1280', 100, '1813-01-28', 1),
(2, 'The Hobbit', 'J.R.R. Tolkien', 'A fantasy novel and children\'s book that follows the quest of home-loving Bilbo Baggins to win a share of the treasure guarded by the dragon Smaug.', 30.00, 'https://m.media-amazon.com/images/I/712cDO7d73L._SY466_.jpg', 100, '1937-09-21', 2),
(3, 'The Adventures of Sherlock Holmes', 'Arthur Conan Doyle', 'A collection of twelve short stories featuring the famous detective Sherlock Holmes and his assistant Dr. Watson.', 30.00, 'https://m.media-amazon.com/images/I/61W8vD3LBRL._SY425_.jpg', 100, '1892-10-14', 3),
(4, 'To Kill a Mockingbird', 'Harper Lee', 'A novel about the serious issues of rape and racial inequality, told through the eyes of young Scout Finch in the American South during the 1930s.', 60.00, 'https://m.media-amazon.com/images/I/71FxgtFKcQL.jpg', 80, '1960-07-11', 1),
(5, 'Harry Potter and the Sorcerer\'s Stone', 'J.K. Rowling', 'The first book in the Harry Potter series, introducing young wizard Harry Potter as he discovers his magical heritage and begins his education at Hogwarts School of Witchcraft and Wizardry.', 45.00, 'https://m.media-amazon.com/images/I/71-++hbbERL.jpg', 100, '1997-06-26', 2),
(6, 'The Girl with the Dragon Tattoo', 'Stieg Larsson', 'A mystery thriller that follows journalist Mikael Blomkvist and hacker Lisbeth Salander as they investigate a decades-old disappearance in Sweden.', 40.00, 'https://m.media-amazon.com/images/I/61Qs-hoZ-TL._SY522_.jpg', 70, '2005-08-01', 3),
(7, 'Dune', 'Frank Herbert', 'A science fiction novel set in the distant future amidst a feudal interstellar society, following the story of young Paul Atreides as he navigates political intrigue and ecological challenges on the desert planet Arrakis.', 45.00, 'https://m.media-amazon.com/images/I/41JVFor1FpL._SY445_SX342_.jpg', 50, '1965-08-01', 4),
(8, 'The Notebook', 'Nicholas Sparks', 'A romantic novel that tells the story of Noah Calhoun and Allie Nelson, two lovers from different social backgrounds whose love is tested by time and circumstance.', 35.00, 'https://m.media-amazon.com/images/I/71uPRalnJnL._AC_SY445_.jpg', 75, '1996-10-01', 5),
(9, 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 'A non-fiction book that explores the history of humanity from the Stone Age to the present, examining how biology and history have defined us and enhanced our understanding of what it means to be human.', 48.00, 'https://m.media-amazon.com/images/I/51Pe5D36rML._SY445_SX342_.jpg', 60, '2011-01-01', 6),
(10, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Set in the summer of 1922, the novel follows the life of a young and mysterious millionaire, his extravagant lifestyle in Long Island, and his obsessive love for a beautiful former debutante. As the story unfolds, the millionaire\'s dark secrets and the corrupt reality of the American dream during the Jazz Age are revealed. The narrative is a critique of the hedonistic excess and moral decay of the era, ultimately leading to tragic consequences.', 30.00, 'https://assets.lulu.com/cover_thumbs/8/d/8dzdnj-front-shortedge-384.jpg', 10, '1925-05-06', 2);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'Classic Literature', 'Timeless works of fiction from various eras, exploring universal themes.'),
(2, 'Fantasy', 'Imaginative tales featuring magic, mythical creatures, and epic quests.'),
(3, 'Mystery', 'Suspenseful stories centered on crime, detection, and puzzles.'),
(4, 'Science Fiction', 'Speculative fiction exploring futuristic technology and extraterrestrial life.'),
(5, 'Romance', 'Stories focusing on love, relationships, and emotional journeys.'),
(6, 'Non-Fiction', 'Factual accounts of real events, people, and topics.');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20250507180146', '2025-05-07 20:03:06', 54),
('DoctrineMigrations\\Version20250507180944', '2025-05-07 20:10:48', 16),
('DoctrineMigrations\\Version20250508195622', '2025-05-08 21:56:33', 43),
('DoctrineMigrations\\Version20250509143226', '2025-05-09 16:32:43', 112),
('DoctrineMigrations\\Version20250510184037', '2025-05-10 20:40:59', 129),
('DoctrineMigrations\\Version20250510185602', '2025-05-10 20:56:09', 52);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messenger_messages`
--

INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(30, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:6:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}s:51:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\\";a:1:{i:0;O:51:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\\":4:{s:67:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\0exceptionClass\\\";s:62:\\\"Symfony\\\\Component\\\\Mailer\\\\Exception\\\\UnexpectedResponseException\\\";s:66:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\0exceptionCode\\\";i:550;s:69:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\0exceptionMessage\\\";s:169:\\\"Expected response code \\\"354\\\" but got code \\\"550\\\", with message \\\"550 5.7.0 Too many emails per second. Please upgrade your plan https://mailtrap.io/billing/plans/testing\\\".\\\";s:69:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\0flattenException\\\";O:57:\\\"Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\\":12:{s:66:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0message\\\";s:169:\\\"Expected response code \\\"354\\\" but got code \\\"550\\\", with message \\\"550 5.7.0 Too many emails per second. Please upgrade your plan https://mailtrap.io/billing/plans/testing\\\".\\\";s:63:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0code\\\";i:550;s:67:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0previous\\\";N;s:64:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0trace\\\";a:31:{i:0;a:8:{s:9:\\\"namespace\\\";s:0:\\\"\\\";s:11:\\\"short_class\\\";s:0:\\\"\\\";s:5:\\\"class\\\";s:0:\\\"\\\";s:4:\\\"type\\\";s:0:\\\"\\\";s:8:\\\"function\\\";s:0:\\\"\\\";s:4:\\\"file\\\";s:94:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\SmtpTransport.php\\\";s:4:\\\"line\\\";i:342;s:4:\\\"args\\\";a:0:{}}i:1;a:8:{s:9:\\\"namespace\\\";s:39:\\\"Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\";s:11:\\\"short_class\\\";s:13:\\\"SmtpTransport\\\";s:5:\\\"class\\\";s:53:\\\"Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\SmtpTransport\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:18:\\\"assertResponseCode\\\";s:4:\\\"file\\\";s:94:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\SmtpTransport.php\\\";s:4:\\\"line\\\";i:198;s:4:\\\"args\\\";a:2:{i:0;a:2:{i:0;s:6:\\\"string\\\";i:1;s:106:\\\"550 5.7.0 Too many emails per second. Please upgrade your plan https://mailtrap.io/billing/plans/testing\r\n\\\";}i:1;a:2:{i:0;s:5:\\\"array\\\";i:1;a:1:{i:0;a:2:{i:0;s:7:\\\"integer\\\";i:1;i:354;}}}}}i:2;a:8:{s:9:\\\"namespace\\\";s:39:\\\"Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\";s:11:\\\"short_class\\\";s:13:\\\"SmtpTransport\\\";s:5:\\\"class\\\";s:53:\\\"Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\SmtpTransport\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:14:\\\"executeCommand\\\";s:4:\\\"file\\\";s:95:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\EsmtpTransport.php\\\";s:4:\\\"line\\\";i:134;s:4:\\\"args\\\";a:2:{i:0;a:2:{i:0;s:6:\\\"string\\\";i:1;s:6:\\\"DATA\r\n\\\";}i:1;a:2:{i:0;s:5:\\\"array\\\";i:1;a:1:{i:0;a:2:{i:0;s:7:\\\"integer\\\";i:1;i:354;}}}}}i:3;a:8:{s:9:\\\"namespace\\\";s:39:\\\"Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\";s:11:\\\"short_class\\\";s:14:\\\"EsmtpTransport\\\";s:5:\\\"class\\\";s:54:\\\"Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\EsmtpTransport\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:14:\\\"executeCommand\\\";s:4:\\\"file\\\";s:94:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\SmtpTransport.php\\\";s:4:\\\"line\\\";i:220;s:4:\\\"args\\\";a:2:{i:0;a:2:{i:0;s:6:\\\"string\\\";i:1;s:6:\\\"DATA\r\n\\\";}i:1;a:2:{i:0;s:5:\\\"array\\\";i:1;a:1:{i:0;a:2:{i:0;s:7:\\\"integer\\\";i:1;i:354;}}}}}i:4;a:8:{s:9:\\\"namespace\\\";s:39:\\\"Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\";s:11:\\\"short_class\\\";s:13:\\\"SmtpTransport\\\";s:5:\\\"class\\\";s:53:\\\"Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\SmtpTransport\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:6:\\\"doSend\\\";s:4:\\\"file\\\";s:93:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\AbstractTransport.php\\\";s:4:\\\"line\\\";i:90;s:4:\\\"args\\\";a:1:{i:0;a:2:{i:0;s:6:\\\"object\\\";i:1;s:36:\\\"Symfony\\\\Component\\\\Mailer\\\\SentMessage\\\";}}}i:5;a:8:{s:9:\\\"namespace\\\";s:34:\\\"Symfony\\\\Component\\\\Mailer\\\\Transport\\\";s:11:\\\"short_class\\\";s:17:\\\"AbstractTransport\\\";s:5:\\\"class\\\";s:52:\\\"Symfony\\\\Component\\\\Mailer\\\\Transport\\\\AbstractTransport\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:4:\\\"send\\\";s:4:\\\"file\\\";s:94:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\SmtpTransport.php\\\";s:4:\\\"line\\\";i:138;s:4:\\\"args\\\";a:2:{i:0;a:2:{i:0;s:6:\\\"object\\\";i:1;s:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\";}i:1;a:2:{i:0;s:6:\\\"object\\\";i:1;s:40:\\\"Symfony\\\\Component\\\\Mailer\\\\DelayedEnvelope\\\";}}}i:6;a:8:{s:9:\\\"namespace\\\";s:39:\\\"Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\";s:11:\\\"short_class\\\";s:13:\\\"SmtpTransport\\\";s:5:\\\"class\\\";s:53:\\\"Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\SmtpTransport\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:4:\\\"send\\\";s:4:\\\"file\\\";s:86:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Transports.php\\\";s:4:\\\"line\\\";i:51;s:4:\\\"args\\\";a:2:{i:0;a:2:{i:0;s:6:\\\"object\\\";i:1;s:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\";}i:1;a:2:{i:0;s:4:\\\"null\\\";i:1;N;}}}i:7;a:8:{s:9:\\\"namespace\\\";s:34:\\\"Symfony\\\\Component\\\\Mailer\\\\Transport\\\";s:11:\\\"short_class\\\";s:10:\\\"Transports\\\";s:5:\\\"class\\\";s:45:\\\"Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Transports\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:4:\\\"send\\\";s:4:\\\"file\\\";s:90:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\mailer\\\\Messenger\\\\MessageHandler.php\\\";s:4:\\\"line\\\";i:29;s:4:\\\"args\\\";a:2:{i:0;a:2:{i:0;s:6:\\\"object\\\";i:1;s:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\";}i:1;a:2:{i:0;s:4:\\\"null\\\";i:1;N;}}}i:8;a:8:{s:9:\\\"namespace\\\";s:34:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\";s:11:\\\"short_class\\\";s:14:\\\"MessageHandler\\\";s:5:\\\"class\\\";s:49:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\MessageHandler\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:8:\\\"__invoke\\\";s:4:\\\"file\\\";s:103:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\HandleMessageMiddleware.php\\\";s:4:\\\"line\\\";i:152;s:4:\\\"args\\\";a:1:{i:0;a:2:{i:0;s:6:\\\"object\\\";i:1;s:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\";}}}i:9;a:8:{s:9:\\\"namespace\\\";s:38:\\\"Symfony\\\\Component\\\\Messenger\\\\Middleware\\\";s:11:\\\"short_class\\\";s:23:\\\"HandleMessageMiddleware\\\";s:5:\\\"class\\\";s:62:\\\"Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\HandleMessageMiddleware\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:11:\\\"callHandler\\\";s:4:\\\"file\\\";s:103:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\HandleMessageMiddleware.php\\\";s:4:\\\"line\\\";i:91;s:4:\\\"args\\\";a:4:{i:0;a:2:{i:0;s:6:\\\"object\\\";i:1;s:7:\\\"Closure\\\";}i:1;a:2:{i:0;s:6:\\\"object\\\";i:1;s:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\";}i:2;a:2:{i:0;s:4:\\\"null\\\";i:1;N;}i:3;a:2:{i:0;s:4:\\\"null\\\";i:1;N;}}}i:10;a:8:{s:9:\\\"namespace\\\";s:38:\\\"Symfony\\\\Component\\\\Messenger\\\\Middleware\\\";s:11:\\\"short_class\\\";s:23:\\\"HandleMessageMiddleware\\\";s:5:\\\"class\\\";s:62:\\\"Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\HandleMessageMiddleware\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:6:\\\"handle\\\";s:4:\\\"file\\\";s:101:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\SendMessageMiddleware.php\\\";s:4:\\\"line\\\";i:71;s:4:\\\"args\\\";a:2:{i:0;a:2:{i:0;s:6:\\\"object\\\";i:1;s:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\";}i:1;a:2:{i:0;s:6:\\\"object\\\";i:1;s:53:\\\"Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack\\\";}}}i:11;a:8:{s:9:\\\"namespace\\\";s:38:\\\"Symfony\\\\Component\\\\Messenger\\\\Middleware\\\";s:11:\\\"short_class\\\";s:21:\\\"SendMessageMiddleware\\\";s:5:\\\"class\\\";s:60:\\\"Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\SendMessageMiddleware\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:6:\\\"handle\\\";s:4:\\\"file\\\";s:113:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\FailedMessageProcessingMiddleware.php\\\";s:4:\\\"line\\\";i:34;s:4:\\\"args\\\";a:2:{i:0;a:2:{i:0;s:6:\\\"object\\\";i:1;s:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\";}i:1;a:2:{i:0;s:6:\\\"object\\\";i:1;s:53:\\\"Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack\\\";}}}i:12;a:8:{s:9:\\\"namespace\\\";s:38:\\\"Symfony\\\\Component\\\\Messenger\\\\Middleware\\\";s:11:\\\"short_class\\\";s:33:\\\"FailedMessageProcessingMiddleware\\\";s:5:\\\"class\\\";s:72:\\\"Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\FailedMessageProcessingMiddleware\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:6:\\\"handle\\\";s:4:\\\"file\\\";s:113:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\DispatchAfterCurrentBusMiddleware.php\\\";s:4:\\\"line\\\";i:68;s:4:\\\"args\\\";a:2:{i:0;a:2:{i:0;s:6:\\\"object\\\";i:1;s:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\";}i:1;a:2:{i:0;s:6:\\\"object\\\";i:1;s:53:\\\"Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack\\\";}}}i:13;a:8:{s:9:\\\"namespace\\\";s:38:\\\"Symfony\\\\Component\\\\Messenger\\\\Middleware\\\";s:11:\\\"short_class\\\";s:33:\\\"DispatchAfterCurrentBusMiddleware\\\";s:5:\\\"class\\\";s:72:\\\"Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\DispatchAfterCurrentBusMiddleware\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:6:\\\"handle\\\";s:4:\\\"file\\\";s:114:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\RejectRedeliveredMessageMiddleware.php\\\";s:4:\\\"line\\\";i:41;s:4:\\\"args\\\";a:2:{i:0;a:2:{i:0;s:6:\\\"object\\\";i:1;s:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\";}i:1;a:2:{i:0;s:6:\\\"object\\\";i:1;s:53:\\\"Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack\\\";}}}i:14;a:8:{s:9:\\\"namespace\\\";s:38:\\\"Symfony\\\\Component\\\\Messenger\\\\Middleware\\\";s:11:\\\"short_class\\\";s:34:\\\"RejectRedeliveredMessageMiddleware\\\";s:5:\\\"class\\\";s:73:\\\"Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\RejectRedeliveredMessageMiddleware\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:6:\\\"handle\\\";s:4:\\\"file\\\";s:105:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\AddBusNameStampMiddleware.php\\\";s:4:\\\"line\\\";i:35;s:4:\\\"args\\\";a:2:{i:0;a:2:{i:0;s:6:\\\"object\\\";i:1;s:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\";}i:1;a:2:{i:0;s:6:\\\"object\\\";i:1;s:53:\\\"Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack\\\";}}}i:15;a:8:{s:9:\\\"namespace\\\";s:38:\\\"Symfony\\\\Component\\\\Messenger\\\\Middleware\\\";s:11:\\\"short_class\\\";s:25:\\\"AddBusNameStampMiddleware\\\";s:5:\\\"class\\\";s:64:\\\"Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\AddBusNameStampMiddleware\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:6:\\\"handle\\\";s:4:\\\"file\\\";s:99:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\TraceableMiddleware.php\\\";s:4:\\\"line\\\";i:36;s:4:\\\"args\\\";a:2:{i:0;a:2:{i:0;s:6:\\\"object\\\";i:1;s:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\";}i:1;a:2:{i:0;s:6:\\\"object\\\";i:1;s:53:\\\"Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack\\\";}}}i:16;a:8:{s:9:\\\"namespace\\\";s:38:\\\"Symfony\\\\Component\\\\Messenger\\\\Middleware\\\";s:11:\\\"short_class\\\";s:19:\\\"TraceableMiddleware\\\";s:5:\\\"class\\\";s:58:\\\"Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableMiddleware\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:6:\\\"handle\\\";s:4:\\\"file\\\";s:79:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\MessageBus.php\\\";s:4:\\\"line\\\";i:69;s:4:\\\"args\\\";a:2:{i:0;a:2:{i:0;s:6:\\\"object\\\";i:1;s:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\";}i:1;a:2:{i:0;s:6:\\\"object\\\";i:1;s:53:\\\"Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack\\\";}}}i:17;a:8:{s:9:\\\"namespace\\\";s:27:\\\"Symfony\\\\Component\\\\Messenger\\\";s:11:\\\"short_class\\\";s:10:\\\"MessageBus\\\";s:5:\\\"class\\\";s:38:\\\"Symfony\\\\Component\\\\Messenger\\\\MessageBus\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:8:\\\"dispatch\\\";s:4:\\\"file\\\";s:88:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\TraceableMessageBus.php\\\";s:4:\\\"line\\\";i:37;s:4:\\\"args\\\";a:2:{i:0;a:2:{i:0;s:6:\\\"object\\\";i:1;s:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\";}i:1;a:2:{i:0;s:5:\\\"array\\\";i:1;a:0:{}}}}i:18;a:8:{s:9:\\\"namespace\\\";s:27:\\\"Symfony\\\\Component\\\\Messenger\\\";s:11:\\\"short_class\\\";s:19:\\\"TraceableMessageBus\\\";s:5:\\\"class\\\";s:47:\\\"Symfony\\\\Component\\\\Messenger\\\\TraceableMessageBus\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:8:\\\"dispatch\\\";s:4:\\\"file\\\";s:87:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\RoutableMessageBus.php\\\";s:4:\\\"line\\\";i:51;s:4:\\\"args\\\";a:2:{i:0;a:2:{i:0;s:6:\\\"object\\\";i:1;s:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\";}i:1;a:2:{i:0;s:5:\\\"array\\\";i:1;a:0:{}}}}i:19;a:8:{s:9:\\\"namespace\\\";s:27:\\\"Symfony\\\\Component\\\\Messenger\\\";s:11:\\\"short_class\\\";s:18:\\\"RoutableMessageBus\\\";s:5:\\\"class\\\";s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\RoutableMessageBus\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:8:\\\"dispatch\\\";s:4:\\\"file\\\";s:75:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\Worker.php\\\";s:4:\\\"line\\\";i:172;s:4:\\\"args\\\";a:1:{i:0;a:2:{i:0;s:6:\\\"object\\\";i:1;s:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\";}}}i:20;a:8:{s:9:\\\"namespace\\\";s:27:\\\"Symfony\\\\Component\\\\Messenger\\\";s:11:\\\"short_class\\\";s:6:\\\"Worker\\\";s:5:\\\"class\\\";s:34:\\\"Symfony\\\\Component\\\\Messenger\\\\Worker\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:13:\\\"handleMessage\\\";s:4:\\\"file\\\";s:75:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\Worker.php\\\";s:4:\\\"line\\\";i:119;s:4:\\\"args\\\";a:2:{i:0;a:2:{i:0;s:6:\\\"object\\\";i:1;s:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\";}i:1;a:2:{i:0;s:6:\\\"string\\\";i:1;s:5:\\\"async\\\";}}}i:21;a:8:{s:9:\\\"namespace\\\";s:27:\\\"Symfony\\\\Component\\\\Messenger\\\";s:11:\\\"short_class\\\";s:6:\\\"Worker\\\";s:5:\\\"class\\\";s:34:\\\"Symfony\\\\Component\\\\Messenger\\\\Worker\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:3:\\\"run\\\";s:4:\\\"file\\\";s:99:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\Command\\\\ConsumeMessagesCommand.php\\\";s:4:\\\"line\\\";i:260;s:4:\\\"args\\\";a:1:{i:0;a:2:{i:0;s:5:\\\"array\\\";i:1;a:1:{s:5:\\\"sleep\\\";a:2:{i:0;s:7:\\\"integer\\\";i:1;i:1000000;}}}}}i:22;a:8:{s:9:\\\"namespace\\\";s:35:\\\"Symfony\\\\Component\\\\Messenger\\\\Command\\\";s:11:\\\"short_class\\\";s:22:\\\"ConsumeMessagesCommand\\\";s:5:\\\"class\\\";s:58:\\\"Symfony\\\\Component\\\\Messenger\\\\Command\\\\ConsumeMessagesCommand\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:7:\\\"execute\\\";s:4:\\\"file\\\";s:82:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\console\\\\Command\\\\Command.php\\\";s:4:\\\"line\\\";i:279;s:4:\\\"args\\\";a:2:{i:0;a:2:{i:0;s:6:\\\"object\\\";i:1;s:41:\\\"Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput\\\";}i:1;a:2:{i:0;s:6:\\\"object\\\";i:1;s:46:\\\"Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput\\\";}}}i:23;a:8:{s:9:\\\"namespace\\\";s:33:\\\"Symfony\\\\Component\\\\Console\\\\Command\\\";s:11:\\\"short_class\\\";s:7:\\\"Command\\\";s:5:\\\"class\\\";s:41:\\\"Symfony\\\\Component\\\\Console\\\\Command\\\\Command\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:3:\\\"run\\\";s:4:\\\"file\\\";s:78:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\console\\\\Application.php\\\";s:4:\\\"line\\\";i:1094;s:4:\\\"args\\\";a:2:{i:0;a:2:{i:0;s:6:\\\"object\\\";i:1;s:41:\\\"Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput\\\";}i:1;a:2:{i:0;s:6:\\\"object\\\";i:1;s:46:\\\"Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput\\\";}}}i:24;a:8:{s:9:\\\"namespace\\\";s:25:\\\"Symfony\\\\Component\\\\Console\\\";s:11:\\\"short_class\\\";s:11:\\\"Application\\\";s:5:\\\"class\\\";s:37:\\\"Symfony\\\\Component\\\\Console\\\\Application\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:12:\\\"doRunCommand\\\";s:4:\\\"file\\\";s:95:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\framework-bundle\\\\Console\\\\Application.php\\\";s:4:\\\"line\\\";i:123;s:4:\\\"args\\\";a:3:{i:0;a:2:{i:0;s:6:\\\"object\\\";i:1;s:58:\\\"Symfony\\\\Component\\\\Messenger\\\\Command\\\\ConsumeMessagesCommand\\\";}i:1;a:2:{i:0;s:6:\\\"object\\\";i:1;s:41:\\\"Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput\\\";}i:2;a:2:{i:0;s:6:\\\"object\\\";i:1;s:46:\\\"Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput\\\";}}}i:25;a:8:{s:9:\\\"namespace\\\";s:38:\\\"Symfony\\\\Bundle\\\\FrameworkBundle\\\\Console\\\";s:11:\\\"short_class\\\";s:11:\\\"Application\\\";s:5:\\\"class\\\";s:50:\\\"Symfony\\\\Bundle\\\\FrameworkBundle\\\\Console\\\\Application\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:12:\\\"doRunCommand\\\";s:4:\\\"file\\\";s:78:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\console\\\\Application.php\\\";s:4:\\\"line\\\";i:342;s:4:\\\"args\\\";a:3:{i:0;a:2:{i:0;s:6:\\\"object\\\";i:1;s:58:\\\"Symfony\\\\Component\\\\Messenger\\\\Command\\\\ConsumeMessagesCommand\\\";}i:1;a:2:{i:0;s:6:\\\"object\\\";i:1;s:41:\\\"Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput\\\";}i:2;a:2:{i:0;s:6:\\\"object\\\";i:1;s:46:\\\"Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput\\\";}}}i:26;a:8:{s:9:\\\"namespace\\\";s:25:\\\"Symfony\\\\Component\\\\Console\\\";s:11:\\\"short_class\\\";s:11:\\\"Application\\\";s:5:\\\"class\\\";s:37:\\\"Symfony\\\\Component\\\\Console\\\\Application\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:5:\\\"doRun\\\";s:4:\\\"file\\\";s:95:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\framework-bundle\\\\Console\\\\Application.php\\\";s:4:\\\"line\\\";i:77;s:4:\\\"args\\\";a:2:{i:0;a:2:{i:0;s:6:\\\"object\\\";i:1;s:41:\\\"Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput\\\";}i:1;a:2:{i:0;s:6:\\\"object\\\";i:1;s:46:\\\"Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput\\\";}}}i:27;a:8:{s:9:\\\"namespace\\\";s:38:\\\"Symfony\\\\Bundle\\\\FrameworkBundle\\\\Console\\\";s:11:\\\"short_class\\\";s:11:\\\"Application\\\";s:5:\\\"class\\\";s:50:\\\"Symfony\\\\Bundle\\\\FrameworkBundle\\\\Console\\\\Application\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:5:\\\"doRun\\\";s:4:\\\"file\\\";s:78:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\console\\\\Application.php\\\";s:4:\\\"line\\\";i:193;s:4:\\\"args\\\";a:2:{i:0;a:2:{i:0;s:6:\\\"object\\\";i:1;s:41:\\\"Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput\\\";}i:1;a:2:{i:0;s:6:\\\"object\\\";i:1;s:46:\\\"Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput\\\";}}}i:28;a:8:{s:9:\\\"namespace\\\";s:25:\\\"Symfony\\\\Component\\\\Console\\\";s:11:\\\"short_class\\\";s:11:\\\"Application\\\";s:5:\\\"class\\\";s:37:\\\"Symfony\\\\Component\\\\Console\\\\Application\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:3:\\\"run\\\";s:4:\\\"file\\\";s:106:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\runtime\\\\Runner\\\\Symfony\\\\ConsoleApplicationRunner.php\\\";s:4:\\\"line\\\";i:49;s:4:\\\"args\\\";a:2:{i:0;a:2:{i:0;s:6:\\\"object\\\";i:1;s:41:\\\"Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput\\\";}i:1;a:2:{i:0;s:6:\\\"object\\\";i:1;s:46:\\\"Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput\\\";}}}i:29;a:8:{s:9:\\\"namespace\\\";s:40:\\\"Symfony\\\\Component\\\\Runtime\\\\Runner\\\\Symfony\\\";s:11:\\\"short_class\\\";s:24:\\\"ConsoleApplicationRunner\\\";s:5:\\\"class\\\";s:65:\\\"Symfony\\\\Component\\\\Runtime\\\\Runner\\\\Symfony\\\\ConsoleApplicationRunner\\\";s:4:\\\"type\\\";s:2:\\\"->\\\";s:8:\\\"function\\\";s:3:\\\"run\\\";s:4:\\\"file\\\";s:67:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\autoload_runtime.php\\\";s:4:\\\"line\\\";i:29;s:4:\\\"args\\\";a:0:{}}i:30;a:8:{s:9:\\\"namespace\\\";s:0:\\\"\\\";s:11:\\\"short_class\\\";s:0:\\\"\\\";s:5:\\\"class\\\";s:0:\\\"\\\";s:4:\\\"type\\\";s:0:\\\"\\\";s:8:\\\"function\\\";s:12:\\\"require_once\\\";s:4:\\\"file\\\";s:51:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\bin\\\\console\\\";s:4:\\\"line\\\";i:15;s:4:\\\"args\\\";a:1:{i:0;a:2:{i:0;s:6:\\\"string\\\";i:1;s:67:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\autoload_runtime.php\\\";}}}}s:72:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0traceAsString\\\";s:7230:\\\"#0 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\SmtpTransport.php(198): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\SmtpTransport->assertResponseCode(\\\'550 5.7.0 Too m...\\\', Array)\n#1 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\EsmtpTransport.php(134): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\SmtpTransport->executeCommand(\\\'DATA\\\\r\\\\n\\\', Array)\n#2 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\SmtpTransport.php(220): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\EsmtpTransport->executeCommand(\\\'DATA\\\\r\\\\n\\\', Array)\n#3 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\AbstractTransport.php(90): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\SmtpTransport->doSend(Object(Symfony\\\\Component\\\\Mailer\\\\SentMessage))\n#4 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\SmtpTransport.php(138): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\AbstractTransport->send(Object(Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail), Object(Symfony\\\\Component\\\\Mailer\\\\DelayedEnvelope))\n#5 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Transports.php(51): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\SmtpTransport->send(Object(Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail), NULL)\n#6 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\mailer\\\\Messenger\\\\MessageHandler.php(29): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Transports->send(Object(Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail), NULL)\n#7 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\HandleMessageMiddleware.php(152): Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\MessageHandler->__invoke(Object(Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage))\n#8 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\HandleMessageMiddleware.php(91): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\HandleMessageMiddleware->callHandler(Object(Closure), Object(Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage), NULL, NULL)\n#9 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\SendMessageMiddleware.php(71): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\HandleMessageMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#10 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\FailedMessageProcessingMiddleware.php(34): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\SendMessageMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#11 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\DispatchAfterCurrentBusMiddleware.php(68): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\FailedMessageProcessingMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#12 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\RejectRedeliveredMessageMiddleware.php(41): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\DispatchAfterCurrentBusMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#13 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\AddBusNameStampMiddleware.php(35): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\RejectRedeliveredMessageMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#14 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\TraceableMiddleware.php(36): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\AddBusNameStampMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#15 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\MessageBus.php(69): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#16 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\TraceableMessageBus.php(37): Symfony\\\\Component\\\\Messenger\\\\MessageBus->dispatch(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Array)\n#17 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\RoutableMessageBus.php(51): Symfony\\\\Component\\\\Messenger\\\\TraceableMessageBus->dispatch(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Array)\n#18 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\Worker.php(172): Symfony\\\\Component\\\\Messenger\\\\RoutableMessageBus->dispatch(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope))\n#19 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\Worker.php(119): Symfony\\\\Component\\\\Messenger\\\\Worker->handleMessage(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), \\\'async\\\')\n#20 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\messenger\\\\Command\\\\ConsumeMessagesCommand.php(260): Symfony\\\\Component\\\\Messenger\\\\Worker->run(Array)\n#21 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\console\\\\Command\\\\Command.php(279): Symfony\\\\Component\\\\Messenger\\\\Command\\\\ConsumeMessagesCommand->execute(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#22 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\console\\\\Application.php(1094): Symfony\\\\Component\\\\Console\\\\Command\\\\Command->run(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#23 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\framework-bundle\\\\Console\\\\Application.php(123): Symfony\\\\Component\\\\Console\\\\Application->doRunCommand(Object(Symfony\\\\Component\\\\Messenger\\\\Command\\\\ConsumeMessagesCommand), Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#24 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\console\\\\Application.php(342): Symfony\\\\Bundle\\\\FrameworkBundle\\\\Console\\\\Application->doRunCommand(Object(Symfony\\\\Component\\\\Messenger\\\\Command\\\\ConsumeMessagesCommand), Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#25 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\framework-bundle\\\\Console\\\\Application.php(77): Symfony\\\\Component\\\\Console\\\\Application->doRun(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#26 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\console\\\\Application.php(193): Symfony\\\\Bundle\\\\FrameworkBundle\\\\Console\\\\Application->doRun(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#27 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\runtime\\\\Runner\\\\Symfony\\\\ConsoleApplicationRunner.php(49): Symfony\\\\Component\\\\Console\\\\Application->run(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#28 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\autoload_runtime.php(29): Symfony\\\\Component\\\\Runtime\\\\Runner\\\\Symfony\\\\ConsoleApplicationRunner->run()\n#29 C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\bin\\\\console(15): require_once(\\\'C:\\\\\\\\Users\\\\\\\\talel\\\\\\\\...\\\')\n#30 {main}\\\";s:64:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0class\\\";s:62:\\\"Symfony\\\\Component\\\\Mailer\\\\Exception\\\\UnexpectedResponseException\\\";s:69:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0statusCode\\\";i:500;s:69:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0statusText\\\";s:21:\\\"Internal Server Error\\\";s:66:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0headers\\\";a:0:{}s:63:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0file\\\";s:94:\\\"C:\\\\Users\\\\talel\\\\OneDrive\\\\Desktop\\\\Symbook\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\SmtpTransport.php\\\";s:63:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0line\\\";i:342;s:67:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0asString\\\";N;}}}s:44:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\\";a:4:{i:0;O:44:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\\":1:{s:51:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\0delay\\\";i:1053;}i:1;O:44:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\\":1:{s:51:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\0delay\\\";i:2018;}i:2;O:44:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\\":1:{s:51:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\0delay\\\";i:3849;}i:3;O:44:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\\":1:{s:51:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\0delay\\\";i:0;}}s:49:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\\";a:4:{i:0;O:49:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\\":2:{s:64:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0redeliveredAt\\\";O:17:\\\"DateTimeImmutable\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-05-09 01:36:06.127898\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}s:61:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0retryCount\\\";i:1;}i:1;O:49:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\\":2:{s:64:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0redeliveredAt\\\";O:17:\\\"DateTimeImmutable\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-05-09 01:36:11.577995\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}s:61:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0retryCount\\\";i:2;}i:2;O:49:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\\":2:{s:64:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0redeliveredAt\\\";O:17:\\\"DateTimeImmutable\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-05-09 01:36:17.756485\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}s:61:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0retryCount\\\";i:3;}i:3;O:49:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\\":2:{s:64:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0redeliveredAt\\\";O:17:\\\"DateTimeImmutable\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-05-09 01:36:20.879167\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}s:61:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0retryCount\\\";i:0;}}s:57:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\TransportMessageIdStamp\\\";a:1:{i:0;O:57:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\TransportMessageIdStamp\\\":1:{s:61:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\TransportMessageIdStamp\\0id\\\";i:27;}}s:61:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\SentToFailureTransportStamp\\\";a:1:{i:0;O:61:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\SentToFailureTransportStamp\\\":1:{s:83:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\SentToFailureTransportStamp\\0originalReceiverName\\\";s:5:\\\"async\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:171:\\\"http://127.0.0.1:8000/verify/email?expires=1746743842&signature=XINnEJBDKg%2BfaT4gGvkgcsGFrctk6RKs7nbE%2BizPcLo%3D&token=GYROA5%2BzB9SglWHOHj8tOj3dINbI1%2BLZsaL9x3CHc6s%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:22:\\\"support@yourdomain.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:15:\\\"CasaFit Support\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:18:\\\"exemple4@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'failed', '2025-05-08 23:36:20', '2025-05-08 23:36:20', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `order_items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`order_items`)),
  `total` double NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `customer_id`, `order_date`, `order_items`, `total`, `status`) VALUES
(1, 17, '2025-05-10', '[{\"book_id\":2,\"title\":\"The Hobbit\",\"author\":\"J.R.R. Tolkien\",\"imageUrl\":\"https:\\/\\/m.media-amazon.com\\/images\\/I\\/712cDO7d73L._SY466_.jpg\",\"price\":\"30.00\",\"quantity\":1,\"subtotal\":30.0}]', 30, 'pending'),
(2, 17, '2025-05-10', '[{\"book_id\":3,\"title\":\"The Adventures of Sherlock Holmes\",\"author\":\"Arthur Conan Doyle\",\"imageUrl\":\"https:\\/\\/m.media-amazon.com\\/images\\/I\\/61W8vD3LBRL._SY425_.jpg\",\"price\":\"30.00\",\"quantity\":1,\"subtotal\":30.0},{\"book_id\":4,\"title\":\"To Kill a Mockingbird\",\"author\":\"Harper Lee\",\"imageUrl\":\"https:\\/\\/m.media-amazon.com\\/images\\/I\\/71FxgtFKcQL.jpg\",\"price\":\"60.00\",\"quantity\":1,\"subtotal\":60.0}]', 90, 'pending');

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) NOT NULL,
  `hashed_token` varchar(100) NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reset_password_request`
--

INSERT INTO `reset_password_request` (`id`, `user_id`, `selector`, `hashed_token`, `requested_at`, `expires_at`) VALUES
(5, 15, '7X5efrghZyDMJS9kY3va', 'Yv3R6SB+9DQ83TPzTr9CTlk6h/lr2ROh3OcrvFBQF0U=', '2025-05-09 18:31:43', '2025-05-09 19:31:43');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `is_verified`, `username`) VALUES
(1, 'talelbengharbia213@gmail.com', '[\"ROLE_ADMIN\",\"ROLE_USER\"]', '$2y$13$zbaiBgr5SiUF3E9t8TX8wuX0ZzSWIOKND1iNhlmt7sgRG4LQVGAbO', 0, 'talel'),
(2, 'exemple1@gmail.com', '[\"ROLE_USER\"]', '$2y$13$6aaUSci9FwOKTnlMc4.z8Ok/mdTlftOYRMuMCGBW.0qzYI8XEffVG', 0, 'exemple1'),
(13, 'exemple5@gmail.com', '[\"ROLE_USER\"]', '$2y$13$NEuyJlzSTbnOmuzKFMtKyuBCr6T4gHew2CwUWzh9qHIIx2D5aUUy2', 1, 'exemple5'),
(14, 'exemple6@gmail.com', '[\"ROLE_USER\"]', '$2y$13$dhmXPPFDQTG4fXwuSQ/aTOAqoOZPh5XcX9JBnQ9YoFFJHzx6DFiQ6', 1, 'exemple6'),
(15, 'exemple4@gmail.com', '[\"ROLE_USER\"]', '$2y$13$5rGNsT1m/svz/BFjgmWp7eXUrQW7MOpeNiPfniFz7nqlghsX/Nh7m', 1, 'exemple4'),
(16, 'exemple2@gmail.com', '[\"ROLE_USER\"]', '$2y$13$l4RTaiOm5du53HXcxdm7Cu3O/A6TafbGo42Wih90pOUU/3fis.Jvq', 1, 'exemple2'),
(17, 'dhibyoussef@gmail.com', '[\"ROLE_USER\"]', '$2y$13$IRDbG4ykhtofBbRp.xvcE.2xQYCNbHX8BWZYknCfYi6YTBssaO9cK', 1, 'dhib');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_CBE5A33112469DE2` (`category_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F52993989395C3F3` (`customer_id`);

--
-- Index pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748AA76ED395` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `FK_CBE5A33112469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F52993989395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
