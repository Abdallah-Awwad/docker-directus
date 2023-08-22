-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2023 at 01:20 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medicine_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `directus_activity`
--

CREATE TABLE `directus_activity` (
  `id` int(10) UNSIGNED NOT NULL,
  `action` varchar(45) NOT NULL,
  `user` char(36) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `ip` varchar(50) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `comment` text DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `directus_collections`
--

CREATE TABLE `directus_collections` (
  `collection` varchar(64) NOT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `display_template` varchar(255) DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `singleton` tinyint(1) NOT NULL DEFAULT 0,
  `translations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`translations`)),
  `archive_field` varchar(64) DEFAULT NULL,
  `archive_app_filter` tinyint(1) NOT NULL DEFAULT 1,
  `archive_value` varchar(255) DEFAULT NULL,
  `unarchive_value` varchar(255) DEFAULT NULL,
  `sort_field` varchar(64) DEFAULT NULL,
  `accountability` varchar(255) DEFAULT 'all',
  `color` varchar(255) DEFAULT NULL,
  `item_duplication_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`item_duplication_fields`)),
  `sort` int(11) DEFAULT NULL,
  `group` varchar(64) DEFAULT NULL,
  `collapse` varchar(255) NOT NULL DEFAULT 'open',
  `preview_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_collections`
--

INSERT INTO `directus_collections` (`collection`, `icon`, `note`, `display_template`, `hidden`, `singleton`, `translations`, `archive_field`, `archive_app_filter`, `archive_value`, `unarchive_value`, `sort_field`, `accountability`, `color`, `item_duplication_fields`, `sort`, `group`, `collapse`, `preview_url`) VALUES
('inventory', NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 'all', NULL, NULL, 3, NULL, 'open', NULL),
('invoice', NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 'all', NULL, NULL, 5, NULL, 'open', NULL),
('invoice_details', NULL, NULL, NULL, 0, 0, NULL, 'status', 1, 'archived', 'draft', 'sort', 'all', NULL, NULL, 6, NULL, 'open', NULL),
('invoice_details_inventory', 'import_export', NULL, NULL, 1, 0, NULL, NULL, 1, NULL, NULL, NULL, 'all', NULL, NULL, 8, NULL, 'open', NULL),
('manufacturer', NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 'all', NULL, NULL, 2, NULL, 'open', NULL),
('medicine', NULL, NULL, NULL, 0, 0, NULL, 'status', 1, 'archived', 'draft', 'sort', 'all', '#1495FF', NULL, 1, NULL, 'open', NULL),
('medicine_manufacturer', 'import_export', NULL, NULL, 1, 0, NULL, NULL, 1, NULL, NULL, NULL, 'all', NULL, NULL, 7, NULL, 'open', NULL),
('medicine_sku', NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 'all', NULL, NULL, 4, NULL, 'open', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `directus_dashboards`
--

CREATE TABLE `directus_dashboards` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(30) NOT NULL DEFAULT 'dashboard',
  `note` text DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_created` char(36) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_dashboards`
--

INSERT INTO `directus_dashboards` (`id`, `name`, `icon`, `note`, `date_created`, `user_created`, `color`) VALUES
('552589f8-bd71-48b5-befe-c9c9065e8613', 'Insights', 'dashboard', NULL, '2023-08-17 19:11:34', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '#1495FF');

-- --------------------------------------------------------

--
-- Table structure for table `directus_fields`
--

CREATE TABLE `directus_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `collection` varchar(64) NOT NULL,
  `field` varchar(64) NOT NULL,
  `special` varchar(64) DEFAULT NULL,
  `interface` varchar(64) DEFAULT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `display` varchar(64) DEFAULT NULL,
  `display_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`display_options`)),
  `readonly` tinyint(1) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `sort` int(10) UNSIGNED DEFAULT NULL,
  `width` varchar(30) DEFAULT 'full',
  `translations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`translations`)),
  `note` text DEFAULT NULL,
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `required` tinyint(1) DEFAULT 0,
  `group` varchar(64) DEFAULT NULL,
  `validation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`validation`)),
  `validation_message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_fields`
--

