-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 05, 2026 at 11:43 PM
-- Server version: 26.7.0
-- PHP Version: 8.3.30

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
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6', 'i:1;', 1791240254),
('laravel-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6:timer', 'i:1791240254;', 1791240254),
('laravel-cache-spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:172:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:12:\"ViewAny:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:9:\"View:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:11:\"Create:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:11:\"Update:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:11:\"Delete:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:14:\"DeleteAny:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:12:\"Restore:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:16:\"ForceDelete:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:19:\"ForceDeleteAny:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:15:\"RestoreAny:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:14:\"Replicate:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:12:\"Reorder:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:21:\"ViewAny:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:5;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:18:\"View:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:5;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:20:\"Create:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:5;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:20:\"Update:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:5;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:20:\"Delete:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:23:\"DeleteAny:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:21:\"Restore:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:25:\"ForceDelete:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:28:\"ForceDeleteAny:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:24:\"RestoreAny:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:23:\"Replicate:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:21:\"Reorder:MasterRuangan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:22:\"ViewAny:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:2;i:1;i:3;i:2;i:4;i:3;i:5;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:19:\"View:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:2;i:1;i:3;i:2;i:4;i:3;i:5;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:21:\"Create:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:2;i:1;i:3;i:2;i:4;i:3;i:5;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:21:\"Update:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:2;i:1;i:3;i:2;i:4;i:3;i:5;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:21:\"Delete:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:24:\"DeleteAny:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:22:\"Restore:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:26:\"ForceDelete:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:29:\"ForceDeleteAny:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:25:\"RestoreAny:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:24:\"Replicate:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:22:\"Reorder:TiketPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:12:\"ViewAny:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:9:\"View:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:11:\"Create:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:11:\"Update:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:11:\"Delete:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:14:\"DeleteAny:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:12:\"Restore:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:43;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:16:\"ForceDelete:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:44;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:19:\"ForceDeleteAny:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:45;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:15:\"RestoreAny:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:46;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:14:\"Replicate:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:47;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:12:\"Reorder:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:48;a:4:{s:1:\"a\";i:49;s:1:\"b\";s:19:\"View:AdminDashboard\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:49;a:4:{s:1:\"a\";i:50;s:1:\"b\";s:21:\"View:TeknisiDashboard\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:50;a:4:{s:1:\"a\";i:51;s:1:\"b\";s:20:\"ViewAny:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:2;i:1;i:3;i:2;i:4;i:3;i:5;}}i:51;a:4:{s:1:\"a\";i:52;s:1:\"b\";s:17:\"View:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:2;i:1;i:3;i:2;i:4;i:3;i:5;}}i:52;a:4:{s:1:\"a\";i:53;s:1:\"b\";s:19:\"Create:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:53;a:4:{s:1:\"a\";i:54;s:1:\"b\";s:19:\"Update:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:54;a:4:{s:1:\"a\";i:55;s:1:\"b\";s:19:\"Delete:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:55;a:4:{s:1:\"a\";i:56;s:1:\"b\";s:22:\"DeleteAny:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:56;a:4:{s:1:\"a\";i:57;s:1:\"b\";s:20:\"Restore:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:57;a:4:{s:1:\"a\";i:58;s:1:\"b\";s:24:\"ForceDelete:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:58;a:4:{s:1:\"a\";i:59;s:1:\"b\";s:27:\"ForceDeleteAny:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:59;a:4:{s:1:\"a\";i:60;s:1:\"b\";s:23:\"RestoreAny:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:60;a:4:{s:1:\"a\";i:61;s:1:\"b\";s:22:\"Replicate:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:61;a:4:{s:1:\"a\";i:62;s:1:\"b\";s:20:\"Reorder:LogPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:62;a:4:{s:1:\"a\";i:103;s:1:\"b\";s:23:\"ViewAny:KegiatanTeknisi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:63;a:4:{s:1:\"a\";i:104;s:1:\"b\";s:20:\"View:KegiatanTeknisi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:64;a:4:{s:1:\"a\";i:105;s:1:\"b\";s:22:\"Create:KegiatanTeknisi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:65;a:4:{s:1:\"a\";i:106;s:1:\"b\";s:22:\"Update:KegiatanTeknisi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:66;a:4:{s:1:\"a\";i:107;s:1:\"b\";s:22:\"Delete:KegiatanTeknisi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:3;}}i:67;a:4:{s:1:\"a\";i:108;s:1:\"b\";s:25:\"DeleteAny:KegiatanTeknisi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:3;}}i:68;a:4:{s:1:\"a\";i:109;s:1:\"b\";s:23:\"Restore:KegiatanTeknisi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:3;}}i:69;a:3:{s:1:\"a\";i:110;s:1:\"b\";s:27:\"ForceDelete:KegiatanTeknisi\";s:1:\"c\";s:3:\"web\";}i:70;a:3:{s:1:\"a\";i:111;s:1:\"b\";s:30:\"ForceDeleteAny:KegiatanTeknisi\";s:1:\"c\";s:3:\"web\";}i:71;a:4:{s:1:\"a\";i:112;s:1:\"b\";s:26:\"RestoreAny:KegiatanTeknisi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:3;}}i:72;a:3:{s:1:\"a\";i:113;s:1:\"b\";s:25:\"Replicate:KegiatanTeknisi\";s:1:\"c\";s:3:\"web\";}i:73;a:4:{s:1:\"a\";i:114;s:1:\"b\";s:23:\"Reorder:KegiatanTeknisi\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:74;a:4:{s:1:\"a\";i:115;s:1:\"b\";s:23:\"ViewAny:LaporanKegiatan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:75;a:4:{s:1:\"a\";i:116;s:1:\"b\";s:20:\"View:LaporanKegiatan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:76;a:4:{s:1:\"a\";i:117;s:1:\"b\";s:22:\"Create:LaporanKegiatan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:3;}}i:77;a:4:{s:1:\"a\";i:118;s:1:\"b\";s:22:\"Update:LaporanKegiatan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:3;}}i:78;a:4:{s:1:\"a\";i:119;s:1:\"b\";s:22:\"Delete:LaporanKegiatan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:3;}}i:79;a:4:{s:1:\"a\";i:120;s:1:\"b\";s:25:\"DeleteAny:LaporanKegiatan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:3;}}i:80;a:4:{s:1:\"a\";i:121;s:1:\"b\";s:23:\"Restore:LaporanKegiatan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:3;}}i:81;a:3:{s:1:\"a\";i:122;s:1:\"b\";s:27:\"ForceDelete:LaporanKegiatan\";s:1:\"c\";s:3:\"web\";}i:82;a:3:{s:1:\"a\";i:123;s:1:\"b\";s:30:\"ForceDeleteAny:LaporanKegiatan\";s:1:\"c\";s:3:\"web\";}i:83;a:4:{s:1:\"a\";i:124;s:1:\"b\";s:26:\"RestoreAny:LaporanKegiatan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:3;}}i:84;a:3:{s:1:\"a\";i:125;s:1:\"b\";s:25:\"Replicate:LaporanKegiatan\";s:1:\"c\";s:3:\"web\";}i:85;a:4:{s:1:\"a\";i:126;s:1:\"b\";s:23:\"Reorder:LaporanKegiatan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:3;}}i:86;a:4:{s:1:\"a\";i:127;s:1:\"b\";s:24:\"ViewAny:LaporanPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:87;a:4:{s:1:\"a\";i:128;s:1:\"b\";s:21:\"View:LaporanPerbaikan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:88;a:3:{s:1:\"a\";i:129;s:1:\"b\";s:23:\"Create:LaporanPerbaikan\";s:1:\"c\";s:3:\"web\";}i:89;a:3:{s:1:\"a\";i:130;s:1:\"b\";s:23:\"Update:LaporanPerbaikan\";s:1:\"c\";s:3:\"web\";}i:90;a:3:{s:1:\"a\";i:131;s:1:\"b\";s:23:\"Delete:LaporanPerbaikan\";s:1:\"c\";s:3:\"web\";}i:91;a:3:{s:1:\"a\";i:132;s:1:\"b\";s:26:\"DeleteAny:LaporanPerbaikan\";s:1:\"c\";s:3:\"web\";}i:92;a:3:{s:1:\"a\";i:133;s:1:\"b\";s:24:\"Restore:LaporanPerbaikan\";s:1:\"c\";s:3:\"web\";}i:93;a:3:{s:1:\"a\";i:134;s:1:\"b\";s:28:\"ForceDelete:LaporanPerbaikan\";s:1:\"c\";s:3:\"web\";}i:94;a:3:{s:1:\"a\";i:135;s:1:\"b\";s:31:\"ForceDeleteAny:LaporanPerbaikan\";s:1:\"c\";s:3:\"web\";}i:95;a:3:{s:1:\"a\";i:136;s:1:\"b\";s:27:\"RestoreAny:LaporanPerbaikan\";s:1:\"c\";s:3:\"web\";}i:96;a:3:{s:1:\"a\";i:137;s:1:\"b\";s:26:\"Replicate:LaporanPerbaikan\";s:1:\"c\";s:3:\"web\";}i:97;a:3:{s:1:\"a\";i:138;s:1:\"b\";s:24:\"Reorder:LaporanPerbaikan\";s:1:\"c\";s:3:\"web\";}i:98;a:4:{s:1:\"a\";i:139;s:1:\"b\";s:31:\"ViewAny:LaporanPermintaanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:99;a:4:{s:1:\"a\";i:140;s:1:\"b\";s:28:\"View:LaporanPermintaanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:100;a:3:{s:1:\"a\";i:141;s:1:\"b\";s:30:\"Create:LaporanPermintaanBarang\";s:1:\"c\";s:3:\"web\";}i:101;a:3:{s:1:\"a\";i:142;s:1:\"b\";s:30:\"Update:LaporanPermintaanBarang\";s:1:\"c\";s:3:\"web\";}i:102;a:3:{s:1:\"a\";i:143;s:1:\"b\";s:30:\"Delete:LaporanPermintaanBarang\";s:1:\"c\";s:3:\"web\";}i:103;a:3:{s:1:\"a\";i:144;s:1:\"b\";s:33:\"DeleteAny:LaporanPermintaanBarang\";s:1:\"c\";s:3:\"web\";}i:104;a:3:{s:1:\"a\";i:145;s:1:\"b\";s:31:\"Restore:LaporanPermintaanBarang\";s:1:\"c\";s:3:\"web\";}i:105;a:3:{s:1:\"a\";i:146;s:1:\"b\";s:35:\"ForceDelete:LaporanPermintaanBarang\";s:1:\"c\";s:3:\"web\";}i:106;a:3:{s:1:\"a\";i:147;s:1:\"b\";s:38:\"ForceDeleteAny:LaporanPermintaanBarang\";s:1:\"c\";s:3:\"web\";}i:107;a:3:{s:1:\"a\";i:148;s:1:\"b\";s:34:\"RestoreAny:LaporanPermintaanBarang\";s:1:\"c\";s:3:\"web\";}i:108;a:3:{s:1:\"a\";i:149;s:1:\"b\";s:33:\"Replicate:LaporanPermintaanBarang\";s:1:\"c\";s:3:\"web\";}i:109;a:3:{s:1:\"a\";i:150;s:1:\"b\";s:31:\"Reorder:LaporanPermintaanBarang\";s:1:\"c\";s:3:\"web\";}i:110;a:4:{s:1:\"a\";i:151;s:1:\"b\";s:20:\"ViewAny:LogPengajuan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:111;a:4:{s:1:\"a\";i:152;s:1:\"b\";s:17:\"View:LogPengajuan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:112;a:3:{s:1:\"a\";i:153;s:1:\"b\";s:19:\"Create:LogPengajuan\";s:1:\"c\";s:3:\"web\";}i:113;a:3:{s:1:\"a\";i:154;s:1:\"b\";s:19:\"Update:LogPengajuan\";s:1:\"c\";s:3:\"web\";}i:114;a:3:{s:1:\"a\";i:155;s:1:\"b\";s:19:\"Delete:LogPengajuan\";s:1:\"c\";s:3:\"web\";}i:115;a:3:{s:1:\"a\";i:156;s:1:\"b\";s:22:\"DeleteAny:LogPengajuan\";s:1:\"c\";s:3:\"web\";}i:116;a:3:{s:1:\"a\";i:157;s:1:\"b\";s:20:\"Restore:LogPengajuan\";s:1:\"c\";s:3:\"web\";}i:117;a:3:{s:1:\"a\";i:158;s:1:\"b\";s:24:\"ForceDelete:LogPengajuan\";s:1:\"c\";s:3:\"web\";}i:118;a:3:{s:1:\"a\";i:159;s:1:\"b\";s:27:\"ForceDeleteAny:LogPengajuan\";s:1:\"c\";s:3:\"web\";}i:119;a:3:{s:1:\"a\";i:160;s:1:\"b\";s:23:\"RestoreAny:LogPengajuan\";s:1:\"c\";s:3:\"web\";}i:120;a:3:{s:1:\"a\";i:161;s:1:\"b\";s:22:\"Replicate:LogPengajuan\";s:1:\"c\";s:3:\"web\";}i:121;a:3:{s:1:\"a\";i:162;s:1:\"b\";s:20:\"Reorder:LogPengajuan\";s:1:\"c\";s:3:\"web\";}i:122;a:4:{s:1:\"a\";i:163;s:1:\"b\";s:20:\"ViewAny:MasterBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:123;a:4:{s:1:\"a\";i:164;s:1:\"b\";s:17:\"View:MasterBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:124;a:4:{s:1:\"a\";i:165;s:1:\"b\";s:19:\"Create:MasterBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:125;a:4:{s:1:\"a\";i:166;s:1:\"b\";s:19:\"Update:MasterBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:126;a:4:{s:1:\"a\";i:167;s:1:\"b\";s:19:\"Delete:MasterBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:127;a:4:{s:1:\"a\";i:168;s:1:\"b\";s:22:\"DeleteAny:MasterBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:128;a:4:{s:1:\"a\";i:169;s:1:\"b\";s:20:\"Restore:MasterBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:129;a:3:{s:1:\"a\";i:170;s:1:\"b\";s:24:\"ForceDelete:MasterBarang\";s:1:\"c\";s:3:\"web\";}i:130;a:3:{s:1:\"a\";i:171;s:1:\"b\";s:27:\"ForceDeleteAny:MasterBarang\";s:1:\"c\";s:3:\"web\";}i:131;a:3:{s:1:\"a\";i:172;s:1:\"b\";s:23:\"RestoreAny:MasterBarang\";s:1:\"c\";s:3:\"web\";}i:132;a:3:{s:1:\"a\";i:173;s:1:\"b\";s:22:\"Replicate:MasterBarang\";s:1:\"c\";s:3:\"web\";}i:133;a:4:{s:1:\"a\";i:174;s:1:\"b\";s:20:\"Reorder:MasterBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:134;a:4:{s:1:\"a\";i:175;s:1:\"b\";s:28:\"ViewAny:MasterKategoriBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:135;a:4:{s:1:\"a\";i:176;s:1:\"b\";s:25:\"View:MasterKategoriBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:136;a:4:{s:1:\"a\";i:177;s:1:\"b\";s:27:\"Create:MasterKategoriBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:137;a:4:{s:1:\"a\";i:178;s:1:\"b\";s:27:\"Update:MasterKategoriBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:138;a:4:{s:1:\"a\";i:179;s:1:\"b\";s:27:\"Delete:MasterKategoriBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:139;a:4:{s:1:\"a\";i:180;s:1:\"b\";s:30:\"DeleteAny:MasterKategoriBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:140;a:4:{s:1:\"a\";i:181;s:1:\"b\";s:28:\"Restore:MasterKategoriBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:141;a:3:{s:1:\"a\";i:182;s:1:\"b\";s:32:\"ForceDelete:MasterKategoriBarang\";s:1:\"c\";s:3:\"web\";}i:142;a:3:{s:1:\"a\";i:183;s:1:\"b\";s:35:\"ForceDeleteAny:MasterKategoriBarang\";s:1:\"c\";s:3:\"web\";}i:143;a:3:{s:1:\"a\";i:184;s:1:\"b\";s:31:\"RestoreAny:MasterKategoriBarang\";s:1:\"c\";s:3:\"web\";}i:144;a:3:{s:1:\"a\";i:185;s:1:\"b\";s:30:\"Replicate:MasterKategoriBarang\";s:1:\"c\";s:3:\"web\";}i:145;a:4:{s:1:\"a\";i:186;s:1:\"b\";s:28:\"Reorder:MasterKategoriBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:146;a:4:{s:1:\"a\";i:187;s:1:\"b\";s:23:\"ViewAny:PengajuanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:147;a:4:{s:1:\"a\";i:188;s:1:\"b\";s:20:\"View:PengajuanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:148;a:4:{s:1:\"a\";i:189;s:1:\"b\";s:22:\"Create:PengajuanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:149;a:4:{s:1:\"a\";i:190;s:1:\"b\";s:22:\"Update:PengajuanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:150;a:4:{s:1:\"a\";i:191;s:1:\"b\";s:22:\"Delete:PengajuanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:151;a:4:{s:1:\"a\";i:192;s:1:\"b\";s:25:\"DeleteAny:PengajuanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:152;a:4:{s:1:\"a\";i:193;s:1:\"b\";s:23:\"Restore:PengajuanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:153;a:3:{s:1:\"a\";i:194;s:1:\"b\";s:27:\"ForceDelete:PengajuanBarang\";s:1:\"c\";s:3:\"web\";}i:154;a:3:{s:1:\"a\";i:195;s:1:\"b\";s:30:\"ForceDeleteAny:PengajuanBarang\";s:1:\"c\";s:3:\"web\";}i:155;a:4:{s:1:\"a\";i:196;s:1:\"b\";s:26:\"RestoreAny:PengajuanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:156;a:4:{s:1:\"a\";i:197;s:1:\"b\";s:25:\"Replicate:PengajuanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:157;a:4:{s:1:\"a\";i:198;s:1:\"b\";s:23:\"Reorder:PengajuanBarang\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:158;a:4:{s:1:\"a\";i:199;s:1:\"b\";s:14:\"View:Dashboard\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:159;a:4:{s:1:\"a\";i:200;s:1:\"b\";s:9:\"View:Chat\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:160;a:4:{s:1:\"a\";i:201;s:1:\"b\";s:13:\"View:Timeline\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:161;a:4:{s:1:\"a\";i:202;s:1:\"b\";s:18:\"View:AdminOverview\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:162;a:4:{s:1:\"a\";i:203;s:1:\"b\";s:20:\"View:TeknisiOverview\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:163;a:4:{s:1:\"a\";i:204;s:1:\"b\";s:27:\"View:AdminLayananTrendChart\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:164;a:4:{s:1:\"a\";i:205;s:1:\"b\";s:23:\"View:TeknisiStatusChart\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:165;a:4:{s:1:\"a\";i:206;s:1:\"b\";s:28:\"View:AdminStatusLayananChart\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:166;a:4:{s:1:\"a\";i:207;s:1:\"b\";s:26:\"View:TeknisiAktivitasChart\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:167;a:4:{s:1:\"a\";i:208;s:1:\"b\";s:26:\"View:AdminTiketStatusChart\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:168;a:4:{s:1:\"a\";i:209;s:1:\"b\";s:22:\"View:TeknisiTiketAktif\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:169;a:4:{s:1:\"a\";i:210;s:1:\"b\";s:30:\"View:AdminPengajuanStatusChart\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:170;a:3:{s:1:\"a\";i:211;s:1:\"b\";s:22:\"View:AdminTiketTerbaru\";s:1:\"c\";s:3:\"web\";}i:171;a:4:{s:1:\"a\";i:212;s:1:\"b\";s:26:\"View:AdminPengajuanTerbaru\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}}s:5:\"roles\";a:4:{i:0;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:5:\"admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:5;s:1:\"b\";s:11:\"super_admin\";s:1:\"c\";s:3:\"web\";}i:2;a:3:{s:1:\"a\";i:3;s:1:\"b\";s:7:\"teknisi\";s:1:\"c\";s:3:\"web\";}i:3;a:3:{s:1:\"a\";i:4;s:1:\"b\";s:7:\"pemohon\";s:1:\"c\";s:3:\"web\";}}}', 1791252397);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, '19873324-34bd-4750-8b15-92f2f3140ad4', 'database', 'default', '{\"uuid\":\"19873324-34bd-4750-8b15-92f2f3140ad4\",\"displayName\":\"Illuminate\\\\Notifications\\\\Events\\\\BroadcastNotificationCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":true,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":19:{s:5:\\\"event\\\";O:60:\\\"Illuminate\\\\Notifications\\\\Events\\\\BroadcastNotificationCreated\\\":3:{s:10:\\\"notifiable\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:1:{i:0;s:5:\\\"roles\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:38:\\\"App\\\\Notifications\\\\HelpdeskNotification\\\":10:{s:4:\\\"type\\\";s:17:\\\"pengajuan.created\\\";s:5:\\\"title\\\";s:21:\\\"Pengajuan Barang Baru\\\";s:7:\\\"message\\\";s:46:\\\"Pengajuan PJB-28092026-0001 baru telah dibuat.\\\";s:4:\\\"kode\\\";s:17:\\\"PJB-28092026-0001\\\";s:3:\\\"url\\\";s:48:\\\"http:\\/\\/localhost:8000\\/admin\\/pengajuan-barang\\/157\\\";s:4:\\\"icon\\\";s:15:\\\"heroicon-o-cube\\\";s:5:\\\"color\\\";s:4:\\\"info\\\";s:11:\\\"referenceId\\\";s:3:\\\"157\\\";s:4:\\\"data\\\";a:5:{s:7:\\\"message\\\";s:46:\\\"Pengajuan PJB-28092026-0001 baru telah dibuat.\\\";s:7:\\\"user_id\\\";i:8;s:9:\\\"user_name\\\";s:16:\\\"Faizal Kurniawan\\\";s:11:\\\"nama_barang\\\";s:17:\\\"SSD SATA 2.5 Inch\\\";s:6:\\\"jumlah\\\";i:2;}s:2:\\\"id\\\";s:36:\\\"f83633e3-2637-4d50-bf8e-953489e6787c\\\";}s:4:\\\"data\\\";a:10:{s:2:\\\"id\\\";s:36:\\\"f83633e3-2637-4d50-bf8e-953489e6787c\\\";s:4:\\\"type\\\";s:17:\\\"pengajuan.created\\\";s:5:\\\"title\\\";s:21:\\\"Pengajuan Barang Baru\\\";s:7:\\\"message\\\";s:46:\\\"Pengajuan PJB-28092026-0001 baru telah dibuat.\\\";s:4:\\\"kode\\\";s:17:\\\"PJB-28092026-0001\\\";s:3:\\\"url\\\";s:48:\\\"http:\\/\\/localhost:8000\\/admin\\/pengajuan-barang\\/157\\\";s:4:\\\"icon\\\";s:15:\\\"heroicon-o-cube\\\";s:5:\\\"color\\\";s:4:\\\"info\\\";s:12:\\\"reference_id\\\";s:3:\\\"157\\\";s:4:\\\"data\\\";a:6:{s:7:\\\"message\\\";s:46:\\\"Pengajuan PJB-28092026-0001 baru telah dibuat.\\\";s:7:\\\"user_id\\\";i:8;s:9:\\\"user_name\\\";s:16:\\\"Faizal Kurniawan\\\";s:11:\\\"nama_barang\\\";s:17:\\\"SSD SATA 2.5 Inch\\\";s:6:\\\"jumlah\\\";i:2;s:6:\\\"module\\\";s:9:\\\"pengajuan\\\";}}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:15:\\\"uniqueLockOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790793779,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to 127.0.0.1 port 8080 after 2040 ms: Could not connect to server (see https://curl.se/libcurl/c/libcurl-errors.html) for http://127.0.0.1:8080/apps/helpdesk/events?auth_key=helpdesk-key&auth_timestamp=1790793780&auth_version=1.0&body_md5=8e8f14bd34729e94b6b95bb87e2cd55f&auth_signature=8ff2858dfa5d9f5d92873dd444a72000ed1341ab62d4095a0eabd40dec335ef4. in C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:171\nStack trace:\n#0 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(109): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'Illuminate\\\\Noti...\', Array)\n#1 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(801): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(140): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(155): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(148): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(86): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(593): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(539): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(267): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(151): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(134): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(801): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(292): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(261): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1242): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DevApps\\laragon\\www\\helpdesk\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2026-09-30 18:43:02'),
(2, 'e26a5469-a483-4d43-9566-01ea13911d87', 'database', 'default', '{\"uuid\":\"e26a5469-a483-4d43-9566-01ea13911d87\",\"displayName\":\"Illuminate\\\\Notifications\\\\Events\\\\BroadcastNotificationCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":true,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":19:{s:5:\\\"event\\\";O:60:\\\"Illuminate\\\\Notifications\\\\Events\\\\BroadcastNotificationCreated\\\":3:{s:10:\\\"notifiable\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:1:{i:0;s:5:\\\"roles\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:38:\\\"App\\\\Notifications\\\\HelpdeskNotification\\\":10:{s:4:\\\"type\\\";s:17:\\\"pengajuan.created\\\";s:5:\\\"title\\\";s:21:\\\"Pengajuan Barang Baru\\\";s:7:\\\"message\\\";s:46:\\\"Pengajuan PJB-28092026-0001 baru telah dibuat.\\\";s:4:\\\"kode\\\";s:17:\\\"PJB-28092026-0001\\\";s:3:\\\"url\\\";s:48:\\\"http:\\/\\/localhost:8000\\/admin\\/pengajuan-barang\\/157\\\";s:4:\\\"icon\\\";s:15:\\\"heroicon-o-cube\\\";s:5:\\\"color\\\";s:4:\\\"info\\\";s:11:\\\"referenceId\\\";s:3:\\\"157\\\";s:4:\\\"data\\\";a:5:{s:7:\\\"message\\\";s:46:\\\"Pengajuan PJB-28092026-0001 baru telah dibuat.\\\";s:7:\\\"user_id\\\";i:8;s:9:\\\"user_name\\\";s:16:\\\"Faizal Kurniawan\\\";s:11:\\\"nama_barang\\\";s:17:\\\"SSD SATA 2.5 Inch\\\";s:6:\\\"jumlah\\\";i:2;}s:2:\\\"id\\\";s:36:\\\"1e42d84f-d0cf-4b6f-bc19-05c5af32770f\\\";}s:4:\\\"data\\\";a:10:{s:2:\\\"id\\\";s:36:\\\"1e42d84f-d0cf-4b6f-bc19-05c5af32770f\\\";s:4:\\\"type\\\";s:17:\\\"pengajuan.created\\\";s:5:\\\"title\\\";s:21:\\\"Pengajuan Barang Baru\\\";s:7:\\\"message\\\";s:46:\\\"Pengajuan PJB-28092026-0001 baru telah dibuat.\\\";s:4:\\\"kode\\\";s:17:\\\"PJB-28092026-0001\\\";s:3:\\\"url\\\";s:48:\\\"http:\\/\\/localhost:8000\\/admin\\/pengajuan-barang\\/157\\\";s:4:\\\"icon\\\";s:15:\\\"heroicon-o-cube\\\";s:5:\\\"color\\\";s:4:\\\"info\\\";s:12:\\\"reference_id\\\";s:3:\\\"157\\\";s:4:\\\"data\\\";a:6:{s:7:\\\"message\\\";s:46:\\\"Pengajuan PJB-28092026-0001 baru telah dibuat.\\\";s:7:\\\"user_id\\\";i:8;s:9:\\\"user_name\\\";s:16:\\\"Faizal Kurniawan\\\";s:11:\\\"nama_barang\\\";s:17:\\\"SSD SATA 2.5 Inch\\\";s:6:\\\"jumlah\\\";i:2;s:6:\\\"module\\\";s:9:\\\"pengajuan\\\";}}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:15:\\\"uniqueLockOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790793779,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to 127.0.0.1 port 8080 after 2032 ms: Could not connect to server (see https://curl.se/libcurl/c/libcurl-errors.html) for http://127.0.0.1:8080/apps/helpdesk/events?auth_key=helpdesk-key&auth_timestamp=1790793782&auth_version=1.0&body_md5=bcffb35ca8f760868020574379175dcc&auth_signature=e53094bd7885048d8d1deb7b775d9ebefe9c3ae1c740968f91322ffd518d25b7. in C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:171\nStack trace:\n#0 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(109): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'Illuminate\\\\Noti...\', Array)\n#1 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(801): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(140): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(155): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(148): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(86): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(593): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(539): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(267): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(151): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(134): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(801): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(292): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(261): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1242): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DevApps\\laragon\\www\\helpdesk\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2026-09-30 18:43:04'),
(3, '14d2d8a3-03e6-4c21-89a9-8c57ecfb53ca', 'database', 'default', '{\"uuid\":\"14d2d8a3-03e6-4c21-89a9-8c57ecfb53ca\",\"displayName\":\"Illuminate\\\\Notifications\\\\Events\\\\BroadcastNotificationCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":true,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":19:{s:5:\\\"event\\\";O:60:\\\"Illuminate\\\\Notifications\\\\Events\\\\BroadcastNotificationCreated\\\":3:{s:10:\\\"notifiable\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:1:{i:0;s:5:\\\"roles\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:38:\\\"App\\\\Notifications\\\\HelpdeskNotification\\\":10:{s:4:\\\"type\\\";s:17:\\\"pengajuan.created\\\";s:5:\\\"title\\\";s:21:\\\"Pengajuan Barang Baru\\\";s:7:\\\"message\\\";s:46:\\\"Pengajuan PJB-28092026-0001 baru telah dibuat.\\\";s:4:\\\"kode\\\";s:17:\\\"PJB-28092026-0001\\\";s:3:\\\"url\\\";s:48:\\\"http:\\/\\/localhost:8000\\/admin\\/pengajuan-barang\\/157\\\";s:4:\\\"icon\\\";s:15:\\\"heroicon-o-cube\\\";s:5:\\\"color\\\";s:4:\\\"info\\\";s:11:\\\"referenceId\\\";s:3:\\\"157\\\";s:4:\\\"data\\\";a:5:{s:7:\\\"message\\\";s:46:\\\"Pengajuan PJB-28092026-0001 baru telah dibuat.\\\";s:7:\\\"user_id\\\";i:8;s:9:\\\"user_name\\\";s:16:\\\"Faizal Kurniawan\\\";s:11:\\\"nama_barang\\\";s:17:\\\"SSD SATA 2.5 Inch\\\";s:6:\\\"jumlah\\\";i:2;}s:2:\\\"id\\\";s:36:\\\"fa5ce819-cdb2-4d88-80fa-622c856fb78c\\\";}s:4:\\\"data\\\";a:10:{s:2:\\\"id\\\";s:36:\\\"fa5ce819-cdb2-4d88-80fa-622c856fb78c\\\";s:4:\\\"type\\\";s:17:\\\"pengajuan.created\\\";s:5:\\\"title\\\";s:21:\\\"Pengajuan Barang Baru\\\";s:7:\\\"message\\\";s:46:\\\"Pengajuan PJB-28092026-0001 baru telah dibuat.\\\";s:4:\\\"kode\\\";s:17:\\\"PJB-28092026-0001\\\";s:3:\\\"url\\\";s:48:\\\"http:\\/\\/localhost:8000\\/admin\\/pengajuan-barang\\/157\\\";s:4:\\\"icon\\\";s:15:\\\"heroicon-o-cube\\\";s:5:\\\"color\\\";s:4:\\\"info\\\";s:12:\\\"reference_id\\\";s:3:\\\"157\\\";s:4:\\\"data\\\";a:6:{s:7:\\\"message\\\";s:46:\\\"Pengajuan PJB-28092026-0001 baru telah dibuat.\\\";s:7:\\\"user_id\\\";i:8;s:9:\\\"user_name\\\";s:16:\\\"Faizal Kurniawan\\\";s:11:\\\"nama_barang\\\";s:17:\\\"SSD SATA 2.5 Inch\\\";s:6:\\\"jumlah\\\";i:2;s:6:\\\"module\\\";s:9:\\\"pengajuan\\\";}}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:15:\\\"uniqueLockOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790793779,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to 127.0.0.1 port 8080 after 2024 ms: Could not connect to server (see https://curl.se/libcurl/c/libcurl-errors.html) for http://127.0.0.1:8080/apps/helpdesk/events?auth_key=helpdesk-key&auth_timestamp=1790793784&auth_version=1.0&body_md5=c9f51dd53fdc06aade2b9499348c0bfe&auth_signature=dd703c0d106148e6a961371080846c5b182c3a40742f1f0d7fc3bc2c2f2b29c7. in C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:171\nStack trace:\n#0 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(109): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'Illuminate\\\\Noti...\', Array)\n#1 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(801): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(140): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(155): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(148): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(86): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(593): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(539): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(267): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(151): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(134): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(801): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(292): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(261): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1242): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DevApps\\laragon\\www\\helpdesk\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2026-09-30 18:43:06'),
(4, 'dddae8b9-bf2a-424f-a011-b0e382866a2c', 'database', 'default', '{\"uuid\":\"dddae8b9-bf2a-424f-a011-b0e382866a2c\",\"displayName\":\"Illuminate\\\\Notifications\\\\Events\\\\BroadcastNotificationCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":true,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":19:{s:5:\\\"event\\\";O:60:\\\"Illuminate\\\\Notifications\\\\Events\\\\BroadcastNotificationCreated\\\":3:{s:10:\\\"notifiable\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:7;s:9:\\\"relations\\\";a:1:{i:0;s:5:\\\"roles\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:38:\\\"App\\\\Notifications\\\\HelpdeskNotification\\\":10:{s:4:\\\"type\\\";s:17:\\\"pengajuan.created\\\";s:5:\\\"title\\\";s:21:\\\"Pengajuan Barang Baru\\\";s:7:\\\"message\\\";s:46:\\\"Pengajuan PJB-28092026-0001 baru telah dibuat.\\\";s:4:\\\"kode\\\";s:17:\\\"PJB-28092026-0001\\\";s:3:\\\"url\\\";s:48:\\\"http:\\/\\/localhost:8000\\/admin\\/pengajuan-barang\\/157\\\";s:4:\\\"icon\\\";s:15:\\\"heroicon-o-cube\\\";s:5:\\\"color\\\";s:4:\\\"info\\\";s:11:\\\"referenceId\\\";s:3:\\\"157\\\";s:4:\\\"data\\\";a:5:{s:7:\\\"message\\\";s:46:\\\"Pengajuan PJB-28092026-0001 baru telah dibuat.\\\";s:7:\\\"user_id\\\";i:8;s:9:\\\"user_name\\\";s:16:\\\"Faizal Kurniawan\\\";s:11:\\\"nama_barang\\\";s:17:\\\"SSD SATA 2.5 Inch\\\";s:6:\\\"jumlah\\\";i:2;}s:2:\\\"id\\\";s:36:\\\"ffc46b75-06e4-41fe-bff0-1b6d10f1d200\\\";}s:4:\\\"data\\\";a:10:{s:2:\\\"id\\\";s:36:\\\"ffc46b75-06e4-41fe-bff0-1b6d10f1d200\\\";s:4:\\\"type\\\";s:17:\\\"pengajuan.created\\\";s:5:\\\"title\\\";s:21:\\\"Pengajuan Barang Baru\\\";s:7:\\\"message\\\";s:46:\\\"Pengajuan PJB-28092026-0001 baru telah dibuat.\\\";s:4:\\\"kode\\\";s:17:\\\"PJB-28092026-0001\\\";s:3:\\\"url\\\";s:48:\\\"http:\\/\\/localhost:8000\\/admin\\/pengajuan-barang\\/157\\\";s:4:\\\"icon\\\";s:15:\\\"heroicon-o-cube\\\";s:5:\\\"color\\\";s:4:\\\"info\\\";s:12:\\\"reference_id\\\";s:3:\\\"157\\\";s:4:\\\"data\\\";a:6:{s:7:\\\"message\\\";s:46:\\\"Pengajuan PJB-28092026-0001 baru telah dibuat.\\\";s:7:\\\"user_id\\\";i:8;s:9:\\\"user_name\\\";s:16:\\\"Faizal Kurniawan\\\";s:11:\\\"nama_barang\\\";s:17:\\\"SSD SATA 2.5 Inch\\\";s:6:\\\"jumlah\\\";i:2;s:6:\\\"module\\\";s:9:\\\"pengajuan\\\";}}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:15:\\\"uniqueLockOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1790793779,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to 127.0.0.1 port 8080 after 2033 ms: Could not connect to server (see https://curl.se/libcurl/c/libcurl-errors.html) for http://127.0.0.1:8080/apps/helpdesk/events?auth_key=helpdesk-key&auth_timestamp=1790793786&auth_version=1.0&body_md5=6c6c67163b7822cf7c7fd79c98fa35e7&auth_signature=93d86021b35b07b280deea13a3300d8ee5a3044ec64ea569f5090508c4f1ce93. in C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:171\nStack trace:\n#0 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(109): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'Illuminate\\\\Noti...\', Array)\n#1 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(801): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(140): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(155): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(148): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(86): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(593): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(539): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(267): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(151): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(134): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(801): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(292): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(261): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DevApps\\laragon\\www\\helpdesk\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1242): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DevApps\\laragon\\www\\helpdesk\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2026-09-30 18:43:08');

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
-- Table structure for table `log_data_pengajuan_barang`
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
-- Dumping data for table `log_data_pengajuan_barang`
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
(65, 105, 3, 'Chat', NULL, NULL, 'Teknisi Edi Purwanto, S.Kom mengambil tiket ini.', '2026-09-17 00:45:19'),
(66, 106, 4, 'Status', NULL, 'Open', 'Pengajuan dibuat', '2026-09-17 01:25:58'),
(67, 106, 4, 'Chat', NULL, NULL, 'ffff', '2026-09-17 01:26:05'),
(68, 106, 3, 'Chat', NULL, NULL, 'ffff', '2026-09-17 01:26:24'),
(115, 157, 8, 'Status', NULL, 'Open', 'Pengajuan dibuat', '2026-09-28 15:09:48'),
(116, 157, 8, 'Delete Data', 'Open', 'Deleted', 'Pengajuan barang telah dihapus oleh System', '2026-09-28 15:12:52'),
(117, 158, 8, 'Status', NULL, 'Open', 'Pengajuan dibuat', '2026-09-28 15:19:53'),
(118, 158, 8, 'Update Data', 'SSD SATA 2.5 Inch', 'TEST - HDD SATA 2.5 Inch', 'TEST: perubahan Master Barang pada Pengajuan Barang', '2026-09-28 15:21:29'),
(119, 159, 3, 'Status', NULL, 'Open', 'Pengajuan dibuat', '2026-09-28 23:18:22'),
(120, 160, 8, 'Status', NULL, 'Open', 'Pengajuan dibuat', '2026-09-28 23:19:31'),
(166, 158, 8, 'Delete Data', 'Open', 'Deleted', 'Pengajuan barang telah dihapus oleh Faizal Kurniawan', '2026-09-29 12:57:24'),
(167, 160, 8, 'Delete Data', 'Open', 'Cancelled', 'Pengajuan barang dibatalkan oleh Faizal Kurniawan', '2026-09-29 13:18:40'),
(168, 160, 8, 'Delete Data', 'Open', 'Cancelled', 'Pengajuan barang dibatalkan oleh Faizal Kurniawan', '2026-09-29 13:23:39'),
(169, 160, 8, 'Delete Data', 'Open', 'Deleted', 'Pengajuan barang telah dihapus oleh Faizal Kurniawan', '2026-09-29 13:23:39'),
(170, 161, 8, 'Status', NULL, 'Open', 'Pengajuan dibuat', '2026-09-29 13:25:28'),
(171, 161, 8, 'Delete Data', 'Open', 'Cancelled', 'Pengajuan barang dibatalkan oleh Faizal Kurniawan', '2026-09-29 13:25:38'),
(172, 161, 8, 'Delete Data', 'Open', 'Cancelled', 'Pengajuan barang dibatalkan oleh Faizal Kurniawan', '2026-09-29 13:30:12'),
(173, 161, 8, 'Delete Data', 'Open', 'Deleted', 'Pengajuan barang telah dihapus oleh Faizal Kurniawan', '2026-09-29 13:30:12'),
(174, 162, 8, 'Status', NULL, 'Open', 'Pengajuan dibuat', '2026-09-29 13:30:36'),
(175, 162, 8, 'Delete Data', 'Open', 'Cancelled', 'Pengajuan barang dibatalkan oleh Faizal Kurniawan', '2026-09-29 13:30:44'),
(176, 162, 8, 'Delete Data', 'Open', 'Deleted', 'Pengajuan barang telah dihapus oleh Faizal Kurniawan', '2026-09-29 13:30:44'),
(177, 161, 8, 'Status', 'Open', 'Cancelled', 'Pengajuan barang dibatalkan oleh Faizal Kurniawan', '2026-09-29 14:05:08'),
(178, 162, 8, 'Update Data', 'Hard Disk CCTV 2TB', 'Hard Disk CCTV 1TB', 'Barang pengajuan diperbarui oleh Faizal Kurniawan', '2026-09-29 14:07:17'),
(179, 6, 3, 'Delete Data', 'Close', 'Deleted', 'Pengajuan barang telah dihapus oleh Edi Purwanto, S.Kom', '2026-09-29 14:10:55'),
(180, 4, 3, 'Delete Data', 'Close', 'Deleted', 'Pengajuan barang telah dihapus oleh Edi Purwanto, S.Kom', '2026-09-29 14:10:55'),
(181, 3, 3, 'Delete Data', 'Close', 'Deleted', 'Pengajuan barang telah dihapus oleh Edi Purwanto, S.Kom', '2026-09-29 14:10:55'),
(182, 2, 3, 'Delete Data', 'Close', 'Deleted', 'Pengajuan barang telah dihapus oleh Edi Purwanto, S.Kom', '2026-09-29 14:10:55'),
(217, 162, 3, 'Delete Data', 'Open', 'Deleted', 'Pengajuan barang telah dihapus oleh Edi Purwanto, S.Kom', '2026-09-30 15:50:36'),
(218, 162, 7, 'Delete Data', 'Open', 'Deleted', 'Pengajuan barang telah dihapus oleh AdminSuper', '2026-09-30 16:36:40'),
(219, 161, 7, 'Delete Data', 'Open', 'Deleted', 'Pengajuan barang telah dihapus oleh AdminSuper', '2026-09-30 16:36:40'),
(220, 160, 7, 'Delete Data', 'Open', 'Deleted', 'Pengajuan barang telah dihapus oleh AdminSuper', '2026-09-30 16:36:40'),
(221, 159, 7, 'Delete Data', 'Open', 'Deleted', 'Pengajuan barang telah dihapus oleh AdminSuper', '2026-09-30 16:36:40'),
(222, 158, 7, 'Delete Data', 'Open', 'Deleted', 'Pengajuan barang telah dihapus oleh AdminSuper', '2026-09-30 16:36:40'),
(223, 157, 7, 'Delete Data', 'Open', 'Deleted', 'Pengajuan barang telah dihapus oleh AdminSuper', '2026-09-30 16:36:40'),
(224, 106, 7, 'Delete Data', 'Open', 'Deleted', 'Pengajuan barang telah dihapus oleh AdminSuper', '2026-09-30 16:36:41'),
(225, 105, 7, 'Delete Data', 'In Progress', 'Deleted', 'Pengajuan barang telah dihapus oleh AdminSuper', '2026-09-30 16:36:41'),
(226, 104, 7, 'Delete Data', 'Open', 'Deleted', 'Pengajuan barang telah dihapus oleh AdminSuper', '2026-09-30 16:36:41'),
(227, 54, 7, 'Delete Data', 'Open', 'Deleted', 'Pengajuan barang telah dihapus oleh AdminSuper', '2026-09-30 16:36:41'),
(228, 157, 3, 'Status', 'Open', 'In Progress', 'Pengajuan mulai diproses oleh Edi Purwanto, S.Kom', '2026-09-30 18:38:46'),
(229, 157, 3, 'Chat', NULL, NULL, 'Pengajuan diambil oleh Edi Purwanto, S.Kom.', '2026-09-30 18:38:46'),
(230, 160, 7, 'Status', 'Open', 'In Progress', 'Pengajuan mulai diproses oleh AdminSuper', '2026-09-30 18:44:07'),
(231, 160, 7, 'Chat', NULL, NULL, 'Pengajuan diambil oleh AdminSuper.', '2026-09-30 18:44:07'),
(279, 6, 3, 'Delete Data', 'Close', 'Deleted', 'Pengajuan barang telah dihapus oleh Edi Purwanto, S.Kom', '2026-10-05 22:30:23'),
(280, 4, 3, 'Delete Data', 'Close', 'Deleted', 'Pengajuan barang telah dihapus oleh Edi Purwanto, S.Kom', '2026-10-05 22:30:24'),
(281, 3, 3, 'Delete Data', 'Close', 'Deleted', 'Pengajuan barang telah dihapus oleh Edi Purwanto, S.Kom', '2026-10-05 22:30:24'),
(282, 2, 3, 'Delete Data', 'Close', 'Deleted', 'Pengajuan barang telah dihapus oleh Edi Purwanto, S.Kom', '2026-10-05 22:30:24');

