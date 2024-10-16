-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2024 at 05:23 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `soc_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `asset_1`
--

CREATE TABLE `asset_1` (
  `assetID` varchar(25) NOT NULL,
  `pbtID` varchar(25) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `coordiNorth` varchar(100) DEFAULT NULL,
  `coordiEast` varchar(100) DEFAULT NULL,
  `postcode` varchar(5) DEFAULT NULL,
  `location` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ifes`
--

CREATE TABLE `ifes` (
  `ifesID` int(11) NOT NULL,
  `ifesName` varchar(100) DEFAULT NULL,
  `ifesEmail` varchar(100) DEFAULT NULL,
  `wilayahID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `node`
--

INSERT INTO `node` (`nodeID`, `nodeCode`, `nodeName`, `zoneID`) VALUES
(1, 'BNR', 'Bangsar', NULL),
(2, 'BRF', 'Brickfields', NULL),
(3, 'DM', 'Damansara', NULL),
(4, 'JRC', 'Jalan Raja Chulan', NULL),
(5, 'KLC', 'KL Central', NULL),
(6, 'MTM', 'Menara TM', NULL),
(7, 'BAK', 'Bukit Anggerik', NULL),
(8, 'BRK', 'Bandar Tun Razak', NULL),
(9, 'MDH', 'Midah', NULL),
(10, 'ATN', '', NULL),
(11, 'BIN', 'Bintang', NULL),
(12, 'MRI', 'Maluri', NULL),
(13, 'PAN', 'Pandan', NULL),
(14, 'PEG', 'Pekeliling', NULL),
(15, 'SPE', 'San Peng', NULL),
(16, 'DTA', 'Duta', NULL),
(17, 'SMK', 'Semarak', NULL),
(18, 'STL', 'Sentul', NULL),
(19, 'TAR', 'Tuanku Abdul Rahman', NULL),
(20, 'CBJ', 'Cyberjaya', NULL),
(21, 'CBJ2', 'Cyberjaya 2', NULL),
(22, 'CBJ5', 'Cyberjaya 5', NULL),
(23, 'DK', 'Dengkil', NULL),
(24, 'KLIA', 'KLIA', NULL),
(25, 'LPS', 'KLIA Sepang', NULL),
(26, 'MYL', 'MY LOCA', NULL),
(27, 'PUJ', 'Putrajaya', NULL),
(28, 'PUJ1', 'Putrajaya 1', NULL),
(29, 'SDG', 'Serdang', NULL),
(30, 'SKT', 'Salak Tinggi', NULL),
(31, 'BJL', 'Bukit Jalil', NULL),
(32, 'KIN', 'Kinrara', NULL),
(33, 'PCG', 'Puchong', NULL),
(34, 'USJ', 'UEP Subang Jaya', NULL),
(35, 'BUG', 'Bukit Glenmarie', NULL),
(36, 'LTS', 'Lapangan Terbang Subang', NULL),
(37, 'SBJ', 'Subang Jaya', NULL),
(38, 'BGS', 'Bukit Gasing', NULL),
(39, 'BJN', 'Bukit Lanjan', NULL),
(40, 'CSA', 'Wisma CSA', NULL),
(41, 'KLJ', 'Kelana Jaya', NULL),
(42, 'PETALING JAYAC', 'Petaling Jaya Central', NULL),
(43, 'PJC', 'Petaling Jaya Central', NULL),
(44, 'SWY', 'Sungai Way', NULL),
(45, 'TDI', 'TTDI', NULL),
(46, 'BDC', 'Bangi DC', NULL),
(47, 'BGA', 'Broga', NULL),
(48, 'BGI', 'Bangi', NULL),
(49, 'BKO', 'Balakong', NULL),
(50, 'BRG', 'Beranang', NULL),
(51, 'KJ', 'Kajang', NULL),
(52, 'SY', 'Semenyih', NULL),
(53, 'KPU', 'Kuala Pauh', NULL),
(54, 'SBS', 'Sg Besi', NULL),
(55, 'TNP', 'Taman Petaling', NULL),
(56, 'WTM', 'Wisma Telekom', NULL),
(57, 'BB', 'Batang Berjuntai', NULL),
(58, 'BRA', 'Bukit Raja', NULL),
(59, 'IJK', 'Ijok', NULL),
(60, 'KA', 'Kapar', NULL),
(61, 'KS', 'Kuala Selangor', NULL),
(62, 'MRU', 'Meru', NULL),
(63, 'SAT', 'Sungai Air Tawar', NULL),
(64, 'SBR', 'Sungai Besar', NULL),
(65, 'SEK', 'Sekinchan', NULL),
(66, 'SM', 'Sabak Bernam', NULL),
(67, 'SSN', 'Sasaran', NULL),
(68, 'STA', 'Sementa', NULL),
(69, 'TJK', 'Tanjung Karang', NULL),
(70, 'JKN', 'Jalan Kebun', NULL),
(71, 'JLT', 'Jalan Langat', NULL),
(72, 'KLG', 'Klang', NULL),
(73, 'PID', 'Pulau Indah', NULL),
(74, 'PKG', 'Pelabuhan Klang', NULL),
(75, 'PKM', 'Pulau Ketam', NULL),
(76, 'PUIN', 'Pulau Indah', NULL),
(77, 'SKU', 'Selat Klang Utara', NULL),
(78, 'TGG', 'Teluk Gong', NULL),
(79, 'BCG', 'Bukti Changgang', NULL),
(80, 'BLA', 'Batu Laut', NULL),
(81, 'BN', 'Banting', NULL),
(82, 'BUK', 'Bukit Kemuning', NULL),
(83, 'JM', 'Jenjarom', NULL),
(84, 'JRA', 'Jugra', NULL),
(85, 'MRB', 'Morib', NULL),
(86, 'SAG', 'Sungai Renggam', NULL),
(87, 'SAL', 'Shah Alam', NULL),
(88, 'SPK', 'Sungai Pelek', NULL),
(89, 'SRG', 'Sungai Renggam', NULL),
(90, 'TJS', 'Tanjung Sepat', NULL),
(91, 'TPG', 'Telok Panglima Garang', NULL),
(92, 'BAT', 'Batu', NULL),
(93, 'KE', 'Kepong', NULL),
(94, 'SGB', 'Sungai Buloh', NULL),
(95, 'SLB', 'Selayang Baru', NULL),
(96, 'SPG', 'Sungai Palong', NULL),
(97, 'BAG', 'Batu Arang', NULL),
(98, 'BBD', 'Bukit Beruntung', NULL),
(99, 'BTD', '', NULL),
(100, 'KKB', 'Kuala Kubu Bharu', NULL),
(101, 'KNG', 'Kundang', NULL),
(102, 'KOG', 'Kalumpang', NULL),
(103, 'KRG', 'Kerling', NULL),
(104, 'KSO', 'Kg. Soeharto', NULL),
(105, 'KUG', 'Kuang', NULL),
(106, 'RA', 'Rasa', NULL),
(107, 'RG', 'Rawang', NULL),
(108, 'SBY', 'Sungai Buaya', NULL),
(109, 'SDH', 'Serendah', NULL),
(110, 'STI', 'Sungai Tengi', NULL),
(111, 'UYM', 'Ulu Yam', NULL),
(112, 'AWAN', 'Awana', NULL),
(113, 'GBK', 'Gombak', NULL),
(114, 'GT', 'Genting', NULL),
(115, 'MTI', 'Melawati', NULL),
(116, 'SET', 'Setapak', NULL),
(117, 'WMU', 'Wangsa Maju', NULL),
(118, 'BAP', 'Bandar Baru Ampang', NULL),
(119, 'CRS', 'Cheras', NULL),
(120, 'KRT', 'Keramat', NULL),
(121, 'SIL', 'Sungai Long', NULL),
(122, 'TAG', 'Tasek Ampang', NULL),
(123, 'ULT', 'Ulu Langat', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pbt`
--

CREATE TABLE `pbt` (
  `pbtID` int(11) NOT NULL,
  `pbtCode` varchar(255) DEFAULT NULL,
  `pbtName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `projectID` int(11) NOT NULL,
  `projectCode` varchar(25) NOT NULL,
  `projectName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`projectID`, `projectCode`, `projectName`) VALUES
(1, 'SSCS', 'Selangor State CCTV System');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `stateCode` varchar(255) NOT NULL,
  `stateName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Table structure for table `wilayah`
--

CREATE TABLE `wilayah` (
  `wilayahID` int(11) NOT NULL,
  `wilayahCode` varchar(50) DEFAULT NULL,
  `wilayahName` varchar(100) DEFAULT NULL,
  `stateCode` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(9, 'ST1 r', 'SELANGOR TIMUR 1 (RAWANG)', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

CREATE TABLE `zone` (
  `zoneID` int(11) NOT NULL,
  `zoneName` varchar(255) DEFAULT NULL,
  `wilayahID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zone`
--

INSERT INTO `zone` (`zoneID`, `zoneName`, `wilayahID`) VALUES
(1, 'BANGSAR', NULL),
(2, 'BUKIT ANGGERIK', NULL),
(3, 'MALURI', NULL),
(4, 'TAR', NULL),
(5, 'CYBERJAYA', NULL),
(6, 'PUCHONG', NULL),
(7, 'SUBANG JAYA', NULL),
(8, 'TDI', NULL),
(9, 'BANGI', NULL),
(10, 'TAMAN PETALING', NULL),
(11, 'BUKIT RAJA & K. SELANGOR', NULL),
(12, 'KLANG', NULL),
(13, 'SHAH ALAM & BANTING', NULL),
(14, 'KEPONG & BATU', NULL),
(15, 'RAWANG', NULL),
(16, 'GOMBAK', NULL),
(17, 'KERAMAT', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asset_1`
--
ALTER TABLE `asset_1`
  ADD PRIMARY KEY (`assetID`,`pbtID`);

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
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`projectID`);

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
-- AUTO_INCREMENT for table `ifes`
--
ALTER TABLE `ifes`
  MODIFY `ifesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `memberID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `node`
--
ALTER TABLE `node`
  MODIFY `nodeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `pbt`
--
ALTER TABLE `pbt`
  MODIFY `pbtID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `projectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wilayah`
--
ALTER TABLE `wilayah`
  MODIFY `wilayahID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `zone`
--
ALTER TABLE `zone`
  MODIFY `zoneID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
