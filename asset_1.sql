-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2024 at 03:13 AM
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
(93, 'C93', 9, NULL, '3.031885', '101.577736', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asset_1`
--
ALTER TABLE `asset_1`
  ADD PRIMARY KEY (`assetID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asset_1`
--
ALTER TABLE `asset_1`
  MODIFY `assetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
