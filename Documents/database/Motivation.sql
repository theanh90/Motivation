-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 24, 2016 at 05:54 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

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
  `Email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Note` text COLLATE utf8_unicode_ci,
  `Active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `CUSTOMER`
--

INSERT INTO `CUSTOMER` (`CID`, `Name`, `Phone`, `Email`, `Address`, `Note`, `Active`) VALUES
(2, 'Nguyễn Thị Quỳnh Như', '01693652381', NULL, 'Sa Thầy, Kon Tum', 'Đã chuyển ra Đà Nẵng', 1),
(7, 'Mr.Siro', '09090909009', NULL, 'Làng bối', 'xxxxx', 1),
(9, 'dantri.com', '8989898989', NULL, 'tvt3', 'xxx rrrrr', 1),
(10, 'hiv', '242342534534', NULL, 'giai đoạn cuối', NULL, 1),
(11, 'Huỳnh Thị Diễm Ny', '4352452345', NULL, 'pleiku', 'break-up', 1),
(12, 'Đào Thị Kim Tuyến', '3333333333', NULL, 'ssssss', NULL, 1),
(13, 'Quang Vũ', '23452345354', NULL, 'sjflaskfasdfsad', NULL, 1),
(14, 'Đăng Khoa', '3243245345', NULL, 'ddd asd sdf', 'adf asdf sdf', 1),
(15, 'Mỹ Tâm', '245234532453', NULL, 'HHaf asdf', 'sfsadf', 1),
(19, 'Diễm Hương Trần', '0977373748', NULL, 'sldfja sfljsdf', NULL, 1),
(20, 'Luccica', '234254534543', NULL, 'jsladfj alsdfj lsdjf', NULL, 1),
(21, 'Trâm 77', '53245324554', NULL, 'HCM', 'sf', 1),
(22, 'Ngộ zãy ta', '0425345345', NULL, 'ko phân trang', NULL, 1),
(23, 'bị nhầm', '3424234534', NULL, 'kkk', NULL, 1),
(25, 'mới 1', '2453453453', NULL, 'hòa phú', 'bbbb', 1),
(26, 'uuuu', '99889987678', NULL, 'lầu 4', 'kh khó tính', 1),
(27, 'Nu', '01646139496', NULL, 'đà lạt', 'sad memory', 1),
(28, 'xxx', '23945823405', NULL, 'yyy', 'f', 0),
(29, 'ssss', '3333333333', NULL, 'fff', 'ssss', 1),
(31, 'ssssss1', '44444444441', '1@1.1', '222221', 'dd1', 1),
(32, 'mark', '0333333333', 'mark@facebook.com', 'Bình Thạnh', 'kh mới toanh', 1),
(33, 'Steve job', '4444444444', 'xxsteve@apple.com', 'sunrise city', 'was died', 1),
(34, 'abc', '9898888848', 'xyz@abc.com', 'ffff', 'eee', 0),
(35, 'Tuyến Đào', '0973334455', 'tuyen@xxx.com', '01 CMT8', 'đã lấy ck. From iPad', 1),
(36, 'iPad mini 2', '0987654321', 'Xxx@yyy.com', '102/38 binh long', 'chủ nhật. xxx', 1),
(37, 'Trần Thị Thu Thủy', '01646139496', 'xuongrong1701@gmail.com', 'KTX khu B, cá sấu hoa cà', 'fuck', 1),
(38, 'Trần Thị Thịnh', '01268962357', 'thinh.tran@laundromax.com', '235 V5, sunrise city, quận 7', 'Chủ cửa hàng', 1),
(39, 'chan doi', '34534534534', 'metmoi@gmail.com', 'hoa phu, chupah, gia lai', 'xxx', 1),
(40, 'nguyễn hồng đào', '43523453445', 'sss@sdfsf.com', 'xxx, yyy', 'ffff', 1);

-- --------------------------------------------------------

--
-- Table structure for table `INVOICE`
--

CREATE TABLE `INVOICE` (
  `InId` int(11) NOT NULL,
  `Cid` int(11) NOT NULL,
  `DateCreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TotalPrice` int(11) NOT NULL,
  `TotalPay` int(11) DEFAULT NULL,
  `IsExpress` int(11) NOT NULL,
  `Note` text COLLATE utf8_unicode_ci,
  `LastStatus` int(11) NOT NULL,
  `Active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `INVOICE`
