-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 26, 2024 at 06:15 AM
-- Server version: 5.7.26-log
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tonque_blanche`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` json NOT NULL,
  `description` json DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0: inactive, 1: active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '{\"en\": \"Country\", \"es\": \"País\", \"fr\": \"Pays\"}', '{\"en\": \"Select your country to receive dishes from your region.\", \"es\": \"Seleccione su país para recibir platos de su región.\", \"fr\": \"Sélectionnez votre pays pour recevoir des plats de votre région.\"}', 1, NULL, '2024-10-12 02:40:27', '2024-10-12 02:40:27'),
(2, '{\"en\": \"Ingredients\", \"es\": \"Ingredientes\", \"fr\": \"Ingrédients\"}', '{\"en\": \"Choose the ingredients you prefer in your dishes.\", \"es\": \"Elija los ingredientes que prefiere en sus platos.\", \"fr\": \"Choisissez les ingrédients que vous préférez dans vos plats.\"}', 1, NULL, '2024-10-12 02:40:27', '2024-10-12 02:40:27'),
(3, '{\"en\": \"Drinks\", \"es\": \"Bebidas\", \"fr\": \"Boissons\"}', '{\"en\": \"Select your preferred drinks.\", \"es\": \"Seleccione sus bebidas preferidas.\", \"fr\": \"Sélectionnez vos boissons préférées.\"}', 1, NULL, '2024-10-12 02:40:27', '2024-10-12 02:40:27'),
(4, '{\"en\": \"Dessert\", \"es\": \"Postre\", \"fr\": \"Dessert\"}', '{\"en\": \"Choose your favorite type of dessert.\", \"es\": \"Elija su tipo de postre favorito.\", \"fr\": \"Choisissez votre type de dessert préféré.\"}', 1, NULL, '2024-10-12 02:40:27', '2024-10-12 02:40:27'),
(5, '{\"en\": \"Suggestions\", \"es\": \"Sugerencias\", \"fr\": \"Suggestions\"}', '{\"en\": \"Receive dish suggestions based on your preferences.\", \"es\": \"Reciba sugerencias de platos basadas en sus preferencias.\", \"fr\": \"Recevez des suggestions de plats basées sur vos préférences.\"}', 1, NULL, '2024-10-12 02:40:27', '2024-10-12 02:40:27'),
(6, '{\"en\": \"nihil\", \"es\": \"vel\", \"fr\": \"ut\"}', '{\"en\": \"Molestiae amet molestias aut et quis nihil.\", \"es\": \"Ab aut eum illo consequuntur officiis porro quia.\", \"fr\": \"Est molestiae pariatur et similique sed.\"}', 1, NULL, '2024-10-24 07:42:17', '2024-10-24 07:42:17'),
(7, '{\"en\": \"porro\", \"es\": \"molestiae\", \"fr\": \"est\"}', '{\"en\": \"Officia doloribus ut rem quaerat officia.\", \"es\": \"Provident consequatur et ea ut rerum praesentium.\", \"fr\": \"Voluptates iure aut tempore soluta eum molestias molestiae.\"}', 1, NULL, '2024-10-24 07:42:37', '2024-10-24 07:42:37'),
(8, '{\"en\": \"sed\", \"es\": \"omnis\", \"fr\": \"dolore\"}', '{\"en\": \"Animi ut nemo porro explicabo suscipit nesciunt et.\", \"es\": \"Qui dolorem id enim alias.\", \"fr\": \"Eaque aut voluptas sint aut earum facilis.\"}', 1, NULL, '2024-10-24 07:42:53', '2024-10-24 07:42:53'),
(9, '{\"en\": \"dignissimos\", \"es\": \"eveniet\", \"fr\": \"quos\"}', '{\"en\": \"Reiciendis repellendus aliquid dolores voluptate voluptatem earum id.\", \"es\": \"Incidunt sit dolorem est quos et modi magnam.\", \"fr\": \"Provident qui nobis tempora.\"}', 1, NULL, '2024-10-24 07:42:58', '2024-10-24 07:42:58'),
(10, '{\"en\": \"sunt\", \"es\": \"animi\", \"fr\": \"iste\"}', '{\"en\": \"Et omnis labore consequatur nulla atque aliquid accusamus adipisci.\", \"es\": \"Consectetur quis quis alias dolor inventore enim placeat magni.\", \"fr\": \"Velit nihil ullam quod quaerat molestiae autem ut.\"}', 1, NULL, '2024-10-24 07:43:11', '2024-10-24 07:43:11'),
(11, '{\"en\": \"consequatur\", \"es\": \"officiis\", \"fr\": \"minima\"}', '{\"en\": \"Quae rerum praesentium et.\", \"es\": \"Labore deleniti hic amet incidunt earum voluptatem.\", \"fr\": \"Omnis omnis consequatur beatae.\"}', 1, NULL, '2024-10-24 07:43:42', '2024-10-24 07:43:42'),
(12, '{\"en\": \"omnis\", \"es\": \"sequi\", \"fr\": \"reiciendis\"}', '{\"en\": \"Nam ea dolorem consequatur placeat.\", \"es\": \"Necessitatibus maiores omnis aut vel est.\", \"fr\": \"Ex officia magnam quia et odit a illo debitis.\"}', 1, NULL, '2024-10-24 07:43:49', '2024-10-24 07:43:49'),
(13, '{\"en\": \"illum\", \"es\": \"corrupti\", \"fr\": \"quia\"}', '{\"en\": \"Eius reiciendis repudiandae vel unde.\", \"es\": \"Molestiae accusamus excepturi cupiditate exercitationem et repudiandae quasi.\", \"fr\": \"Iste perspiciatis omnis in sint ipsa nihil eos.\"}', 1, NULL, '2024-10-24 07:44:00', '2024-10-24 07:44:00'),
(14, '{\"en\": \"quia\", \"es\": \"dolorum\", \"fr\": \"at\"}', '{\"en\": \"Animi et expedita in quia illum adipisci culpa.\", \"es\": \"Qui voluptatem officia consequatur.\", \"fr\": \"Reiciendis odit alias consectetur totam.\"}', 1, NULL, '2024-10-24 07:44:03', '2024-10-24 07:44:03'),
(15, '{\"en\": \"dolorem\", \"es\": \"maxime\", \"fr\": \"quidem\"}', '{\"en\": \"Odit est accusamus enim.\", \"es\": \"Explicabo laboriosam quis eius.\", \"fr\": \"Nihil voluptatibus eligendi aut voluptates earum qui dicta.\"}', 1, NULL, '2024-10-24 07:44:08', '2024-10-24 07:44:08'),
(16, '{\"en\": \"dignissimos\", \"es\": \"iure\", \"fr\": \"voluptate\"}', '{\"en\": \"Sapiente minima dolores nihil et ab debitis.\", \"es\": \"Itaque maiores molestiae hic non odit totam.\", \"fr\": \"Qui placeat culpa et ratione nobis aspernatur quibusdam.\"}', 1, NULL, '2024-10-24 08:04:39', '2024-10-24 08:04:39'),
(17, '{\"en\": \"pariatur\", \"es\": \"voluptas\", \"fr\": \"quo\"}', '{\"en\": \"Tempora repellendus voluptatibus molestias.\", \"es\": \"Qui alias facere delectus nostrum.\", \"fr\": \"Ut natus qui voluptas autem molestias.\"}', 1, NULL, '2024-10-24 08:04:42', '2024-10-24 08:04:42'),
(18, '{\"en\": \"ea\", \"es\": \"doloribus\", \"fr\": \"est\"}', '{\"en\": \"Voluptatibus fuga sunt nesciunt repellendus deserunt.\", \"es\": \"Dolore fugiat cumque cumque eius.\", \"fr\": \"Dolorem repellendus est vel labore assumenda amet.\"}', 1, NULL, '2024-10-24 08:04:55', '2024-10-24 08:04:55'),
(19, '{\"en\": \"iure\", \"es\": \"ut\", \"fr\": \"iure\"}', '{\"en\": \"Aut voluptas deleniti ad dolores quia ipsam ut.\", \"es\": \"Est amet hic nemo fugit eum labore.\", \"fr\": \"Repellat sunt sunt fugit tempora eum.\"}', 1, NULL, '2024-10-24 08:04:57', '2024-10-24 08:04:57'),
(20, '{\"en\": \"eum\", \"es\": \"nihil\", \"fr\": \"tempora\"}', '{\"en\": \"Rem delectus dolores repudiandae sapiente.\", \"es\": \"Accusantium voluptatem hic commodi quos mollitia.\", \"fr\": \"Accusantium quae voluptatum vel cum occaecati quo.\"}', 1, NULL, '2024-10-24 08:05:00', '2024-10-24 08:05:00'),
(21, '{\"en\": \"et\", \"es\": \"corporis\", \"fr\": \"harum\"}', '{\"en\": \"Ex est quasi officia itaque nostrum harum dolorem.\", \"es\": \"Ut molestiae dolores quia eum.\", \"fr\": \"Consequatur corporis quos animi.\"}', 1, NULL, '2024-10-24 08:05:06', '2024-10-24 08:05:06'),
(22, '{\"en\": \"distinctio\", \"es\": \"expedita\", \"fr\": \"culpa\"}', '{\"en\": \"Et hic odio eaque soluta alias.\", \"es\": \"Quia qui nihil beatae sint.\", \"fr\": \"Dignissimos odit officia facere explicabo rerum rem provident quaerat.\"}', 1, NULL, '2024-10-24 08:05:19', '2024-10-24 08:05:19'),
(23, '{\"en\": \"nulla\", \"es\": \"veritatis\", \"fr\": \"beatae\"}', '{\"en\": \"Ea commodi cum impedit accusantium excepturi.\", \"es\": \"Id eaque velit tempora quae ex rerum cum nemo.\", \"fr\": \"Quasi aut provident voluptate.\"}', 1, NULL, '2024-10-24 08:05:26', '2024-10-24 08:05:26'),
(24, '{\"en\": \"cumque\", \"es\": \"deserunt\", \"fr\": \"possimus\"}', '{\"en\": \"Sit non quo nihil.\", \"es\": \"Provident et quaerat nesciunt velit asperiores.\", \"fr\": \"Odio voluptates odio distinctio sunt quis reiciendis.\"}', 1, NULL, '2024-10-24 08:05:32', '2024-10-24 08:05:32'),
(25, '{\"en\": \"aut\", \"es\": \"voluptatem\", \"fr\": \"aliquam\"}', '{\"en\": \"Sed et nisi voluptatum aliquid fugiat illo veniam ipsam.\", \"es\": \"Et officiis et consequatur rerum.\", \"fr\": \"Quidem occaecati perferendis odio sed.\"}', 1, NULL, '2024-10-24 08:05:47', '2024-10-24 08:05:47'),
(26, '{\"en\": \"numquam\", \"es\": \"possimus\", \"fr\": \"quo\"}', '{\"en\": \"Nihil perferendis perspiciatis nihil illo quos.\", \"es\": \"Recusandae qui iusto at consequatur qui atque.\", \"fr\": \"Dolore adipisci animi esse et molestiae.\"}', 1, NULL, '2024-10-24 08:33:50', '2024-10-24 08:33:50'),
(27, '{\"en\": \"expedita\", \"es\": \"officiis\", \"fr\": \"quia\"}', '{\"en\": \"Voluptatem voluptate sapiente repellat maxime reiciendis similique ullam.\", \"es\": \"Eveniet rerum ipsum et.\", \"fr\": \"Ex quo ea cumque sunt numquam vero ullam.\"}', 1, NULL, '2024-10-24 08:34:06', '2024-10-24 08:34:06'),
(28, '{\"en\": \"quo\", \"es\": \"eaque\", \"fr\": \"aut\"}', '{\"en\": \"Voluptatem voluptate omnis eaque qui.\", \"es\": \"Accusantium non et quos qui cumque et et.\", \"fr\": \"Blanditiis fugiat sit omnis porro tenetur.\"}', 1, NULL, '2024-10-24 08:34:11', '2024-10-24 08:34:11'),
(29, '{\"en\": \"qui\", \"es\": \"quaerat\", \"fr\": \"voluptas\"}', '{\"en\": \"Nihil nisi ut illum sint impedit ut.\", \"es\": \"Illo omnis iusto accusantium saepe nesciunt.\", \"fr\": \"Qui placeat quidem voluptas.\"}', 1, NULL, '2024-10-24 08:34:20', '2024-10-24 08:34:20'),
(30, '{\"en\": \"voluptates\", \"es\": \"non\", \"fr\": \"deleniti\"}', '{\"en\": \"Nulla omnis aut distinctio accusamus quam tenetur expedita.\", \"es\": \"Repellat quia eveniet quia.\", \"fr\": \"Quo qui eos temporibus eaque debitis.\"}', 1, NULL, '2024-10-24 08:34:26', '2024-10-24 08:34:26'),
(31, '{\"en\": \"nesciunt\", \"es\": \"optio\", \"fr\": \"sit\"}', '{\"en\": \"Fugit omnis perspiciatis consequatur mollitia possimus.\", \"es\": \"Porro similique labore amet soluta.\", \"fr\": \"Officia tenetur facere corporis placeat.\"}', 1, NULL, '2024-10-24 08:34:29', '2024-10-24 08:34:29'),
(32, '{\"en\": \"deleniti\", \"es\": \"rerum\", \"fr\": \"itaque\"}', '{\"en\": \"Exercitationem dicta fuga animi voluptates voluptatem adipisci.\", \"es\": \"Vero cupiditate vel impedit quia dicta nisi qui atque.\", \"fr\": \"Molestias suscipit quo voluptates temporibus.\"}', 1, NULL, '2024-10-24 08:34:34', '2024-10-24 08:34:34'),
(33, '{\"en\": \"quo\", \"es\": \"nemo\", \"fr\": \"odio\"}', '{\"en\": \"Eligendi voluptate ipsum possimus aut reiciendis dolor a dolore.\", \"es\": \"Sed sint esse earum rerum ut et temporibus.\", \"fr\": \"Corporis repellat numquam iure.\"}', 1, NULL, '2024-10-24 08:34:36', '2024-10-24 08:34:36'),
(34, '{\"en\": \"et\", \"es\": \"et\", \"fr\": \"vero\"}', '{\"en\": \"Ex quis et porro libero iusto magnam occaecati laborum.\", \"es\": \"Quo sapiente sed porro ullam numquam.\", \"fr\": \"Nihil modi ut eius atque eligendi consequatur.\"}', 1, NULL, '2024-10-24 08:34:45', '2024-10-24 08:34:45'),
(35, '{\"en\": \"est\", \"es\": \"quo\", \"fr\": \"dicta\"}', '{\"en\": \"Esse ut officiis corrupti dolore.\", \"es\": \"Eius doloribus asperiores corporis sed mollitia repellat.\", \"fr\": \"Totam et accusantium autem temporibus aut.\"}', 1, NULL, '2024-10-24 08:34:48', '2024-10-24 08:34:48');

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

