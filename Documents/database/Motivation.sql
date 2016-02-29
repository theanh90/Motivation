-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 27, 2016 at 09:57 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Motivation`
--

-- --------------------------------------------------------

--
-- Table structure for table `CUSTOMER`
--

CREATE TABLE `CUSTOMER` (
  `CID` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Note` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `CUSTOMER`
--

INSERT INTO `CUSTOMER` (`CID`, `Name`, `Phone`, `Address`, `Note`) VALUES
(1, 'Nguyễn Hữu Phụ Khoa', '01652231234', 'ddd', 'dfff'),
(2, 'Nguyễn Thị Quỳnh Như', '01693652381', 'Sa Thầy, Kon Tum', 'Đã chuyển ra Đà Nẵng'),
(3, 'Đinh Thị H Phim', '01682804101', 'DakPo, Gia Lai', 'Zè quê rồi'),
(4, 'Trần Thị Thu Thủy', '01646139496', 'Đà Lạt, Lâm Đồng', 'Đang học ở Thủ Đức'),
(7, 'Mr.Siro', '09090909009', 'Làng bối', 'xxxxx'),
(8, 'Trần Trụi', '898989898989', 'aa, bbb', 'xxxx'),
(9, 'dantri.com', '8989898989', 'tvt3', 'xxx'),
(10, 'hiv', '242342534534', 'giai đoạn cuối', NULL),
(11, 'Huỳnh Thị Diễm Ny', '4352452345', 'pleiku', 'break-up'),
(12, 'Đào Thị Kim Tuyến', '3333333333', 'ssssss', NULL),
(13, 'Quang Vũ', '23452345354', 'sjflaskfasdfsad', NULL),
(14, 'Đăng Khoa', '3243245345', 'ddd asd sdf', 'adf asdf sdf'),
(15, 'Mỹ Tâm', '245234532453', 'HHaf asdf', 'sfsadf'),
(16, 'Đờm', '2245908008', 'faspkf', 'qef sò'),
(17, 'Noo', '5363645664', 'jlsdfj als jalj', 'lasdjfwofj of02f jelfm dsf'),
(18, 'hellu', '233452345345', '52345345345', 'dd'),
(19, 'Diễm Hương Trần', '0977373748', 'sldfja sfljsdf', NULL),
(20, 'Luccica', '234254534543', 'jsladfj alsdfj lsdjf', NULL),
(21, 'Trâm 77', '53245324554', 'jlsfj o2f lsk fà', 'sf'),
(22, 'Ngộ zãy ta', '0425345345', 'ko phân trang', NULL),
(23, 'bị nhầm', '3424234534', 'kkk', NULL),
(24, 'a 1', '3333333333', 'ssssss', 'dddd');

-- --------------------------------------------------------

--
-- Table structure for table `PRODUCT`
--

CREATE TABLE `PRODUCT` (
  `PID` int(11) NOT NULL,
  `EnName` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `VnName` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `Unit` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Note` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PRODUCT`
--

INSERT INTO `PRODUCT` (`PID`, `EnName`, `VnName`, `Unit`, `Note`) VALUES
(1, 'jean', 'quần jean', 'cái', 'jean'),
(2, 'sơ mi', 'áo sơ mi', 'cái', 'sơ mi');

-- --------------------------------------------------------

--
-- Table structure for table `USER`
--

CREATE TABLE `USER` (
  `Id` int(11) NOT NULL,
  `UserName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Role` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `USER`
--

INSERT INTO `USER` (`Id`, `UserName`, `Password`, `Role`) VALUES
(1, 'admin', '$2a$08$ApmTcQ8WOdNcs73eBslLPeW.7SA99SurC3AZgZab.WCScIyY1ZJ9O', 'ADMIN'),
(2, 'user', '$2a$08$bIGdppOPgIs6xwA8ftRFJeaevl.1qyaqyuPUnwRc5ID.aykWC3J6y', 'USER');

-- --------------------------------------------------------

--
-- Table structure for table `WASHTYPEPRICE`
--

CREATE TABLE `WASHTYPEPRICE` (
  `PID` int(11) NOT NULL,
  `Laundry` int(11) NOT NULL,
  `DryClean` int(11) NOT NULL,
  `PressOnly` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `WASHTYPEPRICE`
--

INSERT INTO `WASHTYPEPRICE` (`PID`, `Laundry`, `DryClean`, `PressOnly`) VALUES
(1, 1, 2, 3),
(2, 2000, 3000, 4000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CUSTOMER`
--
ALTER TABLE `CUSTOMER`
  ADD PRIMARY KEY (`CID`);

--
-- Indexes for table `PRODUCT`
--
ALTER TABLE `PRODUCT`
  ADD PRIMARY KEY (`PID`);

--
-- Indexes for table `USER`
--
ALTER TABLE `USER`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `UserName` (`UserName`);

--
-- Indexes for table `WASHTYPEPRICE`
--
ALTER TABLE `WASHTYPEPRICE`
  ADD PRIMARY KEY (`PID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `CUSTOMER`
--
ALTER TABLE `CUSTOMER`
  MODIFY `CID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `PRODUCT`
--
ALTER TABLE `PRODUCT`
  MODIFY `PID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `USER`
--
ALTER TABLE `USER`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
