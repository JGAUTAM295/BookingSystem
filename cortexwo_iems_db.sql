-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2022 at 02:51 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cortexwo_iems_db`
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
-- Table structure for table `booked_artists`
--

CREATE TABLE `booked_artists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` int(20) DEFAULT NULL,
  `booking_id` int(10) UNSIGNED NOT NULL,
  `col_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `artist_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booked_artists`
--

INSERT INTO `booked_artists` (`id`, `form_id`, `booking_id`, `col_key`, `artist_id`, `booking_date`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'dancer=11', '15', '08/12/2022 4:18 PM', '2022-08-08 10:50:27', '2022-08-09 11:51:14'),
(2, 1, 2, 'dancer=11', '15', '08/15/2022 4:20 PM', '2022-08-08 10:51:23', '2022-08-09 11:51:06'),
(3, 1, 2, 'musician=12', '13', '08/15/2022 4:20 PM', '2022-08-08 10:51:23', '2022-08-09 11:51:06'),
(26, 1, 17, 'dancer=11', '8', '08/13/2022 4:20 PM', '2022-08-10 11:58:48', '2022-08-10 11:58:48'),
(27, 1, 17, 'musician=12', '17', '08/13/2022 4:20 PM', '2022-08-10 11:58:48', '2022-08-10 11:58:48');

-- --------------------------------------------------------

--
-- Table structure for table `booked_artist_dates`
--

CREATE TABLE `booked_artist_dates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` int(10) UNSIGNED NOT NULL,
  `col_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booked_artist_dates`
--

INSERT INTO `booked_artist_dates` (`id`, `booking_id`, `col_key`, `booking_date`, `created_at`, `updated_at`) VALUES
(1, 2, 'event-date-time=2', '08/15/2022 4:20 PM', '2022-08-09 11:22:01', '2022-08-09 11:51:06'),
(2, 1, 'event-date-time=2', '08/12/2022 4:18 PM', '2022-08-09 11:22:28', '2022-08-09 11:51:14');

-- --------------------------------------------------------

--
-- Table structure for table `booking_forms`
--

CREATE TABLE `booking_forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `form_id` bigint(11) NOT NULL,
  `form_info` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_forms`
--

