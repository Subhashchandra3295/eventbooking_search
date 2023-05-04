-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2023 at 02:11 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eventbooking`
--

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `employee_mail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `employee_name`, `employee_mail`) VALUES
(1, 'Reto Fanzen', 'reto.fanzen@no-reply.rexx-systems.com'),
(3, 'Leandro Bußmann', 'leandro.bussmann@no-reply.rexx-systems.com'),
(4, 'Hans Schäfer', 'hans.schaefer@no-reply.rexx-systems.com'),
(5, 'Mia Wyss', 'mia.wyss@no-reply.rexx-systems.com');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `event_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `event_name`, `event_date`) VALUES
(1, 'PHP 7 crash course', '2019-09-04 08:00:00'),
(2, 'International PHP Conference', '2019-10-21 10:00:00'),
(3, 'International PHP Conference', '2019-10-21 10:00:00'),
(4, 'PHP 7 crash course', '2019-09-04 04:00:00'),
(5, 'PHP 7 crash course', '2019-09-04 04:00:00'),
(6, 'International PHP Conference', '2019-10-21 06:00:00'),
(7, 'code.talks', '2019-10-24 08:00:00'),
(8, 'code.talks', '2019-10-24 04:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `participations`
--

CREATE TABLE `participations` (
  `participation_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `participation_fee` decimal(10,2) NOT NULL,
  `version` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `participations`
--

INSERT INTO `participations` (`participation_id`, `employee_id`, `event_id`, `participation_fee`, `version`) VALUES
(1, 1, 1, '0.00', ''),
(2, 1, 2, '1485.99', ''),
(3, 3, 3, '657.50', ''),
(4, 4, 4, '0.00', ''),
(5, 5, 5, '0.00', ''),
(6, 5, 6, '657.50', ''),
(7, 1, 7, '474.81', ''),
(8, 4, 8, '534.31', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `email` (`employee_mail`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `participations`
--
ALTER TABLE `participations`
  ADD PRIMARY KEY (`participation_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `event_id` (`event_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `participations`
--
ALTER TABLE `participations`
  MODIFY `participation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `participations`
--
ALTER TABLE `participations`
  ADD CONSTRAINT `participations_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `participations_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