-- --------------------------------------------------------

--
-- Table structure for table `log_data_tiket_perbaikan`
--

CREATE TABLE `log_data_tiket_perbaikan` (
  `id` int NOT NULL,
  `tiket_id` int NOT NULL,
  `user_id` int NOT NULL,
  `kategori_log` enum('Status','Chat','Update Data','Delete Data') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `data_lama` varchar(255) DEFAULT NULL,
  `data_baru` varchar(255) DEFAULT NULL,
  `keterangan` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `log_data_tiket_perbaikan`
--

INSERT INTO `log_data_tiket_perbaikan` (`id`, `tiket_id`, `user_id`, `kategori_log`, `data_lama`, `data_baru`, `keterangan`, `created_at`) VALUES
(1, 1, 6, 'Status', NULL, 'Open', 'Tiket dibuat oleh Pemohon.', '2026-04-20 01:00:00'),
(2, 1, 1, 'Status', 'Open', 'In Progress', 'Fithnan sedang mengecek PC.', '2026-04-20 01:30:00'),
(3, 1, 1, 'Status', 'In Progress', 'Close', 'PC sudah direstart dan normal kembali.', '2026-04-20 02:30:00'),
(4, 2, 4, 'Status', NULL, 'Open', 'Tiket dibuat oleh Pemohon.', '2026-04-20 03:00:00'),
(5, 2, 2, 'Status', 'Open', 'In Progress', 'Sulistyo mengecek switch hub.', '2026-04-20 03:15:00'),
(6, 5, 7, 'Status', NULL, 'Open', 'Tiket dibuat', '2026-06-01 02:40:21'),
(7, 6, 7, 'Status', NULL, 'Open', 'Tiket dibuat', '2026-06-01 03:04:38'),
(8, 7, 7, 'Status', NULL, 'Open', 'Tiket dibuat', '2026-06-02 00:26:38'),
(9, 2, 7, 'Status', 'In Progress', 'Close', '[SELESAI]Jaringan sudah selesai diperbaiki', '2026-06-10 23:26:32'),
(10, 7, 7, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan', '2026-06-10 23:27:53'),
(11, 7, 7, 'Status', 'In Progress', 'Close', '[DITOLAK] Printer tidak bisa diperbaiki', '2026-06-10 23:28:08'),
(12, 5, 7, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan', '2026-06-10 23:28:25'),
(13, 4, 7, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan', '2026-06-10 23:28:26'),
(14, 3, 1, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan', '2026-06-10 23:29:04'),
(15, 6, 1, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan', '2026-06-10 23:30:48'),
(16, 1, 2, 'Chat', NULL, NULL, 'Tes', '2026-06-11 08:26:50'),
(17, 6, 2, 'Status', 'In Progress', 'Close', '[SELESAI] Printer Sudah siap dipakai. Silahkan Di ambil ke tempat Teknisi', '2026-06-11 09:14:18'),
(18, 2, 2, 'Status', 'Close', 'In Progress', '[REOPEN] Jaringan Mati Kembali', '2026-06-11 09:31:26'),
(19, 2, 2, 'Status', 'In Progress', 'Close', '[SELESAI] Selesai Diperbaiki', '2026-06-11 09:31:58'),
(20, 1, 2, 'Status', 'Close', 'In Progress', '[REOPEN] Pc Kembali rusak', '2026-06-11 09:32:17'),
(21, 1, 2, 'Status', 'In Progress', 'Close', '[SELESAI] diperbaiki, ganti RAM dan PSU karena kurang daya.', '2026-06-11 09:33:33'),
(22, 4, 7, 'Status', 'In Progress', 'Close', '[SELESAI] Perbaikan Telah selesai.', '2026-06-15 02:21:36'),
(23, 4, 7, 'Status', 'Close', 'In Progress', '[REOPEN] Pc kembali rusak.', '2026-06-15 02:22:21'),
(24, 1, 7, 'Chat', NULL, NULL, 'Ceks', '2026-06-15 03:26:18'),
(25, 8, 1, 'Status', NULL, 'Open', 'Tiket dibuat', '2026-06-15 06:36:07'),
(26, 8, 1, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan oleh Fithnan', '2026-06-15 06:36:30'),
(27, 9, 7, 'Status', NULL, 'Open', 'Tiket dibuat', '2026-06-17 12:24:00'),
(28, 9, 7, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan oleh AdminSuper', '2026-06-25 03:50:18'),
(29, 9, 7, 'Status', 'In Progress', 'In Progress', 'Tiket mulai dikerjakan oleh AdminSuper', '2026-06-25 03:50:18'),
(30, 9, 7, 'Chat', NULL, NULL, 'Teknisi AdminSuper mengambil tiket ini.', '2026-06-25 03:50:18'),
(31, 10, 1, 'Status', NULL, 'Open', 'Tiket dibuat', '2026-06-25 04:15:36'),
(32, 5, 7, 'Status', 'In Progress', 'Close', '[SELESAI] Done', '2026-06-26 02:00:08'),
(33, 10, 7, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan oleh AdminSuper', '2026-06-26 02:02:25'),
(34, 10, 7, 'Status', 'In Progress', 'In Progress', 'Tiket mulai dikerjakan oleh AdminSuper', '2026-06-26 02:02:25'),
(35, 10, 7, 'Chat', NULL, NULL, 'Teknisi AdminSuper mengambil tiket ini.', '2026-06-26 02:02:25'),
(36, 6, 7, 'Delete Data', NULL, NULL, 'Tiket dihapus (Soft Delete)AdminSuper', '2026-06-29 01:12:16'),
(37, 5, 7, 'Delete Data', NULL, NULL, 'Tiket telah dihapus olehAdminSuper', '2026-06-29 01:43:40'),
(38, 6, 7, 'Delete Data', NULL, NULL, 'Tiket telah dihapus olehAdminSuper', '2026-06-29 01:43:44'),
(39, 11, 7, 'Status', NULL, 'Open', 'Tiket dibuat', '2026-07-20 21:31:34'),
(40, 12, 4, 'Status', NULL, 'Open', 'Tiket dibuat', '2026-08-13 21:02:06'),
(41, 12, 4, 'Delete Data', 'Open', 'Deleted', 'Tiket dibatalkan oleh Eko', '2026-08-13 21:02:13'),
(42, 12, 4, 'Chat', NULL, NULL, 'dsafwa', '2026-08-13 22:31:04'),
(43, 12, 4, 'Chat', NULL, NULL, 'rward', '2026-08-13 22:31:11'),
(44, 12, 4, 'Chat', NULL, NULL, 'teo', '2026-08-13 22:53:16'),
(45, 12, 7, 'Chat', NULL, NULL, '521sd', '2026-08-14 01:51:51'),
(46, 12, 4, 'Chat', NULL, NULL, 'fwauhgujbeag', '2026-08-14 02:03:50'),
(47, 9, 5, 'Chat', NULL, NULL, 'ningise', '2026-08-17 18:18:16'),
(48, 13, 5, 'Status', NULL, 'Open', 'Tiket dibuat', '2026-08-17 18:31:16'),
(49, 13, 5, 'Chat', NULL, NULL, 'Institut Widya Pratama merupakan lembaga pendidikan tinggi yang membutuhkan pengelolaan serta pemeliharaan infrastruktur fisik maupun IT secara handal guna mendukung kegiatan akademik dan administratif. Saat ini, proses pengaduan, pencatatan kerusakan, serta permohonan perawatan infrastruktur pada Bidang Pelayanan dan Perawatan Infrastruktur masih menghadapi kendala operasional, seperti pelaporan yang belum terpusat, pencatatan manual, sulitnya melakukan pemantauan (tracking) status perbaikan, dan ketiadaan riwayat penanganan (history log) yang terstruktur.', '2026-08-17 18:31:30'),
(50, 13, 1, 'Chat', NULL, NULL, 'Membangun Sistem Informasi Manajemen Pelayanan Internal (Helpdesk) yang terintegrasi untuk mengelola pengaduan dan pemeliharaan infrastruktur.  Menerapkan sistem pada unit mitra melalui tahap migrasi data, pelatihan pengguna, uji coba, dan pendampingan awal.  Menganalisis dan mengevaluasi dampak kebermanfaatan penerapan solusi teknologi tepat guna dalam meningkatkan mutu pelayanan internal kampus.', '2026-08-17 18:35:10'),
(52, 13, 5, 'Chat', NULL, NULL, 'test', '2026-09-07 12:02:49'),
(53, 13, 5, 'Chat', NULL, NULL, 'dd', '2026-09-07 12:03:04'),
(54, 13, 7, 'Chat', NULL, NULL, 'd', '2026-09-07 12:03:21'),
(55, 13, 5, 'Chat', NULL, NULL, 'd', '2026-09-07 12:06:52'),
(56, 13, 7, 'Chat', NULL, NULL, 'd', '2026-09-07 12:06:57'),
(57, 13, 7, 'Chat', NULL, NULL, 'd', '2026-09-07 12:07:12'),
(58, 13, 5, 'Chat', NULL, NULL, 'd', '2026-09-07 12:07:15'),
(59, 13, 1, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan oleh Fithnan', '2026-09-07 12:24:45'),
(60, 13, 5, 'Chat', NULL, NULL, 'tets', '2026-09-07 12:25:04'),
(61, 13, 1, 'Chat', NULL, NULL, 'de', '2026-09-07 12:25:13'),
(62, 11, 3, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan oleh Edi Purwanto, S.Kom', '2026-09-07 13:31:49'),
(63, 11, 3, 'Chat', NULL, NULL, 'Teknisi Edi Purwanto, S.Kom mengambil tiket ini.', '2026-09-07 13:31:49'),
(64, 12, 3, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan oleh Edi Purwanto, S.Kom', '2026-09-07 13:31:50'),
(65, 12, 3, 'Chat', NULL, NULL, 'Teknisi Edi Purwanto, S.Kom mengambil tiket ini.', '2026-09-07 13:31:50'),
(66, 52, 4, 'Status', NULL, 'Open', 'Tiket dibuat', '2026-09-17 01:26:58'),
(67, 52, 4, 'Chat', NULL, NULL, 'fegeg', '2026-09-17 01:27:15'),
(68, 52, 4, 'Chat', NULL, NULL, 'fefe', '2026-09-17 01:27:22'),
(69, 52, 1, 'Chat', NULL, NULL, 'fefe', '2026-09-17 01:27:31'),
(70, 52, 3, 'Chat', NULL, NULL, 'fegey', '2026-09-17 01:27:37'),
(71, 52, 1, 'Status', 'Open', 'In Progress', 'Tiket mulai dikerjakan oleh Fithnan', '2026-09-17 01:27:52'),
(72, 52, 1, 'Status', 'In Progress', 'Close', '[SELESAI] Sudah selesai.', '2026-09-17 01:28:15');

-- --------------------------------------------------------

--
-- Table structure for table `log_harian_teknisi`
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
-- Dumping data for table `log_harian_teknisi`
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
-- Table structure for table `master_barang`
--

CREATE TABLE `master_barang` (
  `id` bigint UNSIGNED NOT NULL,
  `kategori_barang_id` bigint UNSIGNED NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `master_barang`
--

INSERT INTO `master_barang` (`id`, `kategori_barang_id`, `nama_barang`, `keterangan`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'SSD SATA 2.5 Inch', 'Media penyimpanan SSD SATA 2.5 inch untuk upgrade atau penggantian storage komputer dan laptop.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:43', NULL),
(2, 1, 'SSD NVMe M.2', 'Media penyimpanan SSD NVMe M.2 untuk upgrade atau penggantian storage laptop dan komputer yang mendukung NVMe.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:43', NULL),
(3, 1, 'RAM DDR4 8GB', 'Modul memori RAM DDR4 kapasitas 8GB untuk upgrade atau penggantian memori komputer dan laptop.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(4, 1, 'RAM DDR4 16GB', 'Modul memori RAM DDR4 kapasitas 16GB untuk kebutuhan upgrade komputer dan laptop.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(5, 1, 'RAM DDR3 8GB', 'Modul memori RAM DDR3 kapasitas 8GB untuk komputer atau laptop generasi lama.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(6, 1, 'Power Supply ATX', 'Power supply komputer desktop untuk penggantian PSU yang rusak atau kebutuhan perbaikan unit PC.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(7, 1, 'CMOS Battery CR2032', 'Baterai CMOS untuk menjaga konfigurasi BIOS dan waktu sistem pada motherboard.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(8, 1, 'Keyboard USB', 'Keyboard USB sebagai perangkat input pengganti untuk komputer desktop.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(9, 1, 'Mouse USB', 'Mouse USB sebagai perangkat input pengganti untuk komputer desktop dan workstation.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(10, 1, 'Adapter USB to SATA', 'Adapter untuk menghubungkan HDD atau SSD SATA ke komputer melalui koneksi USB untuk kebutuhan teknisi.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(11, 2, 'Switch 8 Port Gigabit', 'Switch jaringan 8 port Gigabit untuk koneksi perangkat pada jaringan lokal.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:43', NULL),
(12, 2, 'Switch 24 Port Gigabit', 'Switch jaringan 24 port Gigabit untuk distribusi jaringan pada ruangan, laboratorium, atau kantor.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:43', NULL),
(13, 2, 'Router', 'Perangkat router untuk kebutuhan routing dan pengelolaan jaringan.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(14, 2, 'Access Point', 'Perangkat wireless access point untuk menyediakan akses jaringan Wi-Fi.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(15, 2, 'USB WiFi Adapter', 'Adapter WiFi USB untuk menambahkan atau mengganti fungsi wireless pada komputer.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:43', NULL),
(16, 2, 'LAN Cable Cat6', 'Kabel jaringan UTP Cat6 untuk instalasi dan perawatan jaringan komputer.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(17, 2, 'Konektor RJ45', 'Konektor RJ45 untuk terminasi kabel jaringan UTP.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(18, 2, 'Patch Cord Cat6', 'Kabel jaringan pendek dengan konektor RJ45 untuk menghubungkan perangkat jaringan.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(19, 2, 'Keystone Jack Cat6', 'Modul konektor jaringan Cat6 untuk faceplate, outlet jaringan, atau patch panel.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(20, 2, 'PoE Injector', 'Perangkat untuk memberikan daya melalui kabel Ethernet kepada perangkat yang mendukung PoE.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(21, 3, 'Toner Printer Laser', 'Toner pengganti untuk kebutuhan operasional dan perawatan printer laser.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:43', NULL),
(22, 3, 'Drum Unit Printer', 'Komponen drum unit untuk printer laser sebagai bagian dari proses pencetakan.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(23, 3, 'Maintenance Kit Printer', 'Komponen maintenance kit untuk perawatan berkala printer laser.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(24, 3, 'Roller Pickup Printer', 'Roller untuk menarik kertas dari tray printer.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(25, 3, 'Separation Pad Printer', 'Komponen pemisah kertas untuk membantu mencegah printer menarik beberapa lembar sekaligus.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(26, 3, 'Cartridge Tinta Hitam', 'Cartridge tinta warna hitam untuk printer inkjet.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(27, 3, 'Cartridge Tinta Warna', 'Cartridge tinta warna untuk printer inkjet.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(28, 3, 'Waste Ink Pad', 'Komponen penampung tinta sisa pada printer inkjet.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:43', NULL),
(29, 3, 'Kabel USB Printer', 'Kabel USB untuk menghubungkan printer dengan komputer.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(30, 3, 'Power Supply Printer', 'Adaptor atau power supply pengganti untuk printer yang mengalami kerusakan pada bagian catu daya.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(31, 4, 'UPS 1200VA', 'Uninterruptible Power Supply untuk memberikan daya cadangan dan perlindungan perangkat IT.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:43', NULL),
(32, 4, 'UPS Battery', 'Baterai pengganti untuk UPS yang digunakan pada perangkat komputer, jaringan, atau server.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:43', NULL),
(33, 4, 'Power Extension 6 Port', 'Terminal listrik dengan beberapa port untuk kebutuhan perangkat IT.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(34, 4, 'PDU Rack', 'Power Distribution Unit untuk distribusi daya listrik pada perangkat yang terpasang di rack.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(35, 4, 'Kabel Power Komputer', 'Kabel power AC untuk komputer desktop, monitor, UPS, dan perangkat IT lainnya.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(36, 4, 'Rack Server 12U', 'Rack untuk pemasangan perangkat jaringan, server, patch panel, UPS, dan perangkat IT lainnya.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(37, 4, 'Fan Cooling Rack', 'Kipas pendingin untuk membantu menjaga temperatur perangkat dalam rack jaringan atau server.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(38, 4, 'Cable Management Rack', 'Aksesori untuk merapikan dan mengatur jalur kabel pada rack jaringan atau server.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(39, 4, 'Wall Mount Bracket Access Point', 'Bracket untuk pemasangan access point pada dinding atau plafon.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:43', NULL),
(40, 4, 'Stop Kontak Dinding', 'Komponen instalasi listrik untuk menyediakan titik sumber daya bagi perangkat IT.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:43', NULL),
(41, 5, 'Multimeter Digital', 'Alat ukur listrik untuk pemeriksaan tegangan, arus, resistansi, dan troubleshooting perangkat elektronik.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(42, 5, 'LAN Cable Tester', 'Alat untuk menguji kontinuitas dan susunan kabel jaringan RJ45.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(43, 5, 'Tang Crimping RJ45', 'Alat untuk memasang konektor RJ45 pada kabel jaringan UTP.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:43', NULL),
(44, 5, 'Obeng Set Teknisi', 'Set obeng berbagai ukuran dan jenis untuk membongkar serta memasang perangkat komputer dan elektronik.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(45, 5, 'Precision Screwdriver Set', 'Set obeng presisi untuk membongkar laptop, notebook, smartphone, dan perangkat elektronik kecil.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(46, 5, 'Solder Station', 'Peralatan solder dengan pengaturan temperatur untuk perbaikan dan penggantian komponen elektronik.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:43', NULL),
(47, 5, 'Heat Gun', 'Alat pemanas untuk membantu pekerjaan teknisi seperti heat shrink, pelepasan komponen, dan pekerjaan kabel.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:42', NULL),
(48, 5, 'Tang Potong', 'Peralatan untuk memotong kabel, cable tie, dan material kecil dalam pekerjaan instalasi.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:43', NULL),
(49, 5, 'Tang Lancip', 'Peralatan untuk menjepit dan memegang komponen atau kabel pada area yang sempit.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:43', NULL),
(50, 5, 'USB Bootable Flashdisk', 'Media penyimpanan USB untuk kebutuhan instalasi sistem operasi, recovery, diagnostic tools, dan maintenance komputer.', 1, '2026-09-19 21:24:47', '2026-09-28 15:19:43', NULL),
(51, 6, 'PC Desktop Core i3', 'Komputer desktop kelas entry-level untuk kebutuhan administrasi, perkantoran, dan operasional umum.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(52, 6, 'PC Desktop Core i5', 'Komputer desktop untuk kebutuhan administrasi, akademik, laboratorium, dan operasional umum.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(53, 6, 'PC Desktop Core i7', 'Komputer desktop untuk kebutuhan pekerjaan dengan beban komputasi lebih tinggi.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(54, 6, 'Mini PC', 'Komputer berukuran ringkas untuk kebutuhan administrasi, kiosk, ruang kerja, atau fasilitas khusus.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(55, 6, 'Laptop Core i3', 'Laptop untuk kebutuhan administrasi dan pekerjaan operasional ringan.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(56, 6, 'Laptop Core i5', 'Laptop untuk kebutuhan pekerjaan administrasi, akademik, dan operasional umum.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(57, 6, 'Laptop Core i7', 'Laptop untuk pekerjaan dengan kebutuhan komputasi lebih tinggi.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(58, 6, 'Workstation', 'Komputer workstation untuk pekerjaan desain, engineering, pengembangan perangkat lunak, atau komputasi berat.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:43', NULL),
(59, 6, 'Chromebook', 'Perangkat komputer portabel berbasis ChromeOS untuk kebutuhan pembelajaran dan operasional tertentu.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(60, 6, 'Tablet', 'Perangkat komputer tablet untuk kebutuhan pembelajaran, presentasi, administrasi, atau mobilitas.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:43', NULL),
(61, 7, 'Monitor LED 19 Inch', 'Monitor LED ukuran 19 inch untuk kebutuhan komputer dan administrasi.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(62, 7, 'Monitor LED 22 Inch', 'Monitor LED ukuran 22 inch untuk kebutuhan komputer perkantoran dan akademik.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(63, 7, 'Monitor LED 24 Inch', 'Monitor LED ukuran 24 inch untuk kebutuhan workstation, administrasi, dan laboratorium.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(64, 7, 'Monitor LED 27 Inch', 'Monitor LED ukuran 27 inch untuk kebutuhan workstation dan pekerjaan multimedia.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(65, 7, 'Monitor Ultrawide', 'Monitor ultrawide untuk kebutuhan multitasking, pengembangan perangkat lunak, dan pekerjaan multimedia.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(66, 7, 'Monitor Portable', 'Monitor portabel untuk kebutuhan mobilitas dan workstation tambahan.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(67, 7, 'TV LED 43 Inch', 'Televisi LED untuk kebutuhan informasi, ruang rapat, pembelajaran, atau display informasi.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:43', NULL),
(68, 7, 'TV LED 55 Inch', 'Televisi LED ukuran 55 inch untuk ruang rapat, aula, dan kebutuhan multimedia.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:43', NULL),
(69, 7, 'Digital Signage Display', 'Display digital untuk penyampaian informasi dan pengumuman di lingkungan institut.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(70, 7, 'Monitor Interactive', 'Layar interaktif untuk kebutuhan pembelajaran, presentasi, dan ruang rapat.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(71, 8, 'Switch 8 Port Gigabit', 'Switch Gigabit 8 port untuk jaringan lokal skala kecil.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:43', NULL),
(72, 8, 'Switch 16 Port Gigabit', 'Switch Gigabit 16 port untuk distribusi jaringan pada ruangan atau area kerja.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:43', NULL),
(73, 8, 'Switch 24 Port Gigabit', 'Switch Gigabit 24 port untuk kebutuhan jaringan kantor, laboratorium, dan fasilitas institut.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:43', NULL),
(74, 8, 'Switch 48 Port Gigabit', 'Switch Gigabit 48 port untuk kebutuhan distribusi jaringan skala besar.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:43', NULL),
(75, 8, 'Managed Switch', 'Switch yang mendukung pengelolaan jaringan seperti VLAN, monitoring, dan konfigurasi jaringan.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(76, 8, 'Router', 'Perangkat untuk routing dan pengelolaan koneksi antar jaringan.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(77, 8, 'Access Point Indoor', 'Access point untuk menyediakan konektivitas WiFi di dalam gedung.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(78, 8, 'Access Point Outdoor', 'Access point untuk menyediakan konektivitas jaringan nirkabel pada area luar gedung.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(79, 8, 'Firewall Appliance', 'Perangkat keamanan jaringan untuk pengendalian dan perlindungan lalu lintas jaringan.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(80, 8, 'Media Converter Fiber', 'Perangkat untuk mengonversi koneksi Ethernet tembaga menjadi koneksi fiber optic atau sebaliknya.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(81, 9, 'Printer Inkjet', 'Printer inkjet untuk kebutuhan pencetakan dokumen dan kebutuhan warna.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(82, 9, 'Printer Laser Monokrom', 'Printer laser hitam putih untuk kebutuhan pencetakan dokumen dengan volume tinggi.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(83, 9, 'Printer Laser Warna', 'Printer laser warna untuk kebutuhan pencetakan dokumen berwarna.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(84, 9, 'Printer Multifunction', 'Perangkat multifungsi untuk mencetak, memindai, dan menyalin dokumen.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(85, 9, 'Printer Thermal', 'Printer thermal untuk kebutuhan pencetakan label, bukti transaksi, atau kebutuhan khusus lainnya.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(86, 9, 'Scanner Dokumen', 'Scanner untuk melakukan digitalisasi dokumen administrasi dan akademik.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(87, 9, 'Scanner Barcode', 'Scanner barcode untuk membaca kode pada dokumen, inventaris, atau kebutuhan administrasi.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(88, 9, 'Printer Dot Matrix', 'Printer dot matrix untuk kebutuhan pencetakan formulir atau dokumen tertentu.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(89, 9, 'Plotter', 'Printer format besar untuk kebutuhan gambar teknik, poster, dan dokumen berukuran besar.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(90, 9, 'Printer Kartu', 'Printer khusus untuk mencetak kartu identitas atau kartu dengan media PVC.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(91, 10, 'Projector', 'Proyektor untuk kebutuhan presentasi, pembelajaran, rapat, dan kegiatan institut.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(92, 10, 'Projector Portable', 'Proyektor berukuran ringkas untuk kebutuhan presentasi yang berpindah-pindah.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(93, 10, 'Webcam', 'Kamera webcam untuk video conference, pembelajaran daring, dan rapat online.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:43', NULL),
(94, 10, 'Speaker Aktif', 'Speaker aktif untuk kebutuhan audio ruang kelas, rapat, dan presentasi.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:43', NULL),
(95, 10, 'Soundbar', 'Perangkat audio untuk kebutuhan multimedia dan konferensi.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:43', NULL),
(96, 10, 'Microphone Wireless', 'Mikrofon nirkabel untuk presentasi, seminar, rapat, dan kegiatan institut.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(97, 10, 'HDMI Splitter', 'Perangkat untuk membagi satu sumber HDMI ke beberapa perangkat display.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(98, 10, 'HDMI Cable', 'Kabel HDMI untuk menghubungkan komputer, laptop, projector, monitor, atau display.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(99, 10, 'Wireless Presenter', 'Perangkat remote untuk mengendalikan presentasi secara nirkabel.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:43', NULL),
(100, 10, 'Video Conference Camera', 'Kamera untuk kebutuhan video conference pada ruang rapat atau ruang kelas.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:43', NULL),
(101, 11, 'Keyboard USB', 'Keyboard USB untuk komputer desktop dan workstation.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(102, 11, 'Mouse USB', 'Mouse USB untuk komputer desktop dan workstation.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(103, 11, 'Keyboard Wireless', 'Keyboard nirkabel untuk komputer dan workstation.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(104, 11, 'Mouse Wireless', 'Mouse nirkabel untuk komputer dan laptop.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(105, 11, 'Headset', 'Headset untuk komunikasi, video conference, pembelajaran daring, dan kebutuhan multimedia.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(106, 11, 'USB Hub', 'USB hub untuk menambah jumlah port USB pada komputer atau laptop.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:43', NULL),
(107, 11, 'USB Flashdisk', 'Media penyimpanan portabel USB untuk kebutuhan pemindahan dan penyimpanan data.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:43', NULL),
(108, 11, 'External HDD', 'Media penyimpanan eksternal untuk backup dan pemindahan data.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(109, 11, 'External SSD', 'Media penyimpanan eksternal berkecepatan tinggi untuk backup dan pemindahan data.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(110, 11, 'USB to HDMI Adapter', 'Adapter untuk menghubungkan komputer atau laptop dengan perangkat display melalui USB.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:43', NULL),
(111, 12, 'Server Rackmount', 'Server rackmount untuk kebutuhan layanan aplikasi, database, file server, atau layanan infrastruktur.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:43', NULL),
(112, 12, 'NAS Storage', 'Network Attached Storage untuk penyimpanan dan berbagi data melalui jaringan.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(113, 12, 'Hard Disk Server', 'Media penyimpanan khusus untuk kebutuhan server dan storage.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(114, 12, 'SSD Server', 'Media penyimpanan SSD untuk server dan sistem penyimpanan data.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:43', NULL),
(115, 12, 'Server RAM', 'Modul memori khusus server untuk penggantian atau peningkatan kapasitas memori.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:43', NULL),
(116, 12, 'Server Power Supply', 'Power supply pengganti untuk server.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(117, 12, 'KVM Switch', 'Perangkat untuk mengendalikan beberapa server menggunakan satu keyboard, monitor, dan mouse.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(118, 12, 'Server Rack 24U', 'Rack server untuk pemasangan server, switch, patch panel, UPS, dan perangkat infrastruktur lainnya.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:43', NULL),
(119, 12, 'Patch Panel 24 Port', 'Panel terminasi kabel jaringan untuk pengelolaan koneksi jaringan dalam rack.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(120, 12, 'PDU Rack', 'Power Distribution Unit untuk distribusi daya pada perangkat yang terpasang di rack server.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(121, 13, 'IP Camera Indoor', 'Kamera CCTV berbasis IP untuk pemantauan area dalam gedung.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(122, 13, 'IP Camera Outdoor', 'Kamera CCTV berbasis IP untuk pemantauan area luar gedung.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(123, 13, 'NVR 8 Channel', 'Network Video Recorder untuk merekam dan mengelola kamera CCTV IP hingga 8 channel.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(124, 13, 'NVR 16 Channel', 'Network Video Recorder untuk merekam dan mengelola kamera CCTV IP hingga 16 channel.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(125, 13, 'Hard Disk CCTV 1TB', 'Media penyimpanan untuk kebutuhan perekaman sistem CCTV.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(126, 13, 'Hard Disk CCTV 2TB', 'Media penyimpanan berkapasitas 2TB untuk sistem perekaman CCTV.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(127, 13, 'PoE Switch CCTV', 'Switch PoE untuk koneksi dan suplai daya kamera CCTV berbasis IP.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(128, 13, 'Monitor CCTV', 'Monitor khusus untuk menampilkan tampilan kamera dan sistem monitoring CCTV.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(129, 13, 'UPS CCTV', 'UPS untuk menjaga sistem CCTV tetap mendapatkan daya ketika terjadi gangguan listrik.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:43', NULL),
(130, 13, 'Kabel UTP Cat6 Outdoor', 'Kabel jaringan Cat6 untuk instalasi kamera IP dan jaringan pada area luar gedung.', 1, '2026-09-19 21:51:40', '2026-09-28 15:19:42', NULL),
(164, 9, 'Catridge Printer', 'Parts catridge printer', 1, '2026-09-22 01:40:25', '2026-09-28 15:19:42', NULL),
(165, 6, 'SSD SATA 2.5', 'SSD SATA Laptop/Komputer ukuran 2,5', 1, '2026-09-22 01:45:49', '2026-09-28 15:19:43', NULL),
(256, 1, 'TEST - HDD SATA 2.5 Inch', 'Barang sementara untuk pengujian integrasi Master Barang ke Pengajuan Barang.', 1, '2026-09-28 15:21:11', '2026-09-28 15:21:11', NULL);

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
(1, 'Komponen Komputer & Laptop', 'Komponen pengganti dan perangkat pendukung untuk perawatan, perbaikan, dan upgrade komputer serta laptop.', 1, '2026-09-19 21:24:47', '2026-09-28 14:56:36', NULL),
(2, 'Perangkat & Aksesori Jaringan', 'Perangkat, komponen, dan aksesori untuk instalasi, pemeliharaan, dan troubleshooting jaringan komputer.', 1, '2026-09-19 21:24:47', '2026-09-22 01:46:03', NULL),
(3, 'Perangkat & Suku Cadang Printer', 'Perangkat, komponen, dan bahan habis pakai untuk perawatan serta perbaikan printer.', 1, '2026-09-19 21:24:47', '2026-09-22 01:46:03', NULL),
(4, 'Peralatan Pendukung Infrastruktur IT', 'Peralatan dan material untuk mendukung infrastruktur teknologi informasi, ruang server, jaringan, dan fasilitas IT kampus.', 1, '2026-09-19 21:24:47', '2026-09-22 01:46:03', NULL),
(5, 'Tools & Peralatan Teknisi', 'Peralatan kerja yang digunakan teknisi untuk instalasi, perawatan, perbaikan, dan troubleshooting perangkat IT.', 1, '2026-09-19 21:24:47', '2026-09-22 01:46:03', NULL),
(6, 'Komputer & Laptop', 'Perangkat komputer, laptop, workstation, dan perangkat komputasi untuk kebutuhan operasional institut.', 1, '2026-09-19 21:51:40', '2026-09-19 21:51:40', NULL),
(7, 'Monitor & Display', 'Perangkat monitor dan display untuk kebutuhan komputer, ruang kerja, laboratorium, dan fasilitas institut.', 1, '2026-09-19 21:51:40', '2026-09-22 01:46:03', NULL),
(8, 'Perangkat Jaringan', 'Perangkat jaringan untuk membangun, mengembangkan, dan memelihara infrastruktur jaringan institut.', 1, '2026-09-19 21:51:40', '2026-09-22 01:46:03', NULL),
(9, 'Printer & Scanner', 'Perangkat pencetak, pemindai, dan perangkat pendukung untuk kebutuhan administrasi dan akademik.', 1, '2026-09-19 21:51:40', '2026-09-22 01:46:03', NULL),
(10, 'Perangkat Presentasi & Multimedia', 'Perangkat presentasi, audio, video, dan multimedia untuk kegiatan pembelajaran, rapat, dan kegiatan institut.', 1, '2026-09-19 21:51:40', '2026-09-22 01:46:03', NULL),
(11, 'Aksesori & Periferal Komputer', 'Perangkat pendukung komputer seperti keyboard, mouse, webcam, headset, adapter, dan aksesori lainnya.', 1, '2026-09-19 21:51:40', '2026-09-22 01:46:03', NULL),
(12, 'Server & Data Center', 'Perangkat dan komponen untuk kebutuhan server, penyimpanan data, dan infrastruktur data center.', 1, '2026-09-19 21:51:40', '2026-09-22 01:46:03', NULL),
(13, 'CCTV & Keamanan IT', 'Perangkat pemantauan CCTV dan perangkat pendukung keamanan infrastruktur teknologi informasi.', 1, '2026-09-19 21:51:40', '2026-09-22 01:46:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_ruangan`
--

CREATE TABLE `master_ruangan` (
  `id` int NOT NULL,
  `nama_ruangan` varchar(100) NOT NULL,
  `nama_gedung` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `master_ruangan`
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
(2, '2026_04_22_121933_create_permission_tables', 1),
(3, '0001_01_01_000001_create_cache_table', 2),
(4, '0001_01_01_000000_create_users_table', 3),
(6, '2026_08_22_143652_create_notifications_table', 4),
(7, '2026_08_22_160750_create_jobs_table', 5),
(53, '2026_09_01_020816_add_dashboard_indexes_to_log_perbaikan_table', 6),
(104, '2026_09_02_125939_create_failed_jobs_table', 7),
(155, '2026_09_18_182019_create_master_kategori_barang_table', 8),
(156, '2026_09_18_182020_create_master_barang_table', 8),
(157, '2026_09_18_182021_add_barang_fields_to_pengajuan_barang_table', 8);

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

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('00168a38-c527-4f16-81a3-3d8037a6ea17', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"dd\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"dd\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":53,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:45', '2026-09-07 12:10:45'),
('015545ff-e1c0-4f99-bcdd-dfbb8aa94af9', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"Printer Baru\",\"jumlah\":1}}', NULL, '2026-09-03 02:27:48', '2026-09-03 02:27:48'),
('01b87349-7434-4bc5-a754-44a27e6e6b64', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"dd\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"dd\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":53,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('03510d66-861e-4acc-b0aa-9d467b47870d', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 4, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-17092026-0001 Diperbarui\",\"message\":\"Status TK-17092026-0001 berubah dari In Progress menjadi Close.\",\"kode\":\"TK-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/52\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"52\",\"data\":{\"old_status\":\"In Progress\",\"new_status\":\"Close\",\"message\":\"Status TK-17092026-0001 berubah dari In Progress menjadi Close.\",\"log_id\":72,\"module\":\"perbaikan\"}}', NULL, '2026-09-17 01:28:16', '2026-09-17 01:28:16'),
('03a18dfe-9923-4c32-951a-c30d4dc13270', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"Printer Baru\",\"jumlah\":1}}', NULL, '2026-09-03 02:27:48', '2026-09-03 02:27:48'),
('0627d73a-dcdf-4947-ad39-ca89971d1018', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":59,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:11:18', '2026-09-07 12:11:18'),
('0c44f2a6-9bfc-4a4c-b2c3-cc33e09f21b9', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-29092026-0004 baru telah dibuat.\",\"kode\":\"PJB-29092026-0004\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/162\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"162\",\"data\":{\"message\":\"Pengajuan PJB-29092026-0004 baru telah dibuat.\",\"user_id\":8,\"user_name\":\"Faizal Kurniawan\",\"nama_barang\":\"Hard Disk CCTV 2TB\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:43:00', '2026-09-30 18:43:00'),
('0cd179e9-a197-4164-a572-fbdc747acd0d', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0002\",\"message\":\"d\",\"kode\":\"PJB-07092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":62,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:21:18', '2026-09-07 12:21:18'),
('0ce80a9b-34fe-475e-9a74-ae59afc7357a', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-28092026-0001 baru telah dibuat.\",\"kode\":\"PJB-28092026-0001\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/pengajuan-barang\\/158\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"158\",\"data\":{\"message\":\"Pengajuan PJB-28092026-0001 baru telah dibuat.\",\"user_id\":8,\"user_name\":\"Faizal Kurniawan\",\"nama_barang\":\"SSD SATA 2.5 Inch\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:42:59', '2026-09-30 18:42:59'),
('0d0de080-c1b5-4383-a8b6-9f0f2c11d325', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-17092026-0001\",\"message\":\"fefe\",\"kode\":\"TK-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/52\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"52\",\"data\":{\"message\":\"fefe\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":68,\"module\":\"perbaikan\"}}', NULL, '2026-09-17 01:27:25', '2026-09-17 01:27:25'),
('10c2dd18-04fa-4009-8c7c-6cb98c186a21', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":55,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('11147186-ade4-4830-a405-49e16b523297', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 4, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-14082026-0001\",\"message\":\"Teknisi Edi Purwanto, S.Kom mengambil tiket ini.\",\"kode\":\"TK-14082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/12\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"12\",\"data\":{\"message\":\"Teknisi Edi Purwanto, S.Kom mengambil tiket ini.\",\"sender_id\":3,\"sender_name\":\"Edi Purwanto, S.Kom\",\"log_id\":65,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 13:31:51', '2026-09-07 13:31:51'),
('11bfd92e-7c40-461e-88ca-3b63e1b897e8', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-29092026-0002 baru telah dibuat.\",\"kode\":\"PJB-29092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/160\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"160\",\"data\":{\"message\":\"Pengajuan PJB-29092026-0002 baru telah dibuat.\",\"user_id\":8,\"user_name\":\"Faizal Kurniawan\",\"nama_barang\":\"SSD NVMe M.2\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:42:59', '2026-09-30 18:42:59'),
('11dad54a-9a7f-4f65-afb7-ada6dca38cbe', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.updated\",\"title\":\"Data PJB-28092026-0001 Diperbarui\",\"message\":\"Barang pada PJB-28092026-0001 diperbarui.\",\"kode\":\"PJB-28092026-0001\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/pengajuan-barang\\/158\",\"icon\":\"heroicon-o-pencil-square\",\"color\":\"warning\",\"reference_id\":\"158\",\"data\":{\"field\":\"barang_id\",\"field_label\":\"Barang\",\"old_value\":\"SSD SATA 2.5 Inch\",\"new_value\":\"TEST - HDD SATA 2.5 Inch\",\"message\":\"Barang pada PJB-28092026-0001 diperbarui.\",\"log_id\":118,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:42:59', '2026-09-30 18:42:59'),
('121dfe3a-a93d-45e9-8d66-59d1e501bc2d', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-17092026-0001\",\"message\":\"ffff\",\"kode\":\"PJB-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/106\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"106\",\"data\":{\"message\":\"ffff\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":67,\"module\":\"pengajuan\"}}', NULL, '2026-09-17 01:26:06', '2026-09-17 01:26:06'),
('16177c3f-9fd8-4c08-9aa6-173fc3831e22', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":59,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:11:18', '2026-09-07 12:11:18'),
('1dc53876-a670-4989-a6c9-10a468f95a25', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-21072026-0001 Diperbarui\",\"message\":\"Status TK-21072026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-21072026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/11\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"11\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-21072026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":62,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 13:31:50', '2026-09-07 13:31:50'),
('1e42d84f-d0cf-4b6f-bc19-05c5af32770f', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-28092026-0001 baru telah dibuat.\",\"kode\":\"PJB-28092026-0001\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/pengajuan-barang\\/157\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"157\",\"data\":{\"message\":\"Pengajuan PJB-28092026-0001 baru telah dibuat.\",\"user_id\":8,\"user_name\":\"Faizal Kurniawan\",\"nama_barang\":\"SSD SATA 2.5 Inch\",\"jumlah\":2,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:42:59', '2026-09-30 18:42:59'),
('1fdb7cbc-fd71-4eb3-a5e5-d96b1e5d1c9f', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.status\",\"title\":\"Status PJB-28092026-0001 Diperbarui\",\"message\":\"Status PJB-28092026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"PJB-28092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/157\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"157\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status PJB-28092026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":228,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:43:00', '2026-09-30 18:43:00'),
('20188570-ac25-4c90-825c-fbf5d7ab148c', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":55,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('208c431d-da83-4ca6-946c-4e7c21096bab', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.updated\",\"title\":\"Data PJB-29092026-0004 Diperbarui\",\"message\":\"Barang pada PJB-29092026-0004 diperbarui.\",\"kode\":\"PJB-29092026-0004\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/162\",\"icon\":\"heroicon-o-pencil-square\",\"color\":\"warning\",\"reference_id\":\"162\",\"data\":{\"field\":\"barang_id\",\"field_label\":\"Barang\",\"old_value\":\"Hard Disk CCTV 2TB\",\"new_value\":\"Hard Disk CCTV 1TB\",\"message\":\"Barang pada PJB-29092026-0004 diperbarui.\",\"log_id\":178,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:43:00', '2026-09-30 18:43:00'),
('20b50291-d01e-487a-a4dc-c61b3061c13e', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":60,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:15:16', '2026-09-07 12:15:16'),
('219d11d5-3675-4171-8f0f-f48b804c01f4', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 5, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"Teknisi Edi Purwanto, S.Kom mengambil tiket ini.\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"Teknisi Edi Purwanto, S.Kom mengambil tiket ini.\",\"sender_id\":3,\"sender_name\":\"Edi Purwanto, S.Kom\",\"log_id\":65,\"module\":\"pengajuan\"}}', NULL, '2026-09-17 01:12:27', '2026-09-17 01:12:27'),
('253d3514-4188-484f-91c7-8affabb1c814', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"dd\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"dd\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":53,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('266050fb-ec1b-485b-90de-94885d117ff9', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"dd\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"dd\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":53,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('27c11449-74c4-4968-9eb2-4d8bb9cce4c0', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"test\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"test\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":52,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:45', '2026-09-07 12:10:45'),
('2a1a5df1-c441-45e4-adff-bf839a1271ed', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-14082026-0001 Diperbarui\",\"message\":\"Status TK-14082026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-14082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/12\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"12\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-14082026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":64,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 13:31:51', '2026-09-07 13:31:51'),
('2a626c6b-9c49-4705-b7b7-8d517f5559f7', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-03092026-0001\",\"message\":\"fasfa\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"fasfa\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":54}}', NULL, '2026-09-03 02:28:04', '2026-09-03 02:28:04'),
('2b0262ee-381c-4c43-8bb0-6caddcd878a0', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-29092026-0002 baru telah dibuat.\",\"kode\":\"PJB-29092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/160\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"160\",\"data\":{\"message\":\"Pengajuan PJB-29092026-0002 baru telah dibuat.\",\"user_id\":8,\"user_name\":\"Faizal Kurniawan\",\"nama_barang\":\"SSD NVMe M.2\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:42:59', '2026-09-30 18:42:59'),
('2ca5ff3d-8364-4a66-8b0f-d106bf06d223', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-29092026-0003 baru telah dibuat.\",\"kode\":\"PJB-29092026-0003\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/161\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"161\",\"data\":{\"message\":\"Pengajuan PJB-29092026-0003 baru telah dibuat.\",\"user_id\":8,\"user_name\":\"Faizal Kurniawan\",\"nama_barang\":\"Hard Disk CCTV 2TB\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:43:00', '2026-09-30 18:43:00'),
('2ce3b1bf-5b4e-4f0f-83f4-aff84680eed3', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":55,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('2ee1a882-6553-4d6b-85a9-4b388e726f49', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"test\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('30177834-b7f2-4dab-a867-dbcf5d9700ba', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 5, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":7,\"sender_name\":\"AdminSuper\",\"log_id\":57,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('3081fa05-21f1-4b3f-84df-abbdb4bd154c', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/54\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"54\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"rwar\",\"jumlah\":1}}', NULL, '2026-09-03 02:46:10', '2026-09-03 02:46:10'),
('3104885f-b015-4478-aa0b-92afe47fb7f7', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"kode\":\"PJB-07092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"tes\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:16:16', '2026-09-07 12:16:16'),
('320b2d56-7370-4866-a10f-47b6c1c13183', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.created\",\"title\":\"Tiket Perbaikan Baru\",\"message\":\"Tiket TK-17092026-0001 baru telah dibuat.\",\"kode\":\"TK-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/52\",\"icon\":\"heroicon-o-wrench-screwdriver\",\"color\":\"info\",\"reference_id\":\"52\",\"data\":{\"message\":\"Tiket TK-17092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"ruangan\":\"Kaprodi\",\"keluhan\":\"laptop rusak\",\"module\":\"perbaikan\"}}', NULL, '2026-09-17 01:27:00', '2026-09-17 01:27:00'),
('320ea596-3037-4f24-84ea-d68f4539bd6f', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"kode\":\"PJB-07092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"tes\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:16:16', '2026-09-07 12:16:16'),
('32bc9ad1-5b16-43f7-9296-ed804d960333', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":59,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:11:17', '2026-09-07 12:11:17'),
('3431cd19-08c8-4a7b-9d46-4d3a9dda32bf', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-14082026-0001 Diperbarui\",\"message\":\"Status TK-14082026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-14082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/12\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"12\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-14082026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":64,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 13:31:51', '2026-09-07 13:31:51'),
('34e59ac8-473b-44cd-9cb0-62c301d3acf7', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.status\",\"title\":\"Status PJB-29092026-0002 Diperbarui\",\"message\":\"Status PJB-29092026-0002 berubah dari Open menjadi In Progress.\",\"kode\":\"PJB-29092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/160\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"160\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status PJB-29092026-0002 berubah dari Open menjadi In Progress.\",\"log_id\":230,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:44:07', '2026-09-30 18:44:07'),
('36a79974-6520-4b5f-a719-a7c1c9cfc45b', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":55,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('36dd5974-1b1c-482e-8bfc-9939302d583f', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-17092026-0001 baru telah dibuat.\",\"kode\":\"PJB-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/106\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"106\",\"data\":{\"message\":\"Pengajuan PJB-17092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"gggg\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-17 01:26:00', '2026-09-17 01:26:00'),
('38bae144-1747-40e5-944d-638ee5d38f18', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/54\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"54\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"rwar\",\"jumlah\":1}}', NULL, '2026-09-03 02:46:10', '2026-09-03 02:46:10'),
('3ba7001b-054c-454f-8af1-dc9e5ef8cf45', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-17092026-0001\",\"message\":\"fefe\",\"kode\":\"TK-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/52\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"52\",\"data\":{\"message\":\"fefe\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":68,\"module\":\"perbaikan\"}}', NULL, '2026-09-17 01:27:25', '2026-09-17 01:27:25'),
('3c60ad5d-64ae-4c06-ab2a-8b8b483a466f', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-17092026-0001\",\"message\":\"ffff\",\"kode\":\"PJB-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/106\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"106\",\"data\":{\"message\":\"ffff\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":67,\"module\":\"pengajuan\"}}', NULL, '2026-09-17 01:26:06', '2026-09-17 01:26:06'),
('3d98e03a-1a50-4bf0-a4c3-f79ab51f48fc', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":59,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:11:17', '2026-09-07 12:11:17'),
('3f8bd08f-2dd6-465b-a726-895ad47b7b76', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-17092026-0001 Diperbarui\",\"message\":\"Status TK-17092026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/52\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"52\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-17092026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":71,\"module\":\"perbaikan\"}}', NULL, '2026-09-17 01:27:52', '2026-09-17 01:27:52'),
('40be4ae5-2a2c-4e7a-919f-21e525805f7e', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-29092026-0001 baru telah dibuat.\",\"kode\":\"PJB-29092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/159\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"159\",\"data\":{\"message\":\"Pengajuan PJB-29092026-0001 baru telah dibuat.\",\"user_id\":3,\"user_name\":\"Edi Purwanto, S.Kom\",\"nama_barang\":\"Switch 24 Port Gigabit\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:42:59', '2026-09-30 18:42:59'),
('42092bc5-207b-4e17-9c37-af2731b6b030', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"Printer Baru\",\"jumlah\":1}}', NULL, '2026-09-03 02:27:48', '2026-09-03 02:27:48'),
('428bec78-362c-4fd9-8556-b481ac5e067f', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"test\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('4383fabc-121b-45da-8cc8-96b967f2b918', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":58,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('44dcbaf4-fef2-4a1e-9916-5712df36766d', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":58,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('4619946d-8ed7-4018-972e-7fdcc7e5a44d', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-21072026-0001 Diperbarui\",\"message\":\"Status TK-21072026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-21072026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/11\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"11\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-21072026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":62,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 13:31:50', '2026-09-07 13:31:50'),
('469c9dec-bb7d-4182-9b22-68344f385224', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-29092026-0003 baru telah dibuat.\",\"kode\":\"PJB-29092026-0003\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/161\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"161\",\"data\":{\"message\":\"Pengajuan PJB-29092026-0003 baru telah dibuat.\",\"user_id\":8,\"user_name\":\"Faizal Kurniawan\",\"nama_barang\":\"Hard Disk CCTV 2TB\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:42:59', '2026-09-30 18:42:59'),
('4834603f-eac2-4dca-8127-5adfa7716e1d', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.updated\",\"title\":\"Data PJB-29092026-0004 Diperbarui\",\"message\":\"Barang pada PJB-29092026-0004 diperbarui.\",\"kode\":\"PJB-29092026-0004\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/162\",\"icon\":\"heroicon-o-pencil-square\",\"color\":\"warning\",\"reference_id\":\"162\",\"data\":{\"field\":\"barang_id\",\"field_label\":\"Barang\",\"old_value\":\"Hard Disk CCTV 2TB\",\"new_value\":\"Hard Disk CCTV 1TB\",\"message\":\"Barang pada PJB-29092026-0004 diperbarui.\",\"log_id\":178,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:43:00', '2026-09-30 18:43:00'),
('48deca5a-b916-48a8-bc25-4a96a28fbfae', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 8, '{\"type\":\"pengajuan.updated\",\"title\":\"Data PJB-28092026-0001 Diperbarui\",\"message\":\"Barang pada PJB-28092026-0001 diperbarui.\",\"kode\":\"PJB-28092026-0001\",\"url\":\"http:\\/\\/localhost:8000\\/pemohon\\/pengajuan-barang\\/158\",\"icon\":\"heroicon-o-pencil-square\",\"color\":\"warning\",\"reference_id\":\"158\",\"data\":{\"field\":\"barang_id\",\"field_label\":\"Barang\",\"old_value\":\"SSD SATA 2.5 Inch\",\"new_value\":\"TEST - HDD SATA 2.5 Inch\",\"message\":\"Barang pada PJB-28092026-0001 diperbarui.\",\"log_id\":118,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:42:59', '2026-09-30 18:42:59'),
('4b394ae4-8d8a-40de-843d-25f859fa4bf0', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"Printer Baru\",\"jumlah\":1}}', NULL, '2026-09-03 02:27:48', '2026-09-03 02:27:48'),
('4d05eb7e-7d77-417f-a155-ddfec9c8f0e5', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-17092026-0001 baru telah dibuat.\",\"kode\":\"PJB-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/106\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"106\",\"data\":{\"message\":\"Pengajuan PJB-17092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"gggg\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-17 01:26:00', '2026-09-17 01:26:00'),
('4fed706a-c104-4d33-becc-9c5dd4cbf231', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 4, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-17092026-0001 Diperbarui\",\"message\":\"Status TK-17092026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/52\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"52\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-17092026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":71,\"module\":\"perbaikan\"}}', NULL, '2026-09-17 01:27:52', '2026-09-17 01:27:52'),
('50b42674-eb82-43fb-b740-555da2335174', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":58,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('514866e8-c972-47e8-b557-f7ddc143ef78', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 5, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":7,\"sender_name\":\"AdminSuper\",\"log_id\":57,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('54c507d4-11d6-4a2b-af2d-65e16a3bc879', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-29092026-0002 baru telah dibuat.\",\"kode\":\"PJB-29092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/160\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"160\",\"data\":{\"message\":\"Pengajuan PJB-29092026-0002 baru telah dibuat.\",\"user_id\":8,\"user_name\":\"Faizal Kurniawan\",\"nama_barang\":\"SSD NVMe M.2\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:42:59', '2026-09-30 18:42:59'),
('5608e685-4318-4d55-bdc5-3a92c34968dc', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":60,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:15:16', '2026-09-07 12:15:16'),
('58259cc9-4499-4443-b328-5e5fb887370b', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"dd\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"dd\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":53,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('59c6ec1b-99dd-4419-9196-23a7a89a01d1', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-17092026-0001 baru telah dibuat.\",\"kode\":\"PJB-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/106\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"106\",\"data\":{\"message\":\"Pengajuan PJB-17092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"gggg\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-17 01:26:00', '2026-09-17 01:26:00'),
('5d1d3930-afcb-49ac-9394-60a5739e5fc0', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.status\",\"title\":\"Status PJB-28092026-0001 Diperbarui\",\"message\":\"Status PJB-28092026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"PJB-28092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/157\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"157\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status PJB-28092026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":228,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:43:00', '2026-09-30 18:43:00'),
('5dd9e2a6-4b00-46dc-8eb0-0713c2396587', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"test\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:10:47', '2026-09-07 12:10:47'),
('608d67cf-b5e0-4d35-aee1-2a2628ece05e', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"kode\":\"PJB-07092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"tes\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:16:16', '2026-09-07 12:16:16'),
('61c0d20a-d80f-485c-8582-0d4c010e924d', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":58,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('61eef1aa-47c7-4284-828d-c87f0a53c49b', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-03092026-0001\",\"message\":\"fasfa\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"fasfa\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":54}}', NULL, '2026-09-03 02:28:04', '2026-09-03 02:28:04'),
('6481a661-9e84-4a61-a602-17ce15f33a6f', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-03092026-0001\",\"message\":\"fasfa\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"fasfa\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":54}}', NULL, '2026-09-03 02:28:04', '2026-09-03 02:28:04'),
('65cc8b33-cd34-4ccc-80d4-64a2fcd2aa25', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.created\",\"title\":\"Tiket Perbaikan Baru\",\"message\":\"Tiket TK-17092026-0001 baru telah dibuat.\",\"kode\":\"TK-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/52\",\"icon\":\"heroicon-o-wrench-screwdriver\",\"color\":\"info\",\"reference_id\":\"52\",\"data\":{\"message\":\"Tiket TK-17092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"ruangan\":\"Kaprodi\",\"keluhan\":\"laptop rusak\",\"module\":\"perbaikan\"}}', NULL, '2026-09-17 01:27:00', '2026-09-17 01:27:00'),
('65f9295e-2895-40ed-bc30-53bb54398ae4', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"dd\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"dd\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":53,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:45', '2026-09-07 12:10:45'),
('67d20066-482b-46cb-9f12-30e96784f776', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-28092026-0001 baru telah dibuat.\",\"kode\":\"PJB-28092026-0001\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/pengajuan-barang\\/158\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"158\",\"data\":{\"message\":\"Pengajuan PJB-28092026-0001 baru telah dibuat.\",\"user_id\":8,\"user_name\":\"Faizal Kurniawan\",\"nama_barang\":\"SSD SATA 2.5 Inch\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:42:59', '2026-09-30 18:42:59'),
('685a07ac-b0f5-4f19-a490-d1a84214a5d9', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-29092026-0003 baru telah dibuat.\",\"kode\":\"PJB-29092026-0003\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/161\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"161\",\"data\":{\"message\":\"Pengajuan PJB-29092026-0003 baru telah dibuat.\",\"user_id\":8,\"user_name\":\"Faizal Kurniawan\",\"nama_barang\":\"Hard Disk CCTV 2TB\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:42:59', '2026-09-30 18:42:59'),
('68c81659-9cd6-4657-a995-4f3ab7825a4a', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"kode\":\"PJB-07092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"tes\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:16:16', '2026-09-07 12:16:16'),
('6afff1e8-fabe-4ff6-bab7-66f052dbbbe4', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-18082026-0001 Diperbarui\",\"message\":\"Status TK-18082026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"13\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-18082026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":59,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:24:46', '2026-09-07 12:24:46'),
('6b48ce85-60de-4b1f-8cd1-769a407cfeea', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0002\",\"message\":\"d\",\"kode\":\"PJB-07092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":62,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:21:18', '2026-09-07 12:21:18'),
('6cf648b1-d93f-4ebb-94ae-b1625e8ad7bf', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":60,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:15:16', '2026-09-07 12:15:16');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('6d193980-930a-491b-b26c-5093917b6ac8', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 4, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-17092026-0001\",\"message\":\"ffff\",\"kode\":\"PJB-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/pengajuan-barang\\/106\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"106\",\"data\":{\"message\":\"ffff\",\"sender_id\":3,\"sender_name\":\"Edi Purwanto, S.Kom\",\"log_id\":68,\"module\":\"pengajuan\"}}', NULL, '2026-09-17 01:26:27', '2026-09-17 01:26:27'),
('6d314faa-3985-4bc5-a057-3961a3e03b74', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.updated\",\"title\":\"Data PJB-28092026-0001 Diperbarui\",\"message\":\"Barang pada PJB-28092026-0001 diperbarui.\",\"kode\":\"PJB-28092026-0001\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/pengajuan-barang\\/158\",\"icon\":\"heroicon-o-pencil-square\",\"color\":\"warning\",\"reference_id\":\"158\",\"data\":{\"field\":\"barang_id\",\"field_label\":\"Barang\",\"old_value\":\"SSD SATA 2.5 Inch\",\"new_value\":\"TEST - HDD SATA 2.5 Inch\",\"message\":\"Barang pada PJB-28092026-0001 diperbarui.\",\"log_id\":118,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:42:59', '2026-09-30 18:42:59'),
('6d830a39-7adb-463c-bc36-3ff1143a53e8', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/54\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"54\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"rwar\",\"jumlah\":1}}', NULL, '2026-09-03 02:46:10', '2026-09-03 02:46:10'),
('6df6d2de-48ee-444a-9c7a-8c43d7b3cdb5', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-28092026-0001 baru telah dibuat.\",\"kode\":\"PJB-28092026-0001\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/pengajuan-barang\\/158\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"158\",\"data\":{\"message\":\"Pengajuan PJB-28092026-0001 baru telah dibuat.\",\"user_id\":8,\"user_name\":\"Faizal Kurniawan\",\"nama_barang\":\"SSD SATA 2.5 Inch\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:42:59', '2026-09-30 18:42:59'),
('6f70d4a4-0b3e-4036-9888-359648ef4919', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"test\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('712650bf-29bf-490b-9a85-1e052c0d573b', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":59,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:11:18', '2026-09-07 12:11:18'),
('7663fbf2-1864-4860-b419-b2535ba9456d', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"Printer Baru\",\"jumlah\":1}}', NULL, '2026-09-03 02:27:48', '2026-09-03 02:27:48'),
('7b3279dc-c693-484b-99c1-dcbfae0de0b1', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-17092026-0001 Diperbarui\",\"message\":\"Status TK-17092026-0001 berubah dari In Progress menjadi Close.\",\"kode\":\"TK-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/52\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"52\",\"data\":{\"old_status\":\"In Progress\",\"new_status\":\"Close\",\"message\":\"Status TK-17092026-0001 berubah dari In Progress menjadi Close.\",\"log_id\":72,\"module\":\"perbaikan\"}}', NULL, '2026-09-17 01:28:17', '2026-09-17 01:28:17'),
('7d4af52e-5ceb-42db-944e-efa6f3aab13a', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-17092026-0001\",\"message\":\"ffff\",\"kode\":\"PJB-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/106\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"106\",\"data\":{\"message\":\"ffff\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":67,\"module\":\"pengajuan\"}}', NULL, '2026-09-17 01:26:06', '2026-09-17 01:26:06'),
('7d6be7ec-260c-43a9-bdb1-305fc143c592', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":59,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:11:18', '2026-09-07 12:11:18'),
('7dba2393-58ff-4148-99b9-cc4dc3903991', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-17092026-0001\",\"message\":\"fegeg\",\"kode\":\"TK-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/52\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"52\",\"data\":{\"message\":\"fegeg\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":67,\"module\":\"perbaikan\"}}', NULL, '2026-09-17 01:27:16', '2026-09-17 01:27:16'),
('7f0748a8-4c14-4bda-bba8-d5e53d96a599', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.updated\",\"title\":\"Data PJB-28092026-0001 Diperbarui\",\"message\":\"Barang pada PJB-28092026-0001 diperbarui.\",\"kode\":\"PJB-28092026-0001\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/pengajuan-barang\\/158\",\"icon\":\"heroicon-o-pencil-square\",\"color\":\"warning\",\"reference_id\":\"158\",\"data\":{\"field\":\"barang_id\",\"field_label\":\"Barang\",\"old_value\":\"SSD SATA 2.5 Inch\",\"new_value\":\"TEST - HDD SATA 2.5 Inch\",\"message\":\"Barang pada PJB-28092026-0001 diperbarui.\",\"log_id\":118,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:42:59', '2026-09-30 18:42:59'),
('7f7a3c88-ec5e-4411-b159-13e59708cee0', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"test\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"test\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":52,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:45', '2026-09-07 12:10:45'),
('812feb8c-d9c8-4058-8e48-c8b9ed98d0f8', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-29092026-0003 baru telah dibuat.\",\"kode\":\"PJB-29092026-0003\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/161\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"161\",\"data\":{\"message\":\"Pengajuan PJB-29092026-0003 baru telah dibuat.\",\"user_id\":8,\"user_name\":\"Faizal Kurniawan\",\"nama_barang\":\"Hard Disk CCTV 2TB\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:42:59', '2026-09-30 18:42:59'),
('81318e44-8119-45e3-bee4-1fec0d7c21b2', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-03092026-0001\",\"message\":\"fasfa\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"fasfa\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":54}}', NULL, '2026-09-03 02:28:04', '2026-09-03 02:28:04'),
('83774ae1-3a3a-4730-a77e-4ca64083ffdd', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"dd\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"dd\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":53,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('890a7726-f7ab-4c78-811d-abc518f4bd25', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 4, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-14082026-0001 Diperbarui\",\"message\":\"Status TK-14082026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-14082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/12\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"12\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-14082026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":64,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 13:31:50', '2026-09-07 13:31:50'),
('8a1ef1a5-d508-423c-9e73-95c8e71d52b1', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"tets\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"tets\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":60,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:25:04', '2026-09-07 12:25:04'),
('8af2278d-f872-4dcc-9b96-b7ae080da3c0', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"test\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"test\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":52,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:45', '2026-09-07 12:10:45'),
('8bb0db12-6e9a-4c4d-a0f3-8f138f37092f', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":60,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:15:16', '2026-09-07 12:15:16'),
('8c38cdc4-9abd-4a49-bab0-bad9162ca9e0', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-03092026-0001\",\"message\":\"fasfa\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"fasfa\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":54}}', NULL, '2026-09-03 02:28:04', '2026-09-03 02:28:04'),
('8c4c0360-49f5-4121-8f38-07a7120d1def', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-17092026-0001\",\"message\":\"ffff\",\"kode\":\"PJB-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/106\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"106\",\"data\":{\"message\":\"ffff\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":67,\"module\":\"pengajuan\"}}', NULL, '2026-09-17 01:26:06', '2026-09-17 01:26:06'),
('8d06900b-7d8b-46a6-881b-2f46f64b89ea', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"test\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"test\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":52,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:45', '2026-09-07 12:10:45'),
('8df0dc48-82d9-49e7-acb1-d5ef016b167a', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":55,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('8df5469e-19f0-4fa8-9c49-1fb23cd45f48', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-18082026-0001 Diperbarui\",\"message\":\"Status TK-18082026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"13\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-18082026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":59,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:24:46', '2026-09-07 12:24:46'),
('90871190-4741-496e-898e-efad368ab9fb', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 5, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":7,\"sender_name\":\"AdminSuper\",\"log_id\":54,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('9109a07c-1bc7-40a6-b504-605a82c82fb3', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/54\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"54\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"rwar\",\"jumlah\":1}}', NULL, '2026-09-03 02:46:10', '2026-09-03 02:46:10'),
('912ce964-aed8-4948-b075-329b573b9ca1', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0002\",\"message\":\"d\",\"kode\":\"PJB-07092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":62,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:21:18', '2026-09-07 12:21:18'),
('91784ab3-2f22-42f5-ad7f-bc2d297103c8', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":60,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:15:16', '2026-09-07 12:15:16'),
('91882b26-3e96-4ac3-b384-23208944df8b', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/54\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"54\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"rwar\",\"jumlah\":1}}', NULL, '2026-09-03 02:46:10', '2026-09-03 02:46:10'),
('92cbe181-34df-427f-8a04-f1e3f86eff5c', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.status\",\"title\":\"Status PJB-29092026-0002 Diperbarui\",\"message\":\"Status PJB-29092026-0002 berubah dari Open menjadi In Progress.\",\"kode\":\"PJB-29092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/160\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"160\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status PJB-29092026-0002 berubah dari Open menjadi In Progress.\",\"log_id\":230,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:44:07', '2026-09-30 18:44:07'),
('93304f77-4f81-412f-8129-6b05dc844c32', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 5, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"de\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"de\",\"sender_id\":1,\"sender_name\":\"Fithnan\",\"log_id\":61,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:25:13', '2026-09-07 12:25:13'),
('937824ff-cfae-4831-9ba6-a531b3cc9590', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-29092026-0001 baru telah dibuat.\",\"kode\":\"PJB-29092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/159\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"159\",\"data\":{\"message\":\"Pengajuan PJB-29092026-0001 baru telah dibuat.\",\"user_id\":3,\"user_name\":\"Edi Purwanto, S.Kom\",\"nama_barang\":\"Switch 24 Port Gigabit\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:42:59', '2026-09-30 18:42:59'),
('9458d548-7aa7-44d7-824f-a5464c3feec8', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-29092026-0001 baru telah dibuat.\",\"kode\":\"PJB-29092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/159\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"159\",\"data\":{\"message\":\"Pengajuan PJB-29092026-0001 baru telah dibuat.\",\"user_id\":3,\"user_name\":\"Edi Purwanto, S.Kom\",\"nama_barang\":\"Switch 24 Port Gigabit\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:42:59', '2026-09-30 18:42:59'),
('94be616d-b954-48de-bf82-58b3d1679544', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-18082026-0001 Diperbarui\",\"message\":\"Status TK-18082026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"13\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-18082026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":59,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:24:46', '2026-09-07 12:24:46'),
('95746d54-c3e8-47f6-8a28-dda28178e2ae', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"tets\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"tets\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":60,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:25:04', '2026-09-07 12:25:04'),
('99cf5316-69fb-48a8-b0d0-a411d44b8727', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-17092026-0001\",\"message\":\"fegeg\",\"kode\":\"TK-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/52\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"52\",\"data\":{\"message\":\"fegeg\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":67,\"module\":\"perbaikan\"}}', NULL, '2026-09-17 01:27:16', '2026-09-17 01:27:16'),
('99daaade-cbec-40c9-9c6f-a32c783cf104', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-17092026-0001 baru telah dibuat.\",\"kode\":\"PJB-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/106\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"106\",\"data\":{\"message\":\"Pengajuan PJB-17092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"gggg\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-17 01:26:00', '2026-09-17 01:26:00'),
('9bf75a06-33d0-4e3a-9297-14870b5a91a4', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/54\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"54\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"rwar\",\"jumlah\":1}}', NULL, '2026-09-03 02:46:10', '2026-09-03 02:46:10'),
('9c1490bb-cfde-4c8b-acb4-6564e83f51a6', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.updated\",\"title\":\"Data PJB-29092026-0004 Diperbarui\",\"message\":\"Barang pada PJB-29092026-0004 diperbarui.\",\"kode\":\"PJB-29092026-0004\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/162\",\"icon\":\"heroicon-o-pencil-square\",\"color\":\"warning\",\"reference_id\":\"162\",\"data\":{\"field\":\"barang_id\",\"field_label\":\"Barang\",\"old_value\":\"Hard Disk CCTV 2TB\",\"new_value\":\"Hard Disk CCTV 1TB\",\"message\":\"Barang pada PJB-29092026-0004 diperbarui.\",\"log_id\":178,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:43:00', '2026-09-30 18:43:00'),
('9dca9c68-8b0c-416a-b878-2139f6327f3c', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 4, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-17092026-0001\",\"message\":\"fefe\",\"kode\":\"TK-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/52\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"52\",\"data\":{\"message\":\"fefe\",\"sender_id\":1,\"sender_name\":\"Fithnan\",\"log_id\":69,\"module\":\"perbaikan\"}}', NULL, '2026-09-17 01:27:31', '2026-09-17 01:27:31'),
('9f7a6e98-78be-490e-a735-5ae0245e8667', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":60,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:15:16', '2026-09-07 12:15:16'),
('9fedee3a-a5c2-4f9d-8841-9b5a50106e2d', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.status\",\"title\":\"Status PJB-29092026-0002 Diperbarui\",\"message\":\"Status PJB-29092026-0002 berubah dari Open menjadi In Progress.\",\"kode\":\"PJB-29092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/160\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"160\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status PJB-29092026-0002 berubah dari Open menjadi In Progress.\",\"log_id\":230,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:44:07', '2026-09-30 18:44:07'),
('a225b723-b1b2-4aa3-ab7c-251efd493b33', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 5, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":7,\"sender_name\":\"AdminSuper\",\"log_id\":56,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('a28c7f12-908d-4ff0-b5de-3af5cac5540a', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.created\",\"title\":\"Tiket Perbaikan Baru\",\"message\":\"Tiket TK-17092026-0001 baru telah dibuat.\",\"kode\":\"TK-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/52\",\"icon\":\"heroicon-o-wrench-screwdriver\",\"color\":\"info\",\"reference_id\":\"52\",\"data\":{\"message\":\"Tiket TK-17092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"ruangan\":\"Kaprodi\",\"keluhan\":\"laptop rusak\",\"module\":\"perbaikan\"}}', NULL, '2026-09-17 01:27:00', '2026-09-17 01:27:00'),
('a3dec187-e5f9-4658-bc6e-7b2eafd4f5fb', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"test\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('a70473f8-7fec-45a9-8d4a-8824bedbfdf1', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"tets\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"tets\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":60,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:25:04', '2026-09-07 12:25:04'),
('a7bca39b-59fb-4998-a378-084679fc4ba6', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":59,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:11:17', '2026-09-07 12:11:17'),
('a9f02e25-781a-4e01-9cb2-aba781ab2684', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/54\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"54\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"rwar\",\"jumlah\":1}}', NULL, '2026-09-03 02:46:10', '2026-09-03 02:46:10'),
('aad32009-0ed1-4704-ac50-9518c235aeb7', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-17092026-0001\",\"message\":\"fegeg\",\"kode\":\"TK-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/52\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"52\",\"data\":{\"message\":\"fegeg\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":67,\"module\":\"perbaikan\"}}', NULL, '2026-09-17 01:27:16', '2026-09-17 01:27:16'),
('ab2c3bfc-9aef-48a5-a5ee-61c231dfa5be', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-17092026-0001\",\"message\":\"fefe\",\"kode\":\"TK-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/52\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"52\",\"data\":{\"message\":\"fefe\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":68,\"module\":\"perbaikan\"}}', NULL, '2026-09-17 01:27:25', '2026-09-17 01:27:25'),
('ac7ab2bb-60a1-4f11-bd46-912dc4bf90b9', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.status\",\"title\":\"Status PJB-07092026-0001 Diperbarui\",\"message\":\"Status PJB-07092026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"105\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status PJB-07092026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":64,\"module\":\"pengajuan\"}}', NULL, '2026-09-17 01:12:27', '2026-09-17 01:12:27'),
('b045f043-91fe-4fa0-a9bd-9228ce20eb94', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"kode\":\"PJB-07092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"tes\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:16:16', '2026-09-07 12:16:16'),
('b2151ae2-e781-4311-961e-5e3793665383', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-17092026-0001 Diperbarui\",\"message\":\"Status TK-17092026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/52\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"52\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-17092026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":71,\"module\":\"perbaikan\"}}', NULL, '2026-09-17 01:27:52', '2026-09-17 01:27:52'),
('b332f497-b504-40ec-ad35-ab7d6f300abc', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-29092026-0004 baru telah dibuat.\",\"kode\":\"PJB-29092026-0004\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/162\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"162\",\"data\":{\"message\":\"Pengajuan PJB-29092026-0004 baru telah dibuat.\",\"user_id\":8,\"user_name\":\"Faizal Kurniawan\",\"nama_barang\":\"Hard Disk CCTV 2TB\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:43:00', '2026-09-30 18:43:00'),
('b373508b-98a8-4a93-8ddf-8db7caeb4533', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.updated\",\"title\":\"Data PJB-29092026-0004 Diperbarui\",\"message\":\"Barang pada PJB-29092026-0004 diperbarui.\",\"kode\":\"PJB-29092026-0004\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/162\",\"icon\":\"heroicon-o-pencil-square\",\"color\":\"warning\",\"reference_id\":\"162\",\"data\":{\"field\":\"barang_id\",\"field_label\":\"Barang\",\"old_value\":\"Hard Disk CCTV 2TB\",\"new_value\":\"Hard Disk CCTV 1TB\",\"message\":\"Barang pada PJB-29092026-0004 diperbarui.\",\"log_id\":178,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:43:00', '2026-09-30 18:43:00'),
('b38c003b-ffd5-4b8e-9d22-66540cd7d8f0', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-03092026-0001\",\"message\":\"fasfa\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"fasfa\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":54}}', NULL, '2026-09-03 02:28:04', '2026-09-03 02:28:04'),
('b3cd2811-1b24-48eb-9e8c-3ede0dd4921c', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":55,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('b4281dc2-5acc-42ad-8b7e-ced60ce32e09', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"test\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"test\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":52,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:45', '2026-09-07 12:10:45'),
('b6259a24-1780-4bf1-a7e2-5daf5e089434', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 5, '{\"type\":\"pengajuan.status\",\"title\":\"Status PJB-07092026-0001 Diperbarui\",\"message\":\"Status PJB-07092026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"105\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status PJB-07092026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":64,\"module\":\"pengajuan\"}}', NULL, '2026-09-17 01:12:27', '2026-09-17 01:12:27'),
('b7967cc0-2c3a-48e3-9fd5-f6571a56d2e5', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/54\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"54\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"rwar\",\"jumlah\":1}}', NULL, '2026-09-03 02:46:10', '2026-09-03 02:46:10'),
('b95339c5-ab88-4bc6-8763-d1a6fd9c0a08', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0002\",\"message\":\"d\",\"kode\":\"PJB-07092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":62,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:21:18', '2026-09-07 12:21:18'),
('bab12fcf-1527-4258-901d-660e2ed95356', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"tets\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"tets\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":60,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:25:04', '2026-09-07 12:25:04'),
('bb26a554-5176-45ea-a035-480fd73ea126', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-21072026-0001 Diperbarui\",\"message\":\"Status TK-21072026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-21072026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/11\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"11\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-21072026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":62,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 13:31:50', '2026-09-07 13:31:50'),
('bc65c16f-8822-42f7-a1f7-aa6c4f31b3a3', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"kode\":\"PJB-07092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"tes\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:16:16', '2026-09-07 12:16:16'),
('becadbdb-3cc9-46b0-ba42-80110cee2d2a', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"Printer Baru\",\"jumlah\":1}}', NULL, '2026-09-03 02:27:48', '2026-09-03 02:27:48'),
('c163ae01-b051-4109-b3a8-2cdbbed75f8d', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.status\",\"title\":\"Status PJB-07092026-0001 Diperbarui\",\"message\":\"Status PJB-07092026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"105\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status PJB-07092026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":64,\"module\":\"pengajuan\"}}', NULL, '2026-09-17 01:12:27', '2026-09-17 01:12:27'),
('c62e32d7-f4d6-48c6-8443-98352beeadb9', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-17092026-0001 Diperbarui\",\"message\":\"Status TK-17092026-0001 berubah dari In Progress menjadi Close.\",\"kode\":\"TK-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/52\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"52\",\"data\":{\"old_status\":\"In Progress\",\"new_status\":\"Close\",\"message\":\"Status TK-17092026-0001 berubah dari In Progress menjadi Close.\",\"log_id\":72,\"module\":\"perbaikan\"}}', NULL, '2026-09-17 01:28:16', '2026-09-17 01:28:16'),
('c643e182-6a18-4350-92be-5636c38c592f', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 8, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-21072026-0001\",\"message\":\"Teknisi Edi Purwanto, S.Kom mengambil tiket ini.\",\"kode\":\"TK-21072026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/11\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"11\",\"data\":{\"message\":\"Teknisi Edi Purwanto, S.Kom mengambil tiket ini.\",\"sender_id\":3,\"sender_name\":\"Edi Purwanto, S.Kom\",\"log_id\":63,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 13:31:50', '2026-09-07 13:31:50'),
('c663b12f-d006-4277-a85c-70d5e94d0b70', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-03092026-0001\",\"message\":\"fasfa\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"fasfa\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":54}}', NULL, '2026-09-03 02:28:04', '2026-09-03 02:28:04'),
('cc00b94b-b292-4687-9108-1a6c048a7cf2', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.status\",\"title\":\"Status PJB-07092026-0001 Diperbarui\",\"message\":\"Status PJB-07092026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"105\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status PJB-07092026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":64,\"module\":\"pengajuan\"}}', NULL, '2026-09-17 01:12:27', '2026-09-17 01:12:27'),
('cee3b753-abdf-4333-a647-685900a1a1e6', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":58,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('d02c657e-40b2-4372-9d10-bce92637a130', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 4, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-17092026-0001\",\"message\":\"fegey\",\"kode\":\"TK-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/52\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"52\",\"data\":{\"message\":\"fegey\",\"sender_id\":3,\"sender_name\":\"Edi Purwanto, S.Kom\",\"log_id\":70,\"module\":\"perbaikan\"}}', NULL, '2026-09-17 01:27:37', '2026-09-17 01:27:37'),
('d0863639-3b53-4732-a818-7b89d49b3d06', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-28092026-0001 baru telah dibuat.\",\"kode\":\"PJB-28092026-0001\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/pengajuan-barang\\/158\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"158\",\"data\":{\"message\":\"Pengajuan PJB-28092026-0001 baru telah dibuat.\",\"user_id\":8,\"user_name\":\"Faizal Kurniawan\",\"nama_barang\":\"SSD SATA 2.5 Inch\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:42:59', '2026-09-30 18:42:59'),
('d328502f-cb85-4336-8e15-41e4d6ca74f3', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-29092026-0004 baru telah dibuat.\",\"kode\":\"PJB-29092026-0004\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/162\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"162\",\"data\":{\"message\":\"Pengajuan PJB-29092026-0004 baru telah dibuat.\",\"user_id\":8,\"user_name\":\"Faizal Kurniawan\",\"nama_barang\":\"Hard Disk CCTV 2TB\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:43:00', '2026-09-30 18:43:00'),
('d36db30d-9392-4b27-8129-1ec7d0980b50', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.status\",\"title\":\"Status PJB-28092026-0001 Diperbarui\",\"message\":\"Status PJB-28092026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"PJB-28092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/157\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"157\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status PJB-28092026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":228,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:43:00', '2026-09-30 18:43:00'),
('d4087ceb-97f2-48a8-927e-b3d0a2145e17', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"test\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('dafb6941-97aa-47b7-9204-3ebf00561242', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":58,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('dc2f9b14-123c-4d42-be68-3e404106645a', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-14082026-0001 Diperbarui\",\"message\":\"Status TK-14082026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-14082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/12\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"12\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-14082026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":64,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 13:31:51', '2026-09-07 13:31:51'),
('ddb2c43c-527e-4ade-a951-39f44669c4b0', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"kode\":\"PJB-07092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"tes\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:16:16', '2026-09-07 12:16:16');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('e2aba98c-fdb6-4bdf-a7db-d7a561554729', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 8, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-28092026-0001\",\"message\":\"Pengajuan diambil oleh Edi Purwanto, S.Kom.\",\"kode\":\"PJB-28092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/pengajuan-barang\\/157\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"157\",\"data\":{\"message\":\"Pengajuan diambil oleh Edi Purwanto, S.Kom.\",\"sender_id\":3,\"sender_name\":\"Edi Purwanto, S.Kom\",\"log_id\":229,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:43:00', '2026-09-30 18:43:00'),
('e4d6a6fa-7bfd-42bf-b73a-05730408398d', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"kode\":\"PJB-07092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/105\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"105\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0002 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"tes\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:16:16', '2026-09-07 12:16:16'),
('e62f29d1-a91b-4feb-862b-afa4fb61c678', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.created\",\"title\":\"Tiket Perbaikan Baru\",\"message\":\"Tiket TK-17092026-0001 baru telah dibuat.\",\"kode\":\"TK-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/52\",\"icon\":\"heroicon-o-wrench-screwdriver\",\"color\":\"info\",\"reference_id\":\"52\",\"data\":{\"message\":\"Tiket TK-17092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"ruangan\":\"Kaprodi\",\"keluhan\":\"laptop rusak\",\"module\":\"perbaikan\"}}', NULL, '2026-09-17 01:27:00', '2026-09-17 01:27:00'),
('e78d3a74-7dde-44af-a0aa-639683012f13', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":55,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('e7a0cd82-6c5e-47e9-a256-c275d559f240', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-17092026-0001\",\"message\":\"fegeg\",\"kode\":\"TK-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/52\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"52\",\"data\":{\"message\":\"fegeg\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":67,\"module\":\"perbaikan\"}}', NULL, '2026-09-17 01:27:16', '2026-09-17 01:27:16'),
('e8cc022a-4ca7-459e-888b-98b35fbed040', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":60,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:15:16', '2026-09-07 12:15:16'),
('e93aa62c-1ede-4cd6-b355-7d050aeda5b1', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":58,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('e96e8fad-6bf2-44b2-aee5-2c24a184efe5', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"dd\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"dd\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":53,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:45', '2026-09-07 12:10:45'),
('eb36cd16-8ec4-4f01-aa26-ecd6b6b4d5b6', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 8, '{\"type\":\"pengajuan.status\",\"title\":\"Status PJB-29092026-0002 Diperbarui\",\"message\":\"Status PJB-29092026-0002 berubah dari Open menjadi In Progress.\",\"kode\":\"PJB-29092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/pengajuan-barang\\/160\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"160\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status PJB-29092026-0002 berubah dari Open menjadi In Progress.\",\"log_id\":230,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:44:07', '2026-09-30 18:44:07'),
('eb386cb3-c79b-4652-a5dd-1860a9459957', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-17092026-0001 Diperbarui\",\"message\":\"Status TK-17092026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/52\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"52\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-17092026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":71,\"module\":\"perbaikan\"}}', NULL, '2026-09-17 01:27:52', '2026-09-17 01:27:52'),
('ebb05d89-a559-4cba-b483-3598dfd08334', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 5, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-18082026-0001 Diperbarui\",\"message\":\"Status TK-18082026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/13\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"13\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-18082026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":59,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:24:46', '2026-09-07 12:24:46'),
('ec0994eb-f7e3-48b8-8360-c12faf5c86d8', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 8, '{\"type\":\"pengajuan.status\",\"title\":\"Status PJB-28092026-0001 Diperbarui\",\"message\":\"Status PJB-28092026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"PJB-28092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/pengajuan-barang\\/157\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"157\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status PJB-28092026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":228,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:43:00', '2026-09-30 18:43:00'),
('ec10129e-2ca6-481c-9d5b-088823a0aa81', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"test\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"test\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":52,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:45', '2026-09-07 12:10:45'),
('ecd17944-67ec-415b-9da3-3c192f8f7841', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":58,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('ed812c1e-291b-4795-a16c-35f436b31a57', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"test\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('edbb39a7-9ed0-436a-8129-955e8c179a45', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":60,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:15:16', '2026-09-07 12:15:16'),
('ee2c0c48-a4c0-4958-ba0e-1d27be6e758d', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 8, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-21072026-0001 Diperbarui\",\"message\":\"Status TK-21072026-0001 berubah dari Open menjadi In Progress.\",\"kode\":\"TK-21072026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/11\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"11\",\"data\":{\"old_status\":\"Open\",\"new_status\":\"In Progress\",\"message\":\"Status TK-21072026-0001 berubah dari Open menjadi In Progress.\",\"log_id\":62,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 13:31:50', '2026-09-07 13:31:50'),
('ee87933d-3d34-4e85-b418-b98cac63b381', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"Printer Baru\",\"jumlah\":1}}', NULL, '2026-09-03 02:27:48', '2026-09-03 02:27:48'),
('f0bbc297-47d9-4b01-b566-46cb65c8d103', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-17092026-0001\",\"message\":\"fefe\",\"kode\":\"TK-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/52\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"52\",\"data\":{\"message\":\"fefe\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":68,\"module\":\"perbaikan\"}}', NULL, '2026-09-17 01:27:25', '2026-09-17 01:27:25'),
('f234534c-2ff8-4e0e-bc4f-d36d3e4004e6', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-07092026-0001\",\"message\":\"d\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":59,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:11:18', '2026-09-07 12:11:18'),
('f285687d-9c0d-49b4-8e62-7bfeaa17bdf1', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"test\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"test\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":52,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:45', '2026-09-07 12:10:45'),
('f3f821b3-b543-43d5-9fa9-b88ca33048cb', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 5, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":7,\"sender_name\":\"AdminSuper\",\"log_id\":56,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('f5202eaf-9146-4266-9c45-a701aed32f3a', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-29092026-0002 baru telah dibuat.\",\"kode\":\"PJB-29092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/160\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"160\",\"data\":{\"message\":\"Pengajuan PJB-29092026-0002 baru telah dibuat.\",\"user_id\":8,\"user_name\":\"Faizal Kurniawan\",\"nama_barang\":\"SSD NVMe M.2\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:42:59', '2026-09-30 18:42:59'),
('f644210e-314e-4a15-97a8-acb6cb598e08', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 5, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/ticket-perbaikan\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":7,\"sender_name\":\"AdminSuper\",\"log_id\":54,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('f83633e3-2637-4d50-bf8e-953489e6787c', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-28092026-0001 baru telah dibuat.\",\"kode\":\"PJB-28092026-0001\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/pengajuan-barang\\/157\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"157\",\"data\":{\"message\":\"Pengajuan PJB-28092026-0001 baru telah dibuat.\",\"user_id\":8,\"user_name\":\"Faizal Kurniawan\",\"nama_barang\":\"SSD SATA 2.5 Inch\",\"jumlah\":2,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:42:59', '2026-09-30 18:42:59'),
('f8dc3a9e-2efe-42a1-9492-83357d4ee640', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"d\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"d\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":55,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('fa5ce819-cdb2-4d88-80fa-622c856fb78c', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-28092026-0001 baru telah dibuat.\",\"kode\":\"PJB-28092026-0001\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/pengajuan-barang\\/157\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"157\",\"data\":{\"message\":\"Pengajuan PJB-28092026-0001 baru telah dibuat.\",\"user_id\":8,\"user_name\":\"Faizal Kurniawan\",\"nama_barang\":\"SSD SATA 2.5 Inch\",\"jumlah\":2,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:42:59', '2026-09-30 18:42:59'),
('fd472074-6c89-44e0-9391-9c5c8578ba1b', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"kode\":\"PJB-07092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/104\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"104\",\"data\":{\"message\":\"Pengajuan PJB-07092026-0001 baru telah dibuat.\",\"user_id\":5,\"user_name\":\"Annas Syaifudin\",\"nama_barang\":\"test\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-07 12:10:46', '2026-09-07 12:10:46'),
('fdc06343-b523-45e5-96e0-8aefa01b4d2a', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-03092026-0001\",\"message\":\"fasfa\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"fasfa\",\"sender_id\":4,\"sender_name\":\"Eko\",\"log_id\":54}}', NULL, '2026-09-03 02:28:04', '2026-09-03 02:28:04'),
('fe8a4878-25ba-4478-8302-43d88b2e6edf', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 8, '{\"type\":\"pengajuan.chat\",\"title\":\"Pesan Baru \\u00b7 PJB-29092026-0002\",\"message\":\"Pengajuan diambil oleh AdminSuper.\",\"kode\":\"PJB-29092026-0002\",\"url\":\"http:\\/\\/helpdesk.test\\/pemohon\\/pengajuan-barang\\/160\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"160\",\"data\":{\"message\":\"Pengajuan diambil oleh AdminSuper.\",\"sender_id\":7,\"sender_name\":\"AdminSuper\",\"log_id\":231,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:44:07', '2026-09-30 18:44:07'),
('fe916bfa-03d2-4c59-b87e-bc3fb625004a', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"perbaikan.status\",\"title\":\"Status TK-17092026-0001 Diperbarui\",\"message\":\"Status TK-17092026-0001 berubah dari In Progress menjadi Close.\",\"kode\":\"TK-17092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/52\",\"icon\":\"heroicon-o-arrow-path\",\"color\":\"warning\",\"reference_id\":\"52\",\"data\":{\"old_status\":\"In Progress\",\"new_status\":\"Close\",\"message\":\"Status TK-17092026-0001 berubah dari In Progress menjadi Close.\",\"log_id\":72,\"module\":\"perbaikan\"}}', NULL, '2026-09-17 01:28:16', '2026-09-17 01:28:16'),
('ff0c2078-67c9-4b4f-976d-f9fe3105cf77', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-29092026-0004 baru telah dibuat.\",\"kode\":\"PJB-29092026-0004\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/162\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"162\",\"data\":{\"message\":\"Pengajuan PJB-29092026-0004 baru telah dibuat.\",\"user_id\":8,\"user_name\":\"Faizal Kurniawan\",\"nama_barang\":\"Hard Disk CCTV 2TB\",\"jumlah\":1,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:43:00', '2026-09-30 18:43:00'),
('ff90aef7-7a60-493d-b255-03733e88ddac', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 2, '{\"type\":\"pengajuan.updated\",\"title\":\"Data PJB-28092026-0001 Diperbarui\",\"message\":\"Barang pada PJB-28092026-0001 diperbarui.\",\"kode\":\"PJB-28092026-0001\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/pengajuan-barang\\/158\",\"icon\":\"heroicon-o-pencil-square\",\"color\":\"warning\",\"reference_id\":\"158\",\"data\":{\"field\":\"barang_id\",\"field_label\":\"Barang\",\"old_value\":\"SSD SATA 2.5 Inch\",\"new_value\":\"TEST - HDD SATA 2.5 Inch\",\"message\":\"Barang pada PJB-28092026-0001 diperbarui.\",\"log_id\":118,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:42:59', '2026-09-30 18:42:59'),
('ffaac58f-bc0c-4cc7-8c8d-34634ddec2e1', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 3, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"kode\":\"PJB-03092026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/pengajuan-barang\\/53\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"53\",\"data\":{\"message\":\"Pengajuan PJB-03092026-0001 baru telah dibuat.\",\"user_id\":4,\"user_name\":\"Eko\",\"nama_barang\":\"Printer Baru\",\"jumlah\":1}}', NULL, '2026-09-03 02:27:48', '2026-09-03 02:27:48'),
('ffc46b75-06e4-41fe-bff0-1b6d10f1d200', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 7, '{\"type\":\"pengajuan.created\",\"title\":\"Pengajuan Barang Baru\",\"message\":\"Pengajuan PJB-28092026-0001 baru telah dibuat.\",\"kode\":\"PJB-28092026-0001\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/pengajuan-barang\\/157\",\"icon\":\"heroicon-o-cube\",\"color\":\"info\",\"reference_id\":\"157\",\"data\":{\"message\":\"Pengajuan PJB-28092026-0001 baru telah dibuat.\",\"user_id\":8,\"user_name\":\"Faizal Kurniawan\",\"nama_barang\":\"SSD SATA 2.5 Inch\",\"jumlah\":2,\"module\":\"pengajuan\"}}', NULL, '2026-09-30 18:42:59', '2026-09-30 18:42:59'),
('ffc9d9ff-1c9a-4af5-bb75-0a98b3e04946', 'App\\Notifications\\HelpdeskNotification', 'App\\Models\\User', 1, '{\"type\":\"perbaikan.chat\",\"title\":\"Pesan Baru \\u00b7 TK-18082026-0001\",\"message\":\"test\",\"kode\":\"TK-18082026-0001\",\"url\":\"http:\\/\\/helpdesk.test\\/admin\\/ticket-services\\/13\",\"icon\":\"heroicon-o-chat-bubble-left-right\",\"color\":\"info\",\"reference_id\":\"13\",\"data\":{\"message\":\"test\",\"sender_id\":5,\"sender_name\":\"Annas Syaifudin\",\"log_id\":52,\"module\":\"perbaikan\"}}', NULL, '2026-09-07 12:10:45', '2026-09-07 12:10:45');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('annas@iwima.edu', '$2y$12$.G9pwDHGr8lyuEve9vca/erjMMt0IBqHhzoxHHruShtBoCL/qzca2', '2026-09-07 14:07:41');

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_barang`
--

CREATE TABLE `pengajuan_barang` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `barang_id` bigint UNSIGNED DEFAULT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `spesifikasi_barang` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `jumlah` int NOT NULL DEFAULT '1',
  `alasan` text,
  `status` enum('Open','In Progress','Close') DEFAULT 'Open',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pengajuan_barang`
--

INSERT INTO `pengajuan_barang` (`id`, `user_id`, `barang_id`, `nama_barang`, `spesifikasi_barang`, `jumlah`, `alasan`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 8, NULL, 'Proyektor Baru', NULL, 12, 'Untuk kebutuhan kebutuhan pembelajan dan penggantian proyektor yang rusak', 'Close', '2026-06-03 17:09:35', '2026-10-05 22:30:24', '2026-10-05 22:30:24'),
(3, 4, NULL, 'Printer', NULL, 15, 'Printer Baru', 'Close', '2026-06-15 06:40:24', '2026-10-05 22:38:24', NULL),
(4, 3, NULL, 'RAM DDR 4 3200Mhz', NULL, 12, 'Komponen yang dibutuhkan untuk perbaikan komputer', 'Close', '2026-06-29 03:50:16', '2026-10-05 22:30:24', '2026-10-05 22:30:24'),
(5, 5, NULL, 'Printer Baru', NULL, 12, 'Kekurangan perangkat printer untuk kebutuhan inventaris', 'Open', '2026-07-20 21:32:50', '2026-07-20 21:32:50', NULL),
(6, 4, NULL, 'COBA barang', NULL, 1, 'COBAfff', 'Close', '2026-08-19 19:03:53', '2026-10-05 22:30:24', '2026-10-05 22:30:24'),
(7, 4, NULL, 'ateafea', NULL, 15, 'taefae', 'Open', '2026-08-19 19:20:17', '2026-08-19 19:55:14', NULL),
(53, 4, NULL, 'Printer Baru', NULL, 1, 'fafff', 'Open', '2026-09-03 02:27:48', '2026-09-03 02:48:10', NULL),
(54, 4, NULL, 'rwar', NULL, 1, 'arwar', 'Open', '2026-09-03 02:46:08', '2026-09-30 16:37:26', NULL),
(104, 5, NULL, 'test', NULL, 1, 'test', 'Open', '2026-09-07 12:07:33', '2026-09-30 16:37:26', NULL),
(105, 5, NULL, 'tes', NULL, 1, 'tes\n', 'In Progress', '2026-09-07 12:16:15', '2026-09-30 16:37:26', NULL),
(106, 4, NULL, 'gggg', NULL, 1, 'fwef', 'Open', '2026-09-17 01:25:58', '2026-09-30 16:37:26', NULL),
(157, 8, 1, 'SSD SATA 2.5 Inch', 'Media penyimpanan SSD SATA 2.5 inch untuk upgrade atau penggantian storage komputer dan laptop.', 2, 'TEST INTEGRASI MASTER BARANG - Pengujian Tahap B', 'In Progress', '2026-09-28 15:09:48', '2026-09-30 18:38:46', NULL),
(158, 8, 256, 'TEST - HDD SATA 2.5 Inch', 'Barang sementara untuk pengujian integrasi Master Barang ke Pengajuan Barang.', 1, 'TEST UPDATE MASTER BARANG - Tahap B', 'Open', '2026-09-28 15:19:53', '2026-09-30 16:37:26', NULL),
(159, 3, 12, 'Switch 24 Port Gigabit', 'Switch jaringan 24 port Gigabit untuk distribusi jaringan pada ruangan, laboratorium, atau kantor.', 1, 'Untuk digunakan untuk management cabel jaringan pada server ke ruang BAAK', 'Open', '2026-09-28 23:18:22', '2026-09-30 16:37:26', NULL),
(160, 8, 2, 'SSD NVMe M.2', 'Media penyimpanan SSD NVMe M.2 untuk upgrade atau penggantian storage laptop dan komputer yang mendukung NVMe.', 1, 'Upgrade Storage', 'In Progress', '2026-09-28 23:19:31', '2026-09-30 18:44:07', NULL),
(161, 8, 126, 'Hard Disk CCTV 2TB', 'tge', 1, 'gef', 'Open', '2026-09-29 13:25:28', '2026-09-30 16:37:26', NULL),
(162, 8, 125, 'Hard Disk CCTV 1TB', 'fawef', 1, 'geagae', 'Open', '2026-09-29 13:30:36', '2026-09-30 16:37:26', NULL);

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

--
-- Dumping data for table `permissions`
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
(62, 'Reorder:LogPerbaikan', 'web', '2026-06-01 02:03:48', '2026-06-01 02:03:48'),
(103, 'ViewAny:KegiatanTeknisi', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(104, 'View:KegiatanTeknisi', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(105, 'Create:KegiatanTeknisi', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(106, 'Update:KegiatanTeknisi', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(107, 'Delete:KegiatanTeknisi', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(108, 'DeleteAny:KegiatanTeknisi', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(109, 'Restore:KegiatanTeknisi', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(110, 'ForceDelete:KegiatanTeknisi', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(111, 'ForceDeleteAny:KegiatanTeknisi', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(112, 'RestoreAny:KegiatanTeknisi', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(113, 'Replicate:KegiatanTeknisi', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(114, 'Reorder:KegiatanTeknisi', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(115, 'ViewAny:LaporanKegiatan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(116, 'View:LaporanKegiatan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(117, 'Create:LaporanKegiatan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(118, 'Update:LaporanKegiatan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(119, 'Delete:LaporanKegiatan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(120, 'DeleteAny:LaporanKegiatan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(121, 'Restore:LaporanKegiatan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(122, 'ForceDelete:LaporanKegiatan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(123, 'ForceDeleteAny:LaporanKegiatan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(124, 'RestoreAny:LaporanKegiatan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(125, 'Replicate:LaporanKegiatan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(126, 'Reorder:LaporanKegiatan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(127, 'ViewAny:LaporanPerbaikan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(128, 'View:LaporanPerbaikan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(129, 'Create:LaporanPerbaikan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(130, 'Update:LaporanPerbaikan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(131, 'Delete:LaporanPerbaikan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(132, 'DeleteAny:LaporanPerbaikan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(133, 'Restore:LaporanPerbaikan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(134, 'ForceDelete:LaporanPerbaikan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(135, 'ForceDeleteAny:LaporanPerbaikan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(136, 'RestoreAny:LaporanPerbaikan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(137, 'Replicate:LaporanPerbaikan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(138, 'Reorder:LaporanPerbaikan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(139, 'ViewAny:LaporanPermintaanBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(140, 'View:LaporanPermintaanBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(141, 'Create:LaporanPermintaanBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(142, 'Update:LaporanPermintaanBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(143, 'Delete:LaporanPermintaanBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(144, 'DeleteAny:LaporanPermintaanBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(145, 'Restore:LaporanPermintaanBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(146, 'ForceDelete:LaporanPermintaanBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(147, 'ForceDeleteAny:LaporanPermintaanBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(148, 'RestoreAny:LaporanPermintaanBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(149, 'Replicate:LaporanPermintaanBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(150, 'Reorder:LaporanPermintaanBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(151, 'ViewAny:LogPengajuan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(152, 'View:LogPengajuan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(153, 'Create:LogPengajuan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(154, 'Update:LogPengajuan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(155, 'Delete:LogPengajuan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(156, 'DeleteAny:LogPengajuan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(157, 'Restore:LogPengajuan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(158, 'ForceDelete:LogPengajuan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(159, 'ForceDeleteAny:LogPengajuan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(160, 'RestoreAny:LogPengajuan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(161, 'Replicate:LogPengajuan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(162, 'Reorder:LogPengajuan', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(163, 'ViewAny:MasterBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(164, 'View:MasterBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(165, 'Create:MasterBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(166, 'Update:MasterBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(167, 'Delete:MasterBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(168, 'DeleteAny:MasterBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(169, 'Restore:MasterBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(170, 'ForceDelete:MasterBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(171, 'ForceDeleteAny:MasterBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(172, 'RestoreAny:MasterBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(173, 'Replicate:MasterBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(174, 'Reorder:MasterBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(175, 'ViewAny:MasterKategoriBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(176, 'View:MasterKategoriBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(177, 'Create:MasterKategoriBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(178, 'Update:MasterKategoriBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(179, 'Delete:MasterKategoriBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(180, 'DeleteAny:MasterKategoriBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(181, 'Restore:MasterKategoriBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(182, 'ForceDelete:MasterKategoriBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(183, 'ForceDeleteAny:MasterKategoriBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(184, 'RestoreAny:MasterKategoriBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(185, 'Replicate:MasterKategoriBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(186, 'Reorder:MasterKategoriBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(187, 'ViewAny:PengajuanBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(188, 'View:PengajuanBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(189, 'Create:PengajuanBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(190, 'Update:PengajuanBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(191, 'Delete:PengajuanBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(192, 'DeleteAny:PengajuanBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(193, 'Restore:PengajuanBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(194, 'ForceDelete:PengajuanBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(195, 'ForceDeleteAny:PengajuanBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(196, 'RestoreAny:PengajuanBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(197, 'Replicate:PengajuanBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(198, 'Reorder:PengajuanBarang', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(199, 'View:Dashboard', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(200, 'View:Chat', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(201, 'View:Timeline', 'web', '2026-09-30 15:57:16', '2026-09-30 15:57:16'),
(202, 'View:AdminOverview', 'web', '2026-09-30 15:57:17', '2026-09-30 15:57:17'),
(203, 'View:TeknisiOverview', 'web', '2026-09-30 15:57:17', '2026-09-30 15:57:17'),
(204, 'View:AdminLayananTrendChart', 'web', '2026-09-30 15:57:17', '2026-09-30 15:57:17'),
(205, 'View:TeknisiStatusChart', 'web', '2026-09-30 15:57:17', '2026-09-30 15:57:17'),
(206, 'View:AdminStatusLayananChart', 'web', '2026-09-30 15:57:17', '2026-09-30 15:57:17'),
(207, 'View:TeknisiAktivitasChart', 'web', '2026-09-30 15:57:17', '2026-09-30 15:57:17'),
(208, 'View:AdminTiketStatusChart', 'web', '2026-09-30 15:57:17', '2026-09-30 15:57:17'),
(209, 'View:TeknisiTiketAktif', 'web', '2026-09-30 15:57:17', '2026-09-30 15:57:17'),
(210, 'View:AdminPengajuanStatusChart', 'web', '2026-09-30 15:57:17', '2026-09-30 15:57:17'),
(211, 'View:AdminTiketTerbaru', 'web', '2026-09-30 15:57:17', '2026-09-30 15:57:17'),
(212, 'View:AdminPengajuanTerbaru', 'web', '2026-09-30 15:57:17', '2026-09-30 15:57:17');

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
(2, 'admin', 'web', '2026-05-06 16:52:56', '2026-05-06 16:52:56'),
(3, 'teknisi', 'web', '2026-05-06 16:52:56', '2026-05-06 16:52:56'),
(4, 'pemohon', 'web', '2026-05-06 16:52:56', '2026-05-06 16:52:56'),
(5, 'super_admin', 'web', '2026-05-07 23:03:32', '2026-05-07 23:03:32');

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
(1, 2),
(2, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(47, 2),
(48, 2),
(51, 2),
(52, 2),
(103, 2),
(104, 2),
(105, 2),
(106, 2),
(114, 2),
(115, 2),
(116, 2),
(127, 2),
(128, 2),
(139, 2),
(140, 2),
(151, 2),
(152, 2),
(163, 2),
(164, 2),
(165, 2),
(166, 2),
(167, 2),
(168, 2),
(169, 2),
(174, 2),
(175, 2),
(176, 2),
(177, 2),
(178, 2),
(179, 2),
(180, 2),
(181, 2),
(186, 2),
(187, 2),
(188, 2),
(189, 2),
(190, 2),
(191, 2),
(192, 2),
(193, 2),
(196, 2),
(197, 2),
(198, 2),
(199, 2),
(200, 2),
(201, 2),
(202, 2),
(203, 2),
(204, 2),
(205, 2),
(206, 2),
(207, 2),
(208, 2),
(209, 2),
(210, 2),
(212, 2),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(51, 3),
(52, 3),
(103, 3),
(104, 3),
(105, 3),
(106, 3),
(107, 3),
(108, 3),
(109, 3),
(112, 3),
(114, 3),
(115, 3),
(116, 3),
(117, 3),
(118, 3),
(119, 3),
(120, 3),
(121, 3),
(124, 3),
(126, 3),
(127, 3),
(128, 3),
(139, 3),
(140, 3),
(151, 3),
(152, 3),
(163, 3),
(164, 3),
(165, 3),
(166, 3),
(175, 3),
(176, 3),
(177, 3),
(178, 3),
(187, 3),
(188, 3),
(189, 3),
(190, 3),
(25, 4),
(26, 4),
(27, 4),
(28, 4),
(51, 4),
(52, 4),
(151, 4),
(152, 4),
(187, 4),
(188, 4),
(189, 4),
(190, 4),
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

-- --------------------------------------------------------

--
-- Table structure for table `tiket_perbaikan`
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
-- Dumping data for table `tiket_perbaikan`
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
(13, 5, 3, 'UJI COBA', 'Lainnya', 'UJI COBA', 'In Progress', '2026-08-17 18:31:16', '2026-09-07 12:24:45', NULL),
(52, 4, 2, 'laptop rusak', 'Pribadi', 'fefet', 'Close', '2026-09-17 01:26:58', '2026-09-17 01:28:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `remember_token`, `unit_bidang`, `created_at`, `updated_at`) VALUES
(1, 'Fithnan', 'fithnan@iwima.edu', '$2y$12$YGPgYttdp28xPi8vicS0cOZvdJXatHd8sU1/tLjpkgARtPhABTsNG', 'teknisi', NULL, 'UPT Teknisi', '2026-04-20 01:19:57', '2026-07-08 17:38:51'),
(2, 'Sulistyo', 'sulistyo@iwima.edu', '$2y$12$xNkQNwtlUgWBZKyjtMyPnOqKcFxL27AuengJqz21z1wX116LkRWCG', 'teknisi', NULL, 'UPT Teknisi', '2026-04-20 01:19:57', '2026-07-08 17:38:42'),
(3, 'Edi Purwanto, S.Kom', 'edi@iwima.edu', '$2y$12$AE5mS18p8UvqKlQ2Tam85ebdeOHeM2F1JUACag36AD08rRHGzZrWC', 'admin', '2XPLGcnfdoyCze64ih24xybKaz58R1wux98V6vM8k4RK4Qznmk1O6LuVlDuP', 'Ka. Bidang Teknisi & Perawatan Infrastruktur', '2026-04-20 01:19:57', '2026-09-30 15:25:12'),
(4, 'Eko', 'eko@iwima.edu', '$2y$12$MdzYvpMfgKXqj4dF4TDSYuF.NWM1HuVQ29miZfo3twARINOcbWkke', 'pemohon', 'ku4qDtrMXmLouJslWZZDTz6iLIXebajVCmPs1Ks5Pd1FeLmLm0rd63TRvi0Z', 'Kaprodi Teknik', '2026-04-20 01:19:57', '2026-09-29 12:56:40'),
(5, 'Annas Syaifudin', 'annas@iwima.edu', '$2y$12$r7ljVqxiTNcgeTIaeQa35Od7s4q0QbiTNOUNJOO9rZPndlyN40CwC', 'pemohon', NULL, 'P3SDI', '2026-04-20 01:19:57', '2026-05-07 22:46:57'),
(6, 'Dr. Christianto', 'christianto@iwima.edu', '$2y$10$6Pc98WMFlVZmayrynhNebel/zXxA523NmKDRx9djZQbQqdsqwjHB.', 'pemohon', NULL, 'Rektorat', '2026-04-20 01:19:57', '2026-05-04 00:34:27'),
(7, 'AdminSuper', 'admin@iwima.edu', '$2y$12$73D/pdiqgsFCivquNGWHH.XI0pIIaq36aB0UFzdGI8pK9VFqnRPTu', 'admin', NULL, 'P3SDI', '2026-05-07 23:53:39', '2026-05-07 23:59:00'),
(8, 'Faizal Kurniawan', 'faizal@iwima.edu', '$2y$12$yZo1q5Zv2C5ru0X.QXQEF.mL.8iYhg25/eqf8EoSzygvA3.b1MwRK', 'pemohon', 'FrknnhpJFLAWs7LDhoJlQh5dw9jQQwCGjICdoQthcftft4PyGifHJz85331O', 'P3SDI', '2026-05-26 01:00:19', '2026-09-28 23:19:04'),
(9, 'Wachid Darmawan, M.Kom', 'wachiddarmawan@iwima.edu', '$2y$12$1CwQ4Rpp98oATimZp.W9sOYsMV0KaikeonJPtTRuupUQP.POXK7HC', 'pemohon', NULL, 'Ka. UPT Laboretorium Komputer & Bahasa', '2026-07-08 19:27:50', '2026-07-08 19:27:50');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_laporan_barang`
-- (See below for the actual view)
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
-- Stand-in structure for view `view_laporan_kegiatan`
-- (See below for the actual view)
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
-- Stand-in structure for view `view_laporan_service`
-- (See below for the actual view)
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
-- Indexes for table `log_data_pengajuan_barang`
--
ALTER TABLE `log_data_pengajuan_barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengajuan_id` (`pengajuan_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `log_pengajuan_status_lookup` (`pengajuan_id`,`kategori_log`,`data_baru`,`created_at`);

--
-- Indexes for table `log_data_tiket_perbaikan`
--
ALTER TABLE `log_data_tiket_perbaikan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tiket_id` (`tiket_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `log_tiket_status_lookup` (`tiket_id`,`kategori_log`,`data_baru`,`created_at`),
  ADD KEY `log_teknisi_status_lookup` (`user_id`,`kategori_log`,`data_baru`,`created_at`),
  ADD KEY `log_teknisi_activity_lookup` (`user_id`,`created_at`);

--
-- Indexes for table `log_harian_teknisi`
--
ALTER TABLE `log_harian_teknisi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teknisi_id` (`teknisi_id`),
  ADD KEY `ruangan_id` (`ruangan_id`);

--
-- Indexes for table `master_barang`
--
ALTER TABLE `master_barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `master_barang_kategori_barang_id_is_active_index` (`kategori_barang_id`,`is_active`),
  ADD KEY `master_barang_nama_barang_index` (`nama_barang`);

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
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_created_at` (`created_at`),
  ADD KEY `pengajuan_barang_barang_id_index` (`barang_id`);

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
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ruangan_id` (`ruangan_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=743;

--
-- AUTO_INCREMENT for table `log_data_pengajuan_barang`
--
ALTER TABLE `log_data_pengajuan_barang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=283;

--
-- AUTO_INCREMENT for table `log_data_tiket_perbaikan`
--
ALTER TABLE `log_data_tiket_perbaikan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `log_harian_teknisi`
--
ALTER TABLE `log_harian_teknisi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `master_barang`
--
ALTER TABLE `master_barang`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT for table `master_kategori_barang`
--
ALTER TABLE `master_kategori_barang`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `master_ruangan`
--
ALTER TABLE `master_ruangan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=749021856;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `pengajuan_barang`
--
ALTER TABLE `pengajuan_barang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `tiket_perbaikan`
--
ALTER TABLE `tiket_perbaikan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

-- --------------------------------------------------------

--
-- Structure for view `view_laporan_barang`
--
DROP TABLE IF EXISTS `view_laporan_barang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_laporan_barang`  AS SELECT `b`.`id` AS `no_pengajuan`, `u`.`name` AS `nama_pemohon`, `u`.`unit_bidang` AS `unit_bidang`, `b`.`nama_barang` AS `nama_barang`, `b`.`jumlah` AS `jumlah`, `b`.`alasan` AS `alasan`, `b`.`status` AS `status`, `b`.`created_at` AS `waktu_pengajuan`, (select `lg`.`user_id` from `log_data_pengajuan_barang` `lg` where ((`lg`.`pengajuan_id` = `b`.`id`) and (`lg`.`kategori_log` = 'Status') and (`lg`.`data_baru` = 'In Progress')) order by `lg`.`created_at` limit 1) AS `teknisi_id`, (select `us`.`name` from (`log_data_pengajuan_barang` `lg` join `users` `us` on((`us`.`id` = `lg`.`user_id`))) where ((`lg`.`pengajuan_id` = `b`.`id`) and (`lg`.`kategori_log` = 'Status') and (`lg`.`data_baru` = 'In Progress')) order by `lg`.`created_at` limit 1) AS `nama_teknisi`, (select min(`lg`.`created_at`) from `log_data_pengajuan_barang` `lg` where ((`lg`.`pengajuan_id` = `b`.`id`) and (`lg`.`kategori_log` = 'Status') and (`lg`.`data_baru` = 'In Progress'))) AS `waktu_mulai`, (select max(`lg`.`created_at`) from `log_data_pengajuan_barang` `lg` where ((`lg`.`pengajuan_id` = `b`.`id`) and (`lg`.`kategori_log` = 'Status') and (`lg`.`data_baru` = 'Close'))) AS `waktu_selesai`, timestampdiff(MINUTE,(select min(`lg`.`created_at`) from `log_data_pengajuan_barang` `lg` where ((`lg`.`pengajuan_id` = `b`.`id`) and (`lg`.`kategori_log` = 'Status') and (`lg`.`data_baru` = 'In Progress'))),(select max(`lg`.`created_at`) from `log_data_pengajuan_barang` `lg` where ((`lg`.`pengajuan_id` = `b`.`id`) and (`lg`.`kategori_log` = 'Status') and (`lg`.`data_baru` = 'Close')))) AS `durasi_pengerjaan_menit`, (case when (`b`.`status` <> 'Close') then NULL when exists(select 1 from `log_data_pengajuan_barang` `lg` where ((`lg`.`pengajuan_id` = `b`.`id`) and (`lg`.`kategori_log` = 'Status') and (`lg`.`data_baru` = 'Close') and (`lg`.`keterangan` like '[SELESAI]%'))) then 'Completed' when exists(select 1 from `log_data_pengajuan_barang` `lg` where ((`lg`.`pengajuan_id` = `b`.`id`) and (`lg`.`kategori_log` = 'Status') and (`lg`.`data_baru` = 'Close') and (`lg`.`keterangan` like '[DITOLAK]%'))) then 'Rejected' else NULL end) AS `status_outcome` FROM (`pengajuan_barang` `b` join `users` `u` on((`u`.`id` = `b`.`user_id`))) ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_laporan_service`  AS SELECT `t`.`id` AS `no_tiket`, `u`.`name` AS `nama_pemohon`, `r`.`nama_ruangan` AS `lokasi`, `t`.`kepemilikan` AS `kepemilikan`, `t`.`status` AS `status`, (select `users`.`name` from (`log_data_tiket_perbaikan` join `users` on((`log_data_tiket_perbaikan`.`user_id` = `users`.`id`))) where ((`log_data_tiket_perbaikan`.`tiket_id` = `t`.`id`) and (`log_data_tiket_perbaikan`.`kategori_log` = 'Status') and (`log_data_tiket_perbaikan`.`data_baru` = 'In Progress')) order by `log_data_tiket_perbaikan`.`created_at` limit 1) AS `nama_teknisi`, (select min(`log_data_tiket_perbaikan`.`created_at`) from `log_data_tiket_perbaikan` where ((`log_data_tiket_perbaikan`.`tiket_id` = `t`.`id`) and (`log_data_tiket_perbaikan`.`kategori_log` = 'Status') and (`log_data_tiket_perbaikan`.`data_baru` = 'In Progress'))) AS `waktu_mulai`, (select max(`log_data_tiket_perbaikan`.`created_at`) from `log_data_tiket_perbaikan` where ((`log_data_tiket_perbaikan`.`tiket_id` = `t`.`id`) and (`log_data_tiket_perbaikan`.`kategori_log` = 'Status') and (`log_data_tiket_perbaikan`.`data_baru` = 'Close'))) AS `waktu_selesai`, timestampdiff(MINUTE,(select min(`log_data_tiket_perbaikan`.`created_at`) from `log_data_tiket_perbaikan` where ((`log_data_tiket_perbaikan`.`tiket_id` = `t`.`id`) and (`log_data_tiket_perbaikan`.`kategori_log` = 'Status') and (`log_data_tiket_perbaikan`.`data_baru` = 'In Progress'))),(select max(`log_data_tiket_perbaikan`.`created_at`) from `log_data_tiket_perbaikan` where ((`log_data_tiket_perbaikan`.`tiket_id` = `t`.`id`) and (`log_data_tiket_perbaikan`.`kategori_log` = 'Status') and (`log_data_tiket_perbaikan`.`data_baru` = 'Close')))) AS `durasi_pengerjaan_menit` FROM ((`tiket_perbaikan` `t` join `users` `u` on((`t`.`user_id` = `u`.`id`))) join `master_ruangan` `r` on((`t`.`ruangan_id` = `r`.`id`))) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `log_data_pengajuan_barang`
--
ALTER TABLE `log_data_pengajuan_barang`
  ADD CONSTRAINT `log_data_pengajuan_barang_ibfk_1` FOREIGN KEY (`pengajuan_id`) REFERENCES `pengajuan_barang` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `log_data_pengajuan_barang_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `log_data_tiket_perbaikan`
--
ALTER TABLE `log_data_tiket_perbaikan`
  ADD CONSTRAINT `log_data_tiket_perbaikan_ibfk_1` FOREIGN KEY (`tiket_id`) REFERENCES `tiket_perbaikan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `log_data_tiket_perbaikan_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `log_harian_teknisi`
--
ALTER TABLE `log_harian_teknisi`
  ADD CONSTRAINT `log_harian_teknisi_ibfk_1` FOREIGN KEY (`teknisi_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `log_harian_teknisi_ibfk_2` FOREIGN KEY (`ruangan_id`) REFERENCES `master_ruangan` (`id`);

--
-- Constraints for table `master_barang`
--
ALTER TABLE `master_barang`
  ADD CONSTRAINT `master_barang_kategori_barang_id_foreign` FOREIGN KEY (`kategori_barang_id`) REFERENCES `master_kategori_barang` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

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
  ADD CONSTRAINT `pengajuan_barang_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `master_barang` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_barang_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

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
  ADD CONSTRAINT `tiket_perbaikan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tiket_perbaikan_ibfk_2` FOREIGN KEY (`ruangan_id`) REFERENCES `master_ruangan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
