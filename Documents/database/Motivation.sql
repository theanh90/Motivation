-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 24, 2016 at 05:05 PM
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
(2, 'Send to Partner'),
(3, 'Receive from Partner'),
(4, 'Delivery');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `INVOICESTATUS`
--
ALTER TABLE `INVOICESTATUS`
  ADD PRIMARY KEY (`SID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
