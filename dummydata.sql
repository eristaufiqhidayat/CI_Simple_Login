-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2023 at 09:31 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci_simple_login`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_activation_attempts`
--

CREATE TABLE `auth_activation_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups`
--

CREATE TABLE `auth_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_groups`
--

INSERT INTO `auth_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'administrator'),
(2, 'user', 'user biasa'),
(4, 'keuangan', 'Untuk Keuangan');

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_permissions`
--

CREATE TABLE `auth_groups_permissions` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_groups_permissions`
--

INSERT INTO `auth_groups_permissions` (`group_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_users`
--

CREATE TABLE `auth_groups_users` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_groups_users`
--

INSERT INTO `auth_groups_users` (`group_id`, `user_id`) VALUES
(1, 3),
(1, 24),
(2, 24),
(4, 27);

-- --------------------------------------------------------

--
-- Table structure for table `auth_logins`
--

CREATE TABLE `auth_logins` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_logins`
--

INSERT INTO `auth_logins` (`id`, `ip_address`, `email`, `user_id`, `date`, `success`) VALUES
(5, '::1', 'eristaufiq@gmail.com', 3, '2023-06-04 22:13:57', 1),
(6, '::1', 'eristaufiq@gmail.com', 3, '2023-06-05 09:43:31', 1),
(7, '::1', 'eristaufiq@gmail.com', 3, '2023-06-06 07:57:48', 1),
(8, '::1', 'eristaufiq@gmail.com', 3, '2023-06-07 11:06:33', 1),
(9, '::1', 'eristaufiq@gmail.com', 3, '2023-06-07 12:22:52', 1),
(10, '::1', 'eristaufiq@gmail.com', 3, '2023-06-07 12:27:25', 1),
(11, '::1', 'eris', NULL, '2023-06-07 12:43:01', 0),
(12, '::1', 'eris@lembaharafah.com', 7, '2023-06-07 12:43:09', 1),
(13, '::1', 'eris@lembaharafah.com', 7, '2023-06-07 12:43:36', 1),
(14, '::1', 'eris@lembaharafah.com', 7, '2023-06-07 12:45:42', 1),
(15, '::1', 'eristaufiq@gmail.com', 3, '2023-06-07 12:45:55', 1),
(16, '::1', 'eristaufiq@gmail.com', 3, '2023-06-08 08:03:41', 1),
(17, '::1', 'eris@lembaharafah.com', 7, '2023-06-08 08:04:09', 1),
(18, '::1', 'eris', NULL, '2023-06-08 08:13:24', 0),
(19, '::1', 'eris@lembaharafah.com', 7, '2023-06-08 08:13:32', 1),
(20, '::1', 'admi', NULL, '2023-06-08 08:14:27', 0),
(21, '::1', 'eristaufiq@gmail.com', 3, '2023-06-08 08:14:34', 1),
(22, '::1', 'eris', NULL, '2023-06-08 08:15:49', 0),
(23, '::1', 'eris@lembaharafah.com', 7, '2023-06-08 08:15:57', 1),
(24, '::1', 'eris', NULL, '2023-06-08 12:14:33', 0),
(25, '::1', 'eris@lembaharafah.com', 7, '2023-06-08 12:14:48', 1),
(26, '::1', 'eristaufiq@gmail.com', 3, '2023-06-08 12:15:23', 1),
(27, '::1', 'eristaufiq@gmail.com', 3, '2023-06-08 15:26:10', 1),
(28, '::1', 'eris', NULL, '2023-06-08 21:54:35', 0),
(29, '::1', 'admin', NULL, '2023-06-08 21:54:43', 0),
(30, '::1', 'eristaufiq@gmail.com', 3, '2023-06-08 21:54:51', 1),
(31, '::1', 'eris', NULL, '2023-06-09 00:55:29', 0),
(32, '::1', 'eristaufiq@gmail.com', 3, '2023-06-09 00:55:35', 1),
(33, '::1', 'eristaufiq@gmail.com', 3, '2023-06-09 00:56:27', 1),
(34, '::1', 'eristaufiq@gmail.com', 3, '2023-06-09 00:56:36', 1),
(35, '::1', 'eris', NULL, '2023-06-09 00:57:08', 0),
(36, '::1', 'eristaufiq@gmail.com', 3, '2023-06-09 00:57:15', 1),
(37, '::1', 'eristaufiq@gmail.com', 3, '2023-06-09 00:57:54', 1),
(38, '::1', 'eric@example.com', 22, '2023-06-09 03:23:02', 1),
(39, '::1', 'eristaufiq@gmail.com', 3, '2023-06-09 03:24:51', 1),
(40, '::1', 'eric@example.com', 22, '2023-06-09 03:27:13', 1),
(41, '::1', 'admin', NULL, '2023-06-09 03:28:43', 0),
(42, '::1', 'eristaufiq@gmail.com', 3, '2023-06-09 03:28:48', 1),
(43, '::1', 'fizfat@lembaharafah.com', 24, '2023-06-09 03:29:34', 1),
(44, '::1', 'eristaufiq@gmail.com', 3, '2023-06-09 03:40:34', 1),
(45, '::1', 'fizfat@lembaharafah.com', 24, '2023-06-09 04:46:42', 1),
(46, '::1', 'eristaufiq@gmail.com', 3, '2023-06-09 04:48:09', 1),
(47, '::1', 'eristaufiq@gmail.com', 3, '2023-06-09 05:30:27', 1),
(48, '::1', 'fizfat@lembaharafah.com', 24, '2023-06-09 05:35:36', 1),
(49, '::1', 'eristaufiq@gmail.com', 3, '2023-06-09 06:20:02', 1),
(50, '::1', 'fizfat@lembaharafah.com', 24, '2023-06-09 06:20:40', 1),
(51, '::1', 'eristaufiq@gmail.com', 3, '2023-06-09 08:41:48', 1),
(52, '::1', 'eristaufiq@gmail.com', 3, '2023-06-09 22:49:01', 1),
(53, '::1', 'eristaufiq@gmail.com', 3, '2023-06-10 04:35:28', 1),
(54, '::1', 'eristaufiq@gmail.com', 3, '2023-06-10 10:21:11', 1),
(55, '::1', 'eristaufiq@gmail.com', 3, '2023-06-10 18:37:15', 1),
(56, '::1', 'fizfat@lembaharafah.com', 24, '2023-06-10 21:33:15', 1),
(57, '::1', 'eristaufiq@gmail.com', 3, '2023-06-10 21:47:54', 1),
(58, '::1', 'fizfat@lembaharafah.com', 24, '2023-06-10 21:48:24', 1),
(59, '::1', 'eristaufiq@gmail.com', 3, '2023-06-10 21:53:45', 1),
(60, '::1', 'fizfat@lembaharafah.com', 24, '2023-06-10 21:54:00', 1),
(61, '::1', 'fizfat@lembaharafah.com', 24, '2023-06-11 02:30:57', 1),
(62, '::1', 'eris', NULL, '2023-06-11 04:05:49', 0),
(63, '::1', 'eric', NULL, '2023-06-11 04:05:58', 0),
(64, '::1', 'fizfat@lembaharafah.com', 24, '2023-06-11 04:06:05', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permissions`
--

