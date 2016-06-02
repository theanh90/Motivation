-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 02, 2016 at 11:08 AM
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
CREATE DATABASE IF NOT EXISTS `Motivation` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `Motivation`;

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
(14, 'Đăng Khoa', '3243245345', 'dangkhoang@gmail.com', 'V5 Sunrise', 'Note ne ba', 1),
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
(40, 'nguyễn hồng đào', '43523453445', 'sss@sdfsf.com', 'xxx, yyy', 'ffff', 1),
(41, 'Thinh', '01229576222', NULL, 'V5 0505', 'Kh vipffff', 1),
(42, 'mr don', '0903824409', NULL, 'v6 1204', NULL, 1);

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
  `Vat` int(11) NOT NULL,
  `Discount` int(11) NOT NULL,
  `IsExpress` int(11) NOT NULL,
  `Note` text COLLATE utf8_unicode_ci,
  `LastStatus` int(11) NOT NULL,
  `Active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `INVOICE`
--

INSERT INTO `INVOICE` (`InId`, `Cid`, `DateCreate`, `TotalPrice`, `TotalPay`, `Vat`, `Discount`, `IsExpress`, `Note`, `LastStatus`, `Active`) VALUES
(28, 23, '2016-05-28 15:18:01', 26823, 3333, 1, 33, 1, 'tes"t with sp''ecial charators''', -1, 1),
(30, 19, '2016-04-04 05:00:00', 100000, 0, 0, 0, 0, NULL, 3, 1),
(32, 39, '2016-04-04 17:00:00', 14738, 14738, 0, 0, 1, 'cccccc', 5, 1),
(34, 20, '2016-04-05 16:59:59', 866928, 866928, 0, 0, 0, NULL, 5, 1),
(36, 23, '2016-05-28 15:21:02', 300000, 300000, 0, 0, 0, NULL, 0, 1),
(37, 9, '2016-04-05 17:00:00', 1200000, 1200000, 0, 0, 0, NULL, 2, 1),
(38, 39, '2016-04-30 10:23:35', 529200, 0, 0, 10, 0, 'asfasdf', 5, 1),
(39, 20, '2016-05-24 13:54:50', 1485000, 485000, 1, 10, 1, 'Trả 485.000d, còn nợ lại 1 triệu nhé', 5, 1),
(40, 10, '2016-05-28 15:47:31', 464566, 200000, 0, 30, 0, 'fffff ....m sssss', 3, 1),
(41, 12, '2016-05-29 02:59:35', 1166322, 500000, 0, 0, 1, 'Test xxxx', -1, 1),
(45, 14, '2016-05-29 09:06:42', 142590, 142590, 0, 0, 0, 'fffff', -1, 1),
(47, 9, '2016-05-29 16:59:54', 14449, 14449, 0, 0, 0, 'dddddd', 5, 1),
(48, 38, '2016-05-30 11:13:38', 2070090, 2070090, 1, 10, 1, 'test in bill', 5, 1),
(49, 19, '2016-05-30 14:05:52', 1487970, 1487970, 1, 10, 1, 'ddddddd', 2, 1),
(50, 19, '2016-05-30 14:59:56', 1039500, 1039500, 1, 10, 1, 'ffff', 2, 1),
(51, 19, '2016-05-31 13:09:10', 150000, 0, 0, 0, 0, 'Thêm cái nữa', 1, 1),
(52, 34, '2016-05-31 13:13:00', 150000, 0, 0, 0, 0, 'ssss', 1, 1),
(53, 11, '2016-05-31 13:14:30', 66000, 0, 0, 0, 0, 'sss', 3, 1),
(54, 20, '2016-06-01 10:34:02', 176000, 0, 0, 0, 0, 'xxxxx', 2, 1),
(55, 39, '2016-06-01 10:35:28', 39413, 19413, 1, 0, 1, 'cccccc', 1, 1);

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
(45, 12, 28, 66, 'dryclean', 3),
(46, 4, 28, 9000, 'pressonly', 2),
(48, 17, 30, 100000, 'laundry', 1),
(51, 6, 32, 1111, 'laundry', 3),
(52, 3, 32, 2000, 'dryclean', 2),
(53, 7, 32, 9, 'pressonly', 4),
(55, 12, 34, 66, 'dryclean', 4),
(56, 17, 34, 200000, 'dryclean', 3),
(57, 11, 34, 22222, 'pressonly', 12),
(59, 17, 36, 100000, 'laundry', 3),
(60, 17, 37, 300000, 'pressonly', 4),
(61, 17, 38, 100000, 'laundry', 2),
(62, 17, 38, 200000, 'dryclean', 1),
(63, 16, 38, 4000, 'laundry', 2),
(64, 16, 38, 5000, 'pressonly', 2),
(65, 8, 38, 50000, 'laundry', 1),
(66, 8, 38, 60000, 'dryclean', 2),
(67, 8, 39, 50000, 'laundry', 2),
(68, 8, 39, 60000, 'dryclean', 6),
(69, 17, 39, 100000, 'laundry', 4),
(70, 4, 39, 5000, 'laundry', 8),
(71, 16, 39, 5000, 'pressonly', 20),
(72, 6, 40, 2222, 'dryclean', 3),
(73, 3, 40, 2000, 'dryclean', 2),
(74, 3, 40, 3000, 'pressonly', 3),
(75, 19, 40, 22000, 'pressonly', 2),
(76, 17, 40, 200000, 'dryclean', 3),
(77, 6, 41, 1111, 'laundry', 4),
(78, 3, 41, 3000, 'pressonly', 4),
(79, 3, 41, 88888, 'laundry', 8),
(80, 16, 41, 5000, 'pressonly', 10),
(96, 6, 45, 2222, 'dryclean', 3),
(97, 12, 45, 77, 'pressonly', 12),
(98, 16, 45, 5000, 'pressonly', 27),
(103, 6, 47, 1111, 'laundry', 13),
(104, 9, 47, 3, 'dryclean', 2),
(105, 19, 48, 32000, 'laundry', 2),
(106, 8, 48, 60000, 'dryclean', 3),
(107, 17, 48, 200000, 'dryclean', 5),
(108, 8, 48, 50000, 'laundry', 3),
(109, 8, 49, 50000, 'laundry', 3),
(110, 8, 49, 60000, 'dryclean', 7),
(111, 17, 49, 200000, 'dryclean', 2),
(112, 4, 49, 9000, 'pressonly', 2),
(113, 4, 49, 7000, 'dryclean', 2),
(114, 8, 50, 50000, 'laundry', 2),
(115, 17, 50, 200000, 'dryclean', 3),
(116, 8, 51, 50000, 'laundry', 3),
(117, 8, 52, 50000, 'laundry', 3),
(118, 3, 53, 2000, 'dryclean', 33),
(119, 8, 54, 50000, 'laundry', 3),
(120, 3, 54, 2000, 'dryclean', 4),
(121, 3, 54, 3000, 'pressonly', 6),
(122, 6, 55, 1111, 'laundry', 1),
(123, 6, 55, 2222, 'dryclean', 2),
(124, 6, 55, 3333, 'pressonly', 4),
(125, 16, 55, 5000, 'pressonly', 1);

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
(-1, 'Request cancel'),
(0, 'Cancel'),
(1, 'New'),
(2, 'Confirmed'),
(3, 'Sent to Partner'),
(4, 'Receive from Partner'),
(5, 'Delivery');

-- --------------------------------------------------------

--
-- Table structure for table `PRODUCT`
--

CREATE TABLE `PRODUCT` (
  `PID` int(11) NOT NULL,
  `EnName` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
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
(13, '66666', 'jjjjj', 'tt', 'sao đây ta', 1),
(14, '', 'vvvv', '22 x', 'dddd 6', 0),
(16, '', 'giầy dr', 'đôi', 'dễ ra màuddd', 1),
(17, 'converse shoes', 'giầy converse', 'đôi', 'giặt cho sạch đế trước khi giao. xxxxx. yyy', 1),
(18, 'xxx', 'dr shoes', 'đôi', 'xxx yyy', 0),
(19, 'Pant', 'Quan tay', 'Cai', 'Quan nay phai gist. \nsao cưng   fffssssDDDDDssss\nddd', 1),
(24, NULL, 'ddddd', 'eee', NULL, 1),
(25, NULL, 'eeeee', 'ee', NULL, 1),
(27, NULL, 'dddd', 'ss', 'sao ta', 0);

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
  `PressOnly` int(11) DEFAULT NULL
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
(17, 100000, 200000, 300000),
(18, 4000, 5000, 6000),
(19, 32000, 42000, 22000),
(24, 3333, 2222, NULL),
(25, 222, 333, 0),
(27, 2, 1, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `invoicecustomerview`
--
CREATE TABLE `invoicecustomerview` (
`InId` int(11)
,`Cid` int(11)
,`DateCreate` timestamp
,`TotalPrice` int(11)
,`TotalPay` int(11)
,`Vat` int(11)
,`Discount` int(11)
,`IsExpress` int(11)
,`Note` text
,`LastStatus` int(11)
,`Active` int(11)
,`Name` varchar(50)
,`Phone` varchar(15)
,`Email` varchar(50)
,`Address` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `invoicedetailcustomerview`
--
CREATE TABLE `invoicedetailcustomerview` (
`InId` int(11)
,`DateCreate` timestamp
,`TotalPrice` int(11)
,`TotalPay` int(11)
,`Vat` int(11)
,`Discount` int(11)
,`IsExpress` int(11)
,`InvoiceNote` text
,`LastStatus` int(11)
,`InvoiceActive` int(11)
,`Did` int(11)
,`Pid` int(11)
,`UnitPrice` int(11)
,`TypePrice` varchar(20)
,`Quantity` int(11)
,`CID` int(11)
,`Name` varchar(50)
,`Phone` varchar(15)
,`Email` varchar(50)
,`Address` varchar(50)
,`CustomerNote` text
,`CustomerActive` int(1)
,`EnName` varchar(150)
,`VnName` varchar(150)
);

-- --------------------------------------------------------

--
-- Structure for view `invoicecustomerview`
--
DROP TABLE IF EXISTS `invoicecustomerview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `motivation`.`invoicecustomerview`  AS  select `I`.`InId` AS `InId`,`I`.`Cid` AS `Cid`,`I`.`DateCreate` AS `DateCreate`,`I`.`TotalPrice` AS `TotalPrice`,`I`.`TotalPay` AS `TotalPay`,`I`.`Vat` AS `Vat`,`I`.`Discount` AS `Discount`,`I`.`IsExpress` AS `IsExpress`,`I`.`Note` AS `Note`,`I`.`LastStatus` AS `LastStatus`,`I`.`Active` AS `Active`,`C`.`Name` AS `Name`,`C`.`Phone` AS `Phone`,`C`.`Email` AS `Email`,`C`.`Address` AS `Address` from (`motivation`.`invoice` `I` join `motivation`.`customer` `C`) where ((1 = 1) and (`I`.`Cid` = `C`.`CID`)) order by `I`.`DateCreate` desc ;

-- --------------------------------------------------------

--
-- Structure for view `invoicedetailcustomerview`
--
DROP TABLE IF EXISTS `invoicedetailcustomerview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `motivation`.`invoicedetailcustomerview`  AS  select `I`.`InId` AS `InId`,`I`.`DateCreate` AS `DateCreate`,`I`.`TotalPrice` AS `TotalPrice`,`I`.`TotalPay` AS `TotalPay`,`I`.`Vat` AS `Vat`,`I`.`Discount` AS `Discount`,`I`.`IsExpress` AS `IsExpress`,`I`.`Note` AS `InvoiceNote`,`I`.`LastStatus` AS `LastStatus`,`I`.`Active` AS `InvoiceActive`,`D`.`Did` AS `Did`,`D`.`Pid` AS `Pid`,`D`.`UnitPrice` AS `UnitPrice`,`D`.`TypePrice` AS `TypePrice`,`D`.`Quantity` AS `Quantity`,`C`.`CID` AS `CID`,`C`.`Name` AS `Name`,`C`.`Phone` AS `Phone`,`C`.`Email` AS `Email`,`C`.`Address` AS `Address`,`C`.`Note` AS `CustomerNote`,`C`.`Active` AS `CustomerActive`,`P`.`EnName` AS `EnName`,`P`.`VnName` AS `VnName` from (((`motivation`.`invoice` `I` join `motivation`.`invoicedetails` `D` on((`I`.`InId` = `D`.`InId`))) join `motivation`.`customer` `C` on((`I`.`Cid` = `C`.`CID`))) join `motivation`.`product` `P` on((`D`.`Pid` = `P`.`PID`))) order by `I`.`InId` desc ;

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
  MODIFY `CID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `INVOICE`
--
ALTER TABLE `INVOICE`
  MODIFY `InId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `INVOICEDETAILS`
--
ALTER TABLE `INVOICEDETAILS`
  MODIFY `Did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;
--
-- AUTO_INCREMENT for table `INVOICEHISTORY`
--
ALTER TABLE `INVOICEHISTORY`
  MODIFY `HId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `PRODUCT`
--
ALTER TABLE `PRODUCT`
  MODIFY `PID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `USER`
