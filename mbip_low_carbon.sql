-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 01, 2024 at 12:16 PM
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
-- Database: `mbip_low_carbon`
--

-- --------------------------------------------------------

--
-- Table structure for table `akaun`
--

CREATE TABLE `akaun` (
  `akaun_id` int(11) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `nama_penuh` text NOT NULL,
  `IC_no` text DEFAULT NULL,
  `nombor_telefon` text DEFAULT NULL,
  `institusi` text DEFAULT NULL,
  `status` text DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `akaun`
--

INSERT INTO `akaun` (`akaun_id`, `email`, `password`, `nama_penuh`, `IC_no`, `nombor_telefon`, `institusi`, `status`, `is_admin`) VALUES
(1, 'iqmal', 'iqmal', 'iqmal aizat', '021227140335', '0147', 'sektor-pelajar', 'kahwin', 1),
(4, 'iqmalaizat5ab@gmail.com', 'iqmal102', 'IQMAL AIZAT BIN MOHD ZAMRI', NULL, NULL, NULL, NULL, 0),
(5, 'iqmalaizat5ab@gmail.co', '123', 'IQMAL AIZAT BIN MOHD ZAMRI', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `alamat`
--

CREATE TABLE `alamat` (
  `akaun_id` int(11) NOT NULL,
  `kawasan_id` int(11) NOT NULL,
  `alamat` text NOT NULL,
  `bandar` text NOT NULL,
  `poskod` text NOT NULL,
  `kategori` text NOT NULL,
  `bilangan_isi_rumah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alamat`
--

INSERT INTO `alamat` (`akaun_id`, `kawasan_id`, `alamat`, `bandar`, `poskod`, `kategori`, `bilangan_isi_rumah`) VALUES
(1, 20, '123', '123', '123', 'A1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kawasan`
--

CREATE TABLE `kawasan` (
  `kawasan_id` int(11) NOT NULL,
  `NAMA` text DEFAULT NULL,
  `KATEGORI` text DEFAULT NULL,
  `STATUS` text DEFAULT NULL,
  `KETERANGAN` text DEFAULT NULL,
  `MUKIM` text DEFAULT NULL,
  `LUAS` text DEFAULT NULL,
  `DUN` text DEFAULT NULL,
  `PARLIMEN` text DEFAULT NULL,
  `BIL_RUMAH` text DEFAULT NULL,
  `BIL_PENDUDUK` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `kawasan`
--

INSERT INTO `kawasan` (`kawasan_id`, `NAMA`, `KATEGORI`, `STATUS`, `KETERANGAN`, `MUKIM`, `LUAS`, `DUN`, `PARLIMEN`, `BIL_RUMAH`, `BIL_PENDUDUK`) VALUES
(1, 'TAMAN IMPIAN EMAS', 'PERUMAHAN TERANCANG', 'SEDIA ADA', 'PEMBANGUNAN BELUM SIAP SEPENUHNYA', 'TEBRAU', '1,294.09', 'N.48 SKUDAI', 'P.162 ISKANDAR PUTERI', '4090', '17,537.00'),
(2, 'TAMAN PULAI ORKID', 'PERUMAHAN TERANCANG', 'KOMITED', 'PEMBANGUNAN BELUM SIAP SEPENUHNYA', 'PULAI', '211.83', 'N.49 KOTA ISKANDAR', 'P.162 ISKANDAR PUTER', '1344', '5,779.00'),
(3, 'TAMAN UNIVERSITI', 'PERUMAHAN TERANCANG', 'SEDIA ADA', 'PEMBANGUNAN SIAP', 'PULAI', '438.18', 'N.49 KOTA ISKANDAR', 'P.162 ISKANDAR PUTERI', '11786', '47,858.00'),
(4, 'TAMAN MUTIARA RINI', 'PERUMAHAN TERANCANG', 'SEDIA ADA', 'PEMBANGUNAN SIAP', 'PULAI', '590.69', 'N.49 KOTA ISKANDAR', 'P.162 ISKANDAR PUTERI', '10253', '43,664.00'),
(5, 'TAMAN TROPIKA MENTARI', 'PERUMAHAN TERANCANG', 'KOMITED', 'BELUM DIBANGUNKAN', 'PULAI', '187.23', 'N.49 KOTA ISKANDAR', 'P.162 ISKANDAR PUTERI', '-', '-'),
(6, 'TAMAN PERINDUSTRIAN SILC NUSAJAYA', 'INDUSTRI TERANCANG', 'SEDIA ADA', 'PEMBANGUNAN BELUM SIAP SEPENUHNYA', 'JELUTONG/PULAI', '527.72', 'N.49 KOTA ISKANDAR', 'P.162 ISKANDAR PUTERI', '-', '-'),
(7, 'TAMAN BUKIT HORIZON', 'PERUMAHAN TERANCANG', 'SEDIA ADA', 'PEMBANGUNAN BELUM SIAP SEPENUHNYA', 'PULAI', '513.79', 'N.49 KOTA ISKANDAR', 'P.162 ISKANDAR PUTERI', '4271', '18,365.00'),
(8, 'GERBANG NUSAJAYA', 'PERUMAHAN TERANCANG', 'SEDIA ADA', '-', 'TANJUNG KUPANG', '1,302.01', 'N.49 KOTA ISKANDAR', 'P.162 ISKANDAR PUTERI', '625', '2,688.00'),
(9, 'PELABUHAN TANJUNG PELEPAS', 'INDUSTRI TERANCANG', 'SEDIA ADA', 'PEMBANGUNAN BELUM SIAP SEPENUHNYA', 'TANJUNG KUPANG', '1,546.10', 'N.49 KOTA ISKANDAR', 'P.162 ISKANDAR PUTERI', '-', '-'),
(10, 'LEISURE FARM', 'PERUMAHAN TERANCANG', 'SEDIA ADA', 'PEMBANGUNAN BELUM SIAP SEPENUHNYA', 'PULAI', '695.86', 'N.49 KOTA ISKANDAR', 'P.162 ISKANDAR PUTERI', '892', '3,836.00'),
(11, 'BANDAR MEDINI ISKANDAR', 'PERNIAGAAN TERANCANG', 'SEDIA ADA', 'PEMBANGUNAN BELUM SIAP SEPENUHNYA', 'PULAI', '956.67', 'N.49 KOTA ISKANDAR', 'P.162 ISKANDAR PUTERI', '4474', '17,667.00'),
(12, 'TAMAN SUTERA', 'PERUMAHAN TERANCANG', 'SEDIA ADA', 'PEMBANGUNAN BELUM SIAP SEPENUHNYA', 'PULAI', '130.6', 'N.46 PERLING', 'P.161 PULAI', '1491', '6,071.00'),
(13, 'TAMAN BUKIT INDAH 1', 'PERUMAHAN TERANCANG', 'SEDIA ADA', 'PEMBANGUNAN BELUM SIAP SEPENUHNYA', 'PULAI', '427.53', 'N.46 PERLING', 'P.161 PULAI', '9603', '37,155.00'),
(14, 'TAMAN SUTERA UTAMA', 'PERUMAHAN TERANCANG', 'SEDIA ADA', 'PEMBANGUNAN BELUM SIAP SEPENUHNYA', 'PULAI', '395.8', 'N.48 SKUDAI', 'P.162 ISKANDAR PUTERI', '2317', '9,963.00'),
(15, 'TAMAN NUSA PERINTIS 2', 'PERUMAHAN TERANCANG', 'SEDIA ADA', 'PEMBANGUNAN SIAP', 'PULAI', '29.04', 'N.49 KOTA ISKANDAR', 'P.162 ISKANDAR PUTERI', '848', '3,313.00'),
(16, 'KAMPUNG MELAYU GELANG PATAH', 'KAMPUNG TERSUSUN', 'SEDIA ADA', 'PEMBANGUNAN SIAP', 'JELUTONG', '82.26', 'N.49 KOTA ISKANDAR', 'P.162 ISKANDAR PUTERI', '320', '1,920.00'),
(17, 'TAMAN NUSANTARA', 'PERUMAHAN TERANCANG', 'SEDIA ADA', 'PEMBANGUNAN BELUM SIAP SEPENUHNYA', 'JELUTONG', '185.95', 'N.49 KOTA ISKANDAR', 'P.162 ISKANDAR PUTERI', '3524', '15,753.00'),
(18, 'TAMAN LAMAN SETIA', 'PERUMAHAN TERANCANG', 'SEDIA ADA', 'PEMBANGUNAN BELUM SIAP SEPENUHNYA', 'PULAI', '565.46', 'N.49 KOTA ISKANDAR', 'P.162 ISKANDAR PUTERI', '2972', '12,780.00'),
(19, 'TAMAN UNGKU TUN AMINAH', 'PERUMAHAN TERANCANG', 'SEDIA ADA', 'PEMBANGUNAN SIAP', 'PULAI', '304.78', 'N.48 SKUDAI', 'P.162 ISKANDAR PUTERI', '10317', '39,562.00'),
(20, 'UNIVERSITI TEKNOLOGI MALAYSIA', 'INSTITUSI TERANCANG', 'SEDIA ADA', 'PEMBANGUNAN SIAP', 'KULAI', '1,252.72', 'N.52 SENAI', 'P.163 KULAI', '-', '-'),
(21, 'TAMAN BUKIT AMBER', 'PERUMAHAN TERANCANG', 'SEDIA ADA', 'PEMBANGUNAN BELUM SIAP SEPENUHNYA', 'TEBRAU', '1,179.28', 'N.41 PUTERI WANGSA', 'P.158 TEBRAU', '-', '-'),
(22, 'TAMAN PULAI MUTIARA', 'PERUMAHAN TERANCANG', 'SEDIA ADA', 'PEMBANGUNAN BELUM SIAP SEPENUHNYA', 'PULAI', '331.82', 'N.49 KOTA ISKANDAR', 'P.162 ISKANDAR PUTERI', '1053', '4,528.00'),
(23, 'KAMPUNG PULAI', 'KAMPUNG TRADISI', 'SEDIA ADA', '-', 'JELUTONG', '274.64', 'N.49 KOTA ISKANDAR', 'P.162 ISKANDAR PUTERI', '200', '934'),
(24, 'BANDAR SUNWAY ISKANDAR PUTERI', 'PEMBANGUNAN BERCAMPUR', 'KOMITED', 'PEMBANGUNAN BELUM SIAP SEPENUHNYA', 'TANJUNG KUPANG', '1,772.80', 'N.49 KOTA ISKANDAR', 'P.162 ISKANDAR PUTERI', '-', '-'),
(25, 'TAMAN LAMAN ISKANDAR', 'PERNIAGAAN TERANCANG', 'SEDIA ADA', 'PEMBANGUNAN BELUM SIAP SEPENUHNYA', 'PULAI', '317.79', 'N.49 KOTA ISKANDAR', 'P.162 ISKANDAR PUTERI', '-', '-'),
(26, 'TAMAN SIREH', 'REKREASI TERANCANG', 'SEDIA ADA', 'PEMBANGUNAN BELUM SIAP SEPENUHNYA', 'PULAI', '197.42', 'N.49 KOTA ISKANDAR', 'P.162 ISKANDAR PUTERI', '-', '-'),
(27, 'TAMAN NUSA BAYU', 'PERUMAHAN TERANCANG', 'SEDIA ADA', 'PEMBANGUNAN BELUM SIAP SEPENUHNYA', 'PULAI', '126.31', 'N.49 KOTA ISKANDAR', 'P.162 ISKANDAR PUTERI', '2066', '8,884.00'),
(28, 'TAMAN NUSANTARA PRIMA', 'PERUMAHAN TERANCANG', 'SEDIA ADA', 'PEMBANGUNAN BELUM SIAP SEPENUHNYA', 'PULAI', '102.08', 'N.49 KOTA ISKANDAR', 'P.162 ISKANDAR PUTERI', '514', '2,210.00'),
(29, 'TAMAN PRISMA (PERUMAHAN ISKANDAR MALAYSIA)', 'PERUMAHAN RAKYAT', 'SEDIA ADA', 'PEMBANGUNAN BELUM SIAP SEPENUHNYA', 'PULAI', '91.9', 'N.49 KOTA ISKANDAR', 'P.162 ISKANDAR PUTERI', '1500', '6,450.00'),
(30, 'TAMAN DAMAI JAYA', 'PERUMAHAN TERANCANG', 'SEDIA ADA', 'PEMBANGUNAN SIAP', 'PULAI', '81.54', 'N.48 SKUDAI', 'P.162 ISKANDAR PUTERI', '2869', '11,954.00');

-- --------------------------------------------------------

--
-- Table structure for table `penggunaan_air`
--

CREATE TABLE `penggunaan_air` (
  `ID` int(11) NOT NULL,
  `akaun_id` int(11) NOT NULL,
  `bil_hari` int(11) NOT NULL,
  `prorata` float NOT NULL,
  `isipadu_air` float NOT NULL,
  `harga_isipadu` float NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(4) NOT NULL,
  `pelepasan_karbon` double DEFAULT NULL,
  `fail_url` text NOT NULL,
  `is_complete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penggunaan_air`
--

INSERT INTO `penggunaan_air` (`ID`, `akaun_id`, `bil_hari`, `prorata`, `isipadu_air`, `harga_isipadu`, `bulan`, `tahun`, `pelepasan_karbon`, `fail_url`, `is_complete`) VALUES
(1, 1, 1, 1, 1, 1, 4, 2024, NULL, 'entah', 0),
(4, 4, 1, 1, 1, 1, 1, 2024, NULL, 'entah', 0);

-- --------------------------------------------------------

--
-- Table structure for table `penggunaan_elektrik`
--

CREATE TABLE `penggunaan_elektrik` (
  `ID` int(11) NOT NULL,
  `akaun_id` int(11) NOT NULL,
  `bil_hari` int(11) NOT NULL,
  `prorata` float NOT NULL,
  `tenaga_elektrik` float NOT NULL,
  `harga_elektrik` float NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(4) NOT NULL,
  `fail_url` int(11) NOT NULL,
  `pelepasan_karbon` double DEFAULT NULL,
  `is_complete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penggunaan_kitar_semula`
--

CREATE TABLE `penggunaan_kitar_semula` (
  `ID` int(11) NOT NULL,
  `akaun_id` int(11) NOT NULL,
  `jisim_bahan` float NOT NULL,
  `nilai_collect_point` float NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(4) NOT NULL,
  `fail_url` text NOT NULL,
  `pelepasan_karbon` double DEFAULT NULL,
  `is_complete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akaun`
--
ALTER TABLE `akaun`
  ADD PRIMARY KEY (`akaun_id`),
  ADD UNIQUE KEY `email` (`email`) USING HASH;

--
-- Indexes for table `alamat`
--
ALTER TABLE `alamat`
  ADD PRIMARY KEY (`akaun_id`);

--
-- Indexes for table `kawasan`
--
ALTER TABLE `kawasan`
  ADD PRIMARY KEY (`kawasan_id`);

--
-- Indexes for table `penggunaan_air`
--
ALTER TABLE `penggunaan_air`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `penggunaan_air_composite_key_1` (`akaun_id`,`bulan`,`tahun`);

--
-- Indexes for table `penggunaan_elektrik`
--
ALTER TABLE `penggunaan_elektrik`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `penggunaan_elektrik_composite_key_1` (`akaun_id`,`bulan`,`tahun`);

--
-- Indexes for table `penggunaan_kitar_semula`
--
ALTER TABLE `penggunaan_kitar_semula`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `penggunaan_kitar_semula_composite_key_1` (`akaun_id`,`bulan`,`tahun`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akaun`
--
ALTER TABLE `akaun`
  MODIFY `akaun_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kawasan`
--
ALTER TABLE `kawasan`
  MODIFY `kawasan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `penggunaan_air`
--
ALTER TABLE `penggunaan_air`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `penggunaan_elektrik`
--
ALTER TABLE `penggunaan_elektrik`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penggunaan_kitar_semula`
--
ALTER TABLE `penggunaan_kitar_semula`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alamat`
--
ALTER TABLE `alamat`
  ADD CONSTRAINT `alamat_FK_1` FOREIGN KEY (`akaun_id`) REFERENCES `akaun` (`akaun_id`);

--
-- Constraints for table `penggunaan_air`
--
ALTER TABLE `penggunaan_air`
  ADD CONSTRAINT `penggunaan_air_FK_1` FOREIGN KEY (`akaun_id`) REFERENCES `akaun` (`akaun_id`);

--
-- Constraints for table `penggunaan_elektrik`
--
ALTER TABLE `penggunaan_elektrik`
  ADD CONSTRAINT `penggunaan_elektrik_FK_1` FOREIGN KEY (`akaun_id`) REFERENCES `akaun` (`akaun_id`);

--
-- Constraints for table `penggunaan_kitar_semula`
--
ALTER TABLE `penggunaan_kitar_semula`
  ADD CONSTRAINT `penggunaan_kitar_semula_FK_1` FOREIGN KEY (`akaun_id`) REFERENCES `akaun` (`akaun_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