CREATE TABLE `auth_permissions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permissions`
--

INSERT INTO `auth_permissions` (`id`, `name`, `description`) VALUES
(1, 'admin', 'admin module'),
(2, 'Menu', 'Admin Menu');

-- --------------------------------------------------------

--
-- Table structure for table `auth_reset_attempts`
--

CREATE TABLE `auth_reset_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_tokens`
--

CREATE TABLE `auth_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_users_permissions`
--

CREATE TABLE `auth_users_permissions` (
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(13, '2017-11-20-223112', 'Myth\\Auth\\Database\\Migrations\\CreateAuthTables', 'default', 'Myth\\Auth', 1685883226, 1),
(14, '2022-01-31-013057', 'App\\Database\\Migrations\\AddBlog', 'default', 'App', 1685883226, 1),
(15, '2022-01-31-013057', 'App\\Database\\Migrations\\AddModule', 'default', 'App', 1685883351, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id_menu` int(5) UNSIGNED NOT NULL,
  `id_module` int(5) NOT NULL,
  `path` varchar(50) NOT NULL,
  `menu` varchar(50) NOT NULL,
  `icon` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`id_menu`, `id_module`, `path`, `menu`, `icon`) VALUES
(1, 1, 'users/index', 'users', 'fas fa-restroom'),
(2, 1, 'groups/index', 'auth_groups', 'fa fa-users'),
(3, 1, 'permission/index', 'auth_permission', 'fas fa-restroom'),
(4, 2, 'module/index', 'Data Module', 'fas fa-restroom'),
(5, 2, 'menu/index', 'Data Menu', 'fas fa-restroom'),
(6, 1, 'permissiongroups/index', 'auth_permission_groups', 'fas fa-restroom'),
(7, 1, 'groupsusers/index', 'auth_groups_users', 'fas fa-restroom');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_module`
--

CREATE TABLE `tbl_module` (
  `id_module` int(5) UNSIGNED NOT NULL,
  `nama_module` varchar(50) NOT NULL,
  `icon` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_module`
--

INSERT INTO `tbl_module` (`id_module`, `nama_module`, `icon`) VALUES
(1, 'Admin', ''),
(2, 'Module', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password_hash`, `reset_hash`, `reset_at`, `reset_expires`, `activate_hash`, `status`, `status_message`, `active`, `force_pass_reset`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'eristaufiq@gmail.com', 'admin', '$2y$10$YiKAtYbHEr6.h6F7uzg/CeEbArCrgXnUv1rAiXjzeKnEO6vFD8XIu', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-06-04 22:07:01', NULL, NULL),
(24, 'fizfat@lembaharafah.com', 'eric', '$2y$10$H5ar4odFFOnSpxixHirW7.PrNxHBbBAwdQR4ePdyYYSFt0F76s2du', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-06-09 03:29:16', '2023-06-09 03:29:16', NULL),
(27, 'arsila24@gmail.com', 'icha', '$2y$10$nHEBfTBL5.ovA/9XLeIThuogw0C/eRr7WxFltc0wgANJOsA2h/vnC', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-06-09 10:12:22', '2023-06-09 10:12:22', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups`
--
ALTER TABLE `auth_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `group_id_permission_id` (`group_id`,`permission_id`);

--
-- Indexes for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD KEY `auth_groups_users_user_id_foreign` (`user_id`),
  ADD KEY `group_id_user_id` (`group_id`,`user_id`);

--
-- Indexes for table `auth_logins`
--
ALTER TABLE `auth_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_tokens_user_id_foreign` (`user_id`),
  ADD KEY `selector` (`selector`);

--
-- Indexes for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `user_id_permission_id` (`user_id`,`permission_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `tbl_module`
--
ALTER TABLE `tbl_module`
  ADD PRIMARY KEY (`id_module`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_groups`
--
ALTER TABLE `auth_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id_menu` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_module`
--
ALTER TABLE `tbl_module`
  MODIFY `id_module` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
