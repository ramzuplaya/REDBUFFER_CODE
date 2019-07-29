-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2019 at 02:03 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `songsdb`
--
CREATE DATABASE IF NOT EXISTS `songsdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `songsdb`;

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `artist` varchar(100) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `length` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `name`, `artist`, `genre`, `length`) VALUES
(15, 'Imagine Dragons - Bad Liar.mp3', 'Imagine Dragons', 'Rock', '289.12125'),
(16, 'Edward Maya  Harem.mp3', 'Edward Maya', 'Pop', '209.627916'),
(17, 'Sail_Awolnation.mp3', 'Awolnation', 'Rock', '175.912388'),
(18, 'Julian Calor - Freedom.mp3', 'Julian Calor', 'Rock', '209.147916'),
(19, 'The Script - Flares.mp3', 'The Script', 'Pop', '254.96125');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
