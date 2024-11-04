-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2024 at 05:48 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phpform`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_accounts`
--

CREATE TABLE `admin_accounts` (
  `id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `series_id` varchar(60) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `admin_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_accounts`
--

INSERT INTO `admin_accounts` (`id`, `user_name`, `password`, `series_id`, `remember_token`, `expires`, `admin_type`) VALUES
(4, 'superadmin.old', '$2y$10$eo7.w0Ttuy8mOBMvDlGqDeewQERkXu//7qO3jXp5NC76LwfAZpNrO', 'rvuWJHMd5LTxLC2J', '$2y$10$LDUi4w/UAM2PgfMoKkLo4.igJX39G5/WQOEDHRaDy3y2KZeIxXggm', '2019-02-16 22:39:57', 'super'),
(7, 'anand.old', '$2y$10$OrQFRZdSUP3X2kvGZrg.zeplQkxcJAq1s6atRehyCpbEvOVPu8KPe', NULL, NULL, NULL, 'admin'),
(8, 'admin', '$2y$10$RnDwpen5c8.gtZLaxHEHDOKWY77t/20A4RRkWBsjlPuu7Wmy0HyBu', 'ACwykFa2dvVbPrY7', '$2y$10$EkyTmxJoHSG2H9zs4h4T0OnKXZ/a9BjAE7Qgokamf54pO/lcXZThe', '2024-11-29 04:50:13', 'admin'),
(12, 'asad', '$2y$10$IGV2S8sxbejDcxyWl9zDA.d5eYGdvbhpshpZYR3PinNEumNhWlGPy', NULL, NULL, NULL, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(250) DEFAULT '#000000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `color`) VALUES
(1, '1950s', '#477cb8'),
(2, '1960s', '#000000'),
(3, '1970s', '#000000'),
(4, 'Modified', '#000000'),
(6, 'Unrestored Original', '#000000'),
(7, 'Resto-Mod', '#000000'),
(8, 'Custom', '#000000'),
(9, 'Pickup', '#000000'),
(10, 'Street Rod', '#000000'),
(21, 'Import', '#000000'),
(12, 'Motorcycle', '#000000'),
(13, 'Tractor', '#000000'),
(22, 'Modern -1990 and Up', '#000000'),
(16, 'Rat Rod', '#000000'),
(17, 'Under Construction', '#000000'),
(23, 'Lowrider', '#000000'),
(24, 'new Cat', '#550b75');

-- --------------------------------------------------------

--
-- Table structure for table `password_generator`
--

CREATE TABLE `password_generator` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `password_generator`
--

INSERT INTO `password_generator` (`id`, `user_id`, `password`, `status`) VALUES
(17, '', 'vote331414', '0'),
(18, '', 'vote341422', '0'),
(19, '', 'vote2024', '0'),
(20, '', 'vote202529', '0'),
(21, '', 'vote202532', '0'),
(22, '', 'vote202536', '0');

-- --------------------------------------------------------

--
-- Table structure for table `password_used`
--

CREATE TABLE `password_used` (
  `id` int(11) NOT NULL,
  `vehicle_id` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `voted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `password_used`
--

INSERT INTO `password_used` (`id`, `vehicle_id`, `password`, `voted_at`) VALUES
(1, '9', 'vote040716', '2024-02-07 18:30:29'),
(2, '11', 'vote020737', '2024-02-14 04:03:00'),
(16, '1', 'vote2024', '2024-02-14 17:16:11'),
(17, '1', 'vote2024', '2024-02-15 00:50:14'),
(18, '5', 'vote2024', '2024-02-15 01:55:57'),
(19, '6', 'vote2024', '2024-02-15 01:58:44'),
(20, '7', 'vote2024', '2024-02-15 02:01:36'),
(21, '1', 'vote341422', '2024-04-22 15:31:47'),
(22, '1', 'vote341422', '2024-04-22 15:31:57'),
(23, '1', 'vote2024', '2024-06-03 17:50:36'),
(24, '1', 'vote2024', '2024-06-03 17:51:07'),
(25, '183', 'vote2024', '2024-06-08 17:18:05'),
(26, '183', 'vote2024', '2024-06-08 17:18:23'),
(27, '5', 'vote2024', '2024-06-08 20:06:23'),
(28, '94', 'vote2024', '2024-06-08 20:07:36'),
(29, '129', 'vote2024', '2024-06-08 20:09:25'),
(30, '104', 'vote2024', '2024-06-08 20:10:54'),
(31, '29', 'vote2024', '2024-06-08 20:12:07'),
(32, '177', 'vote2024', '2024-06-08 20:13:04'),
(33, '119', 'vote2024', '2024-06-08 20:14:04'),
(34, '183', 'vote2024', '2024-06-08 20:14:43'),
(35, '83', 'vote2024', '2024-06-08 20:15:28'),
(36, '95', 'vote2024', '2024-06-08 20:16:03'),
(37, '139', 'vote2024', '2024-06-08 20:16:47'),
(38, '44', 'vote2024', '2024-06-08 20:18:51'),
(39, '122', 'vote2024', '2024-06-08 20:36:02'),
(40, '161', 'vote2024', '2024-06-08 20:37:05'),
(41, '20', 'vote2024', '2024-06-08 20:37:58'),
(42, '178', 'vote2024', '2024-06-08 20:38:53'),
(43, '182', 'vote2024', '2024-06-08 20:39:44'),
(44, '142', 'vote2024', '2024-06-08 20:40:55'),
(45, '183', 'vote2024', '2024-06-08 20:41:38'),
(46, '83', 'vote2024', '2024-06-08 20:42:45'),
(47, '170', 'vote2024', '2024-06-08 20:43:51'),
(48, '82', 'vote2024', '2024-06-08 20:44:37'),
(49, '150', 'vote2024', '2024-06-08 20:45:24'),
(50, '122', 'vote2024', '2024-06-08 20:52:28'),
(51, '106', 'vote2024', '2024-06-08 20:53:00'),
(52, '20', 'vote2024', '2024-06-08 20:53:21'),
(53, '110', 'vote2024', '2024-06-08 20:53:50'),
(54, '141', 'vote2024', '2024-06-08 20:54:11'),
(55, '160', 'vote2024', '2024-06-08 20:54:39'),
(56, '22', 'vote2024', '2024-06-08 20:55:08'),
(57, '127', 'vote2024', '2024-06-08 20:55:37'),
(58, '117', 'vote2024', '2024-06-08 20:55:58'),
(59, '61', 'vote2024', '2024-06-08 20:56:19'),
(60, '34', 'vote2024', '2024-06-08 20:56:40'),
(61, '139', 'vote2024', '2024-06-08 20:57:08'),
(62, '191', 'vote2024', '2024-06-08 20:57:31'),
(63, '112', 'vote2024', '2024-06-08 20:57:59'),
(64, '150', 'vote2024', '2024-06-08 20:58:18'),
(65, '175', 'vote2024', '2024-06-08 21:08:59'),
(66, '193', 'vote2024', '2024-06-08 21:09:34'),
(67, '20', 'vote2024', '2024-06-08 21:10:02'),
(68, '185', 'vote2024', '2024-06-08 21:10:27'),
(69, '178', 'vote2024', '2024-06-08 21:11:00'),
(70, '178', 'vote2024', '2024-06-08 21:11:50'),
(71, '29', 'vote2024', '2024-06-08 21:12:43'),
(72, '22', 'vote2024', '2024-06-08 21:13:05'),
(73, '142', 'vote2024', '2024-06-08 21:13:32'),
(74, '183', 'vote2024', '2024-06-08 21:14:06'),
(75, '61', 'vote2024', '2024-06-08 21:14:43'),
(76, '34', 'vote2024', '2024-06-08 21:15:09'),
(77, '139', 'vote2024', '2024-06-08 21:15:31'),
(78, '123', 'vote2024', '2024-06-08 21:16:02'),
(79, '44', 'vote2024', '2024-06-08 21:16:24'),
(80, '150', 'vote2024', '2024-06-08 21:17:44'),
(81, '5', 'Vote2024', '2024-06-08 21:18:27'),
(82, '188', 'vote2024', '2024-06-08 21:18:37'),
(83, '191', 'vote2024', '2024-06-08 21:18:59'),
(84, '97', 'Vote2024', '2024-06-08 21:19:22'),
(85, '139', 'vote2024', '2024-06-08 21:19:27'),
(86, '20', 'Vote2024', '2024-06-08 21:19:53'),
(87, '34', 'vote2024', '2024-06-08 21:19:54'),
(88, '141', 'Vote2024', '2024-06-08 21:20:20'),
(89, '83', 'vote2024', '2024-06-08 21:20:29'),
(90, '182', 'Vote2024', '2024-06-08 21:20:48'),
(91, '147', 'vote2024', '2024-06-08 21:20:52'),
(92, '177', 'Vote2024', '2024-06-08 21:21:11'),
(93, '133', 'vote2024', '2024-06-08 21:21:15');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `logo` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `logo`) VALUES
(1, 'logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `vehicle_maker` varchar(255) NOT NULL,
  `vehicle_model` varchar(255) NOT NULL,
  `vehicle_year` varchar(255) NOT NULL,
  `vote_status` varchar(255) DEFAULT '0',
  `category` varchar(255) DEFAULT NULL,
  `checkbox` varchar(255) NOT NULL,
  `qrcode` varchar(255) DEFAULT NULL,
  `created_date` varchar(255) DEFAULT NULL,
  `fav_vote` varchar(255) DEFAULT '0',
  `fav_qr` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `name`, `address`, `phone`, `vehicle_maker`, `vehicle_model`, `vehicle_year`, `vote_status`, `category`, `checkbox`, `qrcode`, `created_date`, `fav_vote`, `fav_qr`, `status`) VALUES
