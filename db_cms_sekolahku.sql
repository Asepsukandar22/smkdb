-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Mar 2024 pada 11.26
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_cms_sekolahku`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `academic_years`
--

CREATE TABLE `academic_years` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year` varchar(9) NOT NULL COMMENT 'Tahun Pelajaran',
  `semester` enum('odd','even') NOT NULL DEFAULT 'odd' COMMENT 'odd = Ganjil, even = Genap',
  `current_semester` enum('true','false') NOT NULL DEFAULT 'false',
  `admission_semester` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `academic_years`
--

INSERT INTO `academic_years` (`id`, `academic_year`, `semester`, `current_semester`, `admission_semester`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, '2024-2025', 'odd', 'false', 'false', '2024-03-28 16:53:53', '2024-03-28 09:53:59', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `achievements`
--

CREATE TABLE `achievements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) DEFAULT 0,
  `achievement_description` varchar(255) NOT NULL,
  `achievement_type` bigint(20) DEFAULT 0,
  `achievement_level` smallint(6) NOT NULL DEFAULT 0,
  `achievement_year` year(4) NOT NULL,
  `achievement_organizer` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `admission_phases`
--

CREATE TABLE `admission_phases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year_id` bigint(20) DEFAULT 0 COMMENT 'Tahun Pelajaran',
  `phase_name` varchar(255) NOT NULL COMMENT 'Gelombang Pendaftaran',
  `phase_start_date` date DEFAULT NULL COMMENT 'Tanggal Mulai',
  `phase_end_date` date DEFAULT NULL COMMENT 'Tanggal Selesai',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `admission_quotas`
--

CREATE TABLE `admission_quotas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year_id` bigint(20) DEFAULT 0 COMMENT 'Tahun Pelajaran',
  `admission_type_id` bigint(20) DEFAULT 0 COMMENT 'Jalur Pendaftaran',
  `major_id` bigint(20) DEFAULT 0 COMMENT 'Program Keahlian',
  `quota` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Kuota Pendaftaran',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `albums`
--

CREATE TABLE `albums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `album_title` varchar(255) NOT NULL,
  `album_description` varchar(255) DEFAULT NULL,
  `album_slug` varchar(255) DEFAULT NULL,
  `album_cover` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `answers`
--

CREATE TABLE `answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) DEFAULT 0,
  `answer` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_slug` varchar(255) DEFAULT NULL,
  `category_description` varchar(255) DEFAULT NULL,
  `category_type` enum('post','file') DEFAULT 'post',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_slug`, `category_description`, `category_type`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Uncategorized', 'uncategorized', 'Uncategorized', 'post', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'Uncategorized', 'uncategorized', 'Uncategorized', 'file', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `class_groups`
--

CREATE TABLE `class_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_group` varchar(100) DEFAULT NULL,
  `sub_class_group` varchar(100) DEFAULT NULL,
  `major_id` bigint(20) DEFAULT 0 COMMENT 'Program Keahlian',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `class_groups`
--

INSERT INTO `class_groups` (`id`, `class_group`, `sub_class_group`, `major_id`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'XII', 'RPL', 1, '2024-03-28 16:52:41', '2024-03-28 09:52:41', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, 'XII', 'AKL', 2, '2024-03-28 16:52:50', '2024-03-28 09:52:50', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, 'XII', 'TBSM', 3, '2024-03-28 16:53:01', '2024-03-28 09:53:01', NULL, NULL, 1, 0, 0, 0, 'false'),
(4, 'XII', 'ACP', 1, '2024-03-28 16:53:09', '2024-03-28 09:53:09', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `class_group_settings`
--

CREATE TABLE `class_group_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year_id` bigint(20) DEFAULT 0 COMMENT 'FK dari academic_years',
  `class_group_id` bigint(20) DEFAULT 0 COMMENT 'Kelas, FK dari class_groups',
  `employee_id` bigint(20) DEFAULT 0 COMMENT 'Wali Kelas, FK dari employees',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `class_group_settings`
--

INSERT INTO `class_group_settings` (`id`, `academic_year_id`, `class_group_id`, `employee_id`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 1, 1, 2, '2024-03-28 16:54:42', '2024-03-28 09:54:42', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, 1, 2, 1, '2024-03-28 16:54:58', '2024-03-28 09:54:58', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, 1, 3, 3, '2024-03-28 16:55:05', '2024-03-28 09:55:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(4, 1, 4, 4, '2024-03-28 16:55:10', '2024-03-28 09:55:10', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `class_group_students`
--

CREATE TABLE `class_group_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_group_setting_id` bigint(20) DEFAULT 0,
  `student_id` bigint(20) DEFAULT 0,
  `is_class_manager` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Ketua Kelas ?',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `class_group_students`
--

INSERT INTO `class_group_students` (`id`, `class_group_setting_id`, `student_id`, `is_class_manager`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 2, 1, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, 2, 2, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, 2, 3, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(4, 2, 4, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(5, 2, 5, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(6, 2, 6, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(7, 2, 7, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(8, 2, 8, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(9, 2, 9, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(10, 2, 10, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(11, 2, 11, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(12, 2, 12, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(13, 2, 13, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(14, 2, 14, 'true', '2024-03-28 16:56:13', '2024-03-28 09:57:44', NULL, NULL, 1, 1, 0, 0, 'false'),
(15, 2, 15, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(16, 2, 16, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(17, 2, 17, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(18, 2, 18, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(19, 2, 19, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(20, 2, 20, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(21, 2, 21, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(22, 2, 22, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(23, 2, 23, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(24, 2, 24, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(25, 2, 25, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(26, 2, 26, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(27, 2, 27, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(28, 2, 28, 'false', '2024-03-28 16:56:13', '2024-03-28 09:56:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(29, 1, 29, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(30, 1, 30, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(31, 1, 31, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(32, 1, 32, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(33, 1, 33, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(34, 1, 34, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(35, 1, 35, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(36, 1, 36, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(37, 1, 37, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(38, 1, 38, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(39, 1, 39, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(40, 1, 40, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(41, 1, 41, 'true', '2024-03-28 16:56:48', '2024-03-28 09:57:28', NULL, NULL, 1, 1, 0, 0, 'false'),
(42, 1, 42, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(43, 1, 43, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(44, 1, 44, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(45, 1, 45, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(46, 1, 46, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(47, 1, 47, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(48, 1, 48, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(49, 1, 49, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(50, 1, 50, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(51, 1, 51, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(52, 1, 52, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(53, 1, 53, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(54, 1, 54, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(55, 1, 55, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(56, 1, 56, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(57, 1, 57, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(58, 1, 58, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(59, 1, 59, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(60, 1, 60, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(61, 1, 61, 'false', '2024-03-28 16:56:48', '2024-03-28 09:56:48', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_post_id` bigint(20) DEFAULT 0,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) DEFAULT NULL,
  `comment_url` varchar(255) DEFAULT NULL,
  `comment_ip_address` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_subject` varchar(255) DEFAULT NULL,
  `comment_reply` text DEFAULT NULL,
  `comment_status` enum('approved','unapproved','spam') DEFAULT 'approved',
  `comment_agent` varchar(255) DEFAULT NULL,
  `comment_parent_id` varchar(255) DEFAULT NULL,
  `comment_type` enum('post','message') DEFAULT 'post',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assignment_letter_number` varchar(255) DEFAULT NULL COMMENT 'Nomor Surat Tugas',
  `assignment_letter_date` date DEFAULT NULL COMMENT 'Tanggal Surat Tugas',
  `assignment_start_date` date DEFAULT NULL COMMENT 'TMT Tugas',
  `parent_school_status` enum('true','false') NOT NULL DEFAULT 'true' COMMENT 'Status Sekolah Induk',
  `full_name` varchar(150) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `nik` varchar(50) DEFAULT NULL,
  `birth_place` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `mother_name` varchar(150) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rt` varchar(10) DEFAULT NULL COMMENT 'Rukun Tetangga',
  `rw` varchar(10) DEFAULT NULL COMMENT 'Rukun Warga',
  `sub_village` varchar(255) DEFAULT NULL COMMENT 'Nama Dusun',
  `village` varchar(255) DEFAULT NULL COMMENT 'Nama Kelurahan/Desa',
  `sub_district` varchar(255) DEFAULT NULL COMMENT 'Kecamatan',
  `district` varchar(255) DEFAULT NULL COMMENT 'Kota/Kabupaten',
  `postal_code` varchar(20) DEFAULT NULL COMMENT 'Kode POS',
  `religion_id` bigint(20) DEFAULT 0,
  `marriage_status_id` bigint(20) DEFAULT 0,
  `spouse_name` varchar(255) DEFAULT NULL COMMENT 'Nama Pasangan : Suami / Istri',
  `spouse_employment_id` bigint(20) DEFAULT 0 COMMENT 'Pekerjaan Pasangan : Suami / Istri',
  `citizenship` enum('WNI','WNA') NOT NULL DEFAULT 'WNI' COMMENT 'Kewarganegaraan',
  `country` varchar(255) DEFAULT NULL,
  `npwp` varchar(100) DEFAULT NULL,
  `employment_status_id` bigint(20) DEFAULT 0 COMMENT 'Status Kepegawaian',
  `nip` varchar(100) DEFAULT NULL,
  `niy` varchar(100) DEFAULT NULL COMMENT 'NIY/NIGK',
  `nuptk` varchar(100) DEFAULT NULL,
  `employment_type_id` bigint(20) DEFAULT 0 COMMENT 'Jenis Guru dan Tenaga Kependidikan (GTK)',
  `decree_appointment` varchar(255) DEFAULT NULL COMMENT 'SK Pengangkatan',
  `appointment_start_date` date DEFAULT NULL COMMENT 'TMT Pengangkatan',
  `institution_lifter_id` bigint(20) DEFAULT 0 COMMENT 'Lembaga Pengangkat',
  `decree_cpns` varchar(100) DEFAULT NULL COMMENT 'SK CPNS',
  `pns_start_date` date DEFAULT NULL COMMENT 'TMT CPNS',
  `rank_id` bigint(20) DEFAULT 0 COMMENT 'Pangkat/Golongan',
  `salary_source_id` bigint(20) DEFAULT 0 COMMENT 'Sumber Gaji',
  `headmaster_license` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Punya Lisensi Kepala Sekolah?',
  `laboratory_skill_id` bigint(20) DEFAULT 0 COMMENT 'Keahlian Lab oratorium',
  `special_need_id` bigint(20) DEFAULT 0 COMMENT 'Mampu Menangani Kebutuhan Khusus',
  `braille_skills` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Keahlian Braile ?',
  `sign_language_skills` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Keahlian Bahasa Isyarat ?',
  `phone` varchar(255) DEFAULT NULL,
  `mobile_phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `employees`
--

