-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 04, 2016 at 05:24 AM
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
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CID` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Note` text COLLATE utf8_unicode_ci,
  `Active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CID`, `Name`, `Phone`, `Email`, `Address`, `Note`, `Active`) VALUES
(2, 'Thanh', '0000000000', NULL, 'V1 2104', NULL, 1),
(3, 'a chanh w2 1607', '0916998986', NULL, 'w2 1607', NULL, 1),
(4, 'a hưng', '01229576222', 'thinhtran90@gmail.com', 'nvl lau 4', 'cần nhập lại', 1),
(5, 'c My', '0909158345', NULL, 'NVL', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `InOutMoney`
--

CREATE TABLE `InOutMoney` (
  `MId` int(11) NOT NULL,
  `Type` int(11) NOT NULL,
  `DateCreate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `Who` text COLLATE utf8_unicode_ci NOT NULL,
  `Money` int(11) NOT NULL,
  `Reason` text COLLATE utf8_unicode_ci NOT NULL,
  `DateCancel` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `WhoCancel` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `InOutMoney`
--

INSERT INTO `InOutMoney` (`MId`, `Type`, `DateCreate`, `Who`, `Money`, `Reason`, `DateCancel`, `WhoCancel`) VALUES
(1, 0, '2016-07-03 16:19:00', 'anh', -444, 'test', NULL, NULL),
(2, 1, '2016-07-10 16:28:00', 'gg', 2234234, 'fasdf', NULL, NULL),
(3, 1, '2016-07-04 03:18:00', 'dddd', 3333333, 'ddddd', NULL, NULL),
(4, 0, '2016-07-04 03:23:00', 'ANh', -659999, 'Thees Anh Rut di choi', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
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
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`InId`, `Cid`, `DateCreate`, `TotalPrice`, `TotalPay`, `Vat`, `Discount`, `IsExpress`, `Note`, `LastStatus`, `Active`) VALUES
(1, 5, '2016-06-19 02:42:43', 120000, 0, 0, 0, 0, 'Bill giấy: 5232\n\nMốt Giao', 3, 1),
(2, 5, '2016-06-30 14:34:00', 285000, 0, 0, 0, 0, NULL, 1, 1),
(3, 4, '2016-06-22 12:35:00', 135000, 0, 0, 0, 0, NULL, 1, 1),
(4, 4, '2016-07-15 02:30:00', 2090000, 0, 0, 0, 0, NULL, 1, 1),
(5, 5, '2016-07-31 15:55:00', 190000, 0, 0, 0, 0, NULL, 1, 1);

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
,`DueAmount` bigint(12)
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
,`DueAmount` bigint(12)
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
-- Table structure for table `invoicedetails`
--

CREATE TABLE `invoicedetails` (
  `Did` int(11) NOT NULL,
  `Pid` int(11) NOT NULL,
  `InId` int(11) NOT NULL,
  `UnitPrice` int(11) NOT NULL,
  `TypePrice` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoicedetails`
--

INSERT INTO `invoicedetails` (`Did`, `Pid`, `InId`, `UnitPrice`, `TypePrice`, `Quantity`) VALUES
(1, 4, 1, 60000, 'dryclean', 2),
(2, 12, 2, 95000, 'laundry', 3),
(3, 5, 3, 45000, 'laundry', 3),
(4, 12, 4, 95000, 'laundry', 22),
(5, 12, 5, 95000, 'laundry', 2);

-- --------------------------------------------------------

--
-- Table structure for table `invoicehistory`
--

CREATE TABLE `invoicehistory` (
  `HId` int(11) NOT NULL,
  `InId` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `DateCreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ChangeText` text COLLATE utf8_unicode_ci NOT NULL,
  `Note` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoicestatus`
--

CREATE TABLE `invoicestatus` (
  `SID` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoicestatus`
--

INSERT INTO `invoicestatus` (`SID`, `Name`) VALUES
(-1, 'Request cancel'),
(0, 'Cancel'),
(1, 'New'),
(2, 'Confirmed'),
(3, 'Sent to Partner'),
(4, 'Receive from Partner'),
(5, 'Delivery');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `PID` int(11) NOT NULL,
  `EnName` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VnName` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `Unit` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Note` text COLLATE utf8_unicode_ci,
  `Active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`PID`, `EnName`, `VnName`, `Unit`, `Note`, `Active`) VALUES
(1, 'Trouser, Jean', 'Quần Tây, Jean', 'Cái', NULL, 1),
(2, 'Shirt, Blouse', 'Áo sơ mi, Áo kiểu', 'cái', NULL, 1),
(3, 'T-shirt', 'Áo thun, ba lỗ, croptop', 'Cái', NULL, 1),
(4, 'Small Vest', 'Áo vest, Khoác nhỏ', 'Cái', NULL, 1),
(5, 'Medium Vest', 'Áo vest, khoác trung', 'Cái', NULL, 1),
(6, 'Big coat, Sweater', 'Áo vest, khoác lớn, áo ấm', 'Cái', NULL, 1),
(7, 'Leather, overcoat', 'Áo khoác da, áo Choàng', 'Cái', NULL, 1),
(8, 'Short Skirt', 'Váy ngắn, thường', 'Cái', NULL, 1),
(9, 'Long Skirt, Jumpsuit', 'Váy dài, áo liền quần, đầm mini', 'Cái', NULL, 1),
(10, 'Normal Dress, 1PC', 'Áo đầm thường, áo dài thường', 'Cái', NULL, 1),
(11, 'Designed Dress', 'Đầm kiểu, dự tiệc, thiết kế', 'Cái', NULL, 1),
(12, 'Wedding Dress', 'Áo cưới, đầm dạ hội', 'Cái', NULL, 1),
(13, 'Pillow case', 'Áo gối', 'Cái', NULL, 1),
(14, 'Queen, Drap/Bed sheet T, Q', 'Ga trải giường Twin', 'Cái', NULL, 1),
(15, 'Drap/Bed sheet K', 'Ga trải giường King', 'Cái', NULL, 1),
(16, 'Duvet cover S', 'Bọc mền S', 'Cái', NULL, 1),
(17, 'Duvet cover D', 'Bọc mền D', 'Cái', NULL, 1),
(18, 'Duvet S', 'Ruột mền S', 'Cái', NULL, 1),
(19, 'Duvet D', 'Ruột mền D', 'Cái', NULL, 1),
(20, 'Bed cover', 'Phủ giường', 'Cái', NULL, 1),
(21, 'Thin Blanket', 'Mền mỏng <2cm', 'Cái', NULL, 1),
(22, 'Medium Blanket', 'Mền t.bình 2-4cm', 'Cái', NULL, 1),
(23, 'Thick, premium Blanket', 'Mền dày >4cm, cao cấp', 'Cái', NULL, 1),
(24, NULL, 'áo len thun', 'cái', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stuffconfig`
--

CREATE TABLE `stuffconfig` (
  `ID` int(11) NOT NULL,
  `ExPricePercent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stuffconfig`
--

INSERT INTO `stuffconfig` (`ID`, `ExPricePercent`) VALUES
(1, 50);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Id` int(11) NOT NULL,
  `UserName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Role` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Id`, `UserName`, `Password`, `Role`) VALUES
(1, 'admin', '$2a$08$ApmTcQ8WOdNcs73eBslLPeW.7SA99SurC3AZgZab.WCScIyY1ZJ9O', 'ADMIN'),
(2, 'user', '$2a$08$bIGdppOPgIs6xwA8ftRFJeaevl.1qyaqyuPUnwRc5ID.aykWC3J6y', 'USER');

-- --------------------------------------------------------

--
-- Table structure for table `washtypeprice`
--

CREATE TABLE `washtypeprice` (
  `PID` int(11) NOT NULL,
  `Laundry` int(11) NOT NULL,
  `DryClean` int(11) NOT NULL,
  `PressOnly` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `washtypeprice`
--

INSERT INTO `washtypeprice` (`PID`, `Laundry`, `DryClean`, `PressOnly`) VALUES
(1, 32000, 42000, 22000),
(2, 30000, 40000, 20000),
(3, 28000, 38000, 20000),
(4, 40000, 60000, 0),
(5, 45000, 65000, 32000),
(6, 65000, 80000, 0),
(7, 85000, 105000, 0),
(8, 30000, 40000, 20000),
(9, 40000, 60000, 30000),
(10, 55000, 75000, 38000),
(11, 70000, 95000, 0),
(12, 95000, 120000, 60000),
(13, 17000, 25000, 0),
(14, 58000, 78000, 0),
(15, 68000, 88000, 0),
(16, 58000, 78000, 0),
(17, 68000, 88000, 0),
(18, 68000, 88000, 0),
(19, 78000, 98000, 0),
(20, 60000, 80000, 0),
(21, 60000, 80000, 0),
(22, 90000, 110000, 0),
(23, 120000, 150000, 0),
(24, 28000, 38000, 0);

-- --------------------------------------------------------

--
-- Structure for view `invoicecustomerview`
--
DROP TABLE IF EXISTS `invoicecustomerview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `motivation`.`invoicecustomerview`  AS  select `I`.`InId` AS `InId`,`I`.`Cid` AS `Cid`,`I`.`DateCreate` AS `DateCreate`,`I`.`TotalPrice` AS `TotalPrice`,`I`.`TotalPay` AS `TotalPay`,(`I`.`TotalPrice` - `I`.`TotalPay`) AS `DueAmount`,`I`.`Vat` AS `Vat`,`I`.`Discount` AS `Discount`,`I`.`IsExpress` AS `IsExpress`,`I`.`Note` AS `Note`,`I`.`LastStatus` AS `LastStatus`,`I`.`Active` AS `Active`,`C`.`Name` AS `Name`,`C`.`Phone` AS `Phone`,`C`.`Email` AS `Email`,`C`.`Address` AS `Address` from (`motivation`.`invoice` `I` join `motivation`.`customer` `C`) where ((1 = 1) and (`I`.`Cid` = `C`.`CID`)) order by `I`.`DateCreate` desc ;

-- --------------------------------------------------------

--
-- Structure for view `invoicedetailcustomerview`
--
DROP TABLE IF EXISTS `invoicedetailcustomerview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `motivation`.`invoicedetailcustomerview`  AS  select `I`.`InId` AS `InId`,`I`.`DateCreate` AS `DateCreate`,`I`.`TotalPrice` AS `TotalPrice`,(`I`.`TotalPrice` - `I`.`TotalPay`) AS `DueAmount`,`I`.`TotalPay` AS `TotalPay`,`I`.`Vat` AS `Vat`,`I`.`Discount` AS `Discount`,`I`.`IsExpress` AS `IsExpress`,`I`.`Note` AS `InvoiceNote`,`I`.`LastStatus` AS `LastStatus`,`I`.`Active` AS `InvoiceActive`,`D`.`Did` AS `Did`,`D`.`Pid` AS `Pid`,`D`.`UnitPrice` AS `UnitPrice`,`D`.`TypePrice` AS `TypePrice`,`D`.`Quantity` AS `Quantity`,`C`.`CID` AS `CID`,`C`.`Name` AS `Name`,`C`.`Phone` AS `Phone`,`C`.`Email` AS `Email`,`C`.`Address` AS `Address`,`C`.`Note` AS `CustomerNote`,`C`.`Active` AS `CustomerActive`,`P`.`EnName` AS `EnName`,`P`.`VnName` AS `VnName` from (((`motivation`.`invoice` `I` join `motivation`.`invoicedetails` `D` on((`I`.`InId` = `D`.`InId`))) join `motivation`.`customer` `C` on((`I`.`Cid` = `C`.`CID`))) join `motivation`.`product` `P` on((`D`.`Pid` = `P`.`PID`))) order by `I`.`InId` desc ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CID`);

--
-- Indexes for table `InOutMoney`
--
ALTER TABLE `InOutMoney`
  ADD PRIMARY KEY (`MId`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`InId`);

--
-- Indexes for table `invoicedetails`
--
ALTER TABLE `invoicedetails`
  ADD PRIMARY KEY (`Did`);

--
-- Indexes for table `invoicehistory`
--
ALTER TABLE `invoicehistory`
  ADD PRIMARY KEY (`HId`);

--
-- Indexes for table `invoicestatus`
--
ALTER TABLE `invoicestatus`
  ADD PRIMARY KEY (`SID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`PID`);

--
-- Indexes for table `stuffconfig`
--
ALTER TABLE `stuffconfig`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `UserName` (`UserName`);

--
-- Indexes for table `washtypeprice`
--
ALTER TABLE `washtypeprice`
  ADD PRIMARY KEY (`PID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `InOutMoney`
--
ALTER TABLE `InOutMoney`
  MODIFY `MId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `InId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `invoicedetails`
--
ALTER TABLE `invoicedetails`
  MODIFY `Did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `invoicehistory`
--
ALTER TABLE `invoicehistory`
  MODIFY `HId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `PID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