(1, 'Nicholas Odorizzi', 'Wilson Creek', '', 'Chevy', 'Impala', '1959', '4', '1950s', 'yes', '1709142033.png', '2023-02-28 09:40:33', '0', NULL, 1),
(2, 'J.Doug McFall --', '813 NE Etta', '5094214947', 'Chevrolet', 'Camaro', '1967', '0', 'Resto-Mod', 'yes', '1709237629.png', '2024-02-29 12:13:49', '0', NULL, 1),
(3, 'Jacke Friend Spencer', '87 SW 7th Ave', '6197938193', 'Ford', 'Mustang Grande', '1971', '0', '1970s', 'yes', '1709251314.png', '2024-02-29 16:01:54', '0', NULL, 1),
(4, 'DAWN DE LEON', '305 Rd 23.4 NW', '5099896329', 'Chevy', 'C10', '1965', '0', 'Pickup', 'yes', '1709415331.png', '2024-03-02 13:35:31', '0', NULL, 1),
(5, 'Jerry L McNeight', '17842 MANASTASH RD', '5099629818', ' Chevy', 'Bel Air', '1957', '2', '1950s', 'yes', '1709916918.png', '2024-03-08 08:55:18', '0', NULL, 1),
(8, 'Kevin Esteb', 'Wilson Creek', '4253433231', 'Plymouth', 'Duster', '1974', '0', 'Under Construction', 'yes', '1710298738.png', '2024-03-12 19:58:58', '0', NULL, 1),
(9, 'DAWN DE LEON', 'SOAP LAKE', '5099896329', 'Chevy', 'C10', '1965', '0', 'Pickup', 'yes', '1710462881.png', '2024-03-14 17:34:41', '0', NULL, 1),
(10, 'Nathaniel Williams', 'Deer park', '5099192634', 'Chevrolet ', 'Vega', '1972', '0', '1970s', 'yes', '1711932827.png', '2024-03-31 17:53:47', '0', NULL, 1),
(11, 'Patricia ', 'Goben', '5094136330', 'Chevy ', 'Corvette convertible', '2006', '0', 'Unrestored Original', 'yes', '1711989024.png', '2024-04-01 09:30:24', '0', NULL, 1),
(12, 'Jerry L McNeight', '17842 MANASTASH RD', '5099629818', ' Chevy', 'Bel Air', '1957', '0', '1950s', 'yes', '1712446688.png', '2024-04-06 16:38:08', '0', NULL, 1),
(13, 'J.Doug McFall --', 'East Wenatchee', '5094214947', 'Chevrolet ', 'Camaro ', '1967', '0', 'Resto-Mod', 'yes', '1712590454.png', '2024-04-08 08:34:14', '0', NULL, 1),
(15, 'Jeremy Reese --', 'Moses Lake', '5094317171', 'Chevrolet ', 'Camaro z28', '1973', '0', '1970s', 'yes', '1713107289.png', '2024-04-14 08:08:09', '0', NULL, 1),
(16, 'Kailer Curtis ', 'Moses lake Wa', '5097504014', 'GMC', 'Suburban ', '1986', '0', 'Modified', 'yes', '1713113916.png', '2024-04-14 09:58:36', '0', NULL, 1),
(17, 'Patricia  Goben', 'Spokane', '5094139330', 'Chevrolet ', 'Corvette ', '2006', '0', 'Unrestored Original', 'yes', '1713202540.png', '2024-04-15 10:35:40', '0', NULL, 1),
(18, 'Kenny Kinswa ', 'Onalaska ', '3605086199', 'Polaris ', 'Utv', '2020', '0', 'Custom', 'yes', '1713220800.png', '2024-04-15 15:40:00', '0', NULL, 1),
(19, 'Gary Spencer', 'Moses Lake', '', 'Mercury', 'Montclair breezeway', '1965', '0', 'Unrestored Original', 'yes', '1713970845.png', '2024-04-24 08:00:45', '0', NULL, 1),
(20, 'Jim & Diana Workman', 'Moses Lake', '', 'Chevy ', 'NOVA', '1970', '4', '1970s', 'yes', '1714144044.png', '2024-04-26 08:07:24', '0', NULL, 1),
(21, 'Jacob', 'Moses Lake', '5097717740', 'Suzuki ', 'C80', '1979', '0', 'Motorcycle', 'yes', '1714362464.png', '2024-04-28 20:47:44', '0', NULL, 1),
(22, 'Steve Oliver --', 'Ephrata ', '', 'Ford', 'Model T', '1923', '2', 'Custom', 'yes', '1714412222.png', '2024-04-29 10:37:02', '0', NULL, 1),
(26, 'Alan Carreon', 'Wenatchee ', '5098600528', 'Subaru ', 'Wrx hatch ', '2011', '0', 'Import', 'yes', '1714536911.png', '2024-04-30 21:15:11', '0', NULL, 1),
(25, 'William Troup', 'Deer park wa', '5099530534', 'Nissan ', 'D21 hardbody ', '95', '0', 'Under Construction', 'yes', '1714447588.png', '2024-04-29 20:26:28', '0', NULL, 1),
(27, 'Jim & Diana Workman', 'Moses Lake', '', 'Chevy', 'Nova', '1970', '0', '1970s', 'yes', '1715033981.png', '2024-05-06 15:19:41', '0', NULL, 1),
(28, 'Everett', 'Stratford', '5097703292', 'VW', 'Bug', '1973', '0', 'Under Construction', 'yes', '1715142781.png', '2024-05-07 21:33:01', '0', NULL, 1),
(29, 'J.Doug McFall --', 'East Wenatchee', '5094214947', 'Chevrolet', 'Camaro RS', '1967', '2', 'Resto-Mod', 'yes', '1715702378.png', '2024-05-14 08:59:38', '0', NULL, 1),
(30, 'Craig  Gensel', 'Coulee City', '4252107250', 'Volkswagen ', 'Bug', '1966', '0', 'Import', 'yes', '1716155295.png', '2024-05-19 14:48:15', '0', NULL, 1),
(31, 'J. Doug McFall --', '813 NE ETTA St.', '5094214947', 'Chevrolet', 'Camaro RS', '1967', '0', 'Resto-Mod', 'yes', '1716184965.png', '2024-05-19 23:02:45', '0', NULL, 1),
(32, 'Patricia a Goben', '2907 N Dakota St', '1509413633', 'Chevrolet', 'Corvette Convertable', '2006', '0', 'Custom', 'yes', '1716233892.png', '2024-05-20 12:38:12', '0', NULL, 1),
(33, 'Sean Connolly --', 'Newhalem, WA', '2063483884', 'GMC', '1/2 ton pickup', '1951', '0', 'Pickup', 'yes', '1716234666.png', '2024-05-20 12:51:06', '0', NULL, 1),
(34, 'Kevin Heer', 'Ephrata', '5092980730', 'Indian', 'Chief Vintage', '2016', '3', 'Motorcycle', 'yes', '1716324893.png', '2024-05-21 13:54:53', '0', NULL, 1),
(38, 'Gary Carpenter ', 'Stratford, Washington ', '', 'Ford', 'Coupe', '1934', '0', 'Select Category', 'yes', '1716496398.png', '2024-05-23 13:33:18', '0', NULL, 1),
(39, 'Gary Carpenter ', 'Stratford, Washington ', '', 'Ford', 'Coupe', '1934', '0', 'Select Category', 'yes', '1716496465.png', '2024-05-23 13:34:25', '0', NULL, 1),
(37, 'Allyson Downing', 'Wilson Creek', '5097704394', 'Ford', 'F250', '1965', '0', 'Under Construction', 'yes', '1716425439.png', '2024-05-22 17:50:39', '0', NULL, 1),
(40, 'Raymond Kelby', 'Wilson Ceeek', '', 'Pontiac', 'GTO', '1971', '0', 'Select Category', 'yes', '1716496593.png', '2024-05-23 13:36:33', '0', NULL, 1),
(41, 'Raymond Kelby', 'Wilson Creek', '', 'Ford', 'Model A', '1930', '0', 'Select Category', 'yes', '1716496683.png', '2024-05-23 13:38:03', '0', NULL, 1),
(42, 'Anthony Lusink', '38114 enumclaw Franklin rd se', '2537976839', 'VW', 'Bug', '1964', '0', 'Import', 'yes', '1716745361.png', '2024-05-26 10:42:41', '0', NULL, 1),
(43, 'José Vásquez --', 'Moses Lake ', '8565626694', 'Buick ', 'Regal', '1986', '0', 'Lowrider', 'yes', '1716868371.png', '2024-05-27 20:52:51', '0', NULL, 1),
(44, 'Paul brumley --', 'Moseslake ', '5098556119', 'Chevy ', 'Impala', '1964', '2', 'Lowrider', 'yes', '1716876774.png', '2024-05-27 23:12:54', '0', NULL, 1),
(46, 'Anthony', 'Moses lake', '5097935508', 'Lincoln ', 'Town car', '2001', '0', 'Under Construction', 'yes', '1716877118.png', '2024-05-27 23:18:38', '0', NULL, 1),
(48, 'Eric Bell', 'Ritzville', '', 'Chevrolet', 'El Camino', '1972', '0', '1970s', 'yes', '1716923171.png', '2024-05-28 12:06:11', '0', NULL, 1),
(52, '', '', '', '', '', '', '0', 'Unrestored Original', 'yes', '1717080066.png', '2024-05-30 07:41:06', '0', NULL, 1),
(50, 'JOSH KNOPP', 'Moses Lake', '', 'Chevrolet ', 'Belair hard top ', '1955', '0', '1950s', 'yes', '1716947799.png', '2024-05-28 18:56:39', '0', NULL, 1),
(51, 'Gabriel Lopez', 'Moses Lake', '5099299210', 'Scion', 'TC', '2011', '0', 'Custom', 'yes', '1716959271.png', '2024-05-28 22:07:51', '0', NULL, 1),
(53, 'Michelle Yurian ', 'Moses lake ', '5093509699', 'Pontiac ', 'Trans am ', '1999', '0', 'Modified', 'yes', '1717210991.png', '2024-05-31 20:03:11', '0', NULL, 1),
(54, 'JOE AVILA --', 'BURLINGTON', '', 'FORD', 'FAIRLAINE', '1963', '0', '1960s', 'yes', '1717277558.png', '2024-06-01 14:32:38', '0', NULL, 1),
(55, 'David Shafer', 'Soap Lake', '3608012025', 'Dodge Brothers ', 'Roadster ', '1917', '0', 'Rat Rod', 'yes', '1717292815.png', '2024-06-01 18:46:55', '0', NULL, 1),
(56, 'Nelson Havens --', 'Royal City', '', 'International', 'S-110', '1956', '0', 'Pickup', 'yes', '1717297159.png', '2024-06-01 19:59:19', '0', NULL, 1),
(57, 'Keith Scott', 'Coulee City', '', 'Chev', 'Impala', '1961', '0', '1960s', 'yes', '1717349362.png', '2024-06-02 10:29:22', '0', NULL, 1),
(58, 'Delilah pvevhouse', 'Soaplake ', '7855778377', 'Chevy', '1500', '1946', '0', 'Under Construction', 'yes', '1717361585.png', '2024-06-02 13:53:05', '0', NULL, 1),
(59, 'Michelle davis', 'Ephrata', '7855778377', 'Ram', '1500', '2023', '0', 'Pickup', 'yes', '1717361691.png', '2024-06-02 13:54:51', '0', NULL, 1),
(60, 'Darrell Thomas', 'Moses lake', '5097602133', 'Ford', 'Model A Roadster ', '1928', '0', 'Street Rod', 'yes', '1717391574.png', '2024-06-02 22:12:54', '0', NULL, 1),
(61, 'Ricky Gutierrez', 'Moses Lake', '', 'Subaru', 'Wrx', '2019', '2', 'Import', 'yes', '1717428653.png', '2024-06-03 08:30:53', '0', NULL, 1),
(62, 'Cristian Sanchez', 'Moses Lake', '5097601631', 'Toyota ', 'Supra', '1993', '0', 'Import', 'yes', '1717430960.png', '2024-06-03 09:09:20', '0', NULL, 1),
(66, 'Craig Gensel', 'Coulee City', '4252107250', 'Volkswagen ', 'Bug', '1966', '0', 'Import', 'yes', '1717474169.png', '2024-06-03 21:09:29', '0', NULL, 1),
(64, 'Ted DeWitt ', 'Moses lake ', '5098556577', 'Chevrolet ', 'El Camino ', '1979', '0', '1970s', 'yes', '1717436576.png', '2024-06-03 10:42:56', '0', NULL, 1),
(65, 'Dan Holmes  --', 'Moses Lake ', '', 'VW', 'Super Beatle ', '1971', '0', '1970s', 'yes', '1717458876.png', '2024-06-03 16:54:36', '0', NULL, 1),
(67, 'Jacob ', 'Moses lake ', '5097717740', 'Toyota ', 'Tacoma', '2001', '0', 'Unrestored Original', 'yes', '1717509198.png', '2024-06-04 06:53:18', '0', NULL, 1),
(68, 'Jacob ', 'Moses lake ', '5097717740', 'Toyota ', 'Tacoma', '2001', '0', 'Unrestored Original', 'yes', '1717509283.png', '2024-06-04 06:54:43', '0', NULL, 1),
(69, 'Jesus', 'Othello ', '5093463740', 'Infiniti ', 'Q60', '2017', '0', 'Import', 'yes', '1717515717.png', '2024-06-04 08:41:57', '0', NULL, 1),
(76, 'Fred Camerer', 'Yakima ', '', 'Chevrolet ', 'Corvette ', '1987', '0', 'Unrestored Original', 'yes', '1717557904.png', '2024-06-04 20:25:04', '0', NULL, 1),
(71, 'kelly cash CANCEL--I HAVE A CONFLICT', '', '', '', '', '', '0', 'Select Category', 'yes', '1717528317.png', '2024-06-04 12:11:57', '0', NULL, 1),
(72, 'Robert palmen', 'Ephrata ', '5093980229', 'Gmc', 'C15', '1970', '0', 'Under Construction', 'yes', '1717532934.png', '2024-06-04 13:28:54', '0', NULL, 1),
(77, 'Mark Cramer', '238 COLUMBIA ST', '7023438983', '', '', '', '0', '1950s', 'yes', '1717559844.png', '2024-06-04 20:57:24', '0', NULL, 1),
(74, 'Nelson Havens --', 'Royal City', '', 'International', 'S-110', '1956', '0', 'Unrestored Original', 'yes', '1717549118.png', '2024-06-04 17:58:38', '0', NULL, 1),
(75, 'Nelson Havens --', 'Royal City', '', 'International', 'S-110', '1956', '0', 'Unrestored Original', 'yes', '1717549248.png', '2024-06-04 18:00:48', '0', NULL, 1),
(78, 'John Olsick --', 'Soap Lake', '5097711931', 'Chevrolet', 'Nova SS', '1971', '0', 'Street Rod', 'yes', '1717562095.png', '2024-06-04 21:34:55', '0', NULL, 1),
(79, 'John Olsick --', 'Soap Lake', '5097711931', 'Ford', 'Mustang race car', '', '0', 'Modified', 'yes', '1717562388.png', '2024-06-04 21:39:48', '0', NULL, 1),
(80, 'Oscar Garcia', 'Wenatchee, WA', '5092642485', 'Ford', 'Courier', '1980', '0', 'Modified', 'yes', '1717599268.png', '2024-06-05 07:54:28', '0', NULL, 1),
(83, 'Joe Aguilar ', 'Quincy', '', 'Nissan', 'Stagea', '1998', '3', 'Import', 'yes', '1717655121.png', '2024-06-05 23:25:21', '0', NULL, 1),
(82, 'Tina Bjerke --', 'Moses Lake', '5097611263', 'Chevy', 'SS Chevelle', '1970', '1', 'Under Construction', 'yes', '1717610640.png', '2024-06-05 11:04:00', '0', NULL, 1),
(84, 'Jason Billings ', 'Centralia ', '3605088643', 'GMC', 'Sierra ', '82', '0', 'Modified', 'yes', '1717704260.png', '2024-06-06 13:04:20', '0', NULL, 1),
(85, 'Daniel J McCarthy --', 'Moses Lake', '5097609720', 'Ford', 'Ranchero ', '1957', '0', '1950s', 'yes', '1717710868.png', '2024-06-06 14:54:28', '0', NULL, 1),
(86, 'David Rand', 'Spokane', '5096669464', 'Chevrolet', 'Master deluxe', '1938', '0', 'Street Rod', 'yes', '1717715674.png', '2024-06-06 16:14:34', '0', NULL, 1),
(91, 'Steve Poplin --', 'Soap Lake ', '5097717435', 'Chevrolet ', 'Nova', '1974', '0', 'Under Construction', 'yes', '1717771267.png', '2024-06-07 07:41:07', '0', NULL, 1),
(88, 'Paul scheller', 'Odessa', '5099880234', 'Chev', 'Corvette', '2002', '0', 'Modern -1990 and Up', 'yes', '1717747515.png', '2024-06-07 01:05:15', '0', NULL, 1),
(89, 'Michelle Y.', 'Moses lake ', '5093509699', 'Pontiac ', 'Trans am', '1999', '0', 'Modern -1990 and Up', 'yes', '1717758001.png', '2024-06-07 04:00:01', '0', NULL, 1),
(90, 'Michelle Y.', 'Moses lake ', '5093509699', 'Pontiac ', 'Trans am', '1999', '0', 'Modern -1990 and Up', 'yes', '1717758079.png', '2024-06-07 04:01:19', '0', NULL, 1),
(92, 'Lee bergstrom', 'Moses lake, wa. ', '5092378464', 'pontiac', 'GTO', '67', '0', 'Under Construction', 'yes', '1717776152.png', '2024-06-07 09:02:32', '0', NULL, 1),
(93, 'Lee bergstrom', 'Moses lake, wa. ', '5092378464', 'pontiac', 'GTO', '67', '0', 'Under Construction', 'yes', '1717776312.png', '2024-06-07 09:05:12', '0', NULL, 1),
(94, 'Shane Goetz', 'Ephrata Wa', '50902379459', 'Chevy', 'El camino ', '1967', '1', '1960s', 'yes', '1717779209.png', '2024-06-07 09:53:29', '0', NULL, 1),
(95, 'Corey Hendricks ', 'Soap lake', '5097701335', 'Victory ', 'Vegas', '03', '1', 'Motorcycle', 'yes', '1717780215.png', '2024-06-07 10:10:15', '0', NULL, 1),
(98, 'Chris Matthynssens', 'Ephrata', '5098856533', 'Gmc', 'RatRod', '54', '0', 'Rat Rod', 'yes', '1717791994.png', '2024-06-07 13:26:34', '0', NULL, 1),
(97, 'Michael & Steph Thompson --', 'Prosser', '5097814907', 'Chevrolet', 'RS SS Camaro', '1968', '1', '1960s', 'yes', '1717784701.png', '2024-06-07 11:25:01', '0', NULL, 1),
(99, 'Brandon Melvin', 'Moses Lake', '5097701560', 'Studebaker ', 'Early stock', '1929', '0', 'Modified', 'yes', '1717797875.png', '2024-06-07 15:04:35', '0', NULL, 1),
(100, 'Robert P Herron', '311 Main St. Box 102', '5097701213', 'Kawasaki', 'Zx14-R', '2015', '0', 'Motorcycle', 'yes', '1717798558.png', '2024-06-07 15:15:58', '0', NULL, 1),
(101, 'Jeri Hinen', 'Soap Lake', '5097701213', 'Pontiac', 'Catalina', '1961', '0', 'Select Category', 'yes', '1717798645.png', '2024-06-07 15:17:25', '0', NULL, 1),
(102, 'Jeri Hinen', 'Soap Lake', '5097701213', 'Pontiac', 'Catalina', '1961', '0', '1960s', 'yes', '1717798665.png', '2024-06-07 15:17:45', '0', NULL, 1),
(103, 'Robert Herron', 'Wilson Creek', '5097701213', 'Harley Davidson', 'XG500-R', '2016', '0', 'Motorcycle', 'yes', '1717798740.png', '2024-06-07 15:19:00', '0', NULL, 1),
(104, 'gregory link', '10968 ROAD E SW', '3605200244', 'ford ', 'mustang', '1990', '1', 'Unrestored Original', 'yes', '1717803838.png', '2024-06-07 16:43:58', '0', NULL, 1),
(105, 'Darin Capponi ', 'Ephrata ', '2533260222', 'Cadillac ', 'Elderado ', '1960', '0', '1960s', 'yes', '1717807973.png', '2024-06-07 17:52:53', '0', NULL, 1),
(106, 'Daryl kimble', 'Wilson creek', '5099899572', 'Volkswagen ', 'Bug ', '1969', '1', '1960s', 'yes', '1717817689.png', '2024-06-07 20:34:49', '0', NULL, 1),
(107, 'Ramiro Gutierrez', 'Warden', '5098553550', 'Plymouth', 'Roadrunner', '1972', '0', '1970s', 'yes', '1717817695.png', '2024-06-07 20:34:55', '0', NULL, 1),
(108, 'Jeff Cobb', 'Ephrata', '5093982801', 'Dodge', 'Charger', '1969', '0', 'Custom', 'yes', '1717817947.png', '2024-06-07 20:39:07', '0', NULL, 1),
(109, 'Callie Cobb', 'Ephrata', '5093982801', 'EZ Go', '36 Volt ', '2002', '0', 'Unrestored Original', 'yes', '1717818111.png', '2024-06-07 20:41:51', '0', NULL, 1),
(110, 'Jeff Cobb', 'Ephrata', '5093982801', 'Dodge ', 'Charger', '1969', '1', 'Modified', 'yes', '1717818287.png', '2024-06-07 20:44:47', '0', NULL, 1),
(111, 'Angel Loreto', 'Moses Lake', '5098556189', 'Buick', 'Regal', '1981', '0', 'Lowrider', 'yes', '1717823626.png', '2024-06-07 22:13:46', '0', NULL, 1),
(112, 'Ole Madrigales', 'Moses Lake', '', 'Cadillac', 'Fleetwood Hearse', '1989', '1', 'Lowrider', 'yes', '1717824932.png', '2024-06-07 22:35:32', '0', NULL, 1),
(113, 'Angel Madrigales', 'Moses Lake', '', 'Cadillac', 'Fleetwood Brougham', '1993', '0', 'Lowrider', 'yes', '1717825041.png', '2024-06-07 22:37:21', '0', NULL, 1),
(114, 'jeff isaak', 'moses lake', '5093503305', 'dodgge', '', '1917', '0', 'Rat Rod', 'yes', '1717854939.png', '2024-06-08 06:55:39', '0', NULL, 1),
(115, 'Charley Leach', 'Moses Lake', '', 'Ford', 'Torino GT', '1970', '0', '1970s', 'yes', '1717855483.png', '2024-06-08 07:04:43', '0', NULL, 1),
(116, 'Darrell Thomas', 'Moses Lake', '', '', '', '', '0', 'Street Rod', 'yes', '1717855828.png', '2024-06-08 07:10:28', '0', NULL, 1),
(117, 'Wade DIRK', 'Moses Lake', '', 'FORD', 't-bucket', '1923', '1', 'Street Rod', 'yes', '1717856107.png', '2024-06-08 07:15:07', '0', NULL, 1),
(118, 'Robert Palmen', 'Ephrata Wa', '', 'GMC', 'C15', '1970', '0', 'Under Construction', 'yes', '1717856764.png', '2024-06-08 07:26:04', '0', NULL, 1),
(119, 'Marv Scott', 'Moses Lake', '', 'Chevrolet ', 'Cameo Pickup', '1956', '1', 'Pickup', 'yes', '1717857054.png', '2024-06-08 07:30:54', '0', NULL, 1),
(120, 'Todd', 'Wilson Creek ', '5097701527', 'Husqvarna ', 'Cr250', '1974', '0', 'Motorcycle', 'yes', '1717857168.png', '2024-06-08 07:32:48', '0', NULL, 1),
(121, 'Todd', 'Wilson Creek ', '5097701527', 'Husqvarna ', 'Cr250', '1983', '0', 'Motorcycle', 'yes', '1717857222.png', '2024-06-08 07:33:42', '0', NULL, 1),
(122, 'Warren Strader', 'Moses Lake', '', 'Pontiac', 'Torpido', '1940', '2', '1950s', 'yes', '1717857600.png', '2024-06-08 07:40:00', '0', NULL, 1),
(123, 'tracy fitzhugh', 'Marysville', '4254462183', 'Ford', 'A', '1930', '1', 'Under Construction', 'yes', '1717857849.png', '2024-06-08 07:44:09', '0', NULL, 1),
(124, 'Larry', 'Springdale', '', 'Chevy', 'Camaro', '1969', '0', '1960s', 'yes', '1717857969.png', '2024-06-08 07:46:09', '0', NULL, 1),
(125, 'Karen Crook', 'Moses Lake', '', 'Geo Metro', 'Convertable', '1992', '0', 'Unrestored Original', 'yes', '1717858193.png', '2024-06-08 07:49:53', '0', NULL, 1),
(126, 'Gerald McClain', 'Moses Lake', '', 'Ford', 'Mustang Boss 302', '1970', '0', 'Unrestored Original', 'yes', '1717858507.png', '2024-06-08 07:55:07', '0', NULL, 1),
(127, 'Roger Holloway', 'Soap Lake', '', 'Chevy', 'Pickup', '1950', '1', 'Pickup', 'yes', '1717858651.png', '2024-06-08 07:57:31', '0', NULL, 1),
(128, 'Bob Kent', 'Moses Lake ', '', 'Chevrolet ', 'Pickup', '1941', '0', 'Modified', 'yes', '1717858690.png', '2024-06-08 07:58:10', '0', NULL, 1),
(129, 'Patrick', 'Moses Lake', '', 'Jeep', 'Cj5', '1972', '1', '1970s', 'yes', '1717858863.png', '2024-06-08 08:01:03', '0', NULL, 1),
(130, 'Eric Nielsen', 'Soap Lake', '', 'Chevy', 'El Camino', '1967', '0', '1960s', 'yes', '1717859101.png', '2024-06-08 08:05:01', '0', NULL, 1),
(131, 'Josh Gray', 'Stratford', '', 'Buick', 'Electra', '1962', '0', 'Unrestored Original', 'yes', '1717859372.png', '2024-06-08 08:09:32', '0', NULL, 1),
(132, 'Alex Gray', 'Moses Lake', '', 'Ford', 'Ranger', '1988-94', '0', 'Pickup', 'yes', '1717859607.png', '2024-06-08 08:13:27', '0', NULL, 1),
(133, 'Jason Jones', 'stanwood', '', 'Chevy', 'Pickup', '1954', '1', 'Pickup', 'yes', '1717859708.png', '2024-06-08 08:15:08', '0', NULL, 1),
(134, 'Bill Anderson', 'Moses Lake', '', 'Ford', 'Model A', '1930', '0', 'Street Rod', 'yes', '1717859779.png', '2024-06-08 08:16:19', '0', NULL, 1),
(135, 'Brian Nielson', 'Moses Lake', '', 'Chevrolet', 'El Camino', '1978', '0', 'Resto-Mod', 'yes', '1717859918.png', '2024-06-08 08:18:38', '0', NULL, 1),
(136, 'Pete Vezzoni', 'Moses Lake', '', 'Ford', 'F100', '1956', '0', 'Pickup', 'yes', '1717860080.png', '2024-06-08 08:21:20', '0', NULL, 1),
(137, 'Jake A', 'Ephrata', '', 'Dodge', 'Pickup', '1971', '0', 'Pickup', 'yes', '1717860216.png', '2024-06-08 08:23:36', '0', NULL, 1),
(138, 'Larry Hagadorn ', 'Soap Lake', '', 'Dodge', 'Challenger', '2016', '0', 'Modern -1990 and Up', 'yes', '1717860238.png', '2024-06-08 08:23:58', '0', NULL, 1),
(139, 'Kevin Ray', 'Soap Lake', '', 'Jeep', 'Willis', '1950', '4', 'Rat Rod', 'yes', '1717860394.png', '2024-06-08 08:26:34', '0', NULL, 1),
(140, 'Joel', 'Moses Lake', '', 'International', 'Pickup', '1936', '0', 'Rat Rod', 'yes', '1717860561.png', '2024-06-08 08:29:21', '0', NULL, 1),
(141, 'Patrick Lyons', 'Soap Lake', '', 'Chevy', 'Bel Air ', '1955 Convert.', '2', 'Unrestored Original', 'yes', '1717860612.png', '2024-06-08 08:30:12', '0', NULL, 1),
(142, 'Cheri', 'Harrington', '', 'Ford', 'F100', '1954', '2', 'Pickup', 'yes', '1717860822.png', '2024-06-08 08:33:42', '0', NULL, 1),
(143, 'Jeff Kreider', 'Coulee City', '', 'Ford', 'Fast Back Mustang', '1967', '0', 'Resto-Mod', 'yes', '1717860825.png', '2024-06-08 08:33:45', '0', NULL, 1),
(144, 'Dennis Jackson', 'Moses Lake', '', 'Chevy', 'Cameo Pickup', '1955', '0', 'Pickup', 'yes', '1717860938.png', '2024-06-08 08:35:38', '0', NULL, 1),
(145, 'Ron Williams', 'Moses Lake', '', 'Ford', '5 Window Coop', '1934', '0', 'Street Rod', 'yes', '1717861084.png', '2024-06-08 08:38:04', '0', NULL, 1),
(146, 'Steve McCaffree', 'Moses Lake', '', 'Chevy', 'Chevelle', '1966', '0', 'Resto-Mod', 'yes', '1717861229.png', '2024-06-08 08:40:29', '0', NULL, 1),
(147, 'Virgil Redwine', 'Moses Lake', '', 'Ford', 'Cabster', '1933', '1', 'Street Rod', 'yes', '1717861306.png', '2024-06-08 08:41:46', '0', NULL, 1),
(148, 'Robert Sauer', 'Rathdrum', '', 'Chevrolet', 'Chevelle SS', '1966', '0', '1960s', 'yes', '1717861455.png', '2024-06-08 08:44:15', '0', NULL, 1),
(149, 'Curtis Gay', 'Moses Lake', '', 'VW', 'GTI', '1998', '0', 'Import', 'yes', '1717861475.png', '2024-06-08 08:44:35', '0', NULL, 1),
(150, 'Morgan', 'Moses Lake', '', 'Chevy', 'Corvette', '2008', '3', 'Modern -1990 and Up', 'yes', '1717861576.png', '2024-06-08 08:46:16', '0', NULL, 1),
(151, 'Myrl', 'Odessa', '', 'Dodge', 'Pickup', '1934', '0', 'Pickup', 'yes', '1717861766.png', '2024-06-08 08:49:26', '0', NULL, 1),
(152, 'Kay Holmstrom', 'Wilbur', '', 'FORD', 'Custom Line', '1953', '0', '1950s', 'yes', '1717861819.png', '2024-06-08 08:50:19', '0', NULL, 1),
(153, 'Daniel', 'Othello', '', 'Chevy', 'Camaro Iroc', '1987', '0', 'Unrestored Original', 'yes', '1717861890.png', '2024-06-08 08:51:30', '0', NULL, 1),
(154, 'Norman Ott', 'Odessa', '', 'Kia', 'EV6', '2023', '0', 'Modern -1990 and Up', 'yes', '1717862075.png', '2024-06-08 08:54:35', '0', NULL, 1),
(155, 'Midnight Wolf', 'Moses Lake', '', 'Dodge', 'Challenger SRT8', '2009', '0', 'Modern -1990 and Up', 'yes', '1717862335.png', '2024-06-08 08:58:55', '0', NULL, 1),
(156, 'Wayne Hubbs', 'Soap Lake', '', 'Chevy', 'Pickup', '!984', '0', 'Unrestored Original', 'yes', '1717862533.png', '2024-06-08 09:02:13', '0', NULL, 1),
(157, 'Mike Lamotte', 'Omak', '', 'Ford', 'Sedan', '1939', '0', 'Resto-Mod', 'yes', '1717862582.png', '2024-06-08 09:03:02', '0', NULL, 1),
(158, 'Susan Odorizzi', 'Wilson Creek', '', 'Ford', 'Pickup Splash', '1993', '0', 'Unrestored Original', 'yes', '1717862826.png', '2024-06-08 09:07:06', '0', NULL, 1),
(159, 'Chuck Stone', 'Coulee City', '', 'Chevy', 'El Camino', '1967', '0', '1960s', 'yes', '1717862907.png', '2024-06-08 09:08:27', '0', NULL, 1),
(160, 'Bruce Mercer', 'Woodenville', '', 'Chevy', 'Camaro RS/SS', '1968', '1', 'Resto-Mod', 'yes', '1717863084.png', '2024-06-08 09:11:24', '0', NULL, 1),
(161, 'Bob buchmann', 'Moses Lake', '', 'Chevy', 'Chevelle', '1969', '1', '1960s', 'yes', '1717863088.png', '2024-06-08 09:11:28', '0', NULL, 1),
(162, 'Manuel Perez', 'Soap Lake', '', 'Volkswagon', 'GTI', '2003', '0', 'Import', 'yes', '1717863263.png', '2024-06-08 09:14:23', '0', NULL, 1),
(163, 'Brian Strausbaugh', 'East Wenatchee', '', 'Cadillac', 'Coupe De Ville', '1967', '0', 'Unrestored Original', 'yes', '1717863524.png', '2024-06-08 09:18:44', '0', NULL, 1),
(164, 'Larry Camden', 'Moses Lake', '', 'Ford', 'roadster', '1928', '0', 'Street Rod', 'yes', '1717863552.png', '2024-06-08 09:19:12', '0', NULL, 1),
(165, 'Weezer Dittman', 'Moses Lake', '', 'Chevy', 'Pickup', '1939', '0', 'Rat Rod', 'yes', '1717863709.png', '2024-06-08 09:21:49', '0', NULL, 1),
(166, 'Robert Coble', 'Ephrata', '', 'Chevy', 'Special', '1940', '0', 'Street Rod', 'yes', '1717863770.png', '2024-06-08 09:22:50', '0', NULL, 1),
(167, 'Bill Schmierer', 'Odessa', '', 'Studebaker', 'Lark', '1962', '0', '1960s', 'yes', '1717864081.png', '2024-06-08 09:28:01', '0', NULL, 1),
(168, 'Dennis Bishop', 'Omak', '', 'Ford', 'Pickup', '1935', '0', 'Rat Rod', 'yes', '1717864087.png', '2024-06-08 09:28:07', '0', NULL, 1),
(169, 'Mike Janke', 'Davenport', '', 'Chevy', 'Pickup', '1940', '0', 'Pickup', 'yes', '1717864294.png', '2024-06-08 09:31:34', '0', NULL, 1),
(170, 'Denis Tjoelker', 'Quincy', '', 'international ', 'Kb1', '1938', '1', 'Rat Rod', 'yes', '1717864377.png', '2024-06-08 09:32:57', '0', NULL, 1),
(171, 'Max Herreid', 'Wilson Creek', '', 'Chevy', 'Bel Air', '1958', '0', '1950s', 'yes', '1717864447.png', '2024-06-08 09:34:07', '0', NULL, 1),
(172, 'Randy Strawn', 'Waterville', '', 'Buick', 'Riviera', '1983', '0', 'Unrestored Original', 'yes', '1717864610.png', '2024-06-08 09:36:50', '0', NULL, 1),
(173, 'Jack ', '', '', '', '', '', '0', 'Select Category', 'yes', '1717864694.png', '2024-06-08 09:38:14', '0', NULL, 1),
(174, 'Ray Mayo', 'Moses Lake', '', 'ford', 'fairlane 500', '1965', '0', '1960s', 'yes', '1717864763.png', '2024-06-08 09:39:23', '0', NULL, 1),
(175, 'kirby waller', 'East wenatchee', '', 'chevy', '2 can', '1957', '1', '1950s', 'yes', '1717864857.png', '2024-06-08 09:40:57', '0', NULL, 1),
(176, 'Jack Livingston', 'Ephrata', '', 'Ford', 'Mustang', '1965', '0', 'Unrestored Original', 'yes', '1717864991.png', '2024-06-08 09:43:11', '0', NULL, 1),
(177, 'Matt Johnson', 'Moses lake', '5097509895', 'Chevy', 'Styleline DeLuxe', '1951', '2', 'Custom', 'yes', '1717865124.png', '2024-06-08 09:45:24', '0', NULL, 1),
(178, 'Jerry Heller', 'Ellensberg', '', 'Ford', 'Galaxy 500', '1965', '3', 'Unrestored Original', 'yes', '1717865250.png', '2024-06-08 09:47:30', '0', NULL, 1),
(179, 'Ken Hunt', 'Soap Lake', '', 'Cadillac', 'Coupe De Ville', '1977', '0', 'Unrestored Original', 'yes', '1717865846.png', '2024-06-08 09:57:26', '0', NULL, 1),
(180, 'Noland Dominguez', 'Moses Lake', '', 'Chevy', 'Monte Carlo', '1975', '0', 'Lowrider', 'yes', '1717866203.png', '2024-06-08 10:03:23', '0', NULL, 1),
(181, 'Kevin Hallowell', 'Waterville', '', 'Chevrolet', 'S-10', '1991', '0', 'Pickup', 'yes', '1717866586.png', '2024-06-08 10:09:46', '0', NULL, 1),
(182, 'ruth lockhart', 'burbank', '', 'Chevy', 'malibu', '1966', '2', 'Resto-Mod', 'yes', '1717866761.png', '2024-06-08 10:12:41', '0', NULL, 1),
(183, 'doyce lockhart', 'burbank', '', 'ford', 'coup', '1935', '5', 'Street Rod', 'yes', '1717866891.png', '2024-06-08 10:14:51', '0', NULL, 1),
(184, 'Lisa Roberts', 'Coulee City', '', 'Harley Davidson', 'Softale', '2016', '0', 'Motorcycle', 'yes', '1717867237.png', '2024-06-08 10:20:37', '0', NULL, 1),
(185, 'Jim De', 'Plain', '', 'Buick', 'Gransport', '1967', '1', 'Modified', 'yes', '1717867691.png', '2024-06-08 10:28:11', '0', NULL, 1),
(186, 'Tessa Schuyleman', 'grant coulee', '', 'ford', 'pickup', '1965', '0', 'Pickup', 'yes', '1717868015.png', '2024-06-08 10:33:35', '0', NULL, 1),
(187, 'Vaughn Morgan', 'Plain', '', 'Mercury', 'Custom Metalist', '1955', '0', 'Modified', 'yes', '1717868030.png', '2024-06-08 10:33:50', '0', NULL, 1),
(188, 'Geovanni Deleon', 'Moses Lake', '', 'Cadillac', 'Fleetwood', '1996', '1', 'Lowrider', 'yes', '1717868228.png', '2024-06-08 10:37:08', '0', NULL, 1),
(189, 'Markus Madrigales', 'Moses Lake', '', 'Lexus', 'GS', '2000', '0', 'Import', 'yes', '1717868490.png', '2024-06-08 10:41:30', '0', NULL, 1),
(190, 'Ole Madrigales', 'Moses Lake', '', 'Cadillac', 'Fleetwood Brougham', '1993', '0', 'Lowrider', 'yes', '1717868799.png', '2024-06-08 10:46:39', '0', NULL, 1),
(191, 'mike roderick', 'Moses Lake', '', 'ford', 'Hi-boy', '1931', '2', 'Under Construction', 'yes', '1717868930.png', '2024-06-08 10:48:50', '0', NULL, 1),
(192, 'Ureal Basteda', 'Ephrata', '', 'Dotson', '280Z', '!977', '0', 'Import', 'yes', '1717869106.png', '2024-06-08 10:51:46', '0', NULL, 1),
(193, 'Michael Earing ', 'East weatchee ', '', 'ford ', 'galaxy ', '1966', '1', '1960s', 'yes', '1717869621.png', '2024-06-08 11:00:21', '0', NULL, 1),
(194, 'George', 'Crescent Bar', '', 'Chevy', 'Pickup', '1972', '0', '1970s', 'yes', '1717869625.png', '2024-06-08 11:00:25', '0', NULL, 1),
(195, 'Joe Thornton', 'Othello', '', 'ford ', 'cabriolet', '1932', '0', 'Custom', 'yes', '1717870376.png', '2024-06-08 11:12:56', '0', NULL, 1),
(200, 'rakib', 'dk', '', 'dkdk', 'kd', 'kdkd', '0', '1960s', 'yes', '1729833792.png', '2024-10-25 07:23:12', '0', NULL, 1),
(197, 'dd', 'ss', '', 'dd', 'see', 'ss', '0', 'Pickup', 'yes', '1729703444.png', '2024-10-23 19:10:44', '0', NULL, 1),
(198, '', '', '', '', '', '', '0', 'Select Category', 'yes', '1729760176.png', '2024-10-24 10:56:16', '0', NULL, 1),
(201, 'kkd', 'asad', '', 'dkdk', 'dddd', 'dddd', '0', '1950s', 'yes', '1729836945.png', '2024-10-25 08:15:45', '3', '1729836945.png', 1),
(202, 'all', 'all', '', 'll', 'lll', '2050', '0', 'new Cat', 'yes', '1729871223.png', '2024-10-25 17:47:03', '0', '1729871223.png', 1),
(203, 'kdkd', 'dkd', '', 'dkd', 'kd', '2051', '0', 'Pickup', 'yes', '1729871337.png', '2024-10-25 17:48:57', '0', '1729871337.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vote`
--

CREATE TABLE `vote` (
  `id` int(11) NOT NULL,
  `vehicle_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vote`
--

INSERT INTO `vote` (`id`, `vehicle_id`, `password`) VALUES
(1, '4', 'ddddd'),
(2, '4', '9581'),
(3, '4', 'd18a'),
(4, '4', '04a5'),
(5, '4', '8c5b'),
(6, '4', '4sdf'),
(7, '4', 'sdfsdf'),
(8, '4', 'aaaa'),
(9, '6', 'e715'),
(10, '7', '0af2'),
(11, '7', '0af2'),
(12, '7', '0af2'),
(13, '4', 'e831'),
(14, '9', 'vote040716'),
(15, '11', 'vote020737'),
(16, '12', 'vote551431'),
(17, '11', 'vote551431'),
(18, '10', 'vote551431'),
(19, '12', 'vote040716'),
(20, '16', 'vote551431'),
(21, '17', 'vote131224'),
(22, '17', 'vote131224'),
(23, '17', 'vote131224'),
(24, '17', 'vote131224'),
(25, '17', 'vote131224'),
(26, '22', 'vote131224'),
(27, '22', 'vote551431'),
(28, '1', 'vote020737'),
(29, '1', 'vote2024'),
(30, '1', 'vote2024'),
(31, '5', 'vote2024'),
(32, '6', 'vote2024'),
(33, '7', 'vote2024'),
(34, '1', 'vote341422'),
(35, '1', 'vote341422'),
(36, '1', 'vote2024'),
(37, '1', 'vote2024'),
(38, '183', 'vote2024'),
(39, '183', 'vote2024'),
(40, '5', 'vote2024'),
(41, '94', 'vote2024'),
(42, '129', 'vote2024'),
(43, '104', 'vote2024'),
(44, '29', 'vote2024'),
(45, '177', 'vote2024'),
(46, '119', 'vote2024'),
(47, '183', 'vote2024'),
(48, '83', 'vote2024'),
(49, '95', 'vote2024'),
(50, '139', 'vote2024'),
(51, '44', 'vote2024'),
(52, '122', 'vote2024'),
(53, '161', 'vote2024'),
(54, '20', 'vote2024'),
(55, '178', 'vote2024'),
(56, '182', 'vote2024'),
(57, '142', 'vote2024'),
(58, '183', 'vote2024'),
(59, '83', 'vote2024'),
(60, '170', 'vote2024'),
(61, '82', 'vote2024'),
(62, '150', 'vote2024'),
(63, '122', 'vote2024'),
(64, '106', 'vote2024'),
(65, '20', 'vote2024'),
(66, '110', 'vote2024'),
(67, '141', 'vote2024'),
(68, '160', 'vote2024'),
(69, '22', 'vote2024'),
(70, '127', 'vote2024'),
(71, '117', 'vote2024'),
(72, '61', 'vote2024'),
(73, '34', 'vote2024'),
(74, '139', 'vote2024'),
(75, '191', 'vote2024'),
(76, '112', 'vote2024'),
(77, '150', 'vote2024'),
(78, '175', 'vote2024'),
(79, '193', 'vote2024'),
(80, '20', 'vote2024'),
(81, '185', 'vote2024'),
(82, '178', 'vote2024'),
(83, '178', 'vote2024'),
(84, '29', 'vote2024'),
(85, '22', 'vote2024'),
(86, '142', 'vote2024'),
(87, '183', 'vote2024'),
(88, '61', 'vote2024'),
(89, '34', 'vote2024'),
(90, '139', 'vote2024'),
(91, '123', 'vote2024'),
(92, '44', 'vote2024'),
(93, '150', 'vote2024'),
(94, '5', 'Vote2024'),
(95, '188', 'vote2024'),
(96, '191', 'vote2024'),
(97, '97', 'Vote2024'),
(98, '139', 'vote2024'),
(99, '20', 'Vote2024'),
(100, '34', 'vote2024'),
(101, '141', 'Vote2024'),
(102, '83', 'vote2024'),
(103, '182', 'Vote2024'),
(104, '147', 'vote2024'),
(105, '177', 'Vote2024'),
(106, '133', 'vote2024');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_accounts`
--
ALTER TABLE `admin_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_generator`
--
ALTER TABLE `password_generator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_used`
--
ALTER TABLE `password_used`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vote`
--
ALTER TABLE `vote`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_accounts`
--
ALTER TABLE `admin_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `password_generator`
--
ALTER TABLE `password_generator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `password_used`
--
ALTER TABLE `password_used`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `vote`
--
ALTER TABLE `vote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