INSERT INTO `employees` (`id`, `assignment_letter_number`, `assignment_letter_date`, `assignment_start_date`, `parent_school_status`, `full_name`, `gender`, `nik`, `birth_place`, `birth_date`, `mother_name`, `street_address`, `rt`, `rw`, `sub_village`, `village`, `sub_district`, `district`, `postal_code`, `religion_id`, `marriage_status_id`, `spouse_name`, `spouse_employment_id`, `citizenship`, `country`, `npwp`, `employment_status_id`, `nip`, `niy`, `nuptk`, `employment_type_id`, `decree_appointment`, `appointment_start_date`, `institution_lifter_id`, `decree_cpns`, `pns_start_date`, `rank_id`, `salary_source_id`, `headmaster_license`, `laboratory_skill_id`, `special_need_id`, `braille_skills`, `sign_language_skills`, `phone`, `mobile_phone`, `email`, `photo`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, NULL, NULL, NULL, 'true', 'MAULY NURKHALIMA, S.Ak', 'F', '12345', 'SUKABUMI', '2024-03-27', NULL, 'CIMAJA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 'WNI', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 'false', 0, 0, 'false', 'false', NULL, NULL, '12345@smkdb.sch.id', NULL, '2024-03-28 16:50:21', '2024-03-28 09:50:21', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, NULL, NULL, NULL, 'true', 'KHUDAENI MUPLIHAN,. M.Pd', 'M', '12346', 'SUKABUMI', '2024-03-27', NULL, 'CIMAJA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 'WNI', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 'false', 0, 0, 'false', 'false', NULL, NULL, '12346@smkdb.sch.id', NULL, '2024-03-28 16:50:22', '2024-03-28 09:50:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, NULL, NULL, NULL, 'true', 'UJANG DERI, S.Pd.I', 'M', '12347', 'SUKABUMI', '2024-03-28', NULL, 'CIMAJA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 'WNI', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 'false', 0, 0, 'false', 'false', NULL, NULL, '12347@smkdb.sch.id', NULL, '2024-03-28 16:50:22', '2024-03-28 09:50:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(4, NULL, NULL, NULL, 'true', 'MARYAM JAMILAH, M.Pd', 'F', '12348', 'SUKABUMI', '2024-03-29', NULL, 'CIMAJA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 'WNI', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 'false', 0, 0, 'false', 'false', NULL, NULL, '12348@smkdb.sch.id', NULL, '2024-03-28 16:50:22', '2024-03-28 09:50:22', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `files`
--

CREATE TABLE `files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_title` varchar(255) DEFAULT NULL,
  `file_description` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_category_id` bigint(20) DEFAULT 0,
  `file_path` varchar(255) DEFAULT NULL,
  `file_ext` varchar(255) DEFAULT NULL,
  `file_size` varchar(255) DEFAULT NULL,
  `file_visibility` enum('public','private') DEFAULT 'public',
  `file_counter` bigint(20) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `image_sliders`
--

CREATE TABLE `image_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caption` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `image_sliders`
--

INSERT INTO `image_sliders` (`id`, `caption`, `image`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', '1.png', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', '2.png', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `links`
--

CREATE TABLE `links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link_title` varchar(255) NOT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `link_target` enum('_blank','_self','_parent','_top') DEFAULT '_blank',
  `link_image` varchar(100) DEFAULT NULL,
  `link_type` enum('link','banner') DEFAULT 'link',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `links`
--

INSERT INTO `links` (`id`, `link_title`, `link_url`, `link_target`, `link_image`, `link_type`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'WA. Sekolah', 'https://wa.me/6289507057277?text=Selamat Datang , Disekolah Kami ', '_blank', NULL, 'link', '2023-01-15 21:23:22', '2024-03-28 09:46:48', NULL, NULL, 0, 1, 0, 0, 'false'),
(2, 'CMS Sekolahku', 'https://sekolahku.web.id', '_blank', '1.png', 'banner', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `counter` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `datetime` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `majors`
--

CREATE TABLE `majors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `major_name` varchar(255) DEFAULT NULL COMMENT 'Program Keahlian / Jurusan',
  `major_short_name` varchar(255) DEFAULT NULL COMMENT 'Nama Singkat',
  `is_active` enum('true','false') DEFAULT 'true',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `majors`
--

INSERT INTO `majors` (`id`, `major_name`, `major_short_name`, `is_active`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Rekayasa Perangkat Lunak', 'RPL', 'true', '2024-03-28 16:51:34', '2024-03-28 09:51:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, 'Akuntansi dan Keuangan Lembaga', 'AKL', 'true', '2024-03-28 16:51:58', '2024-03-28 09:51:58', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, 'Teknik dan Bisnis Sepeda Motor', 'TBSM', 'true', '2024-03-28 16:52:20', '2024-03-28 09:52:20', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_title` varchar(150) NOT NULL,
  `menu_url` varchar(150) NOT NULL,
  `menu_target` enum('_blank','_self','_parent','_top') DEFAULT '_self',
  `menu_type` varchar(100) NOT NULL DEFAULT 'pages',
  `menu_parent_id` bigint(20) DEFAULT 0,
  `menu_position` bigint(20) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `menu_title`, `menu_url`, `menu_target`, `menu_type`, `menu_parent_id`, `menu_position`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Hubungi Kami', 'hubungi-kami', '_self', 'modules', 0, 7, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'Galeri Foto', 'galeri-foto', '_self', 'modules', 9, 1, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Galeri Video', 'galeri-video', '_self', 'modules', 9, 2, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'Formulir PPDB', 'formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 1, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'Hasil Seleksi', 'hasil-seleksi-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 2, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'Cetak Formulir', 'cetak-formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 3, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'Download Formulir', 'download-formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 4, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'PPDB 2022', '#', '_self', 'links', 0, 5, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'Galeri', '#', '_self', 'links', 0, 6, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'Kategori', '#', '_self', 'links', 0, 2, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(11, 'Uncategorized', 'kategori/uncategorized', '_self', 'post_categories', 10, 1, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(12, 'Direktori', '#', '_self', 'links', 0, 3, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(13, 'Direktori Alumni', 'direktori-alumni', '_self', 'modules', 12, 1, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(14, 'Direktori Peserta Didik', 'direktori-peserta-didik', '_self', 'modules', 12, 3, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(15, 'Direktori Guru dan Tenaga Kependidikan', 'direktori-guru-dan-tenaga-kependidikan', '_self', 'modules', 12, 2, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(16, 'Pendaftaran Alumni', 'pendaftaran-alumni', '_self', 'modules', 0, 4, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(21, 'Tentang', '#', '_self', 'links', 0, 1, '2024-03-28 16:36:12', '2024-03-28 09:36:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(22, 'Profil', 'read/2/profil', '_self', 'pages', 21, 1, '2024-03-28 16:36:25', '2024-03-28 09:36:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(23, 'Visi dan Misi', 'read/3/visi-dan-misi', '_self', 'pages', 21, 2, '2024-03-28 16:36:25', '2024-03-28 09:36:33', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `module_description` varchar(255) DEFAULT NULL,
  `module_url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `module_description`, `module_url`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Pengguna', 'Pengguna', 'users', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'PPDB / PMB', 'PPDB / PMB', 'admission', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Tampilan', 'Tampilan', 'appearance', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'Blog', 'Blog', 'blog', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'GTK / Staff / Dosen', 'GTK / Staff / Dosen', 'employees', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'Media', 'Media', 'media', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'Plugins', 'Plugins', 'plugins', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'Data Referensi', 'Data Referensi', 'reference', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'Pengaturan', 'Pengaturan', 'settings', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'Akademik', 'Akademik', 'academic', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `option_group` varchar(100) NOT NULL,
  `option_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `options`
--

INSERT INTO `options` (`id`, `option_group`, `option_name`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'student_status', 'Aktif', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'student_status', 'Lulus', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'student_status', 'Mutasi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'student_status', 'Dikeluarkan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'student_status', 'Mengundurkan Diri', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'student_status', 'Putus Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'student_status', 'Meninggal', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'student_status', 'Hilang', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'student_status', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'employments', 'Tidak bekerja', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(11, 'employments', 'Nelayan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(12, 'employments', 'Petani', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(13, 'employments', 'Peternak', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(14, 'employments', 'PNS/TNI/POLRI', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(15, 'employments', 'Karyawan Swasta', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(16, 'employments', 'Pedagang Kecil', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(17, 'employments', 'Pedagang Besar', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(18, 'employments', 'Wiraswasta', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(19, 'employments', 'Wirausaha', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(20, 'employments', 'Buruh', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(21, 'employments', 'Pensiunan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(22, 'employments', 'Lain-lain', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(23, 'special_needs', 'Tidak', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(24, 'special_needs', 'Tuna Netra', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(25, 'special_needs', 'Tuna Rungu', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(26, 'special_needs', 'Tuna Grahita ringan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(27, 'special_needs', 'Tuna Grahita Sedang', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(28, 'special_needs', 'Tuna Daksa Ringan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(29, 'special_needs', 'Tuna Daksa Sedang', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(30, 'special_needs', 'Tuna Laras', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(31, 'special_needs', 'Tuna Wicara', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(32, 'special_needs', 'Tuna ganda', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(33, 'special_needs', 'Hiper aktif', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(34, 'special_needs', 'Cerdas Istimewa', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(35, 'special_needs', 'Bakat Istimewa', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(36, 'special_needs', 'Kesulitan Belajar', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(37, 'special_needs', 'Narkoba', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(38, 'special_needs', 'Indigo', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(39, 'special_needs', 'Down Sindrome', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(40, 'special_needs', 'Autis', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(41, 'special_needs', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(42, 'educations', 'Tidak sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(43, 'educations', 'Putus SD', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(44, 'educations', 'SD Sederajat', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(45, 'educations', 'SMP Sederajat', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(46, 'educations', 'SMA Sederajat', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(47, 'educations', 'D1', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(48, 'educations', 'D2', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(49, 'educations', 'D3', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(50, 'educations', 'D4/S1', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(51, 'educations', 'S2', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(52, 'educations', 'S3', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(53, 'scholarships', 'Anak berprestasi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(54, 'scholarships', 'Anak Miskin', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(55, 'scholarships', 'Pendidikan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(56, 'scholarships', 'Unggulan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(57, 'scholarships', 'Lain-lain', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(58, 'achievement_types', 'Sains', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(59, 'achievement_types', 'Seni', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(60, 'achievement_types', 'Olahraga', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(61, 'achievement_types', 'Lain-lain', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(62, 'achievement_levels', 'Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(63, 'achievement_levels', 'Kecamatan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(64, 'achievement_levels', 'Kota/Kabupaten', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(65, 'achievement_levels', 'Propinsi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(66, 'achievement_levels', 'Nasional', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(67, 'achievement_levels', 'Internasional', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(68, 'monthly_incomes', 'Kurang dari 500,000', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(69, 'monthly_incomes', '500.000 - 999.9999', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(70, 'monthly_incomes', '1 Juta - 1.999.999', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(71, 'monthly_incomes', '2 Juta - 4.999.999', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(72, 'monthly_incomes', '5 Juta - 20 Juta', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(73, 'monthly_incomes', 'Lebih dari 20 Juta', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(74, 'residences', 'Bersama orang tua', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(75, 'residences', 'Wali', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(76, 'residences', 'Kos', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(77, 'residences', 'Asrama', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(78, 'residences', 'Panti Asuhan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(79, 'residences', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(80, 'transportations', 'Jalan kaki', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(81, 'transportations', 'Kendaraan pribadi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(82, 'transportations', 'Kendaraan Umum / angkot / Pete-pete', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(83, 'transportations', 'Jemputan Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(84, 'transportations', 'Kereta Api', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(85, 'transportations', 'Ojek', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(86, 'transportations', 'Andong / Bendi / Sado / Dokar / Delman / Beca', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(87, 'transportations', 'Perahu penyebrangan / Rakit / Getek', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(88, 'transportations', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(89, 'religions', 'Islam', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(90, 'religions', 'Kristen / protestan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(91, 'religions', 'Katholik', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(92, 'religions', 'Hindu', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(93, 'religions', 'Budha', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(94, 'religions', 'Khong Hu Chu', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(95, 'religions', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(96, 'school_levels', '1 - Sekolah Dasar (SD) / Sederajat', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(97, 'school_levels', '2 - Sekolah Menengah Pertama (SMP) / Sederajat', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(98, 'school_levels', '3 - Sekolah Menengah Atas (SMA) / Aliyah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(99, 'school_levels', '4 - Sekolah Menengah Kejuruan (SMK)', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(100, 'school_levels', '5 - Universitas', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(101, 'school_levels', '6 - Sekolah Tinggi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(102, 'school_levels', '7 - Politeknik', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(103, 'marriage_status', 'Kawin', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(104, 'marriage_status', 'Belum Kawin', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(105, 'marriage_status', 'Berpisah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(106, 'institution_lifters', 'Pemerintah Pusat', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(107, 'institution_lifters', 'Pemerintah Provinsi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(108, 'institution_lifters', 'Pemerintah Kab/Kota', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(109, 'institution_lifters', 'Ketua yayasan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(110, 'institution_lifters', 'Kepala Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(111, 'institution_lifters', 'Komite Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(112, 'institution_lifters', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(113, 'employment_status', 'PNS ', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(114, 'employment_status', 'PNS Diperbantukan ', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(115, 'employment_status', 'PNS DEPAG ', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(116, 'employment_status', 'GTY/PTY ', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(117, 'employment_status', 'GTT/PTT Provinsi ', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(118, 'employment_status', 'GTT/PTT Kota/Kabupaten', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(119, 'employment_status', 'Guru Bantu Pusat ', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(120, 'employment_status', 'Guru Honor Sekolah ', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(121, 'employment_status', 'Tenaga Honor Sekolah ', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(122, 'employment_status', 'CPNS', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(123, 'employment_status', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(124, 'employment_types', 'Guru Kelas', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(125, 'employment_types', 'Guru Mata Pelajaran', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(126, 'employment_types', 'Guru BK', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(127, 'employment_types', 'Guru Inklusi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(128, 'employment_types', 'Tenaga Administrasi Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(129, 'employment_types', 'Guru Pendamping', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(130, 'employment_types', 'Guru Magang', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(131, 'employment_types', 'Guru TIK', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(132, 'employment_types', 'Laboran', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(133, 'employment_types', 'Pustakawan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(134, 'employment_types', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(135, 'ranks', 'I/A', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(136, 'ranks', 'I/B', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(137, 'ranks', 'I/C', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(138, 'ranks', 'I/D', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(139, 'ranks', 'II/A', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(140, 'ranks', 'II/B', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(141, 'ranks', 'II/C', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(142, 'ranks', 'II/D', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(143, 'ranks', 'III/A', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(144, 'ranks', 'III/B', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(145, 'ranks', 'III/C', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(146, 'ranks', 'III/D', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(147, 'ranks', 'IV/A', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(148, 'ranks', 'IV/B', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(149, 'ranks', 'IV/C', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(150, 'ranks', 'IV/D', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(151, 'ranks', 'IV/E', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(152, 'salary_sources', 'APBN', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(153, 'salary_sources', 'APBD Provinsi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(154, 'salary_sources', 'APBD Kab/Kota', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(155, 'salary_sources', 'Yayasan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(156, 'salary_sources', 'Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(157, 'salary_sources', 'Lembaga Donor', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(158, 'salary_sources', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(159, 'laboratory_skills', 'Lab IPA', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(160, 'laboratory_skills', 'Lab Fisika', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(161, 'laboratory_skills', 'Lab Biologi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(162, 'laboratory_skills', 'Lab Kimia', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(163, 'laboratory_skills', 'Lab Bahasa', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(164, 'laboratory_skills', 'Lab Komputer', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(165, 'laboratory_skills', 'Teknik Bangunan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(166, 'laboratory_skills', 'Teknik Survei & Pemetaan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(167, 'laboratory_skills', 'Teknik Ketenagakerjaan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(168, 'laboratory_skills', 'Teknik Pendinginan & Tata Udara', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(169, 'laboratory_skills', 'Teknik Mesin', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `photos`
--

CREATE TABLE `photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo_album_id` bigint(20) DEFAULT 0,
  `photo_name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pollings`
--

CREATE TABLE `pollings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `answer_id` bigint(20) DEFAULT 0,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_title` varchar(255) DEFAULT NULL,
  `post_content` longtext DEFAULT NULL,
  `post_image` varchar(100) DEFAULT NULL,
  `post_author` bigint(20) DEFAULT 0,
  `post_categories` varchar(255) DEFAULT NULL,
  `post_type` varchar(50) NOT NULL DEFAULT 'post',
  `post_status` enum('publish','draft') DEFAULT 'draft',
  `post_visibility` enum('public','private') DEFAULT 'public',
  `post_comment_status` enum('open','close') DEFAULT 'close',
  `post_slug` varchar(255) DEFAULT NULL,
  `post_tags` varchar(255) DEFAULT NULL,
  `post_counter` bigint(20) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `posts`
--

INSERT INTO `posts` (`id`, `post_title`, `post_content`, `post_image`, `post_author`, `post_categories`, `post_type`, `post_status`, `post_visibility`, `post_comment_status`, `post_slug`, `post_tags`, `post_counter`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'headmaster_photo.png', 0, '', 'opening_speech', 'publish', 'public', 'open', '', '', 0, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'Profil', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', NULL, 1, '+1+', 'page', 'publish', 'public', 'open', 'profil', 'berita, pengumuman, sekilas-info', 13, '2023-01-15 21:23:22', '2024-03-28 09:37:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Visi dan Misi', '<p><em><strong><span class=\"OYPEnA text-decoration-none text-strikethrough-none\">&ldquo; Terselenggaranya sekolah yang memenuhi tuntutan dunia usaha dan dunia industri berdaya saing internasional &rdquo;</span></strong></em></p>\n<p>&nbsp;</p>\n<ul>\n<li><span class=\"OYPEnA text-decoration-none text-strikethrough-none\">Menyiapkan lulusan yang berkarakter, dan produktif dalam bidangnya.</span></li>\n<li><span class=\"OYPEnA text-decoration-none text-strikethrough-none\">Menumbuhkan budaya mutu bagi semua warga sekolah.</span></li>\n<li><span class=\"OYPEnA text-decoration-none text-strikethrough-none\">Mewujudkan delapan standar nasional pendidikan.</span></li>\n<li><span class=\"OYPEnA text-decoration-none text-strikethrough-none\">Menjunjung tinggi profesionalisme pendidik dan tenaga kependidikan.</span></li>\n<li><span class=\"OYPEnA text-decoration-none text-strikethrough-none\">Menciptakan</span> <span class=\"OYPEnA text-decoration-none text-strikethrough-none\">lingkungan</span> <span class=\"OYPEnA text-decoration-none text-strikethrough-none\">sekolah</span> <span class=\"OYPEnA text-decoration-none text-strikethrough-none\">yang bersih,indah,nyaman</span> <span class=\"OYPEnA text-decoration-none text-strikethrough-none\">dan sehat sesuai manajemen lingkungan hijau (green school).</span></li>\n<li><span class=\"OYPEnA text-decoration-none text-strikethrough-none\">Melaksanakan kemitraan dengan berbagai stakeholder.</span></li>\n<li><span class=\"OYPEnA text-decoration-none text-strikethrough-none\">Melaksanakan sistem informasi manajemen sekolah.</span></li>\n<li><span class=\"OYPEnA text-decoration-none text-strikethrough-none\">Melaksanakan teaching factory dan business center</span></li>\n</ul>', NULL, 1, '+1+', 'page', 'publish', 'public', 'close', 'visi-dan-misi', 'berita, pengumuman, sekilas-info', 10, '2023-01-15 21:23:22', '2024-03-28 09:59:31', NULL, NULL, 0, 1, 0, 0, 'false'),
(4, 'Sample Post 1', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-1', 'berita, pengumuman, sekilas-info', 5, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'Sample Post 2', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-2', 'berita, pengumuman, sekilas-info', 1, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'Sample Post 3', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-3', 'berita, pengumuman, sekilas-info', 1, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'Sample Post 4', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-4', 'berita, pengumuman, sekilas-info', 1, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'Sample Post 5', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-5', 'berita, pengumuman, sekilas-info', 1, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `quotes`
--

CREATE TABLE `quotes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quote` varchar(255) DEFAULT NULL,
  `quote_by` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `quotes`
--

INSERT INTO `quotes` (`id`, `quote`, `quote_by`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Pendidikan merupakan tiket untuk masa depan. Hari esok untuk orang-orang yang telah mempersiapkan dirinya hari ini', 'Anonim', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, 'Agama tanpa ilmu pengetahuan adalah buta. Dan ilmu pengetahuan tanpa agama adalah lumpuh', 'Anonim', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, 'Hiduplah seakan-akan kau akan mati besok. Belajarlah seakan-akan kau akan hidup selamanya', 'Anonim', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `scholarships`
--

CREATE TABLE `scholarships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) DEFAULT 0,
  `scholarship_type` bigint(20) DEFAULT 0,
  `scholarship_description` varchar(255) NOT NULL,
  `scholarship_start_year` year(4) NOT NULL,
  `scholarship_end_year` year(4) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_group` varchar(100) NOT NULL,
  `setting_variable` varchar(255) DEFAULT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_default_value` text DEFAULT NULL,
  `setting_access_group` varchar(255) DEFAULT NULL,
  `setting_description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `setting_group`, `setting_variable`, `setting_value`, `setting_default_value`, `setting_access_group`, `setting_description`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'general', 'site_maintenance', NULL, 'false', 'public', 'Pemeliharaan situs', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'general', 'site_maintenance_end_date', NULL, '2022-01-01', 'public', 'Tanggal Berakhir Pemeliharaan Situs', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'general', 'site_cache', NULL, 'false', 'public', 'Cache situs', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'general', 'site_cache_time', NULL, '10', 'public', 'Lama Cache Situs', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'general', 'meta_description', NULL, 'CMS Sekolahku adalah Content Management System dan PPDB Online gratis untuk SD SMP/Sederajat SMA/Sederajat', 'public', 'Deskripsi Meta', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'general', 'meta_keywords', NULL, 'CMS, Website Sekolah Gratis, Cara Membuat Website Sekolah, membuat web sekolah, contoh website sekolah, fitur website sekolah, Sekolah, Website, Internet,Situs, CMS Sekolah, Web Sekolah, Website Sekolah Gratis, Website Sekolah, Aplikasi Sekolah, PPDB Online, PSB Online, PSB Online Gratis, Penerimaan Siswa Baru Online, Raport Online, Kurikulum 2013, SD, SMP, SMA, Aliyah, MTs, SMK', 'public', 'Kata Kunci Meta', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'general', 'map_location', NULL, '', 'public', 'Lokasi di Google Maps', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'general', 'favicon', NULL, 'favicon.png', 'public', 'Favicon', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'general', 'header', NULL, 'header.png', 'public', 'Gambar Header', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'general', 'recaptcha_status', NULL, 'disable', 'public', 'reCAPTCHA Status', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(11, 'general', 'recaptcha_site_key', NULL, '6LeNCTAUAAAAAADTbL1rDw8GT1DF2DUjVtEXzdMu', 'public', 'Recaptcha Site Key', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(12, 'general', 'recaptcha_secret_key', NULL, '6LeNCTAUAAAAAGq8O0ItkzG8fsA9KeJ7mFMMFF1s', 'public', 'Recaptcha Secret Key', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(13, 'general', 'timezone', NULL, 'Asia/Jakarta', 'public', 'Time Zone', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(14, 'media', 'file_allowed_types', NULL, 'jpg, jpeg, png, gif', 'public', 'Tipe file yang diizinkan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(15, 'media', 'upload_max_filesize', NULL, '0', 'public', 'Maksimal Ukuran File yang Diupload', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(16, 'media', 'thumbnail_size_height', NULL, '100', 'public', 'Tinggi Gambar Thumbnail', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(17, 'media', 'thumbnail_size_width', NULL, '150', 'public', 'Lebar Gambar Thumbnail', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(18, 'media', 'medium_size_height', NULL, '308', 'public', 'Tinggi Gambar Sedang', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(19, 'media', 'medium_size_width', NULL, '460', 'public', 'Lebar Gambar Sedang', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(20, 'media', 'large_size_height', NULL, '600', 'public', 'Tinggi Gambar Besar', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(21, 'media', 'large_size_width', NULL, '800', 'public', 'Lebar Gambar Besar', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(22, 'media', 'album_cover_height', NULL, '250', 'public', 'Tinggi Cover Album Foto', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(23, 'media', 'album_cover_width', NULL, '400', 'public', 'Lebar Cover Album Foto', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(24, 'media', 'banner_height', NULL, '81', 'public', 'Tinggi Iklan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(25, 'media', 'banner_width', NULL, '245', 'public', 'Lebar Iklan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(26, 'media', 'image_slider_height', NULL, '400', 'public', 'Tinggi Gambar Slide', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(27, 'media', 'image_slider_width', NULL, '900', 'public', 'Lebar Gambar Slide', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(28, 'media', 'student_photo_height', NULL, '400', 'public', 'Tinggi Photo Peserta Didik', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(29, 'media', 'student_photo_width', NULL, '300', 'public', 'Lebar Photo Peserta Didik', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(30, 'media', 'employee_photo_height', NULL, '400', 'public', 'Tinggi Photo Guru dan Tenaga Kependidikan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(31, 'media', 'employee_photo_width', NULL, '300', 'public', 'Lebar Photo Guru dan Tenaga Kependidikan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(32, 'media', 'headmaster_photo_height', NULL, '400', 'public', 'Tinggi Photo Kepala Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(33, 'media', 'headmaster_photo_width', NULL, '300', 'public', 'Lebar Photo Kepala Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(34, 'media', 'header_height', NULL, '80', 'public', 'Tinggi Gambar Header', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(35, 'media', 'header_width', NULL, '200', 'public', 'Lebar Gambar Header', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(36, 'media', 'logo_height', NULL, '120', 'public', 'Tinggi Logo Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(37, 'media', 'logo_width', NULL, '120', 'public', 'Lebar Logo Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(38, 'writing', 'default_post_category', NULL, '1', 'public', 'Default Kategori Tulisan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(39, 'writing', 'default_post_status', NULL, 'publish', 'public', 'Default Status Tulisan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(40, 'writing', 'default_post_visibility', NULL, 'public', 'public', 'Default Akses Tulisan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(41, 'writing', 'default_post_discussion', NULL, 'open', 'public', 'Default Komentar Tulisan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(42, 'writing', 'post_image_thumbnail_height', NULL, '100', 'public', 'Tinggi Gambar Kecil', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(43, 'writing', 'post_image_thumbnail_width', NULL, '150', 'public', 'Lebar Gambar Kecil', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(44, 'writing', 'post_image_medium_height', NULL, '250', 'public', 'Tinggi Gambar Sedang', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(45, 'writing', 'post_image_medium_width', NULL, '400', 'public', 'Lebar Gambar Sedang', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(46, 'writing', 'post_image_large_height', NULL, '450', 'public', 'Tinggi Gambar Besar', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(47, 'writing', 'post_image_large_width', NULL, '840', 'public', 'Lebar Gambar Besar', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(48, 'reading', 'post_per_page', NULL, '10', 'public', 'Tulisan per halaman', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(49, 'reading', 'post_rss_count', NULL, '10', 'public', 'Jumlah RSS', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(50, 'reading', 'post_related_count', NULL, '10', 'public', 'Jumlah Tulisan Terkait', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(51, 'reading', 'comment_per_page', NULL, '10', 'public', 'Komentar per halaman', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(52, 'discussion', 'comment_moderation', NULL, 'false', 'public', 'Komentar harus disetujui secara manual', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(53, 'discussion', 'comment_registration', NULL, 'false', 'public', 'Pengguna harus terdaftar dan login untuk komentar', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(54, 'discussion', 'comment_blacklist', NULL, 'kampret', 'public', 'Komentar disaring', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(55, 'discussion', 'comment_order', NULL, 'asc', 'public', 'Urutan Komentar', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(56, 'social_account', 'facebook', 'https://www.facebook.com/smkdb82?mibextid=ZbWKwL', '', 'public', 'Facebook', '2023-01-15 21:23:22', '2024-03-28 09:38:53', NULL, NULL, 0, 1, 0, 0, 'false'),
(57, 'social_account', 'twitter', NULL, '', 'public', 'Twitter', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(58, 'social_account', 'linked_in', NULL, '', 'public', 'Linked In', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(59, 'social_account', 'youtube', 'https://youtube.com/@smkdoabangsa5828?si=Oyr3mW7jSbo28FPQ', '', 'public', 'Youtube', '2023-01-15 21:23:22', '2024-03-28 09:39:17', NULL, NULL, 0, 1, 0, 0, 'false'),
(60, 'social_account', 'instagram', 'https://www.instagram.com/smk_doabangsa?igsh=MjVoNXFpb2psMHls', '', 'public', 'Instagram', '2023-01-15 21:23:22', '2024-03-28 09:39:06', NULL, NULL, 0, 1, 0, 0, 'false'),
(61, 'mail_server', 'smtp_host', NULL, '', 'private', 'SMTP Server Address', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(62, 'mail_server', 'smtp_user', NULL, '', 'private', 'SMTP Username', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(63, 'mail_server', 'smtp_pass', NULL, '', 'private', 'SMTP Password', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(64, 'mail_server', 'smtp_port', NULL, '', 'public', 'SMTP Port', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(65, 'school_profile', 'npsn', '69726062', '123', 'public', 'NPSN', '2023-01-15 21:23:22', '2024-03-28 03:46:33', NULL, NULL, 0, 1, 0, 0, 'false'),
(66, 'school_profile', 'school_name', 'SMK Doa Bangsa', 'SMA Negeri 9 Kuningan', 'public', 'Nama Sekolah', '2023-01-15 21:23:22', '2024-03-28 03:47:40', NULL, NULL, 0, 1, 0, 0, 'false'),
(67, 'school_profile', 'headmaster', 'Nanda Perdana, S.Pd', 'Anton Sofyan', 'public', 'Kepala Sekolah', '2023-01-15 21:23:22', '2024-03-28 03:45:23', NULL, NULL, 0, 1, 0, 0, 'false'),
(68, 'school_profile', 'headmaster_photo', '44440c6369cf8f48dd9afaacfa5beab4.png', 'headmaster_photo.png', 'public', 'Photo Kepala Sekolah', '2023-01-15 21:23:22', '2024-03-28 09:31:54', NULL, NULL, 0, 0, 0, 0, 'false'),
(69, 'school_profile', 'school_level', NULL, '3', 'public', 'Bentuk Pendidikan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(70, 'school_profile', 'school_status', '2', '1', 'public', 'Status Sekolah', '2023-01-15 21:23:22', '2024-03-28 03:47:47', NULL, NULL, 0, 1, 0, 0, 'false'),
(71, 'school_profile', 'ownership_status', NULL, '1', 'public', 'Status Kepemilikan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(72, 'school_profile', 'decree_operating_permit', '421.5/KEP-775/DISDIK', '-', 'public', 'SK Izin Operasional', '2023-01-15 21:23:22', '2024-03-28 03:43:29', NULL, NULL, 0, 1, 0, 0, 'false'),
(73, 'school_profile', 'decree_operating_permit_date', '05-07-2012', '2023-01-15', 'public', 'Tanggal SK Izin Operasional', '2023-01-15 21:23:22', '2024-03-28 03:43:51', NULL, NULL, 0, 1, 0, 0, 'false'),
(74, 'school_profile', 'tagline', 'JUJUR. IKHLAS. AMANAH', 'Where Tomorrow\'s Leaders Come Together', 'public', 'Slogan', '2023-01-15 21:23:22', '2024-03-28 09:58:39', NULL, NULL, 0, 1, 0, 0, 'false'),
(75, 'school_profile', 'rt', NULL, '12', 'public', 'RT', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(76, 'school_profile', 'rw', NULL, '06', 'public', 'RW', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(77, 'school_profile', 'sub_village', 'Citepus', 'Wage', 'public', 'Dusun', '2023-01-15 21:23:22', '2024-03-28 03:48:27', NULL, NULL, 0, 1, 0, 0, 'false'),
(78, 'school_profile', 'village', 'Citepus', 'Kadugede', 'public', 'Kelurahan / Desa', '2023-01-15 21:23:22', '2024-03-28 03:48:56', NULL, NULL, 0, 1, 0, 0, 'false'),
(79, 'school_profile', 'sub_district', 'Palabuhanratu', 'Kadugede', 'public', 'Kecamatan', '2023-01-15 21:23:22', '2024-03-28 03:48:20', NULL, NULL, 0, 1, 0, 0, 'false'),
(80, 'school_profile', 'district', 'SUKABUMI', 'Kuningan', 'public', 'Kota/Kabupaten', '2023-01-15 21:23:22', '2024-03-28 03:44:19', NULL, NULL, 0, 1, 0, 0, 'false'),
(81, 'school_profile', 'postal_code', NULL, '45561', 'public', 'Kode Pos', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(82, 'school_profile', 'street_address', 'Jalan WR. Supratman, No.333', 'Jalan Raya Kadugede No. 11', 'public', 'Alamat Jalan', '2023-01-15 21:23:22', '2024-03-28 03:48:07', NULL, NULL, 0, 1, 0, 0, 'false'),
(83, 'school_profile', 'phone', NULL, '0232123456', 'public', 'Telepon', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(84, 'school_profile', 'fax', '02666446150', '0232123456', 'public', 'Fax', '2023-01-15 21:23:22', '2024-03-28 03:45:11', NULL, NULL, 0, 1, 0, 0, 'false'),
(85, 'school_profile', 'email', 'smkdoabangsa@gmail.com', 'info@sman9kuningan.sch.id', 'public', 'Email', '2023-01-15 21:23:22', '2024-03-28 03:44:33', NULL, NULL, 0, 1, 0, 0, 'false'),
(86, 'school_profile', 'website', 'http://www.smkdb.sch.id', 'http://www.sman9kuningan.sch.id', 'public', 'Website', '2023-01-15 21:23:22', '2024-03-28 03:49:22', NULL, NULL, 0, 1, 0, 0, 'false'),
(87, 'school_profile', 'logo', '0ca660ebe5161af68e141969258c2b0e.png', 'logo.png', 'public', 'Logo', '2023-01-15 21:23:22', '2024-03-28 09:32:04', NULL, NULL, 0, 0, 0, 0, 'false'),
(88, 'admission', 'admission_status', NULL, 'open', 'public', 'Status Penerimaan Peserta Didik Baru', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(89, 'admission', 'admission_year', '2024', '2023', 'public', 'Tahun Penerimaan Peserta Didik Baru', '2023-01-15 21:23:22', '2024-03-28 03:56:30', NULL, NULL, 0, 1, 0, 0, 'false'),
(90, 'admission', 'admission_start_date', '2024-02-01', '2022-01-01', 'public', 'Tanggal Mulai PPDB', '2023-01-15 21:23:22', '2024-03-28 03:56:04', NULL, NULL, 0, 1, 0, 0, 'false'),
(91, 'admission', 'admission_end_date', '2024-07-15', '2022-12-31', 'public', 'Tanggal Selesai PPDB', '2023-01-15 21:23:22', '2024-03-28 03:55:46', NULL, NULL, 0, 1, 0, 0, 'false'),
(92, 'admission', 'announcement_start_date', '2024-05-01', '2022-01-01', 'public', 'Tanggal Mulai Pengumuman Hasil Seleksi PPDB', '2023-01-15 21:23:22', '2024-03-28 03:57:12', NULL, NULL, 0, 1, 0, 0, 'false'),
(93, 'admission', 'announcement_end_date', '2024-05-16', '2022-12-31', 'public', 'Tanggal Selesai Pengumuman Hasil Seleksi PPDB', '2023-01-15 21:23:22', '2024-03-28 03:56:54', NULL, NULL, 0, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `major_id` bigint(20) DEFAULT 0 COMMENT 'Program Keahlian',
  `first_choice_id` bigint(20) DEFAULT 0 COMMENT 'Pilihan Pertama PPDB',
  `second_choice_id` bigint(20) DEFAULT 0 COMMENT 'Pilihan Kedua PPDB',
  `registration_number` varchar(10) DEFAULT NULL COMMENT 'Nomor Pendaftaran',
  `admission_exam_number` varchar(10) DEFAULT NULL COMMENT 'Nomor Ujian Tes Tulis',
  `selection_result` varchar(100) DEFAULT NULL COMMENT 'Hasil Seleksi PPDB/PMB',
  `admission_phase_id` bigint(20) DEFAULT 0 COMMENT 'Gelombang Pendaftaran',
  `admission_type_id` bigint(20) DEFAULT 0 COMMENT 'Jalur Pendaftaran',
  `photo` varchar(100) DEFAULT NULL,
  `achievement` text DEFAULT NULL COMMENT 'Prestasi Calon Peserta Didik / Mahasiswa',
  `is_student` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Apakah Siswa Aktif ? Set true jika lolos seleksi PPDB dan set FALSE jika sudah lulus',
  `is_prospective_student` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Apakah Calon Siswa Baru ?',
  `is_alumni` enum('true','false','unverified') NOT NULL DEFAULT 'false' COMMENT 'Apakah Alumni?',
  `is_transfer` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Jenis Pendaftaran : Baru / Pindahan ?',
  `re_registration` enum('true','false') DEFAULT NULL COMMENT 'Konfirmasi Pendaftaran Ulang Calon Siswa Baru',
  `start_date` date DEFAULT NULL COMMENT 'Tanggal Masuk Sekolah',
  `identity_number` varchar(50) DEFAULT NULL COMMENT 'NIS/NIM',
  `nisn` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Siswa Nasional',
  `nik` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Kependudukan/KTP',
  `prev_exam_number` varchar(50) DEFAULT NULL COMMENT 'Nomor Peserta Ujian Sebelumnya',
  `prev_diploma_number` varchar(50) DEFAULT NULL COMMENT 'Nomor Ijazah Sebelumnya',
  `paud` enum('true','false') DEFAULT NULL COMMENT 'Apakah Pernah PAUD',
  `tk` enum('true','false') DEFAULT NULL COMMENT 'Apakah Pernah TK',
  `skhun` varchar(50) DEFAULT NULL COMMENT 'No. Seri Surat Keterangan Hasil Ujian Nasional Sebelumnya',
  `prev_school_name` varchar(255) DEFAULT NULL COMMENT 'Nama Sekolah Sebelumnya',
  `prev_school_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Sekolah Sebelumnya',
  `hobby` varchar(255) DEFAULT NULL,
  `ambition` varchar(255) DEFAULT NULL COMMENT 'Cita-Cita',
  `full_name` varchar(150) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `birth_place` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `religion_id` bigint(20) DEFAULT 0,
  `special_need_id` bigint(20) DEFAULT 0 COMMENT 'Berkeburuhan Khusus',
  `street_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rt` varchar(10) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rw` varchar(10) DEFAULT NULL COMMENT 'Alamat Jalan',
  `sub_village` varchar(255) DEFAULT NULL COMMENT 'Nama Dusun',
  `village` varchar(255) DEFAULT NULL COMMENT 'Nama Kelurahan/Desa',
  `sub_district` varchar(255) DEFAULT NULL COMMENT 'Kecamatan',
  `district` varchar(255) DEFAULT NULL COMMENT 'Kota/Kabupaten',
  `postal_code` varchar(20) DEFAULT NULL COMMENT 'Kode POS',
  `residence_id` bigint(20) DEFAULT 0 COMMENT 'Tempat Tinggal',
  `transportation_id` bigint(20) DEFAULT 0 COMMENT 'Moda Transportasi',
  `phone` varchar(50) DEFAULT NULL,
  `mobile_phone` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `sktm` varchar(100) DEFAULT NULL COMMENT 'Surat Keterangan Tidak Mampu (SKTM)',
  `kks` varchar(100) DEFAULT NULL COMMENT 'Kartu Keluarga Sejahtera (KKS)',
  `kps` varchar(100) DEFAULT NULL COMMENT 'Kartu Pra Sejahtera (KPS)',
  `kip` varchar(100) DEFAULT NULL COMMENT 'Kartu Indonesia Pintar (KIP)',
  `kis` varchar(100) DEFAULT NULL COMMENT 'Kartu Indonesia Sehat (KIS)',
  `citizenship` enum('WNI','WNA') NOT NULL DEFAULT 'WNI' COMMENT 'Kewarganegaraan',
  `country` varchar(255) DEFAULT NULL,
  `father_name` varchar(150) DEFAULT NULL,
  `father_birth_year` year(4) DEFAULT NULL,
  `father_education_id` bigint(20) DEFAULT 0,
  `father_employment_id` bigint(20) DEFAULT 0,
  `father_monthly_income_id` bigint(20) DEFAULT 0,
  `father_special_need_id` bigint(20) DEFAULT 0,
  `mother_name` varchar(150) DEFAULT NULL,
  `mother_birth_year` year(4) DEFAULT NULL,
  `mother_education_id` bigint(20) DEFAULT 0,
  `mother_employment_id` bigint(20) DEFAULT 0,
  `mother_monthly_income_id` bigint(20) DEFAULT 0,
  `mother_special_need_id` bigint(20) DEFAULT 0,
  `guardian_name` varchar(150) DEFAULT NULL,
  `guardian_birth_year` year(4) DEFAULT NULL,
  `guardian_education_id` bigint(20) DEFAULT 0,
  `guardian_employment_id` bigint(20) DEFAULT 0,
  `guardian_monthly_income_id` bigint(20) DEFAULT 0,
  `mileage` smallint(6) DEFAULT NULL COMMENT 'Jarak tempat tinggal ke sekolah',
  `traveling_time` smallint(6) DEFAULT NULL COMMENT 'Waktu Tempuh',
  `height` smallint(6) DEFAULT NULL COMMENT 'Tinggi Badan',
  `weight` smallint(6) DEFAULT NULL COMMENT 'Berat Badan',
  `sibling_number` smallint(6) DEFAULT 0 COMMENT 'Jumlah Saudara Kandung',
  `student_status_id` bigint(20) DEFAULT 0 COMMENT 'Status siswa',
  `end_date` date DEFAULT NULL COMMENT 'Tanggal Keluar',
  `reason` varchar(255) DEFAULT NULL COMMENT 'Diisi jika peserta didik sudah keluar',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `students`
--

INSERT INTO `students` (`id`, `major_id`, `first_choice_id`, `second_choice_id`, `registration_number`, `admission_exam_number`, `selection_result`, `admission_phase_id`, `admission_type_id`, `photo`, `achievement`, `is_student`, `is_prospective_student`, `is_alumni`, `is_transfer`, `re_registration`, `start_date`, `identity_number`, `nisn`, `nik`, `prev_exam_number`, `prev_diploma_number`, `paud`, `tk`, `skhun`, `prev_school_name`, `prev_school_address`, `hobby`, `ambition`, `full_name`, `gender`, `birth_place`, `birth_date`, `religion_id`, `special_need_id`, `street_address`, `rt`, `rw`, `sub_village`, `village`, `sub_district`, `district`, `postal_code`, `residence_id`, `transportation_id`, `phone`, `mobile_phone`, `email`, `sktm`, `kks`, `kps`, `kip`, `kis`, `citizenship`, `country`, `father_name`, `father_birth_year`, `father_education_id`, `father_employment_id`, `father_monthly_income_id`, `father_special_need_id`, `mother_name`, `mother_birth_year`, `mother_education_id`, `mother_employment_id`, `mother_monthly_income_id`, `mother_special_need_id`, `guardian_name`, `guardian_birth_year`, `guardian_education_id`, `guardian_employment_id`, `guardian_monthly_income_id`, `mileage`, `traveling_time`, `height`, `weight`, `sibling_number`, `student_status_id`, `end_date`, `reason`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202044', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AL KAROMI D HARTONO', 'M', 'SUKABUMI', '2005-11-24', 0, 0, 'Kp. Babakan Rt.010/Rw.007', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202044@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ASEP YUSUP MULYANA', 'M', 'CIANJUR', '2006-10-26', 0, 0, 'Palabuhanratu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202002@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DE ASTRI ANANTA', 'F', 'SUKABUMI', '2005-05-05', 0, 0, 'Tegal Nyampai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202004@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(4, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DEDE SANI SITI NUROH', 'F', 'SUKABUMI', '2006-01-03', 0, 0, 'Kp. Mariuk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202005@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(5, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202006', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DELIANA SEPTIANI DAVID', 'F', 'SUKABUMI', '2005-09-28', 0, 0, 'Kp Selakopi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202006@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(6, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202007', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DEWI INDRIANI', 'F', 'SUKABUMI', '2005-01-19', 0, 0, 'Kp.Sirnajaya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202007@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(7, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DINI FEBRIANI', 'F', 'SUKABUMI', '2007-02-08', 0, 0, 'Kp. Jayanti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202008@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(8, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202013', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LUNA SITI NURRAHMAN', 'F', 'SUKABUMI', '2005-12-28', 0, 0, 'Jl Pelita', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202013@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(9, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '2122012036', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'M. SYAHRUL ANWAR', 'M', 'SUKABUMI', '2006-04-16', 0, 0, 'Kp. Cikadu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2122012036@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(10, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MARWAH', 'F', 'SUKABUMI', '2006-12-02', 0, 0, 'Kp. Cibogo Ii', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202014@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(11, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202015', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MELA NOVALIA', 'F', 'JAKARTA', '2005-11-04', 0, 0, 'Kp. Cidahon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202015@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(12, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202016', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NABILA FAUZIAH', 'F', 'SUKABUMI', '2006-01-18', 0, 0, 'Kp. Rancareunghas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202016@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(13, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202017', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NAOMI SALWA SAHRIYANI', 'F', 'SUKABUMI', '2008-05-04', 0, 0, 'Kp. Jayanti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202017@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(14, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202018', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NAZILA APRILIA LISNIAWAN', 'F', 'SUKABUMI', '2006-04-09', 0, 0, 'Kp. Mariuk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202018@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(15, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202019', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NELI NURAENI', 'F', 'SUKABUMI', '2005-08-19', 0, 0, 'Sukarame', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202019@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(16, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NENG SIFA YULI HARYANI', 'F', 'SUKABUMI', '2006-07-27', 0, 0, 'Gg.  Empang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202020@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(17, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202021', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NENSA ANGGRAINI', 'F', 'SUKABUMI', '2005-05-01', 0, 0, 'Kp. Babakan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202021@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(18, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PADLI RAMDANI', 'M', 'SUKABUMI', '2005-10-23', 0, 0, 'Ciranji', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202023@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(19, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202024', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PUTRI KARUNISA RAMADANI', 'F', 'SUKABUMI', '2006-10-21', 0, 0, 'Cijambe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202024@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(20, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202025', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RAFLI TAUPIK FADILAH', 'M', 'SUKABUMI', '2005-12-07', 0, 0, 'Sunter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202025@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(21, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202026', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RENI NURAENI', 'F', 'TASIKMALAYA', '2004-10-22', 0, 0, 'Pasangrahan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202026@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(22, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202028', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RIKI', 'M', 'SUKABUMI', '2004-11-11', 0, 0, 'Tegal Nyampay', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202028@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(23, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202029', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RINI SYAHRINI', 'F', 'SUKABUMI', '2005-06-19', 0, 0, 'Kp Babakan Lebu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202029@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(24, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202031', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SITI NURYANI', 'F', 'SUKABUMI', '2006-02-26', 0, 0, 'Kp. Cibuluh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202031@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(25, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202032', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRIANI AMANDA YUSMAN', 'F', 'SUKABUMI', '2006-08-28', 0, 0, 'Kp. Mariuk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202032@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(26, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202033', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WINNY CHRISS ADE LINA', 'F', 'SUKABUMI', '2005-08-31', 0, 0, 'Kuta Mekar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202033@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(27, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202034', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'YUNI MEYLANI', 'F', 'SUKABUMI', '2004-05-08', 0, 0, 'Kp.Citepus Tengah', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202034@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(28, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212202035', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ZAHRA SALSA NABILA', 'F', 'SUKABUMI', '2005-11-20', 0, 0, 'Kp.Rancareunghas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212202035@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:55:36', '2024-03-28 09:55:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(29, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ADEN JUHANDI AGUSTIAN', 'M', 'SUKABUMI', '2003-08-22', 0, 0, 'Kp. Babakanpendeuy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201014@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(30, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201015', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AGIL', 'M', 'SUKABUMI', '2006-03-30', 0, 0, 'Kp.Panyairan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201015@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(31, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201016', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ANANDA RIPALDI', 'M', 'SUKABUMI', '2004-12-01', 0, 0, 'Kp.Bagbagan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201016@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(32, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201019', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ARIEL ANWARI RAHMANDANI', 'M', 'SUKABUMI', '2006-01-17', 0, 0, 'Pasir Badak', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201019@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(33, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201018', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ARIYANA MAULANA', 'M', 'SUKABUMI', '2006-03-07', 0, 0, 'BTN RAWAKALONG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201018@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(34, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DEDE ERWIN', 'M', 'SUKABUMI', '2005-06-01', 0, 0, 'Kp.Pamoyanan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201020@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(35, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201021', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DEDE WALID', 'M', 'SUKABUMI', '2006-05-24', 0, 0, 'Kp.Bagbagan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201021@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(36, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DENIS ANDREA PUTRA', 'M', 'SUKABUMI', '2006-06-09', 0, 0, 'Kp Cinyocok', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201022@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(37, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'EVI PIANI', 'F', 'SUKABUMI', '2006-01-28', 0, 0, 'Kp.Panyairan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201023@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(38, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201024', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FIKI ARISKI', 'M', 'SUKABUMI', '2005-09-11', 0, 0, 'KP.RIUNG GUNUNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201024@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(39, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201026', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'GIO PERMANA', 'M', 'SUKABUMI', '2006-06-30', 0, 0, 'CEMARA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201026@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(40, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201027', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HAIKAL ARDIANSYAH', 'M', 'SUKABUMI', '2006-02-09', 0, 0, 'KP CANGEHGAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201027@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(41, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201031', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MAULA MUHAMAD HILDAN', 'M', 'SUKABUMI', '2005-11-08', 0, 0, 'kp Cinyocok', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201031@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(42, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201032', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOCH BIMA MAULANA ALAMSYAH', 'M', 'SUKABUMI', '2006-04-18', 0, 0, 'KP SELAKOPI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201032@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(43, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201059', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUHAMAD HAZIL ISMAIL', 'M', 'SUKABUMI', '2005-12-01', 0, 0, 'Kp. Babakan Rt. 011/007', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201059@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(44, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201035', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUHAMAD RIFKI MAULANA', 'M', 'SUKABUMI', '2005-06-15', 0, 0, 'Kp.Simpang Empat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201035@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(45, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201029', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUHAMMAD FAKIH ADZIKRI NURUL IMAN', 'M', 'SUKABUMI', '2005-09-08', 0, 0, 'Kp. Tonjong', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201029@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(46, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201033', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUHAMMAD ILMAN ADITIAN', 'M', 'SUKABUMI', '2006-03-03', 0, 0, 'KP. CEMARA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201033@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(47, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201036', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUHAMMAD WISNU', 'M', 'SUKABUMI', '2005-10-08', 0, 0, 'KP. CEMARA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201036@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(48, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201038', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NANDRI', 'M', 'SUKABUMI', '2005-05-17', 0, 0, 'Kp. Simpenan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201038@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(49, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201039', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NENG SILVA NURAZIZAH', 'F', 'SUKABUMI', '2005-02-06', 0, 0, 'Kp.Panyairan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201039@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(50, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201041', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PERA PERNANDA', 'F', 'SUKABUMI', '2006-11-04', 0, 0, 'Kp. Pamoyanan Rt. 02/17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201041@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(51, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201043', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RAYSA NAFTA KAYLA', 'F', 'SUKABUMI', '2004-05-29', 0, 0, 'Kp Gumelar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201043@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(52, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201045', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RENDI HERLANDI', 'M', 'SUKABUMI', '2005-03-17', 0, 0, 'Kp. Ciawun', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201045@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(53, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201047', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RIO ANGGARA SAPUTRA DEWA', 'M', 'SUKABUMI', '2005-07-26', 0, 0, 'jl.Patuguran', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201047@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(54, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201048', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RYAN ADEMA PUTRA', 'M', 'SUKABUMI', '2006-03-14', 0, 0, 'Kp. Cibeber Rt. 03/03 Desa Waluran Kec. Waluran', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201048@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(55, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201050', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SINDI SAPUTRI', 'F', 'DURI', '2006-01-24', 0, 0, 'Kp.Panyairan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201050@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(56, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201051', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SITI JENAB', 'F', 'SUKABUMI', '2006-04-14', 0, 0, 'Kp Ciranca', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201051@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(57, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201052', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SITI SAIDAH', 'F', 'SUKABUMI', '2006-05-09', 0, 0, 'cipatuguran', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201052@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(58, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201054', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SUSILAWATI', 'F', 'SUKABUMI', '2005-10-08', 0, 0, 'kp.cikored', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201054@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(59, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201062', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WIRA SADEWA', 'M', 'SUKABUMI', '2006-08-19', 0, 0, 'Kp. Gandasoli', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201062@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(60, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201057', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'YOGI NOVALDI', 'M', 'SUKABUMI', '2005-11-08', 0, 0, 'Kp. Tegalega', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201057@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(61, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, NULL, '212201058', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ZHEERA FADILAH', 'F', 'SUKABUMI', '2006-01-27', 0, 0, 'Kp Benteng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '212201058@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-03-28 16:56:32', '2024-03-28 09:56:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(62, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'false', 'false', 'true', 'false', NULL, '2012-07-16', '201201001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ANGGI NUGRAHA', 'M', NULL, NULL, 0, 0, 'Kp Mekar Sari', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '0', '201201001@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 2, '2014-05-16', NULL, '2024-03-28 17:16:52', '2024-03-28 10:16:52', NULL, NULL, 1, 0, 0, 0, 'false'),
(63, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'false', 'false', 'true', 'false', NULL, '2012-07-16', '201201002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ROBI MAULANA', 'M', NULL, NULL, 0, 0, 'Kalimantan Barat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '0', '201201002@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 2, '2014-05-17', NULL, '2024-03-28 17:21:17', '2024-03-28 10:21:17', NULL, NULL, 1, 0, 0, 0, 'false'),
(64, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'false', 'false', 'true', 'false', NULL, '2012-07-16', '201201003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ASEP ABDUL RAHMAN', 'M', NULL, NULL, 0, 0, 'Jalan Surya Kencana, Gg H. Muhasim', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '0', '201201003@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 2, '2014-05-18', NULL, '2024-03-28 17:21:17', '2024-03-28 10:21:17', NULL, NULL, 1, 0, 0, 0, 'false'),
(65, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'false', 'false', 'true', 'false', NULL, '2012-07-16', '201201004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOH SINGGIH BUDI P', 'M', NULL, NULL, 0, 0, 'Palabuhan Ratu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '0', '201201004@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 2, '2014-05-19', NULL, '2024-03-28 17:21:17', '2024-03-28 10:21:17', NULL, NULL, 1, 0, 0, 0, 'false'),
(66, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'false', 'false', 'true', 'false', NULL, '2012-07-16', '201201005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MUHAMAD FAJAR HIDAYAT', 'M', NULL, NULL, 0, 0, 'Kp. Areman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '0', '201201005@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 2, '2014-05-20', NULL, '2024-03-28 17:21:17', '2024-03-28 10:21:17', NULL, NULL, 1, 0, 0, 0, 'false'),
(67, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'false', 'false', 'true', 'false', NULL, '2012-07-16', '201201006', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ARI SANDI', 'M', NULL, NULL, 0, 0, 'Subang Jaya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '0', '201201006@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 2, '2014-05-21', NULL, '2024-03-28 17:21:17', '2024-03-28 10:21:17', NULL, NULL, 1, 0, 0, 0, 'false'),
(68, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'false', 'false', 'true', 'false', NULL, '2012-07-16', '201201007', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NOVIANTI', 'F', NULL, NULL, 0, 0, 'Kp. Mariuk, Desa. Cidadap', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '0', '201201007@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 2, '2014-05-22', NULL, '2024-03-28 17:21:17', '2024-03-28 10:21:17', NULL, NULL, 1, 0, 0, 0, 'false'),
(69, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'false', 'false', 'true', 'false', NULL, '2012-07-16', '201201008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NURUL ANISA', 'F', NULL, NULL, 0, 0, 'Kp. Dayeuh Luhur,Desa. Cikakak', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '0', '201201008@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 2, '2014-05-23', NULL, '2024-03-28 17:21:17', '2024-03-28 10:21:17', NULL, NULL, 1, 0, 0, 0, 'false'),
(70, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'false', 'false', 'true', 'false', NULL, '2012-07-16', '201201009', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'INDRIYANI YUSMAN', 'F', NULL, NULL, 0, 0, 'Kp. Mariuk,Desa. Cidadap', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '0', '201201009@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 2, '2014-05-24', NULL, '2024-03-28 17:21:17', '2024-03-28 10:21:17', NULL, NULL, 1, 0, 0, 0, 'false'),
(71, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'false', 'false', 'true', 'false', NULL, '2012-07-16', '201201010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REKAS APRIANA', 'M', NULL, NULL, 0, 0, 'Palabuhanratu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '0', '201201010@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 2, '2014-05-25', NULL, '2024-03-28 17:21:17', '2024-03-28 10:21:17', NULL, NULL, 1, 0, 0, 0, 'false'),
(72, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'false', 'false', 'true', 'false', NULL, '2012-07-16', '201201011', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ERIK HIDAYATULLAH', 'M', NULL, NULL, 0, 0, 'Joglo, Kembangan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '0', '201201011@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 2, '2014-05-26', NULL, '2024-03-28 17:21:17', '2024-03-28 10:21:17', NULL, NULL, 1, 0, 0, 0, 'false'),
(73, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'false', 'false', 'true', 'false', NULL, '2012-07-16', '201201012', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DEDE SITI NUR AJIJAH', 'F', NULL, NULL, 0, 0, 'Kp .Cikadu, Desa. Cikadu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '0', '201201012@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 2, '2014-05-27', NULL, '2024-03-28 17:21:17', '2024-03-28 10:21:17', NULL, NULL, 1, 0, 0, 0, 'false'),
(74, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'false', 'false', 'true', 'false', NULL, '2012-07-16', '201201013', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'APRIANI SAPITRI', 'F', NULL, NULL, 0, 0, 'Kp. Mekar Sari', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '0', '201201013@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 2, '2014-05-28', NULL, '2024-03-28 17:21:17', '2024-03-28 10:21:17', NULL, NULL, 1, 0, 0, 0, 'false'),
(75, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'false', 'false', 'true', 'false', NULL, '2012-07-16', '201201014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PRINTIA LASTRI', 'F', NULL, NULL, 0, 0, 'Kp. Gebang, Ds. Sukaragam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '0', '201201014@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 2, '2014-05-29', NULL, '2024-03-28 17:21:17', '2024-03-28 10:21:17', NULL, NULL, 1, 0, 0, 0, 'false'),
(76, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'false', 'false', 'true', 'false', NULL, '2012-07-16', '201201015', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MESI MISNAWATI', 'F', NULL, NULL, 0, 0, 'Kp. Pasir Kolotok, Desa. Cikadu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '0', '201201015@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 2, '2014-05-30', NULL, '2024-03-28 17:21:17', '2024-03-28 10:21:17', NULL, NULL, 1, 0, 0, 0, 'false'),
(77, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'false', 'false', 'true', 'false', NULL, '2012-07-16', '201201016', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HELVIDA IQBAL LESTARI', 'F', NULL, NULL, 0, 0, 'Kp Kebontarum 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '0', '201201016@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 2, '2014-05-31', NULL, '2024-03-28 17:21:17', '2024-03-28 10:21:17', NULL, NULL, 1, 0, 0, 0, 'false'),
(78, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'false', 'false', 'true', 'false', NULL, '2012-07-16', '201201017', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DAMAR RIZKI', 'M', NULL, NULL, 0, 0, 'Karangpapak - Cisolok', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '0', '201201017@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 2, '2014-06-01', NULL, '2024-03-28 17:21:17', '2024-03-28 10:21:17', NULL, NULL, 1, 0, 0, 0, 'false'),
(79, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'false', 'false', 'true', 'false', NULL, '2012-07-16', '201201018', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RISKAWATI', 'F', NULL, NULL, 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '0', '201201018@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 2, '2014-06-02', NULL, '2024-03-28 17:21:17', '2024-03-28 10:21:17', NULL, NULL, 1, 0, 0, 0, 'false'),
(80, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'false', 'false', 'true', 'false', NULL, '2012-07-16', '201201019', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HAEDAR FANHAS', 'M', NULL, NULL, 0, 0, 'Kp Cipicung', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '0', '201201019@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 2, '2014-06-03', NULL, '2024-03-28 17:21:17', '2024-03-28 10:21:17', NULL, NULL, 1, 0, 0, 0, 'false'),
(81, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'false', 'false', 'true', 'false', NULL, '2012-07-16', '201201020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AYI GUNAWAN', 'M', NULL, NULL, 0, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '0', '201201020@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 2, '2014-06-04', NULL, '2024-03-28 17:21:17', '2024-03-28 10:21:17', NULL, NULL, 1, 0, 0, 0, 'false'),
(82, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'false', 'false', 'true', 'false', NULL, '2012-07-16', '201201021', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NOVI ALAWIAH', 'F', NULL, NULL, 0, 0, 'Kec.Joglo, Jakarta Barat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '0', '201201021@smkdb.sch.id', NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 2, '2014-06-05', NULL, '2024-03-28 17:21:17', '2024-03-28 10:21:17', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `tags`
--

INSERT INTO `tags` (`id`, `tag`, `slug`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Berita', 'berita', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'Pengumuman', 'pengumuman', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Sekilas Info', 'sekilas-info', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `themes`
--

CREATE TABLE `themes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `theme_name` varchar(255) NOT NULL,
  `theme_folder` varchar(255) DEFAULT NULL,
  `theme_author` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `themes`
--

INSERT INTO `themes` (`id`, `theme_name`, `theme_folder`, `theme_author`, `is_active`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Sky Light', 'sky_light', 'Anton Sofyan', 'true', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, 'Blue Sky', 'blue_sky', 'Anton Sofyan', 'false', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, 'Green Land', 'green_land', 'Anton Sofyan', 'false', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(60) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_full_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_url` varchar(100) DEFAULT NULL,
  `user_group_id` bigint(20) DEFAULT 0,
  `user_type` enum('super_user','administrator','employee','student') NOT NULL DEFAULT 'administrator',
  `user_profile_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'student_id OR employee_id',
  `user_biography` text DEFAULT NULL,
  `user_forgot_password_key` varchar(100) DEFAULT NULL,
  `user_forgot_password_request_date` date DEFAULT NULL,
  `has_login` enum('true','false') DEFAULT 'false',
  `last_logged_in` datetime DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_password`, `user_full_name`, `user_email`, `user_url`, `user_group_id`, `user_type`, `user_profile_id`, `user_biography`, `user_forgot_password_key`, `user_forgot_password_request_date`, `has_login`, `last_logged_in`, `ip_address`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'administrator', '$2y$10$DTE7GO8Y.E1.J.DnjuHEweet3ZrKgK1GscAoS27Qf9CKUflch0pG.', 'Asep Sukandar', 'asepsukanda22@gmail.com', 'smkdb.sch.id', 0, 'super_user', NULL, '', NULL, NULL, 'true', '2024-03-28 10:30:52', '::1', '2023-01-15 21:23:22', '2024-03-28 09:31:14', NULL, NULL, 0, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_groups`
--

CREATE TABLE `user_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_group` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_privileges`
--

CREATE TABLE `user_privileges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_group_id` bigint(20) DEFAULT 0,
  `module_id` bigint(20) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `_sessions`
--

CREATE TABLE `_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `_sessions`
--

INSERT INTO `_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('mfedbmski81s62dtqcjihu36ccqtstn0', '::1', 1711618188, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731313631383132343b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323032322d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3130363a22434d532053656b6f6c61686b75206164616c616820436f6e74656e74204d616e6167656d656e742053797374656d2064616e2050504442204f6e6c696e652067726174697320756e74756b20534420534d502f5365646572616a617420534d412f5365646572616a6174223b6d6574615f6b6579776f7264737c733a3338313a22434d532c20576562736974652053656b6f6c6168204772617469732c2043617261204d656d6275617420576562736974652053656b6f6c61682c206d656d62756174207765622073656b6f6c61682c20636f6e746f6820776562736974652073656b6f6c61682c20666974757220776562736974652073656b6f6c61682c2053656b6f6c61682c20576562736974652c20496e7465726e65742c53697475732c20434d532053656b6f6c61682c205765622053656b6f6c61682c20576562736974652053656b6f6c6168204772617469732c20576562736974652053656b6f6c61682c2041706c696b6173692053656b6f6c61682c2050504442204f6e6c696e652c20505342204f6e6c696e652c20505342204f6e6c696e65204772617469732c2050656e6572696d61616e2053697377612042617275204f6e6c696e652c205261706f7274204f6e6c696e652c204b7572696b756c756d20323031332c2053442c20534d502c20534d412c20416c697961682c204d54732c20534d4b223b6d61705f6c6f636174696f6e7c733a303a22223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f7374617475737c733a373a2264697361626c65223b7265636170746368615f736974655f6b65797c733a34303a22364c654e435441554141414141414454624c317244773847543144463244556a567445587a644d75223b7265636170746368615f7365637265745f6b65797c733a34303a22364c654e4354415541414141414771384f3049746b7a4738667341394b654a376d464d4d46463173223b74696d657a6f6e657c733a31323a22417369612f4a616b61727461223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b7468756d626e61696c5f73697a655f6865696768747c733a333a22313030223b7468756d626e61696c5f73697a655f77696474687c733a333a22313530223b6d656469756d5f73697a655f6865696768747c733a333a22333038223b6d656469756d5f73697a655f77696474687c733a333a22343630223b6c617267655f73697a655f6865696768747c733a333a22363030223b6c617267655f73697a655f77696474687c733a333a22383030223b616c62756d5f636f7665725f6865696768747c733a333a22323530223b616c62756d5f636f7665725f77696474687c733a333a22343030223b62616e6e65725f6865696768747c733a323a223831223b62616e6e65725f77696474687c733a333a22323435223b696d6167655f736c696465725f6865696768747c733a333a22343030223b696d6167655f736c696465725f77696474687c733a333a22393030223b73747564656e745f70686f746f5f6865696768747c733a333a22343030223b73747564656e745f70686f746f5f77696474687c733a333a22333030223b656d706c6f7965655f70686f746f5f6865696768747c733a333a22343030223b656d706c6f7965655f70686f746f5f77696474687c733a333a22333030223b686561646d61737465725f70686f746f5f6865696768747c733a333a22343030223b686561646d61737465725f70686f746f5f77696474687c733a333a22333030223b6865616465725f6865696768747c733a323a223830223b6865616465725f77696474687c733a333a22323030223b6c6f676f5f6865696768747c733a333a22313230223b6c6f676f5f77696474687c733a333a22313230223b64656661756c745f706f73745f63617465676f72797c733a313a2231223b64656661756c745f706f73745f7374617475737c733a373a227075626c697368223b64656661756c745f706f73745f7669736962696c6974797c733a363a227075626c6963223b64656661756c745f706f73745f64697363757373696f6e7c733a343a226f70656e223b706f73745f696d6167655f7468756d626e61696c5f6865696768747c733a333a22313030223b706f73745f696d6167655f7468756d626e61696c5f77696474687c733a333a22313530223b706f73745f696d6167655f6d656469756d5f6865696768747c733a333a22323530223b706f73745f696d6167655f6d656469756d5f77696474687c733a333a22343030223b706f73745f696d6167655f6c617267655f6865696768747c733a333a22343530223b706f73745f696d6167655f6c617267655f77696474687c733a333a22383430223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f6d6f6465726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a31343a22534d4b20446f612042616e677361223b747769747465727c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a31343a22534d4b20444f412042414e475341223b696e7374616772616d7c733a31343a2240736d6b5f646f6162616e677361223b736d74705f706f72747c733a303a22223b6e70736e7c733a383a223639373236303632223b7363686f6f6c5f6e616d657c733a31343a22534d4b20446f612042616e677361223b686561646d61737465727c733a31393a224e616e64612050657264616e612c20532e5064223b686561646d61737465725f70686f746f7c733a32303a22686561646d61737465725f70686f746f2e706e67223b7363686f6f6c5f6c6576656c7c733a313a224d223b7363686f6f6c5f7374617475737c733a313a2232223b6f776e6572736869705f7374617475737c733a313a2231223b6465637265655f6f7065726174696e675f7065726d69747c733a32303a223432312e352f4b45502d3737352f44495344494b223b6465637265655f6f7065726174696e675f7065726d69745f646174657c733a31303a2230352d30372d32303132223b7461676c696e657c733a32313a224a756a75722e20496b686c61732e20416d616e6168223b72747c733a323a223132223b72777c733a323a223036223b7375625f76696c6c6167657c733a373a2243697465707573223b76696c6c6167657c733a373a2243697465707573223b7375625f64697374726963747c733a31333a2250616c61627568616e72617475223b64697374726963747c733a383a2253554b4142554d49223b706f7374616c5f636f64657c733a353a223435353631223b7374726565745f616464726573737c733a32373a224a616c616e2057522e205375707261746d616e2c204e6f2e333333223b70686f6e657c733a31303a2230323332313233343536223b6661787c733a31313a223032363636343436313530223b656d61696c7c733a32323a22736d6b646f6162616e67736140676d61696c2e636f6d223b776562736974657c733a32333a22687474703a2f2f7777772e736d6b64622e7363682e6964223b6c6f676f7c733a33373a2265353366666461323236623163383961613463383730353631376365353064362e6a706567223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303234223b61646d697373696f6e5f73746172745f646174657c733a31303a22323032342d30322d3031223b61646d697373696f6e5f656e645f646174657c733a31303a22323032342d30372d3135223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323032342d30352d3031223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323032342d30352d3136223b5f61636164656d69635f796561727c733a31353a22546168756e2050656c616a6172616e223b5f73747564656e747c733a31333a225065736572746120446964696b223b5f6964656e746974795f6e756d6265727c733a333a224e4953223b5f656d706c6f7965657c733a333a2247544b223b5f5f656d706c6f7965657c733a32383a22477572752064616e2054656e616761204b6570656e646964696b616e223b5f7375626a6563747c733a31343a224d6174612050656c616a6172616e223b5f61646d697373696f6e7c733a343a2250504442223b5f6d616a6f727c733a373a224a75727573616e223b5f686561646d61737465727c733a31343a224b6570616c612053656b6f6c6168223b7468656d657c733a393a22736b795f6c69676874223b6d616a6f725f636f756e747c623a303b757365725f69647c733a313a2231223b757365725f6e616d657c733a31333a2261646d696e6973747261746f72223b757365725f656d61696c7c733a32333a226173657073756b616e6461323240676d61696c2e636f6d223b757365725f747970657c733a31303a2273757065725f75736572223b757365725f70726f66696c655f69647c4e3b6861735f6c6f67696e7c623a313b757365725f70726976696c656765737c613a31343a7b693a303b733a393a2264617368626f617264223b693a313b733a31353a226368616e67655f70617373776f7264223b693a323b733a31313a226d61696e74656e616e6365223b693a333b733a353a227573657273223b693a343b733a393a2261646d697373696f6e223b693a353b733a31303a22617070656172616e6365223b693a363b733a343a22626c6f67223b693a373b733a393a22656d706c6f79656573223b693a383b733a353a226d65646961223b693a393b733a373a22706c7567696e73223b693a31303b733a393a227265666572656e6365223b693a31313b733a383a2273657474696e6773223b693a31323b733a383a2261636164656d6963223b693a31333b733a373a2270726f66696c65223b7d736d74705f686f73747c733a303a22223b736d74705f757365727c733a303a22223b736d74705f706173737c733a303a22223b746f6b656e7c733a33323a223934343466323931643664383765313230346162363831366261626135393266223b637372665f746f6b656e7c733a33323a223934343466323931643664383765313230346162363831366261626135393266223b),
('9pvvdpo4qmeivve5mhsp6u4foa8ek3di', '::1', 1711621359, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731313632313332313b746f6b656e7c733a33323a223835643137323361363038306634313066396136303133393033376562346331223b637372665f746f6b656e7c733a33323a223835643137323361363038306634313066396136303133393033376562346331223b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323032322d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3130363a22434d532053656b6f6c61686b75206164616c616820436f6e74656e74204d616e6167656d656e742053797374656d2064616e2050504442204f6e6c696e652067726174697320756e74756b20534420534d502f5365646572616a617420534d412f5365646572616a6174223b6d6574615f6b6579776f7264737c733a3338313a22434d532c20576562736974652053656b6f6c6168204772617469732c2043617261204d656d6275617420576562736974652053656b6f6c61682c206d656d62756174207765622073656b6f6c61682c20636f6e746f6820776562736974652073656b6f6c61682c20666974757220776562736974652073656b6f6c61682c2053656b6f6c61682c20576562736974652c20496e7465726e65742c53697475732c20434d532053656b6f6c61682c205765622053656b6f6c61682c20576562736974652053656b6f6c6168204772617469732c20576562736974652053656b6f6c61682c2041706c696b6173692053656b6f6c61682c2050504442204f6e6c696e652c20505342204f6e6c696e652c20505342204f6e6c696e65204772617469732c2050656e6572696d61616e2053697377612042617275204f6e6c696e652c205261706f7274204f6e6c696e652c204b7572696b756c756d20323031332c2053442c20534d502c20534d412c20416c697961682c204d54732c20534d4b223b6d61705f6c6f636174696f6e7c733a303a22223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f7374617475737c733a373a2264697361626c65223b7265636170746368615f736974655f6b65797c733a34303a22364c654e435441554141414141414454624c317244773847543144463244556a567445587a644d75223b7265636170746368615f7365637265745f6b65797c733a34303a22364c654e4354415541414141414771384f3049746b7a4738667341394b654a376d464d4d46463173223b74696d657a6f6e657c733a31323a22417369612f4a616b61727461223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b7468756d626e61696c5f73697a655f6865696768747c733a333a22313030223b7468756d626e61696c5f73697a655f77696474687c733a333a22313530223b6d656469756d5f73697a655f6865696768747c733a333a22333038223b6d656469756d5f73697a655f77696474687c733a333a22343630223b6c617267655f73697a655f6865696768747c733a333a22363030223b6c617267655f73697a655f77696474687c733a333a22383030223b616c62756d5f636f7665725f6865696768747c733a333a22323530223b616c62756d5f636f7665725f77696474687c733a333a22343030223b62616e6e65725f6865696768747c733a323a223831223b62616e6e65725f77696474687c733a333a22323435223b696d6167655f736c696465725f6865696768747c733a333a22343030223b696d6167655f736c696465725f77696474687c733a333a22393030223b73747564656e745f70686f746f5f6865696768747c733a333a22343030223b73747564656e745f70686f746f5f77696474687c733a333a22333030223b656d706c6f7965655f70686f746f5f6865696768747c733a333a22343030223b656d706c6f7965655f70686f746f5f77696474687c733a333a22333030223b686561646d61737465725f70686f746f5f6865696768747c733a333a22343030223b686561646d61737465725f70686f746f5f77696474687c733a333a22333030223b6865616465725f6865696768747c733a323a223830223b6865616465725f77696474687c733a333a22323030223b6c6f676f5f6865696768747c733a333a22313230223b6c6f676f5f77696474687c733a333a22313230223b64656661756c745f706f73745f63617465676f72797c733a313a2231223b64656661756c745f706f73745f7374617475737c733a373a227075626c697368223b64656661756c745f706f73745f7669736962696c6974797c733a363a227075626c6963223b64656661756c745f706f73745f64697363757373696f6e7c733a343a226f70656e223b706f73745f696d6167655f7468756d626e61696c5f6865696768747c733a333a22313030223b706f73745f696d6167655f7468756d626e61696c5f77696474687c733a333a22313530223b706f73745f696d6167655f6d656469756d5f6865696768747c733a333a22323530223b706f73745f696d6167655f6d656469756d5f77696474687c733a333a22343030223b706f73745f696d6167655f6c617267655f6865696768747c733a333a22343530223b706f73745f696d6167655f6c617267655f77696474687c733a333a22383430223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f6d6f6465726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a34383a2268747470733a2f2f7777772e66616365626f6f6b2e636f6d2f736d6b646238323f6d696265787469643d5a62574b774c223b747769747465727c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a35373a2268747470733a2f2f796f75747562652e636f6d2f40736d6b646f6162616e677361353832383f73693d4f7972336d57376a53626f3238465051223b696e7374616772616d7c733a36313a2268747470733a2f2f7777772e696e7374616772616d2e636f6d2f736d6b5f646f6162616e6773613f696773683d4d6a566f4e584670623270734d486c73223b736d74705f706f72747c733a303a22223b6e70736e7c733a383a223639373236303632223b7363686f6f6c5f6e616d657c733a31343a22534d4b20446f612042616e677361223b686561646d61737465727c733a31393a224e616e64612050657264616e612c20532e5064223b686561646d61737465725f70686f746f7c733a33363a2234343434306336333639636638663438646439616661616366613562656162342e706e67223b7363686f6f6c5f6c6576656c7c733a313a224d223b7363686f6f6c5f7374617475737c733a313a2232223b6f776e6572736869705f7374617475737c733a313a2231223b6465637265655f6f7065726174696e675f7065726d69747c733a32303a223432312e352f4b45502d3737352f44495344494b223b6465637265655f6f7065726174696e675f7065726d69745f646174657c733a31303a2230352d30372d32303132223b7461676c696e657c733a32313a224a554a55522e20494b484c41532e20414d414e4148223b72747c733a323a223132223b72777c733a323a223036223b7375625f76696c6c6167657c733a373a2243697465707573223b76696c6c6167657c733a373a2243697465707573223b7375625f64697374726963747c733a31333a2250616c61627568616e72617475223b64697374726963747c733a383a2253554b4142554d49223b706f7374616c5f636f64657c733a353a223435353631223b7374726565745f616464726573737c733a32373a224a616c616e2057522e205375707261746d616e2c204e6f2e333333223b70686f6e657c733a31303a2230323332313233343536223b6661787c733a31313a223032363636343436313530223b656d61696c7c733a32323a22736d6b646f6162616e67736140676d61696c2e636f6d223b776562736974657c733a32333a22687474703a2f2f7777772e736d6b64622e7363682e6964223b6c6f676f7c733a33363a2230636136363065626535313631616636386531343139363932353863326230652e706e67223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303234223b61646d697373696f6e5f73746172745f646174657c733a31303a22323032342d30322d3031223b61646d697373696f6e5f656e645f646174657c733a31303a22323032342d30372d3135223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323032342d30352d3031223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323032342d30352d3136223b5f61636164656d69635f796561727c733a31353a22546168756e2050656c616a6172616e223b5f73747564656e747c733a31333a225065736572746120446964696b223b5f6964656e746974795f6e756d6265727c733a333a224e4953223b5f656d706c6f7965657c733a333a2247544b223b5f5f656d706c6f7965657c733a32383a22477572752064616e2054656e616761204b6570656e646964696b616e223b5f7375626a6563747c733a31343a224d6174612050656c616a6172616e223b5f61646d697373696f6e7c733a343a2250504442223b5f6d616a6f727c733a373a224a75727573616e223b5f686561646d61737465727c733a31343a224b6570616c612053656b6f6c6168223b7468656d657c733a393a22736b795f6c69676874223b6d616a6f725f636f756e747c623a313b757365725f69647c733a313a2231223b757365725f6e616d657c733a31333a2261646d696e6973747261746f72223b757365725f656d61696c7c733a32333a226173657073756b616e6461323240676d61696c2e636f6d223b757365725f747970657c733a31303a2273757065725f75736572223b757365725f70726f66696c655f69647c4e3b6861735f6c6f67696e7c623a313b757365725f70726976696c656765737c613a31343a7b693a303b733a393a2264617368626f617264223b693a313b733a31353a226368616e67655f70617373776f7264223b693a323b733a31313a226d61696e74656e616e6365223b693a333b733a353a227573657273223b693a343b733a393a2261646d697373696f6e223b693a353b733a31303a22617070656172616e6365223b693a363b733a343a22626c6f67223b693a373b733a393a22656d706c6f79656573223b693a383b733a353a226d65646961223b693a393b733a373a22706c7567696e73223b693a31303b733a393a227265666572656e6365223b693a31313b733a383a2273657474696e6773223b693a31323b733a383a2261636164656d6963223b693a31333b733a373a2270726f66696c65223b7d736d74705f686f73747c733a303a22223b736d74705f757365727c733a303a22223b736d74705f706173737c733a303a22223b61646d697373696f6e5f73656d65737465725f69647c733a313a2231223b61646d697373696f6e5f73656d65737465727c733a393a22323032342d32303235223b63757272656e745f61636164656d69635f796561725f69647c733a313a2231223b63757272656e745f61636164656d69635f796561727c733a393a22323032342d32303235223b63757272656e745f61636164656d69635f73656d65737465727c733a333a226f6464223b);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `academic_years`
--
ALTER TABLE `academic_years`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `academic_year` (`academic_year`);

--
-- Indeks untuk tabel `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `achievements_student_id__idx` (`student_id`) USING BTREE;

--
-- Indeks untuk tabel `admission_phases`
--
ALTER TABLE `admission_phases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`academic_year_id`,`phase_name`),
  ADD KEY `admission_phases_academic_year_id__idx` (`academic_year_id`) USING BTREE;

--
-- Indeks untuk tabel `admission_quotas`
--
ALTER TABLE `admission_quotas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`academic_year_id`,`admission_type_id`,`major_id`),
  ADD KEY `admission_quotas_academic_year_id__idx` (`academic_year_id`) USING BTREE,
  ADD KEY `admission_quotas_admission_type_id__idx` (`admission_type_id`) USING BTREE,
  ADD KEY `admission_quotas_major_id__idx` (`major_id`) USING BTREE;

--
-- Indeks untuk tabel `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `album_title` (`album_title`);

--
-- Indeks untuk tabel `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`question_id`,`answer`),
  ADD KEY `answers_question_id__idx` (`question_id`) USING BTREE;

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`category_name`,`category_type`);

--
-- Indeks untuk tabel `class_groups`
--
ALTER TABLE `class_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`class_group`,`sub_class_group`,`major_id`),
  ADD KEY `class_groups_major_id__idx` (`major_id`) USING BTREE;