INSERT INTO `booking_forms` (`id`, `user_id`, `form_id`, `form_info`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '{\"i-want-this-artist-for-a=1\":\"Guest Appearance\",\"event-date-time=2\":\"08\\/12\\/2022 4:18 PM\",\"name-of-event=3\":\"Birthday Party\",\"venue-address=4\":\"Mohali\",\"event-attire=5\":\"Casual\",\"your-full-name=6\":\"Test\",\"comments=8\":\"dsfdfsd\",\"dancer=11\":\"15\",\"musician=12\":null}', 1, 1, '2022-08-08 10:50:27', '2022-08-09 11:22:28'),
(2, 1, 1, '{\"i-want-this-artist-for-a=1\":\"Musical Performance\",\"event-date-time=2\":\"08\\/15\\/2022 4:20 PM\",\"name-of-event=3\":\"Dj Party\",\"venue-address=4\":\"Mohali\",\"event-attire=5\":\"Doesn\'t Really Matter\",\"your-full-name=6\":\"ABC\",\"comments=8\":\"fsdf\",\"dancer=11\":\"15\",\"musician=12\":\"13\"}', 1, 1, '2022-08-08 10:51:23', '2022-08-09 11:24:42'),
(3, 1, 2, '{\"name=13\":\"test\",\"email=14\":\"test@gmail.com\"}', 1, NULL, '2022-08-09 11:07:20', '2022-08-09 11:07:20'),
(4, 1, 2, '{\"name=13\":\"test\",\"email=14\":\"test@gmail.com\"}', 1, NULL, '2022-08-09 11:07:42', '2022-08-09 11:07:42'),
(5, 1, 2, '{\"name=13\":\"test\",\"email=14\":\"test@gmail.com\"}', 1, NULL, '2022-08-09 11:08:19', '2022-08-09 11:08:19'),
(17, 1, 1, '{\"i-want-this-artist-for-a=1\":\"Panel Discussion\",\"event-date-time=2\":\"08\\/13\\/2022 4:20 PM\",\"name-of-event=3\":\"Business Meeting\",\"venue-address=4\":\"pkl\",\"event-attire=5\":\"9\",\"your-full-name=6\":\"test\",\"dancer=11\":\"8\",\"musician=12\":\"17\",\"comments=8\":\"dadsddad\"}', 1, NULL, '2022-08-10 11:58:48', '2022-08-10 11:58:48');

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
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input_field_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input_artist` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input_required` tinyint(4) NOT NULL,
  `file_accept` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_no` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `form_id`, `name`, `slug`, `input_field_type`, `input_artist`, `input_required`, `file_accept`, `order_no`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'I want (this artist) for a....', 'i-want-this-artist-for-a', 'Select', NULL, 1, NULL, 1, 1, 1, NULL, '2022-08-04 09:10:49', '2022-08-04 09:10:49'),
(2, 1, 'Event Date & Time', 'event-date-time', 'Date', NULL, 1, NULL, 2, 1, 1, NULL, '2022-08-04 10:03:02', '2022-08-04 10:03:02'),
(3, 1, 'Name of Event', 'name-of-event', 'Text', NULL, 1, NULL, 3, 1, 1, NULL, '2022-08-04 10:03:21', '2022-08-04 10:03:21'),
(4, 1, 'Venue Address', 'venue-address', 'Textarea', NULL, 1, NULL, 4, 1, 1, NULL, '2022-08-04 10:03:40', '2022-08-04 10:03:40'),
(5, 1, 'Event Attire', 'event-attire', 'Select', NULL, 1, NULL, 5, 1, 1, NULL, '2022-08-04 10:04:04', '2022-08-04 10:04:04'),
(6, 1, 'Your Full Name', 'your-full-name', 'Text', NULL, 1, NULL, 6, 1, 1, 1, '2022-08-04 10:06:02', '2022-08-04 10:18:11'),
(8, 1, 'Comments', 'comments', 'Textarea', NULL, 0, NULL, 7, 1, 1, NULL, '2022-08-04 10:52:49', '2022-08-04 10:52:49'),
(11, 1, 'Dancer', 'dancer', 'Artist', 'Dancer', 1, NULL, 8, 1, 1, 1, '2022-08-05 10:56:54', '2022-08-08 10:33:31'),
(12, 1, 'Musician', 'musician', 'Artist', 'Musician', 0, NULL, 9, 1, 1, 1, '2022-08-08 10:10:06', '2022-08-08 10:33:39'),
(13, 2, 'Name', 'name', 'Text', NULL, 1, NULL, 1, 1, 1, NULL, '2022-08-09 07:40:03', '2022-08-09 07:40:03'),
(14, 2, 'Email', 'email', 'Email', NULL, 1, NULL, 2, 1, 1, NULL, '2022-08-09 07:40:15', '2022-08-09 07:40:15');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_data`
--

CREATE TABLE `custom_fields_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cf_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_fields_data`
--

