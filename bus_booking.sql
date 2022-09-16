-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2022 at 03:23 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_mails`
--

CREATE TABLE `admin_mails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `msg_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_msg` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` tinyint(4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name_en` varchar(255) NOT NULL,
  `name` varchar(25) NOT NULL,
  `description` longtext NOT NULL,
  `handler` longtext DEFAULT NULL,
  `php_handler` longtext DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `user_id`, `parent_id`, `name_en`, `name`, `description`, `handler`, `php_handler`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, NULL, 'Test', 'Test', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and \r\ntypesetting industry. Lorem Ipsum has been the industry\'s standard dummy\r\n text ever since the 1500s, when an unknown printer took a galley of \r\ntype and scrambled it to make a type specimen book. It has survived not \r\nonly five centuries, but also the leap into electronic typesetting, \r\nremaining essentially unchanged. It was popularised in the 1960s with \r\nthe release of Letraset sheets containing Lorem Ipsum passages, and more\r\n recently with desktop publishing software like Aldus PageMaker \r\nincluding versions of Lorem Ipsum.</p>', 'echo \"<p class=\'text-danger\'>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary,</p>\";', NULL, 1, NULL, NULL, '2022-09-06 12:11:22', '2022-09-07 15:08:58', '2022-09-06 09:41:22'),
(2, 1, 1, 'Robots', 'Robots', 'create robots txt file.<br>', '$source = public_path().\"/robots.txt\";\r\n$destName = \'robots.txt\';\r\nheader(\'HTTP/1.1 200 OK\');\r\nheader(\"Content-Length: \" . filesize($source));\r\nheader(\"Content-Description: file transfer\");\r\nheader(\"Content-transfer-encoding: binary\");\r\n//header(\'Expires: 0\');\r\n//header(\'Pragma: public\');\r\nheader(\'Content-Disposition: attachment; filename=\"\' . $destName . \'\"\');\r\n \r\nif ($fh = fopen($source, \'rb\')) {\r\n while (!feof($fh)) {\r\n print fread($fh, 1024);\r\n }\r\n fclose($fh);\r\n}', NULL, 1, NULL, NULL, '2022-09-06 12:24:12', '2022-09-07 11:46:47', '2022-09-06 09:54:12'),
(3, 1, 1, 'Corporate Information', 'Корпоративная информация', '<p>There are many variations of passages of Lorem Ipsum available, but the \r\nmajority have suffered alteration in some form, by injected humour, or \r\nrandomised words which don\'t look even slightly believable. If you are \r\ngoing to use a passage of Lorem Ipsum, you need to be sure there isn\'t \r\nanything embarrassing hidden in the middle of text. All the Lorem Ipsum \r\ngenerators on the Internet tend to repeat predefined chunks as \r\nnecessary,</p>', 'echo \"<p class=\'text-danger\'>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary,</p>\";', NULL, 1, NULL, NULL, '2022-09-06 12:26:10', '2022-09-07 12:07:49', '2022-09-06 09:56:10'),
(7, 1, 6, 'Demand Slowdown, Global Uncertainties Impacting India\'s Exports: Report', 'Замедление спроса, глобал', 'New Delhi:\r\n\r\nSubdued demand from developed countries and blocs like the US and EU is impacting exports of key sectors including engineering, gems and jewellery and may have implications on India\'s exports in case the global situation does not improve in coming months.\r\n\r\nGlobal inflation, Russia-Ukraine war, simmering China-Taiwan crisis and supply disruptions are hurting economic growth worldwide, leading to poor demand, experts say.\r\n\r\nThe world merchandise trade volume is expected to grow 3 per cent in 2022 against the earlier forecast of 4.7 per cent, mainly due to the ongoing war between Russia and Ukraine, according to the World Trade Organization forecast, released in April.\r\n\r\nOrganisation for Economic Cooperation and Development (OECD), a grouping of developed nations, has stated that G-20 merchandise trade growth has slowed markedly in value terms in second quarter of 2022 (April-June).\r\n\r\nExporters are keeping their fingers crossed over the country\'s exports growth and are hopeful that the situation would improve in coming months.\r\n\r\nDip in exports and increase in imports widens trade deficit, putting pressure on the value of domestic currency. It also has implications on jobs.\r\n\r\nIn August, the country\'s merchandise exports declined marginally 1.15 per cent to USD 33 billion and the trade deficit more than doubled to USD 28.68 billion on account of 37 per cent rise in imports during the month.', 'echo \"<p class=\'text-danger\'>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary,</p>\";', NULL, 1, NULL, NULL, '2022-09-07 08:40:28', '2022-09-07 15:09:18', '2022-09-07 06:10:28'),
(8, 1, 6, 'Binance in Talks to Create Crypto-Centric Hub In Nigeri', 'Binance ведет переговоры', 'Binance crypto exchange is coordinating with Nigeria to establish a special economic zone, powered by the crypto sector. In a recent study by CoinGecko, Nigeria surfaced out to be the most crypto curious nation in the world, which may have intrigued Binance to explore an opportunity of expanding the digital assets sector in the country. Upon completion, this crypto hub in Nigeria will make for the only such entity to exist in all of West Africa. This initiative, backed by Binance, is also being supported by the Nigeria Export Processing Zones Authority (NEPZA).\r\n\r\nThis ‘Virtual Free Zone\', being planned by the US-based crypto exchange and NEPZA, intends to bring together blockchain and Web3 entrepreneurs from the African continent and accelerate development and adoption in the sectors.\r\n\r\n“Our goal is to engender a flourishing virtual free zone to take advantage of a near trillion dollar virtual economy in blockchains and digital economy. We seek to break new grounds to widen economic opportunities for our citizens,” a Voice of Nigeria report quoted Adesoji Adesugba, Managing Director of NEPZA, as saying.', 'echo \"<p class=\'text-danger\'>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary,</p>\";', NULL, 1, NULL, NULL, '2022-09-07 08:41:20', '2022-09-07 15:09:24', '2022-09-07 06:11:20'),
(11, 1, 6, 'Instagram Is Removing Its Shopping Page Amid Commerce Retreat: Report', 'Instagram удаляет свою ст', 'Instagram is reportedly rolling back many of its shopping features in a move to drive more direct ad revenue. The Meta-owned photo and video sharing platform\'s existing shopping page will eventually disappear as the company would concentrate on its e-commerce efforts to those that directly drive advertising. It is reportedly planning to pivot towards a less personalised version of the shopping page, which is internally called \"Tab Lite\". The new development shows how the company is moving away from some long-term projects as it turns its attention to the short-form video business.', 'echo \"<p class=\'text-danger\'>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary,</p>\";', NULL, 1, NULL, NULL, '2022-09-07 09:25:34', '2022-09-07 15:09:30', '2022-09-07 06:55:34'),
(14, 1, NULL, 'Upload', 'Upload', '<p>Upload<br></p>', 'header(\'Content-type: application/json\');\r\n$filename = $_FILES[\"image\"][\"name\"];\r\n$tempname =  $_FILES[\"image\"][\"tmp_name\"];\r\n$temp = explode(\".\", $_FILES[\"image\"][\"name\"]);\r\n$newfilename = round(microtime(true)) . \'.\' . end($temp);\r\n$folder = \"./public/images/\" .$newfilename;\r\n\r\nif (move_uploaded_file($tempname, $folder)) {\r\n $data = [ \'status\' => \'true\', \'message\' => \'File uploaded successfully!\' ];\r\n} else {\r\n $data = [ \'status\' => \'false\', \'message\' => \'File not uploaded successfully!\' ];\r\n}\r\n\r\necho json_encode( $data );', NULL, 1, NULL, NULL, '2022-09-07 12:58:55', '2022-09-07 13:35:28', '2022-09-07 10:28:55'),
(17, 1, NULL, 'PDF', 'PDF', '<p>Dowload PDF File</p>', '$source = public_path(). \"/doc/equipments/2022/07/01/sample_1656674915.pdf\";\r\n$ext = pathinfo($source, PATHINFO_EXTENSION);\r\n$destName = time().rand(100,999).\'.\'.$ext;\r\nheader(\'HTTP/1.1 200 OK\');\r\nheader(\"Content-Length: \" . filesize($source));\r\nheader(\"Content-Description: file transfer\");\r\nheader(\"Content-transfer-encoding: binary\");\r\n//header(\'Expires: 0\');\r\n//header(\'Pragma: public\');\r\nheader(\'Content-Disposition: attachment; filename=\"\' . $destName . \'\"\');\r\n \r\nif ($fh = fopen($source, \'rb\')) {\r\n while (!feof($fh)) {\r\n print fread($fh, 1024);\r\n }\r\n fclose($fh);\r\n}', NULL, 1, NULL, NULL, '2022-09-09 11:43:39', '2022-09-09 11:43:39', '2022-09-09 09:13:39'),
(19, 1, NULL, 'Get News', 'Get News', '<p>Get News<br></p>', NULL, '/var/www/vhosts/test-staylon.ru/cmsnew.test-staylon.ru/public/files/get_news.php', 1, NULL, NULL, '2022-09-12 07:47:07', '2022-09-12 07:47:07', '2022-09-12 05:17:07');

-- --------------------------------------------------------

--
-- Table structure for table `apis`
--

CREATE TABLE `apis` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name_en` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `request_type` varchar(255) NOT NULL,
  `authorization` varchar(255) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `routepath` text DEFAULT NULL,
  `permissions` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `apis`
--

INSERT INTO `apis` (`id`, `user_id`, `name_en`, `name`, `description`, `request_type`, `authorization`, `agent_id`, `routepath`, `permissions`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 1, 'Get test', 'Get test', 'Download test.txt file<br>', 'GET', 'No', 1, '/api/v1/test/2', NULL, 1, NULL, NULL, '2022-09-07 10:41:01', '2022-09-07 13:38:01', '2022-09-07 08:11:01'),
(5, 1, 'Upload File', 'Upload File', '<p>Upload File<br></p>', 'POST', 'Yes', 14, '/api/v1/test/upload', NULL, 1, NULL, NULL, '2022-09-07 12:57:33', '2022-09-07 13:33:19', '2022-09-07 10:27:33'),
(7, 1, 'Download PDF', 'Download PDF', '<p>Download PDF File API<br></p>', 'GET', 'No', 17, '/api/v1/pdf', NULL, 1, NULL, NULL, '2022-09-09 11:44:15', '2022-09-09 11:44:15', '2022-09-09 09:14:15'),
(8, 1, 'Upload Image File', 'Upload Image File', '<p>Upload Image API<br></p>', 'POST', 'No', 14, '/api/v1/upload-image', NULL, 1, NULL, NULL, '2022-09-09 11:48:11', '2022-09-09 11:48:11', '2022-09-09 09:18:11');

-- --------------------------------------------------------

--
-- Table structure for table `api_access_token`
--

CREATE TABLE `api_access_token` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `token` text NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_access_token`
--

INSERT INTO `api_access_token` (`id`, `user_id`, `api_id`, `token`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'QWRtaW4xMjNAI3N1cGVyYW1pbkBnbWFpbC5jb20=', 1, 1, '2022-09-06 15:01:03', '2022-09-07 04:48:33', '2022-09-06 12:31:43'),
(2, 1, 2, 'QWRtaW4xMjNAI3N1cGVyYW1pbkBnbWFpbC5jb20=', 1, 1, '2022-09-07 07:24:54', '2022-09-07 07:26:50', '2022-09-07 04:54:54'),
(3, 1, 3, 'QWRtaW4xMjNAI3N1cGVyYW1pbkBnbWFpbC5jb20=', 1, 1, '2022-09-07 07:53:46', '2022-09-07 08:03:33', '2022-09-07 05:23:46'),
(4, 1, 4, 'QWRtaW4xMjNAI3N1cGVyYW1pbkBnbWFpbC5jb20=', 1, 1, '2022-09-07 09:00:28', '2022-09-07 09:08:31', '2022-09-07 06:30:28'),
(5, 1, 5, 'QWRtaW4xMjNAI3N1cGVyYW1pbkBnbWFpbC5jb20=', 1, 1, '2022-09-07 09:09:05', '2022-09-07 13:00:05', '2022-09-07 06:39:05'),
(6, 1, 0, 'QWRtaW4xMjNAI3N1cGVyYW1pbkBnbWFpbC5jb20=', 1, 1, '2022-09-06 15:01:03', '2022-09-07 04:48:33', '2022-09-06 12:31:43'),
(7, 1, 1, 'QWRtaW4xMjNAI3N1cGVyYW1pbkBnbWFpbC5jb20=', 1, NULL, '2022-09-07 10:19:00', '2022-09-07 10:19:00', '2022-09-07 07:49:00'),
(8, 1, 2, 'QWRtaW4xMjNAI3N1cGVyYW1pbkBnbWFpbC5jb20=', 1, NULL, '2022-09-07 10:22:29', '2022-09-07 10:22:29', '2022-09-07 07:52:29'),
(9, 1, 3, 'QWRtaW4xMjNAI3N1cGVyYW1pbkBnbWFpbC5jb20=', 1, NULL, '2022-09-07 10:41:01', '2022-09-07 10:41:01', '2022-09-07 08:11:01'),
(10, 1, 4, 'QWRtaW4xMjNAI3N1cGVyYW1pbkBnbWFpbC5jb20=', 1, NULL, '2022-09-07 12:11:56', '2022-09-07 12:11:56', '2022-09-07 09:41:56'),
(11, 1, 5, 'QWRtaW4xMjNAI3N1cGVyYW1pbkBnbWFpbC5jb20=', 1, NULL, '2022-09-07 12:57:33', '2022-09-07 12:57:33', '2022-09-07 10:27:33'),
(12, 1, 6, 'QWRtaW4xMjNAI3N1cGVyYW1pbkBnbWFpbC5jb20=', 1, NULL, '2022-09-09 11:41:12', '2022-09-09 11:41:12', '2022-09-09 09:11:12'),
(13, 1, 7, 'QWRtaW4xMjNAI3N1cGVyYW1pbkBnbWFpbC5jb20=', 1, NULL, '2022-09-09 11:44:15', '2022-09-09 11:44:15', '2022-09-09 09:14:15'),
(14, 1, 8, 'QWRtaW4xMjNAI3N1cGVyYW1pbkBnbWFpbC5jb20=', 1, NULL, '2022-09-09 11:48:11', '2022-09-09 11:48:11', '2022-09-09 09:18:11');

-- --------------------------------------------------------

--
-- Table structure for table `bus_times`
--

CREATE TABLE `bus_times` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `sub_category_id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bus_time` time NOT NULL,
  `night_adult_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `night_child_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day_adult_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day_child_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(255) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bus_times`
--

INSERT INTO `bus_times` (`id`, `user_id`, `category_id`, `sub_category_id`, `name_en`, `name`, `bus_time`, `night_adult_price`, `night_child_price`, `day_adult_price`, `day_child_price`, `qty`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'RedBus', '{\"name_en\":\"RedBus\"}', '11:00:00', '40', '35', '30', '25', 100, 1, NULL, '2022-09-14 07:34:11', '2022-09-14 07:34:11'),
(2, 1, 1, 1, 'RedBus', '{\"name_en\":\"RedBus\"}', '12:00:00', '40', '35', '30', '25', 100, 1, NULL, '2022-09-14 07:39:19', '2022-09-14 07:39:19'),
(3, 1, 1, 1, 'RedBus', '{\"name_en\":\"RedBus\"}', '13:00:00', '40', '35', '30', '25', 100, 2, NULL, '2022-09-14 07:39:43', '2022-09-14 08:30:36'),
(4, 1, 1, 1, 'RedBus', '{\"name_en\":\"RedBus\"}', '14:00:00', '40', '35', '30', '25', 100, 1, NULL, '2022-09-14 07:40:07', '2022-09-14 07:40:07'),
(5, 1, 1, 1, 'RedBus', '{\"name_en\":\"RedBus\"}', '15:00:00', '40', '35', '30', '25', 100, 1, NULL, '2022-09-14 07:40:17', '2022-09-14 07:40:17'),
(6, 1, 1, 1, 'RedBus', '{\"name_en\":\"RedBus\"}', '16:00:00', '40', '35', '30', '25', 100, 1, NULL, '2022-09-14 07:40:37', '2022-09-14 07:40:37'),
(7, 1, 1, 1, 'RedBus', '{\"name_en\":\"RedBus\"}', '17:00:00', '40', '35', '30', '25', 100, 1, NULL, '2022-09-14 07:40:47', '2022-09-14 07:40:47'),
(8, 1, 1, 1, 'RedBus', '{\"name_en\":\"RedBus\"}', '18:00:00', '40', '35', '30', '25', 100, 1, NULL, '2022-09-14 07:40:57', '2022-09-14 07:40:57'),
(9, 1, 1, 1, 'RedBus', '{\"name_en\":\"RedBus\"}', '19:00:00', '40', '35', '30', '25', 100, 1, NULL, '2022-09-14 07:41:07', '2022-09-14 07:41:07'),
(10, 1, 1, 1, 'RedBus', '{\"name_en\":\"RedBus\"}', '20:00:00', '40', '35', '30', '25', 100, 1, NULL, '2022-09-14 07:41:16', '2022-09-14 07:41:16');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(36) NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` bigint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `user_id`, `name_en`, `name`, `description`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '1', 'Tickets', '{\"name_en\":\"Tickets\",\"name_ru\":\"\\u041f\\u0440\\u043e\\u0435\\u0437\\u0434\\u043d\\u043e\\u0439 \\u0431\\u0438\\u043b\\u0435\\u0442\"}', NULL, 1, NULL, '2022-09-13 10:24:09', '2022-09-13 10:40:33');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_forms`
--

CREATE TABLE `contact_forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_msg` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` tinyint(4) DEFAULT NULL,
  `admin_read_at` tinyint(4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_logs`
--

CREATE TABLE `file_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `filename` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `file_logs`
--

INSERT INTO `file_logs` (`id`, `filename`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'dmart_equipments_1656334693_892455852.csv', 2, 1, NULL, '2022-06-28 00:44:11', '2022-06-28 00:44:11'),
(2, 'dmart_equipments_1656398361_342389006.csv', 2, 1, NULL, '2022-06-28 01:09:35', '2022-06-28 01:09:35'),
(3, 'dmart_equipments_1656398361_342389006.csv', 1, 1, NULL, '2022-06-28 01:12:09', '2022-06-28 01:12:09'),
(4, 'dmart_equipments_1656398361_342389006.csv', 1, 1, NULL, '2022-06-28 02:13:03', '2022-06-28 02:13:03'),
(5, 'dmart_equipments_1656577341_890643362.csv', 1, 1, NULL, '2022-06-30 03:08:58', '2022-06-30 03:08:58'),
(6, 'dmart_equipments_1656577341_890643362.csv', 1, 1, NULL, '2022-06-30 03:22:12', '2022-06-30 03:22:12');

-- --------------------------------------------------------

--
-- Table structure for table `info_blockdatas`
--

CREATE TABLE `info_blockdatas` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ifbgroup_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `element` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `annou_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `annou_desc` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail_desc` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_defined` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `info_blockdatas`
--

INSERT INTO `info_blockdatas` (`id`, `ifbgroup_id`, `user_id`, `parent_id`, `element`, `start_date`, `end_date`, `status`, `title`, `annou_picture`, `annou_desc`, `detail_picture`, `detail_desc`, `user_defined`, `created_at`, `updated_at`) VALUES
('672cdc70-4600-4f82-a581-d9fc8d3f4206', '8b572e50-26ca-4eab-ad75-95ebe093dae7', '1', NULL, 'element', '2022-08-24 12:16:03', NULL, 'Yes', 'Testing', NULL, NULL, NULL, NULL, '{\"TEST\":\"radio_1\"}', '2022-08-24 12:16:45', '2022-08-26 12:31:57'),
('ea84ba53-f670-4991-86b5-010bc26bc7f4', 'fcff71e3-5fbd-47f0-a11d-1ce10336a643', '1', NULL, 'element', '2022-09-09 12:27:44', NULL, 'Yes', 'sdfasdfasdf', NULL, NULL, NULL, '<p>sdafasdfasdf</p>', '{\"TEST\":\"radio_1\"}', '2022-09-09 12:27:56', '2022-09-09 12:27:56');

-- --------------------------------------------------------

--
-- Table structure for table `info_blocks`
--

CREATE TABLE `info_blocks` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `info_blocks`
--

INSERT INTO `info_blocks` (`id`, `user_id`, `name_en`, `name`, `description`, `created_at`, `updated_at`) VALUES
('b0d2f15b-b533-41c0-82e2-c8804fdb9316', '1', 'data', 'Данные', NULL, '2022-09-02 12:59:38', '2022-09-02 12:59:38');

-- --------------------------------------------------------

--
-- Table structure for table `info_block_groups`
--

CREATE TABLE `info_block_groups` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ifblock_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `info_block_groups`
--

INSERT INTO `info_block_groups` (`id`, `ifblock_id`, `user_id`, `name_en`, `name`, `created_at`, `updated_at`) VALUES
('4cdbb1e9-952a-45f7-807d-48fcbd1fecc1', '3c7cff54-86df-47bc-af5f-1c5b3ab4244f', '1', 'News', 'News', '2022-08-24 15:36:40', '2022-08-24 15:36:40'),
('8b572e50-26ca-4eab-ad75-95ebe093dae7', '3c7cff54-86df-47bc-af5f-1c5b3ab4244f', '1', 'Official information', 'Официальная информация', '2022-08-23 10:01:58', '2022-08-23 10:16:44'),
('9deeef51-f870-461a-b34b-48efc266d8c4', '3c7cff54-86df-47bc-af5f-1c5b3ab4244f', '1', 'Testing', 'Testing', '2022-08-23 10:02:38', '2022-08-23 10:02:38'),
('eff70a5e-007e-4403-8608-97eb16a18a65', 'b5daefb2-fdb6-4588-9e4a-2b305789b379', '1', 'Sample', 'sample', '2022-08-25 15:17:51', '2022-08-25 15:17:51'),
('fcff71e3-5fbd-47f0-a11d-1ce10336a643', 'b0d2f15b-b533-41c0-82e2-c8804fdb9316', '1', 'smena', 'Смены', '2022-09-02 12:59:54', '2022-09-02 12:59:54');

-- --------------------------------------------------------

--
-- Table structure for table `info_form_fields`
--

CREATE TABLE `info_form_fields` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ifbgroup_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prop_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mandatory_chk` tinyint(4) DEFAULT NULL,
  `search_chk` tinyint(4) DEFAULT NULL,
  `sections_chk` tinyint(4) DEFAULT NULL,
  `field_style` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extended_chk` tinyint(4) DEFAULT NULL,
  `admin_created` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `info_form_fields`
--

INSERT INTO `info_form_fields` (`id`, `ifbgroup_id`, `user_id`, `field_name`, `prop_name`, `field_type`, `mandatory_chk`, `search_chk`, `sections_chk`, `field_style`, `extended_chk`, `admin_created`, `created_at`, `updated_at`) VALUES
('0a12cb13-37ce-477e-8565-709114557d62', 'ba535bda-c963-4bc8-b565-cf740e94b275', '68040974-c2bf-4e95-8b0b-702d4e457c69', 'DATA_END', 'Деактивировать', 'DATA', NULL, NULL, 1, NULL, NULL, 1, '2022-08-19 10:52:27', '2022-08-19 10:52:27'),
('2d6bf210-0f3b-4a48-8725-2d8bda1ca2eb', 'ba535bda-c963-4bc8-b565-cf740e94b275', '68040974-c2bf-4e95-8b0b-702d4e457c69', 'DETAIL_VALUE', 'Детальный текст', 'HTML', NULL, 1, 1, 'width:700px; height:200px;', NULL, 1, '2022-08-19 10:54:30', '2022-08-19 10:54:30'),
('357c6db3-ac9c-4b81-a23f-8855a1233e91', 'ba535bda-c963-4bc8-b565-cf740e94b275', '68040974-c2bf-4e95-8b0b-702d4e457c69', 'DATA_START', 'Дата', 'DATA', NULL, NULL, 1, NULL, NULL, 1, '2022-08-19 10:51:55', '2022-08-19 10:51:55'),
('3d523b66-76cd-45fe-bbfa-8d933bb5508b', 'ba535bda-c963-4bc8-b565-cf740e94b275', '68040974-c2bf-4e95-8b0b-702d4e457c69', 'DETAIL_PICTURE', 'Детальная картинка', 'FILE', NULL, NULL, 1, NULL, NULL, 1, '2022-08-19 10:54:06', '2022-08-19 10:54:06'),
('4bcdc5e6-56b9-4c6a-868f-392f689ff5a7', 'ba535bda-c963-4bc8-b565-cf740e94b275', '68040974-c2bf-4e95-8b0b-702d4e457c69', 'ANONS_VALUE', 'Текст анонса', 'TEXT', NULL, 1, 1, 'width:700px; height:200px;', NULL, 1, '2022-08-19 10:53:51', '2022-08-19 10:53:51'),
('5abe235d-ed44-471f-8a22-2ddc9086ffe4', 'ba535bda-c963-4bc8-b565-cf740e94b275', '68040974-c2bf-4e95-8b0b-702d4e457c69', 'ANONS_PICTURE', 'Файл', 'FILE', NULL, NULL, 1, NULL, NULL, 1, '2022-08-19 10:53:24', '2022-08-19 10:53:24'),
('92556840-6c99-47c7-b851-00572f450f61', 'ba535bda-c963-4bc8-b565-cf740e94b275', '68040974-c2bf-4e95-8b0b-702d4e457c69', 'NAME', 'Название', 'CHAR', 1, 1, 1, 'width:230px;', NULL, 1, '2022-08-19 10:53:05', '2022-08-19 10:53:05'),
('94781015-70cd-48bf-98b0-d70da5250579', 'ba535bda-c963-4bc8-b565-cf740e94b275', '68040974-c2bf-4e95-8b0b-702d4e457c69', 'ACTIVE', 'Активна', 'RADIO', NULL, NULL, 1, NULL, NULL, 1, '2022-08-19 10:52:43', '2022-08-19 10:52:43'),
('f9ef92ef-42e9-4c44-8bbe-be5c9316ea4d', '4cdbb1e9-952a-45f7-807d-48fcbd1fecc1', '1', 'TEST', 'test', 'RADIO', 1, 1, 1, NULL, NULL, NULL, '2022-08-24 17:39:14', '2022-08-26 12:23:58');

-- --------------------------------------------------------

--
-- Table structure for table `info_form_fields_value`
--

CREATE TABLE `info_form_fields_value` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `field_id` text NOT NULL,
  `field_type` varchar(255) NOT NULL,
  `field_label` varchar(255) NOT NULL,
  `field_value` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `info_form_fields_value`
--

INSERT INTO `info_form_fields_value` (`id`, `user_id`, `field_id`, `field_type`, `field_label`, `field_value`, `created_at`, `updated_at`) VALUES
(1, 1, 'f9ef92ef-42e9-4c44-8bbe-be5c9316ea4d', 'SELECT', 'Test', 'Test', '2022-08-26 12:04:21', '2022-08-26 12:04:21'),
(2, 1, 'f9ef92ef-42e9-4c44-8bbe-be5c9316ea4d', 'CHECKBOX', 'Show', 'show', '2022-08-26 12:17:41', '2022-08-26 12:17:41'),
(3, 1, 'f9ef92ef-42e9-4c44-8bbe-be5c9316ea4d', 'RADIO', 'radio 1', 'radio_1', '2022-08-26 12:24:15', '2022-08-26 12:24:15');

-- --------------------------------------------------------

--
-- Table structure for table `languages_code`
--

CREATE TABLE `languages_code` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages_code`
--

INSERT INTO `languages_code` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'ab', 'Abkhaz', '2022-08-30 06:17:41', '2022-08-30 06:17:41'),
(2, 'aa', 'Afar', '2022-08-30 06:24:17', '2022-08-30 06:24:17'),
(3, 'af', 'Afrikaans', '2022-08-30 06:24:34', '2022-08-30 06:24:34'),
(4, 'ak', 'Akan', '2022-08-30 06:24:46', '2022-08-30 06:24:46'),
(5, 'sq', 'Albanian', '2022-08-30 06:24:58', '2022-08-30 06:24:58'),
(6, 'am', 'Amharic', '2022-08-30 06:25:11', '2022-08-30 06:25:11'),
(7, 'ar', 'Arabic', '2022-08-30 06:25:33', '2022-08-30 06:25:33'),
(8, 'an', 'Aragonese', '2022-08-30 06:25:44', '2022-08-30 06:25:44'),
(9, 'hy', 'Armenian', '2022-08-30 06:25:54', '2022-08-30 06:25:54'),
(10, 'as', 'Assamese', '2022-08-30 06:26:06', '2022-08-30 06:26:06'),
(11, 'av', 'Avaric', '2022-08-30 06:26:16', '2022-08-30 06:26:16'),
(12, 'ae', 'Avestan', '2022-08-30 06:26:27', '2022-08-30 06:26:27'),
(13, 'ay', 'Aymara', '2022-08-30 06:26:40', '2022-08-30 06:26:40'),
(14, 'az', 'Azerbaijani', '2022-08-30 06:26:58', '2022-08-30 06:26:58'),
(15, 'bm', 'Bambara', '2022-08-30 06:27:14', '2022-08-30 06:27:14'),
(16, 'ba', 'Bashkir', '2022-08-30 06:27:24', '2022-08-30 06:27:24'),
(17, 'eu', 'Basque', '2022-08-30 06:27:34', '2022-08-30 06:27:34'),
(18, 'be', 'Belarusian', '2022-08-30 06:27:42', '2022-08-30 06:27:42'),
(19, 'bi', 'Bislama', '2022-08-30 06:27:59', '2022-08-30 06:27:59'),
(20, 'bs', 'Bosnian', '2022-08-30 06:28:09', '2022-08-30 06:28:09'),
(21, 'br', 'Breton', '2022-08-30 06:28:19', '2022-08-30 06:28:19'),
(22, 'bg', 'Bulgarian', '2022-08-30 06:28:28', '2022-08-30 06:28:28'),
(23, 'my', 'Burmese', '2022-08-30 06:28:42', '2022-08-30 06:28:42'),
(24, 'ca', 'Catalan', '2022-08-30 06:28:55', '2022-08-30 06:28:55'),
(25, 'ch', 'Chamorro', '2022-08-30 06:29:05', '2022-08-30 06:29:05'),
(26, 'ce', 'Chechen', '2022-08-30 06:29:14', '2022-08-30 06:29:14'),
(27, 'zh', 'Chinese', '2022-08-30 06:29:46', '2022-08-30 06:29:46'),
(28, 'cv', 'Chuvash', '2022-08-30 06:29:57', '2022-08-30 06:29:57'),
(29, 'kw', 'Cornish', '2022-08-30 06:30:08', '2022-08-30 06:30:08'),
(30, 'co', 'Corsican', '2022-08-30 06:30:17', '2022-08-30 06:30:17'),
(31, 'cr', 'Cree', '2022-08-30 06:30:28', '2022-08-30 06:30:28'),
(32, 'hr', 'Croatian', '2022-08-30 06:30:36', '2022-08-30 06:30:36'),
(33, 'cs', 'Czech', '2022-08-30 06:30:46', '2022-08-30 06:30:46'),
(34, 'da', 'Danish', '2022-08-30 06:30:56', '2022-08-30 06:30:56'),
(35, 'nl', 'Dutch', '2022-08-30 06:31:07', '2022-08-30 06:31:07'),
(36, 'en', 'English', '2022-08-30 06:31:16', '2022-08-30 06:31:16'),
(37, 'eo', 'Esperanto', '2022-08-30 06:31:27', '2022-08-30 06:31:27'),
(38, 'et', 'Estonian', '2022-08-30 06:31:40', '2022-08-30 06:31:40'),
(39, 'fo', 'Faroese', '2022-08-30 06:31:53', '2022-08-30 06:31:53'),
(40, 'fj', 'Fijian', '2022-08-30 06:32:03', '2022-08-30 06:32:20'),
(41, 'fi', 'Finnish', '2022-08-30 06:32:33', '2022-08-30 06:32:33'),
(42, 'fr', 'French', '2022-08-30 06:32:44', '2022-08-30 06:32:44'),
(43, 'gl', 'Galician', '2022-08-30 06:32:59', '2022-08-30 06:32:59'),
(44, 'ka', 'Georgian', '2022-08-30 06:33:10', '2022-08-30 06:33:10'),
(45, 'de', 'German', '2022-08-30 06:33:20', '2022-08-30 06:33:20'),
(46, 'el', 'Greek', '2022-08-30 06:33:37', '2022-08-30 06:33:37'),
(47, 'ht', 'Haitian', '2022-08-30 06:33:52', '2022-08-30 06:33:52'),
(48, 'ha', 'Hausa', '2022-08-30 06:34:01', '2022-08-30 06:34:01'),
(49, 'he', 'Hebrew', '2022-08-30 06:34:12', '2022-08-30 06:34:12'),
(50, 'hu', 'Hungarian', '2022-08-30 06:34:41', '2022-08-30 06:35:34'),
(51, 'hi', 'Hindi', '2022-08-30 06:34:53', '2022-08-30 06:34:53'),
(52, 'ia', 'Interlingua', '2022-08-30 06:35:51', '2022-08-30 06:35:51'),
(53, 'id', 'Indonesian', '2022-08-30 06:36:00', '2022-08-30 06:36:00'),
(54, 'ie', 'Interlingue', '2022-08-30 06:36:10', '2022-08-30 06:36:10'),
(55, 'ga', 'Irish', '2022-08-30 06:36:21', '2022-08-30 06:36:21'),
(56, 'it', 'Italian', '2022-08-30 06:36:37', '2022-08-30 06:36:37'),
(57, 'ja', 'Japanese', '2022-08-30 06:36:54', '2022-08-30 06:36:54'),
(58, 'jv', 'Javanese', '2022-08-30 06:37:02', '2022-08-30 06:37:02'),
(59, 'kl', 'Kalaallisut', '2022-08-30 06:37:12', '2022-08-30 06:37:12'),
(60, 'ko', 'Korean', '2022-08-30 06:37:58', '2022-08-30 06:37:58'),
(61, 'la', 'Latin', '2022-08-30 06:38:22', '2022-08-30 06:38:22'),
(62, 'lt', 'Lithuanian', '2022-08-30 06:38:56', '2022-08-30 06:38:56'),
(63, 'lv', 'Latvian', '2022-08-30 06:39:06', '2022-08-30 06:39:06'),
(64, 'mk', 'Macedonian', '2022-08-30 06:40:11', '2022-08-30 06:40:11'),
(65, 'ms', 'Malay', '2022-08-30 06:40:34', '2022-08-30 06:40:34'),
(66, 'mt', 'Maltese', '2022-08-30 06:40:44', '2022-08-30 06:40:44'),
(67, 'mn', 'Mongolian', '2022-08-30 06:40:56', '2022-08-30 06:40:56'),
(68, 'nb', 'Norwegian', '2022-08-30 06:42:05', '2022-08-30 06:42:05'),
(69, 'fa', 'Persian', '2022-08-30 06:42:43', '2022-08-30 06:42:43'),
(70, 'pl', 'Polish', '2022-08-30 06:42:53', '2022-08-30 06:42:53'),
(71, 'pt', 'Portuguese', '2022-08-30 06:43:05', '2022-08-30 06:43:05'),
(72, 'ro', 'Romanian', '2022-08-30 06:43:32', '2022-08-30 06:43:32'),
(73, 'ru', 'Russian', '2022-08-30 06:43:40', '2022-08-30 06:43:40'),
(74, 'sr', 'Serbian', '2022-08-30 06:44:04', '2022-08-30 06:44:04'),
(75, 'sk', 'Slovak', '2022-08-30 06:44:25', '2022-08-30 06:44:25'),
(76, 'es', 'Spanish', '2022-08-30 06:44:44', '2022-08-30 06:44:44'),
(77, 'sw', 'Swahili', '2022-08-30 06:45:01', '2022-08-30 06:45:01'),
(78, 'sv', 'Swedish', '2022-08-30 06:45:14', '2022-08-30 06:45:14'),
(79, 'th', 'Thai', '2022-08-30 06:45:23', '2022-08-30 06:45:23'),
(80, 'tr', 'Turkish', '2022-08-30 06:45:43', '2022-08-30 06:45:43'),
(81, 'uk', 'Ukrainian', '2022-08-30 06:46:04', '2022-08-30 06:46:04'),
(82, 'vi', 'Vietnamese', '2022-08-30 06:46:18', '2022-08-30 06:46:18'),
(83, 'cy', 'Welsh', '2022-08-30 06:46:37', '2022-08-30 06:46:37'),
(84, 'yi', 'Yiddish', '2022-08-30 06:47:17', '2022-08-30 06:47:17');