DROP TABLE IF EXISTS `dishes`;
CREATE TABLE IF NOT EXISTS `dishes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` json NOT NULL,
  `description` json DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `is_offer` tinyint(1) NOT NULL DEFAULT '0',
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dish_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`id`, `name`, `description`, `price`, `is_offer`, `restaurant_id`, `category_id`, `dish_type_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\": \"Bacon Dog\", \"es\": \"Cheeseburger\", \"fr\": \"Cheeseburger\"}', '{\"en\": \"Nobis eum qui ipsam sapiente qui eos ea.\", \"es\": \"Aperiam id qui fuga vel.\", \"fr\": \"Nihil earum magnam animi nostrum.\"}', '20.60', 0, 23, 26, 22, '2024-10-24 08:34:48', '2024-10-24 08:34:48', NULL),
(2, '{\"en\": \"Pasta\", \"es\": \"Bacon Dog\", \"fr\": \"Little Bacon Burger\"}', '{\"en\": \"Odio laborum nam et a.\", \"es\": \"Doloribus libero occaecati nulla in saepe est.\", \"fr\": \"Voluptatem velit sit nostrum aliquid.\"}', '45.83', 0, 24, 27, 23, '2024-10-24 08:34:48', '2024-10-24 08:34:48', NULL),
(3, '{\"en\": \"Cheese Dog\", \"es\": \"Veggie Sandwich\", \"fr\": \"Cheese Veggie Sandwich\"}', '{\"en\": \"Sapiente aut voluptate et fugit.\", \"es\": \"Minus ad alias soluta distinctio eum modi ad.\", \"fr\": \"Omnis eos suscipit possimus quo.\"}', '12.00', 0, 25, 28, 24, '2024-10-24 08:34:48', '2024-10-24 08:34:48', NULL),
(4, '{\"en\": \"Pasta\", \"es\": \"Little Bacon Cheeseburger\", \"fr\": \"Cheese Pizza\"}', '{\"en\": \"Aliquam unde illo saepe.\", \"es\": \"Qui consequatur quia nostrum similique natus soluta.\", \"fr\": \"Ea omnis ut hic consequatur.\"}', '47.28', 1, 26, 29, 25, '2024-10-24 08:34:48', '2024-10-24 08:34:48', NULL),
(5, '{\"en\": \"Veggie Sandwich\", \"es\": \"Bacon Cheeseburger\", \"fr\": \"Little Bacon Cheeseburger\"}', '{\"en\": \"Delectus odio quas a autem quis quis optio.\", \"es\": \"Occaecati ex voluptatum non.\", \"fr\": \"A fuga vitae velit assumenda quia et qui ea.\"}', '32.86', 0, 27, 30, 26, '2024-10-24 08:34:48', '2024-10-24 08:34:48', NULL),
(6, '{\"en\": \"Cheese Dog\", \"es\": \"Cheese Dog\", \"fr\": \"Little Bacon Burger\"}', '{\"en\": \"Ea ad qui repellat qui eius velit qui.\", \"es\": \"Nemo cupiditate voluptatem omnis veniam qui voluptas consequatur qui.\", \"fr\": \"Eaque consectetur velit voluptas distinctio doloremque sed doloremque voluptas.\"}', '37.35', 1, 28, 31, 27, '2024-10-24 08:34:48', '2024-10-24 08:34:48', NULL),
(7, '{\"en\": \"Pasta\", \"es\": \"Cheese Veggie Sandwich\", \"fr\": \"Little Bacon Burger\"}', '{\"en\": \"Distinctio optio nihil dolore aliquid velit dignissimos quae.\", \"es\": \"Porro possimus est aut sunt.\", \"fr\": \"Eum nesciunt magni ipsum consequatur non.\"}', '37.39', 1, 29, 32, 28, '2024-10-24 08:34:48', '2024-10-24 08:34:48', NULL),
(8, '{\"en\": \"Cheese Dog\", \"es\": \"Bacon Cheeseburger\", \"fr\": \"Hamburger\"}', '{\"en\": \"Temporibus nam sed voluptas molestiae rerum fugit.\", \"es\": \"Commodi corporis ex sed aperiam.\", \"fr\": \"Consectetur velit ut eius voluptatem nemo id.\"}', '27.89', 0, 30, 33, 29, '2024-10-24 08:34:48', '2024-10-24 08:34:48', NULL),
(9, '{\"en\": \"Little Bacon Burger\", \"es\": \"Cheese Veggie Sandwich\", \"fr\": \"Pasta\"}', '{\"en\": \"Voluptates qui repellendus dolorem consequatur.\", \"es\": \"Nihil aut aspernatur dicta consequatur sint labore.\", \"fr\": \"Consectetur a cum at vel.\"}', '32.14', 1, 31, 34, 30, '2024-10-24 08:34:48', '2024-10-24 08:34:48', NULL),
(10, '{\"en\": \"Cheeseburger\", \"es\": \"Grilled Cheese\", \"fr\": \"Cheese Dog\"}', '{\"en\": \"Voluptatum at voluptas dolor distinctio.\", \"es\": \"Omnis aut nemo iusto id alias est consequuntur.\", \"fr\": \"Sit inventore quia quia excepturi vitae.\"}', '42.20', 0, 32, 35, 31, '2024-10-24 08:34:48', '2024-10-24 08:34:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dish_tag`
--