INSERT INTO `directus_fields` (`id`, `collection`, `field`, `special`, `interface`, `options`, `display`, `display_options`, `readonly`, `hidden`, `sort`, `width`, `translations`, `note`, `conditions`, `required`, `group`, `validation`, `validation_message`) VALUES
(1, 'medicine', 'id', NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(2, 'medicine', 'status', NULL, 'select-dropdown', '{\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\"},{\"text\":\"$t:draft\",\"value\":\"draft\"},{\"text\":\"$t:archived\",\"value\":\"archived\"}]}', 'labels', '{\"showAsDot\":true,\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--primary)\"},{\"text\":\"$t:draft\",\"value\":\"draft\",\"foreground\":\"#18222F\",\"background\":\"#D3DAE4\"},{\"text\":\"$t:archived\",\"value\":\"archived\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--warning)\"}]}', 0, 1, 3, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(3, 'medicine', 'sort', NULL, 'input', NULL, NULL, NULL, 0, 1, 4, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(4, 'medicine', 'user_created', 'user-created', 'select-dropdown-m2o', '{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}', 'user', NULL, 1, 1, 5, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(5, 'medicine', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{\"relative\":true}', 1, 1, 6, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(6, 'medicine', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}', 'user', NULL, 1, 1, 7, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(7, 'medicine', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{\"relative\":true}', 1, 1, 8, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(8, 'medicine', 'name', NULL, 'input', '{\"iconLeft\":\"pill\",\"trim\":true}', 'formatted-value', NULL, 0, 0, 2, 'full', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(9, 'medicine', 'category', NULL, 'select-dropdown', '{\"choices\":[{\"text\":\"Vitamins\",\"value\":\"0\"},{\"text\":\"First Aid\",\"value\":\"1\"},{\"text\":\"Herbal and natueral remedies\",\"value\":\"2\"},{\"text\":\"Diabetes Care\",\"value\":\"4\"},{\"text\":\"Eye Care\",\"value\":\"5\"},{\"text\":\"Weight Management\",\"value\":\"6\"},{\"text\":\"Baby care\",\"value\":\"7\"}],\"icon\":\"grid_3x3\"}', 'raw', NULL, 0, 0, 9, 'half', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(11, 'medicine', 'unit', NULL, 'input', NULL, NULL, NULL, 0, 0, 11, 'full', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(12, 'medicine', 'type', NULL, 'select-dropdown', '{\"choices\":[{\"text\":\"Tablets\",\"value\":\"0\"},{\"text\":\"Strips\",\"value\":\"1\"},{\"text\":\"Capsules\",\"value\":\"2\"},{\"text\":\"Syrups\",\"value\":\"3\"},{\"text\":\"Creams\",\"value\":\"4\"},{\"text\":\"Injections\",\"value\":\"5\"},{\"text\":\"Drops\",\"value\":\"6\"},{\"text\":\"Powders\",\"value\":\"7\"}]}', 'raw', '{\"format\":false}', 0, 0, 10, 'half', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(13, 'manufacturer', 'id', 'uuid', 'input', NULL, NULL, NULL, 1, 1, 1, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(14, 'manufacturer', 'user_created', 'user-created', 'select-dropdown-m2o', '{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}', 'user', NULL, 1, 1, 2, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(15, 'manufacturer', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{\"relative\":true}', 1, 1, 3, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(16, 'manufacturer', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}', 'user', NULL, 1, 1, 4, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(17, 'manufacturer', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{\"relative\":true}', 1, 1, 5, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(18, 'manufacturer', 'name', NULL, 'input', NULL, NULL, NULL, 0, 0, 6, 'half', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(19, 'manufacturer', 'phone', NULL, 'input', NULL, NULL, NULL, 0, 0, 7, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(20, 'manufacturer', 'address', NULL, 'input-multiline', NULL, NULL, NULL, 0, 0, 8, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(22, 'medicine_manufacturer', 'id', NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(23, 'medicine_manufacturer', 'medicine_id', NULL, NULL, NULL, NULL, NULL, 0, 1, 2, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(24, 'medicine_manufacturer', 'manufacturer_id', NULL, NULL, NULL, NULL, NULL, 0, 1, 3, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(25, 'medicine', 'image', 'file', 'file-image', '{}', NULL, NULL, 0, 0, 13, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(26, 'inventory', 'id', 'uuid', 'input', NULL, NULL, NULL, 1, 1, 1, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(27, 'inventory', 'purchase_date', 'date-created', 'datetime', NULL, 'datetime', '{\"relative\":true}', 1, 1, 2, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(28, 'inventory', 'medicine_id', 'm2o', 'select-dropdown-m2o', '{\"template\":\"{{id}}\"}', NULL, NULL, 0, 0, 3, 'half', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(29, 'inventory', 'selling_price', NULL, 'input', '{\"min\":0}', NULL, NULL, 0, 0, 6, 'half', NULL, NULL, NULL, 1, NULL, '{\"_and\":[{\"selling_price\":{\"_gte\":null}}]}', NULL),
(30, 'inventory', 'buying_price', NULL, 'input', '{\"min\":0}', NULL, NULL, 0, 0, 5, 'half', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(31, 'inventory', 'expiration_date', NULL, 'datetime', NULL, NULL, NULL, 0, 0, 7, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(32, 'inventory', 'quantity', NULL, 'input', '{\"min\":0}', NULL, NULL, 0, 0, 4, 'half', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(34, 'medicine_sku', 'SKU', 'uuid', 'input', NULL, NULL, NULL, 1, 0, 1, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(36, 'medicine_sku', 'inventory_id', 'm2o', 'select-dropdown-m2o', NULL, NULL, NULL, 0, 0, 3, 'full', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(37, 'users', 'id', 'uuid', 'input', NULL, NULL, NULL, 1, 1, 1, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(38, 'users', 'sort', NULL, 'input', NULL, NULL, NULL, 0, 1, 2, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(39, 'users', 'user_created', 'user-created', 'select-dropdown-m2o', '{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}', 'user', NULL, 1, 1, 3, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(40, 'users', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{\"relative\":true}', 1, 1, 4, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(41, 'users', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}', 'user', NULL, 1, 1, 5, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(42, 'users', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{\"relative\":true}', 1, 1, 6, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(43, 'users', 'first_name', NULL, 'input', '{\"placeholder\":\"Please enter your first name\"}', NULL, NULL, 0, 0, 7, 'half', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(44, 'users', 'last_name', NULL, 'input', '{\"placeholder\":\"Please enter your last name\"}', NULL, NULL, 0, 0, 8, 'half', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(45, 'users', 'username', NULL, 'input', '{\"placeholder\":\"username\",\"trim\":true}', 'raw', NULL, 0, 0, 10, 'full', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(46, 'users', 'password', 'hash', 'input-hash', NULL, NULL, NULL, 0, 0, 11, 'full', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(47, 'users', 'email', NULL, 'input', NULL, 'raw', NULL, 0, 0, 9, 'full', NULL, NULL, NULL, 1, NULL, '{\"_and\":[{\"email\":{\"_regex\":\"/^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\\\.[a-zA-Z0-9-]+)*$/\"}}]}', NULL),
(48, 'invoice', 'id', NULL, 'input', NULL, NULL, NULL, 1, 0, 1, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(49, 'invoice', 'user_created', 'user-created', 'select-dropdown-m2o', '{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}', 'user', NULL, 1, 0, 2, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(50, 'invoice', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{\"relative\":true}', 1, 0, 3, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(51, 'invoice', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}', 'user', NULL, 1, 1, 4, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(52, 'invoice', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{\"relative\":true}', 1, 1, 5, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(54, 'invoice_details', 'id', NULL, 'input', NULL, NULL, NULL, 1, 1, 1, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(55, 'invoice_details', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{\"relative\":true}', 1, 1, 2, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(62, 'invoice_details', 'invoice_id', 'm2o', 'select-dropdown-m2o', '{\"template\":\"{{id}}\"}', 'related-values', '{\"template\":\"{{id}}\"}', 0, 0, 3, 'full', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(63, 'medicine', 'manufacturer', 'm2o', 'select-dropdown-m2o', '{\"template\":\"{{name}}\"}', 'related-values', '{\"template\":\"{{name}}\"}', 0, 0, 12, 'half', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(64, 'invoice_details', 'quantity', NULL, 'input', '{\"min\":1}', NULL, NULL, 0, 0, 9, 'half', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(65, 'invoice_details', 'id', NULL, 'input', NULL, NULL, NULL, 1, 1, 1, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(66, 'invoice_details', 'status', NULL, 'select-dropdown', '{\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\"},{\"text\":\"$t:draft\",\"value\":\"draft\"},{\"text\":\"$t:archived\",\"value\":\"archived\"}]}', 'labels', '{\"showAsDot\":true,\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--primary)\"},{\"text\":\"$t:draft\",\"value\":\"draft\",\"foreground\":\"#18222F\",\"background\":\"#D3DAE4\"},{\"text\":\"$t:archived\",\"value\":\"archived\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--warning)\"}]}', 0, 1, 3, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(67, 'invoice_details', 'sort', NULL, 'input', NULL, NULL, NULL, 0, 1, 4, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(68, 'invoice_details', 'user_created', 'user-created', 'select-dropdown-m2o', '{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}', 'user', NULL, 1, 1, 5, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(69, 'invoice_details', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{\"relative\":true}', 1, 1, 5, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(70, 'invoice_details', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}', 'user', NULL, 1, 1, 6, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(71, 'invoice_details', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{\"relative\":true}', 1, 1, 7, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(73, 'invoice_details_inventory', 'id', NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(74, 'invoice_details_inventory', 'invoice_details_id', NULL, NULL, NULL, NULL, NULL, 0, 1, 2, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(75, 'invoice_details_inventory', 'inventory_id', NULL, NULL, NULL, NULL, NULL, 0, 1, 3, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(76, 'invoice_details', 'inventory_id', 'm2o', 'select-dropdown-m2o', '{\"template\":\"{{medicine_id.name}}\"}', NULL, NULL, 0, 0, 8, 'half', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(77, 'invoice', 'total', NULL, 'input', NULL, NULL, NULL, 1, 0, 6, 'full', NULL, NULL, NULL, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `directus_files`
--

CREATE TABLE `directus_files` (
  `id` char(36) NOT NULL,
  `storage` varchar(255) NOT NULL,
  `filename_disk` varchar(255) DEFAULT NULL,
  `filename_download` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `folder` char(36) DEFAULT NULL,
  `uploaded_by` char(36) DEFAULT NULL,
  `uploaded_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_by` char(36) DEFAULT NULL,
  `modified_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `charset` varchar(50) DEFAULT NULL,
  `filesize` bigint(20) DEFAULT NULL,
  `width` int(10) UNSIGNED DEFAULT NULL,
  `height` int(10) UNSIGNED DEFAULT NULL,
  `duration` int(10) UNSIGNED DEFAULT NULL,
  `embed` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_files`
--

INSERT INTO `directus_files` (`id`, `storage`, `filename_disk`, `filename_download`, `title`, `type`, `folder`, `uploaded_by`, `uploaded_on`, `modified_by`, `modified_on`, `charset`, `filesize`, `width`, `height`, `duration`, `embed`, `description`, `location`, `tags`, `metadata`) VALUES
('05dcf0be-d653-496f-a811-8ef3db2bc940', 'local', '05dcf0be-d653-496f-a811-8ef3db2bc940.jpg', 'L-Glutamine.jpg', 'L Glutamine', 'image/jpeg', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:24:20', NULL, '2023-08-14 18:24:20', NULL, 58785, 563, 1000, NULL, NULL, NULL, NULL, NULL, '{}'),
('0866bc19-4755-4468-bf92-cbbf5f1fb0cf', 'local', '0866bc19-4755-4468-bf92-cbbf5f1fb0cf.webp', 'Pulse-Oximeter.webp', 'Pulse Oximeter', 'image/webp', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:25:59', NULL, '2023-08-14 18:25:59', NULL, 70108, 1024, 1024, NULL, NULL, NULL, NULL, NULL, '{}'),
('0b79fb30-b133-414b-8333-0c2b53add917', 'local', '0b79fb30-b133-414b-8333-0c2b53add917.jpg', 'Nebulizer.jpg', 'Nebulizer', 'image/jpeg', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:25:45', NULL, '2023-08-14 18:25:45', NULL, 259121, 800, 800, NULL, NULL, NULL, NULL, NULL, '{}'),
('14de2148-08db-4636-9fd8-990fa22a2810', 'local', '14de2148-08db-4636-9fd8-990fa22a2810.webp', 'aspirin-500-mg-80-1.webp', NULL, 'image/webp', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-06 23:20:30', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-06 20:21:02', NULL, 54524, 980, 837, NULL, NULL, NULL, NULL, NULL, '{}'),
('19c1bd48-e353-4a92-8ba5-5b7c4edf8df7', 'local', '19c1bd48-e353-4a92-8ba5-5b7c4edf8df7.webp', 'Metformin.webp', 'Metformin', 'image/webp', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:23:25', NULL, '2023-08-14 18:23:25', NULL, 65404, 1000, 1000, NULL, NULL, NULL, NULL, NULL, '{}'),
('29d138a0-3200-45fd-8632-24558346266f', 'local', '29d138a0-3200-45fd-8632-24558346266f.webp', 'Acetaminophen.webp', 'Acetaminophen', 'image/webp', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:22:22', NULL, '2023-08-14 18:22:22', NULL, 12514, 600, 419, NULL, NULL, NULL, NULL, NULL, '{}'),
('3282057d-c9a4-45d7-b651-d794b8176909', 'local', '3282057d-c9a4-45d7-b651-d794b8176909.jpg', 'Multivitamin-Supplement.jpg', 'Multivitamin Supplement', 'image/jpeg', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:27:02', NULL, '2023-08-14 18:27:02', NULL, 140366, 1500, 1001, NULL, NULL, NULL, NULL, NULL, '{}'),
('40d742ab-87a9-426b-90a2-833ce22f496b', 'local', '40d742ab-87a9-426b-90a2-833ce22f496b.png', 'Delivery-man-handing-box.png', 'Delivery Man Handing Box', 'image/png', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-18 00:39:55', NULL, '2023-08-17 21:39:55', NULL, 1404067, 482, 720, NULL, NULL, NULL, NULL, NULL, '{}'),
('44960b98-7ac7-447b-8c7f-94afcc766791', 'local', '44960b98-7ac7-447b-8c7f-94afcc766791.jpg', 'Azithromycin.jpg', 'Azithromycin', 'image/jpeg', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:22:44', NULL, '2023-08-14 18:22:44', NULL, 76232, 1200, 1200, NULL, NULL, NULL, NULL, NULL, '{}'),
('5507e893-c36e-43cc-a8e3-9f6615a449df', 'local', '5507e893-c36e-43cc-a8e3-9f6615a449df.jpg', 'Vaginal-Lubricants.jpg', 'Vaginal Lubricants', 'image/jpeg', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:24:58', NULL, '2023-08-14 18:24:58', NULL, 83664, 1500, 1500, NULL, NULL, NULL, NULL, NULL, '{}'),
('5526a52e-8a6f-473a-bb5a-97abaa2bcabf', 'local', '5526a52e-8a6f-473a-bb5a-97abaa2bcabf.jpg', 'Blood-Pressure-Monitor.jpg', 'Blood Pressure Monitor', 'image/jpeg', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:25:09', NULL, '2023-08-14 18:25:09', NULL, 119073, 1000, 811, NULL, NULL, NULL, NULL, NULL, '{}'),
('58c3b77e-72ea-47f7-b705-93748112ca4b', 'local', '58c3b77e-72ea-47f7-b705-93748112ca4b.jpg', 'Diapers.jpg', 'Diapers', 'image/jpeg', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:26:09', NULL, '2023-08-14 18:26:09', NULL, 62180, 894, 729, NULL, NULL, NULL, NULL, NULL, '{}'),
('58c47569-3047-4f4f-922d-bf07d14776b0', 'local', '58c47569-3047-4f4f-922d-bf07d14776b0.jpg', 'Probiotic-Supplement.jpg', 'Probiotic Supplement', 'image/jpeg', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:27:22', NULL, '2023-08-14 18:27:22', NULL, 351504, 1707, 2560, NULL, NULL, NULL, NULL, NULL, '{}'),
('6336318f-24dd-4de1-a7ba-77476c722742', 'local', '6336318f-24dd-4de1-a7ba-77476c722742.jpg', 'Creatine-Monohydrate.jpg', 'Creatine Monohydrate', 'image/jpeg', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:24:08', NULL, '2023-08-14 18:24:08', NULL, 91332, 831, 1394, NULL, NULL, NULL, NULL, NULL, '{}'),
('696c6dc7-396d-4296-b86b-25152655d27d', 'local', '696c6dc7-396d-4296-b86b-25152655d27d.jpg', 'BCAA(Branched-Chain-Amino-Acids).jpg', 'Bcaa(branched Chain Amino Acids)', 'image/jpeg', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:23:58', NULL, '2023-08-14 18:23:58', NULL, 120925, 1463, 2139, NULL, NULL, NULL, NULL, NULL, '{}'),
('6f460008-d5df-45f2-bb3c-0ae9df007c65', 'local', '6f460008-d5df-45f2-bb3c-0ae9df007c65.jpg', 'Baby-Lotion.jpg', 'Baby Lotion', 'image/jpeg', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:26:43', NULL, '2023-08-14 18:26:43', NULL, 80383, 965, 1000, NULL, NULL, NULL, NULL, NULL, '{}'),
('7b33805a-e13d-4f93-9ff7-a0722fbb5fe0', 'local', '7b33805a-e13d-4f93-9ff7-a0722fbb5fe0.webp', 'Aspirin.webp', 'Aspirin', 'image/webp', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:21:48', NULL, '2023-08-14 18:21:48', NULL, 75078, 1000, 1000, NULL, NULL, NULL, NULL, NULL, '{}'),
('8a7d0355-1372-4402-9b3f-a61a39c50010', 'local', '8a7d0355-1372-4402-9b3f-a61a39c50010.jpg', 'Baby-Wipes.jpg', 'Baby Wipes', 'image/jpeg', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:07:50', NULL, '2023-08-14 18:07:51', NULL, 122310, 1000, 863, NULL, NULL, NULL, NULL, NULL, '{}'),
('8b66b7f5-06b5-4ab2-8995-832ce59506df', 'local', '8b66b7f5-06b5-4ab2-8995-832ce59506df.jpg', 'Whey-Protein-Powder.jpg', 'Whey Protein Powder', 'image/jpeg', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:23:36', NULL, '2023-08-14 18:23:36', NULL, 192203, 2400, 2400, NULL, NULL, NULL, NULL, NULL, '{}'),
('8c25136b-e369-4757-964b-e0b233282d4d', 'local', '8c25136b-e369-4757-964b-e0b233282d4d.jpg', 'Baby-Wipes.jpg', 'Baby Wipes', 'image/jpeg', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:26:20', NULL, '2023-08-14 18:26:21', NULL, 122310, 1000, 863, NULL, NULL, NULL, NULL, NULL, '{}'),
('94ad5188-4a83-45d3-9042-cfcd35d35972', 'local', '94ad5188-4a83-45d3-9042-cfcd35d35972.jpg', 'Omega-3-Fish-Oil.jpg', 'Omega 3 Fish Oil', 'image/jpeg', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:27:11', NULL, '2023-08-14 18:27:11', NULL, 245007, 1500, 1498, NULL, NULL, NULL, NULL, NULL, '{}'),
('a4f43d50-96b9-48ec-9c91-0da92409f801', 'local', 'a4f43d50-96b9-48ec-9c91-0da92409f801.jpg', 'Atorvastatin.jpg', 'Atorvastatin', 'image/jpeg', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:23:13', NULL, '2023-08-14 18:23:13', NULL, 195324, 2000, 1543, NULL, NULL, NULL, NULL, NULL, '{}'),
('a75dabab-dde7-4df6-a998-2562630fb4cd', 'local', 'a75dabab-dde7-4df6-a998-2562630fb4cd.webp', 'Menstrual-Pain-Relief-Medication.webp', 'Menstrual Pain Relief Medication', 'image/webp', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:24:47', NULL, '2023-08-14 18:24:47', NULL, 192212, 1300, 1300, NULL, NULL, NULL, NULL, NULL, '{}'),
('ad4e6aa5-a0e0-457d-ae74-d785fa118d16', 'local', 'ad4e6aa5-a0e0-457d-ae74-d785fa118d16.webp', 'Prenatal-Vitamins.webp', 'Prenatal Vitamins', 'image/webp', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:24:33', NULL, '2023-08-14 18:24:33', NULL, 108134, 1500, 1500, NULL, NULL, NULL, NULL, NULL, '{}'),
('b6b263c1-2cc2-4378-87ef-4614e563dda4', 'local', 'b6b263c1-2cc2-4378-87ef-4614e563dda4.jpg', 'top-view-pills-going-out-from-jar.jpg', 'Top View Pills Going out From Jar', 'image/jpeg', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-18 00:24:06', NULL, '2023-08-17 21:24:06', NULL, 859993, 1080, 1920, NULL, NULL, NULL, NULL, NULL, '{\"ifd0\":{\"Make\":\"RICOH IMAGING COMPANY, LTD.\",\"Model\":\"PENTAX K-1\"},\"exif\":{\"FNumber\":8,\"ExposureTime\":0.125,\"FocalLength\":50,\"ISO\":100}}'),
('ce7df504-8a59-4b7d-9dfe-2fa797d988e8', 'local', 'ce7df504-8a59-4b7d-9dfe-2fa797d988e8.webp', 'Thermometer.webp', 'Thermometer', 'image/webp', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:25:33', NULL, '2023-08-14 18:25:33', NULL, 16558, 800, 800, NULL, NULL, NULL, NULL, NULL, '{}'),
('d2725b5c-92db-4259-a083-d504d993548f', 'local', 'd2725b5c-92db-4259-a083-d504d993548f.png', 'drugs.png', 'Drugs', 'image/png', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-18 00:25:31', NULL, '2023-08-17 21:25:32', NULL, 27957, 512, 512, NULL, NULL, NULL, NULL, NULL, '{}'),
('df8bc962-8a57-4dbb-8994-edbe57a4e647', 'local', 'df8bc962-8a57-4dbb-8994-edbe57a4e647.jpg', 'Pre-Workout-Supplement.jpg', 'Pre Workout Supplement', 'image/jpeg', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:23:46', NULL, '2023-08-14 18:23:46', NULL, 172996, 1227, 1490, NULL, NULL, NULL, NULL, NULL, '{}'),
('e195b61c-86ff-466d-9d0f-64a5221c29bb', 'local', 'e195b61c-86ff-466d-9d0f-64a5221c29bb.png', 'a4f43d50-96b9-48ec-9c91-0da92409f801.png', 'A4f43d50 96b9 48ec 9c91 0da92409f801', 'image/png', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-15 01:54:59', NULL, '2023-08-14 22:55:00', NULL, 12363830, 2000, 1543, NULL, NULL, NULL, NULL, NULL, '{}'),
('e75ca208-62a7-45ff-a213-f20b09ab7b5a', 'local', 'e75ca208-62a7-45ff-a213-f20b09ab7b5a.jpg', 'Glucose-Meter.jpg', 'Glucose Meter', 'image/jpeg', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:25:21', NULL, '2023-08-14 18:25:21', NULL, 92243, 1000, 843, NULL, NULL, NULL, NULL, NULL, '{}'),
('f0f886a0-e8a1-4a36-bbee-83b6b1bf6fc7', 'local', 'f0f886a0-e8a1-4a36-bbee-83b6b1bf6fc7.webp', 'Baby-Shampoo.webp', 'Baby Shampoo', 'image/webp', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 20:28:56', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 17:37:49', NULL, 31996, 1024, 1024, NULL, NULL, NULL, NULL, NULL, '{}'),
('f52c0f45-457a-4eb9-93da-e9a35b380ba8', 'local', 'f52c0f45-457a-4eb9-93da-e9a35b380ba8.PNG', 'medicine-logo.PNG', 'Medicine Logo', 'image/png', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-18 00:23:16', NULL, '2023-08-17 21:23:16', NULL, 37731, 946, 369, NULL, NULL, NULL, NULL, NULL, '{}'),
('f5da7908-983b-4282-80c3-b272fba63aed', 'local', 'f5da7908-983b-4282-80c3-b272fba63aed.jpg', 'Amoxicillin.jpg', 'Amoxicillin', 'image/jpeg', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:22:31', NULL, '2023-08-14 18:22:31', NULL, 81055, 1600, 1159, NULL, NULL, NULL, NULL, NULL, '{\"ifd0\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 600D\"},\"exif\":{\"FNumber\":4.5,\"ExposureTime\":0.02,\"FocalLength\":29,\"ISO\":200}}'),
('f723dd61-b341-47b4-ad46-f93113568254', 'local', 'f723dd61-b341-47b4-ad46-f93113568254.webp', 'Lisinopril.webp', 'Lisinopril', 'image/webp', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:23:03', NULL, '2023-08-14 18:23:03', NULL, 21230, 500, 350, NULL, NULL, NULL, NULL, NULL, '{}'),
('f9fe4b8d-feeb-441e-95c0-3852d85ecbaf', 'local', 'f9fe4b8d-feeb-441e-95c0-3852d85ecbaf.webp', 'Baby-Shampoo.webp', 'Baby Shampoo', 'image/webp', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:26:31', NULL, '2023-08-14 18:26:31', NULL, 31996, 1024, 1024, NULL, NULL, NULL, NULL, NULL, '{}'),
('fd4a09c8-b4aa-4e86-83d9-58e4b4ac4495', 'local', 'fd4a09c8-b4aa-4e86-83d9-58e4b4ac4495.webp', 'Ibuprofen.webp', 'Ibuprofen', 'image/webp', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 21:22:07', NULL, '2023-08-14 18:22:07', NULL, 150804, 1300, 1300, NULL, NULL, NULL, NULL, NULL, '{}');

-- --------------------------------------------------------

--
-- Table structure for table `directus_flows`
--

CREATE TABLE `directus_flows` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `trigger` varchar(255) DEFAULT NULL,
  `accountability` varchar(255) DEFAULT 'all',
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `operation` char(36) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_created` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_flows`
--

INSERT INTO `directus_flows` (`id`, `name`, `icon`, `color`, `description`, `status`, `trigger`, `accountability`, `options`, `operation`, `date_created`, `user_created`) VALUES
('0179f919-ad29-4aaf-9d82-8f8ba4fe101b', 'update inventory', 'sell', NULL, 'whenever creating invoice update the quantity of the product', 'active', 'event', 'all', '{\"type\":\"filter\",\"scope\":[\"items.create\"],\"collections\":[\"invoice_details\"]}', '35fe6ab1-86b0-4395-90cf-810b6dbb8429', '2023-08-17 09:34:35', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('2b1d818a-987d-4cae-b90c-6dadebbfc9e1', 'invoice total update', 'azm', NULL, NULL, 'active', 'event', 'all', '{\"type\":\"action\",\"scope\":[\"items.create\"],\"collections\":[\"invoice_details\"]}', '909bc598-3b30-4da8-98ca-05718df9008c', '2023-08-17 16:51:52', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('455cb4d5-fdf0-4b1f-9a56-17ea2a01af9d', 'inventory price validation (update)', 'attach_money', NULL, NULL, 'active', 'event', 'all', '{\"type\":\"filter\",\"scope\":[\"items.update\"],\"collections\":[\"inventory\"]}', '72c6bc37-c618-4ae2-aa94-7ddfe0c47a91', '2023-08-17 09:17:42', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('4c9c9242-7ff6-4809-81d4-42e5f9ec3e15', 'skuQuery', 'bolt', NULL, NULL, 'active', 'operation', 'all', '{\"return\":\"$all\"}', '24221138-0527-4902-b2c4-a0f5f319349c', '2023-08-07 10:48:13', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('d44eae2a-cb04-4dfb-91f2-29c2eecc6bdb', 'inventory price validation (create)', 'attach_money', NULL, 'Validating that the selling price greater than buying price in inventory collection', 'active', 'event', 'all', '{\"type\":\"filter\",\"scope\":[\"items.create\"],\"collections\":[\"inventory\"],\"return\":\"\"}', '412d85c5-1f4d-45d2-a262-33ff94b116de', '2023-08-17 08:05:53', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('daf252a4-ec70-438d-bbe7-b636aed30314', 'resetingPassword', 'password', NULL, NULL, 'inactive', 'event', 'all', '{\"type\":\"action\",\"scope\":[\"items.create\"],\"collections\":[\"directus_users\"]}', '8e914903-c608-43d7-bc66-bea89d148e09', '2023-08-15 19:49:07', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('de8f45b1-f86b-4473-b27a-69ceef82f5ca', 'quantityLoop', 'bolt', NULL, NULL, 'active', 'event', 'all', '{\"type\":\"action\",\"scope\":[\"items.create\"],\"collections\":[\"inventory\"]}', 'f41f26f9-3856-413b-b042-f8370ca910fc', '2023-08-07 11:11:43', 'fe45593f-0841-49c6-8376-16c40b9de9e7');

-- --------------------------------------------------------

--
-- Table structure for table `directus_folders`
--

CREATE TABLE `directus_folders` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `directus_migrations`
--

CREATE TABLE `directus_migrations` (
  `version` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_migrations`
--

INSERT INTO `directus_migrations` (`version`, `name`, `timestamp`) VALUES
('20201028A', 'Remove Collection Foreign Keys', '2023-08-06 13:53:40'),
('20201029A', 'Remove System Relations', '2023-08-06 13:53:40'),
('20201029B', 'Remove System Collections', '2023-08-06 13:53:40'),
('20201029C', 'Remove System Fields', '2023-08-06 13:53:40'),
('20201105A', 'Add Cascade System Relations', '2023-08-06 13:54:03'),
('20201105B', 'Change Webhook URL Type', '2023-08-06 13:54:03'),
('20210225A', 'Add Relations Sort Field', '2023-08-06 13:54:04'),
('20210304A', 'Remove Locked Fields', '2023-08-06 13:54:04'),
('20210312A', 'Webhooks Collections Text', '2023-08-06 13:54:05'),
('20210331A', 'Add Refresh Interval', '2023-08-06 13:54:05'),
('20210415A', 'Make Filesize Nullable', '2023-08-06 13:54:06'),
('20210416A', 'Add Collections Accountability', '2023-08-06 13:54:06'),
('20210422A', 'Remove Files Interface', '2023-08-06 13:54:06'),
('20210506A', 'Rename Interfaces', '2023-08-06 13:54:07'),
('20210510A', 'Restructure Relations', '2023-08-06 13:54:10'),
('20210518A', 'Add Foreign Key Constraints', '2023-08-06 13:54:10'),
('20210519A', 'Add System Fk Triggers', '2023-08-06 13:54:23'),
('20210521A', 'Add Collections Icon Color', '2023-08-06 13:54:23'),
('20210525A', 'Add Insights', '2023-08-06 13:54:28'),
('20210608A', 'Add Deep Clone Config', '2023-08-06 13:54:28'),
('20210626A', 'Change Filesize Bigint', '2023-08-06 13:54:30'),
('20210716A', 'Add Conditions to Fields', '2023-08-06 13:54:31'),
('20210721A', 'Add Default Folder', '2023-08-06 13:54:33'),
('20210802A', 'Replace Groups', '2023-08-06 13:54:33'),
('20210803A', 'Add Required to Fields', '2023-08-06 13:54:33'),
('20210805A', 'Update Groups', '2023-08-06 13:54:33'),
('20210805B', 'Change Image Metadata Structure', '2023-08-06 13:54:33'),
('20210811A', 'Add Geometry Config', '2023-08-06 13:54:33'),
('20210831A', 'Remove Limit Column', '2023-08-06 13:54:34'),
('20210903A', 'Add Auth Provider', '2023-08-06 13:54:36'),
('20210907A', 'Webhooks Collections Not Null', '2023-08-06 13:54:36'),
('20210910A', 'Move Module Setup', '2023-08-06 13:54:37'),
('20210920A', 'Webhooks URL Not Null', '2023-08-06 13:54:37'),
('20210924A', 'Add Collection Organization', '2023-08-06 13:54:39'),
('20210927A', 'Replace Fields Group', '2023-08-06 13:54:41'),
('20210927B', 'Replace M2M Interface', '2023-08-06 13:54:41'),
('20210929A', 'Rename Login Action', '2023-08-06 13:54:41'),
('20211007A', 'Update Presets', '2023-08-06 13:54:42'),
('20211009A', 'Add Auth Data', '2023-08-06 13:54:42'),
('20211016A', 'Add Webhook Headers', '2023-08-06 13:54:42'),
('20211103A', 'Set Unique to User Token', '2023-08-06 13:54:42'),
('20211103B', 'Update Special Geometry', '2023-08-06 13:54:42'),
('20211104A', 'Remove Collections Listing', '2023-08-06 13:54:43'),
('20211118A', 'Add Notifications', '2023-08-06 13:54:46'),
('20211211A', 'Add Shares', '2023-08-06 13:54:52'),
('20211230A', 'Add Project Descriptor', '2023-08-06 13:54:52'),
('20220303A', 'Remove Default Project Color', '2023-08-06 13:54:53'),
('20220308A', 'Add Bookmark Icon and Color', '2023-08-06 13:54:53'),
('20220314A', 'Add Translation Strings', '2023-08-06 13:54:53'),
('20220322A', 'Rename Field Typecast Flags', '2023-08-06 13:54:53'),
('20220323A', 'Add Field Validation', '2023-08-06 13:54:53'),
('20220325A', 'Fix Typecast Flags', '2023-08-06 13:54:53'),
('20220325B', 'Add Default Language', '2023-08-06 13:54:54'),
('20220402A', 'Remove Default Value Panel Icon', '2023-08-06 13:54:54'),
('20220429A', 'Add Flows', '2023-08-06 13:55:02'),
('20220429B', 'Add Color to Insights Icon', '2023-08-06 13:55:03'),
('20220429C', 'Drop Non Null From IP of Activity', '2023-08-06 13:55:04'),
('20220429D', 'Drop Non Null From Sender of Notifications', '2023-08-06 13:55:05'),
('20220614A', 'Rename Hook Trigger to Event', '2023-08-06 13:55:06'),
('20220801A', 'Update Notifications Timestamp Column', '2023-08-06 13:55:07'),
('20220802A', 'Add Custom Aspect Ratios', '2023-08-06 13:55:07'),
('20220826A', 'Add Origin to Accountability', '2023-08-06 13:55:07'),
('20230401A', 'Update Material Icons', '2023-08-06 13:55:08'),
('20230525A', 'Add Preview Settings', '2023-08-06 13:55:09'),
('20230526A', 'Migrate Translation Strings', '2023-08-06 13:55:10'),
('20230721A', 'Require Shares Fields', '2023-08-06 13:55:13');

-- --------------------------------------------------------

--
-- Table structure for table `directus_notifications`
--

CREATE TABLE `directus_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(255) DEFAULT 'inbox',
  `recipient` char(36) NOT NULL,
  `sender` char(36) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `collection` varchar(64) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `directus_operations`
--

CREATE TABLE `directus_operations` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `key` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `position_x` int(11) NOT NULL,
  `position_y` int(11) NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `resolve` char(36) DEFAULT NULL,
  `reject` char(36) DEFAULT NULL,
  `flow` char(36) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_created` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_operations`
--

INSERT INTO `directus_operations` (`id`, `name`, `key`, `type`, `position_x`, `position_y`, `options`, `resolve`, `reject`, `flow`, `date_created`, `user_created`) VALUES
('03e73416-8731-4918-bd06-ef9d085bb813', 'Read invoice total', 'read_invoice_total', 'item-read', 35, 1, '{\"permissions\":\"$full\",\"collection\":\"invoice\",\"query\":{\"filter\":{\"id\":{\"_eq\":\"{{ $trigger.payload.invoice_id }}\"}}}}', 'e599dcfa-3a1a-47d7-a681-c52307b12572', NULL, '2b1d818a-987d-4cae-b90c-6dadebbfc9e1', '2023-08-17 17:01:24', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('23a0f2a2-a9ed-4343-8997-cba7f7d7e8c4', 'passToFlow', 'pass_to_flow', 'trigger', 17, 17, '{\"flow\":\"4c9c9242-7ff6-4809-81d4-42e5f9ec3e15\",\"payload\":\"{{ $last.arr }}\",\"batchSize\":20,\"iterationMode\":\"serial\"}', NULL, NULL, 'de8f45b1-f86b-4473-b27a-69ceef82f5ca', '2023-08-07 11:18:44', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('24221138-0527-4902-b2c4-a0f5f319349c', 'Create Data', 'item_create_wterc', 'item-create', 19, 1, '{\"collection\":\"medicine_sku\",\"payload\":{\"inventory_id\":\"{{ $trigger }}\"}}', NULL, NULL, '4c9c9242-7ff6-4809-81d4-42e5f9ec3e15', '2023-08-07 10:56:41', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('2c959397-28d8-4274-8656-5e9f68d28615', 'readSell', 'read_sell', 'exec', 34, 1, '{\"code\":\"module.exports = async function(data) {\\n    let sellPrice = 0;\\n    if(\\\"{{$trigger.payload.selling_price}}\\\" != \\\"undefined\\\") {\\n        sellPrice = \\\"{{$trigger.payload.selling_price}}\\\";\\n    } else {\\n        sellPrice = \\\"{{read_data[0].selling_price}}\\\";\\n    }\\n\\treturn {sellPrice};\\n}\"}', 'de288ab8-47c7-4fc5-9af5-971c6e6192dd', NULL, '455cb4d5-fdf0-4b1f-9a56-17ea2a01af9d', '2023-08-17 11:33:17', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('35fe6ab1-86b0-4395-90cf-810b6dbb8429', 'reading the inventoryID', 'reading_the_inventoryID', 'item-read', 18, 1, '{\"collection\":\"inventory\",\"query\":{\"filter\":{\"id\":{\"_eq\":\"{{ $trigger.payload.inventory_id }}\"}}},\"permissions\":\"$full\"}', 'd7840f4a-48fa-4eb2-b921-a193304143d8', NULL, '0179f919-ad29-4aaf-9d82-8f8ba4fe101b', '2023-08-17 09:56:21', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('3b78dbda-6721-4a98-b6d8-afbd00d25255', 'Run Script', 'exec_y33tn', 'exec', 37, 17, '{\"code\":\"module.exports = async function(data) {\\n    throw new Error(\\\"Selling price can\'t be less than buying price!\\\");\\n\\treturn {};\\n}\"}', NULL, NULL, 'd44eae2a-cb04-4dfb-91f2-29c2eecc6bdb', '2023-08-17 21:59:13', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('412d85c5-1f4d-45d2-a262-33ff94b116de', 'selling > buying', 'selling_buying', 'condition', 19, 1, '{\"filter\":{\"$trigger\":{\"payload\":{\"selling_price\":{\"_gt\":\"{{$trigger.payload.buying_price}}\"}}}}}', NULL, '3b78dbda-6721-4a98-b6d8-afbd00d25255', 'd44eae2a-cb04-4dfb-91f2-29c2eecc6bdb', '2023-08-17 08:10:35', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('72c6bc37-c618-4ae2-aa94-7ddfe0c47a91', 'Read Data', 'read_data', 'item-read', 18, 1, '{\"collection\":\"inventory\",\"query\":{\"filter\":{\"id\":{\"_eq\":\"{{ $trigger.keys[0] }}\"}}}}', '2c959397-28d8-4274-8656-5e9f68d28615', NULL, '455cb4d5-fdf0-4b1f-9a56-17ea2a01af9d', '2023-08-17 09:39:47', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('75886978-d15d-4244-94c4-75830371dad8', 'checking newQuantity', 'checking_newQuantity2', 'condition', 8, 18, '{\"filter\":{\"counting_newQuantity2\":{\"newQuantity\":{\"_gte\":0}}}}', 'a8658a6a-d010-4890-84f2-b4016544b8ae', '9884410f-204a-4b56-87eb-6baf78b2cc53', '0179f919-ad29-4aaf-9d82-8f8ba4fe101b', '2023-08-17 10:48:24', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('8e914903-c608-43d7-bc66-bea89d148e09', 'Email to new users', 'email_to_new_users', 'mail', 19, 1, '{\"to\":[\"{{$trigger.payload.email}}\"],\"subject\":\"Thanks for joining Medicine Store!\",\"body\":\"Hello {{$trigger.payload.first_name}}, \\nThank you for registering in our website, hope you enjoy! \"}', NULL, NULL, 'daf252a4-ec70-438d-bbe7-b636aed30314', '2023-08-15 19:54:15', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('909bc598-3b30-4da8-98ca-05718df9008c', 'Read inventory_selling_price', 'read_inventory_selling_price', 'item-read', 18, 1, '{\"permissions\":\"$full\",\"collection\":\"inventory\",\"query\":{\"filter\":{\"id\":{\"_eq\":\"{{ $trigger.payload.inventory_id }}\"}}}}', '03e73416-8731-4918-bd06-ef9d085bb813', NULL, '2b1d818a-987d-4cae-b90c-6dadebbfc9e1', '2023-08-17 16:55:09', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('9884410f-204a-4b56-87eb-6baf78b2cc53', 'errorMessage', 'exec_3cp5u', 'exec', 28, 33, '{\"code\":\"module.exports = async function(data) {\\n\\tthrow new Error(\'Insufficient quantity.\');\\n\\treturn {};\\n}\"}', NULL, NULL, '0179f919-ad29-4aaf-9d82-8f8ba4fe101b', '2023-08-17 22:11:51', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('a8658a6a-d010-4890-84f2-b4016544b8ae', 'updating value', 'updating_value2', 'item-update', 28, 17, '{\"collection\":\"inventory\",\"permissions\":\"$full\",\"payload\":{\"quantity\":\"{{ counting_newQuantity2.newQuantity }}\"},\"query\":{\"filter\":{\"id\":{\"_eq\":\"{{ $trigger.payload.inventory_id }}\"}}}}', NULL, NULL, '0179f919-ad29-4aaf-9d82-8f8ba4fe101b', '2023-08-17 10:02:40', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('c29cf20d-d0fa-4514-a78f-0fc09f31dc8f', 'showError', 'show_error', 'exec', 35, 17, '{\"code\":\"module.exports = async function(data) {\\n\\tthrow new Error(\\\"Selling price can\'t be less than buying price!\\\");\\n\\treturn {};\\n}\"}', NULL, NULL, '455cb4d5-fdf0-4b1f-9a56-17ea2a01af9d', '2023-08-17 22:31:14', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('c7938789-1647-41cf-86a1-bc3b16883ad0', 'update invoice total', 'update_invoice_total', 'item-update', 20, 17, '{\"collection\":\"invoice\",\"permissions\":\"$full\",\"query\":{\"filter\":{\"id\":{\"_eq\":\"{{ $trigger.payload.invoice_id }}\"}}},\"payload\":{\"total\":\"{{ updatedInvoiceTotal }}\"}}', NULL, NULL, '2b1d818a-987d-4cae-b90c-6dadebbfc9e1', '2023-08-17 17:21:00', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('d7840f4a-48fa-4eb2-b921-a193304143d8', 'counting newQuantity2', 'counting_newQuantity2', 'exec', 36, 1, '{\"code\":\"module.exports = async function(data) {\\n\\tlet newQuantity = \'{{ $last[0].quantity }}\' - \'{{ $trigger.payload.quantity }}\';\\n    return {newQuantity};\\n}\"}', '75886978-d15d-4244-94c4-75830371dad8', NULL, '0179f919-ad29-4aaf-9d82-8f8ba4fe101b', '2023-08-17 10:35:34', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('de288ab8-47c7-4fc5-9af5-971c6e6192dd', 'selling > buying', 'selling_buying', 'condition', 17, 17, '{\"filter\":{\"read_sell\":{\"sellPrice\":{\"_gt\":\"{{ read_data[0].buying_price }}\"}}}}', NULL, 'c29cf20d-d0fa-4514-a78f-0fc09f31dc8f', '455cb4d5-fdf0-4b1f-9a56-17ea2a01af9d', '2023-08-17 09:46:29', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('e599dcfa-3a1a-47d7-a681-c52307b12572', 'script', 'updatedInvoiceTotal', 'exec', 3, 17, '{\"code\":\"module.exports = async function(data) {\\n\\treturn parseInt(\\\"{{ read_invoice_total[0].total }}\\\") + parseInt((\\\"{{ read_inventory_selling_price[0].selling_price }}\\\" * \\\"{{ $trigger.payload.quantity }}\\\"));\\n}\"}', 'c7938789-1647-41cf-86a1-bc3b16883ad0', NULL, '2b1d818a-987d-4cae-b90c-6dadebbfc9e1', '2023-08-17 17:12:30', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('f41f26f9-3856-413b-b042-f8370ca910fc', 'arrayMaker', 'arrayMaker', 'exec', 19, 1, '{\"code\":\"module.exports = async function(data) {\\n\\tlet arr = []\\n    for (let i = 0; i < data.$trigger.payload.quantity; i++) {\\n        arr.push(\'{{ $trigger.key }}\');\\n    }\\n    return {arr}\\n}\"}', '23a0f2a2-a9ed-4343-8997-cba7f7d7e8c4', NULL, 'de8f45b1-f86b-4473-b27a-69ceef82f5ca', '2023-08-07 11:13:10', 'fe45593f-0841-49c6-8376-16c40b9de9e7');

-- --------------------------------------------------------

--
-- Table structure for table `directus_panels`
--

CREATE TABLE `directus_panels` (
  `id` char(36) NOT NULL,
  `dashboard` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `show_header` tinyint(1) NOT NULL DEFAULT 0,
  `note` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `position_x` int(11) NOT NULL,
  `position_y` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_created` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_panels`
--

INSERT INTO `directus_panels` (`id`, `dashboard`, `name`, `icon`, `color`, `show_header`, `note`, `type`, `position_x`, `position_y`, `width`, `height`, `options`, `date_created`, `user_created`) VALUES
('14700f66-a65c-4cfc-b424-08f0c51d5810', '552589f8-bd71-48b5-befe-c9c9065e8613', NULL, NULL, NULL, 0, NULL, 'label', 1, 1, 39, 6, '{\"text\":\"Statistics\",\"color\":\"#1495FF\"}', '2023-08-17 19:13:19', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('224f205c-9a2d-4863-80c9-8de491ef78b4', '552589f8-bd71-48b5-befe-c9c9065e8613', 'Registered users', 'supervised_user_circle', '#1495FF', 1, NULL, 'metric', 24, 25, 16, 6, '{\"collection\":\"directus_users\",\"sortField\":\"first_name\",\"function\":\"count\",\"field\":\"first_name\"}', '2023-08-17 19:52:20', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('2c69b234-2b34-46b0-a3da-5e04dfcccd34', '552589f8-bd71-48b5-befe-c9c9065e8613', 'Invoices total', 'attach_money', '#1495FF', 1, NULL, 'metric', 24, 7, 16, 6, '{\"collection\":\"invoice\",\"field\":\"total\",\"fn\":\"sum\",\"color\":\"#1495FF\",\"function\":\"sum\",\"sortField\":\"total\",\"prefix\":\"$\",\"conditionalFormatting\":null,\"filter\":null}', '2023-08-17 19:46:50', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('7e11eabe-96f4-4709-a23b-1aadd7192428', '552589f8-bd71-48b5-befe-c9c9065e8613', 'Sales', NULL, '#1495FF', 1, NULL, 'time-series', 1, 23, 23, 14, '{\"collection\":\"invoice\",\"group\":\"date_created\",\"xAxis\":\"total\",\"yAxis\":\"total\",\"color\":\"#1495FF\",\"field\":\"date_created\",\"dateField\":\"date_updated\",\"valueField\":\"total\",\"function\":\"sum\",\"range\":\"auto\",\"curveType\":\"straight\"}', '2023-08-17 20:59:03', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('8a795119-8992-42b9-8afd-c9aec82ae457', '552589f8-bd71-48b5-befe-c9c9065e8613', 'Products', 'add_shopping_cart', '#1495FF', 1, NULL, 'list', 1, 7, 23, 16, '{\"collection\":\"inventory\",\"sortField\":\"medicine_id\",\"sortDirection\":\"asc\",\"displayTemplate\":\"{{medicine_id.name}} ${{selling_price}} ({{quantity}})\",\"filter\":{\"_and\":[{\"quantity\":{\"_gt\":\"0\"}}]},\"limit\":null,\"linkToItem\":true}', '2023-08-17 19:18:46', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('a28a932f-2834-4f48-b822-399115cc3e9a', '552589f8-bd71-48b5-befe-c9c9065e8613', 'Products count', 'shopping_bag', '#1495FF', 1, NULL, 'metric', 24, 31, 16, 6, '{\"collection\":\"inventory\",\"sortField\":null,\"function\":\"countDistinct\",\"field\":\"id\"}', '2023-08-17 21:19:20', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('bad454cf-2fce-4259-aa59-e494e97cd141', '552589f8-bd71-48b5-befe-c9c9065e8613', 'Created invoices', 'payments', '#1495FF', 1, NULL, 'metric', 24, 13, 16, 6, '{\"collection\":\"invoice\",\"sortField\":\"id\",\"field\":\"id\",\"function\":\"count\",\"suffix\":null}', '2023-08-17 19:46:50', 'fe45593f-0841-49c6-8376-16c40b9de9e7'),
('c9d4606c-dd44-44a1-81d0-9b89e7b014d6', '552589f8-bd71-48b5-befe-c9c9065e8613', 'Items sold', 'sell', '#1495FF', 1, NULL, 'metric', 24, 19, 16, 6, '{\"collection\":\"invoice_details\",\"field\":\"quantity\",\"fn\":\"sum\",\"function\":\"sum\"}', '2023-08-17 19:46:50', 'fe45593f-0841-49c6-8376-16c40b9de9e7');

-- --------------------------------------------------------

--
-- Table structure for table `directus_permissions`
--

CREATE TABLE `directus_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `role` char(36) DEFAULT NULL,
  `collection` varchar(64) NOT NULL,
  `action` varchar(10) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `validation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`validation`)),
  `presets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`presets`)),
  `fields` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_permissions`
--

INSERT INTO `directus_permissions` (`id`, `role`, `collection`, `action`, `permissions`, `validation`, `presets`, `fields`) VALUES
(2, NULL, 'medicine', 'read', '{}', '{}', NULL, 'id,name,Category,unit,manufacturer,Type,category,type,image'),
(7, NULL, 'inventory', 'share', '{}', '{}', NULL, '*'),
(33, NULL, 'medicine_manufacturer', 'read', '{}', '{}', NULL, '*'),
(38, NULL, 'medicine_sku', 'read', '{}', '{}', NULL, '*'),
(42, NULL, 'users', 'create', '{}', '{}', NULL, '*'),
(43, NULL, 'users', 'read', '{}', '{}', NULL, '*'),
(44, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_files', 'create', '{}', NULL, NULL, '*'),
(45, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_files', 'read', '{}', NULL, NULL, '*'),
(46, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_files', 'update', '{}', NULL, NULL, '*'),
(47, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_files', 'delete', '{}', NULL, NULL, '*'),
(48, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_dashboards', 'create', '{}', NULL, NULL, '*'),
(49, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_dashboards', 'read', '{}', NULL, NULL, '*'),
(50, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_dashboards', 'update', '{}', NULL, NULL, '*'),
(51, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_dashboards', 'delete', '{}', NULL, NULL, '*'),
(52, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_panels', 'create', '{}', NULL, NULL, '*'),
(53, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_panels', 'read', '{}', NULL, NULL, '*'),
(54, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_panels', 'update', '{}', NULL, NULL, '*'),
(55, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_panels', 'delete', '{}', NULL, NULL, '*'),
(56, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_folders', 'create', '{}', NULL, NULL, '*'),
(57, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_folders', 'read', '{}', NULL, NULL, '*'),
(58, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_folders', 'update', '{}', NULL, NULL, '*'),
(59, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_folders', 'delete', '{}', NULL, NULL, NULL),
(60, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_users', 'read', '{}', '{}', NULL, '*'),
(61, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_users', 'update', '{}', '{}', NULL, '*'),
(62, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_roles', 'read', '{}', NULL, NULL, '*'),
(63, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_shares', 'read', '{\"_or\":[{\"role\":{\"_eq\":\"$CURRENT_ROLE\"}},{\"role\":{\"_null\":true}}]}', NULL, NULL, '*'),
(64, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_shares', 'create', '{}', NULL, NULL, '*'),
(65, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_shares', 'update', '{\"user_created\":{\"_eq\":\"$CURRENT_USER\"}}', NULL, NULL, '*'),
(66, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_shares', 'delete', '{\"user_created\":{\"_eq\":\"$CURRENT_USER\"}}', NULL, NULL, '*'),
(67, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_flows', 'read', '{}', '{}', NULL, '*'),
(78, NULL, 'directus_files', 'read', '{}', '{}', NULL, '*'),
(79, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'invoice', 'create', '{}', '{}', NULL, '*'),
(80, NULL, 'inventory', 'read', NULL, NULL, NULL, 'medicine_id,quantity,selling_price,expiration_date,id'),
(81, NULL, 'directus_users', 'create', '{}', '{}', NULL, '*'),
(82, NULL, 'directus_users', 'read', '{}', '{}', NULL, '*'),
(83, NULL, 'directus_users', 'update', '{}', NULL, NULL, 'first_name,last_name,email,password,avatar,location,title,description,preferences_divider,language,theme,tfa_secret,email_notifications,admin_divider,status,role,token,id,last_page,last_access,provider,external_identifier,auth_data'),
(84, NULL, 'directus_users', 'share', '{}', '{}', NULL, '*'),
(86, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'invoice', 'read', '{\"_and\":[{\"user_created\":{\"_eq\":\"$CURRENT_USER\"}}]}', '{}', NULL, '*'),
(95, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_users', 'create', '{}', '{}', NULL, '*'),
(96, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_users', 'delete', '{}', '{}', NULL, '*'),
(97, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_users', 'share', '{}', '{}', NULL, '*'),
(98, NULL, 'manufacturer', 'read', '{}', '{}', NULL, '*'),
(103, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_flows', 'create', '{}', '{}', NULL, '*'),
(104, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_flows', 'update', '{}', '{}', NULL, '*'),
(105, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_flows', 'delete', '{}', '{}', NULL, '*'),
(106, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'directus_flows', 'share', '{}', '{}', NULL, '*'),
(128, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'invoice_details', 'create', '{}', '{}', NULL, '*'),
(129, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'invoice_details', 'read', '{}', '{}', NULL, '*'),
(130, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'invoice_details', 'share', '{\"_and\":[{\"user_created\":{\"_eq\":\"$CURRENT_USER\"}}]}', '{}', NULL, '*'),
(131, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'invoice_details', 'update', '{\"_and\":[{\"user_created\":{\"_eq\":\"$CURRENT_USER\"}}]}', '{}', NULL, '*'),
(132, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'invoice_details', 'delete', '{\"_and\":[{\"user_created\":{\"_eq\":\"$CURRENT_USER\"}}]}', '{}', NULL, '*'),
(133, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'invoice', 'delete', '{\"_and\":[{\"user_created\":{\"_eq\":\"$CURRENT_USER\"}}]}', NULL, NULL, NULL),
(134, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'invoice', 'update', '{\"_and\":[{\"user_created\":{\"_eq\":\"$CURRENT_USER\"}}]}', NULL, NULL, NULL),
(135, '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'invoice', 'share', '{\"_and\":[{\"user_created\":{\"_eq\":\"$CURRENT_USER\"}}]}', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `directus_presets`
--

CREATE TABLE `directus_presets` (
  `id` int(10) UNSIGNED NOT NULL,
  `bookmark` varchar(255) DEFAULT NULL,
  `user` char(36) DEFAULT NULL,
  `role` char(36) DEFAULT NULL,
  `collection` varchar(64) DEFAULT NULL,
  `search` varchar(100) DEFAULT NULL,
  `layout` varchar(100) DEFAULT 'tabular',
  `layout_query` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`layout_query`)),
  `layout_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`layout_options`)),
  `refresh_interval` int(11) DEFAULT NULL,
  `filter` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`filter`)),
  `icon` varchar(30) DEFAULT 'bookmark',
  `color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_presets`
--

INSERT INTO `directus_presets` (`id`, `bookmark`, `user`, `role`, `collection`, `search`, `layout`, `layout_query`, `layout_options`, `refresh_interval`, `filter`, `icon`, `color`) VALUES
(1, NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', NULL, 'directus_users', NULL, 'cards', '{\"cards\":{\"sort\":[\"email\"],\"limit\":25,\"page\":1}}', '{\"cards\":{\"icon\":\"account_circle\",\"title\":\"{{ first_name }} {{ last_name }}\",\"subtitle\":\"{{ email }}\",\"size\":4}}', NULL, NULL, 'bookmark', NULL),
(2, NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', NULL, 'directus_files', NULL, 'cards', '{\"cards\":{\"sort\":[\"-uploaded_on\"],\"limit\":25,\"page\":1}}', '{\"cards\":{\"icon\":\"insert_drive_file\",\"title\":\"{{ title }}\",\"subtitle\":\"{{ type }} • {{ filesize }}\",\"size\":2,\"imageFit\":\"crop\"}}', NULL, NULL, 'bookmark', NULL),
(3, NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', NULL, 'medicine', '', NULL, '{\"tabular\":{\"page\":1,\"limit\":25}}', NULL, NULL, NULL, 'bookmark', NULL),
(4, NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', NULL, 'inventory', '', NULL, '{\"tabular\":{\"page\":1,\"limit\":25,\"fields\":[\"purchase_date\",\"id\",\"medicine_id\",\"medicine_id.name\",\"quantity\",\"buying_price\",\"selling_price\"],\"sort\":[\"-purchase_date\"]}}', '{\"tabular\":{\"widths\":{\"id\":184.00003051757812,\"quantity\":113.66668701171875,\"buying_price\":146.4444580078125,\"selling_price\":133.3333740234375}}}', NULL, NULL, 'bookmark', NULL),
(5, NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', NULL, 'manufacturer', NULL, 'tabular', '{\"tabular\":{\"page\":1,\"limit\":25,\"fields\":[\"id\",\"name\",\"address\",\"phone\"]},\"cards\":{\"limit\":25}}', '{\"calendar\":{\"viewInfo\":{\"type\":\"dayGridMonth\",\"startDateStr\":\"2023-08-01T00:00:00+03:00\"}},\"tabular\":{\"widths\":{}}}', NULL, NULL, 'bookmark', NULL),
(6, NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', NULL, 'directus_presets', NULL, NULL, '{\"tabular\":{\"limit\":25}}', NULL, NULL, NULL, 'bookmark', NULL),
(7, NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', NULL, 'directus_translations', NULL, NULL, '{\"tabular\":{\"limit\":25}}', NULL, NULL, NULL, 'bookmark', NULL),
(8, NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', NULL, 'invoice', NULL, 'tabular', '{\"tabular\":{\"page\":1,\"limit\":500,\"fields\":[\"id\",\"date_created\",\"user_created\",\"total\"],\"sort\":[\"-id\"]}}', '{\"tabular\":{\"widths\":{}}}', NULL, NULL, 'bookmark', NULL),
(9, NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', NULL, 'medicine_sku', NULL, NULL, '{\"tabular\":{\"page\":1,\"limit\":1000,\"fields\":[\"SKU\",\"inventory_id\"]}}', '{\"tabular\":{\"widths\":{\"SKU\":365.33331298828125,\"inventory_id\":422.22222900390625}}}', NULL, NULL, 'bookmark', NULL),
(10, NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', NULL, 'medicine_manufacturer', NULL, NULL, '{\"tabular\":{\"page\":1,\"limit\":25}}', NULL, NULL, NULL, 'bookmark', NULL),
(11, NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', NULL, 'directus_webhooks', NULL, 'tabular', '{\"tabular\":{\"fields\":[\"status\",\"method\",\"name\",\"collections\",\"actions\"],\"limit\":25}}', '{\"tabular\":{\"widths\":{\"status\":32,\"method\":100,\"name\":210,\"collections\":240,\"actions\":210}}}', NULL, NULL, 'bookmark', NULL),
(12, NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', NULL, 'directus_activity', NULL, 'tabular', '{\"tabular\":{\"sort\":[\"timestamp\"],\"fields\":[\"action\",\"collection\",\"timestamp\",\"user\"],\"limit\":25,\"page\":1}}', '{\"tabular\":{\"widths\":{\"action\":100,\"collection\":210,\"timestamp\":240,\"user\":240}}}', NULL, NULL, 'bookmark', NULL),
(13, NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', NULL, 'manufacturer', NULL, 'tabular', '{\"tabular\":{\"page\":1,\"limit\":25,\"fields\":[\"id\",\"name\",\"address\",\"phone\"]},\"cards\":{\"limit\":25}}', '{\"calendar\":{\"viewInfo\":{\"type\":\"dayGridMonth\",\"startDateStr\":\"2023-08-01T00:00:00+03:00\"}},\"tabular\":{\"widths\":{}}}', NULL, NULL, 'bookmark', NULL),
(14, NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', NULL, 'users', NULL, NULL, '{\"tabular\":{\"limit\":25,\"fields\":[\"first_name\",\"last_name\",\"username\",\"email\"],\"page\":1}}', '{\"tabular\":{\"widths\":{\"password\":163}}}', NULL, NULL, 'bookmark', NULL),
(15, NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', NULL, 'invoice', NULL, 'tabular', '{\"tabular\":{\"page\":1,\"limit\":500,\"fields\":[\"id\",\"date_created\",\"user_created\"],\"sort\":[\"-id\"]}}', '{\"tabular\":{\"widths\":{}}}', NULL, NULL, 'bookmark', NULL),
(16, NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', NULL, 'invoice', NULL, 'tabular', '{\"tabular\":{\"page\":1,\"limit\":25,\"fields\":[\"id\",\"date_created\",\"user_created\"]}}', '{\"tabular\":{\"widths\":{}}}', NULL, NULL, 'bookmark', NULL),
(17, NULL, '818db100-445b-49ce-95cb-96dac7b49f08', NULL, 'directus_users', NULL, 'cards', '{\"cards\":{\"sort\":[\"email\"],\"limit\":25}}', '{\"cards\":{\"icon\":\"account_circle\",\"title\":\"{{ first_name }} {{ last_name }}\",\"subtitle\":\"{{ email }}\",\"size\":4}}', NULL, NULL, 'bookmark', NULL),
(18, NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', NULL, 'inventory', '', NULL, '{\"tabular\":{\"page\":1,\"limit\":25,\"fields\":[\"purchase_date\",\"id\",\"medicine_id\",\"medicine_id.name\",\"quantity\",\"buying_price\",\"selling_price\"],\"sort\":[\"-purchase_date\"]}}', '{\"tabular\":{\"widths\":{\"id\":184.00003051757812,\"quantity\":113.66668701171875,\"buying_price\":146.4444580078125,\"selling_price\":133.3333740234375}}}', NULL, NULL, 'bookmark', NULL),
(19, NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', NULL, 'manufacturer', NULL, 'tabular', '{\"tabular\":{\"page\":1,\"limit\":25,\"fields\":[\"id\",\"name\",\"address\",\"phone\"]},\"cards\":{\"limit\":25}}', '{\"calendar\":{\"viewInfo\":{\"type\":\"dayGridMonth\",\"startDateStr\":\"2023-08-01T00:00:00+03:00\"}},\"tabular\":{\"widths\":{}}}', NULL, NULL, 'bookmark', NULL),
(20, NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', NULL, 'inventory', '', NULL, '{\"tabular\":{\"page\":1,\"limit\":25,\"fields\":[\"purchase_date\",\"id\",\"medicine_id\",\"medicine_id.name\",\"quantity\",\"buying_price\",\"selling_price\"],\"sort\":[\"-purchase_date\"]}}', '{\"tabular\":{\"widths\":{\"id\":184.00003051757812,\"quantity\":113.66668701171875,\"buying_price\":146.4444580078125,\"selling_price\":133.3333740234375}}}', NULL, NULL, 'bookmark', NULL),
(21, NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', NULL, 'medicine', '', NULL, '{\"tabular\":{\"page\":1,\"limit\":25}}', NULL, NULL, NULL, 'bookmark', NULL),
(22, NULL, '818db100-445b-49ce-95cb-96dac7b49f08', NULL, 'invoice', NULL, NULL, '{\"tabular\":{\"limit\":25}}', NULL, NULL, NULL, 'bookmark', NULL),
(23, NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', NULL, 'invoice_details', NULL, NULL, '{\"tabular\":{\"page\":1,\"limit\":25}}', NULL, NULL, NULL, 'bookmark', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `directus_relations`
--

CREATE TABLE `directus_relations` (
  `id` int(10) UNSIGNED NOT NULL,
  `many_collection` varchar(64) NOT NULL,
  `many_field` varchar(64) NOT NULL,
  `one_collection` varchar(64) DEFAULT NULL,
  `one_field` varchar(64) DEFAULT NULL,
  `one_collection_field` varchar(64) DEFAULT NULL,
  `one_allowed_collections` text DEFAULT NULL,
  `junction_field` varchar(64) DEFAULT NULL,
  `sort_field` varchar(64) DEFAULT NULL,
  `one_deselect_action` varchar(255) NOT NULL DEFAULT 'nullify'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_relations`
--

INSERT INTO `directus_relations` (`id`, `many_collection`, `many_field`, `one_collection`, `one_field`, `one_collection_field`, `one_allowed_collections`, `junction_field`, `sort_field`, `one_deselect_action`) VALUES
(1, 'medicine', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
(2, 'medicine', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
(3, 'manufacturer', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
(4, 'manufacturer', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
(5, 'medicine_manufacturer', 'manufacturer_id', 'manufacturer', NULL, NULL, NULL, 'medicine_id', NULL, 'nullify'),
(6, 'medicine_manufacturer', 'medicine_id', 'medicine', NULL, NULL, NULL, 'manufacturer_id', NULL, 'nullify'),
(7, 'medicine', 'image', 'directus_files', NULL, NULL, NULL, NULL, NULL, 'nullify'),
(8, 'inventory', 'medicine_id', 'medicine', 'inventory_id', NULL, NULL, NULL, NULL, 'nullify'),
(9, 'medicine_sku', 'inventory_id', 'inventory', NULL, NULL, NULL, NULL, NULL, 'nullify'),
(10, 'users', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
(11, 'users', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
(12, 'invoice', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
(13, 'invoice', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
(18, 'invoice_details', 'invoice_id', 'invoice', NULL, NULL, NULL, NULL, NULL, 'nullify'),
(19, 'medicine', 'manufacturer', 'manufacturer', NULL, NULL, NULL, NULL, NULL, 'nullify'),
(20, 'invoice_details', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
(21, 'invoice_details', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
(22, 'invoice_details_inventory', 'inventory_id', 'inventory', NULL, NULL, NULL, 'invoice_details_id', NULL, 'nullify'),
(23, 'invoice_details_inventory', 'invoice_details_id', 'invoice_details', NULL, NULL, NULL, 'inventory_id', NULL, 'nullify'),
(24, 'invoice_details', 'inventory_id', 'inventory', NULL, NULL, NULL, NULL, NULL, 'nullify');

-- --------------------------------------------------------

--
-- Table structure for table `directus_revisions`
--

CREATE TABLE `directus_revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `activity` int(10) UNSIGNED NOT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `delta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`delta`)),
  `parent` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `directus_roles`
--

CREATE TABLE `directus_roles` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `icon` varchar(30) NOT NULL DEFAULT 'supervised_user_circle',
  `description` text DEFAULT NULL,
  `ip_access` text DEFAULT NULL,
  `enforce_tfa` tinyint(1) NOT NULL DEFAULT 0,
  `admin_access` tinyint(1) NOT NULL DEFAULT 0,
  `app_access` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_roles`
--

INSERT INTO `directus_roles` (`id`, `name`, `icon`, `description`, `ip_access`, `enforce_tfa`, `admin_access`, `app_access`) VALUES
('266159c1-2263-4ab6-bde7-a315afc0a9e3', 'Administrator', 'verified', '$t:admin_description', NULL, 0, 1, 1),
('561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'Users', 'supervised_user_circle', NULL, NULL, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `directus_sessions`
--

CREATE TABLE `directus_sessions` (
  `token` varchar(64) NOT NULL,
  `user` char(36) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ip` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `share` char(36) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_sessions`
--

INSERT INTO `directus_sessions` (`token`, `user`, `expires`, `ip`, `user_agent`, `share`, `origin`) VALUES
('-dVbsvxozK5FQe0cs6XKkVHAU7cOmDRQu9wfoyCXM9VCGeMCX5DJw3F23rXzyB1W', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-23 10:03:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('04ejYGvL8JR4EgQI-wPVE1unHq58ZNA1dTrIO0PSlc4jMeRhcAh86hVhxjglQDWt', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 12:29:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('0MIhtoVagAWh0Xoeq-zHbrLDn0KLoLTunjOv5BYIi7_E6u-2Y8CXk0yrPHpkyaPW', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:09:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('1lz-2Da9KJIFHDLOJHjm_6GKdCmBZWCYfI8jZouTdWNJrv2ttwL8LlV_tEef57QE', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-23 10:17:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('1Z74BOm3kssqg16ZkTfrUzx2Ja2FWnOwH-esXDMktoHvMlaoIizKxZi0PToXH53l', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:07:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('2-5XvwjdRLaGQCEDJz_ARk2L1h9AcY-O-s9zb_BhMwHyyop-scoIBlrMCgKvHg11', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-23 13:59:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('40vtRiTpZEY6QMTw_rnfVLYtW8Gmytz6SGLF_-YopwK23492EGpF_1Pm4JeY_YNS', '6ecc87ce-7353-478d-bc26-f2080f22be85', '2023-08-24 00:30:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('5Hb5kGKgRthtMgyvKxndjfClNdvw-YvRg5l7QZhfjtSIBOtt-3D8WVc7hwTYlXYR', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-23 19:05:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('6L3OhH8rpyFbvJ0GyAliS4bZIZfODUQColz8NQJEIdHpBEHW3r9GEBGzr9B1ekR0', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-23 10:12:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('76QX9M0kLEUwu4ckscO-NdNYHOI8YZ1hbKFHwl9O-TzFOH2QWjVBZoHGeqRlBP5r', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:16:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('7kfdoptJ8mHYg_WXjC675gtzvEVDlznToqbB5Gge-M_13kWewtdrkJvUMDmwPKcw', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:15:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('8iMYKsl8zqvAO3GNT1bAC4BSemAG1-YKM_UksBlFFbu1Z3FxvfewE_z3Wf56bohO', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:19:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('AOxeeHy7UK9kQLeBf_7dZnuXYDNbvUHLIQeivJw7H4H8VbBalDEHygMF0Vemxn2s', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-23 14:17:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('Ay4k2N5SPTuFdL7uvB8Sp2wQqTvBFwEeWbe_xYc2vHmhZEUHk-dQtIr_Ovsb14tG', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:06:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('brqxIWyi9M6gsRa84HA66LwqPjt0OHaYBxhOh_zFaI7iDS3TSKjBKCRP2mxJ7uUs', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-24 00:07:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('BshIX7FSHYD7LxUybci4-nC_e1aeWJ1_geg9BDaDg802tUQgYO2Oa_L0YVBN6LNX', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-22 10:02:31', '127.0.0.1', 'PostmanRuntime/7.32.3', NULL, NULL),
('byMIYGVz5pGQiOjH2A2WtulJg535nXA7hlNLBD4Ao5wcZJR6kXaiFm_fETCrVbfn', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:58:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('CDzGUUvUr-4gDJGnoIRQJJ-C5XBPQteAW1TbBXIxaQmZhS10E-4m6cMj-z9yhTsy', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-23 10:11:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('CRTW2NfUXQnDgGtk3Pxcdg-3clo267pwJf1vKhuA3Cgo2FtUGxTlzcgn_mHkEkLU', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 20:36:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('cVMfD1-HvmP2ix1leHG6URVkTe9OjpOYbxuV2j3RikFG1xvWhmf9IYjUIOYXE3oA', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-23 10:20:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('CzXmiTnjCEjZcTKvnnsIdsPYMqw-JsK1fJDV8CWJXRQxe8aawxt_1M-rovqZS4yw', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:08:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('daEGYcqd2q7kbW37m0yKHS7iEQhe4xNofFuG8vPVYEUmcSxOrL5g8exsYsY47m8A', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-22 10:48:23', '127.0.0.1', 'PostmanRuntime/7.32.3', NULL, NULL),
('DrBtn-VrTCRn61dzJLB8dIXR_mALaNnI0Whswfesyrzn5sQn3iQRuRZb54O_9T9r', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-22 14:03:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('dRvqz3p4y_iNX6dQhZx5Top9hVUeBOtxdPjjjj-eKe_YqX-tEAN9Tw5Tr2q_gX89', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:19:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('E9vXD4MFJONJBiGikbcoUxNwBIiIy8P2_a7baFMYD_QkX123Ndg6veyECSZSSItD', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-23 14:22:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('eZ8rHliUWzxmgKDoruwglketTKnLnsQbmWjJFzqOnWXkEN0NgB7oe6JC2ishfyJ6', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:19:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('ffATJYq2eJuRJzk91PxiyPVO4g3-JxlnVeFNCwOiGWIuNi69OJNOtdEL1JaM1Sm5', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:09:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('FVU08lRcTmidIektSXezfev7DOIKpfhm5Efm8PDuC7D0fZb87dwoygJXrq0yynFj', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-22 20:35:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('gq6W3ibJTCWf7Q1yHF5nKByc2jWMfHeiYCQOd6Qs2qoeQbjwO7G5rGPQhqiosPao', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-22 14:04:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('gvbmRZd0wfjZ9N-dbTu4sWeYeiFrqA6IWGMQk7ZKparpgdSh1wOQqUrgblnEpgP7', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:19:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('J66YyXi-RXuk4rbjtBQ-TQ8kDONlTvSiWW-xoCZ56GhaSFx2V8JBjzJy4Y7Z0A0U', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-22 14:04:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('jECU1mJVTeE_sDGk3k4T9uKdUROwNO_o5NVC20Ipm309_Cdie65_bzqHcXZcPVAS', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-23 10:08:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('K6ia4cBWe5cI5Mq-5pDwLnVGuGgOkWusxROKH2BJClcWBxGLCMeI-IdwIdczdAw7', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-23 22:26:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'http://localhost:8055'),
('kmQPCA6QGOKnsO9Klc43eO5_sdWFIqK0t3QTpmIbpue9IYBbJxD2sQ-WLXAGUTBO', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 12:22:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('koc_5J_HEkj9FRpiB2y1j_OeBcqcoXZvTyfqkQTHWRrP5nPvxjD9WoF2CJB8M3Jc', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-24 00:22:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('lcZQvjeULOgR7ZIs-11x1Qo0znTma15ce94Y2rpExn3mG0BoBUDYjFjqpPmi9KHX', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-23 14:41:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('m0a6-8j4sBZmLd7w9n5_LMxfDivB-n-YTQzzLBOBFU7n3ONN-V5jlZN5On-v89dg', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:14:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('mE8vDbIy5LU3CEPmlJV02PTdJSYGjyDcjhKPCg6CrWkvDRZaAr0l_D_mkBgce0tk', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 12:03:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('MpZjOy8GHtOgjgTQ0-FcDUf12rBQfP9nqVzrvHRlAoa3HzDaNRpApPr_lvuS06A4', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:08:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('n5iQed0-gq5X2eOhQspXixzb_7jjdVUHMM7735CHFlYv4MRIJmlg3zWhbjwMWssq', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:19:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('NkmcQqeMEMv7rWrPVCA7lSoLiRAW2Q_be_romJBOQBLonhQF10e-oqBDmk2Vv-6s', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:19:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('NsKlXDNt9f4cc3CcnZkt_BzwjvOkh6aqBBfTbWfudBonKavGhQ_JDOum3Ire4kXf', '6ecc87ce-7353-478d-bc26-f2080f22be85', '2023-08-23 09:43:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('o5eqyMvPT9LijjKHpBdAJNShQVGcSiSYh-tTg1HcoORraG9py31ho8BZrN1ROpi_', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 12:21:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('O8GflCGnT-L54SR0iyPNJkrNJwvA6nCM53sYf_OD4xP3lIjzWCfEAAFoWSeQEaXA', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-22 13:58:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('ouiwsAhwX33vlkBGMEFn2PeOZx2YjzohyT__8BnBIH5To66jh19vvWlpTkbthBzI', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:03:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('p6T1uJLyYbC0QL4R5YUdDBHPeVPxdlfhRfS3kIS4aXSuvWs57k8r_KIXLPAAglFR', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:15:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('pEII6q8KJlq8kYl0ktJG1v6Xw7e17GisVRXBU6iWe02OSTTHcF4rwtCbjW23-qDu', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:19:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('QgD3U94Hcvd2_auGEEi-Uoz1UOVZt3-QI79M9XojY9maoqoyVcvYD8fz3iLpPd0o', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:14:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('qrLFLTauMv0OSL_lF08DJba0m9gYj5BhmavWe8Ai6HZ3MG6vywr1rC5LMeT-FT0T', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-22 14:03:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('R-d_m_JpOJbLQRMuz7WbGAMTEU16SYk-hamf4AGHAwc1yOVPVLaHGJft8eEGkWKT', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:06:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('r4Rx0G0oN-DeloexKVujUD8U27_CPG59WUXXGwHWB_3zuJGgJTPThMIAISnNr5sZ', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-23 10:12:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('rAaI4J5S2XcDcMWz7aZxaUtbYoTulv85ClXELIAUHabFgJ54MYGsk26jXD7DQWmN', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-24 19:38:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('rdZcR5Gcp89Yjzgu5b5C1pqkRwSSUCmves2U1-wLrA7ywXsS-4wxWlPqi2SZFkBV', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-22 13:25:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('rWXJf57DcbPKZ3waPGzpCMvYTL-9kl2o4JZCR2nRoLy3y0XmT8dKUxwp_FvMOcun', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:19:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('S8hV-cX96uxsXy5EsWKPAy_p1BBQrlFbDGxRewkATJalydfyUuXCtsQfNbxOzDzb', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-23 10:19:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('ScIYI86nFSLUUWS0Wx3YmUmpdkDiJX3R4Wy01cc6nk_f5D37JnPr1CdDQ9Uh7rZ8', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-23 10:10:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('SEUep1Qt6t_D9tUVpICKxtHscUH_dfmTXa4JY4XJmlv9HVuhrUxmv6SEDs7eBl_N', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-24 15:35:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('SQAzKE7DND7bWsQZU1QuejH4hfVngP6uKf5elW0h7Addnql6QILibp3ml8sOoEtZ', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:15:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('T1BKdnARYoj-beDWUQjooueIHXeXKnz1nTCzS3dCBSYKPTkwPt5RWb5GZzkpmcL2', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-25 01:16:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('tev2j8lDDMSHBPK4cR8fLoY-muF3R0wAz3ukOC-31ZndGbsbJHbPogTWqBrVGHAD', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-24 08:52:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('tq4vrVnjV1NjFMnpKVaQ7A4YB20FL_AkiKct-vHGgy02hwnWUo2mjrIwAuIr6JnV', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-23 14:16:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('UKT4X2cxujTuHFzmVWvV8NZNVZL36Kv6QIM_0UvNJeIYeWicxisLMoWrG1N4cizb', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-23 08:58:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('uoTJRpxoLS9ehLRRx2l_jEfnqaPt-HJNOpUeYNMheJiPSp7IjgE6fgffd9ugblz4', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-23 10:16:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('VGSA3v9uui33QnFi-tRHAyFUWIhsdFSy4OUYcXWktskgDbr5G3CnhIkE4zTs_6sk', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-23 21:42:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('vq3Cg8d0zC9m_XU7P2gUwZSupLFUUgEL81rdzgmYEqwrj0PkZZ3jBFz05MzGnRRE', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-23 10:14:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('vqvRwCj5NddKGYhCwyMCr2I4TKjgnHo4srXtGryFLltQsAgcECKbWfMyU-bU4xRq', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:55:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('VsEywL2T9d2sHtV3VPMMm1Pgws41NL1PKzEQquacOvHlkfZJ2Srx4qmOI6D7SRMB', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:09:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('WF6CQpskNM2IYYquBn44ugV7XP0k7xQFJRKN92dvUB5xeUiX9nlopILvRjLQejNn', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-23 10:21:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('WGw4BswB6HOG2KdAu9beoQ0DhsCRZ4gpZXJWjlqIMpyxg4eG5iVHr_yobrvPB6eN', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-24 14:22:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'http://localhost:8055'),
('X9oc0iNcTclUz8-PvVG6ulhqtiNN8qL35ZjCvJitzx6o__cLM76qn--X7TiSPRT1', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-23 18:22:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('xM4x3q4m4Wu-pGg9d3zpMSK5EHiEMrh7lYi_PqiBNJeKnC-YEK_YwlXcroCbB_QF', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 20:36:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('xWM6HzfiPP3CNIHkVSx-s_YlzQ2HPKTIpJefhYx4a1xWqKB9I7Ap52K1hpRGQwBJ', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-23 10:15:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('yqcIsupvMK-mewR1qpiGLj86AmmK0fTNVA_vRI-myABjmeLSypvavvKm86704Uq5', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 11:05:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('YxNrvotNCkS6CS94uoNU2d7Fx0CPKPwbMkNXpU5cgTiR1vcP3WCHCo6LooN0FlNn', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-22 19:40:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('yYvYkwOBaJeWcrnuzJaCmpg79UKhAoG5fF1eZc2Hfu_GXmbsh5vaJpRo5fEk9Rm2', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-25 01:33:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'http://localhost:8055'),
('Z5FisNZx8wdkll-16dnsSh_mYSh1jB0x7JKxDeVjg88tU1STIIkO-A11Xiv0Z7St', '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-24 23:12:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null'),
('ZrBbBJiMK1ArMGdzBZKF8inMm72MsX1Wf104J1NthsvA-3HKudORIz1jrHPlIsEQ', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-22 12:02:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203', NULL, 'null');

-- --------------------------------------------------------

--
-- Table structure for table `directus_settings`
--

CREATE TABLE `directus_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_name` varchar(100) NOT NULL DEFAULT 'Directus',
  `project_url` varchar(255) DEFAULT NULL,
  `project_color` varchar(50) DEFAULT NULL,
  `project_logo` char(36) DEFAULT NULL,
  `public_foreground` char(36) DEFAULT NULL,
  `public_background` char(36) DEFAULT NULL,
  `public_note` text DEFAULT NULL,
  `auth_login_attempts` int(10) UNSIGNED DEFAULT 25,
  `auth_password_policy` varchar(100) DEFAULT NULL,
  `storage_asset_transform` varchar(7) DEFAULT 'all',
  `storage_asset_presets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`storage_asset_presets`)),
  `custom_css` text DEFAULT NULL,
  `storage_default_folder` char(36) DEFAULT NULL,
  `basemaps` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`basemaps`)),
  `mapbox_key` varchar(255) DEFAULT NULL,
  `module_bar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`module_bar`)),
  `project_descriptor` varchar(100) DEFAULT NULL,
  `default_language` varchar(255) NOT NULL DEFAULT 'en-US',
  `custom_aspect_ratios` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`custom_aspect_ratios`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_settings`
--

INSERT INTO `directus_settings` (`id`, `project_name`, `project_url`, `project_color`, `project_logo`, `public_foreground`, `public_background`, `public_note`, `auth_login_attempts`, `auth_password_policy`, `storage_asset_transform`, `storage_asset_presets`, `custom_css`, `storage_default_folder`, `basemaps`, `mapbox_key`, `module_bar`, `project_descriptor`, `default_language`, `custom_aspect_ratios`) VALUES
(1, 'Medicine Store', NULL, '#18222F', 'd2725b5c-92db-4259-a083-d504d993548f', 'b6b263c1-2cc2-4378-87ef-4614e563dda4', NULL, NULL, 25, NULL, 'all', NULL, '#app, #main-content, body {\n  --primary-alt: #F0ECFF !important;\n  --primary-10: #F0ECFF !important;\n  --primary-25: #D9D0FF !important;\n  --primary-50: #B3A1FF !important;\n  --primary-75: #8C73FF !important;\n  --primary-90: #7557FF !important;\n\n  --primary: #1495ff !important;\n\n  --primary-110: #5E41EC !important;\n  --primary-125: #523DCF !important;\n  --primary-150: #3E369F !important;\n  --primary-175: #2B3070 !important;\n  --primary-190: #1F2C53 !important;\n\n  --v-button-background-color: #1495ff !important;\n  --v-button-background-color-hover: #60BDFF !important;\n  --sidebar-detail-color-active: #60BDFF !important;\n}\n', NULL, NULL, NULL, '[{\"type\":\"module\",\"id\":\"content\",\"enabled\":true},{\"type\":\"module\",\"id\":\"users\",\"enabled\":true},{\"type\":\"module\",\"id\":\"files\",\"enabled\":true},{\"type\":\"module\",\"id\":\"insights\",\"enabled\":true},{\"type\":\"module\",\"id\":\"settings\",\"enabled\":true,\"locked\":true}]', NULL, 'en-US', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `directus_shares`
--

CREATE TABLE `directus_shares` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `role` char(36) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_start` timestamp NULL DEFAULT NULL,
  `date_end` timestamp NULL DEFAULT NULL,
  `times_used` int(11) DEFAULT 0,
  `max_uses` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `directus_translations`
--

CREATE TABLE `directus_translations` (
  `id` char(36) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `directus_users`
--

CREATE TABLE `directus_users` (
  `id` char(36) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `avatar` char(36) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `theme` varchar(20) DEFAULT 'auto',
  `tfa_secret` varchar(255) DEFAULT NULL,
  `status` varchar(16) NOT NULL DEFAULT 'active',
  `role` char(36) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `last_access` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_page` varchar(255) DEFAULT NULL,
  `provider` varchar(128) NOT NULL DEFAULT 'default',
  `external_identifier` varchar(255) DEFAULT NULL,
  `auth_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`auth_data`)),
  `email_notifications` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_users`
--

INSERT INTO `directus_users` (`id`, `first_name`, `last_name`, `email`, `password`, `location`, `title`, `description`, `tags`, `avatar`, `language`, `theme`, `tfa_secret`, `status`, `role`, `token`, `last_access`, `last_page`, `provider`, `external_identifier`, `auth_data`, `email_notifications`) VALUES
('6ecc87ce-7353-478d-bc26-f2080f22be85', 'Abdallah', 'Awwad', 'abdallahhawwad@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$ZjBNdsritz1Ll7MezmppHQ$A3CatPR86C0Le/DcjCq0dBOUj4kG3K4n3YS69qhVA5Y', NULL, NULL, NULL, NULL, NULL, NULL, 'auto', NULL, 'active', '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', NULL, '2023-08-17 15:49:27', NULL, 'default', NULL, NULL, 1),
('818db100-445b-49ce-95cb-96dac7b49f08', 'new', 'user', 'user@directus.com', '$argon2id$v=19$m=65536,t=3,p=4$yXSA0JOBxzcXZLs0oMCjdg$1zrIulFP115D+TbwUVH8/LMtQHCp9sXuCnEPNK/sGRU', NULL, NULL, NULL, NULL, NULL, NULL, 'auto', NULL, 'active', '561be4e7-d6e2-4686-b21a-d6bf1e871a5d', 'wrktvfzLsblgmE2eXK0ANfs0mHuqImsv', '2023-08-18 01:16:04', '/content/invoice', 'default', NULL, NULL, 1),
('fe45593f-0841-49c6-8376-16c40b9de9e7', 'Admin', 'User', 'admin@directus.com', '$argon2id$v=19$m=65536,t=3,p=4$puXzY1jh4WJkEphJyML0WQ$sMTh6uXdENXhAca6n7riPeQzxJh8PZ0q5yUsADw6yGw', NULL, NULL, NULL, NULL, NULL, NULL, 'auto', NULL, 'active', '266159c1-2263-4ab6-bde7-a315afc0a9e3', 'KcBqV6ka34sS4aLvUijmlUOGnRidjrBB', '2023-08-18 01:35:05', '/content/medicine', 'default', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `directus_webhooks`
--

CREATE TABLE `directus_webhooks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `method` varchar(10) NOT NULL DEFAULT 'POST',
  `url` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'active',
  `data` tinyint(1) NOT NULL DEFAULT 1,
  `actions` varchar(100) NOT NULL,
  `collections` varchar(255) NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`headers`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` char(36) NOT NULL,
  `purchase_date` timestamp NULL DEFAULT NULL,
  `medicine_id` int(10) UNSIGNED DEFAULT NULL,
  `selling_price` decimal(10,5) DEFAULT NULL,
  `buying_price` decimal(10,5) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `purchase_date`, `medicine_id`, `selling_price`, `buying_price`, `expiration_date`, `quantity`) VALUES
('09dbdbde-a01d-4e02-84e2-9824828ffed0', '2023-08-17 16:42:25', 81, 12.00000, 10.00000, '2023-09-30', 6),
('0c7f3c4b-17a8-4bf9-80dd-8e91b691c4a2', '2023-08-17 16:42:27', 105, 276.00000, 230.00000, '2025-08-31', 4),
('0d6c0a59-3aac-41e3-88bc-67148f1c5302', '2023-08-17 16:42:26', 92, 120.00000, 100.00000, '2024-07-31', 17),
('1dcf6d6d-7396-4244-9b4c-f9d0d35722ce', '2023-08-17 16:42:25', 83, 18.00000, 15.00000, '2023-10-31', 17),
('23d9d571-b209-4f46-9c2c-0f49649c792e', '2023-08-17 16:42:27', 103, 252.00000, 210.00000, '2025-06-30', 7),
('24c66a75-a3cd-44b6-b255-bd63140cf33b', '2023-08-17 16:42:26', 90, 96.00000, 80.00000, '2024-05-31', 14),
('3ef0780b-ff82-481b-93c0-201f3e4635b2', '2023-08-17 16:42:26', 95, 156.00000, 130.00000, '2024-10-31', 20),
('3f996671-5243-4c42-bfd8-b6ed052f10c4', '2023-08-17 16:42:27', 104, 264.00000, 220.00000, '2025-07-31', 15),
('527d5cb7-7e97-4825-a809-799b71e14620', '2023-08-17 16:42:26', 100, 216.00000, 180.00000, '2025-03-31', 10),
('55f35916-635a-4d8a-90d1-ed3f675b2cec', '2023-08-17 16:42:26', 99, 204.00000, 170.00000, '2025-02-28', 15),
('5d98899e-ff92-4fde-928d-b39657177578', '2023-08-17 16:42:26', 87, 60.00000, 50.00000, '2024-02-28', 15),
('67326f77-b691-401c-ad6b-d9062eefd9f5', '2023-08-17 16:42:26', 98, 192.00000, 160.00000, '2025-01-31', 20),
('6de7636d-931a-4634-9b7d-c4fd1c2211d0', '2023-08-17 16:42:26', 86, 48.00000, 40.00000, '2024-01-31', 20),
('7f48904c-0d3d-422f-a95b-36af1b47dc31', '2023-08-17 16:42:26', 89, 84.00000, 70.00000, '2024-04-30', 20),
('98170b7c-bc84-438a-82ba-092396a3f753', '2023-08-17 16:42:26', 102, 240.00000, 200.00000, '2025-05-31', 10),
('a532a909-d829-41c0-affa-cf536479ba5e', '2023-08-17 16:42:26', 96, 168.00000, 140.00000, '2024-11-30', 15),
('a6b04267-25c6-43ab-8300-8fc16b07e54f', '2023-08-17 16:42:26', 91, 108.00000, 90.00000, '2024-06-30', 10),
('a77a766c-fd99-472c-9f73-0b231c855588', '2023-08-17 16:42:25', 84, 30.00000, 25.00000, '2023-11-30', 15),
('b5dbf8ad-bc64-4030-89ca-d54fa095123a', '2023-08-17 16:42:26', 93, 132.00000, 110.00000, '2024-08-31', 15),
('b6041c20-d4d7-4f6e-b99b-e872a2bd0ecd', '2023-08-17 16:42:26', 94, 144.00000, 120.00000, '2024-09-30', 10),
('ba982c15-baf4-47da-a3a2-6a1bae60a1b2', '2023-08-17 16:42:26', 97, 180.00000, 150.00000, '2024-12-31', 10),
('be6a7952-2d94-4043-9446-dae1a5b3a204', '2023-08-17 16:42:26', 101, 232.00000, 190.00000, '2025-04-30', 20),
('c660b145-3d63-4f1c-8320-fc055539eb9c', '2023-08-17 16:42:25', 82, 24.00000, 20.00000, '2023-08-31', 5),
('d81b755c-cd95-43ba-b9f6-464b2d915dd3', '2023-08-17 16:42:26', 85, 36.00000, 30.00000, '2023-12-31', 10),
('e52a664f-1eac-4fb7-baad-6a83811418f2', '2023-08-17 16:42:26', 88, 72.00000, 60.00000, '2024-03-31', 10);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `total` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `user_created`, `date_created`, `user_updated`, `date_updated`, `total`) VALUES
(410, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-17 16:49:54', NULL, '2023-08-17 17:24:34', 792),
(412, '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-17 17:53:30', NULL, '2023-08-17 17:53:32', 516),
(413, '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-17 17:54:04', NULL, '2023-08-17 17:54:04', 72),
(414, '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-17 18:46:36', NULL, '2023-08-17 18:46:37', 276),
(415, '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-17 18:47:07', NULL, '2023-08-17 18:47:07', 120),
(416, '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-17 18:47:54', NULL, '2023-08-17 18:47:55', 12),
(417, '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-17 18:48:21', NULL, '2023-08-17 18:48:21', 120),
(418, '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-17 21:03:41', NULL, '2023-08-17 21:03:43', 1014);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE `invoice_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) DEFAULT 'Published',
  `sort` int(11) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `inventory_id` char(36) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `invoice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice_details`
--

INSERT INTO `invoice_details` (`id`, `status`, `sort`, `user_created`, `date_created`, `user_updated`, `date_updated`, `inventory_id`, `quantity`, `invoice_id`) VALUES
(796, 'Published', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-17 17:21:30', NULL, NULL, '0c7f3c4b-17a8-4bf9-80dd-8e91b691c4a2', 2, 410),
(797, 'Published', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-17 17:24:34', NULL, NULL, '98170b7c-bc84-438a-82ba-092396a3f753', 1, 410),
(798, 'Published', NULL, '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-17 17:53:31', NULL, NULL, '3f996671-5243-4c42-bfd8-b6ed052f10c4', 1, 412),
(799, 'Published', NULL, '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-17 17:53:31', NULL, NULL, '23d9d571-b209-4f46-9c2c-0f49649c792e', 1, 412),
(800, 'Published', NULL, '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-17 17:54:04', NULL, NULL, '09dbdbde-a01d-4e02-84e2-9824828ffed0', 3, 413),
(801, 'Published', NULL, '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-17 17:54:04', NULL, NULL, '1dcf6d6d-7396-4244-9b4c-f9d0d35722ce', 2, 413),
(802, 'Published', NULL, '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-17 18:46:37', NULL, NULL, '0c7f3c4b-17a8-4bf9-80dd-8e91b691c4a2', 1, 414),
(803, 'Published', NULL, '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-17 18:47:07', NULL, NULL, '0d6c0a59-3aac-41e3-88bc-67148f1c5302', 1, 415),
(804, 'Published', NULL, '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-17 18:47:55', NULL, NULL, '09dbdbde-a01d-4e02-84e2-9824828ffed0', 1, 416),
(805, 'Published', NULL, '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-17 18:48:21', NULL, NULL, '0d6c0a59-3aac-41e3-88bc-67148f1c5302', 1, 417),
(806, 'Published', NULL, '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-17 21:03:41', NULL, NULL, '0c7f3c4b-17a8-4bf9-80dd-8e91b691c4a2', 1, 418),
(807, 'Published', NULL, '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-17 21:03:42', NULL, NULL, '0d6c0a59-3aac-41e3-88bc-67148f1c5302', 1, 418),
(808, 'Published', NULL, '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-17 21:03:42', NULL, NULL, '1dcf6d6d-7396-4244-9b4c-f9d0d35722ce', 1, 418),
(809, 'Published', NULL, '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-17 21:03:42', NULL, NULL, '23d9d571-b209-4f46-9c2c-0f49649c792e', 2, 418),
(810, 'Published', NULL, '818db100-445b-49ce-95cb-96dac7b49f08', '2023-08-17 21:03:43', NULL, NULL, '24c66a75-a3cd-44b6-b255-bd63140cf33b', 1, 418);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details_inventory`
--

CREATE TABLE `invoice_details_inventory` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_details_id` int(10) UNSIGNED DEFAULT NULL,
  `inventory_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `id` char(36) NOT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`id`, `user_created`, `date_created`, `user_updated`, `date_updated`, `name`, `phone`, `address`) VALUES
('2de6cb7f-3ae6-4192-bef0-69fe13ae240e', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 17:26:14', NULL, NULL, 'BioGenix', '321 Maple Lane, Villageton, USA', '+1 (555) 234-5678'),
('6d6b5992-b59f-4dce-b7ca-af5ad2901228', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 17:26:14', NULL, NULL, 'HerbalEgypt', '30 Oasis Road, Alexandria, Egypt', '+20 555555555'),
('8b93c955-8e27-40fa-8397-6cfc7a8f1359', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 17:26:14', NULL, NULL, 'Egyptian Pharma', '10 Nile Street, Cairo, Egypt', '+20 123456789'),
('ac3be199-d7b7-4c44-85b2-6649c5f16a41', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 17:26:14', NULL, NULL, 'MediCorp', '654 Pine Street, Hamletville, USA', '+1 (555) 876-5432'),
('ce266014-6b85-4e62-b250-887a4c01236c', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 17:26:14', NULL, NULL, 'PharmaEgypt', '20 Pyramid Avenue, Giza, Egypt', '+20 987654321'),
('e2b6b52a-e435-4dda-b87e-9cbc06c8d872', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 17:26:14', NULL, NULL, 'HealthCare Solutions', '456 Elm Avenue, Cityville, USA', '+1 (555) 987-6543'),
('e5d1025b-f9a9-479d-9c6d-b825b0ca74d1', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 17:26:14', NULL, NULL, 'MedicoPharm', '123 Main Street, Anytown, USA', '+1 (555) 123-4567'),
('fa9b0c25-9a6e-441e-a1c0-f9e90cca509e', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 17:26:14', NULL, NULL, 'PharmaTech', '789 Oak Road, Townsville, USA', '+1 (555) 789-0123');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'draft',
  `sort` int(11) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `image` char(36) DEFAULT NULL,
  `manufacturer` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`id`, `status`, `sort`, `user_created`, `date_created`, `user_updated`, `date_updated`, `name`, `category`, `unit`, `type`, `image`, `manufacturer`) VALUES
(81, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:29', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:21:49', 'Aspirin', 'Pain Relief', 'mg', 'Tablet', '7b33805a-e13d-4f93-9ff7-a0722fbb5fe0', '2de6cb7f-3ae6-4192-bef0-69fe13ae240e'),
(82, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:29', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:22:10', 'Ibuprofen', 'Pain Relief', 'mg', 'Tablet', 'fd4a09c8-b4aa-4e86-83d9-58e4b4ac4495', 'ac3be199-d7b7-4c44-85b2-6649c5f16a41'),
(83, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:29', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:22:23', 'Acetaminophen', 'Pain Relief', 'mg', 'Tablet', '29d138a0-3200-45fd-8632-24558346266f', 'ac3be199-d7b7-4c44-85b2-6649c5f16a41'),
(84, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:29', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:22:33', 'Amoxicillin', 'Antibiotic', 'mg', 'Capsule', 'f5da7908-983b-4282-80c3-b272fba63aed', 'fa9b0c25-9a6e-441e-a1c0-f9e90cca509e'),
(85, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:29', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:22:45', 'Azithromycin', 'Antibiotic', 'mg', 'Tablet', '44960b98-7ac7-447b-8c7f-94afcc766791', '2de6cb7f-3ae6-4192-bef0-69fe13ae240e'),
(86, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:29', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:23:04', 'Lisinopril', 'Blood Pressure', 'mg', 'Tablet', 'f723dd61-b341-47b4-ad46-f93113568254', 'ac3be199-d7b7-4c44-85b2-6649c5f16a41'),
(87, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:29', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 22:55:07', 'Atorvastatin', 'Cholesterol', 'mg', 'Tablet', 'e195b61c-86ff-466d-9d0f-64a5221c29bb', 'fa9b0c25-9a6e-441e-a1c0-f9e90cca509e'),
(88, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:29', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:23:26', 'Metformin', 'Diabetes', 'mg', 'Tablet', '19c1bd48-e353-4a92-8ba5-5b7c4edf8df7', 'fa9b0c25-9a6e-441e-a1c0-f9e90cca509e'),
(89, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:29', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:23:37', 'Whey Protein Powder', 'Fitness', '500g', 'Powder', '8b66b7f5-06b5-4ab2-8995-832ce59506df', '8b93c955-8e27-40fa-8397-6cfc7a8f1359'),
(90, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:29', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:23:47', 'Pre-Workout Supplement', 'Fitness', '300g', 'Powder', 'df8bc962-8a57-4dbb-8994-edbe57a4e647', '8b93c955-8e27-40fa-8397-6cfc7a8f1359'),
(91, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:29', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:23:59', 'BCAA (Branched-Chain Amino Acids)', 'Fitness', '200 capsules', 'Capsule', '696c6dc7-396d-4296-b86b-25152655d27d', '2de6cb7f-3ae6-4192-bef0-69fe13ae240e'),
(92, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:29', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:24:09', 'Creatine Monohydrate', 'Fitness', '1kg', 'Powder', '6336318f-24dd-4de1-a7ba-77476c722742', '8b93c955-8e27-40fa-8397-6cfc7a8f1359'),
(93, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:30', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:24:21', 'L-Glutamine', 'Fitness', '500g', 'Powder', '05dcf0be-d653-496f-a811-8ef3db2bc940', 'fa9b0c25-9a6e-441e-a1c0-f9e90cca509e'),
(94, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:30', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:24:35', 'Prenatal Vitamins', "Women's care", '90 tablets', 'Tablet', 'ad4e6aa5-a0e0-457d-ae74-d785fa118d16', '6d6b5992-b59f-4dce-b7ca-af5ad2901228'),
(95, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:30', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:24:48', 'Menstrual Pain Relief Medication', "Women's care", '24 tablets', 'Tablet', 'a75dabab-dde7-4df6-a998-2562630fb4cd', '2de6cb7f-3ae6-4192-bef0-69fe13ae240e'),
(96, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:30', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:24:59', 'Vaginal Lubricants', "Women's care", '100ml', 'Gel', '5507e893-c36e-43cc-a8e3-9f6615a449df', 'e5d1025b-f9a9-479d-9c6d-b825b0ca74d1'),
(97, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:30', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:25:10', 'Blood Pressure Monitor', 'Devices', 'NULL', 'Device', '5526a52e-8a6f-473a-bb5a-97abaa2bcabf', '8b93c955-8e27-40fa-8397-6cfc7a8f1359'),
(98, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:30', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:25:23', 'Glucose Meter', 'Devices', 'NULL', 'Device', 'e75ca208-62a7-45ff-a213-f20b09ab7b5a', 'e5d1025b-f9a9-479d-9c6d-b825b0ca74d1'),
(99, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:30', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:25:35', 'Thermometer', 'Devices', 'NULL', 'Device', 'ce7df504-8a59-4b7d-9dfe-2fa797d988e8', 'ce266014-6b85-4e62-b250-887a4c01236c'),
(100, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:30', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:25:46', 'Nebulizer', 'Devices', 'NULL', 'Device', '0b79fb30-b133-414b-8333-0c2b53add917', 'ce266014-6b85-4e62-b250-887a4c01236c'),
(101, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:30', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:26:01', 'Pulse Oximeter', 'Devices', 'NULL', 'Device', '0866bc19-4755-4468-bf92-cbbf5f1fb0cf', 'ce266014-6b85-4e62-b250-887a4c01236c'),
(102, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:30', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:26:11', 'Diapers', 'Baby care', '50 pieces', 'Product', '58c3b77e-72ea-47f7-b705-93748112ca4b', 'ce266014-6b85-4e62-b250-887a4c01236c'),
(103, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:30', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:26:22', 'Baby Wipes', 'Baby care', '80 wipes', 'Product', '8c25136b-e369-4757-964b-e0b233282d4d', 'e2b6b52a-e435-4dda-b87e-9cbc06c8d872'),
(104, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:30', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:26:32', 'Baby Shampoo', 'Baby care', '250ml', 'Shampoo', 'f9fe4b8d-feeb-441e-95c0-3852d85ecbaf', 'e2b6b52a-e435-4dda-b87e-9cbc06c8d872'),
(105, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:30', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:26:45', 'Baby Lotion', 'Baby care', '200ml', 'Lotion', '6f460008-d5df-45f2-bb3c-0ae9df007c65', 'e2b6b52a-e435-4dda-b87e-9cbc06c8d872'),
(106, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:30', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:27:03', 'Multivitamin Supplement', 'Healthcare', '60 tablets', 'Tablet', '3282057d-c9a4-45d7-b651-d794b8176909', '6d6b5992-b59f-4dce-b7ca-af5ad2901228'),
(107, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:30', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:27:12', 'Omega-3 Fish Oil', 'Healthcare', '120 capsules', 'Capsule', '94ad5188-4a83-45d3-9042-cfcd35d35972', 'e5d1025b-f9a9-479d-9c6d-b825b0ca74d1'),
(108, 'draft', NULL, 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:20:30', 'fe45593f-0841-49c6-8376-16c40b9de9e7', '2023-08-14 18:27:23', 'Probiotic Supplement', 'Healthcare', '30 capsules', 'Capsule', '58c47569-3047-4f4f-922d-bf07d14776b0', '6d6b5992-b59f-4dce-b7ca-af5ad2901228');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_manufacturer`
--

CREATE TABLE `medicine_manufacturer` (
  `id` int(10) UNSIGNED NOT NULL,
  `medicine_id` int(10) UNSIGNED DEFAULT NULL,
  `manufacturer_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicine_manufacturer`
--

INSERT INTO `medicine_manufacturer` (`id`, `medicine_id`, `manufacturer_id`) VALUES
(1, NULL, NULL),
(2, NULL, NULL),
(3, NULL, NULL),
(4, NULL, NULL),
(5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `medicine_sku`
--

CREATE TABLE `medicine_sku` (
  `SKU` char(36) NOT NULL,
  `inventory_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicine_sku`
--

INSERT INTO `medicine_sku` (`SKU`, `inventory_id`) VALUES
('1d548a16-6ba7-472e-9685-7d15afb4b250', NULL),
('25dee527-975d-45bf-aef7-a8a0d1c9bc02', NULL),
('28beb22b-8fd4-4a6a-90f6-82bb9b8e8dfe', NULL),
('32b1e6ce-9b16-4c1e-892c-98ba9b8d5d7d', NULL),
('3e91ec83-53b9-4012-bdcf-307f7421e0f7', NULL),
('4585fab8-f133-4f98-b078-29d116c1541a', NULL),
('539a24f8-adfe-4c0a-a42e-20ad48da61e0', NULL),
('5687bc58-a159-408b-9fad-1cfe89bec223', NULL),
('568a9a52-412c-42ed-8710-e5f5fb6c38c0', NULL),
('5e99db17-59da-42da-8b02-0c4d7ccdc183', NULL),
('611a0124-9b1d-4371-b186-ca960945fb95', NULL),
('6629c709-3618-4fd6-a15f-ad05978f0e5b', NULL),
('6741733c-514b-4c94-8a2d-169079b1451f', NULL),
('6861cc3d-1b65-4093-aa94-544157190258', NULL),
('771e6340-1de5-444d-81e9-46ef225326f6', NULL),
('7a69ecb2-a00c-4bdd-a430-d5a7fd0affd1', NULL),
('7aa408fd-2687-4eab-a5da-c7e4a2810085', NULL),
('89598ad1-1f10-4a74-8767-7d51a5f57305', NULL),
('8f225ab9-cabe-4028-a5c2-c1e1bc719655', NULL),
('8fbed83c-f439-4210-bab2-c9667d0a0661', NULL),
('b3e4a09c-6f2a-4436-9c9c-57d41677e86f', NULL),
('d0efd4f1-2905-4999-b22b-87ed34568487', NULL),
('d418ceb3-8547-4c73-9f0e-dd3141eeef6f', NULL),
('e6c7cc11-5749-4e63-901e-469d5e43afd2', NULL),
('ee2d6599-f5ba-46a4-8ff5-b9761e30984e', NULL),
('0ef2e1e1-a9c1-4836-9564-b15552ef3157', '09dbdbde-a01d-4e02-84e2-9824828ffed0'),
('5e9a29b5-4305-4aac-80e6-45be7d78770c', '09dbdbde-a01d-4e02-84e2-9824828ffed0'),
('6f1e28f4-14f3-40f8-9c6c-d5ff9dba61db', '09dbdbde-a01d-4e02-84e2-9824828ffed0'),
('80e328bf-1b4a-44ba-a573-31813d2e0e25', '09dbdbde-a01d-4e02-84e2-9824828ffed0'),
('92d29dd8-0f30-42fb-a26f-90a2d7e2720d', '09dbdbde-a01d-4e02-84e2-9824828ffed0'),
('aa5f9564-02e4-4d4b-8514-4b992f558bcd', '09dbdbde-a01d-4e02-84e2-9824828ffed0'),
('b13a9e52-62c0-4051-87e7-18b3af97a203', '09dbdbde-a01d-4e02-84e2-9824828ffed0'),
('cb94da52-1b25-483c-88b9-25d423e1e035', '09dbdbde-a01d-4e02-84e2-9824828ffed0'),
('cd1b7478-dd3b-4866-8f8e-7e09ea74662f', '09dbdbde-a01d-4e02-84e2-9824828ffed0'),
('d21a67af-f6be-4eb5-8959-ec79b21c5d47', '09dbdbde-a01d-4e02-84e2-9824828ffed0'),
('0ba8b657-d431-42a5-af43-9ed7462d9d48', '0c7f3c4b-17a8-4bf9-80dd-8e91b691c4a2'),
('1a882f14-a7d3-4199-8f3d-0900efcbb3af', '0c7f3c4b-17a8-4bf9-80dd-8e91b691c4a2'),
('2497208e-9726-4836-8ce1-77bc0d2ff167', '0c7f3c4b-17a8-4bf9-80dd-8e91b691c4a2'),
('24ec1ec5-01c4-455c-807d-4b81ad297e28', '0c7f3c4b-17a8-4bf9-80dd-8e91b691c4a2'),
('28ab9c41-17f7-429e-aa8d-4412def7d952', '0c7f3c4b-17a8-4bf9-80dd-8e91b691c4a2'),
('4a198691-c0a9-4713-9790-aab79efc404c', '0c7f3c4b-17a8-4bf9-80dd-8e91b691c4a2'),
('62897073-2a0a-437a-a779-e7f54edad230', '0c7f3c4b-17a8-4bf9-80dd-8e91b691c4a2'),
('96fbaca3-c8ee-4acb-8c30-ac49f906e00b', '0c7f3c4b-17a8-4bf9-80dd-8e91b691c4a2'),
('a9351a2d-fdc0-41d1-9e68-ed90d0617749', '0c7f3c4b-17a8-4bf9-80dd-8e91b691c4a2'),
('bc4a97cf-b721-46b9-b694-756eb9178606', '0c7f3c4b-17a8-4bf9-80dd-8e91b691c4a2'),
('c46d6d82-212d-401e-954f-5d44b8e74d9a', '0c7f3c4b-17a8-4bf9-80dd-8e91b691c4a2'),
('d89ce4bd-91a3-4c99-bc34-89d18fbe7318', '0c7f3c4b-17a8-4bf9-80dd-8e91b691c4a2'),
('da78b462-a8c1-40c7-bc84-28e4d04feeaf', '0c7f3c4b-17a8-4bf9-80dd-8e91b691c4a2'),
('e818de9b-77c2-4b23-ba65-40b033601d63', '0c7f3c4b-17a8-4bf9-80dd-8e91b691c4a2'),
('fd7734cc-df22-444e-bac8-8561df735d0c', '0c7f3c4b-17a8-4bf9-80dd-8e91b691c4a2'),
('0548f5ca-d784-45d4-8590-7f9cf3386601', '0d6c0a59-3aac-41e3-88bc-67148f1c5302'),
('148d6164-cc26-455d-8675-6164c8cecac1', '0d6c0a59-3aac-41e3-88bc-67148f1c5302'),
('17d773a5-48c5-465a-a9a9-ddbe6f9d40b6', '0d6c0a59-3aac-41e3-88bc-67148f1c5302'),
('1d744f73-8e0c-4132-821f-c1ad5888ff31', '0d6c0a59-3aac-41e3-88bc-67148f1c5302'),
('43f8ab11-147c-4504-b15e-4caec1b24e73', '0d6c0a59-3aac-41e3-88bc-67148f1c5302'),
('56633551-10a7-4f0d-be13-55c642e1d3d7', '0d6c0a59-3aac-41e3-88bc-67148f1c5302'),
('69e7b63f-7247-44e0-bf40-5b0546e8cec3', '0d6c0a59-3aac-41e3-88bc-67148f1c5302'),
('6a9c865e-2ce7-4758-a490-ce341639322f', '0d6c0a59-3aac-41e3-88bc-67148f1c5302'),
('7adcce9d-6645-4d78-9cbd-73c454f1fb10', '0d6c0a59-3aac-41e3-88bc-67148f1c5302'),
('82607e14-99fd-47e5-ad51-def778546315', '0d6c0a59-3aac-41e3-88bc-67148f1c5302'),
('8d4d2554-3fd3-4ef0-b4b1-2ff34ac7bbda', '0d6c0a59-3aac-41e3-88bc-67148f1c5302'),
('b5815862-57a9-401c-a6f8-0527b97986ee', '0d6c0a59-3aac-41e3-88bc-67148f1c5302'),
('b9343c86-3e8a-4fe0-9bd5-b1abd020563f', '0d6c0a59-3aac-41e3-88bc-67148f1c5302'),
('c45e8577-7b11-445d-baf6-f20c990eeba3', '0d6c0a59-3aac-41e3-88bc-67148f1c5302'),
('c48004b6-a8f0-4f1e-8f58-e759adfd2244', '0d6c0a59-3aac-41e3-88bc-67148f1c5302'),
('cf388f79-aac9-479b-ba89-ccbef771e970', '0d6c0a59-3aac-41e3-88bc-67148f1c5302'),
('cf49db85-2c7f-4fb9-99a4-05821395b5a0', '0d6c0a59-3aac-41e3-88bc-67148f1c5302'),
('d256fbbf-e91f-421c-aa03-5ce389a01993', '0d6c0a59-3aac-41e3-88bc-67148f1c5302'),
('dda24cb6-1391-4eb2-b709-711b0cdc23f1', '0d6c0a59-3aac-41e3-88bc-67148f1c5302'),
('df87e39f-50f7-4a3f-9e74-0ce7883631f9', '0d6c0a59-3aac-41e3-88bc-67148f1c5302'),
('11cad164-714f-459b-9813-8e556ebe3b78', '1dcf6d6d-7396-4244-9b4c-f9d0d35722ce'),
('16f10732-f6bd-4d34-b6aa-7f528a932d26', '1dcf6d6d-7396-4244-9b4c-f9d0d35722ce'),
('176b8e20-f61a-43c9-b011-c796c39ea99e', '1dcf6d6d-7396-4244-9b4c-f9d0d35722ce'),
('1c751113-a588-44e3-9f0a-c48699fe4ba5', '1dcf6d6d-7396-4244-9b4c-f9d0d35722ce'),
('27422575-be2d-4abe-b038-65acff2bd05d', '1dcf6d6d-7396-4244-9b4c-f9d0d35722ce'),
('37c146a9-604e-480d-90ed-9288d80fbcc3', '1dcf6d6d-7396-4244-9b4c-f9d0d35722ce'),
('48e07088-a317-4b42-864a-ba1fedb39f56', '1dcf6d6d-7396-4244-9b4c-f9d0d35722ce'),
('4a8c1a67-cf9e-4018-bf9e-c0c1c5db6cac', '1dcf6d6d-7396-4244-9b4c-f9d0d35722ce'),
('5acb233b-8d0d-468d-9fc8-ad7245b5be69', '1dcf6d6d-7396-4244-9b4c-f9d0d35722ce'),
('5bae3bdd-be11-4e94-8c31-0023b52a72e8', '1dcf6d6d-7396-4244-9b4c-f9d0d35722ce'),
('80a9ab5b-1014-406d-b33d-4f3375caf371', '1dcf6d6d-7396-4244-9b4c-f9d0d35722ce'),
('80c586fa-9bf9-418d-9901-3ba468b0cf3d', '1dcf6d6d-7396-4244-9b4c-f9d0d35722ce'),
('822c7125-7e22-47d3-9d2e-4015a42a157a', '1dcf6d6d-7396-4244-9b4c-f9d0d35722ce'),
('a26ca909-e8e8-4772-a4f6-b423a57bb4ab', '1dcf6d6d-7396-4244-9b4c-f9d0d35722ce'),
('aeaa9ee4-71bc-439f-8809-6357702ca520', '1dcf6d6d-7396-4244-9b4c-f9d0d35722ce'),
('b377b7e2-5676-4a2e-b510-3850e4353828', '1dcf6d6d-7396-4244-9b4c-f9d0d35722ce'),
('c0572db4-ae14-4e0f-a5ed-a014b3285469', '1dcf6d6d-7396-4244-9b4c-f9d0d35722ce'),
('c9110b9f-8a7a-4914-9f33-ab2f974f7917', '1dcf6d6d-7396-4244-9b4c-f9d0d35722ce'),
('d8aaaffb-8416-4c26-939e-af7e71c9b00a', '1dcf6d6d-7396-4244-9b4c-f9d0d35722ce'),
('f88ce766-a537-473d-9011-f3cf1cd7ded9', '1dcf6d6d-7396-4244-9b4c-f9d0d35722ce'),
('1557eab7-ae75-4d62-a91c-8917c3fdb1ca', '23d9d571-b209-4f46-9c2c-0f49649c792e'),
('384517aa-bd75-4750-a1b3-27bd8478a32b', '23d9d571-b209-4f46-9c2c-0f49649c792e'),
('53e73d8e-1658-4b0b-9143-209cb6c8ab00', '23d9d571-b209-4f46-9c2c-0f49649c792e'),
('7f932420-86c0-40ae-a647-2716ee39ae9c', '23d9d571-b209-4f46-9c2c-0f49649c792e'),
('80d7b6f8-1401-465f-956b-ea699ac19283', '23d9d571-b209-4f46-9c2c-0f49649c792e'),
('b79db1c9-af1f-429d-a1a5-bbd7b4cde858', '23d9d571-b209-4f46-9c2c-0f49649c792e'),
('bfec5797-8f9c-4367-87cd-1c628c687002', '23d9d571-b209-4f46-9c2c-0f49649c792e'),
('c99c1742-5ddd-4321-a375-d9a5ad65c28f', '23d9d571-b209-4f46-9c2c-0f49649c792e'),
('cffc952d-a6cf-4bb4-82ec-65f776a73dc1', '23d9d571-b209-4f46-9c2c-0f49649c792e'),
('d06d92ff-f84d-4e20-b067-33afffbbc638', '23d9d571-b209-4f46-9c2c-0f49649c792e'),
('1c0a6fb3-b9fb-4beb-a323-060a525f01ef', '24c66a75-a3cd-44b6-b255-bd63140cf33b'),
('2196f2a8-ac12-43b5-87f0-84ebc99d761a', '24c66a75-a3cd-44b6-b255-bd63140cf33b'),
('247ffcc2-7054-4b4c-bdae-f516726f0ba3', '24c66a75-a3cd-44b6-b255-bd63140cf33b'),
('2fc3fe04-af6e-48a0-bec0-5806829922e8', '24c66a75-a3cd-44b6-b255-bd63140cf33b'),
('3bcef555-9fad-4909-940f-3dd4ce663ddc', '24c66a75-a3cd-44b6-b255-bd63140cf33b'),
('49688cab-f0f2-4d7e-a94d-9eb77bad4147', '24c66a75-a3cd-44b6-b255-bd63140cf33b'),
('49ceff80-dbf3-41b4-9b02-7570ef142f25', '24c66a75-a3cd-44b6-b255-bd63140cf33b'),
('49e0047f-8cd5-450e-b921-0017135f2eaa', '24c66a75-a3cd-44b6-b255-bd63140cf33b'),
('514c4ce2-57d2-49ad-9316-2b18cf28bc01', '24c66a75-a3cd-44b6-b255-bd63140cf33b'),
('6b274812-f714-4169-83ea-e4a0439598bf', '24c66a75-a3cd-44b6-b255-bd63140cf33b'),
('724db459-c6f1-49dd-b219-103290b2f092', '24c66a75-a3cd-44b6-b255-bd63140cf33b'),
('96dc88bb-51ed-4918-b3a7-e68128480b5f', '24c66a75-a3cd-44b6-b255-bd63140cf33b'),
('9b1886dc-586a-48fc-9a3a-3c9bd222e1e4', '24c66a75-a3cd-44b6-b255-bd63140cf33b'),
('db04f8f6-504a-4892-8bd9-4d961938f993', '24c66a75-a3cd-44b6-b255-bd63140cf33b'),
('dbb16462-b399-4be4-a1f9-dfce82331271', '24c66a75-a3cd-44b6-b255-bd63140cf33b'),
('0263bf96-f636-4b6f-974e-13c7656375f0', '3ef0780b-ff82-481b-93c0-201f3e4635b2'),
('033b7302-0da2-4ae9-a759-2f8dbdf5a6e9', '3ef0780b-ff82-481b-93c0-201f3e4635b2'),
('0a65f0ea-8784-4163-88fb-3b7025fcd740', '3ef0780b-ff82-481b-93c0-201f3e4635b2'),
('333ca105-779f-41ff-b466-cc84c7957e38', '3ef0780b-ff82-481b-93c0-201f3e4635b2'),
('3e9dbc1f-d4f5-4a06-ba44-040367ff1fc9', '3ef0780b-ff82-481b-93c0-201f3e4635b2'),
('555cf10e-cf51-4535-a2c5-3ea33fe8a2d0', '3ef0780b-ff82-481b-93c0-201f3e4635b2'),
('5c1f1695-fded-403d-a8f1-ecfb83e8b32b', '3ef0780b-ff82-481b-93c0-201f3e4635b2'),
('5d03caf0-6b60-4058-811b-7ce9da8c35da', '3ef0780b-ff82-481b-93c0-201f3e4635b2'),
('5e63b5d7-0f34-420c-9119-eef539bd77c2', '3ef0780b-ff82-481b-93c0-201f3e4635b2'),
('6746010c-4e51-42c9-84da-d6195f0c2aaa', '3ef0780b-ff82-481b-93c0-201f3e4635b2'),
('679d7641-eb44-4f9e-bb2a-65a12ab1c891', '3ef0780b-ff82-481b-93c0-201f3e4635b2'),
('76cb4b39-dc58-4ae2-aad9-fee0f11e6dc0', '3ef0780b-ff82-481b-93c0-201f3e4635b2'),
('82863e68-6a4a-4d31-a383-de1b6b27b205', '3ef0780b-ff82-481b-93c0-201f3e4635b2'),
('8cd4ec70-f5da-4fa9-a9e4-efe41cec3883', '3ef0780b-ff82-481b-93c0-201f3e4635b2'),
('9bc3d4d9-337a-4851-8727-3fb2d77493fc', '3ef0780b-ff82-481b-93c0-201f3e4635b2'),
('a47692b0-edc2-45f2-9884-232993c6a92c', '3ef0780b-ff82-481b-93c0-201f3e4635b2'),
('c53bc17a-95bc-4ec5-8d15-076e7a8b66f8', '3ef0780b-ff82-481b-93c0-201f3e4635b2'),
('cff0ef29-0769-4fe4-96df-abf4aeebf148', '3ef0780b-ff82-481b-93c0-201f3e4635b2'),
('d569c322-2c42-40d5-8196-7b8b897d6af6', '3ef0780b-ff82-481b-93c0-201f3e4635b2'),
('ee2dcbfb-7d74-4a26-81b4-4e41542b9c3b', '3ef0780b-ff82-481b-93c0-201f3e4635b2'),
('061aeb6a-c8f6-4326-be49-f005d129c9db', '3f996671-5243-4c42-bfd8-b6ed052f10c4'),
('0a437841-2dbc-4fbd-9c0f-ebb7d1d388ce', '3f996671-5243-4c42-bfd8-b6ed052f10c4'),
('0def80cd-8399-44d8-9889-d88b5e03362c', '3f996671-5243-4c42-bfd8-b6ed052f10c4'),
('1e0d9e6b-e12a-4cb3-a3b2-693d9cb3da3c', '3f996671-5243-4c42-bfd8-b6ed052f10c4'),
('2adda220-d1d4-45f3-965d-4e5b43eba0aa', '3f996671-5243-4c42-bfd8-b6ed052f10c4'),
('2d8f3ec9-5c5e-4c9b-95b3-c9b230db5db3', '3f996671-5243-4c42-bfd8-b6ed052f10c4'),
('4ade5140-0def-4883-a1cb-220646fa61fb', '3f996671-5243-4c42-bfd8-b6ed052f10c4'),
('65936dc3-88e5-4574-9246-09e985fb22ce', '3f996671-5243-4c42-bfd8-b6ed052f10c4'),
('806446ba-4739-426c-82bb-d0e46082b1c3', '3f996671-5243-4c42-bfd8-b6ed052f10c4'),
('85c0d167-aaa6-4d9d-b48e-803cbc3e725f', '3f996671-5243-4c42-bfd8-b6ed052f10c4'),
('864aa062-bdc0-440d-8245-c78e52ff389e', '3f996671-5243-4c42-bfd8-b6ed052f10c4'),
('8a321286-6428-4805-ab1b-af18036515ed', '3f996671-5243-4c42-bfd8-b6ed052f10c4'),
('9793cfd0-a188-4d9d-9edb-473046c45421', '3f996671-5243-4c42-bfd8-b6ed052f10c4'),
('9c2abb0c-44b8-4615-867e-48a90df3db00', '3f996671-5243-4c42-bfd8-b6ed052f10c4'),
('aba4b640-61e9-4e13-a25c-8ffb0807b806', '3f996671-5243-4c42-bfd8-b6ed052f10c4'),
('b406a8d0-1ab0-48e5-933a-c52893d9bb2b', '3f996671-5243-4c42-bfd8-b6ed052f10c4'),
('be7330df-8dd9-416e-981d-8a449a2587c9', '3f996671-5243-4c42-bfd8-b6ed052f10c4'),
('c8d381e8-b49a-41a7-a07d-eb01ddbc0f11', '3f996671-5243-4c42-bfd8-b6ed052f10c4'),
('e42151ea-6e0a-47d7-bc86-456035e01cc9', '3f996671-5243-4c42-bfd8-b6ed052f10c4'),
('ef259274-d1b5-4ddb-8ed0-d712c207eaae', '3f996671-5243-4c42-bfd8-b6ed052f10c4'),
('19d6e4c6-7c84-43bc-9995-4f75dd109e59', '527d5cb7-7e97-4825-a809-799b71e14620'),
('211e151f-8048-4186-8f4c-ede06413bbce', '527d5cb7-7e97-4825-a809-799b71e14620'),
('39df7ed7-d0fc-451e-ad3f-d1b9aefcfccb', '527d5cb7-7e97-4825-a809-799b71e14620'),
('5d215f43-2496-4c40-a66e-ef7169cc4421', '527d5cb7-7e97-4825-a809-799b71e14620'),
('6dcfdeee-e0cc-462b-ab82-8cbf28acec00', '527d5cb7-7e97-4825-a809-799b71e14620'),
('76f0b75c-7e81-48da-9516-fb41096c4365', '527d5cb7-7e97-4825-a809-799b71e14620'),
('8d9f248d-58c1-4adf-84cc-221cc9dddd53', '527d5cb7-7e97-4825-a809-799b71e14620'),
('98a90338-e231-4e7b-bf66-6d2e992253c6', '527d5cb7-7e97-4825-a809-799b71e14620'),
('c42dfc56-1554-42b2-8f45-fad5c90ac79f', '527d5cb7-7e97-4825-a809-799b71e14620'),
('c824ada7-d2dd-4ccb-967a-fc1655363c4a', '527d5cb7-7e97-4825-a809-799b71e14620'),
('0071b491-38b5-41b7-97a9-79e773a688dc', '55f35916-635a-4d8a-90d1-ed3f675b2cec'),
('0f48bf20-bffa-4f1b-9eaa-f4c660783ce7', '55f35916-635a-4d8a-90d1-ed3f675b2cec'),
('10351f6f-3ee5-47be-85ec-9a185d3f5791', '55f35916-635a-4d8a-90d1-ed3f675b2cec'),
('216f8193-bf19-4641-86db-1415b41cfc2a', '55f35916-635a-4d8a-90d1-ed3f675b2cec'),
('48710a42-d4c1-4a48-a83e-ae58df82e973', '55f35916-635a-4d8a-90d1-ed3f675b2cec'),
('531cfd07-67c6-4198-a25a-3febc0b18b61', '55f35916-635a-4d8a-90d1-ed3f675b2cec'),
('5540bf41-ce1d-45e2-9985-d6614d05ef92', '55f35916-635a-4d8a-90d1-ed3f675b2cec'),
('579d7c1c-7b80-4790-8349-7d98e74eb4cc', '55f35916-635a-4d8a-90d1-ed3f675b2cec'),
('7121945f-2f3a-40da-9b23-0963f21e93c8', '55f35916-635a-4d8a-90d1-ed3f675b2cec'),
('784a3e3d-5247-408a-a59f-e350a4c05a70', '55f35916-635a-4d8a-90d1-ed3f675b2cec'),
('827cbfb1-b658-43be-9c3b-ed7256a7c7c1', '55f35916-635a-4d8a-90d1-ed3f675b2cec'),
('ba01d960-cb8e-437b-bfc1-9041d2ffb1b1', '55f35916-635a-4d8a-90d1-ed3f675b2cec'),
('c3659d30-24ee-4184-83d8-70d47e0c406a', '55f35916-635a-4d8a-90d1-ed3f675b2cec'),
('c7523da7-7f55-4b87-8ccc-aa284af4b99e', '55f35916-635a-4d8a-90d1-ed3f675b2cec'),
('e5e80666-a3eb-4aa5-939d-d6f9a96fc356', '55f35916-635a-4d8a-90d1-ed3f675b2cec'),
('0cc818c6-712b-4222-bc29-359f24e71fa5', '5d98899e-ff92-4fde-928d-b39657177578'),
('1151669e-cd6f-4833-9594-601f7e4093af', '5d98899e-ff92-4fde-928d-b39657177578'),
('269e2ca2-d651-4b3c-bb5e-7bcb149c70bb', '5d98899e-ff92-4fde-928d-b39657177578'),
('45df55cf-db94-4d36-a7c6-50db32e24da9', '5d98899e-ff92-4fde-928d-b39657177578'),
('46fc37d3-50bc-4cd2-b1bb-530b8ca10862', '5d98899e-ff92-4fde-928d-b39657177578'),
('5a5f0985-ff7a-4ae2-89cb-86a889b6dcef', '5d98899e-ff92-4fde-928d-b39657177578'),
('5f49c7cf-8f3a-4667-ac6d-152fc7a0bbfc', '5d98899e-ff92-4fde-928d-b39657177578'),
('749d279f-8408-4d41-8743-0327a097ca53', '5d98899e-ff92-4fde-928d-b39657177578'),
('910c2940-af90-4ce1-9fc5-a11d47b8033a', '5d98899e-ff92-4fde-928d-b39657177578'),
('9124fdca-8858-47bb-a0cd-d83f8437da34', '5d98899e-ff92-4fde-928d-b39657177578'),
('9768e50b-fe73-4e0a-9727-1216d32afe66', '5d98899e-ff92-4fde-928d-b39657177578'),
('a5d8cfa9-5ccb-49b0-8f13-bf0a2d7c36ec', '5d98899e-ff92-4fde-928d-b39657177578'),
('bf5f7968-ff27-4a56-85ec-83c57fa3a8db', '5d98899e-ff92-4fde-928d-b39657177578'),
('e9194ec1-7255-4462-a237-18414f61aa79', '5d98899e-ff92-4fde-928d-b39657177578'),
('f83f6220-26c4-44d7-a1f9-d55f32f81a26', '5d98899e-ff92-4fde-928d-b39657177578'),
('1b57d9da-899e-4905-bd38-3dc4b7cca423', '67326f77-b691-401c-ad6b-d9062eefd9f5'),
('2cd03325-bcbd-4f3b-9e92-f3515480691b', '67326f77-b691-401c-ad6b-d9062eefd9f5'),
('3b6b4079-6a7c-4430-872a-a949f7467c72', '67326f77-b691-401c-ad6b-d9062eefd9f5'),
('3ce6e865-1e44-4abf-ac91-b2e4aebc2d9c', '67326f77-b691-401c-ad6b-d9062eefd9f5'),
('42ffd3eb-231c-43b3-9d66-89404bcf5685', '67326f77-b691-401c-ad6b-d9062eefd9f5'),
('4620ae18-682d-4c9e-93b0-98532fb8beed', '67326f77-b691-401c-ad6b-d9062eefd9f5'),
('5d04c1e0-a46f-404c-80fc-1c26d884481a', '67326f77-b691-401c-ad6b-d9062eefd9f5'),
('65424ff1-a56f-483e-9ee3-b2ee1687d052', '67326f77-b691-401c-ad6b-d9062eefd9f5'),
('6c1c0511-943b-432a-83ea-73423025f4e6', '67326f77-b691-401c-ad6b-d9062eefd9f5'),
('92673501-6758-47f0-a199-eb54070eabe5', '67326f77-b691-401c-ad6b-d9062eefd9f5'),
('94ef446f-2f2d-48b0-be78-8f084824b902', '67326f77-b691-401c-ad6b-d9062eefd9f5'),
('974222a0-be66-408f-aedd-305dc760b1b5', '67326f77-b691-401c-ad6b-d9062eefd9f5'),
('a3f686e0-6381-4dbf-955e-47dbc331a2fa', '67326f77-b691-401c-ad6b-d9062eefd9f5'),
('a46cae04-9c67-40a2-873e-7ad52db1d0d6', '67326f77-b691-401c-ad6b-d9062eefd9f5'),
('b2e9546a-f09b-4be6-a5e9-1ccfb0359287', '67326f77-b691-401c-ad6b-d9062eefd9f5'),
('c154e512-e001-4f74-85d7-3a23f9c406dc', '67326f77-b691-401c-ad6b-d9062eefd9f5'),
('ced804d2-a918-4a1b-89ed-25ae59d3808b', '67326f77-b691-401c-ad6b-d9062eefd9f5'),
('d4f90c49-46da-433a-a213-ab9a42543f8f', '67326f77-b691-401c-ad6b-d9062eefd9f5'),
('d8f5d731-38c1-4a18-86f2-ec6209b59a5b', '67326f77-b691-401c-ad6b-d9062eefd9f5'),
('feba1c2d-8c2b-4caa-a793-6c8ed686d768', '67326f77-b691-401c-ad6b-d9062eefd9f5'),
('0951a4f5-ae77-4abb-bac1-11e0397f45f9', '6de7636d-931a-4634-9b7d-c4fd1c2211d0'),
('1d518008-e719-4692-b4cf-a35288b91c74', '6de7636d-931a-4634-9b7d-c4fd1c2211d0'),
('26499471-e268-4dda-b7e4-eef30ac7fdf6', '6de7636d-931a-4634-9b7d-c4fd1c2211d0'),
('3fe5ee39-5431-4512-aea1-f3725b97712a', '6de7636d-931a-4634-9b7d-c4fd1c2211d0'),
('4fc17ad5-e7b9-465c-b31e-e0e21bad2cd2', '6de7636d-931a-4634-9b7d-c4fd1c2211d0'),
('5d001bb0-ad30-4997-8940-00c5dd00be0c', '6de7636d-931a-4634-9b7d-c4fd1c2211d0'),
('5faf3ba1-5429-4c81-b1df-c2dce466b6b3', '6de7636d-931a-4634-9b7d-c4fd1c2211d0'),
('89d1d45e-755d-4226-a96a-7caee3197d9e', '6de7636d-931a-4634-9b7d-c4fd1c2211d0'),
('8becfb73-b9a9-46e1-99f1-232a9337fe28', '6de7636d-931a-4634-9b7d-c4fd1c2211d0'),
('9a36f513-2e42-465c-85d2-6eb6e1116d0b', '6de7636d-931a-4634-9b7d-c4fd1c2211d0'),
('b4ff37c3-7a16-4986-8724-1778f48c2fa2', '6de7636d-931a-4634-9b7d-c4fd1c2211d0'),
('c15040f0-5f87-457c-9e42-f2d683aaf6e3', '6de7636d-931a-4634-9b7d-c4fd1c2211d0'),
('dd995aa0-a725-4736-ab75-992da4d9efbe', '6de7636d-931a-4634-9b7d-c4fd1c2211d0'),
('e3f1e5d1-b323-4d04-8b1e-aba1b505f2b0', '6de7636d-931a-4634-9b7d-c4fd1c2211d0'),
('e62f789b-0bfc-42d7-8d9d-2506a919681e', '6de7636d-931a-4634-9b7d-c4fd1c2211d0'),
('e9f3b315-4078-482e-a742-8609abedcced', '6de7636d-931a-4634-9b7d-c4fd1c2211d0'),
('ebfdd9f9-605b-46ea-b551-8f318d996a4d', '6de7636d-931a-4634-9b7d-c4fd1c2211d0'),
('fa8ef825-c2d5-4f97-9a14-11153f996436', '6de7636d-931a-4634-9b7d-c4fd1c2211d0'),
('fef6ab74-725f-4c3e-91db-116741de3b7b', '6de7636d-931a-4634-9b7d-c4fd1c2211d0'),
('ff10efb1-c983-48b6-91e6-74c269d9dd07', '6de7636d-931a-4634-9b7d-c4fd1c2211d0'),
('01976da6-7512-4f12-8cf1-327b60ee094a', '7f48904c-0d3d-422f-a95b-36af1b47dc31'),
('0c5cff54-f451-4d1a-8414-ad9a9abd25b8', '7f48904c-0d3d-422f-a95b-36af1b47dc31'),
('10038f21-0aa4-452e-860e-8721b66c2fed', '7f48904c-0d3d-422f-a95b-36af1b47dc31'),
('19007290-9aa3-4989-a66d-79201f57bdd2', '7f48904c-0d3d-422f-a95b-36af1b47dc31'),
('34338f56-71ab-4626-b795-5f69bc7a74c2', '7f48904c-0d3d-422f-a95b-36af1b47dc31'),
('60657355-8a61-457e-a500-3916e5f445d8', '7f48904c-0d3d-422f-a95b-36af1b47dc31'),
('74acd6de-5181-4aa4-8da4-f9d6f5e299e1', '7f48904c-0d3d-422f-a95b-36af1b47dc31'),
('96cab525-31c9-4490-9ed6-4fd9efcb1f4f', '7f48904c-0d3d-422f-a95b-36af1b47dc31'),
('9c025252-c7f6-4e29-8f29-d4af1d53d697', '7f48904c-0d3d-422f-a95b-36af1b47dc31'),
('a070c253-beb6-4f74-bb0e-456919d127e2', '7f48904c-0d3d-422f-a95b-36af1b47dc31'),
('aa504b7d-1e1b-4944-9873-e88a83b8caa4', '7f48904c-0d3d-422f-a95b-36af1b47dc31'),
('aaef06e7-1ec4-4c35-835b-dd48ad3ccc14', '7f48904c-0d3d-422f-a95b-36af1b47dc31'),
('b440999e-7727-4bc5-9d8d-c4849b07256d', '7f48904c-0d3d-422f-a95b-36af1b47dc31'),
('be1bbb0f-fa61-4f1f-bf81-8fb545529ddc', '7f48904c-0d3d-422f-a95b-36af1b47dc31'),
('bf828256-3f21-4197-a7b7-b3e3a36a1741', '7f48904c-0d3d-422f-a95b-36af1b47dc31'),
('c1fed5f1-db4d-4949-b033-22b96baa0958', '7f48904c-0d3d-422f-a95b-36af1b47dc31'),
('ca9dc425-d995-4542-9b76-b0c9a058531f', '7f48904c-0d3d-422f-a95b-36af1b47dc31'),
('d42ad42e-ed6b-421e-a0c4-b479a667dff9', '7f48904c-0d3d-422f-a95b-36af1b47dc31'),
('ddf160f9-45d3-4ab9-9c80-c6de4f8e9f3c', '7f48904c-0d3d-422f-a95b-36af1b47dc31'),
('f34ef804-6586-4474-a1ba-c96f55ec0c11', '7f48904c-0d3d-422f-a95b-36af1b47dc31'),
('166df599-b424-46a2-9d1c-f478c3d0eaec', '98170b7c-bc84-438a-82ba-092396a3f753'),
('441cdcf2-2613-49c6-b50a-a731a1a11c66', '98170b7c-bc84-438a-82ba-092396a3f753'),
('7e6fbb17-86bc-4b63-9ced-e768322052be', '98170b7c-bc84-438a-82ba-092396a3f753'),
('93458508-934b-4c52-b4e8-38741f411fca', '98170b7c-bc84-438a-82ba-092396a3f753'),
('935854ab-dd7c-47fd-94af-598b0aab7351', '98170b7c-bc84-438a-82ba-092396a3f753'),
('9ae0b06d-74e2-460a-8606-08324969fe10', '98170b7c-bc84-438a-82ba-092396a3f753'),
('a106733b-eb1e-44ad-8546-4cc9000a017b', '98170b7c-bc84-438a-82ba-092396a3f753'),
('a6d85c9c-a6f6-4342-aab4-334de5cd04b6', '98170b7c-bc84-438a-82ba-092396a3f753'),
('a872dd72-4e21-4a45-b78a-f5660e08af0c', '98170b7c-bc84-438a-82ba-092396a3f753'),
('af84aee2-599b-445a-95f6-7975cac58825', '98170b7c-bc84-438a-82ba-092396a3f753'),
('c81779bd-8115-48b1-972c-d714c1c6481d', '98170b7c-bc84-438a-82ba-092396a3f753'),
('ca2fa9c6-197e-476d-bb0f-4ced7d60c91a', '98170b7c-bc84-438a-82ba-092396a3f753'),
('d4e4fa9a-918b-41c6-8b67-d0829ce34f2e', '98170b7c-bc84-438a-82ba-092396a3f753'),
('e3745208-e81c-43cd-bb45-00aa91eb32e8', '98170b7c-bc84-438a-82ba-092396a3f753'),
('fdd43310-48bd-4e96-81ef-af8a2349dcb9', '98170b7c-bc84-438a-82ba-092396a3f753'),
('0ae6c29d-0488-41a5-84f9-f30b458a6abe', 'a532a909-d829-41c0-affa-cf536479ba5e'),
('1aefd560-06df-4af3-bc5d-7f4a5c23d166', 'a532a909-d829-41c0-affa-cf536479ba5e'),
('23094e25-b2be-40e8-be9a-aa74a14ca876', 'a532a909-d829-41c0-affa-cf536479ba5e'),
('46714556-308c-4452-b77f-d11e6be02781', 'a532a909-d829-41c0-affa-cf536479ba5e'),
('7484d877-4391-4467-b072-878bd8c50fde', 'a532a909-d829-41c0-affa-cf536479ba5e'),
('8095758b-be57-43eb-9604-c3b43c253934', 'a532a909-d829-41c0-affa-cf536479ba5e'),
('81760706-d444-48b1-b4a8-7f43cbf186f7', 'a532a909-d829-41c0-affa-cf536479ba5e'),
('8839dbd1-50c5-4f26-abc9-20745c7371c6', 'a532a909-d829-41c0-affa-cf536479ba5e'),
('89966cef-954f-4dce-9e1c-b866c13e4715', 'a532a909-d829-41c0-affa-cf536479ba5e'),
('a9bc7b16-e45a-4db6-bc5e-d843d1d824ed', 'a532a909-d829-41c0-affa-cf536479ba5e'),
('c7df9dd9-45d8-40b8-956e-c5a04ce50ba6', 'a532a909-d829-41c0-affa-cf536479ba5e'),
('e2517ef9-0bad-4826-a600-5f03ea88652e', 'a532a909-d829-41c0-affa-cf536479ba5e'),
('eab95d0a-a36c-4bca-8c03-abc636c08f44', 'a532a909-d829-41c0-affa-cf536479ba5e'),
('ecb1d5d9-e11c-4110-b5ce-4d80a8300428', 'a532a909-d829-41c0-affa-cf536479ba5e'),
('fdcc51e0-49e9-46e2-b884-d4bb9bf0e26a', 'a532a909-d829-41c0-affa-cf536479ba5e'),
('09ce94d6-1bfa-4f5c-af83-f66533b3a037', 'a6b04267-25c6-43ab-8300-8fc16b07e54f'),
('2254fc1f-99a2-4422-80f8-b6c4b2e16833', 'a6b04267-25c6-43ab-8300-8fc16b07e54f'),
('48547098-fe2b-4bc9-be07-eb553068e578', 'a6b04267-25c6-43ab-8300-8fc16b07e54f'),
('4f838e3b-8051-46e2-a4cc-781c9aa45815', 'a6b04267-25c6-43ab-8300-8fc16b07e54f'),
('6542245b-1fe7-4825-9751-27f19886f663', 'a6b04267-25c6-43ab-8300-8fc16b07e54f'),
('6a6ef18c-4b40-4eea-82d2-72fcb7d41c44', 'a6b04267-25c6-43ab-8300-8fc16b07e54f'),
('901fc4fb-4580-4be4-86a5-c7c414a78362', 'a6b04267-25c6-43ab-8300-8fc16b07e54f'),
('a5f1ba77-9586-4119-a5c8-63463763bace', 'a6b04267-25c6-43ab-8300-8fc16b07e54f'),
('ba3522cb-147d-4137-8e09-95b4439359e2', 'a6b04267-25c6-43ab-8300-8fc16b07e54f'),
('f68628cc-a4e3-4aa4-a0f1-1b89dde07461', 'a6b04267-25c6-43ab-8300-8fc16b07e54f'),
('01fbe687-bfdb-45a3-a2e4-db5506a2d2a4', 'a77a766c-fd99-472c-9f73-0b231c855588'),
('0c8dd074-b6bc-4247-a2ab-0169f116fced', 'a77a766c-fd99-472c-9f73-0b231c855588'),
('3c3bc530-85a4-4519-bdba-364ef89dced3', 'a77a766c-fd99-472c-9f73-0b231c855588'),
('56e1185b-b3c8-4916-ba77-01872d7a8065', 'a77a766c-fd99-472c-9f73-0b231c855588'),
('5abb56ac-c954-4881-a043-7dad9919cb88', 'a77a766c-fd99-472c-9f73-0b231c855588'),
('5bd34e01-320d-4941-94c6-23a757e6c864', 'a77a766c-fd99-472c-9f73-0b231c855588'),
('60886812-bd3e-4015-8e4d-4647514ed248', 'a77a766c-fd99-472c-9f73-0b231c855588'),
('8df877de-6535-4622-8a1e-a95856739bd5', 'a77a766c-fd99-472c-9f73-0b231c855588'),
('92c02110-2c73-474d-902a-eed9644cd34a', 'a77a766c-fd99-472c-9f73-0b231c855588'),
('97e74fd8-edd9-4b60-8658-c20e185277d1', 'a77a766c-fd99-472c-9f73-0b231c855588'),
('cc0d5570-2149-4bf9-b1b0-c4aab9844da0', 'a77a766c-fd99-472c-9f73-0b231c855588'),
('ce954c2d-9a95-4d50-a75e-ea777d3d4a41', 'a77a766c-fd99-472c-9f73-0b231c855588'),
('e2316e97-e004-4e27-b913-c5ae1cd8b149', 'a77a766c-fd99-472c-9f73-0b231c855588'),
('e290756b-bc6b-4d39-b84b-0ec53889827f', 'a77a766c-fd99-472c-9f73-0b231c855588'),
('e530ae08-463a-4a00-9c4e-65506e3c7506', 'a77a766c-fd99-472c-9f73-0b231c855588'),
('13a60827-8b51-48fa-89df-7c3d49364504', 'b5dbf8ad-bc64-4030-89ca-d54fa095123a'),
('2081a763-ce2c-4316-b90e-135b10c701bd', 'b5dbf8ad-bc64-4030-89ca-d54fa095123a'),
('280b03c1-52b3-4e56-9ffc-0902d9e59c0b', 'b5dbf8ad-bc64-4030-89ca-d54fa095123a'),
('29b4ac01-1c77-4023-8773-1ac75d3b38f2', 'b5dbf8ad-bc64-4030-89ca-d54fa095123a'),
('2ef54482-5b15-4311-b45b-6b80a5f69b31', 'b5dbf8ad-bc64-4030-89ca-d54fa095123a'),
('3d06077c-44c0-4fa7-8fc3-cdb64f5aa662', 'b5dbf8ad-bc64-4030-89ca-d54fa095123a'),
('4a55d5b0-a4cc-4bc5-9fe7-ded78b3c08c1', 'b5dbf8ad-bc64-4030-89ca-d54fa095123a'),
('5e8bd7c9-10b3-4932-a1c6-74488e5dc189', 'b5dbf8ad-bc64-4030-89ca-d54fa095123a'),
('77d6b863-ddab-46f9-9be8-a52a6e868b91', 'b5dbf8ad-bc64-4030-89ca-d54fa095123a'),
('7be93325-9c91-4373-a526-725999f92cef', 'b5dbf8ad-bc64-4030-89ca-d54fa095123a'),
('929ad1d6-6684-4dff-adec-5d8107eca008', 'b5dbf8ad-bc64-4030-89ca-d54fa095123a'),
('bd520db2-bd84-4b5f-995e-25040717e7f9', 'b5dbf8ad-bc64-4030-89ca-d54fa095123a'),
('cb00272d-1f97-496c-b7e4-bfde816e723a', 'b5dbf8ad-bc64-4030-89ca-d54fa095123a'),
('d23d396c-e5d3-4b8b-9a09-4315ea724545', 'b5dbf8ad-bc64-4030-89ca-d54fa095123a'),
('de00fff8-9702-4303-a5d4-c7b2efb92263', 'b5dbf8ad-bc64-4030-89ca-d54fa095123a'),
('16c4ce0c-df41-4d0e-8c0b-dba14cb1ec41', 'b6041c20-d4d7-4f6e-b99b-e872a2bd0ecd'),
('6808ed97-48a1-4482-a30c-b76e47d5ba79', 'b6041c20-d4d7-4f6e-b99b-e872a2bd0ecd'),
('9067f7a4-73d9-4988-a3d6-cc8c72fad8bd', 'b6041c20-d4d7-4f6e-b99b-e872a2bd0ecd'),
('97fd4262-0f44-44c4-8b9d-b5c4ab87fbfa', 'b6041c20-d4d7-4f6e-b99b-e872a2bd0ecd'),
('98866ace-ef68-4986-9681-cfc5d78aea43', 'b6041c20-d4d7-4f6e-b99b-e872a2bd0ecd'),
('98d3c630-732f-42c0-8cc9-9cbe2851eaf4', 'b6041c20-d4d7-4f6e-b99b-e872a2bd0ecd'),
('9cd66086-d9e6-4718-ae64-fcee2f16e35e', 'b6041c20-d4d7-4f6e-b99b-e872a2bd0ecd'),
('ae9ba8e7-c5b6-4c53-b69a-c7730a8ce56e', 'b6041c20-d4d7-4f6e-b99b-e872a2bd0ecd'),
('db86ad37-22dc-4f64-86df-ae7b532d32df', 'b6041c20-d4d7-4f6e-b99b-e872a2bd0ecd'),
('ea6cc400-4915-49e8-8222-21f56608ad7d', 'b6041c20-d4d7-4f6e-b99b-e872a2bd0ecd'),
('47f0a4d2-d270-4a07-a386-da9a99a247a4', 'ba982c15-baf4-47da-a3a2-6a1bae60a1b2'),
('48af1b6d-28f9-42e0-9e1e-80d2fc8071da', 'ba982c15-baf4-47da-a3a2-6a1bae60a1b2'),
('64ab584d-7d6e-477c-bd1f-c6df97052d3c', 'ba982c15-baf4-47da-a3a2-6a1bae60a1b2'),
('8d67283f-df22-423b-9bb3-343f126af390', 'ba982c15-baf4-47da-a3a2-6a1bae60a1b2'),
('a340ff03-9ded-4279-a7d6-3caf0d5acceb', 'ba982c15-baf4-47da-a3a2-6a1bae60a1b2'),
('d185c3ae-d8b9-412b-920d-a16f76bbbeef', 'ba982c15-baf4-47da-a3a2-6a1bae60a1b2'),
('dd2af500-78e6-43dc-9d22-23ce0b765338', 'ba982c15-baf4-47da-a3a2-6a1bae60a1b2'),
('e28d06d3-6310-495b-9270-f86286704ef2', 'ba982c15-baf4-47da-a3a2-6a1bae60a1b2'),
('ecaa012f-e6c5-4b51-b87a-19bd1b8b9dee', 'ba982c15-baf4-47da-a3a2-6a1bae60a1b2'),
('f06ef899-edca-4e2c-b3c9-3d262259d187', 'ba982c15-baf4-47da-a3a2-6a1bae60a1b2'),
('16af47d1-742d-4f68-af56-db6ac825df2d', 'be6a7952-2d94-4043-9446-dae1a5b3a204'),
('1ed8c2ba-165d-4602-9096-a9c504497467', 'be6a7952-2d94-4043-9446-dae1a5b3a204'),
('30fa5779-899d-4b63-b999-2652048d8e9a', 'be6a7952-2d94-4043-9446-dae1a5b3a204'),
('36a4c3ff-cd24-49ea-b22d-8847e67c2b25', 'be6a7952-2d94-4043-9446-dae1a5b3a204'),
('392d1402-7501-458e-a21a-ab0b366cd686', 'be6a7952-2d94-4043-9446-dae1a5b3a204'),
('47f638f9-2cc5-4ac7-bdd4-c4745d029553', 'be6a7952-2d94-4043-9446-dae1a5b3a204'),
('4dfcf8a0-32f4-4513-a783-721bd2246139', 'be6a7952-2d94-4043-9446-dae1a5b3a204'),
('5b898892-1723-4d0a-854b-17413d272fdb', 'be6a7952-2d94-4043-9446-dae1a5b3a204'),
('6431e400-6072-4b83-9cf6-36a3ea70c05a', 'be6a7952-2d94-4043-9446-dae1a5b3a204'),
('65babdf0-404f-41d2-a9f4-6d5d5a6a3bf8', 'be6a7952-2d94-4043-9446-dae1a5b3a204'),
('687faab3-a34f-4c44-b7d9-7eef6aa8436f', 'be6a7952-2d94-4043-9446-dae1a5b3a204'),
('7818a6be-a179-4676-8024-5eda8f414887', 'be6a7952-2d94-4043-9446-dae1a5b3a204'),
('96319b01-4f60-4598-97c3-f69ed8c130a7', 'be6a7952-2d94-4043-9446-dae1a5b3a204'),
('aa8286cf-2a66-42dd-829b-f956564c7da6', 'be6a7952-2d94-4043-9446-dae1a5b3a204'),
('ada5df12-11a3-4186-a3d3-a0ee634295ba', 'be6a7952-2d94-4043-9446-dae1a5b3a204'),
('cb70fa42-7a94-4e25-8196-7ff1908a70b8', 'be6a7952-2d94-4043-9446-dae1a5b3a204'),
('d2b1126c-b64d-4d87-8e1c-fbb4c4949e20', 'be6a7952-2d94-4043-9446-dae1a5b3a204'),
('dd60bd92-6b2e-4194-8225-647fe5c304c0', 'be6a7952-2d94-4043-9446-dae1a5b3a204'),
('e3cdb2d0-19cf-4559-9bc8-dfaca71b42e4', 'be6a7952-2d94-4043-9446-dae1a5b3a204'),
('fc20e83b-ad23-4cb4-bc1f-36dca7b1d8ad', 'be6a7952-2d94-4043-9446-dae1a5b3a204'),
('59e7042d-d2fa-406e-9eaf-c8dd5b64870f', 'c660b145-3d63-4f1c-8320-fc055539eb9c'),
('7c9a8024-9671-46cb-bc4e-cfa7d314eeb0', 'c660b145-3d63-4f1c-8320-fc055539eb9c'),
('a7f45a15-4524-4ea0-b82e-0abb1862e5a2', 'c660b145-3d63-4f1c-8320-fc055539eb9c'),
('f0d6323e-0ba3-4a4a-b78e-d86762ff7071', 'c660b145-3d63-4f1c-8320-fc055539eb9c'),
('fcf0c591-26b7-4085-9181-0bf4e12e7858', 'c660b145-3d63-4f1c-8320-fc055539eb9c'),
('36fe8cb2-e499-4a9b-8f3a-141ee35acba9', 'd81b755c-cd95-43ba-b9f6-464b2d915dd3'),
('38acbdfc-8d84-4575-a330-2ecf525db63a', 'd81b755c-cd95-43ba-b9f6-464b2d915dd3'),
('48178f4b-abcd-464e-87b9-26d25bd6e7e3', 'd81b755c-cd95-43ba-b9f6-464b2d915dd3'),
('6372f78e-9a07-4524-870e-5c81614c6bb9', 'd81b755c-cd95-43ba-b9f6-464b2d915dd3'),
('6a0bafc1-2b2d-4da6-a02b-b0abac2789cb', 'd81b755c-cd95-43ba-b9f6-464b2d915dd3'),
('8115fbba-2ebc-4cc3-95b6-4394d86e09c0', 'd81b755c-cd95-43ba-b9f6-464b2d915dd3'),
('8e58ae07-4216-46eb-858d-2b8d66c3c2da', 'd81b755c-cd95-43ba-b9f6-464b2d915dd3'),
('938d6255-bab5-4df3-9caa-3aeacc03692d', 'd81b755c-cd95-43ba-b9f6-464b2d915dd3'),
('94ce5d64-8097-4bf7-8fa0-24370d7c8e23', 'd81b755c-cd95-43ba-b9f6-464b2d915dd3'),
('a047f7f9-08b2-4591-b421-d6e3bcacc348', 'd81b755c-cd95-43ba-b9f6-464b2d915dd3'),
('2661ea7f-2262-4988-b6e3-d416426fa1c5', 'e52a664f-1eac-4fb7-baad-6a83811418f2'),
('2ed031a0-bc03-439d-b856-cd10939a4cfd', 'e52a664f-1eac-4fb7-baad-6a83811418f2'),
('3974e89f-697d-43fc-be2e-59ce5c5df508', 'e52a664f-1eac-4fb7-baad-6a83811418f2'),
('5b892f65-8c42-4954-8da8-9651f22e257f', 'e52a664f-1eac-4fb7-baad-6a83811418f2'),
('5db291d9-8e5a-409b-adfd-cb661c4e3ae4', 'e52a664f-1eac-4fb7-baad-6a83811418f2'),
('75702307-457b-495a-8e2d-3f8e20ed5281', 'e52a664f-1eac-4fb7-baad-6a83811418f2'),
('8092d9a8-809e-484e-9922-1715a05fdc88', 'e52a664f-1eac-4fb7-baad-6a83811418f2'),
('8ab7744b-be87-4afc-a0af-df3196581493', 'e52a664f-1eac-4fb7-baad-6a83811418f2'),
('cdf08177-4f79-4ef2-8fd6-5c4a10e9b336', 'e52a664f-1eac-4fb7-baad-6a83811418f2'),
('d2a0a049-b8df-4d22-a45f-e188a3aa518e', 'e52a664f-1eac-4fb7-baad-6a83811418f2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `directus_activity`
--
ALTER TABLE `directus_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_activity_collection_foreign` (`collection`);

--
-- Indexes for table `directus_collections`
--
ALTER TABLE `directus_collections`
  ADD PRIMARY KEY (`collection`),
  ADD KEY `directus_collections_group_foreign` (`group`);

--
-- Indexes for table `directus_dashboards`
--
ALTER TABLE `directus_dashboards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_dashboards_user_created_foreign` (`user_created`);

--
-- Indexes for table `directus_fields`
--
ALTER TABLE `directus_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_fields_collection_foreign` (`collection`);

--
-- Indexes for table `directus_files`
--
ALTER TABLE `directus_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_files_uploaded_by_foreign` (`uploaded_by`),
  ADD KEY `directus_files_modified_by_foreign` (`modified_by`),
  ADD KEY `directus_files_folder_foreign` (`folder`);

--
-- Indexes for table `directus_flows`
--
ALTER TABLE `directus_flows`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `directus_flows_operation_unique` (`operation`),
  ADD KEY `directus_flows_user_created_foreign` (`user_created`);

--
-- Indexes for table `directus_folders`
--
ALTER TABLE `directus_folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_folders_parent_foreign` (`parent`);

--
-- Indexes for table `directus_migrations`
--
ALTER TABLE `directus_migrations`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `directus_notifications`
--
ALTER TABLE `directus_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_notifications_recipient_foreign` (`recipient`),
  ADD KEY `directus_notifications_sender_foreign` (`sender`);

--
-- Indexes for table `directus_operations`
--
ALTER TABLE `directus_operations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `directus_operations_resolve_unique` (`resolve`),
  ADD UNIQUE KEY `directus_operations_reject_unique` (`reject`),
  ADD KEY `directus_operations_flow_foreign` (`flow`),
  ADD KEY `directus_operations_user_created_foreign` (`user_created`);

--
-- Indexes for table `directus_panels`
--
ALTER TABLE `directus_panels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_panels_dashboard_foreign` (`dashboard`),
  ADD KEY `directus_panels_user_created_foreign` (`user_created`);

--
-- Indexes for table `directus_permissions`
--
ALTER TABLE `directus_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_permissions_collection_foreign` (`collection`),
  ADD KEY `directus_permissions_role_foreign` (`role`);

--
-- Indexes for table `directus_presets`
--
ALTER TABLE `directus_presets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_presets_collection_foreign` (`collection`),
  ADD KEY `directus_presets_user_foreign` (`user`),
  ADD KEY `directus_presets_role_foreign` (`role`);

--
-- Indexes for table `directus_relations`
--
ALTER TABLE `directus_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_relations_many_collection_foreign` (`many_collection`),
  ADD KEY `directus_relations_one_collection_foreign` (`one_collection`);

--
-- Indexes for table `directus_revisions`
--
ALTER TABLE `directus_revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_revisions_collection_foreign` (`collection`),
  ADD KEY `directus_revisions_parent_foreign` (`parent`),
  ADD KEY `directus_revisions_activity_foreign` (`activity`);

--
-- Indexes for table `directus_roles`
--
ALTER TABLE `directus_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `directus_sessions`
--
ALTER TABLE `directus_sessions`
  ADD PRIMARY KEY (`token`),
  ADD KEY `directus_sessions_user_foreign` (`user`),
  ADD KEY `directus_sessions_share_foreign` (`share`);

--
-- Indexes for table `directus_settings`
--
ALTER TABLE `directus_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_settings_project_logo_foreign` (`project_logo`),
  ADD KEY `directus_settings_public_foreground_foreign` (`public_foreground`),
  ADD KEY `directus_settings_public_background_foreign` (`public_background`),
  ADD KEY `directus_settings_storage_default_folder_foreign` (`storage_default_folder`);

--
-- Indexes for table `directus_shares`
--
ALTER TABLE `directus_shares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_shares_collection_foreign` (`collection`),
  ADD KEY `directus_shares_role_foreign` (`role`),
  ADD KEY `directus_shares_user_created_foreign` (`user_created`);

--
-- Indexes for table `directus_translations`
--
ALTER TABLE `directus_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `directus_users`
--
ALTER TABLE `directus_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `directus_users_external_identifier_unique` (`external_identifier`),
  ADD UNIQUE KEY `directus_users_email_unique` (`email`),
  ADD UNIQUE KEY `directus_users_token_unique` (`token`),
  ADD KEY `directus_users_role_foreign` (`role`);

--
-- Indexes for table `directus_webhooks`
--
ALTER TABLE `directus_webhooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_medicine_id_foreign` (`medicine_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_user_created_foreign` (`user_created`),
  ADD KEY `invoice_user_updated_foreign` (`user_updated`);

--
-- Indexes for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_details_user_created_foreign` (`user_created`),
  ADD KEY `invoice_details_user_updated_foreign` (`user_updated`),
  ADD KEY `invoice_details_inventory_id_foreign` (`inventory_id`);

--
-- Indexes for table `invoice_details_inventory`
--
ALTER TABLE `invoice_details_inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_details_inventory_inventory_id_foreign` (`inventory_id`),
  ADD KEY `invoice_details_inventory_invoice_details_id_foreign` (`invoice_details_id`);

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manufacturer_user_created_foreign` (`user_created`),
  ADD KEY `manufacturer_user_updated_foreign` (`user_updated`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `medicine_name_unique` (`name`),
  ADD KEY `medicine_user_created_foreign` (`user_created`),
  ADD KEY `medicine_user_updated_foreign` (`user_updated`),
  ADD KEY `medicine_image_foreign` (`image`),
  ADD KEY `medicine_manufacturer_foreign` (`manufacturer`);

--
-- Indexes for table `medicine_manufacturer`
--
ALTER TABLE `medicine_manufacturer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medicine_manufacturer_manufacturer_id_foreign` (`manufacturer_id`),
  ADD KEY `medicine_manufacturer_medicine_id_foreign` (`medicine_id`);

--
-- Indexes for table `medicine_sku`
--
ALTER TABLE `medicine_sku`
  ADD PRIMARY KEY (`SKU`),
  ADD KEY `medicine_sku_inventory_id_foreign` (`inventory_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `directus_activity`
--
ALTER TABLE `directus_activity`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9275;

--
-- AUTO_INCREMENT for table `directus_fields`
--
ALTER TABLE `directus_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `directus_notifications`
--
ALTER TABLE `directus_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `directus_permissions`
--
ALTER TABLE `directus_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `directus_presets`
--
ALTER TABLE `directus_presets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `directus_relations`
--
ALTER TABLE `directus_relations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `directus_revisions`
--
ALTER TABLE `directus_revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6600;

--
-- AUTO_INCREMENT for table `directus_settings`
--
ALTER TABLE `directus_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `directus_webhooks`
--
ALTER TABLE `directus_webhooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=423;

--
-- AUTO_INCREMENT for table `invoice_details`
--
ALTER TABLE `invoice_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=811;

--
-- AUTO_INCREMENT for table `invoice_details_inventory`
--
ALTER TABLE `invoice_details_inventory`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `medicine_manufacturer`
--
ALTER TABLE `medicine_manufacturer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `directus_collections`
--
ALTER TABLE `directus_collections`
  ADD CONSTRAINT `directus_collections_group_foreign` FOREIGN KEY (`group`) REFERENCES `directus_collections` (`collection`);

--
-- Constraints for table `directus_dashboards`
--
ALTER TABLE `directus_dashboards`
  ADD CONSTRAINT `directus_dashboards_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `directus_files`
--
ALTER TABLE `directus_files`
  ADD CONSTRAINT `directus_files_folder_foreign` FOREIGN KEY (`folder`) REFERENCES `directus_folders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `directus_files_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `directus_users` (`id`),
  ADD CONSTRAINT `directus_files_uploaded_by_foreign` FOREIGN KEY (`uploaded_by`) REFERENCES `directus_users` (`id`);

--
-- Constraints for table `directus_flows`
--
ALTER TABLE `directus_flows`
  ADD CONSTRAINT `directus_flows_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `directus_folders`
--
ALTER TABLE `directus_folders`
  ADD CONSTRAINT `directus_folders_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `directus_folders` (`id`);

--
-- Constraints for table `directus_notifications`
--
ALTER TABLE `directus_notifications`
  ADD CONSTRAINT `directus_notifications_recipient_foreign` FOREIGN KEY (`recipient`) REFERENCES `directus_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_notifications_sender_foreign` FOREIGN KEY (`sender`) REFERENCES `directus_users` (`id`);

--
-- Constraints for table `directus_operations`
--
ALTER TABLE `directus_operations`
  ADD CONSTRAINT `directus_operations_flow_foreign` FOREIGN KEY (`flow`) REFERENCES `directus_flows` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_operations_reject_foreign` FOREIGN KEY (`reject`) REFERENCES `directus_operations` (`id`),
  ADD CONSTRAINT `directus_operations_resolve_foreign` FOREIGN KEY (`resolve`) REFERENCES `directus_operations` (`id`),
  ADD CONSTRAINT `directus_operations_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `directus_panels`
--
ALTER TABLE `directus_panels`
  ADD CONSTRAINT `directus_panels_dashboard_foreign` FOREIGN KEY (`dashboard`) REFERENCES `directus_dashboards` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_panels_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `directus_permissions`
--
ALTER TABLE `directus_permissions`
  ADD CONSTRAINT `directus_permissions_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `directus_presets`
--
ALTER TABLE `directus_presets`
  ADD CONSTRAINT `directus_presets_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_presets_user_foreign` FOREIGN KEY (`user`) REFERENCES `directus_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `directus_revisions`
--
ALTER TABLE `directus_revisions`
  ADD CONSTRAINT `directus_revisions_activity_foreign` FOREIGN KEY (`activity`) REFERENCES `directus_activity` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_revisions_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `directus_revisions` (`id`);

--
-- Constraints for table `directus_sessions`
--
ALTER TABLE `directus_sessions`
  ADD CONSTRAINT `directus_sessions_share_foreign` FOREIGN KEY (`share`) REFERENCES `directus_shares` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_sessions_user_foreign` FOREIGN KEY (`user`) REFERENCES `directus_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `directus_settings`
--
ALTER TABLE `directus_settings`
  ADD CONSTRAINT `directus_settings_project_logo_foreign` FOREIGN KEY (`project_logo`) REFERENCES `directus_files` (`id`),
  ADD CONSTRAINT `directus_settings_public_background_foreign` FOREIGN KEY (`public_background`) REFERENCES `directus_files` (`id`),
  ADD CONSTRAINT `directus_settings_public_foreground_foreign` FOREIGN KEY (`public_foreground`) REFERENCES `directus_files` (`id`),
  ADD CONSTRAINT `directus_settings_storage_default_folder_foreign` FOREIGN KEY (`storage_default_folder`) REFERENCES `directus_folders` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `directus_shares`
--
ALTER TABLE `directus_shares`
  ADD CONSTRAINT `directus_shares_collection_foreign` FOREIGN KEY (`collection`) REFERENCES `directus_collections` (`collection`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_shares_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_shares_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `directus_users`
--
ALTER TABLE `directus_users`
  ADD CONSTRAINT `directus_users_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_medicine_id_foreign` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`),
  ADD CONSTRAINT `invoice_user_updated_foreign` FOREIGN KEY (`user_updated`) REFERENCES `directus_users` (`id`);

--
-- Constraints for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD CONSTRAINT `invoice_details_inventory_id_foreign` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_details_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`),
  ADD CONSTRAINT `invoice_details_user_updated_foreign` FOREIGN KEY (`user_updated`) REFERENCES `directus_users` (`id`);

--
-- Constraints for table `invoice_details_inventory`
--
ALTER TABLE `invoice_details_inventory`
  ADD CONSTRAINT `invoice_details_inventory_inventory_id_foreign` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `invoice_details_inventory_invoice_details_id_foreign` FOREIGN KEY (`invoice_details_id`) REFERENCES `invoice_details` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD CONSTRAINT `manufacturer_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`),
  ADD CONSTRAINT `manufacturer_user_updated_foreign` FOREIGN KEY (`user_updated`) REFERENCES `directus_users` (`id`);

--
-- Constraints for table `medicine`
--
ALTER TABLE `medicine`
  ADD CONSTRAINT `medicine_image_foreign` FOREIGN KEY (`image`) REFERENCES `directus_files` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `medicine_manufacturer_foreign` FOREIGN KEY (`manufacturer`) REFERENCES `manufacturer` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `medicine_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`),
  ADD CONSTRAINT `medicine_user_updated_foreign` FOREIGN KEY (`user_updated`) REFERENCES `directus_users` (`id`);

--
-- Constraints for table `medicine_manufacturer`
--
ALTER TABLE `medicine_manufacturer`
  ADD CONSTRAINT `medicine_manufacturer_manufacturer_id_foreign` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `medicine_manufacturer_medicine_id_foreign` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `medicine_sku`
--
ALTER TABLE `medicine_sku`
  ADD CONSTRAINT `medicine_sku_inventory_id_foreign` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