--
-- Indeks untuk tabel `class_group_settings`
--
ALTER TABLE `class_group_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`academic_year_id`,`class_group_id`),
  ADD KEY `class_group_settings_academic_year_id__idx` (`academic_year_id`) USING BTREE,
  ADD KEY `class_group_settings_class_group_id__idx` (`class_group_id`) USING BTREE;

--
-- Indeks untuk tabel `class_group_students`
--
ALTER TABLE `class_group_students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`class_group_setting_id`,`student_id`),
  ADD KEY `class_group_students_class_group_setting_id__idx` (`class_group_setting_id`) USING BTREE,
  ADD KEY `class_group_students_student_id__idx` (`student_id`) USING BTREE;

--
-- Indeks untuk tabel `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_comment_post_id__idx` (`comment_post_id`) USING BTREE;

--
-- Indeks untuk tabel `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_nik__idx` (`nik`) USING BTREE,
  ADD KEY `employees_full_name__idx` (`full_name`) USING BTREE,
  ADD KEY `employees_email__idx` (`email`) USING BTREE,
  ADD KEY `employees_religion_id__idx` (`religion_id`) USING BTREE,
  ADD KEY `employees_marriage_status_id__idx` (`marriage_status_id`) USING BTREE,
  ADD KEY `employees_spouse_employment_id__idx` (`spouse_employment_id`) USING BTREE,
  ADD KEY `employees_employment_status_id__idx` (`employment_status_id`) USING BTREE,
  ADD KEY `employees_employment_type_id__idx` (`employment_type_id`) USING BTREE,
  ADD KEY `employees_institution_lifter_id__idx` (`institution_lifter_id`) USING BTREE,
  ADD KEY `employees_rank_id__idx` (`rank_id`) USING BTREE,
  ADD KEY `employees_salary_source_id__idx` (`salary_source_id`) USING BTREE,
  ADD KEY `employees_laboratory_skill_id__idx` (`laboratory_skill_id`) USING BTREE,
  ADD KEY `employees_special_need_id__idx` (`special_need_id`) USING BTREE;