INSERT INTO `custom_fields_data` (`id`, `cf_id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Musical Performance', 1, 1, NULL, '2022-08-04 10:00:27', '2022-08-04 10:00:27'),
(2, 1, 'Guest Appearance', 1, 1, NULL, '2022-08-04 10:01:13', '2022-08-04 10:01:13'),
(3, 1, 'Panel Discussion', 1, 1, NULL, '2022-08-04 10:01:29', '2022-08-04 10:01:29'),
(4, 1, 'Voice-Over/AD(Radio/Internet)', 1, 1, NULL, '2022-08-04 10:01:42', '2022-08-04 10:01:42'),
(6, 5, 'Casual', 1, 1, 1, '2022-08-04 10:04:37', '2022-08-09 12:41:33'),
(7, 5, 'Semi-Formal', 1, 1, NULL, '2022-08-04 10:04:54', '2022-08-04 10:04:54'),
(8, 5, 'Formal', 1, 1, NULL, '2022-08-04 10:05:02', '2022-08-04 10:05:02'),
(9, 5, 'Doesn\'t Really Matter', 1, 1, NULL, '2022-08-04 10:05:12', '2022-08-04 10:05:12');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `department_no` varchar(255) NOT NULL,
  `colorbg` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `department_no`, `colorbg`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '40', '40', '#BA017D', 1, 1, 1, '2022-07-18 10:59:31', '2022-07-18 11:19:33', NULL),
(2, '45', '45', '#56B228', 1, 1, NULL, '2022-07-18 10:59:51', '2022-07-18 10:59:51', NULL),
(3, '50', '50', '#8128AE', 1, 1, 1, '2022-07-18 11:00:23', '2022-07-18 11:11:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `inventory_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `equipment_info` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `equipment_issue_loggings`
--

CREATE TABLE `equipment_issue_loggings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_nr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `equipment_id` bigint(20) UNSIGNED NOT NULL,
  `priority` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_no` int(11) DEFAULT NULL,
  `scope_of_work` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
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
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `showemail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_email` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `user_id`, `title`, `showemail`, `sender_email`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dancer Booking Form', 'Yes', 'jyoti.610weblab@gmail.com', 1, 1, 1, '2022-08-04 12:20:05', '2022-08-09 09:56:35'),
(2, 1, 'Test', 'Yes', 'jyoti.610weblab@gmail.com', 1, 1, 1, '2022-08-09 07:19:03', '2022-08-09 09:58:27');

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `user_id`, `name`, `phone`, `address`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'ssas', 'sa', 'asa', 1, 1, NULL, '2022-08-04 08:16:23', '2022-08-04 08:16:23');

-- --------------------------------------------------------

--
-- Table structure for table `job_orders`
--

