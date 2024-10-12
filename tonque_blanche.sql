-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 12, 2024 at 03:27 AM
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '{\"en\": \"Country\", \"es\": \"País\", \"fr\": \"Pays\"}', '{\"en\": \"Select your country to receive dishes from your region.\", \"es\": \"Seleccione su país para recibir platos de su región.\", \"fr\": \"Sélectionnez votre pays pour recevoir des plats de votre région.\"}', 1, NULL, '2024-10-12 02:40:27', '2024-10-12 02:40:27'),
(2, '{\"en\": \"Ingredients\", \"es\": \"Ingredientes\", \"fr\": \"Ingrédients\"}', '{\"en\": \"Choose the ingredients you prefer in your dishes.\", \"es\": \"Elija los ingredientes que prefiere en sus platos.\", \"fr\": \"Choisissez les ingrédients que vous préférez dans vos plats.\"}', 1, NULL, '2024-10-12 02:40:27', '2024-10-12 02:40:27'),
(3, '{\"en\": \"Drinks\", \"es\": \"Bebidas\", \"fr\": \"Boissons\"}', '{\"en\": \"Select your preferred drinks.\", \"es\": \"Seleccione sus bebidas preferidas.\", \"fr\": \"Sélectionnez vos boissons préférées.\"}', 1, NULL, '2024-10-12 02:40:27', '2024-10-12 02:40:27'),
(4, '{\"en\": \"Dessert\", \"es\": \"Postre\", \"fr\": \"Dessert\"}', '{\"en\": \"Choose your favorite type of dessert.\", \"es\": \"Elija su tipo de postre favorito.\", \"fr\": \"Choisissez votre type de dessert préféré.\"}', 1, NULL, '2024-10-12 02:40:27', '2024-10-12 02:40:27'),
(5, '{\"en\": \"Suggestions\", \"es\": \"Sugerencias\", \"fr\": \"Suggestions\"}', '{\"en\": \"Receive dish suggestions based on your preferences.\", \"es\": \"Reciba sugerencias de platos basadas en sus preferencias.\", \"fr\": \"Recevez des suggestions de plats basées sur vos préférences.\"}', 1, NULL, '2024-10-12 02:40:27', '2024-10-12 02:40:27');

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
  `rating` decimal(3,2) DEFAULT NULL,
  `distance` decimal(5,2) DEFAULT NULL,
  `is_suggested` tinyint(1) NOT NULL DEFAULT '0',
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  `is_offer` tinyint(1) NOT NULL DEFAULT '0',
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dishes_restaurant_id_foreign` (`restaurant_id`),
  KEY `dishes_category_id_foreign` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(11, '{\"en\": \"Asian\", \"es\": \"Asiático\", \"fr\": \"Asiatique\"}', NULL, '2024-10-12 02:45:39', '2024-10-12 02:45:39');

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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(16, 'App\\Models\\Restaurant', 2, '9af98a26-1db7-46e2-888e-d6a999bcfd27', 'images', 'photo-1517248135467-4c7edcad34c4', 'photo-1517248135467-4c7edcad34c4.jpeg', 'image/jpeg', 'public', 'public', 4713062, '[]', '[]', '[]', '[]', 1, '2024-08-30 22:05:26', '2024-08-30 22:05:26'),
(15, 'App\\Models\\Restaurant', 1, '48fd7a1b-7ca3-473c-b189-76f6e29343e4', 'images', 'photo-1522336572468-97b06e8ef143', 'photo-1522336572468-97b06e8ef143.jpeg', 'image/jpeg', 'public', 'public', 2323412, '[]', '[]', '[]', '[]', 1, '2024-08-30 22:05:23', '2024-08-30 22:05:23');

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
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(44, '2024_08_30_141152_create_dishes_table', 1),
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(10, 'App\\Models\\User', 1, 'authToken', '3e6668a857ad04d5f4633350737ba6126ac05e741a693b4da6e991ee6150c827', '[\"*\"]', '2024-10-12 02:58:08', NULL, '2024-10-10 12:16:52', '2024-10-12 02:58:08');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `location`, `latitude`, `longitude`, `distance`, `restaurant_rating`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\": \"Zboncak, Parker and Yost\", \"es\": \"Abshire-Mohr\"}', '{\"address\":\"2511 Cecil Glens Suite 293\\nNew Erickville, DC 54252\",\"city\":\"Gennaroshire\",\"country\":\"Belize\"}', '-19.39579700', '50.46313800', NULL, '2.00', '2024-08-30 22:05:06', '2024-08-30 22:05:06', NULL),
(2, '{\"en\": \"Olson-Schneider\", \"es\": \"Collier, Kihn and Hintz\"}', '{\"address\":\"2008 Anika Loop Suite 664\\nEast Dylan, NM 47487-2792\",\"city\":\"East Tatumstad\",\"country\":\"Indonesia\"}', '-50.65598600', '128.89376400', NULL, '2.00', '2024-08-30 22:05:06', '2024-08-30 22:05:06', NULL);

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