--
-- Indeks untuk tabel `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_file_category_id__idx` (`file_category_id`) USING BTREE;

--
-- Indeks untuk tabel `image_sliders`
--
ALTER TABLE `image_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`link_url`,`link_type`);

--
-- Indeks untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `major_name` (`major_name`);

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `module_name` (`module_name`);

--
-- Indeks untuk tabel `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`option_group`,`option_name`),
  ADD KEY `options_option_group__idx` (`option_group`) USING BTREE;

--
-- Indeks untuk tabel `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photos_photo_album_id__idx` (`photo_album_id`) USING BTREE;

--
-- Indeks untuk tabel `pollings`
--
ALTER TABLE `pollings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pollings_answer_id__idx` (`answer_id`) USING BTREE;

--
-- Indeks untuk tabel `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_post_author__idx` (`post_author`) USING BTREE;

--
-- Indeks untuk tabel `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `question` (`question`);

--
-- Indeks untuk tabel `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`quote`,`quote_by`);

--
-- Indeks untuk tabel `scholarships`
--
ALTER TABLE `scholarships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scholarships_student_id__idx` (`student_id`) USING BTREE;

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`setting_group`,`setting_variable`);

--
-- Indeks untuk tabel `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_registration_number__idx` (`registration_number`) USING BTREE,
  ADD KEY `students_identity_number__idx` (`identity_number`) USING BTREE,
  ADD KEY `students_full_name__idx` (`full_name`) USING BTREE,
  ADD KEY `students_first_choice_id__idx` (`first_choice_id`) USING BTREE,
  ADD KEY `students_second_choice_id__idx` (`second_choice_id`) USING BTREE,
  ADD KEY `students_major_id__idx` (`major_id`) USING BTREE,
  ADD KEY `students_admission_phase_id__idx` (`admission_phase_id`) USING BTREE,
  ADD KEY `students_admission_type_id__idx` (`admission_type_id`) USING BTREE,
  ADD KEY `students_student_status_id__idx` (`student_status_id`) USING BTREE;

