-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 01-02-2023 a las 15:24:53
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
-- Base de datos: `company5_bd_20602849172`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `mov_id` bigint NOT NULL,
  `mov_age_id` bigint DEFAULT NULL,
  `mov_alm_id` bigint NOT NULL,
  `mov_serie` varchar(20) NOT NULL,
  `mov_numero` bigint NOT NULL,
  `mov_t12num` bigint NOT NULL,
  `mov_gt4_id` bigint NOT NULL,
  `mov_t12_id` bigint NOT NULL,
  `mov_t10_id` bigint NOT NULL,
  `mov_tce_id` bigint NOT NULL,
  `mov_cue_id` bigint DEFAULT NULL,
  `mov_fechaE` date NOT NULL,
  `mov_fechaR` date NOT NULL,
  `mov_fechaV` date DEFAULT NULL,
  `mov_tipo` int NOT NULL,
  `mov_subtotal` decimal(24,12) NOT NULL,
  `mov_igv_id` json NOT NULL,
  `mov_total` decimal(24,12) NOT NULL,
  `mov_ncr_id` json DEFAULT NULL,
  `mov_observaciones` text,
  `mov_gus_id` bigint DEFAULT NULL,
  `mov_mov_id` bigint DEFAULT NULL,
  `mov_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mov_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mov_mstatus` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`mov_id`, `mov_age_id`, `mov_alm_id`, `mov_serie`, `mov_numero`, `mov_t12num`, `mov_gt4_id`, `mov_t12_id`, `mov_t10_id`, `mov_tce_id`, `mov_cue_id`, `mov_fechaE`, `mov_fechaR`, `mov_fechaV`, `mov_tipo`, `mov_subtotal`, `mov_igv_id`, `mov_total`, `mov_ncr_id`, `mov_observaciones`, `mov_gus_id`, `mov_mov_id`, `mov_created`, `mov_updated`, `mov_mstatus`) VALUES
(193, NULL, 1, 'SI01', 1, 1, 1, 16, 1, 1, NULL, '2022-10-04', '2022-10-04', '2022-10-04', 2, '1167673.800000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"1167673.80\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"1167673.80\"}', '1167673.800000000000', NULL, NULL, 1, NULL, '2022-10-04 08:36:52', '2022-10-04 08:36:52', 1),
(395, NULL, 1, 'SI01', 1, 1, 1, 16, 1, 1, NULL, '2022-11-01', '2022-11-01', '2022-11-01', 2, '3086764.670000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"3086764.66\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"3086764.67\"}', '3086764.670000000000', NULL, NULL, 1, NULL, '2022-11-05 13:30:55', '2022-11-05 13:30:55', 1),
(541, NULL, 1, 'NS01', 4, 1, 1, 18, 1, 1, NULL, '2022-11-30', '2022-12-01', '2022-12-01', 1, '113.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"113.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"113.00\"}', '113.000000000000', NULL, NULL, 1, NULL, '2022-12-01 09:43:25', '2022-12-01 09:43:25', 1),
(542, NULL, 1, 'NS01', 4, 2, 1, 18, 1, 1, NULL, '2022-11-30', '2022-12-01', '2022-12-01', 2, '113.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"113.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"113.00\"}', '113.000000000000', NULL, NULL, 1, NULL, '2022-12-01 09:43:25', '2022-12-01 09:43:25', 1),
(543, NULL, 1, 'TI01', 5, 4, 1, 18, 1, 1, NULL, '2022-11-30', '2022-11-30', '2022-11-30', 1, '13.110000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"13.11\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"13.11\"}', '13.110000000000', NULL, NULL, 1, NULL, '2022-12-01 09:53:22', '2022-12-01 09:53:22', 1),
(544, NULL, 1, 'TI01', 5, 5, 1, 18, 1, 1, NULL, '2022-11-30', '2022-11-30', '2022-11-30', 2, '13.110000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"13.11\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"13.11\"}', '13.110000000000', NULL, NULL, 1, NULL, '2022-12-01 09:53:22', '2022-12-01 09:53:22', 1),
(587, NULL, 1, 'SI01', 1, 1, 1, 16, 1, 1, NULL, '2022-12-01', '2022-12-01', '2022-12-01', 2, '2747339.490000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"2747339.49\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"2747339.49\"}', '2747339.490000000000', NULL, NULL, 1, NULL, '2022-12-02 15:52:38', '2022-12-02 15:52:38', 1),
(663, 129, 1, 'NE01', 172, 50, 1, 2, 49, 1, NULL, '2022-12-18', '2022-12-18', '2022-12-18', 2, '96800.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"96800.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"96800.00\"}', '96800.000000000000', NULL, NULL, 1, NULL, '2022-12-19 10:42:50', '2022-12-19 10:42:50', 1),
(762, NULL, 1, 'SI01', 1, 1, 1, 16, 1, 1, NULL, '2023-01-01', '2023-01-01', '2023-01-01', 2, '2777122.580000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"2777122.57\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"2777122.58\"}', '2777122.580000000000', NULL, NULL, 1, NULL, '2023-01-02 17:28:19', '2023-01-02 17:28:19', 1);
SELECT * FROM `mdetalles` WHERE `mde_mov_id` in (193,395,541,542,543,544,587,663,762);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`mov_id`),
  ADD KEY `movimientos_agentes` (`mov_age_id`),
  ADD KEY `movimientos_almacenes` (`mov_alm_id`),
  ADD KEY `movimientos_t12operaciones` (`mov_t12_id`),
  ADD KEY `movimientos_tcespeciales` (`mov_tce_id`),
  ADD KEY `movimientos_t10comprobantes` (`mov_t10_id`),
  ADD KEY `movimientos_gt4monedas` (`mov_gt4_id`),
  ADD KEY `movimientos_gusuarios` (`mov_gus_id`),
  ADD KEY `movimientos_cuentas` (`mov_cue_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `mov_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=951;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_agentes` FOREIGN KEY (`mov_age_id`) REFERENCES `agentes` (`age_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_almacenes` FOREIGN KEY (`mov_alm_id`) REFERENCES `almacenes` (`alm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_cuentas` FOREIGN KEY (`mov_cue_id`) REFERENCES `cuentas` (`cue_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_gt4monedas` FOREIGN KEY (`mov_gt4_id`) REFERENCES `company5_bd_cacel`.`t4monedas` (`gt4_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_gusuarios` FOREIGN KEY (`mov_gus_id`) REFERENCES `company5_bd_cacel`.`usuarios` (`gus_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_t10comprobantes` FOREIGN KEY (`mov_t10_id`) REFERENCES `t10comprobantes` (`t10_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_t12operaciones` FOREIGN KEY (`mov_t12_id`) REFERENCES `t12operaciones` (`t12_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_tcespeciales` FOREIGN KEY (`mov_tce_id`) REFERENCES `tcespeciales` (`tce_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