-- --------------------------------------------------------

--
-- Table structure for table `languagetranslations`
--

CREATE TABLE `languagetranslations` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `lang_trans_val` text DEFAULT NULL,
  `en_value` varchar(255) DEFAULT NULL,
  `ru_value` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languagetranslations`
--

INSERT INTO `languagetranslations` (`id`, `key`, `lang_trans_val`, `en_value`, `ru_value`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', '{\"en\":\"Dashboard\",\"es\":\"Tablero\",\"ru\":\"\\u041f\\u0430\\u043d\\u0435\\u043b\\u044c \\u0443\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\"}', 'Dashboard', 'Панель управления', '2022-08-29 08:15:50', '2022-08-30 09:29:02'),
(2, 'structure', '{\"en\":\"Structure\",\"es\":\"Estructura\",\"ru\":\"\\u0421\\u0442\\u0440\\u0443\\u043a\\u0442\\u0443\\u0440\\u0430\"}', 'Structure', 'Структура', '2022-08-29 08:24:47', '2022-08-30 08:17:07'),
(3, 'infoblocks', '{\"en\":\"InfoBlocks\",\"es\":\"Bloque de informaci\\u00f3n\",\"ru\":\"\\u0418\\u043d\\u0444\\u043e\\u0431\\u043b\\u043e\\u043a\\u0438\"}', 'InfoBlocks', 'Инфоблоки', '2022-08-29 08:25:50', '2022-09-02 14:59:59'),
(4, 'templates', '{\"en\":\"Templates\",\"es\":\"Plantillas\",\"ru\":\"\\u0428\\u0430\\u0431\\u043b\\u043e\\u043d\\u044b\"}', 'Templates', 'Шаблоны', '2022-08-29 08:28:52', '2022-08-30 08:29:54'),
(5, 'components', '{\"en\":\"Components\",\"es\":\"Componentes\",\"ru\":\"\\u041a\\u043e\\u043c\\u043f\\u043e\\u043d\\u0435\\u043d\\u0442\\u044b\"}', 'Components', 'Компоненты', '2022-08-29 08:28:58', '2022-08-30 08:30:05'),
(6, 'users', '{\"en\":\"Users\",\"es\":\"Usuarias\",\"ru\":\"\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u0442\\u0435\\u043b\\u0438\"}', 'Users', 'пользователи', '2022-08-29 08:29:03', '2022-08-30 08:30:15'),
(7, 'groups', '{\"en\":\"Groups\",\"es\":\"Grupos\",\"ru\":\"\\u0413\\u0440\\u0443\\u043f\\u043f\\u044b \\u0438 \\u043f\\u0440\\u0430\\u0432\\u0430\"}', 'Groups', 'Группы и права', '2022-08-29 08:29:09', '2022-08-30 08:30:23'),
(8, 'agents', '{\"en\":\"Agents\",\"es\":\"Agentes\",\"ru\":\"\\u0410\\u0433\\u0435\\u043d\\u0442\\u044b\"}', 'Agents', 'Агенты', '2022-08-29 08:29:14', '2022-08-30 08:30:30'),
(9, 'planner', '{\"en\":\"Planner\",\"es\":\"Planificadora\",\"ru\":\"\\u041f\\u043b\\u0430\\u043d\\u0438\\u0440\\u043e\\u0432\\u0449\\u0438\\u043a\"}', 'Planner', 'Планировщик', '2022-08-29 08:29:18', '2022-08-30 08:30:38'),
(10, 'logout', '{\"en\":\"Logout\",\"es\":\"Cerrar sesi\\u00f3n\",\"ru\":\"\\u0412\\u044b\\u0439\\u0442\\u0438\"}', 'Logout', 'Выйти', '2022-08-29 08:29:23', '2022-08-30 08:30:47'),
(11, 'add_record', '{\"en\":\"Add Record\",\"es\":\"Agregar registro\",\"ru\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c \\u0437\\u0430\\u043f\\u0438\\u0441\\u044c\"}', 'Add Record', 'Добавить запись', '2022-08-29 08:29:28', '2022-08-30 08:31:01'),
(12, 'update_record', '{\"en\":\"Update Record\",\"es\":\"Actualizar registro\",\"ru\":\"\\u041e\\u0431\\u043d\\u043e\\u0432\\u0438\\u0442\\u044c \\u0437\\u0430\\u043f\\u0438\\u0441\\u044c\"}', 'Update Record', 'Обновить запись', '2022-08-29 08:29:39', '2022-08-30 08:31:09'),
(13, 'reset', '{\"en\":\"Reset\",\"es\":\"Reiniciar\",\"ru\":\"\\u041f\\u0435\\u0440\\u0435\\u0437\\u0430\\u0433\\u0440\\u0443\\u0437\\u0438\\u0442\\u044c\"}', 'Reset', 'Перезагрузить', '2022-08-29 08:29:44', '2022-08-30 08:31:21'),
(14, 'back', '{\"en\":\"Back\",\"es\":\"atr\\u00e1s\",\"ru\":\"\\u041d\\u0430\\u0437\\u0430\\u0434\"}', 'Back', 'Назад', '2022-08-29 08:29:50', '2022-09-09 08:49:39'),
(15, 'actions', '{\"en\":\"Actions\",\"es\":\"Comportamiento\",\"ru\":\"\\u0414\\u0435\\u0439\\u0441\\u0442\\u0432\\u0438\\u044f\"}', 'Actions', 'Действия', '2022-08-29 08:29:56', '2022-08-30 08:31:36'),
(16, 'select_option', '{\"en\":\"Select Option\",\"es\":\"Seleccionar opci\\u00f3n\"}', 'Select Option', NULL, '2022-08-29 08:30:00', '2022-08-30 08:24:14'),
(17, 'templates_list', '{\"en\":\"Templates List\",\"es\":\"Lista de plantillas\",\"ru\":\"\\u0421\\u043f\\u0438\\u0441\\u043e\\u043a \\u0448\\u0430\\u0431\\u043b\\u043e\\u043d\\u043e\\u0432\"}', 'Templates List', 'Список шаблонов', '2022-08-29 08:30:02', '2022-08-30 08:31:45'),
(18, 'add_template', '{\"en\":\"Add Template\",\"es\":\"Agregar plantilla\",\"ru\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c \\u0448\\u0430\\u0431\\u043b\\u043e\\u043d\"}', 'Add Template', 'Добавить шаблон', '2022-08-29 08:30:07', '2022-08-30 08:31:55'),
(19, 'update_template', '{\"en\":\"Update Template\",\"es\":\"Actualizar plantilla\",\"ru\":\"\\u041e\\u0431\\u043d\\u043e\\u0432\\u0438\\u0442\\u044c \\u0448\\u0430\\u0431\\u043b\\u043e\\u043d\"}', 'Update Template', 'Обновить шаблон', '2022-08-29 08:30:17', '2022-08-30 08:32:04'),
(20, 'delete_template', '{\"en\":\"Delete Template\",\"es\":\"Eliminar plantilla\",\"ru\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c \\u0448\\u0430\\u0431\\u043b\\u043e\\u043d\"}', 'Delete Template', 'Удалить шаблон', '2022-08-29 08:30:21', '2022-08-30 08:32:12'),
(21, 'template_workspace', '{\"en\":\"Template Workspace\",\"es\":\"Espacio de trabajo de plantilla\",\"ru\":\"\\u0420\\u0430\\u0431\\u043e\\u0447\\u0430\\u044f \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u044c \\u0448\\u0430\\u0431\\u043b\\u043e\\u043d\\u0430\"}', 'Template Workspace', 'Рабочая область шаблона', '2022-08-29 08:30:27', '2022-08-30 08:32:26'),
(22, 'paste_area', '{\"en\":\"Paste Area\",\"es\":\"Pegar \\u00e1rea\",\"ru\":\"\\u041f\\u0430\\u0441\\u0445\\u0430\\u043b\\u044c\\u043d\\u0430\\u044f \\u043f\\u043b\\u043e\\u0449\\u0430\\u0434\\u044c\"}', 'Paste Area', 'Пасхальная площадь', '2022-08-29 08:30:33', '2022-08-30 08:32:37'),
(23, 'template_description', '{\"en\":\"Template Description\",\"es\":\"Descripci\\u00f3n de la plantilla\",\"ru\":\"\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 \\u0448\\u0430\\u0431\\u043b\\u043e\\u043d\\u0430\"}', 'Template Description', 'Описание шаблона', '2022-08-29 08:30:38', '2022-08-30 08:32:49'),
(24, 'template_name', '{\"en\":\"Template Name\",\"es\":\"Nombre de la plantilla\",\"ru\":\"\\u0418\\u043c\\u044f \\u0428\\u0430\\u0431\\u043b\\u043e\\u043d\\u0430\"}', 'Template Name', 'Имя Шаблона', '2022-08-29 08:30:42', '2022-08-30 08:32:58'),
(25, 'domain', '{\"en\":\"Domain\",\"es\":\"Dominio\",\"ru\":\"\\u0414\\u043e\\u043c\\u0435\\u043d\"}', 'Domain', 'Домен', '2022-08-29 08:30:47', '2022-08-30 08:33:05'),
(26, 'enter_domain', '{\"en\":\"Enter Domain\",\"es\":\"Introducir dominio\",\"ru\":\"\\u0432\\u0432\\u0435\\u0434\\u0438\\u0442\\u0435 \\u0414\\u043e\\u043c\\u0435\\u043d\"}', 'Enter Domain', 'введите Домен', '2022-08-29 08:30:52', '2022-08-30 08:33:14'),
(27, 'name', '{\"en\":\"Name\",\"es\":\"Nombre\",\"ru\":\"\\u0418\\u043c\\u044f\"}', 'Name', 'Имя', '2022-08-29 08:30:56', '2022-08-30 08:33:23'),
(28, 'language', '{\"en\":\"Language\",\"es\":\"idioma\",\"ru\":\"\\u042f\\u0437\\u044b\\u043a\"}', 'Language', 'Язык', '2022-08-29 09:13:24', '2022-08-30 08:33:37'),
(29, 'menu', '{\"en\":\"Menu\",\"es\":\"Men\\u00fa\",\"ru\":\"\\u043c\\u0435\\u043d\\u044e\"}', 'Menu', 'Menu', '2022-08-30 09:29:55', '2022-08-30 09:31:16'),
(30, 'profile', '{\"en\":\"Profile\",\"es\":\"Perfil\",\"ru\":\"\\u041f\\u0440\\u043e\\u0444\\u0438\\u043b\\u044c\"}', 'Profile', 'Profile', '2022-08-30 09:29:55', '2022-08-31 08:53:25'),
(31, 'settings', '{\"en\":\"Settings\",\"es\":\"Ajustes\",\"ru\":\"\\u041d\\u0430\\u0441\\u0442\\u0440\\u043e\\u0439\\u043a\\u0438\"}', 'Settings', 'Settings', '2022-08-30 09:29:55', '2022-08-30 09:35:43'),
(32, 'site_structure', '{\"en\":\"Site Structure\",\"es\":\"Estructura del sitio\",\"ru\":\"\\u0421\\u0442\\u0440\\u0443\\u043a\\u0442\\u0443\\u0440\\u0430 \\u0441\\u0430\\u0439\\u0442\\u0430\"}', 'Site Structure', 'Site Structure', '2022-08-30 09:29:55', '2022-08-30 12:41:49'),
(33, 'owner', '{\"en\":\"Owner\",\"ru\":\"\\u0412\\u043b\\u0430\\u0434\\u0435\\u043b\\u0435\\u0446\",\"es\":\"Due\\u00f1a\"}', NULL, NULL, '2022-08-31 04:41:05', '2022-08-31 04:41:05'),
(34, 'infoblock_list', '{\"en\":\"InfoBlock List\",\"ru\":\"\\u0441\\u043f\\u0438\\u0441\\u043e\\u043a \\u0438\\u043d\\u0444\\u043e\\u0431\\u043b\\u043e\\u043a\\u043e\\u0432\",\"es\":\"lista de bloqueo de informaci\\u00f3n\"}', NULL, NULL, '2022-08-31 04:47:57', '2022-08-31 04:47:57'),
(35, 'delete_all', '{\"en\":\"Delete All\",\"ru\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c \\u0432\\u0441\\u0435\",\"es\":\"Eliminar todos\"}', NULL, NULL, '2022-08-31 04:49:44', '2022-08-31 04:49:44'),
(36, 'add_a_group', '{\"en\":\"Add a group\",\"ru\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c \\u0433\\u0440\\u0443\\u043f\\u043f\\u0443\",\"es\":\"Agregar un grupo\"}', NULL, NULL, '2022-08-31 04:51:02', '2022-08-31 04:51:02'),
(37, 'add_infoblock_group', '{\"en\":\"Add infoblock group\",\"ru\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c \\u0433\\u0440\\u0443\\u043f\\u043f\\u0443 \\u0438\\u043d\\u0444\\u043e\\u0431\\u043b\\u043e\\u043a\\u043e\\u0432\",\"es\":\"Agregar grupo de bloque de informaci\\u00f3n\"}', NULL, NULL, '2022-08-31 04:52:25', '2022-08-31 04:52:25'),
(38, 'group_name', '{\"en\":\"Group name\",\"ru\":\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0433\\u0440\\u0443\\u043f\\u043f\\u044b\",\"es\":\"Nombre del grupo\"}', NULL, NULL, '2022-08-31 04:55:09', '2022-08-31 04:55:09'),
(39, 'edit_infoblock_group', '{\"en\":\"Edit infoblock group\",\"ru\":\"\\u0420\\u0435\\u0434\\u0430\\u043a\\u0442\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c \\u0433\\u0440\\u0443\\u043f\\u043f\\u0443 \\u0438\\u043d\\u0444\\u043e\\u0431\\u043b\\u043e\\u043a\\u043e\\u0432\",\"es\":\"Editar grupo de bloque de informaci\\u00f3n\"}', NULL, NULL, '2022-08-31 04:57:49', '2022-08-31 04:57:49'),
(40, 'update_infoblock_group', '{\"en\":\"Update infoblock group\",\"ru\":\"\\u041e\\u0431\\u043d\\u043e\\u0432\\u0438\\u0442\\u044c \\u0433\\u0440\\u0443\\u043f\\u043f\\u0443 \\u0438\\u043d\\u0444\\u043e\\u0431\\u043b\\u043e\\u043a\\u043e\\u0432\",\"es\":\"Actualizar grupo de bloque de informaci\\u00f3n\"}', NULL, NULL, '2022-08-31 05:00:37', '2022-08-31 05:00:37'),
(41, 'delete', '{\"en\":\"Delete\",\"ru\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c\",\"es\":\"Eliminar\"}', NULL, NULL, '2022-08-31 05:03:06', '2022-08-31 05:03:06'),
(42, 'edit', '{\"en\":\"Edit\",\"ru\":\"\\u0440\\u0435\\u0434\\u0430\\u043a\\u0442\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c\",\"es\":\"editar\"}', NULL, NULL, '2022-08-31 05:04:31', '2022-08-31 05:04:31'),
(43, 'view', '{\"en\":\"View\",\"ru\":\"\\u041f\\u043e\\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c\",\"es\":\"vista\"}', NULL, NULL, '2022-08-31 05:05:25', '2022-08-31 05:05:25'),
(44, 'infoblock_group', '{\"en\":\"InfoBlock Group\",\"ru\":\"\\u0413\\u0440\\u0443\\u043f\\u043f\\u0430 \\u0438\\u043d\\u0444\\u043e\\u0431\\u043b\\u043e\\u043a\\u043e\\u0432\",\"es\":\"Grupo de bloque de informaci\\u00f3n\"}', NULL, NULL, '2022-08-31 05:10:44', '2022-08-31 05:10:44'),
(45, 'infoblock_group_list', '{\"en\":\"InfoBlock Group List\",\"ru\":\"\\u0421\\u043f\\u0438\\u0441\\u043e\\u043a \\u0433\\u0440\\u0443\\u043f\\u043f \\u0438\\u043d\\u0444\\u043e\\u0431\\u043b\\u043e\\u043a\\u043e\\u0432\",\"es\":\"Lista de grupos de InfoBlock\"}', NULL, NULL, '2022-08-31 05:12:35', '2022-08-31 05:12:35'),
(46, 'add_infoblock', '{\"en\":\"Add Infoblock\",\"ru\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c \\u0438\\u043d\\u0444\\u043e\\u0431\\u043b\\u043e\\u043a\",\"es\":\"Agregar bloque de informaci\\u00f3n\"}', NULL, NULL, '2022-08-31 05:14:03', '2022-08-31 05:14:03'),
(47, 'date_of_creation', '{\"en\":\"Date Of Creation\",\"ru\":\"\\u0414\\u0430\\u0442\\u0430 \\u0441\\u043e\\u0437\\u0434\\u0430\\u043d\\u0438\\u044f\",\"es\":\"Fecha de creaci\\u00f3n\"}', NULL, NULL, '2022-08-31 05:15:37', '2022-08-31 05:15:37'),
(48, 'information_block_element_properties', '{\"en\":\"Information block element properties\",\"ru\":\"\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u0430 \\u044d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442\\u0430 \\u0438\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u043e\\u043d\\u043d\\u043e\\u0433\\u043e \\u0431\\u043b\\u043e\\u043a\\u0430\",\"es\":\"Propiedades del elemento del bloque de informaci\\u00f3n\"}', NULL, NULL, '2022-08-31 05:17:07', '2022-08-31 05:17:07'),
(49, 'information_block_section_properties', '{\"en\":\"Information block section properties\",\"ru\":\"\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u0430 \\u0440\\u0430\\u0437\\u0434\\u0435\\u043b\\u0430 \\u0438\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u043e\\u043d\\u043d\\u043e\\u0433\\u043e \\u0431\\u043b\\u043e\\u043a\\u0430\",\"es\":\"Propiedades de la secci\\u00f3n del bloque de informaci\\u00f3n\"}', NULL, NULL, '2022-08-31 05:17:55', '2022-08-31 05:17:55'),
(50, 'clone_to_a_new_infoblock', '{\"en\":\"Clone to a new infoblock\",\"ru\":\"\\u041a\\u043b\\u043e\\u043d\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c \\u0432 \\u043d\\u043e\\u0432\\u044b\\u0439 \\u0438\\u043d\\u0444\\u043e\\u0431\\u043b\\u043e\\u043a\",\"es\":\"Clonar a un nuevo bloque de informaci\\u00f3n\"}', NULL, NULL, '2022-08-31 05:19:03', '2022-08-31 05:19:03'),
(51, 'transfer_rights', '{\"en\":\"Transfer Rights\",\"ru\":\"\\u041f\\u0440\\u0430\\u0432\\u0430 \\u043d\\u0430 \\u043f\\u0435\\u0440\\u0435\\u0434\\u0430\\u0447\\u0443\",\"es\":\"Derechos de transferencia\"}', NULL, NULL, '2022-08-31 05:19:56', '2022-08-31 05:19:56'),
(52, 'infoblock_cloning', '{\"en\":\"Infoblock cloning\",\"ru\":\"\\u041a\\u043b\\u043e\\u043d\\u0438\\u0440\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0438\\u043d\\u0444\\u043e\\u0431\\u043b\\u043e\\u043a\\u0430\",\"es\":\"Clonaci\\u00f3n de bloque de informaci\\u00f3n\"}', NULL, NULL, '2022-08-31 05:32:19', '2022-08-31 05:32:19'),
(53, 'infoblock_name', '{\"en\":\"Infoblock name\",\"ru\":\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0438\\u043d\\u0444\\u043e\\u0431\\u043b\\u043e\\u043a\\u0430\",\"es\":\"Nombre del bloque de informaci\\u00f3n\"}', NULL, NULL, '2022-08-31 05:33:26', '2022-08-31 05:33:26'),
(54, 'close', '{\"en\":\"Close\",\"ru\":\"\\u0417\\u0430\\u043a\\u0440\\u044b\\u0432\\u0430\\u0442\\u044c\",\"es\":\"Cerca\"}', NULL, NULL, '2022-08-31 05:33:45', '2022-08-31 05:33:45'),
(55, 'clone_infoblock', '{\"en\":\"Clone Infoblock\",\"ru\":\"\\u041a\\u043b\\u043e\\u043d\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c \\u0438\\u043d\\u0444\\u043e\\u0431\\u043b\\u043e\\u043a\",\"es\":\"Clonar bloque de informaci\\u00f3n\"}', NULL, NULL, '2022-08-31 05:34:23', '2022-08-31 05:34:23'),
(56, 'pass_feb_form_permissions', '{\"en\":\"Pass Feb Form Permissions\",\"ru\":\"\\u041f\\u0435\\u0440\\u0435\\u0434\\u0430\\u0442\\u044c \\u043f\\u0440\\u0430\\u0432\\u0430 \\u0434\\u043e\\u0441\\u0442\\u0443\\u043f\\u0430 \\u043a \\u0444\\u043e\\u0440\\u043c\\u0435\",\"es\":\"Pasar permisos de formulario de febrero\"}', NULL, NULL, '2022-08-31 05:36:29', '2022-08-31 05:36:29'),
(57, 'new_owner', '{\"en\":\"New Owner\",\"ru\":\"\\u041d\\u043e\\u0432\\u044b\\u0439 \\u0432\\u043b\\u0430\\u0434\\u0435\\u043b\\u0435\\u0446\",\"es\":\"Nueva due\\u00f1a\"}', NULL, NULL, '2022-08-31 05:37:34', '2022-08-31 05:37:34'),
(58, 'update', '{\"en\":\"Update\",\"ru\":\"\\u041e\\u0431\\u043d\\u043e\\u0432\\u043b\\u044f\\u0442\\u044c\",\"es\":\"Actualizar\"}', NULL, NULL, '2022-08-31 05:38:45', '2022-08-31 05:38:45'),
(59, 'assign_to_yourself', '{\"en\":\"Assign to yourself\",\"ru\":\"\\u041d\\u0430\\u0437\\u043d\\u0430\\u0447\\u0438\\u0442\\u044c \\u0441\\u0435\\u0431\\u0435\",\"es\":\"Asignarte a ti mismo\"}', NULL, NULL, '2022-08-31 05:40:00', '2022-08-31 05:40:00'),
(60, 'new_information_block_of_the_group', '{\"en\":\"New information block of the group\",\"ru\":\"\\u041d\\u043e\\u0432\\u044b\\u0439 \\u0438\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u043e\\u043d\\u043d\\u044b\\u0439 \\u0431\\u043b\\u043e\\u043a \\u0433\\u0440\\u0443\\u043f\\u043f\\u044b\",\"es\":\"Nuevo bloque informativo del grupo\"}', NULL, NULL, '2022-08-31 05:44:35', '2022-08-31 05:44:35'),
(61, 'create_group', '{\"en\":\"Create Group\",\"ru\":\"\\u0421\\u043e\\u0437\\u0434\\u0430\\u0442\\u044c \\u0433\\u0440\\u0443\\u043f\\u043f\\u0443\",\"es\":\"Crea un grupo\"}', NULL, NULL, '2022-08-31 05:45:44', '2022-08-31 05:45:44'),
(62, 'parameters_of_the_information_block', '{\"en\":\"Parameters of the information block\",\"ru\":\"\\u041f\\u0430\\u0440\\u0430\\u043c\\u0435\\u0442\\u0440\\u044b \\u0438\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u043e\\u043d\\u043d\\u043e\\u0433\\u043e \\u0431\\u043b\\u043e\\u043a\\u0430\",\"es\":\"Par\\u00e1metros del bloque de informaci\\u00f3n\"}', NULL, NULL, '2022-08-31 05:49:04', '2022-08-31 05:49:04'),
(63, 'information_block_properties', '{\"en\":\"Information block properties\",\"ru\":\"\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u0430 \\u0438\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u043e\\u043d\\u043d\\u043e\\u0433\\u043e \\u0431\\u043b\\u043e\\u043a\\u0430\",\"es\":\"Propiedades del bloque de informaci\\u00f3n\"}', NULL, NULL, '2022-08-31 05:51:32', '2022-08-31 05:51:32'),
(64, 'properties_of_elements_of_infoblock', '{\"en\":\"Properties of elements of infoblock\",\"ru\":\"\\u0421\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u0430 \\u044d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442\\u043e\\u0432 \\u0438\\u043d\\u0444\\u043e\\u0431\\u043b\\u043e\\u043a\\u0430\",\"es\":\"Propiedades de elementos de infoblock\"}', NULL, NULL, '2022-08-31 05:53:31', '2022-08-31 05:53:31'),
(65, 'field_name', '{\"en\":\"Field Name\",\"ru\":\"\\u0418\\u043c\\u044f \\u043f\\u043e\\u043b\\u044f\",\"es\":\"Nombre del campo\"}', NULL, NULL, '2022-08-31 05:56:27', '2022-08-31 05:56:27'),
(66, 'property_name', '{\"en\":\"Property Name\",\"ru\":\"\\u0418\\u043c\\u044f \\u0441\\u0432\\u043e\\u0439\\u0441\\u0442\\u0432\\u0430\",\"es\":\"Nombre de la propiedad\"}', NULL, NULL, '2022-08-31 05:57:02', '2022-08-31 05:57:02'),
(67, 'field_type', '{\"en\":\"Field Type\",\"ru\":\"\\u0422\\u0438\\u043f \\u043f\\u043e\\u043b\\u044f\",\"es\":\"Tipo de campo\"}', NULL, NULL, '2022-08-31 05:57:23', '2022-08-31 05:57:23'),
(68, 'mandatory', '{\"en\":\"Mandatory\",\"ru\":\"\\u041e\\u0431\\u044f\\u0437\\u0430\\u0442\\u0435\\u043b\\u044c\\u043d\\u044b\\u0439\",\"es\":\"Obligatoria\"}', NULL, NULL, '2022-08-31 05:57:43', '2022-08-31 05:57:43'),
(69, 'search', '{\"en\":\"Search\",\"ru\":\"\\u041f\\u043e\\u0438\\u0441\\u043a\",\"es\":\"B\\u00fasqueda\"}', NULL, NULL, '2022-08-31 05:58:11', '2022-08-31 05:58:11'),
(70, 'sections', '{\"en\":\"Sections\",\"ru\":\"\\u0420\\u0430\\u0437\\u0434\\u0435\\u043b\\u044b\",\"es\":\"Secciones\"}', NULL, NULL, '2022-08-31 05:58:36', '2022-08-31 05:58:36'),
(71, 'field_style', '{\"en\":\"Field Style\",\"ru\":\"\\u0421\\u0442\\u0438\\u043b\\u044c \\u043f\\u043e\\u043b\\u044f\",\"es\":\"Estilo de campo\"}', NULL, NULL, '2022-08-31 05:58:56', '2022-08-31 05:58:56'),
(72, 'extended', '{\"en\":\"Extended\",\"ru\":\"\\u0420\\u0430\\u0441\\u0448\\u0438\\u0440\\u0435\\u043d\\u043d\\u044b\\u0439\",\"es\":\"Extendida\"}', NULL, NULL, '2022-08-31 05:59:22', '2022-08-31 05:59:22'),
(73, 'add_radio_values', '{\"en\":\"Add Radio Values\",\"ru\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c \\u0437\\u043d\\u0430\\u0447\\u0435\\u043d\\u0438\\u044f \\u0440\\u0430\\u0434\\u0438\\u043e\",\"es\":\"Agregar valores de radio\"}', NULL, NULL, '2022-08-31 06:00:40', '2022-08-31 06:00:40'),
(74, 'add_checkbox_values', '{\"en\":\"Add Checkbox Values\",\"ru\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c \\u0437\\u043d\\u0430\\u0447\\u0435\\u043d\\u0438\\u044f \\u0444\\u043b\\u0430\\u0436\\u043a\\u043e\\u0432\",\"es\":\"Agregar valores de casilla de verificaci\\u00f3n\"}', NULL, NULL, '2022-08-31 06:01:50', '2022-08-31 06:01:50'),
(75, 'add_select_values', '{\"en\":\"Add Select Values\",\"ru\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c \\u0432\\u044b\\u0431\\u0440\\u0430\\u043d\\u043d\\u044b\\u0435 \\u0437\\u043d\\u0430\\u0447\\u0435\\u043d\\u0438\\u044f\",\"es\":\"Agregar valores seleccionados\"}', NULL, NULL, '2022-08-31 06:02:32', '2022-08-31 06:02:32'),
(76, 'add', '{\"en\":\"Add\",\"ru\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u043b\\u044f\\u0442\\u044c\",\"es\":\"Agregar\"}', NULL, NULL, '2022-08-31 06:14:31', '2022-08-31 06:14:31'),
(78, 'integer', '{\"en\":\"Integer\",\"ru\":\"\\u0426\\u0435\\u043b\\u043e\\u0435 \\u0447\\u0438\\u0441\\u043b\\u043e\",\"es\":\"Entero\"}', NULL, NULL, '2022-08-31 06:24:13', '2022-08-31 06:24:13'),
(79, 'fractional_number', '{\"en\":\"Fractional number\",\"ru\":\"\\u0414\\u0440\\u043e\\u0431\\u043d\\u043e\\u0435 \\u0447\\u0438\\u0441\\u043b\\u043e\",\"es\":\"Numero fraccional\"}', NULL, NULL, '2022-08-31 06:25:14', '2022-08-31 06:25:14'),
(80, 'line', '{\"en\":\"Line\",\"ru\":\"\\u041b\\u0438\\u043d\\u0438\\u044f\",\"es\":\"L\\u00ednea\"}', NULL, NULL, '2022-08-31 06:25:35', '2022-08-31 06:25:35'),
(81, 'date_and_time', '{\"en\":\"Date and Time\",\"ru\":\"\\u0414\\u0430\\u0442\\u0430 \\u0438 \\u0432\\u0440\\u0435\\u043c\\u044f\",\"es\":\"Fecha y hora\"}', NULL, NULL, '2022-08-31 06:26:06', '2022-08-31 06:26:06'),
(82, 'date_without_time', '{\"en\":\"Date Without Time\",\"ru\":\"\\u0414\\u0430\\u0442\\u0430 \\u0431\\u0435\\u0437 \\u0432\\u0440\\u0435\\u043c\\u0435\\u043d\\u0438\",\"es\":\"fecha sin hora\"}', NULL, NULL, '2022-08-31 06:26:38', '2022-08-31 06:26:38'),
(83, 'time', '{\"en\":\"Time\",\"ru\":\"\\u0412\\u0440\\u0435\\u043c\\u044f\",\"es\":\"Tiempo\"}', NULL, NULL, '2022-08-31 06:27:03', '2022-08-31 06:27:03'),
(84, 'money', '{\"en\":\"Money\",\"ru\":\"\\u0414\\u0435\\u043d\\u044c\\u0433\\u0438\",\"es\":\"Dinero\"}', NULL, NULL, '2022-08-31 06:27:35', '2022-08-31 06:27:35'),
(85, 'strings', '{\"en\":\"Strings\",\"ru\":\"\\u0421\\u0442\\u0440\\u0443\\u043d\\u044b\",\"es\":\"Instrumentos de cuerda\"}', NULL, NULL, '2022-08-31 06:28:08', '2022-08-31 06:28:08'),
(86, 'text', '{\"en\":\"Text\",\"ru\":\"\\u0422\\u0435\\u043a\\u0441\\u0442\",\"es\":\"Texto\"}', NULL, NULL, '2022-08-31 06:28:34', '2022-08-31 06:28:34'),
(87, 'html_editor', '{\"en\":\"HTML Editor\",\"ru\":\"HTML-\\u0440\\u0435\\u0434\\u0430\\u043a\\u0442\\u043e\\u0440\",\"es\":\"Editora HTML\"}', NULL, NULL, '2022-08-31 06:29:04', '2022-08-31 06:29:04'),
(88, 'file', '{\"en\":\"File\",\"ru\":\"\\u0424\\u0430\\u0439\\u043b\",\"es\":\"Expediente\"}', NULL, NULL, '2022-08-31 06:29:32', '2022-08-31 06:29:32'),
(89, 'files', '{\"en\":\"Files\",\"ru\":\"\\u0424\\u0430\\u0439\\u043b\\u044b\",\"es\":\"archivos\"}', NULL, NULL, '2022-08-31 06:29:58', '2022-08-31 06:29:58'),
(90, 'list', '{\"en\":\"List\",\"ru\":\"\\u0421\\u043f\\u0438\\u0441\\u043e\\u043a\",\"es\":\"Lista\"}', NULL, NULL, '2022-08-31 06:30:25', '2022-08-31 06:30:25'),
(91, 'choice', '{\"en\":\"Choice\",\"ru\":\"\\u0412\\u044b\\u0431\\u043e\\u0440\",\"es\":\"Elecci\\u00f3n\"}', NULL, NULL, '2022-08-31 06:30:53', '2022-08-31 06:30:53'),
(92, 'link_to_infoblock', '{\"en\":\"Link to infoblock\",\"ru\":\"\\u0421\\u0441\\u044b\\u043b\\u043a\\u0430 \\u043d\\u0430 \\u0438\\u043d\\u0444\\u043e\\u0431\\u043b\\u043e\\u043a\",\"es\":\"Enlace al bloque de informaci\\u00f3n\"}', NULL, NULL, '2022-08-31 06:32:17', '2022-08-31 06:32:17'),
(93, 'phone', '{\"en\":\"Phone\",\"ru\":\"\\u0422\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d\",\"es\":\"Tel\\u00e9fono\"}', NULL, NULL, '2022-08-31 06:32:39', '2022-08-31 06:32:39'),
(94, 'password', '{\"en\":\"Password\",\"ru\":\"\\u041f\\u0430\\u0440\\u043e\\u043b\\u044c\",\"es\":\"Clave\"}', NULL, NULL, '2022-08-31 06:33:03', '2022-08-31 06:33:03'),
(95, 'email', '{\"en\":\"Email\",\"ru\":\"\\u042d\\u043b. \\u0430\\u0434\\u0440\\u0435\\u0441\",\"es\":\"Email\"}', NULL, NULL, '2022-08-31 06:33:28', '2022-08-31 06:33:28'),
(96, 'url', '{\"en\":\"URL\",\"ru\":\"URL\",\"es\":\"URL\"}', NULL, NULL, '2022-08-31 06:33:53', '2022-08-31 06:33:53'),
(97, 'color_selection', '{\"en\":\"Color Selection\",\"ru\":\"\\u0412\\u044b\\u0431\\u043e\\u0440 \\u0446\\u0432\\u0435\\u0442\\u0430\",\"es\":\"Selecci\\u00f3n de color\"}', NULL, NULL, '2022-08-31 06:34:20', '2022-08-31 06:34:20'),
(98, 'picture_avatar', '{\"en\":\"Picture (Avatar)\",\"ru\":\"\\u041a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0430 (\\u0410\\u0432\\u0430\\u0442\\u0430\\u0440)\",\"es\":\"Imagen (Avatar)\"}', NULL, NULL, '2022-08-31 06:35:18', '2022-08-31 06:35:18'),
(99, 'add_element', '{\"en\":\"Add element\",\"ru\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c \\u044d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442\",\"es\":\"Agregar elemento\"}', NULL, NULL, '2022-08-31 06:42:11', '2022-08-31 06:42:11'),
(100, 'add_section', '{\"en\":\"Add section\",\"ru\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c \\u0440\\u0430\\u0437\\u0434\\u0435\\u043b\",\"es\":\"Agregar secci\\u00f3n\"}', NULL, NULL, '2022-08-31 06:42:42', '2022-08-31 06:42:42'),
(101, 'active', '{\"en\":\"Active\",\"ru\":\"\\u0410\\u043a\\u0442\\u0438\\u0432\\u043d\\u044b\\u0439\",\"es\":\"Activa\"}', NULL, NULL, '2022-08-31 06:44:20', '2022-08-31 06:44:20'),
(102, 'the_author', '{\"en\":\"The Author\",\"ru\":\"\\u0410\\u0432\\u0442\\u043e\\u0440\",\"es\":\"La autora\"}', NULL, NULL, '2022-08-31 06:44:47', '2022-08-31 06:44:47'),
(103, 'the_date', '{\"en\":\"The Date\",\"ru\":\"\\u0414\\u0430\\u0442\\u0430\",\"es\":\"La fecha\"}', NULL, NULL, '2022-08-31 06:45:31', '2022-08-31 06:45:31'),
(104, 'identity_card', '{\"en\":\"Identity Card\",\"ru\":\"\\u0423\\u0434\\u043e\\u0441\\u0442\\u043e\\u0432\\u0435\\u0440\\u0435\\u043d\\u0438\\u0435 \\u043b\\u0438\\u0447\\u043d\\u043e\\u0441\\u0442\\u0438\",\"es\":\"Tarjeta de identificaci\\u00f3n\"}', NULL, NULL, '2022-08-31 06:45:57', '2022-08-31 06:45:57'),
(105, 'pages', '{\"en\":\"Pages\",\"ru\":\"\\u0421\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u044b\",\"es\":\"Paginas\"}', NULL, NULL, '2022-08-31 06:49:43', '2022-08-31 06:49:43'),
(106, 'pages_list', '{\"en\":\"Pages List\",\"ru\":\"\\u0421\\u043f\\u0438\\u0441\\u043e\\u043a \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\",\"es\":\"Lista de p\\u00e1ginas\"}', NULL, NULL, '2022-08-31 06:50:55', '2022-08-31 06:50:55'),
(107, 'add_page', '{\"en\":\"Add Page\",\"ru\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443\",\"es\":\"A\\u00f1adir p\\u00e1gina\"}', NULL, NULL, '2022-08-31 06:51:25', '2022-08-31 06:51:25'),
(108, 'page_name', '{\"en\":\"Page Name\",\"ru\":\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u044b\",\"es\":\"Nombre de la p\\u00e1gina\"}', NULL, NULL, '2022-08-31 06:53:13', '2022-08-31 06:53:13'),
(109, 'enter_page_name', '{\"en\":\"Enter Page Name\",\"ru\":\"\\u0412\\u0432\\u0435\\u0434\\u0438\\u0442\\u0435 \\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u044b\",\"es\":\"Introduce el nombre de la p\\u00e1gina\"}', NULL, NULL, '2022-08-31 06:55:34', '2022-08-31 06:55:34'),
(110, 'select_template', '{\"en\":\"Select Template\",\"ru\":\"\\u0412\\u044b\\u0431\\u0435\\u0440\\u0438\\u0442\\u0435 \\u0448\\u0430\\u0431\\u043b\\u043e\\u043d\",\"es\":\"Seleccionar plantilla\"}', NULL, NULL, '2022-08-31 06:56:23', '2022-08-31 06:56:23'),
(111, 'page_title', '{\"en\":\"Page Title\",\"ru\":\"\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u044b\",\"es\":\"T\\u00edtulo de la p\\u00e1gina\"}', NULL, NULL, '2022-08-31 06:57:23', '2022-08-31 06:57:23'),
(112, 'page_charset', '{\"en\":\"Page Charset\",\"ru\":\"Page Charset\",\"es\":\"Page Charset\"}', NULL, NULL, '2022-08-31 06:57:58', '2022-08-31 06:57:58'),
(113, 'page_keyword', '{\"en\":\"Page Keyword\",\"ru\":\"Page Keyword\",\"es\":\"Page Keyword\"}', NULL, NULL, '2022-08-31 06:58:24', '2022-08-31 06:58:24'),
(114, 'page_description', '{\"en\":\"Page Description\",\"ru\":\"Page Description\",\"es\":\"Page Description\"}', NULL, NULL, '2022-08-31 06:58:36', '2022-08-31 06:58:36'),
(117, 'page_scripts', '{\"en\":\"Page Scripts\",\"ru\":\"Page Scripts\",\"es\":\"Page Scripts\"}', NULL, NULL, '2022-08-31 07:01:13', '2022-08-31 07:01:13'),
(118, 'page_toolbar', '{\"en\":\"Page Toolbar\",\"ru\":\"Page Toolbar\",\"es\":\"Page Toolbar\"}', NULL, NULL, '2022-08-31 07:01:48', '2022-08-31 07:01:48'),
(119, 'edit_page', '{\"en\":\"Edit Page\",\"ru\":\"\\u041e\\u0442\\u0440\\u0435\\u0434\\u0430\\u043a\\u0442\\u0438\\u0440\\u0443\\u0439\\u0442\\u0435 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443\",\"es\":\"Editar p\\u00e1gina\"}', NULL, NULL, '2022-08-31 07:03:10', '2022-08-31 07:03:10'),
(120, 'user_role', '{\"en\":\"User Role\",\"ru\":\"\\u0420\\u043e\\u043b\\u044c \\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u0442\\u0435\\u043b\\u044f\",\"es\":\"Rol del usuario\"}', NULL, NULL, '2022-08-31 07:12:38', '2022-08-31 07:12:38'),
(121, 'status', '{\"en\":\"Status\",\"ru\":\"\\u0421\\u0442\\u0430\\u0442\\u0443\\u0441\",\"es\":\"Estado\"}', NULL, NULL, '2022-08-31 07:13:15', '2022-08-31 07:13:15'),
(122, 'add_user', '{\"en\":\"Add user\",\"ru\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c \\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u0442\\u0435\\u043b\\u044f\",\"es\":\"Agregar usuario\"}', NULL, NULL, '2022-08-31 07:14:01', '2022-08-31 07:14:01'),
(123, 'deactive', '{\"en\":\"Deactive\",\"ru\":\"\\u0434\\u0435\\u0430\\u043a\\u0442\\u0438\\u0432\\u0438\\u0440\\u043e\\u0432\\u0430\\u043d\",\"es\":\"Desactivado\"}', NULL, NULL, '2022-08-31 07:14:49', '2022-08-31 07:14:49'),
(124, 'confirm_password', '{\"en\":\"Confirm Password\",\"ru\":\"\\u041f\\u043e\\u0434\\u0442\\u0432\\u0435\\u0440\\u0434\\u0438\\u0442\\u044c \\u041f\\u0430\\u0440\\u043e\\u043b\\u044c\",\"es\":\"Confirmar contrase\\u00f1a\"}', NULL, NULL, '2022-08-31 07:18:16', '2022-08-31 07:18:16'),
(125, 'image', '{\"en\":\"Image\",\"ru\":\"\\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\",\"es\":\"imagen\"}', NULL, NULL, '2022-08-31 07:18:45', '2022-08-31 07:18:45'),
(126, 'create_new_user', '{\"en\":\"Create new user\",\"ru\":\"\\u0421\\u043e\\u0437\\u0434\\u0430\\u0442\\u044c \\u043d\\u043e\\u0432\\u043e\\u0433\\u043e \\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u0442\\u0435\\u043b\\u044f\",\"es\":\"Crear nueva usuaria\"}', NULL, NULL, '2022-08-31 07:20:16', '2022-08-31 07:20:16'),
(127, 'add_user_role', '{\"en\":\"Add user role\",\"ru\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c \\u0440\\u043e\\u043b\\u044c \\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u0442\\u0435\\u043b\\u044f\",\"es\":\"Agregar rol de usuario\"}', NULL, NULL, '2022-08-31 07:28:18', '2022-08-31 07:28:18'),
(128, 'guard', '{\"en\":\"Guard\",\"ru\":\"\\u0421\\u0442\\u043e\\u0440\\u043e\\u0436\\u0438\\u0442\\u044c\",\"es\":\"Guardia\"}', NULL, NULL, '2022-08-31 07:31:07', '2022-08-31 07:31:07'),
(129, 'create_new_user_role', '{\"en\":\"Create new user role\",\"ru\":\"\\u0421\\u043e\\u0437\\u0434\\u0430\\u0442\\u044c \\u043d\\u043e\\u0432\\u0443\\u044e \\u0440\\u043e\\u043b\\u044c \\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u0442\\u0435\\u043b\\u044f\",\"es\":\"Crear nuevo rol de usuario\"}', NULL, NULL, '2022-08-31 07:31:44', '2022-08-31 07:31:44'),
(130, 'permissions', '{\"en\":\"Permissions\",\"ru\":\"\\u0440\\u0430\\u0437\\u0440\\u0435\\u0448\\u0435\\u043d\\u0438\\u044f\",\"es\":\"\\u0440\\u0430\\u0437\\u0440\\u0435\\u0448\\u0435\\u043d\\u0438\\u044f\"}', NULL, NULL, '2022-08-31 07:32:24', '2022-08-31 07:32:24'),
(131, 'background_color', '{\"en\":\"Background Color\",\"ru\":\"\\u0424\\u043e\\u043d\\u043e\\u0432\\u044b\\u0439 \\u0446\\u0432\\u0435\\u0442\",\"es\":\"Color de fondo\"}', NULL, NULL, '2022-08-31 07:33:02', '2022-08-31 07:33:02'),
(132, 'edit_user_role', '{\"en\":\"Edit User Role\",\"ru\":\"\\u0418\\u0437\\u043c\\u0435\\u043d\\u0438\\u0442\\u044c \\u0440\\u043e\\u043b\\u044c \\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u0442\\u0435\\u043b\\u044f\",\"es\":\"Editar rol de usuario\"}', NULL, NULL, '2022-08-31 07:34:02', '2022-08-31 07:34:02'),
(133, 'assigned_permissions', '{\"en\":\"Assigned permissions\",\"ru\":\"\\u041d\\u0430\\u0437\\u043d\\u0430\\u0447\\u0435\\u043d\\u043d\\u044b\\u0435 \\u0440\\u0430\\u0437\\u0440\\u0435\\u0448\\u0435\\u043d\\u0438\\u044f\",\"es\":\"Permisos asignados\"}', NULL, NULL, '2022-08-31 07:40:36', '2022-08-31 07:40:36'),
(134, 'add_permissions', '{\"en\":\"Add permissions\",\"ru\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c \\u0440\\u0430\\u0437\\u0440\\u0435\\u0448\\u0435\\u043d\\u0438\\u044f\",\"es\":\"Agregar permisos\"}', NULL, NULL, '2022-08-31 07:42:56', '2022-08-31 07:42:56'),
(135, 'create_new_permission', '{\"en\":\"Create new permission\",\"ru\":\"\\u0421\\u043e\\u0437\\u0434\\u0430\\u0442\\u044c \\u043d\\u043e\\u0432\\u043e\\u0435 \\u0440\\u0430\\u0437\\u0440\\u0435\\u0448\\u0435\\u043d\\u0438\\u0435\",\"es\":\"Crear nuevo permiso\"}', NULL, NULL, '2022-08-31 07:45:13', '2022-08-31 07:45:13'),
(136, 'language_translation', '{\"en\":\"Language Translation\",\"ru\":\"\\u042f\\u0437\\u044b\\u043a\\u043e\\u0432\\u043e\\u0439 \\u043f\\u0435\\u0440\\u0435\\u0432\\u043e\\u0434\",\"es\":\"Traducci\\u00f3n de idiomas\"}', NULL, NULL, '2022-08-31 07:51:28', '2022-08-31 07:51:28'),
(137, 'key', '{\"en\":\"Key\",\"ru\":\"Key\",\"es\":\"Key\"}', NULL, NULL, '2022-08-31 07:52:02', '2022-08-31 07:52:02'),
(138, 'pages_and_sections_of_the_site', '{\"en\":\"Pages and sections of the site\",\"ru\":\"\\u0421\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u044b \\u0438 \\u0440\\u0430\\u0437\\u0434\\u0435\\u043b\\u044b \\u0441\\u0430\\u0439\\u0442\\u0430\",\"es\":\"P\\u00e1ginas y secciones del sitio.\"}', NULL, NULL, '2022-08-31 07:58:38', '2022-08-31 07:58:38'),
(139, 'rename', '{\"en\":\"Rename\",\"ru\":\"\\u041f\\u0435\\u0440\\u0435\\u0438\\u043c\\u0435\\u043d\\u043e\\u0432\\u0430\\u0442\\u044c\",\"es\":\"Rebautizar\"}', NULL, NULL, '2022-08-31 07:58:53', '2022-08-31 07:58:53'),
(140, 'copy_path', '{\"en\":\"Copy path\",\"ru\":\"\\u041a\\u043e\\u043f\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c \\u043f\\u0443\\u0442\\u044c\",\"es\":\"Copiar ruta\"}', NULL, NULL, '2022-08-31 07:59:54', '2022-08-31 07:59:54'),
(141, 'add_new_section', '{\"en\":\"Add new section\",\"ru\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c \\u043d\\u043e\\u0432\\u044b\\u0439 \\u0440\\u0430\\u0437\\u0434\\u0435\\u043b\",\"es\":\"A\\u00f1adir nueva secci\\u00f3n\"}', NULL, NULL, '2022-08-31 08:01:04', '2022-08-31 08:01:04'),
(142, 'add_new_page', '{\"en\":\"Add new page\",\"ru\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c \\u043d\\u043e\\u0432\\u0443\\u044e \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443\",\"es\":\"A\\u00f1adir nueva p\\u00e1gina\"}', NULL, NULL, '2022-08-31 08:02:13', '2022-08-31 08:02:13'),
(143, 'add_new_menu', '{\"en\":\"Add new menu\",\"ru\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c \\u043d\\u043e\\u0432\\u043e\\u0435 \\u043c\\u0435\\u043d\\u044e\",\"es\":\"A\\u00f1adir nuevo men\\u00fa\"}', NULL, NULL, '2022-08-31 08:02:36', '2022-08-31 08:02:36'),
(144, 'add_directorypartition', '{\"en\":\"Add directory\\/partition\",\"ru\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c \\u043a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433\\/\\u0440\\u0430\\u0437\\u0434\\u0435\\u043b\",\"es\":\"A\\u00f1adir directorio\\/partici\\u00f3n\"}', NULL, NULL, '2022-08-31 08:03:20', '2022-08-31 08:03:20'),
(145, 'section_name', '{\"en\":\"Section name\",\"ru\":\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0440\\u0430\\u0437\\u0434\\u0435\\u043b\\u0430\",\"es\":\"Nombre de la secci\\u00f3n\"}', NULL, NULL, '2022-08-31 08:04:47', '2022-08-31 08:04:47'),
(146, 'directory_name', '{\"en\":\"Directory name\",\"ru\":\"\\u0418\\u043c\\u044f \\u043a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433\\u0430\",\"es\":\"Nombre del directorio\"}', NULL, NULL, '2022-08-31 08:05:46', '2022-08-31 08:05:46'),
(147, 'create_section', '{\"en\":\"Create Section\",\"ru\":\"\\u0421\\u043e\\u0437\\u0434\\u0430\\u0442\\u044c \\u0440\\u0430\\u0437\\u0434\\u0435\\u043b\",\"es\":\"Crear Secci\\u00f3n\"}', NULL, NULL, '2022-08-31 08:06:14', '2022-08-31 08:06:14'),
(148, 'add_page_to_section', '{\"en\":\"Add page to section\",\"ru\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 \\u0432 \\u0440\\u0430\\u0437\\u0434\\u0435\\u043b\",\"es\":\"Agregar p\\u00e1gina a la secci\\u00f3n\"}', NULL, NULL, '2022-08-31 08:08:00', '2022-08-31 08:08:00'),
(149, 'page_file_name', '{\"en\":\"Page File Name\",\"ru\":\"\\u0418\\u043c\\u044f \\u0444\\u0430\\u0439\\u043b\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u044b\",\"es\":\"Nombre de archivo de p\\u00e1gina\"}', NULL, NULL, '2022-08-31 08:08:50', '2022-08-31 08:08:50'),
(150, 'keywords', '{\"en\":\"Keywords\",\"ru\":\"\\u041a\\u043b\\u044e\\u0447\\u0435\\u0432\\u044b\\u0435 \\u0441\\u043b\\u043e\\u0432\\u0430\",\"es\":\"Palabras clave\"}', NULL, NULL, '2022-08-31 08:10:03', '2022-08-31 08:10:03'),
(151, 'description', '{\"en\":\"Description\",\"ru\":\"\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435\",\"es\":\"Descripci\\u00f3n\"}', NULL, NULL, '2022-08-31 08:10:43', '2022-08-31 08:10:43'),
(152, 'create_page', '{\"en\":\"Create page\",\"ru\":\"\\u0421\\u043e\\u0437\\u0434\\u0430\\u0442\\u044c \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443\",\"es\":\"Crear p\\u00e1gina\"}', NULL, NULL, '2022-08-31 08:11:32', '2022-08-31 08:11:32'),
(153, 'add_a_menu_to_a_section', '{\"en\":\"Add a menu to a section\",\"ru\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c \\u043c\\u0435\\u043d\\u044e \\u0432 \\u0440\\u0430\\u0437\\u0434\\u0435\\u043b\",\"es\":\"Agregar un men\\u00fa a una secci\\u00f3n\"}', NULL, NULL, '2022-08-31 08:12:25', '2022-08-31 08:12:25'),
(154, 'menu_name', '{\"en\":\"Menu name\",\"ru\":\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u043c\\u0435\\u043d\\u044e\",\"es\":\"Nombre del men\\u00fa\"}', NULL, NULL, '2022-08-31 08:13:05', '2022-08-31 08:13:05'),
(155, 'create_menu', '{\"en\":\"Create menu\",\"ru\":\"\\u0421\\u043e\\u0437\\u0434\\u0430\\u0442\\u044c \\u043c\\u0435\\u043d\\u044e\",\"es\":\"Crear men\\u00fa\"}', NULL, NULL, '2022-08-31 08:14:01', '2022-08-31 08:14:01'),
(156, 'current_section_name', '{\"en\":\"Current Section name\",\"ru\":\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0442\\u0435\\u043a\\u0443\\u0449\\u0435\\u0433\\u043e \\u0440\\u0430\\u0437\\u0434\\u0435\\u043b\\u0430\",\"es\":\"Nombre de la secci\\u00f3n actual\"}', NULL, NULL, '2022-08-31 08:15:31', '2022-08-31 08:15:31'),
(157, 'new_section_name', '{\"en\":\"New Section name\",\"ru\":\"\\u041d\\u043e\\u0432\\u043e\\u0435 \\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0440\\u0430\\u0437\\u0434\\u0435\\u043b\\u0430\",\"es\":\"Nombre de la nueva secci\\u00f3n\"}', NULL, NULL, '2022-08-31 08:16:34', '2022-08-31 08:16:34'),
(158, 'editing', '{\"en\":\"Editing\",\"ru\":\"\\u0420\\u0435\\u0434\\u0430\\u043a\\u0442\\u0438\\u0440\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435\",\"es\":\"Edici\\u00f3n\"}', NULL, NULL, '2022-08-31 08:17:59', '2022-08-31 08:17:59'),
(159, 'content', '{\"en\":\"Content\",\"ru\":\"\\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435\",\"es\":\"Contenido\"}', NULL, NULL, '2022-08-31 08:18:29', '2022-08-31 08:18:29'),
(160, 'copied_the_text', '{\"en\":\"Copied the text\",\"ru\":\"\\u0421\\u043a\\u043e\\u043f\\u0438\\u0440\\u043e\\u0432\\u0430\\u043b \\u0442\\u0435\\u043a\\u0441\\u0442\",\"es\":\"copi\\u00f3 el texto\"}', NULL, NULL, '2022-08-31 08:20:29', '2022-08-31 08:20:29'),
(161, 'general', '{\"en\":\"General\",\"ru\":\"\\u041e\\u0431\\u0449\\u0438\\u0439\",\"es\":\"General\"}', NULL, NULL, '2022-08-31 08:54:31', '2022-08-31 08:54:31'),
(162, 'edit_my_profile', '{\"en\":\"Edit My Profile\",\"ru\":\"\\u0440\\u0435\\u0434\\u0430\\u043a\\u0442\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c \\u043c\\u043e\\u0439 \\u043f\\u0440\\u043e\\u0444\\u0438\\u043b\\u044c\",\"es\":\"Editar mi perfil\"}', NULL, NULL, '2022-08-31 08:56:00', '2022-08-31 08:56:00'),
(163, 'delete_account', '{\"en\":\"Delete account\",\"ru\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c \\u0430\\u043a\\u043a\\u0430\\u0443\\u043d\\u0442\",\"es\":\"Borrar cuenta\"}', NULL, NULL, '2022-08-31 08:56:50', '2022-08-31 08:56:50'),
(164, 'once_you_delete_your_account', '{\"en\":\"Once you delete your account, there is no going back. Please be certain.\",\"ru\":\"\\u041a\\u0430\\u043a \\u0442\\u043e\\u043b\\u044c\\u043a\\u043e \\u0432\\u044b \\u0443\\u0434\\u0430\\u043b\\u0438\\u0442\\u0435 \\u0441\\u0432\\u043e\\u044e \\u0443\\u0447\\u0435\\u0442\\u043d\\u0443\\u044e \\u0437\\u0430\\u043f\\u0438\\u0441\\u044c, \\u043f\\u0443\\u0442\\u0438 \\u043d\\u0430\\u0437\\u0430\\u0434 \\u0443\\u0436\\u0435 \\u043d\\u0435 \\u0431\\u0443\\u0434\\u0435\\u0442. \\u041f\\u043e\\u0436\\u0430\\u043b\\u0443\\u0439\\u0441\\u0442\\u0430, \\u0431\\u0443\\u0434\\u044c\\u0442\\u0435 \\u0443\\u0432\\u0435\\u0440\\u0435\\u043d\\u044b.\",\"es\":\"Una vez que eliminas tu cuenta, no hay vuelta atr\\u00e1s. Por favor, est\\u00e9 seguro.\"}', NULL, NULL, '2022-08-31 08:57:57', '2022-08-31 08:57:57'),
(165, 'delete_your_account', '{\"en\":\"Delete your account\",\"ru\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c \\u0443\\u0447\\u0435\\u0442\\u043d\\u0443\\u044e \\u0437\\u0430\\u043f\\u0438\\u0441\\u044c\",\"es\":\"eliminar tu cuenta\"}', NULL, NULL, '2022-08-31 08:59:00', '2022-08-31 08:59:00'),
(166, 'web_setting', '{\"en\":\"Web Setting\",\"ru\":\"\\u0412\\u0435\\u0431-\\u043d\\u0430\\u0441\\u0442\\u0440\\u043e\\u0439\\u043a\\u0430\",\"es\":\"Configuraci\\u00f3n web\"}', NULL, NULL, '2022-08-31 09:00:28', '2022-08-31 09:00:28'),
(167, 'save', '{\"en\":\"Save\",\"ru\":\"\\u0421\\u043e\\u0445\\u0440\\u0430\\u043d\\u044f\\u0442\\u044c\",\"es\":\"Ahorrar\"}', NULL, NULL, '2022-08-31 09:01:52', '2022-08-31 09:01:52'),
(168, 'website_title', '{\"en\":\"Website Title\",\"ru\":\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0432\\u0435\\u0431-\\u0441\\u0430\\u0439\\u0442\\u0430\",\"es\":\"T\\u00edtulo de la p\\u00e1gina\"}', NULL, NULL, '2022-08-31 09:02:43', '2022-08-31 09:02:43'),
(169, 'logo', '{\"en\":\"Logo\",\"ru\":\"\\u041b\\u043e\\u0433\\u043e\\u0442\\u0438\\u043f\",\"es\":\"Logo\"}', NULL, NULL, '2022-08-31 09:03:25', '2022-08-31 09:03:25'),
(170, 'favicon', '{\"en\":\"Favicon\",\"ru\":\"\\u0424\\u0430\\u0432\\u0438\\u043a\\u043e\\u043d\",\"es\":\"icono de favoritos\"}', NULL, NULL, '2022-08-31 09:03:46', '2022-08-31 09:03:46'),
(171, 'copyright', '{\"en\":\"CopyRight\",\"ru\":\"\\u0410\\u0432\\u0442\\u043e\\u0440\\u0441\\u043a\\u0438\\u0435 \\u043f\\u0440\\u0430\\u0432\\u0430\",\"es\":\"Derechos de autor\"}', NULL, NULL, '2022-08-31 09:04:41', '2022-08-31 09:04:41'),
(172, 'light', '{\"en\":\"Light\",\"ru\":\"\\u041b\\u0435\\u0433\\u043a\\u0438\\u0439\",\"es\":\"Ligera\"}', NULL, NULL, '2022-09-01 05:18:43', '2022-09-01 05:18:43'),
(173, 'dark', '{\"en\":\"Dark\",\"ru\":\"\\u0422\\u0435\\u043c\\u043d\\u044b\\u0439\",\"es\":\"Oscura\"}', NULL, NULL, '2022-09-01 05:19:08', '2022-09-01 05:19:08'),
(174, 'topbar_sidebar_color', '{\"en\":\"Topbar & Sidebar Color\",\"ru\":\"\\u0426\\u0432\\u0435\\u0442 \\u0432\\u0435\\u0440\\u0445\\u043d\\u0435\\u0439 \\u0438 \\u0431\\u043e\\u043a\\u043e\\u0432\\u043e\\u0439 \\u043f\\u0430\\u043d\\u0435\\u043b\\u0438\",\"es\":\"Color de la barra superior y la barra lateral\"}', NULL, NULL, '2022-09-01 05:22:05', '2022-09-01 05:22:05'),
(175, 'file_manager', '{\"en\":\"File Manager\",\"ru\":\"\\u0424\\u0430\\u0439\\u043b\\u043e\\u0432\\u044b\\u0439 \\u043c\\u0435\\u043d\\u0435\\u0434\\u0436\\u0435\\u0440\",\"es\":\"Administradora de archivos\"}', NULL, NULL, '2022-09-01 10:16:01', '2022-09-01 10:16:01'),
(176, 'page_url', '{\"en\":\"Page URL\",\"ru\":\"URL-\\u0430\\u0434\\u0440\\u0435\\u0441 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u044b\",\"es\":\"URL de la p\\u00e1gina\"}', NULL, NULL, '2022-09-01 12:53:24', '2022-09-01 12:53:24'),
(177, 'latest', '{\"en\":\"Latest\",\"ru\":\"\\u041f\\u043e\\u0441\\u043b\\u0435\\u0434\\u043d\\u0438\\u0439\",\"es\":\"M\\u00e1s reciente\"}', NULL, NULL, '2022-09-02 05:26:48', '2022-09-02 05:26:48'),
(178, 'domain_aliases', '{\"en\":\"Domain aliases\",\"ru\":\"\\u041f\\u0441\\u0435\\u0432\\u0434\\u043e\\u043d\\u0438\\u043c\\u044b \\u0434\\u043e\\u043c\\u0435\\u043d\\u0430\"}', NULL, NULL, '2022-09-05 04:41:05', '2022-09-05 04:41:05'),
(179, 'main_domain', '{\"en\":\"Main Domain\",\"ru\":\"\\u041e\\u0441\\u043d\\u043e\\u0432\\u043d\\u043e\\u0439 \\u0434\\u043e\\u043c\\u0435\\u043d\"}', NULL, NULL, '2022-09-05 04:41:51', '2022-09-05 04:41:51'),
(180, 'protection', '{\"en\":\"Protection\",\"ru\":\"\\u0417\\u0430\\u0449\\u0438\\u0442\\u0430\"}', NULL, NULL, '2022-09-05 04:43:04', '2022-09-05 04:43:04'),
(181, 'block_ip_after_an_unsuccessful_login_attempt_on_the_site', '{\"en\":\"Block IP after an unsuccessful login attempt on the site\",\"ru\":\"\\u0411\\u043b\\u043e\\u043a\\u0438\\u0440\\u043e\\u0432\\u043a\\u0430 IP \\u043f\\u043e\\u0441\\u043b\\u0435 \\u043d\\u0435\\u0443\\u0434\\u0430\\u0447\\u043d\\u043e\\u0439 \\u043f\\u043e\\u043f\\u044b\\u0442\\u043a\\u0438 \\u0430\\u0432\\u0442\\u043e\\u0440\\u0438\\u0437\\u0430\\u0446\\u0438\\u0438 \\u043d\\u0430 \\u0441\\u0430\\u0439\\u0442\\u0435\"}', NULL, NULL, '2022-09-05 04:44:22', '2022-09-05 04:44:22'),
(182, 'block_time', '{\"en\":\"Block time\",\"ru\":\"\\u0411\\u043b\\u043e\\u043a\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c \\u0432\\u0440\\u0435\\u043c\\u044f\"}', NULL, NULL, '2022-09-05 04:45:07', '2022-09-05 04:45:07'),
(183, 'number_of_attempts', '{\"en\":\"Number of attempts\",\"ru\":\"\\u041a\\u043e\\u043b\\u0438\\u0447\\u0435\\u0441\\u0442\\u0432\\u043e \\u043f\\u043e\\u043f\\u044b\\u0442\\u043e\\u043a\"}', NULL, NULL, '2022-09-05 04:47:01', '2022-09-05 04:47:01'),
(184, 'block_ip_after_an_unsuccessful_attempt_to_log_in_to_the_admin_section', '{\"en\":\"Block IP after an unsuccessful attempt to log in to the admin section\",\"ru\":\"\\u0411\\u043b\\u043e\\u043a\\u0438\\u0440\\u043e\\u0432\\u043a\\u0430 IP \\u043f\\u043e\\u0441\\u043b\\u0435 \\u043d\\u0435\\u0443\\u0434\\u0430\\u0447\\u043d\\u043e\\u0439 \\u043f\\u043e\\u043f\\u044b\\u0442\\u043a\\u0438 \\u0432\\u0445\\u043e\\u0434\\u0430 \\u0432 \\u0430\\u0434\\u043c\\u0438\\u043d\\u043a\\u0443\"}', NULL, NULL, '2022-09-05 04:48:20', '2022-09-05 04:48:20'),
(185, 'encryption_of_passwords_and_email_addresses_of_users_in_mysql', '{\"en\":\"Encryption of passwords and e-mail addresses of users in MySQL\",\"ru\":\"\\u0428\\u0438\\u0444\\u0440\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u043f\\u0430\\u0440\\u043e\\u043b\\u0435\\u0439 \\u0438 \\u0430\\u0434\\u0440\\u0435\\u0441\\u043e\\u0432 \\u044d\\u043b\\u0435\\u043a\\u0442\\u0440\\u043e\\u043d\\u043d\\u043e\\u0439 \\u043f\\u043e\\u0447\\u0442\\u044b \\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0432 MySQL\"}', NULL, NULL, '2022-09-05 04:52:32', '2022-09-05 04:52:32'),
(186, 'generation_key', '{\"en\":\"Generation key\",\"ru\":\"\\u041a\\u043b\\u044e\\u0447 \\u0433\\u0435\\u043d\\u0435\\u0440\\u0430\\u0446\\u0438\\u0438\"}', NULL, NULL, '2022-09-05 04:53:11', '2022-09-05 04:53:11'),
(187, 'it_is_recommended_to_combine_capital_letters_with_small_letters_and_use_symbols', '{\"en\":\"It is recommended to combine capital letters with small letters and use symbols.\",\"ru\":\"\\u0420\\u0435\\u043a\\u043e\\u043c\\u0435\\u043d\\u0434\\u0443\\u0435\\u0442\\u0441\\u044f \\u0441\\u043e\\u0447\\u0435\\u0442\\u0430\\u0442\\u044c \\u0437\\u0430\\u0433\\u043b\\u0430\\u0432\\u043d\\u044b\\u0435 \\u0431\\u0443\\u043a\\u0432\\u044b \\u0441 \\u0441\\u0442\\u0440\\u043e\\u0447\\u043d\\u044b\\u043c\\u0438 \\u0438 \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u0442\\u044c \\u0441\\u0438\\u043c\\u0432\\u043e\\u043b\\u044b.\"}', NULL, NULL, '2022-09-05 04:54:18', '2022-09-05 07:54:18'),
(188, 'all_authorized_sessions_will_be_reset', '{\"en\":\"all authorized sessions will be reset !!!\",\"ru\":\"\\u0432\\u0441\\u0435 \\u0430\\u0432\\u0442\\u043e\\u0440\\u0438\\u0437\\u043e\\u0432\\u0430\\u043d\\u043d\\u044b\\u0435 \\u0441\\u0435\\u0430\\u043d\\u0441\\u044b \\u0431\\u0443\\u0434\\u0443\\u0442 \\u0441\\u0431\\u0440\\u043e\\u0448\\u0435\\u043d\\u044b\"}', NULL, NULL, '2022-09-05 04:55:30', '2022-09-05 04:55:30'),
(189, 'sql_injection', '{\"en\":\"SQL Injection\",\"ru\":\"SQL-\\u0438\\u043d\\u044a\\u0435\\u043a\\u0446\\u0438\\u044f\"}', NULL, NULL, '2022-09-05 04:57:03', '2022-09-05 04:57:03'),
(190, 'block_sql_injection_attempts', '{\"en\":\"Block SQL Injection attempts\",\"ru\":\"\\u0411\\u043b\\u043e\\u043a\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c \\u043f\\u043e\\u043f\\u044b\\u0442\\u043a\\u0438 SQL-\\u0438\\u043d\\u044a\\u0435\\u043a\\u0446\\u0438\\u0439\"}', NULL, NULL, '2022-09-05 04:59:08', '2022-09-05 04:59:08'),
(191, 'block_access_to_the_server', '{\"en\":\"Block access to the server\",\"ru\":\"\\u0417\\u0430\\u0431\\u043b\\u043e\\u043a\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c \\u0434\\u043e\\u0441\\u0442\\u0443\\u043f \\u043a \\u0441\\u0435\\u0440\\u0432\\u0435\\u0440\\u0443\"}', NULL, NULL, '2022-09-05 05:01:52', '2022-09-05 05:01:52'),
(192, 'ip_address_spoofing_through_a_proxy_server', '{\"en\":\"IP address spoofing through a proxy server\",\"ru\":\"\\u041f\\u043e\\u0434\\u043c\\u0435\\u043d\\u0430 IP-\\u0430\\u0434\\u0440\\u0435\\u0441\\u0430 \\u0447\\u0435\\u0440\\u0435\\u0437 \\u043f\\u0440\\u043e\\u043a\\u0441\\u0438-\\u0441\\u0435\\u0440\\u0432\\u0435\\u0440\"}', NULL, NULL, '2022-09-05 05:04:33', '2022-09-05 05:04:33'),
(193, 'deny_access_to_the_site_through_proxy_servers', '{\"en\":\"Deny access to the site through proxy servers\",\"ru\":\"\\u0417\\u0430\\u043f\\u0440\\u0435\\u0442\\u0438\\u0442\\u044c \\u0434\\u043e\\u0441\\u0442\\u0443\\u043f \\u043a \\u0441\\u0430\\u0439\\u0442\\u0443 \\u0447\\u0435\\u0440\\u0435\\u0437 \\u043f\\u0440\\u043e\\u043a\\u0441\\u0438-\\u0441\\u0435\\u0440\\u0432\\u0435\\u0440\\u044b\"}', NULL, NULL, '2022-09-05 05:05:21', '2022-09-05 05:05:21');
INSERT INTO `languagetranslations` (`id`, `key`, `lang_trans_val`, `en_value`, `ru_value`, `created_at`, `updated_at`) VALUES
(194, 'keep_a_lock_log', '{\"en\":\"Keep a lock log\",\"ru\":\"\\u0412\\u0435\\u0434\\u0438\\u0442\\u0435 \\u0436\\u0443\\u0440\\u043d\\u0430\\u043b \\u0431\\u043b\\u043e\\u043a\\u0438\\u0440\\u043e\\u0432\\u043a\\u0438\"}', NULL, NULL, '2022-09-05 05:05:40', '2022-09-05 05:05:40'),
(195, 'bind_all_authorizations_with_permissions_to_ip', '{\"en\":\"Bind all authorizations with permissions to IP\",\"ru\":\"\\u041f\\u0440\\u0438\\u0432\\u044f\\u0437\\u0430\\u0442\\u044c \\u0432\\u0441\\u0435 \\u0430\\u0432\\u0442\\u043e\\u0440\\u0438\\u0437\\u0430\\u0446\\u0438\\u0438 \\u0441 \\u0440\\u0430\\u0437\\u0440\\u0435\\u0448\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438 \\u043a IP\"}', NULL, NULL, '2022-09-05 05:07:37', '2022-09-05 05:07:37'),
(196, 'enable_binding_to_ip_addresses', '{\"en\":\"Enable binding to IP addresses\",\"ru\":\"\\u0412\\u043a\\u043b\\u044e\\u0447\\u0438\\u0442\\u044c \\u043f\\u0440\\u0438\\u0432\\u044f\\u0437\\u043a\\u0443 \\u043a IP-\\u0430\\u0434\\u0440\\u0435\\u0441\\u0430\\u043c\"}', NULL, NULL, '2022-09-05 05:08:37', '2022-09-05 05:08:37'),
(197, 'whois', '{\"en\":\"Whois\",\"ru\":\"\\u041a\\u0442\\u043e\"}', NULL, NULL, '2022-09-05 05:10:54', '2022-09-05 05:10:54'),
(198, 'allow_online_authentication', '{\"en\":\"Allow online authentication\",\"ru\":\"\\u0420\\u0430\\u0437\\u0440\\u0435\\u0448\\u0438\\u0442\\u044c \\u043e\\u043d\\u043b\\u0430\\u0439\\u043d-\\u0430\\u0443\\u0442\\u0435\\u043d\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0446\\u0438\\u044e\"}', NULL, NULL, '2022-09-05 05:11:32', '2022-09-05 05:11:32'),
(199, 'yes', '{\"en\":\"Yes\",\"ru\":\"\\u0414\\u0430\"}', NULL, NULL, '2022-09-05 05:12:03', '2022-09-05 05:12:03'),
(200, 'system_maintains_its_database', '{\"en\":\"The system maintains its database of entries from providers by means of data exchange with the, Apnic and Ripe databases . Disabling the function makes it impossible to block the site by countries of the world.\",\"ru\":\"\\u0421\\u0438\\u0441\\u0442\\u0435\\u043c\\u0430 \\u0432\\u0435\\u0434\\u0435\\u0442 \\u0441\\u0432\\u043e\\u044e \\u0431\\u0430\\u0437\\u0443 \\u0437\\u0430\\u043f\\u0438\\u0441\\u0435\\u0439 \\u043e\\u0442 \\u043f\\u0440\\u043e\\u0432\\u0430\\u0439\\u0434\\u0435\\u0440\\u043e\\u0432 \\u043f\\u043e\\u0441\\u0440\\u0435\\u0434\\u0441\\u0442\\u0432\\u043e\\u043c \\u043e\\u0431\\u043c\\u0435\\u043d\\u0430 \\u0434\\u0430\\u043d\\u043d\\u044b\\u043c\\u0438 \\u0441 \\u0431\\u0430\\u0437\\u0430\\u043c\\u0438 \\u0434\\u0430\\u043d\\u043d\\u044b\\u0445, Apnic \\u0438 Ripe. \\u041e\\u0442\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\\u0438\\u0435 \\u0444\\u0443\\u043d\\u043a\\u0446\\u0438\\u0438 \\u0434\\u0435\\u043b\\u0430\\u0435\\u0442 \\u043d\\u0435\\u0432\\u043e\\u0437\\u043c\\u043e\\u0436\\u043d\\u043e\\u0439 \\u0431\\u043b\\u043e\\u043a\\u0438\\u0440\\u043e\\u0432\\u043a\\u0443 \\u0441\\u0430\\u0439\\u0442\\u0430 \\u043f\\u043e \\u0441\\u0442\\u0440\\u0430\\u043d\\u0430\\u043c \\u043c\\u0438\\u0440\\u0430.\"}', NULL, NULL, '2022-09-05 05:14:27', '2022-09-05 05:14:27'),
(201, 'use_it_for_sharp', '{\"en\":\"It is not recommended to use it for SHARP, high loads on the site.\",\"ru\":\"\\u041d\\u0435 \\u0440\\u0435\\u043a\\u043e\\u043c\\u0435\\u043d\\u0434\\u0443\\u0435\\u0442\\u0441\\u044f \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u0442\\u044c \\u0435\\u0433\\u043e \\u043f\\u0440\\u0438 SHARP, \\u0432\\u044b\\u0441\\u043e\\u043a\\u0438\\u0445 \\u043d\\u0430\\u0433\\u0440\\u0443\\u0437\\u043a\\u0430\\u0445 \\u043d\\u0430 \\u0441\\u0430\\u0439\\u0442.\"}', NULL, NULL, '2022-09-05 05:15:39', '2022-09-05 05:15:39'),
(202, 'editor', '{\"en\":\"Editor\",\"ru\":\"\\u0440\\u0435\\u0434\\u0430\\u043a\\u0442\\u043e\\u0440\"}', NULL, NULL, '2022-09-05 05:17:24', '2022-09-05 05:17:24'),
(203, 'allow_editing_files', '{\"en\":\"Allow editing files\",\"ru\":\"\\u0420\\u0430\\u0437\\u0440\\u0435\\u0448\\u0438\\u0442\\u044c \\u0440\\u0435\\u0434\\u0430\\u043a\\u0442\\u0438\\u0440\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0444\\u0430\\u0439\\u043b\\u043e\\u0432\"}', NULL, NULL, '2022-09-05 05:17:44', '2022-09-05 05:17:44'),
(204, 'edit_visually', '{\"en\":\"Edit visually\",\"ru\":\"\\u0420\\u0435\\u0434\\u0430\\u043a\\u0442\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c \\u0432\\u0438\\u0437\\u0443\\u0430\\u043b\\u044c\\u043d\\u043e\"}', NULL, NULL, '2022-09-05 05:19:13', '2022-09-05 05:19:13'),
(205, 'allow_to_insert_images', '{\"en\":\"Allow to insert images\",\"ru\":\"\\u0420\\u0430\\u0437\\u0440\\u0435\\u0448\\u0438\\u0442\\u044c \\u0432\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u0442\\u044c \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f\"}', NULL, NULL, '2022-09-05 05:19:45', '2022-09-05 05:19:45'),
(206, 'edit_area_frame_color', '{\"en\":\"Edit area frame color\",\"ru\":\"\\u0426\\u0432\\u0435\\u0442 \\u0440\\u0430\\u043c\\u043a\\u0438 \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u0438 \\u0440\\u0435\\u0434\\u0430\\u043a\\u0442\\u0438\\u0440\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f\"}', NULL, NULL, '2022-09-05 05:21:28', '2022-09-05 05:21:28'),
(207, 'edit_area_frame_color_on_hover', '{\"en\":\"Edit area frame color on hover\",\"ru\":\"\\u0418\\u0437\\u043c\\u0435\\u043d\\u0435\\u043d\\u0438\\u0435 \\u0446\\u0432\\u0435\\u0442\\u0430 \\u0440\\u0430\\u043c\\u043a\\u0438 \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u0438 \\u043f\\u0440\\u0438 \\u043d\\u0430\\u0432\\u0435\\u0434\\u0435\\u043d\\u0438\\u0438\"}', NULL, NULL, '2022-09-05 05:22:29', '2022-09-05 05:22:29'),
(208, 'files_and_folders', '{\"en\":\"Files and folders\",\"ru\":\"\\u0424\\u0430\\u0439\\u043b\\u044b \\u0438 \\u043f\\u0430\\u043f\\u043a\\u0438\"}', NULL, NULL, '2022-09-05 05:27:49', '2022-09-05 05:27:49'),
(209, 'folder_permissions', '{\"en\":\"Folder permissions\",\"ru\":\"\\u041f\\u0440\\u0430\\u0432\\u0430 \\u0434\\u043e\\u0441\\u0442\\u0443\\u043f\\u0430 \\u043a \\u043f\\u0430\\u043f\\u043a\\u0435\"}', NULL, NULL, '2022-09-05 05:28:13', '2022-09-05 05:28:13'),
(210, 'file_permissions', '{\"en\":\"File permissions\",\"ru\":\"\\u041f\\u0440\\u0430\\u0432\\u0430 \\u0434\\u043e\\u0441\\u0442\\u0443\\u043f\\u0430 \\u043a \\u0444\\u0430\\u0439\\u043b\\u0430\\u043c\"}', NULL, NULL, '2022-09-05 05:28:42', '2022-09-05 05:28:42'),
(211, 'captcha', '{\"en\":\"CAPTCHA\",\"ru\":\"\\u043a\\u0430\\u043f\\u0447\\u0430\"}', NULL, NULL, '2022-09-05 05:29:26', '2022-09-05 05:29:26'),
(212, 'font', '{\"en\":\"Font\",\"ru\":\"\\u0428\\u0440\\u0438\\u0444\\u0442\"}', NULL, NULL, '2022-09-05 05:30:00', '2022-09-05 05:30:00'),
(213, 'font_color', '{\"en\":\"Font Color\",\"ru\":\"\\u0426\\u0432\\u0435\\u0442 \\u0448\\u0440\\u0438\\u0444\\u0442\\u0430\"}', NULL, NULL, '2022-09-05 05:30:44', '2022-09-05 05:30:44'),
(214, 'characters', '{\"en\":\"Characters\",\"ru\":\"\\u041f\\u0435\\u0440\\u0441\\u043e\\u043d\\u0430\\u0436\\u0438\"}', NULL, NULL, '2022-09-05 05:31:12', '2022-09-05 05:31:12'),
(215, 'valid', '{\"en\":\"Valid\",\"ru\":\"\\u0414\\u0435\\u0439\\u0441\\u0442\\u0432\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u044b\\u0439\"}', NULL, NULL, '2022-09-05 05:32:21', '2022-09-05 05:32:21'),
(216, 'font_size', '{\"en\":\"Font size\",\"ru\":\"\\u0420\\u0430\\u0437\\u043c\\u0435\\u0440 \\u0448\\u0440\\u0438\\u0444\\u0442\\u0430\"}', NULL, NULL, '2022-09-05 05:35:11', '2022-09-05 05:35:11'),
(217, 'indent_left', '{\"en\":\"Indent left\",\"ru\":\"\\u041e\\u0442\\u0441\\u0442\\u0443\\u043f \\u0441\\u043b\\u0435\\u0432\\u0430\"}', NULL, NULL, '2022-09-05 05:36:11', '2022-09-05 05:36:11'),
(218, 'top_margin', '{\"en\":\"Top margin\",\"ru\":\"\\u0412\\u0435\\u0440\\u0445\\u043d\\u0435\\u0435 \\u043f\\u043e\\u043b\\u0435\"}', NULL, NULL, '2022-09-05 05:36:42', '2022-09-05 05:36:42'),
(219, 'font_slant', '{\"en\":\"Font slant\",\"ru\":\"\\u041d\\u0430\\u043a\\u043b\\u043e\\u043d \\u0448\\u0440\\u0438\\u0444\\u0442\\u0430\"}', NULL, NULL, '2022-09-05 05:37:46', '2022-09-05 05:37:46'),
(220, 'picture_size', '{\"en\":\"Picture size\",\"ru\":\"\\u0420\\u0430\\u0437\\u043c\\u0435\\u0440 \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f\"}', NULL, NULL, '2022-09-05 05:41:37', '2022-09-05 05:41:37'),
(221, 'after_changing_the_generation_key', '{\"en\":\"After changing the generation key,\",\"ru\":\"\\u041f\\u043e\\u0441\\u043b\\u0435 \\u0441\\u043c\\u0435\\u043d\\u044b \\u043a\\u043b\\u044e\\u0447\\u0430 \\u0433\\u0435\\u043d\\u0435\\u0440\\u0430\\u0446\\u0438\\u0438,\"}', NULL, NULL, '2022-09-05 07:50:29', '2022-09-05 07:54:57'),
(222, 'general_cms_settings', '{\"en\":\"General CMS Settings\",\"ru\":\"\\u041e\\u0431\\u0449\\u0438\\u0435 \\u043d\\u0430\\u0441\\u0442\\u0440\\u043e\\u0439\\u043a\\u0438 CMS\"}', NULL, NULL, '2022-09-05 12:21:24', '2022-09-05 12:21:24'),
(223, 'add_agent', '{\"en\":\"Add Agent\",\"ru\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c \\u0430\\u0433\\u0435\\u043d\\u0442\\u0430\"}', NULL, NULL, '2022-09-06 05:52:58', '2022-09-06 05:52:58'),
(224, 'agent', '{\"en\":\"Agent\",\"ru\":\"\\u0410\\u0433\\u0435\\u043d\\u0442\"}', NULL, NULL, '2022-09-06 05:56:58', '2022-09-06 05:56:58'),
(225, 'api', '{\"en\":\"API\",\"ru\":\"API\"}', NULL, NULL, '2022-09-06 07:21:44', '2022-09-06 07:21:44'),
(226, 'add_api', '{\"en\":\"Add API\",\"ru\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c API\"}', NULL, NULL, '2022-09-06 07:22:36', '2022-09-06 07:22:36'),
(227, 'route', '{\"en\":\"Route\",\"ru\":\"\\u041c\\u0430\\u0440\\u0448\\u0440\\u0443\\u0442\"}', NULL, NULL, '2022-09-06 07:25:12', '2022-09-06 07:25:12'),
(228, 'request_type', '{\"en\":\"Request Type\",\"ru\":\"\\u0442\\u0438\\u043f \\u0437\\u0430\\u043f\\u0440\\u043e\\u0441\\u0430\"}', NULL, NULL, '2022-09-06 07:36:01', '2022-09-06 07:36:01'),
(229, 'post', '{\"en\":\"POST\",\"ru\":\"\\u041f\\u041e\\u0427\\u0422\\u0410\"}', NULL, NULL, '2022-09-06 07:36:55', '2022-09-06 07:36:55'),
(230, 'get', '{\"en\":\"GET\",\"ru\":\"\\u041f\\u041e\\u041b\\u0423\\u0427\\u0418\\u0422\\u042c\"}', NULL, NULL, '2022-09-06 07:37:07', '2022-09-06 07:37:07'),
(231, 'do_i_need_authorization', '{\"en\":\"Do I need authorization\",\"ru\":\"\\u041c\\u043d\\u0435 \\u043d\\u0443\\u0436\\u043d\\u0430 \\u0430\\u0432\\u0442\\u043e\\u0440\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f\"}', NULL, NULL, '2022-09-06 07:37:56', '2022-09-06 07:37:56'),
(232, 'select_agent', '{\"en\":\"Select Agent\",\"ru\":\"\\u0412\\u044b\\u0431\\u0435\\u0440\\u0438\\u0442\\u0435 \\u0430\\u0433\\u0435\\u043d\\u0442\\u0430\"}', NULL, NULL, '2022-09-06 07:41:33', '2022-09-06 07:41:33'),
(233, 'authorization', '{\"en\":\"Authorization\",\"ru\":\"\\u0410\\u0432\\u0442\\u043e\\u0440\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f\"}', NULL, NULL, '2022-09-06 13:04:34', '2022-09-06 13:04:34'),
(234, 'handler', '{\"en\":\"Handler\",\"ru\":\"\\u041e\\u0431\\u0440\\u0430\\u0431\\u043e\\u0442\\u0447\\u0438\\u043a\"}', NULL, NULL, '2022-09-07 07:19:51', '2022-09-07 07:19:51'),
(235, 'category', '{\"en\":\"Category\"}', NULL, NULL, '2022-09-13 09:32:19', '2022-09-13 09:32:19'),
(236, 'create', '{\"en\":\"Create\"}', NULL, NULL, '2022-09-13 09:42:15', '2022-09-13 09:42:15'),
(237, 'category_list', '{\"en\":\"Category List\"}', NULL, NULL, '2022-09-13 10:54:26', '2022-09-13 10:54:26'),
(238, 'bus_schedule', '{\"en\":\"Bus Schedule\",\"ru\":\"\\u0420\\u0430\\u0441\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 \\u0430\\u0432\\u0442\\u043e\\u0431\\u0443\\u0441\\u043e\\u0432\"}', NULL, NULL, '2022-09-13 11:35:09', '2022-09-13 11:35:09'),
(239, 'day', '{\"en\":\"Day\",\"ru\":\"\\u0414\\u0435\\u043d\\u044c\"}', NULL, NULL, '2022-09-13 11:36:04', '2022-09-13 11:36:04'),
(240, 'night', '{\"en\":\"Night\",\"ru\":\"\\u041d\\u043e\\u0447\\u044c\"}', NULL, NULL, '2022-09-13 11:36:34', '2022-09-13 11:36:34'),
(241, 'schedule', '{\"en\":\"Schedule\"}', NULL, NULL, '2022-09-14 07:03:20', '2022-09-14 07:03:20'),
(242, 'bus', '{\"en\":\"Bus\"}', NULL, NULL, '2022-09-14 07:14:24', '2022-09-14 07:14:24'),
(243, 'available', '{\"en\":\"Available\"}', NULL, NULL, '2022-09-14 07:15:17', '2022-09-14 07:15:17'),
(244, 'unavailable', '{\"en\":\"Unavailable\"}', NULL, NULL, '2022-09-14 07:15:36', '2022-09-14 07:15:36'),
(245, 'orders', '{\"en\":\"Orders\"}', NULL, NULL, '2022-09-16 04:30:50', '2022-09-16 04:30:50'),
(246, 'order_number', '{\"en\":\"Order Number\"}', NULL, NULL, '2022-09-16 04:37:35', '2022-09-16 04:37:35'),
(247, 'customer_name', '{\"en\":\"Customer Name\"}', NULL, NULL, '2022-09-16 04:37:54', '2022-09-16 04:37:54'),
(248, 'payment_status', '{\"en\":\"Payment Status\"}', NULL, NULL, '2022-09-16 04:38:07', '2022-09-16 04:38:07'),
(249, 'payment_mode', '{\"en\":\"Payment Mode\"}', NULL, NULL, '2022-09-16 04:38:20', '2022-09-16 04:38:20'),
(250, 'date', '{\"en\":\"Date\"}', NULL, NULL, '2022-09-16 04:38:48', '2022-09-16 04:38:48'),
(251, 'amount', '{\"en\":\"Amount\"}', NULL, NULL, '2022-09-16 04:38:57', '2022-09-16 04:38:57'),
(252, 'success', '{\"en\":\"Success\"}', NULL, NULL, '2022-09-16 07:10:40', '2022-09-16 07:10:40'),
(253, 'failed', '{\"en\":\"Failed\"}', NULL, NULL, '2022-09-16 07:10:59', '2022-09-16 07:10:59'),
(254, 'cancel', '{\"en\":\"Cancel\"}', NULL, NULL, '2022-09-16 07:14:11', '2022-09-16 07:14:11'),
(255, 'invoice', '{\"en\":\"Invoice\"}', NULL, NULL, '2022-09-16 08:06:30', '2022-09-16 08:06:30');

-- --------------------------------------------------------

--
-- Table structure for table `menuitem`
--

CREATE TABLE `menuitem` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_order` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menuitem`
--

INSERT INTO `menuitem` (`id`, `name`, `url`, `menu_order`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 'Users', '/admin/users', '1', 1, NULL, NULL, '2022-07-05 00:40:32', '2022-07-05 00:40:32'),
(3, 'Add User', '/admin/users/add-users', '2', 1, NULL, NULL, '2022-07-05 00:41:04', '2022-07-05 00:41:04'),
(4, 'UserRoles', '/roles', '3', 1, NULL, NULL, '2022-07-05 00:41:29', '2022-07-05 00:41:29'),
(5, 'Permissions', '/permissions', '4', 1, NULL, NULL, '2022-07-05 00:41:49', '2022-07-05 00:41:49'),
(10, 'Employees Report', '/user/employees/report', '9', 1, NULL, NULL, '2022-07-05 00:45:31', '2022-07-05 00:45:31'),
(11, 'Equipment Report', '/user/equipment/report', '10', 1, NULL, NULL, '2022-07-05 00:45:51', '2022-07-05 00:45:51'),
(12, 'Work Order Report', '/user/work-order-status/report', '11', 1, NULL, NULL, '2022-07-05 00:46:11', '2022-07-05 00:46:11'),
(13, 'Menus', '/menus', '12', 1, 1, NULL, '2022-07-05 00:47:08', '2022-07-05 01:12:34'),
(14, 'Menu Item', '/menus-item', '13', 1, NULL, NULL, '2022-07-05 01:13:06', '2022-07-05 01:13:06'),
(18, 'Custom Fields', '/custom-fields', '17', 1, 1, NULL, '2022-08-04 08:29:44', '2022-08-04 08:30:51'),
(19, 'Add Custom Fields', '/custom-fields/create', '18', 1, 1, NULL, '2022-08-04 08:30:38', '2022-08-04 08:30:51'),
(36, 'Forms', '/forms', '19', 1, NULL, NULL, '2022-08-04 10:53:52', '2022-08-04 10:53:52'),
(37, 'Add Form', '/forms/create', '20', 1, NULL, NULL, '2022-08-04 10:54:16', '2022-08-04 10:54:16');

-- --------------------------------------------------------

--
-- Table structure for table `menuses`
--

CREATE TABLE `menuses` (
  `id` bigint(20) NOT NULL,
  `user_role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_item` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `child_menu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_menu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_order` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menuses`