DROP TABLE IF EXISTS `dish_tag`;
CREATE TABLE IF NOT EXISTS `dish_tag` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dish_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dish_tag_dish_id_foreign` (`dish_id`),
  KEY `dish_tag_tag_id_foreign` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dish_types`
--

DROP TABLE IF EXISTS `dish_types`;
CREATE TABLE IF NOT EXISTS `dish_types` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` json NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dish_types`
--

INSERT INTO `dish_types` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '{\"en\": \"Arab\", \"es\": \"Árabe\", \"fr\": \"Arabe\"}', NULL, '2024-10-12 02:45:39', '2024-10-12 02:45:39'),
(2, '{\"en\": \"Thai\", \"es\": \"Tailandés\", \"fr\": \"Thaï\"}', NULL, '2024-10-12 02:45:39', '2024-10-12 02:45:39'),
(3, '{\"en\": \"Mexican\", \"es\": \"Mexicano\", \"fr\": \"Mexicain\"}', NULL, '2024-10-12 02:45:39', '2024-10-12 02:45:39'),
(4, '{\"en\": \"Peruvian\", \"es\": \"Peruano\", \"fr\": \"Péruvien\"}', NULL, '2024-10-12 02:45:39', '2024-10-12 02:45:39'),
(5, '{\"en\": \"Turkish\", \"es\": \"Turco\", \"fr\": \"Turc\"}', NULL, '2024-10-12 02:45:39', '2024-10-12 02:45:39'),
(6, '{\"en\": \"Mediterranean\", \"es\": \"Mediterráneo\", \"fr\": \"Méditerranéen\"}', NULL, '2024-10-12 02:45:39', '2024-10-12 02:45:39'),
(7, '{\"en\": \"Poke\", \"es\": \"Poke\", \"fr\": \"Poke\"}', NULL, '2024-10-12 02:45:39', '2024-10-12 02:45:39'),
(8, '{\"en\": \"Indian\", \"es\": \"Indio\", \"fr\": \"Indien\"}', NULL, '2024-10-12 02:45:39', '2024-10-12 02:45:39'),
(9, '{\"en\": \"Italian\", \"es\": \"Italiano\", \"fr\": \"Italien\"}', NULL, '2024-10-12 02:45:39', '2024-10-12 02:45:39'),
(10, '{\"en\": \"Japanese\", \"es\": \"Japonés\", \"fr\": \"Japonais\"}', NULL, '2024-10-12 02:45:39', '2024-10-12 02:45:39'),
(11, '{\"en\": \"Asian\", \"es\": \"Asiático\", \"fr\": \"Asiatique\"}', NULL, '2024-10-12 02:45:39', '2024-10-12 02:45:39'),
(12, '{\"en\": \"aut\", \"es\": \"sed\", \"fr\": \"in\"}', NULL, '2024-10-24 08:04:39', '2024-10-24 08:04:39'),
(13, '{\"en\": \"pariatur\", \"es\": \"beatae\", \"fr\": \"dicta\"}', NULL, '2024-10-24 08:04:42', '2024-10-24 08:04:42'),
(14, '{\"en\": \"omnis\", \"es\": \"at\", \"fr\": \"debitis\"}', NULL, '2024-10-24 08:04:55', '2024-10-24 08:04:55'),
(15, '{\"en\": \"et\", \"es\": \"aliquam\", \"fr\": \"quo\"}', NULL, '2024-10-24 08:04:57', '2024-10-24 08:04:57'),
(16, '{\"en\": \"optio\", \"es\": \"magni\", \"fr\": \"rerum\"}', NULL, '2024-10-24 08:05:00', '2024-10-24 08:05:00'),
(17, '{\"en\": \"voluptatem\", \"es\": \"perferendis\", \"fr\": \"ut\"}', NULL, '2024-10-24 08:05:06', '2024-10-24 08:05:06'),
(18, '{\"en\": \"qui\", \"es\": \"nisi\", \"fr\": \"suscipit\"}', NULL, '2024-10-24 08:05:19', '2024-10-24 08:05:19'),
(19, '{\"en\": \"qui\", \"es\": \"corporis\", \"fr\": \"culpa\"}', NULL, '2024-10-24 08:05:26', '2024-10-24 08:05:26'),
(20, '{\"en\": \"sit\", \"es\": \"autem\", \"fr\": \"facilis\"}', NULL, '2024-10-24 08:05:32', '2024-10-24 08:05:32'),
(21, '{\"en\": \"optio\", \"es\": \"perspiciatis\", \"fr\": \"ullam\"}', NULL, '2024-10-24 08:05:47', '2024-10-24 08:05:47'),
(22, '{\"en\": \"iste\", \"es\": \"est\", \"fr\": \"similique\"}', NULL, '2024-10-24 08:33:50', '2024-10-24 08:33:50'),
(23, '{\"en\": \"excepturi\", \"es\": \"veritatis\", \"fr\": \"dolores\"}', NULL, '2024-10-24 08:34:06', '2024-10-24 08:34:06'),
(24, '{\"en\": \"eos\", \"es\": \"nostrum\", \"fr\": \"aliquid\"}', NULL, '2024-10-24 08:34:11', '2024-10-24 08:34:11'),
(25, '{\"en\": \"sint\", \"es\": \"quo\", \"fr\": \"praesentium\"}', NULL, '2024-10-24 08:34:20', '2024-10-24 08:34:20'),
(26, '{\"en\": \"debitis\", \"es\": \"quia\", \"fr\": \"vitae\"}', NULL, '2024-10-24 08:34:26', '2024-10-24 08:34:26'),
(27, '{\"en\": \"ut\", \"es\": \"aliquid\", \"fr\": \"sit\"}', NULL, '2024-10-24 08:34:29', '2024-10-24 08:34:29'),
(28, '{\"en\": \"dolorem\", \"es\": \"saepe\", \"fr\": \"aut\"}', NULL, '2024-10-24 08:34:34', '2024-10-24 08:34:34'),
(29, '{\"en\": \"molestiae\", \"es\": \"cumque\", \"fr\": \"omnis\"}', NULL, '2024-10-24 08:34:36', '2024-10-24 08:34:36'),
(30, '{\"en\": \"id\", \"es\": \"placeat\", \"fr\": \"incidunt\"}', NULL, '2024-10-24 08:34:45', '2024-10-24 08:34:45'),
(31, '{\"en\": \"ut\", \"es\": \"iste\", \"fr\": \"quis\"}', NULL, '2024-10-24 08:34:48', '2024-10-24 08:34:48');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8_unicode_ci,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `collection_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `conversions_disk` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_uuid_unique` (`uuid`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  KEY `media_order_column_index` (`order_column`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(28, 'App\\Models\\Restaurant', 14, '7fb07756-5bf5-438d-b662-3c0b4ccb1dbd', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 1, '2024-10-24 08:04:42', '2024-10-24 08:04:42'),
(27, 'App\\Models\\Restaurant', 13, '028e00e6-cd42-4970-abce-b6e50930f79b', 'images', 'photo-1521017432531-fbd92d768814', 'photo-1521017432531-fbd92d768814.jpeg', 'image/jpeg', 'public', 'public', 2860346, '[]', '[]', '[]', '[]', 1, '2024-10-24 08:04:39', '2024-10-24 08:04:39'),
(26, 'App\\Models\\Restaurant', 12, '001f05ff-dfaa-407f-87a0-5338cf8e6452', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 1, '2024-10-24 07:44:08', '2024-10-24 07:44:08'),
(25, 'App\\Models\\Restaurant', 11, '205ae4d9-3dad-42c6-8260-f6d82f60be84', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 1, '2024-10-24 07:44:03', '2024-10-24 07:44:03'),
(24, 'App\\Models\\Restaurant', 10, '97b7e595-bb79-44d2-9df6-5faaaf0f63db', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 1, '2024-10-24 07:44:00', '2024-10-24 07:44:00'),
(23, 'App\\Models\\Restaurant', 9, 'ab16a66b-4673-4eb8-9973-01c152026c7b', 'images', 'photo-1522336572468-97b06e8ef143', 'photo-1522336572468-97b06e8ef143.jpeg', 'image/jpeg', 'public', 'public', 2323412, '[]', '[]', '[]', '[]', 1, '2024-10-24 07:43:49', '2024-10-24 07:43:49'),
(22, 'App\\Models\\Restaurant', 8, 'dc433413-d69d-4836-9dca-a95a0f8e4d15', 'images', 'photo-1517248135467-4c7edcad34c4', 'photo-1517248135467-4c7edcad34c4.jpeg', 'image/jpeg', 'public', 'public', 4713062, '[]', '[]', '[]', '[]', 1, '2024-10-24 07:43:42', '2024-10-24 07:43:42'),
(21, 'App\\Models\\Restaurant', 7, '640f4650-c021-476e-a195-0eec7cf07df6', 'images', 'photo-1522336572468-97b06e8ef143', 'photo-1522336572468-97b06e8ef143.jpeg', 'image/jpeg', 'public', 'public', 2323412, '[]', '[]', '[]', '[]', 1, '2024-10-24 07:43:11', '2024-10-24 07:43:11'),
(20, 'App\\Models\\Restaurant', 6, '177219f4-67ff-4a7f-b243-a01da6665609', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 1, '2024-10-24 07:42:58', '2024-10-24 07:42:58'),
(19, 'App\\Models\\Restaurant', 5, '39e137d6-654a-42c6-993d-a8d1785ff32a', 'images', 'photo-1517248135467-4c7edcad34c4', 'photo-1517248135467-4c7edcad34c4.jpeg', 'image/jpeg', 'public', 'public', 4713062, '[]', '[]', '[]', '[]', 1, '2024-10-24 07:42:53', '2024-10-24 07:42:53'),
(18, 'App\\Models\\Restaurant', 4, '72261216-8116-4878-8a65-6f3e37707346', 'images', 'photo-1517248135467-4c7edcad34c4', 'photo-1517248135467-4c7edcad34c4.jpeg', 'image/jpeg', 'public', 'public', 4713062, '[]', '[]', '[]', '[]', 1, '2024-10-24 07:42:37', '2024-10-24 07:42:37'),
(17, 'App\\Models\\Restaurant', 3, 'fffd98bd-e1a9-4d12-bc87-bb5f5bbf58cc', 'images', 'photo-1517248135467-4c7edcad34c4', 'photo-1517248135467-4c7edcad34c4.jpeg', 'image/jpeg', 'public', 'public', 4713062, '[]', '[]', '[]', '[]', 1, '2024-10-24 07:42:16', '2024-10-24 07:42:16'),
(16, 'App\\Models\\Restaurant', 2, '9af98a26-1db7-46e2-888e-d6a999bcfd27', 'images', 'photo-1517248135467-4c7edcad34c4', 'photo-1517248135467-4c7edcad34c4.jpeg', 'image/jpeg', 'public', 'public', 4713062, '[]', '[]', '[]', '[]', 1, '2024-08-30 22:05:26', '2024-08-30 22:05:26'),
(15, 'App\\Models\\Restaurant', 1, '48fd7a1b-7ca3-473c-b189-76f6e29343e4', 'images', 'photo-1522336572468-97b06e8ef143', 'photo-1522336572468-97b06e8ef143.jpeg', 'image/jpeg', 'public', 'public', 2323412, '[]', '[]', '[]', '[]', 1, '2024-08-30 22:05:23', '2024-08-30 22:05:23'),
(29, 'App\\Models\\Restaurant', 15, '36365793-0bf1-42fa-9736-be0376f33b81', 'images', 'photo-1517248135467-4c7edcad34c4', 'photo-1517248135467-4c7edcad34c4.jpeg', 'image/jpeg', 'public', 'public', 4713062, '[]', '[]', '[]', '[]', 1, '2024-10-24 08:04:54', '2024-10-24 08:04:54'),
(30, 'App\\Models\\Restaurant', 16, '4246bc4f-f4db-4e53-900b-fbf8efa23fab', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 1, '2024-10-24 08:04:57', '2024-10-24 08:04:57'),
(31, 'App\\Models\\Restaurant', 17, 'a1900b2a-2eb0-4f3e-88aa-e47456e703f2', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 1, '2024-10-24 08:05:00', '2024-10-24 08:05:00'),
(32, 'App\\Models\\Restaurant', 18, '95f2963a-4382-4fc6-99cc-14ec55c6fb27', 'images', 'photo-1521017432531-fbd92d768814', 'photo-1521017432531-fbd92d768814.jpeg', 'image/jpeg', 'public', 'public', 2860346, '[]', '[]', '[]', '[]', 1, '2024-10-24 08:05:06', '2024-10-24 08:05:06'),
(33, 'App\\Models\\Restaurant', 19, '73c20a9b-c28b-4026-b709-29ca987c60ff', 'images', 'photo-1517248135467-4c7edcad34c4', 'photo-1517248135467-4c7edcad34c4.jpeg', 'image/jpeg', 'public', 'public', 4713062, '[]', '[]', '[]', '[]', 1, '2024-10-24 08:05:19', '2024-10-24 08:05:19'),
(34, 'App\\Models\\Restaurant', 20, 'd84edf5b-bed1-4f35-825a-19d15337701d', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 1, '2024-10-24 08:05:26', '2024-10-24 08:05:26'),
(35, 'App\\Models\\Restaurant', 21, '5e6db404-5357-414b-bb4f-9c6c634fad15', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 1, '2024-10-24 08:05:32', '2024-10-24 08:05:32'),
(36, 'App\\Models\\Restaurant', 22, 'eab090af-9f23-49c7-a94b-71683347e209', 'images', 'photo-1517248135467-4c7edcad34c4', 'photo-1517248135467-4c7edcad34c4.jpeg', 'image/jpeg', 'public', 'public', 4713062, '[]', '[]', '[]', '[]', 1, '2024-10-24 08:05:47', '2024-10-24 08:05:47'),
(37, 'App\\Models\\Restaurant', 23, '0e5b0ea0-950b-40c9-b9bb-793592ef54e2', 'images', 'photo-1522336572468-97b06e8ef143', 'photo-1522336572468-97b06e8ef143.jpeg', 'image/jpeg', 'public', 'public', 2323412, '[]', '[]', '[]', '[]', 1, '2024-10-24 08:33:50', '2024-10-24 08:33:50'),
(38, 'App\\Models\\Restaurant', 24, '3fa70ccd-0d3b-4889-b0f8-f8d643c3e3c3', 'images', 'photo-1517248135467-4c7edcad34c4', 'photo-1517248135467-4c7edcad34c4.jpeg', 'image/jpeg', 'public', 'public', 4713062, '[]', '[]', '[]', '[]', 1, '2024-10-24 08:34:06', '2024-10-24 08:34:06'),
(39, 'App\\Models\\Restaurant', 25, '703f31b7-b383-4fa7-b9d8-093cad19db73', 'images', 'photo-1522336572468-97b06e8ef143', 'photo-1522336572468-97b06e8ef143.jpeg', 'image/jpeg', 'public', 'public', 2323412, '[]', '[]', '[]', '[]', 1, '2024-10-24 08:34:11', '2024-10-24 08:34:11'),
(40, 'App\\Models\\Restaurant', 26, '45338f65-21b3-45fd-907c-0adab7d99493', 'images', 'photo-1517248135467-4c7edcad34c4', 'photo-1517248135467-4c7edcad34c4.jpeg', 'image/jpeg', 'public', 'public', 4713062, '[]', '[]', '[]', '[]', 1, '2024-10-24 08:34:20', '2024-10-24 08:34:20'),
(41, 'App\\Models\\Restaurant', 27, '2bc68541-012c-476f-a3e5-2c2ecd255466', 'images', 'photo-1521017432531-fbd92d768814', 'photo-1521017432531-fbd92d768814.jpeg', 'image/jpeg', 'public', 'public', 2860346, '[]', '[]', '[]', '[]', 1, '2024-10-24 08:34:26', '2024-10-24 08:34:26'),
(42, 'App\\Models\\Restaurant', 28, 'e2ae80d8-ce8e-4b6a-a995-434b6b605ffa', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 1, '2024-10-24 08:34:29', '2024-10-24 08:34:29'),
(43, 'App\\Models\\Restaurant', 29, 'd626be98-6b84-4cc0-90cd-b90b1ec4953e', 'images', 'photo-1522336572468-97b06e8ef143', 'photo-1522336572468-97b06e8ef143.jpeg', 'image/jpeg', 'public', 'public', 2323412, '[]', '[]', '[]', '[]', 1, '2024-10-24 08:34:34', '2024-10-24 08:34:34'),
(44, 'App\\Models\\Restaurant', 30, 'a66bd4d3-fb05-401a-8239-f847a9349af0', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 1, '2024-10-24 08:34:36', '2024-10-24 08:34:36'),
(45, 'App\\Models\\Restaurant', 31, '996199df-0c86-441f-884b-e24e24a47a34', 'images', 'photo-1517248135467-4c7edcad34c4', 'photo-1517248135467-4c7edcad34c4.jpeg', 'image/jpeg', 'public', 'public', 4713062, '[]', '[]', '[]', '[]', 1, '2024-10-24 08:34:45', '2024-10-24 08:34:45'),
(46, 'App\\Models\\Restaurant', 32, 'a3eccf4b-e282-4a70-a539-1fb54ace8eb5', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 1, '2024-10-24 08:34:48', '2024-10-24 08:34:48');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(37, '0001_01_01_000000_create_users_table', 1),
(38, '0001_01_01_000001_create_cache_table', 1),
(39, '0001_01_01_000002_create_jobs_table', 1),
(40, '2024_08_26_102108_create_personal_access_tokens_table', 1),
(41, '2024_08_28_141409_create_restaurants_table', 1),
(42, '2024_08_28_142329_create_permission_tables', 1),
(43, '2024_08_30_125244_add_address_into_users', 1),
(61, '2024_08_30_141152_create_dishes_table', 5),
(45, '2024_08_30_141218_create_categories_table', 1),
(46, '2024_08_30_142427_create_services_table', 1),
(47, '2024_08_30_142751_create_restaurant_service_table', 1),
(48, '2024_08_30_143134_create_dish_types_table', 1),
(60, '2024_08_30_143156_create_user_dish_type_preferences_table', 4),
(50, '2024_08_30_143623_create_tags_table', 1),
(51, '2024_08_30_143809_create_dish_tag_table', 1),
(52, '2024_08_30_145123_create_user_dish_interactions_table', 1),
(53, '2024_08_30_145240_create_user_restaurant_interactions_table', 1),
(54, '2024_08_30_145806_create_reviews_table', 1),
(55, '2024_08_31_030108_create_media_table', 1),
(58, '2024_10_10_113350_add_lat_long_radius_to_users_table', 2),
(59, '2024_10_12_072939_create_preference_category_user_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'authToken', '516ac6e91ed5a1633634bcfc4e68f905177632af76be394ca8351f208db8c12a', '[\"*\"]', NULL, NULL, '2024-08-30 22:19:51', '2024-08-30 22:19:51'),
(4, 'App\\Models\\User', 1, 'authToken', 'be5ded52e7ae2b93253ad63ac2eeb682fdd92ca5e67b96d612312aabb4d3c48d', '[\"*\"]', '2024-08-30 22:57:51', NULL, '2024-08-30 22:32:57', '2024-08-30 22:57:51'),
(3, 'App\\Models\\User', 2, 'authToken', '8252f04f92e11ab864fa62976ae8abdd33c1f370e808058f4c4517bc57afb1a1', '[\"*\"]', NULL, NULL, '2024-08-30 22:21:40', '2024-08-30 22:21:40'),
(5, 'App\\Models\\User', 1, 'authToken', 'e8d84487b6b59bcf2046c8501638e7739d38c9c465f2b353de775b8e6a73a63d', '[\"*\"]', NULL, NULL, '2024-10-10 06:27:20', '2024-10-10 06:27:20'),
(6, 'App\\Models\\User', 1, 'authToken', '0cea97dc32da58d0a973b6eb5327dffe7e7e1ce4936f1d2e9f83039d1b079406', '[\"*\"]', NULL, NULL, '2024-10-10 06:28:05', '2024-10-10 06:28:05'),
(7, 'App\\Models\\User', 1, 'authToken', '5dcc129ca544ea6cc612b97c834b874ec410bcd8d37a10f4c0557e36ab8864ee', '[\"*\"]', NULL, NULL, '2024-10-10 06:29:32', '2024-10-10 06:29:32'),
(8, 'App\\Models\\User', 1, 'authToken', '5d77c82d241b482b15b27626f3aa54d80cc3de23b9a1a840eb87063efc9ca44e', '[\"*\"]', NULL, NULL, '2024-10-10 06:29:38', '2024-10-10 06:29:38'),
(9, 'App\\Models\\User', 3, 'authToken', 'c7c738882d15d2f4c132d37a19a71f2b24d0a506f2709a8ca4c6e2b1475c991b', '[\"*\"]', NULL, NULL, '2024-10-10 12:12:41', '2024-10-10 12:12:41'),
(10, 'App\\Models\\User', 1, 'authToken', '3e6668a857ad04d5f4633350737ba6126ac05e741a693b4da6e991ee6150c827', '[\"*\"]', '2024-10-12 02:58:08', NULL, '2024-10-10 12:16:52', '2024-10-12 02:58:08'),
(11, 'App\\Models\\User', 1, 'authToken', '19a728657008e14785c942cb4005ef909dbc6cdf66a680b87fad62decca47c13', '[\"*\"]', '2024-10-24 09:22:30', NULL, '2024-10-24 07:24:50', '2024-10-24 09:22:30');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
CREATE TABLE IF NOT EXISTS `restaurants` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` json NOT NULL,
  `location` text COLLATE utf8_unicode_ci,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `distance` decimal(5,2) DEFAULT NULL,
  `restaurant_rating` decimal(3,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `location`, `latitude`, `longitude`, `distance`, `restaurant_rating`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\": \"Zboncak, Parker and Yost\", \"es\": \"Abshire-Mohr\"}', '{\"address\":\"2511 Cecil Glens Suite 293\\nNew Erickville, DC 54252\",\"city\":\"Gennaroshire\",\"country\":\"Belize\"}', '-19.39579700', '50.46313800', NULL, '2.00', '2024-08-30 22:05:06', '2024-08-30 22:05:06', NULL),
(2, '{\"en\": \"Olson-Schneider\", \"es\": \"Collier, Kihn and Hintz\"}', '{\"address\":\"2008 Anika Loop Suite 664\\nEast Dylan, NM 47487-2792\",\"city\":\"East Tatumstad\",\"country\":\"Indonesia\"}', '-50.65598600', '128.89376400', NULL, '2.00', '2024-08-30 22:05:06', '2024-08-30 22:05:06', NULL),
(3, '{\"en\": \"McGlynn Ltd\", \"es\": \"Goyette-Casper\"}', '{\"address\":\"16963 Hessel Rue\\nEast Juliamouth, VT 56700-5680\",\"city\":\"Carrollshire\",\"country\":\"Heard Island and McDonald Islands\"}', '-62.23714000', '18.24470400', NULL, '2.00', '2024-10-24 07:41:44', '2024-10-24 07:41:44', NULL),
(4, '{\"en\": \"Johnston, Brown and Windler\", \"es\": \"Welch-Rice\"}', '{\"address\":\"25596 Lehner Camp\\nNorth Miltonland, NJ 93765-0043\",\"city\":\"Malcolmtown\",\"country\":\"El Salvador\"}', '-19.92668000', '-12.11410200', NULL, '3.00', '2024-10-24 07:42:17', '2024-10-24 07:42:17', NULL),
(5, '{\"en\": \"Kuhn, Ziemann and Gutmann\", \"es\": \"Simonis LLC\"}', '{\"address\":\"306 Leta Field Suite 564\\nWindlermouth, PA 24481\",\"city\":\"Mariamton\",\"country\":\"Falkland Islands (Malvinas)\"}', '38.58533200', '-175.61030200', NULL, '2.00', '2024-10-24 07:42:37', '2024-10-24 07:42:37', NULL),
(6, '{\"en\": \"Gleichner and Sons\", \"es\": \"O\'Connell-Kemmer\"}', '{\"address\":\"1442 Lizzie Road Apt. 408\\nOlinchester, MA 79800\",\"city\":\"Lake Americo\",\"country\":\"Western Sahara\"}', '-21.98472300', '61.47753400', NULL, '2.00', '2024-10-24 07:42:53', '2024-10-24 07:42:53', NULL),
(7, '{\"en\": \"Little-Willms\", \"es\": \"Moen, Stoltenberg and Haley\"}', '{\"address\":\"292 Schmitt Brook Apt. 511\\nEmardside, PA 88673-9971\",\"city\":\"Bridgetteborough\",\"country\":\"Montserrat\"}', '66.92157300', '-147.34918900', NULL, '2.00', '2024-10-24 07:42:58', '2024-10-24 07:42:58', NULL),
(8, '{\"en\": \"Beier Inc\", \"es\": \"Robel-Hermann\"}', '{\"address\":\"66990 Lubowitz Mountains\\nNew Adah, NC 84286-1924\",\"city\":\"Marvinhaven\",\"country\":\"Morocco\"}', '-55.62837900', '-52.06457000', NULL, '3.00', '2024-10-24 07:43:11', '2024-10-24 07:43:11', NULL),
(9, '{\"en\": \"Bechtelar Ltd\", \"es\": \"Keeling Ltd\"}', '{\"address\":\"155 Maggio Fords Suite 076\\nEast Oraberg, RI 65030-9233\",\"city\":\"South Payton\",\"country\":\"French Guiana\"}', '40.98431400', '-152.86408800', NULL, '2.00', '2024-10-24 07:43:43', '2024-10-24 07:43:43', NULL),
(10, '{\"en\": \"Gleason-Pollich\", \"es\": \"Leannon, Buckridge and Gutmann\"}', '{\"address\":\"841 Cronin Neck Apt. 822\\nLake Cadetown, SD 84039-1479\",\"city\":\"East Wyattberg\",\"country\":\"Seychelles\"}', '57.88368600', '4.43931200', NULL, '3.00', '2024-10-24 07:43:49', '2024-10-24 07:43:49', NULL),
(11, '{\"en\": \"Witting PLC\", \"es\": \"Miller, Glover and Farrell\"}', '{\"address\":\"97591 Welch Radial\\nWest Zelda, AR 01330\",\"city\":\"Kuhlmanview\",\"country\":\"Latvia\"}', '-29.38966500', '136.41127100', NULL, '3.00', '2024-10-24 07:44:00', '2024-10-24 07:44:00', NULL),
(12, '{\"en\": \"Collins-Ondricka\", \"es\": \"Kunde, Hamill and Stroman\"}', '{\"address\":\"3186 Roberts Trace Suite 391\\nEast Bennystad, IA 56541\",\"city\":\"Keelyland\",\"country\":\"Heard Island and McDonald Islands\"}', '83.71701000', '-22.25029600', NULL, '2.00', '2024-10-24 07:44:03', '2024-10-24 07:44:03', NULL),
(13, '{\"en\": \"Adams LLC\", \"es\": \"Auer, Bartell and McClure\"}', '{\"address\":\"26972 Boyle Flats Suite 187\\nEast Haleyborough, DE 58366\",\"city\":\"Rheafort\",\"country\":\"Belize\"}', '-79.83880500', '147.40331800', NULL, '3.00', '2024-10-24 08:04:23', '2024-10-24 08:04:23', NULL),
(14, '{\"en\": \"Greenfelder-Stracke\", \"es\": \"Howell, Kilback and Dare\"}', '{\"address\":\"562 Leonard Locks Suite 307\\nConsidinechester, DE 37684\",\"city\":\"Lake Trever\",\"country\":\"Cuba\"}', '30.17300100', '13.27114300', NULL, '3.00', '2024-10-24 08:04:39', '2024-10-24 08:04:39', NULL),
(15, '{\"en\": \"Hills, Paucek and Wiegand\", \"es\": \"Dietrich Group\"}', '{\"address\":\"1314 Dedrick Mountain\\nQuincyview, WA 75229-5121\",\"city\":\"Constantinborough\",\"country\":\"Afghanistan\"}', '-21.08163000', '49.87536200', NULL, '2.00', '2024-10-24 08:04:42', '2024-10-24 08:04:42', NULL),
(16, '{\"en\": \"Kassulke, Goodwin and Runolfsson\", \"es\": \"Daugherty-Rogahn\"}', '{\"address\":\"586 Reinger Dale Apt. 320\\nKuhicstad, SD 16239\",\"city\":\"Celiaton\",\"country\":\"Hong Kong\"}', '60.50310000', '174.30375700', NULL, '3.00', '2024-10-24 08:04:55', '2024-10-24 08:04:55', NULL),
(17, '{\"en\": \"Pfeffer Ltd\", \"es\": \"Zboncak, VonRueden and Mohr\"}', '{\"address\":\"8971 Abel Dam\\nMcCluremouth, MA 72009-8128\",\"city\":\"South Rosemary\",\"country\":\"Belize\"}', '-58.81029700', '-169.13223900', NULL, '3.00', '2024-10-24 08:04:57', '2024-10-24 08:04:57', NULL),
(18, '{\"en\": \"Bailey-Smitham\", \"es\": \"Towne LLC\"}', '{\"address\":\"33839 Rolfson Parkway\\nSouth Mittie, WV 72177\",\"city\":\"Kreigermouth\",\"country\":\"Antarctica (the territory South of 60 deg S)\"}', '-58.66646900', '-33.71763700', NULL, '3.00', '2024-10-24 08:05:00', '2024-10-24 08:05:00', NULL),
(19, '{\"en\": \"Treutel-Bartell\", \"es\": \"Ritchie and Sons\"}', '{\"address\":\"774 Gideon Ports\\nSiennaburgh, NH 94595\",\"city\":\"South Jessmouth\",\"country\":\"Saint Pierre and Miquelon\"}', '-61.25885200', '76.21256400', NULL, '2.00', '2024-10-24 08:05:06', '2024-10-24 08:05:06', NULL),
(20, '{\"en\": \"Kassulke, Kerluke and Zemlak\", \"es\": \"Strosin, Ryan and Bauch\"}', '{\"address\":\"8744 Jessie Spur\\nPort Columbus, MN 79170-3296\",\"city\":\"Yostmouth\",\"country\":\"Cape Verde\"}', '75.11061200', '139.36083400', NULL, '3.00', '2024-10-24 08:05:19', '2024-10-24 08:05:19', NULL),
(21, '{\"en\": \"Nolan, Pfannerstill and Bartoletti\", \"es\": \"Kulas-Ebert\"}', '{\"address\":\"30421 Boehm Villages Suite 295\\nPort Ellsworthfort, ID 39760\",\"city\":\"Novahaven\",\"country\":\"Grenada\"}', '31.04258600', '-46.98517900', NULL, '2.00', '2024-10-24 08:05:26', '2024-10-24 08:05:26', NULL),
(22, '{\"en\": \"Mills Inc\", \"es\": \"Weimann, Predovic and Streich\"}', '{\"address\":\"785 Chelsey Ways\\nBaumbachhaven, NC 69799-6236\",\"city\":\"West Derricktown\",\"country\":\"Slovenia\"}', '-43.45134800', '56.02404100', NULL, '3.00', '2024-10-24 08:05:32', '2024-10-24 08:05:32', NULL),
(23, '{\"en\": \"Predovic Inc\", \"es\": \"Smith-Rodriguez\"}', '{\"address\":\"830 Corkery Lake\\nNorth Rydertown, IN 49801-1485\",\"city\":\"Edythborough\",\"country\":\"Philippines\"}', '15.32996000', '80.89759900', NULL, '2.00', '2024-10-24 08:33:45', '2024-10-24 08:33:45', NULL),
(24, '{\"en\": \"Hintz, Marks and Aufderhar\", \"es\": \"Howe, McLaughlin and Walter\"}', '{\"address\":\"491 Wolff Shoals\\nNorth Scotty, MI 17576-2438\",\"city\":\"East Conner\",\"country\":\"Tanzania\"}', '-53.43600500', '-50.16042000', NULL, '2.00', '2024-10-24 08:33:50', '2024-10-24 08:33:50', NULL),
(25, '{\"en\": \"Brown-Larson\", \"es\": \"Lockman, Stroman and Macejkovic\"}', '{\"address\":\"96073 Darlene Spurs Apt. 229\\nLake Madelynhaven, NE 15507\",\"city\":\"New Russ\",\"country\":\"Grenada\"}', '72.14274100', '-82.76652400', NULL, '2.00', '2024-10-24 08:34:06', '2024-10-24 08:34:06', NULL),
(26, '{\"en\": \"Reichel-Davis\", \"es\": \"Harris, Bailey and VonRueden\"}', '{\"address\":\"5032 Jennings Valley Suite 077\\nStehrshire, AR 68739-5561\",\"city\":\"South Sandyhaven\",\"country\":\"Monaco\"}', '27.75849900', '122.63819200', NULL, '3.00', '2024-10-24 08:34:11', '2024-10-24 08:34:11', NULL),
(27, '{\"en\": \"Larson-Schultz\", \"es\": \"Pfeffer, O\'Hara and Berge\"}', '{\"address\":\"68793 Elinor Flat Apt. 923\\nNew Dewayne, RI 95654-0442\",\"city\":\"Goodwintown\",\"country\":\"Swaziland\"}', '-72.10559500', '86.24985600', NULL, '2.00', '2024-10-24 08:34:20', '2024-10-24 08:34:20', NULL),
(28, '{\"en\": \"Eichmann-Abbott\", \"es\": \"Volkman-Ondricka\"}', '{\"address\":\"51613 Nyah Springs Apt. 898\\nSouth Rodgerberg, IN 68852-8247\",\"city\":\"Lake Leonefurt\",\"country\":\"Norfolk Island\"}', '-89.03411300', '-13.80593400', NULL, '2.00', '2024-10-24 08:34:26', '2024-10-24 08:34:26', NULL),
(29, '{\"en\": \"Kunde Ltd\", \"es\": \"Rau, Simonis and Luettgen\"}', '{\"address\":\"10060 Kristy Coves Suite 400\\nEast Meta, MD 42196\",\"city\":\"Johnsonborough\",\"country\":\"Lesotho\"}', '26.92819500', '-144.01258300', NULL, '2.00', '2024-10-24 08:34:29', '2024-10-24 08:34:29', NULL),
(30, '{\"en\": \"Nolan PLC\", \"es\": \"Krajcik-Hahn\"}', '{\"address\":\"5086 Oren Vista Suite 125\\nHegmannport, VT 33056\",\"city\":\"Ritchieton\",\"country\":\"Paraguay\"}', '-48.82679100', '136.45478800', NULL, '3.00', '2024-10-24 08:34:34', '2024-10-24 08:34:34', NULL),
(31, '{\"en\": \"Schmitt Ltd\", \"es\": \"Wiegand LLC\"}', '{\"address\":\"67026 Jacinthe Point\\nGwenhaven, KY 57125-0282\",\"city\":\"Lake Leslie\",\"country\":\"Zambia\"}', '-89.71279700', '-116.26103300', NULL, '2.00', '2024-10-24 08:34:36', '2024-10-24 08:34:36', NULL),
(32, '{\"en\": \"Jerde, Hansen and Cartwright\", \"es\": \"Bogisich Ltd\"}', '{\"address\":\"53067 Elijah Mews\\nSouth Eva, KY 11867\",\"city\":\"East Nickolas\",\"country\":\"Togo\"}', '-28.07281000', '-81.95256900', NULL, '2.00', '2024-10-24 08:34:45', '2024-10-24 08:34:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_service`
--

DROP TABLE IF EXISTS `restaurant_service`;
CREATE TABLE IF NOT EXISTS `restaurant_service` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurant_service_restaurant_id_foreign` (`restaurant_id`),
  KEY `restaurant_service_service_id_foreign` (`service_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `dish_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `rating` decimal(3,2) NOT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `dish_size` enum('small','medium','large') COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '1',
  `categories` json DEFAULT NULL,
  `reviewed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comments` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_user_id_foreign` (`user_id`),
  KEY `reviews_dish_id_foreign` (`dish_id`),
  KEY `reviews_restaurant_id_foreign` (`restaurant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` json NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0: inactive, 1: active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '{\"en\": \"Kids Zone\", \"es\": \"Zona de niños\", \"fr\": \"Zone pour enfants\"}', 1, NULL, '2024-08-30 22:05:26', '2024-08-30 22:05:26'),
(2, '{\"en\": \"Take Away\", \"es\": \"Para llevar\", \"fr\": \"À emporter\"}', 1, NULL, '2024-08-30 22:05:26', '2024-08-30 22:05:26'),
(3, '{\"en\": \"Private Parking\", \"es\": \"Estacionamiento privado\", \"fr\": \"Parking privé\"}', 1, NULL, '2024-08-30 22:05:26', '2024-08-30 22:05:26'),
(4, '{\"en\": \"Free WiFi\", \"es\": \"WiFi gratis\", \"fr\": \"WiFi gratuit\"}', 1, NULL, '2024-08-30 22:05:26', '2024-08-30 22:05:26');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8_unicode_ci,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\": \"Halal\", \"es\": \"Halal\", \"fr\": \"Halal\"}', '2024-08-30 22:05:26', '2024-08-30 22:05:26', NULL),
(2, '{\"en\": \"Kosher\", \"es\": \"Kosher\", \"fr\": \"Casher\"}', '2024-08-30 22:05:26', '2024-08-30 22:05:26', NULL),
(3, '{\"en\": \"Vegan\", \"es\": \"Vegano\", \"fr\": \"Végétalien\"}', '2024-08-30 22:05:26', '2024-08-30 22:05:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0: inactive, 1: active',
  `lat` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `long` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `radius` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sms_code` int(11) DEFAULT NULL,
  `sms_code_expired_at` timestamp NULL DEFAULT NULL,
  `email_code` int(11) DEFAULT NULL,
  `email_code_expired_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_number_unique` (`phone_number`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_restaurant_id_foreign` (`restaurant_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `phone_number`, `password`, `address`, `restaurant_id`, `remember_token`, `active`, `lat`, `long`, `radius`, `sms_code`, `sms_code_expired_at`, `email_code`, `email_code_expired_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'customer', 'customer', 'customer@example.com', '2024-08-30 22:05:26', '1234567890', '$2y$12$06YvBBrQS8e9w.ON0CPFQueFc2aHqyENrLN6rcxMvwUbSF7BhyZxy', NULL, NULL, '7DVWbmm3LE', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-30 22:05:27', '2024-10-10 12:16:44'),
(2, 'John Doe', 'johndoe', 'johndoe@example.com', NULL, '1534567890', '$2y$12$0ZF/eWILyXfLFZjATEWAGeGJdmIkxwq6/hrDiowWm2XeOdFappip2', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-30 22:21:40', '2024-08-30 22:21:40'),
(3, 'John Doe', 'johndoee', 'johndoee@example.com', NULL, '1534567810', '$2y$12$06R6VPvzXh4lVTNDkuIxJeZOcIIML4maOEOMG8E5iDPVmfyfSWBPa', '123 Main Street, Springfield, USA', NULL, NULL, 1, '232', '232', '2', NULL, NULL, NULL, NULL, NULL, '2024-10-10 12:12:41', '2024-10-10 12:12:41');

-- --------------------------------------------------------

--
-- Table structure for table `user_category_preferences`
--

DROP TABLE IF EXISTS `user_category_preferences`;
CREATE TABLE IF NOT EXISTS `user_category_preferences` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_category_preferences_user_id_foreign` (`user_id`),
  KEY `user_category_preferences_category_id_foreign` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_category_preferences`
--

INSERT INTO `user_category_preferences` (`id`, `user_id`, `category_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, NULL),
(2, 1, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_dish_interactions`
--

DROP TABLE IF EXISTS `user_dish_interactions`;
CREATE TABLE IF NOT EXISTS `user_dish_interactions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `dish_id` bigint(20) UNSIGNED NOT NULL,
  `tasted` tinyint(1) NOT NULL DEFAULT '0',
  `rating` decimal(3,2) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_dish_interactions_user_id_foreign` (`user_id`),
  KEY `user_dish_interactions_dish_id_foreign` (`dish_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_dish_type_preferences`
--

DROP TABLE IF EXISTS `user_dish_type_preferences`;
CREATE TABLE IF NOT EXISTS `user_dish_type_preferences` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dish_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `preference` enum('love','like','neutral','dislike') COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_dish_type_preferences`
--

INSERT INTO `user_dish_type_preferences` (`id`, `user_id`, `dish_type_id`, `preference`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'love', NULL, '2024-10-12 02:58:08', '2024-10-12 02:58:08'),
(2, 1, 2, 'like', NULL, '2024-10-12 02:58:08', '2024-10-12 02:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `user_restaurant_interactions`
--

DROP TABLE IF EXISTS `user_restaurant_interactions`;
CREATE TABLE IF NOT EXISTS `user_restaurant_interactions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `service_rating` decimal(3,2) DEFAULT NULL,
  `cleaning_rating` decimal(3,2) DEFAULT NULL,
  `timing_rating` decimal(3,2) DEFAULT NULL,
  `environment_rating` decimal(3,2) DEFAULT NULL,
  `place_rating` decimal(3,2) DEFAULT NULL,
  `parking_rating` decimal(3,2) DEFAULT NULL,
  `categories` json DEFAULT NULL,
  `visited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comments` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_restaurant_interactions_user_id_foreign` (`user_id`),
  KEY `user_restaurant_interactions_restaurant_id_foreign` (`restaurant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
