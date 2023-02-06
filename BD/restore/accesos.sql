-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 01-02-2023 a las 15:58:16
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
-- Estructura de tabla para la tabla `accesos`
--

CREATE TABLE `accesos` (
  `gac_id` bigint NOT NULL,
  `gac_gus_id` bigint NOT NULL,
  `gac_gcl_id` bigint NOT NULL,
  `gac_use` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `accesos`
--

INSERT INTO `accesos` (`gac_id`, `gac_gus_id`, `gac_gcl_id`, `gac_use`) VALUES
(1, 1, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD PRIMARY KEY (`gac_id`),
  ADD KEY `accesos_usuarios` (`gac_gus_id`),
  ADD KEY `accesos_clientes` (`gac_gcl_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accesos`
--
ALTER TABLE `accesos`
  MODIFY `gac_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD CONSTRAINT `accesos_clientes` FOREIGN KEY (`gac_gcl_id`) REFERENCES `clientes` (`gcl_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `accesos_usuarios` FOREIGN KEY (`gac_gus_id`) REFERENCES `usuarios` (`gus_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