--
-- Indeks untuk tabel `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag` (`tag`);

--
-- Indeks untuk tabel `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `theme_name` (`theme_name`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD KEY `users_user_group_id__idx` (`user_group_id`) USING BTREE,
  ADD KEY `users_user_profile_id__idx` (`user_profile_id`) USING BTREE;

--
-- Indeks untuk tabel `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_group` (`user_group`);

--
-- Indeks untuk tabel `user_privileges`
--
ALTER TABLE `user_privileges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`user_group_id`,`module_id`),
  ADD KEY `user_privileges_user_group_id__idx` (`user_group_id`) USING BTREE,
  ADD KEY `user_privileges_module_id__idx` (`module_id`) USING BTREE;

--
-- Indeks untuk tabel `_sessions`
--
ALTER TABLE `_sessions`
  ADD KEY `ci_sessions_TIMESTAMP` (`timestamp`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `academic_years`
--
ALTER TABLE `academic_years`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `achievements`
--
ALTER TABLE `achievements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `admission_phases`
--
ALTER TABLE `admission_phases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `admission_quotas`
--
ALTER TABLE `admission_quotas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `albums`
--
ALTER TABLE `albums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `class_groups`
--
ALTER TABLE `class_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `class_group_settings`
--
ALTER TABLE `class_group_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `class_group_students`
--
ALTER TABLE `class_group_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT untuk tabel `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `image_sliders`
--
ALTER TABLE `image_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `links`
--
ALTER TABLE `links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `majors`
--
ALTER TABLE `majors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT untuk tabel `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pollings`
--
ALTER TABLE `pollings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `scholarships`
--
ALTER TABLE `scholarships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT untuk tabel `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT untuk tabel `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `themes`
--
ALTER TABLE `themes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user_privileges`
--
ALTER TABLE `user_privileges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
