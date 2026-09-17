-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 17 Sep 2026 pada 00.59
-- Versi server: 26.7.0
-- Versi PHP: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helpdesk_dev`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6', 'i:1;', 1789605753),
('laravel-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6:timer', 'i:1789605753;', 1789605753),
('laravel-cache-spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:62:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:12:\"ViewAny:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:9:\"View:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:11:\"Create:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:11:\"Update:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:11:\"Delete:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:14:\"DeleteAny:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:12:\"Restore:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:16:\"ForceDelete:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:19:\"ForceDeleteAny:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:15:\"RestoreAny:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:14:\"Replicate:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:12:\"Reorder:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:21:\"ViewAny:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:18:\"View:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:20:\"Create:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:20:\"Update:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:20:\"Delete:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:23:\"DeleteAny:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:21:\"Restore:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:25:\"ForceDelete:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:28:\"ForceDeleteAny:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:24:\"RestoreAny:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:23:\"Replicate:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:21:\"Reorder:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:22:\"ViewAny:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:19:\"View:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:4;i:2;i:5;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:21:\"Create:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:4;i:2;i:5;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:21:\"Update:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:4;i:2;i:5;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:21:\"Delete:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:24:\"DeleteAny:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:22:\"Restore:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:26:\"ForceDelete:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:29:\"ForceDeleteAny:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:25:\"RestoreAny:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:24:\"Replicate:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:22:\"Reorder:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:12:\"ViewAny:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:9:\"View:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:11:\"Create:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:11:\"Update:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:11:\"Delete:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:14:\"DeleteAny:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:12:\"Restore:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:43;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:16:\"ForceDelete:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:44;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:19:\"ForceDeleteAny:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:45;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:15:\"RestoreAny:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:46;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:14:\"Replicate:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:47;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:12:\"Reorder:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:48;a:4:{s:1:\"a\";i:49;s:1:\"b\";s:19:\"View:AdminDashboard\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:49;a:4:{s:1:\"a\";i:50;s:1:\"b\";s:21:\"View:TeknisiDashboard\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:5;}}i:50;a:4:{s:1:\"a\";i:51;s:1:\"b\";s:20:\"ViewAny:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:51;a:4:{s:1:\"a\";i:52;s:1:\"b\";s:17:\"View:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:52;a:4:{s:1:\"a\";i:53;s:1:\"b\";s:19:\"Create:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:53;a:4:{s:1:\"a\";i:54;s:1:\"b\";s:19:\"Update:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:54;a:4:{s:1:\"a\";i:55;s:1:\"b\";s:19:\"Delete:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:55;a:4:{s:1:\"a\";i:56;s:1:\"b\";s:22:\"DeleteAny:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:56;a:4:{s:1:\"a\";i:57;s:1:\"b\";s:20:\"Restore:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:57;a:4:{s:1:\"a\";i:58;s:1:\"b\";s:24:\"ForceDelete:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:58;a:4:{s:1:\"a\";i:59;s:1:\"b\";s:27:\"ForceDeleteAny:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:59;a:4:{s:1:\"a\";i:60;s:1:\"b\";s:23:\"RestoreAny:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:60;a:4:{s:1:\"a\";i:61;s:1:\"b\";s:22:\"Replicate:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:61;a:4:{s:1:\"a\";i:62;s:1:\"b\";s:20:\"Reorder:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}}s:5:\"roles\";a:4:{i:0;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:5:\"admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:5;s:1:\"b\";s:11:\"super_admin\";s:1:\"c\";s:3:\"web\";}i:2;a:3:{s:1:\"a\";i:4;s:1:\"b\";s:7:\"pemohon\";s:1:\"c\";s:3:\"web\";}i:3;a:3:{s:1:\"a\";i:3;s:1:\"b\";s:7:\"teknisi\";s:1:\"c\";s:3:\"web\";}}}', 1789692095);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(386, 'default', '{\"uuid\":\"929b7c22-d0b5-4897-ab76-da41c3eefb20\",\"displayName\":\"App\\\\Notifications\\\\HelpdeskNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:5;}s:9:\\\"relations\\\";a:1:{i:0;s:5:\\\"roles\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:38:\\\"App\\\\Notifications\\\\HelpdeskNotification\\\":10:{s:4:\\\"type\\\";s:16:\\\"pengajuan.status\\\";s:5:\\\"title\\\";s:35:\\\"Status PJB-07092026-0001 Diperbarui\\\";s:7:\\\"message\\\";s:63:\\\"Status PJB-07092026-0001 berubah dari Open menjadi In Progress.\\\";s:4:\\\"kode\\\";s:17:\\\"PJB-07092026-0001\\\";s:3:\\\"url\\\";s:49:\\\"http:\\/\\/helpdesk.test\\/pemohon\\/pengajuan-barang\\/105\\\";s:4:\\\"icon\\\";s:21:\\\"heroicon-o-arrow-path\\\";s:5:\\\"color\\\";s:7:\\\"warning\\\";s:11:\\\"referenceId\\\";s:3:\\\"105\\\";s:4:\\\"data\\\";a:4:{s:10:\\\"old_status\\\";s:4:\\\"Open\\\";s:10:\\\"new_status\\\";s:11:\\\"In Progress\\\";s:7:\\\"message\\\";s:63:\\\"Status PJB-07092026-0001 berubah dari Open menjadi In Progress.\\\";s:6:\\\"log_id\\\";i:64;}s:2:\\\"id\\\";s:36:\\\"b6259a24-1780-4bf1-a7e2-5daf5e089434\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}}\",\"batchId\":null},\"createdAt\":1789605919,\"delay\":null}', 0, NULL, 1789605919, 1789605919),
(387, 'default', '{\"uuid\":\"97ab9d20-5265-470f-9811-4d6a466d7c94\",\"displayName\":\"App\\\\Notifications\\\\HelpdeskNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:5;}s:9:\\\"relations\\\";a:1:{i:0;s:5:\\\"roles\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:38:\\\"App\\\\Notifications\\\\HelpdeskNotification\\\":10:{s:4:\\\"type\\\";s:16:\\\"pengajuan.status\\\";s:5:\\\"title\\\";s:35:\\\"Status PJB-07092026-0001 Diperbarui\\\";s:7:\\\"message\\\";s:63:\\\"Status PJB-07092026-0001 berubah dari Open menjadi In Progress.\\\";s:4:\\\"kode\\\";s:17:\\\"PJB-07092026-0001\\\";s:3:\\\"url\\\";s:49:\\\"http:\\/\\/helpdesk.test\\/pemohon\\/pengajuan-barang\\/105\\\";s:4:\\\"icon\\\";s:21:\\\"heroicon-o-arrow-path\\\";s:5:\\\"color\\\";s:7:\\\"warning\\\";s:11:\\\"referenceId\\\";s:3:\\\"105\\\";s:4:\\\"data\\\";a:4:{s:10:\\\"old_status\\\";s:4:\\\"Open\\\";s:10:\\\"new_status\\\";s:11:\\\"In Progress\\\";s:7:\\\"message\\\";s:63:\\\"Status PJB-07092026-0001 berubah dari Open menjadi In Progress.\\\";s:6:\\\"log_id\\\";i:64;}s:2:\\\"id\\\";s:36:\\\"b6259a24-1780-4bf1-a7e2-5daf5e089434\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:9:\\\"broadcast\\\";}}\",\"batchId\":null},\"createdAt\":1789605919,\"delay\":null}', 0, NULL, 1789605919, 1789605919),
(388, 'default', '{\"uuid\":\"098edb45-88c8-4e3b-84ca-80a1c289f076\",\"displayName\":\"App\\\\Notifications\\\\HelpdeskNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:1:{i:0;s:5:\\\"roles\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:38:\\\"App\\\\Notifications\\\\HelpdeskNotification\\\":10:{s:4:\\\"type\\\";s:16:\\\"pengajuan.status\\\";s:5:\\\"title\\\";s:35:\\\"Status PJB-07092026-0001 Diperbarui\\\";s:7:\\\"message\\\";s:63:\\\"Status PJB-07092026-0001 berubah dari Open menjadi In Progress.\\\";s:4:\\\"kode\\\";s:17:\\\"PJB-07092026-0001\\\";s:3:\\\"url\\\";s:47:\\\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\\\";s:4:\\\"icon\\\";s:21:\\\"heroicon-o-arrow-path\\\";s:5:\\\"color\\\";s:7:\\\"warning\\\";s:11:\\\"referenceId\\\";s:3:\\\"105\\\";s:4:\\\"data\\\";a:4:{s:10:\\\"old_status\\\";s:4:\\\"Open\\\";s:10:\\\"new_status\\\";s:11:\\\"In Progress\\\";s:7:\\\"message\\\";s:63:\\\"Status PJB-07092026-0001 berubah dari Open menjadi In Progress.\\\";s:6:\\\"log_id\\\";i:64;}s:2:\\\"id\\\";s:36:\\\"ac7ab2bb-60a1-4f11-bd46-912dc4bf90b9\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}}\",\"batchId\":null},\"createdAt\":1789605919,\"delay\":null}', 0, NULL, 1789605919, 1789605919),
(389, 'default', '{\"uuid\":\"c4b9d051-608d-4804-b2e8-3dd68e5103c1\",\"displayName\":\"App\\\\Notifications\\\\HelpdeskNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:1:{i:0;s:5:\\\"roles\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:38:\\\"App\\\\Notifications\\\\HelpdeskNotification\\\":10:{s:4:\\\"type\\\";s:16:\\\"pengajuan.status\\\";s:5:\\\"title\\\";s:35:\\\"Status PJB-07092026-0001 Diperbarui\\\";s:7:\\\"message\\\";s:63:\\\"Status PJB-07092026-0001 berubah dari Open menjadi In Progress.\\\";s:4:\\\"kode\\\";s:17:\\\"PJB-07092026-0001\\\";s:3:\\\"url\\\";s:47:\\\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\\\";s:4:\\\"icon\\\";s:21:\\\"heroicon-o-arrow-path\\\";s:5:\\\"color\\\";s:7:\\\"warning\\\";s:11:\\\"referenceId\\\";s:3:\\\"105\\\";s:4:\\\"data\\\";a:4:{s:10:\\\"old_status\\\";s:4:\\\"Open\\\";s:10:\\\"new_status\\\";s:11:\\\"In Progress\\\";s:7:\\\"message\\\";s:63:\\\"Status PJB-07092026-0001 berubah dari Open menjadi In Progress.\\\";s:6:\\\"log_id\\\";i:64;}s:2:\\\"id\\\";s:36:\\\"ac7ab2bb-60a1-4f11-bd46-912dc4bf90b9\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:9:\\\"broadcast\\\";}}\",\"batchId\":null},\"createdAt\":1789605919,\"delay\":null}', 0, NULL, 1789605919, 1789605919),
(390, 'default', '{\"uuid\":\"a7bed820-bc92-40e1-a83f-f4619125c60b\",\"displayName\":\"App\\\\Notifications\\\\HelpdeskNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:2;}s:9:\\\"relations\\\";a:1:{i:0;s:5:\\\"roles\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:38:\\\"App\\\\Notifications\\\\HelpdeskNotification\\\":10:{s:4:\\\"type\\\";s:16:\\\"pengajuan.status\\\";s:5:\\\"title\\\";s:35:\\\"Status PJB-07092026-0001 Diperbarui\\\";s:7:\\\"message\\\";s:63:\\\"Status PJB-07092026-0001 berubah dari Open menjadi In Progress.\\\";s:4:\\\"kode\\\";s:17:\\\"PJB-07092026-0001\\\";s:3:\\\"url\\\";s:47:\\\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\\\";s:4:\\\"icon\\\";s:21:\\\"heroicon-o-arrow-path\\\";s:5:\\\"color\\\";s:7:\\\"warning\\\";s:11:\\\"referenceId\\\";s:3:\\\"105\\\";s:4:\\\"data\\\";a:4:{s:10:\\\"old_status\\\";s:4:\\\"Open\\\";s:10:\\\"new_status\\\";s:11:\\\"In Progress\\\";s:7:\\\"message\\\";s:63:\\\"Status PJB-07092026-0001 berubah dari Open menjadi In Progress.\\\";s:6:\\\"log_id\\\";i:64;}s:2:\\\"id\\\";s:36:\\\"c163ae01-b051-4109-b3a8-2cdbbed75f8d\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}}\",\"batchId\":null},\"createdAt\":1789605919,\"delay\":null}', 0, NULL, 1789605919, 1789605919),
(391, 'default', '{\"uuid\":\"7fe3e482-b491-400d-b603-70da7b6b559f\",\"displayName\":\"App\\\\Notifications\\\\HelpdeskNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:2;}s:9:\\\"relations\\\";a:1:{i:0;s:5:\\\"roles\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:38:\\\"App\\\\Notifications\\\\HelpdeskNotification\\\":10:{s:4:\\\"type\\\";s:16:\\\"pengajuan.status\\\";s:5:\\\"title\\\";s:35:\\\"Status PJB-07092026-0001 Diperbarui\\\";s:7:\\\"message\\\";s:63:\\\"Status PJB-07092026-0001 berubah dari Open menjadi In Progress.\\\";s:4:\\\"kode\\\";s:17:\\\"PJB-07092026-0001\\\";s:3:\\\"url\\\";s:47:\\\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\\\";s:4:\\\"icon\\\";s:21:\\\"heroicon-o-arrow-path\\\";s:5:\\\"color\\\";s:7:\\\"warning\\\";s:11:\\\"referenceId\\\";s:3:\\\"105\\\";s:4:\\\"data\\\";a:4:{s:10:\\\"old_status\\\";s:4:\\\"Open\\\";s:10:\\\"new_status\\\";s:11:\\\"In Progress\\\";s:7:\\\"message\\\";s:63:\\\"Status PJB-07092026-0001 berubah dari Open menjadi In Progress.\\\";s:6:\\\"log_id\\\";i:64;}s:2:\\\"id\\\";s:36:\\\"c163ae01-b051-4109-b3a8-2cdbbed75f8d\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:9:\\\"broadcast\\\";}}\",\"batchId\":null},\"createdAt\":1789605919,\"delay\":null}', 0, NULL, 1789605919, 1789605919),
(392, 'default', '{\"uuid\":\"9e94b23c-c47c-49cf-a6f5-5fd222fcedb8\",\"displayName\":\"App\\\\Notifications\\\\HelpdeskNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:7;}s:9:\\\"relations\\\";a:1:{i:0;s:5:\\\"roles\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:38:\\\"App\\\\Notifications\\\\HelpdeskNotification\\\":10:{s:4:\\\"type\\\";s:16:\\\"pengajuan.status\\\";s:5:\\\"title\\\";s:35:\\\"Status PJB-07092026-0001 Diperbarui\\\";s:7:\\\"message\\\";s:63:\\\"Status PJB-07092026-0001 berubah dari Open menjadi In Progress.\\\";s:4:\\\"kode\\\";s:17:\\\"PJB-07092026-0001\\\";s:3:\\\"url\\\";s:47:\\\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\\\";s:4:\\\"icon\\\";s:21:\\\"heroicon-o-arrow-path\\\";s:5:\\\"color\\\";s:7:\\\"warning\\\";s:11:\\\"referenceId\\\";s:3:\\\"105\\\";s:4:\\\"data\\\";a:4:{s:10:\\\"old_status\\\";s:4:\\\"Open\\\";s:10:\\\"new_status\\\";s:11:\\\"In Progress\\\";s:7:\\\"message\\\";s:63:\\\"Status PJB-07092026-0001 berubah dari Open menjadi In Progress.\\\";s:6:\\\"log_id\\\";i:64;}s:2:\\\"id\\\";s:36:\\\"cc00b94b-b292-4687-9108-1a6c048a7cf2\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}}\",\"batchId\":null},\"createdAt\":1789605919,\"delay\":null}', 0, NULL, 1789605919, 1789605919),
(393, 'default', '{\"uuid\":\"b7bd8c27-4534-4661-9729-14fc4eb5b60b\",\"displayName\":\"App\\\\Notifications\\\\HelpdeskNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:7;}s:9:\\\"relations\\\";a:1:{i:0;s:5:\\\"roles\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:38:\\\"App\\\\Notifications\\\\HelpdeskNotification\\\":10:{s:4:\\\"type\\\";s:16:\\\"pengajuan.status\\\";s:5:\\\"title\\\";s:35:\\\"Status PJB-07092026-0001 Diperbarui\\\";s:7:\\\"message\\\";s:63:\\\"Status PJB-07092026-0001 berubah dari Open menjadi In Progress.\\\";s:4:\\\"kode\\\";s:17:\\\"PJB-07092026-0001\\\";s:3:\\\"url\\\";s:47:\\\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\\\";s:4:\\\"icon\\\";s:21:\\\"heroicon-o-arrow-path\\\";s:5:\\\"color\\\";s:7:\\\"warning\\\";s:11:\\\"referenceId\\\";s:3:\\\"105\\\";s:4:\\\"data\\\";a:4:{s:10:\\\"old_status\\\";s:4:\\\"Open\\\";s:10:\\\"new_status\\\";s:11:\\\"In Progress\\\";s:7:\\\"message\\\";s:63:\\\"Status PJB-07092026-0001 berubah dari Open menjadi In Progress.\\\";s:6:\\\"log_id\\\";i:64;}s:2:\\\"id\\\";s:36:\\\"cc00b94b-b292-4687-9108-1a6c048a7cf2\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:9:\\\"broadcast\\\";}}\",\"batchId\":null},\"createdAt\":1789605919,\"delay\":null}', 0, NULL, 1789605919, 1789605919),
(394, 'default', '{\"uuid\":\"9a05665e-9c7a-471e-ac66-86ac64014955\",\"displayName\":\"App\\\\Notifications\\\\HelpdeskNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:5;}s:9:\\\"relations\\\";a:1:{i:0;s:5:\\\"roles\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:38:\\\"App\\\\Notifications\\\\HelpdeskNotification\\\":10:{s:4:\\\"type\\\";s:14:\\\"pengajuan.chat\\\";s:5:\\\"title\\\";s:31:\\\"Pesan Baru · PJB-07092026-0001\\\";s:7:\\\"message\\\";s:48:\\\"Teknisi Edi Purwanto, S.Kom mengambil tiket ini.\\\";s:4:\\\"kode\\\";s:17:\\\"PJB-07092026-0001\\\";s:3:\\\"url\\\";s:49:\\\"http:\\/\\/helpdesk.test\\/pemohon\\/pengajuan-barang\\/105\\\";s:4:\\\"icon\\\";s:33:\\\"heroicon-o-chat-bubble-left-right\\\";s:5:\\\"color\\\";s:4:\\\"info\\\";s:11:\\\"referenceId\\\";s:3:\\\"105\\\";s:4:\\\"data\\\";a:4:{s:7:\\\"message\\\";s:48:\\\"Teknisi Edi Purwanto, S.Kom mengambil tiket ini.\\\";s:9:\\\"sender_id\\\";i:3;s:11:\\\"sender_name\\\";s:19:\\\"Edi Purwanto, S.Kom\\\";s:6:\\\"log_id\\\";i:65;}s:2:\\\"id\\\";s:36:\\\"219d11d5-3675-4171-8f0f-f48b804c01f4\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}}\",\"batchId\":null},\"createdAt\":1789605919,\"delay\":null}', 0, NULL, 1789605919, 1789605919),
(395, 'default', '{\"uuid\":\"e7610a94-7281-49e3-97b8-8b3f89cec9f1\",\"displayName\":\"App\\\\Notifications\\\\HelpdeskNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:5;}s:9:\\\"relations\\\";a:1:{i:0;s:5:\\\"roles\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:38:\\\"App\\\\Notifications\\\\HelpdeskNotification\\\":10:{s:4:\\\"type\\\";s:14:\\\"pengajuan.chat\\\";s:5:\\\"title\\\";s:31:\\\"Pesan Baru · PJB-07092026-0001\\\";s:7:\\\"message\\\";s:48:\\\"Teknisi Edi Purwanto, S.Kom mengambil tiket ini.\\\";s:4:\\\"kode\\\";s:17:\\\"PJB-07092026-0001\\\";s:3:\\\"url\\\";s:49:\\\"http:\\/\\/helpdesk.test\\/pemohon\\/pengajuan-barang\\/105\\\";s:4:\\\"icon\\\";s:33:\\\"heroicon-o-chat-bubble-left-right\\\";s:5:\\\"color\\\";s:4:\\\"info\\\";s:11:\\\"referenceId\\\";s:3:\\\"105\\\";s:4:\\\"data\\\";a:4:{s:7:\\\"message\\\";s:48:\\\"Teknisi Edi Purwanto, S.Kom mengambil tiket ini.\\\";s:9:\\\"sender_id\\\";i:3;s:11:\\\"sender_name\\\";s:19:\\\"Edi Purwanto, S.Kom\\\";s:6:\\\"log_id\\\";i:65;}s:2:\\\"id\\\";s:36:\\\"219d11d5-3675-4171-8f0f-f48b804c01f4\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:9:\\\"broadcast\\\";}}\",\"batchId\":null},\"createdAt\":1789605919,\"delay\":null}', 0, NULL, 1789605919, 1789605919);

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_data_pengajuan_barang`
--