CREATE TABLE `job_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `eilid` bigint(20) UNSIGNED NOT NULL,
  `job_performed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `remarks` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(14, 'admin,Super-Admin', 'Booking Forms', 'fas fa-book', '/booking-forms', 'No', NULL, '12', 1, 1, 1, NULL, '2022-08-04 12:03:50', '2022-08-05 04:31:43');

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
(0, '2022_08_04_144316_create_custom_fields_data_table', 17);

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
(1, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 7),
(3, 'App\\Models\\User', 9),
(4, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 4),
(4, 'App\\Models\\User', 5),
(4, 'App\\Models\\User', 8),
(4, 'App\\Models\\User', 15),
(5, 'App\\Models\\User', 13),
(5, 'App\\Models\\User', 17);

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
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('sachin@gmail.com', '$2y$10$GiObgYyFJ4PiYAO.oB/2Ne8hL9OegVE23af1fBT5rHGISnijQs.pm', '2022-06-30 06:35:46'),
('sachin@gmail.com', '6JcTJtcXlADfuNw7Rd0l1TGDy0RmfejZfXgeX2BKgHQjUpxo5T4q7FLzB3VR3uHg', '2022-06-30 06:40:10'),
('jyoti.610weblab@gmail.com', '$2y$10$6xFfNvewJCE4JJHa77dxL.ssp9g7.WpbI/CKvtxLDpWexsv4/GK1i', '2022-07-01 00:01:21');

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
(1, 'login', 'web', '2022-06-23 04:06:30', '2022-06-23 04:18:25'),
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
(0, 'custom-forms.index', 'web', '2022-08-04 05:13:17', '2022-08-04 05:13:17'),
(0, 'custom-forms.create', 'web', '2022-08-04 05:13:17', '2022-08-04 05:13:17'),
(0, 'custom-forms.store', 'web', '2022-08-04 05:13:17', '2022-08-04 05:13:17'),
(0, 'custom-forms.show', 'web', '2022-08-04 05:13:17', '2022-08-04 05:13:17'),
(0, 'custom-forms.edit', 'web', '2022-08-04 05:13:17', '2022-08-04 05:13:17'),
(0, 'custom-forms.update', 'web', '2022-08-04 05:13:17', '2022-08-04 05:13:17'),
(0, 'custom-forms.destroy', 'web', '2022-08-04 05:13:17', '2022-08-04 05:13:17'),
(0, 'departments.show', 'web', '2022-08-04 05:13:17', '2022-08-04 05:13:17'),
(0, 'settings.create', 'web', '2022-08-04 05:13:17', '2022-08-04 05:13:17'),
(0, 'settings.show', 'web', '2022-08-04 05:13:17', '2022-08-04 05:13:17'),
(0, 'settings.edit', 'web', '2022-08-04 05:13:18', '2022-08-04 05:13:18'),
(0, 'settings.update', 'web', '2022-08-04 05:13:18', '2022-08-04 05:13:18'),
(0, 'settings.destroy', 'web', '2022-08-04 05:13:18', '2022-08-04 05:13:18'),
(0, 'settings.removeimage', 'web', '2022-08-04 05:13:18', '2022-08-04 05:13:18'),
(0, 'menus.show', 'web', '2022-08-04 05:13:18', '2022-08-04 05:13:18'),
(0, 'custom-fields.index', 'web', '2022-08-04 08:27:57', '2022-08-04 08:27:57'),
(0, 'custom-fields.create', 'web', '2022-08-04 08:27:57', '2022-08-04 08:27:57'),
(0, 'custom-fields.store', 'web', '2022-08-04 08:27:57', '2022-08-04 08:27:57'),
(0, 'custom-fields.show', 'web', '2022-08-04 08:27:57', '2022-08-04 08:27:57'),
(0, 'custom-fields.edit', 'web', '2022-08-04 08:27:57', '2022-08-04 08:27:57'),
(0, 'custom-fields.update', 'web', '2022-08-04 08:27:57', '2022-08-04 08:27:57'),
(0, 'custom-fields.destroy', 'web', '2022-08-04 08:27:57', '2022-08-04 08:27:57'),
(0, 'customFieldsData.index', 'web', '2022-08-04 09:22:46', '2022-08-04 09:22:46'),
(0, 'customFieldsData.create', 'web', '2022-08-04 09:22:46', '2022-08-04 09:22:46'),
(0, 'customFieldsData.store', 'web', '2022-08-04 09:22:46', '2022-08-04 09:22:46'),
(0, 'customFieldsData.show', 'web', '2022-08-04 09:22:46', '2022-08-04 09:22:46'),
(0, 'customFieldsData.edit', 'web', '2022-08-04 09:22:46', '2022-08-04 09:22:46'),
(0, 'customFieldsData.update', 'web', '2022-08-04 09:22:46', '2022-08-04 09:22:46'),
(0, 'customFieldsData.destroy', 'web', '2022-08-04 09:22:46', '2022-08-04 09:22:46'),
(0, 'forms.index', 'web', '2022-08-04 10:48:58', '2022-08-04 10:48:58'),
(0, 'forms.create', 'web', '2022-08-04 10:48:58', '2022-08-04 10:48:58'),
(0, 'forms.store', 'web', '2022-08-04 10:48:58', '2022-08-04 10:48:58'),
(0, 'forms.show', 'web', '2022-08-04 10:48:58', '2022-08-04 10:48:58'),
(0, 'forms.edit', 'web', '2022-08-04 10:48:58', '2022-08-04 10:48:58'),
(0, 'forms.update', 'web', '2022-08-04 10:48:58', '2022-08-04 10:48:58'),
(0, 'forms.destroy', 'web', '2022-08-04 10:48:59', '2022-08-04 10:48:59'),
(0, 'booking-forms.index', 'web', '2022-08-04 12:06:24', '2022-08-04 12:06:24'),
(0, 'booking-forms.create', 'web', '2022-08-04 12:06:24', '2022-08-04 12:06:24'),
(0, 'booking-forms.store', 'web', '2022-08-04 12:06:24', '2022-08-04 12:06:24'),
(0, 'booking-forms.show', 'web', '2022-08-04 12:06:24', '2022-08-04 12:06:24'),
(0, 'booking-forms.edit', 'web', '2022-08-04 12:06:24', '2022-08-04 12:06:24'),
(0, 'booking-forms.update', 'web', '2022-08-04 12:06:24', '2022-08-04 12:06:24'),
(0, 'booking-forms.destroy', 'web', '2022-08-04 12:06:24', '2022-08-04 12:06:24'),
(0, 'booking-forms.list', 'web', '2022-08-05 04:54:14', '2022-08-05 04:54:14'),
(0, 'user.fetchartist', 'web', '2022-08-05 09:54:16', '2022-08-05 09:54:16'),
(0, 'booking-forms.export', 'web', '2022-08-05 11:27:42', '2022-08-05 11:27:42'),
(0, 'booking-forms.report', 'web', '2022-08-09 07:01:12', '2022-08-09 07:01:12'),
(0, 'booking.artistbooked', 'web', '2022-08-09 11:42:38', '2022-08-09 11:42:38');

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
(4, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '70f2917f647118ab139b329db507f93562382228a92fab46cd671c24c5013d49', '[\"*\"]', '2022-08-10 05:12:39', '2022-08-10 05:01:29', '2022-08-10 05:12:39'),
(5, 'App\\Models\\User', 15, 'LaravelSanctumAuth', 'b3bb0f4dbb502ca773715d117e5e8fa756de71324da7c9af747d2ab83187a47e', '[\"*\"]', '2022-08-10 12:22:09', '2022-08-10 05:13:45', '2022-08-10 12:22:09'),
(6, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '24973082b318fc585d9df55b2431892bd6538daa0d8a2bf818dc6bf5e0f0d948', '[\"*\"]', '2022-08-10 11:30:33', '2022-08-10 06:13:39', '2022-08-10 11:30:33'),
(7, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '4f50da423bc770a4637dbeb67c7f058836fffd4fb12f7fa3b368a68a04d37a7a', '[\"*\"]', NULL, '2022-08-10 07:05:14', '2022-08-10 07:05:14'),
(8, 'App\\Models\\User', 1, 'LaravelSanctumAuth', '662bc6f46bc4658228c45cffd346b31913643c8a0d6d857f39bb743107a08f6e', '[\"*\"]', '2022-08-10 12:50:27', '2022-08-10 11:49:28', '2022-08-10 12:50:27'),
(9, 'App\\Models\\User', 15, 'LaravelSanctumAuth', 'a4fa57698181d32f4dd4f1dd0e781791fc143c5812b169240d440926c9bd8ba0', '[\"*\"]', '2022-08-10 12:28:24', '2022-08-10 12:28:10', '2022-08-10 12:28:24'),
(10, 'App\\Models\\User', 1, 'LaravelSanctumAuth', 'eee760a7114eab76b15935b9e86ba4ef8cd4602a2549f7f5d49fc923af424f32', '[\"*\"]', NULL, '2022-08-10 12:29:02', '2022-08-10 12:29:02'),
(11, 'App\\Models\\User', 8, 'LaravelSanctumAuth', 'b85f3bb97b134de1bb26bc591bcb84c48695acc56d9896574ca2da95daa53214', '[\"*\"]', '2022-08-10 12:47:51', '2022-08-10 12:29:29', '2022-08-10 12:47:51');

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
(2, 'Super-Admin', 'web', '#C20505', '2022-06-23 04:43:17', '2022-08-09 07:01:36'),
(3, 'Artist', 'web', NULL, '2022-06-23 04:44:05', '2022-08-04 08:13:29'),
(4, 'Dancer', 'web', '#055DAC', '2022-06-27 01:50:29', '2022-08-08 06:50:56'),
(5, 'Musician', 'web', '#511ADB', '2022-08-08 10:08:23', '2022-08-08 10:08:23');

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
(1, 3),
(2, 3),
(3, 3),
(30, 3),
(83, 3),
(84, 3),
(101, 3),
(102, 3),
(103, 3),
(104, 3),
(108, 3),
(110, 3),
(111, 3),
(125, 3),
(132, 3),
(133, 3),
(134, 3),
(135, 3),
(1, 4),
(2, 4),
(70, 4),
(83, 4),
(84, 4),
(101, 4),
(102, 4),
(103, 4),
(104, 4),
(108, 4),
(110, 4),
(111, 4),
(132, 4),
(133, 4),
(134, 4),
(135, 4),
(1, 5),
(2, 5),
(4, 5),
(5, 5),
(6, 5),
(7, 5),
(8, 5),
(9, 5),
(30, 5),
(83, 5),
(84, 5),
(102, 5),
(103, 5),
(104, 5),
(105, 5),
(106, 5),
(108, 5),
(110, 5),
(132, 5),
(133, 5),
(134, 5),
(135, 5),
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
(0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `taxonomies`
--

CREATE TABLE `taxonomies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input_field_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input_required` tinyint(4) DEFAULT NULL,
  `file_accept` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_no` bigint(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_data`
--

CREATE TABLE `taxonomy_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `contact_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'avatar.png',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissionid` bigint(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `device_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `contact_no`, `image`, `remember_token`, `permissionid`, `status`, `deleted_at`, `created_by`, `updated_by`, `created_at`, `updated_at`, `device_token`) VALUES
(1, 'SuperAdmin', 'superamin@gmail.com', NULL, '$2y$10$qwKmnIuKpY0GnJxFAr1lfOEf8xYmz8qMxm52V57iHwgbl6VXa.W5.', '', '/users/avatar2_1656680911.png', NULL, 1, 1, NULL, NULL, 1, '2022-06-23 02:37:41', '2022-08-10 05:01:29', NULL),
(2, 'Admin', 'admin@gmail.com', NULL, '$2y$10$VseD2y93UMRgObkxY0jad.P1zDV1k7sD9ZQ1peIh32Y4Zg8K4AgLu', '', '/users/avatar_1656680891.png', NULL, 1, 1, NULL, NULL, 1, '2022-06-23 04:09:09', '2022-07-01 07:38:11', NULL),
(6, 'Rahul', 'rahul@gmail.com', NULL, '$2y$10$Rs56cvXtL7tE4jMTdnIC7OOpfnN98C/qjhHNi395j9wphRmqW39bO', '', '/users/avatar5_1656680878.png', NULL, NULL, 1, NULL, NULL, 1, '2022-06-29 02:27:55', '2022-07-07 23:21:31', NULL),
(7, 'Yogesh', 'yogesh@gmail.com', NULL, '$2y$10$DLglPsQXdKjSYozgrZ.Pq.xojOxU4OwBzQfuLDWf40YumJmc3LfHW', '', '/users/avatar_1656680861.png', NULL, NULL, 1, NULL, NULL, 1, '2022-06-29 02:34:14', '2022-07-07 23:21:13', 'cvEAfRpouEW9Z10KkOODyh:APA91bFXcZUoa-KqP5iQFlVeH8jWfUNk2b6APAYYDOH5ynQYyNvqHUQi7ip3JpiK1XjY89C6cti38w2hDWfQ060-bTKIFqBh7sl1VhbzjmuGox4HEhLL3wZKSk57aHHgocW3kuGTE64K'),
(8, 'Sachin', 'sachin@gmail.com', NULL, '$2y$10$eKB5xi4V4q.Er62pM4/4Guv6R6zmW17gv9FcPQMnW.RSmzZwYjabS', '', '/users/avatar4_1656680839.png', NULL, NULL, 1, NULL, NULL, 1, '2022-06-29 02:34:42', '2022-07-19 11:55:29', 'cvEAfRpouEW9Z10KkOODyh:APA91bFXcZUoa-KqP5iQFlVeH8jWfUNk2b6APAYYDOH5ynQYyNvqHUQi7ip3JpiK1XjY89C6cti38w2hDWfQ060-bTKIFqBh7sl1VhbzjmuGox4HEhLL3wZKSk57aHHgocW3kuGTE64K'),
(9, 'sandeep', 'sandeep@gmail.com', NULL, '$2y$10$FJP7f.Ea1jW1Vsynl3r8e.nqsyPccdGd4bDK5zZUkLI/lG7EUqjqq', '', '/users/user8-128x128_1656680791.jpg', NULL, NULL, 1, NULL, NULL, 1, '2022-06-29 07:40:35', '2022-07-19 11:55:25', NULL),
(12, 'yogesh chandra', 'yogeshchandra@gmail.com', NULL, '$2y$10$WhMdG3srZK3nc7Q/EFVY3e3Da5fQuGiosyvOFpVVv7FnY7tNOMTXe', '', 'avatar.png', NULL, NULL, 1, NULL, NULL, 12, '2022-07-14 07:14:41', '2022-07-14 07:48:08', NULL),
(13, 'abhay', 'abhay@gmail.com', NULL, '$2y$10$gPrHqa7ETJ6e/UVz2hDMIesKBmBh9/8GRLat4/pp6WAHoaiG5Hbpa', '', '/users/avatar_1659953363.png', NULL, NULL, 1, NULL, NULL, 1, '2022-07-14 09:34:54', '2022-08-08 10:09:23', NULL),
(15, 'Sunita', 'sunita@gmail.com', NULL, '$2y$10$DcXZzEKvPOFkuGxk/tPbyu5KkZAmclUNXcz3oejEyBY0poJWsD4ga', '', '/users/chs-logo_1658121830.png', NULL, NULL, 1, NULL, NULL, 1, '2022-07-18 04:50:20', '2022-07-18 05:23:50', NULL),
(17, 'Ele', 'ele@gmail.com', NULL, '$2y$10$YM/MoNJtCUWWcm87TUwOVudw9UG4u5liYF901YpWyoAHhmSl9jQqu', '', 'avatar.png', NULL, NULL, 1, NULL, NULL, 17, '2022-08-09 04:44:33', '2022-08-09 04:44:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usersbkup`
--

CREATE TABLE `usersbkup` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'avatar.png',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `permissionid` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'header', '{\"sitename\":\"Artist Booking\",\"tsclr\":\"1\",\"showreport\":\"Yes\",\"reportstitle\":\"Reports\",\"form_id\":[\"2\",\"1\"],\"copyright\":\"Copyright \\u00a9 2022 Artist Booking. All rights reserved.\",\"logoimage\":null,\"faviconimage\":\"\\/websetting\\/favicon_1659590575.png\"}', 1, NULL, NULL, '2022-07-04 03:37:30', '2022-08-09 07:42:47');