--

INSERT INTO `menuses` (`id`, `user_role`, `menu_item`, `faicon`, `url`, `child_menu`, `parent_menu`, `menu_order`, `status`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'admin,Super-Admin', 'Users', 'fas fa-users', '#', 'Yes', '2,3,4,5', '1', 1, 1, 1, NULL, '2022-07-05 01:01:41', '2022-07-08 01:31:45'),
(4, 'admin,Super-Admin', 'Reports', 'fas fa-chart-pie', '#', 'Yes', '10,11,12', '5', 2, 1, 1, NULL, '2022-07-05 01:03:55', '2022-08-08 12:42:56'),
(5, 'Super-Admin', 'Menus', 'fas fa-th', '#', 'Yes', '13,14', '7', 1, 1, 1, NULL, '2022-07-05 01:04:57', '2022-07-19 11:11:29'),
(6, 'admin,Super-Admin', 'Settings', 'fas fa-cog', '/settings', 'No', NULL, '9', 1, 1, 1, NULL, '2022-07-05 01:05:41', '2022-07-19 11:11:55'),
(7, 'admin,Client,Staff,Super-Admin', 'Mail', 'far fa-envelope', '/mail', 'No', NULL, '8', 1, 1, 1, NULL, '2022-07-05 05:42:29', '2022-07-19 11:11:45'),
(10, 'admin,Client,Staff,Super-Admin', 'Notifications', 'far fa-bell', '/notifications', 'No', NULL, '10', 2, 1, 1, NULL, '2022-07-19 11:10:27', '2022-07-19 11:15:32'),
(11, 'Client,Staff', 'Contact', 'fa fa-address-book', '/contact', 'No', NULL, '11', 2, 1, 1, NULL, '2022-07-20 05:18:31', '2022-07-20 05:35:12'),
(13, 'admin,Super-Admin', 'Forms', 'fab fa-wpforms', '#', 'Yes', '36,37', '13', 1, 1, 1, NULL, '2022-08-04 10:50:15', '2022-08-04 12:03:23'),
(14, 'admin,Super-Admin', 'Booking Forms', 'fas fa-book', '/booking-forms', 'No', NULL, '12', 1, 1, 1, NULL, '2022-08-04 12:03:50', '2022-08-05 04:31:43'),
(15, 'admin,Super-Admin', 'Dancer Category', 'fas fa-users', '/categories', 'No', NULL, '14', 1, 1, NULL, NULL, '2022-08-18 19:23:54', '2022-08-18 19:23:54');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_06_23_072953_create_permissions_table', 1),
(6, '2022_06_23_073001_create_roles_table', 1),
(7, '2022_06_23_073121_create_users_permissions_table', 1),
(8, '2022_06_23_073216_create_users_roles_table', 1),
(9, '2022_06_23_082042_create_permission_tables', 2),
(12, '2022_06_23_112901_create_inventories_table', 3),
(15, '2022_06_24_042203_create_taxonomies_table', 5),
(17, '2022_06_24_050617_create_taxonomy_data_table', 7),
(19, '2022_06_23_122047_create_equipment_table', 8),
(24, '2022_06_28_060653_create_file_logs_table', 10),
(25, '2022_06_29_070456_create_usersbkup_table', 11),
(30, '2022_06_27_064412_create_work_orders_table', 14),
(32, '2022_06_29_093143_create_work_order_images_table', 15),
(0, '2022_08_04_135003_create_custom_fields_table', 16),
(0, '2022_08_04_144316_create_custom_fields_data_table', 17),
(0, '2022_09_15_155327_create_user_infos_table', 18),
(0, '2022_09_15_155626_create_comments_table', 19),
(0, '2022_09_15_143144_create_orders_table', 20),
(0, '2022_09_16_104950_create_order_items_table', 21);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(3, 'App\\Models\\User', 7),
(4, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 4),
(4, 'App\\Models\\User', 5),
(4, 'App\\Models\\User', 8),
(4, 'App\\Models\\User', 15),
(5, 'App\\Models\\User', 13),
(5, 'App\\Models\\User', 18),
(5, 'App\\Models\\User', 19),
(5, 'App\\Models\\User', 20),
(5, 'App\\Models\\User', 21),
(5, 'App\\Models\\User', 22),
(5, 'App\\Models\\User', 23),
(5, 'App\\Models\\User', 24),
(5, 'App\\Models\\User', 25),
(5, 'App\\Models\\User', 26),
(5, 'App\\Models\\User', 27),
(5, 'App\\Models\\User', 28),
(5, 'App\\Models\\User', 29),
(5, 'App\\Models\\User', 30),
(5, 'App\\Models\\User', 31),
(5, 'App\\Models\\User', 32),
(5, 'App\\Models\\User', 33),
(5, 'App\\Models\\User', 34),
(5, 'App\\Models\\User', 35),
(5, 'App\\Models\\User', 36),
(5, 'App\\Models\\User', 37),
(5, 'App\\Models\\User', 38),
(5, 'App\\Models\\User', 39),
(5, 'App\\Models\\User', 40),
(5, 'App\\Models\\User', 41),
(5, 'App\\Models\\User', 45),
(5, 'App\\Models\\User', 47),
(5, 'App\\Models\\User', 48),
(5, 'App\\Models\\User', 49),
(4, 'App\\Models\\User', 6),
(4, 'App\\Models\\User', 9),
(5, 'App\\Models\\User', 50),
(5, 'App\\Models\\User', 51),
(5, 'App\\Models\\User', 52),
(5, 'App\\Models\\User', 53),
(5, 'App\\Models\\User', 54),
(5, 'App\\Models\\User', 55),
(5, 'App\\Models\\User', 56),
(5, 'App\\Models\\User', 57),
(4, 'App\\Models\\User', 17),
(5, 'App\\Models\\User', 58),
(5, 'App\\Models\\User', 62),
(5, 'App\\Models\\User', 63),
(5, 'App\\Models\\User', 64),
(5, 'App\\Models\\User', 65),
(5, 'App\\Models\\User', 66),
(2, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 2),
(6, 'App\\Models\\User', 3),
(6, 'App\\Models\\User', 4),
(6, 'App\\Models\\User', 6),
(6, 'App\\Models\\User', 7),
(6, 'App\\Models\\User', 8),
(6, 'App\\Models\\User', 9),
(6, 'App\\Models\\User', 10),
(6, 'App\\Models\\User', 11),
(6, 'App\\Models\\User', 12),
(6, 'App\\Models\\User', 13),
(6, 'App\\Models\\User', 14),
(6, 'App\\Models\\User', 15);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastid` int(11) DEFAULT NULL,
  `read_at` tinyint(4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `description`, `icon`, `type`, `url`, `lastid`, `read_at`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 8, 'Cooling Tower', 'You have received new job order!', 'https://iems.avisdemo.in/public/websetting/ch-favicon_1656925650.png', 'new_job_order', '/user/work_order/10004', 10004, 1, 1, NULL, NULL, '2022-07-19 11:50:44', '2022-07-19 12:52:41'),
(2, 8, 'Chiller', 'You have received new job order!', 'https://iems.avisdemo.in/public/websetting/ch-favicon_1656925650.png', 'new_job_order', '/user/work_order/10006', 10006, 1, 1, NULL, NULL, '2022-07-19 12:06:52', '2022-07-19 12:42:20');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cardnumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cardname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cardexp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cardexpyear` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cardcvv` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_mode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_network` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `tax`, `total`, `cardnumber`, `cardname`, `cardexp`, `cardexpyear`, `cardcvv`, `payment_id`, `token`, `created`, `currency`, `customer`, `payment_mode`, `country`, `payment_method`, `payment_network`, `payment_status`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1000, '#00000001', 13, '200', '0', '200', '4000 0566 5566 5556', 'Demo Test', '11', '2024', '443', 'ch_1LiXXPHAu0A7xjyR02DZu89V', NULL, '1663307791', 'inr', 'cus_MR93KQuaS9SCpB', 'MasterCard', 'US', 'stripe', 'mastercard', 'succeeded', 3, NULL, '2022-09-16 05:56:27', '2022-09-16 07:32:37'),
(1010, '#00001010', 14, '30', '0', '30', NULL, NULL, NULL, NULL, NULL, '07H57517495676638', '{\"scope\":\"https:\\/\\/uri.paypal.com\\/services\\/invoicing https:\\/\\/uri.paypal.com\\/services\\/vault\\/payment-tokens\\/read https:\\/\\/uri.paypal.com\\/services\\/disputes\\/read-buyer https:\\/\\/uri.paypal.com\\/services\\/payments\\/realtimepayment https:\\/\\/uri.paypal.com\\/services\\/disputes\\/update-seller https:\\/\\/uri.paypal.com\\/services\\/payments\\/payment\\/authcapture openid https:\\/\\/uri.paypal.com\\/services\\/disputes\\/read-seller Braintree:Vault https:\\/\\/uri.paypal.com\\/services\\/payments\\/refund https:\\/\\/api.paypal.com\\/v1\\/vault\\/credit-card https:\\/\\/api.paypal.com\\/v1\\/payments\\/.* https:\\/\\/uri.paypal.com\\/payments\\/payouts https:\\/\\/uri.paypal.com\\/services\\/vault\\/payment-tokens\\/readwrite https:\\/\\/api.paypal.com\\/v1\\/vault\\/credit-card\\/.* https:\\/\\/uri.paypal.com\\/services\\/shipping\\/trackers\\/readwrite https:\\/\\/uri.paypal.com\\/services\\/subscriptions https:\\/\\/uri.paypal.com\\/services\\/applications\\/webhooks\",\"access_token\":\"A21AAIlfcoNnnlMjzifujfDHqe4gYKD6-qPoxoC3vkyQE4gn_3hr-VJFh25XZDWejhtIlUsiBSxKfBoyjcTZycWj1WGVWNXng\",\"token_type\":\"Bearer\",\"app_id\":\"APP-80W284485P519543T\",\"expires_in\":29853,\"nonce\":\"2022-09-16T12:00:42ZEhsue-TIn2oHsDhoGegQEJVquLJk8vfWobzEZphzI8I\"}', '2022-09-16T12:43:19Z', 'USD', 'DAUSX67CAYELN', 'Paypal', 'US', 'paypal', 'paypal', 'COMPLETED', 1, NULL, '2022-09-16 12:43:10', '2022-09-16 12:43:20'),
(1011, '#00001011', 14, '30', '0', '30', NULL, NULL, NULL, NULL, NULL, '75G66938GR7638701', '{\"scope\":\"https:\\/\\/uri.paypal.com\\/services\\/invoicing https:\\/\\/uri.paypal.com\\/services\\/vault\\/payment-tokens\\/read https:\\/\\/uri.paypal.com\\/services\\/disputes\\/read-buyer https:\\/\\/uri.paypal.com\\/services\\/payments\\/realtimepayment https:\\/\\/uri.paypal.com\\/services\\/disputes\\/update-seller https:\\/\\/uri.paypal.com\\/services\\/payments\\/payment\\/authcapture openid https:\\/\\/uri.paypal.com\\/services\\/disputes\\/read-seller Braintree:Vault https:\\/\\/uri.paypal.com\\/services\\/payments\\/refund https:\\/\\/api.paypal.com\\/v1\\/vault\\/credit-card https:\\/\\/api.paypal.com\\/v1\\/payments\\/.* https:\\/\\/uri.paypal.com\\/payments\\/payouts https:\\/\\/uri.paypal.com\\/services\\/vault\\/payment-tokens\\/readwrite https:\\/\\/api.paypal.com\\/v1\\/vault\\/credit-card\\/.* https:\\/\\/uri.paypal.com\\/services\\/shipping\\/trackers\\/readwrite https:\\/\\/uri.paypal.com\\/services\\/subscriptions https:\\/\\/uri.paypal.com\\/services\\/applications\\/webhooks\",\"access_token\":\"A21AAIlfcoNnnlMjzifujfDHqe4gYKD6-qPoxoC3vkyQE4gn_3hr-VJFh25XZDWejhtIlUsiBSxKfBoyjcTZycWj1WGVWNXng\",\"token_type\":\"Bearer\",\"app_id\":\"APP-80W284485P519543T\",\"expires_in\":29386,\"nonce\":\"2022-09-16T12:00:42ZEhsue-TIn2oHsDhoGegQEJVquLJk8vfWobzEZphzI8I\"}', '2022-09-16T12:51:14Z', 'USD', 'DAUSX67CAYELN', 'Paypal', 'US', 'paypal', 'paypal', 'COMPLETED', 1, NULL, '2022-09-16 12:50:57', '2022-09-16 12:51:15'),
(1014, '#00001012', 11, '75', '0', '75', NULL, NULL, NULL, NULL, NULL, '47H20911WR652842F', '{\"scope\":\"https:\\/\\/uri.paypal.com\\/services\\/invoicing https:\\/\\/uri.paypal.com\\/services\\/vault\\/payment-tokens\\/read https:\\/\\/uri.paypal.com\\/services\\/disputes\\/read-buyer https:\\/\\/uri.paypal.com\\/services\\/payments\\/realtimepayment https:\\/\\/uri.paypal.com\\/services\\/disputes\\/update-seller https:\\/\\/uri.paypal.com\\/services\\/payments\\/payment\\/authcapture openid https:\\/\\/uri.paypal.com\\/services\\/disputes\\/read-seller Braintree:Vault https:\\/\\/uri.paypal.com\\/services\\/payments\\/refund https:\\/\\/api.paypal.com\\/v1\\/vault\\/credit-card https:\\/\\/api.paypal.com\\/v1\\/payments\\/.* https:\\/\\/uri.paypal.com\\/payments\\/payouts https:\\/\\/uri.paypal.com\\/services\\/vault\\/payment-tokens\\/readwrite https:\\/\\/api.paypal.com\\/v1\\/vault\\/credit-card\\/.* https:\\/\\/uri.paypal.com\\/services\\/shipping\\/trackers\\/readwrite https:\\/\\/uri.paypal.com\\/services\\/subscriptions https:\\/\\/uri.paypal.com\\/services\\/applications\\/webhooks\",\"access_token\":\"A21AAL-NjcTrS0nMf4yAM_gNrOTKXNPqQfA8AtEAg-5cahvwpK223u5AxrpCkh8B0mxVNsyMqNSJ5mmYc8M-Sq0NZVswZXLCQ\",\"token_type\":\"Bearer\",\"app_id\":\"APP-80W284485P519543T\",\"expires_in\":31391,\"nonce\":\"2022-09-16T13:00:51ZWX-kecWzIBLJdGuNNm7SEdXTJzMD9QiKQ6srBa_cobk\"}', '2022-09-16T13:17:50Z', 'USD', 'DAUSX67CAYELN', 'Paypal', 'US', 'paypal', 'paypal', 'COMPLETED', 1, NULL, '2022-09-16 13:17:41', '2022-09-16 13:17:51'),
(1015, '#00001015', 12, '55', '0', '55', NULL, NULL, NULL, NULL, NULL, '3PE05318A0967981V', '{\"scope\":\"https:\\/\\/uri.paypal.com\\/services\\/invoicing https:\\/\\/uri.paypal.com\\/services\\/vault\\/payment-tokens\\/read https:\\/\\/uri.paypal.com\\/services\\/disputes\\/read-buyer https:\\/\\/uri.paypal.com\\/services\\/payments\\/realtimepayment https:\\/\\/uri.paypal.com\\/services\\/disputes\\/update-seller https:\\/\\/uri.paypal.com\\/services\\/payments\\/payment\\/authcapture openid https:\\/\\/uri.paypal.com\\/services\\/disputes\\/read-seller Braintree:Vault https:\\/\\/uri.paypal.com\\/services\\/payments\\/refund https:\\/\\/api.paypal.com\\/v1\\/vault\\/credit-card https:\\/\\/api.paypal.com\\/v1\\/payments\\/.* https:\\/\\/uri.paypal.com\\/payments\\/payouts https:\\/\\/uri.paypal.com\\/services\\/vault\\/payment-tokens\\/readwrite https:\\/\\/api.paypal.com\\/v1\\/vault\\/credit-card\\/.* https:\\/\\/uri.paypal.com\\/services\\/shipping\\/trackers\\/readwrite https:\\/\\/uri.paypal.com\\/services\\/subscriptions https:\\/\\/uri.paypal.com\\/services\\/applications\\/webhooks\",\"access_token\":\"A21AAL-NjcTrS0nMf4yAM_gNrOTKXNPqQfA8AtEAg-5cahvwpK223u5AxrpCkh8B0mxVNsyMqNSJ5mmYc8M-Sq0NZVswZXLCQ\",\"token_type\":\"Bearer\",\"app_id\":\"APP-80W284485P519543T\",\"expires_in\":31248,\"nonce\":\"2022-09-16T13:00:51ZWX-kecWzIBLJdGuNNm7SEdXTJzMD9QiKQ6srBa_cobk\"}', '2022-09-16T13:20:11Z', 'USD', 'DAUSX67CAYELN', 'Paypal', 'US', 'paypal', 'paypal', 'COMPLETED', 1, NULL, '2022-09-16 13:20:04', '2022-09-16 13:20:12');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ticket_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bus_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bus_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bus_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bus_for` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `ticket_id`, `bus_id`, `bus_name`, `bus_time`, `bus_for`, `qty`, `amount`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1000, '1', '1', 'RedBus', '11:00:00', 'adult', '2', '40', 1, NULL, '2022-09-16 05:56:27', '2022-09-16 05:56:27'),
(2, 1000, '1', '1', 'RedBus', '11:00:00', 'child', '1', '35', 1, NULL, '2022-09-16 05:56:27', '2022-09-16 05:56:27'),
(3, 1000, '1', '1', 'RedBus', '11:00:00', 'adult', '2', '30', 1, NULL, '2022-09-16 05:56:27', '2022-09-16 05:56:27'),
(4, 1000, '1', '1', 'RedBus', '11:00:00', 'child', '1', '25', 1, NULL, '2022-09-16 05:56:27', '2022-09-16 05:56:27'),
(14, 1010, '1', '1', 'RedBus', '11:00:00', 'adult', '1', '30', 1, NULL, '2022-09-16 12:43:10', '2022-09-16 12:43:10'),
(15, 1011, '1', '1', 'RedBus', '11:00:00', 'adult', '1', '30', 1, NULL, '2022-09-16 12:50:57', '2022-09-16 12:50:57'),
(21, 1014, '1', '1', 'RedBus', '11:00:00', 'adult', '1', '40', 1, NULL, '2022-09-16 13:17:41', '2022-09-16 13:17:41'),
(22, 1014, '1', '1', 'RedBus', '11:00:00', 'child', '1', '35', 1, NULL, '2022-09-16 13:17:41', '2022-09-16 13:17:41'),
(23, 1015, '1', '2', 'RedBus', '12:00:00', 'adult', '1', '30', 1, NULL, '2022-09-16 13:20:04', '2022-09-16 13:20:04'),
(24, 1015, '1', '2', 'RedBus', '12:00:00', 'child', '1', '25', 1, NULL, '2022-09-16 13:20:04', '2022-09-16 13:20:04');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `name` varchar(512) NOT NULL,
  `template_id` int(11) NOT NULL,
  `charset` longtext NOT NULL,
  `title` longtext NOT NULL,
  `keywords` longtext NOT NULL,
  `description` longtext NOT NULL,
  `scripts` longtext NOT NULL,
  `toolbar` longtext NOT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `created_by_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `template_id`, `charset`, `title`, `keywords`, `description`, `scripts`, `toolbar`, `updated_by_id`, `created_by_id`, `created_at`, `updated_at`) VALUES