--

INSERT INTO `INVOICE` (`InId`, `Cid`, `DateCreate`, `TotalPrice`, `TotalPay`, `IsExpress`, `Note`, `LastStatus`, `Active`) VALUES
(3, 20, '2016-03-22 15:00:58', 21333, 20000, 0, 'xxx uyyyy', 1, 1),
(4, 23, '2016-03-23 15:20:31', 266682, 1, 200000, 'chán vl ra', 1, 1),
(5, 23, '2016-03-23 15:21:40', 266682, 1, 200000, 'chán vl ra', 1, 1),
(7, 20, '2016-03-23 15:32:17', 10017, 10000, 1, 'dddddd ddd d', 1, 1),
(8, 23, '2016-03-23 15:40:32', 267108, 45000, 1, NULL, 1, 1),
(9, 11, '2016-03-23 15:42:40', 26039, 0, 0, NULL, 1, 1),
(10, 9, '2016-03-23 15:48:24', 15000, 0, 0, NULL, 1, 1),
(11, 19, '2016-03-23 15:49:04', 6666, 0, 0, NULL, 1, 1),
(12, 36, '2016-03-23 16:00:43', 6000, 0, 0, NULL, 1, 1),
(13, 19, '2016-03-23 16:02:24', 180154, 0, 0, NULL, 1, 1),
(14, 13, '2016-03-23 16:08:46', 6666, 0, 0, NULL, 1, 1),
(15, 20, '2016-03-23 16:13:28', 9999, 0, 0, NULL, 1, 1),
(16, 39, '2016-03-24 15:52:31', 11331, 3333, 0, 'giao vào sáng mai nhé', 1, 1),
(17, 19, '2016-03-24 16:01:50', 266676, 266676, 0, NULL, 1, 1),
(18, 23, '2016-03-24 16:43:01', 220692, 500000, 0, 'xxx, uuu', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `INVOICEDETAILS`
--

CREATE TABLE `INVOICEDETAILS` (
  `Did` int(11) NOT NULL,
  `Pid` int(11) NOT NULL,
  `InId` int(11) NOT NULL,
  `UnitPrice` int(11) NOT NULL,
  `TypePrice` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `INVOICEDETAILS`
--

INSERT INTO `INVOICEDETAILS` (`Did`, `Pid`, `InId`, `UnitPrice`, `TypePrice`, `Quantity`) VALUES
(1, 6, 3, 1111, 'laundry', 3),
(2, 4, 3, 9000, 'pressonly', 2),
(3, 3, 4, 88888, 'laundry', 3),
(4, 7, 4, 9, 'pressonly', 2),
(5, 3, 5, 88888, 'laundry', 3),
(6, 7, 5, 9, 'pressonly', 2),
(7, 11, 7, 3333, 'laundry', 3),
(8, 13, 7, 6, 'pressonly', 3),
(9, 3, 8, 88888, 'laundry', 3),
(10, 10, 8, 222, 'dryclean', 2),
(11, 3, 9, 2000, 'dryclean', 1),
(12, 7, 9, 2013, 'dryclean', 3),
(13, 4, 9, 9000, 'pressonly', 2),
(14, 4, 10, 5000, 'laundry', 3),
(15, 6, 11, 2222, 'dryclean', 3),
(16, 3, 12, 2000, 'dryclean', 3),
(17, 8, 13, 60000, 'dryclean', 3),
(18, 12, 13, 77, 'pressonly', 2),
(19, 6, 14, 2222, 'dryclean', 3),
(20, 11, 15, 3333, 'dryclean', 3),
(21, 6, 16, 1111, 'laundry', 3),
(22, 16, 16, 3999, 'dryclean', 2),
(23, 3, 17, 88888, 'laundry', 3),
(24, 13, 17, 6, 'pressonly', 2),
(25, 8, 18, 50000, 'laundry', 3),
(26, 7, 18, 2013, 'dryclean', 2),
(27, 11, 18, 22222, 'pressonly', 3);

-- --------------------------------------------------------

--
-- Table structure for table `INVOICEHISTORY`
--

CREATE TABLE `INVOICEHISTORY` (
  `HId` int(11) NOT NULL,
  `InId` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `DateCreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ChangeText` text COLLATE utf8_unicode_ci NOT NULL,
  `Note` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `INVOICESTATUS`
--

CREATE TABLE `INVOICESTATUS` (
  `SID` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `INVOICESTATUS`
--

INSERT INTO `INVOICESTATUS` (`SID`, `Name`) VALUES
(1, 'New'),
(2, 'Send Partner'),
(3, 'Receive Partner'),
(4, 'Delivery');

-- --------------------------------------------------------

--
-- Table structure for table `PRODUCT`
--

CREATE TABLE `PRODUCT` (
  `PID` int(11) NOT NULL,
  `EnName` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `VnName` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `Unit` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Note` text COLLATE utf8_unicode_ci,
  `Active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PRODUCT`
--

INSERT INTO `PRODUCT` (`PID`, `EnName`, `VnName`, `Unit`, `Note`, `Active`) VALUES
(3, 'shirt', 'áo sơ mi', 'Cái', 'shirt', 1),
(4, 'MEN_EN', 'mền', 'bao', 'MEN_EN', 1),
(6, 'xxx', '4 lỗ', 'yyy', 'xxx', 1),
(7, 'red shoes', 'hài đỏ', 'đôi', 'my memory', 1),
(8, 'coat', 'áo khoác', 'cái', 'xxx', 1),
(9, 'xxx Coat', 'Áo Khoác Nỉ', 'bộ', 'uuu', 1),
(10, '2222', 'ee', '3333', NULL, 1),
(11, 'rrrr', 'ttttt', 'eee', NULL, 1),
(12, 'xxxx', 'cccc', 'ư', 'xxxxxxx', 1),
(13, '66666', 'jjjjj', 'tt', NULL, 1),
(14, '', 'vvvv', '22 x', 'dddd 6', 0),
(16, '', 'giầy dr', 'đôi', 'dễ ra màu', 1),
(17, 'converse shoes', 'giầy converse', 'đôi', 'giặt cho sạch đế trước khi giao. xxxxx. yyy', 1),
(18, 'xxx', 'dr shoes', 'đôi', 'xxx yyy', 0);

-- --------------------------------------------------------

--
-- Table structure for table `STUFFCONFIG`
--

CREATE TABLE `STUFFCONFIG` (
  `ID` int(11) NOT NULL,
  `ExPricePercent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `STUFFCONFIG`
--

INSERT INTO `STUFFCONFIG` (`ID`, `ExPricePercent`) VALUES
(1, 50);

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
(3, 88888, 2000, 3000),
(4, 5000, 7000, 9000),
(6, 1111, 2222, 3333),
(7, 1701, 2013, 9),
(8, 50000, 60000, 70000),
(9, 1, 3, 1),
(10, 333, 222, 333),
(11, 3333, 3333, 22222),
(12, 55, 66, 77),
(13, 4, 5, 6),
(14, 556, 666, 76),
(16, 4000, 3999, 5000),
(17, 4, 3, 2),
(18, 4000, 5000, 6000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CUSTOMER`
--
ALTER TABLE `CUSTOMER`
  ADD PRIMARY KEY (`CID`);

--
-- Indexes for table `INVOICE`
--
ALTER TABLE `INVOICE`
  ADD PRIMARY KEY (`InId`);

--
-- Indexes for table `INVOICEDETAILS`
--
ALTER TABLE `INVOICEDETAILS`
  ADD PRIMARY KEY (`Did`);

--
-- Indexes for table `INVOICEHISTORY`
--
ALTER TABLE `INVOICEHISTORY`
  ADD PRIMARY KEY (`HId`);

--
-- Indexes for table `INVOICESTATUS`
--
ALTER TABLE `INVOICESTATUS`
  ADD PRIMARY KEY (`SID`);

--
-- Indexes for table `PRODUCT`
--
ALTER TABLE `PRODUCT`
  ADD PRIMARY KEY (`PID`);

--
-- Indexes for table `STUFFCONFIG`
--
ALTER TABLE `STUFFCONFIG`
  ADD PRIMARY KEY (`ID`);

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
  MODIFY `CID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `INVOICE`
--
ALTER TABLE `INVOICE`
  MODIFY `InId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `INVOICEDETAILS`
--
ALTER TABLE `INVOICEDETAILS`
  MODIFY `Did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `INVOICEHISTORY`
--
ALTER TABLE `INVOICEHISTORY`
  MODIFY `HId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `PRODUCT`
--
ALTER TABLE `PRODUCT`
  MODIFY `PID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `USER`
--
ALTER TABLE `USER`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