-- --------------------------------------------------------

--
-- Table structure for table `work_orders`
--

CREATE TABLE `work_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_nr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `department_no` int(11) DEFAULT NULL,
  `equipmentissue_id` int(11) NOT NULL,
  `priority` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scope_of_work` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `work_order_images`
--

CREATE TABLE `work_order_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workorder_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `work_order_meta`
--

CREATE TABLE `work_order_meta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `woid` bigint(20) UNSIGNED NOT NULL,
  `job_performed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `remarks` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Indexes for table `booked_artists`
--
ALTER TABLE `booked_artists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booked_artist_dates`
--
ALTER TABLE `booked_artist_dates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_forms`
--
ALTER TABLE `booking_forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_forms`
--
ALTER TABLE `contact_forms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_forms_user_id_foreign` (`user_id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields_data`
--
ALTER TABLE `custom_fields_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_fields_data_cf_id_foreign` (`cf_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipment_user_id_foreign` (`user_id`),
  ADD KEY `equipment_inventory_id_foreign` (`inventory_id`);

--
-- Indexes for table `equipment_issue_loggings`
--
ALTER TABLE `equipment_issue_loggings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipment_issue_loggings_user_id_foreign` (`user_id`),
  ADD KEY `equipment_issue_loggings_equipment_id_foreign` (`equipment_id`),
  ADD KEY `equipment_issue_loggings_staff_id_foreign` (`staff_id`),
  ADD KEY `equipment_issue_loggings_client_id_foreign` (`client_id`);

--
-- Indexes for table `file_logs`
--
ALTER TABLE `file_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_settings`
--
ALTER TABLE `web_settings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booked_artists`
--
ALTER TABLE `booked_artists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `booked_artist_dates`
--
ALTER TABLE `booked_artist_dates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `booking_forms`
--
ALTER TABLE `booking_forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `custom_fields_data`
--
ALTER TABLE `custom_fields_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menuitem`
--
ALTER TABLE `menuitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `menuses`
--
ALTER TABLE `menuses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `web_settings`
--
ALTER TABLE `web_settings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `custom_fields_data`
--
ALTER TABLE `custom_fields_data`
  ADD CONSTRAINT `custom_fields_data_cf_id_foreign` FOREIGN KEY (`cf_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
