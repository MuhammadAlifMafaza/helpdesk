-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 26, 2026 at 06:16 AM
-- Server version: 26.7.0
-- PHP Version: 8.5.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helpdesk_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-boost:mcp:database-schema:mysql::1:0:0:0', 'a:2:{s:6:\"engine\";s:5:\"mysql\";s:6:\"tables\";a:22:{s:5:\"cache\";a:3:{s:3:\"key\";s:12:\"varchar(255)\";s:5:\"value\";s:10:\"mediumtext\";s:10:\"expiration\";s:6:\"bigint\";}s:11:\"cache_locks\";a:3:{s:3:\"key\";s:12:\"varchar(255)\";s:5:\"owner\";s:12:\"varchar(255)\";s:10:\"expiration\";s:6:\"bigint\";}s:11:\"failed_jobs\";a:7:{s:2:\"id\";s:15:\"bigint unsigned\";s:4:\"uuid\";s:12:\"varchar(255)\";s:10:\"connection\";s:12:\"varchar(255)\";s:5:\"queue\";s:12:\"varchar(255)\";s:7:\"payload\";s:8:\"longtext\";s:9:\"exception\";s:8:\"longtext\";s:9:\"failed_at\";s:9:\"timestamp\";}s:4:\"jobs\";a:7:{s:2:\"id\";s:15:\"bigint unsigned\";s:5:\"queue\";s:12:\"varchar(255)\";s:7:\"payload\";s:8:\"longtext\";s:8:\"attempts\";s:17:\"smallint unsigned\";s:11:\"reserved_at\";s:12:\"int unsigned\";s:12:\"available_at\";s:12:\"int unsigned\";s:10:\"created_at\";s:12:\"int unsigned\";}s:16:\"kegiatan_petugas\";a:5:{s:2:\"id\";s:15:\"bigint unsigned\";s:11:\"kegiatan_id\";s:3:\"int\";s:10:\"petugas_id\";s:3:\"int\";s:10:\"created_at\";s:9:\"timestamp\";s:10:\"updated_at\";s:9:\"timestamp\";}s:25:\"log_data_pengajuan_barang\";a:8:{s:2:\"id\";s:12:\"int unsigned\";s:12:\"pengajuan_id\";s:12:\"int unsigned\";s:7:\"user_id\";s:12:\"int unsigned\";s:12:\"kategori_log\";s:62:\"enum(\'Status\',\'Chat\',\'Update Data\',\'Delete Data\',\'Konfirmasi\')\";s:9:\"data_lama\";s:12:\"varchar(255)\";s:9:\"data_baru\";s:12:\"varchar(255)\";s:10:\"keterangan\";s:4:\"text\";s:10:\"created_at\";s:9:\"timestamp\";}s:24:\"log_data_tiket_perbaikan\";a:8:{s:2:\"id\";s:12:\"int unsigned\";s:8:\"tiket_id\";s:12:\"int unsigned\";s:7:\"user_id\";s:12:\"int unsigned\";s:12:\"kategori_log\";s:62:\"enum(\'Status\',\'Chat\',\'Update Data\',\'Delete Data\',\'Konfirmasi\')\";s:9:\"data_lama\";s:12:\"varchar(255)\";s:9:\"data_baru\";s:12:\"varchar(255)\";s:10:\"keterangan\";s:4:\"text\";s:10:\"created_at\";s:9:\"timestamp\";}s:18:\"log_harian_teknisi\";a:8:{s:2:\"id\";s:12:\"int unsigned\";s:10:\"teknisi_id\";s:12:\"int unsigned\";s:10:\"ruangan_id\";s:12:\"int unsigned\";s:7:\"tanggal\";s:4:\"date\";s:18:\"deskripsi_kegiatan\";s:4:\"text\";s:10:\"created_at\";s:9:\"timestamp\";s:10:\"updated_at\";s:9:\"timestamp\";s:10:\"deleted_at\";s:9:\"timestamp\";}s:22:\"master_kategori_barang\";a:7:{s:2:\"id\";s:15:\"bigint unsigned\";s:13:\"nama_kategori\";s:12:\"varchar(100)\";s:9:\"deskripsi\";s:4:\"text\";s:9:\"is_active\";s:10:\"tinyint(1)\";s:10:\"created_at\";s:9:\"timestamp\";s:10:\"updated_at\";s:9:\"timestamp\";s:10:\"deleted_at\";s:9:\"timestamp\";}s:14:\"master_ruangan\";a:6:{s:2:\"id\";s:12:\"int unsigned\";s:12:\"nama_ruangan\";s:12:\"varchar(100)\";s:11:\"nama_gedung\";s:12:\"varchar(100)\";s:9:\"is_active\";s:10:\"tinyint(1)\";s:10:\"created_at\";s:9:\"timestamp\";s:10:\"updated_at\";s:9:\"timestamp\";}s:10:\"migrations\";a:3:{s:2:\"id\";s:12:\"int unsigned\";s:9:\"migration\";s:12:\"varchar(255)\";s:5:\"batch\";s:3:\"int\";}s:21:\"model_has_permissions\";a:3:{s:13:\"permission_id\";s:15:\"bigint unsigned\";s:10:\"model_type\";s:12:\"varchar(255)\";s:8:\"model_id\";s:15:\"bigint unsigned\";}s:15:\"model_has_roles\";a:3:{s:7:\"role_id\";s:15:\"bigint unsigned\";s:10:\"model_type\";s:12:\"varchar(255)\";s:8:\"model_id\";s:15:\"bigint unsigned\";}s:13:\"notifications\";a:8:{s:2:\"id\";s:8:\"char(36)\";s:4:\"type\";s:12:\"varchar(255)\";s:15:\"notifiable_type\";s:12:\"varchar(255)\";s:13:\"notifiable_id\";s:15:\"bigint unsigned\";s:4:\"data\";s:4:\"text\";s:7:\"read_at\";s:9:\"timestamp\";s:10:\"created_at\";s:9:\"timestamp\";s:10:\"updated_at\";s:9:\"timestamp\";}s:21:\"password_reset_tokens\";a:3:{s:5:\"email\";s:12:\"varchar(255)\";s:5:\"token\";s:12:\"varchar(255)\";s:10:\"created_at\";s:9:\"timestamp\";}s:16:\"pengajuan_barang\";a:16:{s:2:\"id\";s:12:\"int unsigned\";s:7:\"user_id\";s:12:\"int unsigned\";s:18:\"kategori_barang_id\";s:15:\"bigint unsigned\";s:11:\"nama_barang\";s:12:\"varchar(255)\";s:18:\"spesifikasi_barang\";s:4:\"text\";s:6:\"jumlah\";s:12:\"int unsigned\";s:6:\"alasan\";s:4:\"text\";s:6:\"status\";s:34:\"enum(\'Open\',\'In Progress\',\'Close\')\";s:17:\"konfirmasi_status\";s:11:\"varchar(30)\";s:13:\"konfirmasi_at\";s:9:\"timestamp\";s:18:\"konfirmasi_catatan\";s:4:\"text\";s:10:\"created_at\";s:9:\"timestamp\";s:10:\"updated_at\";s:9:\"timestamp\";s:10:\"deleted_at\";s:9:\"timestamp\";s:18:\"contoh_barang_path\";s:13:\"varchar(1024)\";s:17:\"contoh_barang_url\";s:13:\"varchar(2048)\";}s:11:\"permissions\";a:5:{s:2:\"id\";s:15:\"bigint unsigned\";s:4:\"name\";s:12:\"varchar(255)\";s:10:\"guard_name\";s:12:\"varchar(255)\";s:10:\"created_at\";s:9:\"timestamp\";s:10:\"updated_at\";s:9:\"timestamp\";}s:20:\"role_has_permissions\";a:2:{s:13:\"permission_id\";s:15:\"bigint unsigned\";s:7:\"role_id\";s:15:\"bigint unsigned\";}s:5:\"roles\";a:5:{s:2:\"id\";s:15:\"bigint unsigned\";s:4:\"name\";s:12:\"varchar(255)\";s:10:\"guard_name\";s:12:\"varchar(255)\";s:10:\"created_at\";s:9:\"timestamp\";s:10:\"updated_at\";s:9:\"timestamp\";}s:8:\"sessions\";a:6:{s:2:\"id\";s:12:\"varchar(255)\";s:7:\"user_id\";s:15:\"bigint unsigned\";s:10:\"ip_address\";s:11:\"varchar(45)\";s:10:\"user_agent\";s:4:\"text\";s:7:\"payload\";s:8:\"longtext\";s:13:\"last_activity\";s:3:\"int\";}s:15:\"tiket_perbaikan\";a:13:{s:2:\"id\";s:12:\"int unsigned\";s:7:\"user_id\";s:12:\"int unsigned\";s:10:\"ruangan_id\";s:12:\"int unsigned\";s:7:\"keluhan\";s:12:\"varchar(255)\";s:11:\"kepemilikan\";s:45:\"enum(\'Inventaris Kantor\',\'Pribadi\',\'Lainnya\')\";s:9:\"deskripsi\";s:4:\"text\";s:6:\"status\";s:34:\"enum(\'Open\',\'In Progress\',\'Close\')\";s:17:\"konfirmasi_status\";s:11:\"varchar(30)\";s:13:\"konfirmasi_at\";s:9:\"timestamp\";s:18:\"konfirmasi_catatan\";s:4:\"text\";s:10:\"created_at\";s:9:\"timestamp\";s:10:\"updated_at\";s:9:\"timestamp\";s:10:\"deleted_at\";s:9:\"timestamp\";}s:5:\"users\";a:12:{s:2:\"id\";s:12:\"int unsigned\";s:8:\"login_id\";s:12:\"varchar(100)\";s:4:\"name\";s:12:\"varchar(100)\";s:5:\"email\";s:12:\"varchar(100)\";s:17:\"email_verified_at\";s:9:\"timestamp\";s:8:\"password\";s:12:\"varchar(255)\";s:4:\"role\";s:33:\"enum(\'pemohon\',\'teknisi\',\'admin\')\";s:14:\"remember_token\";s:12:\"varchar(100)\";s:11:\"unit_bidang\";s:12:\"varchar(100)\";s:10:\"created_at\";s:9:\"timestamp\";s:10:\"updated_at\";s:9:\"timestamp\";s:11:\"preferences\";s:4:\"json\";}}}', 1795673357),
('laravel-cache-boost:mcp:database-schema:mysql:log_data:0:0:0:1', 'a:2:{s:6:\"engine\";s:5:\"mysql\";s:6:\"tables\";a:2:{s:25:\"log_data_pengajuan_barang\";a:5:{s:7:\"columns\";a:8:{s:2:\"id\";a:4:{s:4:\"type\";s:12:\"int unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:1;}s:12:\"pengajuan_id\";a:4:{s:4:\"type\";s:12:\"int unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:7:\"user_id\";a:4:{s:4:\"type\";s:12:\"int unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:12:\"kategori_log\";a:4:{s:4:\"type\";s:62:\"enum(\'Status\',\'Chat\',\'Update Data\',\'Delete Data\',\'Konfirmasi\')\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:9:\"data_lama\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:9:\"data_baru\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"keterangan\";a:4:{s:4:\"type\";s:4:\"text\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"created_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";s:17:\"CURRENT_TIMESTAMP\";s:14:\"auto_increment\";b:0;}}s:7:\"indexes\";a:3:{s:41:\"log_data_pengajuan_barang_user_id_foreign\";a:4:{s:7:\"columns\";a:1:{i:0;s:7:\"user_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:27:\"log_pengajuan_status_lookup\";a:4:{s:7:\"columns\";a:4:{i:0;s:12:\"pengajuan_id\";i:1;s:12:\"kategori_log\";i:2;s:9:\"data_baru\";i:3;s:10:\"created_at\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}}s:12:\"foreign_keys\";a:2:{i:0;a:7:{s:4:\"name\";s:46:\"log_data_pengajuan_barang_pengajuan_id_foreign\";s:7:\"columns\";a:1:{i:0;s:12:\"pengajuan_id\";}s:14:\"foreign_schema\";s:11:\"helpdesk_db\";s:13:\"foreign_table\";s:16:\"pengajuan_barang\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:9:\"no action\";s:9:\"on_delete\";s:7:\"cascade\";}i:1;a:7:{s:4:\"name\";s:41:\"log_data_pengajuan_barang_user_id_foreign\";s:7:\"columns\";a:1:{i:0;s:7:\"user_id\";}s:14:\"foreign_schema\";s:11:\"helpdesk_db\";s:13:\"foreign_table\";s:5:\"users\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:9:\"no action\";s:9:\"on_delete\";s:9:\"no action\";}}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}s:24:\"log_data_tiket_perbaikan\";a:5:{s:7:\"columns\";a:8:{s:2:\"id\";a:4:{s:4:\"type\";s:12:\"int unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:1;}s:8:\"tiket_id\";a:4:{s:4:\"type\";s:12:\"int unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:7:\"user_id\";a:4:{s:4:\"type\";s:12:\"int unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:12:\"kategori_log\";a:4:{s:4:\"type\";s:62:\"enum(\'Status\',\'Chat\',\'Update Data\',\'Delete Data\',\'Konfirmasi\')\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:9:\"data_lama\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:9:\"data_baru\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"keterangan\";a:4:{s:4:\"type\";s:4:\"text\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"created_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";s:17:\"CURRENT_TIMESTAMP\";s:14:\"auto_increment\";b:0;}}s:7:\"indexes\";a:4:{s:27:\"log_teknisi_activity_lookup\";a:4:{s:7:\"columns\";a:2:{i:0;s:7:\"user_id\";i:1;s:10:\"created_at\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:25:\"log_teknisi_status_lookup\";a:4:{s:7:\"columns\";a:4:{i:0;s:7:\"user_id\";i:1;s:12:\"kategori_log\";i:2;s:9:\"data_baru\";i:3;s:10:\"created_at\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:23:\"log_tiket_status_lookup\";a:4:{s:7:\"columns\";a:4:{i:0;s:8:\"tiket_id\";i:1;s:12:\"kategori_log\";i:2;s:9:\"data_baru\";i:3;s:10:\"created_at\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}}s:12:\"foreign_keys\";a:2:{i:0;a:7:{s:4:\"name\";s:41:\"log_data_tiket_perbaikan_tiket_id_foreign\";s:7:\"columns\";a:1:{i:0;s:8:\"tiket_id\";}s:14:\"foreign_schema\";s:11:\"helpdesk_db\";s:13:\"foreign_table\";s:15:\"tiket_perbaikan\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:9:\"no action\";s:9:\"on_delete\";s:7:\"cascade\";}i:1;a:7:{s:4:\"name\";s:40:\"log_data_tiket_perbaikan_user_id_foreign\";s:7:\"columns\";a:1:{i:0;s:7:\"user_id\";}s:14:\"foreign_schema\";s:11:\"helpdesk_db\";s:13:\"foreign_table\";s:5:\"users\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:9:\"no action\";s:9:\"on_delete\";s:9:\"no action\";}}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}}}', 1795673437),
('laravel-cache-boost:mcp:database-schema:mysql:pengajuan_barang:0:0:0:1', 'a:2:{s:6:\"engine\";s:5:\"mysql\";s:6:\"tables\";a:2:{s:25:\"log_data_pengajuan_barang\";a:5:{s:7:\"columns\";a:8:{s:2:\"id\";a:4:{s:4:\"type\";s:12:\"int unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:1;}s:12:\"pengajuan_id\";a:4:{s:4:\"type\";s:12:\"int unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:7:\"user_id\";a:4:{s:4:\"type\";s:12:\"int unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:12:\"kategori_log\";a:4:{s:4:\"type\";s:62:\"enum(\'Status\',\'Chat\',\'Update Data\',\'Delete Data\',\'Konfirmasi\')\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:9:\"data_lama\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:9:\"data_baru\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"keterangan\";a:4:{s:4:\"type\";s:4:\"text\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"created_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";s:17:\"CURRENT_TIMESTAMP\";s:14:\"auto_increment\";b:0;}}s:7:\"indexes\";a:3:{s:41:\"log_data_pengajuan_barang_user_id_foreign\";a:4:{s:7:\"columns\";a:1:{i:0;s:7:\"user_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:27:\"log_pengajuan_status_lookup\";a:4:{s:7:\"columns\";a:4:{i:0;s:12:\"pengajuan_id\";i:1;s:12:\"kategori_log\";i:2;s:9:\"data_baru\";i:3;s:10:\"created_at\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}}s:12:\"foreign_keys\";a:2:{i:0;a:7:{s:4:\"name\";s:46:\"log_data_pengajuan_barang_pengajuan_id_foreign\";s:7:\"columns\";a:1:{i:0;s:12:\"pengajuan_id\";}s:14:\"foreign_schema\";s:11:\"helpdesk_db\";s:13:\"foreign_table\";s:16:\"pengajuan_barang\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:9:\"no action\";s:9:\"on_delete\";s:7:\"cascade\";}i:1;a:7:{s:4:\"name\";s:41:\"log_data_pengajuan_barang_user_id_foreign\";s:7:\"columns\";a:1:{i:0;s:7:\"user_id\";}s:14:\"foreign_schema\";s:11:\"helpdesk_db\";s:13:\"foreign_table\";s:5:\"users\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:9:\"no action\";s:9:\"on_delete\";s:9:\"no action\";}}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}s:16:\"pengajuan_barang\";a:5:{s:7:\"columns\";a:16:{s:2:\"id\";a:4:{s:4:\"type\";s:12:\"int unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:1;}s:7:\"user_id\";a:4:{s:4:\"type\";s:12:\"int unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:18:\"kategori_barang_id\";a:4:{s:4:\"type\";s:15:\"bigint unsigned\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:11:\"nama_barang\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:18:\"spesifikasi_barang\";a:4:{s:4:\"type\";s:4:\"text\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:6:\"jumlah\";a:4:{s:4:\"type\";s:12:\"int unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";s:1:\"1\";s:14:\"auto_increment\";b:0;}s:6:\"alasan\";a:4:{s:4:\"type\";s:4:\"text\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:6:\"status\";a:4:{s:4:\"type\";s:34:\"enum(\'Open\',\'In Progress\',\'Close\')\";s:8:\"nullable\";b:1;s:7:\"default\";s:4:\"Open\";s:14:\"auto_increment\";b:0;}s:17:\"konfirmasi_status\";a:4:{s:4:\"type\";s:11:\"varchar(30)\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:13:\"konfirmasi_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:18:\"konfirmasi_catatan\";a:4:{s:4:\"type\";s:4:\"text\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"created_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"updated_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"deleted_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:18:\"contoh_barang_path\";a:4:{s:4:\"type\";s:13:\"varchar(1024)\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:17:\"contoh_barang_url\";a:4:{s:4:\"type\";s:13:\"varchar(2048)\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}}s:7:\"indexes\";a:5:{s:33:\"pengajuan_barang_created_at_index\";a:4:{s:7:\"columns\";a:1:{i:0;s:10:\"created_at\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:43:\"pengajuan_barang_kategori_barang_id_foreign\";a:4:{s:7:\"columns\";a:1:{i:0;s:18:\"kategori_barang_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:29:\"pengajuan_barang_status_index\";a:4:{s:7:\"columns\";a:1:{i:0;s:6:\"status\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:32:\"pengajuan_barang_user_id_foreign\";a:4:{s:7:\"columns\";a:1:{i:0;s:7:\"user_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}}s:12:\"foreign_keys\";a:2:{i:0;a:7:{s:4:\"name\";s:43:\"pengajuan_barang_kategori_barang_id_foreign\";s:7:\"columns\";a:1:{i:0;s:18:\"kategori_barang_id\";}s:14:\"foreign_schema\";s:11:\"helpdesk_db\";s:13:\"foreign_table\";s:22:\"master_kategori_barang\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:7:\"cascade\";s:9:\"on_delete\";s:8:\"restrict\";}i:1;a:7:{s:4:\"name\";s:32:\"pengajuan_barang_user_id_foreign\";s:7:\"columns\";a:1:{i:0;s:7:\"user_id\";}s:14:\"foreign_schema\";s:11:\"helpdesk_db\";s:13:\"foreign_table\";s:5:\"users\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:9:\"no action\";s:9:\"on_delete\";s:9:\"no action\";}}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}}}', 1795673436),
('laravel-cache-boost:mcp:database-schema:mysql:tiket_perbaikan:0:0:0:1', 'a:2:{s:6:\"engine\";s:5:\"mysql\";s:6:\"tables\";a:2:{s:24:\"log_data_tiket_perbaikan\";a:5:{s:7:\"columns\";a:8:{s:2:\"id\";a:4:{s:4:\"type\";s:12:\"int unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:1;}s:8:\"tiket_id\";a:4:{s:4:\"type\";s:12:\"int unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:7:\"user_id\";a:4:{s:4:\"type\";s:12:\"int unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:12:\"kategori_log\";a:4:{s:4:\"type\";s:62:\"enum(\'Status\',\'Chat\',\'Update Data\',\'Delete Data\',\'Konfirmasi\')\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:9:\"data_lama\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:9:\"data_baru\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"keterangan\";a:4:{s:4:\"type\";s:4:\"text\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"created_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";s:17:\"CURRENT_TIMESTAMP\";s:14:\"auto_increment\";b:0;}}s:7:\"indexes\";a:4:{s:27:\"log_teknisi_activity_lookup\";a:4:{s:7:\"columns\";a:2:{i:0;s:7:\"user_id\";i:1;s:10:\"created_at\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:25:\"log_teknisi_status_lookup\";a:4:{s:7:\"columns\";a:4:{i:0;s:7:\"user_id\";i:1;s:12:\"kategori_log\";i:2;s:9:\"data_baru\";i:3;s:10:\"created_at\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:23:\"log_tiket_status_lookup\";a:4:{s:7:\"columns\";a:4:{i:0;s:8:\"tiket_id\";i:1;s:12:\"kategori_log\";i:2;s:9:\"data_baru\";i:3;s:10:\"created_at\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}}s:12:\"foreign_keys\";a:2:{i:0;a:7:{s:4:\"name\";s:41:\"log_data_tiket_perbaikan_tiket_id_foreign\";s:7:\"columns\";a:1:{i:0;s:8:\"tiket_id\";}s:14:\"foreign_schema\";s:11:\"helpdesk_db\";s:13:\"foreign_table\";s:15:\"tiket_perbaikan\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:9:\"no action\";s:9:\"on_delete\";s:7:\"cascade\";}i:1;a:7:{s:4:\"name\";s:40:\"log_data_tiket_perbaikan_user_id_foreign\";s:7:\"columns\";a:1:{i:0;s:7:\"user_id\";}s:14:\"foreign_schema\";s:11:\"helpdesk_db\";s:13:\"foreign_table\";s:5:\"users\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:9:\"no action\";s:9:\"on_delete\";s:9:\"no action\";}}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}s:15:\"tiket_perbaikan\";a:5:{s:7:\"columns\";a:13:{s:2:\"id\";a:4:{s:4:\"type\";s:12:\"int unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:1;}s:7:\"user_id\";a:4:{s:4:\"type\";s:12:\"int unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"ruangan_id\";a:4:{s:4:\"type\";s:12:\"int unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:7:\"keluhan\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:11:\"kepemilikan\";a:4:{s:4:\"type\";s:45:\"enum(\'Inventaris Kantor\',\'Pribadi\',\'Lainnya\')\";s:8:\"nullable\";b:1;s:7:\"default\";s:17:\"Inventaris Kantor\";s:14:\"auto_increment\";b:0;}s:9:\"deskripsi\";a:4:{s:4:\"type\";s:4:\"text\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:6:\"status\";a:4:{s:4:\"type\";s:34:\"enum(\'Open\',\'In Progress\',\'Close\')\";s:8:\"nullable\";b:1;s:7:\"default\";s:4:\"Open\";s:14:\"auto_increment\";b:0;}s:17:\"konfirmasi_status\";a:4:{s:4:\"type\";s:11:\"varchar(30)\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:13:\"konfirmasi_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:18:\"konfirmasi_catatan\";a:4:{s:4:\"type\";s:4:\"text\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"created_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"updated_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"deleted_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}}s:7:\"indexes\";a:5:{s:14:\"idx_created_at\";a:4:{s:7:\"columns\";a:1:{i:0;s:10:\"created_at\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:10:\"idx_status\";a:4:{s:7:\"columns\";a:1:{i:0;s:6:\"status\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}s:34:\"tiket_perbaikan_ruangan_id_foreign\";a:4:{s:7:\"columns\";a:1:{i:0;s:10:\"ruangan_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:31:\"tiket_perbaikan_user_id_foreign\";a:4:{s:7:\"columns\";a:1:{i:0;s:7:\"user_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}}s:12:\"foreign_keys\";a:2:{i:0;a:7:{s:4:\"name\";s:34:\"tiket_perbaikan_ruangan_id_foreign\";s:7:\"columns\";a:1:{i:0;s:10:\"ruangan_id\";}s:14:\"foreign_schema\";s:11:\"helpdesk_db\";s:13:\"foreign_table\";s:14:\"master_ruangan\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:9:\"no action\";s:9:\"on_delete\";s:9:\"no action\";}i:1;a:7:{s:4:\"name\";s:31:\"tiket_perbaikan_user_id_foreign\";s:7:\"columns\";a:1:{i:0;s:7:\"user_id\";}s:14:\"foreign_schema\";s:11:\"helpdesk_db\";s:13:\"foreign_table\";s:5:\"users\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:9:\"no action\";s:9:\"on_delete\";s:9:\"no action\";}}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}}}', 1795673437),
('laravel-cache-spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:160:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:23:\"ViewAny:KegiatanTeknisi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:20:\"View:KegiatanTeknisi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:22:\"Create:KegiatanTeknisi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:22:\"Update:KegiatanTeknisi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:22:\"Delete:KegiatanTeknisi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:25:\"DeleteAny:KegiatanTeknisi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:23:\"Restore:KegiatanTeknisi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:27:\"ForceDelete:KegiatanTeknisi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:30:\"ForceDeleteAny:KegiatanTeknisi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:26:\"RestoreAny:KegiatanTeknisi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:25:\"Replicate:KegiatanTeknisi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:23:\"Reorder:KegiatanTeknisi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:23:\"ViewAny:LaporanKegiatan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:20:\"View:LaporanKegiatan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:22:\"Create:LaporanKegiatan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:22:\"Update:LaporanKegiatan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:22:\"Delete:LaporanKegiatan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:25:\"DeleteAny:LaporanKegiatan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:23:\"Restore:LaporanKegiatan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:27:\"ForceDelete:LaporanKegiatan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:30:\"ForceDeleteAny:LaporanKegiatan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:26:\"RestoreAny:LaporanKegiatan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:25:\"Replicate:LaporanKegiatan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:23:\"Reorder:LaporanKegiatan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:24:\"ViewAny:LaporanPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:21:\"View:LaporanPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:23:\"Create:LaporanPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:23:\"Update:LaporanPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:23:\"Delete:LaporanPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:26:\"DeleteAny:LaporanPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:24:\"Restore:LaporanPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:28:\"ForceDelete:LaporanPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:31:\"ForceDeleteAny:LaporanPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:27:\"RestoreAny:LaporanPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:26:\"Replicate:LaporanPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:24:\"Reorder:LaporanPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:31:\"ViewAny:LaporanPermintaanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:28:\"View:LaporanPermintaanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:30:\"Create:LaporanPermintaanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:30:\"Update:LaporanPermintaanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:30:\"Delete:LaporanPermintaanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:33:\"DeleteAny:LaporanPermintaanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:31:\"Restore:LaporanPermintaanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:43;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:35:\"ForceDelete:LaporanPermintaanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:44;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:38:\"ForceDeleteAny:LaporanPermintaanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:45;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:34:\"RestoreAny:LaporanPermintaanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:46;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:33:\"Replicate:LaporanPermintaanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:47;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:31:\"Reorder:LaporanPermintaanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:48;a:4:{s:1:\"a\";i:49;s:1:\"b\";s:20:\"ViewAny:LogPengajuan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:49;a:4:{s:1:\"a\";i:50;s:1:\"b\";s:17:\"View:LogPengajuan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:50;a:4:{s:1:\"a\";i:51;s:1:\"b\";s:19:\"Create:LogPengajuan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:51;a:4:{s:1:\"a\";i:52;s:1:\"b\";s:19:\"Update:LogPengajuan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:52;a:4:{s:1:\"a\";i:53;s:1:\"b\";s:19:\"Delete:LogPengajuan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:53;a:4:{s:1:\"a\";i:54;s:1:\"b\";s:22:\"DeleteAny:LogPengajuan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:54;a:4:{s:1:\"a\";i:55;s:1:\"b\";s:20:\"Restore:LogPengajuan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:55;a:4:{s:1:\"a\";i:56;s:1:\"b\";s:24:\"ForceDelete:LogPengajuan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:56;a:4:{s:1:\"a\";i:57;s:1:\"b\";s:27:\"ForceDeleteAny:LogPengajuan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:57;a:4:{s:1:\"a\";i:58;s:1:\"b\";s:23:\"RestoreAny:LogPengajuan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:58;a:4:{s:1:\"a\";i:59;s:1:\"b\";s:22:\"Replicate:LogPengajuan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:59;a:4:{s:1:\"a\";i:60;s:1:\"b\";s:20:\"Reorder:LogPengajuan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:60;a:4:{s:1:\"a\";i:61;s:1:\"b\";s:20:\"ViewAny:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:61;a:4:{s:1:\"a\";i:62;s:1:\"b\";s:17:\"View:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:62;a:4:{s:1:\"a\";i:63;s:1:\"b\";s:19:\"Create:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:63;a:4:{s:1:\"a\";i:64;s:1:\"b\";s:19:\"Update:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:64;a:4:{s:1:\"a\";i:65;s:1:\"b\";s:19:\"Delete:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:65;a:4:{s:1:\"a\";i:66;s:1:\"b\";s:22:\"DeleteAny:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:66;a:4:{s:1:\"a\";i:67;s:1:\"b\";s:20:\"Restore:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:67;a:4:{s:1:\"a\";i:68;s:1:\"b\";s:24:\"ForceDelete:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:68;a:4:{s:1:\"a\";i:69;s:1:\"b\";s:27:\"ForceDeleteAny:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:69;a:4:{s:1:\"a\";i:70;s:1:\"b\";s:23:\"RestoreAny:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:70;a:4:{s:1:\"a\";i:71;s:1:\"b\";s:22:\"Replicate:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:71;a:4:{s:1:\"a\";i:72;s:1:\"b\";s:20:\"Reorder:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:72;a:4:{s:1:\"a\";i:73;s:1:\"b\";s:28:\"ViewAny:MasterKategoriBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:73;a:4:{s:1:\"a\";i:74;s:1:\"b\";s:25:\"View:MasterKategoriBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:74;a:4:{s:1:\"a\";i:75;s:1:\"b\";s:27:\"Create:MasterKategoriBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:75;a:4:{s:1:\"a\";i:76;s:1:\"b\";s:27:\"Update:MasterKategoriBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:76;a:4:{s:1:\"a\";i:77;s:1:\"b\";s:27:\"Delete:MasterKategoriBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:77;a:4:{s:1:\"a\";i:78;s:1:\"b\";s:30:\"DeleteAny:MasterKategoriBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:78;a:4:{s:1:\"a\";i:79;s:1:\"b\";s:28:\"Restore:MasterKategoriBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:79;a:4:{s:1:\"a\";i:80;s:1:\"b\";s:32:\"ForceDelete:MasterKategoriBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:80;a:4:{s:1:\"a\";i:81;s:1:\"b\";s:35:\"ForceDeleteAny:MasterKategoriBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:81;a:4:{s:1:\"a\";i:82;s:1:\"b\";s:31:\"RestoreAny:MasterKategoriBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:82;a:4:{s:1:\"a\";i:83;s:1:\"b\";s:30:\"Replicate:MasterKategoriBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:83;a:4:{s:1:\"a\";i:84;s:1:\"b\";s:28:\"Reorder:MasterKategoriBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:84;a:4:{s:1:\"a\";i:85;s:1:\"b\";s:21:\"ViewAny:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:85;a:4:{s:1:\"a\";i:86;s:1:\"b\";s:18:\"View:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:86;a:4:{s:1:\"a\";i:87;s:1:\"b\";s:20:\"Create:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:87;a:4:{s:1:\"a\";i:88;s:1:\"b\";s:20:\"Update:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:88;a:4:{s:1:\"a\";i:89;s:1:\"b\";s:20:\"Delete:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:89;a:4:{s:1:\"a\";i:90;s:1:\"b\";s:23:\"DeleteAny:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:90;a:4:{s:1:\"a\";i:91;s:1:\"b\";s:21:\"Restore:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:91;a:4:{s:1:\"a\";i:92;s:1:\"b\";s:25:\"ForceDelete:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:92;a:4:{s:1:\"a\";i:93;s:1:\"b\";s:28:\"ForceDeleteAny:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:93;a:4:{s:1:\"a\";i:94;s:1:\"b\";s:24:\"RestoreAny:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:94;a:4:{s:1:\"a\";i:95;s:1:\"b\";s:23:\"Replicate:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:95;a:4:{s:1:\"a\";i:96;s:1:\"b\";s:21:\"Reorder:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:96;a:4:{s:1:\"a\";i:97;s:1:\"b\";s:23:\"ViewAny:PengajuanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:97;a:4:{s:1:\"a\";i:98;s:1:\"b\";s:20:\"View:PengajuanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:98;a:4:{s:1:\"a\";i:99;s:1:\"b\";s:22:\"Create:PengajuanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:99;a:4:{s:1:\"a\";i:100;s:1:\"b\";s:22:\"Update:PengajuanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:100;a:4:{s:1:\"a\";i:101;s:1:\"b\";s:22:\"Delete:PengajuanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:101;a:4:{s:1:\"a\";i:102;s:1:\"b\";s:25:\"DeleteAny:PengajuanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:102;a:4:{s:1:\"a\";i:103;s:1:\"b\";s:23:\"Restore:PengajuanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:103;a:4:{s:1:\"a\";i:104;s:1:\"b\";s:27:\"ForceDelete:PengajuanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:104;a:4:{s:1:\"a\";i:105;s:1:\"b\";s:30:\"ForceDeleteAny:PengajuanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:105;a:4:{s:1:\"a\";i:106;s:1:\"b\";s:26:\"RestoreAny:PengajuanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:106;a:4:{s:1:\"a\";i:107;s:1:\"b\";s:25:\"Replicate:PengajuanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:107;a:4:{s:1:\"a\";i:108;s:1:\"b\";s:23:\"Reorder:PengajuanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:108;a:4:{s:1:\"a\";i:109;s:1:\"b\";s:22:\"ViewAny:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:109;a:4:{s:1:\"a\";i:110;s:1:\"b\";s:19:\"View:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:110;a:4:{s:1:\"a\";i:111;s:1:\"b\";s:21:\"Create:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:111;a:4:{s:1:\"a\";i:112;s:1:\"b\";s:21:\"Update:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:112;a:4:{s:1:\"a\";i:113;s:1:\"b\";s:21:\"Delete:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:113;a:4:{s:1:\"a\";i:114;s:1:\"b\";s:24:\"DeleteAny:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:114;a:4:{s:1:\"a\";i:115;s:1:\"b\";s:22:\"Restore:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:115;a:4:{s:1:\"a\";i:116;s:1:\"b\";s:26:\"ForceDelete:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:116;a:4:{s:1:\"a\";i:117;s:1:\"b\";s:29:\"ForceDeleteAny:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:117;a:4:{s:1:\"a\";i:118;s:1:\"b\";s:25:\"RestoreAny:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:118;a:4:{s:1:\"a\";i:119;s:1:\"b\";s:24:\"Replicate:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:119;a:4:{s:1:\"a\";i:120;s:1:\"b\";s:22:\"Reorder:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:120;a:4:{s:1:\"a\";i:121;s:1:\"b\";s:12:\"ViewAny:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:121;a:4:{s:1:\"a\";i:122;s:1:\"b\";s:9:\"View:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:122;a:4:{s:1:\"a\";i:123;s:1:\"b\";s:11:\"Create:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:123;a:4:{s:1:\"a\";i:124;s:1:\"b\";s:11:\"Update:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:124;a:4:{s:1:\"a\";i:125;s:1:\"b\";s:11:\"Delete:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:125;a:4:{s:1:\"a\";i:126;s:1:\"b\";s:14:\"DeleteAny:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:126;a:4:{s:1:\"a\";i:127;s:1:\"b\";s:12:\"Restore:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:127;a:4:{s:1:\"a\";i:128;s:1:\"b\";s:16:\"ForceDelete:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:128;a:4:{s:1:\"a\";i:129;s:1:\"b\";s:19:\"ForceDeleteAny:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:129;a:4:{s:1:\"a\";i:130;s:1:\"b\";s:15:\"RestoreAny:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:130;a:4:{s:1:\"a\";i:131;s:1:\"b\";s:14:\"Replicate:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:131;a:4:{s:1:\"a\";i:132;s:1:\"b\";s:12:\"Reorder:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:132;a:4:{s:1:\"a\";i:133;s:1:\"b\";s:12:\"ViewAny:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:133;a:4:{s:1:\"a\";i:134;s:1:\"b\";s:9:\"View:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:134;a:4:{s:1:\"a\";i:135;s:1:\"b\";s:11:\"Create:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:135;a:4:{s:1:\"a\";i:136;s:1:\"b\";s:11:\"Update:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:136;a:4:{s:1:\"a\";i:137;s:1:\"b\";s:11:\"Delete:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:137;a:4:{s:1:\"a\";i:138;s:1:\"b\";s:14:\"DeleteAny:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:138;a:4:{s:1:\"a\";i:139;s:1:\"b\";s:12:\"Restore:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:139;a:4:{s:1:\"a\";i:140;s:1:\"b\";s:16:\"ForceDelete:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:140;a:4:{s:1:\"a\";i:141;s:1:\"b\";s:19:\"ForceDeleteAny:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:141;a:4:{s:1:\"a\";i:142;s:1:\"b\";s:15:\"RestoreAny:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:142;a:4:{s:1:\"a\";i:143;s:1:\"b\";s:14:\"Replicate:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:143;a:4:{s:1:\"a\";i:144;s:1:\"b\";s:12:\"Reorder:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:144;a:4:{s:1:\"a\";i:145;s:1:\"b\";s:20:\"View:AccountSecurity\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:145;a:4:{s:1:\"a\";i:146;s:1:\"b\";s:20:\"View:AccountSettings\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:146;a:4:{s:1:\"a\";i:147;s:1:\"b\";s:14:\"View:Dashboard\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:147;a:4:{s:1:\"a\";i:148;s:1:\"b\";s:9:\"View:Chat\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:148;a:4:{s:1:\"a\";i:149;s:1:\"b\";s:13:\"View:Timeline\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:149;a:4:{s:1:\"a\";i:150;s:1:\"b\";s:27:\"View:AdminLayananTrendChart\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:150;a:4:{s:1:\"a\";i:151;s:1:\"b\";s:18:\"View:AdminOverview\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:151;a:4:{s:1:\"a\";i:152;s:1:\"b\";s:20:\"View:TeknisiOverview\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:152;a:4:{s:1:\"a\";i:153;s:1:\"b\";s:23:\"View:TeknisiStatusChart\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:153;a:4:{s:1:\"a\";i:154;s:1:\"b\";s:28:\"View:AdminStatusLayananChart\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:154;a:4:{s:1:\"a\";i:155;s:1:\"b\";s:26:\"View:TeknisiAktivitasChart\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:155;a:4:{s:1:\"a\";i:156;s:1:\"b\";s:26:\"View:AdminTiketStatusChart\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:156;a:4:{s:1:\"a\";i:157;s:1:\"b\";s:22:\"View:TeknisiTiketAktif\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:157;a:4:{s:1:\"a\";i:158;s:1:\"b\";s:30:\"View:AdminPengajuanStatusChart\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:158;a:4:{s:1:\"a\";i:159;s:1:\"b\";s:22:\"View:AdminTiketTerbaru\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:159;a:4:{s:1:\"a\";i:160;s:1:\"b\";s:26:\"View:AdminPengajuanTerbaru\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:1:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:11:\"super_admin\";s:1:\"c\";s:3:\"web\";}}}', 1795759713);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `jobs`
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
-- Table structure for table `kegiatan_petugas`
--

CREATE TABLE `kegiatan_petugas` (
  `id` bigint UNSIGNED NOT NULL,
  `kegiatan_id` int NOT NULL,
  `petugas_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_data_pengajuan_barang`
--

CREATE TABLE `log_data_pengajuan_barang` (
  `id` int UNSIGNED NOT NULL,
  `pengajuan_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `kategori_log` enum('Status','Chat','Update Data','Delete Data','Konfirmasi') COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_lama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_baru` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_data_tiket_perbaikan`
--

CREATE TABLE `log_data_tiket_perbaikan` (
  `id` int UNSIGNED NOT NULL,
  `tiket_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `kategori_log` enum('Status','Chat','Update Data','Delete Data','Konfirmasi') COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_lama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_baru` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_harian_teknisi`
--

CREATE TABLE `log_harian_teknisi` (
  `id` int UNSIGNED NOT NULL,
  `teknisi_id` int UNSIGNED NOT NULL,
  `ruangan_id` int UNSIGNED DEFAULT NULL,
  `tanggal` date NOT NULL,
  `deskripsi_kegiatan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_kategori_barang`
--

CREATE TABLE `master_kategori_barang` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_kategori` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `master_kategori_barang`
--

INSERT INTO `master_kategori_barang` (`id`, `nama_kategori`, `deskripsi`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Komputer', 'Komputer desktop dan workstation untuk kebutuhan operasional kampus.', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(2, 'Laptop', 'Komputer jinjing untuk kebutuhan kerja, mengajar, dan kegiatan akademik.', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(3, 'Komponen Komputer', 'Komponen pengganti khusus untuk komputer desktop dan workstation.', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(4, 'Komponen Laptop', 'Komponen pengganti khusus untuk laptop dan notebook.', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(5, 'Monitor', 'Monitor untuk komputer, laboratorium, ruang kerja, dan fasilitas institut.', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(6, 'Proyektor', 'Proyektor dan perangkat display untuk kegiatan presentasi dan pembelajaran.', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(7, 'Perangkat Jaringan', 'Perangkat inti untuk membangun dan memelihara jaringan komputer.', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(8, 'Aksesori Jaringan', 'Kabel, konektor, adapter, dan aksesori instalasi jaringan.', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(9, 'Printer', 'Perangkat pencetak untuk kebutuhan administrasi dan akademik.', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(10, 'Scanner', 'Perangkat pemindai dokumen dan gambar.', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(11, 'Suku Cadang Printer', 'Komponen pengganti untuk perawatan dan perbaikan printer.', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(12, 'Bahan Habis Pakai Printer', 'Tinta, toner, kertas, dan bahan habis pakai untuk printer.', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(13, 'Peralatan Infrastruktur IT', 'Peralatan dan material pendukung infrastruktur teknologi informasi dan ruang server.', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(14, 'Peralatan Teknisi', 'Peralatan kerja untuk instalasi, perawatan, dan troubleshooting perangkat TI.', 1, '2026-11-26 05:48:01', '2026-11-26 06:09:01', NULL),
(15, 'Perangkat Presentasi', 'Perangkat untuk mendukung presentasi, rapat, dan kegiatan pembelajaran.', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(16, 'Perangkat Audio', 'Mikrofon, speaker, headset, dan perangkat pengolah suara.', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(17, 'Perangkat Video', 'Kamera, webcam, capture device, dan perangkat pengolah video.', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(18, 'Aksesori Komputer', 'Aksesori pendukung komputer seperti keyboard, mouse, dan adapter.', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(19, 'Periferal Komputer', 'Perangkat periferal komputer seperti webcam, headset, dan perangkat input tambahan.', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(20, 'Server', 'Server dan komponen pemrosesan untuk layanan dan sistem kampus.', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(21, 'Penyimpanan Data', 'Media dan perangkat penyimpanan data untuk workstation, server, dan cadangan.', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(22, 'CCTV', 'Kamera dan perangkat perekaman untuk pemantauan fasilitas kampus.', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(23, 'Perangkat Keamanan IT', 'Perangkat pendukung keamanan jaringan, sistem, dan infrastruktur TI.', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_ruangan`
--

CREATE TABLE `master_ruangan` (
  `id` int UNSIGNED NOT NULL,
  `nama_ruangan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_gedung` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `master_ruangan`
--

INSERT INTO `master_ruangan` (`id`, `nama_ruangan`, `nama_gedung`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Ruang Teori B 1.2', 'Gedung B Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(2, 'Ruang Teori B 1.3', 'Gedung B Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(3, 'Ruang Teori B 1.4', 'Gedung B Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(4, 'Ruang Teori B 1.5', 'Gedung B Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(5, 'Ruang Teori C 1.1', 'Gedung C Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(6, 'Ruang Teori C 1.2', 'Gedung C Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(7, 'Ruang Teori C 1.3', 'Gedung C Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(8, 'Ruang Teori C 1.4', 'Gedung C Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(9, 'Ruang Teori C 1.5', 'Gedung C Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(10, 'Ruang Teori C 1.6', 'Gedung C Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(11, 'Lab Bahasa', 'Gedung A Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(13, 'Mushola', 'Gedung A Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 06:11:25'),
(14, 'Perpustakaan', 'Gedung A Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(15, 'Ruang Teori A 1.1', 'Gedung A Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(16, 'Ruang Teori A 1.2', 'Gedung A Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(17, 'Ruang D 1.1', 'Gedung D Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(18, 'Ruang D 1.2', 'Gedung D Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(19, 'Ruang D 1.3', 'Gedung D Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(20, 'BAU', 'Gedung Administrasi Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(21, 'BAAK', 'Gedung Administrasi Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(22, 'Ruang Rektor', 'Gedung Administrasi Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(23, 'Ruang Wakil Rektor', 'Gedung Administrasi Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(24, 'Ruang E 1.1', 'Gedung E Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(25, 'Ruang E 1.2', 'Gedung E Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(26, 'Ruang E 1.3', 'Gedung E Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(27, 'Ruang E 1.4', 'Gedung E Lt. 1', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(28, 'Ruang Dosen', 'Gedung E Lt. 2', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(29, 'Ruang Dekan', 'Gedung E Lt. 2', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(30, 'Ruang Kaprodi', 'Gedung E Lt. 2', 1, '2026-11-26 05:48:01', '2026-11-26 05:48:01'),
(40, 'LAB 1', 'Gedung D Lt.2', 1, '2026-11-26 06:15:30', NULL),
(41, 'LAB 2 (Lab Mandiri)', 'Gedung D Lt.2', 1, '2026-11-26 06:15:30', NULL),
(42, 'LAB 3', 'Gedung B Lt.2', 1, '2026-11-26 06:15:30', NULL),
(43, 'LAB 4 (Lab Jaringan)', 'Gedung A Lt.1', 1, '2026-11-26 06:15:30', NULL),
(44, 'LAB 5', 'Gedung B Lt.2', 1, '2026-11-26 06:15:30', NULL),
(45, 'LAB 6', 'Gedung A Lt.2', 1, '2026-11-26 06:15:30', NULL),
(46, 'LAB 7', 'Gedung A Lt.2', 1, '2026-11-26 06:15:30', NULL),
(47, 'Ruang P3SDI', 'Gedung D Lt.2', 1, '2026-11-26 06:15:30', NULL),
(48, 'UPT Komputer', 'Gedung D Lt.2', 1, '2026-11-26 06:15:30', NULL);

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
(3, '0001_01_01_000002_create_users_table_if_missing', 1),
(4, '2026_04_22_121933_create_permission_tables', 1),
(5, '2026_08_22_143652_create_notifications_table', 1),
(6, '2026_08_22_160750_create_jobs_table', 1),
(7, '2026_08_31_000000_create_helpdesk_core_tables', 1),
(8, '2026_09_01_020816_add_dashboard_indexes_to_log_perbaikan_table', 1),
(9, '2026_09_02_125939_create_failed_jobs_table', 1),
(10, '2026_09_18_182019_create_master_kategori_barang_table', 1),
(11, '2026_09_18_182020_create_master_barang_table', 1),
(12, '2026_09_18_182021_add_barang_fields_to_pengajuan_barang_table', 1),
(13, '2026_10_13_000000_adapt_helpdesk_notifications_for_filament', 1),
(14, '2026_10_22_203110_add_konfirmasi_columns_to_service_tables', 1),
(15, '2026_10_22_203110_backfill_helpdesk_notification_filament_format', 1),
(16, '2026_10_22_212207_add_konfirmasi_category_to_helpdesk_logs', 1),
(17, '2026_10_23_000000_create_master_ruangan_table_if_missing', 1),
(18, '2026_10_23_000001_create_log_harian_teknisi_table_if_missing', 1),
(19, '2026_10_23_000002_create_kegiatan_petugas_table', 1),
(20, '2026_10_23_000003_drop_nama_petugas_from_log_harian_teknisi', 1),
(21, '2026_10_23_000004_baseline_view_laporan_kegiatan', 1),
(22, '2026_11_22_152622_replace_master_barang_with_submission_fields', 1),
(23, '2026_11_25_195941_remove_legacy_description_from_pengajuan_barang', 1),
(24, '2026_11_25_195942_create_missing_report_views', 1),
(25, '2026_11_25_224204_add_preferences_to_users_table', 1),
(26, '2026_11_26_061816_add_is_active_to_master_ruangan_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(3, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 4),
(4, 'App\\Models\\User', 5),
(4, 'App\\Models\\User', 6),
(2, 'App\\Models\\User', 7),
(4, 'App\\Models\\User', 8),
(4, 'App\\Models\\User', 9),
(1, 'App\\Models\\User', 10),
(3, 'App\\Models\\User', 11),
(4, 'App\\Models\\User', 12),
(4, 'App\\Models\\User', 13),
(4, 'App\\Models\\User', 14),
(4, 'App\\Models\\User', 15),
(4, 'App\\Models\\User', 16),
(4, 'App\\Models\\User', 17),
(4, 'App\\Models\\User', 18),
(4, 'App\\Models\\User', 19),
(4, 'App\\Models\\User', 20),
(4, 'App\\Models\\User', 21),
(4, 'App\\Models\\User', 22),
(4, 'App\\Models\\User', 23),
(4, 'App\\Models\\User', 24),
(4, 'App\\Models\\User', 25),
(4, 'App\\Models\\User', 26),
(4, 'App\\Models\\User', 27),
(4, 'App\\Models\\User', 28),
(4, 'App\\Models\\User', 29),
(4, 'App\\Models\\User', 30),
(4, 'App\\Models\\User', 31),
(4, 'App\\Models\\User', 32),
(4, 'App\\Models\\User', 33),
(4, 'App\\Models\\User', 34),
(4, 'App\\Models\\User', 35),
(4, 'App\\Models\\User', 36),
(4, 'App\\Models\\User', 37),
(4, 'App\\Models\\User', 38),
(4, 'App\\Models\\User', 39),
(4, 'App\\Models\\User', 40),
(4, 'App\\Models\\User', 41),
(4, 'App\\Models\\User', 42),
(4, 'App\\Models\\User', 43),
(4, 'App\\Models\\User', 44),
(4, 'App\\Models\\User', 45),
(4, 'App\\Models\\User', 46),
(4, 'App\\Models\\User', 47),
(4, 'App\\Models\\User', 48),
(4, 'App\\Models\\User', 49),
(4, 'App\\Models\\User', 50),
(4, 'App\\Models\\User', 51),
(4, 'App\\Models\\User', 52),
(4, 'App\\Models\\User', 53),
(4, 'App\\Models\\User', 54),
(4, 'App\\Models\\User', 55),
(4, 'App\\Models\\User', 56),
(4, 'App\\Models\\User', 57);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
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
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_barang`
--

CREATE TABLE `pengajuan_barang` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `kategori_barang_id` bigint UNSIGNED DEFAULT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spesifikasi_barang` text COLLATE utf8mb4_unicode_ci,
  `jumlah` int UNSIGNED NOT NULL DEFAULT '1',
  `alasan` text COLLATE utf8mb4_unicode_ci,
  `status` enum('Open','In Progress','Close') COLLATE utf8mb4_unicode_ci DEFAULT 'Open',
  `konfirmasi_status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `konfirmasi_at` timestamp NULL DEFAULT NULL,
  `konfirmasi_catatan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `contoh_barang_path` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contoh_barang_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'ViewAny:KegiatanTeknisi', 'web', '2026-11-26 06:03:22', '2026-11-26 06:03:22'),
(2, 'View:KegiatanTeknisi', 'web', '2026-11-26 06:03:22', '2026-11-26 06:03:22'),
(3, 'Create:KegiatanTeknisi', 'web', '2026-11-26 06:03:22', '2026-11-26 06:03:22'),
(4, 'Update:KegiatanTeknisi', 'web', '2026-11-26 06:03:22', '2026-11-26 06:03:22'),
(5, 'Delete:KegiatanTeknisi', 'web', '2026-11-26 06:03:22', '2026-11-26 06:03:22'),
(6, 'DeleteAny:KegiatanTeknisi', 'web', '2026-11-26 06:03:22', '2026-11-26 06:03:22'),
(7, 'Restore:KegiatanTeknisi', 'web', '2026-11-26 06:03:22', '2026-11-26 06:03:22'),
(8, 'ForceDelete:KegiatanTeknisi', 'web', '2026-11-26 06:03:22', '2026-11-26 06:03:22'),
(9, 'ForceDeleteAny:KegiatanTeknisi', 'web', '2026-11-26 06:03:22', '2026-11-26 06:03:22'),
(10, 'RestoreAny:KegiatanTeknisi', 'web', '2026-11-26 06:03:22', '2026-11-26 06:03:22'),
(11, 'Replicate:KegiatanTeknisi', 'web', '2026-11-26 06:03:22', '2026-11-26 06:03:22'),
(12, 'Reorder:KegiatanTeknisi', 'web', '2026-11-26 06:03:22', '2026-11-26 06:03:22'),
(13, 'ViewAny:LaporanKegiatan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(14, 'View:LaporanKegiatan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(15, 'Create:LaporanKegiatan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(16, 'Update:LaporanKegiatan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(17, 'Delete:LaporanKegiatan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(18, 'DeleteAny:LaporanKegiatan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(19, 'Restore:LaporanKegiatan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(20, 'ForceDelete:LaporanKegiatan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(21, 'ForceDeleteAny:LaporanKegiatan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(22, 'RestoreAny:LaporanKegiatan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(23, 'Replicate:LaporanKegiatan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(24, 'Reorder:LaporanKegiatan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(25, 'ViewAny:LaporanPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(26, 'View:LaporanPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(27, 'Create:LaporanPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(28, 'Update:LaporanPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(29, 'Delete:LaporanPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(30, 'DeleteAny:LaporanPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(31, 'Restore:LaporanPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(32, 'ForceDelete:LaporanPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(33, 'ForceDeleteAny:LaporanPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(34, 'RestoreAny:LaporanPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(35, 'Replicate:LaporanPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(36, 'Reorder:LaporanPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(37, 'ViewAny:LaporanPermintaanBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(38, 'View:LaporanPermintaanBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(39, 'Create:LaporanPermintaanBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(40, 'Update:LaporanPermintaanBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(41, 'Delete:LaporanPermintaanBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(42, 'DeleteAny:LaporanPermintaanBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(43, 'Restore:LaporanPermintaanBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(44, 'ForceDelete:LaporanPermintaanBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(45, 'ForceDeleteAny:LaporanPermintaanBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(46, 'RestoreAny:LaporanPermintaanBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(47, 'Replicate:LaporanPermintaanBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(48, 'Reorder:LaporanPermintaanBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(49, 'ViewAny:LogPengajuan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(50, 'View:LogPengajuan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(51, 'Create:LogPengajuan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(52, 'Update:LogPengajuan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(53, 'Delete:LogPengajuan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(54, 'DeleteAny:LogPengajuan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(55, 'Restore:LogPengajuan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(56, 'ForceDelete:LogPengajuan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(57, 'ForceDeleteAny:LogPengajuan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(58, 'RestoreAny:LogPengajuan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(59, 'Replicate:LogPengajuan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(60, 'Reorder:LogPengajuan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(61, 'ViewAny:LogPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(62, 'View:LogPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(63, 'Create:LogPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(64, 'Update:LogPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(65, 'Delete:LogPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(66, 'DeleteAny:LogPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(67, 'Restore:LogPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(68, 'ForceDelete:LogPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(69, 'ForceDeleteAny:LogPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(70, 'RestoreAny:LogPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(71, 'Replicate:LogPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(72, 'Reorder:LogPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(73, 'ViewAny:MasterKategoriBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(74, 'View:MasterKategoriBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(75, 'Create:MasterKategoriBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(76, 'Update:MasterKategoriBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(77, 'Delete:MasterKategoriBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(78, 'DeleteAny:MasterKategoriBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(79, 'Restore:MasterKategoriBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(80, 'ForceDelete:MasterKategoriBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(81, 'ForceDeleteAny:MasterKategoriBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(82, 'RestoreAny:MasterKategoriBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(83, 'Replicate:MasterKategoriBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(84, 'Reorder:MasterKategoriBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(85, 'ViewAny:MasterRuangan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(86, 'View:MasterRuangan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(87, 'Create:MasterRuangan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(88, 'Update:MasterRuangan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(89, 'Delete:MasterRuangan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(90, 'DeleteAny:MasterRuangan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(91, 'Restore:MasterRuangan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(92, 'ForceDelete:MasterRuangan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(93, 'ForceDeleteAny:MasterRuangan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(94, 'RestoreAny:MasterRuangan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(95, 'Replicate:MasterRuangan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(96, 'Reorder:MasterRuangan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(97, 'ViewAny:PengajuanBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(98, 'View:PengajuanBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(99, 'Create:PengajuanBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(100, 'Update:PengajuanBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(101, 'Delete:PengajuanBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(102, 'DeleteAny:PengajuanBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(103, 'Restore:PengajuanBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(104, 'ForceDelete:PengajuanBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(105, 'ForceDeleteAny:PengajuanBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(106, 'RestoreAny:PengajuanBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(107, 'Replicate:PengajuanBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(108, 'Reorder:PengajuanBarang', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(109, 'ViewAny:TiketPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(110, 'View:TiketPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(111, 'Create:TiketPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(112, 'Update:TiketPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(113, 'Delete:TiketPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(114, 'DeleteAny:TiketPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(115, 'Restore:TiketPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(116, 'ForceDelete:TiketPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(117, 'ForceDeleteAny:TiketPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(118, 'RestoreAny:TiketPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(119, 'Replicate:TiketPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(120, 'Reorder:TiketPerbaikan', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(121, 'ViewAny:User', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(122, 'View:User', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(123, 'Create:User', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(124, 'Update:User', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(125, 'Delete:User', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(126, 'DeleteAny:User', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(127, 'Restore:User', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(128, 'ForceDelete:User', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(129, 'ForceDeleteAny:User', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(130, 'RestoreAny:User', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(131, 'Replicate:User', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(132, 'Reorder:User', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(133, 'ViewAny:Role', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(134, 'View:Role', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(135, 'Create:Role', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(136, 'Update:Role', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(137, 'Delete:Role', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(138, 'DeleteAny:Role', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(139, 'Restore:Role', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(140, 'ForceDelete:Role', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(141, 'ForceDeleteAny:Role', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(142, 'RestoreAny:Role', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(143, 'Replicate:Role', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(144, 'Reorder:Role', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(145, 'View:AccountSecurity', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(146, 'View:AccountSettings', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(147, 'View:Dashboard', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(148, 'View:Chat', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(149, 'View:Timeline', 'web', '2026-11-26 06:03:23', '2026-11-26 06:03:23'),
(150, 'View:AdminLayananTrendChart', 'web', '2026-11-26 06:03:25', '2026-11-26 06:03:25'),
(151, 'View:AdminOverview', 'web', '2026-11-26 06:03:25', '2026-11-26 06:03:25'),
(152, 'View:TeknisiOverview', 'web', '2026-11-26 06:03:25', '2026-11-26 06:03:25'),
(153, 'View:TeknisiStatusChart', 'web', '2026-11-26 06:03:25', '2026-11-26 06:03:25'),
(154, 'View:AdminStatusLayananChart', 'web', '2026-11-26 06:03:25', '2026-11-26 06:03:25'),
(155, 'View:TeknisiAktivitasChart', 'web', '2026-11-26 06:03:25', '2026-11-26 06:03:25'),
(156, 'View:AdminTiketStatusChart', 'web', '2026-11-26 06:03:25', '2026-11-26 06:03:25'),
(157, 'View:TeknisiTiketAktif', 'web', '2026-11-26 06:03:25', '2026-11-26 06:03:25'),
(158, 'View:AdminPengajuanStatusChart', 'web', '2026-11-26 06:03:25', '2026-11-26 06:03:25'),
(159, 'View:AdminTiketTerbaru', 'web', '2026-11-26 06:03:25', '2026-11-26 06:03:25'),
(160, 'View:AdminPengajuanTerbaru', 'web', '2026-11-26 06:03:25', '2026-11-26 06:03:25');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 'web', '2026-11-26 05:48:00', '2026-11-26 05:48:00'),
(2, 'admin', 'web', '2026-11-26 05:48:00', '2026-11-26 05:48:00'),
(3, 'teknisi', 'web', '2026-11-26 05:48:00', '2026-11-26 05:48:00'),
(4, 'pemohon', 'web', '2026-11-26 05:48:00', '2026-11-26 05:48:00');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
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
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
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
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1);

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

-- --------------------------------------------------------

--
-- Table structure for table `tiket_perbaikan`
--

CREATE TABLE `tiket_perbaikan` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `ruangan_id` int UNSIGNED NOT NULL,
  `keluhan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kepemilikan` enum('Inventaris Kantor','Pribadi','Lainnya') COLLATE utf8mb4_unicode_ci DEFAULT 'Inventaris Kantor',
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Open','In Progress','Close') COLLATE utf8mb4_unicode_ci DEFAULT 'Open',
  `konfirmasi_status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `konfirmasi_at` timestamp NULL DEFAULT NULL,
  `konfirmasi_catatan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `login_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('pemohon','teknisi','admin') COLLATE utf8mb4_unicode_ci DEFAULT 'pemohon',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_bidang` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `preferences` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `login_id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `unit_bidang`, `created_at`, `updated_at`, `preferences`) VALUES
(1, 'fithnan', 'Fithnan', 'fithnan@iwima.edu', '2026-11-26 05:48:01', '$2y$12$lr5cIXUh/o.l/xxdi6P3x.0XN0i4NpdQlmPt0rFG5sl7KFE96/Hky', 'teknisi', NULL, 'UPT Teknisi', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(2, 'sulistyo', 'Sulistyo', 'sulistyo@iwima.edu', '2026-11-26 05:48:01', '$2y$12$lr5cIXUh/o.l/xxdi6P3x.0XN0i4NpdQlmPt0rFG5sl7KFE96/Hky', 'teknisi', NULL, 'UPT Teknisi', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(3, 'edi', 'Edi Purwanto, S.Kom', 'edi@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'admin', NULL, 'Kabid Teknisi dan Perawatan Infrastruktur', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(4, 'eko', 'Eko', 'eko@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kaprodi Teknik', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(5, 'annas', 'Annas Syaifudin', 'annas@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'P3SDI', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(6, 'christianto', 'Dr. Christianto', 'christianto@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Rektorat', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(7, 'admin', 'AdminSuper', 'admin@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'admin', NULL, 'P3SDI', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(8, 'faizal', 'Faizal Kurniawan', 'faizal@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'P3SDI', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(9, 'wachiddarmawan', 'Wachid Darmawan, M.Kom', 'wachiddarmawan@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kepala UPT Laboratorium Komputer dan Bahasa', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(10, 'superadmin', 'Super Admin', 'superadmin@iwima.edu', '2026-11-26 05:48:01', '$2y$12$fd6IN53Mtxray3OE//bJj.9QCCXR0llFBhajgN/9Ww7V0bMTvDM.K', 'admin', NULL, 'P3SDI', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(11, 'fajar.ano', 'Fajar Ano', 'fajar.ano@iwima.edu', '2026-11-26 05:48:01', '$2y$12$lr5cIXUh/o.l/xxdi6P3x.0XN0i4NpdQlmPt0rFG5sl7KFE96/Hky', 'teknisi', NULL, 'UPT Teknisi', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(12, 'dr-paminto-agung-christianto-mkom', 'Dr. Paminto Agung Christianto, M.Kom', 'dr-paminto-agung-christianto-mkom@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Rektor', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(13, 'taryadi-mcs', 'Taryadi, M.Cs', 'taryadi-mcs@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Wakil Rektor 1', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(14, 'nur-fadhilah-mhum', 'Nur Fadhilah, M.Hum', 'nur-fadhilah-mhum@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Wakil Rektor 2', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(15, 'sattriedi-wahyu-binabar-mkom', 'Sattriedi Wahyu Binabar, M.Kom', 'sattriedi-wahyu-binabar-mkom@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Wakil Rektor 3', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(16, 'prastuti-sulistyorini-mkom', 'Prastuti Sulistyorini, M.Kom', 'prastuti-sulistyorini-mkom@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Dekan Fakultas Teknologi Informasi', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(17, 'dicke-jsh-siregar-mkom', 'Dicke JSH Siregar, M.Kom', 'dicke-jsh-siregar-mkom@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Dekan Fakultas Ekonomika dan Bisnis / Plt. Kaprodi Komputerisasi Akuntansi (D3)', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(18, 'eko-budi-susanto-mkom', 'Eko Budi Susanto, M.Kom', 'eko-budi-susanto-mkom@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kaprodi Sistem Informasi (S1)', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(19, 'arochman-mkom', 'Arochman, M.Kom', 'arochman-mkom@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kaprodi Teknik Informatika (S1)', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(20, 'christian-yulianto-rusli-mkom', 'Christian Yulianto Rusli, M.Kom', 'christian-yulianto-rusli-mkom@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kaprodi Bisnis Digital', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(21, 'tri-agus-setiawan-mkom', 'Tri Agus Setiawan, M.Kom', 'tri-agus-setiawan-mkom@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kepala P3M', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(22, 'devi-sugianti-mkom', 'Devi Sugianti, M.Kom', 'devi-sugianti-mkom@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kepala BAAK', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(23, 'annas-rivai-skom', 'Annas Rivai, S.Kom', 'annas-rivai-skom@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kepala BAU', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(24, 'sumiyem-se', 'Sumiyem, S.E', 'sumiyem-se@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kepala UPT Perpustakaan', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(25, 'wachid-darmawan-mkom', 'Wachid Darmawan, M.Kom', 'wachid-darmawan-mkom@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kepala UPT Laboratorium (Komputer dan Bahasa)', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(26, 'mt-nindya-rosalina-sh', 'MT. Nindya Rosalina, SH', 'mt-nindya-rosalina-sh@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kepala PSDM', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(27, 'much-rifiqi-maulana-mkom', 'Much. Rifiqi Maulana, M.Kom', 'much-rifiqi-maulana-mkom@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kepala Penjaminan Mutu', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(28, 'm-faizal-kurniawan-mkom', 'M. Faizal Kurniawan, M.Kom', 'm-faizal-kurniawan-mkom@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kepala P3SDI', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(29, 'agus-ilyas', 'Agus Ilyas, M.Kom', 'agus-ilyas-mkom@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kabid Riset dan Pengelolaan Jurnal Riset', '2026-11-26 05:48:01', '2026-11-26 06:06:55', NULL),
(30, 'tri-pudji-wahjuningsih-se-msi', 'Tri Pudji Wahjuningsih, SE, M.Si.', 'tri-pudji-wahjuningsih-se-msi@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kabid Pengabdian dan Pengelolaan Jurnal Pengabdian', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(31, 'risqiati-mkom', 'Risqiati, M.Kom', 'risqiati-mkom@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kabid Administrasi Fakultas', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(32, 'ichwan-kurniawan-mkom', 'Ichwan Kurniawan, M.Kom', 'ichwan-kurniawan-mkom@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kabid Pengendali Sistem Mutu dan Akreditasi', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(33, 'widiyono-mkom', 'Widiyono, M.Kom', 'widiyono-mkom@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kabid Humas dan Pengelolaan Promosi Digital', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(34, 'ari-putra-wibowo-mkom', 'Ari Putra Wibowo, M.Kom', 'ari-putra-wibowo-mkom@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kabid WPiTV', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(35, 'victorianus-aries-siswanto-mkom', 'Victorianus Aries Siswanto, M.Kom', 'victorianus-aries-siswanto-mkom@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kabid Alumni dan Tracer Studi', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(36, 'bambang-ismanto-mkom', 'Bambang Ismanto, M.Kom', 'bambang-ismanto-mkom@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kabid Beasiswa dan Prestasi Mahasiswa', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(37, 'riski-sulistiyaningsih-mkom', 'Riski Sulistiyaningsih, M.Kom', 'riski-sulistiyaningsih-mkom@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kabid Kerjasama (Dalam dan Luar Negeri)', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(38, 'era-yunianto-mkom', 'Era Yunianto, M.Kom', 'era-yunianto-mkom@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kabid Peningkatan Karir Dosen dan Tenaga Kependidikan', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(39, 'wahyu-setianto-mkom', 'Wahyu Setianto, M.Kom', 'wahyu-setianto-mkom@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kabid PDDIKTI dan Pengelolaan Infrastruktur', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(40, 'anas-syaifudin-mkom', 'Anas Syaifudin, M.Kom', 'anas-syaifudin-mkom@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Kabid Pengembangan Sistem Informasi', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(41, 'kezia-mayasari', 'Kezia Mayasari', 'kezia-mayasari@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Karyawan', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(42, 'malika-suartini', 'Malika Suartini', 'malika-suartini@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Karyawan', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(43, 'cemplunk-sihombing', 'Cemplunk Sihombing', 'cemplunk-sihombing@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Dosen', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(44, 'cindy-namaga', 'Cindy Namaga', 'cindy-namaga@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Dosen', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(45, 'surya-saka-tampubolon', 'Surya Saka Tampubolon', 'surya-saka-tampubolon@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Dosen', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(46, 'laras-lestari', 'Laras Lestari', 'laras-lestari@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Dosen', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(47, 'ghaliyati-riyanti-mpd', 'Ghaliyati Riyanti M.Pd', 'ghaliyati-riyanti-mpd@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Karyawan', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(48, 'jelita-hartati', 'Jelita Hartati', 'jelita-hartati@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Karyawan', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(49, 'cakrawangsa-prayoga', 'Cakrawangsa Prayoga', 'cakrawangsa-prayoga@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Karyawan', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(50, 'puji-utami', 'Puji Utami', 'puji-utami@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Karyawan', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(51, 'kariman-adikara-uwais-mpd', 'Kariman Adikara Uwais M.Pd', 'kariman-adikara-uwais-mpd@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Dosen', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(52, 'hadi-galih-samosir', 'Hadi Galih Samosir', 'hadi-galih-samosir@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Karyawan', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(53, 'raharja-ridwan-mansur-st', 'Raharja Ridwan Mansur S.T.', 'raharja-ridwan-mansur-st@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Dosen', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(54, 'nadia-susanti-mti', 'Nadia Susanti M.TI.', 'nadia-susanti-mti@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Karyawan', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(55, 'jane-prastuti', 'Jane Prastuti', 'jane-prastuti@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Karyawan', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(56, 'padmi-fujiati', 'Padmi Fujiati', 'padmi-fujiati@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Dosen', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL),
(57, 'ganda-suryono', 'Ganda Suryono', 'ganda-suryono@iwima.edu', '2026-11-26 05:48:01', '$2y$12$2II40pVlTHeSBky2eP0TDOVsKNLolFLwv/WVYjX5U1IZlPSTIsVrC', 'pemohon', NULL, 'Karyawan', '2026-11-26 05:48:01', '2026-11-26 05:48:01', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_laporan_barang`
-- (See below for the actual view)
--
CREATE TABLE `view_laporan_barang` (
`alasan` text
,`durasi_pengerjaan_menit` bigint
,`jumlah` int unsigned
,`nama_barang` varchar(255)
,`nama_pemohon` varchar(100)
,`nama_teknisi` varchar(100)
,`no_pengajuan` int unsigned
,`status` enum('Open','In Progress','Close')
,`status_outcome` varchar(9)
,`teknisi_id` bigint unsigned
,`unit_bidang` varchar(100)
,`waktu_mulai` timestamp
,`waktu_pengajuan` timestamp
,`waktu_selesai` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_laporan_kegiatan`
-- (See below for the actual view)
--
CREATE TABLE `view_laporan_kegiatan` (
`deskripsi_kegiatan` text
,`id_log` int unsigned
,`nama_teknisi` varchar(100)
,`tanggal` date
,`unit_bidang` varchar(100)
,`waktu_dibuat` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_laporan_service`
-- (See below for the actual view)
--
CREATE TABLE `view_laporan_service` (
`durasi_pengerjaan_menit` bigint
,`kepemilikan` enum('Inventaris Kantor','Pribadi','Lainnya')
,`lokasi` varchar(100)
,`nama_pemohon` varchar(100)
,`nama_teknisi` varchar(100)
,`no_tiket` int unsigned
,`status` enum('Open','In Progress','Close')
,`waktu_mulai` timestamp
,`waktu_selesai` timestamp
);

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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  ADD KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `kegiatan_petugas`
--
ALTER TABLE `kegiatan_petugas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kegiatan_petugas_kegiatan_id_petugas_id_unique` (`kegiatan_id`,`petugas_id`),
  ADD KEY `kegiatan_petugas_kegiatan_id_index` (`kegiatan_id`),
  ADD KEY `kegiatan_petugas_petugas_id_index` (`petugas_id`);

--
-- Indexes for table `log_data_pengajuan_barang`
--
ALTER TABLE `log_data_pengajuan_barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `log_data_pengajuan_barang_user_id_foreign` (`user_id`),
  ADD KEY `log_pengajuan_status_lookup` (`pengajuan_id`,`kategori_log`,`data_baru`,`created_at`);

--
-- Indexes for table `log_data_tiket_perbaikan`
--
ALTER TABLE `log_data_tiket_perbaikan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `log_tiket_status_lookup` (`tiket_id`,`kategori_log`,`data_baru`,`created_at`),
  ADD KEY `log_teknisi_status_lookup` (`user_id`,`kategori_log`,`data_baru`,`created_at`),
  ADD KEY `log_teknisi_activity_lookup` (`user_id`,`created_at`);

--
-- Indexes for table `log_harian_teknisi`
--
ALTER TABLE `log_harian_teknisi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `log_harian_teknisi_teknisi_id_foreign` (`teknisi_id`),
  ADD KEY `log_harian_teknisi_ruangan_id_foreign` (`ruangan_id`),
  ADD KEY `log_harian_teknisi_tanggal_index` (`tanggal`);

--
-- Indexes for table `master_kategori_barang`
--
ALTER TABLE `master_kategori_barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `master_kategori_barang_nama_kategori_index` (`nama_kategori`),
  ADD KEY `master_kategori_barang_is_active_index` (`is_active`);

--
-- Indexes for table `master_ruangan`
--
ALTER TABLE `master_ruangan`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pengajuan_barang`
--
ALTER TABLE `pengajuan_barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengajuan_barang_user_id_foreign` (`user_id`),
  ADD KEY `pengajuan_barang_status_index` (`status`),
  ADD KEY `pengajuan_barang_created_at_index` (`created_at`),
  ADD KEY `pengajuan_barang_kategori_barang_id_foreign` (`kategori_barang_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

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
-- Indexes for table `tiket_perbaikan`
--
ALTER TABLE `tiket_perbaikan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tiket_perbaikan_user_id_foreign` (`user_id`),
  ADD KEY `tiket_perbaikan_ruangan_id_foreign` (`ruangan_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_login_id_unique` (`login_id`);

--
-- AUTO_INCREMENT for dumped tables
--

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
-- AUTO_INCREMENT for table `kegiatan_petugas`
--
ALTER TABLE `kegiatan_petugas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_data_pengajuan_barang`
--
ALTER TABLE `log_data_pengajuan_barang`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_data_tiket_perbaikan`
--
ALTER TABLE `log_data_tiket_perbaikan`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_harian_teknisi`
--
ALTER TABLE `log_harian_teknisi`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_kategori_barang`
--
ALTER TABLE `master_kategori_barang`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `master_ruangan`
--
ALTER TABLE `master_ruangan`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `pengajuan_barang`
--
ALTER TABLE `pengajuan_barang`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tiket_perbaikan`
--
ALTER TABLE `tiket_perbaikan`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

-- --------------------------------------------------------

--
-- Structure for view `view_laporan_barang`
--
DROP TABLE IF EXISTS `view_laporan_barang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_laporan_barang`  AS SELECT `b`.`id` AS `no_pengajuan`, `u`.`name` AS `nama_pemohon`, `u`.`unit_bidang` AS `unit_bidang`, `b`.`nama_barang` AS `nama_barang`, `b`.`jumlah` AS `jumlah`, `b`.`alasan` AS `alasan`, `b`.`status` AS `status`, `b`.`created_at` AS `waktu_pengajuan`, (select `lg`.`user_id` from `log_data_pengajuan_barang` `lg` where ((`lg`.`pengajuan_id` = `b`.`id`) and (`lg`.`kategori_log` = 'Status') and (`lg`.`data_baru` = 'In Progress')) order by `lg`.`created_at` limit 1) AS `teknisi_id`, (select `us`.`name` from (`log_data_pengajuan_barang` `lg` join `users` `us` on((`us`.`id` = `lg`.`user_id`))) where ((`lg`.`pengajuan_id` = `b`.`id`) and (`lg`.`kategori_log` = 'Status') and (`lg`.`data_baru` = 'In Progress')) order by `lg`.`created_at` limit 1) AS `nama_teknisi`, (select min(`lg`.`created_at`) from `log_data_pengajuan_barang` `lg` where ((`lg`.`pengajuan_id` = `b`.`id`) and (`lg`.`kategori_log` = 'Status') and (`lg`.`data_baru` = 'In Progress'))) AS `waktu_mulai`, (select max(`lg`.`created_at`) from `log_data_pengajuan_barang` `lg` where ((`lg`.`pengajuan_id` = `b`.`id`) and (`lg`.`kategori_log` = 'Status') and (`lg`.`data_baru` = 'Close'))) AS `waktu_selesai`, timestampdiff(MINUTE,(select min(`lg`.`created_at`) from `log_data_pengajuan_barang` `lg` where ((`lg`.`pengajuan_id` = `b`.`id`) and (`lg`.`kategori_log` = 'Status') and (`lg`.`data_baru` = 'In Progress'))),(select max(`lg`.`created_at`) from `log_data_pengajuan_barang` `lg` where ((`lg`.`pengajuan_id` = `b`.`id`) and (`lg`.`kategori_log` = 'Status') and (`lg`.`data_baru` = 'Close')))) AS `durasi_pengerjaan_menit`, (case when (`b`.`status` <> 'Close') then NULL when exists(select 1 from `log_data_pengajuan_barang` `lg` where ((`lg`.`pengajuan_id` = `b`.`id`) and (`lg`.`kategori_log` = 'Status') and (`lg`.`data_baru` = 'Close') and (`lg`.`keterangan` like '[SELESAI]%'))) then 'Completed' when exists(select 1 from `log_data_pengajuan_barang` `lg` where ((`lg`.`pengajuan_id` = `b`.`id`) and (`lg`.`kategori_log` = 'Status') and (`lg`.`data_baru` = 'Close') and (`lg`.`keterangan` like '[DITOLAK]%'))) then 'Rejected' else NULL end) AS `status_outcome` FROM (`pengajuan_barang` `b` join `users` `u` on((`u`.`id` = `b`.`user_id`))) WHERE (`b`.`deleted_at` is null) ;

-- --------------------------------------------------------

--
-- Structure for view `view_laporan_kegiatan`
--
DROP TABLE IF EXISTS `view_laporan_kegiatan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_laporan_kegiatan`  AS SELECT `l`.`id` AS `id_log`, `u`.`name` AS `nama_teknisi`, `u`.`unit_bidang` AS `unit_bidang`, `l`.`tanggal` AS `tanggal`, `l`.`deskripsi_kegiatan` AS `deskripsi_kegiatan`, `l`.`created_at` AS `waktu_dibuat` FROM (`log_harian_teknisi` `l` join `users` `u` on((`l`.`teknisi_id` = `u`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_laporan_service`
--
DROP TABLE IF EXISTS `view_laporan_service`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_laporan_service`  AS SELECT `t`.`id` AS `no_tiket`, `u`.`name` AS `nama_pemohon`, `r`.`nama_ruangan` AS `lokasi`, `t`.`kepemilikan` AS `kepemilikan`, `t`.`status` AS `status`, (select `users`.`name` from (`log_data_tiket_perbaikan` join `users` on((`log_data_tiket_perbaikan`.`user_id` = `users`.`id`))) where ((`log_data_tiket_perbaikan`.`tiket_id` = `t`.`id`) and (`log_data_tiket_perbaikan`.`kategori_log` = 'Status') and (`log_data_tiket_perbaikan`.`data_baru` = 'In Progress')) order by `log_data_tiket_perbaikan`.`created_at` limit 1) AS `nama_teknisi`, (select min(`log_data_tiket_perbaikan`.`created_at`) from `log_data_tiket_perbaikan` where ((`log_data_tiket_perbaikan`.`tiket_id` = `t`.`id`) and (`log_data_tiket_perbaikan`.`kategori_log` = 'Status') and (`log_data_tiket_perbaikan`.`data_baru` = 'In Progress'))) AS `waktu_mulai`, (select max(`log_data_tiket_perbaikan`.`created_at`) from `log_data_tiket_perbaikan` where ((`log_data_tiket_perbaikan`.`tiket_id` = `t`.`id`) and (`log_data_tiket_perbaikan`.`kategori_log` = 'Status') and (`log_data_tiket_perbaikan`.`data_baru` = 'Close'))) AS `waktu_selesai`, timestampdiff(MINUTE,(select min(`log_data_tiket_perbaikan`.`created_at`) from `log_data_tiket_perbaikan` where ((`log_data_tiket_perbaikan`.`tiket_id` = `t`.`id`) and (`log_data_tiket_perbaikan`.`kategori_log` = 'Status') and (`log_data_tiket_perbaikan`.`data_baru` = 'In Progress'))),(select max(`log_data_tiket_perbaikan`.`created_at`) from `log_data_tiket_perbaikan` where ((`log_data_tiket_perbaikan`.`tiket_id` = `t`.`id`) and (`log_data_tiket_perbaikan`.`kategori_log` = 'Status') and (`log_data_tiket_perbaikan`.`data_baru` = 'Close')))) AS `durasi_pengerjaan_menit` FROM ((`tiket_perbaikan` `t` join `users` `u` on((`u`.`id` = `t`.`user_id`))) join `master_ruangan` `r` on((`r`.`id` = `t`.`ruangan_id`))) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `log_data_pengajuan_barang`
--
ALTER TABLE `log_data_pengajuan_barang`
  ADD CONSTRAINT `log_data_pengajuan_barang_pengajuan_id_foreign` FOREIGN KEY (`pengajuan_id`) REFERENCES `pengajuan_barang` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `log_data_pengajuan_barang_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `log_data_tiket_perbaikan`
--
ALTER TABLE `log_data_tiket_perbaikan`
  ADD CONSTRAINT `log_data_tiket_perbaikan_tiket_id_foreign` FOREIGN KEY (`tiket_id`) REFERENCES `tiket_perbaikan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `log_data_tiket_perbaikan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `log_harian_teknisi`
--
ALTER TABLE `log_harian_teknisi`
  ADD CONSTRAINT `log_harian_teknisi_ruangan_id_foreign` FOREIGN KEY (`ruangan_id`) REFERENCES `master_ruangan` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `log_harian_teknisi_teknisi_id_foreign` FOREIGN KEY (`teknisi_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `pengajuan_barang`
--
ALTER TABLE `pengajuan_barang`
  ADD CONSTRAINT `pengajuan_barang_kategori_barang_id_foreign` FOREIGN KEY (`kategori_barang_id`) REFERENCES `master_kategori_barang` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_barang_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tiket_perbaikan`
--
ALTER TABLE `tiket_perbaikan`
  ADD CONSTRAINT `tiket_perbaikan_ruangan_id_foreign` FOREIGN KEY (`ruangan_id`) REFERENCES `master_ruangan` (`id`),
  ADD CONSTRAINT `tiket_perbaikan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
