-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 01 Sep 2026 pada 01.27
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
(30, 7, 4, 'Chat', NULL, NULL, 'd', '2026-08-23 19:28:14');

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
(50, 13, 1, 'Chat', NULL, NULL, 'Membangun Sistem Informasi Manajemen Pelayanan Internal (Helpdesk) yang terintegrasi untuk mengelola pengaduan dan pemeliharaan infrastruktur.  Menerapkan sistem pada unit mitra melalui tahap migrasi data, pelatihan pengguna, uji coba, dan pendampingan awal.  Menganalisis dan mengevaluasi dampak kebermanfaatan penerapan solusi teknologi tepat guna dalam meningkatkan mutu pelayanan internal kampus.', '2026-08-17 18:35:10', '2026-08-17 18:35:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_harian_teknisi`
--

CREATE TABLE `log_harian_teknisi` (
  `id` int NOT NULL,
  `teknisi_id` int NOT NULL,
  `tanggal` date NOT NULL,
  `deskripsi_kegiatan` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `log_harian_teknisi`
--

INSERT INTO `log_harian_teknisi` (`id`, `teknisi_id`, `tanggal`, `deskripsi_kegiatan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2026-04-20', 'Pengecekan PC LAB 6 dan maintenance rutin.', '2026-04-20 01:19:57', '2026-04-20 01:19:57', NULL),
(2, 1, '2026-07-19', 'Melakukan pengecekan rutin perangkat jaringan di ruang server dan memastikan seluruh perangkat berfungsi dengan baik.', '2026-07-23 02:04:07', '2026-07-23 02:04:07', NULL),
(3, 2, '2026-07-20', 'Melakukan perbaikan printer kantor yang mengalami paper jam serta melakukan pengujian setelah perbaikan.', '2026-07-23 02:04:07', '2026-07-23 02:04:07', NULL),
(4, 3, '2026-07-21', 'Melakukan instalasi aplikasi pendukung pada komputer pengguna beserta konfigurasi sesuai kebutuhan operasional.', '2026-07-23 02:04:07', '2026-07-23 02:04:07', NULL),
(5, 1, '2026-07-22', 'Menangani laporan gangguan koneksi internet pada beberapa unit kerja dan mengganti kabel LAN yang rusak.', '2026-07-23 02:04:07', '2026-07-23 02:04:07', NULL),
(6, 2, '2026-07-23', 'Melakukan backup data server harian, pengecekan kapasitas penyimpanan, serta dokumentasi hasil pekerjaan.', '2026-07-23 02:04:07', '2026-07-23 02:04:07', NULL),
(52, 7, '2026-09-01', 'aGaojge', '2026-08-31 18:55:40', '2026-08-31 18:55:40', NULL);

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
(53, '2026_09_01_020816_add_dashboard_indexes_to_log_perbaikan_table', 6);

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
(3, 'App\\Models\\User', 3),
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

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(7, 4, 'ateafea', 15, 'taefae', 'Open', '2026-08-19 19:20:17', '2026-08-19 19:55:14', NULL);

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
(11, 8, 3, 'Printer P3SDI Rusak', 'Inventaris Kantor', 'tidak dapat digunakan untuk print', 'Open', '2026-07-20 21:31:34', '2026-07-20 21:31:34', NULL),
(12, 4, 2, 'Printer Rusak', 'Inventaris Kantor', 'faeteat', 'Open', '2026-08-13 21:02:06', '2026-08-19 19:28:27', NULL),
(13, 5, 3, 'UJI COBA', 'Lainnya', 'UJI COBA', 'Open', '2026-08-17 18:31:16', '2026-08-17 18:31:16', NULL);

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
(4, 'Eko', 'eko@iwima.edu', '$2y$12$yUPwLon/upMN2ZXOzKqDg.wgArxpzUaFJJ6RC2gbgIBACwRKSNHY6', 'pemohon', 'jTRlahb21OIV1IlHRtNRE3i38VlcZHTcDsX44twhFbBd4BV1ZRXxaR9dfGd9', 'Kaprodi Teknik', '2026-04-20 01:19:57', '2026-08-24 02:41:48'),
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
  ADD KEY `user_id` (`user_id`);

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
  ADD KEY `teknisi_id` (`teknisi_id`);

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
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `log_data_pengajuan_barang`
--
ALTER TABLE `log_data_pengajuan_barang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `log_data_tiket_perbaikan`
--
ALTER TABLE `log_data_tiket_perbaikan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

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
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT untuk tabel `pengajuan_barang`
--
ALTER TABLE `pengajuan_barang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_laporan_barang`  AS SELECT `b`.`id` AS `no_pengajuan`, `u`.`name` AS `nama_pemohon`, `u`.`unit_bidang` AS `unit_bidang`, `b`.`nama_barang` AS `nama_barang`, `b`.`jumlah` AS `jumlah`, `b`.`alasan` AS `alasan`, `b`.`status` AS `status`, `b`.`created_at` AS `waktu_pengajuan` FROM (`pengajuan_barang` `b` join `users` `u` on((`b`.`user_id` = `u`.`id`))) ;

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
  ADD CONSTRAINT `log_harian_teknisi_ibfk_1` FOREIGN KEY (`teknisi_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

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
