-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 01-02-2023 a las 16:01:44
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
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `caj_id` bigint NOT NULL,
  `caj_tipo` int NOT NULL,
  `caj_numero` bigint NOT NULL,
  `caj_tga_id` bigint DEFAULT NULL,
  `caj_responsable` text,
  `caj_fecha` date NOT NULL,
  `caj_col_id` bigint DEFAULT NULL,
  `caj_age_id` bigint DEFAULT NULL,
  `caj_observaciones` text,
  `caj_cue_id` bigint DEFAULT NULL,
  `caj_t1m_id` bigint DEFAULT NULL,
  `caj_gt4_id` bigint DEFAULT '1',
  `caj_monto` decimal(24,4) NOT NULL,
  `caj_gus_id` bigint DEFAULT NULL,
  `caj_caj_id` bigint DEFAULT NULL,
  `caj_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `caj_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `caj_status` int DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cajas`
--

INSERT INTO `cajas` (`caj_id`, `caj_tipo`, `caj_numero`, `caj_tga_id`, `caj_responsable`, `caj_fecha`, `caj_col_id`, `caj_age_id`, `caj_observaciones`, `caj_cue_id`, `caj_t1m_id`, `caj_gt4_id`, `caj_monto`, `caj_gus_id`, `caj_caj_id`, `caj_created`, `caj_updated`, `caj_status`) VALUES
(2842, 0, 23, NULL, NULL, '2022-11-01', NULL, NULL, NULL, 24, NULL, 1, '15000.0000', 1, NULL, '2022-12-01 13:40:19', '2022-12-01 13:40:19', 1),
(2880, 7, 75, NULL, NULL, '2022-11-30', NULL, 4, 'PLACYS', NULL, NULL, 1, '2504.9000', 1, NULL, '2022-12-02 14:37:56', '2022-12-02 14:37:56', 1),
(2881, 6, 92, NULL, NULL, '2022-11-30', NULL, 4, 'IPAYSGO', NULL, NULL, 1, '-317.4200', 1, NULL, '2022-12-02 14:39:21', '2022-12-02 14:39:21', 1),
(2884, 7, 76, NULL, NULL, '2022-11-30', NULL, 4, NULL, NULL, NULL, 1, '3568.6500', 1, NULL, '2022-12-02 14:56:49', '2022-12-02 14:56:49', 1),
(4728, 2, 1423, NULL, NULL, '2023-01-21', NULL, 43, 'MOVIMIENTO INTERNO 1 DE AGENTE-CONTABLE G.', 22, 9, 1, '-23425.1500', 1, NULL, '2023-01-21 16:06:24', '2023-01-21 16:06:24', 1),
(4729, 1, 232, NULL, NULL, '2023-01-21', NULL, 143, 'MOVIMIENTO 1 INTERNO DE OTRAS INV. ', 22, 9, 1, '23425.1500', 1, NULL, '2023-01-21 16:07:19', '2023-01-21 16:07:19', 1),
(4730, 1, 232, NULL, NULL, '2023-01-21', NULL, 143, 'MOVIMIENTO INTERNO 2 DE OTRAS INV. ', 22, 9, 1, '60000.0000', 1, NULL, '2023-01-21 16:07:19', '2023-01-21 16:07:19', 1),
(4731, 2, 1423, NULL, NULL, '2023-01-21', NULL, 43, 'MOVIMIENTO INTERNO 2 DE AGENTE-CONTABLE G.', 22, 9, 1, '-60000.0000', 1, NULL, '2023-01-21 16:06:24', '2023-01-21 16:06:24', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD PRIMARY KEY (`caj_id`),
  ADD KEY `cajas_tgastos` (`caj_tga_id`),
  ADD KEY `cajas_colaboradores` (`caj_col_id`),
  ADD KEY `cajas_agentes` (`caj_age_id`),
  ADD KEY `cajas_cuentas` (`caj_cue_id`),
  ADD KEY `cajas_t1mediopagos` (`caj_t1m_id`),
  ADD KEY `cajas_gt4monedas` (`caj_gt4_id`),
  ADD KEY `cajas_gusuarios` (`caj_gus_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cajas`
--
ALTER TABLE `cajas`
  MODIFY `caj_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5033;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD CONSTRAINT `cajas_agentes` FOREIGN KEY (`caj_age_id`) REFERENCES `agentes` (`age_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cajas_colaboradores` FOREIGN KEY (`caj_col_id`) REFERENCES `colaboradores` (`col_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cajas_cuentas` FOREIGN KEY (`caj_cue_id`) REFERENCES `cuentas` (`cue_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cajas_gt4monedas` FOREIGN KEY (`caj_gt4_id`) REFERENCES `company5_bd_cacel`.`t4monedas` (`gt4_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cajas_gusuarios` FOREIGN KEY (`caj_gus_id`) REFERENCES `company5_bd_cacel`.`usuarios` (`gus_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cajas_t1mediopagos` FOREIGN KEY (`caj_t1m_id`) REFERENCES `t1mediopagos` (`t1m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cajas_tgastos` FOREIGN KEY (`caj_tga_id`) REFERENCES `tgastos` (`tga_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