(5, 'Dante Finley', 8, '<p>&lt;section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;div class=&quot;container&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;h1&gt;Example website&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;p&gt;This is just a HTML example&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&lt;/section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;</p>', '<p>&lt;section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;div class=&quot;container&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;h1&gt;Example website&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;p&gt;This is just a HTML example&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&lt;/section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;</p>', '<p>&lt;section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;div class=&quot;container&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;h1&gt;Example website&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;p&gt;This is just a HTML example&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&lt;/section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;</p>', '<p>&lt;section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;div class=&quot;container&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;h1&gt;Example website&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;p&gt;This is just a HTML example&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&lt;/section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;</p>', '<p>&lt;section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;div class=&quot;container&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;h1&gt;Example website&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;p&gt;This is just a HTML example&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&lt;/section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;</p>', '<p>&lt;section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;div class=&quot;container&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;h1&gt;Example website&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;p&gt;This is just a HTML example&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&lt;/section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;</p>', NULL, 0, '2022-08-25 16:46:59', '2022-08-25 16:46:59'),
(6, 'Demo Type PAge', 10, '<p>This is Page Charset</p>', '<p>This is Page Title</p>', '<p>This is Page Keyword</p>', '<p>This is Page Description</p>', '<p>This is Page scritps</p>', '<p>This is Page Tootlbar</p>', NULL, 0, '2022-08-25 18:08:13', '2022-08-25 18:08:13'),
(7, 'Dante Finley', 8, '<p>&lt;section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;div class=&quot;container&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;h1&gt;Example website&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;p&gt;This is just a HTML example&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&lt;/section&gt;</p>', '<p>&lt;section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;div class=&quot;container&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;h1&gt;Example website&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;p&gt;This is just a HTML example&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&lt;/section&gt;</p>', '<p>&lt;section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;div class=&quot;container&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;h1&gt;Example website&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;p&gt;This is just a HTML example&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&lt;/section&gt;</p>', '<p>&lt;section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;div class=&quot;container&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;h1&gt;Example website&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;p&gt;This is just a HTML example&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&lt;/section&gt;</p>', '<p>&lt;section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;div class=&quot;container&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;h1&gt;Example website&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;p&gt;This is just a HTML example&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&lt;/section&gt;</p>', '<p>&lt;section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;div class=&quot;container&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;h1&gt;Example website&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;p&gt;This is just a HTML example&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&lt;/section&gt;</p>', NULL, 0, '2022-09-01 16:44:50', '2022-09-01 16:44:50');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'login', 'web', '2022-06-23 04:06:30', '2022-08-24 10:36:49'),
(2, 'logout', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(3, 'register', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(4, 'password.request', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(5, 'password.email', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(6, 'password.reset', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(7, 'password.update', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(8, 'password.confirm', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(9, 'logout.perform', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(10, 'users', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(11, 'addUser', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(12, 'storeUser', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(13, 'editUser', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(14, 'updateUser', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(15, 'viewUser', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(16, 'deleteUser', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(17, 'roles.create', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(18, 'roles.store', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(19, 'roles.show', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(20, 'roles.edit', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(21, 'roles.update', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(22, 'roles.destroy', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(23, 'permissions.index', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(24, 'permissions.create', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(25, 'permissions.store', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(26, 'permissions.show', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(27, 'permissions.edit', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(28, 'permissions.update', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(29, 'permissions.destroy', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(30, 'dashboard', 'web', '2022-06-23 04:06:30', '2022-06-23 04:06:30'),
(32, 'roles.index', 'web', '2022-06-23 05:17:17', '2022-06-23 05:17:17'),
(33, 'inventory.index', 'web', '2022-06-23 06:13:52', '2022-06-23 06:13:52'),
(34, 'inventory.create', 'web', '2022-06-23 06:13:52', '2022-06-23 06:13:52'),
(35, 'inventory.store', 'web', '2022-06-23 06:13:52', '2022-06-23 06:13:52'),
(36, 'inventory.show', 'web', '2022-06-23 06:13:52', '2022-06-23 06:13:52'),
(37, 'inventory.edit', 'web', '2022-06-23 06:13:52', '2022-06-23 06:13:52'),
(38, 'inventory.update', 'web', '2022-06-23 06:13:52', '2022-06-23 06:13:52'),
(39, 'inventory.destroy', 'web', '2022-06-23 06:13:52', '2022-06-23 06:13:52'),
(47, 'equipment.index', 'web', '2022-06-23 07:19:28', '2022-06-23 07:19:28'),
(48, 'equipment.create', 'web', '2022-06-23 07:19:28', '2022-06-23 07:19:28'),
(49, 'equipment.store', 'web', '2022-06-23 07:19:28', '2022-06-23 07:19:28'),
(50, 'equipment.show', 'web', '2022-06-23 07:19:28', '2022-06-23 07:19:28'),
(51, 'equipment.edit', 'web', '2022-06-23 07:19:28', '2022-06-23 07:19:28'),
(52, 'equipment.update', 'web', '2022-06-23 07:19:28', '2022-06-23 07:19:28'),
(53, 'equipment.destroy', 'web', '2022-06-23 07:19:28', '2022-06-23 07:19:28'),
(54, 'taxonomy.index', 'web', '2022-06-23 23:09:17', '2022-06-23 23:09:17'),
(55, 'taxonomy.create', 'web', '2022-06-23 23:09:17', '2022-06-23 23:09:17'),
(56, 'taxonomy.store', 'web', '2022-06-23 23:09:17', '2022-06-23 23:09:17'),
(57, 'taxonomy.show', 'web', '2022-06-23 23:09:17', '2022-06-23 23:09:17'),
(58, 'taxonomy.edit', 'web', '2022-06-23 23:09:17', '2022-06-23 23:09:17'),
(59, 'taxonomy.update', 'web', '2022-06-23 23:09:17', '2022-06-23 23:09:17'),
(60, 'taxonomy.destroy', 'web', '2022-06-23 23:09:17', '2022-06-23 23:09:17'),
(61, 'taxonomyData.index', 'web', '2022-06-23 23:39:46', '2022-06-23 23:39:46'),
(62, 'taxonomyData.create', 'web', '2022-06-23 23:39:47', '2022-06-23 23:39:47'),
(63, 'taxonomyData.store', 'web', '2022-06-23 23:39:47', '2022-06-23 23:39:47'),
(64, 'taxonomyData.show', 'web', '2022-06-23 23:39:47', '2022-06-23 23:39:47'),
(65, 'taxonomyData.edit', 'web', '2022-06-23 23:39:47', '2022-06-23 23:39:47'),
(66, 'taxonomyData.update', 'web', '2022-06-23 23:39:47', '2022-06-23 23:39:47'),
(67, 'taxonomyData.destroy', 'web', '2022-06-23 23:39:47', '2022-06-23 23:39:47'),
(68, 'equipment.downloadPDF', 'web', '2022-06-24 06:27:19', '2022-06-24 06:27:19'),
(69, 'equipment.getQRCode', 'web', '2022-06-26 23:51:01', '2022-06-26 23:51:01'),
(70, 'work_order.index', 'web', '2022-06-27 01:15:58', '2022-06-27 01:15:58'),
(71, 'work_order.create', 'web', '2022-06-27 01:15:58', '2022-06-27 01:15:58'),
(72, 'work_order.store', 'web', '2022-06-27 01:15:58', '2022-06-27 01:15:58'),
(73, 'work_order.show', 'web', '2022-06-27 01:15:58', '2022-06-27 01:15:58'),
(74, 'work_order.edit', 'web', '2022-06-27 01:15:58', '2022-06-27 01:15:58'),
(75, 'work_order.update', 'web', '2022-06-27 01:15:58', '2022-06-27 01:15:58'),
(76, 'work_order.destroy', 'web', '2022-06-27 01:15:58', '2022-06-27 01:15:58'),
(77, 'equipment.export', 'web', '2022-06-27 04:15:54', '2022-06-27 04:15:54'),
(78, 'equipment.import', 'web', '2022-06-27 04:15:54', '2022-06-27 04:15:54'),
(79, 'work_order.report', 'web', '2022-06-28 04:05:50', '2022-06-28 04:05:50'),
(80, 'dashboard.clientStaff', 'web', '2022-06-28 06:07:06', '2022-06-28 06:07:06'),
(81, 'clientUser', 'web', '2022-06-28 06:08:21', '2022-06-28 06:08:21'),
(82, 'staffsUser', 'web', '2022-06-28 06:08:21', '2022-06-28 06:08:21'),
(83, 'user.profile', 'web', '2022-06-29 00:52:21', '2022-06-29 00:52:21'),
(84, 'authRemove', 'web', '2022-06-29 01:30:10', '2022-06-29 01:30:10'),
(85, 'employees.report', 'web', '2022-06-30 00:48:53', '2022-06-30 00:48:53'),
(86, 'equipment.report', 'web', '2022-06-30 00:48:53', '2022-06-30 00:48:53'),
(87, 'settings.index', 'web', '2022-07-04 02:59:43', '2022-07-04 02:59:43'),
(88, 'settings.store', 'web', '2022-07-04 03:30:30', '2022-07-04 03:30:30'),
(89, 'menus.index', 'web', '2022-07-04 07:40:20', '2022-07-04 07:40:20'),
(90, 'menus.create', 'web', '2022-07-04 07:40:28', '2022-07-04 07:40:28'),
(91, 'menus.store', 'web', '2022-07-04 07:40:38', '2022-07-04 07:40:38'),
(92, 'menus.edit', 'web', '2022-07-04 07:40:46', '2022-07-04 07:40:46'),
(93, 'menus.update', 'web', '2022-07-04 07:40:59', '2022-07-04 07:40:59'),
(94, 'menus.destroy', 'web', '2022-07-04 07:41:18', '2022-07-04 07:41:18'),
(95, 'menus_item.index', 'web', '2022-07-05 00:20:26', '2022-07-05 00:20:26'),
(96, 'menus_item.create', 'web', '2022-07-05 00:20:35', '2022-07-05 00:20:35'),
(97, 'menus_item.store', 'web', '2022-07-05 00:20:45', '2022-07-05 00:20:45'),
(98, 'menus_item.edit', 'web', '2022-07-05 00:20:56', '2022-07-05 00:20:56'),
(99, 'menus_item.update', 'web', '2022-07-05 00:21:04', '2022-07-05 00:21:04'),
(100, 'menus_item.destroy', 'web', '2022-07-05 00:21:12', '2022-07-05 00:21:12'),
(101, 'dashboard.workorder', 'web', '2022-07-05 03:21:12', '2022-07-05 03:21:12'),
(102, 'dashboard.contactstore', 'web', '2022-07-05 04:57:32', '2022-07-05 04:57:32'),
(103, 'dashboard.mail', 'web', '2022-07-05 05:40:09', '2022-07-05 05:40:09'),
(104, 'dashboard.readmail', 'web', '2022-07-05 06:06:07', '2022-07-05 06:06:07'),
(105, 'dashboard.replymessage', 'web', '2022-07-05 06:58:45', '2022-07-05 06:58:45'),
(106, 'dashboard.destorymail', 'web', '2022-07-05 07:49:07', '2022-07-05 07:49:07'),
(108, 'save-token', 'web', '2022-07-06 02:41:49', '2022-07-06 02:41:49'),
(110, 'send.notification', 'web', '2022-07-06 02:42:44', '2022-07-06 02:42:44'),
(111, 'user.fetchClient', 'web', '2022-07-07 23:37:13', '2022-07-07 23:37:13'),
(112, 'equipment_issues.index', 'web', '2022-07-08 00:14:37', '2022-07-08 00:14:37'),
(113, 'equipment_issues.create', 'web', '2022-07-08 00:14:46', '2022-07-08 00:14:46'),
(114, 'equipment_issues.store', 'web', '2022-07-08 00:14:57', '2022-07-08 00:14:57'),
(115, 'equipment_issues.show', 'web', '2022-07-08 00:15:10', '2022-07-08 00:15:10'),
(116, 'equipment_issues.edit', 'web', '2022-07-08 00:15:17', '2022-07-08 00:15:17'),
(117, 'equipment_issues.update', 'web', '2022-07-08 00:15:25', '2022-07-08 00:15:25'),
(118, 'equipment_issues.destroy', 'web', '2022-07-08 00:15:40', '2022-07-08 00:15:40'),
(119, 'equipment_issues_order.create', 'web', '2022-07-08 01:49:58', '2022-07-08 01:49:58'),
(120, 'equipment_issues_order.store', 'web', '2022-07-08 01:50:06', '2022-07-08 01:50:06'),
(121, 'equipment_issues_order.index', 'web', '2022-07-08 01:50:14', '2022-07-08 01:50:14'),
(122, 'equipment_issues_order.edit', 'web', '2022-07-08 01:50:20', '2022-07-08 01:50:20'),
(123, 'equipment_issues_order.update', 'web', '2022-07-08 01:50:28', '2022-07-08 01:50:28'),
(124, 'equipment_issues_order.destroy', 'web', '2022-07-08 01:50:36', '2022-07-08 01:50:36'),
(125, 'user.fetchInventory', 'web', '2022-07-08 13:03:44', '2022-07-08 13:03:44'),
(126, 'departments.index', 'web', '2022-07-18 10:47:41', '2022-07-18 10:47:41'),
(127, 'departments.create', 'web', '2022-07-18 10:48:06', '2022-07-18 10:48:06'),
(128, 'departments.store', 'web', '2022-07-18 10:48:26', '2022-07-18 10:48:26'),
(129, 'departments.edit', 'web', '2022-07-18 10:48:36', '2022-07-18 10:48:36'),
(130, 'departments.update', 'web', '2022-07-18 10:48:52', '2022-07-18 10:48:52'),
(131, 'departments.destroy', 'web', '2022-07-18 10:49:10', '2022-07-18 10:49:10'),
(132, 'notification.destroy', 'web', '2022-07-19 11:05:42', '2022-07-19 11:05:42'),
(133, 'notification.clearAll', 'web', '2022-07-19 11:06:12', '2022-07-19 11:06:12'),
(134, 'dashboard.notificationsList', 'web', '2022-07-19 11:06:30', '2022-07-19 11:06:30'),
(135, 'dashboard.contactindex', 'web', '2022-07-20 05:19:10', '2022-07-20 05:19:10'),
(136, 'infoblocks.create', 'web', '2022-08-26 09:05:36', '2022-08-26 09:05:36'),
(137, 'infoblocks.store', 'web', '2022-08-26 09:05:48', '2022-08-26 09:05:48'),
(138, 'infoblocks.edit', 'web', '2022-08-26 09:05:57', '2022-08-26 09:05:57'),
(139, 'infoblocks.update', 'web', '2022-08-26 09:06:05', '2022-08-26 09:06:05'),
(140, 'infoblocks.destroy', 'web', '2022-08-26 09:06:19', '2022-08-26 09:06:19'),
(141, 'infoblocks.alldelete', 'web', '2022-08-26 09:06:32', '2022-08-26 09:06:32'),
(142, 'iinfoblocks.transfer_rights', 'web', '2022-08-26 09:06:50', '2022-08-26 09:06:50'),
(143, 'infoblockgroup.trupdate', 'web', '2022-08-26 09:06:58', '2022-08-26 09:06:58'),
(144, 'infoblockgroup.clone', 'web', '2022-08-26 09:07:09', '2022-08-26 09:07:09'),
(145, 'infoblockgroup.element_properties', 'web', '2022-08-26 09:07:18', '2022-08-26 09:07:18'),
(146, 'infoblockgroup.element_prop_store', 'web', '2022-08-26 09:07:27', '2022-08-26 09:07:27'),
(147, 'infoblockgroup.element_prop_delete', 'web', '2022-08-26 09:07:39', '2022-08-26 09:07:39'),
(148, 'infoblockgroup.index', 'web', '2022-08-26 09:07:52', '2022-08-26 09:07:52'),
(149, 'infoblockgroup.create', 'web', '2022-08-26 09:08:01', '2022-08-26 09:08:01'),
(150, 'infoblockgroup.store', 'web', '2022-08-26 09:08:27', '2022-08-26 09:08:27'),
(151, 'infoblockgroup.show', 'web', '2022-08-26 09:08:35', '2022-08-26 09:08:35'),
(152, 'infoblockgroup.edit', 'web', '2022-08-26 09:08:44', '2022-08-26 09:08:44'),
(153, 'infoblckgroup.update', 'web', '2022-08-26 09:08:51', '2022-08-26 09:08:51'),
(154, 'infoblockgroup.destroy', 'web', '2022-08-26 09:09:01', '2022-08-26 09:09:01'),
(155, 'infoblockgroup.alldelete', 'web', '2022-08-26 09:09:10', '2022-08-26 09:09:10'),
(156, 'infoblockgroup.fields_index', 'web', '2022-08-26 09:09:21', '2022-08-26 09:09:21'),
(157, 'infoblockgroup.fields_create', 'web', '2022-08-26 09:09:29', '2022-08-26 09:09:29'),
(158, 'infoblockgroup.fields_store', 'web', '2022-08-26 09:09:37', '2022-08-26 09:09:37'),
(159, 'infoblockgroup.fields_edit', 'web', '2022-08-26 09:09:45', '2022-08-26 09:09:45'),
(160, 'infoblckgroup.fields_update', 'web', '2022-08-26 09:09:54', '2022-08-26 09:09:54'),
(161, 'infoblockgroup.fields_destroy', 'web', '2022-08-26 09:10:02', '2022-08-26 09:10:02'),
(162, 'infoblockdata.create', 'web', '2022-08-26 09:10:13', '2022-08-26 09:10:13'),
(163, 'infoblockdata.store', 'web', '2022-08-26 09:10:21', '2022-08-26 09:10:21'),
(164, 'infoblockdata.show', 'web', '2022-08-26 09:10:31', '2022-08-26 09:10:31'),
(165, 'infoblockdata.edit', 'web', '2022-08-26 09:10:38', '2022-08-26 09:10:38'),
(166, 'infoblockdata.update', 'web', '2022-08-26 09:10:49', '2022-08-26 09:10:49'),
(167, 'infoblockdata.destroy', 'web', '2022-08-26 09:10:57', '2022-08-26 09:10:57'),
(168, 'infoblocks.index', 'web', '2022-08-26 09:11:16', '2022-08-26 09:11:16'),
(169, 'sections.index', 'web', '2022-08-29 13:11:33', '2022-08-29 13:11:33'),
(170, 'sections.store', 'web', '2022-08-29 13:49:19', '2022-08-29 13:49:19'),
(171, 'sections.update', 'web', '2022-08-29 14:57:13', '2022-08-29 14:57:13'),
(172, 'sections.destroy', 'web', '2022-08-29 14:58:35', '2022-08-29 14:58:35'),
(174, 'sections.show', 'web', '2022-08-30 14:17:43', '2022-08-30 14:17:43'),
(175, 'settings.removeimage', 'web', '2022-09-01 08:31:26', '2022-09-01 08:31:26'),
(176, 'sections.create', 'web', '2022-09-01 13:25:16', '2022-09-01 13:25:16'),
(177, 'sections.edit', 'web', '2022-09-01 13:25:24', '2022-09-01 13:25:24'),
(178, 'settings.setup', 'web', '2022-09-05 07:03:46', '2022-09-05 07:03:46'),
(179, 'settings.generalcmsstore', 'web', '2022-09-05 09:35:52', '2022-09-05 09:35:52'),
(180, 'user.clearThrottle', 'web', '2022-09-05 13:24:12', '2022-09-05 13:24:12'),
(181, 'agents.index', 'web', '2022-09-06 07:51:45', '2022-09-06 07:51:45'),
(182, 'agents.create', 'web', '2022-09-06 07:51:51', '2022-09-06 07:51:51'),
(183, 'agents.store', 'web', '2022-09-06 07:51:58', '2022-09-06 07:51:58'),
(184, 'agents.edit', 'web', '2022-09-06 07:52:05', '2022-09-06 07:52:05'),
(185, 'agents.update', 'web', '2022-09-06 07:52:13', '2022-09-06 07:52:13'),
(186, 'agents.destroy', 'web', '2022-09-06 07:52:28', '2022-09-06 07:52:28'),
(187, 'agents.alldelete', 'web', '2022-09-06 07:52:50', '2022-09-06 07:52:50'),
(188, 'apis.index', 'web', '2022-09-06 09:45:04', '2022-09-06 09:45:04'),
(189, 'apis.create', 'web', '2022-09-06 09:45:14', '2022-09-06 09:45:14'),
(190, 'apis.store', 'web', '2022-09-06 09:45:25', '2022-09-06 09:45:25'),
(191, 'apis.edit', 'web', '2022-09-06 09:45:32', '2022-09-06 09:45:32'),
(192, 'apis.update', 'web', '2022-09-06 09:45:41', '2022-09-06 09:45:41'),
(193, 'apis.destroy', 'web', '2022-09-06 09:45:57', '2022-09-06 09:45:57'),
(194, 'apis.alldelete', 'web', '2022-09-06 09:46:05', '2022-09-06 09:46:05'),
(195, 'apis.getApiRoutes', 'web', '2022-09-06 10:56:21', '2022-09-06 10:56:21'),
(196, 'agents.show', 'web', '2022-09-06 12:13:27', '2022-09-06 12:13:27');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(5, 'App\\Models\\User', 15, 'LaravelSanctumAuth', 'b3bb0f4dbb502ca773715d117e5e8fa756de71324da7c9af747d2ab83187a47e', '[\"*\"]', '2022-08-10 12:22:09', '2022-08-10 05:13:45', '2022-08-10 12:22:09'),
(9, 'App\\Models\\User', 15, 'LaravelSanctumAuth', 'a4fa57698181d32f4dd4f1dd0e781791fc143c5812b169240d440926c9bd8ba0', '[\"*\"]', '2022-08-10 12:28:24', '2022-08-10 12:28:10', '2022-08-10 12:28:24'),
(11, 'App\\Models\\User', 8, 'LaravelSanctumAuth', 'b85f3bb97b134de1bb26bc591bcb84c48695acc56d9896574ca2da95daa53214', '[\"*\"]', '2022-08-10 12:47:51', '2022-08-10 12:29:29', '2022-08-10 12:47:51'),
(15, 'App\\Models\\User', 15, 'LaravelSanctumAuth', '25858b7c27fb567ccafaf95476ae1ff270fde6969b3199f6f69594db2d8b990e', '[\"*\"]', '2022-08-17 17:26:32', '2022-08-17 17:19:13', '2022-08-17 17:26:32'),
(19, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'cda4a2b3b344021be777b4245fc941774deee10b7d891a41b45fd6ad78286d8e', '[\"*\"]', '2022-08-17 17:30:29', '2022-08-17 17:27:35', '2022-08-17 17:30:29'),
(20, 'App\\Models\\User', 18, 'LaravelSanctumAuth', '3141882ec3da4ba63267db8eb471ea97f17e8320517480b52a6944211850a1bb', '[\"*\"]', NULL, '2022-08-17 17:36:09', '2022-08-17 17:36:09'),
(21, 'App\\Models\\User', 18, 'LaravelSanctumAuth', 'd822afd43f7cdf2b0f6573871149a749d9fb14170c6283faac5c268e63c7e11e', '[\"*\"]', NULL, '2022-08-17 17:36:56', '2022-08-17 17:36:56'),
(22, 'App\\Models\\User', 19, 'LaravelSanctumAuth', '250a30d1788d93d9164b47dfee7a3241aaa2905c942971ad6262135f2d53b6a6', '[\"*\"]', NULL, '2022-08-17 21:57:24', '2022-08-17 21:57:24'),
(23, 'App\\Models\\User', 20, 'LaravelSanctumAuth', '6c2d33279e0b562b31bbea2f8985b497a8ab4e66f808d29b283912584589aa2c', '[\"*\"]', NULL, '2022-08-17 22:30:28', '2022-08-17 22:30:28'),
(24, 'App\\Models\\User', 21, 'LaravelSanctumAuth', '9903001bb048414913dadeed1b5921652221d5d66c7a83bff2562869ef177fa2', '[\"*\"]', NULL, '2022-08-17 22:40:21', '2022-08-17 22:40:21'),
(25, 'App\\Models\\User', 22, 'LaravelSanctumAuth', 'd571d9152b32d84217992a79619e7bb33adff1f589309baacbe8e392c0b36299', '[\"*\"]', NULL, '2022-08-17 23:01:10', '2022-08-17 23:01:10'),
(26, 'App\\Models\\User', 23, 'LaravelSanctumAuth', '416613e220f3c456374265dfe6e9f9d27afcba0c0093ceffd2d74100b8cdc750', '[\"*\"]', NULL, '2022-08-17 23:13:07', '2022-08-17 23:13:07'),
(27, 'App\\Models\\User', 24, 'LaravelSanctumAuth', 'b98cd32cc6777d4075c7b724f14586390ef91e29654ccdf8c3446639e0b93bb8', '[\"*\"]', NULL, '2022-08-17 23:17:35', '2022-08-17 23:17:35'),
(28, 'App\\Models\\User', 25, 'LaravelSanctumAuth', 'd6d7dd58e8cb7851b7135152f4751bcac793884d69d653c1efd7858f3707817d', '[\"*\"]', NULL, '2022-08-17 23:19:05', '2022-08-17 23:19:05'),
(29, 'App\\Models\\User', 26, 'LaravelSanctumAuth', 'd79cf229f3789328d067fe70e78dbcc7ad8af3f5bf35031a6c8744208fe74436', '[\"*\"]', NULL, '2022-08-17 23:19:53', '2022-08-17 23:19:53'),
(30, 'App\\Models\\User', 27, 'LaravelSanctumAuth', '317400cb81cfc4d9d5504339885b42ce2c64f79aa0e17b172141646a2809b2b7', '[\"*\"]', NULL, '2022-08-18 14:53:45', '2022-08-18 14:53:45'),
(31, 'App\\Models\\User', 28, 'LaravelSanctumAuth', '69d691573c68a6b9382a556e6e8ab418ca8641b90c4cbd47af82722e6b13426d', '[\"*\"]', NULL, '2022-08-18 15:09:08', '2022-08-18 15:09:08'),
(32, 'App\\Models\\User', 29, 'LaravelSanctumAuth', 'fc2567a6b8fd3079f6a0dd4cbf071ce602170d1f798e36bc8e30bc72fc0f980f', '[\"*\"]', NULL, '2022-08-18 15:40:29', '2022-08-18 15:40:29'),
(33, 'App\\Models\\User', 30, 'LaravelSanctumAuth', '8a0fe437553c943fd516b9b5e443f84dead1298b496b3146ae6fb651cc47eacf', '[\"*\"]', NULL, '2022-08-18 15:45:46', '2022-08-18 15:45:46'),
(34, 'App\\Models\\User', 31, 'LaravelSanctumAuth', 'a8352c08524d6abd30f8b769c536bb16d6a86824ee14a0c059b30f9c544fd620', '[\"*\"]', NULL, '2022-08-18 15:46:05', '2022-08-18 15:46:05'),
(35, 'App\\Models\\User', 32, 'LaravelSanctumAuth', '5c7d9443193a622cb7b550389fcb5c7daf8a94624000690ef0efe7239127bbfd', '[\"*\"]', NULL, '2022-08-18 15:52:42', '2022-08-18 15:52:42'),
(36, 'App\\Models\\User', 33, 'LaravelSanctumAuth', 'a76bd9c4adf4e38f7dccc24a6a4cc2c67a89debb76ee1f7c4c7da0be437b0957', '[\"*\"]', NULL, '2022-08-18 15:52:45', '2022-08-18 15:52:45'),
(37, 'App\\Models\\User', 34, 'LaravelSanctumAuth', 'be813e1a0058549fc26051fddfd221ba430583d4d9ae38e904cf561484f4d9a4', '[\"*\"]', NULL, '2022-08-18 15:52:52', '2022-08-18 15:52:52'),
(38, 'App\\Models\\User', 35, 'LaravelSanctumAuth', 'f7301e337562c5a005627fa2833e58627ef8378f94e53111992f15e419ada65b', '[\"*\"]', NULL, '2022-08-18 15:52:56', '2022-08-18 15:52:56'),
(39, 'App\\Models\\User', 36, 'LaravelSanctumAuth', 'cc9ff7fba502c9e9e3de580fc5bde1420c0d32c933f395345990b3df6737bd9c', '[\"*\"]', NULL, '2022-08-18 15:53:00', '2022-08-18 15:53:00'),
(40, 'App\\Models\\User', 37, 'LaravelSanctumAuth', '16e228c7708cf98bf21c1fa3634f6a5e9594d32252e4d89feaa8d2cdf068d52a', '[\"*\"]', NULL, '2022-08-18 15:53:09', '2022-08-18 15:53:09'),
(41, 'App\\Models\\User', 38, 'LaravelSanctumAuth', '77417fa45290701fc25c285a64ec397241fa5a0fa3cc171ff9a65721beb7ea4c', '[\"*\"]', NULL, '2022-08-18 15:53:16', '2022-08-18 15:53:16'),
(42, 'App\\Models\\User', 39, 'LaravelSanctumAuth', '6a7f4ee667aa489c09ef5933140d48b3eb0fddedff86d679b892ea7468621520', '[\"*\"]', NULL, '2022-08-18 15:54:37', '2022-08-18 15:54:37'),
(43, 'App\\Models\\User', 40, 'LaravelSanctumAuth', '3a9ee441ff168ab4175be43035fbadba4f9cc0402bb74f48188f9c6dc3caee7f', '[\"*\"]', NULL, '2022-08-18 15:54:40', '2022-08-18 15:54:40'),
(44, 'App\\Models\\User', 41, 'LaravelSanctumAuth', '98c22319ed8f15fc170ee5aead113a031833650d79e114fdd015e5acfb1cc067', '[\"*\"]', NULL, '2022-08-18 15:54:49', '2022-08-18 15:54:49'),
(45, 'App\\Models\\User', 45, 'LaravelSanctumAuth', '4053821485363cb5b31865e6cd498f30d2a6c9e06dda61de6c53831ae6718cc7', '[\"*\"]', NULL, '2022-08-18 16:14:43', '2022-08-18 16:14:43'),
(46, 'App\\Models\\User', 47, 'LaravelSanctumAuth', '912e9e9b60c39885f0dd0891b61cc7c88385ede40cc2428718fd0016aa3b9678', '[\"*\"]', NULL, '2022-08-18 16:48:21', '2022-08-18 16:48:21'),
(47, 'App\\Models\\User', 18, 'LaravelSanctumAuth', '1d186326b522e1ede5a9b249478486572024cb672af5f83e93655f79d7af9ca5', '[\"*\"]', NULL, '2022-08-18 17:17:57', '2022-08-18 17:17:57'),
(48, 'App\\Models\\User', 48, 'LaravelSanctumAuth', 'ab053382876c7346c48dd17ac7d8fdee77a3c19a3c4e921347dcb8fc6cabeab9', '[\"*\"]', NULL, '2022-08-18 17:58:40', '2022-08-18 17:58:40'),
(49, 'App\\Models\\User', 49, 'LaravelSanctumAuth', '5afc3c736f29890468faf01c822ce9084e71d18fce742e4dc60259ac22f21737', '[\"*\"]', NULL, '2022-08-18 18:06:17', '2022-08-18 18:06:17'),
(50, 'App\\Models\\User', 49, 'LaravelSanctumAuth', 'b5b6b2a2076892810602383c370cd963eef617c21ca32fa23b65a2d8f15cef71', '[\"*\"]', NULL, '2022-08-18 18:06:42', '2022-08-18 18:06:42'),
(51, 'App\\Models\\User', 15, 'LaravelSanctumAuth', '9136e53cb61264392689d738155a1136491c764e6d289b77e49475ce978fe1ef', '[\"*\"]', '2022-08-18 22:45:04', '2022-08-18 18:25:27', '2022-08-18 22:45:04'),
(52, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'ff79e95c53e3b6c15691ab9aa24c8c378732f64866e7fcbf6c8841788841007c', '[\"*\"]', NULL, '2022-08-18 18:38:45', '2022-08-18 18:38:45'),
(53, 'App\\Models\\User', 50, 'LaravelSanctumAuth', '2950e60615d7b9572c8698ac595312b50f07b6d1272d3ee3a2ef9620c043f036', '[\"*\"]', NULL, '2022-08-18 20:25:13', '2022-08-18 20:25:13'),
(54, 'App\\Models\\User', 51, 'LaravelSanctumAuth', 'd25c4cc051c8406d911f62d62fced9d2fe9615cc2509b39444f285996aa9ccc4', '[\"*\"]', NULL, '2022-08-18 20:28:03', '2022-08-18 20:28:03'),
(55, 'App\\Models\\User', 52, 'LaravelSanctumAuth', '777ff9b8c316b27b8c70345c4d463dc0f6201a6e4a35ff94913bb5b34f589b59', '[\"*\"]', NULL, '2022-08-18 20:29:51', '2022-08-18 20:29:51'),
(56, 'App\\Models\\User', 53, 'LaravelSanctumAuth', '6846ea58db61edb2e42f61ba96d86d548d6e945ee0f7ef2a150c2f99aaaa52d9', '[\"*\"]', NULL, '2022-08-18 20:30:51', '2022-08-18 20:30:51'),
(57, 'App\\Models\\User', 54, 'LaravelSanctumAuth', '80edc2a7c0f4b1d9e6298ab0d033f82922f5e8fb28c96cd05f95b1afdb1eead8', '[\"*\"]', '2022-08-18 20:31:38', '2022-08-18 20:31:06', '2022-08-18 20:31:38'),
(58, 'App\\Models\\User', 55, 'LaravelSanctumAuth', 'aafc490e1cd74da2462f93f9115ebf7350f75e5cb3bfe07d10d3e07276f7ae0e', '[\"*\"]', NULL, '2022-08-18 20:33:08', '2022-08-18 20:33:08'),
(59, 'App\\Models\\User', 56, 'LaravelSanctumAuth', '686b55d0a81891c5e487017167b3c87fd70e7c36a9a82ab106b8041c60480428', '[\"*\"]', NULL, '2022-08-18 20:34:48', '2022-08-18 20:34:48'),
(60, 'App\\Models\\User', 57, 'LaravelSanctumAuth', 'd05982b69934902f8600c8701ed5bde01129e377e29eca26d9c6e9c8f9cc9557', '[\"*\"]', NULL, '2022-08-18 20:45:53', '2022-08-18 20:45:53'),
(61, 'App\\Models\\User', 57, 'LaravelSanctumAuth', 'b3fa0110a5b6d4d977b573a10bb00deb6ffd582ecb7728baaae45d2307049bcb', '[\"*\"]', NULL, '2022-08-18 20:46:10', '2022-08-18 20:46:10'),
(62, 'App\\Models\\User', 15, 'LaravelSanctumAuth', '4e56613285f73229d48adde08540720741b5706287fe6dc1629951ed6517addc', '[\"*\"]', NULL, '2022-08-18 20:53:22', '2022-08-18 20:53:22'),
(63, 'App\\Models\\User', 57, 'LaravelSanctumAuth', '3d9a8949118ed98dcd24681ba80c1aec93e7b6577da7bd8f5c22cc392d22b654', '[\"*\"]', NULL, '2022-08-18 21:10:16', '2022-08-18 21:10:16'),
(64, 'App\\Models\\User', 57, 'LaravelSanctumAuth', 'c2c11c893146e200e2007be703f5b159333f33f8e6b284521db82373ec22b5e4', '[\"*\"]', NULL, '2022-08-18 21:13:43', '2022-08-18 21:13:43'),
(65, 'App\\Models\\User', 57, 'LaravelSanctumAuth', '3cfde946c466df55ed8dffcef62c511fa619ada3c1faed37dfb3cbb10a5dfc04', '[\"*\"]', NULL, '2022-08-18 21:13:56', '2022-08-18 21:13:56'),
(66, 'App\\Models\\User', 57, 'LaravelSanctumAuth', '1db74925289f35e957d9f60c6570a262c456de3571bec6dbb97ff30e0e3a39db', '[\"*\"]', NULL, '2022-08-18 21:13:57', '2022-08-18 21:13:57'),
(67, 'App\\Models\\User', 57, 'LaravelSanctumAuth', '193d5dfd140764ca10d0bf2fb5fbbd08e8c5913e63f170473157c786f71864e3', '[\"*\"]', NULL, '2022-08-18 21:14:22', '2022-08-18 21:14:22'),
(68, 'App\\Models\\User', 57, 'LaravelSanctumAuth', '0687111247aa3faa284626192836b21f148da4de87f54753ffbdf414a7e36804', '[\"*\"]', NULL, '2022-08-18 21:58:09', '2022-08-18 21:58:09'),
(69, 'App\\Models\\User', 57, 'LaravelSanctumAuth', '19377764ee89f76e89c45b136ac7f333a380539d6cbeb5fdc6ffe3aa1bab63e9', '[\"*\"]', NULL, '2022-08-18 21:58:49', '2022-08-18 21:58:49'),
(70, 'App\\Models\\User', 57, 'LaravelSanctumAuth', 'dcbef812f40b51a7e416d1f6aa3442daf736c6ea8a782ab1d92498e200bbcd4a', '[\"*\"]', NULL, '2022-08-18 22:00:42', '2022-08-18 22:00:42'),
(71, 'App\\Models\\User', 57, 'LaravelSanctumAuth', '26f0b7be4865784dd98be7aefec7b798709b82212c2db91a71e4be94fd83ad5c', '[\"*\"]', '2022-08-18 22:01:55', '2022-08-18 22:01:36', '2022-08-18 22:01:55'),
(72, 'App\\Models\\User', 57, 'LaravelSanctumAuth', '060c541aa9a4cd367da4457531a72a98248b4a420ea354fa69e3d57f2fef796a', '[\"*\"]', NULL, '2022-08-18 22:12:42', '2022-08-18 22:12:42'),
(73, 'App\\Models\\User', 57, 'LaravelSanctumAuth', '095f8015b1a96bd3ad02c8842630d4718eac227cf4cae5e59eadc5d29f355db6', '[\"*\"]', NULL, '2022-08-18 22:13:43', '2022-08-18 22:13:43'),
(74, 'App\\Models\\User', 57, 'LaravelSanctumAuth', 'ad4c804b2f25934f7b3b9e66dbded22b6933d553a3b25656924714826bde0db4', '[\"*\"]', '2022-08-18 22:14:27', '2022-08-18 22:14:26', '2022-08-18 22:14:27'),
(75, 'App\\Models\\User', 57, 'LaravelSanctumAuth', '0ba9bce0b07a879a661267ee92aaa2b86df7a70fd58357ebb3ce8b5d7d6e5604', '[\"*\"]', NULL, '2022-08-18 22:38:29', '2022-08-18 22:38:29'),
(76, 'App\\Models\\User', 57, 'LaravelSanctumAuth', '6e56662bd30374ec4ea56b1ba7708ff56710985fe952abe691388a1dd0cc7cec', '[\"*\"]', NULL, '2022-08-18 22:40:30', '2022-08-18 22:40:30'),
(77, 'App\\Models\\User', 57, 'LaravelSanctumAuth', '64b3500d108aaf13a2e5c8a537977a211fe85e934ce13ea70e431039bad8b73a', '[\"*\"]', NULL, '2022-08-18 22:41:12', '2022-08-18 22:41:12'),
(78, 'App\\Models\\User', 57, 'LaravelSanctumAuth', '0116e4b5b02380ae736500f99e413ae4277aa01de09475f44c7f47eb8f0bfd4f', '[\"*\"]', '2022-08-18 22:41:57', '2022-08-18 22:41:56', '2022-08-18 22:41:57'),
(79, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '57edbac56f5b0663101f32008ccdd0bf10290c999903f9ea8c268a811e659b24', '[\"*\"]', NULL, '2022-08-18 22:44:35', '2022-08-18 22:44:35'),
(80, 'App\\Models\\User', 57, 'LaravelSanctumAuth', 'cd184f77e606cb94d01345fb20e981e9cdb1e4e2a98a11c30e8d6581a8d4c53a', '[\"*\"]', NULL, '2022-08-18 22:52:48', '2022-08-18 22:52:48'),
(81, 'App\\Models\\User', 57, 'LaravelSanctumAuth', '838159c9a473079c7c796ef23bd5049514e76c8a7ec8c29a2a88f37d51f17716', '[\"*\"]', NULL, '2022-08-18 22:53:17', '2022-08-18 22:53:17'),
(82, 'App\\Models\\User', 57, 'LaravelSanctumAuth', 'c4acac93967adec50103f011a81cf903e1162a03f30253646d7fe5623b7b2c9e', '[\"*\"]', '2022-08-18 22:56:41', '2022-08-18 22:56:40', '2022-08-18 22:56:41'),
(83, 'App\\Models\\User', 57, 'LaravelSanctumAuth', 'a2ba11d6dbd9c865a8b5a22b4a90f297f4eeb53fad434eb2b3f0838ee5c847cd', '[\"*\"]', NULL, '2022-08-18 23:01:29', '2022-08-18 23:01:29'),
(84, 'App\\Models\\User', 58, 'LaravelSanctumAuth', '5b38739d0742a785198bdb8d142173fb02ba744f9d04902902aad3dbbe90abde', '[\"*\"]', NULL, '2022-08-19 16:03:44', '2022-08-19 16:03:44'),
(85, 'App\\Models\\User', 58, 'LaravelSanctumAuth', 'e7c5cda52f7373faba43a4822b3af341b982fe726aa12e4e49bac32eff9b682e', '[\"*\"]', '2022-08-19 16:04:05', '2022-08-19 16:04:04', '2022-08-19 16:04:05'),
(86, 'App\\Models\\User', 8, 'LaravelSanctumAuth', '956aba11c0f85c6c74912cd32703d467a68bd8117d25f0e221a5c7779476caac', '[\"*\"]', NULL, '2022-08-19 17:16:50', '2022-08-19 17:16:50'),
(87, 'App\\Models\\User', 15, 'LaravelSanctumAuth', 'd324940a5895cc6cd90876aef85127f2f199d2e9b1ce47f364c29f6d9d679896', '[\"*\"]', NULL, '2022-08-19 17:17:24', '2022-08-19 17:17:24'),
(88, 'App\\Models\\User', 15, 'LaravelSanctumAuth', '762cad371c8da916db1e2be9b3ea435cf7fabd6926be8ca03e4451da07d31cd5', '[\"*\"]', '2022-08-19 21:28:43', '2022-08-19 17:40:12', '2022-08-19 21:28:43'),
(89, 'App\\Models\\User', 15, 'LaravelSanctumAuth', '9fa8279343a08db168c775487bdfe3adfb4f582a3fd3b170667480dbc815839a', '[\"*\"]', NULL, '2022-08-19 20:47:18', '2022-08-19 20:47:18'),
(90, 'App\\Models\\User', 57, 'LaravelSanctumAuth', 'c71ff34b5e3fa46690e63310a36a3ef9d49fc71f21697e74b54198ff48b7a66e', '[\"*\"]', '2022-08-19 21:51:31', '2022-08-19 21:40:04', '2022-08-19 21:51:31'),
(91, 'App\\Models\\User', 62, 'LaravelSanctumAuth', '106035bb516facf5e3020cd39a5064465422668e8bcc6a17f9022238bffe89b4', '[\"*\"]', NULL, '2022-08-22 15:17:15', '2022-08-22 15:17:15'),
(92, 'App\\Models\\User', 63, 'LaravelSanctumAuth', 'ff09e7264383d4afbb30fc0742a437163e4d06ea1d1cbdf4f098c3c0484ed8c8', '[\"*\"]', NULL, '2022-08-22 15:18:42', '2022-08-22 15:18:42'),
(93, 'App\\Models\\User', 64, 'LaravelSanctumAuth', '3a9ef3a0d3171fe83dc6a5bbd64796f4cbd918aa121fa6b96ae3b5ce77def840', '[\"*\"]', NULL, '2022-08-22 15:21:15', '2022-08-22 15:21:15'),
(94, 'App\\Models\\User', 65, 'LaravelSanctumAuth', '96c99a9d9a2aebecdea4255f32a0c82984b2db025a33cb8b99fd3fb4c34864e1', '[\"*\"]', NULL, '2022-08-22 15:23:09', '2022-08-22 15:23:09'),
(95, 'App\\Models\\User', 66, 'LaravelSanctumAuth', '21e1deca618d0d0378b4e6c3d0c471ac84fcef997810004536842483d7c952a1', '[\"*\"]', NULL, '2022-08-22 15:30:13', '2022-08-22 15:30:13'),
(96, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '7af49c1187d06534cde73b2110ea29771bbebea1dd7308683d9f8919aab76037', '[\"*\"]', NULL, '2022-08-22 18:17:28', '2022-08-22 18:17:28'),
(97, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '50a42906ca7e26b64e99f7637e8bca68472d47e0e6778d206597869983bbe303', '[\"*\"]', NULL, '2022-08-22 11:31:23', '2022-08-22 11:31:23'),
(98, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'b77b7359fc170580a99e04199fde21c26021d3005706669ea3b44248da39d3c7', '[\"*\"]', NULL, '2022-08-22 12:04:35', '2022-08-22 12:04:35'),
(99, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '07e21864c5c39ef968d6d9e3245d2f0130ee4d78d928edf5f4b38ec739656946', '[\"*\"]', NULL, '2022-08-23 04:25:48', '2022-08-23 04:25:48'),
(100, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '8e6820e7280514e3bcb0722acc43b447076f77267f58ef83d8c06489108f48c4', '[\"*\"]', NULL, '2022-08-24 07:15:29', '2022-08-24 07:15:29'),
(101, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '137c1994954f3407c02aaea4c4a47f0385df744fd713b39ae72c72afd753edb0', '[\"*\"]', NULL, '2022-08-24 09:34:43', '2022-08-24 09:34:43'),
(102, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'b4bbd52172d9222c6509daa2c1a5b30daac3a773d9e362c7f488d70995d0de82', '[\"*\"]', NULL, '2022-08-24 09:35:47', '2022-08-24 09:35:47'),
(103, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'e87d0e8d4e3719b2c89880231278a122784dd326381b099ec2e242cd4925a54c', '[\"*\"]', NULL, '2022-08-24 10:23:15', '2022-08-24 10:23:15'),
(104, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'f8f7a2d2284da4835dc948eee65f6e7dd4888f697c1c76d6c35c2d553a55dfb9', '[\"*\"]', NULL, '2022-08-24 11:35:15', '2022-08-24 11:35:15'),
(105, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'df6e9558092601d4846f24bec7bfb92c64b02503d1df16ea4747d01ef6c4a4bd', '[\"*\"]', NULL, '2022-08-24 14:22:53', '2022-08-24 14:22:53'),
(106, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '4485962dc5ac4473002ea5422c5f014e0580a463128d51c56eaa1fcbb23c6c6f', '[\"*\"]', NULL, '2022-08-24 14:41:03', '2022-08-24 14:41:03'),
(107, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '0e314d2761450317e9137ce6de53d27fd1a61c8eeae8cc3d66dd00b5aaeacc31', '[\"*\"]', NULL, '2022-08-24 14:41:05', '2022-08-24 14:41:05'),
(108, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '94ac0d00b87d028a28d59ea6f7761d37ea69b2458467453f1ceea4e8ff9f2550', '[\"*\"]', NULL, '2022-08-24 16:36:51', '2022-08-24 16:36:51'),
(109, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '345d123209f0c8ad2b4b0d39c8e86040c0bf9705cd71f0698411e0acb48f8b09', '[\"*\"]', NULL, '2022-08-25 05:39:22', '2022-08-25 05:39:22'),
(110, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '4ee7308ea3d3415c704f3e99075877581510bfe685396a65051f327194e29a6b', '[\"*\"]', NULL, '2022-08-25 06:55:37', '2022-08-25 06:55:37'),
(111, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'fc0636363530b6c695e1d4735980ca905a6dac698c29475892f8b9cef45fcccc', '[\"*\"]', NULL, '2022-08-25 09:16:32', '2022-08-25 09:16:32'),
(112, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '1d641090b6d1d2e68bb8f89c2fe613119cb5b72070e3e8a52535ec87c176b115', '[\"*\"]', NULL, '2022-08-25 09:28:28', '2022-08-25 09:28:28'),
(113, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '2acd7eee7b5f69d0b2ec993e68b7ed9f3529a779bc6fe1ebc48a6c3175272625', '[\"*\"]', NULL, '2022-08-25 10:12:21', '2022-08-25 10:12:21'),
(114, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'a496b71d5e4e67df9b9a49464f0f13e1e313f1b50c582d524e1450c7795e19ed', '[\"*\"]', NULL, '2022-08-25 11:07:27', '2022-08-25 11:07:27'),
(115, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '07a6f6a2aa8877912c4a21828a79e4c2c806fe3b9670409823b1e9954b3812d5', '[\"*\"]', NULL, '2022-08-25 11:07:30', '2022-08-25 11:07:30'),
(116, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'aa49046ba80fdce4f4c642996f521fd69bc6244964e7bc3479d5aa41f1e86abb', '[\"*\"]', NULL, '2022-08-25 14:47:32', '2022-08-25 14:47:32'),
(117, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'daf53d25362666760e8d9bfc144ace59ee69152937a12d294fbbfaad2d4476d0', '[\"*\"]', NULL, '2022-08-25 16:39:07', '2022-08-25 16:39:07'),
(118, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '855da54ae243bd8ca66c964a14b9c6b0cd71e98e21276742e4205400ae07a8de', '[\"*\"]', NULL, '2022-08-26 06:53:52', '2022-08-26 06:53:52'),
(119, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '7616fa7dbecdff27e6a66a54b83fc772ba5d12b7b1c8ac6b278d419769c5a369', '[\"*\"]', NULL, '2022-08-26 07:36:45', '2022-08-26 07:36:45'),
(120, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '0db77db14e6cfa83fea92c5df1d1c95c8a19011066c2cebbf9583863f48edd85', '[\"*\"]', NULL, '2022-08-26 07:47:15', '2022-08-26 07:47:15'),
(121, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '81ca7a494a72ba8507bcf59265baf7eb7c3f6f7145de1aad12e8569faab5e72f', '[\"*\"]', NULL, '2022-08-26 08:08:22', '2022-08-26 08:08:22'),
(122, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '4ab47e4f1b6e2edcf4c0449ba9b7bc2b0d88f70d99c2156fb078905597fbb527', '[\"*\"]', NULL, '2022-08-26 08:08:31', '2022-08-26 08:08:31'),
(123, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'e8fc0954d30be7aba72e2acb6395a5e6ffb100ebe046a0ebedc5e0f776e917ef', '[\"*\"]', NULL, '2022-08-26 08:31:30', '2022-08-26 08:31:30'),
(124, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'd194346610ebd9994c4ebca9b166cfe547d0d1d072430e00d909284e14826874', '[\"*\"]', NULL, '2022-08-26 08:31:45', '2022-08-26 08:31:45'),
(125, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '3b0bd20cc1f16fd24fff3c4805c24624fcd45fd685c92032e907ab2e17da2047', '[\"*\"]', NULL, '2022-08-26 08:31:57', '2022-08-26 08:31:57'),
(126, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '0e04ad862a46e5e82c2138fe41422ec2e4f23940493c255ff295945ad046eae9', '[\"*\"]', NULL, '2022-08-26 10:58:06', '2022-08-26 10:58:06'),
(127, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '4fafa1c6386a33d29b7ec013a5df14a88e234dffa8a532ee54d25eb709708c76', '[\"*\"]', NULL, '2022-08-26 18:49:24', '2022-08-26 18:49:24'),
(128, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '935a998ba5a7b90f0119cbcf80a2870e3ce8662e8876a6239cc96f4a931b6d22', '[\"*\"]', NULL, '2022-08-29 08:09:36', '2022-08-29 08:09:36'),
(129, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '6ec750ed1c853c578c1eb50c43459e9a5f4ce56be5df4d7c44d36e09deb1a10a', '[\"*\"]', NULL, '2022-08-29 09:50:40', '2022-08-29 09:50:40'),
(130, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'd7d5a40fe2af8259f0790241df867e64ab292e8ce0579c7eb6cf1de92e248074', '[\"*\"]', NULL, '2022-08-29 14:03:55', '2022-08-29 14:03:55'),
(131, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'a0c04d92162fc3ebf0eb9f845eab3a34ab7643570af4abb872e3a9fec15a541c', '[\"*\"]', NULL, '2022-08-29 15:19:58', '2022-08-29 15:19:58'),
(132, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '6a257aa7b696e8a73bd55c5337a0372ae0a7e2ef9c63e1b24ceb95d274007643', '[\"*\"]', NULL, '2022-08-29 19:35:06', '2022-08-29 19:35:06'),
(133, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '5e59e53a4e1d5f1404ba0c8848ef6773969f153a092641724cb44692e88ca92c', '[\"*\"]', NULL, '2022-08-30 07:07:30', '2022-08-30 07:07:30'),
(134, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'a0979c46a958135840221f73eb6fb9c97c227e65d450ba454f85264ce226149d', '[\"*\"]', NULL, '2022-08-30 18:50:01', '2022-08-30 18:50:01'),
(135, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '06ad4cd2a8f0958007cc9d0cf2c850c736a0c13d9e2af5aaaf0c494fc6146ff7', '[\"*\"]', NULL, '2022-08-31 06:46:26', '2022-08-31 06:46:26'),
(136, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '77240f032dc1017264869d0efb62462db14085f601942cbd9f20e5e5464d56bb', '[\"*\"]', NULL, '2022-08-31 07:23:04', '2022-08-31 07:23:04'),
(137, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'fc00294f72fa0232fcbbc11869931f97303bf8363c2250accd1403af2aa09126', '[\"*\"]', NULL, '2022-08-31 21:09:47', '2022-08-31 21:09:47'),
(138, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '32c83d61626fff7354bbfa9de8b3ed1d0b5ee04d510b134c3465f6ad73329d87', '[\"*\"]', NULL, '2022-09-01 06:40:25', '2022-09-01 06:40:25'),
(139, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '29996a269fad515399edc1f787848f23fce8011eb782bb52d46305d4d65a5fe8', '[\"*\"]', NULL, '2022-09-01 08:18:08', '2022-09-01 08:18:08'),
(140, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '607111b996cf15ddedf46db074ead41ca076a628d7ad81edecbf9ceba8daf162', '[\"*\"]', NULL, '2022-09-01 08:19:09', '2022-09-01 08:19:09'),
(141, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'cb447bc096dba9cac33f5ea53b207338b6cdee871b6a7f0ccc1a495de3d22b45', '[\"*\"]', NULL, '2022-09-01 08:21:21', '2022-09-01 08:21:21'),
(142, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'dde7016f1a954e8ab595e6c19984a94e9b4ba195b60a4bc4248caf830733a325', '[\"*\"]', NULL, '2022-09-01 09:45:17', '2022-09-01 09:45:17'),
(143, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '774593ca17a9cded61811da72ca07740a87ed6f30cf6116aa1aeb789ccd7efff', '[\"*\"]', NULL, '2022-09-01 11:54:32', '2022-09-01 11:54:32'),
(144, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'c87f6616e64fc3f5546c62429096251f13b9f031469e07dcbf08dad67ac1d3c9', '[\"*\"]', NULL, '2022-09-01 12:56:36', '2022-09-01 12:56:36'),
(145, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'e760494dce99a718e094aa65c05ec4e58722f3812d02f0ac475d1962e8b0d11b', '[\"*\"]', NULL, '2022-09-01 13:05:00', '2022-09-01 13:05:00'),
(146, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'baab949edac496f9a28664f317a4ad46bae011844039f7c3ff0b2c1b8e0bccb8', '[\"*\"]', NULL, '2022-09-01 19:30:25', '2022-09-01 19:30:25'),
(147, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '99618c0f2dfae980b3a5a1df63e05234fd44e44932020b50e59effdb18500ac2', '[\"*\"]', NULL, '2022-09-02 06:43:15', '2022-09-02 06:43:15'),
(148, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'e01d18cfa9bde7c7b5384c1d3adcd949481e167da3421d366d8329c295066eb2', '[\"*\"]', NULL, '2022-09-02 07:01:19', '2022-09-02 07:01:19'),
(149, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '0706d6c29c93ed61fd8d80010373874ba29d8c25c18e34a18da3b7e181bcbb21', '[\"*\"]', NULL, '2022-09-02 07:47:46', '2022-09-02 07:47:46'),
(150, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '51896830057f8d153eb7acc1e19d7b497404924ed3828b8325eb4e684d1ec673', '[\"*\"]', NULL, '2022-09-02 11:15:45', '2022-09-02 11:15:45'),
(151, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '397766f4073cb7f1ee446f96628087bf60c5307594af7bf14df2ed77561b7a01', '[\"*\"]', NULL, '2022-09-02 11:24:36', '2022-09-02 11:24:36'),
(152, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'b7c1eddda7aa001e8c8d6b640e2659c4a5ee54e5ec5e972a8a4f15db7868acde', '[\"*\"]', NULL, '2022-09-02 12:13:51', '2022-09-02 12:13:51'),
(153, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '4a6cfdb15a0167ea27e3bd2b8ebd81f73eea6464715978c7012f416457b1bd5d', '[\"*\"]', NULL, '2022-09-02 12:57:44', '2022-09-02 12:57:44'),
(154, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '77829f2194758dc5656e3f1a92638dc8b45730f7b13064dd719690594a4cf5cf', '[\"*\"]', NULL, '2022-09-02 17:26:26', '2022-09-02 17:26:26'),
(155, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'db5b4b3ab245427467cc4dd26af7f4fa58235b86b347ab55df812b1b8e7f1bfa', '[\"*\"]', NULL, '2022-09-03 16:51:05', '2022-09-03 16:51:05'),
(156, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'c18f6170f1f18a236bafe48a9b08e2a17020567d917bbe5aa11c0779077019a6', '[\"*\"]', NULL, '2022-09-04 06:03:22', '2022-09-04 06:03:22'),
(157, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '2393879a6bfa0b817e268970baa9cabba67771ebf72c854ed10087c2eef2d9af', '[\"*\"]', NULL, '2022-09-04 09:58:53', '2022-09-04 09:58:53'),
(158, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '8d1c46da0f6d6a806c217e3a68a39ed3080109c95f6b7dc0f1f0e0a42de4c937', '[\"*\"]', NULL, '2022-09-05 06:36:09', '2022-09-05 06:36:09'),
(159, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '9ed4899d4af03c3f95452f6054b6ba1b9a26a529c4f058b294b008632d0f6f19', '[\"*\"]', NULL, '2022-09-05 08:34:48', '2022-09-05 08:34:48'),
(160, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '6407b06e1a589ebf6103fa4c05b2f16942e6427225ac84c0e220ff6bdcefe9c1', '[\"*\"]', NULL, '2022-09-05 10:38:00', '2022-09-05 10:38:00'),
(161, 'App\\Models\\User', 2, 'LaravelSanctumAuth', '54d80eb0ac08bb9daad8308f43383726494b7bd41bfd0f087528202788539768', '[\"*\"]', NULL, '2022-09-05 13:08:24', '2022-09-05 13:08:24'),
(162, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '211182e52cee32cc40fd0927c785edce4518699bd9babd077e82fb8f2105eaf4', '[\"*\"]', NULL, '2022-09-05 15:53:14', '2022-09-05 15:53:14'),
(163, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'd91bfe9065043a92ec1ae1cc3d7c1d2cab1522503360cc0ea3689e39ae87b721', '[\"*\"]', NULL, '2022-09-06 06:48:58', '2022-09-06 06:48:58'),
(164, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'adca0cd5e38eec8d09ee6e8785c8fb01948bbfeef026d8f3dba497a1d7b6649d', '[\"*\"]', NULL, '2022-09-06 07:03:39', '2022-09-06 07:03:39'),
(165, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '6a7bad14b1817ca1df7ea12adb1e963b151193bd38365c4e3afd8b4de2f0e370', '[\"*\"]', NULL, '2022-09-06 08:36:46', '2022-09-06 08:36:46'),
(166, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '8d42fed18ee403aee8e40c467f84c9c946e79b8dd204a3e1c03d91640b4651f1', '[\"*\"]', NULL, '2022-09-06 15:14:11', '2022-09-06 15:14:11'),
(167, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'e3bd85d49838555c5bcbfc61594c93179d8febd3656560af9a3d5c5620841448', '[\"*\"]', NULL, '2022-09-06 17:44:56', '2022-09-06 17:44:56'),
(168, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '073c8506c90ea61ffbafc11278365daaf25a36abaf58b6f164588f9d46e83b4a', '[\"*\"]', NULL, '2022-09-07 06:46:02', '2022-09-07 06:46:02'),
(169, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '7695f4cb1b7460adcf2fc6d890772d894de9ca69de822a4840a3fae1ea9d10a1', '[\"*\"]', NULL, '2022-09-07 09:05:38', '2022-09-07 09:05:38'),
(170, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'f613b877f063d4f9ff42af4385ca8ceaf36eab59e5a65f456a25d980f436df88', '[\"*\"]', NULL, '2022-09-07 10:20:17', '2022-09-07 10:20:17'),
(171, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '362146c617b37c2c2193dea1186f031776f4bc56abf31d9294a230d32363d098', '[\"*\"]', NULL, '2022-09-07 12:29:36', '2022-09-07 12:29:36'),
(172, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'c842fdedf4d5b331ae3793d678621f1af75170b278812434bf52ee254d27f97d', '[\"*\"]', NULL, '2022-09-07 16:51:49', '2022-09-07 16:51:49'),
(173, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '3d0a809a4c98e86a151424b6e3248bb41276ebcbdf12fb729e96b5531beb8f76', '[\"*\"]', NULL, '2022-09-07 17:42:14', '2022-09-07 17:42:14'),
(174, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '3210df4e468072e244a400952e4ce703d1b75557ee97beae5fbb3b9c3e8a063e', '[\"*\"]', NULL, '2022-09-08 06:00:00', '2022-09-08 06:00:00'),
(175, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '1d8dbae14d72ec39eb48b1ee261b2a636e5e4df4fb802e378c675b53bea954a2', '[\"*\"]', NULL, '2022-09-08 06:49:34', '2022-09-08 06:49:34'),
(176, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'da0f75a69d553c529ade0342b17c021bec5adac815f17da40b61c1b41c837ac8', '[\"*\"]', NULL, '2022-09-08 08:49:52', '2022-09-08 08:49:52'),
(177, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '05a4ff665ad008ed09be09973d344720267974100762fb50d183f058c6fff5e0', '[\"*\"]', NULL, '2022-09-08 14:49:39', '2022-09-08 14:49:39'),
(178, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'dd1fb419b206f4ec9747a12e7c715f428a38a62914c38b6e1b1c7f787bd5275a', '[\"*\"]', NULL, '2022-09-08 16:16:02', '2022-09-08 16:16:02'),
(179, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '274d4c7b393f5f2845900bc12e60529a9c8ed1df3a4cc168ed5e9d281dd57ee5', '[\"*\"]', NULL, '2022-09-08 20:00:17', '2022-09-08 20:00:17'),
(180, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'f2431476c1da1f0affef646f5789d8241ab8de377102d0cd19489f0a94f927d2', '[\"*\"]', NULL, '2022-09-09 06:50:30', '2022-09-09 06:50:30'),
(181, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'f508055ed65fc23af5f102ae1e08e6b5cd8e20cb1327a74d542bd9aa444dc9c6', '[\"*\"]', NULL, '2022-09-09 06:56:21', '2022-09-09 06:56:21'),
(182, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '2d061d257f57947fc90a5351b850a02aba032344712d618adc212bb5390d95ec', '[\"*\"]', NULL, '2022-09-09 09:50:12', '2022-09-09 09:50:12'),
(183, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '02e221aa8e7d46e4e5402a1deffc295e4495860a26d08fbd0e491da775e21a8a', '[\"*\"]', NULL, '2022-09-09 11:04:36', '2022-09-09 11:04:36'),
(184, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '377c8a87dbdc9f6220904a43dc91dba2c9c712264173b6f9f790d33ba7e5fd2d', '[\"*\"]', NULL, '2022-09-09 11:09:17', '2022-09-09 11:09:17'),
(185, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '033dd7534ffb2cf82f773d5c48cfbfb53c9e459fe8b6f38c5c7b7f755f5d4fb0', '[\"*\"]', NULL, '2022-09-09 11:37:44', '2022-09-09 11:37:44'),
(186, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'fc9f60c1931c0326abb7acbf783cfa261bfefd9ae3589e7eb604e036dff87eef', '[\"*\"]', NULL, '2022-09-10 20:46:53', '2022-09-10 20:46:53'),
(187, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '156cbccb19e31042f461f473faec15fdcc80ef1e31fc69a3d6687208388f234e', '[\"*\"]', NULL, '2022-09-12 06:03:14', '2022-09-12 06:03:14'),
(188, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '2a2212618ec035503867b7ab6f2f5c6a0a2dd046680101797656b74496c4612f', '[\"*\"]', NULL, '2022-09-12 06:53:51', '2022-09-12 06:53:51'),
(189, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '2db18868d75473c87b2bc4f8a6e43c242b738fe3941b31d732d9c1bd2984922c', '[\"*\"]', NULL, '2022-09-13 08:30:28', '2022-09-13 08:30:28'),
(190, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '2cec343949f5ad3b1eb20a4527720ed599af6dd6258af64a0c920b76bbdc07b1', '[\"*\"]', NULL, '2022-09-13 09:08:17', '2022-09-13 09:08:17'),
(191, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '5f061ba7f267ad741182f49d9f37991e7827f811258d61ad6eff592f8c530368', '[\"*\"]', NULL, '2022-09-13 10:53:42', '2022-09-13 10:53:42'),
(192, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '57a52e8a055e4d18b72f5efd47f877e36b6a00e8e2ed183d9d51b384abe7467a', '[\"*\"]', NULL, '2022-09-14 04:17:33', '2022-09-14 04:17:33'),
(193, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'b3558a2a4644e2e7e923b576d91a5a184bc7f5f271db40f3360a6b0c4bd62fed', '[\"*\"]', NULL, '2022-09-15 04:37:14', '2022-09-15 04:37:14'),
(194, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '410eec5923778c12a618c459178258f2a75e766781ad6d7287ff902cb00cc5c0', '[\"*\"]', NULL, '2022-09-16 04:30:30', '2022-09-16 04:30:30');

-- --------------------------------------------------------

--
-- Table structure for table `reset_code_passwords`
--

CREATE TABLE `reset_code_passwords` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reset_code_passwords`
--

INSERT INTO `reset_code_passwords` (`id`, `email`, `code`, `created_at`, `updated_at`) VALUES
(3, 'sunita@gmail.com', '269586', '2022-07-18 05:40:38', '2022-07-18 05:40:38');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bgcolor` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `bgcolor`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '#135BAA', '2022-06-23 04:09:09', '2022-08-09 07:01:58'),
(2, 'Super-Admin', 'web', '#C20505', '2022-06-23 04:43:17', '2022-08-23 09:59:24'),
(6, 'User', 'web', '#C20505', '2022-08-24 10:05:59', '2022-08-24 10:40:03');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 6),
(2, 6),
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(30, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(77, 1),
(78, 1),
(83, 1),
(84, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(108, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(175, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 2),
(64, 2),
(65, 2),
(66, 2),
(67, 2),
(68, 2),
(69, 2),
(70, 2),
(71, 2),
(72, 2),
(73, 2),
(74, 2),
(75, 2),
(76, 2),
(77, 2),
(78, 2),
(79, 2),
(80, 2),
(81, 2),
(82, 2),
(83, 2),
(84, 2),
(85, 2),
(86, 2),
(87, 2),
(88, 2),
(89, 2),
(90, 2),
(91, 2),
(92, 2),
(93, 2),
(94, 2),
(95, 2),
(96, 2),
(97, 2),
(98, 2),
(99, 2),
(100, 2),
(101, 2),
(102, 2),
(103, 2),
(104, 2),
(105, 2),
(106, 2),
(108, 2),
(110, 2),
(111, 2),
(112, 2),
(113, 2),
(114, 2),
(115, 2),
(116, 2),
(117, 2),
(118, 2),
(119, 2),
(120, 2),
(121, 2),
(122, 2),
(123, 2),
(124, 2),
(125, 2),
(126, 2),
(127, 2),
(128, 2),
(129, 2),
(130, 2),
(131, 2),
(132, 2),
(133, 2),
(134, 2),
(135, 2),
(136, 2),
(137, 2),
(138, 2),
(139, 2),
(140, 2),
(141, 2),
(142, 2),
(143, 2),
(144, 2),
(145, 2),
(146, 2),
(147, 2),
(148, 2),
(149, 2),
(150, 2),
(151, 2),
(152, 2),
(153, 2),
(154, 2),
(155, 2),
(156, 2),
(157, 2),
(158, 2),
(159, 2),
(160, 2),
(161, 2),
(162, 2),
(163, 2),
(164, 2),
(165, 2),
(166, 2),
(167, 2),
(168, 2),
(169, 2),
(170, 2),
(171, 2),
(172, 2),
(174, 2),
(175, 2),
(176, 2),
(177, 2),
(178, 2),
(179, 2),
(180, 2),
(181, 2),
(182, 2),
(183, 2),
(184, 2),
(185, 2),
(186, 2),
(187, 2),
(188, 2),
(189, 2),
(190, 2),
(191, 2),
(192, 2),
(193, 2),
(194, 2),
(195, 2),
(196, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `parent_section` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `template_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `charset` longtext DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `keywords` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `section_path` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `scripts` longtext DEFAULT NULL,
  `toolbar` longtext DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `parent_section`, `type`, `template_id`, `page_id`, `name_en`, `name`, `charset`, `title`, `keywords`, `description`, `section_path`, `content`, `scripts`, `toolbar`, `updated_by_id`, `created_by_id`, `created_at`, `updated_at`) VALUES
(3, NULL, 'section', NULL, NULL, 'Demo', 'demo', NULL, NULL, NULL, NULL, 'demo', NULL, NULL, NULL, NULL, 1, '2022-08-29 12:35:11', '2022-09-02 05:18:07'),
(5, NULL, 'page', 8, NULL, 'demos', 'Demo', '<p>cvxcvxc</p>', '<p>Demo</p>', '<p>Demo</p>', '<p>Demo</p>', 'demo/', '<p>Demo page content<br></p>', '<p>Demo</p>', '<p>Demo</p>', NULL, 1, '2022-08-30 09:53:57', '2022-09-02 05:18:10'),
(8, 3, 'page', NULL, NULL, 'testing', 'Testing', NULL, NULL, NULL, NULL, 'demo/', NULL, NULL, NULL, NULL, 1, '2022-08-30 12:08:14', '2022-09-02 05:18:16'),
(9, 3, 'section', NULL, NULL, 'Corporate', 'corporate', NULL, NULL, NULL, NULL, 'demo/', NULL, NULL, NULL, NULL, 1, '2022-08-30 12:09:11', '2022-09-02 05:18:14'),
(13, 9, 'page', NULL, NULL, 'corporate.html', 'Corporate', NULL, NULL, 'Corporate', 'Corporate', 'demo/corporate/', NULL, NULL, NULL, NULL, 1, '2022-08-30 12:32:13', '2022-09-02 05:18:13'),
(14, 3, 'section', NULL, NULL, 'news', 'news', NULL, NULL, NULL, NULL, 'demo/demo/', NULL, NULL, NULL, NULL, 1, '2022-08-30 16:21:44', '2022-09-02 05:18:11'),
(15, 14, 'page', NULL, NULL, 'test', 'test', NULL, NULL, 'test', 'test', 'demodemo/news/', NULL, NULL, NULL, NULL, 1, '2022-08-30 16:22:47', '2022-09-02 05:18:19'),
(16, NULL, 'menu', NULL, NULL, 'test', 'test', NULL, NULL, NULL, NULL, 'test', NULL, NULL, NULL, NULL, 1, '2022-08-31 18:44:12', '2022-09-02 05:18:25'),
(26, NULL, 'page', 9, NULL, NULL, 'Dante Finley', '<p>&lt;section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;div class=&quot;container&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;h1&gt;Example website&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;p&gt;This is just a HTML example&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&lt;/section&gt;</p>', '<p>&lt;section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;div class=&quot;container&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;h1&gt;Example website&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;p&gt;This is just a HTML example&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&lt;/section&gt;</p>', '<p>&lt;section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;div class=&quot;container&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;h1&gt;Example website&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;p&gt;This is just a HTML example&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&lt;/section&gt;</p>', '<p>&lt;section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;div class=&quot;container&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;h1&gt;Example website&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;p&gt;This is just a HTML example&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&lt;/section&gt;</p>', 'Dante Finley', NULL, '<p>&lt;section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;div class=&quot;container&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;h1&gt;Example website&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;p&gt;This is just a HTML example&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&lt;/section&gt;</p>', '<p>&lt;section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;div class=&quot;container&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;h1&gt;Example website&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;p&gt;This is just a HTML example&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&lt;/section&gt;</p>', NULL, 1, '2022-09-01 11:25:17', '2022-09-02 05:18:18'),
(27, NULL, 'section', NULL, NULL, 'Dummy', 'dummy', NULL, NULL, NULL, NULL, 'dummy', NULL, NULL, NULL, NULL, 1, '2022-09-01 11:58:44', '2022-09-02 05:18:24'),
(29, 27, 'section', NULL, NULL, 'Dummy inner section', 'dummy_inner', NULL, NULL, NULL, NULL, 'dummy/dummy/', NULL, NULL, NULL, NULL, 1, '2022-09-01 12:09:08', '2022-09-02 05:18:21'),
(32, 29, 'page', 8, NULL, 'dante', 'Dante', '<p>&lt;section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;div class=&quot;container&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;h1&gt;Example website&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;p&gt;This is just a HTML example&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&lt;/section&gt;</p>', '<p>&lt;section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;div class=&quot;container&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;h1&gt;Example website&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;p&gt;This is just a HTML example&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&lt;/section&gt;</p>', '<p>&lt;section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;div class=&quot;container&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;h1&gt;Example website&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;p&gt;This is just a HTML example&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&lt;/section&gt;</p>', '<p>&lt;section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;div class=&quot;container&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;h1&gt;Example website&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;p&gt;This is just a HTML example&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&lt;/section&gt;</p>', 'dummy/dummy/dummy_inner/', NULL, '<p>&lt;section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;div class=&quot;container&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;h1&gt;Example website&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;p&gt;This is just a HTML example&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&lt;/section&gt;</p>', '<p>&lt;section&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;div class=&quot;container&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;h1&gt;Example website&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;p&gt;This is just a HTML example&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&lt;/section&gt;</p>', NULL, 1, '2022-09-01 12:14:58', '2022-09-02 05:18:27');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bus_schedule` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` bigint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `user_id`, `category_id`, `name_en`, `name`, `description`, `bus_schedule`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Cruise Tickets', '{\"name_en\":\"Cruise Tickets\",\"name_ru\":\"\\u0411\\u0438\\u043b\\u0435\\u0442\\u044b \\u043d\\u0430 \\u043a\\u0440\\u0443\\u0438\\u0437\",\"files\":null}', '<p>Cruise Tickets<br></p>', 'day,night', 1, NULL, '2022-09-13 11:47:35', '2022-09-13 12:15:14');

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` int(11) NOT NULL,
  `name` varchar(512) NOT NULL,
  `domain` varchar(100) NOT NULL,
  `template_name` varchar(512) NOT NULL,
  `description` text NOT NULL,
  `code` longtext NOT NULL,
  `domain_name` varchar(100) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `created_by_id` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `name`, `domain`, `template_name`, `description`, `code`, `domain_name`, `updated_by_id`, `created_by_id`, `updated_at`, `created_at`) VALUES
(8, 'Arthur Coleman', 'current', 'Kaye Savage', 'Sit dolores est illu', '<?php echo getKeywords(); ?>\r\n<section>\r\n	<div class=\"container\">\r\n		<h1>Example website</h1>\r\n		<p>This is just a HTML example</p>\r\n	</div>\r\n</section>', NULL, NULL, 1, '2022-08-25 16:46:06', '2022-08-25 16:46:06'),
(9, 'Jessamine Joyner', 'current', 'Idona Emerson', 'Tempor veniam archi', '<?php echo getScripts(); ?>\r\n<?php echo getTitle(); ?>\r\n<?php echo getDescription(); ?>\r\n<?php echo getToolbar(); ?>', NULL, NULL, 1, '2022-08-25 17:00:32', '2022-08-25 17:00:32'),
(10, 'Sample Template', 'current', 'Demo Template Name', 'This is demo description', '<?php echo getCharset(); ?>\r\n<?php echo getTitle(); ?>\r\n<?php echo getKeywords(); ?>\r\n<section>\r\n  <div>\r\n    <?= \'This is test template\'?>\r\n    </div>\r\n</section>\r\n<?php echo getDescription(); ?>', NULL, 1, 1, '2022-09-07 18:17:24', '2022-08-25 18:07:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mpwd` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'avatar.png',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissionid` bigint(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `otp` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `device_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `mpwd`, `contact_no`, `image`, `remember_token`, `permissionid`, `status`, `deleted_at`, `created_by`, `otp`, `updated_by`, `created_at`, `updated_at`, `device_token`) VALUES
(1, 'SuperAdmin', 'superamin@gmail.com', NULL, '$2y$10$CtAsyjiiH1NYNoMb/xT7revQ7SuzTBqOTOQ27E9tQQ51UBQAShos.', 'eyJpdiI6Ilg2aVpLSHMyTldVSlZoL29HYTF0RFE9PSIsInZhbHVlIjoiQW1zV3JCSlgzL0duNzdIYnRMMUVqY05heTJncXk5bkFkTlRUNE5EYUtaWT0iLCJtYWMiOiIwZWVhNzg4MzI2NmZhZjM0MTRkYjA0OThmMTQ2YThkZTU1OGVmOTdhY2MyNGFiYzZjNTdkMjQyMDA3MzJjOGQyIiwidGFnIjoiIn0=', '', '/users/avatar2_1656680911.png', NULL, 1, NULL, NULL, NULL, '', 1, '2022-06-23 02:37:41', '2022-08-24 08:11:52', NULL),
(2, 'Admin', 'admin@gmail.com', NULL, '$2y$10$0gV5/o1VPFjzrNgLXRFi1OZGCW.2ITn2Y4ppJ3v.TqlhZARZMsHla', 'eyJpdiI6ImpWVVlVNHp6SG4yTHU2L0l2RlUrRnc9PSIsInZhbHVlIjoiV2t2L1FESXRJVFFyU2ZncGg3d1phdz09IiwibWFjIjoiNDVlYjZlZTUxY2RlNGQyN2ZkMzM4MDZlYmY1NTQ3N2U1ZDhlY2ExZGE0NmFjNDU2ZDAwN2FkZGQ4ZDU5NDdiYiIsInRhZyI6IiJ9', '9632587410', '/users/avatar_1661324890.png', NULL, NULL, 1, NULL, NULL, '', 1, '2022-08-24 09:38:10', '2022-08-24 09:49:44', NULL),
(4, 'Demo', 'demo@gmail.com', NULL, '$2y$10$cy8pFtCPsJsIkPtCOo5ZvuUq2CFycKeLbwhywwooeyaaMfEpG33sa', 'eyJpdiI6IkZsdU15eWlzM1RSVnhuVmR0dGZMWVE9PSIsInZhbHVlIjoiUUs4dnB6NWJLOHRZckZBdFFFdXZVZzNCTjVYaVEreTdRMzhxWnNqOWJCbz0iLCJtYWMiOiJkYzA5MjY5Y2Q0NGQxMzE3NzAyNTc3YTg2ZThiYjNjMjNjM2UyNmYzZTVmYTMyODhjOTRmMmJjNTlmOTY4Y2MzIiwidGFnIjoiIn0=', '9632587412', '/users/avatar-3_1662374674.jpg', NULL, NULL, 1, NULL, NULL, '', 1, '2022-09-05 13:14:34', '2022-09-05 13:14:34', NULL),
(11, 'testing', 'testing@gmail.com', NULL, '$2y$10$.NG2jVXnned3UPDZo7KD2.n3UftclSa7ET4IZFnIRBsQyeBao4tcq', 'eyJpdiI6IjlpU0dqUSt2VEUvOFpCLzN2MlgvTlE9PSIsInZhbHVlIjoib2h4RGEvN0t0eklJTDBsdTdPYnJyUmJpb21XSkFPZGhpTFVFeS8wNW8rND0iLCJtYWMiOiIyMWUzZDQ1ZWFmZjlmMjYyZGRmOTA1ZTZlMzc4ZjQyNmM2OWYzYjA3YWQ1Y2U1NjZiNDAxNWMwOTg2ZGQ0Mzg1IiwidGFnIjoiIn0=', '963-25-8741', 'avatar.png', NULL, NULL, 1, NULL, NULL, '', NULL, '2022-09-15 10:43:04', '2022-09-15 10:43:04', NULL),
(12, 'Testdemo', 'testdemo@gmail.com', NULL, '$2y$10$Q1QjU6bFbAQm71MrAU0./udLZEXUXtLPmTaBJJXQi1Ql6QhOpokZS', 'eyJpdiI6ImgxbFBJWi9NSUFVNFRtd1pXOTlXb0E9PSIsInZhbHVlIjoiK09XWWhGTmMwMUdJb0FvOXhpY1RSdW9qWGtKTCtzTW9iSG1OZytvanVtbz0iLCJtYWMiOiI4MTU4OWYyZWM4YjcxN2I5MTU0NDQyMGU3NjA5ZDFmOTc5ZTdjOTFlZjdjOTdlNWQyZjczMzRjZDFiMTJiNzBiIiwidGFnIjoiIn0=', '741-25-8963', 'avatar.png', NULL, NULL, 1, NULL, NULL, '', NULL, '2022-09-15 11:52:40', '2022-09-15 11:52:40', NULL),
(13, 'Demo Test', 'demotest@gmai.com', NULL, '$2y$10$VBJ6uXMy7u7f0aINKbssgO2mDCl5f9L2fgd8.Sn6nk5tdSwQhClzS', 'eyJpdiI6InY4a01xS0tLbFlpVEpTY3JnemwwMHc9PSIsInZhbHVlIjoid2w2cm1mcldkUVB1K1Y2bUkwTmcvb0w1YXFSQ0hETnpNNXlLUmZXVXliRT0iLCJtYWMiOiJhOTE1NzgwYmU4ZWI3MmVkNTAyZTExMTk1M2NjMjY5NjNiMmE5MGM5N2FlNjk2ZWM2Yjg1ZmY2ZDlkZmFjNjAzIiwidGFnIjoiIn0=', '852-36-9741', 'avatar.png', NULL, NULL, 1, NULL, NULL, '', NULL, '2022-09-15 12:02:04', '2022-09-15 12:02:04', NULL),
(14, 'Demo Testing', 'demotesting@gmai.com', NULL, '$2y$10$lWRiN.0i73VK1W7uU9cbkOi1FdxFmBf4wFbZAuEvCaUx6TWGvw4lC', 'eyJpdiI6IldBRkI5alEwMVBpUGZBd0lNMVExSlE9PSIsInZhbHVlIjoiZzNQQXE2MkxYQUNETXhTS2N0UVNBSkZ3d1VUYU5GRHlGa3c0dnVvbldGVT0iLCJtYWMiOiI4YjNhOWYzZjYxYjdjZGZiMjRmMzU2ZTFkNmI5MTVmZDhhYmI3Y2ZlZDRjYjk3NzQ0ZTU5NDVjMDY0NzQyYjM2IiwidGFnIjoiIn0=', '852-36-9741', 'avatar.png', NULL, NULL, 1, NULL, NULL, '', NULL, '2022-09-16 11:19:54', '2022-09-16 11:19:54', NULL),
(15, 'Testdemoes', 'testdemoes@gmail.com', NULL, '$2y$10$t/L0XqTRbjHIk0VQHfFoLePqgszTMf2o/kkVcYatNDjYMIzSjlRaa', 'eyJpdiI6ImE2TitHNWxGREFSMHM5eDM4MWZnbmc9PSIsInZhbHVlIjoiM2hKeUpWSjN4d29ZdzVKNUR6Wjg1VnNtcWFKWWZkZTV5anNPZndsNGlLND0iLCJtYWMiOiIxYWUxNTQwNGM3NGRiN2FkMTI0NGNhYTRhNmE5NTlhNTliY2MyNDUyODBkNmExYzM3OTJkYjdiZTU4MzExNmNjIiwidGFnIjoiIn0=', '852-36-9741', 'avatar.png', NULL, NULL, 1, NULL, NULL, '', NULL, '2022-09-16 11:43:41', '2022-09-16 11:43:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_infos`
--

CREATE TABLE `user_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_customer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_infos`
--

INSERT INTO `user_infos` (`id`, `user_id`, `address`, `pin`, `locality`, `country`, `state`, `stripe_customer`, `deleted_at`, `created_at`, `updated_at`) VALUES
(5, 11, '126, mohali', '124114', 'mohali', 'AL', 'AK', 'cus_MR8SKPSNnhyITi', NULL, '2022-09-15 10:43:04', '2022-09-16 13:17:39'),
(6, 12, '126, mohali', '325742', 'mohali', 'AL', 'AZ', 'cus_MR8u7WmT6MAtCa', NULL, '2022-09-15 11:52:40', '2022-09-16 13:20:02'),
(7, 13, '526, mohali', '124114', 'mohali', 'AU', 'CA', 'cus_MR93KQuaS9SCpB', NULL, '2022-09-15 12:02:04', '2022-09-16 05:54:46'),
(8, 14, '526, mohali', '124114', 'mohali', 'DZ', 'CA', NULL, NULL, '2022-09-16 11:19:54', '2022-09-16 13:00:50'),
(9, 15, '4346, mohali', '32758', 'mohali', 'AD', 'AR', NULL, NULL, '2022-09-16 11:43:42', '2022-09-16 12:33:43');

-- --------------------------------------------------------

--
-- Table structure for table `web_settings`
--

CREATE TABLE `web_settings` (
  `id` bigint(20) NOT NULL,
  `option_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `web_settings`
--

INSERT INTO `web_settings` (`id`, `option_title`, `option_value`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'header', '{\"sitename\":\"Bus Ticket Booking\",\"tsclr\":\"1\",\"copyright\":\"Copyright \\u00a9 2022 Bus Ticket Booking. All rights reserved.\",\"language\":\"en\",\"light_logoimage\":\"\\/websetting\\/Logo-01_1663057920.png\",\"light_logoimage_sm\":\"\\/websetting\\/Logo-01_1663057920.png\",\"dark_logoimage\":\"\\/websetting\\/Logo-01_1663057920.png\",\"dark_logoimage_sm\":\"\\/websetting\\/Logo-01_1663057920.png\",\"faviconimage\":\"\\/websetting\\/favicon-01_1663058042.png\"}', 1, NULL, NULL, '2022-07-04 03:37:30', '2022-09-13 12:25:19'),
(2, 'general_cms', '{\"main_domain\":\"cmsnew.test-staylon.ru\",\"domain_aliases\":\"test-staylon.ru, www.test-staylon.ru\",\"block_time\":\"2\",\"number_of_attempts\":\"7\",\"block_time_admin\":\"5\",\"number_of_attempts_admin\":\"3\",\"generation_key\":\"QWRtaW4xMjNAI3N1cGVyYW1pbkBnbWFpbC5jb20=\",\"sql_injection\":\"block_access\",\"ip_address_spoofing\":\"keep_lock_log\",\"allow_editing_files\":\"., .php, .html, .htm, .phtml, .xml, .shtml, .shtml, .txt\",\"edit_visually\":\".php, .html, .htm, .phtml, .shtml, .dhtml\",\"allow_to_insert_images\":\".jpg, .gif, .png\",\"edit_area_frame_color\":\"#F7F8F9\",\"edit_area_frame_color_on_hover\":\"#FFFFFF\",\"captcha_font\":\"boxicons.ttf\",\"font_color\":\"#FFFFFF\",\"characters\":\"4\",\"valid\":\"600\",\"font_size\":\"18\",\"indent_left\":\"2\",\"top_margin\":\"17\",\"font_slant\":\"0\",\"background_color\":\"#FFFFFF\",\"captcha_width\":\"62\",\"captcha_height\":\"20\",\"captcha_generation_key\":null,\"folder_permissions\":\"0777\",\"file_permissions\":\"0664\"}', 1, NULL, NULL, '2022-09-05 09:51:16', '2022-09-08 20:03:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_mails`
--
ALTER TABLE `admin_mails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_mails_user_id_foreign` (`user_id`),
  ADD KEY `admin_mails_msg_id_foreign` (`msg_id`);

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `apis`
--
ALTER TABLE `apis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_access_token`
--
ALTER TABLE `api_access_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bus_times`
--
ALTER TABLE `bus_times`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bus_times_user_id_foreign` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `contact_forms`
--
ALTER TABLE `contact_forms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_forms_user_id_foreign` (`user_id`);

--
-- Indexes for table `file_logs`
--
ALTER TABLE `file_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info_blockdatas`
--
ALTER TABLE `info_blockdatas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info_blocks`
--
ALTER TABLE `info_blocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `info_blocks_user_id_foreign` (`user_id`);

--
-- Indexes for table `info_block_groups`
--
ALTER TABLE `info_block_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info_form_fields`
--
ALTER TABLE `info_form_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info_form_fields_value`
--
ALTER TABLE `info_form_fields_value`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages_code`
--
ALTER TABLE `languages_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languagetranslations`
--
ALTER TABLE `languagetranslations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menuitem`
--
ALTER TABLE `menuitem`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `menuses`
--
ALTER TABLE `menuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_infos`
--
ALTER TABLE `user_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_infos_user_id_foreign` (`user_id`);

--
-- Indexes for table `web_settings`
--
ALTER TABLE `web_settings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `apis`
--
ALTER TABLE `apis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `api_access_token`
--
ALTER TABLE `api_access_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `bus_times`
--
ALTER TABLE `bus_times`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(36) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info_form_fields_value`
--
ALTER TABLE `info_form_fields_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `languages_code`
--
ALTER TABLE `languages_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `languagetranslations`
--
ALTER TABLE `languagetranslations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `menuitem`
--
ALTER TABLE `menuitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `menuses`
--
ALTER TABLE `menuses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1016;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_infos`
--
ALTER TABLE `user_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `web_settings`
--
ALTER TABLE `web_settings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bus_times`
--
ALTER TABLE `bus_times`
  ADD CONSTRAINT `bus_times_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_infos`
--
ALTER TABLE `user_infos`
  ADD CONSTRAINT `user_infos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
