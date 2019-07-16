-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2018 at 11:32 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `make` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `make`, `model`, `year`) VALUES
(10, 'Nissan GTR', 'R35', 2016),
(11, 'Toyota', 'GT86', 2015),
(12, 'Subaru', ' WRX', 2015),
(13, 'Ford', ' Focus RS', 2012);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Engine Parts'),
(2, 'Brake Parts'),
(3, 'Tyre Parts'),
(4, 'Suspension Parts'),
(5, 'gear Box'),
(7, 'lighter Box'),
(10, 'fighter box'),
(11, ''),
(13, 'tyre');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `cityid` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `district_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`cityid`, `name`, `district_id`) VALUES
(1, 'Dhanmondi', 1),
(6, 'khilgoan', 1),
(7, 'gulshan', 1),
(8, 'bashundhara', 1),
(9, 'baridhara', 1),
(10, 'uttara', 1),
(11, 'banshkhali', 2),
(12, 'agrabad', 2),
(13, 'sitakunda', 2),
(14, 'hathazari', 2),
(15, 'Phultala', 3),
(16, 'Paikgachha', 3),
(17, 'Batiaghata', 3),
(18, 'Rupsa', 3),
(19, 'Godagari', 4),
(20, 'Charghat', 4),
(21, 'Durgapur', 4),
(22, 'Baghmara', 4),
(23, 'Mohanpur', 4);

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`id`, `name`) VALUES
(1, 'dhaka'),
(2, 'chittagong'),
(3, 'Khulna'),
(4, 'Rajshahi');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` tinyint(3) NOT NULL,
  `parts_id` int(11) NOT NULL,
  `image_type` varchar(25) NOT NULL,
  `image_size` varchar(25) NOT NULL,
  `image_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `parts_id`, `image_type`, `image_size`, `image_name`) VALUES
(1, 6, 'jpg', '1144', '1.jpg'),
(2, 8, 'jpg', '1144', '2.jpg'),
(3, 9, 'jpg', '1144', '3.jpg'),
(4, 10, 'jpg', '1132', 'tyre1.jpg'),
(5, 11, 'jpg', '1132', 'tyre2.jpg'),
(6, 12, 'jpg', '1132', 'tyre3.jpg'),
(7, 13, 'jpg', '1022', 'brake_disk1.jpg'),
(8, 14, 'jpg', '950', 'brake_disk2.jpg'),
(9, 15, 'jpg', '1144', 'brake_disk3.jpg'),
(10, 16, 'jpg', '1022', 'suspension1.jpg'),
(11, 17, 'jpg', '1022', 'suspension2.jpg'),
(12, 18, 'jpg', '1022', 'suspension3.jpg'),
(13, 19, 'jpg', '1124', 'ni_eng_oil1.jpg'),
(14, 20, 'jpg', '1124', 'ni_eng_oil2.jpg'),
(15, 21, 'jpg', '1124', 'ni_eng_oil3.jpg'),
(17, 23, 'image/jpeg', '139621', 'test.jpg'),
(18, 24, 'image/jpeg', '139621', 'ni_brake_2.jpg'),
(19, 25, 'image/jpeg', '121877', 'ni_brake_3.jpg'),
(20, 26, 'image/jpeg', '5628', 'ni_tyre.jpg'),
(21, 27, 'image/jpeg', '8868', 'ni_tyre2.jpg'),
(22, 28, 'image/jpeg', '116923', 'ni_tyre3.jpg'),
(23, 29, 'image/jpeg', '10540', 'suspension1.jpg'),
(24, 30, 'image/jpeg', '6223', 'suspension2.jpg'),
(25, 31, 'image/jpeg', '31355', 'suspension3.jpg'),
(26, 38, 'image/jpeg', '240224', '1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `quantity` int(2) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `parts_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `quantity`, `users_id`, `parts_id`) VALUES
(8, 0, 16, 12);

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

CREATE TABLE `parts` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `price` int(10) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `cars_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parts`
--

INSERT INTO `parts` (`id`, `name`, `price`, `categories_id`, `cars_id`) VALUES
(6, 'brake oil', 100, 1, 13),
(8, 'engin_oil', 250, 1, 13),
(9, 'steering_oil', 250, 1, 13),
(10, 'tyre1', 500, 3, 13),
(11, 'tyre2', 600, 3, 13),
(12, 'tyre3', 650, 3, 13),
(13, 'brake_disk1', 700, 2, 13),
(14, 'brake_disk2', 750, 2, 13),
(15, 'brake_disk3', 800, 2, 13),
(16, 'suspension1', 300, 4, 13),
(17, 'suspension2', 350, 4, 13),
(18, 'suspension3', 400, 4, 13),
(19, 'ni_eng_oil1', 360, 1, 10),
(20, 'ni_eng_il2', 320, 1, 10),
(21, 'ni_eng_il3', 420, 1, 10),
(22, 'ni_brake_1', 450, 2, 10),
(23, 'ni', 233, 2, 10),
(24, 'ni_brake_2', 500, 2, 10),
(25, 'ni_brake_3', 550, 2, 10),
(26, 'ni_tyre1', 600, 3, 10),
(27, 'ni_tyre2', 650, 3, 10),
(28, 'ni_tyre3', 800, 3, 10),
(29, 'suspension1', 800, 4, 10),
(30, 'suspension2', 800, 4, 10),
(31, 'suspension3', 850, 4, 10),
(32, '', 0, 1, 10),
(33, '', 0, 1, 10),
(34, '', 0, 1, 10),
(35, '', 0, 1, 10),
(38, 'hasib', 40000, 1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `confirmpassword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `name`, `gender`, `email`, `phone`, `address`, `city`, `district`, `password`, `confirmpassword`) VALUES
(3, 'hasib', 'male', 'hasib@gmail.com', 1701247659, 'road-5', '6', '1', 'c4ca4238a0b923820dcc509a6f75849b', 'c4ca4238a0b923820dcc509a6f75849b'),
(4, 'hasib', 'male', 'hasib@gmail.com', 1701247659, 'road-5', '6', '1', 'c4ca4238a0b923820dcc509a6f75849b', 'c4ca4238a0b923820dcc509a6f75849b'),
(5, '', '', '', 0, '', '', '', 'd41d8cd98f00b204e9800998ecf8427e', 'd41d8cd98f00b204e9800998ecf8427e'),
(6, '', '', '', 0, '', '', '', 'd41d8cd98f00b204e9800998ecf8427e', 'd41d8cd98f00b204e9800998ecf8427e'),
(7, 'hasib', 'male', 'hasib@gmail.com', 1701247659, 'road-5', '6', '1', 'c4ca4238a0b923820dcc509a6f75849b', 'c4ca4238a0b923820dcc509a6f75849b'),
(8, 'hasib', 'male', 'hasib@gmail.com', 1701247659, 'road-5', '6', '1', 'c4ca4238a0b923820dcc509a6f75849b', 'c4ca4238a0b923820dcc509a6f75849b'),
(9, '', '', '', 0, '', '', '', 'd41d8cd98f00b204e9800998ecf8427e', 'd41d8cd98f00b204e9800998ecf8427e');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `cityid` int(11) DEFAULT NULL,
  `admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `cityid`, `admin`) VALUES
(15, 'hasib', 'admin', NULL, 1),
(16, 'Muna', '12345', NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`cityid`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`users_id`);

--
-- Indexes for table `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cityid` (`cityid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `cityid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `parts`
--
ALTER TABLE `parts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`cityid`) REFERENCES `city` (`cityid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
