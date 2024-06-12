-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2024 at 04:37 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car_dealership`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_serial_no` int(11) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `colour` varchar(50) DEFAULT NULL,
  `model_year` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `phone_no` int(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_no` int(11) NOT NULL,
  `invoice_date` date DEFAULT NULL,
  `salesperson_id` varchar(6) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `car_serial_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mechanic`
--

CREATE TABLE `mechanic` (
  `mechanic_id` int(11) NOT NULL,
  `mech_first_name` varchar(50) DEFAULT NULL,
  `mech_last_name` varchar(100) DEFAULT NULL,
  `mech_address` varchar(100) DEFAULT NULL,
  `specialization` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mech_service`
--

CREATE TABLE `mech_service` (
  `service_ticket_no` int(11) DEFAULT NULL,
  `mechanic_id` int(11) DEFAULT NULL,
  `service_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salesperson`
--

CREATE TABLE `salesperson` (
  `salesperson_id` varchar(6) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `phone_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `service_name` varchar(200) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `car_serial_no` int(11) DEFAULT NULL,
  `service_ticket_no` int(11) DEFAULT NULL,
  `mechanic_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_history`
--

CREATE TABLE `service_history` (
  `car_serial_no` int(11) DEFAULT NULL,
  `date_in` date DEFAULT NULL,
  `date_out` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_part`
--

CREATE TABLE `service_part` (
  `part_name` varchar(100) DEFAULT NULL,
  `service_ticket_no` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `part_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_ticket`
--

CREATE TABLE `service_ticket` (
  `service_ticket_no` int(11) NOT NULL,
  `car_serial_no` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `service_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_serial_no`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_no`),
  ADD KEY `car_serial_no` (`car_serial_no`),
  ADD KEY `salesperson_id` (`salesperson_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `mechanic`
--
ALTER TABLE `mechanic`
  ADD PRIMARY KEY (`mechanic_id`);

--
-- Indexes for table `mech_service`
--
ALTER TABLE `mech_service`
  ADD KEY `service_ticket_no` (`service_ticket_no`),
  ADD KEY `mechanic_id` (`mechanic_id`);

--
-- Indexes for table `salesperson`
--
ALTER TABLE `salesperson`
  ADD PRIMARY KEY (`salesperson_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD KEY `service_ticket_no` (`service_ticket_no`),
  ADD KEY `mechanic_id` (`mechanic_id`),
  ADD KEY `car_serial_no` (`car_serial_no`);

--
-- Indexes for table `service_history`
--
ALTER TABLE `service_history`
  ADD KEY `car_serial_no` (`car_serial_no`);

--
-- Indexes for table `service_part`
--
ALTER TABLE `service_part`
  ADD KEY `service_ticket_no` (`service_ticket_no`);

--
-- Indexes for table `service_ticket`
--
ALTER TABLE `service_ticket`
  ADD PRIMARY KEY (`service_ticket_no`),
  ADD KEY `car_serial_no` (`car_serial_no`),
  ADD KEY `customer_id` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_ticket`
--
ALTER TABLE `service_ticket`
  MODIFY `service_ticket_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`car_serial_no`) REFERENCES `car` (`car_serial_no`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`salesperson_id`) REFERENCES `salesperson` (`salesperson_id`),
  ADD CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `mech_service`
--
ALTER TABLE `mech_service`
  ADD CONSTRAINT `mech_service_ibfk_1` FOREIGN KEY (`service_ticket_no`) REFERENCES `service_ticket` (`service_ticket_no`),
  ADD CONSTRAINT `mech_service_ibfk_2` FOREIGN KEY (`mechanic_id`) REFERENCES `mechanic` (`mechanic_id`);

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`service_ticket_no`) REFERENCES `service_ticket` (`service_ticket_no`),
  ADD CONSTRAINT `service_ibfk_2` FOREIGN KEY (`mechanic_id`) REFERENCES `mechanic` (`mechanic_id`),
  ADD CONSTRAINT `service_ibfk_3` FOREIGN KEY (`car_serial_no`) REFERENCES `car` (`car_serial_no`);

--
-- Constraints for table `service_history`
--
ALTER TABLE `service_history`
  ADD CONSTRAINT `service_history_ibfk_1` FOREIGN KEY (`car_serial_no`) REFERENCES `car` (`car_serial_no`);

--
-- Constraints for table `service_part`
--
ALTER TABLE `service_part`
  ADD CONSTRAINT `service_part_ibfk_1` FOREIGN KEY (`service_ticket_no`) REFERENCES `service_ticket` (`service_ticket_no`);

--
-- Constraints for table `service_ticket`
--
ALTER TABLE `service_ticket`
  ADD CONSTRAINT `service_ticket_ibfk_1` FOREIGN KEY (`car_serial_no`) REFERENCES `car` (`car_serial_no`),
  ADD CONSTRAINT `service_ticket_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
