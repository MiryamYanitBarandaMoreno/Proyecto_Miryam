-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-04-2024 a las 02:30:52
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `onepiece`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dbchapters`
--

CREATE TABLE `dbchapters` (
  `id` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Intro_Chapter` int(11) DEFAULT NULL,
  `Intro_Episode` int(11) DEFAULT NULL,
  `Intro_Year` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 1,
  `Note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dbchapters`
--

INSERT INTO `dbchapters` (`id`, `Name`, `Intro_Chapter`, `Intro_Episode`, `Intro_Year`, `is_active`, `Note`) VALUES
(1, 'A O', 551, 460, 2009, 1, 'His name was revealed in the Green databook.'),
(2, 'Abdullah', 704, 632, 2013, 1, ''),
(3, 'Absalom', 444, 339, 2007, 1, ''),
(4, 'Acilia', 706, 652, 2013, 1, ''),
(5, 'Adele', 608, 527, 2010, 1, 'Her name was revealed in the Blue Deep databook.'),
(6, 'Aggie 68', 552, 461, 2009, 1, 'His name was revealed in One Piece Magazine Vol.2.'),
(7, 'Agotogi', 163, 100, 2001, 1, 'His name was revealed in the Blue databook.'),
(8, 'Agsilly', 570, 482, 2010, 1, 'His name was revealed in the Green databook.'),
(9, 'Agyo', 706, 652, 2013, 1, 'His name was revealed in Chapter 733.'),
(10, 'Ahho Desunen IX', 587, 501, 2010, 1, 'His name was revealed in the Blue Deep databook.'),
(11, 'Ahho Zurako', 587, 501, 2010, 1, 'Her name was revealed in the Blue Deep databook.'),
(12, 'Ahiru', 905, 883, 2018, 1, 'Her name was revealed in SBS Volume 93.'),
(13, 'Babanuki', 934, 930, 2019, 1, 'His name was revealed in Chapter 935.'),
(14, 'Babe', 160, 103, 2000, 1, 'He was first mentioned by Nefertari Vivi in Chapter 155 as his alias \"Mr. 4\". His real name was revealed in Vivre Card'),
(15, 'Baby 5', 682, 608, 2012, 1, ''),
(16, 'Bacura', 516, 409, 2008, 1, 'Her name was revealed by a Kuja in Chapter 518.'),
(17, 'Baggaley', 561, 489, 2009, 1, 'His name was revealed in the Green databook.'),
(18, 'Bakezo', 668, 594, 2012, 1, 'He was named in his anime concept art.'),
(19, 'Ban Dedessinée', 823, 777, 2016, 1, 'Her name was revealed in the captions of Episode 889.'),
(20, 'Banchi', 114, 67, 1999, 1, ''),
(21, 'Banchina', 41, 17, 1998, 1, 'Her name was revealed in the Blue databook.'),
(22, 'Bankuro', 966, 959, 2020, 1, 'His name was revealed in SBS Volume 96.'),
(23, 'Banshee', 552, 461, 2009, 1, 'Her name was revealed in One Piece Magazine Vol.2.'),
(24, 'Banzaburo', 960, 960, 2019, 1, 'His name was revealed in SBS Volume 98.'),
(25, 'Camie', 195, 385, 2001, 1, 'She was formally introduced in Chapter 490.'),
(26, 'Camel', 695, 621, 2013, 1, 'Its name was revealed in SBS Volume 70.'),
(27, 'Cancer', 96, 45, 1999, 1, 'His name was revealed in the Blue Deep databook.'),
(28, 'Candre', 557, 466, 2009, 1, 'His name was revealed in SBS Volume 70.'),
(29, 'Cands', 569, NULL, 2010, 1, 'His name was revealed in the Green databook.'),
(30, 'Candy', 510, NULL, 2010, 1, 'His name was revealed in Vivre Card.'),
(31, 'Capone Bege', 498, 392, 2008, 1, ''),
(32, 'Capone Pez', 834, 795, 2016, 1, ''),
(33, 'Capote', 306, 209, 2004, 1, ''),
(34, 'Caribou', 600, 519, 2010, 1, 'He was first mentioned by Demaro Black in Chapter 598.'),
(35, 'Carmel', 866, 836, 2017, 1, 'Her name was first mentioned by Capone Bege in Chapter 859. She was first seen via a photograph in Chapter 861.'),
(36, 'Carne', 45, 21, 1998, 1, 'His name was revealed in Chapter 53.'),
(37, 'Carrot', 804, 753, 2015, 1, ''),
(38, 'Catacombo', 602, 522, 2010, 1, 'His name was revealed in the Blue Deep databook.'),
(39, 'Catarina Devon', 575, 484, 2010, 1, 'She was first mentioned by Emporio Ivankov in Chapter 538.'),
(40, 'Cavendish', 704, 632, 2013, 1, ''),
(41, 'CB Gallant', 966, 959, 2020, 1, 'His name was revealed in SBS Volume 96.'),
(42, 'Cerberus', 444, 339, 2007, 1, ''),
(43, 'Cezar', 823, 777, 2016, 1, 'His name was revealed in Vivre Card.'),
(44, 'Chabo', 69, 31, 1999, 1, 'His name was revealed in Chapter 70.'),
(45, 'Chadros Higelyges', 581, 490, 2010, 1, 'His real name was revealed in Vivre Card.'),
(46, 'Chaka', 155, 91, 2000, 1, 'His name was revealed in Chapter 167.'),
(47, 'Chao', 738, 671, 2014, 1, 'His name was revealed by another dwarf in Chapter 755.'),
(48, 'Chap', 823, 777, 2016, 1, 'His name was revealed in Vivre Card.'),
(49, 'Chappe', 668, 593, 2012, 1, ''),
(50, 'Charlos', 499, 393, 2008, 1, ''),
(51, 'Charlotte Akimeg', 894, 869, 2018, 1, 'Her name was revealed in One Piece Magazine Vol.4.'),
(52, 'Charlotte Allmeg', 894, 869, 2018, 1, 'Her name was revealed in One Piece Magazine Vol.4.'),
(53, 'Charlotte Amande', 827, 786, 2016, 1, 'Her name was revealed in Chapter 845.'),
(54, 'Emelyn', 2000, 2555, 2023, 0, NULL),
(55, 'Mandarina', 2000, 2555, 2023, 0, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `dbchapters`
--
ALTER TABLE `dbchapters`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `dbchapters`
--
ALTER TABLE `dbchapters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
