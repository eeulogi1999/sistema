-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 01-02-2023 a las 15:59:42
-- Versión del servidor: 8.0.30
-- Versión de PHP: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `company5_bd_cacel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpermisos`
--

CREATE TABLE `tpermisos` (
  `gtp_id` bigint NOT NULL,
  `gtp_r` int NOT NULL DEFAULT '1',
  `gtp_w` int NOT NULL DEFAULT '1',
  `gtp_u` int NOT NULL DEFAULT '1',
  `gtp_d` int NOT NULL DEFAULT '1',
  `gtp_gro_id` bigint NOT NULL,
  `gtp_gmo_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tpermisos`
--

INSERT INTO `tpermisos` (`gtp_id`, `gtp_r`, `gtp_w`, `gtp_u`, `gtp_d`, `gtp_gro_id`, `gtp_gmo_id`) VALUES
(1, 1, 1, 1, 1, 1, 1),
(2, 1, 1, 1, 1, 1, 2),
(3, 1, 1, 1, 1, 1, 3),
(4, 1, 1, 1, 1, 1, 4),
(5, 1, 1, 1, 1, 1, 5),
(6, 1, 1, 1, 1, 1, 6),
(7, 1, 1, 1, 1, 1, 7),
(8, 1, 1, 1, 1, 1, 8),
(9, 1, 1, 1, 1, 1, 9),
(10, 1, 1, 1, 1, 1, 10),
(11, 1, 1, 1, 1, 1, 11),
(12, 1, 1, 1, 1, 1, 12),
(13, 1, 1, 1, 1, 1, 13),
(14, 1, 1, 1, 1, 1, 14),
(15, 1, 1, 1, 1, 1, 15),
(16, 1, 1, 1, 1, 1, 16),
(17, 1, 1, 1, 1, 1, 17),
(18, 1, 1, 1, 1, 1, 18),
(19, 1, 1, 1, 1, 1, 19),
(20, 1, 1, 1, 1, 1, 20),
(21, 1, 1, 1, 1, 1, 21),
(22, 1, 1, 1, 1, 1, 22),
(23, 1, 1, 1, 1, 1, 23),
(24, 1, 1, 1, 1, 1, 24),
(25, 1, 1, 1, 1, 1, 25),
(26, 1, 1, 1, 1, 1, 26),
(27, 1, 1, 1, 1, 1, 27),
(28, 1, 1, 1, 1, 1, 28),
(29, 1, 1, 1, 1, 1, 29),
(30, 1, 1, 1, 1, 1, 30),
(31, 1, 1, 1, 1, 1, 31),
(32, 1, 1, 1, 1, 1, 32),
(33, 1, 1, 1, 1, 1, 33),
(34, 1, 1, 1, 1, 1, 34),
(35, 1, 1, 1, 1, 1, 35),
(36, 1, 1, 1, 1, 1, 36),
(37, 1, 1, 1, 1, 1, 37),
(38, 1, 1, 1, 1, 1, 38),
(39, 1, 1, 1, 1, 1, 39),
(40, 1, 1, 1, 1, 1, 40),
(41, 1, 1, 1, 1, 1, 41),
(42, 1, 1, 1, 1, 1, 42),
(43, 1, 1, 1, 1, 1, 43),
(44, 1, 1, 1, 1, 1, 44),
(45, 1, 1, 1, 1, 1, 45),
(46, 1, 1, 1, 1, 1, 46),
(47, 1, 1, 1, 1, 1, 47),
(48, 1, 1, 1, 1, 1, 48),
(49, 1, 1, 1, 1, 1, 49),
(50, 1, 1, 1, 1, 1, 50),
(51, 1, 1, 1, 1, 1, 51),
(256, 1, 1, 1, 1, 1, 52),
(261, 1, 1, 1, 1, 1, 53),
(317, 1, 1, 1, 1, 1, 54),
(323, 1, 1, 1, 1, 1, 55),
(324, 1, 1, 1, 1, 1, 56);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tpermisos`
--
ALTER TABLE `tpermisos`
  ADD PRIMARY KEY (`gtp_id`),
  ADD KEY `tpermisos_roles` (`gtp_gro_id`),
  ADD KEY `tpermisos_modulos` (`gtp_gmo_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tpermisos`
--
ALTER TABLE `tpermisos`
  MODIFY `gtp_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=333;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tpermisos`
--
ALTER TABLE `tpermisos`
  ADD CONSTRAINT `tpermisos_modulos` FOREIGN KEY (`gtp_gmo_id`) REFERENCES `modulos` (`gmo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tpermisos_roles` FOREIGN KEY (`gtp_gro_id`) REFERENCES `roles` (`gro_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