CREATE TABLE `log_data_pengajuan_barang` (
  `id` int NOT NULL,
  `pengajuan_id` int NOT NULL,
  `user_id` int NOT NULL,
  `kategori_log` enum('Status','Chat','Update Data','Delete Data') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `data_lama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `data_baru` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `keterangan` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `log_data_pengajuan_barang`
--

INSERT INTO `log_data_pengajuan_barang` (`id`, `pengajuan_id`, `user_id`, `kategori_log`, `data_lama`, `data_baru`, `keterangan`, `created_at`) VALUES
(2, 2, 7, 'Status', NULL, 'Open', 'Pengajuan dibuat', '2026-06-03 17:09:35'),
(3, 2, 3, 'Status', 'Close', 'In Progress', '[REOPEN] test', '2026-06-15 03:52:49'),
(4, 2, 3, 'Status', 'In Progress', 'Close', '[SELESAI] Barang sudah bisa diambil.', '2026-06-15 03:53:01'),
(7, 3, 1, 'Status', NULL, 'Open', 'Pengajuan Barang telah dibuat', '2026-06-15 06:40:24'),
(8, 3, 1, 'Status', 'Open', 'In Progress', 'Pengajuan Barang telah ditangani Oleh Fithnan', '2026-06-15 06:43:28'),
(9, 3, 1, 'Status', 'In Progress', 'Close', '[SELESAI] Barang Bisa diambil.', '2026-06-15 06:44:00'),
(10, 4, 1, 'Status', NULL, 'Open', 'Pengajuan Barang telah dibuat', '2026-06-29 03:50:16'),
(11, 3, 7, 'Delete Data', NULL, NULL, 'Pengajuan barang telah dihapus (soft Delete)AdminSuper', '2026-07-05 20:20:02'),
(12, 4, 7, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan oleh AdminSuper', '2026-07-06 18:27:22'),
(13, 4, 7, 'Chat', NULL, NULL, 'Teknisi AdminSuper mengambil tiket ini.', '2026-07-06 18:27:22'),
(14, 4, 7, 'Status', 'In Progress', 'Close', '[SELESAI] Barang sudah bisa di ambil ke ruangan Logistik', '2026-07-09 19:15:27'),
(15, 5, 7, 'Status', NULL, 'Open', 'Pengajuan Barang telah dibuat', '2026-07-20 21:32:50'),
(16, 5, 1, 'Chat', NULL, NULL, 'd', '2026-08-17 19:43:17'),
(17, 5, 5, 'Chat', NULL, NULL, 'd', '2026-08-17 19:45:43'),
(18, 6, 4, 'Status', NULL, 'Open', 'Pengajuan dibuat', '2026-08-19 19:03:53'),
(19, 6, 4, 'Update Data', 'COBA', 'COBA barang', 'Data telah diperbarui oleh pemohon', '2026-08-19 19:04:03'),
(20, 6, 4, 'Update Data', 'COBA', 'COBAfff', 'Data telah diperbarui oleh pemohon', '2026-08-19 19:04:03'),
(21, 6, 7, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan oleh AdminSuper', '2026-08-19 19:04:43'),
(22, 6, 7, 'Chat', NULL, NULL, 'Teknisi AdminSuper mengambil tiket ini.', '2026-08-19 19:04:43'),
(23, 7, 4, 'Status', NULL, 'Open', 'Pengajuan dibuat', '2026-08-19 19:20:17'),
(24, 7, 4, 'Update Data', 'coba', 'ateafea', 'Nama Barang diperbarui oleh pemohon', '2026-08-19 19:55:14'),
(25, 7, 4, 'Update Data', '1', '15', 'Jumlah diperbarui oleh pemohon', '2026-08-19 19:55:14'),
(26, 7, 4, 'Update Data', 'coba\n', 'taefae', 'Alasan diperbarui oleh pemohon', '2026-08-19 19:55:14'),
(27, 6, 4, 'Chat', NULL, NULL, 'inafgaengo', '2026-08-21 23:29:33'),
(28, 6, 7, 'Chat', NULL, NULL, 'amote', '2026-08-21 23:30:50'),
(29, 6, 1, 'Status', 'In Progress', 'Close', '[DITOLAK] Barang tidak dapat ditemukan', '2026-08-22 09:45:16'),
(30, 7, 4, 'Chat', NULL, NULL, 'd', '2026-08-23 19:28:14'),
(53, 53, 4, 'Status', NULL, 'Open', 'Pengajuan dibuat', '2026-09-03 02:27:48'),
(54, 53, 4, 'Chat', NULL, NULL, 'fasfa', '2026-09-03 02:28:03'),
(55, 53, 4, 'Delete Data', 'Open', 'Deleted', 'Pengajuan barang telah dihapus oleh Eko', '2026-09-03 02:42:17'),
(56, 54, 4, 'Status', NULL, 'Open', 'Pengajuan dibuat', '2026-09-03 02:46:08'),
(57, 54, 4, 'Delete Data', 'Open', 'Deleted', 'Pengajuan barang telah dihapus oleh Eko', '2026-09-03 02:46:26'),
(58, 104, 5, 'Status', NULL, 'Open', 'Pengajuan dibuat', '2026-09-07 12:07:33'),
(59, 104, 5, 'Chat', NULL, NULL, 'd', '2026-09-07 12:11:15'),
(60, 104, 5, 'Chat', NULL, NULL, 'd', '2026-09-07 12:15:13'),
(61, 105, 5, 'Status', NULL, 'Open', 'Pengajuan dibuat', '2026-09-07 12:16:15'),
(62, 105, 5, 'Chat', NULL, NULL, 'd', '2026-09-07 12:21:17'),
(63, 104, 5, 'Delete Data', 'Open', 'Deleted', 'Pengajuan barang telah dihapus oleh Annas Syaifudin', '2026-09-07 12:43:54'),
(64, 105, 3, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan oleh Edi Purwanto, S.Kom', '2026-09-17 00:45:19'),
(65, 105, 3, 'Chat', NULL, NULL, 'Teknisi Edi Purwanto, S.Kom mengambil tiket ini.', '2026-09-17 00:45:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_data_tiket_perbaikan`
--

CREATE TABLE `log_data_tiket_perbaikan` (
  `id` int NOT NULL,
  `tiket_id` int NOT NULL,
  `user_id` int NOT NULL,
  `kategori_log` enum('Status','Chat','Update Data','Delete Data') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `data_lama` varchar(255) DEFAULT NULL,
  `data_baru` varchar(255) DEFAULT NULL,
  `keterangan` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `log_data_tiket_perbaikan`
--

INSERT INTO `log_data_tiket_perbaikan` (`id`, `tiket_id`, `user_id`, `kategori_log`, `data_lama`, `data_baru`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 'Status', NULL, 'Open', 'Tiket dibuat oleh Pemohon.', '2026-04-20 01:00:00', '2026-06-01 02:40:11'),
(2, 1, 1, 'Status', 'Open', 'In Progress', 'Fithnan sedang mengecek PC.', '2026-04-20 01:30:00', '2026-06-01 02:40:11'),
(3, 1, 1, 'Status', 'In Progress', 'Close', 'PC sudah direstart dan normal kembali.', '2026-04-20 02:30:00', '2026-06-01 02:40:11'),
(4, 2, 4, 'Status', NULL, 'Open', 'Tiket dibuat oleh Pemohon.', '2026-04-20 03:00:00', '2026-06-01 02:40:11'),
(5, 2, 2, 'Status', 'Open', 'In Progress', 'Sulistyo mengecek switch hub.', '2026-04-20 03:15:00', '2026-06-01 02:40:11'),
(6, 5, 7, 'Status', NULL, 'Open', 'Tiket dibuat', '2026-06-01 02:40:21', '2026-06-01 02:40:21'),
(7, 6, 7, 'Status', NULL, 'Open', 'Tiket dibuat', '2026-06-01 03:04:38', '2026-06-01 03:04:38'),
(8, 7, 7, 'Status', NULL, 'Open', 'Tiket dibuat', '2026-06-02 00:26:38', '2026-06-02 00:26:38'),
(9, 2, 7, 'Status', 'In Progress', 'Close', '[SELESAI]Jaringan sudah selesai diperbaiki', '2026-06-10 23:26:32', '2026-06-10 23:26:32'),
(10, 7, 7, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan', '2026-06-10 23:27:53', '2026-06-10 23:27:53'),
(11, 7, 7, 'Status', 'In Progress', 'Close', '[DITOLAK] Printer tidak bisa diperbaiki', '2026-06-10 23:28:08', '2026-06-10 23:28:08'),
(12, 5, 7, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan', '2026-06-10 23:28:25', '2026-06-10 23:28:25'),
(13, 4, 7, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan', '2026-06-10 23:28:26', '2026-06-10 23:28:26'),
(14, 3, 1, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan', '2026-06-10 23:29:04', '2026-06-10 23:29:04'),
(15, 6, 1, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan', '2026-06-10 23:30:48', '2026-06-10 23:30:48'),
(16, 1, 2, 'Chat', NULL, NULL, 'Tes', '2026-06-11 08:26:50', '2026-06-11 08:26:50'),
(17, 6, 2, 'Status', 'In Progress', 'Close', '[SELESAI] Printer Sudah siap dipakai. Silahkan Di ambil ke tempat Teknisi', '2026-06-11 09:14:18', '2026-06-11 09:14:18'),
(18, 2, 2, 'Status', 'Close', 'In Progress', '[REOPEN] Jaringan Mati Kembali', '2026-06-11 09:31:26', '2026-06-11 09:31:26'),
(19, 2, 2, 'Status', 'In Progress', 'Close', '[SELESAI] Selesai Diperbaiki', '2026-06-11 09:31:58', '2026-06-11 09:31:58'),
(20, 1, 2, 'Status', 'Close', 'In Progress', '[REOPEN] Pc Kembali rusak', '2026-06-11 09:32:17', '2026-06-11 09:32:17'),
(21, 1, 2, 'Status', 'In Progress', 'Close', '[SELESAI] diperbaiki, ganti RAM dan PSU karena kurang daya.', '2026-06-11 09:33:33', '2026-06-11 09:33:33'),
(22, 4, 7, 'Status', 'In Progress', 'Close', '[SELESAI] Perbaikan Telah selesai.', '2026-06-15 02:21:36', '2026-06-15 02:21:36'),
(23, 4, 7, 'Status', 'Close', 'In Progress', '[REOPEN] Pc kembali rusak.', '2026-06-15 02:22:21', '2026-06-15 02:22:21'),
(24, 1, 7, 'Chat', NULL, NULL, 'Ceks', '2026-06-15 03:26:18', '2026-06-15 03:26:18'),
(25, 8, 1, 'Status', NULL, 'Open', 'Tiket dibuat', '2026-06-15 06:36:07', '2026-06-15 06:36:07'),
(26, 8, 1, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan oleh Fithnan', '2026-06-15 06:36:30', '2026-06-15 06:36:30'),
(27, 9, 7, 'Status', NULL, 'Open', 'Tiket dibuat', '2026-06-17 12:24:00', '2026-06-17 12:24:00'),
(28, 9, 7, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan oleh AdminSuper', '2026-06-25 03:50:18', '2026-06-25 03:50:18'),
(29, 9, 7, 'Status', 'In Progress', 'In Progress', 'Tiket mulai dikerjakan oleh AdminSuper', '2026-06-25 03:50:18', '2026-06-25 03:50:18'),
(30, 9, 7, 'Chat', NULL, NULL, 'Teknisi AdminSuper mengambil tiket ini.', '2026-06-25 03:50:18', '2026-06-25 03:50:18'),
(31, 10, 1, 'Status', NULL, 'Open', 'Tiket dibuat', '2026-06-25 04:15:36', '2026-06-25 04:15:36'),
(32, 5, 7, 'Status', 'In Progress', 'Close', '[SELESAI] Done', '2026-06-26 02:00:08', '2026-06-26 02:00:08'),
(33, 10, 7, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan oleh AdminSuper', '2026-06-26 02:02:25', '2026-06-26 02:02:25'),
(34, 10, 7, 'Status', 'In Progress', 'In Progress', 'Tiket mulai dikerjakan oleh AdminSuper', '2026-06-26 02:02:25', '2026-06-26 02:02:25'),
(35, 10, 7, 'Chat', NULL, NULL, 'Teknisi AdminSuper mengambil tiket ini.', '2026-06-26 02:02:25', '2026-06-26 02:02:25'),
(36, 6, 7, 'Delete Data', NULL, NULL, 'Tiket dihapus (Soft Delete)AdminSuper', '2026-06-29 01:12:16', '2026-06-29 01:12:16'),
(37, 5, 7, 'Delete Data', NULL, NULL, 'Tiket telah dihapus olehAdminSuper', '2026-06-29 01:43:40', '2026-06-29 01:43:40'),
(38, 6, 7, 'Delete Data', NULL, NULL, 'Tiket telah dihapus olehAdminSuper', '2026-06-29 01:43:44', '2026-06-29 01:43:44'),
(39, 11, 7, 'Status', NULL, 'Open', 'Tiket dibuat', '2026-07-20 21:31:34', '2026-07-20 21:31:34'),
(40, 12, 4, 'Status', NULL, 'Open', 'Tiket dibuat', '2026-08-13 21:02:06', '2026-08-13 21:02:06'),
(41, 12, 4, 'Delete Data', 'Open', 'Deleted', 'Tiket dibatalkan oleh Eko', '2026-08-13 21:02:13', '2026-08-13 21:02:13'),
(42, 12, 4, 'Chat', NULL, NULL, 'dsafwa', '2026-08-13 22:31:04', '2026-08-13 22:31:04'),
(43, 12, 4, 'Chat', NULL, NULL, 'rward', '2026-08-13 22:31:11', '2026-08-13 22:31:11'),
(44, 12, 4, 'Chat', NULL, NULL, 'teo', '2026-08-13 22:53:16', '2026-08-13 22:53:16'),
(45, 12, 7, 'Chat', NULL, NULL, '521sd', '2026-08-14 01:51:51', '2026-08-14 01:51:51'),
(46, 12, 4, 'Chat', NULL, NULL, 'fwauhgujbeag', '2026-08-14 02:03:50', '2026-08-14 02:03:50'),
(47, 9, 5, 'Chat', NULL, NULL, 'ningise', '2026-08-17 18:18:16', '2026-08-17 18:18:16'),
(48, 13, 5, 'Status', NULL, 'Open', 'Tiket dibuat', '2026-08-17 18:31:16', '2026-08-17 18:31:16'),
(49, 13, 5, 'Chat', NULL, NULL, 'Institut Widya Pratama merupakan lembaga pendidikan tinggi yang membutuhkan pengelolaan serta pemeliharaan infrastruktur fisik maupun IT secara handal guna mendukung kegiatan akademik dan administratif. Saat ini, proses pengaduan, pencatatan kerusakan, serta permohonan perawatan infrastruktur pada Bidang Pelayanan dan Perawatan Infrastruktur masih menghadapi kendala operasional, seperti pelaporan yang belum terpusat, pencatatan manual, sulitnya melakukan pemantauan (tracking) status perbaikan, dan ketiadaan riwayat penanganan (history log) yang terstruktur.', '2026-08-17 18:31:30', '2026-08-17 18:31:30'),
(50, 13, 1, 'Chat', NULL, NULL, 'Membangun Sistem Informasi Manajemen Pelayanan Internal (Helpdesk) yang terintegrasi untuk mengelola pengaduan dan pemeliharaan infrastruktur.  Menerapkan sistem pada unit mitra melalui tahap migrasi data, pelatihan pengguna, uji coba, dan pendampingan awal.  Menganalisis dan mengevaluasi dampak kebermanfaatan penerapan solusi teknologi tepat guna dalam meningkatkan mutu pelayanan internal kampus.', '2026-08-17 18:35:10', '2026-08-17 18:35:10'),
(52, 13, 5, 'Chat', NULL, NULL, 'test', '2026-09-07 12:02:49', '2026-09-07 12:02:49'),
(53, 13, 5, 'Chat', NULL, NULL, 'dd', '2026-09-07 12:03:04', '2026-09-07 12:03:04'),
(54, 13, 7, 'Chat', NULL, NULL, 'd', '2026-09-07 12:03:21', '2026-09-07 12:03:21'),
(55, 13, 5, 'Chat', NULL, NULL, 'd', '2026-09-07 12:06:52', '2026-09-07 12:06:52'),
(56, 13, 7, 'Chat', NULL, NULL, 'd', '2026-09-07 12:06:57', '2026-09-07 12:06:57'),
(57, 13, 7, 'Chat', NULL, NULL, 'd', '2026-09-07 12:07:12', '2026-09-07 12:07:12'),
(58, 13, 5, 'Chat', NULL, NULL, 'd', '2026-09-07 12:07:15', '2026-09-07 12:07:15'),
(59, 13, 1, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan oleh Fithnan', '2026-09-07 12:24:45', '2026-09-07 12:24:45'),
(60, 13, 5, 'Chat', NULL, NULL, 'tets', '2026-09-07 12:25:04', '2026-09-07 12:25:04'),
(61, 13, 1, 'Chat', NULL, NULL, 'de', '2026-09-07 12:25:13', '2026-09-07 12:25:13'),
(62, 11, 3, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan oleh Edi Purwanto, S.Kom', '2026-09-07 13:31:49', '2026-09-07 13:31:49'),
(63, 11, 3, 'Chat', NULL, NULL, 'Teknisi Edi Purwanto, S.Kom mengambil tiket ini.', '2026-09-07 13:31:49', '2026-09-07 13:31:49'),
(64, 12, 3, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan oleh Edi Purwanto, S.Kom', '2026-09-07 13:31:50', '2026-09-07 13:31:50'),
(65, 12, 3, 'Chat', NULL, NULL, 'Teknisi Edi Purwanto, S.Kom mengambil tiket ini.', '2026-09-07 13:31:50', '2026-09-07 13:31:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_harian_teknisi`
--

CREATE TABLE `log_harian_teknisi` (
  `id` int NOT NULL,
  `teknisi_id` int NOT NULL,
  `nama_petugas` text,
  `ruangan_id` int DEFAULT NULL,
  `tanggal` date NOT NULL,
  `deskripsi_kegiatan` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `log_harian_teknisi`
--

INSERT INTO `log_harian_teknisi` (`id`, `teknisi_id`, `nama_petugas`, `ruangan_id`, `tanggal`, `deskripsi_kegiatan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, NULL, NULL, '2026-04-20', 'Pengecekan PC LAB 6 dan maintenance rutin.', '2026-04-20 01:19:57', '2026-04-20 01:19:57', NULL),
(2, 1, NULL, NULL, '2026-07-19', 'Melakukan pengecekan rutin perangkat jaringan di ruang server dan memastikan seluruh perangkat berfungsi dengan baik.', '2026-07-23 02:04:07', '2026-07-23 02:04:07', NULL),
(3, 2, NULL, NULL, '2026-07-20', 'Melakukan perbaikan printer kantor yang mengalami paper jam serta melakukan pengujian setelah perbaikan.', '2026-07-23 02:04:07', '2026-07-23 02:04:07', NULL),
(4, 3, NULL, NULL, '2026-07-21', 'Melakukan instalasi aplikasi pendukung pada komputer pengguna beserta konfigurasi sesuai kebutuhan operasional.', '2026-07-23 02:04:07', '2026-07-23 02:04:07', NULL),
(5, 1, NULL, NULL, '2026-07-22', 'Menangani laporan gangguan koneksi internet pada beberapa unit kerja dan mengganti kabel LAN yang rusak.', '2026-07-23 02:04:07', '2026-07-23 02:04:07', NULL),
(6, 2, NULL, NULL, '2026-07-23', 'Melakukan backup data server harian, pengecekan kapasitas penyimpanan, serta dokumentasi hasil pekerjaan.', '2026-07-23 02:04:07', '2026-07-23 02:04:07', NULL),
(52, 7, NULL, NULL, '2026-09-01', 'aGaojge', '2026-08-31 18:55:40', '2026-08-31 18:55:40', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_ruangan`
--

CREATE TABLE `master_ruangan` (
  `id` int NOT NULL,
  `nama_ruangan` varchar(100) NOT NULL,
  `nama_gedung` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `master_ruangan`
--

INSERT INTO `master_ruangan` (`id`, `nama_ruangan`, `nama_gedung`, `created_at`, `updated_at`) VALUES
(1, 'Rektorat', 'Gedung Administrasi Lt.2', '2026-06-01 00:16:30', '2026-06-01 00:16:30'),
(2, 'Kaprodi', 'Ruang Dosen Gedung E Lt.2', '2026-06-01 00:16:30', '2026-06-01 00:16:30'),
(3, 'P3SDI', 'Gedung D Lt.2', '2026-06-01 00:16:30', '2026-06-01 00:16:30'),
(4, 'UPT Komputer', 'Gedung D Lt.2', '2026-06-01 00:16:30', '2026-06-01 00:16:30'),
(5, 'LAB 1', 'Gedung D Lt.2', '2026-06-01 00:16:30', '2026-06-01 00:16:30'),
(6, 'LAB 3', 'Gedung B Lt.2', '2026-06-01 00:16:30', '2026-06-01 00:16:30'),
(7, 'LAB 5', 'Gedung B Lt.2', '2026-06-01 00:16:30', '2026-06-01 00:16:30'),
(8, 'LAB 6', 'Gedung A Lt.2', '2026-06-01 00:16:30', '2026-06-01 00:16:30'),
(9, 'LAB 7', 'Gedung A Lt.2', '2026-06-01 00:16:30', '2026-06-01 00:16:30'),
(10, 'LAB 4 (Lab Jaringan)', 'Gedung A Lt.1', '2026-06-01 00:16:30', '2026-06-01 00:16:30'),
(11, 'LAB 2 (Lab Mandiri)', 'Gedung D Lt.2 ', '2026-06-01 00:16:48', '2026-06-01 00:16:48'),
(12, 'Ruang Dosen (E2)', 'Gedung E Lt.2 ', '2026-06-01 09:22:19', '2026-06-01 09:22:19'),
(598216598, 'ruang ukm', 'gedung e lt.2', '2026-06-03 17:57:01', '2026-06-03 17:57:01'),
(749021754, 'ruang eo', 'gedung b lt.2', '2026-06-03 17:55:22', '2026-06-03 17:55:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2026_04_22_121933_create_permission_tables', 1),
(3, '0001_01_01_000001_create_cache_table', 2),
(4, '0001_01_01_000000_create_users_table', 3),
(6, '2026_08_22_143652_create_notifications_table', 4),
(7, '2026_08_22_160750_create_jobs_table', 5),
(53, '2026_09_01_020816_add_dashboard_indexes_to_log_perbaikan_table', 6),
(104, '2026_09_02_125939_create_failed_jobs_table', 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(3, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 4),
(4, 'App\\Models\\User', 5),
(4, 'App\\Models\\User', 6),
(5, 'App\\Models\\User', 7),
(4, 'App\\Models\\User', 8),
(4, 'App\\Models\\User', 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('00168a38-c527-4f16-81a3-3d8037a6ea17', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"dd\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"dd\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":53,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:45', '2026-09-07 12:10:45'),
('015545ff-e1c0-4f99-bcdd-dfbb8aa94af9', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"Printer Baru\",\"jumlah\":1}}', NULL, '2026-09-03 02:27:48', '2026-09-03 02:27:48'),
('01b87349-7434-4bc5-a754-44a27e6e6b64', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"dd\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"dd\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":53,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('03a18dfe-9923-4c32-951a-c30d4dc13270', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"Printer Baru\",\"jumlah\":1}}', NULL, '2026-09-03 02:27:48', '2026-09-03 02:27:48'),
('0627d73a-dcdf-4947-ad39-ca89971d1018', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":59,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:11:18', '2026-09-07 12:11:18'),
('0cd179e9-a197-4164-a572-fbdc747acd0d', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0002\",\"message\":\"d\",\"kode\":\"PJB-07092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":62,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:21:18', '2026-09-07 12:21:18'),
('10c2dd18-04fa-4009-8c7c-6cb98c186a21', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":55,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('11147186-ade4-4830-a405-49e16b523297', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 4, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-14082026-0001\",\"message\":\"Teknisi Edi Purwanto, S.Kom mengambil tiket ini.\",\"kode\":\"TK-14082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/12\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"12\",\"data\":{\"message\":\"Teknisi Edi Purwanto, S.Kom mengambil tiket ini.\",\"sender_id\":3,\"sender_name\":\"Edi Purwanto, S.Kom\",\"log_id\":65,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 13:31:51', '2026-09-07 13:31:51'),
('16177c3f-9fd8-4c08-9aa6-173fc3831e22', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":59,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:11:18', '2026-09-07 12:11:18'),
('1dc53876-a670-4989-a6c9-10a468f95a25', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-21072026-0001 Diperbarui\",\"message\":\"Status TK-21072026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-21072026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/11\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"11\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-21072026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":62,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 13:31:50', '2026-09-07 13:31:50'),
('20188570-ac25-4c90-825c-fbf5d7ab148c', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":55,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('20b50291-d01e-487a-a4dc-c61b3061c13e', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":60,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:15:16', '2026-09-07 12:15:16'),
('253d3514-4188-484f-91c7-8affabb1c814', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"dd\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"dd\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":53,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('266050fb-ec1b-485b-90de-94885d117ff9', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"dd\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"dd\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":53,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('27c11449-74c4-4968-9eb2-4d8bb9cce4c0', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"test\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"test\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":52,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:45', '2026-09-07 12:10:45'),
('2a1a5df1-c441-45e4-adff-bf839a1271ed', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-14082026-0001 Diperbarui\",\"message\":\"Status TK-14082026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-14082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/12\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"12\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-14082026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":64,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 13:31:51', '2026-09-07 13:31:51'),
('2a626c6b-9c49-4705-b7b7-8d517f5559f7', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-03092026-0001\",\"message\":\"fasfa\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"fasfa\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":54}}', NULL, '2026-09-03 02:28:04', '2026-09-03 02:28:04'),
('2ce3b1bf-5b4e-4f0f-83f4-aff84680eed3', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":55,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('2ee1a882-6553-4d6b-85a9-4b388e726f49', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"test\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('30177834-b7f2-4dab-a867-dbcf5d9700ba', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 5, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":7,\"sender_name\":\"AdminSuper\",\"log_id\":57,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('3081fa05-21f1-4b3f-84df-abbdb4bd154c', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/54\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"54\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"rwar\",\"jumlah\":1}}', NULL, '2026-09-03 02:46:10', '2026-09-03 02:46:10'),
('3104885f-b015-4478-aa0b-92afe47fb7f7', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"kode\":\"PJB-07092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"tes\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:16:16', '2026-09-07 12:16:16'),
('320ea596-3037-4f24-84ea-d68f4539bd6f', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"kode\":\"PJB-07092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"tes\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:16:16', '2026-09-07 12:16:16'),
('32bc9ad1-5b16-43f7-9296-ed804d960333', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":59,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:11:17', '2026-09-07 12:11:17'),
('3431cd19-08c8-4a7b-9d46-4d3a9dda32bf', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-14082026-0001 Diperbarui\",\"message\":\"Status TK-14082026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-14082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/12\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"12\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-14082026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":64,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 13:31:51', '2026-09-07 13:31:51'),
('36a79974-6520-4b5f-a719-a7c1c9cfc45b', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":55,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('38bae144-1747-40e5-944d-638ee5d38f18', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/54\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"54\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"rwar\",\"jumlah\":1}}', NULL, '2026-09-03 02:46:10', '2026-09-03 02:46:10'),
('3d98e03a-1a50-4bf0-a4c3-f79ab51f48fc', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":59,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:11:17', '2026-09-07 12:11:17'),
('42092bc5-207b-4e17-9c37-af2731b6b030', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"Printer Baru\",\"jumlah\":1}}', NULL, '2026-09-03 02:27:48', '2026-09-03 02:27:48'),
('428bec78-362c-4fd9-8556-b481ac5e067f', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"test\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('4383fabc-121b-45da-8cc8-96b967f2b918', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":58,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('44dcbaf4-fef2-4a1e-9916-5712df36766d', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":58,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('4619946d-8ed7-4018-972e-7fdcc7e5a44d', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-21072026-0001 Diperbarui\",\"message\":\"Status TK-21072026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-21072026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/11\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"11\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-21072026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":62,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 13:31:50', '2026-09-07 13:31:50'),
('4b394ae4-8d8a-40de-843d-25f859fa4bf0', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"Printer Baru\",\"jumlah\":1}}', NULL, '2026-09-03 02:27:48', '2026-09-03 02:27:48'),
('50b42674-eb82-43fb-b740-555da2335174', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":58,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('514866e8-c972-47e8-b557-f7ddc143ef78', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 5, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":7,\"sender_name\":\"AdminSuper\",\"log_id\":57,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('5608e685-4318-4d55-bdc5-3a92c34968dc', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":60,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:15:16', '2026-09-07 12:15:16'),
('58259cc9-4499-4443-b328-5e5fb887370b', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"dd\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"dd\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":53,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('5dd9e2a6-4b00-46dc-8eb0-0713c2396587', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"test\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:10:47', '2026-09-07 12:10:47'),
('608d67cf-b5e0-4d35-aee1-2a2628ece05e', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"kode\":\"PJB-07092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"tes\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:16:16', '2026-09-07 12:16:16'),
('61c0d20a-d80f-485c-8582-0d4c010e924d', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":58,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('61eef1aa-47c7-4284-828d-c87f0a53c49b', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-03092026-0001\",\"message\":\"fasfa\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"fasfa\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":54}}', NULL, '2026-09-03 02:28:04', '2026-09-03 02:28:04'),
('6481a661-9e84-4a61-a602-17ce15f33a6f', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-03092026-0001\",\"message\":\"fasfa\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"fasfa\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":54}}', NULL, '2026-09-03 02:28:04', '2026-09-03 02:28:04'),
('65f9295e-2895-40ed-bc30-53bb54398ae4', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"dd\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"dd\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":53,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:45', '2026-09-07 12:10:45'),
('68c81659-9cd6-4657-a995-4f3ab7825a4a', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"kode\":\"PJB-07092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"tes\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:16:16', '2026-09-07 12:16:16'),
('6afff1e8-fabe-4ff6-bab7-66f052dbbbe4', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-18082026-0001 Diperbarui\",\"message\":\"Status TK-18082026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"13\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-18082026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":59,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:24:46', '2026-09-07 12:24:46'),
('6b48ce85-60de-4b1f-8cd1-769a407cfeea', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0002\",\"message\":\"d\",\"kode\":\"PJB-07092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":62,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:21:18', '2026-09-07 12:21:18'),
('6cf648b1-d93f-4ebb-94ae-b1625e8ad7bf', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":60,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:15:16', '2026-09-07 12:15:16'),
('6d830a39-7adb-463c-bc36-3ff1143a53e8', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/54\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"54\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"rwar\",\"jumlah\":1}}', NULL, '2026-09-03 02:46:10', '2026-09-03 02:46:10'),
('6f70d4a4-0b3e-4036-9888-359648ef4919', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"test\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('712650bf-29bf-490b-9a85-1e052c0d573b', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":59,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:11:18', '2026-09-07 12:11:18'),
('7663fbf2-1864-4860-b419-b2535ba9456d', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"Printer Baru\",\"jumlah\":1}}', NULL, '2026-09-03 02:27:48', '2026-09-03 02:27:48'),
('7d6be7ec-260c-43a9-bdb1-305fc143c592', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":59,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:11:18', '2026-09-07 12:11:18'),
('7f7a3c88-ec5e-4411-b159-13e59708cee0', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"test\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"test\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":52,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:45', '2026-09-07 12:10:45'),
('81318e44-8119-45e3-bee4-1fec0d7c21b2', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-03092026-0001\",\"message\":\"fasfa\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"fasfa\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":54}}', NULL, '2026-09-03 02:28:04', '2026-09-03 02:28:04'),
('83774ae1-3a3a-4730-a77e-4ca64083ffdd', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"dd\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"dd\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":53,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('890a7726-f7ab-4c78-811d-abc518f4bd25', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 4, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-14082026-0001 Diperbarui\",\"message\":\"Status TK-14082026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-14082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/12\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"12\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-14082026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":64,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 13:31:50', '2026-09-07 13:31:50'),
('8a1ef1a5-d508-423c-9e73-95c8e71d52b1', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"tets\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"tets\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":60,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:25:04', '2026-09-07 12:25:04'),
('8af2278d-f872-4dcc-9b96-b7ae080da3c0', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"test\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"test\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":52,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:45', '2026-09-07 12:10:45'),
('8bb0db12-6e9a-4c4d-a0f3-8f138f37092f', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":60,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:15:16', '2026-09-07 12:15:16'),
('8c38cdc4-9abd-4a49-bab0-bad9162ca9e0', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-03092026-0001\",\"message\":\"fasfa\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"fasfa\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":54}}', NULL, '2026-09-03 02:28:04', '2026-09-03 02:28:04'),
('8d06900b-7d8b-46a6-881b-2f46f64b89ea', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"test\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"test\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":52,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:45', '2026-09-07 12:10:45'),
('8df0dc48-82d9-49e7-acb1-d5ef016b167a', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":55,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('8df5469e-19f0-4fa8-9c49-1fb23cd45f48', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-18082026-0001 Diperbarui\",\"message\":\"Status TK-18082026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"13\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-18082026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":59,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:24:46', '2026-09-07 12:24:46'),
('90871190-4741-496e-898e-efad368ab9fb', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 5, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":7,\"sender_name\":\"AdminSuper\",\"log_id\":54,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('9109a07c-1bc7-40a6-b504-605a82c82fb3', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/54\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"54\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"rwar\",\"jumlah\":1}}', NULL, '2026-09-03 02:46:10', '2026-09-03 02:46:10'),
('912ce964-aed8-4948-b075-329b573b9ca1', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0002\",\"message\":\"d\",\"kode\":\"PJB-07092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":62,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:21:18', '2026-09-07 12:21:18'),
('91784ab3-2f22-42f5-ad7f-bc2d297103c8', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":60,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:15:16', '2026-09-07 12:15:16'),
('91882b26-3e96-4ac3-b384-23208944df8b', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/54\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"54\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"rwar\",\"jumlah\":1}}', NULL, '2026-09-03 02:46:10', '2026-09-03 02:46:10'),
('93304f77-4f81-412f-8129-6b05dc844c32', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 5, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"de\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"de\",\"sender_id\":1,\"sender_name\":\"Fithnan\",\"log_id\":61,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:25:13', '2026-09-07 12:25:13'),
('94be616d-b954-48de-bf82-58b3d1679544', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-18082026-0001 Diperbarui\",\"message\":\"Status TK-18082026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"13\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-18082026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":59,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:24:46', '2026-09-07 12:24:46'),
('95746d54-c3e8-47f6-8a28-dda28178e2ae', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"tets\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"tets\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":60,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:25:04', '2026-09-07 12:25:04'),
('9bf75a06-33d0-4e3a-9297-14870b5a91a4', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/54\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"54\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"rwar\",\"jumlah\":1}}', NULL, '2026-09-03 02:46:10', '2026-09-03 02:46:10'),
('9f7a6e98-78be-490e-a735-5ae0245e8667', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":60,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:15:16', '2026-09-07 12:15:16'),
('a225b723-b1b2-4aa3-ab7c-251efd493b33', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 5, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":7,\"sender_name\":\"AdminSuper\",\"log_id\":56,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('a3dec187-e5f9-4658-bc6e-7b2eafd4f5fb', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"test\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('a70473f8-7fec-45a9-8d4a-8824bedbfdf1', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"tets\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"tets\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":60,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:25:04', '2026-09-07 12:25:04'),
('a7bca39b-59fb-4998-a378-084679fc4ba6', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":59,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:11:17', '2026-09-07 12:11:17'),
('a9f02e25-781a-4e01-9cb2-aba781ab2684', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/54\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"54\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"rwar\",\"jumlah\":1}}', NULL, '2026-09-03 02:46:10', '2026-09-03 02:46:10'),
('b045f043-91fe-4fa0-a9bd-9228ce20eb94', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"kode\":\"PJB-07092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"tes\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:16:16', '2026-09-07 12:16:16'),
('b38c003b-ffd5-4b8e-9d22-66540cd7d8f0', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-03092026-0001\",\"message\":\"fasfa\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"fasfa\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":54}}', NULL, '2026-09-03 02:28:04', '2026-09-03 02:28:04'),
('b3cd2811-1b24-48eb-9e8c-3ede0dd4921c', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":55,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('b4281dc2-5acc-42ad-8b7e-ced60ce32e09', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"test\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"test\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":52,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:45', '2026-09-07 12:10:45');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('b7967cc0-2c3a-48e3-9fd5-f6571a56d2e5', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/54\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"54\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"rwar\",\"jumlah\":1}}', NULL, '2026-09-03 02:46:10', '2026-09-03 02:46:10'),
('b95339c5-ab88-4bc6-8763-d1a6fd9c0a08', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0002\",\"message\":\"d\",\"kode\":\"PJB-07092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":62,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:21:18', '2026-09-07 12:21:18'),
('bab12fcf-1527-4258-901d-660e2ed95356', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"tets\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"tets\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":60,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:25:04', '2026-09-07 12:25:04'),
('bb26a554-5176-45ea-a035-480fd73ea126', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-21072026-0001 Diperbarui\",\"message\":\"Status TK-21072026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-21072026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/11\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"11\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-21072026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":62,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 13:31:50', '2026-09-07 13:31:50'),
('bc65c16f-8822-42f7-a1f7-aa6c4f31b3a3', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"kode\":\"PJB-07092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"tes\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:16:16', '2026-09-07 12:16:16'),
('becadbdb-3cc9-46b0-ba42-80110cee2d2a', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"Printer Baru\",\"jumlah\":1}}', NULL, '2026-09-03 02:27:48', '2026-09-03 02:27:48'),
('c643e182-6a18-4350-92be-5636c38c592f', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 8, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-21072026-0001\",\"message\":\"Teknisi Edi Purwanto, S.Kom mengambil tiket ini.\",\"kode\":\"TK-21072026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/11\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"11\",\"data\":{\"message\":\"Teknisi Edi Purwanto, S.Kom mengambil tiket ini.\",\"sender_id\":3,\"sender_name\":\"Edi Purwanto, S.Kom\",\"log_id\":63,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 13:31:50', '2026-09-07 13:31:50'),
('c663b12f-d006-4277-a85c-70d5e94d0b70', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-03092026-0001\",\"message\":\"fasfa\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"fasfa\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":54}}', NULL, '2026-09-03 02:28:04', '2026-09-03 02:28:04'),
('cee3b753-abdf-4333-a647-685900a1a1e6', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":58,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('d4087ceb-97f2-48a8-927e-b3d0a2145e17', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"test\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('dafb6941-97aa-47b7-9204-3ebf00561242', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":58,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('dc2f9b14-123c-4d42-be68-3e404106645a', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-14082026-0001 Diperbarui\",\"message\":\"Status TK-14082026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-14082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/12\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"12\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-14082026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":64,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 13:31:51', '2026-09-07 13:31:51'),
('ddb2c43c-527e-4ade-a951-39f44669c4b0', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"kode\":\"PJB-07092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"tes\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:16:16', '2026-09-07 12:16:16'),
('e4d6a6fa-7bfd-42bf-b73a-05730408398d', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"kode\":\"PJB-07092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"tes\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:16:16', '2026-09-07 12:16:16'),
('e78d3a74-7dde-44af-a0aa-639683012f13', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":55,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('e8cc022a-4ca7-459e-888b-98b35fbed040', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":60,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:15:16', '2026-09-07 12:15:16'),
('e93aa62c-1ede-4cd6-b355-7d050aeda5b1', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":58,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('e96e8fad-6bf2-44b2-aee5-2c24a184efe5', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"dd\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"dd\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":53,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:45', '2026-09-07 12:10:45'),
('ebb05d89-a559-4cba-b483-3598dfd08334', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 5, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-18082026-0001 Diperbarui\",\"message\":\"Status TK-18082026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/13\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"13\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-18082026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":59,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:24:46', '2026-09-07 12:24:46'),
('ec10129e-2ca6-481c-9d5b-088823a0aa81', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"test\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"test\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":52,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:45', '2026-09-07 12:10:45'),
('ecd17944-67ec-415b-9da3-3c192f8f7841', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":58,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('ed812c1e-291b-4795-a16c-35f436b31a57', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"test\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('edbb39a7-9ed0-436a-8129-955e8c179a45', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":60,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:15:16', '2026-09-07 12:15:16'),
('ee2c0c48-a4c0-4958-ba0e-1d27be6e758d', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 8, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-21072026-0001 Diperbarui\",\"message\":\"Status TK-21072026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-21072026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/11\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"11\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-21072026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":62,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 13:31:50', '2026-09-07 13:31:50'),
('ee87933d-3d34-4e85-b418-b98cac63b381', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"Printer Baru\",\"jumlah\":1}}', NULL, '2026-09-03 02:27:48', '2026-09-03 02:27:48'),
('f234534c-2ff8-4e0e-bc4f-d36d3e4004e6', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":59,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:11:18', '2026-09-07 12:11:18'),
('f285687d-9c0d-49b4-8e62-7bfeaa17bdf1', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"test\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"test\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":52,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:45', '2026-09-07 12:10:45'),
('f3f821b3-b543-43d5-9fa9-b88ca33048cb', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 5, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":7,\"sender_name\":\"AdminSuper\",\"log_id\":56,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('f644210e-314e-4a15-97a8-acb6cb598e08', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 5, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":7,\"sender_name\":\"AdminSuper\",\"log_id\":54,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('f8dc3a9e-2efe-42a1-9492-83357d4ee640', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":55,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('fd472074-6c89-44e0-9391-9c5c8578ba1b', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"test\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('fdc06343-b523-45e5-96e0-8aefa01b4d2a', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-03092026-0001\",\"message\":\"fasfa\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"fasfa\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":54}}', NULL, '2026-09-03 02:28:04', '2026-09-03 02:28:04'),
('ffaac58f-bc0c-4cc7-8c8d-34634ddec2e1', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"Printer Baru\",\"jumlah\":1}}', NULL, '2026-09-03 02:27:48', '2026-09-03 02:27:48'),
('ffc9d9ff-1c9a-4af5-bb75-0a98b3e04946', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"test\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"test\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":52,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:45', '2026-09-07 12:10:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('annas@iwima.edu', '$2y$12$.G9pwDHGr8lyuEve9vca/erjMMt0IBqHhzoxHHruShtBoCL/qzca2', '2026-09-07 14:07:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajuan_barang`
--

CREATE TABLE `pengajuan_barang` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `jumlah` int NOT NULL DEFAULT '1',
  `alasan` text,
  `status` enum('Open','In Progress','Close') DEFAULT 'Open',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `pengajuan_barang`
--

INSERT INTO `pengajuan_barang` (`id`, `user_id`, `nama_barang`, `jumlah`, `alasan`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 8, 'Proyektor Baru', 12, 'Untuk kebutuhan kebutuhan pembelajan dan penggantian proyektor yang rusak', 'Close', '2026-06-03 17:09:35', '2026-06-15 03:53:01', NULL),
(3, 4, 'Printer', 15, 'Printer Baru', 'Close', '2026-06-15 06:40:24', '2026-07-09 19:14:48', NULL),
(4, 3, 'RAM DDR 4 3200Mhz', 12, 'Komponen yang dibutuhkan untuk perbaikan komputer', 'Close', '2026-06-29 03:50:16', '2026-07-09 19:15:27', NULL),
(5, 5, 'Printer Baru', 12, 'Kekurangan perangkat printer untuk kebutuhan inventaris', 'Open', '2026-07-20 21:32:50', '2026-07-20 21:32:50', NULL),
(6, 4, 'COBA barang', 1, 'COBAfff', 'Close', '2026-08-19 19:03:53', '2026-08-22 09:45:15', NULL),
(7, 4, 'ateafea', 15, 'taefae', 'Open', '2026-08-19 19:20:17', '2026-08-19 19:55:14', NULL),
(53, 4, 'Printer Baru', 1, 'fafff', 'Open', '2026-09-03 02:27:48', '2026-09-03 02:48:10', NULL),
(54, 4, 'rwar', 1, 'arwar', 'Open', '2026-09-03 02:46:08', '2026-09-03 02:48:08', NULL),
(104, 5, 'test', 1, 'test', 'Open', '2026-09-07 12:07:33', '2026-09-07 12:43:54', '2026-09-07 12:43:54'),
(105, 5, 'tes', 1, 'tes\n', 'In Progress', '2026-09-07 12:16:15', '2026-09-17 00:45:19', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'ViewAny:Role', 'web', '2026-05-07 23:03:32', '2026-05-07 23:03:32'),
(2, 'View:Role', 'web', '2026-05-07 23:03:32', '2026-05-07 23:03:32'),
(3, 'Create:Role', 'web', '2026-05-07 23:03:32', '2026-05-07 23:03:32'),
(4, 'Update:Role', 'web', '2026-05-07 23:03:32', '2026-05-07 23:03:32'),
(5, 'Delete:Role', 'web', '2026-05-07 23:03:32', '2026-05-07 23:03:32'),
(6, 'DeleteAny:Role', 'web', '2026-05-07 23:03:32', '2026-05-07 23:03:32'),
(7, 'Restore:Role', 'web', '2026-05-07 23:03:32', '2026-05-07 23:03:32'),
(8, 'ForceDelete:Role', 'web', '2026-05-07 23:03:32', '2026-05-07 23:03:32'),
(9, 'ForceDeleteAny:Role', 'web', '2026-05-07 23:03:32', '2026-05-07 23:03:32'),
(10, 'RestoreAny:Role', 'web', '2026-05-07 23:03:32', '2026-05-07 23:03:32'),
(11, 'Replicate:Role', 'web', '2026-05-07 23:03:32', '2026-05-07 23:03:32'),
(12, 'Reorder:Role', 'web', '2026-05-07 23:03:32', '2026-05-07 23:03:32'),
(13, 'ViewAny:MasterRuangan', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(14, 'View:MasterRuangan', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(15, 'Create:MasterRuangan', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(16, 'Update:MasterRuangan', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(17, 'Delete:MasterRuangan', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(18, 'DeleteAny:MasterRuangan', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(19, 'Restore:MasterRuangan', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(20, 'ForceDelete:MasterRuangan', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(21, 'ForceDeleteAny:MasterRuangan', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(22, 'RestoreAny:MasterRuangan', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(23, 'Replicate:MasterRuangan', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(24, 'Reorder:MasterRuangan', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(25, 'ViewAny:TiketPerbaikan', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(26, 'View:TiketPerbaikan', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(27, 'Create:TiketPerbaikan', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(28, 'Update:TiketPerbaikan', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(29, 'Delete:TiketPerbaikan', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(30, 'DeleteAny:TiketPerbaikan', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(31, 'Restore:TiketPerbaikan', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(32, 'ForceDelete:TiketPerbaikan', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(33, 'ForceDeleteAny:TiketPerbaikan', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(34, 'RestoreAny:TiketPerbaikan', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(35, 'Replicate:TiketPerbaikan', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(36, 'Reorder:TiketPerbaikan', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(37, 'ViewAny:User', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(38, 'View:User', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(39, 'Create:User', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(40, 'Update:User', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(41, 'Delete:User', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(42, 'DeleteAny:User', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(43, 'Restore:User', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(44, 'ForceDelete:User', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(45, 'ForceDeleteAny:User', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(46, 'RestoreAny:User', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(47, 'Replicate:User', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(48, 'Reorder:User', 'web', '2026-05-21 16:19:24', '2026-05-21 16:19:24'),
(49, 'View:AdminDashboard', 'web', '2026-05-21 16:19:35', '2026-05-21 16:19:35'),
(50, 'View:TeknisiDashboard', 'web', '2026-05-21 16:19:35', '2026-05-21 16:19:35'),
(51, 'ViewAny:LogPerbaikan', 'web', '2026-06-01 02:03:48', '2026-06-01 02:03:48'),
(52, 'View:LogPerbaikan', 'web', '2026-06-01 02:03:48', '2026-06-01 02:03:48'),
(53, 'Create:LogPerbaikan', 'web', '2026-06-01 02:03:48', '2026-06-01 02:03:48'),
(54, 'Update:LogPerbaikan', 'web', '2026-06-01 02:03:48', '2026-06-01 02:03:48'),
(55, 'Delete:LogPerbaikan', 'web', '2026-06-01 02:03:48', '2026-06-01 02:03:48'),
(56, 'DeleteAny:LogPerbaikan', 'web', '2026-06-01 02:03:48', '2026-06-01 02:03:48'),
(57, 'Restore:LogPerbaikan', 'web', '2026-06-01 02:03:48', '2026-06-01 02:03:48'),
(58, 'ForceDelete:LogPerbaikan', 'web', '2026-06-01 02:03:48', '2026-06-01 02:03:48'),
(59, 'ForceDeleteAny:LogPerbaikan', 'web', '2026-06-01 02:03:48', '2026-06-01 02:03:48'),
(60, 'RestoreAny:LogPerbaikan', 'web', '2026-06-01 02:03:48', '2026-06-01 02:03:48'),
(61, 'Replicate:LogPerbaikan', 'web', '2026-06-01 02:03:48', '2026-06-01 02:03:48'),
(62, 'Reorder:LogPerbaikan', 'web', '2026-06-01 02:03:48', '2026-06-01 02:03:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'web', '2026-05-06 16:52:56', '2026-05-06 16:52:56'),
(3, 'teknisi', 'web', '2026-05-06 16:52:56', '2026-05-06 16:52:56'),
(4, 'pemohon', 'web', '2026-05-06 16:52:56', '2026-05-06 16:52:56'),
(5, 'super_admin', 'web', '2026-05-07 23:03:32', '2026-05-07 23:03:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(2, 2),
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
(43, 2),
(44, 2),
(46, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(50, 3),
(26, 4),
(27, 4),
(28, 4),
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(5, 5),
(6, 5),
(7, 5),
(8, 5),
(9, 5),
(10, 5),
(11, 5),
(12, 5),
(13, 5),
(14, 5),
(15, 5),
(16, 5),
(17, 5),
(18, 5),
(19, 5),
(20, 5),
(21, 5),
(22, 5),
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
(38, 5),
(39, 5),
(40, 5),
(41, 5),
(42, 5),
(43, 5),
(44, 5),
(45, 5),
(46, 5),
(47, 5),
(48, 5),
(49, 5),
(50, 5),
(51, 5),
(52, 5),
(53, 5),
(54, 5),
(55, 5),
(56, 5),
(57, 5),
(58, 5),
(59, 5),
(60, 5),
(61, 5),
(62, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tiket_perbaikan`
--

CREATE TABLE `tiket_perbaikan` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `ruangan_id` int NOT NULL,
  `keluhan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `kepemilikan` enum('Inventaris Kantor','Pribadi','Lainnya') DEFAULT 'Inventaris Kantor',
  `deskripsi` text NOT NULL,
  `status` enum('Open','In Progress','Close') DEFAULT 'Open',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `tiket_perbaikan`
--

INSERT INTO `tiket_perbaikan` (`id`, `user_id`, `ruangan_id`, `keluhan`, `kepemilikan`, `deskripsi`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, 8, 'PC LAB 6 Tidak Mau Booting', 'Inventaris Kantor', 'Hanya muncul layar biru.', 'Close', '2026-04-20 01:00:00', '2026-06-11 09:33:33', NULL),
(2, 4, 10, 'Internet LAB Jaringan Mati', 'Inventaris Kantor', 'Tidak ada koneksi sama sekali.', 'Close', '2026-04-20 03:00:00', '2026-06-11 09:31:58', NULL),
(3, 7, 5, 'Pc Lab 1 No.44 Tidak Mau Nyala', 'Inventaris Kantor', 'Pc  selalu mati nyala dalam kurun waktu tertentu', 'In Progress', '2026-06-01 02:39:15', '2026-06-15 02:20:42', NULL),
(4, 1, 5, 'Pc Lab 1 No.43 Tidak Mau Nyala', 'Inventaris Kantor', 'Pc  selalu mati nyala dalam kurun waktu tertentu', 'In Progress', '2026-06-01 02:39:42', '2026-06-15 02:22:21', NULL),
(5, 2, 5, 'Pc Lab 1 No.43 Tidak Mau Nyala', 'Inventaris Kantor', 'Pc  selalu mati nyala dalam kurun waktu tertentu', 'Close', '2026-06-01 02:40:21', '2026-07-09 00:57:36', NULL),
(6, 5, 3, 'Printer Ruang P3SDI Rusak', 'Inventaris Kantor', 'Printers rusak ', 'Close', '2026-06-01 03:04:38', '2026-07-09 00:57:33', NULL),
(7, 4, 12, 'Printer Rusak', 'Inventaris Kantor', 'Printer tidak bisa digunakan untuk print', 'Close', '2026-06-02 00:26:38', '2026-06-10 23:28:08', NULL),
(8, 5, 12, 'Pc Server ', 'Lainnya', 'Jaringan server terputus\n', 'In Progress', '2026-06-15 06:36:06', '2026-06-15 06:36:30', NULL),
(9, 5, 3, 'PC kantor saya rusak', 'Inventaris Kantor', 'Suka mati nyala sendiri', 'In Progress', '2026-06-17 12:24:00', '2026-06-25 03:50:18', NULL),
(10, 6, 1, 'Pc kantor saya rusak', 'Inventaris Kantor', 'Pc tidak mau nyala, penyebab tidak diketahui', 'In Progress', '2026-06-25 04:15:36', '2026-06-26 02:02:25', NULL),
(11, 8, 3, 'Printer P3SDI Rusak', 'Inventaris Kantor', 'tidak dapat digunakan untuk print', 'In Progress', '2026-07-20 21:31:34', '2026-09-07 13:31:49', NULL),
(12, 4, 2, 'Printer Rusak', 'Inventaris Kantor', 'faeteat', 'In Progress', '2026-08-13 21:02:06', '2026-09-07 13:31:50', NULL),
(13, 5, 3, 'UJI COBA', 'Lainnya', 'UJI COBA', 'In Progress', '2026-08-17 18:31:16', '2026-09-07 12:24:45', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` enum('pemohon','teknisi','admin') DEFAULT 'pemohon',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_bidang` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `remember_token`, `unit_bidang`, `created_at`, `updated_at`) VALUES
(1, 'Fithnan', 'fithnan@iwima.edu', '$2y$12$YGPgYttdp28xPi8vicS0cOZvdJXatHd8sU1/tLjpkgARtPhABTsNG', 'teknisi', NULL, 'UPT Teknisi', '2026-04-20 01:19:57', '2026-07-08 17:38:51'),
(2, 'Sulistyo', 'sulistyo@iwima.edu', '$2y$12$xNkQNwtlUgWBZKyjtMyPnOqKcFxL27AuengJqz21z1wX116LkRWCG', 'teknisi', NULL, 'UPT Teknisi', '2026-04-20 01:19:57', '2026-07-08 17:38:42'),
(3, 'Edi Purwanto, S.Kom', 'edi@iwima.edu', '$2y$12$AE5mS18p8UvqKlQ2Tam85ebdeOHeM2F1JUACag36AD08rRHGzZrWC', 'admin', NULL, 'Ka. Bidang Teknisi & Perawatan Infrastruktur', '2026-04-20 01:19:57', '2026-07-08 19:26:29'),
(4, 'Eko', 'eko@iwima.edu', '$2y$12$MdzYvpMfgKXqj4dF4TDSYuF.NWM1HuVQ29miZfo3twARINOcbWkke', 'pemohon', '57TncJrJIc1X28q139F0bvCysbVeLDoQAIyooeGfBAhu5lnBW8VjvhhPTv2u', 'Kaprodi Teknik', '2026-04-20 01:19:57', '2026-09-07 14:14:10'),
(5, 'Annas Syaifudin', 'annas@iwima.edu', '$2y$12$r7ljVqxiTNcgeTIaeQa35Od7s4q0QbiTNOUNJOO9rZPndlyN40CwC', 'pemohon', NULL, 'P3SDI', '2026-04-20 01:19:57', '2026-05-07 22:46:57'),
(6, 'Dr. Christianto', 'christianto@iwima.edu', '$2y$10$6Pc98WMFlVZmayrynhNebel/zXxA523NmKDRx9djZQbQqdsqwjHB.', 'pemohon', NULL, 'Rektorat', '2026-04-20 01:19:57', '2026-05-04 00:34:27'),
(7, 'AdminSuper', 'admin@iwima.edu', '$2y$12$73D/pdiqgsFCivquNGWHH.XI0pIIaq36aB0UFzdGI8pK9VFqnRPTu', 'admin', NULL, 'P3SDI', '2026-05-07 23:53:39', '2026-05-07 23:59:00'),
(8, 'Faizal Kurniawan', 'faizal@iwima.edu', '$2y$12$yZo1q5Zv2C5ru0X.QXQEF.mL.8iYhg25/eqf8EoSzygvA3.b1MwRK', 'pemohon', NULL, 'P3SDI', '2026-05-26 01:00:19', '2026-07-20 21:30:36'),
(9, 'Wachid Darmawan, M.Kom', 'wachiddarmawan@iwima.edu', '$2y$12$1CwQ4Rpp98oATimZp.W9sOYsMV0KaikeonJPtTRuupUQP.POXK7HC', 'pemohon', NULL, 'Ka. UPT Laboretorium Komputer & Bahasa', '2026-07-08 19:27:50', '2026-07-08 19:27:50');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_laporan_barang`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_laporan_barang` (
`no_pengajuan` int
,`nama_pemohon` varchar(100)
,`unit_bidang` varchar(100)
,`nama_barang` varchar(255)
,`jumlah` int
,`alasan` text
,`status` enum('Open','In Progress','Close')
,`waktu_pengajuan` timestamp
,`teknisi_id` bigint
,`nama_teknisi` varchar(100)
,`waktu_mulai` timestamp
,`waktu_selesai` timestamp
,`durasi_pengerjaan_menit` bigint
,`status_outcome` varchar(9)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_laporan_kegiatan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_laporan_kegiatan` (
`id_log` int
,`nama_teknisi` varchar(100)
,`unit_bidang` varchar(100)
,`tanggal` date
,`deskripsi_kegiatan` text
,`waktu_dibuat` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_laporan_service`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_laporan_service` (
`no_tiket` int
,`nama_pemohon` varchar(100)
,`lokasi` varchar(100)
,`kepemilikan` enum('Inventaris Kantor','Pribadi','Lainnya')
,`status` enum('Open','In Progress','Close')
,`nama_teknisi` varchar(100)
,`waktu_mulai` timestamp
,`waktu_selesai` timestamp
,`durasi_pengerjaan_menit` bigint
);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  ADD KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `log_data_pengajuan_barang`
--
ALTER TABLE `log_data_pengajuan_barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengajuan_id` (`pengajuan_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `log_pengajuan_status_lookup` (`pengajuan_id`,`kategori_log`,`data_baru`,`created_at`);

--
-- Indeks untuk tabel `log_data_tiket_perbaikan`
--
ALTER TABLE `log_data_tiket_perbaikan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tiket_id` (`tiket_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `log_tiket_status_lookup` (`tiket_id`,`kategori_log`,`data_baru`,`created_at`),
  ADD KEY `log_teknisi_status_lookup` (`user_id`,`kategori_log`,`data_baru`,`created_at`),
  ADD KEY `log_teknisi_activity_lookup` (`user_id`,`created_at`);

--
-- Indeks untuk tabel `log_harian_teknisi`
--
ALTER TABLE `log_harian_teknisi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teknisi_id` (`teknisi_id`),
  ADD KEY `ruangan_id` (`ruangan_id`);

--
-- Indeks untuk tabel `master_ruangan`
--
ALTER TABLE `master_ruangan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `pengajuan_barang`
--
ALTER TABLE `pengajuan_barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `tiket_perbaikan`
--
ALTER TABLE `tiket_perbaikan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ruangan_id` (`ruangan_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=396;

--
-- AUTO_INCREMENT untuk tabel `log_data_pengajuan_barang`
--
ALTER TABLE `log_data_pengajuan_barang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT untuk tabel `log_data_tiket_perbaikan`
--
ALTER TABLE `log_data_tiket_perbaikan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT untuk tabel `log_harian_teknisi`
--
ALTER TABLE `log_harian_teknisi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT untuk tabel `master_ruangan`
--
ALTER TABLE `master_ruangan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=749021805;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT untuk tabel `pengajuan_barang`
--
ALTER TABLE `pengajuan_barang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `tiket_perbaikan`
--
ALTER TABLE `tiket_perbaikan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_laporan_barang`
--
DROP TABLE IF EXISTS `view_laporan_barang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_laporan_barang`  AS SELECT `b`.`id` AS `no_pengajuan`, `u`.`name` AS `nama_pemohon`, `u`.`unit_bidang` AS `unit_bidang`, `b`.`nama_barang` AS `nama_barang`, `b`.`jumlah` AS `jumlah`, `b`.`alasan` AS `alasan`, `b`.`status` AS `status`, `b`.`created_at` AS `waktu_pengajuan`, (select `lg`.`user_id` from `log_data_pengajuan_barang` `lg` where ((`lg`.`pengajuan_id` = `b`.`id`) and (`lg`.`kategori_log` = 'Status') and (`lg`.`data_baru` = 'In Progress')) order by `lg`.`created_at` limit 1) AS `teknisi_id`, (select `us`.`name` from (`log_data_pengajuan_barang` `lg` join `users` `us` on((`us`.`id` = `lg`.`user_id`))) where ((`lg`.`pengajuan_id` = `b`.`id`) and (`lg`.`kategori_log` = 'Status') and (`lg`.`data_baru` = 'In Progress')) order by `lg`.`created_at` limit 1) AS `nama_teknisi`, (select min(`lg`.`created_at`) from `log_data_pengajuan_barang` `lg` where ((`lg`.`pengajuan_id` = `b`.`id`) and (`lg`.`kategori_log` = 'Status') and (`lg`.`data_baru` = 'In Progress'))) AS `waktu_mulai`, (select max(`lg`.`created_at`) from `log_data_pengajuan_barang` `lg` where ((`lg`.`pengajuan_id` = `b`.`id`) and (`lg`.`kategori_log` = 'Status') and (`lg`.`data_baru` = 'Close'))) AS `waktu_selesai`, timestampdiff(MINUTE,(select min(`lg`.`created_at`) from `log_data_pengajuan_barang` `lg` where ((`lg`.`pengajuan_id` = `b`.`id`) and (`lg`.`kategori_log` = 'Status') and (`lg`.`data_baru` = 'In Progress'))),(select max(`lg`.`created_at`) from `log_data_pengajuan_barang` `lg` where ((`lg`.`pengajuan_id` = `b`.`id`) and (`lg`.`kategori_log` = 'Status') and (`lg`.`data_baru` = 'Close')))) AS `durasi_pengerjaan_menit`, (case when (`b`.`status` <> 'Close') then NULL when exists(select 1 from `log_data_pengajuan_barang` `lg` where ((`lg`.`pengajuan_id` = `b`.`id`) and (`lg`.`kategori_log` = 'Status') and (`lg`.`data_baru` = 'Close') and (`lg`.`keterangan` like '[SELESAI]%'))) then 'Completed' when exists(select 1 from `log_data_pengajuan_barang` `lg` where ((`lg`.`pengajuan_id` = `b`.`id`) and (`lg`.`kategori_log` = 'Status') and (`lg`.`data_baru` = 'Close') and (`lg`.`keterangan` like '[DITOLAK]%'))) then 'Rejected' else NULL end) AS `status_outcome` FROM (`pengajuan_barang` `b` join `users` `u` on((`u`.`id` = `b`.`user_id`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_laporan_kegiatan`
--
DROP TABLE IF EXISTS `view_laporan_kegiatan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_laporan_kegiatan`  AS SELECT `l`.`id` AS `id_log`, `u`.`name` AS `nama_teknisi`, `u`.`unit_bidang` AS `unit_bidang`, `l`.`tanggal` AS `tanggal`, `l`.`deskripsi_kegiatan` AS `deskripsi_kegiatan`, `l`.`created_at` AS `waktu_dibuat` FROM (`log_harian_teknisi` `l` join `users` `u` on((`l`.`teknisi_id` = `u`.`id`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_laporan_service`
--
DROP TABLE IF EXISTS `view_laporan_service`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_laporan_service`  AS SELECT `t`.`id` AS `no_tiket`, `u`.`name` AS `nama_pemohon`, `r`.`nama_ruangan` AS `lokasi`, `t`.`kepemilikan` AS `kepemilikan`, `t`.`status` AS `status`, (select `users`.`name` from (`log_data_tiket_perbaikan` join `users` on((`log_data_tiket_perbaikan`.`user_id` = `users`.`id`))) where ((`log_data_tiket_perbaikan`.`tiket_id` = `t`.`id`) and (`log_data_tiket_perbaikan`.`kategori_log` = 'Status') and (`log_data_tiket_perbaikan`.`data_baru` = 'In Progress')) order by `log_data_tiket_perbaikan`.`created_at` limit 1) AS `nama_teknisi`, (select min(`log_data_tiket_perbaikan`.`created_at`) from `log_data_tiket_perbaikan` where ((`log_data_tiket_perbaikan`.`tiket_id` = `t`.`id`) and (`log_data_tiket_perbaikan`.`kategori_log` = 'Status') and (`log_data_tiket_perbaikan`.`data_baru` = 'In Progress'))) AS `waktu_mulai`, (select max(`log_data_tiket_perbaikan`.`created_at`) from `log_data_tiket_perbaikan` where ((`log_data_tiket_perbaikan`.`tiket_id` = `t`.`id`) and (`log_data_tiket_perbaikan`.`kategori_log` = 'Status') and (`log_data_tiket_perbaikan`.`data_baru` = 'Close'))) AS `waktu_selesai`, timestampdiff(MINUTE,(select min(`log_data_tiket_perbaikan`.`created_at`) from `log_data_tiket_perbaikan` where ((`log_data_tiket_perbaikan`.`tiket_id` = `t`.`id`) and (`log_data_tiket_perbaikan`.`kategori_log` = 'Status') and (`log_data_tiket_perbaikan`.`data_baru` = 'In Progress'))),(select max(`log_data_tiket_perbaikan`.`created_at`) from `log_data_tiket_perbaikan` where ((`log_data_tiket_perbaikan`.`tiket_id` = `t`.`id`) and (`log_data_tiket_perbaikan`.`kategori_log` = 'Status') and (`log_data_tiket_perbaikan`.`data_baru` = 'Close')))) AS `durasi_pengerjaan_menit` FROM ((`tiket_perbaikan` `t` join `users` `u` on((`t`.`user_id` = `u`.`id`))) join `master_ruangan` `r` on((`t`.`ruangan_id` = `r`.`id`))) ;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `log_data_pengajuan_barang`
--
ALTER TABLE `log_data_pengajuan_barang`
  ADD CONSTRAINT `log_data_pengajuan_barang_ibfk_1` FOREIGN KEY (`pengajuan_id`) REFERENCES `pengajuan_barang` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `log_data_pengajuan_barang_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `log_data_tiket_perbaikan`
--
ALTER TABLE `log_data_tiket_perbaikan`
  ADD CONSTRAINT `log_data_tiket_perbaikan_ibfk_1` FOREIGN KEY (`tiket_id`) REFERENCES `tiket_perbaikan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `log_data_tiket_perbaikan_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `log_harian_teknisi`
--
ALTER TABLE `log_harian_teknisi`
  ADD CONSTRAINT `log_harian_teknisi_ibfk_1` FOREIGN KEY (`teknisi_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `log_harian_teknisi_ibfk_2` FOREIGN KEY (`ruangan_id`) REFERENCES `master_ruangan` (`id`);

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pengajuan_barang`
--
ALTER TABLE `pengajuan_barang`
  ADD CONSTRAINT `pengajuan_barang_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tiket_perbaikan`
--
ALTER TABLE `tiket_perbaikan`
  ADD CONSTRAINT `tiket_perbaikan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tiket_perbaikan_ibfk_2` FOREIGN KEY (`ruangan_id`) REFERENCES `master_ruangan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
