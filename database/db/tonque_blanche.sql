-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 18, 2024 at 12:44 PM
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
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
CREATE TABLE IF NOT EXISTS `amenities` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `name`, `icon`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Kids Zone', NULL, NULL, '2024-10-28 10:26:02', '2024-10-28 10:26:02'),
(2, 'Free Parking', NULL, NULL, '2024-10-28 10:26:02', '2024-10-28 10:26:02'),
(3, 'Television', NULL, NULL, '2024-10-28 10:26:02', '2024-10-28 10:26:02'),
(4, 'Wi-Fi', NULL, NULL, '2024-10-28 10:26:02', '2024-10-28 10:26:02');

-- --------------------------------------------------------

--
-- Table structure for table `amenity_restaurant`
--

DROP TABLE IF EXISTS `amenity_restaurant`;
CREATE TABLE IF NOT EXISTS `amenity_restaurant` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `amenity_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `amenity_restaurant_amenity_id_foreign` (`amenity_id`),
  KEY `amenity_restaurant_restaurant_id_foreign` (`restaurant_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `amenity_restaurant`
--

INSERT INTO `amenity_restaurant` (`id`, `amenity_id`, `restaurant_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 1, 2),
(6, 4, 2);

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
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(35, '{\"en\": \"est\", \"es\": \"quo\", \"fr\": \"dicta\"}', '{\"en\": \"Esse ut officiis corrupti dolore.\", \"es\": \"Eius doloribus asperiores corporis sed mollitia repellat.\", \"fr\": \"Totam et accusantium autem temporibus aut.\"}', 1, NULL, '2024-10-24 08:34:48', '2024-10-24 08:34:48'),
(36, '{\"en\": \"aut\", \"es\": \"rerum\", \"fr\": \"laboriosam\"}', '{\"en\": \"Est molestiae molestias error earum ducimus tempora.\", \"es\": \"Veniam et nam sapiente est.\", \"fr\": \"Vero qui et fuga corporis praesentium.\"}', 1, NULL, '2024-10-28 09:16:26', '2024-10-28 09:16:26'),
(37, '{\"en\": \"cumque\", \"es\": \"deserunt\", \"fr\": \"nam\"}', '{\"en\": \"Aperiam ut est atque aliquid aliquam.\", \"es\": \"Occaecati eaque esse minus ut occaecati.\", \"fr\": \"Esse vel ipsam non odio eum.\"}', 1, NULL, '2024-10-28 09:16:35', '2024-10-28 09:16:35'),
(38, '{\"en\": \"facere\", \"es\": \"et\", \"fr\": \"enim\"}', '{\"en\": \"Consectetur qui sint tempora.\", \"es\": \"Sunt pariatur pariatur aut eveniet quod vel aut.\", \"fr\": \"Molestias ea id doloremque repudiandae consequuntur asperiores.\"}', 1, NULL, '2024-10-28 09:16:39', '2024-10-28 09:16:39'),
(39, '{\"en\": \"in\", \"es\": \"iusto\", \"fr\": \"expedita\"}', '{\"en\": \"Iure explicabo quo veniam non.\", \"es\": \"Ipsa non quia velit sit architecto ipsum quos officia.\", \"fr\": \"Non at ad expedita eos eligendi.\"}', 1, NULL, '2024-10-28 09:16:46', '2024-10-28 09:16:46'),
(40, '{\"en\": \"tempora\", \"es\": \"officiis\", \"fr\": \"praesentium\"}', '{\"en\": \"Veniam aut praesentium eligendi dicta et cupiditate.\", \"es\": \"Sapiente animi praesentium minus exercitationem.\", \"fr\": \"Quis eos deleniti est reprehenderit impedit ullam.\"}', 1, NULL, '2024-10-28 09:16:58', '2024-10-28 09:16:58'),
(41, '{\"en\": \"velit\", \"es\": \"nam\", \"fr\": \"quia\"}', '{\"en\": \"Voluptas modi expedita amet ipsa.\", \"es\": \"Vel aut illo ut.\", \"fr\": \"Sit provident quia quae fuga odio.\"}', 1, NULL, '2024-10-28 09:17:02', '2024-10-28 09:17:02'),
(42, '{\"en\": \"adipisci\", \"es\": \"consequatur\", \"fr\": \"exercitationem\"}', '{\"en\": \"Voluptatem et quia ut laborum voluptas molestiae aut.\", \"es\": \"Commodi placeat eos ut ex.\", \"fr\": \"Blanditiis voluptas quidem iusto cum quisquam molestiae.\"}', 1, NULL, '2024-10-28 09:17:27', '2024-10-28 09:17:27'),
(43, '{\"en\": \"optio\", \"es\": \"minus\", \"fr\": \"aut\"}', '{\"en\": \"Eos et a explicabo fugit perferendis saepe maxime dicta.\", \"es\": \"Quisquam nemo laborum ratione eos aut tempore.\", \"fr\": \"Dolores cumque esse voluptate debitis minima facilis molestiae vel.\"}', 1, NULL, '2024-10-28 09:18:07', '2024-10-28 09:18:07'),
(44, '{\"en\": \"nihil\", \"es\": \"eum\", \"fr\": \"atque\"}', '{\"en\": \"Quibusdam quia sed excepturi sit sed.\", \"es\": \"Enim est et eum.\", \"fr\": \"Commodi dicta et et molestias rerum sit.\"}', 1, NULL, '2024-10-28 09:18:48', '2024-10-28 09:18:48'),
(45, '{\"en\": \"voluptatem\", \"es\": \"voluptas\", \"fr\": \"neque\"}', '{\"en\": \"Blanditiis deserunt vero autem explicabo dicta.\", \"es\": \"Quibusdam voluptas dolores aspernatur sed consequatur maiores asperiores.\", \"fr\": \"Quod sint vitae eum.\"}', 1, NULL, '2024-10-28 09:19:00', '2024-10-28 09:19:00'),
(46, '{\"en\": \"sunt\", \"es\": \"aut\", \"fr\": \"non\"}', '{\"en\": \"Eveniet aliquam saepe molestiae itaque voluptas distinctio itaque autem.\", \"es\": \"Voluptas et nam occaecati.\", \"fr\": \"Officiis vel porro laborum asperiores sequi velit sit.\"}', 1, NULL, '2024-10-28 09:22:21', '2024-10-28 09:22:21'),
(47, '{\"en\": \"quis\", \"es\": \"quis\", \"fr\": \"voluptatem\"}', '{\"en\": \"Dicta aliquid qui quidem deleniti.\", \"es\": \"Mollitia temporibus dolores libero debitis debitis ratione illo.\", \"fr\": \"Voluptas labore ipsum quidem consequatur.\"}', 1, NULL, '2024-10-28 09:23:07', '2024-10-28 09:23:07'),
(48, '{\"en\": \"non\", \"es\": \"aperiam\", \"fr\": \"autem\"}', '{\"en\": \"Et quis iste voluptatem provident.\", \"es\": \"Voluptate in nisi id fugiat sit reprehenderit dolor saepe.\", \"fr\": \"Quibusdam minus fugiat voluptatum.\"}', 1, NULL, '2024-10-28 09:23:34', '2024-10-28 09:23:34'),
(49, '{\"en\": \"nisi\", \"es\": \"deserunt\", \"fr\": \"eligendi\"}', '{\"en\": \"Sed totam ducimus possimus amet sequi quasi.\", \"es\": \"Rerum suscipit et quaerat et inventore.\", \"fr\": \"Sequi eos officia laboriosam laudantium.\"}', 1, NULL, '2024-10-28 09:23:58', '2024-10-28 09:23:58'),
(50, '{\"en\": \"impedit\", \"es\": \"dolor\", \"fr\": \"et\"}', '{\"en\": \"Autem est minus fuga vitae vitae enim.\", \"es\": \"Amet rerum labore quaerat qui.\", \"fr\": \"Molestias eaque soluta similique sed sit molestiae aut quidem.\"}', 1, NULL, '2024-10-28 09:24:33', '2024-10-28 09:24:33'),
(51, '{\"en\": \"sed\", \"es\": \"id\", \"fr\": \"cumque\"}', '{\"en\": \"Impedit qui fugiat reiciendis iure dignissimos.\", \"es\": \"Esse enim a nesciunt porro quo et sequi ipsam.\", \"fr\": \"Cupiditate occaecati voluptate rerum magni.\"}', 1, NULL, '2024-10-28 09:24:50', '2024-10-28 09:24:50'),
(52, '{\"en\": \"iusto\", \"es\": \"voluptatum\", \"fr\": \"sequi\"}', '{\"en\": \"Voluptatem eaque tenetur veritatis omnis.\", \"es\": \"Voluptate qui iste perferendis.\", \"fr\": \"Dolorem vitae assumenda suscipit veniam placeat soluta.\"}', 1, NULL, '2024-10-28 09:25:06', '2024-10-28 09:25:06'),
(53, '{\"en\": \"qui\", \"es\": \"et\", \"fr\": \"ut\"}', '{\"en\": \"Est quasi placeat amet nam quas enim.\", \"es\": \"Nostrum corrupti nobis aut sequi.\", \"fr\": \"Nam sunt minus laborum ex.\"}', 1, NULL, '2024-10-28 09:25:15', '2024-10-28 09:25:15'),
(54, '{\"en\": \"adipisci\", \"es\": \"et\", \"fr\": \"illo\"}', '{\"en\": \"Dolores quis rerum magni recusandae alias et eaque.\", \"es\": \"Quibusdam molestiae et odit debitis incidunt quisquam.\", \"fr\": \"Temporibus neque dolores sint cupiditate culpa architecto ut repellendus.\"}', 1, NULL, '2024-10-28 09:25:20', '2024-10-28 09:25:20'),
(55, '{\"en\": \"quia\", \"es\": \"voluptas\", \"fr\": \"et\"}', '{\"en\": \"Sed qui autem vel omnis eveniet sapiente voluptatem.\", \"es\": \"Vel praesentium necessitatibus dicta rerum.\", \"fr\": \"Magni ut accusamus suscipit laudantium.\"}', 1, NULL, '2024-10-28 09:25:25', '2024-10-28 09:25:25'),
(56, '{\"en\": \"et\", \"es\": \"et\", \"fr\": \"est\"}', '{\"en\": \"Animi magni enim ea nostrum numquam voluptates aut.\", \"es\": \"Cumque amet qui qui et.\", \"fr\": \"Optio quod in quae culpa eum magnam consequuntur officiis.\"}', 1, NULL, '2024-10-28 09:34:49', '2024-10-28 09:34:49'),
(57, '{\"en\": \"dolore\", \"es\": \"consequatur\", \"fr\": \"nisi\"}', '{\"en\": \"Aliquam molestiae impedit consequuntur id voluptas.\", \"es\": \"Ut vel voluptas dolore eligendi ipsa.\", \"fr\": \"Molestias omnis commodi distinctio nihil dolorum.\"}', 1, NULL, '2024-10-28 09:34:53', '2024-10-28 09:34:53'),
(58, '{\"en\": \"animi\", \"es\": \"occaecati\", \"fr\": \"magnam\"}', '{\"en\": \"Est saepe voluptas ab et occaecati.\", \"es\": \"Iusto omnis atque vitae.\", \"fr\": \"Quasi fugit et minima consequatur voluptatem.\"}', 1, NULL, '2024-10-28 09:35:34', '2024-10-28 09:35:34'),
(59, '{\"en\": \"nihil\", \"es\": \"eos\", \"fr\": \"sit\"}', '{\"en\": \"Rem provident harum aliquam deserunt aliquam ducimus.\", \"es\": \"Voluptas id ea eos magni tempora.\", \"fr\": \"Facilis nihil molestias maiores sunt dolores in.\"}', 1, NULL, '2024-10-28 09:36:04', '2024-10-28 09:36:04'),
(60, '{\"en\": \"eum\", \"es\": \"deleniti\", \"fr\": \"suscipit\"}', '{\"en\": \"Dignissimos et et ipsam quia ad consequatur.\", \"es\": \"Repellat fuga incidunt eum nihil animi quidem.\", \"fr\": \"Explicabo delectus incidunt asperiores totam fuga omnis vitae illo.\"}', 1, NULL, '2024-10-28 09:36:21', '2024-10-28 09:36:21'),
(61, '{\"en\": \"ea\", \"es\": \"dolorem\", \"fr\": \"sunt\"}', '{\"en\": \"Omnis consequatur provident molestiae.\", \"es\": \"Facere sunt voluptatem eveniet aliquam.\", \"fr\": \"Iusto tempora dolorem quam nihil doloremque totam tempora.\"}', 1, NULL, '2024-10-28 09:36:36', '2024-10-28 09:36:36'),
(62, '{\"en\": \"aut\", \"es\": \"adipisci\", \"fr\": \"quia\"}', '{\"en\": \"Et vero rem quisquam rerum cumque.\", \"es\": \"Quaerat incidunt rerum excepturi odit perspiciatis.\", \"fr\": \"Voluptatem magnam dicta sed aut aut natus.\"}', 1, NULL, '2024-10-28 09:36:43', '2024-10-28 09:36:43'),
(63, '{\"en\": \"vitae\", \"es\": \"rem\", \"fr\": \"dolor\"}', '{\"en\": \"In ut ex officiis quia.\", \"es\": \"Delectus illo dolores repellendus non error.\", \"fr\": \"Voluptatem aut voluptatem voluptatem quo aut sequi.\"}', 1, NULL, '2024-10-28 09:36:49', '2024-10-28 09:36:49'),
(64, '{\"en\": \"explicabo\", \"es\": \"qui\", \"fr\": \"corrupti\"}', '{\"en\": \"Expedita sequi ullam nesciunt nihil.\", \"es\": \"Aliquid officia nostrum consequatur saepe nisi.\", \"fr\": \"Harum molestiae enim error et.\"}', 1, NULL, '2024-10-28 09:37:08', '2024-10-28 09:37:08'),
(65, '{\"en\": \"et\", \"es\": \"odio\", \"fr\": \"a\"}', '{\"en\": \"Eum iusto sit voluptas architecto.\", \"es\": \"Repudiandae vitae distinctio quo modi accusamus.\", \"fr\": \"Et illum et incidunt quidem atque aspernatur ducimus similique.\"}', 1, NULL, '2024-10-28 09:37:21', '2024-10-28 09:37:21'),
(66, '{\"en\": \"soluta\", \"es\": \"repudiandae\", \"fr\": \"ea\"}', '{\"en\": \"Minima dolor quod repellendus sequi enim aspernatur.\", \"es\": \"Cupiditate nesciunt et ratione consequatur officiis.\", \"fr\": \"Eum voluptates corporis voluptates quos dolor.\"}', 1, NULL, '2024-10-28 10:39:39', '2024-10-28 10:39:39'),
(67, '{\"en\": \"incidunt\", \"es\": \"earum\", \"fr\": \"deserunt\"}', '{\"en\": \"Repudiandae quibusdam voluptas laboriosam ad aperiam.\", \"es\": \"Aut aut ullam nihil similique hic eum laudantium.\", \"fr\": \"Blanditiis culpa aperiam eum sunt quibusdam.\"}', 1, NULL, '2024-10-28 10:39:42', '2024-10-28 10:39:42'),
(68, '{\"en\": \"non\", \"es\": \"rerum\", \"fr\": \"laborum\"}', '{\"en\": \"Praesentium qui ea voluptatibus excepturi velit rem.\", \"es\": \"Ea harum sequi voluptatem.\", \"fr\": \"Mollitia porro necessitatibus alias expedita labore aperiam et ut.\"}', 1, NULL, '2024-10-28 10:39:48', '2024-10-28 10:39:48'),
(69, '{\"en\": \"ducimus\", \"es\": \"omnis\", \"fr\": \"odit\"}', '{\"en\": \"Odit exercitationem voluptatem eos at eveniet eum.\", \"es\": \"Rerum est molestiae voluptates ipsam est ut voluptatem.\", \"fr\": \"Ab est quidem qui officia necessitatibus et.\"}', 1, NULL, '2024-10-28 10:39:59', '2024-10-28 10:39:59'),
(70, '{\"en\": \"magnam\", \"es\": \"qui\", \"fr\": \"optio\"}', '{\"en\": \"In eum impedit error quia maiores ea et.\", \"es\": \"Dolorum optio minima perferendis in iste sequi suscipit.\", \"fr\": \"Pariatur nam est est quo eius.\"}', 1, NULL, '2024-10-28 10:40:17', '2024-10-28 10:40:17'),
(71, '{\"en\": \"et\", \"es\": \"adipisci\", \"fr\": \"quos\"}', '{\"en\": \"Cupiditate odio eveniet expedita iure dicta consequuntur.\", \"es\": \"Ut ut eligendi facilis ad eum rerum quidem.\", \"fr\": \"Dolorum asperiores sed quas ea iure perspiciatis ea est.\"}', 1, NULL, '2024-10-28 10:40:28', '2024-10-28 10:40:28'),
(72, '{\"en\": \"eos\", \"es\": \"dolores\", \"fr\": \"dicta\"}', '{\"en\": \"Omnis cum est maxime aut perspiciatis.\", \"es\": \"Vel occaecati atque aliquid.\", \"fr\": \"Sit quaerat doloremque voluptatem.\"}', 1, NULL, '2024-10-28 10:40:30', '2024-10-28 10:40:30'),
(73, '{\"en\": \"minus\", \"es\": \"eos\", \"fr\": \"dolorum\"}', '{\"en\": \"Non voluptas beatae placeat.\", \"es\": \"Dicta enim ullam in possimus sunt consectetur.\", \"fr\": \"Omnis inventore voluptas dolores.\"}', 1, NULL, '2024-10-28 10:40:33', '2024-10-28 10:40:33'),
(74, '{\"en\": \"error\", \"es\": \"unde\", \"fr\": \"quasi\"}', '{\"en\": \"Adipisci aspernatur ex distinctio.\", \"es\": \"Necessitatibus ut animi est perspiciatis autem sint ea.\", \"fr\": \"Ut nihil ipsum id.\"}', 1, NULL, '2024-10-28 10:40:46', '2024-10-28 10:40:46'),
(75, '{\"en\": \"sit\", \"es\": \"dolor\", \"fr\": \"esse\"}', '{\"en\": \"Sapiente itaque voluptates sequi excepturi ut sint itaque.\", \"es\": \"Saepe unde non odio magni ab.\", \"fr\": \"Voluptas aspernatur optio quibusdam pariatur sapiente sequi earum.\"}', 1, NULL, '2024-10-28 10:41:00', '2024-10-28 10:41:00');

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
(1, '{\"en\": \"Bacon Dog\", \"es\": \"Bacon Burger\", \"fr\": \"Cheese Veggie Sandwich\"}', '{\"en\": \"Fuga quas quam enim facilis est cum voluptas.\", \"es\": \"Ipsum sit velit omnis illo eius.\", \"fr\": \"Distinctio earum esse neque autem ipsum.\"}', '41.96', 1, 3, 66, 62, '2024-10-28 10:41:00', '2024-10-28 10:41:00', NULL),
(2, '{\"en\": \"Little Bacon Cheeseburger\", \"es\": \"Little Bacon Burger\", \"fr\": \"Bacon Burger\"}', '{\"en\": \"Quis corrupti recusandae dolore fuga sed unde.\", \"es\": \"Vel ex deserunt perferendis.\", \"fr\": \"Architecto quas quis quis eius.\"}', '29.30', 0, 4, 67, 63, '2024-10-28 10:41:00', '2024-10-28 10:41:00', NULL),
(3, '{\"en\": \"Little Cheeseburger\", \"es\": \"Little Bacon Cheeseburger\", \"fr\": \"Cheese Pizza\"}', '{\"en\": \"Qui enim a nemo iste mollitia laborum.\", \"es\": \"Impedit rem excepturi eum veritatis a in repellat nesciunt.\", \"fr\": \"Ut est nulla officia natus cumque.\"}', '43.78', 1, 5, 68, 64, '2024-10-28 10:41:00', '2024-10-28 10:41:00', NULL),
(4, '{\"en\": \"Bacon Burger\", \"es\": \"Cheese Dog\", \"fr\": \"Little Bacon Cheeseburger\"}', '{\"en\": \"Tempora enim et aliquam rem doloribus vero et aspernatur.\", \"es\": \"Est modi quia tempora deleniti omnis corporis voluptatibus et.\", \"fr\": \"Optio officiis unde sunt nobis labore voluptatem possimus officia.\"}', '21.94', 1, 6, 69, 65, '2024-10-28 10:41:00', '2024-10-28 10:41:00', NULL),
(5, '{\"en\": \"Pasta\", \"es\": \"Hamburger\", \"fr\": \"Bacon Dog\"}', '{\"en\": \"Aliquid eius unde sapiente similique inventore.\", \"es\": \"Est reprehenderit at dolorem quibusdam blanditiis.\", \"fr\": \"Aut modi quo assumenda quos sit.\"}', '21.42', 0, 7, 70, 66, '2024-10-28 10:41:00', '2024-10-28 10:41:00', NULL),
(6, '{\"en\": \"Little Bacon Burger\", \"es\": \"Hamburger\", \"fr\": \"Veggie Sandwich\"}', '{\"en\": \"Eius harum eum exercitationem veritatis ipsa sunt.\", \"es\": \"Nisi aliquam cum dolor numquam quae magni.\", \"fr\": \"Tempora corrupti et quia et eius vero.\"}', '41.61', 0, 8, 71, 67, '2024-10-28 10:41:00', '2024-10-28 10:41:00', NULL),
(7, '{\"en\": \"Little Cheeseburger\", \"es\": \"Bacon Cheeseburger\", \"fr\": \"Cheeseburger\"}', '{\"en\": \"Dolor doloremque quibusdam voluptatem libero occaecati voluptas sunt.\", \"es\": \"In fugiat quidem nostrum eos error.\", \"fr\": \"Expedita ea ratione corporis ullam fugit.\"}', '47.91', 1, 9, 72, 68, '2024-10-28 10:41:00', '2024-10-28 10:41:00', NULL),
(8, '{\"en\": \"Bacon Burger\", \"es\": \"Little Bacon Burger\", \"fr\": \"Hamburger\"}', '{\"en\": \"Eum non aperiam placeat.\", \"es\": \"Nihil eos aut et quia.\", \"fr\": \"Voluptatem tempore velit at et temporibus.\"}', '26.87', 1, 10, 73, 69, '2024-10-28 10:41:00', '2024-10-28 10:41:00', NULL),
(9, '{\"en\": \"Cheese Dog\", \"es\": \"Pasta\", \"fr\": \"Bacon Burger\"}', '{\"en\": \"Illo voluptas aut occaecati mollitia voluptatibus nihil vel.\", \"es\": \"Et ad ea debitis consequatur velit porro.\", \"fr\": \"Atque dolorem sint sed impedit suscipit.\"}', '11.02', 1, 11, 74, 70, '2024-10-28 10:41:00', '2024-10-28 10:41:00', NULL),
(10, '{\"en\": \"Bacon Cheeseburger\", \"es\": \"Little Bacon Burger\", \"fr\": \"Bacon Burger\"}', '{\"en\": \"Eius ipsa facilis esse accusamus voluptas.\", \"es\": \"Aspernatur deleniti quas officia.\", \"fr\": \"Dolore sed tenetur molestiae hic sed.\"}', '25.62', 1, 12, 75, 71, '2024-10-28 10:41:00', '2024-10-28 10:41:00', NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(31, '{\"en\": \"ut\", \"es\": \"iste\", \"fr\": \"quis\"}', NULL, '2024-10-24 08:34:48', '2024-10-24 08:34:48'),
(32, '{\"en\": \"inventore\", \"es\": \"ex\", \"fr\": \"sed\"}', NULL, '2024-10-28 09:16:26', '2024-10-28 09:16:26'),
(33, '{\"en\": \"sint\", \"es\": \"adipisci\", \"fr\": \"qui\"}', NULL, '2024-10-28 09:16:35', '2024-10-28 09:16:35'),
(34, '{\"en\": \"quae\", \"es\": \"assumenda\", \"fr\": \"commodi\"}', NULL, '2024-10-28 09:16:39', '2024-10-28 09:16:39'),
(35, '{\"en\": \"est\", \"es\": \"est\", \"fr\": \"rerum\"}', NULL, '2024-10-28 09:16:46', '2024-10-28 09:16:46'),
(36, '{\"en\": \"provident\", \"es\": \"dolorem\", \"fr\": \"distinctio\"}', NULL, '2024-10-28 09:16:58', '2024-10-28 09:16:58'),
(37, '{\"en\": \"adipisci\", \"es\": \"optio\", \"fr\": \"veniam\"}', NULL, '2024-10-28 09:17:02', '2024-10-28 09:17:02'),
(38, '{\"en\": \"corrupti\", \"es\": \"rerum\", \"fr\": \"odio\"}', NULL, '2024-10-28 09:17:27', '2024-10-28 09:17:27'),
(39, '{\"en\": \"perspiciatis\", \"es\": \"et\", \"fr\": \"consequatur\"}', NULL, '2024-10-28 09:18:07', '2024-10-28 09:18:07'),
(40, '{\"en\": \"qui\", \"es\": \"pariatur\", \"fr\": \"consequatur\"}', NULL, '2024-10-28 09:18:48', '2024-10-28 09:18:48'),
(41, '{\"en\": \"ut\", \"es\": \"exercitationem\", \"fr\": \"repudiandae\"}', NULL, '2024-10-28 09:19:00', '2024-10-28 09:19:00'),
(42, '{\"en\": \"enim\", \"es\": \"voluptatem\", \"fr\": \"ut\"}', NULL, '2024-10-28 09:22:21', '2024-10-28 09:22:21'),
(43, '{\"en\": \"repellat\", \"es\": \"officiis\", \"fr\": \"repudiandae\"}', NULL, '2024-10-28 09:23:07', '2024-10-28 09:23:07'),
(44, '{\"en\": \"ipsam\", \"es\": \"eaque\", \"fr\": \"eveniet\"}', NULL, '2024-10-28 09:23:34', '2024-10-28 09:23:34'),
(45, '{\"en\": \"sunt\", \"es\": \"ut\", \"fr\": \"dolor\"}', NULL, '2024-10-28 09:23:58', '2024-10-28 09:23:58'),
(46, '{\"en\": \"aut\", \"es\": \"et\", \"fr\": \"suscipit\"}', NULL, '2024-10-28 09:24:34', '2024-10-28 09:24:34'),
(47, '{\"en\": \"dolores\", \"es\": \"consequatur\", \"fr\": \"autem\"}', NULL, '2024-10-28 09:24:50', '2024-10-28 09:24:50'),
(48, '{\"en\": \"rerum\", \"es\": \"corrupti\", \"fr\": \"cupiditate\"}', NULL, '2024-10-28 09:25:06', '2024-10-28 09:25:06'),
(49, '{\"en\": \"doloremque\", \"es\": \"perferendis\", \"fr\": \"dolor\"}', NULL, '2024-10-28 09:25:15', '2024-10-28 09:25:15'),
(50, '{\"en\": \"illo\", \"es\": \"laborum\", \"fr\": \"expedita\"}', NULL, '2024-10-28 09:25:20', '2024-10-28 09:25:20'),
(51, '{\"en\": \"iusto\", \"es\": \"ut\", \"fr\": \"qui\"}', NULL, '2024-10-28 09:25:25', '2024-10-28 09:25:25'),
(52, '{\"en\": \"ullam\", \"es\": \"corporis\", \"fr\": \"enim\"}', NULL, '2024-10-28 09:34:49', '2024-10-28 09:34:49'),
(53, '{\"en\": \"qui\", \"es\": \"ut\", \"fr\": \"qui\"}', NULL, '2024-10-28 09:34:53', '2024-10-28 09:34:53'),
(54, '{\"en\": \"rerum\", \"es\": \"vel\", \"fr\": \"quia\"}', NULL, '2024-10-28 09:35:34', '2024-10-28 09:35:34'),
(55, '{\"en\": \"ad\", \"es\": \"optio\", \"fr\": \"adipisci\"}', NULL, '2024-10-28 09:36:04', '2024-10-28 09:36:04'),
(56, '{\"en\": \"asperiores\", \"es\": \"magnam\", \"fr\": \"mollitia\"}', NULL, '2024-10-28 09:36:21', '2024-10-28 09:36:21'),
(57, '{\"en\": \"dolorem\", \"es\": \"doloremque\", \"fr\": \"est\"}', NULL, '2024-10-28 09:36:36', '2024-10-28 09:36:36'),
(58, '{\"en\": \"sit\", \"es\": \"praesentium\", \"fr\": \"neque\"}', NULL, '2024-10-28 09:36:43', '2024-10-28 09:36:43'),
(59, '{\"en\": \"qui\", \"es\": \"nulla\", \"fr\": \"qui\"}', NULL, '2024-10-28 09:36:49', '2024-10-28 09:36:49'),
(60, '{\"en\": \"error\", \"es\": \"aliquam\", \"fr\": \"et\"}', NULL, '2024-10-28 09:37:08', '2024-10-28 09:37:08'),
(61, '{\"en\": \"quaerat\", \"es\": \"deleniti\", \"fr\": \"maiores\"}', NULL, '2024-10-28 09:37:21', '2024-10-28 09:37:21'),
(62, '{\"en\": \"dolore\", \"es\": \"id\", \"fr\": \"impedit\"}', NULL, '2024-10-28 10:39:39', '2024-10-28 10:39:39'),
(63, '{\"en\": \"veritatis\", \"es\": \"et\", \"fr\": \"et\"}', NULL, '2024-10-28 10:39:42', '2024-10-28 10:39:42'),
(64, '{\"en\": \"voluptatibus\", \"es\": \"vitae\", \"fr\": \"aliquid\"}', NULL, '2024-10-28 10:39:48', '2024-10-28 10:39:48'),
(65, '{\"en\": \"voluptatem\", \"es\": \"ut\", \"fr\": \"illum\"}', NULL, '2024-10-28 10:39:59', '2024-10-28 10:39:59'),
(66, '{\"en\": \"in\", \"es\": \"harum\", \"fr\": \"iure\"}', NULL, '2024-10-28 10:40:17', '2024-10-28 10:40:17'),
(67, '{\"en\": \"ipsum\", \"es\": \"incidunt\", \"fr\": \"ullam\"}', NULL, '2024-10-28 10:40:28', '2024-10-28 10:40:28'),
(68, '{\"en\": \"ut\", \"es\": \"iure\", \"fr\": \"sint\"}', NULL, '2024-10-28 10:40:30', '2024-10-28 10:40:30'),
(69, '{\"en\": \"beatae\", \"es\": \"dolor\", \"fr\": \"sed\"}', NULL, '2024-10-28 10:40:33', '2024-10-28 10:40:33'),
(70, '{\"en\": \"dignissimos\", \"es\": \"necessitatibus\", \"fr\": \"dolores\"}', NULL, '2024-10-28 10:40:46', '2024-10-28 10:40:46'),
(71, '{\"en\": \"reiciendis\", \"es\": \"ratione\", \"fr\": \"provident\"}', NULL, '2024-10-28 10:41:00', '2024-10-28 10:41:00');

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
-- Table structure for table `followers`
--

DROP TABLE IF EXISTS `followers`;
CREATE TABLE IF NOT EXISTS `followers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `follower_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `followers_user_id_foreign` (`user_id`),
  KEY `followers_follower_id_foreign` (`follower_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
CREATE TABLE IF NOT EXISTS `friends` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `friend_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','accepted') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `friends_user_id_foreign` (`user_id`),
  KEY `friends_friend_id_foreign` (`friend_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(46, 'App\\Models\\Restaurant', 32, 'a3eccf4b-e282-4a70-a539-1fb54ace8eb5', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 1, '2024-10-24 08:34:48', '2024-10-24 08:34:48'),
(47, 'App\\Models\\Restaurant', 33, 'bdea1631-6a39-4838-b8a6-19446e114383', 'images', 'photo-1517248135467-4c7edcad34c4', 'photo-1517248135467-4c7edcad34c4.jpeg', 'image/jpeg', 'public', 'public', 4713062, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:16:24', '2024-10-28 09:16:24'),
(48, 'App\\Models\\Restaurant', 34, 'c1a5f034-ee17-4d13-8733-eb4628ea643f', 'images', 'photo-1521017432531-fbd92d768814', 'photo-1521017432531-fbd92d768814.jpeg', 'image/jpeg', 'public', 'public', 2860346, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:16:35', '2024-10-28 09:16:35'),
(49, 'App\\Models\\Restaurant', 35, '7642d524-b51d-4b84-87e3-f3a49daaa046', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:16:39', '2024-10-28 09:16:39'),
(50, 'App\\Models\\Restaurant', 36, 'c0a9f2a1-c917-4423-b07d-25ec103afc38', 'images', 'photo-1521017432531-fbd92d768814', 'photo-1521017432531-fbd92d768814.jpeg', 'image/jpeg', 'public', 'public', 2860346, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:16:46', '2024-10-28 09:16:46'),
(51, 'App\\Models\\Restaurant', 37, '88e1c75a-95b7-4f13-a0b3-dac9bf9af681', 'images', 'photo-1517248135467-4c7edcad34c4', 'photo-1517248135467-4c7edcad34c4.jpeg', 'image/jpeg', 'public', 'public', 4713062, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:16:58', '2024-10-28 09:16:58'),
(52, 'App\\Models\\Restaurant', 38, 'f3befb66-4fdf-4c75-a609-bcd04eecb58d', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:17:02', '2024-10-28 09:17:02'),
(53, 'App\\Models\\Restaurant', 39, 'f41f3b3a-4f11-438e-87cd-fc7676f56e99', 'images', 'photo-1517248135467-4c7edcad34c4', 'photo-1517248135467-4c7edcad34c4.jpeg', 'image/jpeg', 'public', 'public', 4713062, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:17:27', '2024-10-28 09:17:27'),
(54, 'App\\Models\\Restaurant', 40, '134495dd-9902-4546-b738-7eb15d6614d6', 'images', 'photo-1517248135467-4c7edcad34c4', 'photo-1517248135467-4c7edcad34c4.jpeg', 'image/jpeg', 'public', 'public', 4713062, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:18:07', '2024-10-28 09:18:07'),
(55, 'App\\Models\\Restaurant', 41, '9ff077a0-34c7-4fb4-9b84-0e4a86b42264', 'images', 'photo-1517248135467-4c7edcad34c4', 'photo-1517248135467-4c7edcad34c4.jpeg', 'image/jpeg', 'public', 'public', 4713062, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:18:48', '2024-10-28 09:18:48'),
(56, 'App\\Models\\Restaurant', 42, '03077660-5848-48dd-b048-3b890e572203', 'images', 'photo-1522336572468-97b06e8ef143', 'photo-1522336572468-97b06e8ef143.jpeg', 'image/jpeg', 'public', 'public', 2323412, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:19:00', '2024-10-28 09:19:00'),
(57, 'App\\Models\\Restaurant', 43, '228c9ec3-8c27-443f-a271-8297b1ba096a', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:22:21', '2024-10-28 09:22:21'),
(58, 'App\\Models\\Restaurant', 44, '3ee6a1f5-dde6-46bf-9a41-d338f40de7f5', 'images', 'photo-1521017432531-fbd92d768814', 'photo-1521017432531-fbd92d768814.jpeg', 'image/jpeg', 'public', 'public', 2860346, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:23:07', '2024-10-28 09:23:07'),
(59, 'App\\Models\\Restaurant', 45, 'abbc3055-bea2-474d-93c6-db20761e352f', 'images', 'photo-1522336572468-97b06e8ef143', 'photo-1522336572468-97b06e8ef143.jpeg', 'image/jpeg', 'public', 'public', 2323412, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:23:34', '2024-10-28 09:23:34'),
(60, 'App\\Models\\Restaurant', 46, 'a1ec961c-11a7-4206-ab17-18abcab6801f', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:23:58', '2024-10-28 09:23:58'),
(61, 'App\\Models\\Restaurant', 47, '013b19e3-0a9e-4495-8752-0aa83220ae6f', 'images', 'photo-1517248135467-4c7edcad34c4', 'photo-1517248135467-4c7edcad34c4.jpeg', 'image/jpeg', 'public', 'public', 4713062, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:24:33', '2024-10-28 09:24:33'),
(62, 'App\\Models\\Restaurant', 48, 'ae952f83-3bf8-4e7c-b358-103a25ca16f1', 'images', 'photo-1521017432531-fbd92d768814', 'photo-1521017432531-fbd92d768814.jpeg', 'image/jpeg', 'public', 'public', 2860346, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:24:50', '2024-10-28 09:24:50'),
(63, 'App\\Models\\Restaurant', 49, '65e580b6-394d-4f23-9e1a-ec3240481470', 'images', 'photo-1517248135467-4c7edcad34c4', 'photo-1517248135467-4c7edcad34c4.jpeg', 'image/jpeg', 'public', 'public', 4713062, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:25:06', '2024-10-28 09:25:06'),
(64, 'App\\Models\\Restaurant', 50, 'f3ef2d80-888e-4bc8-9f26-0b6cb594dd66', 'images', 'photo-1521017432531-fbd92d768814', 'photo-1521017432531-fbd92d768814.jpeg', 'image/jpeg', 'public', 'public', 2860346, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:25:15', '2024-10-28 09:25:15'),
(65, 'App\\Models\\Restaurant', 51, 'd43cf8c8-a8ed-4f84-8831-64dddb17865d', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:25:20', '2024-10-28 09:25:20'),
(66, 'App\\Models\\Restaurant', 52, 'ba810f09-dc62-462f-9e27-13df9c5824a1', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:25:25', '2024-10-28 09:25:25'),
(70, 'App\\Models\\Restaurant', 54, '8c61826a-4f99-4e2f-8a11-fc1822499f9c', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:34:52', '2024-10-28 09:34:52'),
(69, 'App\\Models\\Restaurant', 53, '7ac73530-c2e7-4949-9560-ad766638188e', 'images', 'photo-1521017432531-fbd92d768814', 'photo-1521017432531-fbd92d768814.jpeg', 'image/jpeg', 'public', 'public', 2860346, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:34:49', '2024-10-28 09:34:49'),
(71, 'App\\Models\\Restaurant', 55, '8561507a-c498-499e-a7c0-96200bf0be0d', 'images', 'photo-1517248135467-4c7edcad34c4', 'photo-1517248135467-4c7edcad34c4.jpeg', 'image/jpeg', 'public', 'public', 4713062, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:35:34', '2024-10-28 09:35:34'),
(72, 'App\\Models\\Restaurant', 56, '7b640db3-3de9-46b6-8e4d-ba18f590bdd9', 'images', 'photo-1517248135467-4c7edcad34c4', 'photo-1517248135467-4c7edcad34c4.jpeg', 'image/jpeg', 'public', 'public', 4713062, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:36:04', '2024-10-28 09:36:04'),
(73, 'App\\Models\\Restaurant', 57, '817bbb46-35b0-46ea-8643-e4856a2df2ce', 'images', 'photo-1521017432531-fbd92d768814', 'photo-1521017432531-fbd92d768814.jpeg', 'image/jpeg', 'public', 'public', 2860346, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:36:21', '2024-10-28 09:36:21'),
(74, 'App\\Models\\Restaurant', 58, 'bbb555ea-94b9-4d69-a22e-097f3f8c55fc', 'images', 'photo-1521017432531-fbd92d768814', 'photo-1521017432531-fbd92d768814.jpeg', 'image/jpeg', 'public', 'public', 2860346, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:36:36', '2024-10-28 09:36:36'),
(75, 'App\\Models\\Restaurant', 59, '84a774f2-057b-4a03-aff1-40efb342bf85', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:36:43', '2024-10-28 09:36:43'),
(76, 'App\\Models\\Restaurant', 60, 'cb77a806-2dba-4299-9b1e-c128bd4ad26c', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:36:49', '2024-10-28 09:36:49'),
(77, 'App\\Models\\Restaurant', 61, 'd9f905f0-0e86-4134-aa07-2fd42f9da337', 'images', 'photo-1521017432531-fbd92d768814', 'photo-1521017432531-fbd92d768814.jpeg', 'image/jpeg', 'public', 'public', 2860346, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:37:08', '2024-10-28 09:37:08'),
(78, 'App\\Models\\Restaurant', 62, '21aefdbb-5b94-4819-9914-f567db4e5317', 'images', 'photo-1522336572468-97b06e8ef143', 'photo-1522336572468-97b06e8ef143.jpeg', 'image/jpeg', 'public', 'public', 2323412, '[]', '[]', '[]', '[]', 1, '2024-10-28 09:37:21', '2024-10-28 09:37:21'),
(137, 'App\\Models\\Dish', 6, '6867a3fd-5b75-4dad-9f8f-ad14c9c56e89', 'images', 'photo-1464093515883-ec948246accb', 'photo-1464093515883-ec948246accb.jpeg', 'image/jpeg', 'public', 'public', 18452, '[]', '[]', '[]', '[]', 2, '2024-10-28 10:41:15', '2024-10-28 10:41:15'),
(136, 'App\\Models\\Dish', 6, '85e94473-4e29-4c08-9991-3a7059026a97', 'images', 'photo-1517244683847-7456b63c5969', 'photo-1517244683847-7456b63c5969.jpeg', 'image/jpeg', 'public', 'public', 40147, '[]', '[]', '[]', '[]', 1, '2024-10-28 10:41:13', '2024-10-28 10:41:13'),
(135, 'App\\Models\\Dish', 5, 'e303a8ec-3c00-4332-acc8-e3eaf0d5308a', 'images', 'photo-1542528180-a1208c5169a5', 'photo-1542528180-a1208c5169a5.jpeg', 'image/jpeg', 'public', 'public', 14255, '[]', '[]', '[]', '[]', 3, '2024-10-28 10:41:12', '2024-10-28 10:41:12'),
(134, 'App\\Models\\Dish', 5, '270e419a-4bad-4ef7-8978-55b8c5ec610f', 'images', 'photo-1464093515883-ec948246accb', 'photo-1464093515883-ec948246accb.jpeg', 'image/jpeg', 'public', 'public', 18452, '[]', '[]', '[]', '[]', 2, '2024-10-28 10:41:11', '2024-10-28 10:41:11'),
(133, 'App\\Models\\Dish', 5, 'eff1ffef-a601-476f-97cf-9fe11f076644', 'images', 'photo-1517244683847-7456b63c5969', 'photo-1517244683847-7456b63c5969.jpeg', 'image/jpeg', 'public', 'public', 40147, '[]', '[]', '[]', '[]', 1, '2024-10-28 10:41:10', '2024-10-28 10:41:10'),
(132, 'App\\Models\\Dish', 4, 'af774a64-dd10-4c02-acf7-61f742280b68', 'images', 'photo-1542528180-a1208c5169a5', 'photo-1542528180-a1208c5169a5.jpeg', 'image/jpeg', 'public', 'public', 14255, '[]', '[]', '[]', '[]', 3, '2024-10-28 10:41:10', '2024-10-28 10:41:10'),
(131, 'App\\Models\\Dish', 4, '8613ef87-6ddc-4be2-ad60-7fc15fe611e3', 'images', 'photo-1464093515883-ec948246accb', 'photo-1464093515883-ec948246accb.jpeg', 'image/jpeg', 'public', 'public', 18452, '[]', '[]', '[]', '[]', 2, '2024-10-28 10:41:09', '2024-10-28 10:41:09'),
(130, 'App\\Models\\Dish', 4, '6f72b29f-0218-46db-82e8-f124e88d5f65', 'images', 'photo-1517244683847-7456b63c5969', 'photo-1517244683847-7456b63c5969.jpeg', 'image/jpeg', 'public', 'public', 40147, '[]', '[]', '[]', '[]', 1, '2024-10-28 10:41:08', '2024-10-28 10:41:08'),
(129, 'App\\Models\\Dish', 3, 'c1ad2984-db86-401e-9b34-79e526fc11e9', 'images', 'photo-1542528180-a1208c5169a5', 'photo-1542528180-a1208c5169a5.jpeg', 'image/jpeg', 'public', 'public', 14255, '[]', '[]', '[]', '[]', 3, '2024-10-28 10:41:07', '2024-10-28 10:41:07'),
(128, 'App\\Models\\Dish', 3, '75b3c575-3078-4b4c-a877-2e0754ec6cfa', 'images', 'photo-1464093515883-ec948246accb', 'photo-1464093515883-ec948246accb.jpeg', 'image/jpeg', 'public', 'public', 18452, '[]', '[]', '[]', '[]', 2, '2024-10-28 10:41:07', '2024-10-28 10:41:07'),
(127, 'App\\Models\\Dish', 3, 'f2e794ad-936a-4643-985d-f51f39c658a1', 'images', 'photo-1517244683847-7456b63c5969', 'photo-1517244683847-7456b63c5969.jpeg', 'image/jpeg', 'public', 'public', 40147, '[]', '[]', '[]', '[]', 1, '2024-10-28 10:41:06', '2024-10-28 10:41:06'),
(126, 'App\\Models\\Dish', 2, '2d0f1c74-fb56-418a-938c-3098cafd9175', 'images', 'photo-1542528180-a1208c5169a5', 'photo-1542528180-a1208c5169a5.jpeg', 'image/jpeg', 'public', 'public', 14255, '[]', '[]', '[]', '[]', 3, '2024-10-28 10:41:05', '2024-10-28 10:41:05'),
(125, 'App\\Models\\Dish', 2, '96c08664-7eb9-469f-8f3d-930e9d36da2f', 'images', 'photo-1464093515883-ec948246accb', 'photo-1464093515883-ec948246accb.jpeg', 'image/jpeg', 'public', 'public', 18452, '[]', '[]', '[]', '[]', 2, '2024-10-28 10:41:04', '2024-10-28 10:41:04'),
(124, 'App\\Models\\Dish', 2, 'ee18e4bf-5010-44dd-9abb-0b5f65e89438', 'images', 'photo-1517244683847-7456b63c5969', 'photo-1517244683847-7456b63c5969.jpeg', 'image/jpeg', 'public', 'public', 40147, '[]', '[]', '[]', '[]', 1, '2024-10-28 10:41:04', '2024-10-28 10:41:04'),
(123, 'App\\Models\\Dish', 1, '5cfb0483-59ac-4763-9557-a26cc98fc50a', 'images', 'photo-1542528180-a1208c5169a5', 'photo-1542528180-a1208c5169a5.jpeg', 'image/jpeg', 'public', 'public', 14255, '[]', '[]', '[]', '[]', 3, '2024-10-28 10:41:03', '2024-10-28 10:41:03'),
(122, 'App\\Models\\Dish', 1, '5cd7d44d-4952-4501-8046-05fd28079a8e', 'images', 'photo-1464093515883-ec948246accb', 'photo-1464093515883-ec948246accb.jpeg', 'image/jpeg', 'public', 'public', 18452, '[]', '[]', '[]', '[]', 2, '2024-10-28 10:41:02', '2024-10-28 10:41:02'),
(121, 'App\\Models\\Dish', 1, '2d664b51-a27c-441e-8ca4-644ff8e6ede6', 'images', 'photo-1517244683847-7456b63c5969', 'photo-1517244683847-7456b63c5969.jpeg', 'image/jpeg', 'public', 'public', 40147, '[]', '[]', '[]', '[]', 1, '2024-10-28 10:41:01', '2024-10-28 10:41:01'),
(120, 'App\\Models\\Restaurant', 12, 'bd8e6d55-e89b-4e55-8ad1-01596833c62c', 'images', 'photo-1521017432531-fbd92d768814', 'photo-1521017432531-fbd92d768814.jpeg', 'image/jpeg', 'public', 'public', 2860346, '[]', '[]', '[]', '[]', 2, '2024-10-28 10:41:00', '2024-10-28 10:41:00'),
(119, 'App\\Models\\Restaurant', 11, '32390869-99a6-4f8c-828e-c64480929799', 'images', 'photo-1517248135467-4c7edcad34c4', 'photo-1517248135467-4c7edcad34c4.jpeg', 'image/jpeg', 'public', 'public', 4713062, '[]', '[]', '[]', '[]', 2, '2024-10-28 10:40:46', '2024-10-28 10:40:46'),
(118, 'App\\Models\\Restaurant', 10, 'f00ac7f6-a0a9-494b-bbd0-28339bc916be', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 2, '2024-10-28 10:40:33', '2024-10-28 10:40:33'),
(117, 'App\\Models\\Restaurant', 9, 'e57d9238-d7e9-4729-b3b8-540b88ad6d7e', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 2, '2024-10-28 10:40:30', '2024-10-28 10:40:30'),
(116, 'App\\Models\\Restaurant', 8, 'fd5014cf-eeed-46c1-859e-91fb6f7fcc03', 'images', 'photo-1517248135467-4c7edcad34c4', 'photo-1517248135467-4c7edcad34c4.jpeg', 'image/jpeg', 'public', 'public', 4713062, '[]', '[]', '[]', '[]', 2, '2024-10-28 10:40:28', '2024-10-28 10:40:28'),
(115, 'App\\Models\\Restaurant', 7, '5b6e34c1-88db-41f3-90bc-079e8349392b', 'images', 'photo-1517248135467-4c7edcad34c4', 'photo-1517248135467-4c7edcad34c4.jpeg', 'image/jpeg', 'public', 'public', 4713062, '[]', '[]', '[]', '[]', 2, '2024-10-28 10:40:17', '2024-10-28 10:40:17'),
(114, 'App\\Models\\Restaurant', 6, '581a3fb4-5d4e-4a8e-ad7f-97d1107f4fbe', 'images', 'photo-1521017432531-fbd92d768814', 'photo-1521017432531-fbd92d768814.jpeg', 'image/jpeg', 'public', 'public', 2860346, '[]', '[]', '[]', '[]', 2, '2024-10-28 10:39:59', '2024-10-28 10:39:59'),
(113, 'App\\Models\\Restaurant', 5, 'db365778-496f-432e-a8c1-59124afcc84f', 'images', 'photo-1522336572468-97b06e8ef143', 'photo-1522336572468-97b06e8ef143.jpeg', 'image/jpeg', 'public', 'public', 2323412, '[]', '[]', '[]', '[]', 2, '2024-10-28 10:39:48', '2024-10-28 10:39:48'),
(112, 'App\\Models\\Restaurant', 4, 'd18d8bd7-2991-4899-98a5-d7ff030dcb7d', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 2, '2024-10-28 10:39:42', '2024-10-28 10:39:42'),
(111, 'App\\Models\\Restaurant', 3, '355878f6-affb-4c6a-a89b-5557dc839f61', 'images', 'photo-1522336572468-97b06e8ef143', 'photo-1522336572468-97b06e8ef143.jpeg', 'image/jpeg', 'public', 'public', 2323412, '[]', '[]', '[]', '[]', 2, '2024-10-28 10:39:39', '2024-10-28 10:39:39'),
(109, 'App\\Models\\Restaurant', 1, 'e6dfc505-0e5b-4740-98d2-a82026cb8094', 'images', 'photo-1521017432531-fbd92d768814', 'photo-1521017432531-fbd92d768814.jpeg', 'image/jpeg', 'public', 'public', 2860346, '[]', '[]', '[]', '[]', 2, '2024-10-28 10:26:30', '2024-10-28 10:26:30'),
(110, 'App\\Models\\Restaurant', 2, '5dc95502-b199-4ec5-8574-f7b49437fdc7', 'images', 'photo-1508006728353-6ecef00dcbb8', 'photo-1508006728353-6ecef00dcbb8.jpeg', 'image/jpeg', 'public', 'public', 1105288, '[]', '[]', '[]', '[]', 2, '2024-10-28 10:26:40', '2024-10-28 10:26:40'),
(138, 'App\\Models\\Dish', 6, '3d128a2e-9845-46e4-bec0-a46364ce660f', 'images', 'photo-1542528180-a1208c5169a5', 'photo-1542528180-a1208c5169a5.jpeg', 'image/jpeg', 'public', 'public', 14255, '[]', '[]', '[]', '[]', 3, '2024-10-28 10:41:15', '2024-10-28 10:41:15'),
(139, 'App\\Models\\Dish', 7, 'de761a24-1845-448f-9203-cb3db14ad14e', 'images', 'photo-1517244683847-7456b63c5969', 'photo-1517244683847-7456b63c5969.jpeg', 'image/jpeg', 'public', 'public', 40147, '[]', '[]', '[]', '[]', 1, '2024-10-28 10:41:16', '2024-10-28 10:41:16'),
(140, 'App\\Models\\Dish', 7, '1c96c2ad-2100-4549-8e0b-4e4cb8382f2f', 'images', 'photo-1464093515883-ec948246accb', 'photo-1464093515883-ec948246accb.jpeg', 'image/jpeg', 'public', 'public', 18452, '[]', '[]', '[]', '[]', 2, '2024-10-28 10:41:17', '2024-10-28 10:41:17'),
(141, 'App\\Models\\Dish', 7, 'b9055d19-af4b-4c33-b737-a075b4ea307c', 'images', 'photo-1542528180-a1208c5169a5', 'photo-1542528180-a1208c5169a5.jpeg', 'image/jpeg', 'public', 'public', 14255, '[]', '[]', '[]', '[]', 3, '2024-10-28 10:41:18', '2024-10-28 10:41:18'),
(142, 'App\\Models\\Dish', 8, 'c11e9701-c12f-46ef-a5d0-fc36f8eee2b7', 'images', 'photo-1517244683847-7456b63c5969', 'photo-1517244683847-7456b63c5969.jpeg', 'image/jpeg', 'public', 'public', 40147, '[]', '[]', '[]', '[]', 1, '2024-10-28 10:41:18', '2024-10-28 10:41:18'),
(143, 'App\\Models\\Dish', 8, 'b68c340f-06cb-452c-8659-2f3bc8beafbb', 'images', 'photo-1464093515883-ec948246accb', 'photo-1464093515883-ec948246accb.jpeg', 'image/jpeg', 'public', 'public', 18452, '[]', '[]', '[]', '[]', 2, '2024-10-28 10:41:19', '2024-10-28 10:41:19'),
(144, 'App\\Models\\Dish', 8, 'd179f3fc-c063-4e7f-960d-411be5bbef0b', 'images', 'photo-1542528180-a1208c5169a5', 'photo-1542528180-a1208c5169a5.jpeg', 'image/jpeg', 'public', 'public', 14255, '[]', '[]', '[]', '[]', 3, '2024-10-28 10:41:20', '2024-10-28 10:41:20'),
(145, 'App\\Models\\Dish', 9, '08de1948-9937-4d24-a31c-3de898562654', 'images', 'photo-1517244683847-7456b63c5969', 'photo-1517244683847-7456b63c5969.jpeg', 'image/jpeg', 'public', 'public', 40147, '[]', '[]', '[]', '[]', 1, '2024-10-28 10:41:21', '2024-10-28 10:41:21'),
(146, 'App\\Models\\Dish', 9, 'cbad2b18-1849-4837-a200-d1883de3f283', 'images', 'photo-1464093515883-ec948246accb', 'photo-1464093515883-ec948246accb.jpeg', 'image/jpeg', 'public', 'public', 18452, '[]', '[]', '[]', '[]', 2, '2024-10-28 10:41:22', '2024-10-28 10:41:22'),
(147, 'App\\Models\\Dish', 9, 'ed0385dc-5022-4d45-8592-a52fb6177d78', 'images', 'photo-1542528180-a1208c5169a5', 'photo-1542528180-a1208c5169a5.jpeg', 'image/jpeg', 'public', 'public', 14255, '[]', '[]', '[]', '[]', 3, '2024-10-28 10:41:23', '2024-10-28 10:41:23'),
(148, 'App\\Models\\Dish', 10, '40552751-371e-437e-8aad-077e439987fb', 'images', 'photo-1517244683847-7456b63c5969', 'photo-1517244683847-7456b63c5969.jpeg', 'image/jpeg', 'public', 'public', 40147, '[]', '[]', '[]', '[]', 1, '2024-10-28 10:41:24', '2024-10-28 10:41:24'),
(149, 'App\\Models\\Dish', 10, 'bd2bf492-d549-4ca6-bc1c-6d1cfdbe325b', 'images', 'photo-1464093515883-ec948246accb', 'photo-1464093515883-ec948246accb.jpeg', 'image/jpeg', 'public', 'public', 18452, '[]', '[]', '[]', '[]', 2, '2024-10-28 10:41:24', '2024-10-28 10:41:24'),
(150, 'App\\Models\\Dish', 10, '729279ad-2f69-4bab-8e98-77b4aa2f1c6f', 'images', 'photo-1542528180-a1208c5169a5', 'photo-1542528180-a1208c5169a5.jpeg', 'image/jpeg', 'public', 'public', 14255, '[]', '[]', '[]', '[]', 3, '2024-10-28 10:41:25', '2024-10-28 10:41:25');

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
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(59, '2024_10_12_072939_create_preference_category_user_table', 3),
(62, '2024_10_28_151711_create_amenities_table', 6),
(63, '2024_11_11_163017_add_full_name_and_date_of_birth_to_users_table', 7),
(64, '2024_11_11_171418_create_notifications_table', 8),
(65, '2024_11_18_171301_create_friends_table', 9),
(66, '2024_11_18_171309_create_followers_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(11, 'App\\Models\\User', 1, 'authToken', '19a728657008e14785c942cb4005ef909dbc6cdf66a680b87fad62decca47c13', '[\"*\"]', '2024-11-18 12:27:14', NULL, '2024-10-24 07:24:50', '2024-11-18 12:27:14'),
(12, 'App\\Models\\User', 4, 'authToken', 'd8ad7891c300b78867d3f03b069ab0b6b8a06f6d1d599255fca58b7b03f86f4c', '[\"*\"]', NULL, NULL, '2024-11-18 12:29:22', '2024-11-18 12:29:22'),
(13, 'App\\Models\\User', 4, 'authToken', 'f7816bb7b2545df14838b45161458e8b27d41e79446751e6f0b334f92be22d1d', '[\"*\"]', '2024-11-18 12:43:58', NULL, '2024-11-18 12:30:11', '2024-11-18 12:43:58');

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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `location`, `latitude`, `longitude`, `distance`, `restaurant_rating`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\": \"Jacobi, Jacobs and Braun\", \"es\": \"Koch-Upton\"}', '\"{\\\"address\\\":\\\"51825 Baumbach Land Suite 240\\\\nSouth Krista, NJ 52170\\\",\\\"city\\\":\\\"East Kirsten\\\",\\\"country\\\":\\\"Timor-Leste\\\"}\"', '-14.58010300', '-6.93838600', NULL, '3.00', '2024-10-28 10:26:14', '2024-10-28 10:26:14', NULL),
(2, '{\"en\": \"Corwin Group\", \"es\": \"McLaughlin Ltd\"}', '\"{\\\"address\\\":\\\"30521 Kristy Field\\\\nMaximilianstad, UT 08775\\\",\\\"city\\\":\\\"East Jazlynstad\\\",\\\"country\\\":\\\"Netherlands Antilles\\\"}\"', '13.63878200', '-90.70785500', NULL, '3.00', '2024-10-28 10:26:14', '2024-10-28 10:26:14', NULL),
(3, '{\"en\": \"Erdman, Simonis and Kirlin\", \"es\": \"Veum-Murazik\"}', '\"{\\\"address\\\":\\\"6623 Howe Trace\\\\nEast Merltown, CO 41914\\\",\\\"city\\\":\\\"Lake Marian\\\",\\\"country\\\":\\\"Nicaragua\\\"}\"', '63.73476700', '162.63488100', NULL, '3.00', '2024-10-28 10:39:22', '2024-10-28 10:39:22', NULL),
(4, '{\"en\": \"Lind and Sons\", \"es\": \"Jacobi Group\"}', '\"{\\\"address\\\":\\\"5753 Keara Forest Apt. 354\\\\nLake Veronicaland, PA 88354\\\",\\\"city\\\":\\\"Port Alfreda\\\",\\\"country\\\":\\\"United States of America\\\"}\"', '8.57723000', '-65.23011000', NULL, '3.00', '2024-10-28 10:39:39', '2024-10-28 10:39:39', NULL),
(5, '{\"en\": \"Schmeler, Nitzsche and Cronin\", \"es\": \"Kunde-Huel\"}', '\"{\\\"address\\\":\\\"84963 Brody Ports\\\\nLake Trever, VT 52744\\\",\\\"city\\\":\\\"Port Dominichaven\\\",\\\"country\\\":\\\"India\\\"}\"', '-73.92310800', '122.27945600', NULL, '2.00', '2024-10-28 10:39:42', '2024-10-28 10:39:42', NULL),
(6, '{\"en\": \"Windler, Windler and Kerluke\", \"es\": \"Dickinson, Leffler and Schaden\"}', '\"{\\\"address\\\":\\\"85327 Jerry Crest Apt. 627\\\\nBaileeberg, NE 70120\\\",\\\"city\\\":\\\"Pfannerstillstad\\\",\\\"country\\\":\\\"Botswana\\\"}\"', '18.15208300', '-145.30736600', NULL, '2.00', '2024-10-28 10:39:48', '2024-10-28 10:39:48', NULL),
(7, '{\"en\": \"Corwin, Renner and Morissette\", \"es\": \"Considine Inc\"}', '\"{\\\"address\\\":\\\"562 Maximo Meadows Suite 875\\\\nTatyanahaven, NV 14196\\\",\\\"city\\\":\\\"North Idaborough\\\",\\\"country\\\":\\\"Gabon\\\"}\"', '30.35710100', '-56.68532800', NULL, '2.00', '2024-10-28 10:39:59', '2024-10-28 10:39:59', NULL),
(8, '{\"en\": \"Ebert-Mueller\", \"es\": \"Gerlach, Moen and Paucek\"}', '\"{\\\"address\\\":\\\"6267 Annamae Crossing\\\\nNew Aditya, AL 63052\\\",\\\"city\\\":\\\"Port Sonny\\\",\\\"country\\\":\\\"Dominica\\\"}\"', '9.89614800', '20.47079400', NULL, '3.00', '2024-10-28 10:40:17', '2024-10-28 10:40:17', NULL),
(9, '{\"en\": \"Rutherford-Smith\", \"es\": \"Brakus-Schinner\"}', '\"{\\\"address\\\":\\\"594 Bartell Points\\\\nEbonyhaven, DE 62056-7033\\\",\\\"city\\\":\\\"Haagshire\\\",\\\"country\\\":\\\"Syrian Arab Republic\\\"}\"', '51.75421200', '-174.05437400', NULL, '3.00', '2024-10-28 10:40:28', '2024-10-28 10:40:28', NULL),
(10, '{\"en\": \"Hyatt-McDermott\", \"es\": \"Durgan and Sons\"}', '\"{\\\"address\\\":\\\"91390 Nadia Club Apt. 450\\\\nSouth Christineberg, TX 37699-2097\\\",\\\"city\\\":\\\"New Eleanore\\\",\\\"country\\\":\\\"United Kingdom\\\"}\"', '-37.47659800', '174.63443100', NULL, '3.00', '2024-10-28 10:40:30', '2024-10-28 10:40:30', NULL),
(11, '{\"en\": \"Crona-Hudson\", \"es\": \"Nitzsche, Lakin and Kulas\"}', '\"{\\\"address\\\":\\\"690 Juana Field\\\\nGottliebchester, NY 21811-8023\\\",\\\"city\\\":\\\"South Brainburgh\\\",\\\"country\\\":\\\"Denmark\\\"}\"', '46.33262400', '-64.25223900', NULL, '2.00', '2024-10-28 10:40:33', '2024-10-28 10:40:33', NULL),
(12, '{\"en\": \"Effertz and Sons\", \"es\": \"Spinka, Gleason and Murphy\"}', '\"{\\\"address\\\":\\\"17962 Dashawn Circle Suite 320\\\\nJacklynberg, MI 81845-9212\\\",\\\"city\\\":\\\"Lake Leanna\\\",\\\"country\\\":\\\"Namibia\\\"}\"', '-54.86313000', '141.35923400', NULL, '2.00', '2024-10-28 10:40:46', '2024-10-28 10:40:46', NULL);

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
  `date_of_birth` date DEFAULT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `phone_number`, `password`, `address`, `date_of_birth`, `restaurant_id`, `remember_token`, `active`, `lat`, `long`, `radius`, `sms_code`, `sms_code_expired_at`, `email_code`, `email_code_expired_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'customer', 'john.doe@example.com', '2024-08-30 22:05:26', '+1234567890', '$2y$12$06YvBBrQS8e9w.ON0CPFQueFc2aHqyENrLN6rcxMvwUbSF7BhyZxy', '123 Main Street, Springfield', '1990-05-15', NULL, '7DVWbmm3LE', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-30 22:05:27', '2024-11-11 12:11:39'),
(2, 'John Doe', 'johndoe', 'johndoe@example.com', NULL, '1534567890', '$2y$12$0ZF/eWILyXfLFZjATEWAGeGJdmIkxwq6/hrDiowWm2XeOdFappip2', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-30 22:21:40', '2024-08-30 22:21:40'),
(3, 'John Doe', 'johndoee', 'johndoee@example.com', NULL, '1534567810', '$2y$12$06R6VPvzXh4lVTNDkuIxJeZOcIIML4maOEOMG8E5iDPVmfyfSWBPa', '123 Main Street, Springfield, USA', NULL, NULL, NULL, 1, '232', '232', '2', NULL, NULL, NULL, NULL, NULL, '2024-10-10 12:12:41', '2024-10-10 12:12:41'),
(4, 'John Doe', 'john3doee', 'johndo3ee@example.com', NULL, '1234567810', '$2y$12$QKJkR3CyrtAMnQvcYYlqmOTWGiDUsfnvZI/m0nxpR8OUcZr65sPva', '123 Main Street, Springfield, USA', NULL, NULL, NULL, 1, '232', '232', '2', NULL, NULL, NULL, NULL, NULL, '2024-11-18 12:29:22', '2024-11-18 12:29:22');

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
