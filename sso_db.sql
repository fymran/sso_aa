-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2024 at 05:26 AM
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
-- Database: `sso_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `asset_1`
--

CREATE TABLE `asset_1` (
  `assetID` int(11) NOT NULL,
  `assetNo` varchar(25) NOT NULL,
  `pbtID` int(25) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `coordiNorth` varchar(100) DEFAULT NULL,
  `coordiEast` varchar(100) DEFAULT NULL,
  `postcode` varchar(5) DEFAULT NULL,
  `nodeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `asset_1`
--

INSERT INTO `asset_1` (`assetID`, `assetNo`, `pbtID`, `address`, `coordiNorth`, `coordiEast`, `postcode`, `nodeID`) VALUES
(1, 'C01', 9, NULL, '3.07308', '101.58958', NULL, NULL),
(2, 'C02', 9, NULL, '3.08216', '101.58713', NULL, NULL),
(3, 'C03', 9, NULL, '3.08232', '101.59211', NULL, NULL),
(4, 'C04', 9, NULL, 'N 03 02.364', 'E 101 35.278', NULL, NULL),
(5, 'C05', 9, NULL, 'N 03 02.477', 'E 101 35.663', NULL, NULL),
(6, 'C06', 9, NULL, 'N 03 02.365', 'E 101 34.976', NULL, NULL),
(7, 'C07', 9, NULL, 'N 03 03.022', 'E 101 34.596', NULL, NULL),
(8, 'C08', 9, NULL, '3.045995', '101.62227', NULL, NULL),
(9, 'C09', 9, NULL, 'N 03 02.723', 'E 101 34.558', NULL, NULL),
(10, 'C10', 9, NULL, '3.07564', '101.56026', NULL, NULL),
(11, 'C11', 9, NULL, '3.064225', '101.580294', NULL, NULL),
(12, 'C12', 9, NULL, 'N 03 03.253', 'E 101 35.947', NULL, NULL),
(13, 'C13', 9, NULL, '3.0747', '101.5617', NULL, NULL),
(14, 'C14', 9, NULL, '3.061724', '101.609961', NULL, NULL),
(15, 'C15', 9, NULL, '3.0687', '101.6025', NULL, NULL),
(16, 'C16', 9, NULL, 'N 03 02.979', 'E 101 36.111', NULL, NULL),
(17, 'C17', 9, NULL, 'N 03 02.881', 'E 101 36.071', NULL, NULL),
(18, 'C18', 9, NULL, 'N 03 03.464', 'E 101 35.463', NULL, NULL),
(19, 'C19', 9, NULL, '3.07447', '101.58697', NULL, NULL),
(20, 'C20', 9, NULL, '3.04749', '101.57952', NULL, NULL),
(21, 'C21', 9, NULL, '3.07363', '101.60988', NULL, NULL),
(22, 'C22', 9, NULL, '3.07091', '101.61607', NULL, NULL),
(23, 'C23', 9, NULL, '3.07656', '101.611', NULL, NULL),
(24, 'C24', 9, NULL, '3.07904', '101.5951', NULL, NULL),
(25, 'C25', 9, NULL, '3.07919', '101.5974', NULL, NULL),
(26, 'C26', 9, NULL, '3.07372', '101.58636', NULL, NULL),
(27, 'C27', 9, NULL, '3.07355', '101.58951', NULL, NULL),
(28, 'C28', 9, NULL, '3.07746', '101.58621', NULL, NULL),
(29, 'C29', 9, NULL, '3.07421', '101.58629', NULL, NULL),
(30, 'C30', 9, NULL, '3.08174', '101.58356', NULL, NULL),
(31, 'C31', 9, NULL, '3.08352', '101.58761', NULL, NULL),
(32, 'C32', 9, 'None', 'N 03 03.401', 'E 101 35.510', 'None', NULL),
(33, 'C33', 9, 'None', 'N 03 02.831', 'E 101 35.144', 'None', NULL),
(34, 'C34', 9, 'None', 'N 03 02.736', 'E 101 35.173', 'None', NULL),
(35, 'C35', 9, 'None', 'N 03 02.842', 'E 101 35.028', 'None', NULL),
(36, 'C36', 9, 'None', 'N 03 02.971', 'E 101 34.981', 'None', NULL),
(37, 'C37', 9, NULL, '3.0728', '101.6105', NULL, NULL),
(38, 'C38', 9, NULL, '3.044', '101.5676', NULL, NULL),
(39, 'C39', 9, NULL, '3.0356', '101.5752', NULL, NULL),
(40, 'C40', 9, 'None', 'N 03 02.514', 'E 101 37.456', 'None', NULL),
(41, 'C41', 9, 'None', 'N 03 02.654', 'E 101 37.181', 'None', NULL),
(42, 'C42', 9, 'None', 'N 03 02.740', 'E 101 37.225', 'None', NULL),
(43, 'C43', 9, 'None', 'N 03 02.654', 'E 101 37.181', 'None', NULL),
(44, 'C44', 9, NULL, '3.033806', '101.616899', NULL, NULL),
(45, 'C45', 9, 'None', 'N 03 02.869', 'E 101 37.292', 'None', NULL),
(46, 'C46', 9, 'None', 'N 03 02.608', 'E 101 37.263', 'None', NULL),
(47, 'C47', 9, 'None', 'N 03 03.178', 'E 101 37.377', 'None', NULL),
(48, 'C48', 9, 'None', 'N 03 01.717', 'E 101 37.567', 'None', NULL),
(49, 'C49', 9, 'None', 'N 03 01.035', 'E 101 42.205', 'None', NULL),
(50, 'C50', 9, 'None', 'N 03 01.022', 'E 101 42.271', 'None', NULL),
(51, 'C51', 9, 'None', 'N 03 02.155', 'E 101 37.009', 'None', NULL),
(52, 'C52', 9, 'None', 'N 03 02.001', 'E 101 36.896', 'None', NULL),
(53, 'C53', 9, 'None', 'N 03 02.001', 'E 101 36.896', 'None', NULL),
(54, 'C54', 9, 'None', 'N 02 59.537', 'E 101 36.871', 'None', NULL),
(55, 'C55', 9, 'None', 'N 02 59.724', 'E 101 40.186', 'None', NULL),
(56, 'C56', 9, 'None', 'N 02 59.134', 'E 101 37.901', 'None', NULL),
(57, 'C57', 9, NULL, '3.042876', '101.58288', NULL, NULL),
(58, 'C58', 9, 'None', 'N 02 59.373', 'E 101 37.633', 'None', NULL),
(59, 'C59', 9, 'None', 'N 02 59.585', 'E 101 40.489', 'None', NULL),
(60, 'C60', 9, 'None', 'N 03 00.824', 'E 101 36.838', 'None', NULL),
(61, 'C61', 9, 'None', 'N 02 59.931', 'E 101 36.706', 'None', NULL),
(62, 'C62', 9, 'None', 'N 03 00.521', 'E 101 36.362', 'None', NULL),
(63, 'C63', 9, 'None', 'N 03 00.908', 'E 101 42.807', 'None', NULL),
(64, 'C64', 9, NULL, 'N 02 59.399', 'E 101 37.811', NULL, NULL),
(65, 'C65', 9, NULL, 'N 03 02.101', 'E 101 37.041', NULL, NULL),
(66, 'C66', 9, NULL, 'N 03 01.295', 'E 101 42.664', NULL, NULL),
(67, 'C67', 9, NULL, 'N 02 59.719', 'E 101 40.405', NULL, NULL),
(68, 'C68', 9, NULL, 'N 03 00.520', 'E 101 42.801', NULL, NULL),
(69, 'C69', 9, NULL, 'N 03 00.414', 'E 101 36.321', NULL, NULL),
(70, 'C70', 9, NULL, '3.07904', '101.59375', NULL, NULL),
(71, 'C71', 9, NULL, '3.072694', '101.586', NULL, NULL),
(72, 'C72', 9, NULL, 'N 03 01.197', 'E 101 42.755', NULL, NULL),
(73, 'C73', 9, NULL, 'N 02 59.921', 'E 101 36.499', NULL, NULL),
(74, 'C74', 9, NULL, 'N 02 59.784', 'E 101 40.371', NULL, NULL),
(75, 'C75', 9, NULL, 'N 03 02.723', 'E 101 42.273', NULL, NULL),
(76, 'C76', 9, NULL, 'N 03 01.748', 'E 101 42.494', NULL, NULL),
(77, 'C77', 9, NULL, 'N 03 01.022', 'E 101 42.023', NULL, NULL),
(78, 'C78', 9, NULL, 'N 03 01.688', 'E 101 42.655', NULL, NULL),
(79, 'C79', 9, NULL, 'N 03 01.327', 'E 101 42.343', NULL, NULL),
(80, 'C80', 9, NULL, 'N 03 01.793', 'E 101 42.577', NULL, NULL),
(81, 'C81', 9, NULL, 'N 03 02.771', 'E 101 42.218', NULL, NULL),
(82, 'C82', 9, NULL, 'N 03 01.392', 'E 101 42.407', NULL, NULL),
(83, 'C83', 9, NULL, 'N 02 59.734', 'E 101 40.239', NULL, NULL),
(84, 'C84', 9, NULL, 'N 03 00.910', 'E 101 41.880', NULL, NULL),
(85, 'C85', 9, NULL, 'N 03 01.431', 'E 101 42.887', NULL, NULL),
(86, 'C86', 9, NULL, 'N 03 01.475', 'E 101 42.957', NULL, NULL),
(87, 'C87', 9, NULL, 'N 03 01.211', 'E 101 41.994', NULL, NULL),
(88, 'C88', 9, NULL, 'N 03 01.779', 'E 101 42.541', NULL, NULL),
(89, 'C89', 9, NULL, 'N 02 59.734', 'E 101 40.239', NULL, NULL),
(90, 'C90', 9, NULL, 'N 03 01.367', 'E 101 42.307', NULL, NULL),
(91, 'C91', 9, NULL, '3.05061', '101.58193', NULL, NULL),
(92, 'C92', 9, NULL, '3.05062', '101.58204', NULL, NULL),
(93, 'C93', 9, NULL, '3.031885', '101.577736', NULL, NULL),
(96, '', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `asset_2`
--

CREATE TABLE `asset_2` (
  `assetID` int(11) NOT NULL,
  `assetNo` varchar(25) NOT NULL,
  `pbtID` int(25) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `coordiNorth` varchar(100) DEFAULT NULL,
  `coordiEast` varchar(100) DEFAULT NULL,
  `postcode` varchar(5) DEFAULT NULL,
  `nodeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `asset_2`
--

INSERT INTO `asset_2` (`assetID`, `assetNo`, `pbtID`, `address`, `coordiNorth`, `coordiEast`, `postcode`, `nodeID`) VALUES
(1, '01', 2, NULL, '1.662617474', '103.6073365', NULL, NULL),
(2, '02', 2, NULL, '1.66105', '103.60356', NULL, NULL),
(3, '03', 2, NULL, '1.65542', '103.58784', NULL, NULL),
(4, '04', 2, NULL, '1.64105', '103.62334', NULL, NULL),
(5, '05', 2, NULL, '1.64222', '103.62061', NULL, NULL),
(6, '06', 2, NULL, '1.65286', '103.59425', NULL, NULL),
(7, '07', 2, NULL, '1.6523', '103.61014', NULL, NULL),
(8, '08', 2, NULL, '1.65683', '103.60617', NULL, NULL),
(9, '09', 2, NULL, '1.65867959', '103.6068626', NULL, NULL),
(10, '10', 2, NULL, '1.63801', '103.62512', NULL, NULL),
(11, '11', 2, NULL, '1.63853', '103.61799', NULL, NULL),
(12, '12', 2, NULL, '1.65863', '103.60701', NULL, NULL),
(13, '13', 2, NULL, '1.60115', '103.64491', NULL, NULL),
(14, '14', 2, NULL, '1.61156', '103.6585', NULL, NULL),
(15, '15', 2, NULL, '1.60966', '103.64739', NULL, NULL),
(16, '16', 2, NULL, '1.6692001', '103.5822126', NULL, NULL),
(17, '17', 2, NULL, '1.64811', '103.61031', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `asset_3`
--

CREATE TABLE `asset_3` (
  `assetID` int(11) NOT NULL,
  `assetNo` varchar(25) NOT NULL,
  `pbtID` int(25) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `coordiNorth` varchar(100) DEFAULT NULL,
  `coordiEast` varchar(100) DEFAULT NULL,
  `postcode` varchar(5) DEFAULT NULL,
  `nodeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `asset_3`
--

INSERT INTO `asset_3` (`assetID`, `assetNo`, `pbtID`, `address`, `coordiNorth`, `coordiEast`, `postcode`, `nodeID`) VALUES
(1, 'C1', 3, 'Jalan PS 7, Persimpangan Selayang Prima, Selayang', '3.245544444', '101.6503444', '68100', 95),
(2, 'C2', 3, 'Persimpangan Persiaran 1 & Persiaran Pegawai, Jambatan Pejabat Tanah Gombak, Selayang', '3.262816667', '101.6534861', '68100', 95),
(3, 'C3', 3, 'Jalan Sungai Tua, Hentian Kedua, Hulu Yam', '3.285019444', '101.6955083', '68100', 113),
(4, 'C4', 3, 'Jalan 4, Kg Bendahara, Sg Tua', '3.261705556', '101.6760583', '68100', 113),
(5, 'C5', 3, 'Jalan 2/16, Bandar Baru Selayang', '3.256261111', '101.6582694', '68100', 95),
(6, 'C6', 3, 'Persimpangan Persiaran 3 & Persiaran 1, Bulatan Siantan', '3.253544444', '101.6534417', '68100', 95),
(7, 'C7', 3, 'Jalan Taman Samudra, Batu Caves', '3.235075', '101.695473', '68100', 113),
(8, 'C8', 3, 'Jln Batu Caves', '3.238147222', '101.6809111', '68100', 113),
(9, 'C9', 3, 'Persimpangan Jalan TIB 1/1 & Jalan TIB 1/4, Tmn Perindustrian Bolton', '3.239508333', '101.6958111', '68100', 113),
(10, 'C10', 3, 'Persimpangan Jalan SBC 5 & Jalan SBC 8, Tmn Samudra', '3.235319444', '101.6910306', '68100', 113),
(11, 'C11', 3, 'Lebuh Utama Sri Gombak, Taman Sri Gombak', '3.239566667', '101.6994806', '68100', 113),
(12, 'C12', 3, 'Jln Muhibah, Tmn Tasik, Taman Sri Gombak', '3.248438889', '101.7059306', '68100', 113),
(13, 'C13', 3, 'Jln SG 3/2, Pasar Taman Sri Gombak', '3.241469444', '101.7029472', '68100', 113),
(14, 'C14', 3, 'Jln 4, Persimpangan Taman Selasih, Greenwood Gombak', '3.2343595', '101.7049542', '68100', 113),
(15, 'C15', 3, 'Bulatan Lintang Tmn Sri Gombak', '3.2428436', '101.7020434', '68100', 113),
(16, 'C16', 3, 'Persimpangan Jln SG 1/2 & Jln SG 1/4', '3.242994444', '101.7021083', '68100', 113),
(17, 'C17', 3, 'Jln SG 1/2, Taman Sri Gombak', '3.236319444', '101.6990194', '68100', 113),
(18, 'C18', 3, 'Jln SG 3/18, Taman Sri Gombak', '3.24235', '101.7062639', '68100', 113),
(19, 'C19', 3, 'Jln Terminal Putra, Taman Melati', '3.229103', '101.724547', '53100', 115),
(20, 'C20', 3, 'Jln Batu Caves, Taman Greenwood, Gombak', '3.234044444', '101.7061417', '68100', 113),
(21, 'C21', 3, 'Jalan Bersatu 6, Taman Bersatu, Rawang', '3.3090518', '101.58287', '48000', 107),
(22, 'C22', 3, 'Jalan Bandar Rawang 10, Rawang', '3.319847222', '101.5756167', '48000', 107),
(23, 'C23', 3, 'Persimpangan Jln Mutiara 1 & Jln Seri Hijau 12, Rawang Mutiara', '3.329452778', '101.5795444', '48000', 107),
(24, 'C24', 3, 'Pusat Bandar Rawang, Giant Bandar Rawang', '3.322616667', '101.5762889', '48000', 107),
(25, 'C25', 3, 'Jln Welman,Pekan Rawang', '3.318983333', '101.5751528', '48000', 107),
(26, 'C26', 3, 'Jalan 1a, Pejabat MCA, Tmn Jati Rawang', '3.307322222', '101.5861639', '48000', 107),
(27, 'C27', 3, 'Jln Kuala Garing', '3.315925', '101.5696944', '48000', 107),
(28, 'C28', 3, 'Jln Rawang Mutiara 2 , Rawang Mutiara', '3.3195332', '101.5791736', '48000', 107),
(29, 'C29', 3, 'Jalan Idaman 1, Rawang', '3.310361111', '101.5572861', '48000', 107),
(30, 'C30', 3, 'Jln Desa Utama Bandar Country Home, Rawang', '3.326125', '101.5265421', '48000', 107),
(31, 'C31', 3, 'Jln Daya, Taman Daya', '3.22205', '101.6359167', '52100', 93),
(32, 'C32', 3, 'Bulatan Taman Ehsan', '3.221463889', '101.6257222', '52100', 93),
(33, 'C33', 3, 'Persiaran KIP 2, Wangsa Permai', '3.2081', '101.6110333', '52200', 93),
(34, 'C34', 3, 'Persimpanga Persiaran KIP Utama & Persiaran KIP 2', '3.20635', '101.6072667', '52200', 93),
(35, 'C35', 3, 'Jalan Desa 1/4, Desa Aman Puri', '3.212369444', '101.6153194', '52100', 93),
(36, 'C36', 3, 'Hospital Sungai Buloh', '3.220616667', '101.5836167', '47000', 94),
(37, 'C37', 3, 'Persimpangan Jln Perdana Utama & Jln Perdana 1', '3.219816667', '101.6363333', '52100', 93),
(38, 'C38', 3, ' Jalan 54, Kawasan Tengah Padang KFC', '3.2134', '101.63225', '52100', 93),
(39, 'C39', 3, 'Jalan 5, Taman Desa Jaya', '3.2167', '101.63065', '52100', 93),
(40, 'C40', 3, 'Stesen Komuter Sungai Buloh', '3.206666667', '101.57975', '47000', 94),
(41, 'C41', 3, 'Jln Kampung Baru Sri Kundang', '3.279366667', '101.5145833', '48020', 101),
(42, 'C42', 3, 'Persimpangan Jalan JKR B149 LATAR - Kundang', '3.271116667', '101.51395', '48020', 101),
(43, 'C43', 3, 'Persimpangan Jln Puteri & Jln 7a/3', '3.28655', '101.47295', '48000', 101),
(44, 'C44', 3, 'Simpang masuk kota puteri seksyen 5, batu arang & rawang', '3.306975', '101.4541', '48100', 101),
(45, 'C45', 3, 'Persimpangan Pinggiran Lembah Hijau 1 & Jln Lembah Hijau', '3.292166667', '101.4873333', '48020', 101),
(46, 'C46', 3, 'Jalan BRP 6/13, Bukit Rahman Putra', '3.2169', '101.56715', '47000', 94),
(47, 'C47', 3, 'Persimpangan Jalan BRP & Jalan BRP 5/5, Bukit Rahman Putra', '3.21705', '101.5665694', '47000', 94),
(48, 'C48', 3, 'Jln Cempaka 1, Sg Buloh', '3.230116667', '101.5760611', '47000', 94),
(49, 'C49', 3, 'Jln BRP 5/5, Bukit Rahman Putra', '3.218283333', '101.5658222', '47000', 94),
(50, 'C50', 3, 'Persimpangan Jln BRP 7/2 & Jln BRP 1/1', '3.223563889', '101.5750361', '47000', 94),
(51, 'CC', 3, 'Bilik Server, Tkt 8, Majlis Perbandaran Selayang, Persiaran 3, Baru Selayang, 68100 Batu Caves, Selangor', '3.253694', '101.654278', '68100', 95),
(52, 'CC', 3, 'Bilik Mpv, Tkt Bawah, Ipd Gombak, Jalan Bidara, Taman Bidara, 68100 Batu Caves, Selangor', '3.252778', '101.641389', '68100', 95),
(53, 'C1', 4, 'JALAN KUALA SELANGOR/TELUK INTAN', '3.424630556', '101.1761444', '45500', 69),
(54, 'C2', 4, 'JALAN BENDAHARA 1, TAMAN BENDAHARA,KUALA SELANGOR', '3.321305556', '101.2715278', '45000', 61),
(55, 'C3', 4, 'SIMPANG TIGA JALAN KUALA/JALAN RAJA JALIL', '3.339322222', '101.2471278', '45000', 61),
(56, 'C4', 4, 'JALAN STESEN, PEKAN LAMA KUALA SELANGOR', '3.341475', '101.2497278', '45000', 61),
(57, 'C5', 4, 'LALUAN MASUK UTAMA KE TESCO DAN 1 PLAZA', '3.319677778', '101.2711056', '45000', 61),
(58, 'C6', 4, 'JALAN MELATI 3/1 BANDAR BARU KUALA SELANGOR', '3.331008333', '101.2562278', '45000', 61),
(59, 'C7', 4, 'JALAN RAWANG, BISTARI JAYA', '3.378483333', '101.404725', '45000', 57),
(60, 'C8', 4, 'JALAN PPAJ 1, PUSAT PERNIAGAAN ALAM JAYA', '3.239527', '101.44779', '42300', 96),
(61, 'CC', 4, 'MAJLIS DAERAH KUALA SELANGOR, JALAN MAJLIS, 45000, KUALA SELANGOR, SELANGOR DARUL EHSAN', '3.331330556', '101.2515472', '45000', 61),
(62, 'CC', 4, 'IPD KUALA SELANGOR, 45000 KUALA SELANGOR, SELANGOR DARUL EHSAN', '3.322416667', '101.2622944', '45000', 61),
(63, 'C1', 5, 'JALAN MENTERI, PEKAN SG BESAR', '3.675497222', '100.9853667', '45300', 64),
(64, 'C2', 5, 'JALAN MAHSURI, PEKAN SG BESAR', '3.674783333', '100.9859389', '45300', 64),
(65, 'C3', 5, 'JALAN MAWAR, PEKAN SG BESAR', '3.672261111', '100.9864944', '45300', 64),
(66, 'C4', 5, 'JALAN MENTERI ,PEKAN SABAK BERNAM', '3.766680556', '100.9823111', '45200', 66),
(67, 'C5', 5, 'JALAN RAJA CHULAN / JALAN HJ MOHAMAD, PEKAN SABAK BERNAM', '3.768630556', '100.9824306', '45200', 66),
(68, 'C6', 5, 'SABAK BERNAM WATERFRONT , PEKAN SABAK BERNAM', '3.770311111', '100.9838389', '45200', 66),
(69, 'C7', 5, 'JALAN PERIA / JALAN RIA, PEKAN SEKINCHAN', '3.508130556', '101.1026861', '45400', 65),
(70, 'C8', 5, 'JALAN RADIN, PEKAN SEKINCHAN', '3.507330556', '101.1039583', '45400', 65),
(71, 'CC', 5, 'Majlis Daerah Sabak Bernam, Sungai Besar, 45300 Sungai Besar, Selangor', '3.676241667', '100.9901083', '45300', 64),
(72, 'CC', 5, 'Ipd Sabak Bernam, Sabak Bernam, 45300 Sungai Besar, Selangor', '3.679008333', '100.9886278', '45400', 64),
(73, 'SC-01 C01', 6, 'Menara MPK', '3.044627778', '101.4448472', '41200', 72),
(74, 'SC-02 C02', 6, 'Jalan Perbandaran', '3.044211111', '101.4437472', '41200', 72),
(75, 'SC-03 C03', 6, 'Tempat Letak Kereta Kota Raja Mahadi', '3.045011111', '101.4451111', '41200', 72),
(76, 'SC-04 C04', 6, 'Taman Pengkalan Batu', '3.046861111', '101.4435833', '41100', 72),
(77, 'SC-05 C05', 6, 'Playground Taman Bandar Diraja', '3.036211111', '101.4447111', '41200', 72),
(78, 'SC-06 C06', 6, 'Jalan Istana', '3.038152778', '101.4468083', '41000', 72),
(79, 'SC-07 C07', 6, 'Hentian Bas Klang Selatan', '3.039111111', '101.4465361', '41000', 72),
(80, 'SC-08 C08', 6, 'Simpang Jalan Stesen/Jalan Besar', '3.042972222', '101.4494944', '41000', 72),
(81, 'SC-09 C09', 6, 'Padang Sultan Sulaiman', '3.039119444', '101.4510306', '41000', 72),
(82, 'SC-10 C10', 6, 'Jln Sg Jati Taman Sentosa', '3.011263889', '101.4650306', '41000', 72),
(83, 'SC-11 C11', 6, 'Jalan Hulubalang 29, Taman Sentosa', '3.003638889', '101.4708278', '41200', 70),
(84, 'SC-12 C12', 6, 'Jln Datuk Mohd Sidin Jambatan Counought', '3.042813889', '101.4733972', '41300', NULL),
(85, 'SC-13 C13', 6, 'Bulatan Jalan Kebun', '3.004558333', '101.4921444', '40460', 70),
(86, 'SC-14 C14', 6, 'Jln Tun Dr Ismail, Taman Rakyat', '3.020386111', '101.4501056', '41100', 72),
(87, 'SC-15 C15', 6, 'Taman Rakyat', '3.021483333', '101.4497833', '41100', 72),
(88, 'SC-16 C16', 6, 'Bulatan Simpang Lima', '3.035716667', '101.4425111', '41200', 72),
(89, 'SC-17 C17', 6, 'Bandar Bukit Tinggi', '3.007822222', '101.4396056', '41200', 71),
(90, 'SC-18 C18', 6, 'Jalan Langat/Susur masuk ke Jusco Bukit Tinggi', '2.997672222', '101.4445889', '41200', 71),
(91, 'SC-19 C19', 6, 'Blok K Bandar Bukit Tinggi', '3.010297222', '101.4265306', '41200', 71),
(92, 'SC-20 C20', 6, 'Jalan Papan, Pandamaran', '3.005030556', '101.4148389', '42000', 74),
(93, 'SC-21 C21', 6, 'Jalan Tengku Badar', '3.005266667', '101.3978444', '42000', 74),
(94, 'SC-22 C22', 6, 'Bayu Perdana', '3.027572222', '101.4277306', '41100', 72),
(95, 'SC-23 C23', 6, 'Kompleks Sukan Pandamaran', '3.016844444', '101.4152861', '42000', 74),
(96, 'SC-24 C24', 6, 'Jalan Raja Lumu', '3.008058333', '101.4099139', '42000', 74),
(97, 'SC-25 C25', 6, 'Simpang PRMM/Jalan KEM', '3.001394444', '101.3965694', '41100', 74),
(98, 'SC-26 C26', 6, 'Persiaran Raja Muda Musa', '3.001055556', '101.3954028', '41100', 74),
(99, 'SC-27 C27', 6, 'Jalan Shahbandar', '3.000480556', '101.3904917', '42000', 74),
(100, 'SC-28 C28', 6, 'Jln KEM, Pasar Pelabuhan Klang', '2.999480556', '101.3968028', '42000', 74),
(101, 'SC-29 C29', 6, 'Jalan Shahbandar', '2.998763889', '101.3915972', '42000', 74),
(102, 'SC-30 C30', 6, 'MPK Jalan Raya Barat', '3.046033333', '101.3938556', '42100', NULL),
(103, 'SC-31 C31', 6, 'Jambatan Telok Gong/Pulau Indah', '2.983944444', '101.4185', '42000', 74),
(104, 'SC-32 C32', 6, 'Bukit Tinggi (Jln Batu Nilam 3 / Chin Ho Seafood Steamboat)', '3.009166667', '101.4372639', '41200', 71),
(105, 'SC-33 C33', 6, 'Hadapan MPK', '3.044369444', '101.4444389', '41200', 72),
(106, 'UC-01 C34', 6, 'Centre Point/Dataran Seni', '3.049038889', '101.448025', '41400', NULL),
(107, 'UC-02 C35', 6, 'Bulatan Kota/Lokasi 1', '3.049613889', '101.4491083', '41400', NULL),
(108, 'UC-03 C36', 6, 'Laluan Pejalan Kaki Centre Point/Plaza MPK', '3.048611111', '101.4486972', '41400', NULL),
(109, 'UC-04 C37', 6, 'Plaza MPK. Atas bumbung', '3.047733333', '101.4488306', '41300', NULL),
(110, 'UC-05 C38', 6, 'Hentian Teksi dan Bas Ekspress Klang Utara', '3.047894444', '101.4505306', '41300', NULL),
(111, 'UC-06 C39', 6, 'Bulatan Berkely', '3.0562943', '101.4594364', '41150', NULL),
(112, 'UC-07 C40', 6, 'Taman Eng Ann', '3.057002778', '101.4742444', '41300', NULL),
(113, 'UC-08 C41', 6, 'Jln Batai Laut 3, Taman Intan', '3.0532564', '101.463231', '41300', NULL),
(114, 'UC-09 C42', 6, 'Jln Tiara 3, Bandar Baru Klang', '3.064722222', '101.4689639', '41150', NULL),
(115, 'UC-10 C43', 6, 'Jalan Batu Tiga Lama', '3.050665', '101.4470945', '41300', NULL),
(116, 'UC-11 C44', 6, 'Lampu Isyarat Jalan Melayu / Jalan Nenas', '3.064236111', '101.4519556', '41050', NULL),
(117, 'UC-12 C45', 6, 'Jalan Meru/Klang', '3.0707471', '101.4527815', '41150', NULL),
(118, 'UC-13 C46', 6, 'Pasar Borong Jalan Meru', '3.069866667', '101.4505167', '41150', NULL),
(119, 'UC-14 C47', 6, 'Kompleks Pasar Besar Meru', '3.1103', '101.4371333', '41050', NULL),
(120, 'UC-15 C48', 6, 'Jambatan Sungai Klang Taman Sentosa', '3.038386111', '101.4732417', '41000', 70),
(121, 'UC-16 C49', 6, 'Simpang 3 Lebuhraya Selat Klang/Jln Sentosa 52 ', '3.07005', '101.4384806', '41400', NULL),
(122, 'UC-17 C50', 6, 'Jln Batu Belah', '3.112433333', '101.4417', '41050', 72),
(123, 'UC-18 C51', 6, 'Simpang 3 Trafik Light Jalan Abdul Manan-Jalan Meru', '3.1360771', '101.4394301', '41050', 77),
(124, 'UC-19 C52', 6, 'Pekan Meru', '3.067116667', '101.4311833', '41400', 72),
(125, 'UC-20 C53', 6, 'Jalan Kapar', '3.137755556', '101.3728833', '42200', NULL),
(126, 'UC-21 C54', 6, 'Pekan Kapar', '3.0974911', '101.3771088', '42200', 74),
(127, 'UC-22 C55', 6, 'Jln Harapan 3, Taman Sungai Kapar Indah', '3.136802778', '101.3729361', '42200', NULL),
(128, 'UC-23 C56', 6, 'Jalan Mokhtar, Kapar', '3.0614428', '101.4373198', '41400', 72),
(129, 'UC-24 C57', 6, 'Sungai Pinang Dalam', '3.005386111', '101.3620972', '42000', 77),
(130, 'UC-25 C58', 6, 'Replica Kapal Bugis, Tanjung Harapan', '3.070763', '101.4128232', '42100', 74),
(131, 'UC-26 C59', 6, 'Jalan Rantau Panjang/ Jln Kapar', '3.0846017', '101.4126672', '42100', 74),
(132, 'UC-27 C60', 6, 'Persiaran Sg Keramat', '3.084686111', '101.4125333', '42100', 74),
(133, 'IPDKU-CC', 6, 'Balai Polis Sungai Kapar Indah, No 43 Tkt 1, Jln Harapan 3a/Ku7, Taman Sg Kapar Indah', '3.097339', '101.375836', '42200', 74),
(134, 'MBDK-CC', 6, 'Majlis Perbandaran Klang, Tkt 1 Dewan Hamzah, Kawasan 1', '3.044564', '101.444083', '41200', 72),
(135, 'C1', 7, 'Jalan PJU 5/11, Kota Damansara', '3.1527801', '101.5942652', '47810', 94),
(136, 'C2', 7, 'Jalan PJU 5/2, Kota Damansara', '3.151133333', '101.594175', '47810', 94),
(137, 'C3', 7, 'Jalan PJU 5/18,Kota Damansara', '3.153352778', '101.5925028', '47810', 94),
(138, 'C4', 7, 'Simpang 3 Jln PJS 6/2 dan Jln PJS 6/4', '3.076727778', '101.6156028', '47300', 44),
(139, 'C5', 7, 'Jalan Teknologi Sg Buloh 10A, Kota Damansara', '3.166397222', '101.56925', '47000', 94),
(140, 'C6', 7, 'Jalan SS 25/2 Stesen LRT', '3.113072222', '101.6058361', '47301', 41),
(141, 'C7', 7, 'Jalan SS 24/2, Kelana Jaya', '3.113069444', '101.6111111', '47300', 41),
(142, 'C8', 7, 'Jalan Bahagia', '3.106136111', '101.61', '47300', 44),
(143, 'C9', 7, 'Dewan Orang Ramai Desa Sepakat PJS 3', '3.074108333', '101.6418611', '58200', 55),
(144, 'C10', 7, 'Bulatan Othman', '3.093336111', '101.6465722', '46050', 55),
(145, 'C11', 7, 'Bulatan Templer', '3.087511111', '101.6525222', '46000', 55),
(146, 'C12', 7, 'Jalan 8/1E (Hadapan Bangunan MCIS)', '3.100563889', '101.6402889', '46050', 43),
(147, 'C13', 7, 'Jalan PJU 1/42', '3.1170764', '101.5937639', '47301', 41),
(148, 'C14', 7, 'Jalan 14/22', '3.111686111', '101.6339056', '46100', 43),
(149, 'C15', 7, 'Jalan PJU 10/1,  Damansara Damai', '3.197639', '101.59425', '47830', 94),
(150, 'C16', 7, 'Jalan PJU 1/45', '3.121688889', '101.5947389', '47301', 41),
(151, 'C17', 7, 'Sunway Emas Commercial Center', '3.120283333', '101.5975222', '47301', 41),
(152, 'C18', 7, 'Seksyen 17 – Jalan 17/1A', '3.119166667', '101.6327806', '46400', 43),
(153, 'C19', 7, 'Persiaran Tropicana', '3.1382537', '101.5949861', '47410', 94),
(154, 'C20', 7, 'Jalan Cempaka – Kg Kayu Ara', '3.131148', '101.6134453', '47400', 45),
(155, 'C21', 7, 'Jalan PJS 6/5C', '3.0797427', '101.6158015', '46000', 44),
(156, 'C22', 7, 'Flat Impian Baiduri, Baiduri', '3.0948196', '101.6219772', '46100', 44),
(157, 'C23', 7, 'Jalan SS 3/29', '3.0950597', '101.610953', '47300', 44),
(158, 'C24', 7, 'Jalan SS 3/39', '3.0887173', '101.6145431', '47300', 44),
(159, 'C25', 7, 'Jalan Teknologi 3/2', '3.158913889', '101.5708417', '47810', 94),
(160, 'C26', 7, 'Jalan Utara, Petaling Jaya', '3.1088876', '101.6405359', '46200', 43),
(161, 'C27', 7, 'Kondominium Palm Spring', '3.150575', '101.6008389', '47410', 45),
(162, 'C28', 7, 'Jalan PJU 5, Padang Kota Damansara', '3.151413889', '101.5908472', '47810', 94),
(163, 'C29', 7, 'Pelangi Square', '3.1542578', '101.6031764', '47810', 45),
(164, 'C30', 7, 'Kelana Park View', '3.101683333', '101.6002861', '47301', 41),
(165, 'C31', 7, 'Jalan SS4C/15', '3.1119844', '101.6030295', '47301', 41),
(166, 'C32', 7, 'Jalan 23/15, Taman Sea', '3.116961111', '101.6127861', '47400', 41),
(167, 'C33', 7, 'Jalan 52/4, New Town Center', '3.107788889', '101.6530722', '46000', 43),
(168, 'C34', 7, 'Jalan Besar, Taman Medan', '3.076666667', '101.6272389', '46150', 55),
(169, 'C35', 7, 'Simpang Jalan Klang, Taman Sri Manja', '3.080833333', '101.6466722', '46150', 55),
(170, 'C36', 7, 'Jalan Besar hadapan Sek. Taman Dato\' Harun', '3.0784122', '101.6356351', '46000', 55),
(171, 'C37', 7, 'Jalan SS 2/75 (Jalan SS 2/66), Petaling Jaya', '3.118619444', '101.6238889', '47300', 44),
(172, 'C38', 7, 'Hadapan SK Kg Tunku', '3.098613889', '101.6191917', '47300', 44),
(173, 'C39', 7, 'Jalan 19/8 -Jalan Harapan (Jalan SS2/55)', '3.11945', '101.6294444', '46300', 43),
(174, 'C40', 7, 'Persimpangan Jalan 21/19', '3.108630556', '101.6227944', '46300', 44),
(175, 'C41', 7, 'Jalan Tanjung Bandar Sri Damansara', '3.186952778', '101.6052944', '52200', 93),
(176, 'C42', 7, 'Jalan Cempaka Bandar Sri Damansara', '3.192511111', '101.6052917', '52200', 93),
(177, 'C43', 7, 'Jalan Dagang, Bandar Sri Damansara', '3.201394444', '101.6227944', '52200', 93),
(178, 'C44', 7, 'Persiaran Perdana, Bandar Sri Damansara, Sg Buloh', '3.188072222', '101.6152833', '52200', 93),
(179, 'C45', 7, 'Jalan SS20/10, Jalan Hospital Pakar Damansara', '3.135558333', '101.6291778', '47400', 45),
(180, 'C46', 7, 'Jalan PJU 8/5G, Damansara Perdana', '3.165855556', '101.6066806', '47820', 45),
(181, 'C47', 7, 'Jalan Teratai, PJU 6', '3.135758333', '101.6147556', '47400', 45),
(182, 'C48', 7, 'Jalan PJS 6/5F, Taman Desa Ria', '3.081127778', '101.6186139', '46000', 44),
(183, 'C49', 7, 'Jalan PJS 5/4, Taman Desa Ria', '3.081677778', '101.6202778', '46150', 44),
(184, 'C50', 7, 'Jalan Besar, Kg Lindungan Bulan, Jalan PJS 6/1', '3.081116667', '101.6153028', '46000', 44),
(185, 'C51', 7, 'Jalan PJS 3/23 Berhampiran Petronas', '3.074186111', '101.6377806', '46000', 41),
(186, 'C52', 7, 'Bulatan PJS 1, Jalan Petaling Utama', '3.079188889', '101.6525222', '46150', 41),
(187, 'C53', 7, 'Jalan Gasing (Simpang Esso-BHP)', '3.107783333', '101.6530722', '46000', 41),
(188, 'C54', 7, 'Simpang Jalan 5/8 dan Jalan Gasing', '3.099175', '101.6525083', '46000', 41),
(189, 'C55', 7, 'Jalan Sultan', '3.100013889', '101.6430556', '46050', 41),
(190, 'C56', 7, 'Jalan 17/50', '3.131311111', '101.6334917', '46400', 43),
(191, 'C57', 7, 'Jalan SS21/60', '3.133072222', '101.6244639', '47400', 41),
(192, 'C58', 7, 'Jalan 21/37', '3.137794444', '101.6230583', '47400', 41),
(193, 'C59', 7, 'Bulatan Jalan Tandang / Jalan Templer', '3.095561111', '101.6403028', '46050', 41),
(194, 'C60', 7, 'Jalan Othman', '3.086680556', '101.6480583', '46000', 41),
(195, 'IPDPJ-CC', 7, 'Ipd Petaling Jaya, Jalan Penchala, Seksyen 7, 46050 Petaling Jaya, Selangor', '3.098944', '101.641833', '46050', 41),
(196, 'MBPJ-CC', 7, 'Menara Mbpj, Jalan Tengah, Pj New Town, 46050 Petaling Jaya, Selangor', '3.099222', '101.644944', '46050', 41),
(197, 'C01', 8, 'Persiaran Masjid', '3.071569', '101.507394', '40000', 87),
(198, 'C02', 8, 'Persiaran Permai & Jln Plumbum', '3.065242', '101.488397', '40000', 87),
(199, 'C03', 8, 'Hadapan Restoran Ani Sup Utara, Jalan Plumbum Z 7/Z, Seksyen 7', '3.066083', '101.490514', '40000', 87),
(200, 'C04', 8, 'Giant Shah Alam, Seksyen 7', '3.067292', '101.486094', '40000', 87),
(201, 'C05', 8, 'Jalan Platinum 7/60, Taman Tasik Seksyen 7', '3.077778', '101.490989', '40000', 87),
(202, 'C06', 8, 'Jalan Tengku Ampuan Zabedah D 9/D', '3.084578', '101.521867', '40100', 87),
(203, 'C07', 8, 'Persimpangan Persiaran Kayangan & Persiaran Masjid', '3.083508', '101.523750', '40100', 87),
(204, 'C08', 8, 'Bulatan Kayangan', '3.074339', '101.533050', '40100', 87),
(205, 'C09', 8, 'Persiaran Sukan', '3.090892', '101.543050', '40100', 87),
(206, 'C10', 8, 'Jalan Lompat Pagar 13/37, Seksyen 13 Extreme Park', '3.086469', '101.542556', '40100', 87),
(207, 'C11', 8, 'Persiaran Sukan, TLK Stadium Shah Alam', '3.082017', '101.541731', '40100', 87),
(208, 'C12', 8, 'Persiaran Bandaraya, Dataran Kemerdekaan', '3.075833', '101.522394', '40000', 87),
(209, 'C13', 8, 'Persiaran Sultan, Dataran Shah Alam', '3.074161', '101.518633', '40200', 87),
(210, 'C14', 8, 'TLK Utama/Laluan Diraja, Masjid SSAAS', '3.079000', '101.519861', '40000', 89),
(211, 'C15', 8, 'Persiaran Perbandaran', '3.073006', '101.519758', '40000', 87),
(212, 'C16', 8, 'Persiaran Dato Menteri, Taman Tasik Shah Alam', '3.069639', '101.515119', '40000', 87),
(213, 'C17', 8, 'Persiaran Tasik (PKNS)', '3.069603', '101.518436', '40000', 87),
(214, 'C18', 8, 'Jalan Perbandaran', '3.070486', '101.517897', '40000', 87),
(215, 'C19', 8, 'Jalan Pelaburan, Stesen Bas Hentian Bandar', '3.072331', '101.521889', '40000', 87),
(216, 'C20', 8, 'Jalan Setia Prima A U13/A, Setia Alam Seksyen U13', '3.073536', '101.525386', '40000', 87),
(217, 'C21', 8, 'Persiaran Selangor, Dataran Otomobil Seksyen 15', '3.063264', '101.525042', '40000', 87),
(218, 'C22', 8, 'Jalan Niaga 16/3A (Pusat Komersial) Seksyen 16', '3.058686', '101.506697', '40200', 87),
(219, 'C23', 8, 'Persimpangan PUSPAKOM Seksyen 16', '3.058308', '101.490803', '41300', 36),
(220, 'C24', 8, 'Jalan Sungai Rasau, Seksyen 16', '3.058378', '101.482097', '41300', 87),
(221, 'C25', 8, 'Jalan Jenulung 17/21, Stesen Bas Ekspress Shah Alam, Seksyen 18', '3.047122', '101.504181', '40200', 35),
(222, 'C26', 8, 'Jalan Pinang 18/A, Seksyen 18', '3.043964', '101.517444', '40200', 87),
(223, 'C27', 8, 'Persimpangan Persiaran Jubli Perak 7 & Jalan Pinang 18/1 Seksyen 18', '3.043364', '101.518853', '40200', 36),
(224, 'C28', 8, 'Jalan Parang S 19/8, Stesen Komuter Shah Alam, Sskyen 19', '3.056003', '101.525519', '40300', 36),
(225, 'C29', 8, 'Jalan Singa 20/1, Seksyen 20', '3.057169', '101.542094', '40300', 36),
(226, 'C30', 8, 'Jalan Pelaburan B 23/13, Seksyen 23', '3.045539', '101.526081', '40300', 36),
(227, 'C31', 8, 'Persiaran Budiman, Seksyen 23', '3.034664', '101.534131', '40400', 36),
(228, 'C32', 8, 'Jalan Ijok 26/5, Seksyen 26', '3.037169', '101.551578', '40400', 36),
(229, 'C33', 8, 'Kawasan Perniagaan, Jalan Batu Belah 27/96, Seksyen 27', '3.014525', '101.560200', '40400', 58),
(230, 'C34', 8, 'Jalan Jenang 28/25, Taman Awam Seksyen 28, Alam Megah', '3.007778', '101.563889', '40400', 58),
(231, 'C35', 8, 'Persiaran Anggerik Vanilla, Kota Kemuning', '3.002794', '101.540264', '40460', 87),
(232, 'C36', 8, 'Jalan Peniaga U1/34', '3.082111', '101.560556', '40150', 87),
(233, 'C37', 8, 'Jalan Mesra 1, Taman Mesra', '3.078950', '101.558339', '40150', 89),
(234, 'C38', 8, 'Jalan Ilham U2/14 Taman TTDI Jaya', '3.099511', '101.555322', '40150', 89),
(235, 'C39', 8, 'Persimpangan Jalan Monfort & Jalan Sastera U2/1 Taman TTDI Jaya', '3.096189', '101.556231', '40150', 89),
(236, 'C40', 8, 'Jalan Dinar G U3/G Selsyen U3', '3.147711', '101.544775', '40150', 89),
(237, 'C41', 8, 'Taman Permainan Flat Subang Perdana, Jalan Dinar F U3/F', '3.150392', '101.544289', '40150', 89),
(238, 'C42', 8, 'Jalan Bulan BV U5/BV, Subang Murni', '3.160750', '101.548117', '40150', 89),
(239, 'C43', 8, 'Persiaran Atmosfera, Pejabat Tanah/Daerah Petaling)', '3.184364', '101.535139', '40150', 82),
(240, 'C44', 8, 'Jalan Bukit Badak, Kg Melayu Subang', '3.152639', '101.528922', '40150', 86),
(241, 'C45', 8, 'Jalan Subang Jasa 3, Pekan Subang', '3.143406', '101.536775', '40100', 86),
(242, 'C46', 8, 'Jalan Setia Prima A U13/A, Setia Alam Seksyen U13', '3.101167', '101.445467', '40170', 86),
(243, 'C47', 8, 'Persimpangan Persiaran Damai & Persiaran Perbandaran', '3.073536', '101.525386', '40000', 82),
(244, 'C48', 8, 'Jalan 1A/1, Bandar Baru Sg. Buloh', '3.211119', '101.564400', '47000', 87),
(245, 'C49', 8, 'Jalan Besar, Bandar Baru Sg. Buloh', '3.210411', '101.566611', '47000', 58),
(246, 'C50', 8, 'Persiaran Bukit Abdul Rahman Putra 1/2', '3.211625', '101.562447', '47000', 94),
(247, 'IPDSA-CC', 8, 'Ipd Shah Alam, Persiaran Damai, Seksyen 11, 40100 Shah Alam, Selangor', '3.086056', '101.520667', '40100', 87),
(248, 'MBSA-CC', 8, 'Tkt Bawah Majlis Bandaraya Shah Alam, Pesiaran Perbandaran, Seksyen 14, 40000 Shah Alam, Selangor', '3.073333', '101.519833', '40000', 87),
(249, 'C01', 9, 'Jalan Perdana 3/1, Jalan Kekwa 1', '3.007617', '101.606167', '47100', 33),
(250, 'C02', 9, 'Jalan PU 7/5', '2.990719', '101.614958', '47100', 33),
(251, 'C03', 9, 'Taman Mawar, simpang Jln TK 5/32A, Jln tk 5/1', '3.064850', '101.631917', '47190', 32),
(252, 'C04', 9, 'Jalan Indah 2/1', '3.011483', '101.605875', '47100', 33),
(253, 'C05', 9, 'Jalan SS 17/1A', '3.074103', '101.578894', '47500', 37),
(254, 'C06', 9, 'Jalan Puchong Batu 14', '2.996425', '101.621994', '47100', 33),
(255, 'C07', 9, 'Jalan Prima 5/1', '2.999619', '101.596264', '47100', 33),
(256, 'C08', 9, 'Jalan Prima 5/4, Jalan Prima 5/6', '2.999517', '101.594550', '47100', 33),
(257, 'C09', 9, 'Jalan Saujana Puchong 3/11', '2.989647', '101.639722', '47100', 33),
(258, 'C10', 9, 'Jalan Keluar Puchong Gateway Exchange LDP', '2.981269', '101.647644', '47110', 29),
(259, 'C11', 9, 'Jalan Puchong Permai 2', '3.009083', '101.599500', '47150', 33),
(260, 'C12', 9, 'Jalan SS 14/3', '3.070494', '101.589294', '47500', 37),
(261, 'C13', 9, 'Jalan SS 14/2', '3.065739', '101.592825', '47600', 37),
(262, 'C14', 9, 'Jalan BPU 2', '2.993800', '101.620933', '47100', 33),
(263, 'C15', 9, 'Jalan SS 17/1A, Jalan SS 17/1D', '3.077525', '101.579775', '47500', 37),
(264, 'C16', 9, 'Jalan SS 19/2', '3.065406', '101.577794', '47500', 37),
(265, 'C17', 9, 'Jalan Putra Mahkota 7/7c', '2.995050', '101.574417', '47650', 86),
(266, 'C18', 9, 'Persiaran Putra Indah', '2.990244', '101.571928', '47650', 86),
(267, 'C19', 9, 'Jalan Putra Indah 9/16', '2.993386', '101.561942', '47650', 86),
(268, 'C20', 9, 'Jalan Putra Indah 9/1D', '2.992000', '101.560272', '47650', 86),
(269, 'C21', 9, 'Jalan Putra Bestari 2/1', '3.013914', '101.577606', '47650', 86),
(270, 'C22', 9, 'Jalan PJS 9/30', '3.073781', '101.611028', '47500', 37),
(271, 'C23', 9, 'Jalan PJS 11/28b', '3.072550', '101.609053', '47500', 37),
(272, 'C24', 9, 'Jalan PJS 7/15', '3.067014', '101.616644', '47500', 37),
(273, 'C25', 9, 'Jalan PJS 11/2', '3.072666', '101.602319', '47500', 37),
(274, 'C26', 9, 'Jalan SS 15/5G', '3.078731', '101.592847', '47500', 37),
(275, 'C27', 9, 'Jalan Indah, Taman Universiti', '3.005581', '101.690678', '43300', 29),
(276, 'C28', 9, 'Jalan BS 3/1', '3.016172', '101.696558', '43300', 29),
(277, 'C29', 9, 'Jalan SK 6/1', '3.022483', '101.698839', '43300', 29),
(278, 'C30', 9, 'Jalan BS 11/14', '3.038800', '101.697728', '43300', 29),
(279, 'C31', 9, 'Jalan 18/23', '3.007411', '101.712797', '43300', 29),
(280, 'C32', 9, 'Persiaran Puncak Jalil, Jalan Puncak Bukit Jalil', '3.015772', '101.675342', '43300', 32),
(281, 'C33', 9, 'Jalan Utama, Jalan SR 7/3', '3.043056', '101.704608', '43300', 29),
(282, 'C34', 9, 'Jalan TK 1/1, Jalan Taman Kinrara', '3.063039', '101.647747', '47180', 32),
(283, 'C35', 9, 'Jalan TK 1/11a', '3.063033', '101.647739', '47180', 32),
(284, 'C36', 9, 'Persiaran Serdang Perdana', '3.031900', '101.708581', '43300', 29),
(285, 'C37', 9, 'Jalan Kinrara 6e', '3.033822', '101.664700', '47180', 32),
(286, 'C38', 9, 'Jalan TPK 2/2', '3.048981', '101.637497', '47100', 32),
(287, 'C39', 9, 'Jalan Bandar Puchong Jaya', '3.060664', '101.626272', '47100', 32),
(288, 'C40', 9, 'Jalan TK 1/11a', '3.065017', '101.649636', '47180', 32),
(289, 'C41', 9, 'Jalan PPK 4', '3.060594', '101.640494', '47190', 32),
(290, 'C42', 9, 'Lebuhraya Damansara-Puchong / Jalan Layang - layang', '3.039022', '101.618067', '47100', 32),
(291, 'C43', 9, 'Jalan Indah 2/18', '3.004508', '101.692403', '43300', 29),
(292, 'C44', 9, 'Jalan Besar', '3.018278', '101.703192', '43300', 29),
(293, 'C45', 9, 'Hadapan Bazar Rakyat, Jalan SK 6/1', '3.018722', '101.701853', '43300', 29),
(294, 'C46', 9, 'Jln Prima Tropika & Jln Putra Permai Selesa Round about', '2.982008', '101.668947', '43300', 29),
(295, 'C47', 9, 'Jalan Muhibbah', '3.023481', '101.713950', '43300', 29),
(296, 'C48', 9, 'Jalan SB Indah 1/19', '3.027169', '101.722706', '43300', 29),
(297, 'C49', 9, 'Jalan Kuda Emas', '3.028922', '101.719914', '43300', 29),
(298, 'C50', 9, 'Jalan Sungai Besi', '3.028878', '101.730611', '43300', 29),
(299, 'IPDS-CC', 9, 'Ipd Serdang, Lot 2464, Jalan Kinrara 6, Bandar Kinrara, 47180 Puchong, Selangor', '3.038611', '101.651806', '47180', 32),
(300, 'CC', 9, 'Majlis Perbandaran Subang Jaya, Persiaran Perpaduan, Usj 5, 47610 Subang Jaya, Selangor', '3.051722', '101.582194', '47610', 34),
(301, 'C01', 10, 'PERSIMPANGAN JALAN HADAPAN DATARAN, JALAN PERSEKUTUAN, 44000 KUALA KUBU BAHRU, SELANGOR', '3.556083', '101.642561', '44000', 100),
(302, 'C02', 10, 'PERSIMPANGAN LAMPU ISYARAT JALAN BUKIT KERAJAAN DGN JALAN AMPANG PECHAH, 44000 KUALA KUBU BAHRU, SELANGOR', '3.559508', '101.658550', '44000', 100),
(303, 'C03', 10, 'PERSIMPANGAN JALAN KUBU DGN JALAN PAHANG, 44000 KUALA KUBU BAHRU SELANGOR', '3.560317', '101.660000', '44000', 100),
(304, 'C04', 10, 'BERTENTANGAN AGRO BANK, JALAN KAMARUDDIN, 44000 KUALA KUBU BAHRU, SELANGOR', '3.564694', '101.659878', '44000', 100),
(305, 'C05', 10, 'BERTENTANGAN STESEN BAS, JALAN RASATHURAI, 44000 KUALA KUBU BAHRU, SELANGOR', '3.565803', '101.661056', '44000', 100),
(306, 'C06', 10, 'SIMPANG KE SEKOLAH KEBANGSAAN DGN JALAN JUTA UTAMA, 44000 KUALA KUBU BAHRU, SELANGOR', '3.567483', '101.659367', '44000', 100),
(307, 'C07', 10, 'PERSIMPANGAN JALAN PADANG TEMBAK DGN JALAN SURAU, 44000 KUALA KUBU BAHRU, SELANGOR', '3.568239', '101.662092', '44000', 100),
(308, 'C08', 10, 'PERSIMPANGAN JALAN AMPANG PECHAH DGN JALAN KAMPUNG SUNGAI DAMAR, 44000 KUALA KUBU BAHRU, SELANGOR', '3.553953', '101.659693', '44000', 100),
(309, 'MPHS-CC', 10, 'TKT BAWAH, MINI STADIUM, JLN PAHANG, 44000 KUALA KUBU BAHRU, SELANGOR', '3.560019', '101.658431', '44000', 100),
(310, 'IPD-CC', 10, 'BILIK SERVER TKT 1, IPD HULU SELANGOR, JALAN DATO TABAL, 44000 KUALA KUBU BAHRU, SELANGOR', '3.562528', '101.660417', '44000', 100),
(311, 'C1', 11, 'Tanjung Sepat, Banting', '2.659281', '101.565703', '42800', 90),
(312, 'C2', 11, 'Jalan Morib', '2.750381', '101.443167', '42700', 83),
(313, 'C3', 11, 'Hospital Banting', '2.804183', '101.492594', '42700', 85),
(314, 'C4', 11, 'Jalan Sultan Abdul Samad', '2.811947', '101.497308', '42700', 81),
(315, 'C5', 11, 'Jalan Beringin and Jalan Beringin 3 Junction', '2.814397', '101.503428', '42700', 81),
(316, 'C6', 11, 'Jalan Bunga Pekan', '2.812256', '101.502000', '42700', 81),
(317, 'C7', 11, 'Jalan Sultan Abdul Samad', '2.815069', '101.508981', '42700', 81),
(318, 'C8', 11, 'Jalan Persiaran Majlis', '2.813036', '101.507683', '42700', 81),
(319, 'C9', 11, 'Jalan Klang Banting', '2.877522', '101.498331', '42600', 81),
(320, 'C10', 11, 'Jalan Klang Banting', '2.910367', '101.470164', '42500', 81),
(321, 'IPDKL-CC', 11, 'Tkt 2, Ipd Kuala Langat, Jalan Morib, Kampung Sungai Raba, 42700 Banting, Selangor', '2.805308', '101.493905', '42700', 81),
(322, 'MPKL-CC', 11, 'Tkt 1, Majlis Daerah Kuala Langat, Penguatkuasa, Jalan Stadium Telok Datok, Telok Datok, 42700 Banting, Selangor (Sebelah Stadium Jugra)', '2.818338', '101.518962', '42700', 90),
(323, 'C01', 12, 'Simpang 3 (Jln Utama ke Medan 88)', '2.811197', '101.736933', '43900', 30),
(324, 'C02', 12, 'Taman Anggerik/BBST/Jln ST 1C/7', '2.811981', '101.738297', '43900', 30),
(325, 'C03', 12, 'CIMB Bank/Dewan BBST', '2.810172', '101.737700', '43900', 30),
(326, 'C04', 12, 'Kaunter Pandu Lalu MPSepang/Medan 20', '2.807644', '101.735336', '43900', 30),
(327, 'C05', 12, 'Simpang 4 (Jln Utama TPP)', '2.947914', '101.617114', '47100', 21),
(328, 'C06', 12, 'Jln Putra Perdana 5/2', '2.944681', '101.616944', '47100', 21),
(329, 'C07', 12, 'Alpha Arena', '2.946511', '101.612531', '47100', 21),
(330, 'C08', 12, 'Simpang 3 Sekolah', '2.943056', '101.620617', '47100', 21),
(331, 'C09', 12, 'Masjid PP/Jln Utama Apt Rista Villa', '2.944686', '101.610533', '47100', 21),
(332, 'C10', 12, 'Jln Putra Perdana 9A', '2.937672', '101.607717', '47100', 21),
(333, 'C11', 12, 'Simpang 3, Jalan Jasmin, Hospital Serdang', '2.975194', '101.718036', '43400', 29),
(334, 'C12', 12, 'Bulatan 5, Sg Merab / Teras Jernang / Desa Putra / BB Bangi', '2.922086', '101.746967', '43000', 48),
(335, 'C13', 12, 'Jln Bukit Puchong', '2.977892', '101.625403', '47100', 33),
(336, 'C14', 12, 'Simpang 3 Jln BO 14', '2.979511', '101.628492', '47100', 33),
(337, 'C15', 12, 'Jalan Utama Taman Mas – Taman Putra Prima', '2.976539', '101.582467', '47100', 33),
(338, 'C16', 12, 'Jalan Dagang Mas 1', '2.974558', '101.578331', '47100', 33),
(339, 'C17', 12, 'Simpang 4 Taman Mas/Tmn Putra Prima', '2.974328', '101.583164', '47100', 33),
(340, 'C18', 12, 'Jalan Industri Mas 5', '2.971878', '101.582097', '47100', 33),
(341, 'C19', 12, 'Kampung Sungai Merab', '2.908925', '101.730419', '43000', 48),
(342, 'C20', 12, 'Pusat Perniagaan Deluxe', '2.863625', '101.675775', '43800', 23),
(343, 'C21', 12, 'Jalan Kristal 1', '2.863703', '101.677650', '43800', 23),
(344, 'C22', 12, 'Pasar Awam Dengkil', '2.856283', '101.680756', '43800', 23),
(345, 'C23', 12, 'Simpang Jalan Ayer Hitam/ Jalan Besar, Sungai Merab', '2.942428', '101.750408', '43000', 48),
(346, 'C24', 12, 'Jln Permai/Tmn Sri Melor', '2.964044', '101.733458', '43000', 48),
(347, 'C25', 12, 'Kompleks Niaga, Jalan Sungai Merab', '2.938003', '101.752647', '43000', 48),
(348, 'C26', 12, 'Jalan Putra Perdana 2a (pasar/futsal)', '2.947411', '101.620150', '47100', 21),
(349, 'C27', 12, 'Persimpangan Traffic Light Tmn Putra Perdana-Pulau Meranti', '2.962919', '101.617436', '47100', 33),
(350, 'C28', 12, 'Simpang 4 (Tmn Aman Putra, Tmn Putra Perdana, Nusa Putra)', '2.937922', '101.618278', '47130', 21),
(351, 'C29', 12, 'Jalan Utama ke La Cottage', '2.946114', '101.601097', '47100', 21),
(352, 'C30', 12, 'Padang Permainan BP 10', '2.967694', '101.616375', '47100', 33),
(353, 'C31', 12, 'Padang Permainan BP 11', '2.970478', '101.620172', '47100', 33),
(354, 'C32', 12, 'Kompleks Islam BBST', '2.818422', '101.730353', '43900', 30),
(355, 'C33', 12, 'Simpang 3 Traffic Light Countdown BBST', '2.811100', '101.735114', '43900', 30),
(356, 'C34', 12, 'Jalan 7, Taman Ixora, Sepang', '2.815639', '101.734906', '43900', 30),
(357, 'C35', 12, 'Jalan Seroja Indah, Taman Seroja (sekolah)', '2.828053', '101.728706', '43900', 30),
(358, 'C36', 12, 'Simpang 3 Jenderam-BBST', '2.830706', '101.739875', '43900', 30),
(359, 'C37', 12, 'SK Kota Warisan', '2.825447', '101.704328', '43900', 30),
(360, 'C38', 12, 'Stesyen ERL', '2.824297', '101.712822', '43900', 30),
(361, 'C39', 12, 'Simpang 4 PLOKU-MPI', '2.942900', '101.747156', '43000', 48),
(362, 'C40', 12, 'Jalan Nilam (Hadapan CIMB)', '2.865192', '101.673839', '43800', 23),
(363, 'C41', 12, 'Padang Awam', '2.606819', '101.688125', '43950', 88),
(364, 'C42', 12, 'Pasar Sari Pekan Sg. Pelek', '2.644006', '101.718736', '43950', 88),
(365, 'C43', 12, 'Taman Permainan (Bagan Lalang)', '2.598789', '101.690833', '43950', 88),
(366, 'C44', 12, 'Simpang 3 Masjid Pekan Sg Pelek/Banghuris', '2.641350', '101.715439', '43950', 88),
(367, 'C45', 12, 'Stadium Perbandaran BBST', '2.820831', '101.725531', '43900', 30),
(368, 'C46', 12, 'Taman Permata (Apartment)', '2.863336', '101.681444', '43800', 23),
(369, 'C47', 12, 'Jalan Utama Pusat Perniagaan Cyber Valley', '2.879931', '101.665475', '43800', 23),
(370, 'C48', 12, 'Jalan Air Hitam', '2.870686', '101.670503', '43800', 23),
(371, 'C49', 12, 'Masjid Pekan Dengkil', '2.858914', '101.678825', '43800', 23),
(372, 'C50', 12, 'Tapak Pasar Malam Pekan Salak', '2.780650', '101.749450', '43900', 30),
(373, 'IPDSPG-CC', 12, 'Tkt 2 Ipd Sepang, Bandar Baru Salak Tinggi, 43900 Sepang, Selangor', '2.805444', '101.740556', '43900', 30),
(374, 'MPSPG-CC', 12, 'Tkt Bawah, Majlis Perbandaran Sepang, Persiaran Semarak Api, Cyber 1, 63000 Cyberjaya, Selangor', '2.933944', '101.6455', '63000', 21),
(375, 'C01', 13, 'KAWASAN ARKED', '2.990472', '101.787922', '43000', 51),
(376, 'C02', 13, 'BERDEKATAN HOTEL KAJANG/CITYLINK', '2.992206', '101.786219', '43000', 51),
(377, 'C03', 13, 'BERDEKATAN METRO POINT', '2.992103', '101.793833', '43000', 51),
(378, 'C04', 13, 'BERDEKATAN DGN MCDONALD/TABUNG HAJI', '2.953458', '101.758342', '43650', 48),
(379, 'C05', 13, 'PINTU MASUK UTAMA MPKJ', '2.995400', '101.789056', '43000', 51),
(380, 'C06', 13, 'HADAPAN SJK YU HWA KAJANG /ICE ROOM', '2.995361', '101.790431', '43000', 51),
(381, 'C07', 13, 'SEBELAH COMMAND CENTRE', '2.994481', '101.789822', '43000', 51),
(382, 'C08', 13, 'Seberang Jalan KPMC /Simpang Stadium Kajang', '2.995767', '101.787472', '43000', 51),
(383, 'C09', 13, 'TEMPAT LETAK KERETA BERHAMPIRAN CITI BANK/RHB EASY KIOSK', '3.046597', '101.758956', '43200', 119),
(384, 'C10', 13, 'HADAPAN MAYBAN/SUZUKI', '2.982214', '101.817061', '43000', 51),
(385, 'C11', 13, 'BERHAMPIRAN CONVENT KAJANG', '2.988769', '101.790139', '43000', 51),
(386, 'C12', 13, 'Lampu isyarat Jln Masuk utama bkt mahkota cheras', '3.051756', '101.775389', '43200', 119),
(387, 'C13', 13, 'BERDEKATAN DGN CIMB/KEDAI MOTOR', '2.984356', '101.779614', '43000', 51),
(388, 'C14', 13, 'BELAKANG MYDIN', '2.990819', '101.793503', '43000', 51),
(389, 'C15', 13, 'Kuil jalansri jambu/ Tabung Haji', '2.992314', '101.783411', '43000', 51),
(390, 'C16', 13, 'DIANTARA Parking STADIUM KAJANG', '2.993753', '101.786614', '43000', 51),
(391, 'C17', 13, 'PADANG PERMAINAN SUNGAI KANTAN', '3.002056', '101.789806', '43000', 51),
(392, 'C18', 13, 'BERDEKATAN STANDARD CHARTED', '3.006222', '101.805358', '43000', 51),
(393, 'C19', 13, 'HADAPAN MAYBANK SEMENYIH', '2.947797', '101.846753', '43500', 52),
(394, 'C20', 13, 'BERDEKATAN PASAR SEMENYIH', '2.945347', '101.846342', '43500', 52),
(395, 'C21', 13, 'Jalan Semenyih central 3 BERDEKATAN HENTIAN BAS/TEKSI', '2.944936', '101.842681', '43500', 52),
(396, 'C22', 13, 'BERDEKATAN EON BANK, semenyih central 1', '2.945547', '101.844492', '43500', 52),
(397, 'C23', 13, 'BERDEKATAN DEWAN KOMUNITI/SURAU, jalan 7/1d', '2.967453', '101.776314', '43650', 48),
(398, 'C24', 13, 'Stor MPKJ', '2.966325', '101.787850', '43000', 51),
(399, 'C25', 13, 'BERDEKATAN KOMPLEKS HENTIAN, Jln Hentian 1', '2.956908', '101.791297', '43000', 51),
(400, 'C26', 13, 'BERDEKATAN KOMPLEKS HENTIAN, Jln Hentian 2', '2.957639', '101.792169', '43000', 51),
(401, 'C27', 13, 'STESYEN KOMUTER UKM BANGI', '2.940147', '101.786814', '43000', 48),
(402, 'C28', 13, 'SEKOLAH AGAMA/MAYBANK/AMBANK', '2.942922', '101.764161', '43650', 48),
(403, 'C29', 13, 'PETRONAS/7E/KEDAI TAYAR', '2.934353', '101.767769', '43650', 48),
(404, 'C30', 13, 'PEJABAT POS/MAYBANK/BSN', '2.944178', '101.764458', '43650', 48),
(405, 'C31', 13, 'RESTORAN HASAN CAFÉ/CASTROL', '2.963633', '101.755108', '43650', 48),
(406, 'C32', 13, 'DIANTARA KLINIK AZ-ZAHRAH DAN AL IKHSAN/BERDEKATAN MASJID', '2.959692', '101.752689', '43650', 48),
(407, 'C33', 13, 'BERHAMPIRAN PASAR RAYA WARTA/SIMPANG LAMPU ISYARAT', '2.952792', '101.756808', '43650', 48),
(408, 'C34', 13, 'TENGAH-TENGAH TASIK-BULATAN (SKATE BOARD)', '2.958722', '101.757917', '43650', 48),
(409, 'C35', 13, 'Plaza PKNS/ BERHAMPIRAN MCDONALD', '2.962267', '101.756903', '43650', 48),
(410, 'C36', 13, 'BERHAMPIRAN TANDAS AWAM 2', '2.961083', '101.760353', '43650', 48),
(411, 'C37', 13, 'HADAPAN MAYBANK', '3.033606', '101.766922', '43200', 119),
(412, 'C38', 13, 'HADAPAN CIMB/AMBANK/RHB/BSN', '3.043014', '101.772347', '43200', 119),
(413, 'C39', 13, 'KAWASAN PERNIAGAAN PLAZA KASTURI', '3.038081', '101.768900', '43200', 119),
(414, 'C40', 13, 'BERDEKATAN DGN UNITAR/APPARTMENT/EON BANK', '3.041692', '101.792856', '43200', 121),
(415, 'C41', 13, 'PASAR Sg Chua', '2.984233', '101.776669', '43000', 51),
(416, 'C42', 13, 'BERHAMPIRAN PENCAWANG TNB ECONSAVE, jln suakasih', '3.032931', '101.762800', '43200', 119),
(417, 'C43', 13, '7E/Taman Suntex', '3.071881', '101.766100', '43200', 119),
(418, 'C44', 13, 'BSN/RHB/ABSOLUTE SALOON, tmn suntex', '3.072469', '101.765969', '43200', 119),
(419, 'C45', 13, 'KAWASAN KEDAI RESTORAN ABC/HLK/PERABOT SL', '3.054728', '101.750331', '43200', 7),
(420, 'C46', 13, 'CIMB/PUBLIC BANK/PETRONAS/OLDTOWN', '3.025378', '101.740353', '43300', 49),
(421, 'C47', 13, 'DIPERSIMPANGAN LAMPU ISYARAT, Satay Hj Samuri', '2.993422', '101.787506', '43000', 51),
(422, 'C48', 13, 'BERDEKATAN BHP PETROL/PLAZA WANNIE/4D', '2.990631', '101.780650', '43000', 51),
(423, 'C49', 13, 'Pintu masuk Unikeb', '2.927019', '101.773569', '43600', 48),
(424, 'C50', 13, 'BERHAMPIRAN MAYBANK/YAMAHA/PETRONAS', '3.053778', '101.744264', '43200', 7),
(425, 'C51', 13, 'JALAN UTAMA KEM PGA/KEDAI TAYAR', '3.078103', '101.763461', '43200', 119),
(426, 'C52', 13, 'PERSIMPANGAN ANTARA BANDAR BUKIT MAHKOTA DAN BANDAR SERI PUTRA', '2.885114', '101.791872', '43000', 48),
(427, 'C53', 13, 'BERDEKATAN MASJID BATU 14', '3.112825', '101.815744', '43100', 123),
(428, 'C54', 13, 'SIMPANG MASUK SILK/Jln Reko', '2.977789', '101.789636', '43000', 51),
(429, 'C55', 13, 'Simpang Taman Tasik Semenyih', '2.945739', '101.864583', '43500', 52),
(430, 'C56', 13, 'Persimpangan Jalan Kemajuan/RHB/Bank Mualat', '2.959233', '101.754819', '43650', 48),
(431, 'C57', 13, 'SUSUR LEBUHRAYA KASEH-LEBUHRAYA SILK (SUNGAI LONG) Jln 3/20', '2.977389', '101.826308', '43500', 121),
(432, 'C58', 13, 'SHELL/KLINIK KESIHATAN', '2.977217', '101.790883', '43000', 51),
(433, 'C59', 13, '99 MART, JALAN TAN MING 1', '3.024106', '101.731419', '43300', 29),
(434, 'C60', 13, 'RESTORAN JAMEK MAJU/WISMA MINLON', '3.008933', '101.724361', '43300', 29),
(435, 'IPDKJ-CC', 13, 'Tkt Bawah, Ipd Kajang, Jalan Cheras, Bandar Kajang, 43000 Kajang, Selangor', '2.993528', '101.788222', '43000', 51),
(436, 'MPKJ-CC', 13, 'Bilik Server, Bangunan Bersebelahan, Majlis Perbandaran Kajang, Jalan Semenyih, Bandar Kajang, 43000 Kajang, Selangor', '2.994472', '101.789667', '43000', 51);

-- --------------------------------------------------------

--
-- Table structure for table `asset_4`
--

CREATE TABLE `asset_4` (
  `assetID` int(11) NOT NULL,
  `assetNo` varchar(25) NOT NULL,
  `pbtID` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `coordiNorth` varchar(100) DEFAULT NULL,
  `coordiEast` varchar(100) DEFAULT NULL,
  `postcode` varchar(5) DEFAULT NULL,
  `nodeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `asset_4`
--

INSERT INTO `asset_4` (`assetID`, `assetNo`, `pbtID`, `address`, `coordiNorth`, `coordiEast`, `postcode`, `nodeID`) VALUES
(1, 'PPJ ANNEXE 1', NULL, NULL, '2.918073', '101.684562', NULL, NULL),
(2, 'PPJ ANNEXE 2', NULL, NULL, '2.916702', '101.684274', NULL, NULL),
(3, 'PUJ-P1-02', NULL, NULL, '2.958174', '101.688444', NULL, NULL),
(4, 'PUJ-P1-04', NULL, NULL, '2.89377', '101.68866', NULL, NULL),
(5, 'PUJ-P1-05', NULL, NULL, '2.8853827', '101.6724746', NULL, NULL),
(6, 'SKMM-P2-19', NULL, NULL, '2.90721', '101.68153', NULL, NULL),
(7, 'SKMM-P2-20', NULL, NULL, '2.89861', '101.67033', NULL, NULL),
(8, 'SKMM-P2-22', NULL, NULL, '2.90044', '101.66702', NULL, NULL),
(9, 'SKMM-P2-24', NULL, NULL, '2.93054', '101.6693', NULL, NULL),
(10, 'SKMM-P2-26', NULL, NULL, '2.95327', '101.68756', NULL, NULL),
(11, 'SKMM-P2-32', NULL, NULL, '2.9310857', '101.700966', NULL, NULL),
(12, 'SKMM-P2-33', NULL, NULL, '2.91615', '101.69363', NULL, NULL),
(13, 'SKMM-P2-35', NULL, NULL, '2.89233', '101.67684', NULL, NULL),
(14, 'PUJ-P1-03', NULL, NULL, '2.927989', '101.699268', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `asset_5`
--

CREATE TABLE `asset_5` (
  `assetID` int(11) NOT NULL,
  `assetNo` varchar(25) DEFAULT NULL,
  `pbtID` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `coordiEast` varchar(100) DEFAULT NULL,
  `coordiNorth` varchar(100) DEFAULT NULL,
  `postcode` varchar(5) DEFAULT NULL,
  `nodeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `asset_5`
--

INSERT INTO `asset_5` (`assetID`, `assetNo`, `pbtID`, `address`, `coordiEast`, `coordiNorth`, `postcode`, `nodeID`) VALUES
(1, 'Bota Kanan', 1, 'None', '100.882311', '4.349989838', 'None', NULL),
(2, 'CBJ2', NULL, NULL, '101.641495', '2.920604107', NULL, NULL),
(3, 'SKDL Mersing', 1, 'None', '103.898706', '2.363391943', 'None', NULL),
(4, 'SKDL Pengkalan Balak', 1, 'None', '102.070035', '2.323869532', 'None', NULL),
(5, 'SKDL Tg Aru', 1, 'None', '116.045500', '5.949770353', 'None', NULL),
(6, 'Stesen Bukit Lendu', 1, 'None', '102.158180', '2.339675', 'None', NULL),
(7, 'TM Alor Akar', 1, 'None', '103.336325', '3.828946833', 'None', NULL),
(8, 'TM Alor Setar', 1, 'None', '100.370627', '6.119290247', 'None', NULL),
(9, 'TM Alor Setar Selatan', 1, 'None', '100.361361', '6.084269729', 'None', NULL),
(10, 'TM Andalas', 1, 'None', '101.434195', '3.014129299', 'None', NULL),
(11, 'TM Arau', NULL, NULL, '100.273232', '6.422766127', NULL, NULL),
(12, 'TM Bahau', 1, 'None', '102.398931', '2.811796614', 'None', NULL),
(13, 'TM Batu Gajah', 1, 'None', '101.040719', '4.472273486', 'None', NULL),
(14, 'TM Bayan Baru', 1, 'None', '100.281283', '5.320133131', 'None', NULL),
(15, 'TM Bukit Beruang', 1, 'None', '102.283255', '2.243875', 'None', NULL),
(16, 'TM Bukit Beruntung', 1, 'None', '101.563230', '3.420723359', 'None', NULL),
(17, 'TM Bukit Besi', 1, 'None', '101.729427', '3.070113171', 'None', NULL),
(18, 'TM Bukit Gantang', 1, 'None', '100.742990', '4.778869684', 'None', NULL),
(19, 'TM Bukit Gun', 1, 'None', '101.940379', '2.712123461', 'None', NULL),
(20, 'TM Bukit Raja', 1, 'None', '101.451240', '3.06833071', 'None', NULL),
(21, 'TM Bukit Timbalan', 1, 'None', '103.761289', '1.460161517', 'None', NULL),
(22, 'TM Butterworth', 1, 'None', '100.371631', '5.410339495', 'None', NULL),
(23, 'TM Cameron', 1, 'None', '101.379130', '4.482672479', 'None', NULL),
(24, 'TM Chemor', 1, 'None', '101.121059', '4.720688148', 'None', NULL),
(25, 'TM Chukai', 1, 'None', '103.405178', '4.243247492', 'None', NULL),
(26, 'TM Dato Onn Jaafar', 1, 'None', '101.082367', '4.59512406', 'None', NULL),
(27, 'TM Desa Cemerlang', 1, 'None', '103.813766', '1.5710332', 'None', NULL),
(28, 'TM Dungun', 1, 'None', '103.405422', '4.756756875', 'None', NULL),
(29, 'TM Enggor', 1, 'None', '100.966014', '4.835619268', 'None', NULL),
(30, 'TM Exchange Banting', 1, 'None', '101.502777', '2.807895982', 'None', NULL),
(31, 'TM Exchange Rawang', 1, 'None', '101.578635', '3.322078171', 'None', NULL),
(32, 'TM Exchange Subang Jaya', 1, 'None', '101.594803', '3.069615318', 'None', NULL),
(33, 'TM Gelugor', 1, 'None', '100.306608', '5.370458547', 'None', NULL),
(34, 'TM Gerik', 1, 'None', '101.128435', '5.431480725', 'None', NULL),
(35, 'TM Gong Badak', 1, 'None', '103.091112', '5.361277923', 'None', NULL),
(36, 'TM Hiliran', 1, 'None', '103.135676', '5.313936001', 'None', NULL),
(37, 'TM Hutang Melintang', 1, 'None', '100.938023', '3.896323299', 'None', NULL),
(38, 'TM Jerteh', 1, 'None', '102.494898', '5.733413641', 'None', NULL),
(39, 'TM Kangar', 1, 'None', '100.206684', '6.451752962', 'None', NULL),
(40, 'TM Klang', 1, 'None', '101.450104', '3.040343088', 'None', NULL),
(41, 'TM Kota Bharu', 1, 'None', '102.239903', '6.127778013', 'None', NULL),
(42, 'TM Kota Kinabalu', 1, 'None', '116.070761', '5.963006926', 'None', NULL),
(43, 'TM Kuah', 1, 'None', '99.8518769', '6.327662552', 'None', NULL),
(44, 'TM Kuala Berang', 1, 'None', '103.035225', '5.073225466', 'None', NULL),
(45, 'TM Kuala Kangsar', 1, 'None', '100.941460', '4.775680925', 'None', NULL),
(46, 'TM Kuala Pilah', 1, 'None', '102.249394', '2.744765337', 'None', NULL),
(47, 'TM Kuala Selangor', NULL, NULL, '101.261763', '3.322570046', NULL, NULL),
(48, 'TM Kuching', 1, 'None', '110.341484', '1.552366033', 'None', NULL),
(49, 'TM Kulai', 1, 'None', '103.608374', '1.656642228', 'None', NULL),
(50, 'TM Kulim', 1, 'None', '100.554360', '5.367979714', 'None', NULL),
(51, 'TM Macang Bubok', 1, 'None', '100.502686', '5.342191186', 'None', NULL),
(52, 'TM Maluri Kepong', 1, 'None', '101.634875', '3.191892485', 'None', NULL),
(53, 'TM Melor Kelantan', NULL, NULL, '102.2929', '5.963871002', NULL, NULL),
(54, 'TM Menglembu', 1, 'None', '101.060085', '4.576373996', 'None', NULL),
(55, 'TM Padang Rengas', 1, 'None', '100.849705', '4.770591595', 'None', NULL),
(56, 'TM Pandan', 1, 'None', '103.787094', '1.539789317', 'None', NULL),
(57, 'TM Parit Buntar', NULL, NULL, '100.489367', '5.132323256', NULL, NULL),
(58, 'TM Pasir Gudang', 1, 'None', '103.891541', '1.462627763', 'None', NULL),
(59, 'TM Pasir Panjang', 1, 'None', '101.936547', '2.428000915', 'None', NULL),
(60, 'TM Pasir Putih 1', 1, 'None', '101.074358', '4.553114877', 'None', NULL),
(61, 'TM Pasir Putih 2', 1, 'None', '102.401522', '5.836739967', 'None', NULL),
(62, 'TM Pelangi', NULL, NULL, '103.770374', '1.490735909', NULL, NULL),
(63, 'TM Permatang Pauh', 1, 'None', '100.404794', '5.425883782', 'None', NULL),
(64, 'TM Port Klang', 1, 'None', '101.395146', '3.002816145', 'None', NULL),
(65, 'TM Pulau Pangkor', 1, 'None', '100.574444', '4.212830551', 'None', NULL),
(66, 'TM Pusing', NULL, NULL, '101.009926', '4.495231773', NULL, NULL),
(67, 'TM Rasah Jaya', 1, 'None', '101.946514', '2.682452669', 'None', NULL),
(68, 'TM Raub', NULL, NULL, '101.857819', '3.793998296', NULL, NULL),
(69, 'TM Segamat', 1, 'None', '102.814089', '2.513637742', 'None', NULL),
(70, 'TM Seremban 2', 1, 'None', '101.914988', '2.699623978', 'None', NULL),
(71, 'TM Seri Iskandar', 1, 'None', '100.959971', '4.366390231', 'None', NULL),
(72, 'TM Seri Manjung', 1, 'None', '100.664517', '4.197342446', 'None', NULL),
(73, 'TM Setapak', 1, 'None', '101.706377', '3.183973168', 'None', NULL),
(74, 'TM Sg Buloh', 1, 'None', '101.561568', '3.204723934', 'None', NULL),
(75, 'TM Simpang Ampat', 1, 'None', '100.477457', '5.27713342', 'None', NULL),
(76, 'TM Simpang Baru', 1, 'None', '100.698976', '4.835947099', 'None', NULL),
(77, 'TM Simpang Renggam', 1, 'None', '103.310959', '1.82670225', 'None', NULL),
(78, 'TM Sitiawan', 1, 'None', '100.697958', '4.217322715', 'None', NULL),
(79, 'TM Slim River', 1, 'None', '101.402938', '3.832804011', 'None', NULL),
(80, 'TM Sri Gombak', 1, 'None', '101.701338', '3.240350422', 'None', NULL),
(81, 'TM Sri Lalang', 1, 'None', '103.256235', '1.990087225', 'None', NULL),
(82, 'TM Stesen Bukit Asa', 1, 'None', '101.502715', '3.682821092', 'None', NULL),
(83, 'TM Sungai Petani', 1, 'None', '100.486235', '5.640992505', 'None', NULL),
(84, 'TM Sungai Relong YTC', 1, 'None', '100.721373', '4.915651608', 'None', NULL),
(85, 'TM Sungai Renggam', 1, 'None', '101.514239', '3.049297769', 'None', NULL),
(86, 'TM Taiping', 1, 'None', '100.742405', '4.855172856', 'None', NULL),
(87, 'TM Taman Perling', NULL, NULL, '103.679444', '1.494566107', NULL, NULL),
(88, 'TM Taman Universiti', 1, 'None', '103.627723', '1.538106825', 'None', NULL),
(89, 'TM Tanjung Piandang', 1, 'None', '100.385477', '5.072757481', 'None', NULL),
(90, 'TM Tanjung Tualang', 1, 'None', '101.054453', '4.32502904', 'None', NULL),
(91, 'TM Tapah', 1, 'None', '101.257448', '4.198224291', 'None', NULL),
(92, 'TM TAR', 1, 'None', '101.695916', '3.159647622', 'None', NULL),
(93, 'TM Tasek', 1, 'None', '101.115974', '4.61570776', 'None', NULL),
(94, 'TM Tasek Gelugor', 1, 'None', '100.493556', '5.481887232', 'None', NULL),
(95, 'TM Teluk Intan', 1, 'None', '101.024571', '4.0206468', 'None', NULL),
(96, 'TM Temerloh', 1, 'None', '102.412511', '3.447649301', 'None', NULL),
(97, 'TM Teruntum Baru', 1, 'None', '103.318414', '3.797254489', 'None', NULL),
(98, 'TM Teruntum Lama', 1, 'None', '103.318835', '3.797517023', 'None', NULL),
(99, 'TM Wakaf Baru', 1, 'None', '102.212695', '6.120574077', 'None', NULL),
(100, 'TM Wisma Ipoh', NULL, NULL, '101.079772', '4.598257228', NULL, NULL),
(101, 'Wisma TM Pelangi', 1, 'None', '103.770585', '1.490770345', 'None', NULL),
(102, 'Stesen Gelombang Mikro & ', 1, 'None', '100.433512', '5.7863233', 'None', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `asset_6`
--

CREATE TABLE `asset_6` (
  `assetID` int(11) NOT NULL,
  `assetNo` varchar(25) DEFAULT NULL,
  `pbtID` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `coordiNorth` varchar(100) DEFAULT NULL,
  `coordiEast` varchar(100) DEFAULT NULL,
  `postcode` varchar(5) DEFAULT NULL,
  `nodeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `asset_6`
--

INSERT INTO `asset_6` (`assetID`, `assetNo`, `pbtID`, `address`, `coordiNorth`, `coordiEast`, `postcode`, `nodeID`) VALUES
(1, 'C01', NULL, NULL, '3.019138889', '101.6063333', NULL, NULL),
(2, 'C02', NULL, NULL, '2.986972222', '101.6724722', NULL, NULL),
(3, 'C03', NULL, NULL, '3.063972222', '101.64725', NULL, NULL),
(4, 'C04', NULL, NULL, '2.981510', '101.5827222', NULL, NULL),
(5, 'C05', NULL, NULL, '2.981055556', '101.6431667', NULL, NULL),
(6, 'C06', NULL, NULL, '3.030972222', '101.6906389', NULL, NULL),
(7, 'C07', NULL, NULL, '2.981736', '101.654248', NULL, NULL),
(8, 'C08', NULL, NULL, '3.030305556', '101.6115278', NULL, NULL),
(9, 'C09', NULL, NULL, '2.987055556', '101.5818611', NULL, NULL),
(10, 'C10', NULL, NULL, '2.992510', '101.5588611', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ifes`
--

CREATE TABLE `ifes` (
  `ifesID` int(11) NOT NULL,
  `ifesName` varchar(100) DEFAULT NULL,
  `ifesEmail` varchar(100) DEFAULT NULL,
  `wilayahID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ifes`
--

INSERT INTO `ifes` (`ifesID`, `ifesName`, `ifesEmail`, `wilayahID`) VALUES
(1, 'Mohd Faiq Bin Md Ruday', 'mohdfaiq.mdruday@tm.com.my', 4),
(2, 'Muhammad Uwais Bin Mohd Ghazali', 'uwais.ghazali@tm.com.my', 4),
(3, 'Muhamad Aslam Bin Mohd Salim', 'aslam.salim@tm.com.my', 3),
(4, 'Hafizuddin Bin Samsudin', 'hafizuddin.samsudin@tm.com.my', 9),
(5, 'Muhammad Hakim Bin Mohd Naaim', 'hakim.naaim@tm.com.my', 5),
(6, 'Mohd Suhaizul Bin Subari', 'suhaizul.subari@tm.com.my', 8),
(7, 'Muhammad Redzuan Bin Mat Radzi', 'redzuan.radzi@tm.com.my', 8),
(8, 'Shaiful Nizam Bin Abdul Khadir', 'shaifulnizam.khadir@tm.com.my', 8),
(9, 'Nur Adly Bin Nordin', 'nuradly.nordin@tm.com.my', 7),
(10, 'Mohamad Noorfakar Bin Mohamad Fuad', 'noorfakar.fuad@tm.com.my', 7),
(11, 'Khoirul Shapik Bin Kassim', 'khoirul.kassim@tm.com.my', 6);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `memberID` int(11) NOT NULL,
  `memberEmail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`memberID`, `memberEmail`) VALUES
(1, 'ssoc@tm.com.my'),
(2, 'nooraswad.nawi@tm.com.my'),
(3, 'khairudin.kadir@tm.com.my'),
(4, 'zakwan.jamil@tm.com.my'),
(5, 'zaidi.ali@tm.com.my'),
(6, 'aminuddin.yusoff@tm.com.my'),
(7, 'azahaari.ansan@tm.com.my'),
(8, 'haizat.amran@tm.com.my'),
(9, 'yusoffi@tm.com.my'),
(10, 'mkhira@tm.com.my'),
(11, 'hafizahhassan@tm.com.my'),
(12, 'aizan.saleh@tm.com.my'),
(13, 'zahart@tm.com.my'),
(14, 'zuhaidi@tm.com.my'),
(15, 'mohdazrin.hamzah@tm.com.my'),
(16, 'ifes_exn@tm.com.my'),
(17, 'dccnoc@tm.com.my'),
(18, 'noorhezram.noor@tm.com.my'),
(19, 'irwady.abdillah@tm.com.my'),
(20, 'nasrul.rashid@tm.com.my'),
(21, 'nurulasyikin@tm.com.my'),
(22, 'wannurfaeeza@tm.com.my'),
(23, 'mohdfaizal.abdhamid@tm.com.my'),
(24, 'syahir.omar@tm.com.my'),
(25, 'adie@tm.com.my'),
(26, 'zulhish@tm.com.my'),
(27, 'unaydey.umardani@tm.com.my'),
(28, 'fadhli.omar@tm.com.my'),
(29, 'khuzaizee@tm.com.my'),
(30, 'azhar.muhamad@tm.com.my'),
(31, 'yusran.bahari@tm.com.my'),
(32, 'ahmad.nizam@tm.com.my'),
(33, 'mrasul.puzi@tm.com.my'),
(34, 'mohd.anuar@tm.com.my'),
(35, 'noorhezram.noor@tm.com.my');

-- --------------------------------------------------------

--
-- Table structure for table `node`
--

CREATE TABLE `node` (
  `nodeID` int(11) NOT NULL,
  `nodeCode` varchar(255) DEFAULT NULL,
  `nodeName` varchar(255) DEFAULT NULL,
  `zoneID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `node`
--

INSERT INTO `node` (`nodeID`, `nodeCode`, `nodeName`, `zoneID`) VALUES
(1, 'BNR', 'Bangsar', 1),
(2, 'BRF', 'Brickfields', 1),
(3, 'DM', 'Damansara', 1),
(4, 'JRC', 'Jalan Raja Chulan', 1),
(5, 'KLC', 'KL Central', 1),
(6, 'MTM', 'Menara TM', 1),
(7, 'BAK', 'Bukit Anggerik', 2),
(8, 'BRK', 'Bandar Tun Razak', 2),
(9, 'MDH', 'Midah', 2),
(10, 'ATN', '', 3),
(11, 'BIN', 'Bintang', 3),
(12, 'MRI', 'Maluri', 3),
(13, 'PAN', 'Pandan', 3),
(14, 'PEG', 'Pekeliling', 3),
(15, 'SPE', 'San Peng', 3),
(16, 'DTA', 'Duta', 4),
(17, 'SMK', 'Semarak', 4),
(18, 'STL', 'Sentul', 4),
(19, 'TAR', 'Tuanku Abdul Rahman', 4),
(20, 'CBJ', 'Cyberjaya', 5),
(21, 'CBJ2', 'Cyberjaya 2', 5),
(22, 'CBJ5', 'Cyberjaya 5', 5),
(23, 'DK', 'Dengkil', 5),
(24, 'KLIA', 'KLIA', 5),
(25, 'LPS', 'KLIA Sepang', 5),
(26, 'MYL', 'MY LOCA', 5),
(27, 'PUJ', 'Putrajaya', 5),
(28, 'PUJ1', 'Putrajaya 1', 5),
(29, 'SDG', 'Serdang', 5),
(30, 'SKT', 'Salak Tinggi', 5),
(31, 'BJL', 'Bukit Jalil', 6),
(32, 'KIN', 'Kinrara', 6),
(33, 'PCG', 'Puchong', 6),
(34, 'USJ', 'UEP Subang Jaya', 6),
(35, 'BUG', 'Bukit Glenmarie', 7),
(36, 'LTS', 'Lapangan Terbang Subang', 7),
(37, 'SBJ', 'Subang Jaya', 7),
(38, 'BGS', 'Bukit Gasing', 8),
(39, 'BJN', 'Bukit Lanjan', 8),
(40, 'CSA', 'Wisma CSA', 8),
(41, 'KLJ', 'Kelana Jaya', 8),
(42, 'PETALING JAYAC', 'Petaling Jaya Central', 8),
(43, 'PJC', 'Petaling Jaya Central', 8),
(44, 'SWY', 'Sungai Way', 8),
(45, 'TDI', 'TTDI', 8),
(46, 'BDC', 'Bangi DC', 9),
(47, 'BGA', 'Broga', 9),
(48, 'BGI', 'Bangi', 9),
(49, 'BKO', 'Balakong', 9),
(50, 'BRG', 'Beranang', 9),
(51, 'KJ', 'Kajang', 9),
(52, 'SY', 'Semenyih', 9),
(53, 'KPU', 'Kuala Pauh', 10),
(54, 'SBS', 'Sg Besi', 10),
(55, 'TNP', 'Taman Petaling', 10),
(56, 'WTM', 'Wisma Telekom', 10),
(57, 'BB', 'Batang Berjuntai', 11),
(58, 'BRA', 'Bukit Raja', 11),
(59, 'IJK', 'Ijok', 11),
(60, 'KA', 'Kapar', 11),
(61, 'KS', 'Kuala Selangor', 11),
(62, 'MRU', 'Meru', 11),
(63, 'SAT', 'Sungai Air Tawar', 11),
(64, 'SBR', 'Sungai Besar', 11),
(65, 'SEK', 'Sekinchan', 11),
(66, 'SM', 'Sabak Bernam', 11),
(67, 'SSN', 'Sasaran', 11),
(68, 'STA', 'Sementa', 11),
(69, 'TJK', 'Tanjung Karang', 11),
(70, 'JKN', 'Jalan Kebun', 12),
(71, 'JLT', 'Jalan Langat', 12),
(72, 'KLG', 'Klang', 12),
(73, 'PID', 'Pulau Indah', 12),
(74, 'PKG', 'Pelabuhan Klang', 12),
(75, 'PKM', 'Pulau Ketam', 12),
(76, 'PUIN', 'Pulau Indah', 12),
(77, 'SKU', 'Selat Klang Utara', 12),
(78, 'TGG', 'Teluk Gong', 12),
(79, 'BCG', 'Bukti Changgang', 13),
(80, 'BLA', 'Batu Laut', 13),
(81, 'BN', 'Banting', 13),
(82, 'BUK', 'Bukit Kemuning', 13),
(83, 'JM', 'Jenjarom', 13),
(84, 'JRA', 'Jugra', 13),
(85, 'MRB', 'Morib', 13),
(86, 'SAG', 'Sungai Renggam', 13),
(87, 'SAL', 'Shah Alam', 13),
(88, 'SPK', 'Sungai Pelek', 13),
(89, 'SRG', 'Sungai Renggam', 13),
(90, 'TJS', 'Tanjung Sepat', 13),
(91, 'TPG', 'Telok Panglima Garang', 13),
(92, 'BAT', 'Batu', 14),
(93, 'KE', 'Kepong', 14),
(94, 'SGB', 'Sungai Buloh', 14),
(95, 'SLB', 'Selayang Baru', 14),
(96, 'SPG', 'Sungai Palong', 14),
(97, 'BAG', 'Batu Arang', 15),
(98, 'BBD', 'Bukit Beruntung', 15),
(99, 'BTD', '', 15),
(100, 'KKB', 'Kuala Kubu Bharu', 15),
(101, 'KNG', 'Kundang', 15),
(102, 'KOG', 'Kalumpang', 15),
(103, 'KRG', 'Kerling', 15),
(104, 'KSO', 'Kg. Soeharto', 15),
(105, 'KUG', 'Kuang', 15),
(106, 'RA', 'Rasa', 15),
(107, 'RG', 'Rawang', 15),
(108, 'SBY', 'Sungai Buaya', 15),
(109, 'SDH', 'Serendah', 15),
(110, 'STI', 'Sungai Tengi', 15),
(111, 'UYM', 'Ulu Yam', 15),
(112, 'AWAN', 'Awana', 16),
(113, 'GBK', 'Gombak', 16),
(114, 'GT', 'Genting', 16),
(115, 'MTI', 'Melawati', 16),
(116, 'SET', 'Setapak', 16),
(117, 'WMU', 'Wangsa Maju', 16),
(118, 'BAP', 'Bandar Baru Ampang', 17),
(119, 'CRS', 'Cheras', 17),
(120, 'KRT', 'Keramat', 17),
(121, 'SIL', 'Sungai Long', 17),
(122, 'TAG', 'Tasek Ampang', 17),
(123, 'ULT', 'Ulu Langat', 17);

-- --------------------------------------------------------

--
-- Table structure for table `pbt`
--

CREATE TABLE `pbt` (
  `pbtID` int(11) NOT NULL,
  `pbtCode` varchar(255) DEFAULT NULL,
  `pbtName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pbt`
--

INSERT INTO `pbt` (`pbtID`, `pbtCode`, `pbtName`) VALUES
(1, 'MBSJ', 'MAJLIS BANDARAYA SUBANG JAYA'),
(2, 'MPKU', 'MAJLIS PERBANDARAN KULAI'),
(3, 'MPS', 'MAJLIS PERBANDARAN SELAYANG'),
(4, 'MDKS', 'MAJLIS DAERAH KUALA SELANGOR'),
(5, 'MDSB', 'MAJLIS DAERAH SABAK BERNAM'),
(6, 'MPK', 'MAJLIS PERBANDARAN KLANG'),
(7, 'MBPJ', 'MAJLIS PERBANDARAN PETALING JAYA'),
(8, 'MBSA', 'MAJLIS BANDARAYA SHAH ALAM'),
(9, 'MPSJ', 'MAJLIS PERBANDARAN SUBANG JAYA'),
(10, 'MDHS', 'MAJLIS DAERAH HULU SELANGOR'),
(11, 'MDKL', 'MAJLIS DAERAH KUALA LANGAT'),
(12, 'MPSPG', 'MAJLIS PERBANDARAN SEPANG'),
(13, 'MPKJ', 'MAJLIS PERBANDARAN KAJANG'),
(14, 'PPJ', 'PERBADANAN PUTRAJAYA'),
(15, 'PUJ', 'hentam'),
(16, 'SKMM', 'SURUHANJAYA KOMUNIKASI DAN MULTIMEDIA');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` int(10) NOT NULL,
  `productName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `productName`) VALUES
(1, 'Smart Security & Surveillance');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `projectID` int(11) NOT NULL,
  `projectCode` varchar(25) NOT NULL,
  `projectName` varchar(50) DEFAULT NULL,
  `productID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`projectID`, `projectCode`, `projectName`, `productID`) VALUES
(1, 'MPSJL', 'Majlis Perbandaran Subang Jaya L', 1),
(2, 'MPKU', 'idk', 1),
(3, 'SSCS', 'Selangor State CCTV System', 1),
(4, 'C-RAN', 'Cloud - Radio Access Network', 1),
(5, 'SP1', 'ionknow', 1),
(6, 'MBSJ-M', 'MBSJ Mobile', 1);

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `stateCode` varchar(255) NOT NULL,
  `stateName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`stateCode`, `stateName`) VALUES
('JHR', 'Johor'),
('KDH', 'Kedah'),
('KTN', 'Kelantan'),
('KUL', 'Kuala Lumpur'),
('LBN', 'Labuan'),
('MLK', 'Melaka'),
('MSC', 'MSC'),
('NSN', 'Negeri Sembilan'),
('PHG', 'Pahang'),
('PLS', 'Perlis'),
('PNG', 'Penang'),
('PRK', 'Perak'),
('SBH', 'Sabah'),
('SEL', 'Selangor'),
('SRW', 'Sarawak'),
('TRG', 'Terengganu');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `ifesID` int(11) NOT NULL,
  `memberID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`ifesID`, `memberID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 16),
(1, 21),
(1, 22),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 16),
(2, 21),
(2, 22),
(3, 1),
(3, 2),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 38),
(4, 1),
(4, 2),
(4, 16),
(4, 18),
(4, 19),
(4, 20),
(4, 21),
(4, 22),
(5, 1),
(5, 2),
(5, 16),
(5, 21),
(5, 22),
(5, 23),
(5, 39),
(6, 1),
(6, 2),
(6, 16),
(6, 24),
(6, 25),
(6, 26),
(6, 27),
(6, 28),
(7, 1),
(7, 2),
(7, 16),
(7, 24),
(7, 25),
(7, 26),
(7, 27),
(7, 28),
(8, 1),
(8, 2),
(8, 16),
(8, 24),
(8, 25),
(8, 26),
(8, 27),
(8, 28),
(9, 1),
(9, 2),
(9, 16),
(9, 29),
(9, 30),
(9, 31),
(9, 32),
(9, 33),
(10, 1),
(10, 2),
(10, 16),
(10, 29),
(10, 30),
(10, 31),
(10, 32),
(10, 33),
(11, 1),
(11, 2),
(11, 16),
(11, 21),
(11, 22),
(11, 34);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(100) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `username`, `password`) VALUES
(1, 'sso', 'sso123'),
(2, 'admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `wilayah`
--

CREATE TABLE `wilayah` (
  `wilayahID` int(11) NOT NULL,
  `wilayahCode` varchar(50) DEFAULT NULL,
  `wilayahName` varchar(100) DEFAULT NULL,
  `stateCode` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wilayah`
--

INSERT INTO `wilayah` (`wilayahID`, `wilayahCode`, `wilayahName`, `stateCode`) VALUES
(1, 'KL1', 'KUALA LUMPUR 1', 'KUL'),
(2, 'KL2', 'KUALA LUMPUR 2', 'KUL'),
(3, 'MSC', 'MSC', 'MSC'),
(4, 'SB', 'SELANGOR BARAT', 'SEL'),
(5, 'ST1 kb', 'SELANGOR TIMUR 1 (KEPONG & BATU)', 'SEL'),
(6, 'ST2', 'SELANGOR TIMUR 2', 'SEL'),
(7, 'PJ1', 'PETALING JAYA 1', 'SEL'),
(8, 'PJ2', 'PETALING JAYA 2', 'SEL'),
(9, 'ST1 r', 'SELANGOR TIMUR 1 (RAWANG)', 'SEL');

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

CREATE TABLE `zone` (
  `zoneID` int(11) NOT NULL,
  `zoneName` varchar(255) DEFAULT NULL,
  `wilayahID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `zone`
--

INSERT INTO `zone` (`zoneID`, `zoneName`, `wilayahID`) VALUES
(1, 'BANGSAR', 1),
(2, 'BUKIT ANGGERIK', 2),
(3, 'MALURI', 2),
(4, 'TAR', 1),
(5, 'CYBERJAYA', 3),
(6, 'PUCHONG', 3),
(7, 'SUBANG JAYA', 7),
(8, 'TDI', 7),
(9, 'BANGI', 8),
(10, 'TAMAN PETALING', 8),
(11, 'BUKIT RAJA & K. SELANGOR', 4),
(12, 'KLANG', 4),
(13, 'SHAH ALAM & BANTING', 4),
(14, 'KEPONG & BATU', 5),
(15, 'RAWANG', 9),
(16, 'GOMBAK', 6),
(17, 'KERAMAT', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asset_1`
--
ALTER TABLE `asset_1`
  ADD PRIMARY KEY (`assetID`);

--
-- Indexes for table `asset_2`
--
ALTER TABLE `asset_2`
  ADD PRIMARY KEY (`assetID`);

--
-- Indexes for table `asset_3`
--
ALTER TABLE `asset_3`
  ADD PRIMARY KEY (`assetID`);

--
-- Indexes for table `asset_4`
--
ALTER TABLE `asset_4`
  ADD PRIMARY KEY (`assetID`);

--
-- Indexes for table `asset_5`
--
ALTER TABLE `asset_5`
  ADD PRIMARY KEY (`assetID`);

--
-- Indexes for table `asset_6`
--
ALTER TABLE `asset_6`
  ADD PRIMARY KEY (`assetID`);

--
-- Indexes for table `ifes`
--
ALTER TABLE `ifes`
  ADD PRIMARY KEY (`ifesID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`memberID`);

--
-- Indexes for table `node`
--
ALTER TABLE `node`
  ADD PRIMARY KEY (`nodeID`);

--
-- Indexes for table `pbt`
--
ALTER TABLE `pbt`
  ADD PRIMARY KEY (`pbtID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`projectID`),
  ADD KEY `FK_project_1` (`productID`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`stateCode`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`ifesID`,`memberID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `wilayah`
--
ALTER TABLE `wilayah`
  ADD PRIMARY KEY (`wilayahID`);

--
-- Indexes for table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`zoneID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asset_1`
--
ALTER TABLE `asset_1`
  MODIFY `assetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `asset_2`
--
ALTER TABLE `asset_2`
  MODIFY `assetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `asset_3`
--
ALTER TABLE `asset_3`
  MODIFY `assetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=437;

--
-- AUTO_INCREMENT for table `asset_4`
--
ALTER TABLE `asset_4`
  MODIFY `assetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `asset_5`
--
ALTER TABLE `asset_5`
  MODIFY `assetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `asset_6`
--
ALTER TABLE `asset_6`
  MODIFY `assetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ifes`
--
ALTER TABLE `ifes`
  MODIFY `ifesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `memberID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `node`
--
ALTER TABLE `node`
  MODIFY `nodeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `pbt`
--
ALTER TABLE `pbt`
  MODIFY `pbtID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `projectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wilayah`
--
ALTER TABLE `wilayah`
  MODIFY `wilayahID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `zone`
--
ALTER TABLE `zone`
  MODIFY `zoneID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `FK_project_1` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
