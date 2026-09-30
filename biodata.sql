-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 30, 2026 at 02:06 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `katalogt`
--
CREATE DATABASE IF NOT EXISTS `katalogt` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `katalogt`;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `product_id`, `user_id`, `parent_id`, `name`, `body`, `created_at`, `updated_at`) VALUES
(1, 4, 2, NULL, 'User Demo', 'Z', '2026-09-27 23:49:42', '2026-09-27 23:49:42'),
(2, 4, 1, 1, 'Admin Katalog', 'V', '2026-09-27 23:54:01', '2026-09-27 23:54:01'),
(3, 9, 5, NULL, 'V', 'Mahal', '2026-09-29 00:00:56', '2026-09-29 00:00:56'),
(4, 9, 1, 3, 'Admin Katalog', 'Berkualitas Mas', '2026-09-29 00:01:27', '2026-09-29 00:01:27');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_01_01_000001_create_products_table', 2),
(5, '2024_01_02_000001_add_image_to_products_table', 3),
(6, '2024_01_03_000001_create_comments_table', 3),
(7, '2024_01_04_000001_add_role_to_users_table', 3),
(8, '2024_01_04_000002_add_user_id_to_products_table', 3),
(9, '2024_01_04_000003_add_user_id_to_comments_table', 3),
(10, '2024_01_05_000001_add_parent_id_to_comments_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `name`, `description`, `price`, `image`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Kaos Polos Premium', 'Kaos cotton combed 30s, nyaman dipakai sehari-hari.', 85000.00, NULL, '2026-09-16 17:31:32', '2026-09-16 17:31:32'),
(3, NULL, 'Sepatu Sneakers Casual', 'Sepatu casual unisex, ringan dan trendy.', 220000.00, NULL, '2026-09-16 17:31:32', '2026-09-16 17:31:32'),
(4, 1, 'Kaos Polos Premium', 'Kaos cotton combed 30s, nyaman dipakai sehari-hari.', 85000.00, 'products/vrWYkr21e1gSnQ2WspUjCH5x8A4qVneHjBsoS6cm.jpg', '2026-09-27 16:10:27', '2026-09-28 23:57:51'),
(5, 1, 'Tas Ransel Anti Air', 'Tas ransel dengan bahan waterproof, cocok untuk kuliah/kerja.', 150000.00, NULL, '2026-09-27 16:10:27', '2026-09-27 16:10:27'),
(6, 1, 'Sepatu Sneakers Casual', 'Sepatu casual unisex, ringan dan trendy.', 220000.00, NULL, '2026-09-27 16:10:27', '2026-09-27 16:10:27'),
(8, NULL, 'Tas Ransel', 'Tas', 200000.00, NULL, '2026-09-27 23:48:42', '2026-09-27 23:48:42'),
(9, NULL, 'Jas Hujan', 'Berwarna Biru Ukuran Dewasa', 200000.00, 'products/UjX8OeZLxPlTSFy4qYhIQyf0KrezofK4hELlZXO6.jpg', '2026-09-29 00:00:19', '2026-09-29 00:00:19');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('7RZKPqSs4gjRaWTK0vskDhmXlAHuJD9zRu4tTlTw', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiY3FBRGtBVFVhY1dGT0ZKYm9VdUxUMlpySkRhMER2Z0poeFp6RG1vOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cy85IjtzOjU6InJvdXRlIjtzOjEzOiJwcm9kdWN0cy5zaG93Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NTt9', 1790665325);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin Katalog', 'admin@katalog.com', 'admin', NULL, '$2y$12$igqBWvheLJ82gwspnFOdmexL7SL4TwSHjI1OQXM5u9d2prx1iNZfm', 'Ivl87JHTGhyoFXSxPJuzNsywt3L1PefVF1ZqCIuEjL0KLXFma3V7gi6jRaAV', '2026-09-27 16:10:26', '2026-09-27 16:10:26'),
(2, 'User Demo', 'user@katalog.com', 'user', NULL, '$2y$12$Q3QZVVJsKXyYz9xh/wQz9utiGkz3QF/GZWF4q9qVd/jNYUI3z5jJe', NULL, '2026-09-27 16:10:27', '2026-09-27 16:10:27'),
(3, 'V', 'z@gmail.com', 'user', NULL, '$2y$12$GRHiLIwCj6FK2LZRteZUyepA7MnYugmpWdnZy8jd1h8O.uJ9TeZOi', NULL, '2026-09-27 16:13:50', '2026-09-27 16:13:50'),
(4, 'V', 'v@gmail.com', 'user', NULL, '$2y$12$NE7T0Rtutgl7SiObjXkNaO5lOvVkyfBdJ49Mqps3EeI5GVBZy6srO', NULL, '2026-09-28 00:48:33', '2026-09-28 00:48:33'),
(5, 'V', 'va@gmail.com', 'user', NULL, '$2y$12$vV4kR0EJZg2EUXPtGamz8etcYgAfx8nRB8F/2HwM2J2WL5ZY76ltO', NULL, '2026-09-29 00:00:46', '2026-09-29 00:00:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_product_id_foreign` (`product_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
--
-- Database: `psiswa`
--
CREATE DATABASE IF NOT EXISTS `psiswa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `psiswa`;

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `action` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_id` bigint UNSIGNED DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `user_id`, `action`, `module`, `record_id`, `description`, `metadata`, `ip_address`, `created_at`) VALUES
(1, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-21 06:05:42'),
(2, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-21 06:17:24'),
(3, 1, 'create', 'classes', 4, 'Kelas XII RPL 1 dibuat', '[]', '127.0.0.1', '2026-08-21 06:18:20'),
(4, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-21 08:56:39'),
(5, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-23 09:08:47'),
(6, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-23 22:06:18'),
(7, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-28 05:45:27'),
(8, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-28 23:42:31'),
(9, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-28 23:53:11'),
(10, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-29 00:32:18'),
(11, 1, 'logout', 'auth', 1, 'User Super Admin logout', '[]', '127.0.0.1', '2026-08-29 01:17:30'),
(12, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-29 01:27:01'),
(13, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-29 06:23:44'),
(14, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-29 06:51:29'),
(15, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-29 06:51:36'),
(16, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-29 06:51:40'),
(17, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-29 06:51:47'),
(18, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-29 06:54:01'),
(19, 1, 'create', 'late_records', 1, 'Keterlambatan 30 menit — Andi Pratama (2026-08-29 00:00:00)', '{\"minutes\": 30, \"student_id\": 1}', '127.0.0.1', '2026-08-29 06:56:02'),
(20, 1, 'update', 'late_records', 1, 'Keterlambatan Andi Pratama (2026-08-29 00:00:00) dibatalkan', '{\"student_id\": 1}', '127.0.0.1', '2026-08-29 06:56:55'),
(21, 1, 'record_violation', 'violation_records', 1, 'Pelanggaran Sepatu tidak sesuai ketentuan (5 poin) — Bella Safitri', '{\"points\": 5, \"student_id\": 2, \"violation_id\": 9}', '127.0.0.1', '2026-08-29 06:57:48'),
(22, 1, 'modify_points', 'violation_records', 1, 'Pembatalan record #1 (−5 poin): t', '{\"student_id\": 2, \"points_change\": -5}', '127.0.0.1', '2026-08-29 06:58:33'),
(23, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-29 07:04:15'),
(24, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-30 01:03:38'),
(25, 1, 'create', 'classes', 5, 'Kelas RPL 3 dibuat', '[]', '127.0.0.1', '2026-08-30 01:04:28'),
(26, 1, 'delete', 'classes', 5, 'Kelas RPL 3 dihapus', '[]', '127.0.0.1', '2026-08-30 01:05:11'),
(27, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-30 01:43:38'),
(28, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-30 02:08:20'),
(29, 1, 'update', 'students', 1, 'Siswa Andi Pratama diperbarui', '[]', '127.0.0.1', '2026-08-30 02:08:57'),
(30, 1, 'update', 'students', 3, 'Siswa Citra Ayu diperbarui', '[]', '127.0.0.1', '2026-08-30 02:09:20'),
(31, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-30 02:16:31'),
(32, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-30 02:26:43'),
(33, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-30 03:55:14'),
(34, 1, 'create', 'classes', 6, 'Kelas RPL 1 dibuat', '[]', '127.0.0.1', '2026-08-30 03:56:54'),
(35, 1, 'create', 'classes', 7, 'Kelas 1 dibuat', '[]', '127.0.0.1', '2026-08-30 03:58:12'),
(36, 1, 'delete', 'classes', 6, 'Kelas RPL 1 dihapus', '[]', '127.0.0.1', '2026-08-30 03:58:52'),
(37, 1, 'delete', 'classes', 7, 'Kelas 1 dihapus', '[]', '127.0.0.1', '2026-08-30 03:58:54'),
(38, 1, 'create', 'teachers', 4, 'Guru V dibuat', '[]', '127.0.0.1', '2026-08-30 08:37:09'),
(39, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-30 09:39:59'),
(40, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-30 09:50:45'),
(41, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-30 10:16:06'),
(42, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-30 10:28:47'),
(43, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-30 10:36:10'),
(44, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-30 11:17:16'),
(45, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-30 11:25:08'),
(46, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-30 11:31:17'),
(47, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-30 17:10:08'),
(48, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-30 18:03:17'),
(49, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-30 19:55:13'),
(50, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-08-30 20:31:03'),
(51, 2, 'login', 'auth', 2, 'User Hendra Wijaya login', '[]', '127.0.0.1', '2026-09-04 13:09:50'),
(52, 2, 'logout', 'auth', 2, 'User Hendra Wijaya logout', '[]', '127.0.0.1', '2026-09-04 13:14:07'),
(53, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-04 13:14:14'),
(54, 1, 'record_violation', 'violation_records', 2, 'Pelanggaran Sepatu tidak sesuai ketentuan (5 poin) — Andi Pratama', '{\"points\": 5, \"student_id\": 1, \"violation_id\": 9}', '127.0.0.1', '2026-09-04 13:14:48'),
(55, 1, 'logout', 'auth', 1, 'User Super Admin logout', '[]', '127.0.0.1', '2026-09-04 13:14:55'),
(56, 2, 'login', 'auth', 2, 'User Hendra Wijaya login', '[]', '127.0.0.1', '2026-09-04 13:15:08'),
(57, 4, 'login', 'auth', 4, 'User Ahmad Fauzi, S.Pd. login', '[]', '127.0.0.1', '2026-09-04 18:39:51'),
(58, 4, 'logout', 'auth', 4, 'User Ahmad Fauzi, S.Pd. logout', '[]', '127.0.0.1', '2026-09-04 18:40:47'),
(59, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-04 18:41:01'),
(60, 5, 'login', 'auth', 5, 'User Siti Rahayu, S.Kom. login', '[]', '127.0.0.1', '2026-09-04 18:51:27'),
(61, 5, 'logout', 'auth', 5, 'User Siti Rahayu, S.Kom. logout', '[]', '127.0.0.1', '2026-09-04 18:54:27'),
(62, 6, 'login', 'auth', 6, 'User Admin Sekolah login', '[]', '127.0.0.1', '2026-09-04 19:10:48'),
(63, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-04 21:03:07'),
(64, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-04 21:29:28'),
(65, 1, 'generate_letter', 'warning_letters', 1, 'Generate Surat Peringatan untuk Andi Pratama (NIS 2510001)', '{\"type\": \"peringatan\", \"signed_as\": \"Kepala Sekolah\", \"student_id\": 1, \"template_id\": 1}', '127.0.0.1', '2026-09-04 21:36:24'),
(66, NULL, 'generate_letter', 'warning_letters', 2, 'Generate Surat Peringatan untuk Andi Pratama (NIS 2510001)', '{\"type\": \"peringatan\", \"signed_as\": \"Kepala Sekolah\", \"student_id\": 1, \"template_id\": 1}', '127.0.0.1', '2026-09-04 21:48:03'),
(67, 1, 'generate_letter', 'warning_letters', 3, 'Generate Surat Peringatan untuk Andi Pratama (NIS 2510001)', '{\"type\": \"peringatan\", \"signed_as\": \"Kepala Sekolah\", \"student_id\": 1, \"template_id\": 1}', '127.0.0.1', '2026-09-04 21:49:43'),
(68, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-04 21:54:41'),
(69, 1, 'generate_letter', 'warning_letters', 4, 'Generate Surat Peringatan untuk Andi Pratama (NIS 2510001)', '{\"type\": \"peringatan\", \"signed_as\": \"Kepala Sekolah\", \"student_id\": 1, \"template_id\": 1}', '127.0.0.1', '2026-09-04 21:55:00'),
(70, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-04 23:19:35'),
(71, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-05 22:06:55'),
(72, 1, 'record_violation', 'violation_records', 3, 'Pelanggaran Sepatu tidak sesuai ketentuan (5 poin) — Andi Pratama', '{\"points\": 5, \"student_id\": 1, \"violation_id\": 9}', '127.0.0.1', '2026-09-05 22:08:21'),
(73, 1, 'send_notification', 'parent_notifications', 1, 'Notifikasi information disusun untuk Hendra Wijaya (siswa Andi Pratama)', '{\"type\": \"information\", \"parent_id\": 1, \"student_id\": 1}', '127.0.0.1', '2026-09-05 22:10:19'),
(74, NULL, 'send_notification', 'parent_notifications', 2, 'Notifikasi warning disusun untuk Hendra Wijaya (siswa Andi Pratama)', '{\"type\": \"warning\", \"parent_id\": 1, \"student_id\": 1}', '127.0.0.1', '2026-09-05 22:45:13'),
(75, NULL, 'send_notification', 'parent_notifications', 3, 'Notifikasi warning disusun untuk Hendra Wijaya (siswa Andi Pratama)', '{\"type\": \"warning\", \"parent_id\": 1, \"student_id\": 1}', '127.0.0.1', '2026-09-05 22:45:55'),
(76, NULL, 'send_notification', 'parent_notifications', 4, 'Notifikasi warning disusun untuk Hendra Wijaya (siswa Andi Pratama)', '{\"type\": \"warning\", \"parent_id\": 1, \"student_id\": 1}', '127.0.0.1', '2026-09-05 22:47:15'),
(77, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-05 23:04:07'),
(78, 1, 'delete', 'parent_notifications', 1, 'Riwayat notifikasi (siswa id 1, tipe information) dihapus', '{\"type\": \"information\", \"student_id\": 1}', '127.0.0.1', '2026-09-05 23:04:31'),
(79, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-05 23:42:03'),
(80, 1, 'generate_letter', 'warning_letters', 5, 'Generate Surat Peringatan untuk Andi Pratama (NIS 2510001)', '{\"type\": \"peringatan\", \"signed_as\": \"Kepala Sekolah\", \"student_id\": 1, \"template_id\": 1}', '127.0.0.1', '2026-09-05 23:44:36'),
(81, 1, 'record_violation', 'violation_records', 4, 'Pelanggaran Pelanggaran lainnya (5 poin) — Andi Pratama', '{\"points\": 5, \"student_id\": 1, \"violation_id\": 21}', '127.0.0.1', '2026-09-05 23:57:01'),
(82, 1, 'change_settings', 'settings', NULL, 'Settings diperbarui: notify_parent_on_violation', '{\"changes\": {\"notify_parent_on_violation\": {\"new\": true, \"old\": false}}}', '127.0.0.1', '2026-09-05 23:59:27'),
(83, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-06 00:31:50'),
(84, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-06 00:35:26'),
(85, 1, 'create', 'reports', NULL, 'Export Ranking Poin Siswa (format pdf)', '{\"type\": \"point-ranking\", \"format\": \"pdf\"}', '127.0.0.1', '2026-09-06 00:36:03'),
(86, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-06 00:54:33'),
(87, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-06 02:42:32'),
(88, 1, 'update', 'users', 3, 'User Andi Pratama diperbarui', '{\"roles\": [\"siswa\"]}', '127.0.0.1', '2026-09-06 02:43:13'),
(89, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-06 03:06:59'),
(90, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-06 03:21:53'),
(91, 1, 'change_settings', 'settings', NULL, 'Settings diperbarui: school_principal_name, dinas_logo, school_photo', '{\"changes\": {\"dinas_logo\": {\"new\": \"https://commons.wikimedia.org/wiki/Special:FilePath/SMAN_3_Surabaya.jpg?width=800\", \"old\": \"\"}, \"school_photo\": {\"new\": \"https://commons.wikimedia.org/wiki/Special:FilePath/SMAN_3_Surabaya.jpg?width=800\", \"old\": \"\"}, \"school_principal_name\": {\"new\": \"V\", \"old\": \"\"}}}', '127.0.0.1', '2026-09-06 03:26:37'),
(92, 1, 'generate_letter', 'warning_letters', 6, 'Generate Surat Peringatan untuk Andi Pratama (NIS 2510001)', '{\"type\": \"peringatan\", \"signed_as\": \"Kepala Sekolah\", \"student_id\": 1, \"template_id\": 1}', '127.0.0.1', '2026-09-06 03:27:01'),
(93, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-06 03:51:40'),
(94, 1, 'change_settings', 'settings', NULL, 'Settings diperbarui: dinas_logo, school_photo', '{\"changes\": {\"dinas_logo\": {\"new\": \"https://commons.wikimedia.org/wiki/Special:FilePath/Logo_Kota_Malang_color.png?width=512\", \"old\": \"https://commons.wikimedia.org/wiki/Special:FilePath/SMAN_3_Surabaya.jpg?width=800\"}, \"school_photo\": {\"new\": \"https://commons.wikimedia.org/wiki/Special:FilePath/Logo_Kota_Malang_color.png?width=512\", \"old\": \"https://commons.wikimedia.org/wiki/Special:FilePath/SMAN_3_Surabaya.jpg?width=800\"}}}', '127.0.0.1', '2026-09-06 03:52:56'),
(95, 1, 'generate_letter', 'warning_letters', 7, 'Generate Surat Peringatan untuk Andi Pratama (NIS 2510001)', '{\"type\": \"peringatan\", \"signed_as\": \"Kepala Sekolah\", \"student_id\": 1, \"template_id\": 1}', '127.0.0.1', '2026-09-06 03:53:23'),
(96, 1, 'change_settings', 'settings', NULL, 'Settings diperbarui: school_photo', '{\"changes\": {\"school_photo\": {\"new\": \"https://commons.wikimedia.org/wiki/Special:FilePath/SMAN_1_Tasik-01.jpg?width=800\", \"old\": \"https://commons.wikimedia.org/wiki/Special:FilePath/Logo_Kota_Malang_color.png?width=512\"}}}', '127.0.0.1', '2026-09-06 04:39:02'),
(97, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-06 04:54:24'),
(98, 1, 'change_settings', 'settings', NULL, 'Settings diperbarui: dinas_logo, school_photo', '{\"changes\": {\"dinas_logo\": {\"new\": \"https://upload.wikimedia.org/wikipedia/commons/0/00/SMAN_1_Tasik-01.jpg\", \"old\": \"https://commons.wikimedia.org/wiki/Special:FilePath/Logo_Kota_Malang_color.png?width=512\"}, \"school_photo\": {\"new\": \"https://upload.wikimedia.org/wikipedia/commons/0/00/SMAN_1_Tasik-01.jpg\", \"old\": \"https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/SMAN_1_Tasik-01.jpg/960px-SMAN_1_Tasik-01.jpg\"}}}', '127.0.0.1', '2026-09-06 05:19:36'),
(99, 1, 'generate_letter', 'warning_letters', 8, 'Generate Surat Peringatan untuk Andi Pratama (NIS 2510001)', '{\"type\": \"peringatan\", \"signed_as\": \"Kepala Sekolah\", \"student_id\": 1, \"template_id\": 1}', '127.0.0.1', '2026-09-06 05:20:01'),
(100, 1, 'change_settings', 'settings', NULL, 'Settings diperbarui: school_city', '{\"changes\": {\"school_city\": {\"new\": \"Malang\", \"old\": \"\"}}}', '127.0.0.1', '2026-09-06 05:21:19'),
(101, 1, 'generate_letter', 'warning_letters', 9, 'Generate Surat Peringatan untuk Andi Pratama (NIS 2510001)', '{\"type\": \"peringatan\", \"signed_as\": \"Kepala Sekolah\", \"student_id\": 1, \"template_id\": 1}', '127.0.0.1', '2026-09-06 05:21:45'),
(102, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-06 06:26:11'),
(103, 1, 'send_notification', 'parent_notifications', 5, 'Notifikasi warning disusun untuk Hendra Wijaya (siswa Andi Pratama)', '{\"type\": \"warning\", \"parent_id\": 1, \"student_id\": 1}', '127.0.0.1', '2026-09-06 06:27:29'),
(104, 1, 'generate_letter', 'warning_letters', 10, 'Generate Surat Peringatan untuk Andi Pratama (NIS 2510001)', '{\"type\": \"peringatan\", \"signed_as\": \"Kepala Sekolah\", \"student_id\": 1, \"template_id\": 1}', '127.0.0.1', '2026-09-06 06:28:33'),
(105, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-06 09:44:03'),
(106, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-06 10:39:08'),
(107, 1, 'logout', 'auth', 1, 'User Super Admin logout', '[]', '127.0.0.1', '2026-09-06 10:45:56'),
(108, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-06 10:46:34'),
(109, 1, 'logout', 'auth', 1, 'User Super Admin logout', '[]', '127.0.0.1', '2026-09-06 10:47:34'),
(110, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-06 10:48:20'),
(111, 1, 'logout', 'auth', 1, 'User Super Admin logout', '[]', '127.0.0.1', '2026-09-06 10:49:00'),
(112, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-06 10:49:33'),
(113, 1, 'update', 'users', 3, 'User Andi Pratama diperbarui', '{\"roles\": [\"siswa\"]}', '127.0.0.1', '2026-09-06 10:50:51'),
(114, 1, 'logout', 'auth', 1, 'User Super Admin logout', '[]', '127.0.0.1', '2026-09-06 10:50:56'),
(115, 3, 'login', 'auth', 3, 'User Andi Pratama login', '[]', '127.0.0.1', '2026-09-06 10:51:04'),
(116, 3, 'logout', 'auth', 3, 'User Andi Pratama logout', '[]', '127.0.0.1', '2026-09-06 10:51:38'),
(117, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-06 10:51:58'),
(118, 1, 'update', 'users', 2, 'User Hendra Wijaya diperbarui', '{\"roles\": [\"orang_tua\"]}', '127.0.0.1', '2026-09-06 10:52:26'),
(119, 1, 'logout', 'auth', 1, 'User Super Admin logout', '[]', '127.0.0.1', '2026-09-06 10:52:31'),
(120, 2, 'login', 'auth', 2, 'User Hendra Wijaya login', '[]', '127.0.0.1', '2026-09-06 10:52:38'),
(121, 2, 'logout', 'auth', 2, 'User Hendra Wijaya logout', '[]', '127.0.0.1', '2026-09-06 11:14:49'),
(122, 2, 'login', 'auth', 2, 'User Hendra Wijaya login', '[]', '127.0.0.1', '2026-09-06 11:16:10'),
(123, 2, 'logout', 'auth', 2, 'User Hendra Wijaya logout', '[]', '127.0.0.1', '2026-09-06 11:41:21'),
(124, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-06 11:41:35'),
(125, 1, 'logout', 'auth', 1, 'User Super Admin logout', '[]', '127.0.0.1', '2026-09-06 11:42:09'),
(126, 3, 'login', 'auth', 3, 'User Andi Pratama login', '[]', '127.0.0.1', '2026-09-06 11:42:19'),
(127, 3, 'logout', 'auth', 3, 'User Andi Pratama logout', '[]', '127.0.0.1', '2026-09-06 11:42:37'),
(128, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-06 11:42:53'),
(129, 1, 'update', 'users', 6, 'User Admin Sekolah diperbarui', '{\"roles\": [\"admin_sekolah\"]}', '127.0.0.1', '2026-09-06 11:43:32'),
(130, 1, 'logout', 'auth', 1, 'User Super Admin logout', '[]', '127.0.0.1', '2026-09-06 11:43:39'),
(131, 6, 'login', 'auth', 6, 'User Admin Sekolah login', '[]', '127.0.0.1', '2026-09-06 11:43:46'),
(132, 6, 'logout', 'auth', 6, 'User Admin Sekolah logout', '[]', '127.0.0.1', '2026-09-06 11:45:25'),
(133, 1, 'login', 'auth', 1, 'User Super Admin login', '[]', '127.0.0.1', '2026-09-06 11:45:39');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('psiswa-cache-011ff3c61db4f9783831392d06ca5b43', 'i:2;', 1788689339),
('psiswa-cache-011ff3c61db4f9783831392d06ca5b43:timer', 'i:1788689339;', 1788689339),
('psiswa-cache-160e319aec974723891f332f32b5162f', 'i:2;', 1788718621),
('psiswa-cache-160e319aec974723891f332f32b5162f:timer', 'i:1788718621;', 1788718621),
('psiswa-cache-1cb2f68b033e13c53bb608ec5e61a1f7', 'i:1;', 1788720199),
('psiswa-cache-1cb2f68b033e13c53bb608ec5e61a1f7:timer', 'i:1788720199;', 1788720199),
('psiswa-cache-1d9db17a77128ef04ba5c136f1b991e0', 'i:1;', 1788720285),
('psiswa-cache-1d9db17a77128ef04ba5c136f1b991e0:timer', 'i:1788720285;', 1788720285),
('psiswa-cache-34663035315e3081c295ff18a722012c', 'i:1;', 1788081437),
('psiswa-cache-34663035315e3081c295ff18a722012c:timer', 'i:1788081437;', 1788081437),
('psiswa-cache-35c715597c5a6e335896ea4f93680deb', 'i:1;', 1788720398),
('psiswa-cache-35c715597c5a6e335896ea4f93680deb:timer', 'i:1788720398;', 1788720398),
('psiswa-cache-8a44ba7daae2c85238e8f913f948694f', 'i:1;', 1788572450),
('psiswa-cache-8a44ba7daae2c85238e8f913f948694f:timer', 'i:1788572450;', 1788572450),
('psiswa-cache-a3affa0d1e1a3c72b78aa984c3367a05', 'i:54;', 1788572451),
('psiswa-cache-a3affa0d1e1a3c72b78aa984c3367a05:timer', 'i:1788572451;', 1788572451),
('psiswa-cache-a75f3f172bfb296f2e10cbfc6dfc1883', 'i:2;', 1788721020),
('psiswa-cache-a75f3f172bfb296f2e10cbfc6dfc1883:timer', 'i:1788721020;', 1788721020),
('psiswa-cache-b6b1306c471ffb770b991c5d334a07c6', 'i:1;', 1788680223),
('psiswa-cache-b6b1306c471ffb770b991c5d334a07c6:timer', 'i:1788680223;', 1788680223),
('psiswa-cache-bedd8b756fa1e2dac0b05653d0895a2b', 'i:1;', 1788701309),
('psiswa-cache-bedd8b756fa1e2dac0b05653d0895a2b:timer', 'i:1788701309;', 1788701309),
('psiswa-cache-d2bfa8e8b749d2772a21edee7b70a2b3', 'i:6;', 1788720201),
('psiswa-cache-d2bfa8e8b749d2772a21edee7b70a2b3:timer', 'i:1788720201;', 1788720201),
('psiswa-cache-df21bfa12c4e294c70f64916c0fbc9a5', 'i:29;', 1788573292),
('psiswa-cache-df21bfa12c4e294c70f64916c0fbc9a5:timer', 'i:1788573292;', 1788573292),
('psiswa-cache-e7cf66797159dc3cd3e85f72e15bb551', 'i:8;', 1788720354),
('psiswa-cache-e7cf66797159dc3cd3e85f72e15bb551:timer', 'i:1788720354;', 1788720354),
('psiswa-cache-e947362b697fb425c891bfcb09e7d799', 'i:2;', 1788573137),
('psiswa-cache-e947362b697fb425c891bfcb09e7d799:timer', 'i:1788573137;', 1788573137),
('psiswa-cache-e9b6cc1432541b9ceebf113eee05eeba', 'i:2;', 1788720091),
('psiswa-cache-e9b6cc1432541b9ceebf113eee05eeba:timer', 'i:1788720091;', 1788720091),
('psiswa-cache-f1f70ec40aaa556905d4a030501c0ba4', 'i:1;', 1788721757),
('psiswa-cache-f1f70ec40aaa556905d4a030501c0ba4:timer', 'i:1788721757;', 1788721757);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` tinyint UNSIGNED NOT NULL,
  `major_id` bigint UNSIGNED DEFAULT NULL,
  `homeroom_teacher_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `name`, `level`, `major_id`, `homeroom_teacher_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'X RPL 1', 10, 1, 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(2, 'X TKJ 1', 10, 2, 2, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(3, 'XI RPL 1', 11, 1, NULL, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(4, 'XII RPL 1', 12, 1, 1, '2026-08-21 06:18:20', '2026-08-21 06:18:20', NULL),
(5, 'RPL 3', 10, NULL, NULL, '2026-08-30 01:04:28', '2026-08-30 01:05:11', '2026-08-30 01:05:11'),
(6, 'RPL 1', 10, 2, NULL, '2026-08-30 03:56:54', '2026-08-30 03:58:52', '2026-08-30 03:58:52'),
(7, '1', 10, 1, 2, '2026-08-30 03:58:12', '2026-08-30 03:58:54', '2026-08-30 03:58:54');

-- --------------------------------------------------------

--
-- Table structure for table `counseling_records`
--

CREATE TABLE `counseling_records` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `case` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `action` text COLLATE utf8mb4_unicode_ci,
  `result` text COLLATE utf8mb4_unicode_ci,
  `status` enum('belum_ditangani','dalam_proses','selesai') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'belum_ditangani',
  `handled_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `in_app_notifications`
--

CREATE TABLE `in_app_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` json DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `late_records`
--

CREATE TABLE `late_records` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `recorded_by` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `minutes` int UNSIGNED NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `status` enum('recorded','voided') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'recorded',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `late_records`
--

INSERT INTO `late_records` (`id`, `student_id`, `recorded_by`, `date`, `time`, `minutes`, `notes`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2026-08-29', '08:00:00', 30, 'Terlambat', 'voided', '2026-08-29 06:56:02', '2026-08-29 06:56:55');

-- --------------------------------------------------------

--
-- Table structure for table `letter_templates`
--

CREATE TABLE `letter_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `type` enum('peringatan','panggilan_orang_tua','pembinaan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `letter_templates`
--

INSERT INTO `letter_templates` (`id`, `type`, `title`, `body`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'peringatan', 'Surat Peringatan', 'Kepada Yth. Bapak/Ibu {parent_name}\nDi Tempat\n\nDengan hormat,\n\nBerkaitan dengan kedisiplinan siswa, dengan ini kami sampaikan bahwa anak Bapak/Ibu:\n\nNama : {student_name}\nNIS : {nis}\nKelas : {class_name}\n\nTelah tercatat melakukan pelanggaran dan saat ini memiliki total poin {total_points}. Kami menghimbau Bapak/Ibu untuk turut memperhatikan dan membimbing putra/putrinya agar tidak mengulangi pelanggaran.\n\nDemikian surat peringatan ini kami sampaikan. Atas perhatian dan kerja sama Bapak/Ibu, kami ucapkan terima kasih.\n\n{date}\n{school_name}', 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30'),
(2, 'panggilan_orang_tua', 'Surat Panggilan Orang Tua', 'Kepada Yth. Bapak/Ibu {parent_name}\n{parent_phone}\nDi Tempat\n\nDengan hormat,\n\nSehubungan dengan perkembangan kedisiplinan putra/putri Bapak/Ibu:\n\nNama : {student_name}\nNIS : {nis}\nKelas : {class_name}\nTotal Poin : {total_points}\n\nKami mohon kesediaan Bapak/Ibu untuk hadir ke sekolah guna membicarakan perkembangan dan pembinaan putra/putri Bapak/Ibu.\n\nDemikian surat panggilan ini kami sampaikan. Atas perhatian dan kerja sama Bapak/Ibu, kami ucapkan terima kasih.\n\n{date}\n{school_name}', 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30'),
(3, 'pembinaan', 'Surat Pembinaan', 'Kepada Yth. {student_name}\nKelas {class_name}\nDi Tempat\n\nDengan hormat,\n\nSekolah senantiasa berupaya membina kedisiplinan siswa. Terkait hal tersebut, kami menindaklanjuti permasalahan yang tercatat atas nama:\n\nNama : {student_name}\nNIS : {nis}\nKelas : {class_name}\n\nDengan total poin saat ini {total_points}. Kami berharap saudara dapat memperbaiki sikap dan mematuhi tata tertib sekolah.\n\nDemikian surat pembinaan ini disampaikan. Terima kasih.\n\n{date}\n{school_name}', 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30');

-- --------------------------------------------------------

--
-- Table structure for table `majors`
--

CREATE TABLE `majors` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `majors`
--

INSERT INTO `majors` (`id`, `code`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'RPL', 'Rekayasa Perangkat Lunak', 'Pengembangan perangkat lunak dan aplikasi.', '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(2, 'TKJ', 'Teknik Komputer dan Jaringan', 'Jaringan komputer dan infrastruktur TI.', '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(3, 'AKL', 'Akuntansi dan Keuangan Lembaga', 'Akuntansi dan keuangan.', '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_08_10_000001_create_rbac_tables', 1),
(5, '2026_08_10_000002_create_settings_table', 1),
(6, '2026_08_10_000003_create_audit_logs_table', 1),
(7, '2026_08_10_000004_create_majors_table', 1),
(8, '2026_08_10_000005_create_teachers_table', 1),
(9, '2026_08_10_000006_create_parents_table', 1),
(10, '2026_08_10_000007_create_school_years_table', 1),
(11, '2026_08_10_000008_create_classes_table', 1),
(12, '2026_08_10_000009_create_students_table', 1),
(13, '2026_08_10_033304_create_personal_access_tokens_table', 1),
(14, '2026_08_12_000001_create_violation_categories_table', 1),
(15, '2026_08_12_000002_create_violations_table', 1),
(16, '2026_08_12_000003_create_violation_records_table', 1),
(17, '2026_08_12_000004_create_point_histories_table', 1),
(18, '2026_08_12_000005_create_late_records_table', 1),
(19, '2026_08_12_000006_create_notifications_table', 1),
(20, '2026_08_12_000007_create_parent_notifications_table', 1),
(21, '2026_08_12_000008_create_counseling_records_table', 1),
(22, '2026_08_12_000009_create_letter_templates_table', 1),
(23, '2026_08_12_000010_create_warning_letters_table', 1),
(24, '2026_08_12_000011_add_performance_indexes_table', 1),
(25, '2026_09_05_000010_add_login_account_to_students_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`id`, `user_id`, `name`, `phone`, `email`, `address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'Hendra Wijaya', '081234567001', 'hendrawijaya.ortu@gmail.com', 'Jl. Melati No. 1', '2026-08-21 06:05:30', '2026-09-04 13:06:58', NULL),
(2, NULL, 'Dewi Lestari', '081234567002', NULL, 'Jl. Kenanga No. 2', '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `parent_notifications`
--

CREATE TABLE `parent_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variables` json NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deep_link` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','sent','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parent_notifications`
--

INSERT INTO `parent_notifications` (`id`, `student_id`, `parent_id`, `type`, `template_key`, `variables`, `message`, `deep_link`, `status`, `sent_at`, `created_at`) VALUES
(5, 1, 1, 'warning', 'whatsapp_template_manual', '{\"nis\": \"2510001\", \"date\": \"06 September 2026\", \"nisn\": \"0123456701\", \"class_name\": \"X RPL 1\", \"major_name\": \"Rekayasa Perangkat Lunak\", \"parent_name\": \"Hendra Wijaya\", \"school_name\": \"SMA Nusantara\", \"school_year\": \"2025/2026\", \"parent_phone\": \"081234567001\", \"student_name\": \"Andi Pratama\", \"total_points\": \"15\", \"violation_date\": \"\", \"violation_name\": \"\", \"violation_points\": \"\"}', 'Yth. Bapak/Ibu Hendra Wijaya, kami informasikan bahwa ananda Andi Pratama (NIS 2510001, kelas X RPL 1) menerima pemberitahuan dari SMA Nusantara. Untuk keterangan lebih lanjut silakan menghubungi pihak sekolah. Terima kasih.', 'https://wa.me/6281234567001?text=Yth.%20Bapak%2FIbu%20Hendra%20Wijaya%2C%20kami%20informasikan%20bahwa%20ananda%20Andi%20Pratama%20%28NIS%202510001%2C%20kelas%20X%20RPL%201%29%20menerima%20pemberitahuan%20dari%20SMA%20Nusantara.%20Untuk%20keterangan%20lebih%20lanjut%20silakan%20menghubungi%20pihak%20sekolah.%20Terima%20kasih.', 'pending', NULL, '2026-09-06 06:27:29');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `label`, `description`, `created_at`, `updated_at`) VALUES
(1, 'dashboard.view', 'Lihat Dashboard', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(2, 'students.view', 'Lihat Siswa', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(3, 'students.create', 'Tambah Siswa', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(4, 'students.update', 'Ubah Siswa', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(5, 'students.delete', 'Hapus Siswa', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(6, 'students.import', 'Import Siswa', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(7, 'parents.view', 'Lihat Orang Tua', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(8, 'parents.create', 'Tambah Orang Tua', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(9, 'parents.update', 'Ubah Orang Tua', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(10, 'teachers.view', 'Lihat Guru', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(11, 'teachers.create', 'Tambah Guru', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(12, 'teachers.update', 'Ubah Guru', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(13, 'classes.view', 'Lihat Kelas', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(14, 'classes.manage', 'Kelola Kelas', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(15, 'majors.view', 'Lihat Jurusan', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(16, 'majors.manage', 'Kelola Jurusan', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(17, 'school_years.view', 'Lihat Tahun Ajaran', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(18, 'school_years.manage', 'Kelola Tahun Ajaran', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(19, 'violation_categories.view', 'Lihat Kategori Pelanggaran', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(20, 'violation_categories.manage', 'Kelola Kategori Pelanggaran', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(21, 'violations.view', 'Lihat Master Pelanggaran', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(22, 'violations.manage', 'Kelola Master Pelanggaran', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(23, 'violation_records.view', 'Lihat Pencatatan Pelanggaran', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(24, 'violation_records.create', 'Catat Pelanggaran', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(25, 'violation_records.correct', 'Koreksi Pelanggaran', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(26, 'late_records.view', 'Lihat Keterlambatan', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(27, 'late_records.create', 'Catat Keterlambatan', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(28, 'late_records.manage', 'Kelola Keterlambatan', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(29, 'counseling.view', 'Lihat Pembinaan', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(30, 'counseling.create', 'Tambah Pembinaan', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(31, 'counseling.update', 'Ubah Pembinaan', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(32, 'counseling.delete', 'Hapus Pembinaan', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(33, 'notifications.view', 'Lihat Notifikasi', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(34, 'notifications.send', 'Kirim Notifikasi', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(35, 'warning_letters.generate', 'Generate Surat', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(36, 'reports.view', 'Lihat Laporan', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(37, 'reports.export', 'Export Laporan', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(38, 'users.manage', 'Kelola User', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(39, 'roles.manage', 'Kelola Role', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(40, 'settings.manage', 'Kelola Settings', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(41, 'audit_logs.view', 'Lihat Audit Log', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(42, 'qr.view', 'Lihat QR', NULL, '2026-08-21 06:05:29', '2026-08-21 06:05:29');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
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
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(1, 3),
(2, 3),
(3, 3),
(10, 3),
(13, 3),
(15, 3),
(17, 3),
(19, 3),
(21, 3),
(23, 3),
(24, 3),
(26, 3),
(27, 3),
(29, 3),
(30, 3),
(31, 3),
(33, 3),
(34, 3),
(35, 3),
(36, 3),
(37, 3),
(42, 3),
(1, 4),
(2, 4),
(13, 4),
(15, 4),
(17, 4),
(19, 4),
(21, 4),
(23, 4),
(24, 4),
(26, 4),
(27, 4),
(33, 4),
(42, 4),
(1, 5),
(2, 5),
(13, 5),
(15, 5),
(17, 5),
(19, 5),
(21, 5),
(23, 5),
(24, 5),
(25, 5),
(26, 5),
(27, 5),
(28, 5),
(29, 5),
(30, 5),
(31, 5),
(32, 5),
(33, 5),
(34, 5),
(35, 5),
(36, 5),
(37, 5),
(42, 5),
(1, 6),
(2, 6),
(23, 6),
(33, 6),
(42, 6),
(1, 7),
(2, 7),
(42, 7);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'psiswa', 'e305a96636dc605b9d39e774d80ce68b5d9b7f6baaf2909326d6d6fa66a34fbd', '[\"*\"]', NULL, NULL, '2026-08-21 06:05:42', '2026-08-21 06:05:42'),
(2, 'App\\Models\\User', 1, 'psiswa', '65116a10d93969b3ee306081442c2a67749ba84978215e216e10332d0523648a', '[\"*\"]', '2026-08-21 07:06:56', NULL, '2026-08-21 06:17:24', '2026-08-21 07:06:56'),
(3, 'App\\Models\\User', 1, 'psiswa', 'b826b6e062863dfe25143ececdd1751603ebff2d4ec5aeabf8f83d771cc48a7f', '[\"*\"]', '2026-08-21 08:57:12', NULL, '2026-08-21 08:56:39', '2026-08-21 08:57:12'),
(4, 'App\\Models\\User', 1, 'psiswa', '4f6f227b6c4ec046c6f6c99a9437e7428a86ba01c3e269a284ae104881cf887d', '[\"*\"]', '2026-08-23 09:13:29', NULL, '2026-08-23 09:08:47', '2026-08-23 09:13:29'),
(5, 'App\\Models\\User', 1, 'psiswa', 'bdd53166ec16923ed8fba905b3d817850245efaa700c030f06da358c9f98d2e1', '[\"*\"]', '2026-08-23 22:10:55', NULL, '2026-08-23 22:06:18', '2026-08-23 22:10:55'),
(6, 'App\\Models\\User', 1, 'psiswa', '5af1c8f5c8541c1ad8791628339d9d32c1d3ac4a851244354a1490b1546a6878', '[\"*\"]', '2026-08-28 08:08:43', NULL, '2026-08-28 05:45:27', '2026-08-28 08:08:43'),
(7, 'App\\Models\\User', 1, 'psiswa', '50b97534d8d8d57e1c004f0fad77ef186608bb26daa4239cbdd40e8a70dddea3', '[\"*\"]', '2026-08-28 23:43:33', NULL, '2026-08-28 23:42:31', '2026-08-28 23:43:33'),
(8, 'App\\Models\\User', 1, 'psiswa', '8dfd4d47e3078c8588a702ffe6bd0ee7bf1c60489451344fce983987fce4338a', '[\"*\"]', '2026-08-29 00:03:13', NULL, '2026-08-28 23:53:11', '2026-08-29 00:03:13'),
(10, 'App\\Models\\User', 1, 'psiswa', 'a82557845aa2430d31128d4ce3e17a1dcc0e80a3e0a95ca29a9d4ae0dc857243', '[\"*\"]', '2026-08-29 06:53:48', NULL, '2026-08-29 01:27:01', '2026-08-29 06:53:48'),
(11, 'App\\Models\\User', 1, 'psiswa', '0d75dfc88918a1c95baeca785d30c1881dca36cfe18220272608124350624579', '[\"*\"]', '2026-08-29 06:47:03', NULL, '2026-08-29 06:23:44', '2026-08-29 06:47:03'),
(12, 'App\\Models\\User', 1, 'psiswa', '6126eabed50332e49e248b9d0736123cb726d9b94a4eaf18fbb4e43a2548b11b', '[\"*\"]', '2026-08-29 06:51:32', NULL, '2026-08-29 06:51:29', '2026-08-29 06:51:32'),
(13, 'App\\Models\\User', 1, 'psiswa', '8877abe4085dcaa3f26668c36268c2762ad934c301bfa1fa7a8e68310af3822a', '[\"*\"]', NULL, NULL, '2026-08-29 06:51:36', '2026-08-29 06:51:36'),
(14, 'App\\Models\\User', 1, 'psiswa', 'f3046498c12fda8055de509028d2f60f403555b20dc9aa759d27bfd5adc986b9', '[\"*\"]', NULL, NULL, '2026-08-29 06:51:40', '2026-08-29 06:51:40'),
(15, 'App\\Models\\User', 1, 'psiswa', 'edcf0c1018e0e63a710388455d1fc8574c5686cbd12d9c2ee9b7faaf94efcb50', '[\"*\"]', '2026-08-29 07:03:30', NULL, '2026-08-29 06:51:47', '2026-08-29 07:03:30'),
(16, 'App\\Models\\User', 1, 'psiswa', '619faa000d00e12d8cb7c446ccf5d54da5ab285f938b30f265ac587281245d95', '[\"*\"]', '2026-08-29 07:15:58', NULL, '2026-08-29 06:54:01', '2026-08-29 07:15:58'),
(17, 'App\\Models\\User', 1, 'psiswa', '4ea3e178adba5a17371daf6b2b9728f04c6b5db6f95ea5cc33d57c33adc9ec2c', '[\"*\"]', '2026-08-29 09:50:38', NULL, '2026-08-29 07:04:15', '2026-08-29 09:50:38'),
(18, 'App\\Models\\User', 1, 'psiswa', '0782aa9eaa5a6bd9067def26e395610aa2ea47c5736c378dc2eaeede62c351a8', '[\"*\"]', '2026-08-30 01:17:51', NULL, '2026-08-30 01:03:38', '2026-08-30 01:17:51'),
(19, 'App\\Models\\User', 1, 'psiswa', 'd54e6c1d9ba25d44b7f80ac08b7b045d1e61a446bdaef8fce5604f39e7fd872d', '[\"*\"]', '2026-08-30 02:02:55', NULL, '2026-08-30 01:43:38', '2026-08-30 02:02:55'),
(20, 'App\\Models\\User', 1, 'psiswa', '0ef4983bfc0c757965182e1a8d7ee6a43c441d6f7c137484e09f9fc8bd2098a7', '[\"*\"]', '2026-08-30 02:14:13', NULL, '2026-08-30 02:08:20', '2026-08-30 02:14:13'),
(21, 'App\\Models\\User', 1, 'psiswa', '6a65fc71447b92c82b142f47a661370b4e5daec986d52cbce29bda5f64081bfe', '[\"*\"]', '2026-08-30 02:24:33', NULL, '2026-08-30 02:16:31', '2026-08-30 02:24:33'),
(22, 'App\\Models\\User', 1, 'psiswa', '2441ce0c16aca8fb8c03001b396a6566d0531491af091eac9f0d1098dcac29c7', '[\"*\"]', '2026-08-30 03:52:25', NULL, '2026-08-30 02:26:43', '2026-08-30 03:52:25'),
(23, 'App\\Models\\User', 1, 'psiswa', '64773247720b3bc282ca0f4ced618a9642df601d006e0fd4e046308882b0ca76', '[\"*\"]', '2026-08-30 09:07:37', NULL, '2026-08-30 03:55:14', '2026-08-30 09:07:37'),
(24, 'App\\Models\\User', 1, 'psiswa', '3413e74930d313e7d3dae6026d844f29fbccbe0234abef5aa0aa4394981e43c9', '[\"*\"]', '2026-08-30 09:47:01', NULL, '2026-08-30 09:39:59', '2026-08-30 09:47:01'),
(25, 'App\\Models\\User', 1, 'psiswa', '26b5dea447ea04ac3e50037eb5fd2bb9582cd7cb03a4e7450744c60fb6d33cca', '[\"*\"]', '2026-08-30 10:04:47', NULL, '2026-08-30 09:50:45', '2026-08-30 10:04:47'),
(26, 'App\\Models\\User', 1, 'psiswa', '9096c9d6ee962046bc45decef6275231535a48e7e9e621b9b2acb19e05898e06', '[\"*\"]', '2026-08-30 10:25:23', NULL, '2026-08-30 10:16:06', '2026-08-30 10:25:23'),
(27, 'App\\Models\\User', 1, 'psiswa', 'acd18fb087ff164585222d15747c86cb271adfa710c2267f5280e68a3cdb3c3c', '[\"*\"]', '2026-08-30 10:33:49', NULL, '2026-08-30 10:28:47', '2026-08-30 10:33:49'),
(28, 'App\\Models\\User', 1, 'psiswa', '81b074ceef7626e9e3f0017f9b6e7abb6205db5fb2f7fb1eb96435f48db9a70d', '[\"*\"]', '2026-08-30 10:36:14', NULL, '2026-08-30 10:36:10', '2026-08-30 10:36:14'),
(29, 'App\\Models\\User', 1, 'psiswa', '49a89c5bd6e403fadcaac55a6198079b0b42139f0c8d086a528e5bdbc82f91b5', '[\"*\"]', '2026-08-30 11:23:17', NULL, '2026-08-30 11:17:16', '2026-08-30 11:23:17'),
(30, 'App\\Models\\User', 1, 'psiswa', '92258c4357f8b4ee6150575480af152c37c3253c0ded8b9c2c852493dae39257', '[\"*\"]', '2026-08-30 11:29:09', NULL, '2026-08-30 11:25:08', '2026-08-30 11:29:09'),
(31, 'App\\Models\\User', 1, 'psiswa', 'bd57a6d375fa27cf29826711a1ad2d3485920ae2604b35a7a77ed8db466c1737', '[\"*\"]', '2026-08-30 11:38:19', NULL, '2026-08-30 11:31:17', '2026-08-30 11:38:19'),
(32, 'App\\Models\\User', 1, 'psiswa', 'd29997c72e0a534d8d4aaee3651cdcf6882a476a19818f45a5a93405e349743e', '[\"*\"]', '2026-08-30 17:12:10', NULL, '2026-08-30 17:10:08', '2026-08-30 17:12:10'),
(33, 'App\\Models\\User', 1, 'psiswa', '988eabd21eea9c815c7b1635d11ab317a33a08c0dbc397d4f3702e53e8a5df77', '[\"*\"]', '2026-08-30 19:08:19', NULL, '2026-08-30 18:03:17', '2026-08-30 19:08:19'),
(34, 'App\\Models\\User', 1, 'psiswa', '256d3f147790e880975e22881cd09f9a61c132681a1942999c293540857c6632', '[\"*\"]', '2026-08-30 20:18:47', NULL, '2026-08-30 19:55:13', '2026-08-30 20:18:47'),
(35, 'App\\Models\\User', 1, 'psiswa', '5bf848697b5a048871b6aa7c65aae9c43b447aaa41b3f7e088422f02d8b36692', '[\"*\"]', '2026-08-30 20:32:36', NULL, '2026-08-30 20:31:03', '2026-08-30 20:32:36'),
(38, 'App\\Models\\User', 2, 'psiswa', 'c3c19a2a6f0d946fca663104cc0598814eefc5e0cb8837eafca9aa8b3a693b03', '[\"*\"]', '2026-09-04 18:39:23', NULL, '2026-09-04 13:15:08', '2026-09-04 18:39:23'),
(40, 'App\\Models\\User', 1, 'psiswa', '3a2d5943c04d0d8969131b7ea7907b5aebe20a21085d7e003fa34fd60638f021', '[\"*\"]', '2026-09-04 18:50:56', NULL, '2026-09-04 18:41:01', '2026-09-04 18:50:56'),
(42, 'App\\Models\\User', 6, 'psiswa', 'd7c8f92fc317116250b385ce4641e05ca485020e8e40beb29770485019c840e1', '[\"*\"]', '2026-09-04 19:21:19', NULL, '2026-09-04 19:10:48', '2026-09-04 19:21:19'),
(43, 'App\\Models\\User', 1, 'psiswa', '2cc90f1010831941bba48cf8fd96c06e817b21cf4fa60ee384f27c25e1e69e5f', '[\"*\"]', '2026-09-04 21:24:09', NULL, '2026-09-04 21:03:07', '2026-09-04 21:24:09'),
(44, 'App\\Models\\User', 1, 'psiswa', 'a4f33a057d59a9703272034a28e14d9412b88f123521c959a1ff87f439903c1e', '[\"*\"]', '2026-09-04 21:50:50', NULL, '2026-09-04 21:29:28', '2026-09-04 21:50:50'),
(45, 'App\\Models\\User', 1, 'psiswa', '725c7389114fc85add32ddee4a6746f68779cc0fb3636f00b98b9442dfe567ff', '[\"*\"]', '2026-09-04 21:58:43', NULL, '2026-09-04 21:54:41', '2026-09-04 21:58:43'),
(46, 'App\\Models\\User', 1, 'psiswa', 'ddada2785d60289913b7c81660350e136dbce9914d00609e8222afe05618a812', '[\"*\"]', '2026-09-05 02:11:36', NULL, '2026-09-04 23:19:35', '2026-09-05 02:11:36'),
(47, 'App\\Models\\User', 1, 'psiswa', '45ec4bd0b47041dd6c89c1c03df420419f865b70240da900225e2a1f17b0e5f3', '[\"*\"]', '2026-09-05 23:04:00', NULL, '2026-09-05 22:06:55', '2026-09-05 23:04:00'),
(48, 'App\\Models\\User', 3, 'test', '68540889fa2d275bcccd735a333c7b74c47b65731a64b61a529bd01092e24d81', '[\"*\"]', '2026-09-05 22:13:54', NULL, '2026-09-05 22:13:53', '2026-09-05 22:13:54'),
(49, 'App\\Models\\User', 3, 'test', 'b52d5a6fa6386b4bce19f8838d36f15f7744634f413aa6cbca76b58d31b4f5db', '[\"*\"]', '2026-09-05 22:14:12', NULL, '2026-09-05 22:14:12', '2026-09-05 22:14:12'),
(50, 'App\\Models\\User', 1, 'psiswa', '52715d1ce13c7025711d4bc4849d028b1a45b0a602e7f9b390381cc5bc6f48ef', '[\"*\"]', '2026-09-06 00:35:15', NULL, '2026-09-05 23:04:07', '2026-09-06 00:35:15'),
(51, 'App\\Models\\User', 1, 'psiswa', '0b5d1d48a4efd05410c7386ff71544d4c4b02ace9bc4eb4e24b7829cc117356a', '[\"*\"]', '2026-09-06 00:28:57', NULL, '2026-09-05 23:42:03', '2026-09-06 00:28:57'),
(52, 'App\\Models\\User', 1, 'psiswa', 'f3207c61a7ffb2be344381d8e7494236f945f996f384eb4335d27b28b0540cf6', '[\"*\"]', '2026-09-06 00:51:51', NULL, '2026-09-06 00:31:50', '2026-09-06 00:51:51'),
(53, 'App\\Models\\User', 1, 'psiswa', '83d19a0820e0341a7228d6bd93e2ee367a41e7d9b0f59633508251c336886261', '[\"*\"]', '2026-09-06 01:42:17', NULL, '2026-09-06 00:35:26', '2026-09-06 01:42:17'),
(54, 'App\\Models\\User', 1, 'psiswa', '9313a3ad92ac812552df3683c2048ad10547125eaa3fa07bfb6feeaadabd9ed9', '[\"*\"]', '2026-09-06 01:55:48', NULL, '2026-09-06 00:54:33', '2026-09-06 01:55:48'),
(55, 'App\\Models\\User', 1, 'psiswa', 'ae7537c0718de0955f25aca6dd037f67408710d1393ed1f9a8d0aa55045f1bf6', '[\"*\"]', '2026-09-06 03:01:34', NULL, '2026-09-06 02:42:32', '2026-09-06 03:01:34'),
(56, 'App\\Models\\User', 1, 'psiswa', 'bc357e92bfbfcaf8f1c42f7de978544b85cf76e7b35db2ceed1b38c544ce5222', '[\"*\"]', NULL, NULL, '2026-09-06 03:06:59', '2026-09-06 03:06:59'),
(57, 'App\\Models\\User', 1, 'psiswa', '27a4d97e4383a68663928b622fbe047bfe6d475c13f2d65811cd9a4289bf835e', '[\"*\"]', '2026-09-06 03:47:20', NULL, '2026-09-06 03:21:53', '2026-09-06 03:47:20'),
(58, 'App\\Models\\User', 1, 'psiswa', '3e1be916cfdc448b9e9d73e496af408142a8859367dc54d3ee9bd400698fd9dd', '[\"*\"]', '2026-09-06 04:45:43', NULL, '2026-09-06 03:51:40', '2026-09-06 04:45:43'),
(59, 'App\\Models\\User', 1, 'psiswa', 'ff1e947b682c4d54e6391f8aacda65219a203c484ff9f1741bd28c48ebb39c86', '[\"*\"]', '2026-09-06 05:30:11', NULL, '2026-09-06 04:54:24', '2026-09-06 05:30:11'),
(60, 'App\\Models\\User', 1, 'psiswa', '5e85be342e99ad9118047034a00bb12133b932377d7b29c30cafce2a6cba1bc8', '[\"*\"]', '2026-09-06 06:43:20', NULL, '2026-09-06 06:26:11', '2026-09-06 06:43:20'),
(61, 'App\\Models\\User', 1, 'psiswa', 'dd9059bba27b2df6039193ce385c00dbef9f39bab5c174a137673f14f80538b4', '[\"*\"]', '2026-09-06 12:07:12', NULL, '2026-09-06 09:44:03', '2026-09-06 12:07:12'),
(74, 'App\\Models\\User', 1, 'psiswa', 'c838afa346a3a36225ec387992ce8f203f2c0245091f1eb96a54dd5bdde7c875', '[\"*\"]', '2026-09-06 12:08:17', NULL, '2026-09-06 11:45:39', '2026-09-06 12:08:17');

-- --------------------------------------------------------

--
-- Table structure for table `point_histories`
--

CREATE TABLE `point_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `violation_record_id` bigint UNSIGNED DEFAULT NULL,
  `points_change` int NOT NULL,
  `previous_total` int NOT NULL,
  `new_total` int NOT NULL,
  `reason` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `changed_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `point_histories`
--

INSERT INTO `point_histories` (`id`, `student_id`, `violation_record_id`, `points_change`, `previous_total`, `new_total`, `reason`, `changed_by`, `created_at`) VALUES
(1, 2, 1, 5, 0, 5, 'Pelanggaran: Sepatu tidak sesuai ketentuan', 1, '2026-08-29 06:57:48'),
(2, 2, 1, -5, 5, 0, 't', 1, '2026-08-29 06:58:33'),
(3, 1, 2, 5, 0, 5, 'Pelanggaran: Sepatu tidak sesuai ketentuan', 1, '2026-09-04 13:14:48'),
(4, 1, 3, 5, 5, 10, 'Pelanggaran: Sepatu tidak sesuai ketentuan', 1, '2026-09-05 22:08:21'),
(5, 1, 4, 5, 10, 15, 'Pelanggaran: Pelanggaran lainnya', 1, '2026-09-05 23:57:01');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `label`, `description`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 'Super Admin', 'Mengelola konfigurasi sistem dan seluruh sekolah.', '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(2, 'admin_sekolah', 'Admin Sekolah', 'Mengelola data sekolah, siswa, guru, kelas, pelanggaran, dan konfigurasi.', '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(3, 'wali_kelas', 'Wali Kelas', 'Memantau kedisiplinan siswa di kelasnya dan melakukan tindak lanjut.', '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(4, 'guru', 'Guru', 'Mencatat pelanggaran dan melihat informasi siswa yang relevan.', '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(5, 'guru_bk', 'Guru BK / Petugas', 'Menangani kasus dan melakukan pembinaan.', '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(6, 'orang_tua', 'Orang Tua', 'Menerima informasi dan melihat riwayat kedisiplinan anak sesuai permission.', '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(7, 'siswa', 'Siswa', 'Melihat detail kedisiplinan dirinya sendiri (dashboard pribadi).', '2026-09-04 13:52:29', '2026-09-04 13:52:29');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`) VALUES
(1, 1),
(6, 2),
(7, 3),
(3, 4),
(4, 4),
(4, 5),
(5, 5),
(2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `school_years`
--

CREATE TABLE `school_years` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_years`
--

INSERT INTO `school_years` (`id`, `name`, `start_date`, `end_date`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '2025/2026', '2025-07-14', '2026-06-30', 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30'),
(2, '2026/2027', '2026-07-13', '2027-06-30', 0, '2026-08-21 06:05:30', '2026-08-21 06:05:30');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2g1cru3ALBqrn8rBS9drLLTadNDdQsUzpdJdJ7y0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVlh5N1E3cHE5VUp6cEpYMkhLR3ZxVXVvZ3hDV1RNZURjZUFIOFN3ZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1787318155),
('BcwweuJVWbcgCwc64PKlwzvmjXoas1uQg9wlVMak', NULL, '127.0.0.1', 'curl/8.17.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXJBM3dPZUFNRUR2N0k1Skg4VlROU05BSzliOU1yUXhqbzd4ZnNiZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1788689280),
('goTDUlEtxlAGHpGcLKxx3s4BPrDfLEfEldLCYr6G', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFY2aGlrUHNYNDdTemN6aHFmTk5QOGFHeVhSVDRuT2tZbjZIRlRDZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1788584039),
('r54qYwJAvB7rb0Myo8Nf7vShqEnbshSf9dvIsJZM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibFlDaEFSMjU3SHdFQnFqckY4ODhaRmdTUlFLUjh0dmx5YzlsSWZmNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1787327279),
('tl4qNZKaf4axmpoIY4VVOmjbA6nUsq0t2pGHHnVR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.134.0 Chrome/148.0.7778.280 Electron/42.8.1 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia055R0lPalA5M2RIYkdMSU1jNFZibGxad0F3MHUxcUNnMmo5bVloaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1787921085);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` json DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `group`, `is_public`, `created_at`, `updated_at`) VALUES
(1, 'point_thresholds', '{\"safe\": {\"max\": 19, \"min\": 0}, \"warning\": {\"max\": 59, \"min\": 40}, \"critical\": {\"max\": null, \"min\": 60}, \"attention\": {\"max\": 39, \"min\": 20}}', 'point_engine', 0, '2026-08-21 06:05:29', '2026-09-06 00:57:47'),
(2, 'school_name', '\"SMA Nusantara\"', 'school', 1, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(3, 'school_address', '\"Jl. Pendidikan No. 1\"', 'school', 1, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(4, 'school_phone', '\"(021) 1234567\"', 'school', 1, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(5, 'whatsapp_template', '\"Yth. Bapak/Ibu orang tua dari {student_name}, kami informasikan bahwa ananda tercatat melakukan pelanggaran: {violation_name} pada {violation_date} (poin {violation_points}). Total poin kedisiplinan ananda saat ini {total_points}. Terima kasih. — {school_name}\"', 'notification', 0, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(6, 'notify_parent_on_violation', 'false', 'notification', 0, '2026-08-21 06:05:29', '2026-09-06 00:57:47'),
(7, 'late_time_limit', '\"07:30\"', 'keterlambatan', 1, '2026-08-21 06:05:29', '2026-08-21 06:05:29'),
(8, 'early_warning_rules', '{\"repeated_late\": {\"max\": 3, \"days\": 14, \"enabled\": true}, \"repeated_category\": {\"days\": 30, \"count\": 3, \"enabled\": false}, \"frequent_violations\": {\"max\": 5, \"days\": 30, \"enabled\": false}, \"unresolved_counseling\": {\"enabled\": true}, \"total_points_threshold\": {\"status\": \"attention\", \"enabled\": true}}', 'early_warning', 0, '2026-08-21 06:05:29', '2026-09-06 00:57:47'),
(9, 'school_city', '\"Malang\"', 'school', 1, '2026-09-06 00:57:47', '2026-09-06 05:21:19'),
(10, 'school_photo', '\"https://upload.wikimedia.org/wikipedia/commons/0/00/SMAN_1_Tasik-01.jpg\"', 'school', 1, '2026-09-06 00:57:47', '2026-09-06 05:19:36'),
(11, 'dinas_logo', '\"https://upload.wikimedia.org/wikipedia/commons/0/00/SMAN_1_Tasik-01.jpg\"', 'school', 1, '2026-09-06 00:57:47', '2026-09-06 05:19:36'),
(12, 'school_principal_name', '\"V\"', 'school', 0, '2026-09-06 00:57:47', '2026-09-06 03:26:37'),
(13, 'school_principal_nip', '\"\"', 'school', 0, '2026-09-06 00:57:47', '2026-09-06 00:57:47'),
(14, 'whatsapp_template_manual', '\"Yth. Bapak/Ibu {parent_name}, kami informasikan bahwa ananda {student_name} (NIS {nis}, kelas {class_name}) menerima pemberitahuan dari {school_name}. Untuk keterangan lebih lanjut silakan menghubungi pihak sekolah. Terima kasih.\"', 'notification', 0, '2026-09-06 00:57:47', '2026-09-06 00:57:47');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint UNSIGNED NOT NULL,
  `nis` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nisn` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `major_id` bigint UNSIGNED NOT NULL,
  `school_year_id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qr_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `total_points` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `nis`, `nisn`, `name`, `gender`, `class_id`, `major_id`, `school_year_id`, `parent_id`, `phone`, `email`, `user_id`, `photo`, `qr_code`, `status`, `total_points`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2510001', '0123456701', 'Andi Pratama', 'L', 1, 1, 1, 1, '085711111111', 'andipratama.siswa@gmail.com', 3, NULL, 'PSW-AHN8ODEDK2FRE7BYB6G3WS9IOMH1', 'active', 15, '2026-08-21 06:05:30', '2026-09-05 23:57:01', NULL),
(2, '2510002', '0123456702', 'Bella Safitri', 'P', 1, 1, 1, 2, '085722222222', NULL, NULL, NULL, NULL, 'active', 0, '2026-08-21 06:05:30', '2026-08-29 06:58:33', NULL),
(3, '2510003', '0123456703', 'Citra Ayu', 'P', 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, 'inactive', 0, '2026-08-21 06:05:30', '2026-08-30 02:09:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_homeroom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `user_id`, `name`, `nip`, `phone`, `email`, `is_homeroom`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 'Ahmad Fauzi, S.Pd.', '198001012005011001', '081234567101', 'ahmadfauzi.guru@gmail.com', 1, '2026-08-21 06:05:30', '2026-09-04 18:37:11', NULL),
(2, 5, 'Siti Rahayu, S.Kom.', '198503152010012003', '081234567102', 'sitirahayu.bk@gmail.com', 1, '2026-08-21 06:05:30', '2026-09-04 18:49:10', NULL),
(3, NULL, 'Budi Santoso, S.T.', '199002102015031002', '081234567103', NULL, 0, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(4, NULL, 'V', NULL, '121211111', NULL, 0, '2026-08-30 08:37:09', '2026-08-30 08:37:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `phone`, `photo`, `is_active`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Super Admin', 'superadmin@psiswa.test', NULL, '$2y$12$MsNeZIzJRFOyjrC24NywGuxO7EZMlDoyBkvPEkD7W5yeBJkC1aRR.', NULL, NULL, 1, NULL, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(2, 'Hendra Wijaya', 'hendrawijaya.ortu@gmail.com', NULL, '$2y$12$BgYGktg9D/LFtV2bwbTY4O07hHyc846kkNXJgstb4ewpZ/nEyBGSC', '081234567001', NULL, 1, NULL, '2026-09-04 13:06:58', '2026-09-06 10:52:26', NULL),
(3, 'Andi Pratama', 'andipratama.siswa@gmail.com', NULL, '$2y$12$kAc6RzqImbj/3ZKUpB/8aeYIWb56oulbCcllgp2c5DrdpsE8L94RK', '085711111111', NULL, 1, NULL, '2026-09-04 13:52:42', '2026-09-06 10:50:51', NULL),
(4, 'Ahmad Fauzi, S.Pd.', 'ahmadfauzi.guru@gmail.com', NULL, '$2y$12$SoST99esfcqz..1.YpMtsu.MpswkFIlKg8HBAz85JjvrF8UoaVIQS', '081234567101', NULL, 1, NULL, '2026-09-04 18:37:11', '2026-09-04 18:37:11', NULL),
(5, 'Siti Rahayu, S.Kom.', 'sitirahayu.bk@gmail.com', NULL, '$2y$12$BHcCtkpeIKggln6x7Vhee./LmvGSjoRXzjWkjkvxaaIypucjyKbwq', '081234567102', NULL, 1, NULL, '2026-09-04 18:49:10', '2026-09-04 18:49:10', NULL),
(6, 'Admin Sekolah', 'adminsekolah@psiswa.test', NULL, '$2y$12$M2LYPPOsEUP6MCaH3Yv8jOeTjIrqrbdkqFgHl9UZu8RrXIHsMOxQi', '081234560001', NULL, 1, NULL, '2026-09-04 19:08:10', '2026-09-06 11:43:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `violations`
--

CREATE TABLE `violations` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `points` int UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `violations`
--

INSERT INTO `violations` (`id`, `category_id`, `name`, `points`, `description`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Terlambat masuk sekolah', 10, 'Hadir setelah bel masuk berbunyi.', 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(2, 1, 'Terlambat masuk kelas', 5, 'Kembali ke kelas setelah jam istirahat/bel pergantian.', 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(3, 1, 'Peringatan 1 Keterlambatan', 0, 'Peringatan pertama — siswa sudah terlambat.', 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(4, 1, 'Peringatan 2 Keterlambatan', 0, 'Peringatan kedua — siswa sudah terlambat 2 kali.', 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(5, 1, 'Keterlambatan + Surat Peringatan (SP)', 15, 'Keterlambatan berulang — dikenakan poin + Surat Peringatan.', 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(6, 2, 'Tidak memakai seragam lengkap', 10, NULL, 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(7, 2, 'Tidak memakai atribut sekolah', 10, 'Lokasi, badge, dan kelengkapan identitas.', 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(8, 2, 'Memakai aksesoris berlebihan', 5, NULL, 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(9, 2, 'Sepatu tidak sesuai ketentuan', 5, NULL, 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(10, 3, 'Meninggalkan kelas tanpa izin', 15, NULL, 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(11, 3, 'Membolos', 25, 'Tidak hadir tanpa keterangan.', 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(12, 4, 'Tidak mengerjakan tugas', 5, NULL, 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(13, 4, 'Tidak membawa buku pelajaran', 5, NULL, 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(14, 5, 'Berkelahi', 50, NULL, 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(15, 5, 'Membawa rokok', 40, NULL, 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(16, 5, 'Membawa HP saat jam pelajaran', 10, NULL, 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(17, 5, 'Mencontek', 20, NULL, 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(18, 5, 'Berkata tidak sopan', 15, NULL, 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(19, 6, 'Melanggar tata tertib lalu lintas', 15, NULL, 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(20, 6, 'Membuang sampah sembarangan', 5, NULL, 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(21, 7, 'Pelanggaran lainnya', 5, NULL, 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `violation_categories`
--

CREATE TABLE `violation_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `violation_categories`
--

INSERT INTO `violation_categories` (`id`, `name`, `description`, `sort_order`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Keterlambatan', 'Terlambat masuk sekolah/kelas.', 1, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(2, 'Atribut', 'Pelanggaran terkait seragam dan atribut sekolah.', 2, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(3, 'Absensi', 'Ketidakhadiran dan meninggalkan kegiatan tanpa izin.', 3, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(4, 'Tugas', 'Kelalaian dalam tugas dan perlengkapan belajar.', 4, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(5, 'Perilaku', 'Perilaku yang melanggar tata tertib sekolah.', 5, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(6, 'Kedisiplinan', 'Pelanggaran kedisiplinan umum.', 6, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL),
(7, 'Lainnya', 'Pelanggaran lain yang tidak termasuk kategori di atas.', 7, '2026-08-21 06:05:30', '2026-08-21 06:05:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `violation_records`
--

CREATE TABLE `violation_records` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `violation_id` bigint UNSIGNED NOT NULL,
  `recorded_by` bigint UNSIGNED NOT NULL,
  `occurred_at` datetime NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `points` int UNSIGNED NOT NULL,
  `status` enum('recorded','corrected','voided') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'recorded',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `violation_records`
--

INSERT INTO `violation_records` (`id`, `student_id`, `violation_id`, `recorded_by`, `occurred_at`, `notes`, `points`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 9, 1, '2026-08-29 20:57:00', NULL, 5, 'voided', '2026-08-29 06:57:48', '2026-08-29 06:58:33', NULL),
(2, 1, 9, 1, '2026-09-05 03:14:00', NULL, 5, 'recorded', '2026-09-04 13:14:48', '2026-09-04 13:14:48', NULL),
(3, 1, 9, 1, '2026-09-06 12:07:00', 'z', 5, 'recorded', '2026-09-05 22:08:21', '2026-09-05 22:08:21', NULL),
(4, 1, 21, 1, '2026-09-06 13:56:00', NULL, 5, 'recorded', '2026-09-05 23:57:01', '2026-09-05 23:57:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `warning_letters`
--

CREATE TABLE `warning_letters` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `template_id` bigint UNSIGNED NOT NULL,
  `type` enum('peringatan','panggilan_orang_tua','pembinaan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` json NOT NULL,
  `pdf_path` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generated_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warning_letters`
--

INSERT INTO `warning_letters` (`id`, `student_id`, `template_id`, `type`, `data`, `pdf_path`, `generated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'peringatan', '{\"nis\": \"2510001\", \"date\": \"05 September 2026\", \"nisn\": \"0123456701\", \"class_name\": \"X RPL 1\", \"major_name\": \"Rekayasa Perangkat Lunak\", \"parent_name\": \"Hendra Wijaya\", \"school_name\": \"SMA Nusantara\", \"school_year\": \"2025/2026\", \"signer_name\": \"Super Admin\", \"signer_role\": \"Kepala Sekolah\", \"parent_phone\": \"081234567001\", \"student_name\": \"Andi Pratama\", \"total_points\": \"5\"}', 'warning-letters/1.pdf', 1, '2026-09-04 21:36:23', '2026-09-04 21:36:24'),
(3, 1, 1, 'peringatan', '{\"nis\": \"2510001\", \"date\": \"05 September 2026\", \"nisn\": \"0123456701\", \"class_name\": \"X RPL 1\", \"major_name\": \"Rekayasa Perangkat Lunak\", \"parent_name\": \"Hendra Wijaya\", \"school_name\": \"SMA Nusantara\", \"school_year\": \"2025/2026\", \"signer_name\": \"Super Admin\", \"signer_role\": \"Kepala Sekolah\", \"parent_phone\": \"081234567001\", \"student_name\": \"Andi Pratama\", \"total_points\": \"5\"}', 'warning-letters/3.pdf', 1, '2026-09-04 21:49:42', '2026-09-04 21:49:43'),
(4, 1, 1, 'peringatan', '{\"nis\": \"2510001\", \"date\": \"05 September 2026\", \"nisn\": \"0123456701\", \"class_name\": \"X RPL 1\", \"major_name\": \"Rekayasa Perangkat Lunak\", \"parent_name\": \"Hendra Wijaya\", \"school_name\": \"SMA Nusantara\", \"school_year\": \"2025/2026\", \"signer_name\": \"Super Admin\", \"signer_role\": \"Kepala Sekolah\", \"parent_phone\": \"081234567001\", \"student_name\": \"Andi Pratama\", \"total_points\": \"5\"}', 'warning-letters/4.pdf', 1, '2026-09-04 21:54:58', '2026-09-04 21:55:00'),
(5, 1, 1, 'peringatan', '{\"nis\": \"2510001\", \"date\": \"06 September 2026\", \"nisn\": \"0123456701\", \"class_name\": \"X RPL 1\", \"major_name\": \"Rekayasa Perangkat Lunak\", \"parent_name\": \"Hendra Wijaya\", \"school_name\": \"SMA Nusantara\", \"school_year\": \"2025/2026\", \"signer_name\": \"Super Admin\", \"signer_role\": \"Kepala Sekolah\", \"parent_phone\": \"081234567001\", \"student_name\": \"Andi Pratama\", \"total_points\": \"10\"}', 'warning-letters/5.pdf', 1, '2026-09-05 23:44:35', '2026-09-05 23:44:36'),
(6, 1, 1, 'peringatan', '{\"nis\": \"2510001\", \"date\": \"06 September 2026\", \"nisn\": \"0123456701\", \"class_name\": \"X RPL 1\", \"major_name\": \"Rekayasa Perangkat Lunak\", \"parent_name\": \"Hendra Wijaya\", \"school_name\": \"SMA Nusantara\", \"school_year\": \"2025/2026\", \"signer_name\": \"Super Admin\", \"signer_role\": \"Kepala Sekolah\", \"parent_phone\": \"081234567001\", \"student_name\": \"Andi Pratama\", \"total_points\": \"15\"}', 'warning-letters/6.pdf', 1, '2026-09-06 03:26:58', '2026-09-06 03:27:01'),
(7, 1, 1, 'peringatan', '{\"nis\": \"2510001\", \"date\": \"06 September 2026\", \"nisn\": \"0123456701\", \"class_name\": \"X RPL 1\", \"major_name\": \"Rekayasa Perangkat Lunak\", \"parent_name\": \"Hendra Wijaya\", \"school_name\": \"SMA Nusantara\", \"school_year\": \"2025/2026\", \"signer_name\": \"Super Admin\", \"signer_role\": \"Kepala Sekolah\", \"parent_phone\": \"081234567001\", \"student_name\": \"Andi Pratama\", \"total_points\": \"15\"}', 'warning-letters/7.pdf', 1, '2026-09-06 03:53:20', '2026-09-06 03:53:23'),
(8, 1, 1, 'peringatan', '{\"nis\": \"2510001\", \"date\": \"06 September 2026\", \"nisn\": \"0123456701\", \"class_name\": \"X RPL 1\", \"major_name\": \"Rekayasa Perangkat Lunak\", \"parent_name\": \"Hendra Wijaya\", \"school_name\": \"SMA Nusantara\", \"school_year\": \"2025/2026\", \"signer_name\": \"Super Admin\", \"signer_role\": \"Kepala Sekolah\", \"parent_phone\": \"081234567001\", \"student_name\": \"Andi Pratama\", \"total_points\": \"15\"}', 'warning-letters/8.pdf', 1, '2026-09-06 05:19:59', '2026-09-06 05:20:01'),
(9, 1, 1, 'peringatan', '{\"nis\": \"2510001\", \"date\": \"06 September 2026\", \"nisn\": \"0123456701\", \"class_name\": \"X RPL 1\", \"major_name\": \"Rekayasa Perangkat Lunak\", \"parent_name\": \"Hendra Wijaya\", \"school_name\": \"SMA Nusantara\", \"school_year\": \"2025/2026\", \"signer_name\": \"Super Admin\", \"signer_role\": \"Kepala Sekolah\", \"parent_phone\": \"081234567001\", \"student_name\": \"Andi Pratama\", \"total_points\": \"15\"}', 'warning-letters/9.pdf', 1, '2026-09-06 05:21:43', '2026-09-06 05:21:45'),
(10, 1, 1, 'peringatan', '{\"nis\": \"2510001\", \"date\": \"06 September 2026\", \"nisn\": \"0123456701\", \"class_name\": \"X RPL 1\", \"major_name\": \"Rekayasa Perangkat Lunak\", \"parent_name\": \"Hendra Wijaya\", \"school_name\": \"SMA Nusantara\", \"school_year\": \"2025/2026\", \"signer_name\": \"Super Admin\", \"signer_role\": \"Kepala Sekolah\", \"parent_phone\": \"081234567001\", \"student_name\": \"Andi Pratama\", \"total_points\": \"15\"}', 'warning-letters/10.pdf', 1, '2026-09-06 06:28:31', '2026-09-06 06:28:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_logs_action_module_index` (`action`,`module`),
  ADD KEY `audit_logs_user_id_created_at_index` (`user_id`,`created_at`),
  ADD KEY `audit_logs_created_at_index` (`created_at`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classes_major_id_foreign` (`major_id`),
  ADD KEY `classes_homeroom_teacher_id_foreign` (`homeroom_teacher_id`),
  ADD KEY `classes_level_index` (`level`);

--
-- Indexes for table `counseling_records`
--
ALTER TABLE `counseling_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `counseling_records_student_id_index` (`student_id`),
  ADD KEY `counseling_records_status_index` (`status`),
  ADD KEY `counseling_records_handled_by_index` (`handled_by`),
  ADD KEY `counseling_records_date_index` (`date`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `in_app_notifications`
--
ALTER TABLE `in_app_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `in_app_notifications_user_id_index` (`user_id`),
  ADD KEY `in_app_notifications_read_at_index` (`read_at`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `late_records`
--
ALTER TABLE `late_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `late_records_recorded_by_foreign` (`recorded_by`),
  ADD KEY `late_records_student_id_index` (`student_id`),
  ADD KEY `late_records_date_index` (`date`),
  ADD KEY `late_records_status_index` (`status`);

--
-- Indexes for table `letter_templates`
--
ALTER TABLE `letter_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `letter_templates_type_index` (`type`);

--
-- Indexes for table `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `majors_code_unique` (`code`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parents_user_id_foreign` (`user_id`);

--
-- Indexes for table `parent_notifications`
--
ALTER TABLE `parent_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_notifications_parent_id_index` (`parent_id`),
  ADD KEY `parent_notifications_student_id_index` (`student_id`),
  ADD KEY `parent_notifications_status_index` (`status`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `point_histories`
--
ALTER TABLE `point_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `point_histories_violation_record_id_foreign` (`violation_record_id`),
  ADD KEY `point_histories_changed_by_foreign` (`changed_by`),
  ADD KEY `point_histories_student_id_index` (`student_id`),
  ADD KEY `point_histories_created_at_index` (`created_at`),
  ADD KEY `point_histories_student_created_index` (`student_id`,`created_at`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`role_id`,`user_id`),
  ADD KEY `role_user_user_id_index` (`user_id`);

--
-- Indexes for table `school_years`
--
ALTER TABLE `school_years`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `school_years_name_unique` (`name`),
  ADD KEY `school_years_is_active_index` (`is_active`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`),
  ADD KEY `settings_group_index` (`group`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_nis_unique` (`nis`),
  ADD UNIQUE KEY `students_nisn_unique` (`nisn`),
  ADD UNIQUE KEY `students_qr_code_unique` (`qr_code`),
  ADD KEY `students_class_id_foreign` (`class_id`),
  ADD KEY `students_major_id_foreign` (`major_id`),
  ADD KEY `students_school_year_id_foreign` (`school_year_id`),
  ADD KEY `students_parent_id_foreign` (`parent_id`),
  ADD KEY `students_name_index` (`name`),
  ADD KEY `students_status_index` (`status`),
  ADD KEY `students_total_points_index` (`total_points`),
  ADD KEY `students_user_id_foreign` (`user_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teachers_nip_unique` (`nip`),
  ADD KEY `teachers_user_id_foreign` (`user_id`),
  ADD KEY `teachers_is_homeroom_index` (`is_homeroom`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `violations`
--
ALTER TABLE `violations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `violations_category_id_index` (`category_id`),
  ADD KEY `violations_name_index` (`name`);

--
-- Indexes for table `violation_categories`
--
ALTER TABLE `violation_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `violation_categories_name_unique` (`name`),
  ADD KEY `violation_categories_sort_order_index` (`sort_order`);

--
-- Indexes for table `violation_records`
--
ALTER TABLE `violation_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `violation_records_student_id_index` (`student_id`),
  ADD KEY `violation_records_violation_id_index` (`violation_id`),
  ADD KEY `violation_records_recorded_by_index` (`recorded_by`),
  ADD KEY `violation_records_occurred_at_index` (`occurred_at`),
  ADD KEY `violation_records_status_index` (`status`),
  ADD KEY `violation_records_occurred_status_index` (`occurred_at`,`status`);

--
-- Indexes for table `warning_letters`
--
ALTER TABLE `warning_letters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warning_letters_generated_by_foreign` (`generated_by`),
  ADD KEY `warning_letters_student_id_index` (`student_id`),
  ADD KEY `warning_letters_template_id_index` (`template_id`),
  ADD KEY `warning_letters_type_index` (`type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `counseling_records`
--
ALTER TABLE `counseling_records`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `in_app_notifications`
--
ALTER TABLE `in_app_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `late_records`
--
ALTER TABLE `late_records`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `letter_templates`
--
ALTER TABLE `letter_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `majors`
--
ALTER TABLE `majors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `parent_notifications`
--
ALTER TABLE `parent_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `point_histories`
--
ALTER TABLE `point_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `school_years`
--
ALTER TABLE `school_years`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `violations`
--
ALTER TABLE `violations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `violation_categories`
--
ALTER TABLE `violation_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `violation_records`
--
ALTER TABLE `violation_records`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `warning_letters`
--
ALTER TABLE `warning_letters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `audit_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_homeroom_teacher_id_foreign` FOREIGN KEY (`homeroom_teacher_id`) REFERENCES `teachers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `classes_major_id_foreign` FOREIGN KEY (`major_id`) REFERENCES `majors` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `counseling_records`
--
ALTER TABLE `counseling_records`
  ADD CONSTRAINT `counseling_records_handled_by_foreign` FOREIGN KEY (`handled_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `counseling_records_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `in_app_notifications`
--
ALTER TABLE `in_app_notifications`
  ADD CONSTRAINT `in_app_notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `late_records`
--
ALTER TABLE `late_records`
  ADD CONSTRAINT `late_records_recorded_by_foreign` FOREIGN KEY (`recorded_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `late_records_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `parents`
--
ALTER TABLE `parents`
  ADD CONSTRAINT `parents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `parent_notifications`
--
ALTER TABLE `parent_notifications`
  ADD CONSTRAINT `parent_notifications_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`id`),
  ADD CONSTRAINT `parent_notifications_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `point_histories`
--
ALTER TABLE `point_histories`
  ADD CONSTRAINT `point_histories_changed_by_foreign` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `point_histories_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `point_histories_violation_record_id_foreign` FOREIGN KEY (`violation_record_id`) REFERENCES `violation_records` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `students_major_id_foreign` FOREIGN KEY (`major_id`) REFERENCES `majors` (`id`),
  ADD CONSTRAINT `students_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `students_school_year_id_foreign` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`id`),
  ADD CONSTRAINT `students_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `violations`
--
ALTER TABLE `violations`
  ADD CONSTRAINT `violations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `violation_categories` (`id`);

--
-- Constraints for table `violation_records`
--
ALTER TABLE `violation_records`
  ADD CONSTRAINT `violation_records_recorded_by_foreign` FOREIGN KEY (`recorded_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `violation_records_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `violation_records_violation_id_foreign` FOREIGN KEY (`violation_id`) REFERENCES `violations` (`id`);

--
-- Constraints for table `warning_letters`
--
ALTER TABLE `warning_letters`
  ADD CONSTRAINT `warning_letters_generated_by_foreign` FOREIGN KEY (`generated_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `warning_letters_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `warning_letters_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `letter_templates` (`id`);
--
-- Database: `sekolah`
--
CREATE DATABASE IF NOT EXISTS `sekolah` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `sekolah`;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id` int NOT NULL,
  `nis` varchar(16) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tplahir` varchar(50) NOT NULL,
  `tglahir` date NOT NULL,
  `kelamin` varchar(15) NOT NULL,
  `agama` varchar(15) NOT NULL,
  `alamat` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `nis`, `nama`, `tplahir`, `tglahir`, `kelamin`, `agama`, `alamat`) VALUES
(2, '12345', 'Lav', 'Malang', '2009-01-07', 'laki laki', 'islam', 'Kepuh');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `simgudangtoko_db`
--
CREATE DATABASE IF NOT EXISTS `simgudangtoko_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `simgudangtoko_db`;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id` bigint UNSIGNED NOT NULL,
  `produk_id` bigint UNSIGNED NOT NULL,
  `jumlah` int UNSIGNED NOT NULL,
  `harga` int UNSIGNED NOT NULL,
  `sub_total` int UNSIGNED NOT NULL,
  `transaksi_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gudang`
--

CREATE TABLE `gudang` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_04_20_141242_create_kategori_table', 1),
(5, '2026_04_20_141242_create_pengguna_table', 1),
(6, '2026_04_20_141243_create_gudang_table', 1),
(7, '2026_04_20_141243_create_produk_table', 1),
(8, '2026_04_20_141244_create_stok_gudang_table', 1),
(9, '2026_04_20_141244_create_toko_table', 1),
(10, '2026_04_20_141245_create_stok_toko_table', 1),
(11, '2026_04_20_141245_create_transaksi_table', 1),
(12, '2026_04_20_141246_create_detail_transaksi_table', 1),
(13, '2026_04_28_005337_create_permission_tables', 1),
(14, '2026_04_29_020244_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Pengguna', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `nama`, `email`, `password`, `foto`, `no_hp`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@admin.com', '$2y$12$dgsSiDPaA.pzfpS95iUgUu.m.bdW9Ex8ShU1Qop4vMeLq4LpzSI8K', '', '08123456789', NULL, '2026-05-18 21:01:10', '2026-05-19 17:51:32');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Pengguna', 1, 'auth_token', 'e2714c1dd03d42aaaa29bebb83a4eaf7bbf516b2fb395530cd3cc13ab5beb59f', '[\"*\"]', NULL, NULL, '2026-05-24 20:38:05', '2026-05-24 20:38:05'),
(2, 'App\\Models\\Pengguna', 1, 'auth_token', '454b72b912be19d937269d7e461237d2a39223557f7f33a18e71b108f5c7ebe4', '[\"*\"]', NULL, NULL, '2026-05-24 20:38:19', '2026-05-24 20:38:19'),
(3, 'App\\Models\\Pengguna', 1, 'auth_token', '09a66555d097852ced8fdcd8a4abe41a5842df207d74c8879905bedfd807caa6', '[\"*\"]', NULL, NULL, '2026-05-24 20:38:48', '2026-05-24 20:38:48'),
(4, 'App\\Models\\Pengguna', 1, 'auth_token', '7692790894103b9118137d3c11d7c439ebed7fa4b323ac69378f374e3bdde096', '[\"*\"]', NULL, NULL, '2026-05-24 20:47:51', '2026-05-24 20:47:51'),
(5, 'App\\Models\\Pengguna', 1, 'test', 'c8d211c432c4867b38cca336c5f3121a43be2c7719ba4043c42157e382207f40', '[\"*\"]', NULL, NULL, '2026-05-24 21:00:54', '2026-05-24 21:00:54'),
(6, 'App\\Models\\Pengguna', 1, 'auth_token', '5c97a197e937108563f324cdae1bda86c2cff92d5855e832bc59ca0498052e37', '[\"*\"]', NULL, NULL, '2026-05-24 21:04:53', '2026-05-24 21:04:53'),
(7, 'App\\Models\\Pengguna', 1, 'auth_token', '1ee6b9667042b7972fb4115b089f28ea3ebf9e522bd2d1660de858dec16f2b08', '[\"*\"]', NULL, NULL, '2026-05-24 21:07:50', '2026-05-24 21:07:50'),
(8, 'App\\Models\\Pengguna', 1, 'auth_token', 'a1c9cb1a04c3da2c875fcaf8591354a4847c18270f20af4db12574fefc825795', '[\"*\"]', NULL, NULL, '2026-05-24 21:16:34', '2026-05-24 21:16:34'),
(9, 'App\\Models\\Pengguna', 1, 'auth_token', '9bd47e29380d7e9d7c5fe3b272e2120c80882901ab19c5105a28b608682218ee', '[\"*\"]', NULL, NULL, '2026-05-24 21:16:55', '2026-05-24 21:16:55'),
(10, 'App\\Models\\Pengguna', 1, 'auth_token', 'ce45ca08ae1d2831b2d3e62afc6409b84138f82ec6840be280f089ea1562730d', '[\"*\"]', NULL, NULL, '2026-05-24 21:22:14', '2026-05-24 21:22:14'),
(11, 'App\\Models\\Pengguna', 1, 'auth_token', '264dfc69b1f83af0a260942ddc64fe36c80680b8313c23591fcd0e247d6e4ef1', '[\"*\"]', NULL, NULL, '2026-05-24 21:27:34', '2026-05-24 21:27:34'),
(12, 'App\\Models\\Pengguna', 1, 'auth_token', 'dd086d05dcdb43f376cab84ef4899a89327ff42f93172fee48cf79a83b845760', '[\"*\"]', NULL, NULL, '2026-05-24 21:31:57', '2026-05-24 21:31:57'),
(13, 'App\\Models\\Pengguna', 1, 'auth_token', '1a9f0f111446d1b112d2fccd84c9850af0a9cfc55c4c852409f4b7c6b3616a7e', '[\"*\"]', NULL, NULL, '2026-05-24 21:36:09', '2026-05-24 21:36:09'),
(14, 'App\\Models\\Pengguna', 1, 'auth_token', '02bd40f7def6e540a4a8d0e44a08a3e9c2cfb1e10ab40e3639e3cd62505675d9', '[\"*\"]', NULL, NULL, '2026-05-24 21:41:54', '2026-05-24 21:41:54'),
(15, 'App\\Models\\Pengguna', 1, 'auth_token', '082c76215ff80dda2cf34fa403a0fd0b3fe4364ffd5938b05ac7ab08cc29efe0', '[\"*\"]', NULL, NULL, '2026-05-24 21:44:42', '2026-05-24 21:44:42'),
(16, 'App\\Models\\Pengguna', 1, 'auth_token', 'c648e946fa81af35469b2f2b3ae28b948fe789f74f4c6ff6141eaf0373e8e491', '[\"*\"]', NULL, NULL, '2026-05-24 21:52:30', '2026-05-24 21:52:30'),
(17, 'App\\Models\\Pengguna', 1, 'auth_token', 'e582daefdab90c591fefb9279fda06c82d58228acaffb929fd7785073f18e3b1', '[\"*\"]', NULL, NULL, '2026-05-24 21:55:52', '2026-05-24 21:55:52'),
(18, 'App\\Models\\Pengguna', 1, 'auth_token', '016a27e31ced4254d17b2206be1371e516c786290c6303999412e823b9c4c8bc', '[\"*\"]', NULL, NULL, '2026-05-24 21:57:23', '2026-05-24 21:57:23'),
(19, 'App\\Models\\Pengguna', 1, 'auth_token', 'db34c472b203e32ed90523b5384c330e2004dc3427729349ab0400a0e820a166', '[\"*\"]', NULL, NULL, '2026-05-24 21:58:33', '2026-05-24 21:58:33'),
(20, 'App\\Models\\Pengguna', 1, 'auth_token', '0583f9304ab9469e394217055ace9669dd6069a43c6cd4994b6dae1c76701970', '[\"*\"]', NULL, NULL, '2026-05-24 22:17:27', '2026-05-24 22:17:27'),
(21, 'App\\Models\\Pengguna', 1, 'auth_token', 'b465ba9bd7b0c07f75016ffa54df0cc943063ab0525701c3a6f8349b802f3e9c', '[\"*\"]', NULL, NULL, '2026-05-24 22:22:53', '2026-05-24 22:22:53'),
(22, 'App\\Models\\Pengguna', 1, 'auth_token', '2acfe1baeee6673f8880a9db879e7ac48ab3b5d35a9dd850a0cc25cdfc96c28a', '[\"*\"]', NULL, NULL, '2026-05-24 22:29:41', '2026-05-24 22:29:41'),
(23, 'App\\Models\\Pengguna', 1, 'auth_token', '8c8cab11971b47b27b422421166c075591f04a06f9962698fe051d3c692272e7', '[\"*\"]', NULL, NULL, '2026-05-24 22:31:09', '2026-05-24 22:31:09'),
(24, 'App\\Models\\Pengguna', 1, 'auth_token', '0b37db3100d5a45819c01d639fcf55996559c68954bbc5f4214560cb4c28c5c9', '[\"*\"]', NULL, NULL, '2026-05-24 22:34:42', '2026-05-24 22:34:42'),
(25, 'App\\Models\\Pengguna', 1, 'auth_token', 'd5f0ecbaa81e77a019b14478a62dbdf116d7b5cc59ea03ff64d52aea58b9f60a', '[\"*\"]', '2026-05-25 17:31:06', NULL, '2026-05-25 17:29:11', '2026-05-25 17:31:06'),
(26, 'App\\Models\\Pengguna', 1, 'auth_token', 'b90c9b074f82363f4365d1a540a6ea705efa764019b0e01103363d9c01edd190', '[\"*\"]', '2026-05-25 17:33:16', NULL, '2026-05-25 17:31:13', '2026-05-25 17:33:16'),
(27, 'App\\Models\\Pengguna', 1, 'auth_token', 'ee22baf9d5ecc775a0f82feb127fc35e3e391020bc6252b2e2421480917799fb', '[\"*\"]', '2026-05-25 17:33:28', NULL, '2026-05-25 17:33:23', '2026-05-25 17:33:28'),
(28, 'App\\Models\\Pengguna', 1, 'auth_token', '31e630b584c08245ced53039d3b7e55f1ea16f80ab9878538dacfc710dc47122', '[\"*\"]', '2026-05-25 18:03:52', NULL, '2026-05-25 17:33:39', '2026-05-25 18:03:52'),
(29, 'App\\Models\\Pengguna', 1, 'auth_token', '8be2d65ae25e444ce4ece6fe77f1ae4d27375ff9a58a7795a071f40d5ffb4d79', '[\"*\"]', '2026-06-10 23:34:27', NULL, '2026-06-10 21:55:50', '2026-06-10 23:34:27');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int UNSIGNED NOT NULL,
  `kategori_id` bigint UNSIGNED NOT NULL,
  `is_popular` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2026-05-19 17:59:21', '2026-05-19 17:59:21');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('BZcIs0HTK1yEBsPYCE1IxSZvIYbSB6riS35zeWyi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0xnUTFrc0gzZElsM3dTaVNIMGI1Q1Y3cUswUm9WcVpxMUdmMjdOQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1779687271);

-- --------------------------------------------------------

--
-- Table structure for table `stok_gudang`
--

CREATE TABLE `stok_gudang` (
  `id` bigint UNSIGNED NOT NULL,
  `gudang_id` bigint UNSIGNED NOT NULL,
  `produk_id` bigint UNSIGNED NOT NULL,
  `stok` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stok_toko`
--

CREATE TABLE `stok_toko` (
  `id` bigint UNSIGNED NOT NULL,
  `toko_id` bigint UNSIGNED NOT NULL,
  `produk_id` bigint UNSIGNED NOT NULL,
  `stok` int UNSIGNED NOT NULL,
  `gudang_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `toko`
--

CREATE TABLE `toko` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_pelanggan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_total` int UNSIGNED NOT NULL,
  `pajak` int UNSIGNED NOT NULL,
  `total_bayar` int UNSIGNED NOT NULL,
  `toko_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_transaksi_produk_id_foreign` (`produk_id`),
  ADD KEY `detail_transaksi_transaksi_id_foreign` (`transaksi_id`),
  ADD KEY `detail_transaksi_jumlah_index` (`jumlah`),
  ADD KEY `detail_transaksi_sub_total_index` (`sub_total`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gudang`
--
ALTER TABLE `gudang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kategori_nama_unique` (`nama`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pengguna_email_unique` (`email`),
  ADD UNIQUE KEY `pengguna_no_hp_unique` (`no_hp`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `produk_nama_unique` (`nama`),
  ADD KEY `produk_kategori_id_foreign` (`kategori_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `stok_gudang`
--
ALTER TABLE `stok_gudang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stok_gudang_gudang_id_foreign` (`gudang_id`),
  ADD KEY `stok_gudang_produk_id_foreign` (`produk_id`);

--
-- Indexes for table `stok_toko`
--
ALTER TABLE `stok_toko`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stok_toko_toko_id_foreign` (`toko_id`),
  ADD KEY `stok_toko_produk_id_foreign` (`produk_id`),
  ADD KEY `stok_toko_gudang_id_foreign` (`gudang_id`),
  ADD KEY `stok_toko_stok_index` (`stok`);

--
-- Indexes for table `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `toko_nama_unique` (`nama`),
  ADD UNIQUE KEY `toko_no_hp_unique` (`no_hp`),
  ADD KEY `toko_operator_id_foreign` (`operator_id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksi_toko_id_foreign` (`toko_id`),
  ADD KEY `transaksi_nama_pelanggan_index` (`nama_pelanggan`),
  ADD KEY `transaksi_no_hp_index` (`no_hp`),
  ADD KEY `transaksi_total_bayar_index` (`total_bayar`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gudang`
--
ALTER TABLE `gudang`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stok_gudang`
--
ALTER TABLE `stok_gudang`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stok_toko`
--
ALTER TABLE `stok_toko`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `toko`
--
ALTER TABLE `toko`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_transaksi_transaksi_id_foreign` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stok_gudang`
--
ALTER TABLE `stok_gudang`
  ADD CONSTRAINT `stok_gudang_gudang_id_foreign` FOREIGN KEY (`gudang_id`) REFERENCES `gudang` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stok_gudang_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stok_toko`
--
ALTER TABLE `stok_toko`
  ADD CONSTRAINT `stok_toko_gudang_id_foreign` FOREIGN KEY (`gudang_id`) REFERENCES `gudang` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stok_toko_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stok_toko_toko_id_foreign` FOREIGN KEY (`toko_id`) REFERENCES `toko` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `toko`
--
ALTER TABLE `toko`
  ADD CONSTRAINT `toko_operator_id_foreign` FOREIGN KEY (`operator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_toko_id_foreign` FOREIGN KEY (`toko_id`) REFERENCES `toko` (`id`) ON DELETE CASCADE;
--
-- Database: `smartstockumkm`
--
CREATE DATABASE IF NOT EXISTS `smartstockumkm` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `smartstockumkm`;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Pokok', NULL, '2026-08-09 23:29:59', '2026-08-09 23:29:59'),
(2, 'Klepon', NULL, '2026-08-26 17:05:51', '2026-08-26 17:05:51'),
(3, 'sabun mandi', NULL, '2026-09-01 00:06:21', '2026-09-01 00:07:26'),
(4, 'sabun cuci piring', NULL, '2026-09-01 00:07:38', '2026-09-01 00:07:38'),
(5, 'sabun cuci baju', NULL, '2026-09-01 00:07:53', '2026-09-01 00:07:53');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2026_08_06_013859_add_is_voided_to_sales_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `unit` varchar(20) NOT NULL DEFAULT 'pcs',
  `current_stock` int NOT NULL DEFAULT '0',
  `average_cost` decimal(14,2) NOT NULL DEFAULT '0.00',
  `selling_price` decimal(14,2) NOT NULL DEFAULT '0.00',
  `expired_date` date DEFAULT NULL,
  `last_sold_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `unit`, `current_stock`, `average_cost`, `selling_price`, `expired_date`, `last_sold_at`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Beras', 'pcs', 2, 25000.00, 30000.00, NULL, '2026-09-03 02:57:00', 1, '2026-08-09 23:34:05', '2026-09-02 19:57:00'),
(2, 1, 'Kopi', 'pcs', 0, 10000.00, 0.00, NULL, '2026-08-24 07:20:50', 1, '2026-08-23 23:33:55', '2026-08-26 17:15:57'),
(3, 1, 'Ayam', 'pcs', 0, 10000.00, 20000.00, NULL, '2026-09-03 02:54:41', 1, '2026-08-26 16:56:18', '2026-09-02 19:54:41'),
(6, 3, 'harmony', 'pcs', 0, 626.88, 0.00, NULL, '2026-09-01 07:16:41', 1, '2026-09-01 00:08:21', '2026-09-02 19:58:20'),
(7, 4, 'mama lemon', 'pcs', 0, 9000.00, 0.00, NULL, '2026-09-01 07:21:01', 1, '2026-09-01 00:08:43', '2026-09-02 19:58:01'),
(8, 5, 'soklin', 'pcs', 0, 0.00, 0.00, NULL, NULL, 1, '2026-09-01 00:09:12', '2026-09-01 00:09:12');

-- --------------------------------------------------------

--
-- Table structure for table `product_price_histories`
--

CREATE TABLE `product_price_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `purchase_id` bigint UNSIGNED DEFAULT NULL,
  `old_average_cost` decimal(14,2) DEFAULT NULL,
  `new_average_cost` decimal(14,2) DEFAULT NULL,
  `old_selling_price` decimal(14,2) DEFAULT NULL,
  `new_selling_price` decimal(14,2) DEFAULT NULL,
  `change_type` enum('purchase','manual_price_change') NOT NULL,
  `changed_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_price_histories`
--

INSERT INTO `product_price_histories` (`id`, `product_id`, `purchase_id`, `old_average_cost`, `new_average_cost`, `old_selling_price`, `new_selling_price`, `change_type`, `changed_at`, `created_at`, `updated_at`) VALUES
(3, 2, 3, 0.00, 10000.00, NULL, NULL, 'purchase', '2026-08-24 06:34:46', '2026-08-23 23:34:46', '2026-08-23 23:34:46'),
(6, 1, 6, 0.00, 10000.00, NULL, NULL, 'purchase', '2026-08-26 23:10:58', '2026-08-26 16:10:58', '2026-08-26 16:10:58'),
(7, 3, 7, 0.00, 10000.00, NULL, NULL, 'purchase', '2026-08-27 00:00:26', '2026-08-26 17:00:26', '2026-08-26 17:00:26'),
(8, 3, 8, 10000.00, 10000.00, NULL, NULL, 'purchase', '2026-08-27 00:07:38', '2026-08-26 17:07:38', '2026-08-26 17:07:38'),
(9, 6, 9, 0.00, 2.50, NULL, NULL, 'purchase', '2026-09-01 07:10:21', '2026-09-01 00:10:21', '2026-09-01 00:10:21'),
(10, 6, 10, 2.50, 626.88, NULL, NULL, 'purchase', '2026-09-01 07:10:49', '2026-09-01 00:10:49', '2026-09-01 00:10:49'),
(11, 7, 11, 0.00, 9000.00, NULL, NULL, 'purchase', '2026-09-01 07:11:34', '2026-09-01 00:11:34', '2026-09-01 00:11:34'),
(12, 3, 12, 10000.00, 10000.00, 0.00, 20000.00, 'purchase', '2026-09-03 02:52:32', '2026-09-02 19:52:32', '2026-09-02 19:52:32'),
(13, 1, 13, 10000.00, 25000.00, 0.00, 30000.00, 'purchase', '2026-09-03 02:56:27', '2026-09-02 19:56:27', '2026-09-02 19:56:27');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint UNSIGNED NOT NULL,
  `supplier_id` bigint UNSIGNED NOT NULL,
  `purchase_date` date NOT NULL,
  `total_amount` decimal(14,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `supplier_id`, `purchase_date`, `total_amount`, `created_at`, `updated_at`) VALUES
(3, 1, '2026-08-24', 20000.00, '2026-08-23 23:34:46', '2026-08-23 23:34:46'),
(6, 1, '2026-08-26', 10000.00, '2026-08-26 16:10:58', '2026-08-26 16:10:58'),
(7, 1, '2026-08-27', 10000.00, '2026-08-26 17:00:26', '2026-08-26 17:00:26'),
(8, 1, '2026-08-27', 10000.00, '2026-08-26 17:07:38', '2026-08-26 17:07:38'),
(9, 1, '2026-09-01', 7.50, '2026-09-01 00:10:21', '2026-09-01 00:10:21'),
(10, 1, '2026-09-01', 2500.00, '2026-09-01 00:10:49', '2026-09-01 00:10:49'),
(11, 1, '2026-09-01', 27000.00, '2026-09-01 00:11:34', '2026-09-01 00:11:34'),
(12, 1, '2026-09-03', 50000.00, '2026-09-02 19:52:32', '2026-09-02 19:52:32'),
(13, 1, '2026-09-03', 75000.00, '2026-09-02 19:56:27', '2026-09-02 19:56:27');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

CREATE TABLE `purchase_items` (
  `id` bigint UNSIGNED NOT NULL,
  `purchase_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `qty` int NOT NULL,
  `purchase_price` decimal(14,2) NOT NULL,
  `subtotal` decimal(14,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `purchase_items`
--

INSERT INTO `purchase_items` (`id`, `purchase_id`, `product_id`, `qty`, `purchase_price`, `subtotal`, `created_at`, `updated_at`) VALUES
(3, 3, 2, 2, 10000.00, 20000.00, '2026-08-23 23:34:46', '2026-08-23 23:34:46'),
(6, 6, 1, 1, 10000.00, 10000.00, '2026-08-26 16:10:58', '2026-08-26 16:10:58'),
(7, 7, 3, 1, 10000.00, 10000.00, '2026-08-26 17:00:26', '2026-08-26 17:00:26'),
(8, 8, 3, 1, 10000.00, 10000.00, '2026-08-26 17:07:38', '2026-08-26 17:07:38'),
(9, 9, 6, 3, 2.50, 7.50, '2026-09-01 00:10:21', '2026-09-01 00:10:21'),
(10, 10, 6, 1, 2500.00, 2500.00, '2026-09-01 00:10:49', '2026-09-01 00:10:49'),
(11, 11, 7, 3, 9000.00, 27000.00, '2026-09-01 00:11:34', '2026-09-01 00:11:34'),
(12, 12, 3, 5, 10000.00, 50000.00, '2026-09-02 19:52:32', '2026-09-02 19:52:32'),
(13, 13, 1, 3, 25000.00, 75000.00, '2026-09-02 19:56:27', '2026-09-02 19:56:27');

-- --------------------------------------------------------

--
-- Table structure for table `receivables`
--

CREATE TABLE `receivables` (
  `id` bigint UNSIGNED NOT NULL,
  `sale_id` bigint UNSIGNED NOT NULL,
  `customer_name` varchar(150) NOT NULL,
  `amount` decimal(14,2) NOT NULL,
  `paid_amount` decimal(14,2) NOT NULL DEFAULT '0.00',
  `status` enum('belum_lunas','lunas_sebagian','lunas') NOT NULL DEFAULT 'belum_lunas',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `receivables`
--

INSERT INTO `receivables` (`id`, `sale_id`, `customer_name`, `amount`, `paid_amount`, `status`, `created_at`, `updated_at`) VALUES
(3, 7, 'Z', 15000.00, 15000.00, 'lunas', '2026-08-26 17:14:50', '2026-08-26 17:14:59'),
(4, 10, 'valen', 20000.00, 20000.00, 'lunas', '2026-09-01 00:20:07', '2026-09-01 00:20:26'),
(5, 11, 'valen', 20000.00, 20000.00, 'lunas', '2026-09-01 00:21:01', '2026-09-02 19:53:45'),
(6, 14, 'x', 20000.00, 15000.00, 'lunas_sebagian', '2026-09-02 19:54:41', '2026-09-02 19:55:11'),
(7, 15, 'x', 30000.00, 25000.00, 'lunas_sebagian', '2026-09-02 19:57:00', '2026-09-02 19:57:26');

-- --------------------------------------------------------

--
-- Table structure for table `receivable_payments`
--

CREATE TABLE `receivable_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `receivable_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(14,2) NOT NULL,
  `payment_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `receivable_payments`
--

INSERT INTO `receivable_payments` (`id`, `receivable_id`, `amount`, `payment_date`, `created_at`, `updated_at`) VALUES
(4, 3, 15000.00, '2026-08-27', '2026-08-26 17:14:58', '2026-08-26 17:14:58'),
(5, 4, 20000.00, '2026-09-01', '2026-09-01 00:20:26', '2026-09-01 00:20:26'),
(6, 5, 10000.00, '2026-09-01', '2026-09-01 00:21:13', '2026-09-01 00:21:13'),
(7, 5, 5000.00, '2026-09-03', '2026-09-02 19:53:44', '2026-09-02 19:53:44'),
(8, 5, 5000.00, '2026-09-03', '2026-09-02 19:53:45', '2026-09-02 19:53:45'),
(9, 6, 10000.00, '2026-09-03', '2026-09-02 19:54:57', '2026-09-02 19:54:57'),
(10, 6, 5000.00, '2026-09-03', '2026-09-02 19:55:11', '2026-09-02 19:55:11'),
(11, 7, 25000.00, '2026-09-03', '2026-09-02 19:57:26', '2026-09-02 19:57:26');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint UNSIGNED NOT NULL,
  `sale_date` date NOT NULL,
  `total_amount` decimal(14,2) NOT NULL DEFAULT '0.00',
  `total_profit` decimal(14,2) NOT NULL DEFAULT '0.00',
  `payment_status` enum('lunas','piutang') NOT NULL DEFAULT 'lunas',
  `customer_name` varchar(150) DEFAULT NULL,
  `is_voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `sale_date`, `total_amount`, `total_profit`, `payment_status`, `customer_name`, `is_voided`, `voided_at`, `created_at`, `updated_at`) VALUES
(3, '2026-08-24', 15000.00, 5000.00, 'lunas', NULL, 0, NULL, '2026-08-24 00:20:50', '2026-08-24 00:20:50'),
(4, '2026-08-27', 15000.00, 5000.00, 'lunas', NULL, 0, NULL, '2026-08-26 17:00:49', '2026-08-26 17:00:49'),
(5, '2026-08-27', 5000.00, -5000.00, 'lunas', NULL, 0, NULL, '2026-08-26 17:08:06', '2026-08-26 17:08:06'),
(7, '2026-08-27', 15000.00, 5000.00, 'lunas', 'Z', 0, NULL, '2026-08-26 17:14:50', '2026-08-26 17:14:59'),
(8, '2026-09-01', 16000.00, -2000.00, 'lunas', NULL, 1, '2026-09-01 00:15:58', '2026-09-01 00:15:09', '2026-09-01 00:15:58'),
(9, '2026-09-01', 240000.00, 238119.36, 'lunas', NULL, 0, NULL, '2026-09-01 00:16:41', '2026-09-01 00:16:41'),
(10, '2026-09-01', 20000.00, 11000.00, 'lunas', 'valen', 0, NULL, '2026-09-01 00:20:07', '2026-09-01 00:20:26'),
(11, '2026-09-01', 20000.00, 11000.00, 'lunas', 'valen', 0, NULL, '2026-09-01 00:21:01', '2026-09-02 19:53:45'),
(12, '2026-09-03', 60000.00, 30000.00, 'lunas', 'V', 0, NULL, '2026-09-02 19:53:05', '2026-09-02 19:53:05'),
(13, '2026-09-03', 20000.00, 10000.00, 'lunas', NULL, 0, NULL, '2026-09-02 19:54:15', '2026-09-02 19:54:16'),
(14, '2026-09-03', 20000.00, 10000.00, 'piutang', 'x', 0, NULL, '2026-09-02 19:54:41', '2026-09-02 19:54:41'),
(15, '2026-09-03', 30000.00, 5000.00, 'piutang', 'x', 0, NULL, '2026-09-02 19:57:00', '2026-09-02 19:57:00');

-- --------------------------------------------------------

--
-- Table structure for table `sale_items`
--

CREATE TABLE `sale_items` (
  `id` bigint UNSIGNED NOT NULL,
  `sale_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `qty` int NOT NULL,
  `selling_price` decimal(14,2) NOT NULL,
  `cost_price_snapshot` decimal(14,2) NOT NULL,
  `profit` decimal(14,2) NOT NULL,
  `subtotal` decimal(14,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sale_items`
--

INSERT INTO `sale_items` (`id`, `sale_id`, `product_id`, `qty`, `selling_price`, `cost_price_snapshot`, `profit`, `subtotal`, `created_at`, `updated_at`) VALUES
(3, 3, 2, 1, 15000.00, 10000.00, 5000.00, 15000.00, '2026-08-24 00:20:50', '2026-08-24 00:20:50'),
(4, 4, 3, 1, 15000.00, 10000.00, 5000.00, 15000.00, '2026-08-26 17:00:49', '2026-08-26 17:00:49'),
(5, 5, 1, 1, 5000.00, 10000.00, -5000.00, 5000.00, '2026-08-26 17:08:06', '2026-08-26 17:08:06'),
(7, 7, 3, 1, 15000.00, 10000.00, 5000.00, 15000.00, '2026-08-26 17:14:50', '2026-08-26 17:14:50'),
(8, 8, 7, 2, 8000.00, 9000.00, -2000.00, 16000.00, '2026-09-01 00:15:09', '2026-09-01 00:15:09'),
(9, 9, 6, 3, 80000.00, 626.88, 238119.36, 240000.00, '2026-09-01 00:16:41', '2026-09-01 00:16:41'),
(10, 10, 7, 1, 20000.00, 9000.00, 11000.00, 20000.00, '2026-09-01 00:20:07', '2026-09-01 00:20:07'),
(11, 11, 7, 1, 20000.00, 9000.00, 11000.00, 20000.00, '2026-09-01 00:21:01', '2026-09-01 00:21:01'),
(12, 12, 3, 3, 20000.00, 10000.00, 30000.00, 60000.00, '2026-09-02 19:53:05', '2026-09-02 19:53:05'),
(13, 13, 3, 1, 20000.00, 10000.00, 10000.00, 20000.00, '2026-09-02 19:54:16', '2026-09-02 19:54:16'),
(14, 14, 3, 1, 20000.00, 10000.00, 10000.00, 20000.00, '2026-09-02 19:54:41', '2026-09-02 19:54:41'),
(15, 15, 1, 1, 30000.00, 25000.00, 5000.00, 30000.00, '2026-09-02 19:57:00', '2026-09-02 19:57:00');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `payload` longtext NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('A6wV7eWvEsAGQJxdcrcssP2YhQwWX3MuHSf8irht', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZnBaMWFteG0wZjJZYkkwdXdPVnlFcmhsMnh4b2trdFgyWUlnamxiNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czo5OiJkYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1788404318);

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments`
--

CREATE TABLE `stock_adjustments` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `type` enum('tambah','kurang') NOT NULL,
  `qty` int NOT NULL,
  `reason` enum('rusak','hilang','koreksi_opname','lainnya') NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `adjustment_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `stock_adjustments`
--

INSERT INTO `stock_adjustments` (`id`, `product_id`, `type`, `qty`, `reason`, `note`, `adjustment_date`, `created_at`, `updated_at`) VALUES
(2, 2, 'kurang', 1, 'rusak', 'Bau', '2026-08-27', '2026-08-26 17:15:57', '2026-08-26 17:15:57'),
(3, 7, 'kurang', 1, 'rusak', NULL, '2026-09-03', '2026-09-02 19:58:01', '2026-09-02 19:58:01'),
(4, 6, 'kurang', 1, 'hilang', NULL, '2026-09-03', '2026-09-02 19:58:20', '2026-09-02 19:58:20');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `phone`, `address`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Dzakik', '09909', 'Sukun', 1, '2026-08-09 23:36:01', '2026-08-23 23:34:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_products_category` (`category_id`),
  ADD KEY `idx_products_last_sold` (`last_sold_at`),
  ADD KEY `idx_products_expired` (`expired_date`),
  ADD KEY `idx_products_active` (`is_active`);

--
-- Indexes for table `product_price_histories`
--
ALTER TABLE `product_price_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_price_histories_product` (`product_id`),
  ADD KEY `fk_price_histories_purchase` (`purchase_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_purchases_date` (`purchase_date`),
  ADD KEY `idx_purchases_supplier` (`supplier_id`);

--
-- Indexes for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_purchase_items_purchase` (`purchase_id`),
  ADD KEY `idx_purchase_items_product` (`product_id`);

--
-- Indexes for table `receivables`
--
ALTER TABLE `receivables`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_receivables_sale` (`sale_id`),
  ADD KEY `idx_receivables_status` (`status`);

--
-- Indexes for table `receivable_payments`
--
ALTER TABLE `receivable_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_receivable_payments_receivable` (`receivable_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sales_date` (`sale_date`),
  ADD KEY `idx_sales_status` (`payment_status`);

--
-- Indexes for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sale_items_sale` (`sale_id`),
  ADD KEY `idx_sale_items_product` (`product_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `stock_adjustments`
--
ALTER TABLE `stock_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_stock_adjustments_product` (`product_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_price_histories`
--
ALTER TABLE `product_price_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `purchase_items`
--
ALTER TABLE `purchase_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `receivables`
--
ALTER TABLE `receivables`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `receivable_payments`
--
ALTER TABLE `receivable_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `stock_adjustments`
--
ALTER TABLE `stock_adjustments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT;

--
-- Constraints for table `product_price_histories`
--
ALTER TABLE `product_price_histories`
  ADD CONSTRAINT `fk_price_histories_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_price_histories_purchase` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `fk_purchases_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE RESTRICT;

--
-- Constraints for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD CONSTRAINT `fk_purchase_items_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `fk_purchase_items_purchase` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `receivables`
--
ALTER TABLE `receivables`
  ADD CONSTRAINT `fk_receivables_sale` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `receivable_payments`
--
ALTER TABLE `receivable_payments`
  ADD CONSTRAINT `fk_receivable_payments_receivable` FOREIGN KEY (`receivable_id`) REFERENCES `receivables` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD CONSTRAINT `fk_sale_items_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `fk_sale_items_sale` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_adjustments`
--
ALTER TABLE `stock_adjustments`
  ADD CONSTRAINT `fk_stock_adjustments_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
