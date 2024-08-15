-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2024-08-14 10:15:56
-- サーバのバージョン： 10.4.32-MariaDB
-- PHP のバージョン: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `laravel_nagoyameshi`
--


-- --------------------------------------------------------

--
-- テーブルの構造 `administrators`
--

CREATE TABLE `administrators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `administrators`
--

INSERT INTO `administrators` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'nagoyameshi', 'admin@example.com', NULL, '$2y$12$4Q0qxYHc9ZTsnTWqp3OGWefY2OxcevBy37oOSri1H.jRiGRtzJQau', NULL, '2024-07-24 01:14:44', '2024-07-24 01:14:44'),
(3, 'Administrator', 'Administrator@example.com', NULL, '$2y$12$a4GCCSOwnTYDMh.Z3i9aleuyrt84jz0JbvNbMAIKkPdGB6wE.zJhW', NULL, '2024-08-14 06:07:43', '2024-08-14 06:07:43');

-- --------------------------------------------------------

--
-- テーブルの構造 `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '居酒屋', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(2, '焼肉', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(3, '寿司', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(4, 'ラーメン', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(5, '定食', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(6, 'カレー', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(7, '喫茶店', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(8, '中華料理', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(9, 'イタリア料理', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(10, 'フランス料理', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(11, 'スペイン料理', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(12, '韓国料理', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(13, 'タイ料理', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(14, '海鮮料理', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(15, 'ステーキ', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(16, 'ハンバーグ', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(17, 'ハンバーガー', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(18, 'そば', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(19, 'うどん', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(20, 'お好み焼き', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(21, 'たこ焼き', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(22, '鍋料理', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(23, 'バー', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(24, 'パン', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(25, 'スイーツ', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(26, '和食', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(27, 'おでん', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(28, '焼き鳥', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(29, 'すき焼き', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(30, 'しゃぶしゃぶ', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(31, '天ぷら', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(32, '揚げ物', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(33, '丼物', '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(34, '鉄板焼き', '2023-12-31 15:00:00', '2023-12-31 15:00:00');

-- --------------------------------------------------------

--
-- テーブルの構造 `category_shop`
--

CREATE TABLE `category_shop` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `category_shop`
--

INSERT INTO `category_shop` (`id`, `shop_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 1, 17, '2021-12-31 15:00:00', '2021-12-31 15:00:00'),
(2, 2, 2, '2022-01-01 15:00:00', '2022-01-01 15:00:00'),
(3, 3, 26, '2022-01-02 15:00:00', '2022-01-02 15:00:00'),
(4, 4, 4, '2022-01-03 15:00:00', '2022-01-03 15:00:00'),
(5, 5, 2, '2022-01-04 15:00:00', '2022-01-04 15:00:00'),
(6, 6, 2, '2022-01-05 15:00:00', '2022-01-05 15:00:00'),
(7, 7, 26, '2022-01-06 15:00:00', '2022-01-06 15:00:00'),
(8, 8, 17, '2022-01-07 15:00:00', '2022-01-07 15:00:00'),
(9, 9, 2, '2022-01-08 15:00:00', '2022-01-08 15:00:00'),
(10, 10, 28, '2022-01-09 15:00:00', '2022-01-09 15:00:00'),
(11, 11, 2, '2022-01-10 15:00:00', '2022-01-10 15:00:00'),
(12, 12, 15, '2022-01-11 15:00:00', '2022-01-11 15:00:00'),
(13, 13, 26, '2022-01-12 15:00:00', '2022-01-12 15:00:00'),
(14, 14, 2, '2022-01-13 15:00:00', '2022-01-13 15:00:00'),
(15, 15, 26, '2022-01-14 15:00:00', '2022-01-14 15:00:00'),
(16, 16, 26, '2022-01-15 15:00:00', '2022-01-15 15:00:00'),
(17, 17, 26, '2022-01-16 15:00:00', '2022-01-16 15:00:00'),
(18, 18, 2, '2022-01-17 15:00:00', '2022-01-17 15:00:00'),
(19, 19, 28, '2022-01-18 15:00:00', '2022-01-18 15:00:00'),
(20, 20, 26, '2022-01-19 15:00:00', '2022-01-19 15:00:00'),
(21, 21, 22, '2022-01-20 15:00:00', '2022-01-20 15:00:00'),
(22, 22, 2, '2022-01-21 15:00:00', '2022-01-21 15:00:00'),
(23, 23, 10, '2022-01-22 15:00:00', '2022-01-22 15:00:00'),
(24, 24, 26, '2022-01-23 15:00:00', '2022-01-23 15:00:00'),
(25, 25, 2, '2022-01-24 15:00:00', '2022-01-24 15:00:00'),
(26, 26, 8, '2022-01-25 15:00:00', '2022-01-25 15:00:00'),
(27, 27, 15, '2022-01-26 15:00:00', '2022-01-26 15:00:00'),
(28, 28, 4, '2022-01-27 15:00:00', '2022-01-27 15:00:00'),
(29, 29, 28, '2022-01-28 15:00:00', '2022-01-28 15:00:00'),
(30, 30, 4, '2022-01-29 15:00:00', '2022-01-29 15:00:00'),
(31, 31, 4, '2022-01-30 15:00:00', '2022-01-30 15:00:00'),
(32, 32, 2, '2022-01-31 15:00:00', '2022-01-31 15:00:00'),
(33, 33, 2, '2022-02-01 15:00:00', '2022-02-01 15:00:00'),
(34, 34, 26, '2022-02-02 15:00:00', '2022-02-02 15:00:00'),
(35, 35, 18, '2022-02-03 15:00:00', '2022-02-03 15:00:00'),
(36, 36, 2, '2022-02-04 15:00:00', '2022-02-04 15:00:00'),
(37, 37, 26, '2022-02-05 15:00:00', '2022-02-05 15:00:00'),
(38, 38, 18, '2022-02-06 15:00:00', '2022-02-06 15:00:00'),
(39, 39, 26, '2022-02-07 15:00:00', '2022-02-07 15:00:00'),
(40, 40, 2, '2022-02-08 15:00:00', '2022-02-08 15:00:00'),
(41, 41, 28, '2022-02-09 15:00:00', '2022-02-09 15:00:00'),
(42, 42, 26, '2022-02-10 15:00:00', '2022-02-10 15:00:00'),
(43, 43, 26, '2022-02-11 15:00:00', '2022-02-11 15:00:00'),
(44, 44, 20, '2022-02-12 15:00:00', '2022-02-12 15:00:00'),
(45, 45, 4, '2022-02-13 15:00:00', '2022-02-13 15:00:00'),
(46, 46, 12, '2022-02-14 15:00:00', '2022-02-14 15:00:00'),
(47, 47, 28, '2022-02-15 15:00:00', '2022-02-15 15:00:00'),
(48, 48, 26, '2022-02-16 15:00:00', '2022-02-16 15:00:00'),
(49, 49, 26, '2022-02-17 15:00:00', '2022-02-17 15:00:00'),
(50, 50, 8, '2022-02-18 15:00:00', '2022-02-18 15:00:00'),
(51, 51, 34, '2022-02-19 15:00:00', '2022-02-19 15:00:00'),
(52, 52, 26, '2022-02-20 15:00:00', '2022-02-20 15:00:00'),
(53, 53, 5, '2022-02-21 15:00:00', '2022-02-21 15:00:00'),
(54, 54, 14, '2022-02-22 15:00:00', '2022-02-22 15:00:00'),
(55, 55, 4, '2022-02-23 15:00:00', '2022-02-23 15:00:00'),
(56, 56, 2, '2022-02-24 15:00:00', '2022-02-24 15:00:00'),
(57, 57, 3, '2022-02-25 15:00:00', '2022-02-25 15:00:00'),
(58, 58, 28, '2022-02-26 15:00:00', '2022-02-26 15:00:00'),
(59, 59, 26, '2022-02-27 15:00:00', '2022-02-27 15:00:00'),
(60, 60, 4, '2022-02-28 15:00:00', '2022-02-28 15:00:00'),
(61, 61, 2, '2022-03-01 15:00:00', '2022-03-01 15:00:00'),
(62, 62, 2, '2022-03-02 15:00:00', '2022-03-02 15:00:00'),
(63, 63, 2, '2022-03-03 15:00:00', '2022-03-03 15:00:00'),
(64, 64, 26, '2022-03-04 15:00:00', '2022-03-04 15:00:00'),
(65, 65, 26, '2022-03-05 15:00:00', '2022-03-05 15:00:00'),
(66, 66, 2, '2022-03-06 15:00:00', '2022-03-06 15:00:00'),
(67, 67, 32, '2022-03-07 15:00:00', '2022-03-07 15:00:00'),
(68, 68, 2, '2022-03-08 15:00:00', '2022-03-08 15:00:00'),
(69, 69, 14, '2022-03-09 15:00:00', '2022-03-09 15:00:00'),
(70, 70, 2, '2022-03-10 15:00:00', '2022-03-10 15:00:00'),
(71, 71, 4, '2022-03-11 15:00:00', '2022-03-11 15:00:00'),
(72, 72, 15, '2022-03-12 15:00:00', '2022-03-12 15:00:00'),
(73, 73, 15, '2022-03-13 15:00:00', '2022-03-13 15:00:00'),
(74, 74, 2, '2022-03-14 15:00:00', '2022-03-14 15:00:00'),
(75, 75, 26, '2022-03-15 15:00:00', '2022-03-15 15:00:00'),
(76, 76, 4, '2022-03-16 15:00:00', '2022-03-16 15:00:00'),
(77, 77, 31, '2022-03-17 15:00:00', '2022-03-17 15:00:00'),
(78, 78, 3, '2022-03-18 15:00:00', '2022-03-18 15:00:00'),
(79, 79, 2, '2022-03-19 15:00:00', '2022-03-19 15:00:00'),
(80, 80, 2, '2022-03-20 15:00:00', '2022-03-20 15:00:00'),
(81, 81, 28, '2022-03-21 15:00:00', '2022-03-21 15:00:00'),
(82, 82, 15, '2022-03-22 15:00:00', '2022-03-22 15:00:00'),
(83, 83, 2, '2022-03-23 15:00:00', '2022-03-23 15:00:00'),
(84, 84, 4, '2022-03-24 15:00:00', '2022-03-24 15:00:00'),
(85, 85, 2, '2022-03-25 15:00:00', '2022-03-25 15:00:00'),
(86, 86, 28, '2022-03-26 15:00:00', '2022-03-26 15:00:00'),
(87, 87, 26, '2022-03-27 15:00:00', '2022-03-27 15:00:00'),
(88, 88, 2, '2022-03-28 15:00:00', '2022-03-28 15:00:00'),
(89, 89, 26, '2022-03-29 15:00:00', '2022-03-29 15:00:00'),
(90, 90, 10, '2022-03-30 15:00:00', '2022-03-30 15:00:00'),
(91, 91, 28, '2022-03-31 15:00:00', '2022-03-31 15:00:00'),
(92, 92, 5, '2022-04-01 15:00:00', '2022-04-01 15:00:00'),
(93, 93, 2, '2022-04-02 15:00:00', '2022-04-02 15:00:00'),
(94, 94, 2, '2022-04-03 15:00:00', '2022-04-03 15:00:00'),
(95, 95, 2, '2022-04-04 15:00:00', '2022-04-04 15:00:00'),
(96, 96, 4, '2022-04-05 15:00:00', '2022-04-05 15:00:00'),
(97, 97, 26, '2022-04-06 15:00:00', '2022-04-06 15:00:00'),
(98, 98, 2, '2022-04-07 15:00:00', '2022-04-07 15:00:00'),
(99, 99, 28, '2022-04-08 15:00:00', '2022-04-08 15:00:00'),
(100, 100, 26, '2022-04-09 15:00:00', '2022-04-09 15:00:00');

-- --------------------------------------------------------

--
-- テーブルの構造 `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `representative` varchar(255) NOT NULL,
  `establishment_date` varchar(255) NOT NULL,
  `capital` varchar(255) NOT NULL,
  `business` varchar(255) NOT NULL,
  `number_of_employees` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `companies`
--

INSERT INTO `companies` (`id`, `name`, `postal_code`, `address`, `representative`, `establishment_date`, `capital`, `business`, `number_of_employees`, `created_at`, `updated_at`) VALUES
(1, 'NAGOYAMESHI株式会社', '1010022', '東京都千代田区神田練塀町300番地 住友不動産秋葉原駅前ビル5F', '侍 太郎', '2015年3月19日', '110,000千円', '飲食店等の情報提供サービス', '83名', '2023-12-31 15:00:00', '2023-12-31 15:00:00');

-- --------------------------------------------------------

--
-- テーブルの構造 `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) DEFAULT NULL,
  `pm_type` varchar(255) DEFAULT NULL,
  `pm_last_four` varchar(4) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `kana` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `birthday` date DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `membership` int(11) NOT NULL DEFAULT 0,
  `credit_name` varchar(255) DEFAULT NULL,
  `credit_number` varchar(16) DEFAULT NULL,
  `expiration` varchar(255) DEFAULT NULL,
  `security_code` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `members`
--

INSERT INTO `members` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`, `kana`, `postal_code`, `address`, `phone_number`, `birthday`, `occupation`, `membership`, `credit_name`, `credit_number`, `expiration`, `security_code`) VALUES
(1, '斉藤 知実', 'ryamagishi@example.com', '2024-07-24 01:15:00', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'vhL18WBQ0Z', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'コンドウ カナ', '1362880', '9224175  東京都山本市東区江古田町伊藤3-2-3', '02431-0-7664', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(2, '加藤 翼', 'ktanaka@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'uDx6JIasXt', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ミヤケ ハナコ', '8149037', '4748007  和歌山県加藤市中央区喜嶋町田辺5-7-9', '080-8134-5067', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(3, '西之園 篤司', 'tsuda.kazuya@example.org', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'Fs94WePZtB', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'エコダ マイ', '4483754', '2765675  鳥取県村山市北区山岸町西之園8-6-7 ハイツ中島106号', '080-8480-7412', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(4, '青山 和也', 'youichi81@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'rjQCeRv6qP', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'キムラ ミカコ', '3549224', '5261898  千葉県大垣市西区山口町石田8-9-3', '01-5595-0952', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(5, '笹田 里佳', 'yuta37@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'ln5QdpxoKH', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'キジマ ヤスヒロ', '6418079', '1192985  新潟県村山市南区渚町桐山7-1-2', '008-065-6800', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(6, '小林 太一', 'yoko77@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'EISdWJl3y6', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'イシダ ヨウスケ', '9302061', '6225789  長野県宇野市西区近藤町斉藤6-4-4', '00031-9-7655', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(7, '桐山 浩', 'asuka.murayama@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', '529qI6g8pM', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'コイズミ リョウスケ', '5345961', '7541811  静岡県原田市西区鈴木町渡辺9-3-10', '090-0613-9006', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(8, '山田 春香', 'mikako.tanabe@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'izt4YZ7UNl', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'カノウ アケミ', '6025741', '6956488  長崎県青山市東区田中町西之園9-9-5', '0098-69-1115', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(9, '近藤 篤司', 'cmiyazawa@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'MJUGo2mjHW', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'タナベ ヒロシ', '6412838', '5931484  青森県佐々木市中央区斉藤町小林1-6-6 ハイツ喜嶋103号', '09-3300-5422', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(10, '山岸 直子', 'tsubasa.sasaki@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'yuBgRoJ5qI', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'キリヤマ ミツル', '6342117', '5771997  広島県木村市南区廣川町笹田8-1-10 ハイツ小林101号', '07023-2-8316', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(11, '中津川 修平', 'kijima.ryohei@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'CUxARJGphL', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ノムラ ミカコ', '6585495', '3084484  新潟県笹田市南区廣川町加藤5-10-8 ハイツ大垣107号', '0660-571-784', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(12, '伊藤 涼平', 'osamu79@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'dr7RuIlofL', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'タカハシ ヨウコ', '2532090', '6242317  長崎県斉藤市西区山口町井高3-7-4 ハイツ高橋109号', '080-7508-9336', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(13, '廣川 幹', 'yamaguchi.kenichi@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'ubIRXyLXR7', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'スギヤマ レイ', '9782865', '8875022  岩手県佐々木市西区吉田町笹田3-4-2 ハイツ宇野109号', '00040-1-4183', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(14, '木村 舞', 'kana.sugiyama@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'fGPlUBGOuG', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'スズキ タイチ', '5043691', '1348196  山口県松本市北区加納町渚7-4-2', '0770-124-200', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(15, '井高 七夏', 'momoko39@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'dsJW9pu0nj', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'イトウ ユイ', '8582621', '7108878  福井県村山市東区喜嶋町高橋7-4-9', '080-3588-2891', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(16, '藤本 美加子', 'nishinosono.kaori@example.org', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', '0GMinv95Iu', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ヨシモト ユミコ', '9532524', '6751453  大分県木村市中央区山岸町工藤7-6-3 コーポ桐山110号', '00-2692-5079', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(17, '西之園 学', 'satomi69@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', '7AXJ7eVr4X', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ナカジマ タロウ', '9057647', '1094517  静岡県青山市中央区浜田町松本7-3-8 コーポ野村109号', '04-2339-8736', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(18, '佐藤 直人', 'knagisa@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'w435SEA4St', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'スズキ ヨウコ', '3529314', '5057607  香川県中島市西区田中町加藤8-5-1 ハイツ中島101号', '0100-006-146', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(19, '若松 直子', 'maaya29@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'L1n4OP29K6', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'コイズミ タロウ', '3158438', '2166189  富山県石田市西区小林町小泉8-3-9', '0140-515-059', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(20, '桐山 あすか', 'qidaka@example.org', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', '4vgWJsPgWO', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'キジマ サトミ', '2101225', '1409706  山梨県三宅市北区宇野町斉藤6-9-10 ハイツ大垣102号', '0285-58-1910', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(21, '井高 あすか', 'maaya.yoshimoto@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'Dze66S2lRZ', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'サイトウ ハナコ', '8286470', '8068645  埼玉県坂本市東区中村町吉本6-9-6', '0861-21-8219', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(22, '小泉 翼', 'ihamada@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'DOAzXKICAW', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ニシノソノ ナナミ', '8303951', '5505254  鳥取県井高市東区坂本町青山10-2-2', '01824-3-1285', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(23, '田中 明美', 'taro60@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'MPhqZItWdr', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'コバヤシ ミカコ', '1682537', '3564901  沖縄県鈴木市北区小泉町佐藤2-8-10 コーポ加藤108号', '01-9203-7163', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(24, '若松 涼平', 'matsumoto.yosuke@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'JawU1SUCOd', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ワタナベ ミカコ', '7622469', '4692749  長野県中津川市西区石田町吉田8-1-7 コーポ中津川110号', '09-3319-1446', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(25, '伊藤 くみ子', 'jun.suzuki@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'qH11ZAf0qP', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'アオヤマ ユウタ', '5235227', '5533372  岩手県田辺市東区井高町津田8-8-3 ハイツ江古田104号', '080-3966-1398', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(26, '吉本 京助', 'saito.asuka@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'uAtmpjh5ET', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'カノウ カオリ', '6476901', '7198995  長野県井高市東区近藤町原田9-2-9', '05791-7-0123', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(27, '西之園 里佳', 'yui.yamamoto@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'Oou69HsJAj', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ミヤザワ ユウキ', '3033376', '9181215  岩手県大垣市南区大垣町伊藤10-5-5', '04-1659-1587', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(28, '加藤 稔', 'satomi19@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'uCKK2n41Z3', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ハマダ アケミ', '2892616', '7275249  長野県宮沢市北区藤本町野村9-3-3', '0520-881-585', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(29, '原田 くみ子', 'hirokawa.osamu@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'pp0MDoSlTx', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'エコダ アスカ', '8434677', '9985444  東京都吉田市西区工藤町山岸4-7-3', '00769-2-6542', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(30, '浜田 学', 'asuka.kobayashi@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'kS7bEYRrrj', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'クドウ クミコ', '9015113', '1461815  富山県笹田市中央区渚町浜田8-4-5 ハイツ山岸110号', '0350-387-829', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(31, '大垣 亮介', 'naoko93@example.org', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'PYycLWEsld', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'サトウ ヨウスケ', '4993301', '7372278  福島県桐山市北区近藤町木村7-2-7 ハイツ宇野110号', '07034-7-4381', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(32, '宇野 あすか', 'mikako05@example.org', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'EZey0ibxY2', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ササダ アケミ', '7611428', '3568151  山梨県鈴木市北区山岸町渚7-4-2 ハイツ廣川101号', '091-517-5258', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(33, '高橋 千代', 'eharada@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'FO8tBueT8s', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ツダ キョウスケ', '2105192', '9507245  山梨県浜田市西区青田町伊藤6-4-1 ハイツ木村110号', '05-0582-6615', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(34, '吉田 篤司', 'matsumoto.rei@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'IIO3NYmSnh', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ナギサ レイ', '4422438', '2649692  石川県工藤市東区中島町村山1-3-6', '00229-2-0422', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(35, '吉本 舞', 'sugiyama.mitsuru@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'fvUwfXvvGx', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'イシダ ナオキ', '5523490', '5474405  岐阜県井高市東区佐藤町若松5-3-3', '090-5568-1630', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(36, '原田 舞', 'hiroshi.nakamura@example.org', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', '6TeDdEgOYi', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'イトウ マナブ', '5255137', '1948865  山梨県笹田市北区津田町宮沢2-7-8', '07901-4-9867', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(37, '野村 智也', 'mitsuru02@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'c0G8fA4AeH', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ナカムラ リョウスケ', '3301115', '4805507  奈良県工藤市南区井高町笹田8-10-1', '080-6756-8246', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(38, '木村 淳', 'yoko30@example.org', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'OaxQ8PcDxw', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'イトウ サトミ', '4545893', '7673470  福岡県大垣市北区杉山町近藤3-2-1', '080-8613-8647', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(39, '三宅 亮介', 'miki83@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'QcUmjGbvkP', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'コンドウ ユウタ', '4583629', '5864141  栃木県中津川市中央区伊藤町山岸8-2-8 コーポ青田107号', '05-8799-8626', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(40, '江古田 智也', 'usasaki@example.org', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'QYeaBtK6NU', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ミヤザワ ヒデキ', '4568660', '9333588  佐賀県藤本市北区山本町井高8-7-5 コーポ三宅108号', '090-2274-1756', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(41, '津田 直子', 'nakamura.yuki@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'G8xXNVvE8k', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'カノウ ナオコ', '1413635', '6046405  佐賀県宇野市西区喜嶋町大垣6-4-10 コーポ原田109号', '03150-5-0174', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(42, '野村 太一', 'nakatsugawa.yuki@example.org', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'I0mntRYjTh', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ハラダ ジュン', '5849507', '8166893  滋賀県村山市西区近藤町小林10-10-7', '07162-8-2350', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(43, '工藤 裕樹', 'ckato@example.org', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'pSjQ6e3TMC', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'サカモト ミツル', '5123401', '9961931  島根県佐々木市西区木村町江古田6-6-5', '0890-925-269', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(44, '佐藤 修平', 'taro83@example.org', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'pzBuM1wnMN', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'サカモト ナオコ', '8413571', '6393429  石川県鈴木市中央区中島町杉山6-6-4', '03-0935-6560', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(45, '坂本 翼', 'kana.nakatsugawa@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'eoLoVmg10A', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ハラダ アケミ', '5715921', '4194069  鳥取県村山市南区加藤町山岸7-4-10', '000-923-7404', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(46, '大垣 零', 'kobayashi.minoru@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'OiWww4S5Nj', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ササダ マイ', '9566396', '1199555  静岡県大垣市東区小泉町中島2-4-1 コーポ江古田107号', '03244-8-0556', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(47, '浜田 治', 'nanami40@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'JU4rttIkdO', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ナカツガワ ユミコ', '3938810', '5102427  滋賀県山田市北区坂本町加納8-9-4 ハイツ山口110号', '07201-6-6033', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(48, '井高 裕太', 'mitsuru80@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'ypenXA2JQb', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ヤマダ ヨウコ', '8424548', '5031187  福岡県山岸市中央区中津川町三宅10-1-6 コーポ松本108号', '090-2359-1188', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(49, '田辺 直子', 'ryosuke.nishinosono@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', '4DmFoc8GR5', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ヤマモト ナオコ', '6859238', '9709802  高知県木村市南区廣川町松本9-5-2 コーポ西之園104号', '080-3019-2003', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(50, '斉藤 淳', 'eaoyama@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'zl2QiNoMm1', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'コバヤシ ユミコ', '9743615', '5197504  秋田県山田市東区吉田町三宅3-4-7 ハイツ原田101号', '090-3209-9541', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(51, '渡辺 千代', 'taichi01@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'dCwv6xChnE', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ムラヤマ カズヤ', '5085483', '2283546  山梨県高橋市南区村山町伊藤3-3-6 ハイツ青田104号', '011-330-5117', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(52, '小林 洋介', 'kyamaguchi@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', '1wwt6P5Zoy', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'マツモト ヨウコ', '3739221', '4458281  山形県木村市北区吉田町渚4-9-10 コーポ若松103号', '0399-37-8083', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(53, '斉藤 春香', 'jun.hamada@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'BBirAvpYtc', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ウノ アツシ', '1268448', '4865437  鹿児島県松本市北区若松町若松8-7-10', '0310-72-4897', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(54, '井上 英樹', 'kazuya45@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'Sb0l7Xgq9w', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ナギサ マナブ', '8774920', '9874430  宮城県佐々木市南区青山町廣川8-2-10', '080-6273-1623', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(55, '若松 七夏', 'minoru.nishinosono@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'vpJwMyIcgZ', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ニシノソノ ユウタ', '8813734', '8825424  山形県山口市中央区鈴木町大垣2-4-1 コーポ佐藤106号', '080-7500-3993', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(56, '大垣 亮介', 'maoyama@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'rmNM5SW5DI', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'イダカ ミツル', '1708213', '4405702  宮崎県小泉市東区原田町佐々木9-10-2', '09916-8-3943', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(57, '坂本 直子', 'aoyama.rika@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'wHHXToedz0', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'カノウ アケミ', '2294877', '8945354  北海道加納市中央区山田町井高1-1-4 ハイツ青田102号', '088-642-3603', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(58, '浜田 浩', 'hanako.nakamura@example.org', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'T8BO4EyKUe', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'クドウ ジュン', '8095293', '2131231  広島県中島市南区喜嶋町村山9-8-3', '090-5063-1328', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(59, '浜田 香織', 'haruka00@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'DC9Gr8ZXAr', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ナギサ キョウスケ', '9106239', '9273890  群馬県山口市北区田中町木村6-1-3', '0580-538-587', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(60, '渚 裕太', 'asuka.hirokawa@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'Nih193XHTf', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ハラダ ヨウスケ', '3462512', '1859356  山口県木村市北区杉山町若松10-9-7', '05-4743-9455', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(61, '佐々木 花子', 'nomura.maaya@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', '3bBgdL24RR', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ナカムラ ナオコ', '1208081', '6943092  大分県藤本市中央区若松町坂本8-2-6', '023-862-5723', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(62, '加納 真綾', 'haruka24@example.org', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'xTFj7MrwMr', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'イダカ ツバサ', '3528412', '1687196  秋田県宇野市中央区小林町吉本5-7-10', '0243-92-5636', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(63, '青田 浩', 'aoyama.yuta@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'QBGH1TjEbI', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'キリヤマ ユミコ', '9622330', '7037495  京都府若松市西区山岸町山口9-10-9', '090-8658-8407', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(64, '斉藤 康弘', 'koizumi.chiyo@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', '5x6xvXUXnE', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'マツモト アキラ', '8986683', '6458394  福島県山本市中央区高橋町村山8-2-5', '0154-37-9407', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(65, '佐々木 学', 'fharada@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'clEEJzlACD', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ヨシダ ミツル', '8938305', '5913252  岩手県木村市中央区山岸町若松6-7-7', '0960-283-809', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(66, '斉藤 晃', 'shota.ishida@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', '8nIEA3Po4J', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ムラヤマ ヒデキ', '4536096', '6302505  岩手県江古田市東区石田町江古田6-2-10 ハイツ津田108号', '04-8682-4608', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(67, '西之園 聡太郎', 'haruka.sakamoto@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 's3Pyi9uh5T', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'キリヤマ モモコ', '6793011', '8778432  岩手県高橋市南区西之園町吉本3-10-7', '019-142-3563', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(68, '渚 学', 'tanabe.chiyo@example.org', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'szQrfPaLP0', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'イダカ リカ', '7113162', '6614329  高知県坂本市中央区中津川町杉山1-4-4', '0400-088-299', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(69, '工藤 結衣', 'rei.yamaguchi@example.org', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'LArnvpv2MM', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'タナベ アスカ', '9797447', '2786286  福井県中村市南区青山町藤本8-7-9', '080-0638-5314', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(70, '吉本 くみ子', 'uno.taichi@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'A4zKaQQwAA', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'スギヤマ タクマ', '3803784', '9158174  福岡県伊藤市東区三宅町原田2-7-5 ハイツ高橋106号', '090-6780-5069', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(71, '中村 千代', 'aoyama.ryosuke@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'tYgzCwHsv5', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'タナベ ヒデキ', '9345464', '4647146  福井県西之園市中央区高橋町大垣6-7-8 ハイツ加藤107号', '0510-318-666', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(72, '渡辺 亮介', 'yoshimoto.akira@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'wY8lky49if', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'オオガキ ヒロシ', '7481718', '9029365  広島県津田市南区高橋町三宅4-3-9', '080-4253-0250', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(73, '近藤 京助', 'naoto22@example.org', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'H9k4D7faHZ', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ヤマダ ユイ', '4124476', '7828687  香川県中津川市北区中村町宇野3-5-5 コーポ近藤101号', '090-3077-0930', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(74, '浜田 充', 'osamu.kimura@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'L4v1ko3arq', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ヤマグチ ミノル', '2271774', '3456182  福島県鈴木市南区廣川町加納9-6-3 コーポ中島102号', '046-301-5103', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(75, '青山 舞', 'shuhei25@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', '4f2gqeYq6v', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ワタナベ オサム', '9451485', '6523680  北海道吉田市西区宇野町鈴木1-10-1 コーポ廣川101号', '053-514-2640', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(76, '三宅 真綾', 'jun65@example.org', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'jB8Ya4MlEb', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'タナベ レイ', '2061368', '5871148  岩手県西之園市中央区田中町田辺5-9-10 コーポ松本101号', '0039-37-7983', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(77, '吉本 知実', 'yumiko.kudo@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'k8w82Vfvg6', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ヤマギシ ヒデキ', '1541762', '4926476  長野県山口市西区廣川町浜田5-7-7 ハイツ杉山107号', '05151-2-8650', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(78, '伊藤 春香', 'yekoda@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', '4ZjgrnqiCr', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'エコダ アツシ', '4171876', '3529425  石川県江古田市北区田中町野村10-6-3 コーポ田中108号', '0309-20-5278', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(79, '山田 智也', 'manabu.kimura@example.org', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'ieWqCHbiJH', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ワカマツ モモコ', '8551526', '5316719  兵庫県青田市中央区廣川町佐藤2-9-1 コーポ桐山106号', '0265-56-3404', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(80, '杉山 花子', 'xaoyama@example.org', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'GTsCs0zsnv', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'マツモト タロウ', '2128962', '3898095  秋田県吉本市東区井高町津田7-3-9', '048-111-6381', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(81, '青山 七夏', 'zsugiyama@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'DmqpRd4TGz', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ニシノソノ アキラ', '5043918', '6439850  滋賀県青田市南区吉田町野村3-10-5 ハイツ笹田101号', '08-9076-7255', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(82, '鈴木 桃子', 'naoto97@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'LnBeY9Sxrr', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'カノウ モモコ', '6744277', '2376928  愛媛県江古田市西区浜田町加藤10-9-9 ハイツ木村106号', '08160-2-6426', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(83, '宮沢 加奈', 'sayuri91@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'HFyotufTWS', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ハマダ マアヤ', '6305800', '9148663  和歌山県中島市中央区佐々木町桐山8-7-8', '06666-1-0271', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(84, '吉田 さゆり', 'kana.tsuda@example.org', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'flPxWLOVwB', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'キリヤマ ヨウイチ', '3465677', '2086189  和歌山県青山市中央区木村町杉山1-8-2 コーポ坂本107号', '096-001-8144', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(85, '木村 知実', 'bogaki@example.org', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'cnQ1CsdgAq', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ミヤケ ミカコ', '3119743', '7476709  和歌山県高橋市南区加藤町松本2-5-4', '0510-029-704', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(86, '渡辺 裕美子', 'pkudo@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', '5esDxp8eR2', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'サトウ ヨウスケ', '7819443', '1072492  高知県松本市北区石田町宇野10-10-10 コーポ笹田107号', '02557-8-2489', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(87, '笹田 治', 'sayuri77@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', '2KfdSKTs3p', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'イトウ ナオコ', '3453287', '5638705  石川県桐山市西区宮沢町杉山7-7-10 コーポ斉藤110号', '01395-5-2465', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(88, '坂本 涼平', 'pyamagishi@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'TI6Xd2laUU', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ノムラ サトミ', '8543533', '7027066  神奈川県佐々木市北区原田町渚9-8-5 ハイツ浜田109号', '0910-63-3138', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(89, '佐藤 和也', 'rmiyake@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'x8DG1jiWu8', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'アオタ カナ', '6792828', '1764297  奈良県伊藤市中央区小泉町野村4-8-3', '030-499-3264', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(90, '杉山 翼', 'uekoda@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'wcx7htPck2', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'スギヤマ サトミ', '1472272', '1127351  香川県中村市東区吉田町小泉5-7-7', '0410-106-440', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(91, '高橋 結衣', 'nanami.nomura@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'aszxvYZKME', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'フジモト ケンイチ', '8009554', '6549309  滋賀県大垣市南区青田町杉山2-1-7', '071-178-7335', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(92, '喜嶋 幹', 'matsumoto.yuta@example.org', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'O7TvJydIQ2', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'イシダ ユウタ', '4692168', '1539523  鹿児島県渡辺市西区田中町桐山8-8-8', '0590-72-5412', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(93, '井上 和也', 'yasuhiro.sasaki@example.org', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'A2XyP2LiBv', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ササキ ナオコ', '9172134', '5345291  愛知県加納市東区杉山町近藤8-2-9 ハイツ桐山101号', '0200-869-452', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(94, '田中 稔', 'maaya15@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'YyTrE4dKEv', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'カノウ ユウタ', '4216209', '7918122  宮崎県小泉市中央区江古田町浜田7-8-4 ハイツ近藤101号', '06870-4-3467', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(95, '山口 陽子', 'wtsuda@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', '6NY6bRUiOU', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ナカツガワ サユリ', '3504222', '7172372  静岡県宇野市北区若松町佐藤3-4-4', '03669-1-4754', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(96, '坂本 裕美子', 'momoko.sugiyama@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'jCMv2IjyDr', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ナカムラ レイ', '4195186', '4164324  山口県近藤市東区青山町渚5-6-3 コーポ工藤109号', '061-075-3551', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(97, '加藤 健一', 'yosuke.nagisa@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'VeCAPeR99m', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ヒロカワ ヤスヒロ', '2524965', '4051014  長崎県江古田市南区佐藤町青山10-2-5 コーポ宇野107号', '0420-230-460', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(98, '喜嶋 里佳', 'sasada.kana@example.com', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'HlkxcZedYv', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'ヤマギシ カズヤ', '9356157', '9962114  茨城県原田市北区佐藤町杉山3-3-8', '07-7260-3084', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(99, '井上 修平', 'mikako42@example.net', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'vnukrWijGY', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'クドウ ユミコ', '8087637', '4849279  栃木県野村市西区津田町村山7-8-6', '0870-73-0450', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(100, '工藤 幹', 'shota60@example.org', '2024-07-24 01:15:01', '$2y$12$tcW07pvfv4L4Y0FOH0hWpOLP1/MmCJyZU/VncH4Y/QwRsVXA5WuC6', 'OBPaW7JhT4', '2024-07-24 01:15:01', '2024-07-24 01:15:01', NULL, NULL, NULL, NULL, 'コンドウ アツシ', '8489604', '4186321  茨城県村山市東区石田町喜嶋10-10-4', '06982-7-4189', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(101, '侍太郎', 'beatless0121@gmail.com', '2024-07-24 12:33:32', '$2y$12$gwDIqutUu1g5hEN4x5tYRuIRcelHvEPVau55cYAc8ZbcBdf/je67K', NULL, '2024-07-24 12:32:57', '2024-07-24 12:35:21', 'cus_QX8gS6JyDJbQcH', 'visa', '4242', NULL, 'サムライタロウ', '6500000', '愛知県', '09014836405', NULL, NULL, 0, NULL, NULL, NULL, NULL),
(102, '侍一郎', 'beatless0121+member01@gmail.com', '2024-07-25 10:07:36', '$2y$12$GpKHhUutXBndGj8hzupSEuRKin7YEVBUqnMvzS567MNx5YBxEnDRm', NULL, '2024-07-25 10:07:02', '2024-07-25 10:08:38', 'cus_QXTYlBoKrA4aKC', 'visa', '1111', NULL, 'サムライイチロウ', '6500000', '愛知県名古屋市中区栄X-XX-XXX', '09014836415', NULL, NULL, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(2, '2019_05_03_000002_create_subscriptions_table', 1),
(3, '2019_05_03_000003_create_subscription_items_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_06_25_000000_create_administrators_table', 1),
(7, '2024_06_25_000000_create_members_table', 1),
(8, '2024_06_26_000001_create_customer_columns', 1),
(9, '2024_06_26_001244_add_members_table', 1),
(10, '2024_07_08_230548_create_shops_table', 1),
(11, '2024_07_12_081721_create_categories_table', 1),
(12, '2024_07_13_112437_create_category_shop_table', 1),
(13, '2024_07_13_201240_create_regular_holidays', 1),
(14, '2024_07_13_210920_create_regular_holiday_shop_table', 1),
(15, '2024_07_15_145515_create_companies_table', 1),
(16, '2024_07_15_145902_create_terms_table', 1),
(17, '2024_07_23_225607_create_reviews_table', 1),
(18, '2024_07_27_133002_create_shop_member', 2),
(19, '2024_07_27_134803_create_reservations_table', 3),
(20, '2024_07_27_134847_create_shop_member', 3),
(21, '2024_08_05_223252_add_release_flg_to_reviews_table', 4);

-- --------------------------------------------------------

--
-- テーブルの構造 `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `regular_holidays`
--

CREATE TABLE `regular_holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `day` varchar(255) NOT NULL,
  `day_index` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `regular_holidays`
--

INSERT INTO `regular_holidays` (`id`, `day`, `day_index`, `created_at`, `updated_at`) VALUES
(1, '月', 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(2, '火', 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(3, '水', 3, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(4, '木', 4, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(5, '金', 5, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(6, '土', 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(7, '日', 0, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(8, '不定休', NULL, '2023-12-31 15:00:00', '2023-12-31 15:00:00');

-- --------------------------------------------------------

--
-- テーブルの構造 `regular_holiday_shop`
--

CREATE TABLE `regular_holiday_shop` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `regular_holiday_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `regular_holiday_shop`
--

INSERT INTO `regular_holiday_shop` (`id`, `shop_id`, `regular_holiday_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(2, 1, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(3, 1, 7, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(4, 2, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(5, 3, 3, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(6, 4, 7, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(7, 4, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(8, 6, 8, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(9, 6, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(10, 6, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(11, 7, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(12, 9, 7, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(13, 12, 8, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(14, 12, 3, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(15, 17, 5, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(16, 17, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(17, 20, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(18, 20, 7, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(19, 21, 5, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(20, 21, 3, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(21, 23, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(22, 23, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(23, 24, 4, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(24, 24, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(25, 24, 7, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(26, 25, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(27, 26, 8, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(28, 26, 4, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(29, 27, 8, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(30, 28, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(31, 28, 3, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(32, 28, 7, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(33, 29, 4, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(34, 29, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(35, 30, 3, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(36, 31, 7, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(37, 32, 8, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(38, 32, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(39, 33, 5, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(40, 35, 3, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(41, 36, 7, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(42, 37, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(43, 38, 5, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(44, 38, 4, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(45, 41, 4, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(46, 41, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(47, 42, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(48, 42, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(49, 42, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(50, 43, 5, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(51, 44, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(52, 44, 3, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(53, 45, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(54, 46, 8, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(55, 46, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(56, 48, 4, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(57, 50, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(58, 50, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(59, 51, 4, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(60, 51, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(61, 51, 7, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(62, 52, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(63, 52, 4, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(64, 54, 4, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(65, 54, 3, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(66, 54, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(67, 55, 4, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(68, 56, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(69, 56, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(70, 59, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(71, 59, 8, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(72, 60, 4, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(73, 60, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(74, 61, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(75, 62, 8, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(76, 62, 5, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(77, 62, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(78, 63, 3, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(79, 63, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(80, 65, 3, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(81, 65, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(82, 65, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(83, 68, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(84, 69, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(85, 69, 7, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(86, 69, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(87, 71, 3, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(88, 71, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(89, 73, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(90, 74, 8, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(91, 74, 5, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(92, 74, 3, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(93, 75, 3, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(94, 76, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(95, 77, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(96, 78, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(97, 78, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(98, 78, 5, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(99, 80, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(100, 81, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(101, 81, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(102, 83, 7, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(103, 83, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(104, 83, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(105, 84, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(106, 84, 5, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(107, 86, 7, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(108, 86, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(109, 87, 5, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(110, 87, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(111, 88, 5, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(112, 88, 4, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(113, 89, 3, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(114, 89, 8, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(115, 89, 4, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(116, 90, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(117, 90, 5, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(118, 90, 7, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(119, 91, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(120, 91, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(121, 91, 3, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(122, 92, 7, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(123, 92, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(124, 93, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(125, 93, 5, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(126, 94, 8, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(127, 94, 3, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(128, 95, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(129, 95, 7, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(130, 96, 5, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(131, 96, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(132, 97, 7, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(133, 97, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(134, 97, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(135, 98, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(136, 98, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(137, 99, 8, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(138, 99, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(139, 100, 8, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(140, 100, 4, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(141, 100, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00');

-- --------------------------------------------------------

--
-- テーブルの構造 `reservations`
--

CREATE TABLE `reservations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reserved_datetime` datetime NOT NULL,
  `number_of_people` int(11) NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `reservations`
--

INSERT INTO `reservations` (`id`, `reserved_datetime`, `number_of_people`, `shop_id`, `member_id`, `created_at`, `updated_at`) VALUES
(1, '2023-04-16 14:01:35', 122, 20, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(2, '2023-12-16 13:55:38', 6, 79, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(3, '2024-01-31 19:22:52', 30, 56, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(4, '2023-06-29 14:21:22', 50, 36, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(5, '2023-03-11 16:31:20', 44, 49, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(6, '2024-01-26 20:04:03', 18, 86, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(7, '2023-03-28 14:40:09', 92, 73, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(8, '2023-05-12 18:32:33', 38, 61, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(9, '2023-12-16 15:42:24', 58, 28, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(10, '2023-11-14 17:03:33', 54, 77, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(11, '2024-01-28 10:21:16', 81, 7, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(12, '2023-02-20 16:33:53', 13, 70, 42, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(13, '2023-10-10 22:24:38', 76, 48, 25, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(14, '2023-10-24 16:30:55', 41, 80, 35, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(15, '2023-08-18 16:19:55', 28, 61, 100, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(16, '2023-04-02 11:23:14', 116, 52, 40, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(17, '2023-03-07 21:12:24', 40, 46, 42, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(18, '2023-06-26 20:06:10', 27, 75, 79, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(19, '2023-03-10 14:13:44', 32, 44, 45, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(20, '2023-03-15 14:08:46', 32, 57, 34, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(21, '2023-06-24 18:27:16', 82, 94, 67, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(22, '2023-09-12 13:01:56', 27, 27, 80, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(23, '2024-02-03 18:56:49', 40, 49, 16, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(24, '2024-01-26 13:54:50', 53, 85, 40, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(25, '2024-01-23 10:26:37', 9, 31, 11, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(26, '2023-02-25 15:56:44', 94, 94, 35, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(27, '2023-07-15 22:18:17', 33, 19, 15, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(28, '2023-04-02 16:41:10', 87, 5, 11, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(29, '2023-12-06 11:49:00', 23, 76, 80, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(30, '2023-11-06 11:40:25', 9, 61, 77, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(31, '2023-10-10 15:17:55', 87, 44, 11, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(32, '2023-06-07 16:06:45', 70, 10, 19, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(33, '2023-06-07 14:03:10', 21, 53, 63, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(34, '2023-08-17 20:32:49', 68, 82, 3, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(35, '2023-12-07 11:12:07', 55, 58, 48, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(36, '2023-05-02 19:12:34', 49, 3, 26, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(37, '2024-01-27 19:03:29', 20, 95, 77, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(38, '2023-04-09 16:32:18', 5, 14, 15, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(39, '2023-08-23 20:18:36', 18, 28, 15, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(40, '2023-09-27 15:36:33', 14, 43, 47, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(41, '2023-09-11 16:06:30', 7, 57, 49, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(42, '2023-09-23 13:22:59', 73, 10, 60, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(43, '2023-08-28 22:48:40', 33, 48, 42, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(44, '2023-05-30 19:17:47', 85, 98, 4, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(45, '2023-08-27 11:57:33', 21, 92, 55, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(46, '2023-07-17 14:17:37', 42, 73, 71, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(47, '2024-02-02 18:53:49', 70, 63, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(48, '2023-01-31 16:53:33', 78, 50, 95, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(49, '2023-09-13 14:46:52', 7, 67, 22, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(50, '2023-11-02 17:24:43', 40, 99, 66, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(51, '2023-05-06 18:40:02', 62, 16, 14, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(52, '2023-10-04 19:22:39', 93, 29, 55, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(53, '2023-11-24 10:05:05', 71, 85, 78, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(54, '2023-02-19 19:13:31', 37, 35, 96, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(55, '2023-04-11 14:20:59', 47, 53, 95, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(56, '2023-08-07 15:57:48', 90, 66, 41, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(57, '2023-07-23 19:39:43', 75, 81, 7, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(58, '2024-01-28 18:24:18', 5, 90, 75, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(59, '2024-01-28 11:53:18', 24, 45, 16, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(60, '2023-12-23 17:46:42', 9, 84, 74, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(61, '2023-04-15 17:21:37', 66, 69, 62, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(62, '2024-01-23 17:21:08', 53, 3, 7, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(63, '2024-01-08 13:06:48', 2, 2, 85, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(64, '2023-12-20 14:35:41', 50, 32, 53, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(65, '2023-10-28 18:29:22', 121, 10, 92, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(66, '2023-10-09 11:47:22', 48, 38, 51, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(67, '2023-03-22 19:09:36', 14, 64, 52, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(68, '2023-10-31 22:22:52', 27, 22, 76, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(69, '2023-05-21 19:05:27', 52, 99, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(70, '2023-06-28 20:19:12', 57, 69, 28, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(71, '2024-01-31 12:01:11', 9, 80, 35, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(72, '2023-05-20 11:21:09', 51, 49, 94, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(73, '2024-01-03 16:45:35', 52, 35, 47, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(74, '2023-11-03 10:30:34', 49, 67, 38, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(75, '2023-07-21 17:56:48', 67, 36, 33, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(76, '2023-08-15 14:52:58', 62, 96, 19, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(77, '2024-01-24 17:15:58', 26, 68, 71, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(78, '2023-05-25 10:11:13', 21, 37, 49, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(79, '2023-10-15 18:29:04', 79, 7, 42, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(80, '2023-10-04 22:40:39', 98, 96, 25, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(81, '2023-09-23 22:02:56', 20, 8, 15, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(82, '2023-06-09 13:32:22', 60, 35, 10, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(83, '2023-08-20 19:43:39', 37, 24, 14, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(84, '2023-05-16 13:04:09', 21, 35, 52, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(85, '2023-08-27 11:54:52', 52, 71, 37, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(86, '2023-07-31 12:06:33', 1, 26, 56, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(87, '2024-01-30 19:35:43', 66, 84, 79, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(88, '2023-02-04 14:48:08', 56, 28, 38, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(89, '2023-02-05 19:14:38', 15, 44, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(90, '2023-04-24 19:16:36', 121, 44, 62, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(91, '2023-08-15 19:27:09', 67, 31, 84, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(92, '2023-05-10 16:05:58', 37, 12, 101, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(93, '2023-11-02 15:53:16', 43, 93, 83, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(94, '2023-08-20 21:03:22', 13, 88, 80, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(95, '2024-01-17 13:51:42', 52, 52, 98, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(96, '2023-06-21 20:13:34', 10, 39, 78, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(97, '2023-02-17 20:39:36', 89, 31, 35, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(98, '2023-07-16 18:15:29', 57, 50, 80, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(99, '2023-06-09 13:02:17', 123, 65, 54, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(100, '2023-03-29 19:38:39', 86, 17, 83, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(101, '2023-08-10 17:02:49', 88, 21, 44, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(102, '2023-02-06 19:45:43', 6, 43, 27, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(103, '2023-11-26 22:54:52', 74, 19, 48, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(104, '2023-05-08 17:15:25', 41, 40, 34, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(105, '2023-09-14 15:57:30', 54, 28, 82, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(106, '2023-08-06 16:25:20', 100, 33, 4, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(107, '2023-07-02 21:57:07', 139, 66, 23, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(108, '2023-02-17 10:06:06', 20, 23, 67, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(109, '2023-07-04 13:43:10', 23, 18, 41, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(110, '2023-10-03 11:38:48', 14, 78, 55, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(111, '2023-09-05 16:59:01', 106, 98, 95, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(112, '2023-04-14 11:55:56', 105, 98, 72, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(113, '2023-05-06 19:43:30', 37, 15, 72, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(114, '2023-06-01 18:11:44', 48, 68, 72, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(115, '2023-10-05 19:14:34', 29, 67, 87, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(116, '2023-04-01 13:24:34', 28, 58, 5, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(117, '2023-09-05 14:02:33', 10, 71, 25, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(118, '2023-11-23 19:57:02', 70, 69, 25, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(119, '2023-08-05 12:14:24', 47, 51, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(120, '2023-10-26 12:21:36', 81, 40, 53, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(121, '2023-06-15 18:12:24', 21, 1, 79, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(122, '2023-04-23 16:25:44', 86, 53, 74, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(123, '2023-11-06 15:29:52', 11, 87, 67, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(124, '2023-07-14 12:34:05', 27, 58, 52, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(125, '2023-04-23 17:00:59', 44, 56, 22, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(126, '2023-07-02 18:50:10', 48, 11, 4, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(127, '2023-05-07 18:33:43', 32, 34, 28, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(128, '2023-02-02 12:45:05', 6, 64, 70, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(129, '2023-03-09 16:27:01', 44, 56, 62, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(130, '2023-04-14 12:28:56', 23, 38, 72, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(131, '2023-03-25 22:32:47', 32, 48, 78, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(132, '2023-11-19 11:12:23', 24, 24, 79, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(133, '2023-07-11 19:02:10', 84, 29, 24, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(134, '2023-05-08 15:22:18', 105, 18, 12, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(135, '2023-05-26 10:24:11', 8, 70, 3, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(136, '2023-12-07 20:03:45', 41, 95, 93, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(137, '2023-12-29 11:52:54', 41, 12, 66, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(138, '2023-02-12 15:03:48', 10, 91, 7, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(139, '2023-07-26 21:27:29', 5, 100, 75, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(140, '2023-05-10 18:08:26', 15, 10, 83, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(141, '2023-05-14 15:05:23', 2, 84, 15, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(142, '2023-08-08 10:14:20', 14, 27, 26, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(143, '2023-08-10 13:10:11', 16, 61, 71, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(144, '2023-06-05 14:02:59', 49, 18, 70, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(145, '2023-10-12 17:18:58', 74, 84, 37, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(146, '2023-07-12 15:52:05', 37, 74, 80, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(147, '2023-09-07 13:20:24', 19, 80, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(148, '2023-10-17 13:01:04', 44, 97, 42, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(149, '2023-09-23 18:25:26', 28, 67, 58, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(150, '2023-07-17 18:17:46', 21, 2, 58, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(151, '2023-07-20 22:39:13', 85, 77, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(152, '2023-11-28 18:55:58', 21, 90, 39, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(153, '2024-01-04 21:24:34', 108, 77, 45, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(154, '2023-11-01 12:23:00', 129, 64, 85, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(155, '2023-11-23 18:18:02', 2, 79, 93, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(156, '2023-08-23 19:49:37', 2, 46, 81, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(157, '2023-06-18 12:52:53', 81, 16, 12, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(158, '2023-08-20 18:16:59', 58, 59, 30, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(159, '2023-05-06 14:00:30', 56, 13, 28, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(160, '2024-01-03 14:23:27', 28, 47, 21, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(161, '2023-10-01 17:38:40', 9, 58, 21, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(162, '2023-05-02 19:17:13', 126, 54, 16, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(163, '2023-09-15 19:50:35', 57, 37, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(164, '2023-10-09 15:10:15', 97, 66, 99, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(165, '2024-01-19 11:03:21', 41, 24, 35, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(166, '2023-09-26 14:02:27', 55, 83, 4, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(167, '2024-02-03 12:44:43', 68, 37, 62, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(168, '2023-12-25 18:57:56', 46, 28, 11, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(169, '2023-06-28 15:33:11', 11, 56, 41, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(170, '2023-03-10 17:14:03', 93, 75, 60, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(171, '2023-04-22 20:19:01', 70, 63, 65, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(172, '2023-12-20 19:18:44', 61, 72, 70, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(173, '2023-09-23 11:46:52', 150, 33, 43, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(174, '2023-06-09 17:56:53', 23, 47, 27, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(175, '2023-12-23 10:58:30', 61, 71, 54, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(176, '2023-05-17 19:39:37', 47, 46, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(177, '2023-09-30 17:15:19', 83, 76, 48, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(178, '2023-07-30 12:07:22', 5, 12, 69, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(179, '2023-05-06 13:55:13', 63, 21, 56, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(180, '2024-01-10 17:11:05', 67, 39, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(181, '2023-03-04 14:16:36', 18, 13, 81, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(182, '2023-07-16 11:03:01', 44, 72, 68, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(183, '2023-04-15 22:54:27', 63, 82, 33, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(184, '2023-09-20 18:34:09', 87, 20, 80, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(185, '2024-01-14 12:56:10', 62, 70, 68, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(186, '2023-09-19 17:33:15', 13, 28, 50, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(187, '2023-10-04 19:08:35', 60, 82, 32, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(188, '2023-06-03 19:03:51', 46, 59, 100, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(189, '2023-11-23 17:25:38', 9, 25, 49, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(190, '2023-03-30 20:19:48', 21, 69, 17, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(191, '2023-09-04 12:28:30', 27, 34, 92, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(192, '2023-03-23 21:29:34', 8, 69, 31, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(193, '2023-02-12 17:53:53', 67, 92, 83, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(194, '2023-03-05 17:09:27', 23, 85, 67, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(195, '2023-11-15 19:49:23', 83, 28, 23, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(196, '2023-07-11 12:25:17', 39, 25, 11, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(197, '2023-09-16 20:09:18', 40, 69, 76, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(198, '2023-10-18 18:21:31', 20, 18, 99, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(199, '2023-12-29 15:00:49', 101, 22, 50, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(200, '2023-05-16 10:10:36', 7, 85, 99, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(201, '2023-10-15 14:43:20', 58, 14, 94, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(202, '2023-10-17 13:11:01', 52, 48, 89, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(203, '2023-07-24 22:09:23', 56, 91, 35, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(204, '2023-07-23 12:35:27', 17, 56, 95, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(205, '2023-09-19 18:37:34', 63, 61, 30, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(206, '2023-03-14 19:55:13', 21, 65, 44, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(207, '2024-01-18 16:55:26', 13, 1, 81, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(208, '2023-06-09 10:59:43', 33, 68, 60, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(209, '2023-02-11 20:09:19', 11, 24, 33, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(210, '2024-01-10 15:58:27', 81, 44, 62, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(211, '2023-02-04 14:17:44', 105, 18, 58, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(212, '2023-10-05 14:54:23', 67, 96, 40, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(213, '2023-09-15 14:03:31', 21, 17, 37, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(214, '2023-09-16 11:35:59', 29, 20, 36, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(215, '2023-06-15 10:24:28', 110, 44, 60, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(216, '2023-05-25 13:57:10', 65, 62, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(217, '2023-05-05 15:45:13', 86, 21, 40, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(218, '2023-09-26 20:16:34', 7, 100, 13, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(219, '2023-03-22 13:58:24', 112, 85, 75, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(220, '2023-10-28 19:49:22', 13, 24, 80, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(221, '2023-12-08 13:41:50', 12, 32, 38, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(222, '2023-03-31 11:57:02', 18, 23, 61, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(223, '2023-09-29 18:02:30', 30, 46, 25, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(224, '2023-01-31 19:38:04', 35, 37, 37, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(225, '2023-09-08 16:02:48', 80, 73, 40, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(226, '2024-01-02 16:57:16', 36, 23, 44, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(227, '2023-10-08 18:34:00', 73, 50, 11, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(228, '2023-06-14 15:37:53', 51, 24, 76, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(229, '2023-10-07 16:11:49', 22, 89, 97, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(230, '2023-06-12 21:55:55', 17, 79, 96, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(231, '2023-09-08 15:19:07', 16, 39, 17, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(232, '2023-08-30 15:08:05', 26, 71, 3, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(233, '2023-09-17 13:48:54', 8, 15, 53, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(234, '2023-02-13 14:46:46', 43, 50, 54, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(235, '2023-03-14 18:18:10', 62, 25, 32, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(236, '2023-09-27 10:04:24', 20, 100, 54, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(237, '2023-03-06 17:11:49', 57, 7, 67, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(238, '2023-07-31 18:47:34', 36, 32, 28, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(239, '2023-04-26 13:56:43', 56, 41, 24, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(240, '2023-07-02 18:53:53', 48, 69, 63, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(241, '2023-04-06 15:08:11', 60, 51, 50, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(242, '2023-04-06 13:46:45', 34, 25, 93, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(243, '2023-07-23 10:34:11', 2, 34, 38, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(244, '2023-04-03 15:38:14', 44, 90, 70, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(245, '2023-09-25 15:59:00', 45, 59, 95, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(246, '2023-03-23 14:43:45', 29, 12, 68, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(247, '2023-11-01 11:58:16', 36, 61, 27, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(248, '2023-04-16 18:59:52', 42, 22, 101, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(249, '2023-01-31 19:39:08', 46, 12, 18, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(250, '2023-04-25 16:16:54', 63, 84, 88, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(251, '2024-01-13 11:58:29', 28, 23, 34, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(252, '2023-03-18 11:03:56', 77, 93, 56, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(253, '2023-04-03 19:39:41', 47, 33, 14, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(254, '2023-03-08 18:18:52', 2, 35, 49, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(255, '2023-05-14 22:13:33', 12, 21, 53, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(256, '2023-06-23 21:11:41', 112, 55, 41, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(257, '2023-04-10 20:12:55', 27, 38, 32, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(258, '2023-12-12 10:10:27', 4, 89, 14, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(259, '2023-07-08 16:17:28', 9, 23, 19, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(260, '2023-11-17 15:11:59', 78, 22, 65, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(261, '2024-01-28 18:50:45', 40, 2, 39, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(262, '2023-12-27 20:25:36', 28, 69, 29, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(263, '2023-12-18 17:13:30', 96, 8, 32, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(264, '2024-01-14 11:13:27', 75, 98, 20, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(265, '2023-11-16 12:31:12', 33, 89, 98, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(266, '2023-02-16 18:50:30', 35, 38, 87, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(267, '2023-04-29 19:10:09', 37, 50, 85, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(268, '2024-01-14 21:39:15', 101, 8, 48, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(269, '2023-06-23 13:18:15', 66, 83, 46, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(270, '2023-08-08 21:48:10', 87, 7, 55, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(271, '2024-02-03 11:06:33', 63, 29, 4, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(272, '2023-12-21 16:15:09', 72, 85, 70, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(273, '2023-06-18 10:09:54', 22, 45, 101, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(274, '2023-04-04 17:41:47', 28, 17, 26, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(275, '2023-03-18 12:38:05', 113, 44, 90, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(276, '2023-06-29 19:03:20', 94, 17, 16, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(277, '2023-10-29 19:44:46', 39, 100, 4, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(278, '2023-08-20 16:06:33', 23, 35, 70, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(279, '2023-04-05 17:37:26', 31, 86, 88, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(280, '2024-01-31 18:44:24', 71, 62, 64, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(281, '2023-04-22 15:50:40', 89, 11, 62, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(282, '2023-05-31 12:34:19', 1, 49, 74, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(283, '2023-08-25 15:43:44', 107, 44, 50, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(284, '2023-02-17 12:47:49', 120, 10, 73, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(285, '2023-03-05 14:16:52', 106, 88, 14, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(286, '2023-12-10 17:50:57', 51, 27, 53, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(287, '2023-12-16 15:32:08', 24, 26, 18, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(288, '2023-04-22 21:27:45', 79, 75, 89, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(289, '2023-09-07 18:52:03', 8, 46, 70, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(290, '2023-03-20 13:07:39', 18, 56, 61, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(291, '2023-04-15 12:26:54', 48, 68, 20, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(292, '2023-03-08 10:51:49', 42, 45, 75, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(293, '2023-06-27 14:08:03', 81, 95, 5, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(294, '2023-10-16 16:28:36', 37, 87, 41, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(295, '2023-10-27 16:59:10', 38, 16, 40, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(296, '2024-01-28 18:46:36', 132, 32, 60, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(297, '2023-07-05 15:16:56', 81, 62, 38, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(298, '2023-04-17 13:45:04', 24, 13, 28, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(299, '2024-01-11 14:03:15', 70, 83, 18, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(300, '2023-06-02 11:20:59', 6, 25, 70, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(301, '2023-02-14 14:03:05', 72, 83, 49, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(302, '2023-07-08 10:20:40', 44, 34, 5, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(303, '2023-03-22 18:36:50', 64, 5, 81, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(304, '2023-05-30 20:03:21', 60, 82, 97, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(305, '2023-12-18 12:16:49', 24, 16, 74, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(306, '2023-03-23 11:36:46', 69, 10, 73, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(307, '2023-03-30 09:55:02', 47, 51, 14, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(308, '2023-05-31 19:36:38', 124, 65, 88, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(309, '2023-05-22 11:01:28', 30, 38, 79, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(310, '2023-06-08 14:38:19', 12, 35, 14, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(311, '2023-10-03 21:22:04', 29, 4, 3, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(312, '2024-01-26 10:41:30', 98, 55, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(313, '2023-11-10 12:38:07', 22, 25, 5, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(314, '2023-05-02 19:35:41', 90, 39, 94, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(315, '2023-06-25 17:03:46', 138, 99, 70, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(316, '2023-07-24 12:52:31', 66, 29, 43, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(317, '2023-05-23 17:55:51', 130, 11, 28, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(318, '2023-06-19 16:46:33', 3, 57, 95, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(319, '2023-02-06 18:15:21', 57, 38, 54, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(320, '2023-06-18 20:22:55', 21, 30, 75, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(321, '2023-09-12 19:52:18', 31, 57, 38, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(322, '2023-05-11 15:31:11', 78, 66, 31, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(323, '2023-08-23 17:29:48', 46, 95, 58, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(324, '2023-08-29 22:24:23', 5, 87, 56, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(325, '2023-02-18 15:43:48', 59, 37, 101, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(326, '2023-02-22 12:18:59', 14, 70, 81, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(327, '2024-01-07 10:27:57', 85, 94, 70, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(328, '2023-02-11 19:56:11', 39, 34, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(329, '2023-02-05 19:25:16', 47, 35, 96, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(330, '2023-04-06 10:23:15', 52, 11, 92, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(331, '2023-12-28 19:48:52', 64, 70, 57, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(332, '2023-04-24 11:58:15', 50, 90, 55, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(333, '2023-06-26 13:10:21', 64, 71, 84, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(334, '2023-12-28 17:51:33', 59, 26, 85, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(335, '2023-04-06 15:25:55', 94, 55, 88, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(336, '2023-02-22 12:13:04', 3, 36, 13, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(337, '2023-12-25 15:18:08', 39, 27, 85, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(338, '2023-04-10 15:11:52', 35, 3, 17, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(339, '2023-06-30 16:03:17', 116, 8, 80, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(340, '2023-09-19 13:00:46', 63, 72, 61, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(341, '2023-06-02 15:44:12', 38, 95, 11, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(342, '2023-08-05 15:49:41', 2, 24, 20, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(343, '2023-07-18 19:19:16', 81, 96, 63, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(344, '2023-09-17 19:40:09', 16, 57, 71, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(345, '2023-09-13 16:43:46', 37, 43, 27, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(346, '2023-03-28 15:53:12', 36, 68, 70, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(347, '2023-05-03 22:13:44', 104, 8, 19, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(348, '2023-07-24 15:08:37', 89, 19, 89, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(349, '2023-04-10 12:45:07', 10, 62, 39, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(350, '2024-01-18 11:12:35', 93, 99, 88, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(351, '2023-02-07 19:35:55', 20, 89, 50, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(352, '2023-10-16 17:12:26', 40, 56, 70, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(353, '2023-07-24 19:29:36', 45, 89, 12, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(354, '2023-04-22 11:56:16', 43, 34, 34, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(355, '2023-07-04 20:03:15', 55, 21, 79, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(356, '2023-07-02 16:18:11', 52, 40, 32, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(357, '2024-01-17 15:57:07', 36, 50, 13, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(358, '2024-01-28 18:55:38', 66, 3, 39, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(359, '2023-09-21 14:45:05', 67, 28, 91, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(360, '2023-06-30 14:54:23', 41, 61, 3, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(361, '2023-07-24 15:31:44', 19, 36, 24, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(362, '2024-01-14 13:51:02', 2, 25, 16, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(363, '2023-04-05 10:32:45', 35, 92, 78, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(364, '2023-11-27 14:30:26', 119, 20, 62, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(365, '2023-03-02 15:11:41', 63, 71, 90, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(366, '2023-12-09 10:36:47', 14, 67, 90, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(367, '2023-03-03 12:58:54', 53, 25, 68, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(368, '2023-06-11 14:46:14', 37, 1, 70, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(369, '2023-04-09 21:25:03', 82, 31, 57, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(370, '2023-05-05 20:50:48', 106, 55, 24, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(371, '2023-07-21 14:03:58', 79, 10, 91, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(372, '2023-08-09 18:51:50', 79, 26, 56, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(373, '2023-10-05 13:26:13', 124, 10, 19, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(374, '2023-02-08 15:40:35', 64, 43, 53, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(375, '2023-03-17 14:22:34', 83, 61, 82, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(376, '2023-05-22 11:25:36', 23, 29, 82, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(377, '2023-05-17 12:05:52', 104, 62, 92, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(378, '2023-09-14 15:08:28', 35, 72, 12, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(379, '2023-05-29 15:42:14', 75, 43, 24, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(380, '2023-06-27 19:46:25', 30, 23, 87, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(381, '2023-09-05 19:59:37', 100, 97, 86, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(382, '2023-06-25 19:55:47', 43, 12, 52, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(383, '2024-01-09 15:30:07', 3, 61, 44, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(384, '2023-09-27 13:14:38', 42, 73, 25, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(385, '2023-04-16 14:44:38', 18, 32, 19, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(386, '2023-04-23 14:33:43', 111, 85, 59, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(387, '2023-03-12 14:47:16', 35, 36, 30, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(388, '2023-08-11 13:22:42', 140, 65, 92, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(389, '2023-03-15 10:00:46', 65, 17, 19, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(390, '2023-08-09 21:54:11', 35, 87, 64, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(391, '2023-04-22 12:59:31', 39, 93, 69, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(392, '2023-03-10 16:33:31', 67, 9, 71, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(393, '2023-10-22 14:13:57', 29, 13, 46, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(394, '2023-06-04 13:05:04', 51, 41, 17, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(395, '2023-10-14 13:18:25', 77, 81, 49, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(396, '2023-11-05 19:29:11', 31, 87, 88, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(397, '2023-11-01 19:06:49', 11, 58, 70, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(398, '2023-12-18 18:29:29', 63, 98, 39, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(399, '2024-01-22 10:44:35', 52, 85, 89, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(400, '2023-08-11 17:51:58', 40, 81, 32, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(401, '2023-02-26 18:17:17', 34, 90, 81, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(402, '2023-06-08 17:30:58', 70, 58, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(403, '2023-05-01 22:47:41', 46, 6, 70, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(404, '2023-03-27 15:52:26', 60, 64, 98, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(405, '2023-04-24 19:57:05', 64, 18, 52, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(406, '2023-10-26 12:03:29', 68, 53, 17, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(407, '2023-11-13 16:35:14', 77, 39, 38, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(408, '2023-11-04 19:47:43', 7, 45, 86, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(409, '2023-06-03 17:31:40', 6, 79, 2, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(410, '2024-01-04 18:49:40', 6, 62, 86, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(411, '2023-11-02 13:42:31', 50, 90, 94, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(412, '2023-05-31 13:20:48', 87, 5, 43, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(413, '2023-08-03 17:53:22', 50, 10, 99, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(414, '2023-02-12 13:04:35', 9, 80, 33, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(415, '2023-04-13 18:21:42', 36, 26, 15, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(416, '2024-01-01 21:12:01', 43, 100, 76, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(417, '2023-11-30 19:22:07', 80, 39, 28, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(418, '2023-05-11 15:41:25', 89, 93, 13, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(419, '2023-09-19 15:58:41', 10, 56, 17, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(420, '2023-04-02 17:25:41', 10, 14, 5, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(421, '2023-10-18 16:28:55', 42, 88, 89, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(422, '2023-04-24 11:05:13', 51, 72, 40, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(423, '2023-05-31 16:41:46', 133, 10, 64, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(424, '2023-03-19 16:06:34', 2, 90, 74, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(425, '2024-01-22 10:08:38', 46, 56, 63, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(426, '2023-12-30 17:45:34', 88, 65, 14, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(427, '2023-08-25 13:24:23', 7, 51, 27, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(428, '2023-12-03 16:22:59', 5, 8, 70, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(429, '2023-12-12 17:34:54', 8, 19, 6, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(430, '2023-05-07 13:25:13', 89, 38, 16, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(431, '2023-09-02 18:14:35', 27, 78, 28, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(432, '2023-10-24 13:34:11', 95, 94, 19, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(433, '2023-05-22 18:33:48', 3, 79, 85, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(434, '2023-05-08 12:51:24', 36, 20, 23, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(435, '2024-01-22 12:27:46', 26, 12, 51, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(436, '2023-02-17 10:49:30', 47, 23, 91, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(437, '2024-01-17 19:38:00', 33, 90, 69, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(438, '2023-02-10 17:24:00', 53, 4, 61, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(439, '2023-06-29 16:10:37', 131, 32, 16, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(440, '2024-01-22 15:06:11', 63, 36, 7, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(441, '2023-11-08 17:20:53', 48, 44, 19, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(442, '2023-04-30 13:29:50', 97, 28, 52, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(443, '2023-03-26 15:51:20', 75, 81, 27, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(444, '2023-06-10 16:07:18', 51, 92, 80, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(445, '2023-08-04 18:01:02', 84, 85, 11, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(446, '2024-01-18 18:43:37', 14, 83, 23, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(447, '2023-10-01 15:25:12', 20, 14, 67, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(448, '2023-05-03 22:00:32', 69, 50, 11, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(449, '2023-12-30 15:26:58', 51, 72, 13, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(450, '2023-05-31 16:18:24', 49, 8, 85, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(451, '2023-12-11 15:40:22', 37, 90, 92, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(452, '2023-04-24 13:55:52', 23, 17, 36, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(453, '2023-11-01 22:02:58', 9, 32, 84, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(454, '2023-10-27 19:43:19', 8, 90, 19, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(455, '2023-06-11 19:41:57', 18, 56, 39, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(456, '2023-03-27 14:20:03', 106, 8, 83, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(457, '2023-06-30 10:48:31', 46, 88, 79, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(458, '2024-01-07 18:16:53', 42, 89, 94, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(459, '2023-03-26 18:05:02', 2, 65, 85, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(460, '2023-09-20 21:04:16', 19, 21, 65, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(461, '2023-07-20 11:16:40', 43, 14, 55, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(462, '2023-11-26 18:15:48', 82, 87, 37, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(463, '2024-01-10 16:24:19', 66, 85, 36, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(464, '2023-09-13 19:24:49', 23, 18, 27, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(465, '2023-11-08 20:17:30', 1, 18, 63, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(466, '2023-11-21 10:09:43', 47, 23, 84, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(467, '2023-04-16 19:27:53', 2, 12, 9, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(468, '2023-03-01 22:59:57', 125, 22, 95, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(469, '2023-08-18 18:22:57', 39, 57, 100, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(470, '2023-04-04 14:46:44', 75, 61, 25, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(471, '2023-09-03 11:05:47', 102, 11, 1, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(472, '2023-04-16 12:24:29', 150, 99, 75, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(473, '2023-02-10 11:51:35', 73, 16, 22, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(474, '2023-09-05 17:30:06', 36, 78, 23, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(475, '2023-03-18 11:39:12', 40, 70, 7, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(476, '2023-07-20 22:24:32', 13, 96, 21, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(477, '2023-05-28 12:30:38', 28, 63, 42, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(478, '2023-06-22 19:52:01', 95, 85, 24, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(479, '2023-08-20 16:55:34', 111, 66, 32, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(480, '2023-10-04 21:48:14', 4, 38, 5, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(481, '2024-01-28 19:09:23', 83, 10, 49, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(482, '2023-02-26 17:34:22', 78, 84, 81, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(483, '2023-04-13 21:01:30', 62, 96, 84, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(484, '2024-01-15 10:45:07', 132, 65, 94, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(485, '2023-04-07 13:38:41', 123, 86, 97, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(486, '2023-10-20 15:25:44', 20, 42, 18, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(487, '2024-01-06 16:05:31', 47, 23, 97, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(488, '2023-11-23 17:56:14', 20, 58, 36, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(489, '2023-11-10 09:34:53', 55, 68, 84, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(490, '2023-02-20 13:30:33', 34, 93, 51, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(491, '2023-07-22 18:11:40', 1, 9, 65, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(492, '2023-03-19 17:22:29', 20, 38, 83, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(493, '2024-02-03 17:13:03', 77, 73, 56, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(494, '2023-09-07 17:05:28', 30, 4, 77, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(495, '2023-07-12 18:37:07', 35, 70, 53, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(496, '2023-02-23 16:31:34', 20, 17, 44, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(497, '2023-08-10 12:26:25', 59, 49, 14, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(498, '2023-11-16 15:17:33', 104, 74, 62, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(499, '2023-06-09 19:16:59', 87, 43, 26, '2023-12-31 15:00:00', '2023-12-31 15:00:00'),
(500, '2023-03-27 13:43:43', 49, 9, 92, '2023-12-31 15:00:00', '2023-12-31 15:00:00');

-- --------------------------------------------------------

--
-- テーブルの構造 `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `score` int(10) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `release_flg` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `reviews`
--

INSERT INTO `reviews` (`id`, `content`, `score`, `shop_id`, `member_id`, `created_at`, `updated_at`, `release_flg`) VALUES
(2, 'test', 5, 3, 101, '2024-07-27 09:20:51', '2024-08-13 06:25:27', 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `lowest_price` int(10) UNSIGNED NOT NULL,
  `highest_price` int(10) UNSIGNED NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `opening_time` time NOT NULL,
  `closing_time` time NOT NULL,
  `seating_capacity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `shops`
--

INSERT INTO `shops` (`id`, `name`, `image`, `description`, `lowest_price`, `highest_price`, `postal_code`, `address`, `opening_time`, `closing_time`, `seating_capacity`, `created_at`, `updated_at`) VALUES
(1, 'NAGOYA BURGER 名駅店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 50, '2021-12-31 15:00:00', '2021-12-31 15:00:00'),
(2, 'Shanties', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 60, '2022-01-01 15:00:00', '2022-01-01 15:00:00'),
(3, '割烹 柏木', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 70, '2022-01-02 15:00:00', '2022-01-02 15:00:00'),
(4, '油そば専門店ブラブラ 半田店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 80, '2022-01-03 15:00:00', '2022-01-03 15:00:00'),
(5, 'にく屋 浄心店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 90, '2022-01-04 15:00:00', '2022-01-04 15:00:00'),
(6, 'TRED', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 100, '2022-01-05 15:00:00', '2022-01-05 15:00:00'),
(7, 'きんやま', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 110, '2022-01-06 15:00:00', '2022-01-06 15:00:00'),
(8, 'NAGOYA BURGER 名古屋店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 120, '2022-01-07 15:00:00', '2022-01-07 15:00:00'),
(9, '焼肉小山', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 130, '2022-01-08 15:00:00', '2022-01-08 15:00:00'),
(10, '焼き鳥七輪 栄住吉店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 140, '2022-01-09 15:00:00', '2022-01-09 15:00:00'),
(11, '肉の庭', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 150, '2022-01-10 15:00:00', '2022-01-10 15:00:00'),
(12, 'CRAFT BEER NAGOYA2', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 50, '2022-01-11 15:00:00', '2022-01-11 15:00:00'),
(13, '麺屋やしろ', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 60, '2022-01-12 15:00:00', '2022-01-12 15:00:00'),
(14, 'ハワイアンバーベキュー 名古屋店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 70, '2022-01-13 15:00:00', '2022-01-13 15:00:00'),
(15, '日本酒処 花雅', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 80, '2022-01-14 15:00:00', '2022-01-14 15:00:00'),
(16, 'なわ', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 90, '2022-01-15 15:00:00', '2022-01-15 15:00:00'),
(17, 'お酒とご飯', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 100, '2022-01-16 15:00:00', '2022-01-16 15:00:00'),
(18, '焼肉SUKI 名古屋新幹線口店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 110, '2022-01-17 15:00:00', '2022-01-17 15:00:00'),
(19, '焼き鳥 はなれ', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 120, '2022-01-18 15:00:00', '2022-01-18 15:00:00'),
(20, '割烹旬菜花', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 130, '2022-01-19 15:00:00', '2022-01-19 15:00:00'),
(21, 'ちゃんこ屋 あかね', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 140, '2022-01-20 15:00:00', '2022-01-20 15:00:00'),
(22, '肉の庭半田店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 150, '2022-01-21 15:00:00', '2022-01-21 15:00:00'),
(23, 'オーガニック食堂Sngi', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 50, '2022-01-22 15:00:00', '2022-01-22 15:00:00'),
(24, '寿司 やなや', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 60, '2022-01-23 15:00:00', '2022-01-23 15:00:00'),
(25, 'ハワイアンバーベキュー 太田川店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 70, '2022-01-24 15:00:00', '2022-01-24 15:00:00'),
(26, '中華一番', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 80, '2022-01-25 15:00:00', '2022-01-25 15:00:00'),
(27, '厚切りステーキとハンバーグ たはらや', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 90, '2022-01-26 15:00:00', '2022-01-26 15:00:00'),
(28, '名古屋ラーメン 半田店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 100, '2022-01-27 15:00:00', '2022-01-27 15:00:00'),
(29, '炭火やきとり オマメ', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 110, '2022-01-28 15:00:00', '2022-01-28 15:00:00'),
(30, 'ラーメン 餃子 ひびき', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 120, '2022-01-29 15:00:00', '2022-01-29 15:00:00'),
(31, 'つけ麺MENMARU', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 130, '2022-01-30 15:00:00', '2022-01-30 15:00:00'),
(32, 'でろ助 金山店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 140, '2022-01-31 15:00:00', '2022-01-31 15:00:00'),
(33, 'はらみ専門店 七輪屋', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 150, '2022-02-01 15:00:00', '2022-02-01 15:00:00'),
(34, 'かどや本店 JR名古屋駅店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 50, '2022-02-02 15:00:00', '2022-02-02 15:00:00'),
(35, '手打ちそば 子石', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 60, '2022-02-03 15:00:00', '2022-02-03 15:00:00'),
(36, '焼肉 カウカウ', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 70, '2022-02-04 15:00:00', '2022-02-04 15:00:00'),
(37, 'すし徳', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 80, '2022-02-05 15:00:00', '2022-02-05 15:00:00'),
(38, '手打ちそば 中石', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 90, '2022-02-06 15:00:00', '2022-02-06 15:00:00'),
(39, '麺屋しろ', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 100, '2022-02-07 15:00:00', '2022-02-07 15:00:00'),
(40, '焼肉SUKI 阿久比店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 110, '2022-02-08 15:00:00', '2022-02-08 15:00:00'),
(41, '炭火串焼コケッコ屋 大須店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 120, '2022-02-09 15:00:00', '2022-02-09 15:00:00'),
(42, '晴々久', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 130, '2022-02-10 15:00:00', '2022-02-10 15:00:00'),
(43, 'おはんざい', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 140, '2022-02-11 15:00:00', '2022-02-11 15:00:00'),
(44, '名古屋お好み焼き', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 150, '2022-02-12 15:00:00', '2022-02-12 15:00:00'),
(45, '油そば専門店ブラブラ 名古屋駅前店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 50, '2022-02-13 15:00:00', '2022-02-13 15:00:00'),
(46, 'まるまる飯', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 60, '2022-02-14 15:00:00', '2022-02-14 15:00:00'),
(47, '焼き鳥七輪 太田川店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 70, '2022-02-15 15:00:00', '2022-02-15 15:00:00'),
(48, '新みくじ', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 80, '2022-02-16 15:00:00', '2022-02-16 15:00:00'),
(49, '溝口', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 90, '2022-02-17 15:00:00', '2022-02-17 15:00:00'),
(50, 'KOTABUKI', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 100, '2022-02-18 15:00:00', '2022-02-18 15:00:00'),
(51, 'カジュアルてっぱん焼き', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 110, '2022-02-19 15:00:00', '2022-02-19 15:00:00'),
(52, 'ひこぞう', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 120, '2022-02-20 15:00:00', '2022-02-20 15:00:00'),
(53, 'キッチンマルポワ', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 130, '2022-02-21 15:00:00', '2022-02-21 15:00:00'),
(54, '魚と野菜と酒', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 140, '2022-02-22 15:00:00', '2022-02-22 15:00:00'),
(55, '麺屋名古屋 名古屋金山店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 150, '2022-02-23 15:00:00', '2022-02-23 15:00:00'),
(56, 'やきにく 加藤', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 50, '2022-02-24 15:00:00', '2022-02-24 15:00:00'),
(57, 'すし処みか', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 60, '2022-02-25 15:00:00', '2022-02-25 15:00:00'),
(58, '炭火やきとり マメ', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 70, '2022-02-26 15:00:00', '2022-02-26 15:00:00'),
(59, '上下月', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 80, '2022-02-27 15:00:00', '2022-02-27 15:00:00'),
(60, '名古屋ラーメン 栄本店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 90, '2022-02-28 15:00:00', '2022-02-28 15:00:00'),
(61, '肉とホルモンの店 YAMI', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 100, '2022-03-01 15:00:00', '2022-03-01 15:00:00'),
(62, '焼肉とホルモン焼き 新瑞橋店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 110, '2022-03-02 15:00:00', '2022-03-02 15:00:00'),
(63, 'ニクサカバ', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 120, '2022-03-03 15:00:00', '2022-03-03 15:00:00'),
(64, 'よはく', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 130, '2022-03-04 15:00:00', '2022-03-04 15:00:00'),
(65, 'お酒とお肉', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 140, '2022-03-05 15:00:00', '2022-03-05 15:00:00'),
(66, '和牛焼肉Wocca', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 150, '2022-03-06 15:00:00', '2022-03-06 15:00:00'),
(67, 'なかみどり', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 50, '2022-03-07 15:00:00', '2022-03-07 15:00:00'),
(68, 'けろ助 金山店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 60, '2022-03-08 15:00:00', '2022-03-08 15:00:00'),
(69, '魚と野菜と酒 じゃばらむ', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 70, '2022-03-09 15:00:00', '2022-03-09 15:00:00'),
(70, '大衆焼肉酒場 ホルモン屋 栄店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 80, '2022-03-10 15:00:00', '2022-03-10 15:00:00'),
(71, '麺屋名古屋 半田店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 90, '2022-03-11 15:00:00', '2022-03-11 15:00:00'),
(72, 'かつおか', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 100, '2022-03-12 15:00:00', '2022-03-12 15:00:00'),
(73, 'CRAFT BEER NAGOYA', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 110, '2022-03-13 15:00:00', '2022-03-13 15:00:00'),
(74, 'TRED2', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 120, '2022-03-14 15:00:00', '2022-03-14 15:00:00'),
(75, 'どんどん 名駅南一丁目', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 130, '2022-03-15 15:00:00', '2022-03-15 15:00:00'),
(76, '二代目 康', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 140, '2022-03-16 15:00:00', '2022-03-16 15:00:00'),
(77, '天ぷらとワインの大島', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 150, '2022-03-17 15:00:00', '2022-03-17 15:00:00'),
(78, 'すし処ゆか', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 50, '2022-03-18 15:00:00', '2022-03-18 15:00:00'),
(79, '焼肉ボンバー', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 60, '2022-03-19 15:00:00', '2022-03-19 15:00:00'),
(80, 'やきにく 佐藤', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 70, '2022-03-20 15:00:00', '2022-03-20 15:00:00'),
(81, '串カツ 今池店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 80, '2022-03-21 15:00:00', '2022-03-21 15:00:00'),
(82, 'まつおか', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 90, '2022-03-22 15:00:00', '2022-03-22 15:00:00'),
(83, '大衆焼肉酒場 ホルモン屋 半田店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 100, '2022-03-23 15:00:00', '2022-03-23 15:00:00'),
(84, '萬新軒', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 110, '2022-03-24 15:00:00', '2022-03-24 15:00:00'),
(85, 'ハワイアンバーベキュー ささしま太田川店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 120, '2022-03-25 15:00:00', '2022-03-25 15:00:00'),
(86, '焼き鳥 はな', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 130, '2022-03-26 15:00:00', '2022-03-26 15:00:00'),
(87, '口々', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 140, '2022-03-27 15:00:00', '2022-03-27 15:00:00'),
(88, '焼肉とホルモン 新瑞橋店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 150, '2022-03-28 15:00:00', '2022-03-28 15:00:00'),
(89, '上月', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 50, '2022-03-29 15:00:00', '2022-03-29 15:00:00'),
(90, 'オーガニック食堂Angi', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 60, '2022-03-30 15:00:00', '2022-03-30 15:00:00'),
(91, '焼き鳥 せぶん', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 70, '2022-03-31 15:00:00', '2022-03-31 15:00:00'),
(92, 'キッチンマルポー', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 80, '2022-04-01 15:00:00', '2022-04-01 15:00:00'),
(93, 'ニクサカバ半田店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 90, '2022-04-02 15:00:00', '2022-04-02 15:00:00'),
(94, 'ちょもらんま', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 100, '2022-04-03 15:00:00', '2022-04-03 15:00:00'),
(95, 'やきにく 山崎', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 110, '2022-04-04 15:00:00', '2022-04-04 15:00:00'),
(96, '台湾ラーメン 田中 守山本店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '13:00:00', '23:00:00', 120, '2022-04-05 15:00:00', '2022-04-05 15:00:00'),
(97, '割烹 加藤', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 3000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 130, '2022-04-06 15:00:00', '2022-04-06 15:00:00'),
(98, 'ちょもちょもらんま', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 4000, 5000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '11:00:00', '20:30:00', 140, '2022-04-07 15:00:00', '2022-04-07 15:00:00'),
(99, '炭火串焼コケッコ屋 半田店', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 2000, 4000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '10:00:00', '20:00:00', 150, '2022-04-08 15:00:00', '2022-04-08 15:00:00'),
(100, '割烹旬菜', '', '名古屋老舗のお店。老舗の味をご堪能ください。', 5000, 6000, '4500000', '愛知県名古屋市中区栄X-XX-XX', '09:30:00', '22:00:00', 50, '2022-04-09 15:00:00', '2022-04-09 15:00:00');

-- --------------------------------------------------------

--
-- テーブルの構造 `shop_member`
--

CREATE TABLE `shop_member` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_status` varchar(255) NOT NULL,
  `stripe_price` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `member_id`, `type`, `stripe_id`, `stripe_status`, `stripe_price`, `quantity`, `trial_ends_at`, `ends_at`, `created_at`, `updated_at`) VALUES
(1, 101, 'premium_plan', 'sub_1Pg4PdLjZq1DMeKQx2j5jfFN', 'canceled', 'price_1PeSSXLjZq1DMeKQW2RciScN', 1, NULL, '2024-07-25 09:18:50', '2024-07-24 12:35:22', '2024-07-25 09:18:50'),
(2, 101, 'premium_plan', 'sub_1PgOXYLjZq1DMeKQSBcG5OdA', 'active', 'price_1PeSSXLjZq1DMeKQW2RciScN', 1, NULL, NULL, '2024-07-25 10:04:53', '2024-07-25 10:04:53'),
(3, 102, 'premium_plan', 'sub_1PgObCLjZq1DMeKQ4aUxqRBm', 'active', 'price_1PeSSXLjZq1DMeKQW2RciScN', 1, NULL, NULL, '2024-07-25 10:08:39', '2024-07-25 10:08:41');

-- --------------------------------------------------------

--
-- テーブルの構造 `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_product` varchar(255) NOT NULL,
  `stripe_price` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `subscription_items`
--

INSERT INTO `subscription_items` (`id`, `subscription_id`, `stripe_id`, `stripe_product`, `stripe_price`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 'si_QX8hBoh8crWBm3', 'prod_QVTPYLbTgR5iAO', 'price_1PeSSXLjZq1DMeKQW2RciScN', 1, '2024-07-24 12:35:22', '2024-07-24 12:35:22'),
(2, 2, 'si_QXTUVy2JxzYjK3', 'prod_QVTPYLbTgR5iAO', 'price_1PeSSXLjZq1DMeKQW2RciScN', 1, '2024-07-25 10:04:53', '2024-07-25 10:04:53'),
(3, 3, 'si_QXTYqcBHRgULB9', 'prod_QVTPYLbTgR5iAO', 'price_1PeSSXLjZq1DMeKQW2RciScN', 1, '2024-07-25 10:08:39', '2024-07-25 10:08:39');

-- --------------------------------------------------------

--
-- テーブルの構造 `terms`
--

CREATE TABLE `terms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `terms`
--

INSERT INTO `terms` (`id`, `content`, `created_at`, `updated_at`) VALUES
(1, '<p>この利用規約（以下、「本規約」といいます。）は、NAGOYAMESHI株式会社（以下、「当社」といいます。）がこのウェブサイト上で提供するサービス（以下、「本サービス」といいます。）の利用条件を定めるものです。登録ユーザーの皆さま（以下、「ユーザー」といいます。）には、本規約に従って、本サービスをご利用いただきます。</p>\r\n\r\n<h2>第1条（適用）</h2>\r\n<ol><li>本規約は、ユーザーと当社との間の本サービスの利用に関わる一切の関係に適用されるものとします。</li>\r\n<li>当社は本サービスに関し、本規約のほか、ご利用にあたってのルール等、各種の定め（以下、「個別規定」といいます。）をすることがあります。これら個別規定はその名称のいかんに関わらず、本規約の一部を構成するものとします。</li>\r\n<li>本規約の規定が前条の個別規定の規定と矛盾する場合には、個別規定において特段の定めなき限り、個別規定の規定が優先されるものとします。</li></ol>\r\n\r\n<h2>第2条（利用登録）</h2>\r\n<ol><li>本サービスにおいては、登録希望者が本規約に同意の上、当社の定める方法によって利用登録を申請し、当社がこれを承認することによって、利用登録が完了するものとします。</li>\r\n<li>当社は、利用登録の申請者に以下の事由があると判断した場合、利用登録の申請を承認しないことがあり、その理由については一切の開示義務を負わないものとします。</li>\r\n<ol><li>利用登録の申請に際して虚偽の事項を届け出た場合</li>\r\n<li>本規約に違反したことがある者からの申請である場合</li>\r\n<li>その他、当社が利用登録を相当でないと判断した場合</li></ol></ol>\r\n\r\n<h2>第3条（ユーザーIDおよびパスワードの管理）</h2>\r\n<ol><li>ユーザーは、自己の責任において、本サービスのユーザーIDおよびパスワードを適切に管理するものとします。</li>\r\n<li>ユーザーは、いかなる場合にも、ユーザーIDおよびパスワードを第三者に譲渡または貸与し、もしくは第三者と共用することはできません。当社は、ユーザーIDとパスワードの組み合わせが登録情報と一致してログインされた場合には、そのユーザーIDを登録しているユーザー自身による利用とみなします。</li>\r\n<li>ユーザーID及びパスワードが第三者によって使用されたことによって生じた損害は、当社に故意又は重大な過失がある場合を除き、当社は一切の責任を負わないものとします。</li></ol>\r\n\r\n<h2>第4条（利用料金および支払方法）</h2>\r\n<ol><li>ユーザーは、本サービスの有料部分の対価として、当社が別途定め、本ウェブサイトに表示する利用料金を、当社が指定する方法により支払うものとします。</li>\r\n<li>ユーザーが利用料金の支払を遅滞した場合には、ユーザーは年14．6％の割合による遅延損害金を支払うものとします。</li></ol>\r\n\r\n<h2>第5条（禁止事項）</h2>\r\n<p>ユーザーは、本サービスの利用にあたり、以下の行為をしてはなりません。</p>\r\n\r\n<ol><li>法令または公序良俗に違反する行為</li>\r\n<li>犯罪行為に関連する行為</li>\r\n<li>本サービスの内容等、本サービスに含まれる著作権、商標権ほか知的財産権を侵害する行為</li>\r\n<li>当社、ほかのユーザー、またはその他第三者のサーバーまたはネットワークの機能を破壊したり、妨害したりする行為</li>\r\n<li>本サービスによって得られた情報を商業的に利用する行為</li>\r\n<li>当社のサービスの運営を妨害するおそれのある行為</li>\r\n<li>不正アクセスをし、またはこれを試みる行為</li>\r\n<li>他のユーザーに関する個人情報等を収集または蓄積する行為</li>\r\n<li>不正な目的を持って本サービスを利用する行為</li>\r\n<li>本サービスの他のユーザーまたはその他の第三者に不利益、損害、不快感を与える行為</li>\r\n<li>他のユーザーに成りすます行為</li>\r\n<li>当社が許諾しない本サービス上での宣伝、広告、勧誘、または営業行為</li>\r\n<li>面識のない異性との出会いを目的とした行為</li>\r\n<li>当社のサービスに関連して、反社会的勢力に対して直接または間接に利益を供与する行為</li>\r\n<li>その他、当社が不適切と判断する行為</li></ol>\r\n\r\n<h2>第6条（本サービスの提供の停止等）</h2>\r\n<ol><li>当社は、以下のいずれかの事由があると判断した場合、ユーザーに事前に通知することなく本サービスの全部または一部の提供を停止または中断することができるものとします。</li>\r\n<ol><li>本サービスにかかるコンピュータシステムの保守点検または更新を行う場合</li>\r\n<li>地震、落雷、火災、停電または天災などの不可抗力により、本サービスの提供が困難となった場合</li>\r\n<li>コンピュータまたは通信回線等が事故により停止した場合</li>\r\n<li>その他、当社が本サービスの提供が困難と判断した場合</li></ol>\r\n<li>当社は、本サービスの提供の停止または中断により、ユーザーまたは第三者が被ったいかなる不利益または損害についても、一切の責任を負わないものとします。</li></ol>\r\n\r\n<h2>第7条（利用制限および登録抹消）</h2>\r\n<ol><li>当社は、ユーザーが以下のいずれかに該当する場合には、事前の通知なく、ユーザーに対して、本サービスの全部もしくは一部の利用を制限し、またはユーザーとしての登録を抹消することができるものとします。</li>\r\n<ol><li>本規約のいずれかの条項に違反した場合</li>\r\n<li>登録事項に虚偽の事実があることが判明した場合</li>\r\n<li>料金等の支払債務の不履行があった場合</li>\r\n<li>当社からの連絡に対し、一定期間返答がない場合</li>\r\n<li>本サービスについて、最終の利用から一定期間利用がない場合</li>\r\n<li>その他、当社が本サービスの利用を適当でないと判断した場合</li></ol>\r\n<li>当社は、本条に基づき当社が行った行為によりユーザーに生じた損害について、一切の責任を負いません。</li></ol>\r\n\r\n<h2>第8条（退会）</h2>\r\n<p>ユーザーは、当社の定める退会手続により、本サービスから退会できるものとします。</p>\r\n\r\n<h2>第9条（保証の否認および免責事項）</h2>\r\n<ol><li>当社は、本サービスに事実上または法律上の瑕疵（安全性、信頼性、正確性、完全性、有効性、特定の目的への適合性、セキュリティなどに関する欠陥、エラーやバグ、権利侵害などを含みます。）がないことを明示的にも黙示的にも保証しておりません。</li>\r\n<li>当社は、本サービスに起因してユーザーに生じたあらゆる損害について、当社の故意又は重過失による場合を除き、一切の責任を負いません。ただし、本サービスに関する当社とユーザーとの間の契約（本規約を含みます。）が消費者契約法に定める消費者契約となる場合、この免責規定は適用されません。</li>\r\n<li>前項ただし書に定める場合であっても、当社は、当社の過失（重過失を除きます。）による債務不履行または不法行為によりユーザーに生じた損害のうち特別な事情から生じた損害（当社またはユーザーが損害発生につき予見し、または予見し得た場合を含みます。）について一切の責任を負いません。また、当社の過失（重過失を除きます。）による債務不履行または不法行為によりユーザーに生じた損害の賠償は、ユーザーから当該損害が発生した月に受領した利用料の額を上限とします。</li>\r\n<li>当社は、本サービスに関して、ユーザーと他のユーザーまたは第三者との間において生じた取引、連絡または紛争等について一切責任を負いません。</li></ol>\r\n\r\n<h2>第10条（サービス内容の変更等）</h2>\r\n<p>当社は、ユーザーへの事前の告知をもって、本サービスの内容を変更、追加または廃止することがあり、ユーザーはこれを承諾するものとします。</p>\r\n\r\n<h2>第11条（利用規約の変更）</h2>\r\n<ol><li>当社は以下の場合には、ユーザーの個別の同意を要せず、本規約を変更することができるものとします。</li>\r\n<ol><li>本規約の変更がユーザーの一般の利益に適合するとき。</li>\r\n<li>本規約の変更が本サービス利用契約の目的に反せず、かつ、変更の必要性、変更後の内容の相当性その他の変更に係る事情に照らして合理的なものであるとき。</li></ol>\r\n<li>当社はユーザーに対し、前項による本規約の変更にあたり、事前に、本規約を変更する旨及び変更後の本規約の内容並びにその効力発生時期を通知します。</li></ol>\r\n\r\n<h2>第12条（個人情報の取扱い）</h2>\r\n<p>当社は、本サービスの利用によって取得する個人情報については、当社「プライバシーポリシー」に従い適切に取り扱うものとします。</p>\r\n\r\n<h2>第13条（通知または連絡）</h2>\r\n<p>ユーザーと当社との間の通知または連絡は、当社の定める方法によって行うものとします。当社は、ユーザーから、当社が別途定める方式に従った変更届け出がない限り、現在登録されている連絡先が有効なものとみなして当該連絡先へ通知または連絡を行い、これらは、発信時にユーザーへ到達したものとみなします。</p>\r\n\r\n<h2>第14条（権利義務の譲渡の禁止）</h2>\r\n<p>ユーザーは、当社の書面による事前の承諾なく、利用契約上の地位または本規約に基づく権利もしくは義務を第三者に譲渡し、または担保に供することはできません。</p>\r\n\r\n<h2>第15条（準拠法・裁判管轄）</h2>\r\n<ol><li>本規約の解釈にあたっては、日本法を準拠法とします。</li>\r\n<li>本サービスに関して紛争が生じた場合には、当社の本店所在地を管轄する裁判所を専属的合意管轄とします。</li></ol>', '2023-12-31 15:00:00', '2023-12-31 15:00:00');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `administrators`
--
ALTER TABLE `administrators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `administrators_email_unique` (`email`);

--
-- テーブルのインデックス `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `category_shop`
--
ALTER TABLE `category_shop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_shop_shop_id_foreign` (`shop_id`),
  ADD KEY `category_shop_category_id_foreign` (`category_id`);

--
-- テーブルのインデックス `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- テーブルのインデックス `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `members_email_unique` (`email`),
  ADD KEY `members_stripe_id_index` (`stripe_id`);

--
-- テーブルのインデックス `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- テーブルのインデックス `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- テーブルのインデックス `regular_holidays`
--
ALTER TABLE `regular_holidays`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `regular_holiday_shop`
--
ALTER TABLE `regular_holiday_shop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `regular_holiday_shop_shop_id_foreign` (`shop_id`),
  ADD KEY `regular_holiday_shop_regular_holiday_id_foreign` (`regular_holiday_id`);

--
-- テーブルのインデックス `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservations_shop_id_foreign` (`shop_id`),
  ADD KEY `reservations_member_id_foreign` (`member_id`);

--
-- テーブルのインデックス `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_shop_id_foreign` (`shop_id`),
  ADD KEY `reviews_member_id_foreign` (`member_id`);

--
-- テーブルのインデックス `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `shop_member`
--
ALTER TABLE `shop_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_member_shop_id_foreign` (`shop_id`),
  ADD KEY `shop_member_member_id_foreign` (`member_id`);

--
-- テーブルのインデックス `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  ADD KEY `subscriptions_member_id_stripe_status_index` (`member_id`,`stripe_status`);

--
-- テーブルのインデックス `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`),
  ADD KEY `subscription_items_subscription_id_stripe_price_index` (`subscription_id`,`stripe_price`);

--
-- テーブルのインデックス `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `administrators`
--
ALTER TABLE `administrators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- テーブルの AUTO_INCREMENT `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- テーブルの AUTO_INCREMENT `category_shop`
--
ALTER TABLE `category_shop`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- テーブルの AUTO_INCREMENT `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- テーブルの AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- テーブルの AUTO_INCREMENT `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `regular_holidays`
--
ALTER TABLE `regular_holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- テーブルの AUTO_INCREMENT `regular_holiday_shop`
--
ALTER TABLE `regular_holiday_shop`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- テーブルの AUTO_INCREMENT `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;

--
-- テーブルの AUTO_INCREMENT `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- テーブルの AUTO_INCREMENT `shop_member`
--
ALTER TABLE `shop_member`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- テーブルの AUTO_INCREMENT `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- テーブルの AUTO_INCREMENT `terms`
--
ALTER TABLE `terms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `category_shop`
--
ALTER TABLE `category_shop`
  ADD CONSTRAINT `category_shop_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_shop_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- テーブルの制約 `regular_holiday_shop`
--
ALTER TABLE `regular_holiday_shop`
  ADD CONSTRAINT `regular_holiday_shop_regular_holiday_id_foreign` FOREIGN KEY (`regular_holiday_id`) REFERENCES `regular_holidays` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `regular_holiday_shop_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- テーブルの制約 `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservations_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- テーブルの制約 `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- テーブルの制約 `shop_member`
--
ALTER TABLE `shop_member`
  ADD CONSTRAINT `shop_member_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shop_member_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