--
ALTER TABLE `USER`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{"db":"Motivation","table":"WASHTYPEPRICE"},{"db":"Motivation","table":"PRODUCT"},{"db":"Motivation","table":"INVOICE"},{"db":"Motivation","table":"INVOICEDETAILS"},{"db":"Motivation","table":"INVOICESTATUS"},{"db":"Motivation","table":"invoicedetailcustomerview"},{"db":"Motivation","table":"INVOICEDETAILCUSTOMERVIEW"},{"db":"Motivation","table":"invoicecustomerview"},{"db":"Motivation","table":"InvoiceCustomerView"},{"db":"Motivation","table":"CUSTOMER"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'Motivation', 'CUSTOMER', '{"sorted_col":"`CUSTOMER`.`CID`  DESC"}', '2016-03-09 15:14:22'),
('root', 'Motivation', 'INVOICE', '{"sorted_col":"`INVOICE`.`DateCreate` DESC"}', '2016-04-30 08:34:57'),
('root', 'Motivation', 'INVOICEDETAILS', '{"sorted_col":"`InId`  DESC"}', '2016-05-29 04:41:10'),
('root', 'Motivation', 'InvoiceCustomerView', '{"sorted_col":"`InvoiceCustomerView`.`InId` ASC"}', '2016-05-03 10:55:41'),
('root', 'Motivation', 'PRODUCT', '{"sorted_col":"`PRODUCT`.`PID`  DESC"}', '2016-03-09 15:29:16'),
('root', 'Motivation', 'invoicedetailcustomerview', '{"sorted_col":"`invoicedetailcustomerview`.`InId` ASC"}', '2016-05-18 13:32:16');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2016-02-27 09:05:28', '{"collation_connection":"utf8mb4_unicode_ci"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- Database: `quan_ly_no`
--
CREATE DATABASE IF NOT EXISTS `quan_ly_no` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `quan_ly_no`;

-- --------------------------------------------------------

--
-- Table structure for table `ghi_no`
--

CREATE TABLE `ghi_no` (
  `MaGhiNo` int(11) NOT NULL,
  `MaKH` int(11) NOT NULL,
  `NgayGhiNo` date NOT NULL,
  `SoTienNo` double NOT NULL,
  `GhiChuNo` text COLLATE utf8_unicode_ci,
  `IdThu1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ghi_no`
--

INSERT INTO `ghi_no` (`MaGhiNo`, `MaKH`, `NgayGhiNo`, `SoTienNo`, `GhiChuNo`, `IdThu1`) VALUES
(1, 98, '2014-01-12', 1832000, 'đợt 1', 11),
(2, 98, '2014-02-11', 1440000, 'đợt 2', 11),
(3, 98, '2014-04-24', 11840000, 'đợt 3', 11),
(4, 100, '2014-02-24', 5340000, 'đợt 1', 261),
(5, 99, '2014-06-11', 3860000, 'đợt 2', 243),
(6, 55, '2014-04-24', 5000000, 'nợ củ', 125),
(7, 44, '2013-11-23', 9626000, 'nợ cũ', 148),
(8, 33, '2014-01-21', 9178000, 'nợ cũ', 195),
(9, 34, '2014-01-26', 26040000, 'nợ cũ', -1),
(10, 34, '2014-06-14', 5640000, 'nợ mới đợt 1', -1),
(11, 97, '2014-01-09', 1500000, 'đợt 1', 57),
(12, 97, '2014-02-07', 1460000, 'đợt 2', 57),
(14, 97, '2014-06-10', 1630000, 'đợt 3', 57),
(15, 99, '2014-01-06', 1630000, 'đơt 1', 243),
(16, 100, '2014-06-10', 1370000, 'đợt 2', 261),
(17, 101, '2014-07-19', 4000000, 'đợt 1', 271),
(18, 102, '2014-02-17', 4040000, 'đợt 1', 32),
(19, 103, '2014-06-02', 7435000, 'đợt 1', 135),
(20, 104, '2014-02-18', 500000, 'đợt 1', 274),
(21, 105, '2014-03-20', 1000000, 'đợt 1', 213),
(22, 105, '2014-04-14', 660000, 'đợt 2', 213),
(23, 106, '2014-04-14', 1770000, 'đợt 1', 352),
(24, 106, '2014-05-09', 8020000, 'đợt 2', 352),
(25, 107, '2014-02-27', 2500000, 'đợt 1', 134),
(26, 107, '2014-06-05', 4300000, 'đợt 2', 134),
(27, 108, '2014-07-01', 4515000, 'đợt 1', 146),
(28, 109, '2014-03-18', 14185000, 'đợt 1', 214),
(29, 110, '2014-03-19', 940000, 'đợt 1', 39),
(30, 110, '2014-06-11', 3045000, 'đợt 2', 39),
(31, 260, '2014-06-11', 2065000, 'phần của con', 53),
(32, 111, '2014-03-28', 2510000, 'đợt 1', 109),
(33, 111, '2014-05-12', 3780000, 'đợt 2', 109),
(34, 112, '2014-04-06', 3790000, 'đợt 1', 54),
(35, 113, '2014-04-20', 7440000, 'đợt 1', 240),
(36, 115, '2014-05-11', 4310000, 'đợt 1', 330),
(37, 35, '2014-01-15', 4100000, 'nợ cũ', 244),
(38, 35, '2014-05-20', 10710000, 'nợ mới đợt 1', 244),
(39, 116, '2014-06-04', 2600000, 'đợt 1', 58),
(40, 117, '2014-06-06', 2590000, 'đợt 1', 41),
(41, 118, '2014-06-07', 4850000, 'đợt 1', 45),
(42, 119, '2014-05-11', 6415000, 'đợt 1', 337),
(43, 119, '2014-06-10', 2120000, 'đợt 2', 337),
(44, 120, '2014-06-07', 6815000, 'đợt 1', 62),
(45, 121, '2014-06-08', 7120000, 'đợt 1', 10),
(46, 122, '2014-06-10', 3840000, 'đợt 1', 142),
(47, 123, '2014-06-12', 3150000, 'đợt 1', 66),
(48, 124, '2014-06-10', 5670000, 'đợt 1', 258),
(49, 125, '2014-06-13', 6160000, 'đợt 1', 40),
(52, 126, '2014-06-15', 8950000, 'đợt 1', 99),
(53, 127, '2014-06-21', 1365000, 'đợt 1', 228),
(55, 128, '2014-06-17', 2985000, 'đợt 1', 230),
(56, 129, '2014-06-29', 1260000, 'ĐỢT 1', 59),
(57, 153, '2014-07-06', 1820000, 'ĐỢT 1', 268),
(58, 242, '2014-07-08', 2530000, 'Đợt 1', -1),
(59, 114, '2014-07-13', 7108000, 'ĐỢT 1', 107),
(60, 130, '2014-01-20', 1980000, 'nợ cũ', 42),
(61, 246, '2014-02-06', 1455000, 'đợt 1', 176),
(62, 246, '2014-04-12', 1190000, 'đợt 2', 176),
(63, 246, '2014-05-11', 1680000, 'đợt 3', 176),
(64, 246, '2014-07-06', 3170000, 'đợt 4', 176),
(65, 131, '2014-02-10', 1920000, 'đợt 1', 167),
(66, 132, '2014-02-11', 1180000, 'đợt 1', 49),
(67, 132, '2014-04-07', 170000, 'đợt 2', 49),
(68, 133, '2014-04-30', 1890000, 'đợt 1', 166),
(69, 133, '2014-06-06', 3180000, 'đợt 2', 166),
(70, 134, '2014-02-23', 800000, 'đợt 1', 154),
(71, 134, '2014-05-22', 1490000, 'đợt 2', 154),
(72, 135, '2014-03-04', 1880000, 'đợt 1', 157),
(73, 135, '2014-04-30', 5100000, 'đợt 2', 157),
(75, 136, '2014-06-10', 2440000, 'tổng số', 9),
(76, 135, '2014-06-01', 4680000, 'đợt 3', 157),
(77, 137, '2014-03-05', 2270000, 'đợt 1', 165),
(78, 137, '2014-06-10', 4780000, 'đợt 2', 165),
(79, 138, '2014-03-14', 1500000, 'đợt 1', 115),
(80, 138, '2014-05-16', 1630000, 'đợt 2', 115),
(81, 139, '2014-03-02', 1460000, 'đợt 1', 202),
(82, 139, '2014-06-11', 1845000, 'đợt 2', 202),
(83, 140, '2014-05-18', 1760000, 'đợt 1', 225),
(84, 140, '2014-07-14', 1000000, 'đợt 2', 225),
(85, 141, '2014-04-04', 940000, 'đợt 1', 140),
(86, 141, '2014-06-13', 460000, 'đợt 2', 140),
(87, 142, '2014-04-14', 1000000, 'đợt 1', 65),
(88, 142, '2014-06-23', 1040000, 'đợt 2', 65),
(89, 143, '2014-04-14', 1040000, 'đợt 1', 656),
(90, 144, '2013-08-31', 600000, 'nợ cũ', 267),
(91, 144, '2014-04-27', 510000, 'đợt 1', 267),
(93, 146, '2014-04-19', 340000, 'đợt 1', -1),
(94, 147, '2014-02-08', 2565000, 'đợt 1', 198),
(95, 147, '2014-03-17', 460000, 'đợt 2', 198),
(96, 147, '2014-06-12', 5600000, 'đợt 3', 198),
(97, 148, '2014-02-09', 1190000, 'đợt 1', 232),
(98, 148, '2014-03-05', 620000, 'đợt 2', 232),
(99, 148, '2014-06-10', 1170000, 'đợt 3', 232),
(100, 149, '2014-02-06', 1550000, 'đợt 1', 172),
(101, 149, '2014-03-18', 820000, 'đợt 2', 172),
(102, 149, '2014-06-13', 3150000, 'đợt 3', 172),
(105, 151, '2014-02-09', 1000000, 'đợt 1', 91),
(106, 151, '2014-05-04', 1540000, 'đợt 2', 91),
(107, 151, '2014-07-16', 1890000, 'đợt 3', 91),
(108, 152, '2014-02-21', 1340000, 'đợt 1', 85),
(109, 152, '2014-06-12', 2860000, 'đợt 2', 85),
(110, 223, '2014-06-12', 2520000, 'đợt 1', 101),
(111, 247, '2014-02-14', 2000000, 'đợt 1', 257),
(112, 247, '2014-05-12', 14480000, 'đợt 2', 257),
(114, 155, '2014-06-20', 1890000, 'đợt 2', 132),
(115, 155, '2014-07-17', 945000, 'đợt 3Mua thuốc sâu', 132),
(116, 156, '2014-03-20', 2480000, 'đợt 1', 192),
(117, 156, '2014-06-01', 3150000, 'đợt 2', 192),
(118, 156, '2014-07-08', 2910000, 'đợt 3', 192),
(119, 158, '2014-02-11', 500000, 'đợt 1', 90),
(120, 158, '2014-04-14', 620000, 'đợt 2', 90),
(121, 158, '2014-06-10', 1610000, 'đợt 3', 90),
(122, 159, '2014-02-15', 800000, 'đợt 1', 326),
(123, 159, '2014-05-09', 4740000, 'đợt 2', 326),
(124, 160, '2014-02-13', 2140000, 'đợt 1', 158),
(125, 161, '2014-02-19', 980000, 'đợt 1', -1),
(126, 162, '2014-06-06', 2340000, 'đợt 1', 161),
(127, 162, '2014-07-04', 1750000, 'đợt 2', 161),
(128, 47, '2013-11-30', 1000000, 'nợ cũ', 77),
(129, 47, '2014-02-25', 920000, 'đợt 1', 77),
(130, 47, '2014-06-01', 3780000, 'đợt 2', 77),
(131, 163, '2014-03-06', 1000000, 'đợt 1', 152),
(132, 163, '2014-06-07', 525000, 'đợt 2', 152),
(133, 163, '2014-07-15', 2870000, 'đợt 3', 152),
(134, 164, '2014-01-15', 2780000, 'đợt 1', 150),
(135, 164, '2014-02-13', 2880000, 'đợt 2', 150),
(136, 164, '2014-03-16', 2290000, 'đợt 3', 150),
(137, 165, '2014-04-08', 3400000, 'đợt 1', 164),
(139, 166, '2014-04-01', 1000000, 'đợt 1', 211),
(140, 167, '2014-04-12', 6200000, 'đợt 1', 279),
(141, 168, '2014-04-11', 1760000, 'đợt 1', 285),
(142, 85, '2014-07-28', 1300000, 'đợt 2', 67),
(143, 170, '2014-04-09', 900000, 'đợt 1', 239),
(144, 170, '2014-06-23', 950000, 'đợt 2', 239),
(145, 171, '2014-06-10', 950000, 'đợt 1', 278),
(146, 172, '2014-04-30', 3180000, 'đợt 1', 272),
(148, 174, '2014-04-13', 1090000, 'đợt 1', 69),
(149, 174, '2014-06-27', 3260000, 'đợt 2', 69),
(150, 175, '2014-04-18', 1190000, 'đợt 1', 83),
(151, 175, '2014-06-01', 780000, 'đợt 2', 83),
(152, 175, '2014-06-06', 1550000, 'đợ 3', 83),
(153, 175, '2014-07-03', 2240000, 'đợt 4', 83),
(154, 176, '2014-04-28', 730000, 'đợt 1', 310),
(155, 176, '2014-06-17', 1160000, 'đợt 2', 310),
(156, 177, '2014-04-21', 385000, 'đợt 1', 236),
(157, 178, '2014-04-24', 855000, 'đợt 1', 277),
(158, 178, '2014-06-07', 9005000, 'đợt 2', 277),
(159, 51, '2014-06-10', 2670000, 'đợt 1', 21),
(160, 180, '2014-06-10', 2580000, 'đợt 1', 76),
(161, 180, '2014-07-09', 2900000, 'đợt 2', 76),
(162, 181, '2014-05-02', 3250000, 'đợt 1', 247),
(163, 182, '2014-06-22', 3150000, 'tổng cộng', 105),
(164, 183, '2014-05-01', 990000, 'đợt 1', 251),
(165, 183, '2014-05-08', 1260000, 'đợt 2', 251),
(166, 183, '2014-06-07', 8420000, 'đợt 3', 251),
(167, 184, '2014-05-08', 20000000, 'đợt 1', 238),
(168, 184, '2014-07-02', 23490000, 'đợt 2', 238),
(169, 185, '2014-05-08', 1720000, 'đợt 1', 396),
(170, 185, '2014-06-05', 700000, 'đợt 2', 396),
(171, 186, '2014-05-08', 3270000, 'đợt 1', 339),
(172, 187, '2014-05-07', 1200000, 'đợt 1', 94),
(173, 187, '2014-06-12', 1860000, 'đợt 2', 94),
(174, 187, '2014-06-20', 3450000, 'đợt 3', 94),
(175, 188, '2014-05-15', 14705000, 'đợt 1', 256),
(176, 189, '2014-06-09', 4120000, 'đợt 1', 217),
(177, 189, '2014-07-17', 3120000, 'đợt 2', 217),
(178, 190, '2014-06-14', 6965000, 'tổng cộng', 31),
(179, 191, '2014-05-15', 2260000, 'đợt 1', 151),
(180, 191, '2014-06-23', 845000, 'đợt 2', 151),
(181, 192, '2014-05-15', 1630000, 'đợt 1', 131),
(182, 193, '2014-05-15', 2090000, 'đợt 1', 291),
(183, 195, '2014-07-14', 7980000, 'đợt 1', 19),
(184, 196, '2014-05-15', 3000000, 'đợt 1', 23),
(187, 198, '2014-05-27', 2010000, 'đợt 1', 509),
(189, 164, '2014-05-22', 4170000, 'đợt 4', 150),
(190, 164, '2014-06-10', 8200000, 'đợt 5', 150),
(191, 199, '2014-05-16', 960000, 'đợt 1', 143),
(192, 199, '2014-07-06', 4220000, 'đợt 2', 143),
(193, 200, '2014-05-27', 1050000, 'đợt 1', 348),
(194, 248, '2013-01-13', 2250000, 'đợt 1', 336),
(195, 248, '2013-07-18', 4370000, 'đợt 2', 336),
(196, 201, '2013-10-09', 1000000, 'nợ cũ', 25),
(197, 201, '2014-03-02', 2570000, 'đợt 1', 25),
(198, 201, '2014-04-02', 690000, 'đợt 2', 25),
(199, 201, '2014-05-25', 710000, 'đợt 3', 25),
(200, 179, '2014-04-16', 2150000, 'đợt 1', 124),
(201, 179, '2014-06-10', 2820000, 'đợt 2', 124),
(202, 179, '2014-07-11', 1890000, 'đợt 3', 124),
(203, 59, '2014-06-07', 8050000, 'đợt 1', 177),
(204, 202, '2014-06-09', 2210000, 'đợt 1', 17),
(205, 203, '2014-06-07', 3720000, 'đợt 1', 190),
(206, 204, '2014-06-09', 12150000, 'đợt 1', 249),
(207, 205, '2014-06-05', 1445000, 'đợt 1', 80),
(208, 206, '2014-06-12', 9190000, 'đợt 1', 79),
(209, 249, '2013-06-26', 1735000, 'đợt 1 nợ cũ', 110),
(210, 249, '2013-08-25', 1000000, 'dợt 2', 110),
(211, 249, '2013-09-08', 1320000, 'đợt 3', 110),
(212, 207, '2014-07-31', 3160000, 'đợt 1', 114),
(213, 208, '2014-06-08', 3920000, 'đợt 1', 517),
(214, 209, '2014-06-10', 7030000, 'đợt 1', 497),
(215, 210, '2014-06-12', 5120000, 'đợt 1', 155),
(216, 211, '2014-06-12', 3460000, 'đợt 1', 319),
(217, 212, '2014-06-10', 6370000, 'đợt 1', 237),
(218, 213, '2014-06-12', 6750000, 'đợt 1', 74),
(219, 214, '2014-06-11', 460000, 'đợt 1', 212),
(220, 215, '2014-06-11', 9150000, 'đợt 1', 95),
(221, 216, '2014-06-11', 4590000, 'đợt 1', 81),
(223, 218, '2014-06-14', 2065000, 'đợt 1', 93),
(224, 218, '2014-07-18', 1950000, 'đợt 2', 93),
(225, 172, '2014-06-13', 3150000, 'đợt 2', 272),
(226, 172, '2014-07-15', 4270000, 'đợt 3', 272),
(227, 201, '2014-06-10', 2385000, 'đợt 4', 25),
(228, 219, '2014-06-09', 1460000, 'đợt 1', 87),
(229, 220, '2014-06-08', 3210000, 'đợt 1', 160),
(230, 221, '2014-06-12', 2220000, 'đợt 1', 222),
(231, 49, '2014-01-17', 3000000, 'nợ cũ', 235),
(232, 49, '2014-06-12', 1250000, 'đợt 1', 235),
(233, 222, '2014-06-12', 1000000, 'đợt 1', 191),
(234, 61, '2014-01-21', 2000000, 'đợt 1', 181),
(235, 61, '2014-03-22', 1460000, 'đợt 2', 181),
(236, 61, '2014-06-05', 6560000, 'đợt 3', 181),
(237, 61, '2014-06-10', 810000, 'đợt 4', 181),
(238, 48, '2014-06-10', 1510000, 'đợt 1', 153),
(240, 225, '2014-06-16', 935000, 'tông cộng', 111),
(241, 226, '2014-06-13', 1200000, 'đợt 1', 187),
(242, 227, '2014-06-13', 2340000, 'đợt 1', 188),
(243, 228, '2014-06-14', 2260000, 'đợt 1', 112),
(244, 229, '2014-07-08', 6560000, 'đợt 1', 46),
(247, 231, '2014-06-16', 5520000, 'đợt 1', 88),
(248, 231, '2014-07-12', 890000, 'đợt 2', 88),
(249, 232, '2014-06-16', 2450000, 'đợt 1', 133),
(250, 233, '2014-06-13', 1710000, 'tổng cộng', 29),
(251, 234, '2014-06-07', 1920000, 'đợt 1', 233),
(253, 235, '2014-06-10', 5270000, 'đợt 1', 182),
(254, 235, '2014-07-19', 9920000, 'đợt 2', 182),
(255, 236, '2014-07-04', 2240000, 'đợt 1', 264),
(256, 250, '2014-07-11', 980000, 'đợt 1', 179),
(257, 239, '2013-03-14', 4000000, 'nợ cũ', 184),
(258, 239, '2014-07-09', 2000000, 'đợt 1', 184),
(259, 155, '2014-02-13', 1000000, 'đợt 1', 132),
(260, 57, '2013-12-29', 3000000, 'đợt 1', 51),
(261, 57, '2014-01-21', 960000, 'đợt 2', 51),
(262, 56, '2013-09-15', 2820000, 'nợcũ', 82),
(263, 58, '2014-01-12', 740000, 'đợt 1', 281),
(264, 58, '2014-06-10', 1020000, 'đợt 2', 281),
(265, 60, '2014-01-12', 2000000, 'đợt 1', 205),
(266, 60, '2014-03-14', 2000000, 'đợt 2', 205),
(267, 60, '2014-03-27', 530000, 'đợt 3', 205),
(268, 60, '2014-05-29', 3000000, 'đợt 4', 205),
(269, 62, '2014-01-15', 8090000, 'đợt 1', 270),
(270, 63, '2014-01-16', 2000000, 'đợt 1', 203),
(271, 63, '2014-06-09', 6645000, 'đợt 2', 203),
(272, 63, '2014-07-18', 6980000, 'đợt 3', 203),
(273, 63, '2014-06-09', 2520000, 'con chị lan', 203),
(274, 251, '2014-01-23', 1485000, 'đợt 1', 288),
(275, 252, '2014-05-09', 2920000, 'tổng cộng ', 48),
(276, 66, '2014-01-24', 1440000, 'đợt 1', 185),
(277, 66, '2014-03-18', 990000, 'đợt 2', 185),
(278, 66, '2014-06-13', 1890000, 'đợt 3', 185),
(279, 67, '2014-01-24', 2420000, 'đợt 1', 299),
(280, 68, '2014-01-23', 1445000, 'đợt 1', 173),
(281, 253, '2014-07-15', 5850000, 'đợt 1', 33),
(282, 254, '2013-08-16', 1372000, 'Nợ cũ', 350),
(283, 204, '2014-07-21', 13255000, 'đợt 2', 249),
(284, 223, '2014-07-19', 2950000, 'ĐỢT 2', 101),
(285, 135, '2014-07-20', 3780000, 'đợt 4', 157),
(286, 137, '2014-07-19', 5245000, 'đợt 3', 165),
(287, 70, '2014-04-03', 2400000, 'nợ đợt 1', 183),
(288, 70, '2014-07-20', 5130000, 'đợt 2', 183),
(289, 71, '2014-05-03', 3320000, 'đợt 1', 15),
(290, 71, '2014-06-13', 10710000, 'ĐỢT 2', 15),
(292, 73, '2014-06-05', 1980000, 'đợt 2', 297),
(293, 73, '2014-06-12', 1230000, 'đợt 3', 297),
(294, 256, '2014-07-16', 890000, 'đợt 1', 304),
(295, 45, '2014-04-18', 360000, 'đợt 1', 302),
(296, 45, '2014-06-10', 1090000, 'đợt 2', 302),
(297, 75, '2014-05-01', 4480000, 'đợt 1', 12),
(298, 76, '2014-06-14', 1300000, 'tổng cộng', 322),
(299, 77, '2014-05-17', 690000, 'đợt 1', 145),
(300, 78, '2014-06-06', 5680000, 'tổng cộng đợt 1', 104),
(301, 78, '2014-07-21', 2570000, 'đợt 2', 104),
(302, 79, '2014-07-21', 2300000, 'tổng cộng 2đợt', 92),
(303, 80, '2014-05-07', 760000, 'đợt 1', 52),
(304, 81, '2014-06-05', 7020000, 'đợt 1', 3),
(305, 82, '2014-06-06', 1210000, 'đợt 1', 265),
(306, 82, '2014-07-06', 1600000, 'đọt 2', 265),
(307, 83, '2014-06-06', 2150000, 'đợt 1', 253),
(308, 84, '2014-06-26', 1225000, 'đợt 1', 102),
(309, 84, '2014-07-09', 1260000, 'đợt 2', 102),
(310, 40, '2014-02-21', 8488000, 'nợ cũ', 171),
(311, 40, '2014-06-07', 4510000, 'đợt 1', 171),
(312, 39, '2014-06-08', 1465000, 'tổng cộng đợt 1', 313),
(313, 85, '2014-06-13', 2650000, 'tổng cộng đợt 1', 67),
(314, 86, '2014-06-02', 4550000, 'đợt 1', 64),
(315, 257, '2014-06-11', 1260000, 'đợt 1', 170),
(316, 88, '2014-07-19', 2925000, 'đợt 1', 331),
(317, 43, '2013-06-10', 1950000, 'nợ cũ', 113),
(318, 43, '2014-06-12', 2090000, 'đợt 1', 113),
(319, 89, '2014-06-10', 1260000, 'đợt 1', 612),
(320, 90, '2014-06-11', 1890000, 'đợt 1', 242),
(321, 93, '2014-06-16', 1150000, 'đợt 1', 207),
(322, 94, '2014-06-22', 1795000, 'đợt 1', 292),
(323, 95, '2014-06-29', 2290000, 'tổng cộng đợt 1', 8),
(324, 96, '2014-06-25', 4375000, 'đợt 1', 4),
(325, 87, '2014-07-07', 2520000, 'đợt 1', 263),
(326, 258, '2014-06-26', 3920000, 'đợt 1', 266),
(327, 259, '2014-06-24', 1890000, 'ĐỢT 1', 119),
(328, 39, '2013-03-21', 1000000, 'NỢ CŨ', 313),
(329, 128, '2014-07-21', 1390000, 'đợt  2', 230),
(330, 216, '2014-07-25', 4410000, 'đợt 2', 81),
(331, 61, '2014-07-25', 3570000, 'Đợt 5', 181),
(332, 228, '2014-07-25', 2580000, 'đợt 2', 112),
(333, 148, '2014-07-19', 1890000, 'đợt 4', 232),
(334, 241, '2014-07-12', 1950000, 'đợt 1', 26),
(335, 240, '2014-07-14', 1780000, 'đợt 1', 100),
(336, 162, '2014-07-20', 2730000, 'đợt 3', 161),
(337, 150, '2014-02-08', 1000000, 'đợt 1', 55),
(338, 150, '2014-06-12', 4790000, 'đợt 2', 55),
(340, 54, '2014-01-23', 3630000, 'nợ cũ', 286),
(341, 54, '2014-03-15', 1910000, 'đợt 1', 286),
(342, 54, '2014-07-18', 9450000, 'đợt  3', 286),
(343, 51, '2014-07-25', 3240000, 'đợt 2', 21),
(344, 187, '2014-07-16', 1320000, 'đợt 4', 94),
(345, 59, '2014-07-22', 5150000, 'đợt 2', 177),
(346, 69, '2014-05-02', 5015000, 'Tổng cộng đợt 1', 303),
(347, 69, '2014-07-17', 1300000, 'đợt 2', 303),
(348, 261, '2014-06-21', 1940000, 'Đợt 1 con chị Tuyết', 229),
(350, 165, '2014-05-07', 3120000, 'đợt 2', 164),
(351, 165, '2014-07-28', 4745000, 'đợt 3', 164),
(352, 169, '2014-04-15', 3320000, 'Tổng cộng đợt 1', 260),
(353, 169, '2014-07-13', 2055000, 'Tổng cộng đợt 2', 260),
(354, 152, '2014-07-29', 2825000, 'đợt 3', 85),
(356, 71, '2014-07-30', 13445000, 'Đợt 3', 15),
(357, 109, '2014-07-29', 7650000, 'Đợt 2', 214),
(358, 83, '2014-08-01', 1950000, 'Đợt 2', 253),
(359, 36, '2014-08-01', 41698000, 'nợ cũ', 276),
(360, 180, '2013-07-12', 3985000, 'Nợ cũ', 76),
(361, 158, '2014-07-27', 1825000, 'đợt 4', 90),
(362, 54, '2014-06-14', 810000, 'đợt 2', 286),
(364, 183, '2014-08-02', 8230000, 'Đợt 4', 251),
(365, 233, '2014-07-28', 2600000, 'đợt 2', 29),
(366, 263, '2014-07-31', 2290000, 'Đợt 1', 259),
(367, 156, '2014-08-01', 690000, 'đợt 4Mua thuốc sâu', 192),
(368, 194, '2014-07-26', 4420000, 'tổng cộng đợt 1', 162),
(369, 253, '2014-07-27', 5850000, 'đợt 2', 33),
(370, 262, '2014-07-27', 2000000, 'Đợt 1', 201),
(371, 97, '2014-07-19', 2310000, 'đợt 4', 57),
(372, 97, '2014-08-03', 2810000, 'đợt 5', 57),
(373, 219, '2014-08-03', 1300000, 'Đợt 2', 87),
(374, 264, '2014-08-03', 6500000, 'Đợt 1', 178),
(375, 65, '2014-08-03', 1320000, 'Đợt 1', 323),
(377, 265, '2014-07-25', 25200000, 'Đợt 1', 227),
(378, 238, '2013-02-03', 7500000, 'Còn lại tiền lãi 1062000', 308),
(379, 266, '2012-11-17', 4055000, 'Nợ cũ', 293),
(380, 213, '2013-07-09', 1000000, 'Nơ cũ', 74),
(381, 267, '2014-08-04', 2035000, 'Đợt 1', 50),
(384, 106, '2014-07-01', 15600000, 'Đợt 3', 352),
(385, 106, '2014-07-29', 6200000, 'Đợt 4', 352),
(386, 182, '2014-08-02', 2600000, 'Đợt 2', 105),
(387, 190, '2014-08-05', 5200000, 'Đợt 2', 31),
(388, 191, '2014-08-04', 2070000, 'Đợt 3', 151),
(389, 192, '2014-08-04', 2070000, 'Đợt 2', 131),
(390, 268, '2013-06-10', 4125000, 'Nợ cũ', -1),
(391, 211, '2014-08-01', 1260000, 'Đợt 2', 319),
(392, 212, '2014-07-31', 6745000, 'Đợt 2', 237),
(393, 222, '2014-07-31', 1260000, 'Đợt 2', 191),
(394, 226, '2014-07-31', 3650000, 'Đợt 2', 187),
(395, 231, '2014-08-05', 2890000, 'Đợt 3', 88),
(396, 269, '2014-07-09', 1260000, 'Đợt 1', 231),
(397, 52, '2014-07-28', 1320000, 'Đợt 1', 89),
(398, 52, '2013-11-17', 7500000, 'Nợ cũ', 89),
(399, 173, '2014-06-20', 4170000, 'Tổng cộng đợt 1', 75),
(400, 173, '2014-08-03', 2520000, 'Đợt 2', 75),
(401, 149, '2014-08-06', 3200000, 'Đợt 4', 172),
(402, 50, '2014-01-26', 1200000, 'Nợ cũ', -1),
(403, 168, '2014-05-14', 3010000, 'Đợt 2', 285),
(404, 198, '2014-06-10', 3600000, 'Đợt 2', 509),
(405, 58, '2014-07-30', 650000, 'Đợt 3', 281),
(406, 252, '2014-07-30', 730000, 'Đợt 2', 48),
(407, 66, '2014-07-27', 1690000, 'đợt 4', 185),
(408, 224, '2014-06-14', 920000, 'Đợt 1', 300),
(409, 133, '2014-07-30', 3980000, 'Đợt 3', 166),
(410, 138, '2014-07-22', 1300000, 'Đợt 3', 115),
(411, 145, '2014-04-18', 345000, 'Đợt 1', 5),
(412, 91, '2014-06-15', 1380000, 'Đợt 1', 144),
(413, 91, '2014-07-25', 1590000, 'Đợt 2', 144),
(414, 95, '2014-08-01', 5200000, 'Đợt 2', 8),
(415, 46, '2014-03-09', 1860000, 'Nợ cũ', 627),
(416, 38, '2014-03-10', 2789000, 'Nợ cũ', 250),
(417, 237, '2013-06-03', 1040000, 'Nợ cũ', 296),
(418, 270, '2014-07-21', 2395000, 'Đợt 1', 63),
(419, 255, '2014-07-23', 1320000, 'Đợt 1', 305),
(420, 271, '2014-07-26', 1480000, 'Đợt 1', 169),
(421, 272, '2014-07-26', 890000, 'Đợt 1', 245),
(422, 105, '2014-07-22', 1560000, 'Đợt 3', 213),
(423, 35, '2014-07-23', 5525000, 'Đợt 2', 244),
(424, 273, '2014-06-11', 890000, 'Đợt 1', 44),
(425, 273, '2014-08-06', 680000, 'Đợt 2', 44),
(427, 123, '2014-07-21', 2660000, 'Đợt 2', 66),
(429, 107, '2014-08-07', 3250000, 'Đợt 3', 134),
(430, 141, '2014-08-08', 630000, 'Đợt 3', 140),
(431, 38, '2014-08-07', 1090000, 'Đợt 1', 250),
(432, 164, '2014-08-09', 8995000, 'Đợt 6', 150),
(433, 276, '2014-01-30', 11582000, 'Nợ cũ', 128),
(434, 198, '2014-08-10', 1440000, 'Đợt 3', 509),
(435, 184, '2014-08-10', 1880000, 'Đợt 3 Thuốc sâu', 238),
(436, 277, '2014-08-10', 1950000, 'Đợt 1', 628),
(438, 242, '2014-07-19', 1950000, 'Đợt 2', -1),
(439, 242, '2014-08-10', 450000, 'Đợt 3 thuốc sâu', -1),
(440, 206, '2014-08-11', 4000000, 'Đợt 2', 79),
(441, 90, '2014-08-12', 1765000, 'Đợt 2', 242),
(442, 147, '2014-08-12', 2440000, 'Đợt 4', 198),
(443, 278, '2014-05-30', 630000, 'Đợt 1', -1),
(444, 51, '2014-08-12', 2890000, 'Đợt 3', 21),
(445, 51, '2014-04-10', 660000, 'Nợ cũ', 21),
(446, 160, '2014-08-12', 1890000, 'Đợt 2', 158),
(447, 279, '2014-08-13', 1950000, 'Đợt 1', 7),
(448, 139, '2014-08-13', 8250000, 'Đợt 3', 202),
(449, 280, '2014-08-13', 1120000, 'Đợt 1', 273),
(450, 281, '2014-08-14', 690000, 'Đợt 1', 657),
(451, 41, '2014-01-30', 1733000, 'Nợ cũ', 301),
(452, 282, '2013-06-22', 1500000, 'Nợ cũ', 130),
(453, 283, '2013-07-05', 630000, 'Nợ cũ', 27),
(454, 42, '2013-07-30', 5800000, 'Nợ cũ', -1),
(455, 42, '2013-09-05', 9960000, 'Nợ cũ Đợt 2', -1),
(456, 32, '2014-01-30', 2000000, 'nợ cũ', 638),
(458, 130, '2014-08-16', 700000, 'Đợt 1', 42),
(459, 184, '2014-08-22', 23310000, 'Đợt 4', 238),
(460, 82, '2014-08-24', 1600000, 'Đợt 3', 265),
(461, 145, '2014-08-24', 4850000, 'Đợt 1', 246),
(462, 285, '2014-08-24', 5745000, 'Đợt 1', 121),
(463, 187, '2014-08-24', 3700000, 'Đợt 5', 94),
(464, 243, '2014-07-13', 1260000, 'Đợt 1', 72),
(465, 244, '2014-07-13', 1890000, 'Đợt 1', 73),
(466, 245, '2014-07-13', 1630000, 'ĐỢT 1', 106),
(467, 73, '2014-08-01', 445000, 'Đợt 4', 297),
(468, 286, '2014-06-20', 2800000, 'Đợt 1', 47),
(469, 69, '2014-08-24', 2670000, 'Đợt 3', 303),
(470, 264, '2014-08-25', 975000, 'Đợt 2', 178),
(471, 62, '2014-07-31', 1200000, 'Đợt 2', 270),
(472, 287, '2014-08-02', 3270000, 'Đợt 1', 16),
(473, 201, '2014-07-17', 1260000, 'Đợt 5', 25),
(474, 288, '2014-07-28', 1805000, 'Đợt 1', 204),
(475, 269, '2014-08-17', 500000, 'Đợt 2', 231),
(476, 241, '2014-08-25', 1950000, 'Đợt 2', 26),
(477, 289, '2014-05-17', 4600000, 'Tổng cộng đợt 1', 139),
(479, 47, '2014-08-26', 3900000, 'Đợt 3', 77),
(480, 175, '2014-08-25', 2410000, 'Đợt 5', 83),
(481, 195, '2014-08-25', 6200000, 'Đợt 2', 19),
(482, 290, '2014-06-06', 6500000, 'Đợt 1', 18),
(483, 290, '2014-06-29', 5670000, 'Đợt 2', 18),
(484, 290, '2014-07-15', 875000, 'Đợt 3', 18),
(485, 100, '2014-08-25', 5290000, 'Đợt 3', 261),
(486, 128, '2014-08-25', 1159000, 'Đợt 3', 230),
(487, 188, '2014-08-26', 10150000, 'Đợt 2', 256),
(488, 247, '2014-08-26', 3250000, 'Đợt 3', 257),
(489, 34, '2014-08-26', 3000000, 'Đợt 2', -1),
(490, 213, '2014-08-27', 1000000, 'Đợt 2', 74),
(491, 174, '2014-08-26', 4550000, 'Đợt 3', 69),
(492, 135, '2014-08-27', 5500000, 'Đợt 5', 157),
(493, 87, '2014-08-27', 2600000, 'Đợt 2', 263),
(494, 106, '2014-08-28', 4700000, 'Đợt 5', 352),
(495, 111, '2014-08-26', 1300000, 'Đợt 3', 109),
(496, 181, '2014-08-28', 370000, 'Đợt 2', 247),
(498, 199, '2014-08-28', 4550000, 'Đợt 3', 143),
(499, 179, '2014-08-28', 5200000, 'Đợt 4', 124),
(500, 210, '2014-08-28', 1860000, 'Đợt 2', 155),
(501, 218, '2014-08-28', 1950000, 'Đợt 3', 93),
(502, 48, '2014-08-28', 1300000, 'Đợt 2', 153),
(503, 232, '2014-08-28', 3250000, 'Đợt 2', 133),
(504, 52, '2014-08-28', 3000000, 'Đợt 2', 89),
(505, 190, '2014-08-28', 3900000, 'Đợt 3', 31),
(506, 291, '2014-08-28', 5500000, 'Đợt 1', 248),
(508, 292, '2014-08-28', 8950000, 'Đợt 1', 194),
(509, 201, '2014-08-28', 2310000, 'Đợt 6', 25),
(510, 56, '2014-08-28', 5280000, 'Đợt 1', 82),
(511, 198, '2014-08-29', 4760000, 'Đợt 4', 509),
(512, 189, '2014-08-29', 3110000, 'Đợt 3', 217),
(513, 63, '2014-08-28', 7060000, 'Đợt 4', 203),
(516, 228, '2014-08-31', 1950000, 'Đợt 3', 112),
(517, 122, '2014-08-30', 1950000, 'Đợt 2', 142),
(518, 227, '2014-08-31', 1335000, 'Đợt 2', 188),
(520, 246, '2014-08-31', 1950000, 'Đợt 5', 176),
(521, 293, '2014-09-01', 3900000, 'Đợt 1', 61),
(522, 108, '2014-09-01', 1470000, 'Đợt 2', 146),
(523, 180, '2014-09-01', 1200000, 'Đợt 3', 76),
(524, 123, '2014-09-01', 3250000, 'Đợt 3', 66),
(525, 294, '2014-09-01', 685000, 'Đợt 1', 206),
(526, 172, '2014-08-12', 610000, 'Đợt 4', 272),
(527, 105, '2014-09-03', 1300000, 'Đợt 3', 213),
(528, 97, '2014-09-02', 2010000, 'Đợt 6', 57),
(529, 150, '2014-08-30', 1000000, 'Đợt 3', 55),
(530, 165, '2014-09-01', 7230000, 'Đợt 4', 164),
(531, 217, '2013-05-07', 30000000, 'Nợ cũ đợt 1', -1),
(534, 172, '2014-09-05', 1780000, 'Đợt 5', 272),
(535, 59, '2014-09-07', 5930000, 'Đợt 3', 177),
(537, 230, '2014-09-12', 7800000, 'Đợt 3 cộng cả thuốc cỏ', 295),
(538, 98, '2014-07-29', 3320000, 'Đợt 4', 11),
(539, 98, '2014-09-06', 3720000, 'Đợt 1', 320),
(541, 204, '2014-09-07', 8660000, 'Đợt 3', 249),
(542, 96, '2014-09-08', 1335000, 'Đợt 1', 189),
(543, 71, '2014-09-08', 10540000, 'Đợt 4', 15),
(544, 194, '2014-09-10', 3410000, 'Đợt 2', 162),
(545, 289, '2014-09-10', 1650000, 'Đợt 2', 139),
(546, 288, '2014-09-12', 2480000, 'Đợt 2', 204),
(547, 295, '2014-09-11', 2925000, 'Đợt 1', 275),
(548, 296, '2014-08-10', 1390000, 'Đợt 1', 174),
(549, 297, '2014-08-10', 1410000, 'Đợt 1', 84),
(550, 298, '2014-09-11', 865000, 'Đợt 1', 70),
(551, 128, '2014-09-12', 1370000, 'Đợt 4', 230),
(552, 235, '2014-09-12', 7700000, 'Đợt 3', 182),
(553, 233, '2014-09-12', 3525000, 'Đợt 3', 29),
(554, 163, '2014-09-12', 1240000, 'Đợt 4', 152),
(555, 190, '2014-09-12', 4960000, 'Đợt 4', 31),
(556, 133, '2014-09-12', 3185000, 'Đợt 4', 166),
(557, 86, '2014-09-12', 3050000, 'Đợt 2', 64),
(558, 56, '2014-09-12', 1240000, 'Đợt 2', 82),
(561, 299, '2014-09-12', 2805000, 'Đợt 3', 199),
(562, 207, '2014-09-12', 1240000, 'Đợt 2', 114),
(563, 300, '2014-09-12', 3720000, 'Đợt 1', 197),
(564, 148, '2014-09-12', 1300000, 'Đợt 5', 232),
(565, 269, '2014-09-12', 4960000, 'Đợt 3', 231),
(566, 195, '2014-09-12', 1240000, 'Đợt 3', 19),
(567, 176, '2014-09-12', 770000, 'Đợt 3', 310),
(568, 230, '2014-09-13', 1240000, 'Đợt 4', 295),
(569, 169, '2014-09-13', 965000, 'Đợt 3', 260),
(570, 173, '2014-09-13', 2480000, 'Đợt 3', 75),
(571, 242, '2014-09-13', 3720000, 'Đợt 4', -1),
(572, 216, '2014-09-14', 3720000, 'Đợt 3', 81),
(573, 220, '2014-09-14', 1300000, 'Đợt 2', 160),
(574, 61, '2014-09-14', 3300000, 'ĐỢT 6', 181),
(575, 211, '2014-09-14', 1240000, 'Đợt 3', 319),
(576, 162, '2014-09-14', 3900000, 'Đợt 4', 161),
(577, 301, '2014-08-28', 1490000, 'Tổng cộng đợt 1', 252),
(578, 196, '2014-08-26', 810000, 'Đợt 2', 23),
(579, 208, '2014-09-14', 1300000, 'Đợt 2', 517),
(580, 302, '2014-08-08', 2000000, 'Đợt 1', 13),
(581, 171, '2014-09-15', 345000, 'Đợt 2', 278),
(582, 152, '2014-09-15', 2750000, 'Đợt 4', 85),
(583, 183, '2014-09-16', 620000, 'Đợt 5', 251),
(584, 212, '2014-09-16', 6200000, 'Đợt 3', 237),
(585, 259, '2014-09-16', 1950000, 'Đợt 2', 119),
(586, 303, '2014-09-16', 2600000, 'Đợt 1', -1),
(587, 85, '2014-09-16', 1680000, 'Đợt 3', 67),
(588, 197, '2014-10-19', 14450000, 'Tổng cộng 2đợt', 216),
(589, 273, '2014-09-17', 550000, 'Đợt 3', 44),
(590, 201, '2014-09-19', 1020000, 'Đợt 7', 25),
(591, 155, '2014-09-20', 1860000, 'Đợt 4', 132),
(592, 187, '2014-09-23', 1335000, 'Đợt 6', 94),
(593, 70, '2014-08-09', 600000, 'Đợt 3', 183),
(594, 287, '2014-08-28', 770000, 'Đợt 2', 16),
(595, 164, '2014-09-24', 11050000, 'Đợt 7', 150),
(596, 58, '2014-09-24', 360000, 'Đợt 4', 281),
(597, 304, '2013-11-16', 4580000, 'Tổng số nợ cũ', 637),
(598, 144, '2014-07-23', 775000, 'Đợt 2', 267),
(599, 77, '2014-07-31', 445000, 'Đợt 2', 145),
(600, 91, '2014-09-14', 430000, 'Đợt 3', 144),
(601, 92, '2014-06-14', 560000, 'Đợt 1', 141),
(602, 139, '2014-08-28', 2200000, 'Đợt 4', 202),
(603, 95, '2014-09-14', 5280000, 'Đợt 1', 108),
(604, 136, '2014-09-12', 620000, 'Đợt 1', 68),
(605, 305, '2014-07-15', 3000000, 'Đợt 1', 210),
(606, 306, '2014-09-01', 5850000, 'Đợt 1', 86),
(607, 106, '2014-09-27', 7440000, 'Đợt 6', 352),
(608, 54, '2014-09-27', 3250000, 'Đợt 4', 286),
(609, 287, '2014-09-27', 3900000, 'Đợt 1', 20),
(610, 176, '2014-09-28', 370000, 'Đợt 4', 310),
(611, 289, '2014-09-26', 590000, 'Đợt 3', 139),
(612, 200, '2014-10-02', 360000, 'Đợt 2', 348),
(613, 204, '2014-10-03', 730000, 'Đợt 4', 249),
(614, 201, '2014-10-04', 590000, 'Đợt 8', 25),
(615, 264, '2014-09-26', 2955000, 'Đợt 3', 178),
(616, 307, '2014-09-01', 2500000, 'Đợt 1', 43),
(617, 157, '2014-09-17', 3850000, 'Đợt 1', 175),
(622, 308, '2014-06-16', 2665000, 'Đợt 1', 36),
(623, 121, '2014-10-27', 1240000, 'Đợt 2', 137),
(624, 309, '2014-08-20', 1150000, 'Đợt 1', 289),
(625, 310, '2014-06-13', 2560000, 'Đợt 1', 71),
(626, 65, '2014-10-17', 170000, 'thuốc cỏ', 323),
(627, 69, '2014-09-08', 360000, 'Thuốc sâu', 303),
(628, 311, '2014-09-01', 1545000, 'Tổng cộng đợt 1', 149),
(630, 73, '2014-11-02', 500000, 'Đợt 5', 297),
(632, 312, '2014-06-15', 1890000, 'Đợt 1', 97),
(633, 313, '2014-06-15', 1500000, 'Đợt 1', 98),
(635, 314, '2014-08-28', 3900000, 'Đợt 1', 120),
(636, 315, '2014-09-10', 1240000, 'Đợt 1', 223),
(637, 132, '2014-02-11', 500000, 'Đợt 1', 332),
(638, 316, '2014-07-09', 1500000, 'Đợt 1', 208),
(639, 82, '2014-11-12', 2700000, 'đợt 4', 265),
(640, 317, '2014-03-14', 7000000, 'Nợ cũ', 219),
(641, 184, '2014-11-14', 3380000, 'Đợt 5', 238),
(642, 318, '2014-09-12', 5500000, 'Đợt 1', 241),
(643, 319, '2014-09-13', 3720000, 'Nợ  đợt 1', 280),
(645, 320, '2014-05-01', 360000, 'Đợt 1', 284),
(646, 320, '2011-08-10', 560000, 'Đợt 1', -1),
(647, 184, '2015-01-26', 8349000, 'ống nước', 345),
(648, 184, '2015-01-29', 5520000, 'Đợt 1', 345),
(649, 321, '2015-01-13', 2760000, 'Đợt 1', 328),
(650, 179, '2014-12-22', 1945000, 'ĐỢT 1', 426),
(651, 56, '2015-01-26', 5980000, 'tổng số tiền đợt 1', 484),
(652, 150, '2015-01-17', 1862000, 'Nợ cũ còn lại', 440),
(653, 150, '2015-01-30', 1788000, 'Thuốc sâu ống  nước', 440),
(654, 228, '2014-12-27', 740000, 'Đợt 1', 376),
(657, 322, '2015-02-04', 920000, 'Đợt 1', 459),
(658, 52, '2015-02-10', 3085000, 'Đợt 1', 450),
(659, 291, '2015-02-10', 1000000, 'Đợt 1', 325),
(660, 158, '2015-02-05', 2619000, 'Đợt 1', 525),
(661, 218, '2015-02-07', 920000, 'Đợt 1', 511),
(663, 152, '2015-02-04', 2481000, 'tiền ống nước', 386),
(664, 60, '2015-02-08', 3400000, 'Đợt 1', 555),
(665, 56, '2015-02-12', 1380000, 'Đợt 2', 484),
(666, 190, '2015-02-16', 880000, 'Đợt 1', 298),
(669, 164, '2015-01-28', 1680000, 'Đợt 1', 356),
(670, 189, '2015-02-10', 2360000, 'Đợt 1', 479),
(671, 140, '2014-12-25', 920000, 'Đợt 1', 477),
(672, 78, '2015-01-16', 1485000, 'Một thùng ríc', 294),
(673, 131, '2015-01-19', 975000, 'Đợt 1', 347),
(674, 272, '2015-01-13', 665000, 'Đợt 1', 490),
(675, 79, '2015-01-21', 2825000, 'tổng số đợt 1', 518),
(676, 133, '2015-02-04', 2300000, 'Đợt 1', 329),
(677, 323, '2015-02-07', 775000, 'Đợt 1', -1),
(678, 103, '2015-02-08', 2490000, 'Đợt 1', 581),
(679, 137, '2015-02-10', 2760000, 'Đợt 1', 546),
(680, 257, '2015-02-11', 920000, 'Đợt 1', 474),
(681, 140, '2015-02-12', 920000, 'Đợt 2', 477),
(682, 324, '2015-02-12', 920000, 'Đợt 1', 467),
(683, 82, '2015-03-13', 4500000, 'Đợt 1', 316),
(684, 156, '2015-02-14', 4020000, 'Đợt 1', 538),
(685, 325, '2015-02-15', 1465000, 'Đợt 1', -1),
(687, 97, '2015-01-18', 1950000, 'Đợt 1', 416),
(689, 223, '2015-02-13', 1660000, 'Đợt 1', 404),
(690, 51, '2015-02-13', 1465000, 'Đợt 1', 523),
(691, 276, '2014-06-04', 2070000, 'Đợt 1', 504),
(692, 276, '2014-07-11', 4410000, 'ĐỢT 2', 504),
(694, 121, '2014-12-24', 5000000, 'Đợt 1', 383),
(696, 326, '2015-01-07', 1200000, 'Đợt 1', 333),
(697, 109, '2015-01-21', 10625000, 'Đợt 1', 529),
(701, 97, '2015-02-13', 1350000, 'Đợt 2', 416),
(703, 110, '2015-02-01', 1030000, 'Đợt 1', 334),
(704, 99, '2015-02-05', 3680000, 'Đợt 1', 476),
(705, 98, '2015-02-02', 1780000, 'Đợt 1 của 2015', 320),
(706, 116, '2015-02-09', 4004000, 'Đợt 1', 434),
(707, 102, '2015-02-10', 7715000, 'Đợt 1', 604),
(708, 328, '2015-02-10', 4290000, 'Đợt 1', 576),
(709, 122, '2015-02-13', 2395000, 'Đợt 1', 432),
(710, 292, '2015-03-01', 4810000, 'Đợt 1', 527),
(711, 139, '2015-02-09', 660000, 'Đợt 1 của năm 2015', 311),
(712, 323, '2015-02-28', 300000, 'ĐỢT 2', -1),
(713, 137, '2015-03-03', 1005000, 'Đợt 2', 546),
(715, 246, '2015-02-24', 830000, 'Đợt 1', 443),
(716, 330, '2015-02-12', 1380000, 'Đợt 1', 475),
(717, 134, '2015-02-28', 1350000, 'Đợt 1', 481),
(719, 44, '2015-03-03', 2200000, 'Đợt 1', -1),
(720, 73, '2015-03-03', 450000, 'Đợt 1', 651),
(721, 303, '2015-02-28', 2760000, 'Đợt 1 của 2015', -1),
(722, 289, '2015-01-16', 3280000, 'Đợt 1', 367),
(725, 184, '2015-02-24', 5080000, 'Đợt 2', 345),
(726, 204, '2015-01-30', 3837000, 'Đợt 1 tổng cộng phân ống nước của 2015', 631),
(729, 158, '2015-03-02', 460000, 'Đợt 2', 525),
(731, 216, '2015-01-29', 450000, 'Đợt 1', 435),
(732, 201, '2015-02-16', 830000, 'Đợt 1', 482),
(734, 160, '2015-02-27', 4600000, 'Đợt 1', -1),
(736, 276, '2015-03-03', 1990000, 'Đợt 1 của năm 2015', 504),
(738, 66, '2015-03-04', 630000, 'Đơt 1', 455),
(739, 107, '2015-03-01', 2075000, 'Đợt 1 của năm 2015', 536),
(740, 327, '2015-03-03', 1635000, 'Đợt 2', 528),
(741, 331, '2015-03-02', 920000, 'Đợt 1', -1),
(742, 332, '2015-03-03', 2210000, 'Đợt 1', 393),
(743, 333, '2015-03-03', 6810000, 'Đợt 1', -1),
(744, 100, '2015-02-27', 2120000, 'Đợt 1 của năm 2015', 537),
(745, 119, '2015-01-19', 3500000, 'Đợt 3', 337),
(746, 90, '2015-03-06', 900000, 'Đợt 1', 614),
(749, 69, '2015-01-21', 870000, 'Đợt cuối', 303),
(750, 54, '2015-03-13', 1860000, 'Đợt 1', 644),
(753, 150, '2015-02-24', 2300000, 'Đợt 3', 440),
(754, 176, '2014-06-20', 1890000, '', 310),
(755, 322, '2015-03-09', 880000, 'Đợt 2', 459),
(756, 152, '2015-03-07', 450000, 'Đợt 1', 386),
(757, 287, '2015-03-14', 4410000, 'Tồng cộng đợt 1', 335),
(759, 164, '2015-03-09', 3320000, 'Đợt 2', 356),
(760, 301, '2015-03-01', 1490000, 'Đợt 1', 491),
(761, 58, '2015-02-11', 220000, 'Đợt 1', 620),
(762, 58, '2015-03-13', 460000, 'Đợt 2', 620),
(763, 148, '2015-03-09', 2240000, 'Tổng cộng đợt 1', 502),
(764, 173, '2015-02-13', 450000, 'Đợt 1', 407),
(765, 173, '2015-03-12', 900000, 'Đợt 2', 407),
(768, 227, '2015-03-06', 440000, 'Đợt 1', 344),
(769, 174, '2015-03-08', 3796000, 'Đợt1', 513),
(770, 48, '2015-03-08', 800000, 'Đợt 1', 448),
(771, 149, '2015-03-08', 1400000, 'Đợt 1', 420),
(772, 155, '2015-03-08', 1380000, 'Đợt 1', 458),
(773, 163, '2015-03-10', 1250000, 'Đợt 1', 560),
(774, 334, '2015-03-11', 1840000, 'Đợt 1', 338),
(775, 207, '2015-03-13', 1350000, 'Đợt 1', -1),
(776, 133, '2015-03-03', 1745000, 'Đợt 2', 329),
(777, 83, '2015-03-03', 400000, 'Đợt 1', 327),
(778, 141, '2015-03-08', 630000, 'Đợt 1', 462),
(779, 335, '2015-05-28', 1470000, 'Đợt 1', 501),
(780, 135, '2015-03-10', 2760000, 'Đợt 1', 649),
(781, 183, '2015-02-27', 5520000, 'Đợt 1', 449),
(783, 53, '2014-03-01', 1200000, '', 315),
(785, 131, '2015-04-01', 610000, 'Đợt 2', 347),
(786, 79, '2015-04-05', 660000, 'Đợt 2', 518),
(787, 103, '2015-04-01', 1370000, 'Đợt 2', 581),
(790, 65, '2015-04-07', 1400000, 'Đợt 1', -1),
(791, 38, '2015-04-07', 1575000, 'Đợt 1', -1),
(792, 280, '2015-04-06', 2000000, 'Đợt 1', 596),
(793, 322, '2015-03-26', 200000, 'Đợt 3', 459),
(794, 183, '2015-04-06', 2100000, 'Đợt 2', 449),
(796, 273, '2015-02-26', 830000, 'Đợt 1', 374),
(797, 61, '2015-03-06', 820000, 'Đợt 1 của năm 2015', 469),
(799, 334, '2015-03-26', 1220000, 'Đợt 2', 338),
(800, 191, '2015-03-13', 1140000, 'ống nước', 487),
(802, 166, '2015-01-29', 3666000, 'Phân cả ống nước', 550),
(805, 336, '2015-01-31', 2200000, 'Đợt 1', 324),
(806, 97, '2015-03-09', 920000, 'Đợt 3', 416),
(807, 327, '2015-01-31', 12565000, 'Đợt 1', 528),
(809, 110, '2015-03-23', 610000, 'Đợt 2', 334),
(810, 262, '2015-02-04', 2075000, 'Đợt 1', 577),
(811, 262, '2015-03-04', 1800000, 'Đợt 2', 577),
(813, 331, '2015-04-06', 600000, 'Đợt 2', -1),
(814, 108, '2015-03-19', 1280000, 'Tổng cộng  đợt 1', 473),
(815, 317, '2015-03-10', 1010000, 'Đợt 1', -1),
(816, 98, '2015-04-05', 7000000, 'Đợt 1', 549),
(817, 40, '2015-04-13', 5800000, 'Đợt 1 của năm 2015', 553),
(818, 231, '2015-04-14', 5390000, 'Đợt 1', 427),
(819, 317, '2015-04-13', 4600000, 'Đợt 2', -1),
(820, 337, '2015-04-13', 1020000, 'Đợt 1', 368),
(822, 66, '2015-04-19', 870000, 'Đợt 2', 455),
(824, 108, '2015-06-12', 955000, 'Thuốc vôi đồng lân', 473),
(825, 184, '2015-04-23', 7900000, 'Đợt 4', 345),
(826, 168, '2015-02-10', 447000, 'Còn lại', 343),
(827, 325, '2015-04-26', 870000, 'Đợt 2', -1),
(828, 183, '2015-04-30', 1220000, 'Đợt 3', 449),
(829, 236, '2015-05-02', 2320000, 'Đợt 1', 598),
(830, 182, '2015-05-03', 2695000, 'Đợt 1', 483),
(831, 339, '2015-05-06', 2440000, '', 617),
(832, 167, '2015-05-06', 2440000, 'Đợt 1', -1),
(833, 151, '2015-05-12', 2815000, 'Đợt 2', 516),
(834, 340, '2015-05-11', 2590000, 'Đợt 1', 418),
(835, 140, '2015-05-22', 1000000, 'Đợt 3', 477),
(836, 103, '2015-04-05', 3600000, 'Đợt 3', 581),
(837, 138, '2015-05-21', 1000000, 'Đợt 1', 471),
(838, 44, '2015-05-23', 535000, 'Đợt 2', -1),
(839, 73, '2015-05-20', 830000, 'Đợt 2', 651),
(840, 83, '2015-05-10', 700000, 'Đợt 1', 499),
(841, 135, '2015-05-13', 7500000, 'Đợt 2', 649),
(842, 69, '2015-05-06', 3075000, 'Tổng cộng đợt 1', 641),
(843, 35, '2015-05-22', 5250000, 'Đợt 1', 593),
(844, 128, '2015-05-15', 3555000, 'Đợt 1', 569),
(845, 328, '2015-05-21', 7050000, 'Đợt 2', 576),
(847, 97, '2015-05-20', 1890000, 'Đợt 4', 416),
(848, 179, '2015-05-20', 740000, 'Đợt 2', 426),
(849, 56, '2015-05-22', 3375000, 'Đợt 3', 484),
(850, 228, '2015-05-13', 1650000, 'Đợt 2', 376),
(851, 52, '2015-05-15', 3950000, 'Đợt 2', 450),
(852, 60, '2015-05-19', 844000, 'Đợt 2', 555),
(853, 223, '2015-05-21', 3032000, 'Đợt 2', 404),
(854, 51, '2015-05-14', 1840000, 'Đợt 2', 523),
(855, 54, '2015-05-20', 3050000, 'Đợt 2', 644),
(856, 66, '2015-05-20', 1410000, 'Đợt 3', 455),
(857, 61, '2015-05-23', 880000, 'Đợt 2', 469),
(858, 48, '2015-05-10', 1050000, 'Đợt 2', 448),
(859, 172, '2015-04-03', 450000, 'Đợt 1', 558),
(860, 172, '2015-05-17', 700000, 'Đợt 2', 558),
(861, 206, '2015-05-04', 2640000, 'Đợt 1', 355),
(863, 167, '2015-05-18', 1220000, 'Thuốc cỏ', -1),
(864, 341, '2015-05-06', 830000, 'Đợt 1', 588),
(866, 342, '2015-05-13', 3775000, 'Đợt 1', 648),
(867, 342, '2015-05-13', 5494000, 'Kẽm lưới', 648),
(868, 169, '2015-05-13', 980000, 'Đợt 1', 542),
(869, 181, '2015-04-29', 630000, 'Đợt 1', 378),
(870, 181, '2015-05-23', 1645000, 'Đợt 2', 378),
(871, 233, '2015-05-13', 1740000, 'Đợt 1', 358),
(872, 55, '2015-05-20', 1690000, 'Đợt 1', 446),
(873, 343, '2015-05-20', 1530000, 'Đợt 1', 506),
(874, 63, '2015-05-19', 1300000, 'Đợt 1 của năm 215', 409),
(875, 344, '2015-05-25', 5300000, 'Đợt 1', 387),
(876, 345, '2015-05-25', 5310000, 'Đợt 1', 388),
(877, 346, '2015-05-25', 3840000, 'Đợt 1', 351),
(878, 59, '2015-05-24', 5150000, 'Đợt 1', 532),
(879, 216, '2015-05-24', 6241000, 'Đợt 2', 435),
(880, 187, '2015-05-24', 1200000, 'Đợt 1', 346),
(881, 347, '2015-05-23', 3720000, 'Đợt 1', 423),
(882, 348, '2015-05-25', 875000, 'Đợt 1', 635),
(883, 133, '2015-05-24', 2000000, 'Đợt 1', 472),
(884, 184, '2015-05-30', 13680000, 'Đợt 4', 345),
(885, 40, '2015-05-30', 530000, 'Đợt 2 thuốc sâu thuốc cỏ', 553),
(886, 246, '2015-05-27', 2610000, 'Đợt 2', 443),
(887, 260, '2015-06-01', 2440000, 'Đợt 1', 430),
(888, 349, '2015-06-01', 2265000, 'Đợt 1', 395),
(889, 176, '2015-05-25', 400000, 'Đợt 1 của năm 2015', 410),
(890, 195, '2014-09-17', 2106000, 'kẽm lưới xe kéo', 397),
(891, 350, '2015-06-01', 810000, 'Đợt 1', 424),
(892, 184, '2015-06-04', 3880000, 'Đợt 5', 345),
(893, 178, '2015-05-06', 1220000, 'Đợt 1', 633),
(894, 250, '2015-05-20', 610000, 'Đợt 1', 554),
(895, 201, '2015-05-18', 1810000, 'Đợt 2 cộng kẽm lưới', 482),
(896, 351, '2015-06-07', 2990000, 'Đợt 1', 411),
(897, 244, '2015-06-07', 3310000, 'Đợt 1', 556),
(898, 114, '2015-06-07', 13810000, 'Đợt 1', 601),
(899, 56, '2015-06-12', 4952000, 'Đợt 4', 484),
(900, 180, '2015-06-07', 600000, 'Đợt 1 năm 2015', 421),
(901, 44, '2015-06-09', 4620000, 'Đợt 3', -1),
(903, 133, '2015-06-11', 1620000, 'Đợt 2', 472),
(904, 58, '2015-06-07', 525000, 'Đợt 3', 620),
(905, 124, '2015-06-10', 2975000, 'Đợt 1', 592),
(906, 105, '2015-06-10', 1740000, 'Đợt 1', 510),
(907, 352, '2015-06-11', 1300000, 'Đợt 1', 444),
(909, 122, '2015-06-14', 1710000, 'Đợt 2', 432),
(910, 331, '2015-06-14', 1140000, 'Đợt 3', -1),
(911, 245, '2015-06-14', 5454000, 'Đợt 1', 566),
(912, 232, '2015-05-11', 1000000, 'Đợt 1', 636),
(913, 175, '2015-05-11', 700000, 'Đợt 1 của 2015', 369),
(914, 289, '2015-05-24', 2620000, 'Đợt 2', 367),
(915, 169, '2015-05-22', 220000, 'Đợt 2', 542),
(916, 132, '2015-05-15', 220000, 'Đợt 1', -1),
(917, 178, '2015-06-14', 2165000, 'Đợt 2', 633),
(918, 187, '2015-06-14', 2250000, 'Đợt 2', 346),
(919, 350, '2015-06-14', 570000, 'Đợt 2', 424),
(922, 322, '2015-06-14', 1140000, 'Đợt 4', 459),
(923, 60, '2015-06-14', 8250000, 'Đợt 3', 555),
(925, 51, '2015-06-13', 710000, 'Thuốc cỏ men', 523),
(926, 319, '2015-06-01', 1150000, 'Đợt 1', 341),
(927, 273, '2015-06-13', 1385000, 'Đợt 2', 374),
(928, 190, '2015-06-14', 6350000, 'Đợt 1', 480),
(929, 291, '2015-06-14', 5525000, 'Đợt 1', 390),
(930, 79, '2015-06-14', 1490000, 'Đợt 3', 518),
(931, 137, '2015-06-14', 2000000, 'Đợt 3', 546),
(932, 90, '2015-06-13', 1200000, 'Đợt 2', 614),
(933, 136, '2015-03-13', 565000, 'Đợt 1', 375),
(934, 136, '2015-06-14', 1140000, 'Đợt 2', 375),
(935, 96, '2015-06-13', 1080000, 'Đợt 1', 364),
(936, 133, '2015-06-13', 1030000, 'Đợt 3 thuốc sâu', 472),
(937, 86, '2015-06-14', 3695000, 'Đợt 1', 621),
(938, 300, '2015-06-13', 2030000, 'Đợt 1', 460),
(939, 264, '2015-06-14', 4560000, 'Đợt 1', 522),
(940, 186, '2015-06-14', 3660000, 'Đợt 1', -1),
(943, 354, '2015-06-15', 1600000, 'Đợt 1', -1),
(944, 98, '2015-06-15', 3150000, 'Đợt 2', 549),
(947, 147, '2015-06-15', 2000000, 'Đợt 1', 464),
(948, 212, '2015-06-15', 5700000, 'Đơt 1', 543),
(949, 54, '2015-06-15', 2850000, 'Đợt 3', 644),
(950, 66, '2015-06-15', 1140000, 'Đợt 4', 455),
(951, 148, '2015-06-15', 2140000, 'Đợt 2', 502),
(952, 172, '2015-05-24', 340000, 'Đợt 3', 558),
(953, 172, '2015-06-15', 2850000, 'Đợt 4', 558),
(954, 221, '2015-06-15', 2410000, 'Đợt 1', 466),
(957, 150, '2015-06-16', 5130000, 'Đợt 4', 440),
(958, 203, '2015-06-16', 5100000, 'Đợt 1', 445),
(959, 168, '2015-06-16', 3890000, 'Đợt 1', 461),
(960, 231, '2015-06-16', 5700000, 'Đợt 2', 427),
(961, 189, '2015-06-16', 2850000, 'Đợt 2', 479),
(962, 301, '2015-06-16', 2850000, 'Đợt 2', 491),
(963, 211, '2015-06-16', 1140000, 'Đợt 1 của năm 2015', 632),
(964, 78, '2015-06-16', 3420000, 'Đợt 1', 413),
(965, 232, '2015-06-17', 1910000, 'Đợt 2', 636),
(966, 210, '2015-06-17', 2000000, 'Đợt 1', 521),
(968, 321, '2015-06-17', 4700000, 'Đợt 1', 415),
(969, 51, '2015-06-17', 13205000, 'Đợt 3', 523),
(970, 334, '2015-06-17', 2110000, 'Đợt 1', 349),
(971, 240, '2015-06-16', 2850000, 'Đợt 1', 498),
(972, 246, '2015-06-17', 1445000, 'Đợt 3', 443),
(973, 83, '2015-06-15', 1840000, 'Đợt 2', 499),
(974, 90, '2015-06-17', 1280000, 'Đợt 3', 614),
(975, 276, '2015-06-17', 3990000, 'Đợt 2', 504),
(977, 197, '2015-06-17', 7440000, 'Tổng cộng đợt 1', 425),
(978, 138, '2015-06-17', 1960000, 'Đợt 2', 471),
(979, 123, '2015-06-17', 3667000, 'Đợt 1', 597),
(980, 355, '2015-06-17', 3740000, 'Đợt 1', 354),
(982, 158, '2015-06-19', 2940000, 'Đợt 3', 525),
(984, 156, '2015-06-19', 4740000, 'Đợt 2', 538),
(985, 290, '2015-06-18', 4200000, 'Đợt 1', -1),
(986, 174, '2015-06-19', 4190000, 'Đợt 2', 513),
(987, 324, '2015-06-19', 1160000, 'Đợt 2', 467),
(988, 141, '2015-06-18', 1140000, 'Đợt 2', 462),
(989, 135, '2015-06-18', 4560000, 'Đợt 3', 649),
(990, 61, '2015-06-14', 6120000, 'Đợt 3', 469),
(991, 162, '2015-06-18', 2140000, 'Đợt 1', 453),
(992, 107, '2015-06-18', 2850000, 'Đợt 2', 536),
(994, 81, '2015-06-19', 5000000, 'Đợt 1', 362),
(996, 247, '2015-06-19', 10080000, 'Đợt 1 của năm 2015', 419),
(997, 356, '2015-06-18', 6250000, 'Đợt 1', 535),
(998, 357, '2015-06-18', 2950000, 'Đợt 1', 361),
(999, 358, '2015-06-18', 3920000, 'Đợt 1', 494),
(1000, 120, '2015-06-20', 2610000, 'Đợt 1', 610),
(1001, 327, '2015-06-18', 6100000, 'Đợt 3', 528),
(1002, 359, '2015-06-16', 5700000, 'Đợt 1', 441),
(1003, 88, '2015-06-20', 2370000, 'Đợt 1', 623),
(1004, 43, '2015-06-20', 2140000, 'Đợt 1 của năm 2015', 400),
(1005, 85, '2015-06-20', 1610000, 'Đợt 1', 422),
(1006, 350, '2015-06-20', 840000, 'Đợt 3', 424),
(1007, 180, '2015-06-20', 1725000, 'Đợt 2', 421),
(1008, 360, '2015-06-21', 3910000, 'Đợt 1', 456),
(1009, 183, '2015-06-20', 9210000, 'Đợt 4', 449),
(1010, 58, '2015-06-21', 790000, 'Đợt 4', 620),
(1011, 48, '2015-06-21', 1710000, 'Đợt 3', 448),
(1012, 155, '2015-06-20', 2410000, 'Đợt 2', 458),
(1013, 207, '2015-06-21', 1710000, 'Đợt 2', -1),
(1014, 188, '2015-06-21', 4310000, 'Đợt 1', -1),
(1015, 361, '2015-06-21', 3980000, 'Đợt 1', 616),
(1016, 182, '2015-06-21', 2618000, 'Đợt 2', 483),
(1017, 261, '2015-06-21', 2010000, 'Đợt 1', 645),
(1018, 129, '2015-06-21', 2875000, 'Đợt 1', 385),
(1019, 340, '2015-06-21', 1390000, 'Đợt 2', 418),
(1020, 99, '2015-06-20', 2260000, 'Đợt 2', 476),
(1022, 186, '2015-06-21', 1530000, 'Đợt 2', -1),
(1023, 134, '2015-06-21', 2290000, 'Đợt 2', 481),
(1024, 362, '2015-06-22', 2160000, 'Đợt 1', -1),
(1025, 149, '2015-06-22', 3710000, 'Đợt 2', 420),
(1026, 287, '2015-06-22', 4350000, 'Đợt 1', 562),
(1027, 147, '2015-06-22', 4830000, 'Đợt 2', 464),
(1028, 175, '2015-06-17', 2240000, 'Đợt 2', 369),
(1029, 185, '2015-06-22', 1720000, 'Đợt 1 của năm 2015', 396),
(1030, 176, '2015-06-23', 1710000, 'Đợt 2', 410),
(1031, 92, '2015-06-23', 570000, 'Đợt 1', 563),
(1032, 73, '2015-06-19', 1620000, 'Đợt 3', 651),
(1033, 190, '2015-06-23', 3140000, 'Đợt 2', 480),
(1034, 180, '2015-06-23', 2410000, 'Đợt 3', 421),
(1036, 201, '2015-06-23', 1165000, 'cả 2 đợt cộng lại', 482),
(1037, 204, '2015-06-24', 8070000, 'Đợt 2', 631),
(1038, 137, '2015-06-24', 4160000, 'Đợt 4', 546),
(1039, 78, '2015-06-24', 640000, 'Đợt 2', 413),
(1040, 226, '2015-06-24', 6050000, 'Đợt 1', 463),
(1041, 363, '2015-06-24', 5700000, 'Đợt 1', -1),
(1042, 136, '2015-06-24', 1110000, 'Đợt 3', 375),
(1043, 128, '2015-06-24', 1140000, 'Đợt 2', 569),
(1044, 239, '2015-06-24', 3000000, 'Đợt 1 của năm 2015', 608),
(1045, 364, '2015-06-25', 8055000, 'Đợt 1', 394),
(1046, 365, '2015-06-26', 2990000, 'Đợt 1', 524),
(1047, 109, '2015-06-22', 8960000, 'Đợt 2', 529),
(1048, 366, '2015-06-23', 5190000, 'Đợt 1', 574),
(1049, 367, '2015-06-22', 2540000, 'Đợt 1', 405),
(1050, 100, '2015-06-27', 4285000, 'Đợt 2', 537),
(1051, 328, '2015-06-23', 2700000, 'Đợt 3', 576),
(1052, 368, '2015-06-25', 2050000, 'Đợt 1', 503),
(1053, 179, '2015-06-19', 3000000, 'Đợt 3', 426),
(1054, 179, '2015-06-27', 845000, 'Tổng cộng mua thuốc sâu', 426),
(1055, 218, '2015-06-27', 2530000, 'Đợt 2', 511),
(1056, 173, '2015-06-19', 3070000, 'Đợt 3', 407),
(1057, 71, '2015-05-19', 6200000, 'Tổng cộng đợt 1', 363),
(1058, 71, '2015-06-14', 8240000, 'Đợt 2', 363),
(1059, 263, '2015-06-29', 2400000, 'Đợt 1', 622),
(1060, 150, '2015-06-29', 570000, 'Tổng cộng thuốc sâu', 440),
(1061, 87, '2015-07-03', 1660000, 'Đợt 1', 417),
(1062, 97, '2015-07-06', 5420000, 'Đợt 5', 416),
(1063, 328, '2015-07-06', 1440000, 'Thuốc sâu', 576),
(1064, 200, '2015-07-05', 1805000, 'Đợt 1', -1),
(1065, 369, '2015-07-08', 2280000, 'Đợt 1', -1),
(1066, 370, '2015-07-05', 975000, 'Đợt 1', 380),
(1067, 133, '2015-07-08', 2535000, 'Đợt 4', 472),
(1068, 77, '2015-07-08', 428000, 'Đợt 1', 489),
(1069, 371, '2015-07-09', 4220000, 'Đợt 1', 365),
(1070, 372, '2015-07-09', 1590000, 'Đợt 1', -1),
(1071, 373, '2015-07-05', 3425000, 'Đợt 1', 619),
(1072, 286, '2015-06-26', 2520000, 'Đợt 1', 625),
(1076, 120, '2015-07-10', 600000, 'Đợt 3', 610),
(1077, 198, '2015-05-05', 3100000, 'Đợt 1 của năm 2015', 509),
(1078, 198, '2015-07-08', 6840000, 'Đợt 2', 509),
(1079, 289, '2015-07-10', 3500000, 'Đợt 3', 367),
(1080, 194, '2015-06-19', 8605000, 'Tổng cộng đợt 1', 436),
(1081, 194, '2015-07-09', 2480000, 'Đợt 2', 436),
(1082, 55, '2015-07-08', 9120000, 'Đợt 2', 446),
(1083, 355, '2015-07-10', 225000, 'Đợt 2', 354),
(1084, 291, '2015-07-09', 6800000, 'Đợt 2', 390),
(1085, 190, '2015-07-08', 3815000, 'Đợt 3', 480),
(1086, 202, '2015-07-21', 2000000, 'Đợt 1', 541),
(1087, 98, '2015-07-07', 5060000, 'Đợt 3', 549),
(1088, 179, '2015-07-09', 4480000, 'Đợt 4', 426),
(1089, 374, '2015-07-08', 6380000, 'Đợt 1', 408),
(1090, 52, '2015-07-09', 4480000, 'Đợt 4', 450),
(1091, 152, '2015-07-09', 3040000, 'Đợt 2', 386),
(1092, 197, '2015-07-08', 5630000, 'Đợt 2', 425),
(1093, 227, '2015-07-08', 2570000, 'Đợt 2', 565),
(1094, 163, '2015-07-08', 1710000, 'Đợt 2', 560),
(1095, 165, '2015-03-28', 1997000, 'Tổng cộng', 470),
(1096, 172, '2015-07-08', 2900000, 'Đợt 5', 558),
(1097, 246, '2015-07-08', 1140000, 'Đợt 4', 443),
(1099, 375, '2015-07-08', 1140000, 'Đợt 1', 571),
(1100, 73, '2015-07-09', 570000, 'Đợt 4', 651),
(1101, 335, '2015-07-10', 1680000, 'Đợt 2', 501),
(1102, 69, '2015-07-09', 2640000, 'Đợt 2', 641),
(1103, 234, '2015-07-08', 1380000, 'Đợt 1', 582),
(1104, 216, '2015-07-12', 4790000, 'Đợt 3', 435),
(1105, 231, '2015-07-16', 6720000, 'Đợt 3', 427),
(1106, 148, '2015-07-14', 570000, 'Đợt 3', 502),
(1107, 173, '2015-07-13', 2480000, 'Đợt 4', 407),
(1109, 169, '2015-07-11', 660000, 'Đợt 3', 542),
(1110, 249, '2015-07-11', 2240000, 'Đợt 1', -1),
(1111, 107, '2015-07-19', 3710000, 'Đợt 3', 536),
(1112, 83, '2015-07-12', 420000, 'Đợt 3', 499),
(1113, 376, '2015-05-13', 1380000, 'Đợt 1', 486),
(1114, 376, '2015-06-16', 1710000, 'Đợt 2', 486),
(1115, 188, '2015-07-15', 3990000, 'Đợt 2', -1),
(1116, 63, '2015-07-13', 3390000, 'Đợt 2', 409),
(1117, 377, '2015-07-16', 1010000, 'Đợt 1', 401),
(1118, 378, '2015-07-16', 1247000, 'Đợt 1', 384),
(1119, 211, '2015-07-15', 2280000, 'Đợt 2', 632),
(1120, 379, '2015-07-16', 2240000, 'Đợt 1', 478),
(1121, 219, '2015-07-13', 1190000, 'Đợt 1', 586),
(1122, 259, '2015-07-16', 1460000, 'Đợt 1', 412),
(1123, 380, '2015-07-15', 5250000, 'Đợt 1', 540),
(1124, 265, '2015-07-15', 10840000, 'Đợt 1', 600),
(1126, 381, '2015-07-14', 2240000, 'Đợt 1', 402),
(1127, 382, '2015-07-14', 3930000, 'Đợt 1', -1),
(1128, 317, '2015-07-14', 555000, 'Đợt 3', -1),
(1129, 106, '2015-01-31', 4400000, 'Đợt 1 năm 2015', 366),
(1130, 106, '2015-03-05', 6320000, 'Đợt 2', 366),
(1131, 106, '2015-06-19', 5010000, 'Đợt 3', 366),
(1132, 106, '2015-06-21', 5240000, 'Đợt 4', 366),
(1133, 106, '2015-07-10', 6800000, 'Đợt 5', 366),
(1134, 106, '2015-07-14', 7800000, 'Đợt 6', 366),
(1135, 122, '2015-07-22', 1860000, 'Đợt 3', 432),
(1137, 233, '2015-07-16', 1680000, 'Đợt 2', 358),
(1138, 300, '2015-07-20', 4380000, 'Đợt 2', 460),
(1139, 269, '2015-07-18', 2510000, 'Đợt 1', 567),
(1141, 158, '2015-07-18', 2250000, 'Đợt 4', 525),
(1142, 210, '2015-07-19', 3920000, 'Đợt 2', 521),
(1143, 262, '2015-03-31', 1400000, 'Đợt 3', 577),
(1144, 262, '2015-06-20', 8270000, 'Đợt 4', 577),
(1145, 98, '2015-07-19', 1420000, 'Đợt 4', 549),
(1146, 340, '2015-07-17', 740000, 'Đợt 3', 418),
(1147, 382, '2015-07-21', 1160000, 'Đợt 2', -1),
(1148, 383, '2015-07-18', 360000, 'Đợt 1', 547),
(1149, 128, '2015-07-20', 1280000, 'Đợt 3', 569),
(1150, 187, '2015-06-17', 3930000, 'Đợt 1', 653),
(1151, 35, '2015-07-29', 12140000, 'Đợt 2', 593),
(1152, 123, '2015-07-26', 4180000, 'Đợt 2', 597),
(1153, 97, '2015-07-25', 490000, 'Đợt 6', 416),
(1154, 103, '2015-05-28', 280000, 'Đợt 4', 581),
(1155, 103, '2015-07-26', 2770000, 'Đợt 5', 581),
(1156, 384, '2015-06-17', 410000, 'Đợt 1', -1),
(1157, 51, '2015-07-29', 9770000, 'Đợt 4', 523),
(1158, 374, '2015-07-29', 1180000, 'Đợt 2', 408),
(1159, 137, '2015-07-31', 7024000, 'năm cuộn lưới', 546),
(1160, 106, '2015-07-31', 5053000, 'Đợt 7', 366),
(1161, 105, '2015-08-01', 1110000, 'Đợt 2', 510),
(1162, 262, '2015-08-02', 4410000, 'Đợt 5', 577),
(1163, 54, '2015-08-11', 6470000, 'Đợt 4', 644),
(1164, 56, '2015-08-03', 11345000, 'Đợt 5', 484),
(1165, 164, '2015-08-04', 7580000, 'Đợt 1', 630),
(1167, 88, '2015-08-04', 400000, 'Đợt 2', 623),
(1168, 142, '2015-06-18', 1140000, 'Đợt 1', 530),
(1169, 145, '2015-08-05', 4672000, 'Đợt 1', 564),
(1170, 101, '2015-08-05', 6000000, 'ĐỢT 1', 624),
(1171, 100, '2015-08-04', 4940000, 'Đợt 4', 537),
(1172, 63, '2015-08-06', 5910000, 'Đợt 3', 409),
(1173, 59, '2015-08-07', 4260000, 'Đợt 2', 532),
(1174, 350, '2015-08-06', 1120000, 'Đợt 4', 424),
(1175, 180, '2015-08-06', 907000, 'Đợt 4', 421),
(1176, 60, '2015-08-06', 2960000, 'Đợt 4', 555),
(1177, 287, '2015-08-11', 5960000, 'Đợt 2', 562),
(1178, 212, '2015-08-06', 6200000, 'Đợt 2', 543),
(1179, 230, '2015-06-16', 8550000, 'Đợt 1', 589),
(1180, 230, '2015-06-18', 3420000, 'Đợt 2', 589);
INSERT INTO `ghi_no` (`MaGhiNo`, `MaKH`, `NgayGhiNo`, `SoTienNo`, `GhiChuNo`, `IdThu1`) VALUES
(1181, 230, '2015-08-06', 12400000, 'Đợt 3', 589),
(1182, 240, '2015-08-06', 2220000, 'Đợt 2', 498),
(1183, 162, '2015-08-07', 680000, 'Đợt 2', 453),
(1184, 124, '2015-08-06', 2670000, 'Đợt 2', 592),
(1185, 106, '2015-08-06', 6560000, 'Đợt 8', 366),
(1186, 179, '2015-08-04', 830000, 'Mua thuốc sâu', 426),
(1187, 229, '2015-08-05', 4660000, 'Đợt 1', 372),
(1188, 204, '2015-08-07', 9920000, 'Đợt 3', 631),
(1189, 322, '2015-08-05', 1240000, 'Đợt 5', 459),
(1190, 218, '2015-08-07', 2320000, 'Đợt 3', 511),
(1191, 189, '2015-08-06', 2700000, 'Đợt 3', 479),
(1192, 276, '2015-08-06', 3720000, 'Đợt 3', 504),
(1194, 148, '2015-08-06', 2405000, 'Đợt 4', 502),
(1195, 174, '2015-08-06', 4320000, 'Đợt 3', 513),
(1196, 172, '2015-08-06', 745000, 'Đợt 6', 558),
(1197, 167, '2015-08-07', 1610000, 'Đợt3', -1),
(1198, 385, '2015-08-06', 1110000, 'Đợt 1', 508),
(1199, 140, '2015-08-07', 2900000, 'Đợt 4', 477),
(1200, 79, '2015-07-21', 1740000, 'Đợt 4', 518),
(1201, 170, '2015-08-05', 1120000, 'Đợt 1', 544),
(1202, 246, '2015-08-06', 1680000, 'Đợt 5', 443),
(1203, 330, '2015-08-06', 2730000, 'Đợt 2', 475),
(1204, 254, '2015-08-06', 2500000, 'Đợt 1', 357),
(1205, 134, '2015-08-07', 1680000, 'Đợt 3', 481),
(1206, 73, '2015-08-06', 2854000, 'Mua lưới rào', 651),
(1207, 135, '2015-08-07', 6200000, 'Đợt 4', 649),
(1208, 139, '2015-08-06', 2623000, 'Đợt 1', 664),
(1209, 96, '2015-08-06', 3100000, 'Đợt 2', 364),
(1210, 76, '2015-08-06', 600000, 'Đợt 1', 660),
(1211, 133, '2015-08-06', 3420000, 'Đợt 5', 472),
(1212, 137, '2015-08-06', 6180000, 'Đợt 5', 546),
(1213, 138, '2015-08-06', 2590000, 'Đợt 3', 471),
(1214, 181, '2015-08-06', 1120000, 'Đợt 3', 378),
(1215, 183, '2015-08-08', 8060000, 'Đợt 5', 449),
(1216, 127, '2015-08-08', 7440000, 'Đợt 1', 505),
(1217, 78, '2015-08-08', 4450000, 'Đợt 3', 413),
(1218, 364, '2015-08-10', 6050000, 'Đợt 2', 394),
(1219, 331, '2015-08-08', 1240000, 'Đợt 4', -1),
(1220, 321, '2015-08-09', 3100000, 'Đợt 2', 415),
(1221, 206, '2015-08-10', 9300000, 'Đợt 1', 512),
(1222, 120, '2015-08-10', 3840000, 'Đợt 4', 610),
(1223, 120, '2015-07-06', 1050000, 'Đợt 2', 610),
(1224, 151, '2015-08-10', 1924000, 'Đợt 3', 516),
(1225, 150, '2015-08-09', 4280000, 'Đợt 5', 440),
(1226, 85, '2015-08-09', 1730000, 'Đợt 2', 422),
(1227, 159, '2015-08-09', 2480000, 'Đợt 1 của năm 2015', -1),
(1228, 386, '2015-08-06', 1800000, 'Đợt 1', 539),
(1229, 387, '2015-08-07', 1360000, 'Đợt 1', 398),
(1230, 338, '2015-08-09', 5530000, 'Đợt 2', 580),
(1231, 388, '2015-08-09', 2180000, 'Đợt 1', -1),
(1233, 111, '2015-08-11', 3200000, 'Đợt 1', 526),
(1234, 347, '2015-08-12', 1110000, 'Đợt 2', 423),
(1236, 360, '2015-08-11', 3500000, 'Đợt 2', 456),
(1237, 194, '2015-08-11', 3720000, 'Đợt 3', 436),
(1238, 61, '2015-08-11', 6850000, 'Đợt 4', 469),
(1239, 207, '2015-08-11', 1805000, 'Đợt 3', -1),
(1240, 257, '2015-08-12', 1200000, 'Đợt 2', 474),
(1241, 83, '2015-08-11', 2480000, 'Đợt 4', 499),
(1244, 149, '2015-08-12', 4220000, 'Đợt 3', 420),
(1245, 390, '2015-08-12', 2150000, 'Đợt 1', 650),
(1246, 88, '2015-08-12', 1800000, 'Đợt 2', 623),
(1247, 285, '2015-08-12', 5460000, 'Đợt 1', 360),
(1248, 163, '2015-08-13', 1110000, 'Đợt 3', 560),
(1249, 98, '2015-08-13', 3600000, 'Đợt 5', 549),
(1251, 291, '2015-08-13', 8800000, 'Đợt 3', 390),
(1252, 51, '2015-08-13', 1630000, 'Đợt 5', 523),
(1253, 66, '2015-08-13', 2340000, 'Đợt 5', 455),
(1254, 301, '2015-08-13', 2750000, 'Đợt 3', 491),
(1255, 39, '2015-08-13', 425000, 'Đợt 1', 613),
(1256, 131, '2015-08-15', 2190000, 'Đợt 1', 681),
(1257, 43, '2015-08-13', 1610000, 'Đợt 2', 400),
(1259, 206, '2015-08-18', 2020000, 'Đợt 2', 512),
(1260, 270, '2015-08-08', 2380000, 'tổng cộng đợt 1', 680),
(1261, 128, '2015-08-22', 2235000, 'Đợt 4', 569),
(1262, 98, '2015-08-22', 4800000, 'Đợt 6', 549),
(1263, 365, '2015-08-22', 6110000, 'Đợt 2', 524),
(1264, 194, '2015-08-22', 1000000, 'Đợt 4', 436),
(1266, 324, '2015-08-22', 1860000, 'Đợt 3', 467),
(1267, 280, '2015-08-20', 1000000, 'Đợt 2', 596),
(1269, 58, '2015-08-22', 1390000, 'Đợt 5', 620),
(1270, 173, '2015-08-23', 2480000, 'Đợt 5', 407),
(1271, 198, '2015-08-23', 5580000, 'Đợt 3', 509),
(1272, 289, '2015-08-20', 4800000, 'Đợt 4', 367),
(1273, 169, '2015-08-22', 565000, 'Đợt 4', 542),
(1274, 63, '2015-08-22', 1250000, 'Đợt 4', 409),
(1275, 178, '2015-08-22', 4140000, 'Đợt 3', 633),
(1276, 391, '2015-08-22', 1240000, 'Đợt 1', 414),
(1277, 108, '2015-08-22', 1240000, 'Đợt 3', 473),
(1278, 73, '2015-08-23', 1345000, 'Đợt 5', 651),
(1279, 147, '2015-08-23', 2670000, 'Đợt 3', 464),
(1280, 156, '2015-08-25', 6130000, 'Đợt 3', 538),
(1281, 48, '2015-08-26', 1840000, 'Đợt 4', 448),
(1282, 155, '2015-08-26', 1860000, 'Đợt 3', 458),
(1283, 172, '2015-08-25', 2830000, 'đợt 7', 558),
(1284, 259, '2015-08-26', 1860000, 'Đợt 2', 412),
(1285, 136, '2015-08-25', 1200000, 'Đợt 4', 375),
(1286, 329, '2015-07-07', 3600000, 'Tổng cộng đợt 1', -1),
(1287, 329, '2015-08-25', 2670000, 'Đợt 2', -1),
(1288, 133, '2015-08-26', 2480000, 'Đợt 6', 472),
(1289, 379, '2015-08-26', 2930000, 'Đợt 2', 478),
(1290, 374, '2015-08-26', 1760000, 'Đợt 3', 408),
(1291, 363, '2015-08-24', 4960000, 'Đợt 2', -1),
(1292, 315, '2015-08-26', 1550000, 'Đợt 1', 551),
(1293, 152, '2015-08-27', 2735000, 'Đợt 3', 386),
(1295, 55, '2015-08-31', 7860000, 'Đợt 3', 446),
(1296, 250, '2015-08-25', 620000, 'Đợt 2', 554),
(1297, 263, '2015-08-30', 2080000, 'Đợt 2', 622),
(1298, 375, '2015-08-31', 550000, 'Đợt 2', 571),
(1299, 219, '2015-08-27', 1170000, 'Đợt 2', 586),
(1300, 190, '2015-08-25', 5240000, 'Đợt 4', 480),
(1301, 378, '2015-08-31', 1110000, 'Đợt 2', 384),
(1302, 137, '2015-08-28', 3280000, 'Đợt 6', 546),
(1303, 364, '2015-08-25', 2450000, 'Đợt 3', 394),
(1304, 286, '2015-08-07', 2680000, 'Đợt 2', 625),
(1305, 245, '2015-09-06', 1200000, 'Đợt 2', 566),
(1306, 79, '2015-08-26', 1860000, 'Đợt 5', 518),
(1307, 69, '2015-09-01', 1800000, 'Đợt 3', 641),
(1308, 343, '2015-09-07', 720000, 'Đợt 2', 506),
(1310, 239, '2015-09-01', 2660000, 'Đợt 2', 608),
(1312, 138, '2015-09-01', 1200000, 'Đợt 4', 471),
(1313, 75, '2015-09-03', 4000000, 'Đợt 1', 373),
(1314, 264, '2015-09-04', 5580000, 'Đợt 2', 522),
(1315, 374, '2015-09-02', 800000, 'Đợt 4', 408),
(1317, 58, '2015-09-06', 655000, 'bình bơm thuốc cỏ sâu', 620),
(1318, 71, '2015-08-04', 10000000, 'Còn lại', 609),
(1319, 364, '2015-09-10', 8290000, 'Đợt 4', 394),
(1320, 204, '2015-09-11', 10460000, 'Đợt 4', 631),
(1321, 69, '2015-09-11', 1860000, 'Đợt 4', 641),
(1322, 300, '2015-09-10', 5580000, 'Đợt 3', 460),
(1323, 201, '2015-09-10', 540000, 'Đợt 4', 482),
(1324, 269, '2015-09-10', 2750000, 'Đợt 2', 567),
(1325, 159, '2015-09-10', 3315000, 'Đợt 2', -1),
(1327, 342, '2015-09-10', 710000, 'Đợt 3', 648),
(1328, 270, '2015-09-09', 1430000, 'Đợt 2', 680),
(1330, 376, '2015-09-09', 1800000, 'Đợt 3', 486),
(1331, 230, '2015-09-11', 12400000, 'Đợt 4', 589),
(1332, 127, '2015-09-15', 7080000, 'Đợt 2', 505),
(1333, 298, '2015-09-14', 3100000, 'Đợt 1', 492),
(1334, 371, '2015-09-15', 1580000, 'Đợt 1', 662),
(1335, 392, '2015-09-14', 7440000, 'Đợt 1', 442),
(1336, 393, '2015-09-12', 1200000, 'Đợt 1', 406),
(1337, 122, '2015-09-14', 1800000, 'Đợt 4', 432),
(1338, 63, '2015-09-15', 4800000, 'Đợt 5', 409),
(1339, 210, '2015-09-15', 4400000, 'Đợt 3', 521),
(1340, 185, '2015-09-14', 250000, 'Đợt 2', 396),
(1341, 179, '2015-09-14', 5245000, 'Đợt 7', 426),
(1344, 51, '2015-09-12', 6640000, 'Đợt 6', 523),
(1345, 218, '2015-09-13', 1240000, 'Đợt 4', 511),
(1346, 93, '2015-09-15', 2400000, 'Đợt 1', 591),
(1347, 141, '2015-09-12', 1240000, 'Đợt 3', 462),
(1348, 52, '2015-09-15', 1160000, 'Đợt 5', 450),
(1349, 150, '2015-09-17', 4605000, 'Đợt 7', 440),
(1350, 137, '2015-09-17', 840000, 'Đợt 7', 546),
(1351, 136, '2015-09-15', 1740000, 'Đợt 5', 375),
(1352, 394, '2015-09-20', 620000, 'Đợt 1', -1),
(1354, 395, '2015-07-17', 1370000, 'Đợt 1', 602),
(1355, 233, '2015-09-16', 2290000, 'Đợt 1', 575),
(1356, 212, '2015-09-17', 6200000, 'Đợt 3', 543),
(1359, 123, '2015-09-21', 2790000, 'Đợt 3', 597),
(1360, 40, '2015-09-22', 2770000, 'Đợt 4', 553),
(1361, 262, '2015-09-23', 4270000, 'Đợt 6', 577),
(1363, 189, '2015-09-23', 3600000, 'Đợt 4', 479),
(1364, 350, '2015-09-23', 1560000, 'Đợt 5', 424),
(1365, 174, '2015-09-23', 4320000, 'Đợt 4', 513),
(1367, 71, '2015-09-23', 11400000, 'Đợt cuối', 609),
(1369, 273, '2015-09-28', 220000, 'an vin', 374),
(1370, 334, '2015-09-26', 3100000, 'Đợt 1', 594),
(1371, 396, '2015-06-20', 2280000, 'Đợt 1', 548),
(1372, 396, '2015-07-09', 5190000, 'Đợt 2', 548),
(1373, 396, '2015-07-19', 900000, 'Đợt 3', 548),
(1374, 396, '2015-07-28', 1800000, 'Đợt 4', 548),
(1375, 396, '2015-08-23', 7740000, 'Đợt 5', 548),
(1376, 397, '2015-09-24', 3280000, 'Đợt 1', -1),
(1377, 220, '2015-09-26', 1240000, 'Đợt 1', 454),
(1378, 328, '2015-09-23', 4890000, 'Đợt 5', 576),
(1379, 162, '2015-09-24', 3930000, 'Đợt 3', 453),
(1380, 178, '2015-10-06', 1640000, 'Đợt 4', 633),
(1381, 59, '2015-10-01', 3500000, 'Đợt 3', 532),
(1382, 360, '2015-10-03', 900000, 'Đợt 3', 456),
(1383, 188, '2015-10-05', 5135000, 'Đợt 3', -1),
(1384, 194, '2015-10-03', 4010000, 'Đợt 5', 436),
(1385, 197, '2015-10-03', 3220000, 'Đợt 3', 425),
(1386, 216, '2015-10-03', 4200000, 'Đợt 4', 435),
(1387, 61, '2015-10-05', 3095000, 'Đợt 5', 469),
(1388, 311, '2015-08-14', 1924000, 'Tổng cộng các loại', -1),
(1389, 398, '2015-08-11', 8250000, 'Đợt 1', 587),
(1390, 398, '2015-08-31', 5020000, 'Tổng cộng đợt 2', 587),
(1391, 164, '2015-10-03', 7200000, 'Đợt 2', 630),
(1393, 319, '2015-08-11', 4670000, 'Đợt 1', 590),
(1394, 319, '2015-09-23', 4220000, 'Đợt 2', 590),
(1395, 156, '2015-10-05', 2100000, 'Đợt 4', 538),
(1396, 56, '2015-10-03', 3320000, 'Đợt 6', 484),
(1397, 53, '2015-10-05', 860000, 'Đợt 1', 639),
(1398, 287, '2015-10-03', 4605000, 'Đợt 3', 562),
(1399, 100, '2015-10-05', 4440000, 'Đợt 5', 537),
(1400, 364, '2015-10-04', 7200000, 'Đợt 5', 394),
(1401, 247, '2015-10-04', 2360000, 'Đợt 2', 419),
(1402, 276, '2015-10-04', 3420000, 'Đợt 4', 504),
(1403, 79, '2015-10-03', 1378000, 'Đợt 6', 518),
(1404, 135, '2015-10-04', 5300000, 'Đợt 5', 649),
(1405, 133, '2015-10-04', 2100000, 'Đợt 7', 472),
(1406, 78, '2015-10-04', 2310000, 'Đợt 4', 413),
(1407, 163, '2015-10-03', 700000, 'Đợt 4', 560),
(1408, 209, '2015-10-03', 2200000, 'Đợt 1 của năm 2015', 497),
(1409, 207, '2015-10-03', 2270000, 'Đợt 4', -1),
(1410, 120, '2015-10-02', 2170000, 'Đợt 5', 610),
(1411, 107, '2015-10-11', 2650000, 'Đợt 4', 536),
(1412, 69, '2015-10-12', 1780000, 'Đợt 5', 641),
(1413, 233, '2015-10-13', 2295000, 'Đợt 2', 575),
(1414, 327, '2015-06-30', 300000, '2 chai kẽm G 8', 528),
(1415, 111, '2015-09-29', 185000, 'Đợt 2', 526),
(1416, 40, '2015-06-24', 350000, 'Đợt 3', 553),
(1417, 294, '2015-10-02', 1175000, 'Đợt 2', 377),
(1418, 225, '2015-06-15', 1295000, 'Tổng cộng cả năm', 468),
(1420, 399, '2015-06-15', 1400000, 'Đợt 1', 371),
(1421, 52, '2015-06-01', 3640000, 'Đợt 3', 450),
(1423, 60, '2015-09-26', 3000000, 'Đợt 5', 555),
(1424, 227, '2015-06-18', 1140000, 'Đợt 1', 565),
(1425, 400, '2015-08-30', 2200000, 'Đợt 1', 493),
(1426, 125, '2015-08-12', 5550000, 'Đợt 1', 520),
(1427, 401, '2015-08-16', 2995000, 'Đợt 1', 519),
(1428, 402, '2015-08-22', 1240000, 'Đợt 1', 399),
(1429, 113, '2015-10-11', 2440000, 'Đợt 1', 626),
(1430, 63, '2015-10-25', 1410000, 'Đợt cuối', 409),
(1431, 374, '2015-10-25', 375000, 'Một bao đồng', 408),
(1434, 121, '2015-08-19', 975000, 'Đợt 2', 383),
(1435, 403, '2015-08-09', 9010000, 'Đợt 1', 389),
(1436, 404, '2015-06-23', 450000, 'Đợt 1', 403),
(1437, 404, '2015-08-06', 800000, 'Đợt 2', 403),
(1438, 404, '2015-10-12', 1100000, 'Đợt 3', 403),
(1439, 271, '2015-07-08', 1645000, 'Tổng cộng đợt 1', 392),
(1440, 271, '2015-08-10', 1469000, 'Tổng cộngđợt 2', 392),
(1441, 73, '2015-11-05', 750000, 'Đợt 6', 651),
(1442, 199, '2015-02-01', 1840000, 'Đợt 1', 429),
(1443, 199, '2015-06-05', 1750000, 'Đợt 2', 429),
(1444, 199, '2015-06-18', 3000000, 'Đợt 3', 429),
(1445, 199, '2015-08-12', 3620000, 'Đợt 4', 429),
(1446, 199, '2015-09-14', 3720000, 'Đợt 5', 429),
(1448, 353, '2015-03-06', 450000, 'Đợt 1', 433),
(1449, 353, '2015-06-15', 460000, 'Đợt 2', 433),
(1450, 353, '2015-07-22', 620000, 'Đợt 3', 433),
(1451, 353, '2015-09-10', 860000, 'Đợt 4', 433),
(1453, 235, '2015-06-14', 2620000, 'Đợt 1', 452),
(1454, 235, '2015-06-17', 3470000, 'Đợt 2', 452),
(1455, 235, '2015-08-06', 5190000, 'Đợt 3', 452),
(1456, 235, '2015-10-03', 7700000, 'Đợt 4', 452),
(1457, 336, '2015-05-17', 1990000, 'Đợt 1', 584),
(1458, 336, '2015-06-13', 16910000, 'Đợt 2', 584),
(1459, 336, '2015-08-19', 2630000, 'Đợt 3', 584),
(1460, 336, '2015-09-05', 950000, 'Đợt 4', 584),
(1461, 336, '2015-09-23', 10800000, 'Đợt 5', 584),
(1462, 336, '2015-10-09', 950000, 'Đợt 6', 584),
(1463, 47, '2015-01-18', 900000, 'Đợt 1', 507),
(1464, 47, '2015-03-01', 1310000, 'Đợt 2', 507),
(1465, 47, '2015-07-08', 3990000, 'Đợt 3', 507),
(1466, 47, '2015-08-12', 3170000, 'Đợt 4', 507),
(1467, 385, '2015-09-23', 900000, 'Đợt 2', 508),
(1468, 294, '2015-07-15', 1184000, 'Đợt 1', 533),
(1469, 405, '2015-07-18', 1710000, 'Đợt 1', 585),
(1470, 62, '2015-02-07', 2530000, 'Đợt 1', 572),
(1471, 62, '2015-02-28', 1840000, 'Đợt 2', 572),
(1472, 62, '2015-06-13', 2790000, 'Đợt 3', 572),
(1473, 62, '2015-08-02', 2360000, 'Đợt 4', 572),
(1474, 62, '2015-09-04', 1120000, 'Đợt 5', 572),
(1475, 96, '2015-09-29', 1360000, 'Đợt 1', 578),
(1476, 338, '2015-04-13', 2160000, 'Đợt 1', -1),
(1477, 406, '2015-07-19', 11400000, 'Đợt 1', 583),
(1478, 213, '2015-03-05', 1350000, 'Đợt 1', 605),
(1479, 407, '2015-07-25', 1750000, 'Đợt 1', 607),
(1480, 407, '2015-08-26', 870000, 'Đợt 2', 607),
(1481, 258, '2015-06-05', 4150000, 'Đợt 1', 629),
(1482, 329, '2015-11-04', 780000, 'Đợt 3', -1),
(1483, 144, '2015-07-05', 700000, 'Đợt 1', 634),
(1484, 325, '2016-02-05', 550000, 'Đợt 1 của năm 2016', -1),
(1485, 409, '2015-12-20', 4180000, 'Đợt 1', -1),
(1486, 100, '2015-12-19', 2000000, 'Đợt 1', -1),
(1487, 100, '2016-02-13', 3000000, 'Đợt 2', -1),
(1488, 262, '2016-01-22', 1910000, 'Đợt 1 của năm 2016', -1),
(1489, 338, '2016-01-03', 1960000, 'Đợt 1 của năm 2016', -1),
(1490, 410, '2016-01-03', 1180000, 'Đợt 1', -1),
(1491, 411, '2016-01-06', 4570000, 'Đợt 1', -1),
(1492, 412, '2016-01-10', 1430000, 'Đợt 1', -1),
(1493, 413, '2016-01-10', 720000, 'Đợt 1', -1),
(1494, 340, '2015-12-25', 1000000, 'Đợt 1', -1),
(1495, 340, '2016-01-24', 1500000, 'Đợt 2', -1),
(1497, 414, '2016-01-18', 1430000, 'Đợt 1', -1),
(1498, 380, '2016-01-17', 5000000, 'Đợt 1', -1),
(1499, 116, '2016-01-22', 7480000, 'Đợt 1', -1),
(1500, 266, '2016-01-21', 4100000, 'Đợt 1', -1),
(1501, 408, '2016-01-25', 7500000, 'Đợt 1', -1),
(1502, 332, '2016-01-27', 10150000, 'Đợt 1', -1),
(1503, 415, '2016-01-27', 820000, 'Đợt 1', -1),
(1504, 260, '2016-01-29', 1140000, 'Đợt 1', -1),
(1505, 416, '2016-01-29', 1030000, 'Đợt 1', 672),
(1506, 417, '2016-01-31', 2060000, 'Đợt 1', -1),
(1507, 418, '2015-12-11', 19560000, 'Đợt 1', -1),
(1508, 353, '2016-02-01', 680000, 'Đợt 1', -1),
(1509, 128, '2016-02-02', 1000000, 'Đợt 1', -1),
(1510, 122, '2016-02-05', 1500000, 'Đợt 1', -1),
(1511, 83, '2016-02-02', 1772000, 'Đợt 1', -1),
(1512, 329, '2016-01-22', 2180000, 'Đợt 4', -1),
(1513, 131, '2015-12-18', 590000, 'Đợt 2', 681),
(1514, 131, '2015-12-28', 1590000, 'Đợt 3 phân bình điện', 681),
(1515, 131, '2016-01-23', 870000, 'Đợt 4', 681),
(1516, 270, '2015-12-23', 5060000, 'Đợt 3', 680),
(1518, 140, '2016-01-13', 3785000, 'Đợt 1 ống nước ', 679),
(1519, 419, '2015-12-23', 740000, 'Đợt 1', -1),
(1520, 85, '2016-01-10', 460000, 'Đợt 1', -1),
(1521, 44, '2016-01-18', 3220000, 'Đợt 1 của năm 2016', -1),
(1522, 44, '2016-02-01', 3000000, 'Đợt 2', -1),
(1523, 272, '2016-01-28', 550000, 'Đợt 1', -1),
(1524, 335, '2016-01-17', 440000, 'Đợt 1', -1),
(1526, 246, '2016-01-24', 760000, 'Đợt 1', -1),
(1527, 421, '2016-02-01', 20000000, 'Đợt 1', 663),
(1528, 294, '2016-02-03', 1380000, 'Đợt 1', -1),
(1529, 138, '2016-01-25', 920000, 'Đợt 1', -1),
(1530, 138, '2016-02-12', 500000, 'Đợt 2', -1),
(1531, 87, '2016-01-29', 1380000, 'Đợt 1', -1),
(1532, 51, '2016-01-25', 1320000, 'Đợt 1 của năm 2016', -1),
(1533, 187, '2015-12-28', 840000, 'Đợt 1', 653),
(1534, 187, '2016-01-15', 800000, 'Đợt 2', 653),
(1535, 187, '2016-01-30', 1000000, 'Đợt 3', 653),
(1536, 56, '2016-01-23', 3620000, 'Tổng cộng đợt 1 của năm 2016', -1),
(1537, 185, '2015-11-12', 726000, 'Ống nước', -1),
(1538, 355, '2015-12-22', 1120000, 'Đợt 1', 646),
(1539, 61, '2015-12-22', 2500000, 'Đợt 1', -1),
(1540, 61, '2016-01-25', 1662000, 'Ống nước', -1),
(1541, 422, '2015-12-23', 1570000, 'Đợt 1', -1),
(1542, 422, '2015-12-28', 734000, 'Đợt 2', -1),
(1543, 59, '2015-12-14', 500000, 'Ống nước', -1),
(1544, 181, '2015-12-06', 790000, 'Đợt 1', -1),
(1545, 181, '2016-01-15', 1360000, 'Đợt 2', -1),
(1548, 229, '2016-01-05', 1700000, 'Đợt 1', 655),
(1549, 289, '2016-02-03', 5460000, 'Tổng cộng đợt 1', -1),
(1550, 147, '2016-01-09', 1420000, 'Tổng cộng đợt 1', -1),
(1551, 287, '2016-01-04', 920000, 'Đợt 1', -1),
(1552, 190, '2016-01-28', 3275000, 'Tổng cộng đợt 1', -1),
(1553, 176, '2016-01-17', 1300000, 'Đợt 1 của năm 2016', -1),
(1554, 176, '2016-01-28', 610000, 'Đợt 2', -1),
(1555, 321, '2016-01-07', 3680000, 'Đợt 1', -1),
(1556, 291, '2016-01-22', 1500000, 'Tổng cộng đợt 1', 671),
(1557, 195, '2016-01-02', 840000, 'Đợt 1 của năm 2016', -1),
(1558, 195, '2016-02-05', 1200000, 'Đợt 2', -1),
(1559, 288, '2016-01-24', 3000000, 'Đợt 1', -1),
(1560, 269, '2016-01-11', 800000, 'Đợt 1', -1),
(1561, 379, '2016-02-01', 1620000, 'Đợt 1', -1),
(1562, 322, '2016-01-12', 1380000, 'Đợt 1', -1),
(1563, 322, '2016-02-02', 440000, 'Đợt 2', -1),
(1564, 231, '2016-01-13', 3000000, 'Đợt 1', -1),
(1565, 231, '2016-01-31', 4200000, 'Đợt 2', -1),
(1566, 179, '2016-01-12', 2760000, 'Đợt 1', -1),
(1567, 199, '2016-01-11', 2000000, 'Đợt 1', -1),
(1568, 62, '2016-01-14', 11200000, 'Đợt 1', -1),
(1569, 62, '2016-01-16', 10680000, 'Đợt 2', -1),
(1570, 172, '2016-01-14', 2990000, 'Phân ống nước', -1),
(1571, 184, '2016-01-14', 13030000, 'Đợt 1', -1),
(1572, 55, '2016-01-16', 3400000, 'Đợt 1', -1),
(1574, 198, '2016-01-17', 3580000, 'Đợt 1', -1),
(1576, 175, '2016-01-19', 1000000, 'Đợt 1 của năm2016', -1),
(1577, 66, '2015-12-10', 3786000, 'Tổng cộng đợt 1', -1),
(1578, 164, '2016-02-03', 2200000, 'Đợt 1', -1),
(1580, 189, '2016-01-27', 1745000, 'Tổng cộng đợt 1', -1),
(1581, 253, '2016-01-26', 4560000, 'Đợt 1', 669),
(1582, 405, '2016-01-27', 2800000, 'Đợt 1', -1),
(1583, 166, '2016-01-29', 805000, 'Ống cùm', -1),
(1584, 218, '2016-02-04', 1500000, 'Đợt 1', -1),
(1585, 223, '2016-02-01', 2000000, 'Đợt 1', -1),
(1586, 173, '2016-01-31', 1265000, 'Đợt 1', 652),
(1587, 155, '2016-02-06', 600000, 'Đợt 1 của năm 2016', -1),
(1588, 336, '2016-01-19', 3350000, 'Đợt 1', -1),
(1589, 336, '2016-01-24', 9650000, 'Đợt 2', -1),
(1590, 106, '2016-01-19', 6440000, 'Đợt 1', -1),
(1591, 106, '2016-01-26', 2200000, 'Đợt 2', -1),
(1592, 360, '2016-02-05', 760000, 'Đợt 1', -1),
(1593, 168, '2016-02-03', 760000, 'Đợt 1', -1),
(1594, 103, '2016-02-13', 3080000, 'Đợt 1', -1),
(1595, 150, '2016-02-17', 1900000, 'Đợt 1 của năm 2016', -1),
(1596, 209, '2016-02-17', 1000000, 'Đợt 1', -1),
(1597, 204, '2016-02-14', 5000000, 'Đợt 1 của năm 2016', -1),
(1598, 318, '2016-01-14', 1050000, 'Đợt 1', 677),
(1599, 318, '2016-02-15', 3610000, 'Đợt 2', 677),
(1600, 190, '2016-02-17', 2250000, 'Đợt 2', -1),
(1601, 374, '2016-02-15', 1440000, 'Đợt 1', -1),
(1602, 86, '2016-02-14', 760000, 'Đợt 1', 666),
(1603, 98, '2016-02-14', 1630000, 'Đợt 1', 647),
(1605, 162, '2016-02-14', 1140000, 'Đợt 1', 676),
(1606, 127, '2016-02-14', 3760000, 'Đợt 1', 642),
(1607, 424, '2015-06-17', 410000, 'Đợt 1', -1),
(1608, 424, '2016-02-25', 3500000, 'Đợt 1 của năm 2016', -1),
(1609, 90, '2016-02-15', 1000000, 'Đợt 1 của năm2016', -1),
(1610, 197, '2016-02-15', 6800000, 'Đợt 1', -1),
(1611, 291, '2016-02-17', 3080000, 'Đợt 2', 671),
(1612, 185, '2016-02-17', 1000000, 'Đợt 1', -1),
(1613, 62, '2016-02-18', 2180000, 'Đợt 3', -1),
(1614, 235, '2016-02-18', 1890000, 'Đợt 1', -1),
(1615, 425, '2016-02-19', 920000, 'Đợt 1', -1),
(1616, 264, '2016-02-17', 3000000, 'Đợt 1', -1),
(1617, 360, '2016-02-20', 2094000, 'Ống nước', -1),
(1618, 134, '2015-11-23', 785000, 'Nợ củ', -1),
(1619, 134, '2016-02-21', 1380000, 'Đợt 1 của 2016', -1),
(1620, 163, '2016-02-20', 1000000, 'Đợt 1', -1),
(1621, 181, '2016-02-25', 1660000, 'Đợt 3', -1),
(1622, 47, '2016-02-19', 2983000, 'phân ống nước', -1),
(1623, 364, '2016-02-17', 1300000, 'Đợt 1', -1),
(1624, 66, '2016-02-19', 2500000, 'Đợt 2', -1),
(1625, 62, '2016-02-18', 2180000, 'Đợt 3', -1),
(1626, 426, '2016-02-19', 1320000, 'Đợt 1', -1),
(1627, 149, '2016-02-15', 2300000, 'Đợt 1', -1),
(1628, 137, '2016-02-21', 2350000, 'Đợt 1 của năm 2016', -1),
(1629, 106, '2016-02-16', 1320000, 'Đợt 3', -1),
(1630, 131, '2016-02-20', 610000, 'Đợt 5', 681),
(1631, 340, '2016-02-27', 2000000, 'Đợt 3', -1),
(1632, 260, '2016-02-28', 1640000, 'Đợt 2', -1),
(1633, 156, '2016-02-28', 2220000, 'Đợt 1', -1),
(1634, 58, '2016-02-29', 1000000, 'Đợt 1', -1),
(1635, 199, '2016-02-26', 2360000, 'Đợt 2', -1),
(1636, 250, '2016-02-26', 400000, 'Đợt 1', -1),
(1638, 176, '2016-02-26', 811000, 'Ống nước cùm', -1),
(1639, 60, '2016-03-01', 2000000, 'Đợt 1 của năm 216', -1),
(1640, 233, '2016-03-02', 2080000, 'Đợt 1', -1),
(1641, 61, '2016-03-02', 2300000, 'Đợt 2', -1),
(1642, 427, '2016-01-17', 1100000, 'Đợt 1', -1),
(1643, 427, '2016-03-03', 1100000, 'Đợt 2', -1),
(1644, 327, '2016-03-07', 6670000, 'Đợt 1', -1),
(1645, 110, '2016-03-06', 620000, 'Đợt 1', 678),
(1646, 173, '2016-03-06', 1370000, 'Đợt 2', 652),
(1647, 380, '2016-03-06', 2200000, 'Đợt 2', -1),
(1648, 183, '2016-01-16', 4000000, 'Đợt 1', -1),
(1649, 417, '2016-03-07', 2220000, 'Đợt 2', -1),
(1651, 129, '2016-02-22', 810000, 'Đợt 1', -1),
(1652, 129, '2016-03-09', 215000, 'Đợt 2', -1),
(1653, 428, '2016-02-22', 1440000, 'Đợt 1', -1),
(1654, 429, '2016-02-22', 620000, 'Đợt 1', 670),
(1655, 55, '2016-03-25', 3700000, 'Đợt 2', -1),
(1656, 364, '2016-03-24', 6100000, 'Đợt 2', -1),
(1657, 223, '2016-03-18', 1000000, 'Đợt 2', -1),
(1659, 179, '2016-03-06', 1160000, 'Đợt 2', -1),
(1660, 287, '2016-03-13', 2500000, 'Đợt 2', -1),
(1661, 229, '2016-02-23', 1655000, 'Đợt 2', 655),
(1663, 335, '2016-03-14', 1000000, 'Đợt 2', -1),
(1664, 329, '2016-03-20', 1310000, 'Đợt 5', -1),
(1665, 216, '2016-03-05', 590000, 'Đợt 1', -1),
(1666, 183, '2016-03-17', 5500000, 'Đợt 2', -1),
(1667, 405, '2016-03-08', 1100000, 'Đợt 2', -1),
(1668, 209, '2016-04-02', 1490000, 'Đợt 2', -1),
(1669, 212, '2016-03-09', 1110000, 'Đợt 1', -1),
(1670, 184, '2016-01-26', 4161000, 'Ống nước', -1),
(1671, 184, '2016-04-02', 2680000, '20 lọ An vin 2 thùng thuốc ve', -1),
(1672, 191, '2016-04-08', 2000000, 'Đợt 1', -1),
(1673, 100, '2016-03-28', 1200000, 'Đợt 3', -1),
(1674, 103, '2016-03-31', 3100000, 'Đợt 2', -1),
(1675, 63, '2016-04-04', 1850000, 'Đợt 1 của năm 2016', -1),
(1676, 269, '2016-03-31', 1550000, 'Đợt 2', -1),
(1677, 211, '2016-03-31', 1200000, 'Đợt 1', -1),
(1678, 408, '2016-03-30', 1470000, 'Đợt 2', -1),
(1679, 324, '2016-02-26', 740000, 'Đợt 1', 665),
(1680, 105, '2016-04-14', 1660000, 'Đợt 2', -1),
(1681, 52, '2016-03-01', 1380000, 'Đợt 1', -1),
(1682, 52, '2016-04-06', 1000000, 'Đợt 2', -1),
(1683, 56, '2016-03-30', 2050000, 'Đợt 2', -1),
(1684, 325, '2016-04-21', 710000, 'Đợt 2', -1),
(1685, 73, '2016-04-18', 1000000, 'Đợt 1', -1),
(1686, 190, '2016-04-26', 790000, 'Đợt 3', -1),
(1687, 406, '2016-04-26', 2560000, 'Đợt 1', -1),
(1688, 54, '2016-03-21', 1000000, 'Đợt 1', -1),
(1689, 180, '2016-02-03', 1327000, 'Ống nước cùm', -1),
(1690, 148, '2016-01-21', 800000, 'Đợt 1 của năm 2016', -1),
(1691, 55, '2016-04-27', 2960000, 'Đợt 3', -1),
(1692, 288, '2016-04-19', 1430000, 'Thuốc sâu kẽm', -1),
(1693, 236, '2016-05-01', 2110000, 'Đợt 1', -1),
(1694, 266, '2016-05-16', 5100000, 'Đợt 2', -1),
(1695, 129, '2016-05-18', 850000, 'Đợt 3', -1),
(1696, 193, '2016-02-29', 460000, 'Đợt 1', -1),
(1697, 57, '2016-05-11', 3660000, 'Đợt 1', -1),
(1698, 183, '2016-05-18', 2040000, 'Đợt 3', -1),
(1699, 430, '2016-05-09', 12650000, 'Đợt 1', -1),
(1700, 430, '2016-05-19', 6980000, 'Đợt 2', -1),
(1701, 53, '2016-05-13', 505000, 'Đợt 1', -1),
(1702, 420, '2016-05-13', 1800000, 'Đợt 1', -1),
(1703, 205, '2016-01-29', 1380000, 'Đợt 1', -1),
(1704, 205, '2016-05-19', 3760000, 'Đợt 2', -1),
(1705, 431, '2016-02-24', 920000, 'Đợt 1', -1),
(1706, 136, '2016-03-07', 1000000, 'Đợt 1', -1),
(1707, 136, '2016-05-08', 1000000, 'Đợt 2', -1),
(1708, 69, '2016-05-19', 3370000, 'Đợt 1', -1),
(1709, 39, '2016-05-18', 570000, 'Đợt 1', -1),
(1710, 424, '2016-05-18', 2890000, 'Đợt 2', -1),
(1711, 303, '2016-05-18', 1200000, 'Đợt 1 của năm 2016', -1),
(1712, 106, '2016-05-25', 11500000, 'Đợt 4', -1),
(1713, 336, '2016-05-24', 17410000, 'Đợt 3', -1),
(1714, 184, '2016-05-19', 4680000, 'Thuốc sâu', -1),
(1715, 184, '2016-05-24', 13320000, 'Đợt 2', -1),
(1716, 127, '2016-05-23', 1880000, 'Đợt 1', -1),
(1717, 261, '2016-05-23', 680000, 'Đợt 1', -1),
(1718, 90, '2016-05-25', 800000, 'Đợt 2', -1),
(1719, 340, '2016-05-20', 3540000, 'Đợt 4', -1),
(1720, 365, '2016-05-25', 2530000, 'Đợt 1 của năm 2016', -1),
(1721, 123, '2016-01-11', 1520000, 'Nợ củ', -1),
(1722, 123, '2016-02-28', 910000, 'Đợt 1 của năm 2016', -1),
(1723, 123, '2016-05-23', 1200000, 'Đợt 2', -1),
(1724, 303, '2016-05-25', 1000000, 'Đợt 2', -1),
(1725, 60, '2016-05-23', 3654000, 'Đợt 2', -1),
(1726, 346, '2016-05-23', 1730000, 'Đợt 1', -1),
(1727, 391, '2016-05-20', 1060000, 'Đợt 1', -1),
(1728, 71, '2016-05-21', 3965000, 'Đợt 1', -1),
(1729, 223, '2016-05-25', 2910000, 'Đợt 3', -1),
(1730, 172, '2016-05-23', 3300000, 'Đợt 2', -1),
(1731, 199, '2016-05-21', 7340000, 'Đợt 3 tổng cộng kẻm thuốc phân', -1),
(1732, 162, '2016-05-23', 1870000, 'Đợt 1', -1),
(1733, 406, '2016-05-23', 11000000, 'Đợt 2', -1),
(1734, 56, '2016-05-24', 2590000, 'Đợt 3', -1),
(1735, 190, '2016-05-23', 6600000, 'Đợt 4', -1),
(1736, 187, '2016-05-25', 4730000, 'Đợt 1', -1),
(1737, 173, '2016-05-24', 1325000, 'Tổng cộng đợt 1', -1),
(1738, 178, '2016-05-23', 3870000, 'Đợt 1', -1),
(1739, 377, '2016-05-23', 990000, 'Đợt 1', -1),
(1740, 174, '2016-05-24', 3400000, 'Đợt 1', -1),
(1741, 136, '2016-05-23', 1302000, 'Đợt 3', -1),
(1742, 58, '2016-05-22', 1000000, 'Đợt 2', -1),
(1743, 432, '2016-01-29', 1500000, 'Đợt 1', -1),
(1744, 432, '2016-05-23', 1140000, 'Đợt 2', -1),
(1745, 96, '2016-05-22', 3160000, 'Đợt 1', -1),
(1746, 170, '2016-05-25', 670000, 'Đợt 1', -1),
(1747, 376, '2016-05-25', 1500000, 'Đợt 1', -1),
(1748, 66, '2016-05-26', 2430000, 'Đợt 3', -1),
(1749, 433, '2015-08-22', 1110000, 'tổng cộng phan thuốc', -1),
(1750, 433, '2016-05-25', 1255000, 'Đợt 1 của năm2016', -1),
(1751, 375, '2016-05-25', 1000000, 'Đợt 1', -1),
(1752, 434, '2016-05-25', 4480000, 'Đợt 1', -1),
(1753, 435, '2016-05-21', 3600000, 'Đợt 1', -1),
(1754, 436, '2016-05-21', 4390000, 'Đợt 1', -1),
(1755, 437, '2016-05-20', 9490000, 'Đợt 1', -1),
(1756, 345, '2016-05-15', 7740000, 'Đợt 1', -1),
(1757, 386, '2016-05-04', 4400000, 'Đợt 1', -1),
(1758, 109, '2016-04-21', 1300000, 'Thuốc sâu', -1),
(1759, 350, '2016-05-26', 1330000, 'Đợt 1', -1),
(1760, 185, '2016-05-26', 1130000, 'Đợt 2', -1),
(1761, 166, '2016-05-26', 1020000, 'Đợt 1', -1),
(1762, 69, '2016-05-26', 3000000, 'Đợt 2', -1),
(1763, 258, '2016-05-26', 7400000, 'Đợt 1', -1),
(1764, 264, '2016-05-26', 1560000, 'Đợt 2', -1),
(1765, 77, '2016-05-26', 575000, 'Đợt 1', -1),
(1766, 182, '2016-05-26', 800000, 'Đợt 1', -1),
(1767, 78, '2016-05-26', 3810000, 'Đợt 1', -1),
(1768, 417, '2016-05-26', 3880000, 'Đợt 3', -1),
(1769, 373, '2016-05-26', 3720000, 'Đợt 1', -1),
(1770, 438, '2016-05-26', 1030000, 'Đợt 1', -1),
(1771, 439, '2016-05-26', 1080000, 'Đợt 1', -1),
(1772, 440, '2016-05-26', 5340000, 'Đợt 1', -1),
(1773, 441, '2016-05-26', 940000, 'Đợt 1', -1),
(1774, 442, '2016-05-26', 3040000, 'Đợt 1', -1),
(1775, 124, '2016-05-27', 2330000, 'Đợt 1', -1),
(1776, 230, '2016-05-27', 6540000, 'Đợt 1', -1),
(1777, 443, '2016-05-27', 2200000, 'Đợt 1', -1),
(1778, 341, '2016-05-27', 615000, 'Đợt 1', -1),
(1779, 83, '2016-05-27', 1500000, 'Đợt 2', -1),
(1780, 379, '2016-05-27', 1320000, 'Đợt 2', -1),
(1781, 266, '2016-05-27', 6880000, 'Đợt 3', -1),
(1782, 148, '2016-05-27', 1650000, 'Đợt 2', -1),
(1783, 444, '2016-05-27', 4910000, 'Đợt 1', -1),
(1784, 114, '2016-05-27', 7310000, 'Đợt 1', -1),
(1786, 140, '2015-11-27', 1280000, 'Củ còn lại', -1),
(1787, 140, '2016-01-13', 1380000, 'Đợt 1', -1),
(1788, 140, '2016-05-29', 6877000, 'Đợt 2', -1),
(1789, 427, '2016-05-28', 2820000, 'Đợt 3', -1),
(1790, 291, '2016-05-28', 3380000, 'Đợt 2', -1),
(1791, 158, '2016-05-28', 3850000, 'Đợt 1', -1),
(1792, 262, '2016-05-28', 5805000, 'Đợt 2', -1),
(1793, 212, '2016-05-28', 1700000, 'Đợt 2', -1),
(1794, 100, '2016-05-28', 6350000, 'Đợt 4', -1),
(1795, 63, '2016-05-28', 5960000, 'Đợt 2', -1),
(1796, 445, '2016-05-28', 1700000, 'Đợt 1', -1),
(1797, 315, '2016-05-28', 4350000, 'Đợt 1', -1),
(1798, 446, '2016-05-28', 4910000, 'Đợt 1', -1),
(1799, 447, '2016-05-29', 3880000, 'Đợt 1', -1),
(1800, 448, '2016-05-29', 4080000, 'Đợt 1', -1),
(1801, 104, '2016-05-29', 7020000, 'Đợt 1', -1),
(1802, 449, '2016-05-29', 5190000, 'Đợt 1', -1),
(1803, 450, '2016-05-29', 4320000, 'Đợt 1', -1),
(1804, 451, '2016-05-29', 5790000, 'Đợt 1', -1),
(1805, 453, '2016-05-29', 5840000, 'Đợt 1', -1),
(1806, 452, '2016-05-29', 6120000, 'Đợt 1', -1),
(1807, 114, '2016-05-29', 6870000, 'Đợt 2', -1);

-- --------------------------------------------------------

--
-- Table structure for table `khach_hang`
--

CREATE TABLE `khach_hang` (
  `MaKH` int(11) NOT NULL,
  `TenKH` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SdtKH` char(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DiaChiKH` text COLLATE utf8_unicode_ci NOT NULL,
  `GhiChuKH` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `khach_hang`
--

INSERT INTO `khach_hang` (`MaKH`, `TenKH`, `SdtKH`, `DiaChiKH`, `GhiChuKH`) VALUES
(32, 'Bảo Xem', '', 'Thôn 4', 'con chị Xem '),
(33, 'Hùng Mỹ ', '', 'Làng bối', 'Hùng Quảng nam '),
(34, 'Chị Trâm ', '', 'số mười', 'cầu số mười'),
(35, 'Chị Chức ', '', 'Làng bối ', ''),
(36, 'Hướng phát', '', 'Thôn 4', 'Hướng mai '),
(37, 'Hang làng ren', '', 'Thôn 4', ''),
(38, 'Toàn Liên', '', 'Thôn 2', ''),
(39, 'Hồng Hùng ', '', 'Thôn 2', ''),
(40, 'Phấn Phong', '', 'Thôn 2', ''),
(41, 'Hùng Trí', '', 'Thôn 2', ''),
(42, 'Sang Phụng ', '', 'Thôn 2', ''),
(43, 'Tuyết Kiệt ', '', 'Thôn 2', ''),
(44, 'Châu Trang ', '', 'Thôn 2', ''),
(45, 'Thanh Trọng', '', 'Thôn 2', ''),
(46, 'Cương Huệ ', '', 'Thôn 2', ''),
(47, 'Chị Ngọc ', '', 'Thôn 3', ''),
(48, 'Thành Sen ', '', 'Thôn 3', ''),
(49, 'Vân Tánh ', '', 'Thôn 2', ''),
(50, 'Tuấn Hạnh ', '', 'Thôn 3', ''),
(51, 'Thành Liễu', '', 'Thôn 3', ''),
(52, 'Trung Hiền', '', 'Thôn 3', ''),
(53, 'Dương Bằng ', '', 'Thôn 3', ''),
(54, 'Du Đây', '', 'Thôn 3', ''),
(55, 'Hồng Vinh ', '', 'thôn 3', ''),
(56, 'Hiệp Phượng ', '', 'Thôn 3', ''),
(57, 'Mai Trí ', '', 'Thôn 3', ''),
(58, 'Bé Ngọc ', '', 'Thôn 2', ''),
(59, 'Anh Tư Sơn ', '', 'Thôn 3', ''),
(60, 'Thúy Trí ', '', 'Thôn 3', ''),
(61, 'Thanh Dương ', '', 'Thôn 3', ''),
(62, 'Hoan Vinh ', '', 'Thôn 3', ''),
(63, 'Lan Nam ', '', 'Thôn 3', ''),
(64, 'Hai Nghinh', '', 'Thôn 3', ''),
(65, 'Dũng Thủy', '', 'Thôn 2', ''),
(66, 'Phúc Ký ', '', 'Thôn 3', ''),
(67, 'Châu Nhung ', '', 'Thôn 3', ''),
(68, 'Hồng lành ', '', 'Thôn 3', ''),
(69, 'Dung Tuấn ', '', 'Thôn 2', ''),
(70, 'Thuận Nga ', '', 'Thôn 2', ''),
(71, 'Chị Noa ', '', 'Thôn 2', ''),
(72, 'Hằng nông trường ', '', 'Thôn 2', ''),
(73, 'Linh Quyết ', '', 'Thôn 2', ''),
(74, 'Dũng Nhung ', '', 'Thôn 2', ''),
(75, 'Thanh Nhàn ', '', 'thôn 2', ''),
(76, 'Nam Liên ', '', 'Thôn 2', ''),
(77, 'Dũng Phượng ', '', 'thôn 2', ''),
(78, 'Phượng Chạy ', '', 'Thôn 2', ''),
(79, 'Đức Nga ', '', 'Thôn 2', ''),
(80, 'Tâm Thương ', '', 'Thôn 2', ''),
(81, 'Hoa Thọ ', '', 'Thôn 2', ''),
(82, 'Tiến Nở', '', 'thôn 2', ''),
(83, 'Hà Năng', '', 'Thôn 2', ''),
(84, 'Khánh Tiến', '', 'Thôn 2', ''),
(85, 'Sơn Sĩ', '', 'THÔN 2', ''),
(86, 'TÂM Hùng', '', 'Thôn 2', ''),
(87, 'Độ chị Ba', '', 'THÔN 2', ''),
(88, 'Tuấn Liên', '', 'THÔN 2', ''),
(89, 'HẠNH THẠO', '', 'THÔN 2', ''),
(90, 'LÝ THOẢN', '', 'THÔN 2', ''),
(91, 'BÌNH HOA', '', 'THÔN 2', ''),
(92, 'CHÍNH LÀI', '', 'THÔN 2', ''),
(93, 'HIỀN BÍCH', '', 'THÔN 2', ''),
(94, 'CHÍ NHƠN', '', 'THÔN 2', ''),
(95, 'THI HẰNG', '', 'THÔN 2', ''),
(96, 'CẢNH CHUNG', '', 'THÔN 2', ''),
(97, 'HÀO XÃ ', '', 'HUYỆN', ''),
(98, 'CHÚ ĐỨC', '', 'LÀNG BỐI', ''),
(99, 'BẢO NHÂN', '', 'THÔN 4', ''),
(100, 'NGA DŨNG ', '', 'LÀNG BỐI', ''),
(101, 'MAI LÀNG REN', '', 'LÀNG REN', ''),
(102, 'RƠ CHÂM DEK', '', 'LANG REN', ''),
(103, 'NGA BÌNH ', '', 'THÔN 1', ''),
(104, 'Anh Dơi', '', 'LÀNG BỐI ', ''),
(105, 'LAI TUYẾT', '', 'THÔN 1', ''),
(106, 'TUYỂN', '', 'LÀNG BỐI', ''),
(107, 'HẢI XOA', '', 'THÔN 1', ''),
(108, 'HÒA TÂM', '', 'THÔN 1', ''),
(109, 'Rơ Châm Thắng', '01699262737', 'Làng Ren', ''),
(110, 'Rơ Châm PLK', '702030', 'LÀNG BỐI', 'rơ châm PEP'),
(111, 'CHUNG HOÀNG SA', '011847', 'LÀNG HÒA', 'rơ châm hut'),
(112, 'RƠ CHÂM B RIM', '622366', 'LÀNG BỐI', ''),
(113, 'ANH NHỚN', '', 'LÀNG REN', ''),
(114, 'rơ châm kói', '', 'Làng Hòa', ''),
(115, 'Jép', '702023', 'Làng Bối', ''),
(116, 'Siu A Yong', '038338', 'Làng Bối', ''),
(117, 'Rơ châm Yuih ', '702002', 'Làng Bối', ''),
(118, 'Rơ châm Yung', '702001', 'Làng Ren', ''),
(119, 'phượng việt', '', 'nghĩa hưng', ''),
(120, 'Rơ châm Ủnh', '', 'Làng Hòa ', 'có hộ khẩu'),
(121, 'Rơ châm Cải', '', 'Làng Bối', ''),
(122, 'Tâm Nữ', '', 'Thôn 1', ''),
(123, 'Hiên Duy', '', 'Thôn 1', ''),
(124, 'Huy Chức', '', 'Làng Bối', ''),
(125, 'Siu h Mĩu', '702063', 'Làng Bối', ''),
(126, 'Siu h Sak', '702062', 'Làng Bối', ''),
(127, 'Tuyết Tiến', '', 'Thôn 1', ''),
(128, 'Thành Phương', '', 'Huyện', ''),
(129, 'A joăh', '702046', 'làng bối', ''),
(130, 'Minh Liên', '', 'Thôn 2', ''),
(131, 'Khánh Kiều ', '', 'Thôn 2', ''),
(132, 'Tám Cường ', '', 'Thôn 2', ''),
(133, 'Thảo Vi', '', 'Thôn 2', ''),
(134, 'Hương Chương', '', 'Thôn 2', ''),
(135, 'Tài chị Thành', '', 'Thôn 2', ''),
(136, 'Thái Linh', '', 'Thôn 2', ''),
(137, 'Hằng Hậu', '', 'Thôn 2', ''),
(138, 'Danh Cúc', '', 'Thôn 2', ''),
(139, 'Phong Bằng ', '', 'Thôn 2', ''),
(140, 'Dũng Hoa', '', 'Thôn 2', ''),
(141, 'Sơn Minh', '', 'Thôn 2', ''),
(142, 'Bông Nhu', '', 'Thôn 2', ''),
(143, 'Thủy Trí', '', 'Thôn 2', ''),
(144, 'Tân Mùi', '', 'Thôn 2', ''),
(145, 'Loan Hiển', '', 'Thôn 2', ''),
(146, 'Chị Bông', '', 'Thôn 2', ''),
(147, 'Nga Giỏi', '', 'Thôn 3', ''),
(148, 'Phước Kiều', '', 'Thôn 3', ''),
(149, 'Út Tân', '', 'Thôn 3', ''),
(150, 'Đức loan', '', 'Thôn 3', ''),
(151, 'Sửu Chín', '', 'Thôn 3', ''),
(152, 'xuân lựu', '', 'Thôn 3', ''),
(153, 'xuân loan', '', 'nông trường', ''),
(154, 'Hai Thạnh ', '', 'Thôn 3', ''),
(155, 'Tuấn Thủy', '', 'Thôn 3', ''),
(156, 'Phong Thanh ', '', 'Thôn 3', ''),
(157, 'Hải Nghĩa', '', 'Nông trường', ''),
(158, 'Long Thảo ', '', 'Thôn 3', ''),
(159, 'Khương chị hai', '', 'Thôn 3', ''),
(160, 'Son Ân', '', 'Thôn 3', ''),
(161, 'hùng sương ', '', 'thôn 3', ''),
(162, 'Thọ Lan', '', 'Thôn 3', ''),
(163, 'Châu Quang ', '', 'Thôn 3', ''),
(164, 'Chị Đức Gia', '', 'Thôn 3', ''),
(165, 'Anh Loan', '', 'Thôn 3', ''),
(166, 'Lan Cảnh', '', 'Thôn 3', ''),
(167, 'Ngà Nữ ', '', 'Thôn 3', ''),
(168, 'Sơn Thủy ', '', 'Thôn 3', ''),
(169, 'Anh Hóa', '', 'Thôn 3', ''),
(170, 'Thành Tài', '', 'Thôn 3', ''),
(171, 'Hùng Hóa', '', 'Thôn 3', ''),
(172, 'Dân Sơn', '', 'Thôn 3', ''),
(173, 'Thành Hiệp', '', 'Thôn 3', ''),
(174, 'Cường hoa Hạnh ', '', 'Thôn 3', ''),
(175, 'Loan Minh ', '', 'Thôn 3', ''),
(176, 'Anh Chín Dục', '', 'Thôn 3', ''),
(177, 'Châu Phượng ', '', 'Thôn 3', ''),
(178, 'Vinh hồng', '', 'Thôn 3', ''),
(179, 'Hiền An', '', 'Thôn 3', ''),
(180, 'Thủy Giáo', '', 'Thôn 3', ''),
(181, 'Oai Hương', '', 'Thôn 3', ''),
(182, 'Thảo Đàm', '', 'Thôn 3', ''),
(183, 'Huệ Đẹp', '', 'Thôn 3', ''),
(184, 'Việt Thủy', '', 'Thôn 3', ''),
(185, 'Chị khánh', '', 'Thôn 3', ''),
(186, 'Nghé Tuấn', '', 'Thôn 3', ''),
(187, 'Dự Vinh', '', 'Thôn 3', ''),
(188, 'Long Ngãi ', '', 'Thôn 3', ''),
(189, 'Loan Quốc', '', 'Thôn 3', ''),
(190, 'Quốc Diễm', '', 'Thôn 3', ''),
(191, 'Cường Linh', '', 'Thôn 3', ''),
(192, 'Thím sáu Nõn', '', 'Thôn 3', ''),
(193, 'Long Nguyệt', '', 'Thôn 3', ''),
(194, 'Thắng Mai', '', 'Thôn 3', ''),
(195, 'Cường Tuất', '', 'Thôn 3', ''),
(196, 'Thanh Thùy', '', 'Thôn  3', ''),
(197, 'Quang Hiệp', '', 'Thôn 3', ''),
(198, 'Hậu Huệ', '', 'Thôn 3', ''),
(199, 'Bảy Ngọc', '', 'Thôn 3', ''),
(200, 'Châu kế', '', 'Thôn 3', ''),
(201, 'Nga Hiếu', '', 'Thôn 3', ''),
(202, 'Chị Mười', '', 'Thôn 3', ''),
(203, 'Tám Lan', '', 'Thôn 3', ''),
(204, 'Hằng Sự', '', 'Thôn 3', ''),
(205, 'Tài', '', 'Thôn 1', 'con anh đức'),
(206, 'Đức Nghi', '', 'Thôn 3', ''),
(207, 'Thủy Lượm', '', 'Thôn 3', ''),
(208, 'Trung Thúy', '', 'Làng Bối', 'con thím kiểm'),
(209, 'Linh Hồng ', '', 'Thôn 3', 'em anh luân'),
(210, 'Hoàng Huệ', '', 'Thôn 3', ''),
(211, 'Trung Thủy ', '', 'Thôn 3', 'trung cửa sắt'),
(212, 'Trung Sâm', '', 'Thôn 3', ''),
(213, 'Chị Phượng', '', 'Thôn 3', ''),
(214, 'Hoa Liêm', '', 'Thôn 3', ''),
(215, 'Anh Đào', '', 'Thôn 3', 'Y tá'),
(216, 'Mạnh Luận ', '', 'Thôn 3', ''),
(217, 'Chị Tư Hương', '', 'Thôn 1', ''),
(218, 'Dũng Bông', '', 'Thôn 3', ''),
(219, 'Hải Yến', '', 'Thôn 3', ''),
(220, 'Hổ', '', 'Thôn 3', 'em anh sơn'),
(221, 'Cúc Hoàng', '', 'Thôn 3', ''),
(222, 'Cường Nga', '', 'Thôn 3', 'con anh mươi sang'),
(223, 'Chị hai Thanh', '', 'Thôn 3', 'trong hẻm'),
(224, 'Cháu thím Năm', '', 'Thôn 3', ''),
(225, 'Chị Phương ', '', 'Thôn 3', ''),
(226, 'Phụng Mao', '', 'Thôn 3', ''),
(227, 'Vân Hương ', '', 'Thôn 3', ''),
(228, 'Lực Nại', '', 'Thôn 3', ''),
(229, 'Hoa Hà', '', 'Thôn 3', ''),
(230, 'Chị năm Cúc', '', 'Thôn 3', ''),
(231, 'Chính Dưỡng', '', 'Thôn 3', ''),
(232, 'Thành Vân', '', 'Thôn 3', ''),
(233, 'Lào Mỹ', '', 'Thôn 3', ''),
(234, 'Chị Diệu', '', 'Thôn 3', ''),
(235, 'Ngọc Thảo', '', 'Thôn 3', ''),
(236, 'Quang Lợi', '', 'Thôn 3', ''),
(237, 'Dũng Loan', '', 'Thôn2', ''),
(238, 'Thành Giỏi', '', 'Thôn 2', ''),
(239, 'Bông Lanh', '', 'Thôn 3', ''),
(240, 'Tâm Kế ', '', 'Thôn 3', ''),
(241, 'Hiệp Hoa', '', 'Thôn 3', ''),
(242, 'THU NHAN', '', 'NGHĨA HƯNG', ''),
(243, 'Rơ châm keo', '', 'Làng Hòa', 'KÓI MUA DÙM'),
(244, 'Rơ Châm Bít', '', 'Làng hòa', 'kói mua dùm'),
(245, 'Két', '', 'Làng Hòa', 'kóimua dùm'),
(246, 'Thu Dung', '', 'Thôn 2', ''),
(247, 'Chị hai Thạnh', '', 'Thôn 3', ''),
(248, 'Sang Bình', '', 'Thôn 3', ''),
(249, 'Bằng Phượng', '', 'Thôn 2', ''),
(250, 'Hải Cúc', '', 'Thôn 3', ''),
(251, 'Thím hai Nghinh', '', 'THôn3', ''),
(252, 'Anh năm Tạo', '', 'Thôn 3', ''),
(253, 'Phượng Yên', '', 'Thôn 3', ''),
(254, 'Chị Hạ', '', 'Thôn 2', 'Chị Hạ mua mì'),
(255, 'Hạnh Kỳ', '', 'Thôn 2', ''),
(256, 'Hồng Hoàng', '', 'thôn 2', ''),
(257, 'Quý Khánh', '', 'Thôn 2', ''),
(258, 'Toàn Vân', '', 'Thôn 2', ''),
(259, 'Sang Trọng', '', 'Thôn 2', ''),
(260, 'Rơ Châm Đức', '', 'Làng Bối', 'Con của plk, cùng bìa đỏ'),
(261, 'Dũng Hà', '', 'Thôn 1', 'Con Tuyết Tiến'),
(262, 'ANH SƠN DUNG', '', 'Thôn 1', ''),
(263, 'Chú Tư', '', 'Thôn 3', ''),
(264, 'Sang Nở', '', 'Thôn 2', ''),
(265, 'Thạnh Hạnh', '', 'Làng Bối', ''),
(266, 'Huyền Minh', '', 'Cầu số 3', ''),
(267, 'rơ châm Hnhai', '702057', 'Làng bối', ''),
(268, 'Anh của Châu', '', 'Thôn 4', ''),
(269, 'Dũng chị Năm', '', 'Thôn 3', ''),
(270, 'Vân Thông', '', 'Thôn 2', ''),
(271, 'Hùng Bình', '', 'Thôn2', ''),
(272, 'Thu Đờn', '', 'Thôn 2', ''),
(273, 'Bình Hiền', '', 'Thôn3', ''),
(274, 'Sơn Nhung', '', 'Ngã ba', ''),
(275, 'Con mĩu', '', 'Làng bối', ''),
(276, 'Thành Hương', '', 'Thôn 3', ''),
(277, 'Bình Thu', '', 'Thôn 2', ''),
(278, 'Thím Sinh', '', 'Thôn 2', ''),
(279, 'Trần Văn Thủy', '', 'Thôn 1', 'Em hoa Thọ'),
(280, 'Dũng Thu', '', 'Thôn 2', ''),
(281, 'Ngọc Bằng', '', 'Thôn 3', ''),
(282, 'Loan Sự', '', 'Thôn 2', ''),
(283, 'Hòa Bồi', '', 'THôn 2', ''),
(284, 'Haug', '', 'Làng ren', ''),
(285, 'Dũng Trang', '', 'Thôn 3', ''),
(286, 'Anh Tây', '', 'Thôn 1', ''),
(287, 'Mười Hà', '', 'Thôn 3', ''),
(288, 'Hồng Giao', '', 'Thôn 3', ''),
(289, 'Vinh Phước', '', 'Thôn 3', ''),
(290, 'Phương Ly', '', 'Thôn 3', ''),
(291, 'Tính Việt', '', 'Thôn 3', ''),
(292, 'Rơ châm pjih', '702109', 'Làng ren', ''),
(293, 'Hải Thảo', '', 'Thôn 3', ''),
(294, 'Hùng Tuyết', '', 'Thôn 2', ''),
(295, 'Lan Phát', '', 'Thôn 2', ''),
(296, 'K SOR H MRAOH', '', 'Làng hòa', ''),
(297, 'K SOR Byan', '', 'Làng hòa', ''),
(298, 'K SOR Con út', '', 'Làng hòa', ''),
(299, 'Anh Vinh', '', 'Thôn 3', ''),
(300, 'Út Xuân', '', 'Thôn 3', ''),
(301, 'Lâm Thảo', '', 'Thôn 3', ''),
(302, 'Dũng Lợi', '', 'Thôn ', ''),
(303, 'Chín Chính', '', 'Thôn 2', ''),
(304, 'Phước Nữ', '', 'Thôn 3', ''),
(305, 'Anh Thành', '', 'Cầu số 3', ''),
(306, 'hen', '', 'Làng hòa', ''),
(307, 'Gấm ', '', 'Nông trường', ''),
(308, 'siu h mĩu con', '', 'làng bối', ''),
(309, 'Bình Ngân', '', 'Nông trường', ''),
(310, 'mun', '', 'làng bối', ''),
(311, 'Thuận Hồng', '', 'Thôn 3', ''),
(312, 'Hyao', '', 'Làng bối', ''),
(313, 'puông', '', 'làng bối', ''),
(314, 'Sĩ Duyên', '', 'Thôn 3', ''),
(315, 'Anh Nhên', '', 'Làng hòa', ''),
(316, 'Hạnh Diệu', '', 'Thôn 3', ''),
(317, 'Rơ châm huang', '', 'làng ren', 'Nợ cũ'),
(318, 'thanh Vân', '', 'Thôn 3', ''),
(319, 'Phụng Đẹt', '', 'Thôn 3', ''),
(320, 'xuân Cát', '', 'Thôn 2', ''),
(321, 'Danh Diễm', '', 'Thôn 3', ''),
(322, 'HƯƠNG HẢI', '', 'Thôn 3', ''),
(323, 'Chị Tiến', '', 'Thôn 2', ''),
(324, 'Hoàng Được', '', 'Thôn 2', ''),
(325, 'BÚP NỠ', '', 'Thôn 3', ''),
(326, 'Em Cải', '', 'Làng bối', ''),
(327, 'rơ châm Khoan', '', 'Làng ren', ''),
(328, 'Rơ châm Dai', '', 'Làng bối', ''),
(329, 'Thủy Liệu', '', 'Thôn 2', ''),
(330, 'Hùng Ngân', '', 'Thôn 2', ''),
(331, 'CHỊ Lan', '', 'Thôn 1', ''),
(332, 'Ka Rút khoang', '', 'Làng ren', ''),
(333, 'soan khoan', '', 'Làng ren', ''),
(334, 'Bình Nga', '', 'Thôn 3', ''),
(335, 'Hương Định', '', 'Thôn 2', ''),
(336, 'Liên Nam', '', 'Thôn 3', ''),
(337, 'k Lun', '', 'Làng ren', 'Đợt 1'),
(338, 'H Líu', '', 'Làng ren', ''),
(339, 'Hòa minh', '', 'Thôn 3', ''),
(340, 'Thuận hòa', '', 'Làng bối', ''),
(341, 'xéo', '', 'Thôn 3', ''),
(342, 'Quý chị hai', '', 'Thôn3', ''),
(343, 'Quý Mai', '', 'Thôn 3', ''),
(344, 'rơ châm vêu', '', 'Làng bối', ''),
(345, 'Rơ châm Thảo', '', 'Làng bối', ''),
(346, 'Thúy Kết', '', 'Thôn 3', ''),
(347, 'Ngọ ', '', 'Thôn 3', ''),
(348, 'Quốc Luyến', '', 'Thôn 2', ''),
(349, 'pkl Thìn', '', 'Làng bối', ''),
(350, 'Thím Tý', '', 'Thôn 3', ''),
(351, 'Rơ châm Bô', '', 'Làng Hòa', ''),
(352, 'Thủy Chi', '', 'Thôn 3', ''),
(353, 'Bường Trinh', '', 'Thôn 1', ''),
(354, 'p lin', '', 'làng bối', ''),
(355, 'Chị Ánh', '', 'Thôn 3', ''),
(356, 'vốt khoan', '', 'Làng ren', ''),
(357, 'K Sor Bít', '', 'Làng hòa', ''),
(358, 'rơ châm mar', '', '697790', ''),
(359, 'Danh Tiến', '', 'Thôn 2', ''),
(360, 'Liên Đương', '', 'Thôn 3', ''),
(361, 'Thành Thu', '', 'Thôn 3', ''),
(362, 'Hiền Phú', '', 'Nông trường', ''),
(363, 'Phúc Thành', '', 'Thôn 3', ''),
(364, 'Quang Thu', '', 'Làng bối', ''),
(365, 'Nguyệt Thành', '', 'Làng bối', ''),
(366, 'K Ra', '', 'Làng Ren', ''),
(367, 'Rơ châm Phưng', '', 'làng bối', ''),
(368, 'Nga Tiến', '', 'Thôn 3', ''),
(369, 'Rơ châm Hyaih', '', 'Làng hòa', ''),
(370, 'Rơ châm yũ', '', 'số bìa 702003', ''),
(371, 'Rơ châm Hloan', '', 'Làng ren', ''),
(372, 'Rơ châm ên', '', 'Làng ren', ''),
(373, 'rơ châm byiuh', '', 'Làng ren', ''),
(374, 'Hạnh Hiền', '', 'Thôn 3', ''),
(375, 'Duy chị Mười', '', 'Thôn 3', ''),
(376, 'Hương 2', '', 'Thôn 2', ''),
(377, 'Chị Mười Trọng', '', 'Thôn 3', ''),
(378, 'Trọng Hường', '', 'Thôn 2', ''),
(379, 'Cò chị Năm', '', 'Thôn 3', ''),
(380, 'Hùng Thảo', '', 'Làng bối', ''),
(381, 'Rơ châm Ngao', '', 'Làng bối', ''),
(382, 'Rơ châm Ký', '', 'Làng ren', ''),
(383, 'A Chố', '', 'Làng ren', ''),
(384, 'Nghĩa Hà', '', 'Thôn 2', ''),
(385, 'Yên chị Ngọc', '', 'Thôn 3', ''),
(386, 'Ke', '', 'Làng ren', ''),
(387, 'Nuc', '', 'Làng ren', ''),
(388, 'pin', '', 'Làng hòa', ''),
(389, 'Chiếp', '', 'Làng hòa', ''),
(390, 'Tâm 2', '', 'Thôn 2', ''),
(391, 'Thím Yên', '', 'Thôn 3', ''),
(392, 'Hồng Ly', '', 'Làng Bối', ''),
(393, 'rơ châm sút', '', 'Làng Bối', 'Chung bìa đỏ với H Líu'),
(394, 'rơ châm Thương', '', 'Làng Bới', ''),
(395, 'Hiệp Nga', '', 'Thôn 3', ''),
(396, 'Toản Thọ', '', 'Làng Bối', ''),
(397, 'Hải anh Ba', '', 'Thôn 1', ''),
(398, 'Sang chị năm', '', 'Thôn 3', ''),
(399, ' rơ châm plin', '', 'Làng Bối', ''),
(400, 'K Sor Bưng', '', 'Làng Hòa', ''),
(401, 'Phôn làng ren', '', 'Làng ren', ''),
(402, 'Rơ châm jo', '', 'Làng bối', ''),
(403, 'anh chiếp', '', 'Làng hòa', ''),
(404, 'Anh Phúc LY', '', 'Thôn 2', ''),
(405, 'Nam Yến', '', 'Thôn 3', ''),
(406, 'anh Cần', '', 'Thôn 3', ''),
(407, 'Sơn Mỹ', '', 'Thôn 3', ''),
(408, 'rơ châm mêu', '702121', 'Làng ren', ''),
(409, 'Rơ châm Thanh', '', 'Làng Ren', 'Bìa đỏ 680599'),
(410, 'Tuy h líu', '', 'Làng ren', ''),
(411, 'Rơ châm Banh', '', 'Làng Ren', ''),
(412, 'Rơ châm Phôn', '', 'Làng Ren', ''),
(413, 'Gen phôn', '', 'làng ren', ''),
(414, 'Rơ châm pyul', '', 'Làng hòa', 'Có hộ khẩu'),
(415, 'Phít yũ', '', 'Làng ren', ''),
(416, 'Rơ châm Ngơn', '', 'Làng Bối', ''),
(417, ' B Lít', '', 'Làng ren', ''),
(418, 'Sơn Huyện', '', 'NGã ba', ''),
(419, 'Hà hải', '', 'Thôn 2', ''),
(420, 'Vi Hùng', '', 'Thôn 2', ''),
(421, 'Viên Hương', '', 'Khoáng Sản', ''),
(422, 'Chú Lâm', '', 'Thôn 3', ''),
(423, 'Hải thôn 3', '', 'Thôn 3', ''),
(424, 'Hà Nghĩa', '', 'Thôn 2', ''),
(425, 'Trung Ánh', '', 'Thôn 2', ''),
(426, 'Vui Ly', '', 'thôn 3', ''),
(427, 'Hải', '', 'Thôn3', ''),
(428, 'Chôh', '', 'Làng Ren', ''),
(429, 'Rơ châm EL', '', 'Làng ren', ''),
(430, 'Hồng', '', 'Thôn 3', ''),
(431, 'Hòa Nhung', '', 'Nông trường', ''),
(432, 'Thìn', '', 'Thôn 2', ''),
(433, 'Quý Danh', '', 'Thôn 3', ''),
(434, 'Hét', '', 'Làng hòa', ''),
(435, 'Rơ châm Choa', '', 'làng Ren', ''),
(436, 'Rơ châm chít', '', 'Làng Ren', ''),
(437, 'Rơ châm Han', '', 'Làng Ren', ''),
(438, 'Rơ châm hít', '', 'Làng Ren', ''),
(439, 'Đinh', '', 'làng hòa', ''),
(440, 'Vinh làng hòa', '', 'Làng hòa', ''),
(441, 'Phi', '', 'Làng hòa', ''),
(442, 'Đoak', '', 'Làng hòa', ''),
(443, 'Chú Mới', '', 'Thôn3', ''),
(444, 'K so Hải', '', 'Làng hòa', ''),
(445, 'Sơn fin', '', 'Làng Ren', ''),
(446, 'Rơ châm Beo', '', 'Làng Ren', ''),
(447, 'KiR', '', 'Làng Ren', ''),
(448, 'Loàng', '', 'Làng Ren', ''),
(449, 'Rơ châm Lim', '', 'Làng Ren', ''),
(450, 'Rơ châm Chuyên', '', 'Làng Ren', ''),
(451, 'Rơ châm Hưng', '', 'Làng Hòa', ''),
(452, 'Rơ châm Bot', '', 'Làng hòa', ''),
(453, 'Rơ châm Két', '', 'Làng hòa', '');

-- --------------------------------------------------------

--
-- Table structure for table `tra_no`
--

CREATE TABLE `tra_no` (
  `MaTraNo` int(11) NOT NULL,
  `MaKH` int(11) NOT NULL,
  `NgayTra` date NOT NULL,
  `NguoiNop` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LaiSuat` double NOT NULL,
  `SoTienNo` double NOT NULL,
  `DaTra` double NOT NULL,
  `ConNoLai` double NOT NULL,
  `GhiChuTra` text COLLATE utf8_unicode_ci,
  `IdThu2` int(11) NOT NULL,
  `TienLai` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tra_no`
--

INSERT INTO `tra_no` (`MaTraNo`, `MaKH`, `NgayTra`, `NguoiNop`, `LaiSuat`, `SoTienNo`, `DaTra`, `ConNoLai`, `GhiChuTra`, `IdThu2`, `TienLai`) VALUES
(3, 81, '2014-08-01', 'hoa', 1.5, 7220000, 2220000, 5000000, 'còn nợ lại', 6, 200000),
(4, 96, '2014-08-24', 'chung', 1.5, 4506000, 4506000, 0, 'trả hết', -1, 131000),
(5, 145, '2014-08-24', 'loan', 1.5, 367000, 367000, 0, 'trả hết', -1, 22000),
(6, 81, '2014-08-28', 'con của hoa', 0, 5000000, 5000000, 0, 'trả hết', -1, 0),
(7, 279, '2014-08-28', 'vợ', 0, 1950000, 1950000, 0, 'Trả hết', -1, 0),
(8, 95, '2014-08-29', 'Thi', 1.5, 7600000, 7600000, 0, 'Trả hết', -1, 110000),
(9, 136, '2014-08-29', 'Thái', 1.5, 2537000, 2537000, 0, 'Trả hết', -1, 97000),
(10, 121, '2014-08-31', 'Cải', 1.5, 7419000, 5419000, 2000000, 'Còn nợ lại', 137, 299000),
(11, 98, '2014-09-07', 'chú đức', 1.5, 19670000, 19670000, 0, 'Trae hết', -1, 1238000),
(12, 75, '2014-09-10', 'Thanh', 1.5, 4775000, 4775000, 0, 'Trả hết', -1, 295000),
(13, 302, '2014-09-15', 'Lợi', 1.5, 2038000, 2038000, 0, 'Trả hết', -1, 38000),
(15, 71, '2014-09-22', 'chị Noa', 1.5, 39228000, 10000000, 29228000, 'Trả mười triệu', 103, 1213000),
(16, 287, '2014-09-25', 'mười', 1.5, 4139000, 4139000, 0, 'Trả hết', -1, 99000),
(17, 202, '2014-09-29', 'chị mười', 1.5, 2330000, 2330000, 0, 'Trả hết', -1, 120000),
(18, 290, '2014-09-30', 'phương', 1.5, 13700000, 8000000, 5700000, 'Trả hết', 78, 655000),
(19, 195, '2014-10-02', 'cường', 1.5, 15869000, 7000000, 8869000, 'Còn nợ lại', 397, 449000),
(20, 287, '2014-10-05', 'mười', 0, 3900000, 3900000, 0, '', -1, 0),
(21, 51, '2014-10-08', 'chị liễu', 1.5, 9883000, 3800000, 6083000, 'Còn nợ lại', 523, 423000),
(23, 196, '2014-10-08', 'Thanh', 1.5, 4046000, 3000000, 1046000, 'Còn nợ lại', 28, 236000),
(25, 201, '2014-10-09', 'hiếu', 1.5, 13373000, 9500000, 3873000, '', 34, 838000),
(26, 241, '2014-10-10', 'hiệp', 1.5, 4032000, 4032000, 0, 'Trả hết', -1, 132000),
(27, 283, '2014-10-11', 'hòa', 1.5, 775000, 775000, 0, 'Trả hết', -1, 145000),
(28, 196, '2014-10-14', 'thanh', 0, 1046000, 1046000, 0, 'Trả hết', -1, 0),
(29, 233, '2014-10-14', 'Mỹ', 1.5, 8097000, 8097000, 0, 'Trả hết', -1, 262000),
(31, 190, '2014-10-17', 'quốc', 1.5, 21834000, 21834000, 0, 'trả hết', -1, 809000),
(32, 102, '2014-10-18', 'Dek', 1.5, 4530000, 4530000, 0, 'Trả hết', -1, 490000),
(33, 253, '2014-10-18', 'Phượng', 1.5, 12220000, 5000000, 7220000, '', 123, 520000),
(34, 201, '2014-10-21', 'nga', 0, 3873000, 3873000, 0, 'trả hết', -1, 0),
(36, 308, '2014-10-21', 'Con', 1.5, 2834000, 2834000, 0, 'Trả hết', -1, 169000),
(39, 110, '2014-10-22', 'Plk', 1.5, 4289000, 4289000, 0, 'Trả hết', -1, 304000),
(40, 125, '2014-10-21', 'Mĩu', 1.5, 6560000, 6560000, 0, 'Trả hết', -1, 400000),
(41, 117, '2014-10-23', 'yuih', 1.5, 2770000, 2770000, 0, 'Trả hết', -1, 180000),
(42, 130, '2014-10-23', 'Cô Tân', 1.5, 2977000, 2977000, 0, 'Trả hết', -1, 297000),
(43, 307, '2014-10-23', 'gấm', 0, 2500000, 2500000, 0, 'Trả hết', -1, 0),
(44, 273, '2014-10-23', 'Hiền', 1.5, 2216000, 2216000, 0, 'Trả hết', -1, 96000),
(45, 118, '2014-10-24', 'yung', 1.5, 5187000, 5187000, 0, 'Trả hết', -1, 337000),
(46, 229, '2014-10-24', 'hoa', 1.5, 6914000, 6914000, 0, 'trả hết', -1, 354000),
(47, 286, '2014-10-24', 'Anh Tây', 1.5, 2976000, 2976000, 0, 'Trả hết', -1, 176000),
(48, 252, '2014-10-24', 'Anh Năm', 1.5, 3926000, 3926000, 0, 'Trả hết', -1, 276000),
(49, 132, '2014-10-24', 'Thiếm Tám', 1.5, 1517000, 1517000, 0, 'Trả hết', -1, 167000),
(50, 267, '2014-10-25', 'Hai', 1.5, 2118000, 2118000, 0, 'Trả hết', -1, 83000),
(51, 57, '2014-10-26', 'Chị Mai', 1.5, 4544000, 4544000, 0, 'TRả hết', -1, 584000),
(52, 80, '2014-10-26', 'thương', 0, 760000, 760000, 0, 'Trả hết', -1, 0),
(53, 260, '2014-10-26', 'Đức', 1.5, 2206000, 2206000, 0, 'Trả hết', -1, 141000),
(54, 112, '2014-10-26', 'Rim', 1.5, 4174000, 4174000, 0, 'Trả hết', -1, 384000),
(55, 150, '2014-10-26', 'Đức', 1.5, 7274000, 5000000, 2274000, 'Còn nợ lại', 254, 484000),
(57, 97, '2014-10-27', 'hào', 1.5, 12532000, 12532000, 0, 'Trả hết', -1, 812000),
(58, 116, '2014-10-28', 'yong', 1.5, 2789000, 2789000, 0, 'Trả hết', -1, 189000),
(59, 129, '2014-10-28', 'foah', 1.5, 1336000, 1336000, 0, 'Trả hết', -1, 76000),
(61, 293, '2014-10-28', 'Hải', 1.5, 4011000, 4011000, 0, '', -1, 111000),
(62, 120, '2014-10-30', 'ủnh', 1.5, 7309000, 7309000, 0, 'Trae hết', -1, 494000),
(63, 270, '2014-10-30', 'vân', 1.5, 2515000, 2515000, 0, 'Trả hết', -1, 120000),
(64, 86, '2014-10-30', 'tâm', 1.5, 8014000, 3123000, 4891000, 'Còn nợ lại', 180, 414000),
(65, 142, '2014-10-30', 'bông', 1.5, 2206000, 2206000, 0, 'Trả hết', -1, 166000),
(66, 123, '2014-10-30', 'Duy', 1.5, 9510000, 5510000, 4000000, 'Còn nợ lại', 321, 450000),
(67, 85, '2014-11-01', 'Chị Sơn', 1.5, 5917000, 5917000, 0, 'Trả hết', -1, 287000),
(68, 136, '2014-11-01', 'thái', 0, 620000, 620000, 0, 'trả hết', -1, 0),
(69, 174, '2014-11-02', 'Chị Hoa', 1.5, 9373000, 8000000, 1373000, 'Còn nợ lại', 287, 473000),
(70, 298, '2014-11-02', 'Út', 1.5, 887000, 887000, 0, '', -1, 22000),
(71, 310, '2014-11-02', 'mun', 1.5, 2740000, 2740000, 0, 'Trả hết', -1, 180000),
(72, 243, '2014-11-03', 'Keo', 1.5, 1331000, 1331000, 0, 'Trả hết', -1, 71000),
(73, 244, '2014-11-03', 'Bít', 1.5, 1996000, 1996000, 0, '', -1, 106000),
(74, 213, '2014-11-03', 'huy', 1.5, 9510000, 9510000, 0, 'Trả hết', -1, 760000),
(75, 173, '2014-11-04', 'Hiệp', 1.5, 9637000, 8000000, 1637000, 'Con nợ lại', 209, 467000),
(76, 180, '2014-11-04', 'Thủy', 1.5, 12020000, 10020000, 2000000, 'còn nợ lại', 421, 1355000),
(77, 47, '2014-11-04', 'Chị Ngọc ', 1.5, 10316000, 10316000, 0, 'TRả hết', -1, 716000),
(78, 290, '2014-11-05', 'Phương', 1.5, 5800000, 5800000, 0, 'Trả hết', -1, 100000),
(79, 206, '2014-11-05', 'Anh Đức', 1.5, 14030000, 14030000, 0, 'Trả hết', -1, 840000),
(80, 205, '2014-11-05', 'Anh Đức', 1.5, 1555000, 1555000, 0, '', -1, 110000),
(81, 216, '2014-11-05', 'Chị Luận', 1.5, 13380000, 13380000, 0, 'Trả hết', -1, 660000),
(82, 56, '2014-11-06', 'Hiệp ', 1.5, 10146000, 9046000, 1100000, 'Còn nợ lại', 484, 806000),
(83, 175, '2014-11-06', 'loan', 1.5, 8699000, 4000000, 4699000, 'Còn nợ lại', 369, 529000),
(84, 297, '2014-11-06', 'Con', 1.5, 1472000, 1472000, 0, 'Trả hết', -1, 62000),
(85, 152, '2014-11-06', 'chị Lựu', 1.5, 10370000, 10370000, 0, 'Trả hết', -1, 595000),
(86, 306, '2014-11-06', 'hen', 1.5, 6043000, 6043000, 0, 'trả hết', -1, 193000),
(87, 219, '2014-11-06', 'yến', 1.5, 2930000, 2930000, 0, 'Trả hết', -1, 170000),
(88, 231, '2014-11-06', 'Anh Chính', 1.5, 9880000, 9880000, 0, 'Trả hết', -1, 580000),
(89, 52, '2014-11-07', 'hiền', 1.5, 13325000, 13325000, 0, 'Trả hết', -1, 1505000),
(90, 158, '2014-11-07', 'Long', 1.5, 4900000, 4900000, 0, 'Trả hết', -1, 345000),
(91, 151, '2014-11-07', 'Sửu', 1.5, 4817000, 4817000, 0, 'Trả hết', -1, 387000),
(92, 79, '2014-11-08', 'Nga', 1.5, 2426000, 2426000, 0, 'trả hết', -1, 126000),
(93, 218, '2014-11-08', 'Dũng', 1.5, 6297000, 6297000, 0, 'trả hết', -1, 332000),
(94, 187, '2014-11-08', 'Dự', 1.5, 13605000, 11500000, 2105000, 'Còn nợ lại', 126, 740000),
(95, 215, '2014-11-09', 'anh Đào', 1.5, 9840000, 9840000, 0, 'Trả hết', -1, 690000),
(97, 312, '2014-11-09', 'hyao', 1.5, 2028000, 2028000, 0, 'Trả hết', -1, 138000),
(98, 313, '2014-11-09', 'puông', 1.5, 1610000, 1610000, 0, 'Trả hết', -1, 110000),
(99, 126, '2014-11-09', 'sak', 1.5, 9607000, 9607000, 0, 'trả hết', -1, 657000),
(100, 240, '2014-11-09', 'yến', 1.5, 1885000, 1885000, 0, 'Trả hết', -1, 105000),
(101, 223, '2014-11-10', 'Chị Hai', 1.5, 5828000, 5828000, 0, 'Trả hết', -1, 358000),
(102, 84, '2014-11-10', 'Khánh', 1.5, 2647000, 1500000, 1147000, 'Còn nợ lại', 147, 162000),
(103, 71, '2014-11-10', 'Thơ', 1.5, 29944000, 14000000, 15944000, 'Còn nợ lại', 138, 716000),
(104, 78, '2014-11-11', 'Anh Chạy', 1.5, 8843000, 8843000, 0, 'Trả hết', -1, 593000),
(105, 182, '2014-11-11', 'Đàm', 1.5, 6104000, 6104000, 0, 'Trả hết', -1, 354000),
(106, 245, '2014-11-11', 'Két', 1.5, 1728000, 1728000, 0, 'Trả hết', -1, 98000),
(107, 114, '2014-11-11', 'kói', 1.5, 7538000, 7538000, 0, 'trả hết', -1, 430000),
(108, 95, '2014-11-11', 'thi', 1.5, 5433000, 5433000, 0, 'Trả hết', -1, 153000),
(109, 111, '2014-11-12', 'Hút', 1.5, 8275000, 7275000, 1000000, 'Còn nợ lại', 116, 685000),
(110, 249, '2014-11-12', 'Bằng', 1.5, 4998000, 4998000, 0, 'Trả hết', -1, 943000),
(111, 225, '2014-11-12', 'Chị Phương', 1.5, 1004000, 1004000, 0, 'Trả hết', -1, 69000),
(112, 228, '2014-11-12', 'Lực', 1.5, 7173000, 7173000, 0, 'Trả hết', -1, 383000),
(113, 43, '2014-11-12', 'kiết', 1.5, 4706000, 2250000, 2456000, 'Còn nợ lại', 400, 666000),
(114, 207, '2014-11-12', 'Thủy', 1.5, 4600000, 4600000, 0, '', -1, 200000),
(115, 138, '2014-11-12', 'Danh', 1.5, 4832000, 4832000, 0, 'Trả hết', -1, 402000),
(116, 111, '2014-11-13', 'Hút', 0, 1000000, 1000000, 0, '', -1, 0),
(119, 259, '2014-11-13', 'sang', 1.5, 4030000, 4030000, 0, 'Trả hết', -1, 190000),
(120, 314, '2014-11-13', 'Sĩ', 1.5, 4050000, 4050000, 0, 'Trả hết', -1, 150000),
(121, 285, '2014-11-13', 'Dũng', 1.5, 5977000, 5977000, 0, '', -1, 232000),
(123, 253, '2014-11-13', 'phượng', 1.5, 7313000, 7313000, 0, 'Trả hết', -1, 93000),
(124, 179, '2014-11-13', 'hiền', 1.5, 12825000, 12825000, 0, 'Trả hết', -1, 765000),
(125, 55, '2014-11-13', 'Chị Hồng', 1.5, 5507000, 5507000, 0, 'Trả hết', -1, 507000),
(126, 187, '2014-11-13', 'Dự', 0, 2105000, 2105000, 0, 'Trả hết', -1, 0),
(128, 276, '2014-11-14', 'Mười', 1.5, 13249000, 8000000, 5249000, 'Còn nợ lại', 193, 1667000),
(130, 282, '2014-11-14', 'Loan', 1.5, 1880000, 1880000, 0, 'Trả hết', -1, 380000),
(131, 192, '2014-11-14', 'thiếm Sáu', 1.5, 3954000, 3954000, 0, 'Trả hết', -1, 254000),
(132, 155, '2014-11-14', 'Tuấn', 1.5, 6078000, 6078000, 0, 'Trả hết', -1, 383000),
(133, 232, '2014-11-15', 'Thành', 1.5, 6010000, 6010000, 0, 'Trả hết', -1, 310000),
(134, 107, '2014-11-15', 'Chị Xoa', 1.5, 10889000, 3000000, 7889000, 'Con nợ lại', 269, 839000),
(135, 103, '2014-11-15', 'Chị Nga', 1.5, 8050000, 7050000, 1000000, 'Còn nợ lại', 581, 615000),
(137, 121, '2014-11-16', 'Cải', 1.5, 3329000, 3329000, 0, 'Trả hết', -1, 89000),
(138, 71, '2014-11-16', 'Chị Noa', 0, 15944000, 10000000, 5944000, 'Còn nợ lại', 196, 0),
(139, 289, '2014-11-16', 'Vinh', 1.5, 7330000, 7330000, 0, 'Trả hết', -1, 490000),
(140, 141, '2014-11-16', 'Minh', 1.5, 2200000, 2200000, 0, 'Trả hết', -1, 170000),
(141, 92, '2014-11-18', 'Chính', 1.5, 603000, 603000, 0, 'Trả hết', -1, 43000),
(142, 122, '2014-11-18', 'Tâm', 1.5, 6177000, 6177000, 0, 'Trả hết', -1, 387000),
(143, 199, '2014-11-19', 'Bảy', 1.5, 10295000, 10295000, 0, 'Trả hết', -1, 565000),
(144, 91, '2014-11-19', 'Hoa', 1.5, 3615000, 3615000, 0, 'Trả hết', -1, 215000),
(145, 77, '2014-11-19', 'Phượng', 1.5, 1223000, 1223000, 0, '', -1, 88000),
(146, 108, '2014-11-19', 'Tâm', 1.5, 6360000, 6360000, 0, 'Trả hết', -1, 375000),
(147, 84, '2014-11-19', 'Khánh', 0, 1147000, 1147000, 0, '', -1, 0),
(148, 44, '2014-11-20', 'Anh Châu', 1.5, 11368000, 11368000, 0, 'Trả hết', -1, 1742000),
(149, 311, '2014-11-20', 'Anh Thuận', 1.5, 1606000, 1606000, 0, 'Trả hết', -1, 61000),
(150, 164, '2014-11-20', 'Chị Đức', 1.5, 43308000, 15000000, 28308000, 'Còn nợ lại', 200, 2943000),
(151, 191, '2014-11-20', 'Cường', 1.5, 5563000, 5563000, 0, 'Trả hết', -1, 388000),
(152, 163, '2014-11-20', 'Châu', 1.5, 6034000, 6034000, 0, 'Trả hết', -1, 399000),
(153, 48, '2014-11-21', 'Anh Thành', 1.5, 2989000, 2989000, 0, 'Trả hết', -1, 179000),
(154, 134, '2014-11-21', 'Hương', 1.5, 2534000, 2534000, 0, 'trả hết', -1, 244000),
(155, 210, '2014-11-22', 'Hoàng', 1.5, 7477000, 7477000, 0, 'Trả hết', -1, 497000),
(157, 135, '2014-11-22', 'Tài', 1.5, 22595000, 22595000, 0, 'Trả hết', -1, 1655000),
(158, 160, '2014-11-23', 'Ân', 1.5, 4430000, 4430000, 0, 'Trả hết', -1, 400000),
(160, 220, '2014-11-23', 'Hổ', 1.5, 4825000, 4825000, 0, 'Trả hết', -1, 315000),
(161, 162, '2014-11-23', 'Lan', 1.5, 11350000, 11350000, 0, 'Trả hết', -1, 630000),
(162, 194, '2014-11-23', 'Thắng', 1.5, 8220000, 7000000, 1220000, 'Còn nợ lại', 226, 390000),
(164, 165, '2014-11-24', 'Anh Loan', 1.5, 19785000, 19785000, 0, 'Trả hết', -1, 1290000),
(165, 137, '2014-11-24', 'Hậu', 1.5, 13329000, 13329000, 0, 'Trả hết', -1, 1034000),
(166, 133, '2014-11-24', 'Thảo', 1.5, 13050000, 10050000, 3000000, 'Còn nợ lại', 234, 815000),
(167, 131, '2014-11-24', 'Khánh', 1.5, 2195000, 2195000, 0, 'Trả hết', -1, 275000),
(169, 271, '2014-11-24', 'Bình', 1.5, 1569000, 1569000, 0, 'Trả hết', -1, 89000),
(170, 257, '2014-11-24', 'Quý', 1.5, 1364000, 1364000, 0, 'Trả hết', -1, 104000),
(171, 40, '2014-11-25', 'Phấn', 1.5, 14559000, 7000000, 7559000, 'Còn nợ lại', 553, 1561000),
(172, 149, '2014-11-25', 'Út', 1.5, 9487000, 9487000, 0, 'Trả hết', -1, 767000),
(173, 68, '2014-11-25', 'Lành', 1.5, 1666000, 1666000, 0, 'Trả hết', -1, 221000),
(174, 296, '2014-11-26', 'H MRAOH', 1.5, 1465000, 1465000, 0, 'Trả hết', -1, 75000),
(175, 157, '2014-11-26', 'Nghĩa', 1.5, 3984000, 3984000, 0, 'Trả hết', -1, 134000),
(176, 246, '2014-11-27', 'Dung', 1.5, 10277000, 9000000, 1277000, 'Còn nợ lại', 262, 832000),
(177, 59, '2014-11-28', 'Anh Tư', 1.5, 20405000, 20405000, 0, 'Trả hết', -1, 1275000),
(178, 264, '2014-11-28', 'Chị Nở', 1.5, 10949000, 10949000, 0, 'Trả hết', -1, 519000),
(179, 250, '2014-11-28', 'Hải', 1.5, 1048000, 1048000, 0, 'Trả hết', -1, 68000),
(180, 86, '2014-11-28', 'tâmTrả hết', 1.5, 4960000, 4960000, 0, '', -1, 69000),
(181, 61, '2014-11-29', 'Thanh', 1.5, 19198000, 14000000, 5198000, 'Còn nợ lại', 469, 1498000),
(182, 235, '2014-11-29', 'Ngọc', 1.5, 24300000, 24300000, 0, 'Trả hết', -1, 1410000),
(183, 70, '2014-11-30', 'Anh Thuận', 1.5, 8790000, 8790000, 0, 'Trả hết', -1, 660000),
(184, 239, '2014-11-30', 'Chị Bông', 1.5, 7396000, 4396000, 3000000, 'Còn nợ lại', 608, 1396000),
(185, 66, '2014-11-30', 'Ký', 1.5, 6627000, 6627000, 0, 'Trả hết', -1, 617000),
(187, 226, '2014-11-30', 'Anh Mao', 1.5, 5174000, 4174000, 1000000, '', 317, 324000),
(188, 227, '2014-11-30', 'Vân', 1.5, 3934000, 3934000, 0, 'Trả hết', -1, 259000),
(189, 96, '2014-12-01', 'Cảnh', 1.5, 1390000, 1390000, 0, 'Trả hết', -1, 55000),
(190, 203, '2014-12-01', 'Chị Lan', 1.5, 4049000, 4049000, 0, 'Trả hết', -1, 329000),
(191, 222, '2014-12-01', 'Cường', 1.5, 2423000, 2423000, 0, 'Trả hết', -1, 163000),
(192, 156, '2014-12-02', 'Thanh', 1.5, 10094000, 10094000, 0, 'Trả hết', -1, 864000),
(193, 276, '2014-12-02', 'Mười', 0, 5249000, 5249000, 0, 'Trả hết', -1, 0),
(194, 292, '2014-12-02', 'pyih', 1.5, 9379000, 9379000, 0, 'Trả hết', -1, 429000),
(195, 33, '2014-12-03', 'Anh Hùng', 1.5, 10628000, 10628000, 0, 'Trả hết', -1, 1450000),
(196, 71, '2014-12-04', 'Thơ', 0, 5944000, 5944000, 0, 'Trả hết', -1, 0),
(197, 300, '2014-12-05', 'Xuân', 1.5, 3876000, 3876000, 0, 'Trả hết', -1, 156000),
(198, 147, '2014-12-06', 'Nga', 1.5, 12148000, 10500000, 1648000, 'Còn nợ lại', 224, 1083000),
(199, 299, '2014-12-06', 'Anh Vinh', 1.5, 2924000, 2924000, 0, 'Trả hết', -1, 119000),
(200, 164, '2014-12-08', 'Chị Đức', 1.5, 28562000, 20000000, 8562000, 'Còn nợ lại', 356, 254000),
(201, 262, '2014-12-09', 'Anh Sơn', 0, 2000000, 2000000, 0, 'Trả hết', -1, 0),
(202, 139, '2014-12-09', 'Phong', 1.5, 14727000, 10000000, 4727000, 'Còn nợ lại', 311, 972000),
(203, 63, '2014-12-10', 'Chị Lan', 1.5, 27249000, 10000000, 17249000, 'Còn nợ lại', 409, 2044000),
(204, 288, '2014-12-10', 'Hồng', 1.5, 4517000, 4517000, 0, 'Trả hết', -1, 232000),
(205, 60, '2014-12-12', 'Thúy', 1.5, 8500000, 6000000, 2500000, 'Còn nợ lại', 220, 970000),
(206, 294, '2014-12-12', 'Yến', 1.5, 719000, 719000, 0, 'trả hết', -1, 34000),
(207, 93, '2014-12-13', 'hiền', 1.5, 1253000, 1253000, 0, 'Trả hết', -1, 103000),
(208, 316, '2014-12-16', 'Hạnh', 1.5, 1620000, 1620000, 0, 'Trả hết', -1, 120000),
(209, 173, '2014-12-16', 'Hiệp ', 1.5, 1670000, 1670000, 0, 'trả hết', -1, 33000),
(210, 305, '2014-12-17', 'Anh Thành', 1.5, 3230000, 3230000, 0, 'Trả hết', -1, 230000),
(211, 166, '2014-12-17', 'Chị Lan', 1.5, 1130000, 1130000, 0, 'Trả hết', -1, 130000),
(212, 214, '2014-12-17', 'Anh Liêm', 1.5, 503000, 503000, 0, 'Trả hết', -1, 43000),
(213, 105, '2014-12-17', 'Lai', 1.5, 4920000, 4920000, 0, 'Trả hết', -1, 400000),
(214, 109, '2014-12-17', 'Thắng', 1.5, 24317000, 24317000, 0, 'Trả hết', -1, 2482000),
(216, 197, '2014-12-19', 'Hiệp', 1.5, 14890000, 14890000, 0, 'Trả hết', -1, 440000),
(217, 189, '2014-12-19', 'Loan', 1.5, 11160000, 11160000, 0, 'Trả hết', -1, 810000),
(219, 317, '2014-12-20', 'Huang', 1.5, 7983000, 7983000, 0, 'trả hết', -1, 983000),
(220, 60, '2014-12-20', 'thúy', 0, 2500000, 2500000, 0, 'Trả hết', -1, 0),
(222, 221, '2014-12-23', 'Hoàng', 1.5, 2435000, 2435000, 0, 'Trả hết', -1, 215000),
(223, 315, '2014-12-24', 'Nhên', 1.5, 1305000, 1305000, 0, 'Trả hết', -1, 65000),
(224, 147, '2014-12-24', 'Nga', 0, 1648000, 1648000, 0, 'Trả hết', -1, 0),
(225, 140, '2014-12-25', 'Hoa', 1.5, 3036000, 3036000, 0, 'Trả hết', -1, 276000),
(226, 194, '2014-12-25', 'Thắng', 0, 1220000, 1220000, 0, 'Trả hết', -1, 0),
(227, 265, '2014-12-27', 'Thạnh', 0, 25200000, 25200000, 0, 'Trả hết', -1, 0),
(228, 127, '2014-12-28', 'Anh Tiến', 1.5, 1494000, 1494000, 0, 'Trả hết', -1, 129000),
(229, 261, '2014-12-28', 'Anh Tiến', 1.5, 2124000, 2124000, 0, 'Trả hết', -1, 184000),
(230, 128, '2014-12-29', 'Thành', 1.5, 7450000, 7000000, 450000, 'Còn nợ lại', 290, 546000),
(231, 269, '2014-12-30', 'Dũng', 1.5, 7130000, 7130000, 0, 'Trả hết', -1, 410000),
(232, 148, '2014-12-31', 'Kiều', 1.5, 6800000, 6800000, 0, 'Trae hết', -1, 630000),
(233, 234, '2015-01-02', 'Hạnh', 1.5, 2120000, 2120000, 0, 'Trả hết', -1, 200000),
(234, 133, '2015-01-03', 'Thảo', 0, 3000000, 3000000, 0, 'Trả hết', -1, 0),
(235, 49, '2015-01-05', 'Vân', 1.5, 4908000, 4000000, 908000, 'Còn nợ lại', -1, 658000),
(236, 177, '2015-01-07', 'Châu', 0, 385000, 385000, 0, 'Trả hết', -1, 0),
(237, 212, '2015-01-07', 'Sâm', 1.5, 20876000, 20876000, 0, 'Trả hết', -1, 1561000),
(238, 184, '2015-01-08', 'Việt', 1.5, 78590000, 78590000, 0, 'Trả hết', -1, 6530000),
(239, 170, '2015-01-08', 'Thành', 1.5, 2067000, 2067000, 0, 'Trả hết', -1, 217000),
(240, 113, '2015-01-09', 'Anh nhớn', 1.5, 8422000, 8422000, 0, 'Trả hết', -1, 982000),
(241, 318, '2015-01-09', 'Thanh', 1.5, 5827000, 5827000, 0, 'Trả hết', -1, 327000),
(242, 90, '2015-01-09', 'Thoản', 1.5, 3987000, 3987000, 0, 'Trả hết', -1, 332000),
(243, 99, '2015-01-09', 'Bảo', 1.5, 6199000, 6199000, 0, 'Trả hết', -1, 709000),
(244, 35, '2015-01-10', 'Chị Chức', 1.5, 22800000, 22800000, 0, 'Còn lại', -1, 2465000),
(245, 272, '2015-01-13', 'Đờn', 1.5, 966000, 966000, 0, 'Trả hết', -1, 76000),
(246, 145, '2015-01-14', 'Chị Loan', 1.5, 5196000, 5196000, 0, 'Trả hết', -1, 346000),
(247, 181, '2015-01-14', 'Oai', 1.5, 4063000, 4063000, 0, 'Trả hết', -1, 443000),
(248, 291, '2015-01-15', 'tính', 1.5, 5885000, 5885000, 0, 'Trả hết', -1, 385000),
(249, 204, '2015-01-15', 'Hằng', 1.5, 37910000, 27910000, 10000000, 'Còn nợ lại', 631, 3115000),
(250, 38, '2015-01-15', 'Toàn', 1.5, 4400000, 4400000, 0, 'Trả hết', -1, 521000),
(251, 183, '2015-01-15', 'Chị Đẹp', 1.5, 21462000, 10000000, 11462000, 'Còn nợ lại', 312, 1942000),
(252, 301, '2015-01-16', 'Lâm', 1.5, 1595000, 1595000, 0, 'Trả hết', -1, 105000),
(253, 83, '2015-01-17', 'Năng', 1.5, 4506000, 4506000, 0, 'Trả hết', -1, 406000),
(254, 150, '2015-01-17', 'Đức', 1.5, 2368000, 2368000, 0, '', -1, 94000),
(256, 188, '2015-01-17', 'Anh Long', 1.5, 27400000, 20000000, 7400000, 'Còn nợ', 318, 2545000),
(257, 247, '2015-01-17', 'Chị Hai', 1.5, 22110000, 12110000, 10000000, 'Còn nợ lại', 419, 2380000),
(258, 124, '2015-01-18', 'Huy', 1.5, 6299000, 6299000, 0, 'Trả hết', -1, 629000),
(259, 263, '2015-01-20', 'Chú Tư', 1.5, 2488000, 2488000, 0, 'Trả hết', -1, 198000),
(260, 169, '2015-01-21', 'Anh Hóa', 1.5, 7066000, 7066000, 0, 'Trả hết', -1, 726000),
(261, 100, '2015-01-22', 'Chị Nga', 1.5, 13438000, 11000000, 2438000, 'Còn nợ lại', 537, 1438000),
(262, 246, '2015-01-22', 'Dung', 1.5, 1310000, 1310000, 0, 'Trả hết', -1, 33000),
(263, 87, '2015-01-23', 'Cúc', 1.5, 5565000, 5565000, 0, 'Trả hết', -1, 445000),
(264, 236, '2015-01-24', 'Quang', 1.5, 2468000, 2468000, 0, 'Trả hết', -1, 228000),
(265, 82, '2015-01-24', 'Tiến', 1.5, 7632000, 7632000, 0, 'Trả hết', -1, 522000),
(266, 258, '2015-01-24', 'toàn', 1.5, 4335000, 4335000, 0, 'Trả hết', -1, 415000),
(267, 144, '2015-01-25', 'Chị Mùi', 1.5, 2180000, 2180000, 0, 'Trả hết', -1, 295000),
(268, 153, '2015-01-25', 'loan', 1.5, 2000000, 2000000, 0, 'trả hết', -1, 180000),
(269, 107, '2015-01-26', 'Chị Xoa', 1.5, 8173000, 4000000, 4173000, 'Còn nợ lại', 536, 284000),
(270, 62, '2015-01-27', 'Anh Vinh', 1.5, 10922000, 3000000, 7922000, 'Còn nợ lại', 282, 1632000),
(271, 101, '2015-01-27', 'Mai', 1.5, 4384000, 4384000, 0, 'Trả hết', -1, 384000),
(272, 172, '2015-01-28', 'Dân', 1.5, 14385000, 10000000, 4385000, 'Còn nợ lại', 558, 1395000),
(273, 280, '2015-01-29', 'dũng', 1.5, 1214000, 1214000, 0, 'trả hết', -1, 94000),
(274, 104, '2015-01-29', 'Dơi', 1.5, 586000, 586000, 0, 'Trả hết', -1, 86000),
(275, 295, '2015-01-30', 'Lan', 1.5, 3130000, 3130000, 0, 'trả hết', -1, 205000),
(276, 36, '2015-01-30', 'Hướng', 0, 41698000, 41698000, 0, 'Trả hết', -1, 0),
(277, 178, '2015-02-01', 'Hồng', 1.5, 11057000, 11057000, 0, 'Trả hết', -1, 1197000),
(278, 171, '2015-02-01', 'Hùng', 1.5, 1430000, 1430000, 0, 'Trả hết', -1, 135000),
(279, 167, '2015-02-02', 'Ngà', 1.5, 7117000, 7117000, 0, 'Trả hết', -1, 917000),
(280, 319, '2015-02-02', 'Đẹt', 1.5, 3984000, 3984000, 0, 'Trả hết', -1, 264000),
(281, 58, '2015-02-04', 'Bé', 1.5, 3120000, 3120000, 0, 'Trả hết', -1, 350000),
(282, 62, '2015-02-05', 'Anh Vinh', 0, 7922000, 4000000, 3922000, 'Còn nợ lại', 283, 0),
(283, 62, '2015-02-07', 'Hoan', 0, 3922000, 3922000, 0, 'Trả hết', -1, 0),
(284, 320, '2015-02-09', 'dũng', 1.5, 411000, 411000, 0, 'Trả hết', -1, 51000),
(285, 168, '2015-02-10', 'Anh Sơn', 1.5, 5447000, 5447000, 0, 'Trả hết', -1, 677000),
(286, 54, '2015-02-10', 'Trọng', 1.5, 21358000, 20000000, 1358000, 'Còn nợ lại', 306, 2308000),
(287, 174, '2015-02-12', 'Cường', 0, 1373000, 1373000, 0, 'Trả hết', -1, 0),
(288, 251, '2015-02-12', 'liên', 1.5, 1770000, 1770000, 0, 'Trả hết', -1, 285000),
(289, 309, '2015-02-12', 'Ngân', 1.5, 1250000, 1250000, 0, 'Trả hết', -1, 100000),
(290, 128, '2015-02-13', 'Phương', 0, 450000, 450000, 0, 'Trả hết', -1, 0),
(291, 193, '2015-02-13', 'Long', 1.5, 2370000, 2370000, 0, 'Trả hết', -1, 280000),
(292, 94, '2015-02-14', 'Chị chí', 1.5, 2007000, 2007000, 0, 'Trả hết', -1, 212000),
(293, 266, '2015-02-16', 'Huyền', 0, 4055000, 4055000, 0, 'Trả hết', -1, 0),
(294, 78, '2015-02-17', 'Anh Chạy', 0, 1485000, 1485000, 0, 'Trả hết', -1, 0),
(295, 230, '2015-02-18', 'Chị năm', 1.5, 9758000, 9758000, 0, 'Trả hết', -1, 718000),
(296, 237, '2015-02-28', 'Loan', 1.5, 1370000, 1370000, 0, 'Trả hết', -1, 330000),
(297, 73, '2015-03-02', 'Linh', 1.5, 4460000, 4460000, 0, 'Trả hết', -1, 305000),
(298, 190, '2015-03-04', 'quốc', 0, 880000, 880000, 0, 'trả hết', -1, 0),
(299, 67, '2015-03-06', 'Con của Nhung', 1.5, 2911000, 2000000, 911000, 'Còn nợ lại', 667, 491000),
(300, 224, '2015-03-07', 'Hồng', 1.5, 1040000, 1040000, 0, 'Trả hết', -1, 120000),
(301, 41, '2015-03-07', 'Chị Trí', 1.5, 2080000, 2080000, 0, 'Trả hết', -1, 347000),
(302, 45, '2015-03-09', 'Chị thanh', 1.5, 1656000, 1656000, 0, 'Trả hết', -1, 206000),
(303, 69, '2015-03-09', 'Chị Dung', 1.5, 11463000, 11463000, 0, 'Trả hết', -1, 1248000),
(304, 256, '2015-03-11', 'Hoàng', 1.5, 995000, 995000, 0, 'Trả hết', -1, 105000),
(305, 255, '2015-03-12', 'Hạnh', 1.5, 1473000, 1473000, 0, 'Trả hết', -1, 153000),
(306, 54, '2015-03-13', 'Dung', 0, 1358000, 1358000, 0, 'trả hết', -1, 0),
(308, 238, '2015-03-16', 'Thành Giỏi', 1.5, 10390000, 3000000, 7390000, 'Còn nợ lại', -1, 2890000),
(310, 176, '2015-03-17', 'Anh Chính', 1.5, 5550000, 3500000, 2050000, 'Còn nợ lại', 410, 630000),
(311, 139, '2015-03-19', 'Bằng', 0, 5387000, 5387000, 0, 'Trả hết', -1, 0),
(312, 183, '2015-03-22', 'Chị Đẹp', 1.5, 11840000, 11840000, 0, 'Trả hết', -1, 378000),
(313, 39, '2015-03-23', 'Chị Hồng', 1.5, 3040000, 2040000, 1000000, 'Còn nợ lại', 613, 575000),
(315, 53, '2015-03-26', 'Chị dương', 1.5, 1434000, 1434000, 0, '', -1, 234000),
(316, 82, '2015-03-28', 'Nở', 0, 4500000, 4500000, 0, 'Trả hết', -1, 0),
(317, 226, '2015-03-28', 'Anh mao', 1.5, 1050000, 1050000, 0, 'Trả hết', -1, 50000),
(318, 188, '2015-04-01', 'Anh Long', 1.5, 7673000, 7673000, 0, 'Trả hết', -1, 273000),
(319, 211, '2015-04-01', 'Trung', 1.5, 6740000, 5000000, 1740000, 'Còn nợ lại', 632, 780000),
(320, 98, '2015-04-02', 'Chú đức', 0, 5500000, 5500000, 0, 'trả hết', -1, 0),
(321, 123, '2015-04-03', 'Hiên', 1.5, 4310000, 4310000, 0, 'Trả hết', -1, 310000),
(322, 76, '2015-04-08', 'Anh Nam', 1.5, 1490000, 1000000, 490000, 'Còn nợ lại', 660, 190000),
(323, 65, '2015-04-09', 'dũng', 1.5, 1669000, 1669000, 0, 'Trả hết', -1, 179000),
(324, 336, '2015-04-12', 'Liên', 1.5, 2278000, 2278000, 0, 'Trả hết', -1, 78000),
(325, 291, '2015-04-12', 'tính', 0, 1000000, 1000000, 0, 'trả hết', -1, 0),
(326, 159, '2015-04-16', 'Trúc', 1.5, 6520000, 5600000, 920000, 'Còn nợ lại', -1, 980000),
(327, 83, '2015-04-17', 'hà', 0, 400000, 400000, 0, 'trả hết', -1, 0),
(328, 321, '2015-04-20', 'Danh', 1.5, 2890000, 2890000, 0, 'Trả hết', -1, 130000),
(329, 133, '2015-04-21', 'Thảo', 1.5, 4100000, 4100000, 0, 'Trả hết', -1, 55000),
(330, 115, '2015-04-29', 'Jep', 1.5, 5070000, 5070000, 0, 'Trả hết', -1, 760000),
(331, 88, '2015-04-30', 'Liên', 1.5, 3340000, 3340000, 0, 'Trả hết', -1, 415000),
(332, 132, '2015-05-05', 'Dũng', 1.5, 610000, 610000, 0, 'Trả hết', -1, 110000),
(333, 326, '2015-05-23', 'em cải', 1.5, 1281000, 1281000, 0, 'Trả hết', -1, 81000),
(334, 110, '2015-05-28', 'Plk', 1.5, 1719000, 1719000, 0, 'Trả hết', -1, 79000),
(335, 287, '2015-05-29', 'Mười', 1.5, 4577000, 4577000, 0, 'Trả hết', -1, 167000),
(336, 248, '2015-05-30', 'thử', 0, 6620000, 6620000, 0, 'thử', -1, 0),
(337, 119, '2015-05-30', 'phượng', 1.5, 13870000, 13870000, 0, 'Trả hết', -1, 1835000),
(338, 334, '2015-06-02', 'Nga', 1.5, 3177000, 3177000, 0, 'Trả hết', -1, 117000),
(339, 186, '2015-06-14', 'nghé', 1.5, 3927000, 3927000, 0, 'Trả hết', -1, 657000),
(341, 319, '2015-06-15', 'phụng', 0, 1150000, 1150000, 0, '', -1, 0),
(343, 168, '2015-06-16', 'sơn', 1.5, 475000, 475000, 0, 'trả hết', -1, 28000),
(344, 227, '2015-06-18', 'vân', 1.5, 462000, 462000, 0, '', -1, 22000),
(345, 184, '2015-06-18', 'Việt', 0, 44409000, 44409000, 0, 'Trả hết', -1, 0),
(346, 187, '2015-06-20', 'Dự', 0, 3450000, 3450000, 0, 'Trả hết', -1, 0),
(347, 131, '2015-06-29', 'Khánh', 1.5, 1690000, 1690000, 0, 'trả hết', -1, 105000),
(348, 200, '2015-07-05', 'Châu', 1.5, 1670000, 1670000, 0, 'Trả hết', -1, 260000),
(349, 334, '2015-07-05', 'bình', 0, 2110000, 2110000, 0, 'trả hết', -1, 0),
(350, 254, '2015-07-10', 'chị hạ', 1.5, 1847000, 1847000, 0, 'Trả hết', -1, 475000),
(351, 346, '2015-07-17', 'Kết', 1.5, 3941000, 2000000, 1941000, 'Còn nợ lại', 359, 101000),
(352, 106, '2014-11-15', 'Tuyển', 1.5, 46456000, 30000000, 16456000, 'ku Anh tính lại cho khớp', 353, 2726000),
(353, 106, '2015-06-15', 'Tuyển', 0, 16456000, 16456000, 0, 'ku Anh tính lại cho khớp', -1, 0),
(354, 355, '2015-07-18', 'chị ánh', 0, 3965000, 3965000, 0, 'Trả hết', -1, 0),
(355, 206, '2015-07-25', 'Anh Đức', 1.5, 2748000, 2748000, 0, 'Trả hết', -1, 108000),
(356, 164, '2015-08-02', 'Chị Đức', 1.5, 14900000, 14900000, 0, 'trả hết', -1, 1338000),
(357, 254, '2015-08-08', 'chị hạ', 0, 2500000, 2500000, 0, 'trả hết', -1, 0),
(358, 233, '2015-08-16', 'Mỹ', 1.5, 3528000, 1028000, 2500000, 'Còn nợ lại', 575, 108000),
(359, 346, '2015-08-17', 'Kết', 0, 1941000, 1941000, 0, 'Trả hết', -1, 0),
(360, 285, '2015-08-23', 'Dũng', 0, 5460000, 5460000, 0, 'trả hết', -1, 0),
(361, 357, '2015-08-30', 'Bít', 1.5, 3057000, 3057000, 0, 'Trả hết', -1, 107000),
(362, 81, '2015-09-08', 'Hoa', 1.5, 5200000, 3000000, 2200000, 'còn nợ lại', 370, 200000),
(363, 71, '2015-09-09', 'Chị Noa', 1.4, 15100000, 15100000, 0, 'Trả hết', -1, 660000),
(364, 96, '2015-09-12', 'cảnh', 1.5, 4286000, 4286000, 0, 'Trả hết', -1, 106000),
(365, 371, '2015-09-15', 'Hloan', 1.5, 4363000, 4363000, 0, 'Trả hết', -1, 143000),
(366, 106, '2015-09-17', 'Tuyển', 1.5, 49509000, 40000000, 9509000, 'Còn nợ lại ', 611, 2326000),
(367, 289, '2015-09-28', 'Vinh', 1.5, 15018000, 15018000, 0, 'Trả hết', -1, 818000),
(368, 337, '2015-10-11', 'K lun', 1.5, 1112000, 1112000, 0, 'Trả hết', -1, 92000),
(369, 175, '2015-10-15', 'Loan', 1.5, 8634000, 1000000, 7634000, 'Còn nợ lại', 391, 995000),
(370, 81, '2015-10-16', 'Hoa', 1.5, 2240000, 2240000, 0, 'Trả hết', -1, 40000),
(371, 399, '2015-10-16', 'Plin', 1.5, 1486000, 1486000, 0, 'Trả hết', -1, 86000),
(372, 229, '2015-10-17', 'Hoa', 1.5, 4830000, 4830000, 0, 'Trả hết', -1, 170000),
(373, 75, '2015-10-19', 'Thanh', 1.5, 4092000, 2092000, 2000000, 'còn nợ lại', 431, 92000),
(374, 273, '2015-10-20', 'Hiền', 1.5, 2624000, 2624000, 0, 'Trả hết', -1, 189000),
(375, 136, '2015-10-20', 'Linh', 1.5, 6019000, 4000000, 2019000, 'Còn nợ lại', 379, 264000),
(376, 228, '2015-10-22', 'Lực', 1.5, 2630000, 2630000, 0, '', -1, 240000),
(377, 294, '2015-10-25', 'con', 0, 1175000, 1175000, 0, 'Trả hết', -1, 0),
(378, 181, '2015-10-26', 'Oai', 1.5, 3625000, 3625000, 0, 'Trả hết', -1, 230000),
(379, 136, '2015-10-27', 'LinhTrả hết', 0, 2019000, 2019000, 0, '', -1, 0),
(380, 370, '2015-10-27', 'Yũ', 1.5, 1030000, 1030000, 0, 'Trả hết', -1, 55000),
(383, 121, '2015-10-28', 'Cải', 1.5, 6770000, 6770000, 0, 'Trả hết', -1, 795000),
(384, 378, '2015-10-29', 'Hường', 1.5, 2455000, 2455000, 0, 'Trả hết', -1, 98000),
(385, 129, '2015-11-01', 'A Joan', 1.5, 3066000, 3066000, 0, 'Trả hết', -1, 191000),
(386, 152, '2015-11-01', 'Chị Lựu', 1.5, 9359000, 9359000, 0, 'Trả hết', -1, 653000),
(387, 344, '2015-11-01', 'Vêu', 1.5, 5724000, 5724000, 0, 'Trả hết', -1, 424000),
(388, 345, '2015-11-01', 'Thảo', 1.5, 5734000, 5734000, 0, 'Trả hết', -1, 424000),
(389, 403, '2015-11-01', 'Anh chiếp', 1.5, 9388000, 9388000, 0, 'Trả hết', -1, 378000),
(390, 291, '2015-11-02', 'Tính', 1.5, 22265000, 17265000, 5000000, 'Còn nợ lại', 439, 1140000),
(391, 175, '2015-11-02', 'Loan', 1.5, 7700000, 5700000, 2000000, 'Còn nợ lại', -1, 66000),
(392, 271, '2015-11-03', 'Anh hùng', 1.5, 3270000, 3270000, 0, 'Trả hết', -1, 156000),
(393, 332, '2015-11-04', 'Ka rút', 1.5, 2480000, 2480000, 0, 'Trả hết', -1, 270000),
(394, 364, '2015-11-04', 'Thu', 1.5, 33260000, 23260000, 10000000, 'Còn nợ lại', 495, 1215000),
(395, 349, '2015-11-05', 'Thìn', 1.5, 2440000, 2440000, 0, 'Trả hết', -1, 175000),
(396, 185, '2015-11-05', 'Chị Khánh', 1.5, 5164000, 5164000, 0, 'Trả hết', -1, 774000),
(397, 195, '2015-11-06', 'Tuất', 1.5, 13185000, 10185000, 3000000, 'Còn nợ lại', -1, 2210000),
(398, 387, '2015-11-06', 'Núc', 1.5, 1420000, 1420000, 0, 'Trả hết', -1, 60000),
(399, 402, '2015-11-07', 'Anh jo', 1.5, 1287000, 1287000, 0, 'Trả hết', -1, 47000),
(400, 43, '2015-11-07', 'Kiệt', 1.5, 6867000, 2000000, 4867000, 'Còn nợ lại', 465, 661000),
(401, 377, '2015-11-08', 'Chị Mười', 1.5, 1068000, 1068000, 0, 'Trả hết', -1, 58000),
(402, 381, '2015-11-08', 'Ngao', 1.5, 2370000, 2370000, 0, 'TRả hết', -1, 130000),
(403, 404, '2015-11-08', 'Trang', 0, 2350000, 2350000, 0, 'Trả hết', -1, 0),
(404, 223, '2015-11-08', 'Chị hai', 1.5, 5170000, 5170000, 0, 'Trả hết', -1, 478000),
(405, 367, '2015-11-08', 'Phưng', 1.5, 2716000, 2716000, 0, 'Trả hết', -1, 176000),
(406, 393, '2015-11-09', 'Sút', 1.5, 1234000, 1234000, 0, 'Trả hết', -1, 34000),
(407, 173, '2015-11-09', 'Hiệp', 1.5, 10013000, 5013000, 5000000, 'Còn nợ lại', 552, 633000),
(408, 374, '2015-11-09', 'Hạnh', 1.5, 11047000, 11047000, 0, 'Trả hết', -1, 552000),
(409, 63, '2015-11-10', 'Chị Lan', 1.5, 38994000, 18000000, 20994000, 'Còn nợ lại', -1, 3685000),
(410, 176, '2015-11-10', 'Anh Chín', 1.5, 4557000, 4000000, 557000, 'Còn nợ lại', -1, 397000),
(411, 351, '2015-11-10', 'Bô', 0, 2990000, 2990000, 0, 'Trả hết', -1, 0),
(412, 259, '2015-11-11', 'Trọng', 1.5, 3477000, 3477000, 0, 'Trả hết', -1, 157000),
(413, 78, '2015-11-11', 'Anh Chạy', 1.5, 11370000, 11370000, 0, 'Trả hết', -1, 550000),
(414, 391, '2015-11-11', 'Thím yên', 1.5, 1290000, 1290000, 0, 'Trả hết', -1, 50000),
(415, 321, '2015-11-11', 'Danh', 1.5, 8290000, 8290000, 0, 'Trả hết', -1, 490000),
(416, 97, '2015-11-12', 'Hào', 1.5, 13150000, 13150000, 0, 'TRả hết', -1, 1130000),
(417, 87, '2015-11-12', 'Độ', 1.5, 1769000, 1769000, 0, 'Trả hết', -1, 109000),
(418, 340, '2015-11-12', 'Thuận', 1.5, 5100000, 5100000, 0, 'Trả hết', -1, 380000),
(419, 247, '2015-11-12', 'Chị hai', 1.5, 24716000, 15000000, 9716000, 'Còn nợ lại', -1, 2276000),
(420, 149, '2015-11-12', 'Út', 1.5, 9963000, 9100000, 863000, 'Còn nợ lại', 438, 633000),
(421, 180, '2015-11-13', 'Thủy', 1.5, 8406000, 8406000, 0, 'Trả hết', -1, 764000),
(422, 85, '2015-11-14', 'Chị Sơn', 1.5, 3540000, 3540000, 0, 'Trả hết', -1, 200000),
(423, 347, '2015-11-14', 'Ngọ', 1.5, 5207000, 5207000, 0, 'Trả hết', -1, 377000),
(424, 350, '2015-11-15', 'Thím Tý', 1.5, 5170000, 5170000, 0, 'Trả hết', -1, 270000),
(425, 197, '2015-11-15', 'Quang', 1.5, 17286000, 17286000, 0, 'Trả hết', -1, 996000),
(426, 179, '2015-11-15', 'Hiền', 1.5, 18245000, 18245000, 0, 'Trả hết', -1, 1160000),
(427, 231, '2015-11-15', 'Anh Chính', 1.5, 19230000, 15000000, 4230000, 'Còn nợ lại', 545, 1420000),
(429, 199, '2015-11-16', 'Bảy', 1.5, 14855000, 14855000, 0, 'Trả hết', -1, 925000),
(430, 260, '2015-11-16', 'Đức', 1.5, 2644000, 2644000, 0, 'Trả hết', -1, 204000),
(431, 75, '2015-11-16', 'Thanh', 1.5, 2028000, 2028000, 0, 'Trả hết', -1, 28000),
(432, 122, '2015-11-16', 'Nữ', 1.5, 8390000, 8390000, 0, 'Trả hết', -1, 625000),
(433, 353, '2015-11-16', 'Chị Trinh', 1.5, 2547000, 2547000, 0, 'Trả hết', -1, 157000),
(434, 116, '2015-11-16', 'Yong', 1.5, 4564000, 4564000, 0, 'Trả hết', -1, 560000),
(435, 216, '2015-11-16', 'Anh Mạnh', 1.5, 16690000, 13000000, 3690000, 'Còn nợ lại', 447, 1009000),
(436, 194, '2015-11-17', 'Thắng', 1.5, 20940000, 7040000, 13900000, 'Còn nợ lại', 451, 1125000),
(438, 149, '2015-11-17', 'útTrả hết', 0, 863000, 863000, 0, '', -1, 0),
(439, 291, '2015-11-17', 'tính', 0, 5000000, 1000000, 4000000, 'Còn nợ lại', 514, 0),
(440, 150, '2015-11-18', 'Đức', 1.5, 22180000, 15000000, 7180000, 'Còn nợ lại', -1, 1645000),
(441, 359, '2015-11-18', 'Danh', 1.5, 6140000, 6140000, 0, 'Trả hết', -1, 440000),
(442, 392, '2015-11-18', 'Hồng', 1.5, 7680000, 7680000, 0, 'Trả hết', -1, 240000),
(443, 246, '2015-11-18', 'Thu', 1.5, 8318000, 8318000, 0, 'Trả hết', -1, 613000),
(444, 352, '2015-11-19', 'Chi', 1.5, 1404000, 1404000, 0, 'Trả hết', -1, 104000),
(445, 203, '2015-11-19', 'Anh Tám', 1.5, 5497000, 5497000, 0, 'Trả hết', -1, 397000),
(446, 55, '2015-11-19', 'Chị Hồng', 1.5, 19750000, 19750000, 0, 'Trả hết', -1, 1080000),
(447, 216, '2015-11-20', 'Anh Mạnh', 0, 3690000, 3690000, 0, 'Trả hết', -1, 0),
(448, 48, '2015-11-20', 'Anh Thành', 1.5, 5810000, 2500000, 3310000, 'Còn nợ lại', -1, 410000),
(449, 183, '2015-11-20', 'Chị Đẹp', 1.5, 28330000, 20000000, 8330000, 'Còn nợ lại', 643, 2220000),
(450, 52, '2015-11-20', 'Hiền', 1.5, 17776000, 9000000, 8776000, 'Còn nợ lại', 485, 1461000),
(451, 194, '2015-11-21', 'Thắng', 0, 13900000, 5900000, 8000000, 'Còn nợ lại', 488, 0),
(452, 235, '2015-11-21', 'Ngọc', 1.5, 19928000, 19928000, 0, 'Trả hết', -1, 948000),
(453, 162, '2015-11-21', 'Lan', 1.5, 7065000, 7065000, 0, 'Trả hết', -1, 315000),
(454, 220, '2015-11-21', 'Hổ', 1.5, 1274000, 1274000, 0, 'Trả hết', -1, 34000),
(455, 66, '2015-11-22', 'Ký', 1.5, 6905000, 6905000, 0, 'Trả hết', -1, 515000),
(456, 360, '2015-11-22', 'Liên', 1.5, 8810000, 8810000, 0, 'Trả hết', -1, 500000),
(458, 155, '2015-11-22', 'tuấn', 1.5, 6097000, 4000000, 2097000, 'Còn nợ lại', -1, 447000),
(459, 322, '2015-11-23', 'Hương', 1.5, 4810000, 4810000, 0, 'Trả hết', -1, 430000),
(460, 300, '2015-11-22', 'Xuân', 1.5, 12630000, 12630000, 0, 'Trả hết', -1, 640000),
(461, 168, '2015-11-24', 'Chị Thủy', 1.5, 4200000, 4200000, 0, 'Trả hết', -1, 310000),
(462, 141, '2015-11-24', 'Minh', 1.5, 3228000, 3228000, 0, 'Trả hết', -1, 218000),
(463, 226, '2015-11-25', 'Anh Mao', 1.5, 6515000, 5015000, 1500000, 'Còn nợ lại', 654, 465000),
(464, 147, '2015-11-25', 'Nga', 1.5, 10165000, 10165000, 0, 'Trả hết', -1, 665000),
(465, 43, '2015-11-26', 'Kiệt', 0, 4867000, 3000000, 1867000, 'Còn nợ lại', 559, 0),
(466, 221, '2015-11-26', 'Cúc', 1.5, 2607000, 2607000, 0, 'Trả hết', -1, 197000),
(467, 324, '2015-11-26', 'Hoàng', 1.5, 4254000, 4000000, 254000, 'Còn nợ lại', 659, 314000),
(468, 225, '2015-11-26', 'Chị Phương', 1.5, 1400000, 1400000, 0, 'Trả hết', -1, 105000),
(469, 61, '2015-11-26', 'Thanh', 1.5, 25046000, 24000000, 1046000, 'Còn nợ lại', 531, 2083000),
(470, 165, '2015-11-26', 'Anh Loan', 0, 1997000, 1997000, 0, 'Trả hết', -1, 0),
(471, 138, '2015-11-26', 'Danh', 1.5, 7199000, 7199000, 0, 'Trả hết', -1, 449000),
(472, 133, '2015-11-27', 'Thảo', 1.5, 16140000, 10000000, 6140000, 'Còn nợ lại', 496, 955000),
(473, 108, '2015-11-27', 'Tâm', 1.5, 3777000, 3777000, 0, 'Trả hết', -1, 302000),
(474, 257, '2015-11-27', 'Quý', 1.5, 2315000, 2315000, 0, 'Trả hết', -1, 195000),
(475, 330, '2015-11-27', 'Hùng', 1.5, 4460000, 4460000, 0, 'Trả hết', -1, 350000),
(476, 99, '2015-11-27', 'Bảo', 1.5, 6660000, 6660000, 0, 'Trả hết', -1, 720000),
(477, 140, '2015-11-27', 'Hoa', 1.5, 6280000, 6280000, 0, 'Trả hết', -1, 540000),
(478, 379, '2015-11-28', 'Cò', 1.5, 5458000, 5458000, 0, 'Trả hết', -1, 288000),
(479, 189, '2015-11-28', 'Loan', 1.5, 12360000, 12360000, 0, 'Trả hết', -1, 850000),
(480, 190, '2015-11-28', 'Quốc', 1.5, 19840000, 19840000, 0, 'Trả hết', -1, 1295000),
(481, 134, '2015-11-29', 'Hương', 1.5, 5785000, 5785000, 0, 'Trả hết', -1, 465000),
(482, 201, '2015-11-30', 'Nga', 1.5, 4750000, 4750000, 0, 'Trả hết', -1, 405000),
(483, 182, '2015-11-30', 'Đàm', 1.5, 5800000, 5800000, 0, 'Trả hết', -1, 487000),
(484, 56, '2015-11-30', 'Hiệp', 1.5, 34300000, 18000000, 16300000, 'Còn nợ lại', -1, 2848000),
(485, 52, '2015-12-01', 'Hiền', 0, 8770000, 8770000, 0, 'Trả hết', -1, -6000),
(486, 376, '2015-12-01', 'Hương', 1.5, 5240000, 5240000, 0, 'Trả hết', -1, 350000),
(487, 191, '2015-12-01', 'Cường', 1.5, 1289000, 1289000, 0, 'Trả hết', -1, 149000),
(488, 194, '2015-12-01', 'Thắng', 0, 8000000, 2000000, 6000000, 'Còn nợ lại', 561, 0),
(489, 77, '2015-12-01', 'Phượng ', 1.5, 459000, 459000, 0, 'Trả hết', -1, 31000),
(490, 272, '2015-12-02', 'Thu', 1.5, 772000, 772000, 0, 'Trả hết', -1, 107000),
(491, 301, '2015-12-03', 'Lâm', 1.5, 7690000, 7690000, 0, 'Trả hết', -1, 600000),
(492, 298, '2015-12-03', 'Út', 1.5, 3220000, 3220000, 0, 'Trả hết', -1, 120000),
(493, 400, '2015-12-04', 'Bưng', 1.5, 2305000, 2305000, 0, 'Trả hết', -1, 105000),
(494, 358, '2015-12-04', 'Hlanh', 1.5, 4250000, 4250000, 0, 'Trả hết', -1, 330000),
(495, 364, '2015-12-05', 'Thuận', 0, 10000000, 10000000, 0, 'Trả hết', -1, 0),
(496, 133, '2015-12-05', 'Thảo', 0, 6140000, 1000000, 5140000, 'Còn nợ lại', 515, 0),
(497, 209, '2015-12-05', 'Hồng', 1.5, 11207000, 11207000, 0, 'Trả hết', -1, 1977000),
(498, 240, '2015-12-05', 'Yến', 1.5, 5449000, 5449000, 0, 'Trả hết', -1, 379000),
(499, 83, '2015-12-05', 'Hào', 1.5, 5840000, 5840000, 0, 'Trả hết', -1, 400000),
(501, 335, '2015-12-06', 'Anh Định', 1.5, 3410000, 3410000, 0, '', -1, 260000),
(502, 148, '2015-12-06', 'Kiều', 1.5, 8030000, 6000000, 2030000, 'Còn nợ lại', -1, 675000),
(503, 368, '2015-12-06', 'Tiến', 1.5, 2218000, 2218000, 0, 'Trả hết', -1, 168000),
(504, 276, '2015-12-07', 'Hương', 1.5, 22260000, 10000000, 12260000, 'Còn nợ lại', 661, 2660000),
(505, 127, '2015-12-07', 'Chị Tuyết', 1.5, 15260000, 15260000, 0, 'Trả hết', -1, 740000),
(506, 343, '2015-12-07', 'Mai', 1.5, 2435000, 2435000, 0, 'Trả hết', -1, 185000),
(507, 47, '2015-12-07', 'Chị Ngọc', 1.5, 10180000, 10180000, 0, 'Trả hết', -1, 810000),
(508, 385, '2015-12-07', 'Yên', 1.5, 2110000, 2110000, 0, 'Trả hết', -1, 100000),
(509, 198, '2015-12-07', 'Huệ', 1.5, 31470000, 31470000, 0, 'Trả hết', -1, 4140000),
(510, 105, '2015-12-07', 'Lai', 1.5, 3075000, 3075000, 0, 'Trả hết', -1, 225000),
(511, 218, '2015-12-07', 'Dũng', 1.5, 7549000, 7549000, 0, 'Trả hết', -1, 539000),
(512, 206, '2015-12-08', 'Anh Đức', 1.5, 11990000, 11990000, 0, 'Trả hết', -1, 670000),
(513, 174, '2015-12-08', 'Chị Hoa', 1.5, 17940000, 17940000, 0, 'Trả hết', -1, 1314000),
(514, 291, '2015-12-08', 'tính', 0, 4000000, 4000000, 0, 'Trả hết', -1, 0),
(515, 133, '2015-12-09', 'Thảo', 0, 5140000, 2000000, 3140000, 'Còn nợ lại', 603, 0),
(516, 151, '2015-12-09', 'Sửu', 1.5, 5150000, 5150000, 0, 'Trả hết', -1, 411000),
(517, 208, '2015-12-10', 'Thúy', 1.5, 6590000, 3000000, 3590000, 'Còn nợ lại', -1, 1370000),
(518, 79, '2015-12-10', 'Ngao', 1.5, 10890000, 3000000, 7890000, 'Còn nợ lại', 675, 937000),
(519, 401, '2015-12-11', 'Phôn', 1.5, 3170000, 3170000, 0, 'Trả hết', -1, 175000),
(520, 125, '2015-12-12', 'Anh mĩu', 1.5, 5885000, 5885000, 0, 'Trả hết', -1, 335000),
(521, 210, '2015-12-12', 'Hoàng', 1.5, 10970000, 10970000, 0, 'Trả hết', -1, 650000),
(522, 264, '2015-12-12', 'Chị Nỡ', 1.5, 10820000, 10820000, 0, 'Trả hết', -1, 680000),
(523, 51, '2015-12-13', 'Chị Liễu', 1.5, 45390000, 15000000, 30390000, 'Còn nợ lại', 606, 4047000),
(524, 365, '2015-12-13', 'Nguyệt', 1.5, 9699000, 2699000, 7000000, 'Còn nợ lại', 573, 599000),
(525, 158, '2015-12-13', 'Long', 1.5, 9168000, 9168000, 0, 'Trả hết', -1, 899000),
(526, 111, '2015-12-13', 'Hút', 1.5, 3590000, 3590000, 0, 'Trả hết', -1, 205000),
(527, 292, '2015-12-13', 'Pjih', 1.5, 5500000, 5500000, 0, 'Trả hết', -1, 690000),
(528, 327, '2015-12-13', 'Khoan', 1.5, 23386000, 10000000, 13386000, 'Còn nợ lại', 534, 2786000),
(529, 109, '2015-12-13', 'Thoa', 1.5, 22096000, 10000000, 12096000, 'Còn nợ lại', 557, 2511000),
(530, 142, '2015-12-13', 'Bông', 1.5, 1240000, 1240000, 0, 'Trả hết', -1, 100000),
(531, 61, '2015-12-13', 'Thanh', 0, 1046000, 1046000, 0, 'Trả hết', -1, 0),
(532, 59, '2015-12-14', 'Anh Tư', 1.5, 13835000, 13835000, 0, 'Trả hết', -1, 925000),
(533, 294, '2015-12-14', 'Yến', 1.5, 1270000, 1270000, 0, 'Trả  hết', -1, 86000),
(534, 327, '2015-12-14', 'Khoan', 0, 13386000, 13386000, 0, 'Trả hết', -1, 0),
(535, 356, '2015-12-14', 'Vốt', 1.5, 6809000, 6809000, 0, 'Trả hết', -1, 559000),
(536, 107, '2015-12-15', 'Chị Xoa', 1.5, 17050000, 4000000, 13050000, 'Còn nợ lại', -1, 1592000),
(537, 100, '2015-12-15', 'Chị Nga ', 1.5, 19700000, 17000000, 2700000, 'Còn nợ lại', -1, 1477000),
(538, 156, '2015-12-16', 'Thanh', 1.5, 18450000, 18450000, 0, 'Trả hết', -1, 1460000),
(539, 386, '2015-12-17', 'Ke', 1.5, 1919000, 1919000, 0, 'Trả hết', -1, 119000),
(540, 380, '2015-12-17', 'Hùng', 1.5, 5656000, 5656000, 0, 'Trả hết', -1, 406000),
(541, 202, '2015-12-17', 'Chị Mười', 1.5, 2149000, 2149000, 0, 'Trả hết', -1, 149000),
(542, 169, '2015-12-18', 'Anh Hóa', 1.5, 2640000, 2640000, 0, 'TRả hết', -1, 215000),
(543, 212, '2015-12-18', 'Sâm', 1.5, 19330000, 19330000, 0, 'Trả hết', -1, 1230000),
(544, 170, '2015-12-18', 'Thành', 1.5, 1195000, 1195000, 0, 'Trả hết', -1, 75000),
(545, 231, '2015-12-19', 'Anh Chính', 0, 4230000, 4230000, 0, '', -1, 0),
(546, 137, '2015-12-19', 'Hầng', 1.5, 29500000, 19500000, 10000000, 'Còn nợ lại', -1, 2251000),
(547, 383, '2015-12-20', 'Chố', 1.5, 387000, 387000, 0, 'Trả hết', -1, 27000),
(548, 396, '2015-12-20', 'Thọ', 1.5, 19200000, 10000000, 9200000, 'Còn nợ lại', 568, 1290000),
(549, 98, '2015-12-21', 'Chú Đức', 1.5, 27290000, 27290000, 0, 'Trả hết', -1, 2260000),
(550, 166, '2015-12-21', 'Chị Lan', 1.5, 4260000, 4260000, 0, 'Trả hết', -1, 594000),
(551, 315, '2015-12-22', 'Anh NHên', 1.5, 1640000, 1640000, 0, 'Trả hết', -1, 90000),
(552, 173, '2015-12-22', 'Hiệp ', 0, 5000000, 5000000, 0, 'Trả hết', -1, 0),
(553, 40, '2015-12-23', 'Phấn', 1.5, 19445000, 5445000, 14000000, 'Còn nợ lại', 658, 2436000),
(554, 250, '2015-12-23', 'Hải', 1.5, 1330000, 1330000, 0, 'Trả hết', -1, 100000),
(555, 60, '2015-12-23', 'Thúy', 1.5, 20210000, 12210000, 8000000, 'Còn nợ lại', 570, 1756000),
(556, 244, '2015-12-23', 'Bít', 0, 3310000, 3310000, 0, 'Trả hết', -1, 0),
(557, 109, '2015-12-23', 'Chị Hòa', 0, 12096000, 12096000, 0, 'Trả hết', -1, 0),
(558, 172, '2015-12-23', 'Sơn', 1.5, 16830000, 16830000, 0, 'Trả  hết', -1, 1630000),
(559, 43, '2015-12-24', 'Kiệt', 0, 1867000, 1000000, 867000, 'Còn nợ lại', -1, 0),
(560, 163, '2015-12-24', 'Châu', 1.5, 5195000, 5195000, 0, 'Trả hết', -1, 425000),
(561, 194, '2015-12-24', 'Thắng', 0, 6000000, 3000000, 3000000, 'Còn nợ lại', -1, 0),
(562, 287, '2015-12-25', 'Mười', 1.5, 15900000, 15900000, 0, 'Trả hết', -1, 985000),
(563, 92, '2015-12-25', 'Lài', 1.5, 620000, 620000, 0, 'Trả hết', -1, 50000),
(564, 145, '2015-12-26', 'Chị Loan', 1.5, 5000000, 5000000, 0, 'Trả hết', -1, 328000),
(565, 227, '2015-12-26', 'Vân', 1.5, 4035000, 4035000, 0, 'Trả hết', -1, 325000),
(566, 245, '2015-12-27', 'Két', 0, 6654000, 6654000, 0, 'Trả hết', -1, 0),
(567, 269, '2015-12-27', 'Dũng', 1.5, 5610000, 5610000, 0, 'Trả hết', -1, 350000),
(568, 396, '2015-12-27', 'Thọ', 0, 9000000, 9000000, 0, 'Trả hết', -1, -200000),
(569, 128, '2015-12-28', 'Thành', 1.5, 8960000, 8960000, 0, 'Trả hết', -1, 750000),
(570, 60, '2015-12-28', 'Thúy', 0, 8000000, 5000000, 3000000, 'Còn nợ lại', -1, 0),
(571, 375, '2015-12-28', 'Mai', 1.5, 1820000, 1820000, 0, 'Trả hết', -1, 130000),
(572, 62, '2015-12-29', 'Hoan', 1.5, 11849000, 3849000, 8000000, 'Còn nợ lại', 579, 1209000),
(573, 365, '2015-12-29', 'Nguyệt', 0, 7000000, 4000000, 3000000, 'Còn nợ lại', -1, 0),
(574, 366, '2015-12-30', 'K ra', 1.5, 5680000, 5680000, 0, 'Trả hết', -1, 490000),
(575, 233, '2015-12-30', 'Mỹ', 1.5, 7400000, 7400000, 0, 'Trả hết', -1, 315000),
(576, 328, '2015-12-31', 'Ty', 1.5, 22480000, 22480000, 0, 'Trả hết', -1, 2110000),
(577, 262, '2015-12-31', 'anh Sơn', 1.5, 24370000, 20000000, 4370000, 'Còn nợ lại', -1, 2145000),
(578, 96, '2015-12-31', 'Chung', 1.5, 1420000, 1420000, 0, 'Trả hết', -1, 60000),
(579, 62, '2016-01-02', 'Hoan', 0, 8000000, 5000000, 3000000, 'Còn nợ lại', 599, 0),
(580, 338, '2016-01-03', 'H Líu', 1.5, 5936000, 5936000, 0, 'Trả hết', -1, 406000),
(581, 103, '2016-01-04', 'Dũng', 1.5, 13067000, 13067000, 0, 'Tính thử', -1, 1557000),
(582, 234, '2016-01-04', 'Hạnh', 1.5, 1500000, 1500000, 0, 'Trả hết', -1, 120000),
(583, 406, '2016-01-04', 'Anh cần', 1.5, 12360000, 12360000, 0, 'Trả hết', -1, 960000),
(584, 336, '2016-01-04', 'Nam', 1.5, 37030000, 30000000, 7030000, 'Còn nợ lại', -1, 2800000),
(585, 405, '2016-01-05', 'Yến', 1.5, 1850000, 1850000, 0, 'Trả hết', -1, 140000),
(586, 219, '2016-01-05', 'Hải', 1.5, 2540000, 2540000, 0, 'Trả hết', -1, 180000),
(587, 398, '2016-01-05', 'Sang', 1.5, 14190000, 14190000, 0, 'Trả hết', -1, 920000),
(588, 341, '2016-01-06', 'Hùng', 1.5, 930000, 930000, 0, 'Trả hết', -1, 100000),
(589, 230, '2016-01-06', 'Chị Năm', 1.5, 39660000, 39660000, 0, 'Trả hết', -1, 2890000),
(590, 319, '2016-01-06', 'Đẹt', 1.5, 9457000, 9457000, 0, 'Trả hết', -1, 567000),
(591, 93, '2016-01-08', 'Bích', 1.5, 2538000, 2538000, 0, 'Trả hết', -1, 138000),
(592, 124, '2016-01-09', 'Huy', 1.5, 6170000, 6170000, 0, 'Trả hết', -1, 525000),
(593, 35, '2016-01-10', 'Chị Chức', 1.5, 19000000, 13500000, 5500000, 'Còn nợ lại', -1, 1610000),
(594, 334, '2016-01-10', 'Bình', 0, 3100000, 3100000, 0, 'Trả hết', -1, 0),
(596, 280, '2016-01-10', 'Dũng ', 1.5, 3350000, 3350000, 0, 'Trả hết', -1, 350000),
(597, 123, '2016-01-11', 'Hiên', 1.5, 11520000, 11520000, 0, 'Trả hết', -1, 883000),
(598, 236, '2016-01-12', 'Lợi', 1.5, 2615000, 2615000, 0, 'Trả hết', -1, 295000),
(599, 62, '2016-01-12', 'Hoan', 0, 3000000, 3000000, 0, 'Trả hết', -1, 0),
(600, 265, '2016-01-12', 'Thạnh', 0, 10840000, 10840000, 0, 'Trả hết', -1, 0),
(601, 114, '2016-01-12', 'koi', 0, 13810000, 13810000, 0, 'Trả hết', -1, 0),
(602, 395, '2016-01-14', 'Hiệp ', 0, 1370000, 1370000, 0, 'Trả hết', -1, 0),
(603, 133, '2016-01-14', 'Thảo', 0, 3100000, 2100000, 1000000, 'còn nợ lại', 618, -40000),
(604, 102, '2016-01-15', 'Dek', 1.5, 9020000, 6020000, 3000000, 'Còn nợ lại', -1, 1305000),
(605, 213, '2016-01-15', 'Chị Phượng', 1.5, 1560000, 1560000, 0, 'Trả hết', -1, 210000),
(606, 51, '2016-01-16', 'Anh Thành', 0, 30390000, 10000000, 20390000, 'Còn nợ lại', -1, 0),
(607, 407, '2016-01-17', 'Mỹ', 1.5, 2836000, 2836000, 0, 'Trả hết', -1, 216000),
(608, 239, '2016-01-17', 'Chị Bông', 1.5, 9770000, 6000000, 3770000, 'Còn nợ lại', -1, 1110000),
(609, 71, '2016-01-19', 'Chị Noa', 1, 22400000, 22400000, 0, 'Trả hết', -1, 1000000),
(610, 120, '2016-01-19', 'Ủnh', 0, 10270000, 10270000, 0, 'Trả hết', -1, 0),
(611, 106, '2016-01-19', 'Tuyển', 0, 9509000, 9509000, 0, 'Trả hết', -1, 0),
(612, 89, '2016-01-20', 'Anh Thạo', 1.5, 1630000, 500000, 1130000, 'Còn nợ lại', 640, 370000),
(613, 39, '2016-01-22', 'Chị Hồng', 1.5, 1610000, 1610000, 0, 'Trả hết', -1, 185000),
(614, 90, '2016-01-23', 'Thoản', 1.5, 3800000, 2000000, 1800000, 'Còn nợ lại', -1, 420000),
(616, 361, '2016-01-23', 'Thành', 1.5, 4409000, 2409000, 2000000, 'Còn nợ lại', 674, 429000),
(617, 339, '2016-01-23', 'Anh Hòa', 1.5, 2759000, 2759000, 0, 'Trả hết', -1, 319000),
(618, 133, '2016-01-23', 'Thảo', 0, 1000000, 1000000, 0, 'Trả hết', -1, 0),
(619, 373, '2016-01-24', 'B Dúi', 1.5, 3770000, 3770000, 0, 'Trả hết', -1, 345000),
(620, 58, '2016-01-24', 'Bé', 1.5, 4450000, 4450000, 0, 'Trả hết', -1, 410000),
(621, 86, '2016-01-25', 'Tâm', 1.5, 4110000, 4110000, 0, 'Trả hết', -1, 415000),
(622, 263, '2016-01-26', 'Chú tư', 1.5, 4885000, 4885000, 0, 'Trả hết', -1, 405000),
(623, 88, '2016-01-30', 'Tuấn', 1.5, 5025000, 2000000, 3025000, 'Còn nợ lại', -1, 455000),
(624, 101, '2016-01-30', 'Mai', 1.5, 6530000, 6530000, 0, 'Trả hết', -1, 530000),
(625, 286, '2016-01-31', 'Anh Tây', 1.5, 5710000, 5710000, 0, 'Trả hết', -1, 510000),
(626, 113, '2016-01-31', 'Anh Nhớn', 1.5, 2576000, 2576000, 0, 'Trả hết', -1, 136000),
(627, 46, '2016-02-01', 'huệ', 1.5, 2500000, 1000000, 1500000, 'Còn lại', -1, 640000),
(628, 277, '2016-02-01', 'Chị Thu', 1.5, 2476000, 2476000, 0, 'Trả hết', -1, 526000),
(629, 258, '2016-02-01', 'Anh Toàn', 1.5, 4650000, 4650000, 0, 'Trae hết', -1, 500000),
(630, 164, '2016-02-03', 'Chị Đức', 1, 15500000, 10000000, 5500000, 'Còn nợ lại', -1, 720000),
(631, 204, '2016-02-03', 'Sự', 1.5, 47400000, 20000000, 27400000, 'Còn nợ lại', -1, 5113000),
(632, 211, '2016-02-04', 'Trung', 1.5, 5790000, 5790000, 0, 'Trả hết', -1, 630000),
(633, 178, '2016-02-05', 'Hồng', 1.5, 10030000, 10030000, 0, 'Trả hết', -1, 865000),
(634, 144, '2016-02-05', 'Chị Mùi', 1.5, 775000, 775000, 0, 'Trả hết', -1, 75000),
(635, 348, '2016-02-06', 'Quốc', 1.5, 987000, 987000, 0, 'Trả hết', -1, 112000),
(636, 232, '2016-02-07', 'Thành', 1.5, 3270000, 3270000, 0, 'Trả hết', -1, 360000),
(637, 304, '2016-02-07', 'Yến', 0, 4580000, 1500000, 3080000, 'Còn nợ lại', -1, 0),
(638, 32, '2016-02-10', 'Châu', 0, 2000000, 2000000, 0, 'Trả hết', -1, 0),
(639, 53, '2016-02-27', 'Chị Dương', 1.5, 920000, 920000, 0, 'Trả hết', -1, 60000),
(640, 89, '2016-02-27', 'Anh thạo', 0, 1130000, 1130000, 0, 'Trả hết', -1, 0),
(641, 69, '2016-03-04', 'Chị Dung', 1.5, 12393000, 12393000, 0, 'Trả hết', -1, 1238000),
(642, 127, '2016-03-04', 'Anh Tiến', 0, 3760000, 3760000, 0, 'Trả hết', -1, 0);
INSERT INTO `tra_no` (`MaTraNo`, `MaKH`, `NgayTra`, `NguoiNop`, `LaiSuat`, `SoTienNo`, `DaTra`, `ConNoLai`, `GhiChuTra`, `IdThu2`, `TienLai`) VALUES
(643, 183, '2016-03-06', 'Chị Đẹp', 1, 8500000, 8500000, 0, 'Trả hết', -1, 170000),
(644, 54, '2016-03-10', 'Du', 1.5, 16086000, 16086000, 0, 'Trả hết', -1, 1856000),
(645, 261, '2016-03-11', 'Hà', 1.5, 2275000, 2275000, 0, 'Trả hết', -1, 265000),
(646, 355, '2016-03-16', 'Chị Ánh', 0, 1120000, 1120000, 0, 'Trả hết', -1, 0),
(647, 98, '2016-03-16', 'Chú Đức', 0, 1630000, 1630000, 0, 'Trả hết', -1, 0),
(648, 342, '2016-03-16', 'Quý', 1.5, 11470000, 4000000, 7470000, 'Còn nợ lại', 673, 1491000),
(649, 135, '2016-03-20', 'Tài', 1.5, 29780000, 29780000, 0, 'Trả hết', -1, 3460000),
(650, 390, '2016-03-23', 'tâm', 1.5, 2390000, 2390000, 0, 'Trả hết', -1, 240000),
(651, 73, '2016-03-25', 'Quyết', 1.5, 9460000, 9460000, 0, 'Trả hết', -1, 1041000),
(652, 173, '2016-03-25', 'Hiệp', 0, 2635000, 2635000, 0, 'Trả hết', -1, 0),
(653, 187, '2016-03-25', 'Dự', 0, 6570000, 6570000, 0, 'Trả hết', -1, 0),
(654, 226, '2016-04-04', 'Anh Mao', 1, 1565000, 1565000, 0, 'Trả hết', -1, 65000),
(655, 229, '2016-04-05', 'Hoa', 0, 3355000, 3355000, 0, 'Trả hết', -1, 0),
(656, 143, '2016-04-08', 'Thủy', 1.5, 1400000, 1400000, 0, 'Trả hết', -1, 360000),
(657, 281, '2016-04-11', 'Chị Dương', 1.5, 899000, 899000, 0, 'Trả hết', -1, 209000),
(658, 40, '2016-04-12', 'Phong', 1, 14518000, 8000000, 6518000, 'Còn nợ lại', -1, 518000),
(659, 324, '2016-04-12', 'Hoàng', 0, 254000, 254000, 0, 'Trae hết', -1, 0),
(660, 76, '2016-04-17', 'Anh Nam', 1.5, 1258000, 1258000, 0, 'Trả hết', -1, 168000),
(661, 276, '2016-04-22', 'Hương', 0, 12260000, 7260000, 5000000, 'Còn nợ lại', 668, 0),
(662, 371, '2016-04-23', 'H Loan', 1.5, 1754000, 1754000, 0, 'Trả hết', -1, 174000),
(663, 421, '2016-04-24', 'Hương', 1, 20550000, 10000000, 10550000, 'Còn nợ lại', -1, 550000),
(664, 139, '2016-05-01', 'Bằng', 1.5, 2975000, 2975000, 0, 'Trả hết', -1, 352000),
(665, 324, '2016-05-05', 'Hoàng', 0, 740000, 740000, 0, 'Trả hết', -1, 0),
(666, 86, '2016-05-05', 'Tâm', 0, 760000, 760000, 0, 'Trả hết', -1, 0),
(667, 67, '2016-05-06', 'Nhung', 0, 911000, 911000, 0, 'Trả hết', -1, 0),
(668, 276, '2016-05-06', 'Hương', 0, 5000000, 5000000, 0, 'Trả hết', -1, 0),
(669, 253, '2016-05-06', 'Phượng', 0, 4560000, 4560000, 0, 'Trả hết', -1, 0),
(670, 429, '2016-05-12', 'El', 1, 636000, 636000, 0, 'Trả hết', -1, 16000),
(671, 291, '2016-05-18', 'Tính', 1, 4730000, 2730000, 2000000, 'Còn nợ lại', -1, 150000),
(672, 416, '2016-05-21', 'Ngơn', 1, 1068000, 1068000, 0, 'Trả hết', -1, 38000),
(673, 342, '2016-05-24', 'Quý', 1, 7640000, 4640000, 3000000, 'Còn nợ lại', -1, 170000),
(674, 361, '2016-05-25', 'Thành', 1, 2080000, 2080000, 0, 'Trả hết', -1, 80000),
(675, 79, '2016-05-20', 'Nga', 1, 8316000, 4000000, 4316000, 'Còn nợ lại', -1, 426000),
(676, 162, '2016-05-25', 'Lan', 0, 1140000, 1140000, 0, 'Trả hết', -1, 0),
(677, 318, '2016-05-26', 'Vân', 1, 4828000, 4828000, 0, 'Trả hết', -1, 168000),
(678, 110, '2016-05-29', 'Plk', 1, 637000, 637000, 0, 'Trả hết', -1, 17000),
(679, 140, '2016-05-29', 'Hoa', 1, 3957000, 3957000, 0, 'Trả hết', -1, 172000),
(680, 270, '2016-05-31', 'Vân', 1, 9500000, 9500000, 0, 'Trả hết', -1, 630000),
(681, 131, '2016-05-31', 'Khánh', 1, 6234000, 6234000, 0, 'Trả hết', -1, 384000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `MaUser` int(11) NOT NULL,
  `Username` text COLLATE utf8_unicode_ci NOT NULL,
  `Password` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`MaUser`, `Username`, `Password`) VALUES
(1, 'admin', '654e13178491f8ad09e5fef7afa664a8');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ghi_no`
--
ALTER TABLE `ghi_no`
  ADD PRIMARY KEY (`MaGhiNo`),
  ADD KEY `FK_ghiNo` (`MaKH`);

--
-- Indexes for table `khach_hang`
--
ALTER TABLE `khach_hang`
  ADD PRIMARY KEY (`MaKH`);

--
-- Indexes for table `tra_no`
--
ALTER TABLE `tra_no`
  ADD PRIMARY KEY (`MaTraNo`),
  ADD KEY `FK_traNo` (`MaKH`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD UNIQUE KEY `MaUser` (`MaUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ghi_no`
--
ALTER TABLE `ghi_no`
  MODIFY `MaGhiNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1808;
--
-- AUTO_INCREMENT for table `khach_hang`
--
ALTER TABLE `khach_hang`
  MODIFY `MaKH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=454;
--
-- AUTO_INCREMENT for table `tra_no`
--
ALTER TABLE `tra_no`
  MODIFY `MaTraNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=682;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `MaUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ghi_no`
--
ALTER TABLE `ghi_no`
  ADD CONSTRAINT `FK_ghiNo` FOREIGN KEY (`MaKH`) REFERENCES `khach_hang` (`MaKH`);

--
-- Constraints for table `tra_no`
--
ALTER TABLE `tra_no`
  ADD CONSTRAINT `FK_traNo` FOREIGN KEY (`MaKH`) REFERENCES `khach_hang` (`MaKH`);
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`` PROCEDURE `AddGeometryColumn` (`catalog` VARCHAR(64), `t_schema` VARCHAR(64), `t_name` VARCHAR(64), `geometry_column` VARCHAR(64), `t_srid` INT)  begin
  set @qwe= concat('ALTER TABLE ', t_schema, '.', t_name, ' ADD ', geometry_column,' GEOMETRY REF_SYSTEM_ID=', t_srid); PREPARE ls from @qwe; execute ls; deallocate prepare ls; end$$

CREATE DEFINER=`` PROCEDURE `DropGeometryColumn` (`catalog` VARCHAR(64), `t_schema` VARCHAR(64), `t_name` VARCHAR(64), `geometry_column` VARCHAR(64))  begin
  set @qwe= concat('ALTER TABLE ', t_schema, '.', t_name, ' DROP ', geometry_column); PREPARE ls from @qwe; execute ls; deallocate prepare ls; end$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
