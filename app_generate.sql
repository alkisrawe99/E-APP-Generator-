-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 22, 2022 at 12:23 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app_generate`
--

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
CREATE TABLE IF NOT EXISTS `application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `appName` text NOT NULL,
  `companyName` text NOT NULL,
  `phone` int(11) NOT NULL,
  `location` text NOT NULL,
  `domain` text,
  `logo` text NOT NULL,
  `description` text NOT NULL,
  `payment` text NOT NULL,
  `currency` text NOT NULL,
  `categories` int(5) NOT NULL,
  `barsPosition` text NOT NULL,
  `productView` text NOT NULL,
  `productSlider` text NOT NULL,
  `productSaleSlider` text NOT NULL,
  `productIconView` text NOT NULL,
  `topbarColor` text NOT NULL,
  `buttonsColor` text NOT NULL,
  `textColor` text NOT NULL,
  `footerColor` text NOT NULL,
  `created_at` timestamp(6) NOT NULL,
  `updated_at` timestamp(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `application`
--

INSERT INTO `application` (`id`, `id_user`, `status`, `appName`, `companyName`, `phone`, `location`, `domain`, `logo`, `description`, `payment`, `currency`, `categories`, `barsPosition`, `productView`, `productSlider`, `productSaleSlider`, `productIconView`, `topbarColor`, `buttonsColor`, `textColor`, `footerColor`, `created_at`, `updated_at`) VALUES
(6, 22, 0, 'seniorr', 'aiu', 994591488, 'damascus', NULL, '896269374.png', 'this is test', 'yes', 'eur', 4, 'top', 'vertical', 'yes', 'yes', 'productIconSquare', '#d62424', '#977272', '#2bab45', '#328f89', '2022-06-25 07:52:02.000000', '2022-06-25 07:52:02.000000');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
CREATE TABLE IF NOT EXISTS `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_app` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2021_12_25_233458_s', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('87a284237fd28a110505d5925a67d7ebdbdd45aa3d2fa51db475a8396e63266ff98b7a45ad091de1', 3, 1, 'MyApp', '[]', 0, '2022-06-20 12:08:12', '2022-06-20 12:08:12', '2023-06-20 15:08:12'),
('edaa9f605d73c2783c7526b6e0044b97673a1336101fb1f444fa9a1a5918777d251a472feb655e93', 4, 1, 'MyApp', '[]', 0, '2022-06-20 12:08:23', '2022-06-20 12:08:23', '2023-06-20 15:08:23'),
('78f90904a02e24c790ed8ec336c717bf8072c88411861ea32fedaa662a17423626049f71abceb1c0', 5, 1, 'MyApp', '[]', 0, '2022-06-20 12:21:56', '2022-06-20 12:21:56', '2023-06-20 15:21:56'),
('ce1d98d635fcfa28c6e94176551e769048e5feee50fac3ba62fdd96763e7e19e258f8a18693efe83', 6, 1, 'MyApp', '[]', 0, '2022-06-20 12:27:54', '2022-06-20 12:27:54', '2023-06-20 15:27:54'),
('46ffe885575a35ed9dd74c1d3a9338a1017d2002633dfb402bf8e7b46e16899bc641e6397725a1cc', 7, 1, 'MyApp', '[]', 0, '2022-06-20 13:00:54', '2022-06-20 13:00:54', '2023-06-20 16:00:54'),
('f3e1cfc597922e0fac29c72f05f6526f82449b389330d1d9a4d66491b7e7cfaeaa7c47d89ec9a343', 8, 1, 'MyApp', '[]', 0, '2022-06-20 13:05:52', '2022-06-20 13:05:52', '2023-06-20 16:05:52'),
('6fd72474035a93d63465e61ac7e6d7894b545273d37253e725fa5a7aedf01981a4e0690f82ab7bbe', 9, 1, 'MyApp', '[]', 0, '2022-06-20 13:09:16', '2022-06-20 13:09:16', '2023-06-20 16:09:16'),
('0896357a2ea72c33808d7860b1145de47ce1db09bd7cf2f4dd9ae24248429feeb16498782e9fadf1', 10, 1, 'MyApp', '[]', 0, '2022-06-20 13:18:15', '2022-06-20 13:18:15', '2023-06-20 16:18:15'),
('cf423b0f1418efa733018e7df1fd2c944553514cbbb24f6c8caf037d32c8e4cbe9502258a9dcbeeb', 11, 1, 'MyApp', '[]', 0, '2022-06-20 13:22:12', '2022-06-20 13:22:12', '2023-06-20 16:22:12'),
('96a2e0eabdb8215f4b4044dded2da3dc6b9b35d5108a9ef109e838b83b472562deb397fa3dcb068f', 12, 1, 'MyApp', '[]', 0, '2022-06-20 13:22:48', '2022-06-20 13:22:48', '2023-06-20 16:22:48'),
('d590da701fd9380f0a0691cd62520f8cda6f30c7b5568b0b2567d31f00eab46f8b5317c600fe2bd8', 13, 1, 'MyApp', '[]', 0, '2022-06-20 13:23:24', '2022-06-20 13:23:24', '2023-06-20 16:23:24'),
('db2274df6684f65635715ec02b96db4d1570bb5b5e1e6d539a9d98ad2550b23f54b55e81dc8152bc', 14, 1, 'MyApp', '[]', 0, '2022-06-20 13:34:17', '2022-06-20 13:34:17', '2023-06-20 16:34:17'),
('880f2eff59fedefda71592b1839b10320e180db08275b4f466ef142969e78249b44be535651d66cf', 15, 1, 'MyApp', '[]', 0, '2022-06-20 13:38:01', '2022-06-20 13:38:01', '2023-06-20 16:38:01'),
('30035d993ffb75eb3422f79981d6aa20a5b6f625197aeae58883af250704c5418132150e40c6916d', 16, 1, 'MyApp', '[]', 0, '2022-06-20 14:31:21', '2022-06-20 14:31:21', '2023-06-20 17:31:21'),
('49a47f3f724c8f176a3fb3883a308c117545a14f32ac9a8533272e3a6764a4291e3cb7e452f0cb92', 17, 1, 'MyApp', '[]', 0, '2022-06-20 15:46:48', '2022-06-20 15:46:48', '2023-06-20 18:46:48'),
('136dcd0e42729f479c8d0b9692285e48f79f14d239c4f79b23400f0a93cfcd92ee5482811b149c0c', 18, 1, 'MyApp', '[]', 0, '2022-06-20 16:30:23', '2022-06-20 16:30:23', '2023-06-20 19:30:23'),
('50f4777011ab22b728dbac7b4465a4523b39f44aaa3312d3d601a5a137145498a76ffdbb85867fe7', 19, 1, 'MyApp', '[]', 0, '2022-06-25 06:07:04', '2022-06-25 06:07:04', '2023-06-25 09:07:04'),
('e286e8edc11ea1cebb39e4d085f59fa1a812169badd677f03218a2448f0e9a5dcebd7db22ca70289', 20, 1, 'MyApp', '[]', 0, '2022-06-25 06:28:18', '2022-06-25 06:28:18', '2023-06-25 09:28:18'),
('af020b7d6cedfe0ea67d9c453a02714a110d2c1e26c6d6da16315067c171340b63fb3bdac627ef78', 21, 1, 'MyApp', '[]', 0, '2022-06-25 06:29:47', '2022-06-25 06:29:47', '2023-06-25 09:29:47');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'a', '98R4xSXNokQzpojMSVXydoudbUYzBWO6Ei8LSpH8', NULL, 'http://localhost', 1, 0, 0, '2022-06-20 11:58:11', '2022-06-20 11:58:11');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-06-20 11:58:11', '2022-06-20 11:58:11');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(15) NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(22, 'ahmed', 963258741, 'ahmed@gmail.com', 'asd123', NULL, '2022-07-18 16:28:02', '2022-07-21 16:28:02'),
(8, 'alaa', 125545, 'kaha@gmail.com', 'asd', NULL, '2022-06-20 13:05:52', '2022-06-20 13:05:52'),
(9, 'tarek', 9887654, 'test@hotmail.com', 'abgassem7', NULL, '2022-06-20 13:09:16', '2022-06-20 13:09:16'),
(17, 'Aboudy', 123123, 'Aboudy@gmail.com', '123123', NULL, '2022-06-20 15:46:47', '2022-06-20 15:46:47');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
