-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 15-10-2022 a las 09:08:00
-- Versión del servidor: 5.7.23-23
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
-- Estructura de tabla para la tabla `aatributos`
--

CREATE TABLE `aatributos` (
  `aat_id` bigint(20) NOT NULL,
  `aat_act_id` bigint(20) NOT NULL,
  `aat_val_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acreditos`
--

CREATE TABLE `acreditos` (
  `acr_id` bigint(20) NOT NULL,
  `acr_monto` decimal(12,6) NOT NULL,
  `acr_ncuota` int(12) NOT NULL,
  `acr_interes` decimal(6,4) NOT NULL,
  `acr_fechapago` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activos`
--

CREATE TABLE `activos` (
  `act_id` bigint(20) NOT NULL,
  `act_codigo` varchar(250) NOT NULL,
  `act_nombre` varchar(250) NOT NULL,
  `act_t9p_id` bigint(20) NOT NULL,
  `act_act_id` bigint(20) DEFAULT NULL,
  `act_img` varchar(200) DEFAULT NULL,
  `act_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adetalles`
--

CREATE TABLE `adetalles` (
  `ade_id` bigint(20) NOT NULL,
  `ade_q` int(11) NOT NULL,
  `ade_act_id` bigint(20) NOT NULL,
  `ade_serie` varchar(200) DEFAULT NULL,
  `ade_fechaA` date NOT NULL,
  `ade_vutil` int(11) NOT NULL,
  `ade_vu` decimal(12,6) NOT NULL,
  `ade_mt` decimal(12,6) NOT NULL,
  `ade_ads_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adscripciones`
--

CREATE TABLE `adscripciones` (
  `ads_id` bigint(20) NOT NULL,
  `ads_cunico` int(11) NOT NULL,
  `ads_fecha` date NOT NULL,
  `ads_col_id` bigint(20) DEFAULT NULL,
  `ads_ubi_id` bigint(20) NOT NULL,
  `ads_tipo` int(2) NOT NULL,
  `ads_motivo` varchar(250) DEFAULT NULL,
  `ads_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ads_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ads_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agentes`
--

CREATE TABLE `agentes` (
  `age_id` bigint(20) NOT NULL,
  `age_gpe_id` bigint(20) DEFAULT NULL,
  `age_gem_id` bigint(20) DEFAULT NULL,
  `age_tipo` int(11) NOT NULL DEFAULT '1',
  `age_arrbienes` json DEFAULT NULL,
  `age_monto` decimal(12,6) DEFAULT NULL,
  `age_status` int(11) NOT NULL DEFAULT '1',
  `age_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `age_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `agentes`
--

INSERT INTO `agentes` (`age_id`, `age_gpe_id`, `age_gem_id`, `age_tipo`, `age_arrbienes`, `age_monto`, `age_status`, `age_created`, `age_updated`) VALUES
(1, 10, NULL, 1, NULL, NULL, 1, '2022-07-25 13:41:19', '2022-07-25 13:41:19'),
(3, 13, NULL, 1, NULL, NULL, 1, '2022-08-05 11:59:09', '2022-08-05 11:59:09'),
(4, NULL, 2, 2, NULL, NULL, 1, '2022-08-16 10:22:35', '2022-08-16 10:22:35'),
(10, 15, NULL, 1, NULL, NULL, 1, '2022-08-17 17:17:33', '2022-08-17 17:17:33'),
(12, 16, NULL, 1, NULL, NULL, 1, '2022-08-18 12:20:29', '2022-08-18 12:20:29'),
(13, 17, NULL, 1, NULL, NULL, 1, '2022-08-18 12:22:30', '2022-08-18 12:22:30'),
(14, 18, NULL, 1, NULL, NULL, 1, '2022-08-18 12:23:24', '2022-08-18 12:23:24'),
(15, 19, NULL, 1, NULL, NULL, 1, '2022-08-18 12:24:02', '2022-08-18 12:24:02'),
(16, 20, NULL, 1, NULL, NULL, 1, '2022-08-18 12:24:41', '2022-08-18 12:24:41'),
(17, 21, NULL, 1, NULL, NULL, 1, '2022-08-18 12:25:28', '2022-08-18 12:25:28'),
(18, 22, NULL, 1, NULL, NULL, 1, '2022-08-18 12:26:33', '2022-08-18 12:26:33'),
(19, 23, NULL, 1, NULL, NULL, 1, '2022-08-18 12:27:16', '2022-08-18 12:27:16'),
(20, 24, NULL, 1, NULL, NULL, 1, '2022-08-18 12:28:27', '2022-08-18 12:28:27'),
(21, 25, NULL, 1, NULL, NULL, 1, '2022-08-18 12:30:23', '2022-08-18 12:30:23'),
(22, 26, NULL, 1, NULL, NULL, 1, '2022-08-18 12:31:24', '2022-08-18 12:31:24'),
(23, 27, NULL, 1, NULL, NULL, 1, '2022-08-18 12:32:23', '2022-08-18 12:32:23'),
(24, 28, NULL, 1, NULL, NULL, 1, '2022-08-18 12:33:32', '2022-08-18 12:33:32'),
(25, 29, NULL, 1, NULL, NULL, 1, '2022-08-18 12:34:30', '2022-08-18 12:34:30'),
(28, 32, NULL, 1, NULL, NULL, 1, '2022-08-18 12:52:28', '2022-08-18 12:52:28'),
(29, NULL, 3, 2, NULL, NULL, 1, '2022-08-19 15:22:07', '2022-08-19 15:22:07'),
(30, 30, NULL, 2, NULL, NULL, 1, '2022-08-19 15:29:32', '2022-08-19 15:29:32'),
(31, 31, NULL, 2, NULL, NULL, 1, '2022-08-19 15:29:42', '2022-08-19 15:29:42'),
(32, 33, NULL, 1, NULL, NULL, 1, '2022-08-19 15:34:12', '2022-08-19 15:34:12'),
(33, 34, NULL, 1, NULL, NULL, 1, '2022-08-19 15:56:53', '2022-08-19 15:56:53'),
(34, 35, NULL, 1, NULL, NULL, 1, '2022-08-19 16:03:49', '2022-08-19 16:03:49'),
(35, NULL, 4, 2, NULL, NULL, 1, '2022-08-19 16:08:52', '2022-08-19 16:08:52'),
(36, 36, NULL, 1, NULL, NULL, 1, '2022-08-19 16:42:29', '2022-08-19 16:42:29'),
(37, 37, NULL, 1, NULL, NULL, 1, '2022-08-19 16:53:28', '2022-08-19 16:53:28'),
(38, 38, NULL, 1, NULL, NULL, 1, '2022-08-19 17:05:53', '2022-08-19 17:05:53'),
(39, 39, NULL, 1, NULL, NULL, 1, '2022-08-23 15:14:25', '2022-08-23 15:14:25'),
(40, 40, NULL, 1, NULL, NULL, 1, '2022-08-23 15:42:19', '2022-08-23 15:42:19'),
(41, 41, NULL, 1, NULL, NULL, 1, '2022-08-26 15:02:03', '2022-08-26 15:02:03'),
(43, 42, NULL, 1, NULL, NULL, 1, '2022-08-26 15:07:10', '2022-08-26 15:07:10'),
(44, 43, NULL, 1, NULL, NULL, 1, '2022-09-06 09:42:31', '2022-09-06 09:42:31'),
(45, 44, NULL, 1, NULL, NULL, 1, '2022-09-06 10:07:09', '2022-09-06 10:07:09'),
(46, 45, NULL, 1, NULL, NULL, 1, '2022-09-07 12:15:16', '2022-09-07 12:15:16'),
(47, 46, NULL, 2, NULL, NULL, 1, '2022-09-07 13:32:23', '2022-09-07 13:32:23'),
(48, 47, NULL, 2, NULL, NULL, 1, '2022-09-07 13:40:21', '2022-09-07 13:40:21'),
(49, 48, NULL, 1, NULL, NULL, 1, '2022-09-07 16:46:49', '2022-09-07 16:46:49'),
(50, 49, NULL, 1, NULL, NULL, 1, '2022-09-07 16:56:58', '2022-09-07 16:56:58'),
(51, 50, NULL, 1, NULL, NULL, 1, '2022-09-07 18:12:26', '2022-09-07 18:12:26'),
(52, 51, NULL, 1, NULL, NULL, 1, '2022-09-07 18:14:47', '2022-09-07 18:14:47'),
(53, 52, NULL, 1, NULL, NULL, 1, '2022-09-07 18:16:23', '2022-09-07 18:16:23'),
(54, 53, NULL, 1, NULL, NULL, 1, '2022-09-07 18:17:51', '2022-09-07 18:17:51'),
(55, 54, NULL, 2, NULL, NULL, 1, '2022-09-07 18:21:38', '2022-09-07 18:21:38'),
(57, NULL, 5, 2, NULL, NULL, 1, '2022-09-07 18:25:24', '2022-09-07 18:25:24'),
(58, 56, NULL, 2, NULL, NULL, 1, '2022-09-07 18:36:38', '2022-09-07 18:36:38'),
(59, 57, NULL, 1, NULL, NULL, 1, '2022-09-08 11:17:36', '2022-09-08 11:17:36'),
(60, 58, NULL, 1, NULL, NULL, 1, '2022-09-08 11:19:03', '2022-09-08 11:19:03'),
(61, 59, NULL, 1, NULL, NULL, 1, '2022-09-08 11:20:17', '2022-09-08 11:20:17'),
(62, NULL, 6, 2, NULL, NULL, 1, '2022-09-08 11:25:14', '2022-09-08 11:25:14'),
(64, 60, NULL, 1, NULL, NULL, 1, '2022-09-08 11:29:01', '2022-09-08 11:29:01'),
(65, NULL, 7, 2, NULL, NULL, 1, '2022-09-08 11:30:51', '2022-09-08 11:30:51'),
(66, 55, NULL, 2, NULL, NULL, 1, '2022-09-08 11:55:11', '2022-09-08 11:55:11'),
(67, NULL, 8, 2, NULL, NULL, 1, '2022-09-08 12:16:12', '2022-09-08 12:16:12'),
(68, 61, NULL, 1, NULL, NULL, 1, '2022-09-08 12:21:14', '2022-09-08 12:21:14'),
(69, 62, NULL, 2, NULL, NULL, 1, '2022-09-08 12:22:56', '2022-09-08 12:22:56'),
(70, 63, NULL, 1, NULL, NULL, 1, '2022-09-08 12:30:43', '2022-09-08 12:30:43'),
(71, 64, NULL, 1, NULL, NULL, 1, '2022-09-08 12:31:55', '2022-09-08 12:31:55'),
(72, 65, NULL, 2, NULL, NULL, 1, '2022-09-08 12:46:23', '2022-09-08 12:46:23'),
(73, 66, NULL, 2, NULL, NULL, 1, '2022-09-08 12:57:14', '2022-09-08 12:57:14'),
(74, 67, NULL, 2, NULL, NULL, 1, '2022-09-08 15:54:30', '2022-09-08 15:54:30'),
(75, 68, NULL, 2, NULL, NULL, 1, '2022-09-08 16:53:38', '2022-09-08 16:53:38'),
(76, 69, NULL, 2, NULL, NULL, 1, '2022-09-08 17:47:52', '2022-09-08 17:47:52'),
(79, 70, NULL, 2, NULL, NULL, 1, '2022-09-09 17:12:53', '2022-09-09 17:12:53'),
(80, 71, NULL, 2, NULL, NULL, 1, '2022-09-10 11:24:57', '2022-09-10 11:24:57'),
(81, 72, NULL, 1, NULL, NULL, 1, '2022-09-10 12:28:18', '2022-09-10 12:28:18'),
(82, 73, NULL, 1, NULL, NULL, 1, '2022-09-12 17:48:12', '2022-09-12 17:48:12'),
(83, 74, NULL, 1, NULL, NULL, 1, '2022-09-13 09:57:33', '2022-09-13 09:57:33'),
(84, 75, NULL, 2, NULL, NULL, 1, '2022-09-13 13:14:23', '2022-09-13 13:14:23'),
(85, 76, NULL, 1, NULL, NULL, 1, '2022-09-14 16:29:25', '2022-09-14 16:29:25'),
(86, 77, NULL, 2, NULL, NULL, 1, '2022-09-15 16:03:14', '2022-09-15 16:03:14'),
(87, 78, NULL, 2, NULL, NULL, 1, '2022-09-15 17:31:22', '2022-09-15 17:31:22'),
(88, 79, NULL, 1, NULL, NULL, 1, '2022-09-20 16:55:15', '2022-09-20 16:55:15'),
(89, 80, NULL, 1, NULL, NULL, 1, '2022-09-21 09:56:36', '2022-09-21 09:56:36'),
(90, NULL, 9, 2, NULL, NULL, 1, '2022-09-24 14:39:46', '2022-09-24 14:39:46'),
(92, 81, NULL, 1, NULL, NULL, 1, '2022-09-27 14:07:19', '2022-09-27 14:07:19'),
(98, 82, NULL, 1, NULL, NULL, 1, '2022-09-28 17:02:28', '2022-09-28 17:02:28'),
(99, 83, NULL, 1, NULL, NULL, 1, '2022-10-04 09:28:11', '2022-10-04 09:28:11'),
(100, 84, NULL, 1, NULL, NULL, 1, '2022-10-05 16:44:46', '2022-10-05 16:44:46'),
(101, 85, NULL, 1, NULL, NULL, 1, '2022-10-06 16:41:30', '2022-10-06 16:41:30'),
(102, 86, NULL, 1, NULL, NULL, 1, '2022-10-12 10:17:33', '2022-10-12 10:17:33'),
(103, 87, NULL, 1, NULL, NULL, 1, '2022-10-12 12:28:01', '2022-10-12 12:28:01'),
(104, 88, NULL, 1, NULL, NULL, 1, '2022-10-13 10:38:47', '2022-10-13 10:38:47'),
(105, 89, NULL, 1, NULL, NULL, 1, '2022-10-13 10:54:01', '2022-10-13 10:54:01'),
(106, 90, NULL, 2, NULL, NULL, 1, '2022-10-13 18:42:39', '2022-10-13 18:42:39'),
(107, 91, NULL, 1, NULL, NULL, 1, '2022-10-14 11:55:37', '2022-10-14 11:55:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacenes`
--

CREATE TABLE `almacenes` (
  `alm_id` bigint(20) NOT NULL,
  `alm_gdi_id` bigint(20) NOT NULL,
  `alm_nombre` varchar(20) NOT NULL,
  `alm_direccion` varchar(200) NOT NULL,
  `alm_imagen` varchar(100) DEFAULT NULL,
  `alm_est_id` bigint(20) NOT NULL,
  `alm_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `alm_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `alm_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `almacenes`
--

INSERT INTO `almacenes` (`alm_id`, `alm_gdi_id`, `alm_nombre`, `alm_direccion`, `alm_imagen`, `alm_est_id`, `alm_created`, `alm_updated`, `alm_status`) VALUES
(1, 150125, 'PRINCIPAL', 'Mz A, lote 12, tambo Inga, Ref. km 27 Panam. Norte', NULL, 1, '2022-07-25 12:30:55', '2022-07-25 12:30:55', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencias`
--

CREATE TABLE `asistencias` (
  `asi_id` bigint(20) NOT NULL,
  `asi_gem_id` bigint(20) NOT NULL,
  `asi_gpe_id` bigint(20) NOT NULL,
  `asi_foto` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `asi_horaE` datetime NOT NULL,
  `asi_horaS` datetime DEFAULT NULL,
  `asi_pc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `asi_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `batributos`
--

CREATE TABLE `batributos` (
  `bat_id` bigint(20) NOT NULL,
  `bat_bie_id` bigint(20) DEFAULT NULL,
  `bat_val_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bbienes`
--

CREATE TABLE `bbienes` (
  `bbi_id` bigint(20) NOT NULL,
  `bbi_t5e_id` bigint(20) NOT NULL,
  `bbi_c70_id` bigint(20) NOT NULL,
  `bbi_c60_id` bigint(20) NOT NULL,
  `bbi_c61_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bbienes`
--

INSERT INTO `bbienes` (`bbi_id`, `bbi_t5e_id`, `bbi_c70_id`, `bbi_c60_id`, `bbi_c61_id`) VALUES
(1, 1, 1576, 1170, 1206),
(2, 1, 1576, 1170, 1206),
(3, 1, 1576, 1170, 1206),
(4, 1, 1576, 1170, 1206),
(5, 1, 1576, 1170, 1206),
(6, 1, 1576, 1170, 1206),
(7, 1, 1576, 1170, 1206),
(8, 1, 1576, 1170, 1206),
(9, 1, 1576, 1170, 1206),
(10, 1, 1576, 1170, 1206),
(11, 1, 1576, 1170, 1206),
(12, 1, 1576, 1170, 1206),
(13, 1, 1576, 1170, 1206),
(14, 1, 1576, 1170, 1206),
(15, 1, 1576, 1170, 1206),
(16, 1, 1576, 1170, 1206),
(17, 1, 1576, 1170, 1206),
(18, 1, 1576, 1170, 1206),
(19, 1, 1576, 1170, 1206),
(20, 1, 1576, 1170, 1206),
(21, 1, 1576, 1170, 1206),
(22, 1, 1576, 1170, 1206),
(23, 1, 1576, 1170, 1206),
(24, 1, 1576, 1170, 1206),
(25, 1, 1576, 1170, 1206),
(26, 1, 1576, 1170, 1206),
(27, 1, 1576, 1170, 1206),
(28, 1, 1576, 1170, 1206),
(29, 1, 1576, 1170, 1206),
(30, 1, 1576, 1170, 1206),
(31, 1, 1576, 1170, 1206),
(32, 1, 1576, 1170, 1206),
(33, 1, 1576, 1170, 1206),
(34, 1, 1576, 1170, 1206),
(35, 1, 1576, 1170, 1206),
(36, 1, 1576, 1170, 1206),
(37, 1, 1576, 1170, 1206),
(38, 1, 1576, 1170, 1206),
(39, 1, 1576, 1170, 1206),
(40, 1, 1576, 1170, 1206),
(41, 1, 1576, 1170, 1206),
(42, 1, 1576, 1170, 1206),
(43, 1, 1576, 1170, 1206),
(44, 1, 1576, 1170, 1206),
(45, 1, 1576, 1170, 1206),
(46, 1, 1576, 1170, 1206),
(47, 1, 1576, 1170, 1206),
(48, 1, 1576, 1170, 1206),
(49, 1, 1576, 1170, 1206),
(50, 1, 1576, 1170, 1206),
(51, 1, 1576, 1170, 1206);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bienes`
--

CREATE TABLE `bienes` (
  `bie_id` bigint(20) NOT NULL,
  `bie_codigo` varchar(12) NOT NULL,
  `bie_nombre` varchar(200) NOT NULL,
  `bie_bbi_id` bigint(20) DEFAULT NULL,
  `bie_t6m_id` bigint(20) DEFAULT NULL,
  `bie_bie_id` bigint(20) DEFAULT NULL,
  `bie_alm_id` json NOT NULL,
  `bie_p` decimal(12,6) NOT NULL DEFAULT '0.000000',
  `bie_igv` tinyint(1) NOT NULL DEFAULT '0',
  `bie_img` text,
  `bie_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bienes`
--

INSERT INTO `bienes` (`bie_id`, `bie_codigo`, `bie_nombre`, `bie_bbi_id`, `bie_t6m_id`, `bie_bie_id`, `bie_alm_id`, `bie_p`, `bie_igv`, `bie_img`, `bie_status`) VALUES
(4, 'CO001', 'Cobre Brillante', 5, 23, NULL, '[1]', '26.000000', 0, '[]', 1),
(5, 'CO002', 'Cobre Grueso', 6, 23, NULL, '[1]', '24.500000', 0, '[]', 1),
(6, 'CO003', 'Cobre Delgado', 7, 23, NULL, '[1]', '24.000000', 0, '[]', 1),
(7, 'CO004', 'Cobre Estañado', 8, 23, NULL, '[1]', '24.500000', 0, '[]', 1),
(8, 'CO005', 'Cobre Telefonico', 9, 23, NULL, '[1]', '24.000000', 0, '[]', 1),
(9, 'CO006', 'Escoria de cobre', 10, 23, NULL, '[1]', '13.000000', 0, '[]', 1),
(10, 'CO007', 'Tierra de cobre', 11, 23, NULL, '[1]', '7.000000', 0, '[]', 1),
(11, 'BR001', 'Bronce Limpio', 12, 23, NULL, '[1]', '15.410000', 0, '[]', 1),
(12, 'BR002', 'Bronce Sucio', 13, 23, NULL, '[1]', '15.410000', 0, '[]', 1),
(13, 'BR003', 'Bronce Rojo', 14, 23, NULL, '[1]', '15.410000', 0, '[]', 1),
(14, 'BR004', 'Bronce Masiso', 15, 23, NULL, '[1]', '15.410000', 0, '[]', 1),
(15, 'BR005', 'Viruta de Bronce', 16, 23, NULL, '[1]', '15.410000', 0, '[]', 1),
(16, 'BR006', 'Radiador de Bronce', 17, 23, NULL, '[1]', '15.410000', 0, '[]', 1),
(17, 'PB001', 'Plomo chatarra ', 18, 23, NULL, '[1]', '5.000000', 0, '[]', 1),
(18, 'PB002', 'Plomo lingote', 19, 23, NULL, '[1]', '5.500000', 0, '[]', 1),
(19, 'PB003', 'Grupo Automotriz', 20, 23, NULL, '[1]', '5.000000', 0, '[]', 1),
(20, 'PB004', 'Grupo Industrial', 21, 23, NULL, '[1]', '5.000000', 0, '[]', 1),
(21, 'PB005', 'Bateria Estandar', 22, 58, NULL, '[1]', '65.000000', 0, '[]', 1),
(22, 'PB006', 'Tierra de baterias', 23, 23, NULL, '[1]', '3.500000', 0, '[]', 1),
(23, 'AL001', 'Aluminio Duro', 24, 23, NULL, '[1]', '4.000000', 0, '[]', 1),
(24, 'AL002', 'Aluminio Perfil', 25, 23, NULL, '[1]', '4.000000', 0, '[]', 1),
(25, 'AL003', 'Cocalata ', 26, 23, NULL, '[1]', '4.000000', 0, '[]', 1),
(26, 'AL004', 'Radiador de Aluminio', 27, 23, NULL, '[1]', '4.000000', 0, '[]', 1),
(27, 'AL005', 'Antimonio', 28, 23, NULL, '[1]', '4.000000', 0, '[]', 1),
(28, 'AL006', 'Aluminio Olla Limpia', 29, 23, NULL, '[1]', '4.000000', 0, '[]', 1),
(29, 'AL007', 'Aluminio Olla Sucia', 30, 23, NULL, '[1]', '4.000000', 0, '[]', 1),
(30, 'AL008', 'Aluminio Cable Limpio', 31, 23, NULL, '[1]', '4.000000', 0, '[]', 1),
(31, 'AL009', 'Aluminio Cable Sulfa.', 32, 23, NULL, '[1]', '5.000000', 0, '[]', 1),
(32, 'AL010', 'Aluminio Cable Grasa', 33, 23, NULL, '[1]', '5.000000', 0, '[]', 1),
(33, 'AL011', 'Chapa ', 34, 23, NULL, '[1]', '3.000000', 0, '[]', 1),
(34, 'AL012', 'Bocamasa', 35, 23, NULL, '[1]', '3.000000', 0, '[]', 1),
(35, 'AL013', 'Carroceria', 36, 23, NULL, '[1]', '4.000000', 0, '[]', 1),
(36, 'AL014', 'Offset', 37, 23, NULL, '[1]', '4.000000', 0, '[]', 1),
(37, 'AC001', 'Acero Inox', 38, 23, NULL, '[1]', '6.000000', 0, '[]', 1),
(38, 'AC002', 'Acero Chino', 39, 23, NULL, '[1]', '4.000000', 0, '[]', 1),
(39, 'FI001', 'Chatarra ', 40, 23, NULL, '[1]', '0.500000', 0, '[]', 1),
(40, 'FI002', 'Fierro Fundido', 41, 23, NULL, '[1]', '1.000000', 0, '[]', 1),
(41, 'PL001', 'Casco plastico ', 42, 23, NULL, '[1]', '2.500000', 0, '[]', 1),
(43, 'CO008', 'Radiado de CU / AL', 44, 23, NULL, '[1]', '5.000000', 0, '[]', 1),
(44, 'AL15', 'Viruta de Aluminio', 46, 23, NULL, '[1]', '4.000000', 0, '[]', 1),
(45, 'PL', 'PVC', 47, 23, NULL, '[1]', '2.000000', 0, '[]', 1),
(46, 'PL', 'FILL', 48, 23, NULL, '[1]', '2.000000', 0, '[]', 1),
(47, 'JAVA', 'JAVA', 49, 23, NULL, '[1]', '0.000000', 0, '[]', 1),
(48, 'PL', 'LONA', 50, 23, NULL, '[1]', '2.000000', 0, '[]', 1),
(49, 'PL', 'PET BOTELLA', 51, 23, NULL, '[1]', '2.500000', 0, '[]', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `caj_id` bigint(20) NOT NULL,
  `caj_tipo` int(1) NOT NULL,
  `caj_numero` bigint(20) NOT NULL,
  `caj_tga_id` bigint(20) DEFAULT NULL,
  `caj_responsable` text,
  `caj_fecha` date NOT NULL,
  `caj_col_id` bigint(20) DEFAULT NULL,
  `caj_age_id` bigint(20) DEFAULT NULL,
  `caj_observaciones` text,
  `caj_cue_id` bigint(20) DEFAULT NULL,
  `caj_t1m_id` bigint(20) DEFAULT NULL,
  `caj_gt4_id` bigint(20) DEFAULT '1',
  `caj_monto` decimal(24,4) NOT NULL,
  `caj_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `caj_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `caj_status` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cajas`
--

INSERT INTO `cajas` (`caj_id`, `caj_tipo`, `caj_numero`, `caj_tga_id`, `caj_responsable`, `caj_fecha`, `caj_col_id`, `caj_age_id`, `caj_observaciones`, `caj_cue_id`, `caj_t1m_id`, `caj_gt4_id`, `caj_monto`, `caj_created`, `caj_updated`, `caj_status`) VALUES
(1, 0, 1, NULL, NULL, '2022-08-25', NULL, NULL, NULL, 1, NULL, 1, '352641.3100', '2022-08-26 14:52:08', '2022-08-26 14:52:08', 1),
(2, 0, 1, NULL, NULL, '2022-08-25', NULL, NULL, NULL, 2, NULL, 1, '1120.2900', '2022-08-26 14:52:36', '2022-08-26 14:52:36', 1),
(3, 0, 1, NULL, NULL, '2022-08-25', NULL, NULL, NULL, 3, NULL, 1, '502181.9400', '2022-08-26 14:54:35', '2022-08-26 14:54:35', 1),
(4, 0, 1, NULL, NULL, '2022-08-25', NULL, NULL, NULL, 4, NULL, 1, '167486.0100', '2022-08-26 14:55:08', '2022-08-26 14:55:08', 1),
(5, 0, 1, NULL, NULL, '2022-08-25', NULL, NULL, NULL, 5, NULL, 1, '157568.7200', '2022-08-26 14:55:44', '2022-08-26 14:55:44', 1),
(6, 2, 1, NULL, NULL, '2022-08-26', NULL, 41, NULL, 3, 3, 1, '-30000.0000', '2022-08-26 15:03:02', '2022-08-26 15:03:02', 1),
(7, 2, 2, NULL, NULL, '2022-08-26', NULL, 43, 'CASA HUANUCO', 3, 3, 1, '-3000.0000', '2022-08-26 15:08:02', '2022-08-26 15:08:02', 1),
(8, 2, 2, NULL, NULL, '2022-08-26', NULL, 37, 'COMPRA DE GRUPO', 3, 3, 1, '-5144.5000', '2022-08-26 15:08:51', '2022-08-26 15:08:51', 1),
(9, 3, 1, 1, NULL, '2022-08-25', NULL, NULL, 'IMPUESTO ITF ', 3, 3, 1, '-4.9500', '2022-08-26 15:22:29', '2022-08-26 15:22:29', 1),
(10, 1, 1, NULL, NULL, '2022-08-25', NULL, 4, 'PAGO ', 3, 3, 1, '89319.9500', '2022-08-26 15:23:35', '2022-08-26 15:23:35', 1),
(11, 3, 2, 11, NULL, '2022-08-25', NULL, NULL, 'SATELLITAL PATROL', 3, 3, 1, '-743.2100', '2022-08-26 15:24:31', '2022-08-26 15:24:31', 1),
(12, 2, 3, NULL, NULL, '2022-08-25', NULL, 41, 'PAUCCARA MAMANI DENIS', 3, NULL, 1, '-5000.0000', '2022-08-26 15:39:15', '2022-08-26 15:39:15', 1),
(13, 5, 1, NULL, NULL, '2022-08-26', NULL, NULL, 'MOV INTERNO', 1, 3, 1, '-25000.0000', '2022-08-26 17:19:54', '2022-08-26 17:19:54', 1),
(14, 5, 1, NULL, NULL, '2022-08-26', NULL, NULL, 'MOV INTERNO', 10, 3, 1, '25000.0000', '2022-08-26 17:19:54', '2022-08-26 17:19:54', 1),
(15, 0, 2, NULL, NULL, '2022-09-07', NULL, NULL, NULL, 1, NULL, 1, '230334.5400', '2022-09-07 10:03:26', '2022-09-07 10:03:26', 1),
(17, 0, 2, NULL, NULL, '2022-09-07', NULL, NULL, NULL, 2, NULL, 1, '1081.7900', '2022-09-07 10:03:58', '2022-09-07 10:03:58', 1),
(18, 0, 2, NULL, NULL, '2022-09-07', NULL, NULL, NULL, 3, NULL, 1, '478361.6200', '2022-09-07 10:04:26', '2022-09-07 10:04:26', 1),
(19, 0, 2, NULL, NULL, '2022-09-07', NULL, NULL, NULL, 4, NULL, 1, '292625.2300', '2022-09-07 10:04:49', '2022-09-07 10:04:49', 1),
(20, 0, 2, NULL, NULL, '2022-09-07', NULL, NULL, NULL, 11, NULL, 1, '689931.6000', '2022-09-07 10:07:31', '2022-09-07 10:07:31', 1),
(21, 0, 2, NULL, NULL, '2022-09-07', NULL, NULL, NULL, 5, NULL, 1, '192525.7000', '2022-09-07 10:08:24', '2022-09-07 10:08:24', 1),
(23, 0, 3, NULL, NULL, '2022-09-07', NULL, NULL, NULL, 7, NULL, 1, '122.0300', '2022-09-07 12:26:38', '2022-09-07 12:26:38', 1),
(24, 0, 3, NULL, NULL, '2022-09-07', NULL, NULL, NULL, 8, NULL, 1, '351797.7300', '2022-09-07 12:27:02', '2022-09-07 12:27:02', 1),
(25, 0, 3, NULL, NULL, '2022-09-07', NULL, NULL, NULL, 9, NULL, 1, '151022.7200', '2022-09-07 12:27:21', '2022-09-07 12:27:21', 1),
(26, 0, 3, NULL, NULL, '2022-09-07', NULL, NULL, NULL, 10, NULL, 1, '11328.4500', '2022-09-07 12:27:45', '2022-09-07 12:27:45', 1),
(27, 0, 3, NULL, NULL, '2022-09-07', NULL, NULL, NULL, 6, NULL, 1, '178280.7000', '2022-09-07 12:28:23', '2022-09-07 12:28:23', 1),
(28, 0, 3, NULL, NULL, '2022-09-07', NULL, NULL, NULL, 12, NULL, 1, '10881.7200', '2022-09-07 12:30:56', '2022-09-07 12:30:56', 1),
(30, 0, 3, NULL, NULL, '2022-09-07', NULL, NULL, NULL, 13, NULL, 1, '2024.1100', '2022-09-07 12:35:14', '2022-09-07 12:35:14', 1),
(31, 0, 4, NULL, NULL, '2022-09-07', NULL, NULL, NULL, 14, NULL, 1, '642.1700', '2022-09-07 13:33:15', '2022-09-07 13:33:15', 1),
(32, 0, 4, NULL, NULL, '2022-09-07', NULL, NULL, NULL, 15, NULL, 1, '7052.6900', '2022-09-07 13:33:42', '2022-09-07 13:33:42', 1),
(33, 0, 4, NULL, NULL, '2022-09-07', NULL, NULL, NULL, 16, NULL, 1, '11801.3800', '2022-09-07 13:34:18', '2022-09-07 13:34:18', 1),
(34, 0, 4, NULL, NULL, '2022-09-07', NULL, NULL, NULL, 17, NULL, 1, '1168.6100', '2022-09-07 13:34:37', '2022-09-07 13:34:37', 1),
(35, 0, 4, NULL, NULL, '2022-09-07', NULL, NULL, NULL, 19, NULL, 1, '132.3200', '2022-09-07 13:34:51', '2022-09-07 13:34:51', 1),
(36, 0, 4, NULL, NULL, '2022-09-07', NULL, NULL, NULL, 21, NULL, 1, '18752.2500', '2022-09-07 13:35:17', '2022-09-07 13:35:17', 1),
(37, 0, 4, NULL, NULL, '2022-09-07', NULL, NULL, NULL, 22, NULL, 1, '71623.1800', '2022-09-07 13:37:09', '2022-09-07 13:37:09', 1),
(38, 0, 5, NULL, NULL, '2022-09-07', NULL, NULL, NULL, 23, NULL, 1, '10000.0000', '2022-09-07 13:39:06', '2022-09-07 13:39:06', 1),
(39, 2, 1, NULL, NULL, '2022-09-05', NULL, 39, 'JONATAN MARON FLORES', 1, 3, 1, '-10000.0000', '2022-09-07 17:34:14', '2022-09-07 17:34:14', 1),
(40, 2, 2, NULL, NULL, '2022-09-05', NULL, 39, 'RAMIREZ CALLOCONDO JACQUELINE', 1, 3, 1, '-5000.0000', '2022-09-07 17:35:00', '2022-09-07 17:35:00', 1),
(41, 2, 3, NULL, NULL, '2022-09-05', NULL, 39, 'COLQUE BARREDA LUZMILA', 1, 3, 1, '-2000.0000', '2022-09-07 17:35:39', '2022-09-07 17:35:39', 1),
(42, 2, 6, NULL, NULL, '2022-09-07', NULL, 45, 'LOARTE ORTEGA YSABEL', 1, 1, 1, '-3000.0000', '2022-09-07 17:36:14', '2022-09-07 17:36:14', 1),
(43, 2, 63, NULL, NULL, '2022-09-03', NULL, 53, 'COMPRA DE ALUMINIO ', 1, 3, 1, '-10708.4000', '2022-09-07 18:17:53', '2022-09-07 18:17:53', 1),
(44, 3, 3, 1, NULL, '2022-09-05', NULL, NULL, 'IMPUESTO ITF', 1, 3, 1, '-0.1100', '2022-09-08 10:30:11', '2022-09-08 10:30:11', 1),
(45, 2, 8, NULL, NULL, '2022-09-08', NULL, 43, 'CARDENAS PALOMINO JACQUELINE -MTC CARRO ISUZU BLR809', 3, 3, 1, '-1000.0000', '2022-09-08 10:36:14', '2022-09-08 10:36:14', 1),
(46, 3, 4, 1, NULL, '2022-09-07', NULL, NULL, 'IMPUESTO ITF', 3, 3, 1, '-3.0500', '2022-09-08 10:36:49', '2022-09-08 10:36:49', 1),
(47, 2, 22, NULL, NULL, '2022-09-07', NULL, 21, 'COMPRA DE COBRE - VALERIANO', 3, 1, 1, '-14626.0000', '2022-09-08 11:30:00', '2022-09-08 11:30:00', 1),
(48, 2, 11, NULL, NULL, '2022-09-07', NULL, 64, 'COMPRA DE COBRE - VALERIANO', 3, 3, 1, '-11246.5000', '2022-09-08 11:32:57', '2022-09-08 11:32:57', 1),
(49, 5, 2, NULL, NULL, '2022-09-07', NULL, NULL, 'SE HIZO EL MOV PARA EL COBRO DE CHEQUE', 3, 3, 1, '-30000.0000', '2022-09-08 11:33:55', '2022-09-08 11:33:55', 1),
(50, 5, 2, NULL, NULL, '2022-09-07', NULL, NULL, 'SE HIZO EL MOV PARA EL COBRO DE CHEQUE', 10, 3, 1, '30000.0000', '2022-09-08 11:33:55', '2022-09-08 11:33:55', 1),
(51, 2, 12, NULL, NULL, '2022-09-07', NULL, 50, 'SERVICIOS GENERALES JK COMPANY S', 3, 3, 1, '-2479.9000', '2022-09-08 11:35:16', '2022-09-08 11:35:16', 1),
(52, 2, 13, NULL, NULL, '2022-09-07', NULL, 45, 'YSABEL LOARTE ORTEGA', 3, 3, 1, '-4602.0000', '2022-09-08 11:36:13', '2022-09-08 11:36:13', 1),
(53, 3, 5, 1, NULL, '2022-09-06', NULL, NULL, 'IMPUESTO ITF ', 3, 3, 1, '-3.7000', '2022-09-08 11:36:55', '2022-09-08 11:36:55', 1),
(54, 5, 3, NULL, NULL, '2022-09-06', NULL, NULL, 'MOV INTERNO PARA COBRO DE CHEQUE ', 3, 3, 1, '-30000.0000', '2022-09-08 11:38:06', '2022-09-08 11:38:06', 1),
(55, 5, 4, NULL, NULL, '2022-09-06', NULL, NULL, 'MOV INTERNO PARA COBRO DE CHEQUE ', 10, 1, 1, '30000.0000', '2022-09-08 11:38:06', '2022-09-08 11:38:06', 1),
(56, 3, 6, 10, NULL, '2022-09-06', NULL, NULL, 'LUQUE ARAPA 2 MESES DE COMPANY Y 2 MESES DE LIFERLI', 3, 3, 1, '-1000.0000', '2022-09-08 11:40:43', '2022-09-08 11:40:43', 1),
(57, 3, 6, 10, NULL, '2022-09-06', NULL, NULL, 'CANCELACION DE PLANILLA DEL 29 AL 3 DE SETIEMBRE', 3, 3, 1, '-75.0000', '2022-09-08 11:42:05', '2022-09-08 11:42:05', 1),
(58, 2, 14, NULL, NULL, '2022-09-06', NULL, 16, 'OLIVERA HUAMAN E. ', 3, 3, 1, '-21000.0000', '2022-09-08 11:47:13', '2022-09-08 11:47:13', 1),
(59, 2, 32, NULL, NULL, '2022-09-06', NULL, 43, 'SOLORZANO CABELLO WILLEN - APOYO DE CAMPAÑA', 3, 3, 1, '-5000.0000', '2022-09-08 11:48:53', '2022-09-08 11:48:53', 1),
(60, 2, 16, NULL, NULL, '2022-09-06', NULL, 37, 'RICARDO ROJAS ', 3, 3, 1, '-17054.0000', '2022-09-08 12:00:05', '2022-09-08 12:00:05', 1),
(61, 2, 23, NULL, NULL, '2022-09-06', NULL, 73, '1 BALDE DE ACITE CASTROL ', 3, 1, 1, '-406.0000', '2022-09-08 15:50:08', '2022-09-08 15:50:08', 1),
(62, 2, 18, NULL, NULL, '2022-09-05', NULL, 74, 'MARCOS COLLAHUA CELIA ', 3, 3, 1, '-50000.0000', '2022-09-08 15:55:36', '2022-09-08 15:55:36', 1),
(63, 2, 19, NULL, NULL, '2022-09-05', NULL, 74, 'PAUCCARA MAMANI DENIS', 3, 3, 1, '-20000.0000', '2022-09-08 15:56:11', '2022-09-08 15:56:11', 1),
(64, 2, 39, NULL, NULL, '2022-09-06', NULL, 43, 'FLORES VIVIANA A. - TRANSFERENCIA AUTORIZADA POR GLORIA', 3, 3, 1, '-696.5000', '2022-09-08 15:57:58', '2022-09-08 15:57:58', 1),
(65, 3, 7, 11, NULL, '2022-09-08', NULL, NULL, 'PROSEGUR', 3, 3, 1, '-556.9900', '2022-09-08 15:59:10', '2022-09-08 15:59:10', 1),
(66, 2, 21, NULL, NULL, '2022-09-08', NULL, 18, 'CAMPOJO FERNANDEZ M. ', 3, 3, 1, '-75000.0000', '2022-09-08 16:02:43', '2022-09-08 16:02:43', 1),
(67, 2, 24, NULL, NULL, '2022-09-08', NULL, 18, 'CAMPOJO FERNANDEZ', 1, 3, 1, '-25000.0000', '2022-09-08 16:26:36', '2022-09-08 16:26:36', 1),
(68, 2, 30, NULL, NULL, '2022-09-08', NULL, 40, 'PUMA MACHACA ANDERSON', 1, 1, 1, '-20000.0000', '2022-09-08 16:27:38', '2022-09-08 16:27:38', 1),
(69, 2, 26, NULL, NULL, '2022-09-08', NULL, 40, 'MAMANI TICAHUANA LOURDES', 1, 3, 1, '-10000.0000', '2022-09-08 16:40:24', '2022-09-08 16:40:24', 1),
(70, 2, 27, NULL, NULL, '2022-09-08', NULL, 49, 'AMERICA ALEJANDRA CUETO ', 1, 3, 1, '-6074.2000', '2022-09-08 16:42:06', '2022-09-08 16:42:06', 1),
(71, 2, 28, NULL, NULL, '2022-09-08', NULL, 75, 'COMPRA DE ALUMINIO', 1, 3, 1, '-13064.3000', '2022-09-08 16:54:34', '2022-09-08 16:54:34', 1),
(72, 3, 8, 1, NULL, '2022-09-06', NULL, NULL, 'IMPUESTO ITF', 3, 3, 1, '-3.7000', '2022-09-08 17:21:23', '2022-09-08 17:21:23', 1),
(73, 1, 1, NULL, NULL, '2022-09-06', NULL, 48, 'A CUENTA DE ALUMINIO ', 5, 1, 1, '4600.0000', '2022-09-08 17:32:42', '2022-09-08 17:32:42', 1),
(74, 3, 9, 1, NULL, '2022-09-06', NULL, NULL, 'IMPUESTO ITF', 5, 3, 1, '-0.2000', '2022-09-08 17:34:03', '2022-09-08 17:34:03', 1),
(75, 2, 33, NULL, NULL, '2022-09-07', NULL, 52, 'EFECTIVO EN MONEDAS Y BILLETES', 5, 3, 1, '-10000.0000', '2022-09-08 17:35:03', '2022-09-08 17:35:03', 1),
(76, 3, 10, 1, NULL, '2022-09-07', NULL, NULL, 'IMPUESTO ITF', 5, 3, 1, '-0.5000', '2022-09-08 17:36:26', '2022-09-08 17:36:26', 1),
(79, 2, 34, NULL, NULL, '2022-09-08', NULL, 21, 'COMPRA DE ALUMINIO', 8, 3, 1, '-2316.0000', '2022-09-08 17:51:37', '2022-09-08 17:51:37', 1),
(80, 2, 35, NULL, NULL, '2022-09-08', NULL, 75, 'COMPRA DE METALES', 8, 3, 1, '-8277.0000', '2022-09-08 17:55:04', '2022-09-08 17:55:04', 1),
(81, 2, 36, NULL, NULL, '2022-09-08', NULL, 54, 'ELIZABETH ALINA RAMIREZ', 8, 3, 1, '-20000.0000', '2022-09-08 18:04:13', '2022-09-08 18:04:13', 1),
(82, 5, 5, NULL, NULL, '2022-09-08', NULL, NULL, 'MOV PARA COBRO DE CHEQUE', 8, 3, 1, '-25000.0000', '2022-09-08 18:04:46', '2022-09-08 18:04:46', 1),
(83, 5, 8, NULL, NULL, '2022-09-08', NULL, NULL, 'MOV PARA COBRO DE CHEQUE', 10, 3, 1, '25000.0000', '2022-09-08 18:04:46', '2022-09-08 18:04:46', 1),
(84, 3, 11, 1, NULL, '2022-09-07', NULL, NULL, 'IMPUESTO ITF', 8, 3, 1, '-3.6000', '2022-09-08 18:05:19', '2022-09-08 18:05:19', 1),
(85, 2, 37, NULL, NULL, '2022-09-07', NULL, 41, 'MARINOS DE LA CRUZ JULIO/FLORES DUEÑAS JHEISY', 8, 3, 1, '-17000.0000', '2022-09-08 18:08:19', '2022-09-08 18:08:19', 1),
(86, 2, 38, NULL, NULL, '2022-09-07', NULL, 46, 'ESTELA PEREZ KEVIN', 8, 3, 1, '-5184.5000', '2022-09-08 18:09:29', '2022-09-08 18:09:29', 1),
(87, 5, 6, NULL, NULL, '2022-09-07', NULL, NULL, 'MOV PARA RETIRO EN EFECTIVO', 8, 3, 1, '-50000.0000', '2022-09-08 18:11:17', '2022-09-08 18:11:17', 1),
(88, 5, 6, NULL, NULL, '2022-09-07', NULL, NULL, 'MOV PARA RETIRO EN EFECTIVO', 14, 3, 1, '50000.0000', '2022-09-08 18:11:17', '2022-09-08 18:11:17', 1),
(89, 5, 7, NULL, NULL, '2022-09-07', NULL, NULL, 'MOV PARA TRAMITE DE REPRESENTANTES', 8, 3, 1, '-500.0000', '2022-09-08 18:12:17', '2022-09-08 18:12:17', 1),
(90, 5, 7, NULL, NULL, '2022-09-07', NULL, NULL, 'MOV PARA TRAMITE DE REPRESENTANTES', 22, 3, 1, '500.0000', '2022-09-08 18:12:17', '2022-09-08 18:12:17', 1),
(91, 3, 12, 1, NULL, '2022-09-08', NULL, NULL, 'IMPUESTO ITF', 1, 3, 1, '-3.7000', '2022-09-09 10:12:26', '2022-09-09 10:12:26', 1),
(92, 3, 13, 1, NULL, '2022-09-08', NULL, NULL, 'IMPUESTO ITF', 3, 3, 1, '-0.9700', '2022-09-09 10:23:23', '2022-09-09 10:23:23', 1),
(93, 3, 14, 1, NULL, '2022-09-08', NULL, NULL, 'IMPUESTO ITF', 8, 3, 1, '-2.7500', '2022-09-09 10:26:02', '2022-09-09 10:26:02', 1),
(94, 2, 40, NULL, NULL, '2022-09-09', NULL, 18, 'CORPORACION PERUANA DE RECICLAJE', 6, 3, 1, '-75000.0000', '2022-09-09 10:58:49', '2022-09-09 10:58:49', 1),
(95, 2, 41, NULL, NULL, '2022-09-09', NULL, 76, 'EMPRENDIMIENTO AMBIENTAL S', 6, 3, 1, '-21804.0000', '2022-09-09 11:01:13', '2022-09-09 11:01:13', 1),
(96, 3, 15, 1, NULL, '2022-09-08', NULL, NULL, 'IMPUESTO ITF', 6, 3, 1, '-1.0500', '2022-09-09 11:03:05', '2022-09-09 11:03:05', 1),
(97, 2, 42, NULL, NULL, '2022-09-09', NULL, 16, 'HURTADO CARRASCO MARIA DEL R', 8, 3, 1, '-13590.4000', '2022-09-09 11:06:59', '2022-09-09 11:06:59', 1),
(98, 2, 43, NULL, NULL, '2022-09-09', NULL, 18, 'COMPANIA PERUANA DE RECICLAJE', 8, 3, 1, '-50000.0000', '2022-09-09 11:07:46', '2022-09-09 11:07:46', 1),
(100, 3, 16, 1, NULL, '2022-09-09', NULL, NULL, 'IMPUESTO ITF', 8, 3, 1, '-11.1400', '2022-09-09 11:15:53', '2022-09-09 11:15:53', 1),
(101, 2, 44, NULL, NULL, '2022-09-06', NULL, 61, 'CHEQUE 57', 10, 7, 1, '-30000.0000', '2022-09-09 11:20:51', '2022-09-09 11:20:51', 1),
(102, 2, 45, NULL, NULL, '2022-09-07', NULL, 61, 'CHEQUE 57', 10, 7, 1, '-30000.0000', '2022-09-09 11:21:24', '2022-09-09 11:21:24', 1),
(103, 2, 46, NULL, NULL, '2022-09-08', NULL, 61, 'CHEQUE 57', 10, 7, 1, '-30000.0000', '2022-09-09 11:21:51', '2022-09-09 11:21:51', 1),
(104, 3, 17, 1, NULL, '2022-09-06', NULL, NULL, 'IMPUESTO ITF', 10, 3, 1, '-3.0000', '2022-09-09 11:23:25', '2022-09-09 11:23:25', 1),
(105, 3, 17, 1, NULL, '2022-09-07', NULL, NULL, 'IMPUESTO ITF', 10, 3, 1, '-3.0000', '2022-09-09 11:23:53', '2022-09-09 11:23:53', 1),
(106, 3, 17, 1, NULL, '2022-09-08', NULL, NULL, 'IMPUESTO ITF', 10, 3, 1, '-2.7500', '2022-09-09 11:24:49', '2022-09-09 11:24:49', 1),
(107, 3, 18, 5, NULL, '2022-09-06', NULL, NULL, 'RECARGA A CUENTA SUNARP - PARA COPIAS LIETALES', 14, 3, 1, '-200.0000', '2022-09-09 11:28:49', '2022-09-09 11:28:49', 1),
(108, 3, 18, 1, NULL, '2022-09-07', NULL, NULL, 'COPIA LITERAL ', 14, 3, 1, '-18.0000', '2022-09-09 11:29:32', '2022-09-09 11:29:32', 1),
(109, 3, 19, 1, NULL, '2022-09-07', NULL, NULL, 'IMPUESTO ITF', 14, 3, 1, '-5.0000', '2022-09-09 11:50:19', '2022-09-09 11:50:19', 1),
(110, 5, 9, NULL, NULL, '2022-09-07', NULL, NULL, 'RETIRO DE EFECTIVO LILLIAN ', 14, 3, 1, '-50000.0000', '2022-09-09 11:51:03', '2022-09-09 11:51:03', 1),
(111, 5, 9, NULL, NULL, '2022-09-07', NULL, NULL, 'RETIRO DE EFECTIVO LILLIAN ', 22, 3, 1, '50000.0000', '2022-09-09 11:51:04', '2022-09-09 11:51:04', 1),
(112, 2, 47, NULL, NULL, '2022-09-09', NULL, 18, 'COMPAÑIA PERUANA DE RECICLAJE', 1, 3, 1, '-75000.0000', '2022-09-09 12:07:30', '2022-09-09 12:07:30', 1),
(113, 2, 48, NULL, NULL, '2022-09-09', NULL, 43, 'BASILIO JUANDE MIRKO D. - APOYO CAMPAÑA WILY', 1, 3, 1, '-1000.0000', '2022-09-09 12:08:33', '2022-09-09 12:08:33', 1),
(114, 2, 50, NULL, NULL, '2022-09-06', NULL, 44, 'COMPRA DE  PERFIL Y COBRE', 22, 1, 1, '-17464.3500', '2022-09-09 16:31:09', '2022-09-09 16:31:09', 1),
(116, 1, 2, NULL, NULL, '2022-09-06', NULL, 48, 'A CUENTA', 22, 1, 1, '3010.0000', '2022-09-09 16:35:17', '2022-09-09 16:35:17', 1),
(117, 3, 20, 10, NULL, '2022-09-06', NULL, NULL, 'DANIEL - ADELANTO ', 22, 1, 1, '-20.0000', '2022-09-09 16:36:29', '2022-09-09 16:36:29', 1),
(118, 3, 21, 10, NULL, '2022-09-06', NULL, NULL, 'LILLIAN - ADELANTO', 22, 1, 1, '-100.0000', '2022-09-09 16:37:32', '2022-09-09 16:37:32', 1),
(119, 3, 21, 10, NULL, '2022-09-05', NULL, NULL, 'ADELANTO', 22, 1, 1, '-550.0000', '2022-09-09 16:38:04', '2022-09-09 16:38:04', 1),
(120, 2, 51, NULL, NULL, '2022-09-06', NULL, 79, 'PARA COMPRA DE MATERIAL', 22, 1, 1, '-4000.0000', '2022-09-09 17:13:40', '2022-09-09 17:13:40', 1),
(121, 2, 52, NULL, NULL, '2022-09-06', NULL, 41, 'A CUENTA', 22, 1, 1, '-67.5000', '2022-09-09 17:14:48', '2022-09-09 17:14:48', 1),
(122, 2, 53, NULL, NULL, '2022-09-06', NULL, 41, 'CARROCERIA 39*4', 22, 1, 1, '-150.0000', '2022-09-09 17:18:53', '2022-09-09 17:18:53', 1),
(123, 3, 22, 10, NULL, '2022-09-06', NULL, NULL, 'ADELANTO', 22, 1, 1, '-2.0000', '2022-09-09 17:19:43', '2022-09-09 17:19:43', 1),
(124, 3, 23, 10, NULL, '2022-09-06', NULL, NULL, 'ADELANTO', 22, 1, 1, '-100.0000', '2022-09-09 17:22:27', '2022-09-09 17:22:27', 1),
(125, 2, 54, NULL, NULL, '2022-09-06', NULL, 79, 'ADELANTO MANO DE OBRA', 22, 1, 1, '-5000.0000', '2022-09-09 17:42:57', '2022-09-09 17:42:57', 1),
(126, 2, 55, NULL, NULL, '2022-09-06', NULL, 73, 'COMPRA DE BATERIAS', 22, 1, 1, '-920.0000', '2022-09-09 17:43:39', '2022-09-09 17:43:39', 1),
(127, 2, 56, NULL, NULL, '2022-09-06', NULL, 49, 'FLETE DE CUETO', 22, 1, 1, '-210.0000', '2022-09-09 17:44:19', '2022-09-09 17:44:19', 1),
(128, 1, 3, NULL, NULL, '2022-09-07', NULL, 66, 'PAGO', 22, 1, 1, '396.7000', '2022-09-10 11:05:48', '2022-09-10 11:05:48', 1),
(129, 3, 24, 10, NULL, '2022-09-08', NULL, NULL, 'ADELANTO - PLANILLA', 22, 1, 1, '-100.0000', '2022-09-10 11:06:43', '2022-09-10 11:06:43', 1),
(130, 3, 27, 1, NULL, '2022-09-08', NULL, NULL, 'DANIEL- ADELANTO', 22, 1, 1, '-20.0000', '2022-09-10 11:07:33', '2022-09-10 11:07:33', 1),
(131, 3, 25, 10, NULL, '2022-09-08', NULL, NULL, 'LILLIAN -ADELANTO', 22, 1, 1, '-100.0000', '2022-09-10 11:08:19', '2022-09-10 11:08:19', 1),
(132, 3, 25, 10, NULL, '2022-09-08', NULL, NULL, 'ADELANTO -DANIEL', 22, 1, 1, '-100.0000', '2022-09-10 11:09:04', '2022-09-10 11:09:04', 1),
(133, 2, 57, NULL, NULL, '2022-09-09', NULL, 36, 'PAGO DE FACTURAS', 22, 1, 1, '-15777.3000', '2022-09-10 11:11:35', '2022-09-10 11:11:35', 1),
(134, 3, 28, 3, NULL, '2022-09-08', NULL, NULL, 'PAGO DE DELFO', 22, 1, 1, '-430.0000', '2022-09-10 11:12:17', '2022-09-10 11:12:17', 1),
(135, 3, 35, 7, NULL, '2022-09-09', NULL, NULL, 'LILLIAN - TAXI COMPRAS ', 22, 1, 1, '-15.0000', '2022-09-10 11:17:16', '2022-09-10 11:17:16', 1),
(136, 3, 30, 10, NULL, '2022-09-08', NULL, NULL, 'ROBERTO-PLANILLA', 22, 1, 1, '-50.0000', '2022-09-10 11:21:36', '2022-09-10 11:21:36', 1),
(137, 1, 4, NULL, NULL, '2022-09-09', NULL, 80, 'VENTA DE COCALATA', 22, 1, 1, '5424.0000', '2022-09-10 11:25:29', '2022-09-10 11:25:29', 1),
(138, 3, 31, 5, NULL, '2022-09-09', NULL, NULL, 'BEIMER- LEGALIZACION LIBRO DE ACTAS BEYRO - MAHU Y ROY', 22, 1, 1, '-161.0000', '2022-09-10 11:28:08', '2022-09-10 11:28:08', 1),
(139, 3, 32, 1, NULL, '2022-09-09', NULL, NULL, 'DIDIER- CORPDIERP Y SOGRUP53', 22, 1, 1, '-131.0000', '2022-09-10 11:35:50', '2022-09-10 11:35:50', 1),
(140, 3, 33, 5, NULL, '2022-09-09', NULL, NULL, 'LILLIAN -LEGALIZACION LB ACTAS LIFERLI G29T', 22, 1, 1, '-131.0000', '2022-09-10 11:39:32', '2022-09-10 11:39:32', 1),
(141, 3, 33, 10, NULL, '2022-09-09', NULL, NULL, 'ADELANTO ', 22, 1, 1, '-30.0000', '2022-09-10 11:39:56', '2022-09-10 11:39:56', 1),
(142, 2, 58, NULL, NULL, '2022-09-09', NULL, 79, 'CANCELACION DE MATERIALES DE PRENSA', 22, 1, 1, '-696.0000', '2022-09-10 11:40:35', '2022-09-10 11:40:35', 1),
(143, 2, 59, NULL, NULL, '2022-09-09', NULL, 79, 'ADELANTO MANO DE OBRA', 22, 1, 1, '-2000.0000', '2022-09-10 11:41:06', '2022-09-10 11:41:06', 1),
(144, 2, 60, NULL, NULL, '2022-09-09', NULL, 73, 'PETROLEO PARA EL CARROS', 22, 1, 1, '-82.0000', '2022-09-10 11:41:59', '2022-09-10 11:41:59', 1),
(145, 2, 61, NULL, NULL, '2022-09-06', NULL, 37, 'COMPRA DE GRUPO', 22, 1, 1, '-40000.0000', '2022-09-10 11:42:40', '2022-09-10 11:42:40', 1),
(146, 2, 62, NULL, NULL, '2022-09-05', NULL, 79, 'MATERIALES PARA BOTELLA HIDRAHULICA', 22, 1, 1, '-2000.0000', '2022-09-10 11:47:01', '2022-09-10 11:47:01', 1),
(147, 3, 37, 7, NULL, '2022-09-06', NULL, NULL, 'LILLIAN PEAJE PARA DEJAR CHEQUES', 22, 1, 1, '-6.5000', '2022-09-10 12:03:42', '2022-09-10 12:03:42', 1),
(148, 3, 34, 12, NULL, '2022-09-10', NULL, NULL, 'COMPRAS TOTUS', 22, 2, 1, '-115.1000', '2022-09-10 12:04:41', '2022-09-10 12:04:41', 1),
(149, 3, 36, 10, NULL, '2022-09-09', NULL, NULL, 'VUELTO DE TOTUUS-PLANILLA', 22, 1, 1, '-29.9000', '2022-09-10 12:08:33', '2022-09-10 12:08:33', 1),
(150, 3, 37, 10, NULL, '2022-09-09', NULL, NULL, 'LILLIAN VUELTO DE 100- ', 22, 1, 1, '-93.5000', '2022-09-10 12:10:53', '2022-09-10 12:10:53', 1),
(151, 3, 38, 10, NULL, '2022-09-08', NULL, NULL, 'EDGAR - PLANILLA', 22, 1, 1, '-180.0000', '2022-09-10 12:43:07', '2022-09-10 12:43:07', 1),
(152, 3, 39, 1, 'BANCO', '2022-09-10', NULL, NULL, 'IMPUESTO ITF', 1, 3, 1, '-3.8000', '2022-09-12 10:27:09', '2022-09-12 10:27:09', 1),
(153, 3, 39, 11, 'FIBERPRO', '2022-09-10', NULL, NULL, 'SERVICIO DE INTERNET', 1, 3, 1, '-90.0000', '2022-09-12 10:28:06', '2022-09-12 10:28:06', 1),
(154, 3, 40, 3, 'DIDIER', '2022-09-10', NULL, NULL, 'SERVICIO DE ALINEAMIENTO AXF893', 1, 3, 1, '-120.0000', '2022-09-12 10:30:59', '2022-09-12 10:30:59', 1),
(155, 3, 40, 10, 'NOLBERTO ', '2022-09-10', NULL, NULL, 'DEL 5 AL 10 DE SETIEMBRE ', 1, 3, 1, '-470.0000', '2022-09-12 10:32:17', '2022-09-12 10:32:17', 1),
(156, 3, 40, 10, 'JOSE', '2022-09-10', NULL, NULL, 'DEL 5 AL 10 DE SETIEMBRE ', 1, 3, 1, '-191.6700', '2022-09-12 10:32:56', '2022-09-12 10:32:56', 1),
(157, 3, 40, 10, 'ANIBAL', '2022-09-10', NULL, NULL, 'DEL 5 AL 10 DE SETIEMBRE ', 1, 3, 1, '-489.5800', '2022-09-12 10:34:23', '2022-09-12 10:34:23', 1),
(158, 3, 40, 10, 'ROSALINO', '2022-09-10', NULL, NULL, 'DEL 5 AL 10 DE SETIEMBRE ', 1, 3, 1, '-625.0000', '2022-09-12 10:37:00', '2022-09-12 10:37:00', 1),
(159, 3, 40, 10, 'VALERIANO', '2022-09-10', NULL, NULL, 'DEL 5 AL 10 DE SETIEMBRE ', 1, 3, 1, '-500.0000', '2022-09-12 10:37:35', '2022-09-12 10:37:35', 1),
(160, 3, 40, 10, 'VALERIANO', '2022-09-10', NULL, NULL, 'DEL 5 AL 10 DE SETIEMBRE ', 1, 3, 1, '-572.9200', '2022-09-12 10:39:02', '2022-09-12 10:39:02', 1),
(161, 3, 41, 10, 'LUIS', '2022-09-10', NULL, NULL, 'DEL 5 AL 10 DE SETIEMBRE ', 1, 3, 1, '-572.9200', '2022-09-12 10:41:34', '2022-09-12 10:41:34', 1),
(162, 3, 41, 1, 'EDIN', '2022-09-10', NULL, NULL, 'DEL 5 AL 10 DE SETIEMBRE -VACACIONES', 1, 3, 1, '-500.0000', '2022-09-12 10:42:12', '2022-09-12 10:42:12', 1),
(163, 3, 41, 10, 'DIDIER', '2022-09-10', NULL, NULL, 'DEL 5 AL 10 DE SETIEMBRE ', 1, 3, 1, '-500.0000', '2022-09-12 10:42:49', '2022-09-12 10:42:49', 1),
(164, 3, 41, 10, 'BEBETO', '2022-09-10', NULL, NULL, 'DEL 5 AL 10 DE SETIEMBRE ', 1, 3, 1, '-625.0000', '2022-09-12 10:43:31', '2022-09-12 10:43:31', 1),
(165, 3, 42, 14, 'TTP', '2022-09-12', NULL, NULL, 'PAGO DE TTP', 1, 3, 1, '-4780.6000', '2022-09-12 10:44:28', '2022-09-12 10:44:28', 1),
(166, 3, 43, 10, 'ALFREDO', '2022-09-10', NULL, NULL, 'DEL 5 AL 10 DE SETIEMBRE ', 1, 3, 1, '-450.0000', '2022-09-12 11:01:56', '2022-09-12 11:01:56', 1),
(167, 2, 64, NULL, NULL, '2022-09-09', NULL, 61, 'RIVERA ROXANA ', 3, 3, 1, '-9000.0000', '2022-09-12 11:14:41', '2022-09-12 11:14:41', 1),
(168, 2, 65, NULL, NULL, '2022-09-09', NULL, 61, 'PAJA APAZA JOSE A', 3, 3, 1, '-1000.5000', '2022-09-12 11:15:27', '2022-09-12 11:15:27', 1),
(169, 3, 44, 1, 'BANCO', '2022-09-09', NULL, NULL, 'IMPUESTO ITF', 3, 3, 1, '-0.5000', '2022-09-12 11:16:10', '2022-09-12 11:16:10', 1),
(170, 1, 5, NULL, NULL, '2022-09-09', NULL, 4, '0PE1000001 ZINC INDUST', 4, 3, 1, '43284.4600', '2022-09-12 11:31:00', '2022-09-12 11:31:00', 1),
(171, 1, 6, NULL, NULL, '2022-09-09', NULL, 4, '0PE1000001 ZINC INDUST', 4, 3, 1, '140477.6700', '2022-09-12 11:37:06', '2022-09-12 11:37:06', 1),
(172, 3, 45, 1, 'BANCO', '2022-09-09', NULL, NULL, 'IMPUESTO ITF', 4, 3, 1, '-9.1500', '2022-09-12 11:37:42', '2022-09-12 11:37:42', 1),
(174, 3, 46, 1, 'BANCO', '2022-09-09', NULL, NULL, 'IMPUESTO ITF', 6, 3, 1, '-3.7500', '2022-09-12 11:50:24', '2022-09-12 11:50:24', 1),
(175, 2, 66, NULL, NULL, '2022-09-09', NULL, 61, 'CURO JUANITO HECTOR', 8, 3, 1, '-4567.0000', '2022-09-12 12:10:50', '2022-09-12 12:10:50', 1),
(176, 2, 67, NULL, NULL, '2022-09-09', NULL, 43, 'COMERCIALIZADORA B Y L', 8, 3, 1, '-3000.0000', '2022-09-12 12:17:32', '2022-09-12 12:17:32', 1),
(177, 3, 47, 1, 'BANCO', '2022-09-09', NULL, NULL, 'IMPUESTO ITF', 8, 3, 1, '-4.0500', '2022-09-12 12:23:16', '2022-09-12 12:23:16', 1),
(178, 3, 48, 8, 'TOÑO', '2022-09-10', NULL, NULL, 'DESTAPADO DE BATERIAS', 8, 3, 1, '-488.9000', '2022-09-13 09:43:04', '2022-09-13 09:43:04', 1),
(179, 3, 49, 4, 'DEISY', '2022-09-10', NULL, NULL, 'AGENDA', 8, 3, 1, '-77.0000', '2022-09-13 09:43:41', '2022-09-13 09:43:41', 1),
(180, 3, 50, 11, 'SEÑORA DE LIMPIEZA', '2022-09-10', NULL, NULL, 'PAGO DE UN DIA DE LIMPIEZA', 8, 3, 1, '-30.0000', '2022-09-13 09:46:55', '2022-09-13 09:46:55', 1),
(181, 2, 68, NULL, NULL, '2022-09-10', NULL, 81, 'CANCELACION ', 8, 3, 1, '-73.5000', '2022-09-13 09:48:22', '2022-09-13 09:48:22', 1),
(184, 2, 70, NULL, NULL, '2022-09-12', NULL, 45, 'YSABEL LOARTE ORTEGA', 8, 3, 1, '-17000.0000', '2022-09-13 09:50:56', '2022-09-13 09:50:56', 1),
(185, 3, 51, 1, 'BANCO', '2022-09-09', NULL, NULL, 'IMPUESTO ITF', 8, 3, 1, '-0.8500', '2022-09-13 09:51:47', '2022-09-13 09:51:47', 1),
(186, 5, 11, NULL, NULL, '2022-09-09', NULL, NULL, 'MOV INTERNO -DIDIER', 16, 3, 1, '-11790.0000', '2022-09-13 09:54:57', '2022-09-13 09:54:57', 1),
(187, 5, 11, NULL, NULL, '2022-09-09', NULL, NULL, 'MOV INTERNO -DIDIER', 8, 3, 1, '11790.0000', '2022-09-13 09:54:57', '2022-09-13 09:54:57', 1),
(188, 5, 12, NULL, NULL, '2022-09-12', NULL, NULL, 'MOV INTERNO', 8, 3, 1, '-105.0000', '2022-09-13 09:59:23', '2022-09-13 09:59:23', 1),
(189, 5, 12, NULL, NULL, '2022-09-12', NULL, NULL, 'MOV INTERNO', 22, 3, 1, '105.0000', '2022-09-13 09:59:24', '2022-09-13 09:59:24', 1),
(190, 2, 71, NULL, NULL, '2022-09-12', NULL, 43, 'CHEQUE 00000044', 1, 7, 1, '-1400.0000', '2022-09-13 10:38:43', '2022-09-13 10:38:43', 1),
(192, 2, 72, NULL, NULL, '2022-09-12', NULL, 74, 'YUPANQUI VILLAMAR GILDA', 1, 3, 1, '-5500.0000', '2022-09-13 10:48:48', '2022-09-13 10:48:48', 1),
(193, 2, 73, NULL, NULL, '2022-09-12', NULL, 74, 'ROSMERY RAMIREZ C', 1, 3, 1, '-4500.0000', '2022-09-13 10:49:32', '2022-09-13 10:49:32', 1),
(194, 3, 53, 1, 'BANCO', '2022-09-10', NULL, NULL, 'IMPUESTO ITF', 1, 3, 1, '-0.7000', '2022-09-13 11:13:55', '2022-09-13 11:13:55', 1),
(195, 2, 74, NULL, NULL, '2022-09-12', NULL, 40, 'MAMANI HUAMAN SOLEDAD', 3, 3, 1, '-35000.0000', '2022-09-13 11:21:43', '2022-09-13 11:21:43', 1),
(196, 3, 54, 1, 'BANCO', '2022-09-12', NULL, NULL, 'IMPUESTO ITF', 3, 3, 1, '-1.7500', '2022-09-13 11:22:13', '2022-09-13 11:22:13', 1),
(197, 1, 8, NULL, NULL, '2022-09-13', NULL, 4, '0PE1000001 ZINC INDUST', 3, 3, 1, '144701.6000', '2022-09-13 11:22:44', '2022-09-13 11:22:44', 1),
(198, 2, 81, NULL, NULL, '2022-09-12', NULL, 74, 'YUPANQUI WILLAMAR', 4, 3, 1, '-50000.0000', '2022-09-13 11:25:30', '2022-09-13 11:25:30', 1),
(199, 2, 76, NULL, NULL, '2022-09-12', NULL, 21, 'COMPRA DE COBRE', 4, 3, 1, '-20530.2000', '2022-09-13 11:26:18', '2022-09-13 11:26:18', 1),
(200, 3, 55, 1, 'BANCO', '2022-09-12', NULL, NULL, 'IMPUESTO ITF', 4, 3, 1, '-3.5000', '2022-09-13 11:27:26', '2022-09-13 11:27:26', 1),
(201, 1, 9, NULL, NULL, '2022-09-12', NULL, 4, '0PE1000001 ZINC INDUST', 4, 3, 1, '60661.4400', '2022-09-13 11:28:21', '2022-09-13 11:28:21', 1),
(202, 3, 56, 14, 'SAUL', '2022-09-12', NULL, NULL, 'FLETE DE CONTENEDOR DE ALUMINIO DURO', 4, 3, 1, '-654.0000', '2022-09-13 11:32:00', '2022-09-13 11:32:00', 1),
(206, 2, 80, NULL, NULL, '2022-09-13', NULL, 1, 'RAUL VASQUEZ ', 5, 3, 1, '-10000.0000', '2022-09-13 11:42:22', '2022-09-13 11:42:22', 1),
(207, 5, 13, NULL, NULL, '2022-09-12', NULL, NULL, 'MOV INTERNO ', 5, 3, 1, '-75100.0000', '2022-09-13 11:44:59', '2022-09-13 11:44:59', 1),
(208, 5, 13, NULL, NULL, '2022-09-12', NULL, NULL, 'MOV INTERNO ', 14, 3, 1, '75100.0000', '2022-09-13 11:44:59', '2022-09-13 11:44:59', 1),
(209, 3, 58, 1, 'BANCO', '2022-09-12', NULL, NULL, 'IMPUESTO ITF', 5, 3, 1, '-3.7500', '2022-09-13 11:46:33', '2022-09-13 11:46:33', 1),
(210, 2, 82, NULL, NULL, '2022-09-12', NULL, 82, 'CORDOVA ARISAPANA ', 6, 3, 1, '-50000.0000', '2022-09-13 11:50:48', '2022-09-13 11:50:48', 1),
(211, 5, 14, NULL, NULL, '2022-09-12', NULL, NULL, 'MOV INTERNO', 6, 3, 1, '-25000.0000', '2022-09-13 11:51:26', '2022-09-13 11:51:26', 1),
(212, 5, 14, NULL, NULL, '2022-09-12', NULL, NULL, 'MOV INTERNO', 14, 3, 1, '25000.0000', '2022-09-13 11:51:26', '2022-09-13 11:51:26', 1),
(213, 3, 59, 1, 'BANCO', '2022-09-12', NULL, NULL, 'IMPUESTO ITF', 6, 3, 1, '-3.7500', '2022-09-13 11:52:08', '2022-09-13 11:52:08', 1),
(214, 5, 15, NULL, NULL, '2022-09-12', NULL, NULL, 'RATIRO DE VENTANILLA', 14, 3, 1, '-100000.0000', '2022-09-13 11:58:03', '2022-09-13 11:58:03', 1),
(215, 5, 15, NULL, NULL, '2022-09-12', NULL, NULL, 'RATIRO DE VENTANILLA', 22, 3, 1, '100000.0000', '2022-09-13 11:58:03', '2022-09-13 11:58:03', 1),
(216, 3, 60, 1, 'BANCO', '2022-09-12', NULL, NULL, 'IMPUESTO ITF', 14, 3, 1, '-10.0000', '2022-09-13 11:58:42', '2022-09-13 11:58:42', 1),
(217, 5, 16, NULL, NULL, '2022-09-12', NULL, NULL, 'MOV INTERNO', 14, 3, 1, '-100.0000', '2022-09-13 12:00:40', '2022-09-13 12:00:40', 1),
(218, 5, 16, NULL, NULL, '2022-09-12', NULL, NULL, 'MOV INTERNO', 22, 3, 1, '100.0000', '2022-09-13 12:00:40', '2022-09-13 12:00:40', 1),
(219, 2, 83, NULL, NULL, '2022-09-12', NULL, 82, 'EFECTIVO', 22, 3, 1, '-3600.0000', '2022-09-13 12:09:15', '2022-09-13 12:09:15', 1),
(220, 3, 61, 10, 'ADELANTO ', '2022-09-10', NULL, NULL, 'ADELANTO', 22, 1, 1, '-20.0000', '2022-09-13 12:40:20', '2022-09-13 12:40:20', 1),
(221, 3, 62, 10, 'ROBERTO', '2022-09-09', NULL, NULL, 'ADELANTO ', 22, 1, 1, '-50.0000', '2022-09-13 12:42:39', '2022-09-13 12:42:39', 1),
(222, 2, 84, NULL, NULL, '2022-09-09', NULL, 73, 'MECANICO -DIDIER ', 22, 1, 1, '-2000.0000', '2022-09-13 12:44:32', '2022-09-13 12:44:32', 1),
(223, 2, 85, NULL, NULL, '2022-09-09', NULL, 79, 'COMPRA DE MATERIALES', 22, 1, 1, '-1240.0000', '2022-09-13 12:46:51', '2022-09-13 12:46:51', 1),
(224, 3, 63, 10, 'JUNIOR', '2022-09-10', NULL, NULL, 'ADELANTO', 22, 3, 1, '-10.0000', '2022-09-13 12:53:43', '2022-09-13 12:53:43', 1),
(225, 2, 86, NULL, NULL, '2022-09-10', NULL, 81, 'COMPRA DE MATERIAL', 22, 1, 1, '-600.0000', '2022-09-13 12:55:01', '2022-09-13 12:55:01', 1),
(226, 3, 64, 10, 'ERICSON', '2022-09-10', NULL, NULL, 'DEL 5 AL 10 DE SETIEMBRE', 22, 1, 1, '-300.0000', '2022-09-13 12:56:51', '2022-09-13 12:56:51', 1),
(227, 3, 64, 10, 'DANIEL', '2022-09-10', NULL, NULL, 'DEL 5 AL 10 DE SETIEMBRE', 22, 1, 1, '-244.0000', '2022-09-13 12:57:22', '2022-09-13 12:57:22', 1),
(228, 3, 64, 10, 'JUNIOR', '2022-09-10', NULL, NULL, 'DEL 5 AL 10 DE SETIEMBRE', 22, 1, 1, '-304.0000', '2022-09-13 12:57:58', '2022-09-13 12:57:58', 1),
(229, 3, 64, 10, 'ROBERTO', '2022-09-10', NULL, NULL, 'DEL 5 AL 10 DE SETIEMBRE', 22, 1, 1, '-100.0000', '2022-09-13 12:58:27', '2022-09-13 12:58:27', 1),
(230, 3, 102, 10, 'DEISY', '2022-09-10', NULL, NULL, 'ADELANTO', 22, 1, 1, '-101.0000', '2022-09-13 12:59:13', '2022-09-13 12:59:13', 1),
(231, 1, 10, NULL, NULL, '2022-09-12', NULL, 66, 'EFECTIVO', 22, 1, 1, '500.0000', '2022-09-13 13:03:49', '2022-09-13 13:03:49', 1),
(232, 2, 98, NULL, NULL, '2022-09-12', NULL, 79, 'A CUENTA MANO DE OBRA', 22, 1, 1, '-1000.0000', '2022-09-13 13:06:09', '2022-09-13 13:06:09', 1),
(233, 2, 88, NULL, NULL, '2022-09-12', NULL, 83, 'COMPRA DE COBRE ', 22, 1, 1, '-27000.0000', '2022-09-13 13:07:40', '2022-09-13 13:07:40', 1),
(234, 3, 65, 10, 'EDGAR', '2022-09-12', NULL, NULL, 'ADELANTO - DESCONTAR SEMANAL -80', 22, 1, 1, '-300.0000', '2022-09-13 13:09:52', '2022-09-13 13:09:52', 1),
(235, 2, 89, NULL, NULL, '2022-09-12', NULL, 79, 'DEPOSITO FCTURAS - COMPRA DE MATERIALES ', 22, 1, 1, '-7100.0000', '2022-09-13 13:11:10', '2022-09-13 13:11:10', 1),
(236, 3, 66, 11, 'ALEJO', '2022-09-13', NULL, NULL, 'CANCELACION DE TINA', 22, 1, 1, '-1100.0000', '2022-09-13 13:14:06', '2022-09-13 13:14:06', 1),
(237, 1, 11, NULL, NULL, '2022-09-13', NULL, 4, '0PE1000001 ZINC INDUST', 3, 3, 1, '37997.4700', '2022-09-14 10:17:38', '2022-09-14 10:17:38', 1),
(239, 3, 67, 1, 'BANCO', '2022-09-13', NULL, NULL, 'IMPUESTO ITF', 3, 3, 1, '-9.0500', '2022-09-14 10:18:51', '2022-09-14 10:18:51', 1),
(240, 1, 12, NULL, NULL, '2022-09-13', NULL, 4, '0PE1000001 ZINC INDUST', 4, 3, 1, '42668.5600', '2022-09-14 10:22:12', '2022-09-14 10:22:12', 1),
(242, 3, 68, 1, 'BANCO', '2022-09-13', NULL, NULL, 'IMPUESTO ITF', 4, 3, 1, '-5.1000', '2022-09-14 10:24:44', '2022-09-14 10:24:44', 1),
(243, 2, 90, NULL, NULL, '2022-09-13', NULL, 82, 'CORDOVA ARIZAPANA ANABEL', 5, 3, 1, '-7532.0000', '2022-09-14 10:31:46', '2022-09-14 10:31:46', 1),
(244, 2, 91, NULL, NULL, '2022-09-13', NULL, 40, 'MAMANI SOLEDAD / RAMIREZ CALLOCONDO ALEX', 5, 3, 1, '-20000.0000', '2022-09-14 10:37:29', '2022-09-14 10:37:29', 1),
(245, 3, 69, 1, 'BANCO', '2022-09-13', NULL, NULL, 'IMPUESTO ITF', 5, 3, 1, '-1.9000', '2022-09-14 11:30:14', '2022-09-14 11:30:14', 1),
(246, 1, 13, NULL, NULL, '2022-09-13', NULL, 84, 'VENTA DDE PVC ', 5, 3, 1, '1125.0000', '2022-09-14 14:58:38', '2022-09-14 14:58:38', 1),
(247, 1, 14, NULL, NULL, '2022-09-14', NULL, 57, ' ABONO PAG PROVE', 5, 3, 1, '38319.2400', '2022-09-14 14:59:18', '2022-09-14 14:59:18', 1),
(248, 2, 92, NULL, NULL, '2022-09-13', NULL, 61, 'GARCIA ZUÑIGA MILAGROS', 6, 3, 1, '-1815.0000', '2022-09-14 15:02:52', '2022-09-14 15:02:52', 1),
(249, 3, 70, 1, 'BANCO', '2022-09-13', NULL, NULL, 'IMPUESTO ITF', 6, 3, 1, '-0.0500', '2022-09-14 15:03:50', '2022-09-14 15:03:50', 1),
(250, 3, 72, 1, 'JUAN', '2022-09-13', NULL, NULL, 'ALMUERZOS ', 6, 3, 1, '-59.0000', '2022-09-14 15:04:52', '2022-09-14 15:04:52', 1),
(251, 2, 93, NULL, NULL, '2022-09-14', NULL, 1, 'RAUL VASQUEZ', 8, 3, 1, '-16000.0000', '2022-09-14 15:07:18', '2022-09-14 15:07:18', 1),
(252, 5, 17, NULL, NULL, '2022-09-14', NULL, NULL, 'MOV INTERNO ', 8, 3, 1, '-1000.0000', '2022-09-14 15:09:38', '2022-09-14 15:09:38', 1),
(253, 5, 17, NULL, NULL, '2022-09-14', NULL, NULL, 'MOV INTERNO ', 14, 3, 1, '1000.0000', '2022-09-14 15:09:38', '2022-09-14 15:09:38', 1),
(254, 2, 94, NULL, NULL, '2022-09-14', NULL, 60, 'JIMMY FRANCIS PORTALANZAS ', 8, 3, 1, '-10000.0000', '2022-09-14 15:10:44', '2022-09-14 15:10:44', 1),
(255, 2, 95, NULL, NULL, '2022-09-14', NULL, 43, 'COMERCIALIZADORA  B Y L - PERMISOS DE WOLF  RESOLUCION DE REISIDUOS PELIGROSOS', 8, 3, 1, '-4500.0000', '2022-09-14 15:14:02', '2022-09-14 15:14:02', 1),
(256, 1, 15, NULL, NULL, '2022-09-13', NULL, 55, 'INGRESO', 8, 3, 1, '4000.0000', '2022-09-14 15:16:04', '2022-09-14 15:16:04', 1),
(257, 2, 96, NULL, NULL, '2022-09-14', NULL, 43, 'INFANTES MARTINEZ ANGEL R. - CAMPAÑA DE WILY ', 8, 3, 1, '-1807.5000', '2022-09-14 15:18:02', '2022-09-14 15:18:02', 1),
(258, 2, 97, NULL, NULL, '2022-09-14', NULL, 43, 'PERMISOS DE EXPORTACION', 14, 3, 1, '-1068.0000', '2022-09-14 15:21:01', '2022-09-14 15:21:01', 1),
(259, 1, 16, NULL, NULL, '2022-09-12', NULL, 84, 'VENTA DE PVC ', 22, 1, 1, '3000.0000', '2022-09-14 15:47:16', '2022-09-14 15:47:16', 1),
(260, 2, 99, NULL, NULL, '2022-09-14', NULL, 21, 'COMPRA DE COBRE', 22, 1, 1, '-21790.0000', '2022-09-14 15:54:38', '2022-09-14 15:54:38', 1),
(261, 2, 100, NULL, NULL, '2022-09-13', NULL, 28, 'COMPRA DE COBRE', 22, 1, 1, '-28410.0000', '2022-09-14 15:55:20', '2022-09-14 15:55:20', 1),
(262, 3, 73, 10, 'ROBERTO', '2022-09-13', NULL, NULL, 'ADELANTO', 22, 1, 1, '-100.0000', '2022-09-14 15:56:05', '2022-09-14 15:56:05', 1),
(263, 2, 227, NULL, NULL, '2022-09-14', NULL, 73, 'SOLDADURA', 22, 1, 1, '-100.0000', '2022-09-14 15:56:46', '2022-09-14 15:56:46', 1),
(264, 2, 102, NULL, NULL, '2022-09-13', NULL, 79, 'COMPRA DE OXIGENO +50 A CUENTA ', 22, 1, 1, '-400.0000', '2022-09-14 15:57:24', '2022-09-14 15:57:24', 1),
(265, 2, 103, NULL, NULL, '2022-09-14', NULL, 60, 'FLETE', 22, 1, 1, '-4300.0000', '2022-09-14 15:57:53', '2022-09-14 15:57:53', 1),
(266, 3, 74, 10, 'JUNIOR', '2022-09-14', NULL, NULL, 'ADELANTO', 22, 1, 1, '-50.0000', '2022-09-14 15:58:49', '2022-09-14 15:58:49', 1),
(267, 1, 17, NULL, NULL, '2022-09-14', NULL, 55, 'INGRESO DE OLLA', 22, 1, 1, '3600.0000', '2022-09-14 16:00:03', '2022-09-14 16:00:03', 1),
(268, 3, 75, 10, 'JOSE', '2022-09-14', NULL, NULL, 'ADELANTO ', 22, 1, 1, '-50.0000', '2022-09-14 16:03:53', '2022-09-14 16:03:53', 1),
(269, 3, 75, 10, 'LILLIAN', '2022-09-14', NULL, NULL, 'ADELANTO ', 22, 1, 1, '-200.0000', '2022-09-14 16:04:19', '2022-09-14 16:04:19', 1),
(270, 1, 18, NULL, NULL, '2022-09-14', NULL, 4, '0PE1000001 ZINC INDUST', 4, 3, 1, '43510.1400', '2022-09-15 11:20:40', '2022-09-15 11:20:40', 1),
(271, 3, 76, 1, 'BANCO', '2022-09-14', NULL, NULL, 'IMPUESTO ITF', 4, 3, 1, '-2.1500', '2022-09-15 11:27:47', '2022-09-15 11:27:47', 1),
(272, 2, 104, NULL, NULL, '2022-09-15', NULL, 55, 'COMPRA DE COBRE', 5, 1, 1, '-24589.7000', '2022-09-15 11:36:44', '2022-09-15 11:36:44', 1),
(273, 2, 105, NULL, NULL, '2022-09-15', NULL, 40, 'RODRIGUEZ QUICANA LUIS', 5, 3, 1, '-3800.0000', '2022-09-15 11:38:17', '2022-09-15 11:38:17', 1),
(274, 3, 77, 1, 'BANCO', '2022-09-14', NULL, NULL, 'IMPUESTO ITF', 5, 3, 1, '-1.9000', '2022-09-15 11:38:58', '2022-09-15 11:38:58', 1),
(275, 1, 20, NULL, NULL, '2022-09-15', NULL, 65, 'DE SYNERGYA S.A.C.', 8, 3, 1, '109927.0300', '2022-09-15 11:40:58', '2022-09-15 11:40:58', 1),
(276, 3, 78, 1, 'BANCO', '2022-09-14', NULL, NULL, 'IMPUESTO ITF', 8, 3, 1, '-7.4000', '2022-09-15 11:41:32', '2022-09-15 11:41:32', 1),
(277, 2, 106, NULL, NULL, '2022-09-15', NULL, 60, 'JIMMY PORTALANZAS', 8, 3, 1, '-20000.0000', '2022-09-15 11:43:17', '2022-09-15 11:43:17', 1),
(279, 2, 107, NULL, NULL, '2022-09-15', NULL, 40, 'LOURDES MAMANI/ LUCIANO TAMATA', 5, 3, 1, '-26570.7000', '2022-09-15 14:45:17', '2022-09-15 14:45:17', 1),
(280, 2, 108, NULL, NULL, '2022-09-15', NULL, 43, 'RODRIGUEZ MENDOZA SARA', 5, 3, 1, '-3783.4000', '2022-09-15 14:47:56', '2022-09-15 14:47:56', 1),
(281, 2, 111, NULL, NULL, '2022-09-14', NULL, 85, 'COMPRA DE GRUPO', 8, 3, 1, '-6226.5000', '2022-09-15 14:53:49', '2022-09-15 14:53:49', 1),
(282, 2, 110, NULL, NULL, '2022-09-14', NULL, 73, 'FRENOS - 5 CARROS', 8, 3, 1, '-2240.0000', '2022-09-15 14:55:15', '2022-09-15 14:55:15', 1),
(283, 1, 21, NULL, NULL, '2022-09-14', NULL, 60, 'EFECTIVO', 22, 1, 1, '10000.0000', '2022-09-15 15:07:03', '2022-09-15 15:07:03', 1),
(284, 2, 112, NULL, NULL, '2022-09-14', NULL, 60, 'FLETE', 22, 3, 1, '-4100.0000', '2022-09-15 15:09:00', '2022-09-15 15:09:00', 1),
(285, 1, 22, NULL, NULL, '2022-09-15', NULL, 58, 'A CUENTA ', 22, 3, 1, '10000.0000', '2022-09-15 15:09:43', '2022-09-15 15:09:43', 1),
(286, 2, 113, NULL, NULL, '2022-09-15', NULL, 55, 'COMPRA DE COBRE', 22, 1, 1, '-20000.0000', '2022-09-15 15:11:01', '2022-09-15 15:11:01', 1),
(288, 3, 79, 11, 'SEÑORA DE LIMPIEZA', '2022-09-15', NULL, NULL, 'SERVICIO DE LIMPIEZA', 22, 1, 1, '-150.0000', '2022-09-15 15:11:51', '2022-09-15 15:11:51', 1),
(291, 5, 18, NULL, NULL, '2022-09-15', NULL, NULL, 'MOV INTERNO', 5, 1, 1, '-574.0000', '2022-09-15 15:17:51', '2022-09-15 15:17:51', 1),
(292, 5, 18, NULL, NULL, '2022-09-15', NULL, NULL, 'MOV INTERNO', 22, 1, 1, '574.0000', '2022-09-15 15:17:51', '2022-09-15 15:17:51', 1),
(293, 3, 80, 9, 'VALERIANO', '2022-09-10', NULL, NULL, 'PEAJES DEL 5 AL 10 DE SETIEMBRE - WACHIPA -  VILLA EL SALVADOR', 22, 1, 1, '-83.0000', '2022-09-15 15:19:54', '2022-09-15 15:19:54', 1),
(294, 3, 80, 1, 'VALERIANO', '2022-09-10', NULL, NULL, 'RETIRO DE VENTANILLA', 22, 1, 1, '-9.0000', '2022-09-15 15:20:42', '2022-09-15 15:20:42', 1),
(295, 3, 81, 12, 'VALERIANO', '2022-09-10', NULL, NULL, 'GASEOSA', 22, 1, 1, '-12.0000', '2022-09-15 15:21:25', '2022-09-15 15:21:25', 1),
(296, 3, 82, 2, 'VALERIANO', '2022-09-10', NULL, NULL, 'AXF ', 22, 1, 1, '-281.5100', '2022-09-15 15:22:01', '2022-09-15 15:22:01', 1),
(297, 3, 83, 9, 'VALERIANO', '2022-09-09', NULL, NULL, 'PEAJE ', 22, 1, 1, '-6.5000', '2022-09-15 15:22:35', '2022-09-15 15:22:35', 1),
(298, 3, 83, 2, 'ANIBAL', '2022-09-10', NULL, NULL, 'GAS', 22, 1, 1, '-123.4800', '2022-09-15 15:23:55', '2022-09-15 15:23:55', 1),
(299, 3, 83, 3, 'ANIBAL', '2022-09-10', NULL, NULL, 'REVISION TECNICA DE RESIDUOS PELIGROSOS', 22, 1, 1, '-50.0000', '2022-09-15 15:25:46', '2022-09-15 15:25:46', 1),
(300, 3, 368, 2, 'ANIBAL', '2022-09-10', NULL, NULL, 'BLR', 22, 1, 1, '-344.7600', '2022-09-15 15:26:24', '2022-09-15 15:26:24', 1),
(301, 3, 84, 9, 'ANIBAL', '2022-09-10', NULL, NULL, 'PEAJES DEL 5 AL 10 DE SETIEMBRE', 22, 1, 1, '-128.8000', '2022-09-15 15:28:01', '2022-09-15 15:28:01', 1),
(302, 3, 84, 8, 'ANIBAL', '2022-09-10', NULL, NULL, 'MONTACARAGUISTA', 22, 1, 1, '-20.0000', '2022-09-15 15:29:01', '2022-09-15 15:29:01', 1),
(303, 3, 85, 1, 'ANIBAL', '2022-09-10', NULL, NULL, 'TAXI DE RETOR DE ZINSA - CARRO SE QUEDO A PERNOTAR', 22, 1, 1, '-35.0000', '2022-09-15 15:29:50', '2022-09-15 15:29:50', 1),
(304, 3, 85, 3, 'ANIBAL', '2022-09-10', NULL, NULL, 'REGULAR FRENO ', 22, 1, 1, '-43.0000', '2022-09-15 15:30:29', '2022-09-15 15:30:29', 1),
(305, 3, 85, 3, 'ANIBAL', '2022-09-10', NULL, NULL, 'LAVADO DE BLR', 22, 1, 1, '-30.0000', '2022-09-15 15:31:19', '2022-09-15 15:31:19', 1),
(306, 3, 86, 2, 'ANIBAL', '2022-09-10', NULL, NULL, 'LAVADO DE BLINDADO', 22, 1, 1, '-20.0000', '2022-09-15 15:32:05', '2022-09-15 15:32:05', 1),
(307, 2, 114, NULL, NULL, '2022-09-15', NULL, 73, '13CABLE +60EMBRIAGUE+126FOCOS FAROS+150TEMPLADO+710 COMBUSTIBLE', 22, 1, 1, '-1059.0000', '2022-09-15 17:21:18', '2022-09-15 17:21:18', 1),
(308, 3, 87, 7, 'NOLBERTO', '2022-09-15', NULL, NULL, 'TAXI PARA ENTREGAR CARTAS', 22, 1, 1, '-100.0000', '2022-09-15 17:22:46', '2022-09-15 17:22:46', 1),
(309, 3, 88, 12, 'ALFREDO', '2022-09-15', NULL, NULL, 'GASTOS DE VIAJE A AREQUIPA', 22, 8, 1, '-468.0000', '2022-09-15 17:25:56', '2022-09-15 17:25:56', 1),
(310, 3, 89, 5, 'DEISY', '2022-09-15', NULL, NULL, 'LEGALIZACION 4 LIBROS - COPIAS ', 22, 8, 1, '-405.0000', '2022-09-15 17:28:47', '2022-09-15 17:28:47', 1),
(311, 3, 90, 5, 'LIZ', '2022-09-15', NULL, NULL, 'DIA', 22, 8, 1, '-100.0000', '2022-09-15 17:30:36', '2022-09-15 17:30:36', 1),
(312, 3, 91, 5, 'SELENE', '2022-09-15', NULL, NULL, 'LEGALIZACION DE 2 LIBROS', 22, 8, 1, '-50.0000', '2022-09-15 17:31:04', '2022-09-15 17:31:04', 1),
(313, 3, 92, 5, 'JENIFER', '2022-09-15', NULL, NULL, 'LEGALIZACION ', 22, 8, 1, '-50.0000', '2022-09-15 17:31:24', '2022-09-15 17:31:24', 1),
(314, 3, 93, 6, 'BEBETO', '2022-09-15', NULL, NULL, 'ZAPATOS', 22, 8, 1, '-70.0000', '2022-09-15 17:33:43', '2022-09-15 17:33:43', 1),
(315, 3, 94, 9, 'BEBETO', '2022-09-15', NULL, NULL, 'PEAJES', 22, 8, 1, '-39.0000', '2022-09-15 17:34:19', '2022-09-15 17:34:19', 1),
(316, 3, 95, 8, 'BEBETO', '2022-09-15', NULL, NULL, 'MONTACARGUISTA', 22, 8, 1, '-10.0000', '2022-09-15 17:34:46', '2022-09-15 17:34:46', 1),
(317, 3, 96, 6, 'BEBETO', '2022-09-15', NULL, NULL, '6 CUCHILLAS', 22, 8, 1, '-6.0000', '2022-09-15 17:35:12', '2022-09-15 17:35:12', 1),
(318, 3, 97, 6, 'BEBETO', '2022-09-15', NULL, NULL, '4 MASCARILLAS', 22, 8, 1, '-4.0000', '2022-09-15 17:35:47', '2022-09-15 17:35:47', 1),
(319, 3, 98, 6, 'BEBETO', '2022-09-15', NULL, NULL, 'SPORADE', 22, 8, 1, '-5.0000', '2022-09-15 17:36:32', '2022-09-15 17:36:32', 1),
(320, 3, 99, 3, 'BEBETO', '2022-09-15', NULL, NULL, 'LAVADO DE BDU', 22, 8, 1, '-40.0000', '2022-09-15 17:36:58', '2022-09-15 17:36:58', 1),
(321, 3, 100, 13, 'ALFREDO', '2022-09-15', NULL, NULL, 'PESAJE DE LONA', 22, 8, 1, '-5.0000', '2022-09-15 17:41:53', '2022-09-15 17:41:53', 1),
(322, 1, 23, NULL, NULL, '2022-09-15', NULL, 86, 'VENTA DE LONA ', 22, 8, 1, '1340.0000', '2022-09-15 17:42:35', '2022-09-15 17:42:35', 1),
(323, 1, 24, NULL, NULL, '2022-09-15', NULL, 87, 'VENTA DE FIERRO', 22, 8, 1, '9787.5000', '2022-09-15 17:43:24', '2022-09-15 17:43:24', 1),
(324, 1, 25, NULL, NULL, '2022-09-15', NULL, 69, 'VENTA DE ALUMINIO DURO ', 22, 8, 1, '198.7500', '2022-09-15 17:44:32', '2022-09-15 17:44:32', 1),
(325, 3, 101, 2, 'LILLIAN', '2022-09-15', NULL, NULL, 'COMPRA DE GAS', 22, 8, 1, '-47.0000', '2022-09-15 17:58:21', '2022-09-15 17:58:21', 1),
(326, 1, 26, NULL, NULL, '2022-09-16', NULL, 43, 'FACT JABS', 22, 8, 1, '6018.0000', '2022-09-16 10:24:59', '2022-09-16 10:24:59', 1),
(327, 2, 115, NULL, NULL, '2022-09-16', NULL, 61, 'FACT JABS', 22, 1, 1, '-6018.0000', '2022-09-16 10:25:28', '2022-09-16 10:25:28', 1),
(328, 3, 103, 10, 'LILLIAN', '2022-09-10', NULL, NULL, 'ADELANTO', 22, 8, 1, '-100.0000', '2022-09-16 13:45:10', '2022-09-16 13:45:10', 1),
(329, 1, 27, NULL, NULL, '2022-09-16', NULL, 35, 'DE CERRADURAS NACIONAL', 1, 3, 1, '255622.6200', '2022-09-16 17:24:35', '2022-09-16 17:24:35', 1),
(331, 2, 116, NULL, NULL, '2022-09-16', NULL, 16, 'ANDERSON DAVIS TRUJILLO', 1, 3, 1, '-10000.0000', '2022-09-16 17:26:05', '2022-09-16 17:26:05', 1),
(332, 3, 104, 1, 'BANCO', '2022-09-16', NULL, NULL, 'IMPUESTO ITF', 1, 3, 1, '-0.7000', '2022-09-16 17:27:56', '2022-09-16 17:27:56', 1),
(333, 3, 105, 1, 'BANCO', '2022-09-16', NULL, NULL, 'MANT TD ADIC NEG', 1, 3, 1, '-10.0000', '2022-09-16 17:28:30', '2022-09-16 17:28:30', 1),
(334, 3, 106, 1, 'BANCO', '2022-09-16', NULL, NULL, 'MANT TD ADIC NEG ', 2, 3, 1, '-10.0000', '2022-09-16 17:34:32', '2022-09-16 17:34:32', 1),
(335, 5, 19, NULL, 'MERLY - VIVIANA ', '2022-09-16', NULL, NULL, 'FACT DE TINASIT ', 11, 3, 1, '-339942.6000', '2022-09-16 17:36:04', '2022-09-16 17:36:04', 1),
(338, 5, 19, NULL, 'MERLY - VIVIANA ', '2022-09-16', NULL, NULL, 'FACT DE TINASIT ', 2, 3, 1, '339942.6000', '2022-09-16 17:36:08', '2022-09-16 17:36:08', 1),
(341, 3, 107, 1, 'BANCO', '2022-09-16', NULL, NULL, 'MANT TD ADIC NEG ', 3, 3, 1, '-10.0000', '2022-09-16 17:42:51', '2022-09-16 17:42:51', 1),
(343, 5, 20, NULL, 'DEISY', '2022-09-16', NULL, NULL, 'MOV PARA RETIRO EN VENTANILLA', 3, 3, 1, '-75000.0000', '2022-09-16 17:45:28', '2022-09-16 17:45:28', 1),
(344, 5, 20, NULL, 'DEISY', '2022-09-16', NULL, NULL, 'MOV PARA RETIRO EN VENTANILLA', 14, 3, 1, '75000.0000', '2022-09-16 17:45:30', '2022-09-16 17:45:30', 1),
(345, 1, 28, NULL, NULL, '2022-09-15', NULL, 4, ' 0PE1000001 ZINC INDUST', 4, 3, 1, '72820.5700', '2022-09-16 17:48:35', '2022-09-16 17:48:35', 1),
(346, 3, 108, 1, 'BANCO', '2022-09-15', NULL, NULL, 'MANT TD ADIC NEG ', 4, 3, 1, '-10.0000', '2022-09-16 17:49:51', '2022-09-16 17:49:51', 1),
(347, 3, 109, 1, 'BANCO', '2022-09-15', NULL, NULL, 'IMPUESTO ITF ', 4, 3, 1, '-3.6000', '2022-09-16 17:50:49', '2022-09-16 17:50:49', 1),
(348, 2, 117, NULL, NULL, '2022-09-16', NULL, 43, 'SOLORZANO CABELLO WILLEN - CAMPAÑA ', 4, 3, 1, '-5000.0000', '2022-09-16 17:53:37', '2022-09-16 17:53:37', 1),
(349, 2, 118, NULL, NULL, '2022-09-16', NULL, 54, 'ELIZABETH ALINA RAMIREZ ', 4, 3, 1, '-16416.4000', '2022-09-16 17:54:47', '2022-09-16 17:54:47', 1),
(350, 2, 119, NULL, NULL, '2022-09-16', NULL, 61, 'JORGE BUSTOS ', 4, 3, 1, '-341.0000', '2022-09-16 17:55:20', '2022-09-16 17:55:20', 1),
(351, 5, 21, NULL, 'DEISY', '2022-09-16', NULL, NULL, 'MOV INTERNO', 4, 3, 1, '-25000.0000', '2022-09-16 17:56:07', '2022-09-16 17:56:07', 1),
(352, 5, 21, NULL, 'DEISY', '2022-09-16', NULL, NULL, 'MOV INTERNO', 14, 3, 1, '25000.0000', '2022-09-16 17:56:08', '2022-09-16 17:56:08', 1),
(353, 5, 22, NULL, 'DEISY', '2022-09-16', NULL, NULL, 'MOV INTERNO ', 4, 3, 1, '-30000.0000', '2022-09-16 17:56:55', '2022-09-16 17:56:55', 1),
(354, 5, 22, NULL, 'DEISY', '2022-09-16', NULL, NULL, 'MOV INTERNO ', 10, 3, 1, '30000.0000', '2022-09-16 17:56:55', '2022-09-16 17:56:55', 1),
(355, 2, 120, NULL, NULL, '2022-09-16', NULL, 37, 'RICARDO ROJAS ', 4, 3, 1, '-10000.0000', '2022-09-16 17:57:58', '2022-09-16 17:57:58', 1),
(356, 2, 121, NULL, NULL, '2022-09-16', NULL, 1, 'RAUL VASQUEZ', 5, 3, 1, '-10000.0000', '2022-09-16 18:02:14', '2022-09-16 18:02:14', 1),
(357, 3, 110, 1, 'BANCO', '2022-09-15', NULL, NULL, 'MANT TD ADIC NEG ', 5, 3, 1, '-10.0000', '2022-09-16 18:03:04', '2022-09-16 18:03:04', 1),
(358, 3, 111, 1, 'BANCO', '2022-09-15', NULL, NULL, 'IMPUESTO ITF ', 5, 3, 1, '-3.3500', '2022-09-16 18:03:52', '2022-09-16 18:03:52', 1),
(359, 5, 23, NULL, 'DEISY', '2022-09-16', NULL, NULL, 'MOV INTERNO PARA RETIRO ', 5, 3, 1, '-25000.0000', '2022-09-16 18:05:42', '2022-09-16 18:05:42', 1),
(360, 5, 23, NULL, 'DEISY', '2022-09-16', NULL, NULL, 'MOV INTERNO PARA RETIRO ', 14, 3, 1, '25000.0000', '2022-09-16 18:05:44', '2022-09-16 18:05:44', 1),
(361, 1, 31, NULL, NULL, '2022-09-16', NULL, 66, 'DEPOSITO', 5, 3, 1, '1000.0000', '2022-09-16 18:09:38', '2022-09-16 18:09:38', 1),
(362, 1, 30, NULL, NULL, '2022-09-16', NULL, 57, 'ABONO PAG PROVE', 5, 3, 1, '4577.5200', '2022-09-16 18:10:15', '2022-09-16 18:10:15', 1),
(363, 3, 113, 1, 'BANCO', '2022-09-15', NULL, NULL, 'IMPUESTO ITF ', 5, 3, 1, '-1.4500', '2022-09-17 09:49:48', '2022-09-17 09:49:48', 1),
(364, 5, 24, NULL, 'MERLY - VIVIANA ', '2022-09-16', NULL, NULL, 'FACT DE TINASIT ', 11, 3, 1, '-339942.6000', '2022-09-17 09:52:18', '2022-09-17 09:52:18', 1),
(365, 5, 24, NULL, 'MERLY - VIVIANA ', '2022-09-16', NULL, NULL, 'FACT DE TINASIT ', 6, 3, 1, '339942.6000', '2022-09-17 09:52:18', '2022-09-17 09:52:18', 1),
(366, 3, 114, 1, 'BANCO', '2022-09-15', NULL, NULL, 'MANT TD ADIC NEG ', 6, 3, 1, '-10.0000', '2022-09-17 10:07:54', '2022-09-17 10:07:54', 1),
(367, 3, 115, 11, 'ENEL', '2022-09-16', NULL, NULL, 'LUZ- LOCAL PTP', 6, 3, 1, '-399.0000', '2022-09-17 10:09:13', '2022-09-17 10:09:13', 1),
(368, 3, 116, 11, 'ENEL', '2022-09-16', NULL, NULL, 'LOCAL - VENTANILLA', 6, 3, 1, '-96.0000', '2022-09-17 10:09:49', '2022-09-17 10:09:49', 1),
(369, 3, 117, 1, 'BANCO', '2022-09-16', NULL, NULL, 'IMPUESTO ITF', 6, 3, 1, '-16.9500', '2022-09-17 10:10:19', '2022-09-17 10:10:19', 1),
(370, 3, 118, 1, 'BANCO', '2022-09-16', NULL, NULL, 'MANT TD ADIC NEG ', 7, 3, 1, '-10.0000', '2022-09-17 10:16:36', '2022-09-17 10:16:36', 1),
(371, 3, 119, 1, 'BANCO', '2022-09-15', NULL, NULL, 'MANT TD ADIC NEG ', 8, 3, 1, '-10.0000', '2022-09-17 10:17:59', '2022-09-17 10:17:59', 1),
(372, 3, 120, 1, 'BANCO', '2022-09-15', NULL, NULL, 'IMPUESTO ITF ', 8, 3, 1, '-1.0000', '2022-09-17 10:18:19', '2022-09-17 10:18:19', 1),
(373, 5, 25, NULL, 'DEISY', '2022-09-16', NULL, NULL, 'MOV INTERNO PARA RETIRO POR VENTANILLA', 8, 3, 1, '-75000.0000', '2022-09-17 10:19:15', '2022-09-17 10:19:15', 1);
INSERT INTO `cajas` (`caj_id`, `caj_tipo`, `caj_numero`, `caj_tga_id`, `caj_responsable`, `caj_fecha`, `caj_col_id`, `caj_age_id`, `caj_observaciones`, `caj_cue_id`, `caj_t1m_id`, `caj_gt4_id`, `caj_monto`, `caj_created`, `caj_updated`, `caj_status`) VALUES
(374, 5, 25, NULL, 'DEISY', '2022-09-16', NULL, NULL, 'MOV INTERNO PARA RETIRO POR VENTANILLA', 14, 3, 1, '75000.0000', '2022-09-17 10:19:15', '2022-09-17 10:19:15', 1),
(375, 5, 26, NULL, 'DEISY', '2022-09-16', NULL, NULL, 'MOV INTERNO ', 8, 3, 1, '-30000.0000', '2022-09-17 10:19:43', '2022-09-17 10:19:43', 1),
(376, 5, 26, NULL, 'DEISY', '2022-09-16', NULL, NULL, 'MOV INTERNO ', 10, 3, 1, '30000.0000', '2022-09-17 10:19:43', '2022-09-17 10:19:43', 1),
(377, 3, 121, 1, 'BANCO', '2022-09-16', NULL, NULL, 'IMPUESTO ITF', 8, 3, 1, '-5.2500', '2022-09-17 10:20:15', '2022-09-17 10:20:15', 1),
(378, 5, 27, NULL, 'BANCO', '2022-09-17', NULL, NULL, 'MOV INTERNO', 9, 3, 1, '-25000.0000', '2022-09-17 10:23:22', '2022-09-17 10:23:22', 1),
(379, 5, 27, NULL, 'BANCO', '2022-09-17', NULL, NULL, 'MOV INTERNO', 14, 3, 1, '25000.0000', '2022-09-17 10:23:22', '2022-09-17 10:23:22', 1),
(380, 3, 122, 1, 'BANCO', '2022-09-16', NULL, NULL, 'MANT TD ADIC NEG ', 9, 3, 1, '-10.0000', '2022-09-17 10:26:41', '2022-09-17 10:26:41', 1),
(381, 3, 123, 1, 'BANCO', '2022-09-16', NULL, NULL, 'IMPUESTO ITF', 9, 3, 1, '-1.2500', '2022-09-17 10:27:08', '2022-09-17 10:27:08', 1),
(382, 2, 122, NULL, NULL, '2022-09-16', NULL, 40, 'CHEQUE 00000067', 10, 7, 1, '-25000.0000', '2022-09-17 10:30:14', '2022-09-17 10:30:14', 1),
(383, 2, 123, NULL, NULL, '2022-09-16', NULL, 40, ' CHEQUE 00000066', 10, 7, 1, '-25000.0000', '2022-09-17 10:30:35', '2022-09-17 10:30:35', 1),
(384, 3, 124, 1, 'BANCO', '2022-09-16', NULL, NULL, 'IMPUESTO ITF', 10, 3, 1, '-5.5000', '2022-09-17 10:31:15', '2022-09-17 10:31:15', 1),
(385, 3, 125, 1, 'BANCO', '2022-09-15', NULL, NULL, 'MANT TD ADIC NEG ', 10, 3, 1, '-10.0000', '2022-09-17 10:32:29', '2022-09-17 10:32:29', 1),
(386, 1, 32, NULL, NULL, '2022-09-16', NULL, 67, 'T.C 3.883 $30500 - INGRESO $30792 - ', 11, 3, 1, '118431.5000', '2022-09-17 10:36:39', '2022-09-17 10:36:39', 1),
(387, 3, 126, 1, 'BANCO', '2022-09-16', NULL, NULL, 'MANT TD ADIC NEG ', 11, 3, 1, '-10.0000', '2022-09-17 10:37:46', '2022-09-17 10:37:46', 1),
(388, 3, 127, 5, 'VIVIANA', '2022-09-16', NULL, NULL, 'PAGO DE SUNAT ', 11, 3, 1, '-302.0000', '2022-09-17 10:38:26', '2022-09-17 10:38:26', 1),
(389, 3, 130, 1, 'BANCO', '2022-09-16', NULL, NULL, 'IMPUESTO ITF', 11, 3, 1, '-39.7800', '2022-09-17 10:39:02', '2022-09-17 10:39:02', 1),
(390, 1, 33, NULL, NULL, '2022-09-12', NULL, 67, '$292 T.C3.883', 17, 8, 1, '1133.8400', '2022-09-17 10:46:54', '2022-09-17 10:46:54', 1),
(391, 3, 131, 1, 'BANCO', '2022-09-12', NULL, NULL, 'IMPUESTO ITF', 17, 3, 1, '-5.8300', '2022-09-17 10:48:12', '2022-09-17 10:48:12', 1),
(392, 3, 132, 14, 'TTP', '2022-09-15', NULL, NULL, '2DO PRECINTO', 17, 3, 1, '-137.4600', '2022-09-17 10:49:03', '2022-09-17 10:49:03', 1),
(393, 3, 133, 1, 'BANCO', '2022-09-16', NULL, NULL, 'IMPUESTO ITF $1.50', 17, 3, 1, '-5.8300', '2022-09-17 10:49:53', '2022-09-17 10:49:53', 1),
(394, 3, 134, 1, 'BANCO', '2022-09-15', NULL, NULL, 'MANT TD ADIC NEG ', 12, 3, 1, '-10.0000', '2022-09-17 10:51:51', '2022-09-17 10:51:51', 1),
(395, 3, 136, 1, 'BANCO', '2022-09-15', NULL, NULL, 'MANT TD ADIC NEG ', 13, 3, 1, '-10.0000', '2022-09-17 10:53:12', '2022-09-17 10:53:12', 1),
(396, 5, 28, NULL, 'LILLIAN', '2022-09-16', NULL, NULL, 'RETIRO DE VENTANILLA', 14, 8, 1, '-200000.0000', '2022-09-17 10:56:31', '2022-09-17 10:56:31', 1),
(397, 5, 28, NULL, 'LILLIAN', '2022-09-16', NULL, NULL, 'RETIRO DE VENTANILLA', 22, 8, 1, '200000.0000', '2022-09-17 10:56:31', '2022-09-17 10:56:31', 1),
(398, 3, 137, 1, 'BANCO', '2022-09-16', NULL, NULL, 'IMPUESTO ITF', 14, 3, 1, '-21.2500', '2022-09-17 10:56:58', '2022-09-17 10:56:58', 1),
(399, 3, 138, 1, 'BANCO', '2022-09-15', NULL, NULL, 'MANT TD ADIC NEG ', 14, 3, 1, '-10.0000', '2022-09-17 10:57:42', '2022-09-17 10:57:42', 1),
(400, 3, 140, 1, 'BANCO', '2022-09-15', NULL, NULL, 'DUPLIACDO DE TARJETA', 16, 3, 1, '-11.3800', '2022-09-17 10:59:21', '2022-09-17 10:59:21', 1),
(401, 3, 141, 1, 'BANCO', '2022-09-15', NULL, NULL, 'MANT TD ADIC NEG ', 19, 3, 1, '-10.0000', '2022-09-17 11:08:23', '2022-09-17 11:08:23', 1),
(402, 3, 142, 1, 'BANCO', '2022-09-15', NULL, NULL, 'MANT TD ADIC NEG ', 21, 1, 1, '-10.0000', '2022-09-17 11:09:04', '2022-09-17 11:09:04', 1),
(403, 3, 143, 1, 'BANCO', '2022-09-16', NULL, NULL, 'IMPUESTO ITF', 1, 3, 1, '-13.2500', '2022-09-17 11:13:51', '2022-09-17 11:13:51', 1),
(404, 2, 124, NULL, NULL, '2022-09-17', NULL, 60, 'JIMMY PORTALANZAS SOPLIN', 1, 3, 1, '-40000.0000', '2022-09-17 11:14:31', '2022-09-17 11:14:31', 1),
(405, 3, 144, 1, 'BANCO', '2022-09-16', NULL, NULL, 'IMPUESTO ITF', 2, 3, 1, '-16.9500', '2022-09-17 11:15:59', '2022-09-17 11:15:59', 1),
(406, 3, 145, 1, 'BANCO', '2022-09-16', NULL, NULL, 'IMPUESTO ITF', 3, 3, 1, '-3.7500', '2022-09-17 11:17:09', '2022-09-17 11:17:09', 1),
(407, 3, 146, 1, 'BANCO', '2022-09-16', NULL, NULL, 'IMPUESTO ITF', 4, 3, 1, '-4.3000', '2022-09-17 11:18:32', '2022-09-17 11:18:32', 1),
(408, 3, 147, 10, 'DANIEL', '2022-09-15', NULL, NULL, 'ADELANTO', 22, 3, 1, '-40.0000', '2022-09-17 12:06:48', '2022-09-17 12:06:48', 1),
(409, 3, 148, 10, 'DEISY', '2022-09-15', NULL, NULL, 'ADELANTO', 22, 8, 1, '-50.0000', '2022-09-17 12:14:34', '2022-09-17 12:14:34', 1),
(410, 2, 125, NULL, NULL, '2022-09-16', NULL, 73, 'REPUESTOS DE CARROS PUCALLPA', 22, 3, 1, '-747.0000', '2022-09-17 12:26:07', '2022-09-17 12:26:07', 1),
(411, 2, 126, NULL, NULL, '2022-09-16', NULL, 79, '1200 PLANCHA', 22, 8, 1, '-1200.0000', '2022-09-17 12:27:21', '2022-09-17 12:27:21', 1),
(412, 2, 127, NULL, NULL, '2022-09-16', NULL, 79, 'ADELANTO MANO DE OBRA', 22, 8, 1, '-3000.0000', '2022-09-17 12:27:48', '2022-09-17 12:27:48', 1),
(413, 2, 128, NULL, NULL, '2022-09-16', NULL, 79, 'SOLDADURA+TORNO', 22, 8, 1, '-257.0000', '2022-09-17 12:28:16', '2022-09-17 12:28:16', 1),
(414, 2, 129, NULL, NULL, '2022-09-16', NULL, 16, 'COMPRA DE COBRE', 22, 8, 1, '-42200.0000', '2022-09-17 12:28:51', '2022-09-17 12:28:51', 1),
(415, 1, 34, NULL, NULL, '2022-09-16', NULL, 66, 'A CUENTA', 22, 8, 1, '1200.0000', '2022-09-17 12:29:22', '2022-09-17 12:29:22', 1),
(416, 2, 130, NULL, NULL, '2022-09-16', NULL, 22, 'COMPRA DE METALES', 22, 8, 1, '-20000.0000', '2022-09-17 12:29:59', '2022-09-17 12:29:59', 1),
(417, 3, 149, 10, 'ROBERTO', '2022-09-16', NULL, NULL, 'ADELANTO', 22, 8, 1, '-50.0000', '2022-09-17 12:31:16', '2022-09-17 12:31:16', 1),
(418, 3, 150, 12, 'JUAN ', '2022-09-17', NULL, NULL, '2 MENUS DE JUAN LUNES Y MARTES ', 8, 3, 1, '-34.0000', '2022-09-17 12:37:50', '2022-09-17 12:37:50', 1),
(419, 3, 151, 7, 'ROSALINO', '2022-09-17', NULL, NULL, 'MONTACARGUISTA', 8, 8, 1, '-20.0000', '2022-09-17 12:38:35', '2022-09-17 12:38:35', 1),
(420, 3, 152, 10, 'JOSE', '2022-09-17', NULL, NULL, 'ADELANTO', 22, 8, 1, '-100.0000', '2022-09-17 12:49:18', '2022-09-17 12:49:18', 1),
(421, 2, 131, NULL, NULL, '2022-09-19', NULL, 60, 'JIMMY PORTALANZAS', 1, 3, 1, '-50000.0000', '2022-09-19 11:54:56', '2022-09-19 11:54:56', 1),
(422, 3, 153, 1, 'BANCO', '2022-09-18', NULL, NULL, 'IMPUESTO ITF', 1, 3, 1, '-2.0000', '2022-09-19 11:55:44', '2022-09-19 11:55:44', 1),
(423, 3, 154, 10, 'ALFREDO', '2022-09-17', NULL, NULL, 'DEL 12 AL 17 DE SETIEMBRE', 1, 3, 1, '-450.0000', '2022-09-19 13:57:47', '2022-09-19 13:57:47', 1),
(424, 3, 155, 10, 'BEBETO', '2022-09-19', NULL, NULL, 'DEL 12 AL 17 DE SETIEMBRE', 1, 3, 1, '-600.0000', '2022-09-19 13:58:18', '2022-09-19 13:58:18', 1),
(425, 3, 156, 10, 'DIDIER', '2022-09-17', NULL, NULL, 'DEL 12 AL 17 DE SETIEMBRE', 1, 3, 1, '-416.0000', '2022-09-19 13:58:48', '2022-09-19 13:58:48', 1),
(426, 3, 157, 10, 'LUIS', '2022-09-17', NULL, NULL, 'DEL 12 AL 17 DE SETIEMBRE', 1, 3, 1, '-550.0000', '2022-09-19 13:59:11', '2022-09-19 13:59:11', 1),
(427, 3, 158, 10, 'VLAERIANO', '2022-09-17', NULL, NULL, 'DEL 12 AL 17 DE SETIEMBRE', 1, 3, 1, '-427.0000', '2022-09-19 13:59:48', '2022-09-19 13:59:48', 1),
(428, 3, 159, 10, 'ROSALINO', '2022-09-17', NULL, NULL, 'DEL 12 AL 17 DE SETIEMBRE', 1, 3, 1, '-600.0000', '2022-09-19 14:00:15', '2022-09-19 14:00:15', 1),
(429, 3, 160, 10, 'ANIBAL', '2022-09-17', NULL, NULL, 'DEL 12 AL 17 DE SETIEMBRE', 1, 3, 1, '-470.0000', '2022-09-19 14:00:45', '2022-09-19 14:00:45', 1),
(430, 3, 161, 10, 'JUNIOR', '2022-09-17', NULL, NULL, 'DEL 12 AL 17 DE SETIEMBRE', 1, 3, 1, '-300.0000', '2022-09-19 14:01:10', '2022-09-19 14:01:10', 1),
(431, 3, 162, 10, 'JOSE', '2022-09-17', NULL, NULL, 'DEL 12 AL 17 DE SETIEMBRE', 1, 3, 1, '-200.0000', '2022-09-19 14:01:41', '2022-09-19 14:01:41', 1),
(432, 3, 163, 9, 'ERICSON', '2022-09-17', NULL, NULL, 'DEL 12 AL 17 DE SETIEMBRE', 1, 3, 1, '-400.0000', '2022-09-19 14:02:22', '2022-09-19 14:02:22', 1),
(433, 3, 164, 10, 'NOLBERTO', '2022-09-17', NULL, NULL, 'DEL 12 AL 17 DE SETIEMBRE', 1, 3, 1, '-470.0000', '2022-09-19 14:02:53', '2022-09-19 14:02:53', 1),
(436, 5, 29, NULL, 'DEISY', '2022-09-19', NULL, NULL, 'MOV INTERNO ', 4, 3, 1, '-50000.0000', '2022-09-19 15:19:58', '2022-09-19 15:19:58', 1),
(437, 5, 29, NULL, 'DEISY', '2022-09-19', NULL, NULL, 'MOV INTERNO ', 10, 3, 1, '50000.0000', '2022-09-19 15:19:59', '2022-09-19 15:19:59', 1),
(438, 2, 132, NULL, NULL, '2022-09-19', NULL, 37, 'RICARDO ROJAS', 8, 3, 1, '-10000.0000', '2022-09-19 15:31:32', '2022-09-19 15:31:32', 1),
(439, 2, 133, NULL, NULL, '2022-09-19', NULL, 1, 'RAUL VASQUEZ ', 9, 3, 1, '-2559.7000', '2022-09-19 15:55:09', '2022-09-19 15:55:09', 1),
(440, 2, 134, NULL, NULL, '2022-09-19', NULL, 54, 'MOLINA FLORES ABELARDO ', 9, 3, 1, '-30000.0000', '2022-09-19 15:57:38', '2022-09-19 15:57:38', 1),
(441, 2, 136, NULL, NULL, '2022-09-19', NULL, 40, 'CHEQUE 00000069', 10, 7, 1, '-25000.0000', '2022-09-19 16:00:04', '2022-09-19 16:00:04', 1),
(442, 2, 136, NULL, NULL, '2022-09-19', NULL, 40, ' CHEQUE 00000068', 10, 7, 1, '-25000.0000', '2022-09-19 16:02:26', '2022-09-19 16:02:26', 1),
(443, 1, 35, NULL, NULL, '2022-09-19', NULL, 72, 'DEPOSITO', 24, 3, 1, '10000.0000', '2022-09-19 16:10:36', '2022-09-19 16:10:36', 1),
(444, 3, 165, 3, 'ROSALINO', '2022-09-19', NULL, NULL, 'ARRANCOR', 22, 9, 1, '-480.0000', '2022-09-19 16:28:26', '2022-09-19 16:28:26', 1),
(445, 3, 166, 2, 'BEBETO', '2022-09-19', NULL, NULL, 'GAS', 22, 8, 1, '-218.0000', '2022-09-19 16:29:38', '2022-09-19 16:29:38', 1),
(446, 3, 167, 3, 'BEBETO', '2022-09-19', NULL, NULL, 'LAVADO DE CARRO', 22, 8, 1, '-12.0000', '2022-09-19 16:30:00', '2022-09-19 16:30:00', 1),
(447, 3, 168, 10, 'DANIEL', '2022-09-19', NULL, NULL, 'DEL 12 AL 17 DE SETIEMBRE', 22, 8, 1, '-310.0000', '2022-09-19 16:31:07', '2022-09-19 16:31:07', 1),
(448, 3, 170, 10, 'DANIEL', '2022-09-19', NULL, NULL, 'DEL 12 AL 17 DE SETIEMBRE', 22, 8, 1, '-190.0000', '2022-09-19 16:31:45', '2022-09-19 16:31:45', 1),
(449, 3, 171, 3, 'ELECTRICISTA', '2022-09-19', NULL, NULL, 'ATV718', 22, 8, 1, '-150.0000', '2022-09-19 16:34:13', '2022-09-19 16:34:13', 1),
(450, 3, 172, 10, 'DEISY', '2022-09-19', NULL, NULL, 'ADELANTO', 22, 8, 1, '-50.0000', '2022-09-19 16:34:39', '2022-09-19 16:34:39', 1),
(451, 3, 173, 10, 'EDGAR', '2022-09-19', NULL, NULL, 'DEL 12 AL 17 DE SETIEMBRE', 22, 8, 1, '-300.0000', '2022-09-19 16:35:17', '2022-09-19 16:35:17', 1),
(452, 3, 174, 10, 'ROBERTO', '2022-09-19', NULL, NULL, 'DEL 12 AL 17 DE SETIEMBRE', 22, 8, 1, '-120.0000', '2022-09-19 16:35:58', '2022-09-19 16:35:58', 1),
(453, 3, 175, 2, 'ANIBAL', '2022-09-19', NULL, NULL, 'BLR ', 22, 8, 1, '-100.0000', '2022-09-19 16:44:03', '2022-09-19 16:44:03', 1),
(454, 3, 176, 9, 'ANIBAL', '2022-09-19', NULL, NULL, 'PEAJES', 22, 8, 1, '-128.2000', '2022-09-19 16:44:59', '2022-09-19 16:44:59', 1),
(455, 3, 177, 8, 'ANIBAL', '2022-09-19', NULL, NULL, 'MONTACARGUISTA', 22, 8, 1, '-10.0000', '2022-09-19 16:45:43', '2022-09-19 16:45:43', 1),
(456, 3, 178, 6, 'ROSALINO', '2022-09-19', NULL, NULL, '6 CUCHILLAS', 22, 8, 1, '-6.0000', '2022-09-19 16:46:59', '2022-09-19 16:46:59', 1),
(457, 3, 179, 9, 'ROSALINO', '2022-09-19', NULL, NULL, 'PEAJES', 22, 8, 1, '-71.5000', '2022-09-19 16:49:01', '2022-09-19 16:49:01', 1),
(458, 3, 180, 13, 'ROSALINO', '2022-09-19', NULL, NULL, '3 BALANZAS', 22, 8, 1, '-29.0000', '2022-09-19 16:50:46', '2022-09-19 16:50:46', 1),
(459, 3, 181, 12, 'ROSALINO', '2022-09-19', NULL, NULL, 'AGUAS', 22, 8, 1, '-15.0000', '2022-09-19 16:51:33', '2022-09-19 16:51:33', 1),
(460, 3, 182, 7, 'ROSALINO', '2022-09-19', NULL, NULL, 'TAXI', 22, 8, 1, '-35.0000', '2022-09-19 16:52:00', '2022-09-19 16:52:00', 1),
(461, 3, 183, 3, 'ROSALINO', '2022-09-19', NULL, NULL, 'LAVADO ATV718', 22, 8, 1, '-35.0000', '2022-09-19 16:53:26', '2022-09-19 16:53:26', 1),
(462, 2, 137, NULL, NULL, '2022-09-20', NULL, 76, 'SALCEDO HUAMAN DANY G. ', 1, 3, 1, '-65000.0000', '2022-09-22 10:00:19', '2022-09-22 10:00:19', 1),
(463, 2, 138, NULL, NULL, '2022-09-22', NULL, 59, 'HUAYCA OSCO ', 1, 3, 1, '-6284.0000', '2022-09-22 10:02:51', '2022-09-22 10:02:51', 1),
(464, 3, 184, 1, 'BANCO', '2022-09-19', NULL, NULL, 'IMPUESTO ITF ', 1, 3, 1, '-2.5000', '2022-09-22 11:35:44', '2022-09-22 11:35:44', 1),
(465, 3, 185, 1, 'BANCO', '2022-09-20', NULL, NULL, 'IMPUESTO ITF', 1, 3, 1, '-3.5500', '2022-09-22 11:36:15', '2022-09-22 11:36:15', 1),
(466, 2, 139, NULL, NULL, '2022-09-21', NULL, 43, 'CORPORACIO E INVERSIONES CASTAÑEDA ERIL - CAMPAÑA', 1, 3, 1, '-20000.0000', '2022-09-22 11:39:09', '2022-09-22 11:39:09', 1),
(467, 2, 140, NULL, NULL, '2022-09-22', NULL, 43, 'DESTINOS TRAVELS AND TOUR - VUELOS ', 1, 3, 1, '-550.0000', '2022-09-22 11:39:43', '2022-09-22 11:39:43', 1),
(468, 2, 141, NULL, NULL, '2022-09-21', NULL, 43, 'COMERCIALIZACION B Y L EIRL - PERMISOS DE 2 NUEVAS EMPRESAS', 1, 3, 1, '-3000.0000', '2022-09-22 11:40:28', '2022-09-22 11:40:28', 1),
(469, 5, 30, NULL, 'DEISY ', '2022-09-21', NULL, NULL, 'MOV INTERNO', 1, 3, 1, '-500.0000', '2022-09-22 11:42:18', '2022-09-22 11:42:18', 1),
(470, 5, 30, NULL, 'DEISY ', '2022-09-21', NULL, NULL, 'MOV INTERNO', 25, 3, 1, '500.0000', '2022-09-22 11:42:18', '2022-09-22 11:42:18', 1),
(471, 2, 142, NULL, NULL, '2022-09-21', NULL, 61, 'CURO JUANITO HECTOR ', 1, 3, 1, '-7300.0000', '2022-09-22 11:43:38', '2022-09-22 11:43:38', 1),
(472, 3, 186, 1, 'BANCO', '2022-09-21', NULL, NULL, 'IMPUESTO ITF', 1, 3, 1, '-1.5000', '2022-09-22 11:44:10', '2022-09-22 11:44:10', 1),
(473, 3, 192, 1, 'BANCO', '2022-09-20', NULL, NULL, 'IMPUESTO ITF', 4, 3, 1, '-6.0000', '2022-09-22 12:05:24', '2022-09-22 12:05:24', 1),
(474, 2, 143, NULL, NULL, '2022-09-20', NULL, 60, 'JIMMY FRANCIS PORTALANZAS ', 4, 1, 1, '-50000.0000', '2022-09-22 12:07:11', '2022-09-22 12:07:11', 1),
(475, 2, 159, NULL, NULL, '2022-09-22', NULL, 40, 'TAMATA TICAHUANA LUCIANO A. ', 4, 3, 1, '-15000.0000', '2022-09-22 12:12:36', '2022-09-22 12:12:36', 1),
(476, 3, 188, 4, 'EDUARDO', '2022-09-20', NULL, NULL, 'PAGO DE SISTEMA', 4, 3, 1, '-800.0000', '2022-09-22 12:25:26', '2022-09-22 12:25:26', 1),
(477, 3, 189, 3, 'DIDIER', '2022-09-20', NULL, NULL, 'FORRO DE KIA', 4, 3, 1, '-380.0000', '2022-09-22 12:27:09', '2022-09-22 12:27:09', 1),
(478, 2, 145, NULL, NULL, '2022-09-20', NULL, 37, 'RICARDO ROJAS ', 4, 3, 1, '-1170.0000', '2022-09-22 12:27:57', '2022-09-22 12:27:57', 1),
(479, 3, 190, 1, 'BANCO', '2022-09-20', NULL, NULL, 'IMPUESTO ITF', 4, 3, 1, '-3.3000', '2022-09-22 12:29:01', '2022-09-22 12:29:01', 1),
(480, 2, 146, NULL, NULL, '2022-09-22', NULL, 89, 'QUISPE GAMBOA LUIS', 4, 3, 1, '-63047.5000', '2022-09-22 12:34:32', '2022-09-22 12:34:32', 1),
(481, 3, 191, 1, 'BANCO', '2022-09-21', NULL, NULL, 'IMPUESTO ITF ', 4, 3, 1, '-3.1500', '2022-09-22 12:35:01', '2022-09-22 12:35:01', 1),
(482, 1, 36, NULL, NULL, '2022-09-19', NULL, 4, '0PE1000001 ZINC INDUST', 4, 3, 1, '70049.5200', '2022-09-22 12:36:06', '2022-09-22 12:36:06', 1),
(483, 1, 37, NULL, NULL, '2022-09-20', NULL, 48, 'DEPOSITO EFECTIVO', 5, 3, 1, '950.0000', '2022-09-22 12:39:38', '2022-09-22 12:39:38', 1),
(484, 1, 38, NULL, NULL, '2022-09-22', NULL, 80, 'VENTA DE COCALATA ', 5, 3, 1, '12768.0000', '2022-09-22 15:59:27', '2022-09-22 15:59:27', 1),
(485, 5, 31, NULL, 'DEISY', '2022-09-20', NULL, NULL, 'MOV INTERNO ', 6, 3, 1, '-25000.0000', '2022-09-22 16:16:34', '2022-09-22 16:16:34', 1),
(486, 5, 31, NULL, 'DEISY', '2022-09-20', NULL, NULL, 'MOV INTERNO ', 10, 3, 1, '25000.0000', '2022-09-22 16:16:35', '2022-09-22 16:16:35', 1),
(487, 2, 148, NULL, NULL, '2022-09-22', NULL, 89, 'QUISPE GAMBOA LUIS ', 6, 3, 1, '-20000.0000', '2022-09-22 16:21:27', '2022-09-22 16:21:27', 1),
(488, 2, 186, NULL, NULL, '2022-09-20', NULL, 76, 'SALCEDO HUAMAN ', 6, 1, 1, '-4877.0000', '2022-09-22 16:22:14', '2022-09-22 16:22:14', 1),
(489, 3, 193, 1, 'BANCO ', '2022-09-20', NULL, NULL, 'IMPUESTO ITF ', 6, 3, 1, '-2.4500', '2022-09-22 16:25:52', '2022-09-22 16:25:52', 1),
(490, 5, 32, NULL, 'DEISY ', '2022-09-21', NULL, NULL, 'MOV INTERNO ', 6, 3, 1, '-52000.0000', '2022-09-22 16:32:24', '2022-09-22 16:32:24', 1),
(491, 5, 32, NULL, 'DEISY ', '2022-09-21', NULL, NULL, 'MOV INTERNO ', 10, 3, 1, '52000.0000', '2022-09-22 16:32:24', '2022-09-22 16:32:24', 1),
(492, 2, 149, NULL, NULL, '2022-09-21', NULL, 40, 'LOURDES MAMANI TICAHUANA ', 6, 3, 1, '-20000.0000', '2022-09-22 16:36:04', '2022-09-22 16:36:04', 1),
(493, 3, 194, 1, 'BANCO', '2022-09-21', NULL, NULL, 'IMPUESTO ITF ', 6, 3, 1, '-3.6000', '2022-09-22 16:43:57', '2022-09-22 16:43:57', 1),
(494, 3, 195, 10, 'VALERIANO', '2022-09-21', NULL, NULL, 'PAGO DE CEL MOV ', 6, 3, 1, '-56.0000', '2022-09-22 16:53:05', '2022-09-22 16:53:05', 1),
(496, 3, 196, 5, 'EDWIN ', '2022-09-19', NULL, NULL, 'LEGALIZACION DE LB ACTAS ORMEÑO', 8, 3, 1, '-130.0000', '2022-09-22 16:58:04', '2022-09-22 16:58:04', 1),
(497, 3, 197, 5, 'EDWIN ', '2022-09-22', NULL, NULL, 'DIA DE REPRESENTANTE ', 6, 3, 1, '-50.0000', '2022-09-22 16:58:52', '2022-09-22 16:58:52', 1),
(498, 2, 151, NULL, NULL, '2022-09-20', NULL, 40, 'MAMANI TI CAHUANA LOURDES ', 9, 3, 1, '-15000.0000', '2022-09-22 17:03:09', '2022-09-22 17:03:09', 1),
(499, 3, 198, 3, 'DIDIER', '2022-09-20', NULL, NULL, 'MANTENIMIENTO KIA', 9, 3, 1, '-310.0000', '2022-09-22 17:04:51', '2022-09-22 17:04:51', 1),
(500, 3, 199, 1, 'BANCO ', '2022-09-19', NULL, NULL, 'IMPUESTO ITF ', 9, 3, 1, '-1.6000', '2022-09-22 17:05:22', '2022-09-22 17:05:22', 1),
(501, 3, 200, 1, 'BANCO ', '2022-09-20', NULL, NULL, 'IMPUESTO ITF ', 9, 3, 1, '-0.7500', '2022-09-22 17:05:50', '2022-09-22 17:05:50', 1),
(502, 2, 153, NULL, NULL, '2022-09-19', NULL, 73, 'REPARACION DE 2 VALVULAS Y 4 VIAS DE CAMIONES ', 9, 3, 1, '-280.0000', '2022-09-22 17:11:27', '2022-09-22 17:11:27', 1),
(503, 2, 154, NULL, NULL, '2022-09-20', NULL, 61, ' CHEQUE 00000060', 10, 7, 1, '-30000.0000', '2022-09-22 17:17:52', '2022-09-22 17:17:52', 1),
(504, 2, 155, NULL, NULL, '2022-09-21', NULL, 61, 'CHEQUE 00000061', 10, 3, 1, '-30000.0000', '2022-09-22 17:18:30', '2022-09-22 17:18:30', 1),
(505, 3, 201, 1, 'BANCO ', '2022-09-21', NULL, NULL, 'IMPUESTO ITF ', 10, 3, 1, '-4.1000', '2022-09-22 17:19:19', '2022-09-22 17:19:19', 1),
(506, 2, 156, NULL, NULL, '2022-09-22', NULL, 40, ' CHEQUE 00000070', 10, 7, 1, '-25000.0000', '2022-09-22 17:20:56', '2022-09-22 17:20:56', 1),
(507, 5, 33, NULL, 'DEISY ', '2022-09-22', NULL, NULL, 'MOV INTERNO ', 2, 3, 1, '-25000.0000', '2022-09-22 17:29:03', '2022-09-22 17:29:03', 1),
(508, 5, 33, NULL, 'DEISY ', '2022-09-22', NULL, NULL, 'MOV INTERNO ', 10, 3, 1, '25000.0000', '2022-09-22 17:29:04', '2022-09-22 17:29:04', 1),
(509, 5, 34, NULL, 'DEISY ', '2022-09-22', NULL, NULL, 'MOV INTERNO', 2, 3, 1, '-25000.0000', '2022-09-22 17:43:11', '2022-09-22 17:43:11', 1),
(510, 5, 34, NULL, 'DEISY ', '2022-09-22', NULL, NULL, 'MOV INTERNO', 14, 3, 1, '25000.0000', '2022-09-22 17:43:12', '2022-09-22 17:43:12', 1),
(511, 3, 202, 3, 'ROSALINO', '2022-09-19', NULL, NULL, 'FOCO ELECTRICISTA', 22, 8, 1, '-15.0000', '2022-09-23 11:07:52', '2022-09-23 11:07:52', 1),
(512, 3, 203, 3, 'ROSALINO', '2022-09-19', NULL, NULL, 'REVISION TECNICA ', 22, 8, 1, '-110.0000', '2022-09-23 11:08:51', '2022-09-23 11:08:51', 1),
(513, 3, 204, 2, 'ROSALINO', '2022-09-23', NULL, NULL, 'ATV718', 22, 8, 1, '-600.0000', '2022-09-23 11:10:45', '2022-09-23 11:10:45', 1),
(514, 3, 205, 7, 'ROSALINO', '2022-09-19', NULL, NULL, 'COCHERA', 22, 8, 1, '-5.0000', '2022-09-23 11:11:10', '2022-09-23 11:11:10', 1),
(515, 3, 206, 9, 'BEBETO', '2022-09-19', NULL, NULL, 'PEAJES', 22, 9, 1, '-25.0000', '2022-09-23 11:18:07', '2022-09-23 11:18:07', 1),
(516, 3, 207, 7, 'BEBETO', '2022-09-19', NULL, NULL, 'COCHERA ', 22, 8, 1, '-2.0000', '2022-09-23 11:25:42', '2022-09-23 11:25:42', 1),
(517, 3, 208, 3, 'BEBETO', '2022-09-19', NULL, NULL, 'LAVADO DE CARRO', 22, 8, 1, '-30.0000', '2022-09-23 11:26:14', '2022-09-23 11:26:14', 1),
(518, 3, 209, 11, 'BEBETO', '2022-09-19', NULL, NULL, 'BOTADA DE BASURA', 22, 9, 1, '-30.0000', '2022-09-23 11:40:25', '2022-09-23 11:40:25', 1),
(519, 3, 210, 1, 'BANCO', '2022-09-21', NULL, NULL, 'IMPUESTO ITF ', 1, 3, 1, '-1.5000', '2022-09-24 10:03:44', '2022-09-24 10:03:44', 1),
(520, 2, 157, NULL, NULL, '2022-09-22', NULL, 16, 'MENDOZA ALARCON DE CHANA DIANA /CHANAME CHAFLOQUE CESAR ', 1, 3, 1, '-10000.0000', '2022-09-24 10:07:58', '2022-09-24 10:07:58', 1),
(521, 2, 158, NULL, NULL, '2022-09-22', NULL, 61, 'DEMER ', 1, 3, 1, '-28740.0000', '2022-09-24 10:08:37', '2022-09-24 10:08:37', 1),
(522, 3, 211, 1, 'BANCO', '2022-09-22', NULL, NULL, 'IMPUESTO ITF ', 1, 3, 1, '-1.9000', '2022-09-24 10:09:07', '2022-09-24 10:09:07', 1),
(523, 1, 39, NULL, NULL, '2022-09-22', NULL, 35, 'DE CERRADURAS NACIONAL', 1, 3, 1, '112978.2000', '2022-09-24 10:10:56', '2022-09-24 10:10:56', 1),
(524, 1, 40, NULL, NULL, '2022-09-23', NULL, 35, 'DE CERRADURAS NACIONAL', 1, 3, 1, '130421.5800', '2022-09-24 10:11:44', '2022-09-24 10:11:44', 1),
(525, 2, 160, NULL, NULL, '2022-09-23', NULL, 43, 'ALARCON SOLIS MIGUEL A.  - TRANSPORTE ', 1, 3, 1, '-1000.0000', '2022-09-24 11:03:51', '2022-09-24 11:03:51', 1),
(526, 2, 161, NULL, NULL, '2022-09-23', NULL, 1, 'RAUL VASQUEZ ', 1, 3, 1, '-10000.0000', '2022-09-24 11:05:53', '2022-09-24 11:05:53', 1),
(527, 3, 212, 1, 'BANCO', '2022-09-23', NULL, NULL, 'IMPUESTO ITF ', 1, 3, 1, '-12.6500', '2022-09-24 11:07:32', '2022-09-24 11:07:32', 1),
(528, 2, 162, NULL, NULL, '2022-09-24', NULL, 60, 'JIMMY FRANCIS PORTALANZAS SOPLIN ', 1, 3, 1, '-7639.0000', '2022-09-24 11:09:14', '2022-09-24 11:09:14', 1),
(529, 2, 163, NULL, NULL, '2022-09-24', NULL, 60, 'JIMMY PORTALANZAS SOPLIN ', 1, 3, 1, '-26892.0000', '2022-09-24 11:25:23', '2022-09-24 11:25:23', 1),
(530, 2, 164, NULL, NULL, '2022-09-22', NULL, 49, 'AMERICA ALEJANDRA CUETO ', 2, 1, 1, '-2287.9000', '2022-09-24 11:33:29', '2022-09-24 11:33:29', 1),
(531, 3, 213, 14, 'TTP', '2022-09-22', NULL, NULL, 'ADUANAS', 2, 1, 1, '-4283.6000', '2022-09-24 11:38:07', '2022-09-24 11:38:07', 1),
(532, 3, 214, 1, 'BANCO', '2022-09-22', NULL, NULL, 'IMPUESTO ITF', 2, 3, 1, '-2.8000', '2022-09-24 11:39:06', '2022-09-24 11:39:06', 1),
(533, 1, 41, NULL, NULL, '2022-09-23', NULL, 4, '0PE1000001 ZINC INDUST', 2, 3, 1, '52517.0800', '2022-09-24 11:40:52', '2022-09-24 11:40:52', 1),
(534, 3, 215, 5, 'KAIROS', '2022-09-23', NULL, NULL, 'GUIAS IPAYS  GO ', 2, 3, 1, '-80.0000', '2022-09-24 11:42:26', '2022-09-24 11:42:26', 1),
(535, 3, 216, 11, 'PANTALEON ', '2022-09-23', NULL, NULL, '5 BIDONES DE AGUA ', 2, 3, 1, '-100.0000', '2022-09-24 11:42:55', '2022-09-24 11:42:55', 1),
(536, 3, 217, 11, 'LA POSITIVA ', '2022-09-23', NULL, NULL, 'SCTR ', 2, 3, 1, '-543.3000', '2022-09-24 11:43:45', '2022-09-24 11:43:45', 1),
(537, 2, 165, NULL, NULL, '2022-09-23', NULL, 43, 'GIANPIER CABELLO - REPRESENTANTE ', 2, 3, 1, '-1000.0000', '2022-09-24 11:45:45', '2022-09-24 11:45:45', 1),
(538, 2, 166, NULL, NULL, '2022-09-23', NULL, 37, 'RICARDO ROJAS ', 2, 3, 1, '-5000.0000', '2022-09-24 11:46:21', '2022-09-24 11:46:21', 1),
(539, 2, 167, NULL, NULL, '2022-09-23', NULL, 61, 'SANCHEZ QUISPE JOSE ', 2, 3, 1, '-8084.0000', '2022-09-24 11:47:49', '2022-09-24 11:47:49', 1),
(540, 2, 168, NULL, NULL, '2022-09-23', NULL, 44, 'HUAMAN MOYA SABINA ', 2, 3, 1, '-19115.0000', '2022-09-24 11:49:57', '2022-09-24 11:49:57', 1),
(541, 2, 169, NULL, NULL, '2022-09-23', NULL, 51, 'HUAMAN ESTUMBELO ALBERTO ', 2, 3, 1, '-25000.0000', '2022-09-24 11:50:35', '2022-09-24 11:50:35', 1),
(542, 3, 218, 1, 'BANCO ', '2022-09-23', NULL, NULL, 'IMPUESTO ITF ', 2, 3, 1, '-5.5000', '2022-09-24 11:51:09', '2022-09-24 11:51:09', 1),
(543, 2, 170, NULL, NULL, '2022-09-24', NULL, 37, 'RICARDO ROJAS ', 2, 3, 1, '-10000.0000', '2022-09-24 11:52:15', '2022-09-24 11:52:15', 1),
(544, 2, 171, NULL, NULL, '2022-09-24', NULL, 51, 'HUAMAN ESTUMBELO ', 2, 3, 1, '-25000.0000', '2022-09-24 11:52:48', '2022-09-24 11:52:48', 1),
(545, 5, 35, NULL, 'LILLIAN ', '2022-09-22', NULL, NULL, 'FACT  - COMPANY ', 14, 3, 1, '-21157.4000', '2022-09-24 12:46:28', '2022-09-24 12:46:28', 1),
(546, 5, 35, NULL, 'LILLIAN ', '2022-09-22', NULL, NULL, 'FACT  - COMPANY ', 4, 3, 1, '21157.4000', '2022-09-24 12:46:28', '2022-09-24 12:46:28', 1),
(547, 3, 219, 1, 'BANCO ', '2022-09-22', NULL, NULL, 'IMPUESTO ITF ', 4, 3, 1, '-1.0500', '2022-09-24 12:47:29', '2022-09-24 12:47:29', 1),
(548, 3, 219, 1, 'BANCO ', '2022-09-22', NULL, NULL, 'IMPUESTO ITF ', 4, 3, 1, '-1.0500', '2022-09-24 12:47:30', '2022-09-24 12:47:30', 1),
(551, 1, 42, NULL, NULL, '2022-09-22', NULL, 4, '0PE1000001 ZINC INDUST', 3, 3, 1, '55504.4100', '2022-09-24 12:49:56', '2022-09-24 12:49:56', 1),
(552, 1, 43, NULL, NULL, '2022-09-22', NULL, 4, ' 0PE1000001 ZINC INDUST', 3, 3, 1, '63306.9500', '2022-09-24 12:50:20', '2022-09-24 12:50:20', 1),
(553, 3, 220, 1, 'BANCO ', '2022-09-22', NULL, NULL, 'IMPUESTO ITF', 3, 3, 1, '-7.0000', '2022-09-24 12:50:48', '2022-09-24 12:50:48', 1),
(554, 3, 221, 1, 'BANCO ', '2022-09-22', NULL, NULL, 'IMPUESTO ITF ', 5, 3, 1, '-0.6000', '2022-09-24 12:52:04', '2022-09-24 12:52:04', 1),
(555, 1, 44, NULL, NULL, '2022-09-23', NULL, 65, 'DE SYNERGYA S.A.C.', 8, 3, 1, '79218.7600', '2022-09-24 13:02:31', '2022-09-24 13:02:31', 1),
(556, 3, 222, 1, 'BANCO ', '2022-09-23', NULL, NULL, 'IMPUESTO ITF', 8, 3, 1, '-3.9500', '2022-09-24 13:03:25', '2022-09-24 13:03:25', 1),
(557, 3, 223, 8, 'DEISY', '2022-09-19', NULL, NULL, 'YAPEOS', 8, 3, 1, '-54.0000', '2022-09-24 13:11:07', '2022-09-24 13:11:07', 1),
(558, 3, 224, 1, 'BANCO ', '2022-09-22', NULL, NULL, 'IMPUESTO ITF ', 10, 3, 1, '-2.5000', '2022-09-24 13:13:06', '2022-09-24 13:13:06', 1),
(559, 3, 226, 1, 'BANCO', '2022-09-22', NULL, NULL, 'IMPUESTO ITF ', 10, 3, 1, '-7.7500', '2022-09-24 13:14:48', '2022-09-24 13:14:48', 1),
(560, 5, 36, NULL, 'LILLIAN', '2022-09-22', NULL, NULL, 'FACT COMPANY', 14, 3, 1, '-22420.0000', '2022-09-24 13:17:12', '2022-09-24 13:17:12', 1),
(561, 5, 36, NULL, 'LILLIAN', '2022-09-22', NULL, NULL, 'FACT COMPANY', 3, 3, 1, '22420.0000', '2022-09-24 13:17:12', '2022-09-24 13:17:12', 1),
(562, 5, 37, NULL, 'LILLIAN ', '2022-09-22', NULL, NULL, 'MOV INTERNO ', 14, 3, 1, '-6422.6000', '2022-09-24 13:20:33', '2022-09-24 13:20:33', 1),
(563, 5, 37, NULL, 'LILLIAN ', '2022-09-22', NULL, NULL, 'MOV INTERNO ', 22, 3, 1, '6422.6000', '2022-09-24 13:20:33', '2022-09-24 13:20:33', 1),
(564, 3, 228, 1, 'BANCO', '2022-09-22', NULL, NULL, 'IMPUESTO ITF', 14, 3, 1, '-3.8500', '2022-09-24 13:21:42', '2022-09-24 13:21:42', 1),
(565, 2, 172, NULL, NULL, '2022-09-19', NULL, 73, 'GASTOS DE CARROS', 22, 9, 1, '-395.5000', '2022-09-24 14:08:29', '2022-09-24 14:08:29', 1),
(566, 1, 45, NULL, NULL, '2022-09-19', NULL, 48, 'VENTA DE OLLA', 22, 3, 1, '8000.0000', '2022-09-24 14:11:33', '2022-09-24 14:11:33', 1),
(567, 2, 173, NULL, NULL, '2022-09-19', NULL, 79, 'COMPRA DE MATERIAL ', 22, 9, 1, '-457.0000', '2022-09-24 14:12:43', '2022-09-24 14:12:43', 1),
(568, 2, 174, NULL, NULL, '2022-09-20', NULL, 79, ' A CUENTA DE MATERIALES ', 22, 8, 1, '-1000.0000', '2022-09-24 14:13:47', '2022-09-24 14:13:47', 1),
(569, 3, 229, 10, 'JOSE', '2022-09-20', NULL, NULL, 'PLANILLA', 22, 9, 1, '-100.0000', '2022-09-24 14:16:39', '2022-09-24 14:16:39', 1),
(570, 2, 175, NULL, NULL, '2022-09-21', NULL, 37, 'COMPRA DE GRUPO', 22, 8, 1, '-30000.0000', '2022-09-24 14:28:01', '2022-09-24 14:28:01', 1),
(571, 2, 176, NULL, NULL, '2022-09-21', NULL, 59, 'COMPRA DE COBRE', 22, 8, 1, '-80000.0000', '2022-09-24 14:28:58', '2022-09-24 14:28:58', 1),
(572, 2, 177, NULL, NULL, '2022-09-21', NULL, 71, 'COPRA DE COBRE', 22, 8, 1, '-20000.0000', '2022-09-24 14:30:41', '2022-09-24 14:30:41', 1),
(573, 3, 230, 2, 'BEBETO', '2022-09-21', NULL, NULL, 'COMBUSTIBLE', 22, 3, 1, '-900.0000', '2022-09-24 14:48:13', '2022-09-24 14:48:13', 1),
(574, 2, 178, NULL, NULL, '2022-09-22', NULL, 21, 'COMPRA DE METALES', 22, 9, 1, '-10900.0000', '2022-09-24 14:49:59', '2022-09-24 14:49:59', 1),
(575, 3, 231, 10, 'JUNIOR', '2022-09-22', NULL, NULL, 'ADELANTO ', 22, 9, 1, '-50.0000', '2022-09-24 14:56:01', '2022-09-24 14:56:01', 1),
(576, 3, 232, 10, 'DEISY', '2022-09-22', NULL, NULL, 'ADELANTO ', 22, 9, 1, '-50.0000', '2022-09-24 14:56:42', '2022-09-24 14:56:42', 1),
(577, 3, 233, 10, 'EDGAR', '2022-09-22', NULL, NULL, 'ADELANTO ', 22, 9, 1, '-50.0000', '2022-09-24 15:21:46', '2022-09-24 15:21:46', 1),
(578, 3, 234, 12, 'JUGUERIA', '2022-09-22', NULL, NULL, 'JUGOS', 22, 9, 1, '-33.0000', '2022-09-24 15:23:56', '2022-09-24 15:23:56', 1),
(579, 2, 179, NULL, NULL, '2022-09-23', NULL, 49, 'FLETE', 22, 9, 1, '-830.0000', '2022-09-24 15:24:48', '2022-09-24 15:24:48', 1),
(580, 2, 180, NULL, NULL, '2022-09-22', NULL, 79, 'PRENSA 2 BOTELLAS', 22, 9, 1, '-3000.0000', '2022-09-24 15:25:35', '2022-09-24 15:25:35', 1),
(581, 2, 181, NULL, NULL, '2022-09-22', NULL, 79, 'MANO DE OBRA', 22, 9, 1, '-2000.0000', '2022-09-24 15:25:59', '2022-09-24 15:25:59', 1),
(582, 2, 182, NULL, NULL, '2022-09-24', NULL, 39, 'ACUENTA ', 22, 9, 1, '-5500.0000', '2022-09-24 15:33:01', '2022-09-24 15:33:01', 1),
(583, 3, 235, 10, 'LILLIAN ', '2022-09-22', NULL, NULL, 'ADELANTO ', 22, 9, 1, '-40.0000', '2022-09-24 15:35:04', '2022-09-24 15:35:04', 1),
(584, 2, 183, NULL, NULL, '2022-09-22', NULL, 16, 'EFECTIVO', 22, 9, 1, '-3000.0000', '2022-09-24 15:35:51', '2022-09-24 15:35:51', 1),
(585, 1, 48, NULL, NULL, '2022-09-23', NULL, 66, 'A CUENTA ', 22, 9, 1, '6000.0000', '2022-09-24 15:36:23', '2022-09-24 15:36:23', 1),
(586, 1, 47, NULL, NULL, '2022-09-23', NULL, 66, 'A CUENTA ', 22, 9, 1, '1000.0000', '2022-09-24 15:36:48', '2022-09-24 15:36:48', 1),
(587, 3, 236, 7, 'FLETE', '2022-09-22', NULL, NULL, ' FLETE', 22, 9, 1, '-500.0000', '2022-09-24 15:37:51', '2022-09-24 15:37:51', 1),
(588, 3, 237, 8, 'JUAN', '2022-09-23', NULL, NULL, 'EFECTIVO', 22, 9, 1, '-50.0000', '2022-09-24 15:38:26', '2022-09-24 15:38:26', 1),
(589, 2, 184, NULL, NULL, '2022-09-23', NULL, 43, 'REPARACION CIVIL', 22, 9, 1, '-3937.0000', '2022-09-24 15:39:07', '2022-09-24 15:39:07', 1),
(590, 3, 238, 7, 'LILLIAN', '2022-09-22', NULL, NULL, 'PASAJE AL BANCO', 22, 9, 1, '-2.0000', '2022-09-24 15:39:52', '2022-09-24 15:39:52', 1),
(591, 2, 185, NULL, NULL, '2022-09-22', NULL, 89, 'EFECTIVO', 22, 9, 1, '-10000.0000', '2022-09-24 15:42:12', '2022-09-24 15:42:12', 1),
(592, 2, 187, NULL, NULL, '2022-09-24', NULL, 32, 'COMPRA DE METALES', 1, 3, 1, '-19811.1000', '2022-09-26 16:57:12', '2022-09-26 16:57:12', 1),
(593, 3, 239, 1, 'BANCO', '2022-09-24', NULL, NULL, 'IMPUESTO ITF ', 1, 3, 1, '-2.6500', '2022-09-26 16:59:12', '2022-09-26 16:59:12', 1),
(594, 3, 240, 14, 'SMAK ', '2022-09-24', NULL, NULL, 'TRANSPORTE CONTENEDOR DE PERFIL ', 1, 3, 1, '-654.0000', '2022-09-26 17:01:56', '2022-09-26 17:01:56', 1),
(595, 2, 188, NULL, NULL, '2022-09-26', NULL, 61, 'CONTRERAS SANCHEZ CARLA', 1, 3, 1, '-1053.0000', '2022-09-26 17:04:38', '2022-09-26 17:04:38', 1),
(596, 2, 189, NULL, NULL, '2022-09-24', NULL, 43, 'PAGO DE MERLY ', 1, 3, 1, '-205.7000', '2022-09-26 17:05:57', '2022-09-26 17:05:57', 1),
(597, 2, 190, NULL, NULL, '2022-09-24', NULL, 22, 'CANCELACION DE COBRE ', 1, 3, 1, '-1244.7000', '2022-09-27 09:49:50', '2022-09-27 09:49:50', 1),
(598, 5, 38, NULL, 'DEISY', '2022-09-24', NULL, NULL, 'MOV INTERNO', 1, 3, 1, '-639.0000', '2022-09-27 09:50:48', '2022-09-27 09:50:48', 1),
(599, 5, 38, NULL, 'DEISY', '2022-09-24', NULL, NULL, 'MOV INTERNO', 22, 3, 1, '639.0000', '2022-09-27 09:50:48', '2022-09-27 09:50:48', 1),
(600, 3, 241, 4, 'LILLIAN ', '2022-09-27', NULL, NULL, 'CAMBIOS EN BROCHURE ', 1, 3, 1, '-70.0000', '2022-09-27 09:52:43', '2022-09-27 09:52:43', 1),
(601, 3, 242, 1, 'BANCO', '2022-09-26', NULL, NULL, 'IMPUESTO ITF ', 1, 3, 1, '-0.0500', '2022-09-27 09:53:09', '2022-09-27 09:53:09', 1),
(603, 3, 243, 1, 'BANCO', '2022-09-24', NULL, NULL, 'IMPUESTO ITF', 2, 3, 1, '-1.3600', '2022-09-27 09:58:11', '2022-09-27 09:58:11', 1),
(604, 2, 191, NULL, NULL, '2022-09-27', NULL, 39, 'MIREYA SOTO ', 2, 3, 1, '-5000.0000', '2022-09-27 10:05:01', '2022-09-27 10:05:01', 1),
(605, 2, 192, NULL, NULL, '2022-09-27', NULL, 39, 'BRAYAN FLORES RAMIREZ', 2, 3, 1, '-2000.0000', '2022-09-27 10:10:55', '2022-09-27 10:10:55', 1),
(606, 2, 193, NULL, NULL, '2022-09-27', NULL, 39, 'FLOR MERCY AGUILAR FLORES', 2, 3, 1, '-7700.0000', '2022-09-27 10:11:32', '2022-09-27 10:11:32', 1),
(607, 2, 194, NULL, NULL, '2022-09-27', NULL, 39, 'PEDRO SOTO', 2, 3, 1, '-10000.0000', '2022-09-27 10:13:16', '2022-09-27 10:13:16', 1),
(608, 2, 195, NULL, NULL, '2022-09-27', NULL, 39, 'MARIO FLORES ', 2, 3, 1, '-4874.8000', '2022-09-27 10:21:09', '2022-09-27 10:21:09', 1),
(609, 2, 197, NULL, NULL, '2022-09-27', NULL, 43, 'RESGUARDO ADICIONAL - CAMPAÑA DE WILY - INFANTES MARTINEZ ANGEL ', 2, 3, 1, '-400.0000', '2022-09-27 10:35:42', '2022-09-27 10:35:42', 1),
(610, 5, 39, NULL, 'LILLIAN ', '2022-09-24', NULL, NULL, 'MOV INTERNO ', 22, 3, 1, '-600.0000', '2022-09-27 11:00:28', '2022-09-27 11:00:28', 1),
(611, 5, 39, NULL, 'LILLIAN ', '2022-09-24', NULL, NULL, 'MOV INTERNO ', 5, 3, 1, '600.0000', '2022-09-27 11:00:28', '2022-09-27 11:00:28', 1),
(612, 3, 245, 10, 'BEBETO ', '2022-09-27', NULL, NULL, 'DEL 19 AL 24 SETIEMBRE ', 5, 3, 1, '-643.7500', '2022-09-27 11:05:02', '2022-09-27 11:05:02', 1),
(613, 3, 245, 10, 'ROSALINO ', '2022-09-27', NULL, NULL, 'DEL 19 AL 24 SETIEMBRE ', 5, 3, 1, '-618.7500', '2022-09-27 11:08:33', '2022-09-27 11:08:33', 1),
(614, 3, 246, 10, 'EDIN ', '2022-09-24', NULL, NULL, 'DEL 19 AL 24 SETIEMBRE ', 5, 3, 1, '-531.2500', '2022-09-27 11:10:31', '2022-09-27 11:10:31', 1),
(615, 3, 247, 10, 'DIDIER', '2022-09-24', NULL, NULL, 'DEL 19 AL 24 SETIEMBRE ', 5, 3, 1, '-500.0000', '2022-09-27 11:17:22', '2022-09-27 11:17:22', 1),
(616, 3, 248, 10, 'VALERIANO', '2022-09-24', NULL, NULL, 'DEL 19 AL 24 SETIEMBRE ', 5, 3, 1, '-500.0000', '2022-09-27 11:17:51', '2022-09-27 11:17:51', 1),
(617, 3, 249, 10, 'ALFREDO', '2022-09-24', NULL, NULL, 'DEL 19 AL 24 SETIEMBRE ', 5, 3, 1, '-496.8800', '2022-09-27 11:18:20', '2022-09-27 11:18:20', 1),
(618, 3, 250, 10, 'ANIBAL', '2022-09-24', NULL, NULL, 'DEL 19 AL 24 SETIEMBRE ', 5, 3, 1, '-470.0000', '2022-09-27 11:18:48', '2022-09-27 11:18:48', 1),
(619, 3, 251, 10, 'NOLBERTO', '2022-09-24', NULL, NULL, 'DEL 19 AL 24 SETIEMBRE ', 5, 3, 1, '-470.0000', '2022-09-27 11:19:26', '2022-09-27 11:19:26', 1),
(620, 3, 252, 10, 'TOÑO', '2022-09-24', NULL, NULL, 'DESTAPADO ', 5, 3, 1, '-394.2700', '2022-09-27 11:20:17', '2022-09-27 11:20:17', 1),
(621, 3, 253, 10, 'ERICSON ', '2022-09-24', NULL, NULL, 'DEL 19 AL 24 SETIEMBRE ', 5, 3, 1, '-350.0000', '2022-09-27 11:22:03', '2022-09-27 11:22:03', 1),
(622, 3, 254, 10, 'JUNIOR', '2022-09-24', NULL, NULL, 'DEL 19 AL 24 SETIEMBRE ', 5, 3, 1, '-314.5800', '2022-09-27 11:34:56', '2022-09-27 11:34:56', 1),
(623, 3, 255, 10, 'ZORAIDA', '2022-09-24', NULL, NULL, 'QUINCENA ', 5, 3, 1, '-300.0000', '2022-09-27 11:35:38', '2022-09-27 11:35:38', 1),
(624, 3, 256, 10, 'JOSE', '2022-09-24', NULL, NULL, 'DEL 19 AL 24 SETIEMBRE ', 5, 3, 1, '-291.6700', '2022-09-27 11:36:54', '2022-09-27 11:36:54', 1),
(625, 3, 257, 8, 'VETERINARIO', '2022-09-24', NULL, NULL, 'VETERINARIO ', 8, 3, 1, '-100.0000', '2022-09-27 11:43:56', '2022-09-27 11:43:56', 1),
(626, 3, 258, 12, 'EDUARDO', '2022-09-21', NULL, NULL, 'MENU EDUARDO', 8, 3, 1, '-13.0000', '2022-09-27 11:44:40', '2022-09-27 11:44:40', 1),
(627, 3, 259, 12, 'JUAN', '2022-09-27', NULL, NULL, 'MENU JUAN ', 8, 3, 1, '-34.0000', '2022-09-27 11:45:07', '2022-09-27 11:45:07', 1),
(628, 2, 198, NULL, NULL, '2022-09-24', NULL, 43, 'SOAT RANGER ROVER', 8, 3, 1, '-54.0000', '2022-09-27 11:46:20', '2022-09-27 11:46:20', 1),
(629, 3, 260, 4, 'DEISY ', '2022-09-24', NULL, NULL, 'PAPELERIA', 8, 3, 1, '-30.0000', '2022-09-27 11:47:15', '2022-09-27 11:47:15', 1),
(630, 1, 49, NULL, NULL, '2022-09-26', NULL, 67, '$35400 EVNTA DE PERFIL - 3.92', 11, 3, 1, '138768.0000', '2022-09-27 11:52:22', '2022-09-27 11:52:22', 1),
(631, 1, 50, NULL, NULL, '2022-09-27', NULL, 67, '$83.94 - VENTA DE PERFIL ', 17, 3, 1, '328.6500', '2022-09-27 11:57:51', '2022-09-27 11:57:51', 1),
(632, 3, 261, 1, 'BANCO', '2022-09-26', NULL, NULL, 'PORTES AUTOSOBRE', 17, 3, 1, '-5.1750', '2022-09-27 11:59:13', '2022-09-27 11:59:13', 1),
(633, 3, 262, 1, 'BANCO ', '2022-09-22', NULL, NULL, '$1.75 IMPUESTO ITF ', 17, 3, 1, '-6.8600', '2022-09-27 11:59:53', '2022-09-27 11:59:53', 1),
(634, 3, 263, 1, 'BANCO ', '2022-09-26', NULL, NULL, '$1.75  IMPUESTO ITF ', 17, 3, 1, '-6.8600', '2022-09-27 12:00:32', '2022-09-27 12:00:32', 1),
(635, 3, 264, 1, 'BANCO ', '2022-09-26', NULL, NULL, 'IMPUESTO ITF ', 11, 3, 1, '-6.9000', '2022-09-27 12:01:24', '2022-09-27 12:01:24', 1),
(636, 3, 265, 1, 'BANCO ', '2022-09-26', NULL, NULL, 'GASTOS BANCARIOS', 25, 3, 1, '-118.9600', '2022-09-27 12:05:42', '2022-09-27 12:05:42', 1),
(637, 3, 266, 12, 'BEBETO', '2022-09-27', NULL, NULL, '2 gaseosas', 22, 3, 1, '-20.0000', '2022-09-27 15:44:36', '2022-09-27 15:44:36', 1),
(638, 3, 267, 9, 'BEBETO', '2022-09-27', NULL, NULL, '2 PEAJES ', 22, 8, 1, '-39.0000', '2022-09-27 15:49:03', '2022-09-27 15:49:03', 1),
(639, 3, 268, 13, 'BEBETO', '2022-09-27', NULL, NULL, 'BALANZAS ', 22, 8, 1, '-69.0000', '2022-09-27 15:51:15', '2022-09-27 15:51:15', 1),
(641, 3, 269, 8, 'BEBETO', '2022-09-24', NULL, NULL, 'PEAJES', 22, 8, 1, '-5.5000', '2022-09-27 15:51:51', '2022-09-27 15:51:51', 1),
(642, 3, 270, 3, 'BEBETO ', '2022-09-27', NULL, NULL, 'LAVADO DE CARRO ', 22, 8, 1, '-40.0000', '2022-09-27 15:52:22', '2022-09-27 15:52:22', 1),
(643, 3, 271, 6, 'BEBETO ', '2022-09-27', NULL, NULL, 'MASCARILLA', 22, 8, 1, '-8.0000', '2022-09-27 15:52:43', '2022-09-27 15:52:43', 1),
(644, 3, 272, 2, 'BEBETO', '2022-09-27', NULL, NULL, 'BLINDADO', 22, 8, 1, '-150.0000', '2022-09-27 15:54:33', '2022-09-27 15:54:33', 1),
(645, 3, 273, 9, 'ANIBAL', '2022-09-26', NULL, NULL, 'PEAJE TUNKE', 22, 8, 1, '-38.2000', '2022-09-27 15:56:03', '2022-09-27 15:56:03', 1),
(646, 3, 274, 2, 'ANIBAL', '2022-09-27', NULL, NULL, 'BLR ', 22, 8, 1, '-292.2200', '2022-09-27 15:56:43', '2022-09-27 15:56:43', 1),
(647, 3, 275, 9, 'ANIBAL', '2022-09-27', NULL, NULL, 'PEAJE A ZINSA BLR', 22, 9, 1, '-13.0000', '2022-09-27 15:57:24', '2022-09-27 15:57:24', 1),
(648, 3, 276, 7, 'ANIBAL', '2022-09-27', NULL, NULL, 'MOTO', 22, 8, 1, '-3.5000', '2022-09-27 15:57:47', '2022-09-27 15:57:47', 1),
(649, 3, 277, 9, 'ROSALINO', '2022-09-27', NULL, NULL, 'PEAJES', 22, 8, 1, '-70.3000', '2022-09-27 15:59:16', '2022-09-27 15:59:16', 1),
(650, 3, 278, 6, 'ROSALINO', '2022-09-27', NULL, NULL, '6 CUCHILLAS', 21, 8, 1, '-6.0000', '2022-09-27 15:59:44', '2022-09-27 15:59:44', 1),
(651, 3, 279, 13, 'ROSALINO', '2022-09-27', NULL, NULL, 'BALANZA', 22, 8, 1, '-10.0000', '2022-09-27 16:00:29', '2022-09-27 16:00:29', 1),
(652, 3, 282, 12, 'ROSALINO', '2022-09-27', NULL, NULL, 'AGUA', 22, 8, 1, '-10.0000', '2022-09-27 16:01:07', '2022-09-27 16:01:07', 1),
(653, 3, 281, 6, 'ROSALINO', '2022-09-27', NULL, NULL, 'MASCARILLA', 22, 8, 1, '-2.0000', '2022-09-27 16:01:27', '2022-09-27 16:01:27', 1),
(654, 3, 282, 3, 'ROSALINO ', '2022-09-27', NULL, NULL, 'LAVADO DE CARRO ', 22, 8, 1, '-35.0000', '2022-09-27 16:02:10', '2022-09-27 16:02:10', 1),
(655, 3, 283, 9, 'VALERIANO ', '2022-09-17', NULL, NULL, 'PEAJES A LURIN ', 22, 8, 1, '-45.5000', '2022-09-27 16:09:01', '2022-09-27 16:09:01', 1),
(656, 3, 284, 10, 'JUNIOR', '2022-09-17', NULL, NULL, 'CANCELACION ', 22, 9, 1, '-30.0000', '2022-09-27 16:10:14', '2022-09-27 16:10:14', 1),
(657, 3, 285, 12, 'VALERIANO', '2022-09-17', NULL, NULL, 'GASEOSA', 22, 8, 1, '-15.0000', '2022-09-27 17:09:58', '2022-09-27 17:09:58', 1),
(658, 3, 286, 9, 'VALERIANO', '2022-09-17', NULL, NULL, 'PEAJES', 22, 9, 1, '-52.5000', '2022-09-27 17:11:27', '2022-09-27 17:11:27', 1),
(659, 3, 287, 2, 'VALERIANO', '2022-09-17', NULL, NULL, 'AXF', 22, 9, 1, '-290.0000', '2022-09-27 17:12:57', '2022-09-27 17:12:57', 1),
(660, 3, 288, 3, 'VALERIANO', '2022-09-17', NULL, NULL, 'REGULAR FRENO ', 22, 8, 1, '-10.0000', '2022-09-27 17:15:16', '2022-09-27 17:15:16', 1),
(661, 2, 199, NULL, NULL, '2022-09-27', NULL, 43, 'BBVA - ROSA ', 1, 3, 1, '-104.8000', '2022-09-28 17:26:01', '2022-09-28 17:26:01', 1),
(662, 2, 200, NULL, NULL, '2022-09-27', NULL, 61, 'JOHNY PETER CANAZACA ', 1, 3, 1, '-2500.0000', '2022-09-28 17:29:51', '2022-09-28 17:29:51', 1),
(663, 2, 201, NULL, NULL, '2022-09-27', NULL, 61, 'MAMANI NAIRA JUDY ', 1, 3, 1, '-4500.0000', '2022-09-28 17:30:50', '2022-09-28 17:30:50', 1),
(664, 2, 202, NULL, NULL, '2022-09-27', NULL, 61, 'RIVERA DE BUSTOS ROXANA ', 1, 8, 1, '-9900.0000', '2022-09-28 17:32:31', '2022-09-28 17:32:31', 1),
(665, 2, 203, NULL, NULL, '2022-09-27', NULL, 1, 'RAUL VASQUEZ ', 1, 3, 1, '-6357.5000', '2022-09-28 17:33:01', '2022-09-28 17:33:01', 1),
(666, 2, 204, NULL, NULL, '2022-09-27', NULL, 61, 'LIZARRAGA GONZALES TATIANA ', 1, 3, 1, '-1800.0000', '2022-09-28 17:33:43', '2022-09-28 17:33:43', 1),
(667, 2, 205, NULL, NULL, '2022-09-27', NULL, 43, 'SOLORZANO CABELLO JUAN ', 1, 3, 1, '-300.0000', '2022-09-28 17:34:16', '2022-09-28 17:34:16', 1),
(668, 2, 206, NULL, NULL, '2022-09-27', NULL, 61, 'BUSTOS SALINAS JORGE ', 1, 3, 1, '-9371.0000', '2022-09-28 17:36:27', '2022-09-28 17:36:27', 1),
(669, 2, 207, NULL, NULL, '2022-09-27', NULL, 76, 'RIOFRIO CISNEROS MANUEL ', 1, 3, 1, '-25000.0000', '2022-09-28 17:37:09', '2022-09-28 17:37:09', 1),
(670, 3, 289, 1, 'BANCO', '2022-09-27', NULL, NULL, 'IMPUESTO ITF ', 1, 3, 1, '-2.8000', '2022-09-28 17:38:46', '2022-09-28 17:38:46', 1),
(671, 3, 290, 11, 'CLARO ', '2022-09-27', NULL, NULL, 'CELULAR JULIACA', 2, 3, 1, '-60.8000', '2022-09-28 17:47:22', '2022-09-28 17:47:22', 1),
(672, 2, 208, NULL, NULL, '2022-09-27', NULL, 32, 'VALERIANO SOLORZANO', 2, 3, 1, '-8763.0000', '2022-09-28 17:49:36', '2022-09-28 17:49:36', 1),
(673, 2, 209, NULL, NULL, '2022-09-27', NULL, 76, 'RIOFRIO CISNEROS MANUEL', 2, 3, 1, '-26000.0000', '2022-09-28 17:52:56', '2022-09-28 17:52:56', 1),
(674, 2, 210, NULL, NULL, '2022-09-27', NULL, 76, 'EMPRENDIMIENTO AMBIENTAL ', 2, 3, 1, '-4944.0000', '2022-09-28 17:53:44', '2022-09-28 17:53:44', 1),
(675, 3, 291, 1, 'BANCO ', '2022-09-27', NULL, NULL, 'IMPUESTO ITF ', 2, 3, 1, '-7.5000', '2022-09-28 17:57:10', '2022-09-28 17:57:10', 1),
(676, 2, 211, NULL, NULL, '2022-09-28', NULL, 43, 'DEPOSITO A CUENTA DE COMPANY ', 2, 3, 1, '-14500.0000', '2022-09-28 17:58:00', '2022-09-28 17:58:00', 1),
(677, 5, 40, NULL, 'DEISY ', '2022-09-28', NULL, NULL, 'RETIRO CON CHEQUE ', 2, 3, 1, '-185500.0000', '2022-09-28 17:59:34', '2022-09-28 17:59:34', 1),
(678, 5, 40, NULL, 'DEISY ', '2022-09-28', NULL, NULL, 'RETIRO CON CHEQUE ', 22, 3, 1, '185500.0000', '2022-09-28 17:59:35', '2022-09-28 17:59:35', 1),
(679, 2, 212, NULL, NULL, '2022-09-27', NULL, 92, 'MALLQUI TARDIO ISAIAS', 2, 3, 1, '-10129.2500', '2022-09-28 18:00:38', '2022-09-28 18:00:38', 1),
(680, 2, 213, NULL, NULL, '2022-09-28', NULL, 37, 'RICRADO ROJAS ', 2, 3, 1, '-1951.0000', '2022-09-28 18:01:13', '2022-09-28 18:01:13', 1),
(681, 1, 51, NULL, NULL, '2022-09-27', NULL, 4, '0PE1000001 ZINC INDUST', 2, 3, 1, '85271.9900', '2022-09-28 18:02:32', '2022-09-28 18:02:32', 1),
(682, 1, 52, NULL, NULL, '2022-09-27', NULL, 4, '0PE1000001 ZINC INDUST', 4, 3, 1, '149595.2000', '2022-09-28 18:04:32', '2022-09-28 18:04:32', 1),
(683, 3, 292, 1, 'BANCO ', '2022-09-27', NULL, NULL, 'IMPUESTO ITF ', 4, 3, 1, '-7.4500', '2022-09-28 18:05:47', '2022-09-28 18:05:47', 1),
(684, 3, 293, 10, 'EDGAR', '2022-09-24', NULL, NULL, 'DEL 19 AL 24 DE SETIEMBRE', 22, 9, 1, '-300.0000', '2022-09-29 12:48:26', '2022-09-29 12:48:26', 1),
(685, 3, 294, 8, 'ANIBAL', '2022-09-24', NULL, NULL, 'VIRUTA DE ALUMINIO', 22, 9, 1, '-30.0000', '2022-09-29 12:49:10', '2022-09-29 12:49:10', 1),
(686, 3, 295, 10, 'DEISY', '2022-09-24', NULL, NULL, 'ADELANTO', 22, 8, 1, '-110.0000', '2022-09-29 12:49:51', '2022-09-29 12:49:51', 1),
(687, 2, 214, NULL, NULL, '2022-09-28', NULL, 32, 'COMPRA DE MATERIAL', 22, 8, 1, '-2553.4000', '2022-09-29 12:51:38', '2022-09-29 12:51:38', 1),
(688, 3, 296, 9, 'VLERIANO', '2022-09-24', NULL, NULL, 'PEAJE', 22, 9, 1, '-6.5000', '2022-09-29 12:52:26', '2022-09-29 12:52:26', 1),
(689, 3, 297, 12, 'JUAN', '2022-09-24', NULL, NULL, 'DESAYUNO JUAN ', 22, 8, 1, '-13.0000', '2022-09-29 12:55:14', '2022-09-29 12:55:14', 1),
(690, 2, 215, NULL, NULL, '2022-09-26', NULL, 79, 'COMPRA DE MATERIAL', 22, 8, 1, '-1100.0000', '2022-09-29 12:55:43', '2022-09-29 12:55:43', 1),
(691, 2, 216, NULL, NULL, '2022-09-28', NULL, 47, 'COMANDANTE', 22, 8, 1, '-1000.0000', '2022-09-29 12:56:17', '2022-09-29 12:56:17', 1),
(692, 3, 298, 8, 'JUAN', '2022-09-24', NULL, NULL, 'APOYO COMANDANTE', 22, 8, 1, '-300.0000', '2022-09-29 12:57:49', '2022-09-29 12:57:49', 1),
(693, 3, 299, 13, 'DANIEL', '2022-09-27', NULL, NULL, 'BALANZA - CABLE', 22, 8, 1, '-7.0000', '2022-09-29 12:59:14', '2022-09-29 12:59:14', 1),
(694, 2, 217, NULL, NULL, '2022-09-26', NULL, 92, 'EFECTIVO', 22, 9, 1, '-6000.0000', '2022-09-29 13:00:05', '2022-09-29 13:00:05', 1),
(695, 3, 300, 2, 'DIDIER', '2022-09-27', NULL, NULL, 'GAS MONTACARGA', 22, 8, 1, '-170.0000', '2022-09-29 14:21:18', '2022-09-29 14:21:18', 1),
(696, 3, 301, 6, 'DIDIER', '2022-09-27', NULL, NULL, 'TAPONES', 22, 3, 1, '-30.0000', '2022-09-29 14:34:50', '2022-09-29 14:34:50', 1),
(697, 3, 302, 7, 'DEISY', '2022-09-28', NULL, NULL, 'PASAJE', 22, 9, 1, '-3.0000', '2022-09-29 14:36:10', '2022-09-29 14:36:10', 1),
(698, 3, 303, 10, 'JOSE', '2022-09-28', NULL, NULL, 'ADELANTO ', 22, 8, 1, '-50.0000', '2022-09-29 15:12:05', '2022-09-29 15:12:05', 1),
(699, 3, 304, 7, 'DANIEL', '2022-09-29', NULL, NULL, 'PASAJE ZINSA', 22, 9, 1, '-20.0000', '2022-09-29 15:13:20', '2022-09-29 15:13:20', 1),
(700, 3, 305, 10, 'SEÑORA DE LIMPIEZA', '2022-09-28', NULL, NULL, 'LIMPIEZA', 22, 8, 1, '-115.0000', '2022-09-29 15:19:54', '2022-09-29 15:19:54', 1),
(701, 3, 306, 10, 'JUNIOR', '2022-09-28', NULL, NULL, 'ADELANTO ', 22, 9, 1, '-100.0000', '2022-09-29 15:20:45', '2022-09-29 15:20:45', 1),
(702, 3, 307, 10, 'EDGAR', '2022-09-28', NULL, NULL, 'ADELANTO ', 22, 8, 1, '-50.0000', '2022-09-29 15:21:14', '2022-09-29 15:21:14', 1),
(703, 2, 218, NULL, NULL, '2022-09-29', NULL, 16, 'COMPRA DE COBRE', 22, 9, 1, '-57600.0000', '2022-09-29 15:22:24', '2022-09-29 15:22:24', 1),
(704, 3, 308, 12, 'DIDIER', '2022-09-28', NULL, NULL, 'VIAJE AREQUIPA', 22, 8, 1, '-386.0000', '2022-09-29 15:28:01', '2022-09-29 15:28:01', 1),
(705, 2, 219, NULL, NULL, '2022-09-28', NULL, 73, 'GASTOS EN CARROS', 22, 8, 1, '-343.0000', '2022-09-29 15:29:37', '2022-09-29 15:29:37', 1),
(706, 3, 309, 11, 'EDY', '2022-09-24', NULL, NULL, 'BOTADA DE BASURA', 22, 8, 1, '-25.0000', '2022-09-29 15:32:16', '2022-09-29 15:32:16', 1),
(707, 3, 310, 9, 'EDY', '2022-09-24', NULL, NULL, 'PEAJE AZINSA', 22, 8, 1, '-6.5000', '2022-09-29 15:33:08', '2022-09-29 15:33:08', 1),
(708, 3, 311, 6, 'EDY', '2022-09-29', NULL, NULL, 'MASCARILLA', 22, 8, 1, '-4.0000', '2022-09-29 15:34:15', '2022-09-29 15:34:15', 1),
(709, 3, 312, 6, 'EDY', '2022-09-29', NULL, NULL, 'MASCARILLA', 22, 9, 1, '-4.0000', '2022-09-29 15:42:33', '2022-09-29 15:42:33', 1),
(710, 3, 313, 12, 'EDY', '2022-09-29', NULL, NULL, 'GASEOSA', 22, 8, 1, '-17.0000', '2022-09-29 15:42:59', '2022-09-29 15:42:59', 1),
(711, 3, 314, 10, 'DANIEL', '2022-09-29', NULL, NULL, 'ADELANTO DE ALMUERZO SABADO', 22, 9, 1, '-10.0000', '2022-09-29 15:43:45', '2022-09-29 15:43:45', 1),
(712, 3, 315, 10, 'JUNIOR', '2022-09-29', NULL, NULL, 'ADELANTO DE ALMUERZO SABADO', 22, 8, 1, '-10.0000', '2022-09-29 15:43:59', '2022-09-29 15:43:59', 1),
(713, 3, 316, 10, 'ALFREDO', '2022-09-29', NULL, NULL, 'ADELANTO', 22, 9, 1, '-32.0000', '2022-09-29 15:45:07', '2022-09-29 15:45:07', 1),
(714, 3, 317, 9, 'VALERIANO', '2022-09-29', NULL, NULL, 'PEAJE', 22, 8, 1, '-6.5000', '2022-09-29 15:47:53', '2022-09-29 15:47:53', 1),
(715, 3, 318, 9, 'VALERIANO', '2022-09-29', NULL, NULL, 'PEAJE VILLA', 22, 8, 1, '-32.5000', '2022-09-29 15:49:52', '2022-09-29 15:49:52', 1),
(716, 3, 319, 12, 'VALERIANO', '2022-09-29', NULL, NULL, 'GASEOSA', 22, 8, 1, '-12.0000', '2022-09-29 15:50:18', '2022-09-29 15:50:18', 1),
(717, 3, 320, 9, 'VALERIANO', '2022-09-29', NULL, NULL, 'PEAJE VILLA', 22, 8, 1, '-32.5000', '2022-09-29 15:50:46', '2022-09-29 15:50:46', 1),
(718, 3, 321, 9, 'VALERIANO', '2022-09-29', NULL, NULL, 'PEX', 22, 8, 1, '-20.0000', '2022-09-29 15:51:07', '2022-09-29 15:51:07', 1),
(719, 3, 322, 9, 'VALERIANO', '2022-09-29', NULL, NULL, 'PEAJE', 22, 8, 1, '-19.5000', '2022-09-29 15:51:41', '2022-09-29 15:51:41', 1),
(720, 3, 323, 13, 'VALERIANO', '2022-09-29', NULL, NULL, 'CONTENEDOR BALANZA', 22, 8, 1, '-12.0000', '2022-09-29 15:52:18', '2022-09-29 15:52:18', 1),
(721, 3, 324, 2, 'VALERIANO', '2022-09-29', NULL, NULL, 'COMBUSTIBLE', 22, 8, 1, '-252.0000', '2022-09-29 15:52:55', '2022-09-29 15:52:55', 1),
(722, 3, 325, 13, 'VALERIANO', '2022-09-29', NULL, NULL, 'BALANZA', 22, 8, 1, '-15.0000', '2022-09-29 15:53:20', '2022-09-29 15:53:20', 1),
(723, 2, 220, NULL, NULL, '2022-09-29', NULL, 59, 'EFECTICO', 22, 8, 1, '-30000.0000', '2022-09-29 15:54:53', '2022-09-29 15:54:53', 1),
(724, 2, 221, NULL, NULL, '2022-09-29', NULL, 19, 'EFECTIVO', 22, 8, 1, '-40000.0000', '2022-09-29 15:55:18', '2022-09-29 15:55:18', 1),
(725, 2, 222, NULL, NULL, '2022-09-29', NULL, 79, 'EFECTIVO PARA MATERIALES', 22, 9, 1, '-1300.0000', '2022-09-29 16:11:59', '2022-09-29 16:11:59', 1),
(726, 2, 223, NULL, NULL, '2022-09-29', NULL, 1, 'RAUL VASQUEZ', 2, 3, 1, '-7855.0000', '2022-09-29 16:21:38', '2022-09-29 16:21:38', 1),
(727, 3, 326, 11, 'INTERNET', '2022-09-29', NULL, NULL, 'INTERNET PACACHACUTEC', 2, 3, 1, '-70.0000', '2022-09-29 16:22:31', '2022-09-29 16:22:31', 1),
(728, 2, 224, NULL, NULL, '2022-09-29', NULL, 19, 'SALINAS SAAVEDRA ELIZABETH ', 2, 3, 1, '-764.0000', '2022-09-29 16:25:07', '2022-09-29 16:25:07', 1);
INSERT INTO `cajas` (`caj_id`, `caj_tipo`, `caj_numero`, `caj_tga_id`, `caj_responsable`, `caj_fecha`, `caj_col_id`, `caj_age_id`, `caj_observaciones`, `caj_cue_id`, `caj_t1m_id`, `caj_gt4_id`, `caj_monto`, `caj_created`, `caj_updated`, `caj_status`) VALUES
(729, 3, 327, 1, 'BANCO', '2022-09-29', NULL, NULL, 'IMPUESTO ITF ', 2, 3, 1, '-10.5500', '2022-09-29 16:26:19', '2022-09-29 16:26:19', 1),
(730, 1, 53, NULL, NULL, '2022-09-24', NULL, 4, '0PE1000001 ZINC INDUST', 4, 3, 1, '199380.1100', '2022-09-29 16:30:41', '2022-09-29 16:30:41', 1),
(731, 3, 328, 1, 'BANCO', '2022-09-29', NULL, NULL, 'IMPUESTO ITF', 4, 3, 1, '-9.9500', '2022-09-29 16:31:49', '2022-09-29 16:31:49', 1),
(732, 1, 56, NULL, NULL, '2022-09-27', NULL, 58, 'DEPOSITO', 5, 3, 1, '15000.0000', '2022-09-29 16:33:51', '2022-09-29 16:33:51', 1),
(733, 1, 55, NULL, NULL, '2022-09-29', NULL, 66, 'DEPOSITO', 5, 3, 1, '5000.0000', '2022-09-29 16:34:42', '2022-09-29 16:34:42', 1),
(734, 5, 41, NULL, 'LILLIAN ', '2022-09-29', NULL, NULL, 'MOV INTERNO', 24, 3, 1, '-5000.0000', '2022-09-29 16:36:49', '2022-09-29 16:36:49', 1),
(735, 5, 41, NULL, 'LILLIAN ', '2022-09-29', NULL, NULL, 'MOV INTERNO', 5, 3, 1, '5000.0000', '2022-09-29 16:36:49', '2022-09-29 16:36:49', 1),
(736, 2, 225, NULL, NULL, '2022-09-29', NULL, 43, 'PAPELETA JUAN ', 5, 3, 1, '-1104.0000', '2022-09-29 16:37:17', '2022-09-29 16:37:17', 1),
(737, 2, 226, NULL, NULL, '2022-09-29', NULL, 43, 'MINAM WOLF', 5, 3, 1, '-1068.0000', '2022-09-29 16:37:44', '2022-09-29 16:37:44', 1),
(738, 3, 329, 9, 'LILLIAN', '2022-09-29', NULL, NULL, '2 PEAJES', 5, 3, 1, '-13.0000', '2022-09-29 16:38:25', '2022-09-29 16:38:25', 1),
(739, 3, 330, 2, 'LILLIAN ', '2022-09-29', NULL, NULL, 'COMBUSTIBLE KIA ', 5, 3, 1, '-150.5800', '2022-09-29 16:39:04', '2022-09-29 16:39:04', 1),
(740, 3, 331, 5, 'LILLIAN ', '2022-09-29', NULL, NULL, 'RECARGA SUNAT', 5, 3, 1, '-100.0000', '2022-09-29 16:39:31', '2022-09-29 16:39:31', 1),
(741, 3, 332, 3, 'ANIBAL', '2022-09-28', NULL, NULL, 'MANTENIMIENTO ', 5, 3, 1, '-1475.0600', '2022-09-29 16:41:52', '2022-09-29 16:41:52', 1),
(742, 3, 333, 11, 'NETFLIX', '2022-09-29', NULL, NULL, 'NETFLIX', 14, 3, 1, '-48.2400', '2022-09-29 16:45:55', '2022-09-29 16:45:55', 1),
(743, 3, 334, 11, 'INVESTING ', '2022-09-29', NULL, NULL, '$3.97', 15, 8, 1, '-15.5000', '2022-09-29 16:49:01', '2022-09-29 16:49:01', 1),
(744, 3, 335, 4, 'LILLIAN', '2022-09-29', NULL, NULL, 'LICENCIA DE EXCEL', 15, 3, 1, '-48.7500', '2022-09-29 16:49:49', '2022-09-29 16:49:49', 1),
(745, 3, 336, 12, 'ALFREDO', '2022-09-29', NULL, NULL, 'VUELO A AREQUIPA', 15, 3, 1, '-311.9000', '2022-09-29 16:50:31', '2022-09-29 16:50:31', 1),
(746, 3, 337, 12, 'DIDIER', '2022-09-29', NULL, NULL, '$50 - REPROGRAMACION DE VUELO', 15, 8, 1, '-195.0000', '2022-09-29 16:51:09', '2022-09-29 16:51:09', 1),
(747, 3, 338, 12, 'DIDIER', '2022-09-29', NULL, NULL, '$128.35 VUELO DIDIER AREQUIPA', 15, 3, 1, '-500.6000', '2022-09-29 16:56:01', '2022-09-29 16:56:01', 1),
(748, 3, 339, 11, 'DEISY', '2022-09-29', NULL, NULL, '$12.5- EXCEL LICENCIA', 15, 3, 1, '-48.8000', '2022-09-29 16:56:51', '2022-09-29 16:56:51', 1),
(749, 3, 340, 1, 'BANCO', '2022-09-29', NULL, NULL, 'IMPUESTO ITF ', 15, 3, 1, '-1.0000', '2022-09-29 16:57:30', '2022-09-29 16:57:30', 1),
(750, 1, 57, NULL, NULL, '2022-09-28', NULL, 43, 'EFECTIVO FUE A RECOGER BEBETO Y LUIS PARA RICARDO ', 22, 9, 1, '50000.0000', '2022-09-29 17:22:48', '2022-09-29 17:22:48', 1),
(751, 2, 227, NULL, NULL, '2022-09-28', NULL, 37, 'EFECTIVO PARA GRUPO ', 22, 9, 1, '-50000.0000', '2022-09-29 17:23:25', '2022-09-29 17:23:25', 1),
(752, 2, 228, NULL, NULL, '2022-09-29', NULL, 28, NULL, 22, 8, 1, '-2.0000', '2022-09-29 17:29:12', '2022-09-29 17:29:12', 1),
(753, 2, 229, NULL, NULL, '2022-09-29', NULL, 44, NULL, 22, 8, 1, '-0.7000', '2022-09-29 17:29:36', '2022-09-29 17:29:36', 1),
(754, 2, 230, NULL, NULL, '2022-09-29', NULL, 1, NULL, 22, 9, 1, '-0.0500', '2022-09-29 18:01:35', '2022-09-29 18:01:35', 1),
(755, 2, 231, NULL, NULL, '2022-09-29', NULL, 16, NULL, 22, 9, 1, '-138.5500', '2022-09-29 18:02:02', '2022-09-29 18:02:02', 1),
(756, 2, 232, NULL, NULL, '2022-09-29', NULL, 32, NULL, 22, 9, 1, '-32.2200', '2022-09-29 18:02:26', '2022-09-29 18:02:26', 1),
(757, 2, 233, NULL, NULL, '2022-09-29', NULL, 35, NULL, 22, 9, 1, '-0.3500', '2022-09-29 18:03:30', '2022-09-29 18:03:30', 1),
(758, 2, 234, NULL, NULL, '2022-09-29', NULL, 41, NULL, 22, 3, 1, '-34.1300', '2022-09-29 18:03:56', '2022-09-29 18:03:56', 1),
(759, 2, 235, NULL, NULL, '2022-09-29', NULL, 49, NULL, 22, 8, 1, '-0.0400', '2022-09-29 18:04:16', '2022-09-29 18:04:16', 1),
(760, 2, 236, NULL, NULL, '2022-09-29', NULL, 50, NULL, 22, 3, 1, '-0.0400', '2022-09-29 18:04:57', '2022-09-29 18:04:57', 1),
(761, 2, 237, NULL, NULL, '2022-09-29', NULL, 53, NULL, 22, 3, 1, '-0.0500', '2022-09-29 18:05:16', '2022-09-29 18:05:16', 1),
(762, 2, 238, NULL, NULL, '2022-09-29', NULL, 60, NULL, 22, 3, 1, '-0.1000', '2022-09-29 18:05:35', '2022-09-29 18:05:35', 1),
(763, 2, 239, NULL, NULL, '2022-09-29', NULL, 75, NULL, 22, 8, 1, '-0.0400', '2022-09-29 18:05:52', '2022-09-29 18:05:52', 1),
(764, 3, 341, 7, 'DANIEL', '2022-09-29', NULL, NULL, 'TAXI', 22, 9, 1, '-30.0000', '2022-09-29 18:24:10', '2022-09-29 18:24:10', 1),
(765, 3, 342, 13, 'LUIS', '2022-09-29', NULL, NULL, 'BALANZA', 22, 9, 1, '-30.0000', '2022-09-29 18:24:36', '2022-09-29 18:24:36', 1),
(766, 6, 1, NULL, NULL, '2022-09-30', NULL, 4, 'VARIAS EMPRESAS', NULL, 8, 1, '-33044.9100', '2022-09-30 17:52:02', '2022-09-30 17:52:02', 1),
(767, 0, 0, NULL, NULL, '2022-10-01', NULL, NULL, NULL, 1, NULL, 1, '151260.1900', '2022-10-04 08:07:03', '2022-10-04 08:07:03', 1),
(768, 0, 1, NULL, NULL, '2022-10-01', NULL, NULL, NULL, 2, NULL, 1, '37753.1500', '2022-10-04 08:07:03', '2022-10-04 08:07:03', 1),
(769, 0, 2, NULL, NULL, '2022-10-01', NULL, NULL, NULL, 3, NULL, 1, '397505.1900', '2022-10-04 08:07:03', '2022-10-04 08:07:03', 1),
(770, 0, 3, NULL, NULL, '2022-10-01', NULL, NULL, NULL, 4, NULL, 1, '797821.4500', '2022-10-04 08:07:03', '2022-10-04 08:07:03', 1),
(771, 0, 4, NULL, NULL, '2022-10-01', NULL, NULL, NULL, 5, NULL, 1, '54700.2200', '2022-10-04 08:07:03', '2022-10-04 08:07:03', 1),
(772, 0, 5, NULL, NULL, '2022-10-01', NULL, NULL, NULL, 6, NULL, 1, '222025.7000', '2022-10-04 08:07:03', '2022-10-04 08:07:03', 1),
(773, 0, 6, NULL, NULL, '2022-10-01', NULL, NULL, NULL, 7, NULL, 1, '112.0300', '2022-10-04 08:07:03', '2022-10-04 08:07:03', 1),
(774, 0, 7, NULL, NULL, '2022-10-01', NULL, NULL, NULL, 8, NULL, 1, '162231.2300', '2022-10-04 08:07:03', '2022-10-04 08:07:03', 1),
(775, 0, 8, NULL, NULL, '2022-10-01', NULL, NULL, NULL, 9, NULL, 1, '77859.4200', '2022-10-04 08:07:03', '2022-10-04 08:07:03', 1),
(776, 0, 9, NULL, NULL, '2022-10-01', NULL, NULL, NULL, 10, NULL, 1, '33289.8500', '2022-10-04 08:07:03', '2022-10-04 08:07:03', 1),
(777, 0, 10, NULL, NULL, '2022-10-01', NULL, NULL, NULL, 11, NULL, 1, '266887.2200', '2022-10-04 08:07:03', '2022-10-04 08:07:03', 1),
(778, 0, 11, NULL, NULL, '2022-10-01', NULL, NULL, NULL, 12, NULL, 1, '10871.7200', '2022-10-04 08:07:03', '2022-10-04 08:07:03', 1),
(779, 0, 12, NULL, NULL, '2022-10-01', NULL, NULL, NULL, 13, NULL, 1, '2014.1100', '2022-10-04 08:07:03', '2022-10-04 08:07:03', 1),
(780, 0, 13, NULL, NULL, '2022-10-01', NULL, NULL, NULL, 14, NULL, 1, '257.8300', '2022-10-04 08:07:03', '2022-10-04 08:07:03', 1),
(781, 0, 14, NULL, NULL, '2022-10-01', NULL, NULL, NULL, 15, NULL, 1, '5931.1400', '2022-10-04 08:07:03', '2022-10-04 08:07:03', 1),
(782, 0, 15, NULL, NULL, '2022-10-01', NULL, NULL, NULL, 16, NULL, 1, '0.0000', '2022-10-04 08:07:03', '2022-10-04 08:07:03', 1),
(783, 0, 16, NULL, NULL, '2022-10-01', NULL, NULL, NULL, 17, NULL, 1, '2463.0850', '2022-10-04 08:07:03', '2022-10-04 08:07:03', 1),
(784, 0, 17, NULL, NULL, '2022-10-01', NULL, NULL, NULL, 19, NULL, 1, '122.3200', '2022-10-04 08:07:03', '2022-10-04 08:07:03', 1),
(785, 0, 18, NULL, NULL, '2022-10-01', NULL, NULL, NULL, 21, NULL, 1, '18736.2500', '2022-10-04 08:07:03', '2022-10-04 08:07:03', 1),
(786, 0, 19, NULL, NULL, '2022-10-01', NULL, NULL, NULL, 22, NULL, 1, '71894.9400', '2022-10-04 08:07:03', '2022-10-04 08:07:03', 1),
(787, 0, 20, NULL, NULL, '2022-10-01', NULL, NULL, NULL, 23, NULL, 1, '10000.0000', '2022-10-04 08:07:03', '2022-10-04 08:07:03', 1),
(788, 0, 21, NULL, NULL, '2022-10-01', NULL, NULL, NULL, 24, NULL, 1, '5000.0000', '2022-10-04 08:07:03', '2022-10-04 08:07:03', 1),
(789, 0, 22, NULL, NULL, '2022-10-01', NULL, NULL, NULL, 25, NULL, 1, '381.0400', '2022-10-04 08:07:03', '2022-10-04 08:07:03', 1),
(790, 3, 343, 1, 'BANCO', '2022-10-04', NULL, NULL, 'ENVIO. EST. CTA', 1, 3, 1, '-3.5000', '2022-10-04 11:28:17', '2022-10-04 11:28:17', 1),
(791, 3, 343, 1, 'BANCO', '2022-10-04', NULL, NULL, 'COM.MANTENIM', 1, 3, 1, '-35.0000', '2022-10-04 11:28:43', '2022-10-04 11:28:43', 1),
(792, 2, 1, NULL, NULL, '2022-10-04', NULL, 99, 'COMPRA DE COBRE ', 1, 3, 1, '-26940.5000', '2022-10-04 12:11:27', '2022-10-04 12:11:27', 1),
(793, 3, 344, 1, 'BANCO', '2022-10-04', NULL, NULL, 'IMPUESTO ITF ', 1, 3, 1, '-1.3000', '2022-10-04 12:12:46', '2022-10-04 12:12:46', 1),
(794, 3, 345, 1, 'BANCO', '2022-10-04', NULL, NULL, 'IMPUESTO ITF ', 2, 3, 1, '-0.3500', '2022-10-04 12:29:06', '2022-10-04 12:29:06', 1),
(795, 2, 2, NULL, NULL, '2022-10-04', NULL, 98, 'COMPRA DE ACERO', 2, 3, 1, '-561.0000', '2022-10-04 12:30:17', '2022-10-04 12:30:17', 1),
(796, 2, 3, NULL, NULL, '2022-10-04', NULL, 40, 'alex ', 2, 3, 1, '-15000.0000', '2022-10-04 13:03:32', '2022-10-04 13:03:32', 1),
(797, 3, 346, 1, 'BANCO', '2022-10-04', NULL, NULL, 'ENVIO.EST.CTA', 2, 3, 1, '-3.5000', '2022-10-04 14:16:18', '2022-10-04 14:16:18', 1),
(798, 3, 347, 1, 'BANCO', '2022-10-04', NULL, NULL, 'IMPUESTO ITF', 2, 3, 1, '-0.7500', '2022-10-04 14:17:06', '2022-10-04 14:17:06', 1),
(799, 2, 4, NULL, NULL, '2022-10-04', NULL, 60, 'JIMMY PORTALANZAS', 2, 3, 1, '-20000.0000', '2022-10-04 17:15:12', '2022-10-04 17:15:12', 1),
(800, 3, 348, 1, 'BANCO', '2022-10-04', NULL, NULL, 'IMPUESTO ITF', 2, 3, 1, '-1.0000', '2022-10-04 17:15:40', '2022-10-04 17:15:40', 1),
(801, 3, 349, 14, 'SMAK ', '2022-10-04', NULL, NULL, '2 TRASNPORTES DE CONTENEDOR ', 2, 3, 1, '-1308.0000', '2022-10-04 17:16:39', '2022-10-04 17:16:39', 1),
(802, 3, 350, 11, 'LILLIAN ', '2022-10-04', NULL, NULL, '2 MESES CELULAR LILLIAN ', 2, 3, 1, '-150.0000', '2022-10-04 17:17:10', '2022-10-04 17:17:10', 1),
(803, 3, 351, 1, 'BANCO ', '2022-10-04', NULL, NULL, 'MANT TD ADIC NEG ', 2, 3, 1, '-35.0000', '2022-10-04 17:18:26', '2022-10-04 17:18:26', 1),
(804, 2, 5, NULL, NULL, '2022-10-04', NULL, 43, 'CELULAR JUAN ', 2, 3, 1, '-173.0200', '2022-10-04 17:21:30', '2022-10-04 17:21:30', 1),
(805, 3, 352, 1, 'BANCO', '2022-10-04', NULL, NULL, 'ENVIO.EST.CTA', 3, 3, 1, '-3.5000', '2022-10-04 17:25:39', '2022-10-04 17:25:39', 1),
(806, 3, 353, 1, 'BANCO', '2022-10-04', NULL, NULL, 'COM.MANTENIM ', 3, 3, 1, '-35.0000', '2022-10-04 17:26:28', '2022-10-04 17:26:28', 1),
(807, 1, 1, NULL, NULL, '2022-10-04', NULL, 4, '0PE1000001 ZINC INDUST', 3, 3, 1, '48771.8800', '2022-10-04 17:30:40', '2022-10-04 17:30:40', 1),
(808, 2, 6, NULL, NULL, '2022-10-04', NULL, 40, 'MAMANI HUAMAN SOLEDAD CANDY', 3, 3, 1, '-25000.0000', '2022-10-04 17:32:54', '2022-10-04 17:32:54', 1),
(809, 3, 354, 1, 'BANCO', '2022-10-04', NULL, NULL, 'IMPUESTO ITF ', 3, 3, 1, '-3.6500', '2022-10-04 17:33:22', '2022-10-04 17:33:22', 1),
(810, 2, 7, NULL, NULL, '2022-10-04', NULL, 60, 'JIMMY PORTALANZAS SOPLIN ', 3, 3, 1, '-30000.0000', '2022-10-04 17:34:12', '2022-10-04 17:34:12', 1),
(811, 2, 8, NULL, NULL, '2022-10-04', NULL, 79, 'CORPORACION TRIVER', 4, 3, 1, '-1265.0000', '2022-10-05 10:04:47', '2022-10-05 10:04:47', 1),
(812, 3, 355, 14, 'OSORES', '2022-10-04', NULL, NULL, 'RESGUARDO DE 2 CONTENEDORES', 4, 3, 1, '-480.0000', '2022-10-05 10:05:39', '2022-10-05 10:05:39', 1),
(813, 2, 9, NULL, NULL, '2022-10-04', NULL, 40, 'MAMANI TICAHUANA LOURDES', 4, 3, 1, '-10000.0000', '2022-10-05 10:06:26', '2022-10-05 10:06:26', 1),
(814, 2, 10, NULL, NULL, '2022-10-04', NULL, 40, 'TAMATA VILCA ALFREDO', 4, 3, 1, '-25000.0000', '2022-10-05 10:06:57', '2022-10-05 10:06:57', 1),
(815, 2, 11, NULL, NULL, '2022-10-04', NULL, 40, 'CHARCA BUSTINCIO YENY', 4, 3, 1, '-3000.0000', '2022-10-05 10:07:35', '2022-10-05 10:07:35', 1),
(816, 5, 1, NULL, 'DEISY ', '2022-10-04', NULL, NULL, 'MOV INTERNO ', 4, 3, 1, '-30000.0000', '2022-10-05 10:08:15', '2022-10-05 10:08:15', 1),
(817, 5, 1, NULL, 'DEISY ', '2022-10-04', NULL, NULL, 'MOV INTERNO ', 10, 3, 1, '30000.0000', '2022-10-05 10:08:15', '2022-10-05 10:08:15', 1),
(818, 3, 356, 1, 'BANCO', '2022-10-04', NULL, NULL, 'ENVIO.ESTA CTA', 4, 3, 1, '-3.5000', '2022-10-05 10:09:09', '2022-10-05 10:09:09', 1),
(819, 3, 357, 1, 'BANCO', '2022-10-04', NULL, NULL, 'COM.MANTENIM', 4, 3, 1, '-35.0000', '2022-10-05 10:09:44', '2022-10-05 10:09:44', 1),
(820, 3, 358, 1, 'BANCO', '2022-10-04', NULL, NULL, 'IMPUESTO ITF ', 4, 3, 1, '-3.4500', '2022-10-05 10:10:11', '2022-10-05 10:10:11', 1),
(821, 2, 12, NULL, NULL, '2022-10-04', NULL, 43, 'CANCELACION DE TRANSPORTE - CAMPAÑA WILY ', 4, 3, 1, '-2300.0000', '2022-10-05 10:12:03', '2022-10-05 10:12:03', 1),
(822, 2, 13, NULL, NULL, '2022-10-04', NULL, 43, 'JUAN SOLORZANO RETIRO PARA CAMPAÑA DE WILY ', 4, 3, 1, '-20000.0000', '2022-10-05 10:13:00', '2022-10-05 10:13:00', 1),
(823, 3, 359, 1, 'BANCO ', '2022-10-04', NULL, NULL, 'IMPUESTO ITF ', 4, 3, 1, '-1.1000', '2022-10-05 10:13:30', '2022-10-05 10:13:30', 1),
(826, 3, 360, 11, 'ALEXANDER', '2022-10-04', NULL, NULL, 'ALQULER MES DE SETIEMBRE ', 4, 3, 1, '-2000.0000', '2022-10-05 10:18:51', '2022-10-05 10:18:51', 1),
(827, 3, 361, 1, 'BANCO ', '2022-10-04', NULL, NULL, 'IMPUESTO ITF ', 4, 3, 1, '-2.6000', '2022-10-05 10:19:31', '2022-10-05 10:19:31', 1),
(828, 5, 2, NULL, 'DEISY ', '2022-10-04', NULL, NULL, 'MOV INTERNO ', 4, 3, 1, '-50000.0000', '2022-10-05 10:22:08', '2022-10-05 10:22:08', 1),
(829, 5, 2, NULL, 'DEISY ', '2022-10-04', NULL, NULL, 'MOV INTERNO ', 10, 3, 1, '50000.0000', '2022-10-05 10:22:08', '2022-10-05 10:22:08', 1),
(830, 3, 362, 1, 'BANCO ', '2022-10-04', NULL, NULL, 'MANTENIMIENTO DE LA CTA ', 5, 3, 1, '-150.0000', '2022-10-05 10:30:55', '2022-10-05 10:30:55', 1),
(831, 3, 363, 1, 'BANCO ', '2022-10-04', NULL, NULL, 'ENVIO.EST CTA ', 5, 3, 1, '-3.5000', '2022-10-05 10:32:58', '2022-10-05 10:32:58', 1),
(832, 3, 367, 1, 'BANCO', '2022-10-04', NULL, NULL, 'COM.MANTENIM ', 5, 3, 1, '-35.0000', '2022-10-05 10:39:44', '2022-10-05 10:39:44', 1),
(833, 1, 2, NULL, NULL, '2022-10-04', NULL, 57, 'INTERBANSIN REFERENCIA', 5, 3, 1, '5054.2000', '2022-10-05 10:41:26', '2022-10-05 10:41:26', 1),
(834, 2, 14, NULL, NULL, '2022-10-04', NULL, 61, 'CAYO DIAZ SHERMELI', 5, 3, 1, '-1500.0000', '2022-10-05 10:44:37', '2022-10-05 10:44:37', 1),
(835, 5, 3, NULL, 'LILLIAN ', '2022-10-04', NULL, NULL, 'MOV INTERNO ', 5, 3, 1, '-30000.0000', '2022-10-05 10:45:22', '2022-10-05 10:45:22', 1),
(836, 5, 3, NULL, 'LILLIAN ', '2022-10-04', NULL, NULL, 'MOV INTERNO ', 10, 3, 1, '30000.0000', '2022-10-05 10:45:22', '2022-10-05 10:45:22', 1),
(837, 3, 365, 1, 'BANCO ', '2022-10-04', NULL, NULL, 'IMPUESTO ITF ', 5, 3, 1, '-1.8000', '2022-10-05 10:45:50', '2022-10-05 10:45:50', 1),
(838, 3, 365, 1, 'BANCO ', '2022-10-04', NULL, NULL, 'IMPUESTO ITF ', 5, 3, 1, '-1.8000', '2022-10-05 10:45:50', '2022-10-05 10:45:50', 1),
(839, 1, 3, NULL, NULL, '2022-10-04', NULL, 57, 'INTERBANSIN REFERENCIA', 5, 3, 1, '6570.3600', '2022-10-05 10:46:39', '2022-10-05 10:46:39', 1),
(840, 5, 4, NULL, 'LILLIAN ', '2022-10-04', NULL, NULL, 'VENTA DE $357*3.90', 15, 3, 1, '-1392.3000', '2022-10-05 10:51:17', '2022-10-05 10:51:17', 1),
(841, 5, 4, NULL, 'LILLIAN ', '2022-10-04', NULL, NULL, 'VENTA DE $357*3.90', 5, 3, 1, '1392.3000', '2022-10-05 10:51:18', '2022-10-05 10:51:18', 1),
(842, 3, 366, 1, 'BANCO', '2022-10-04', NULL, NULL, 'IMPUESTO ITF ', 5, 3, 1, '-0.3500', '2022-10-05 11:14:08', '2022-10-05 11:14:08', 1),
(843, 3, 368, 1, 'BANCO', '2022-10-04', NULL, NULL, 'ENVIO.EST.CTA', 6, 3, 1, '-3.5000', '2022-10-05 11:57:06', '2022-10-05 11:57:06', 1),
(844, 3, 369, 1, 'BANCO', '2022-10-05', NULL, NULL, 'COM.MANTENIM', 6, 3, 1, '-35.0000', '2022-10-05 12:11:01', '2022-10-05 12:11:01', 1),
(845, 2, 240, NULL, NULL, '2022-10-04', NULL, 43, 'CANCELACION DE SEGURIDAD - INFANTES MARTINEZ ANGEL ', 6, 3, 1, '-1807.0000', '2022-10-05 16:23:56', '2022-10-05 16:23:56', 1),
(846, 2, 16, NULL, NULL, '2022-10-03', NULL, 54, 'ELIZABETH ALINA ', 6, 3, 1, '-25000.0000', '2022-10-05 16:24:44', '2022-10-05 16:24:44', 1),
(847, 2, 17, NULL, NULL, '2022-10-04', NULL, 43, 'AGUIRRE MANZANO - MERLY  ADELANTO ', 6, 3, 1, '-400.0000', '2022-10-05 16:25:43', '2022-10-05 16:25:43', 1),
(848, 3, 370, 1, 'BANCO ', '2022-10-04', NULL, NULL, 'IMPUESTO ITF ', 6, 3, 1, '-1.3000', '2022-10-05 16:26:37', '2022-10-05 16:26:37', 1),
(849, 3, 371, 1, 'BANCO', '2022-10-04', NULL, NULL, 'IMPUESTO ITF ', 6, 3, 1, '-1.2500', '2022-10-05 16:26:59', '2022-10-05 16:26:59', 1),
(850, 5, 5, NULL, 'DEISY ', '2022-10-04', NULL, NULL, 'MOV INTERNO ', 6, 3, 1, '-25000.0000', '2022-10-05 16:27:32', '2022-10-05 16:27:32', 1),
(851, 5, 5, NULL, 'DEISY ', '2022-10-04', NULL, NULL, 'MOV INTERNO ', 10, 3, 1, '25000.0000', '2022-10-05 16:27:32', '2022-10-05 16:27:32', 1),
(852, 3, 372, 1, 'BANCO', '2022-10-04', NULL, NULL, 'COM.MANTENIM ', 7, 3, 1, '-35.0000', '2022-10-05 16:34:55', '2022-10-05 16:34:55', 1),
(853, 3, 373, 1, 'BANCO ', '2022-10-04', NULL, NULL, 'IMPUESTO ITF ', 7, 3, 1, '-3.5000', '2022-10-05 16:35:19', '2022-10-05 16:35:19', 1),
(854, 1, 4, NULL, NULL, '2022-10-05', NULL, 65, ' DE SYNERGYA S.A.C.', 8, 3, 1, '39609.3800', '2022-10-05 16:37:30', '2022-10-05 16:37:30', 1),
(855, 3, 374, 1, 'BANCO', '2022-10-04', NULL, NULL, 'ENVIO.EST.CTA', 8, 3, 1, '-3.5000', '2022-10-05 16:38:11', '2022-10-05 16:38:11', 1),
(856, 3, 375, 1, 'BANCO', '2022-10-05', NULL, NULL, 'COM.MANTENIM ', 8, 3, 1, '-35.0000', '2022-10-05 16:38:42', '2022-10-05 16:38:42', 1),
(857, 3, 376, 1, 'BANCO', '2022-10-04', NULL, NULL, 'IMPUESTO ITF ', 6, 3, 1, '-1.9500', '2022-10-05 16:39:07', '2022-10-05 16:39:07', 1),
(858, 2, 241, NULL, NULL, '2022-10-05', NULL, 54, 'ELIZABETH ALINA RAMIREZ', 8, 3, 1, '-16226.5000', '2022-10-05 16:40:53', '2022-10-05 16:40:53', 1),
(859, 2, 242, NULL, NULL, '2022-10-05', NULL, 40, 'SOLEDAD MAMANI ', 8, 3, 1, '-25000.0000', '2022-10-05 16:42:57', '2022-10-05 16:42:57', 1),
(860, 2, 243, NULL, NULL, '2022-10-05', NULL, 100, 'VICTOR DELGADO MANRIQUE', 8, 3, 1, '-50000.0000', '2022-10-05 16:45:35', '2022-10-05 16:45:35', 1),
(861, 3, 377, 1, 'BANCO', '2022-10-05', NULL, NULL, 'IMPUESTO ITF ', 8, 3, 1, '-4.5500', '2022-10-05 16:46:03', '2022-10-05 16:46:03', 1),
(862, 1, 5, NULL, NULL, '2022-10-05', NULL, 65, 'DE SYNERGYA S.A.C.', 8, 3, 1, '39609.3800', '2022-10-05 16:46:42', '2022-10-05 16:46:42', 1),
(863, 3, 378, 1, 'BANCO', '2022-10-04', NULL, NULL, 'IMPUESTO ITF', 8, 3, 1, '-1.9500', '2022-10-05 16:49:32', '2022-10-05 16:49:32', 1),
(864, 3, 379, 1, 'BANCO', '2022-10-05', NULL, NULL, 'IMPUESTO ITF ', 8, 3, 1, '-1.9500', '2022-10-05 16:49:50', '2022-10-05 16:49:50', 1),
(865, 3, 380, 1, 'BANCO', '2022-10-04', NULL, NULL, 'COM.MANTENIM ', 9, 3, 1, '-35.0000', '2022-10-05 16:51:32', '2022-10-05 16:51:32', 1),
(866, 3, 381, 1, 'BANCO', '2022-10-05', NULL, NULL, 'ENVIO.EST.CTA ', 9, 3, 1, '-3.5000', '2022-10-05 16:52:09', '2022-10-05 16:52:09', 1),
(867, 2, 244, NULL, NULL, '2022-10-05', NULL, 40, 'CHEQUE 00000072', 10, 3, 1, '-25000.0000', '2022-10-05 17:03:09', '2022-10-05 17:03:09', 1),
(868, 2, 245, NULL, NULL, '2022-10-05', NULL, 61, 'CHEQUE 00000063', 10, 3, 1, '-30000.0000', '2022-10-05 17:03:36', '2022-10-05 17:03:36', 1),
(869, 3, 382, 1, 'BANCO', '2022-10-04', NULL, NULL, 'ENVIO.EST.CTA', 10, 3, 1, '-3.5000', '2022-10-05 17:04:27', '2022-10-05 17:04:27', 1),
(870, 3, 383, 1, 'BANCO', '2022-10-05', NULL, NULL, ' COM.MANTENIM', 10, 3, 1, '-35.0000', '2022-10-05 17:05:04', '2022-10-05 17:05:04', 1),
(871, 3, 384, 1, 'BANCO', '2022-10-04', NULL, NULL, ' IMPUESTO ITF', 10, 3, 1, '-3.0000', '2022-10-05 17:05:27', '2022-10-05 17:05:27', 1),
(872, 2, 246, NULL, NULL, '2022-10-05', NULL, 61, ' CHEQUE 00000062', 10, 3, 1, '-30000.0000', '2022-10-05 17:05:56', '2022-10-05 17:05:56', 1),
(873, 3, 385, 1, 'BANCO', '2022-10-05', NULL, NULL, 'IMPUESTO ITF ', 10, 3, 1, '-6.7500', '2022-10-05 17:06:28', '2022-10-05 17:06:28', 1),
(874, 2, 247, NULL, NULL, '2022-10-05', NULL, 40, 'CHEQUE 00000073', 10, 3, 1, '-25000.0000', '2022-10-05 17:06:58', '2022-10-05 17:06:58', 1),
(875, 2, 248, NULL, NULL, '2022-10-05', NULL, 61, 'CHEQUE 00000064', 10, 3, 1, '-30000.0000', '2022-10-05 17:07:20', '2022-10-05 17:07:20', 1),
(876, 3, 386, 1, 'BANCO', '2022-10-05', NULL, NULL, 'IMPUESTO ITF', 10, 3, 1, '-4.0000', '2022-10-05 17:07:42', '2022-10-05 17:07:42', 1),
(877, 3, 387, 1, 'BANCO', '2022-10-05', NULL, NULL, 'CUENTA AREQUIPA', 10, 3, 1, '-38.5000', '2022-10-05 17:08:25', '2022-10-05 17:08:25', 1),
(878, 3, 388, 1, 'BANCO', '2022-10-05', NULL, NULL, 'IMPUESTO ITF ', 10, 3, 1, '-38.5000', '2022-10-05 17:09:18', '2022-10-05 17:09:18', 1),
(879, 3, 389, 1, 'BANCO', '2022-10-05', NULL, NULL, 'COM.MANTENIM', 12, 3, 1, '-35.0000', '2022-10-05 17:12:55', '2022-10-05 17:12:55', 1),
(880, 3, 390, 1, 'BANCO', '2022-10-05', NULL, NULL, 'ENVIO.EST.CTA', 12, 3, 1, '-3.5000', '2022-10-05 17:13:21', '2022-10-05 17:13:21', 1),
(881, 3, 393, 10, 'ALFREDO', '2022-10-05', NULL, NULL, 'ADELANTO ', 12, 3, 1, '-130.0000', '2022-10-05 17:14:03', '2022-10-05 17:14:03', 1),
(882, 3, 392, 10, 'VALERIANO', '2022-10-05', NULL, NULL, 'DEL 26 AL 1 OCT', 12, 3, 1, '-152.2700', '2022-10-05 17:14:26', '2022-10-05 17:14:26', 1),
(883, 3, 393, 10, 'ALFREDO', '2022-10-05', NULL, NULL, 'DEL 26 AL 1 OCT', 12, 3, 1, '-168.0000', '2022-10-05 17:15:20', '2022-10-05 17:15:20', 1),
(884, 3, 394, 10, 'JOSE', '2022-10-05', NULL, NULL, 'DEL 26 AL 1 OCT', 12, 3, 1, '-220.8300', '2022-10-05 17:24:58', '2022-10-05 17:24:58', 1),
(885, 3, 395, 10, 'DIDIER', '2022-10-05', NULL, NULL, 'DEL 26 AL 1 OCT', 12, 3, 1, '-266.6700', '2022-10-05 17:25:36', '2022-10-05 17:25:36', 1),
(886, 3, 396, 10, 'ERICSON ', '2022-10-05', NULL, NULL, 'DEL 26 AL 1 OCT', 12, 3, 1, '-291.6700', '2022-10-05 17:26:04', '2022-10-05 17:26:04', 1),
(887, 3, 397, 10, 'NOLBERTO', '2022-10-04', NULL, NULL, 'DEL 26 AL 1 OCT', 12, 3, 1, '-391.6700', '2022-10-05 17:27:23', '2022-10-05 17:27:23', 1),
(888, 3, 398, 10, 'BEBETO', '2022-10-05', NULL, NULL, 'DEL 26 AL 1 OCT', 12, 3, 1, '-400.0000', '2022-10-05 17:28:55', '2022-10-05 17:28:55', 1),
(889, 3, 467, 10, 'ANIBAL', '2022-10-05', NULL, NULL, 'DEL 26 AL 1 OCT', 12, 3, 1, '-416.6700', '2022-10-05 17:30:30', '2022-10-05 17:30:30', 1),
(890, 3, 400, 10, 'EDIN ', '2022-10-05', NULL, NULL, 'DEL 26 AL 1 OCT', 12, 3, 1, '-432.2900', '2022-10-05 17:31:04', '2022-10-05 17:31:04', 1),
(891, 3, 401, 10, 'LUIS', '2022-10-05', NULL, NULL, 'DEL 26 AL 1 OCT', 12, 3, 1, '-458.3300', '2022-10-05 17:31:35', '2022-10-05 17:31:35', 1),
(892, 3, 402, 10, 'ROSALINO', '2022-10-05', NULL, NULL, 'DEL 26 AL 1 OCT', 12, 3, 1, '-600.0000', '2022-10-05 17:32:26', '2022-10-05 17:32:26', 1),
(893, 3, 403, 10, 'LILLIAN', '2022-10-05', NULL, NULL, 'CANCELACION DE SETIEMBRE', 12, 3, 1, '-985.0000', '2022-10-05 17:33:25', '2022-10-05 17:33:25', 1),
(894, 3, 404, 10, 'DEISY', '2022-10-05', NULL, NULL, 'CANCELACION DE SETIEMBRE', 12, 3, 1, '-1439.0000', '2022-10-05 17:34:07', '2022-10-05 17:34:07', 1),
(895, 3, 405, 10, 'VALERIANO', '2022-10-05', NULL, NULL, 'PAPELETA ', 12, 3, 1, '-62.5600', '2022-10-05 17:34:34', '2022-10-05 17:34:34', 1),
(896, 2, 249, NULL, NULL, '2022-10-05', NULL, 43, 'PAPELETAS DE OSBALDO', 12, 3, 1, '-2542.8800', '2022-10-05 17:35:19', '2022-10-05 17:35:19', 1),
(897, 3, 406, 10, 'JUNIOR', '2022-10-05', NULL, NULL, 'PLANILLA JUNIO', 12, 3, 1, '-200.0000', '2022-10-05 17:35:57', '2022-10-05 17:35:57', 1),
(898, 3, 407, 1, 'BANCO', '2022-10-05', NULL, NULL, 'IMPUESTO ITF ', 12, 3, 1, '-0.1500', '2022-10-05 17:36:52', '2022-10-05 17:36:52', 1),
(899, 3, 408, 5, 'KAIROS', '2022-10-05', NULL, NULL, 'GUIAS DE ESTUDIO', 12, 3, 1, '-160.0000', '2022-10-05 17:37:16', '2022-10-05 17:37:16', 1),
(901, 3, 410, 1, 'BANCO', '2022-10-05', NULL, NULL, 'COM MANTENIM/ ENVIO EST CTA ', 13, 3, 1, '-38.5000', '2022-10-05 17:46:27', '2022-10-05 17:46:27', 1),
(903, 2, 250, NULL, NULL, '2022-10-06', NULL, NULL, 'MAMANI HUAMAN SOLEDAD/LOURDES/ALEX', 1, 3, 1, '-30000.0000', '2022-10-06 11:14:19', '2022-10-06 11:14:19', 1),
(904, 2, 251, NULL, NULL, '2022-10-06', NULL, 79, 'GONZALES CARMONA PEDRO - MOTOR ', 1, 3, 1, '-2500.0000', '2022-10-06 11:15:36', '2022-10-06 11:15:36', 1),
(905, 2, 252, NULL, NULL, '2022-10-06', NULL, 28, 'ELSER VILCHEZ HORNA', 1, 3, 1, '-5708.0000', '2022-10-06 11:16:24', '2022-10-06 11:16:24', 1),
(906, 2, 253, NULL, NULL, '2022-10-06', NULL, 79, 'DEPOSITO FCT ', 1, 3, 1, '-5000.0000', '2022-10-06 11:17:24', '2022-10-06 11:17:24', 1),
(907, 3, 412, 1, 'BANCO', '2022-10-06', NULL, NULL, 'IMPUESTO ITF', 1, 3, 1, '-0.4000', '2022-10-06 11:17:57', '2022-10-06 11:17:57', 1),
(908, 3, 413, 1, 'BANCO', '2022-10-06', NULL, NULL, 'IMPUESTO ITF', 1, 3, 1, '-2.1000', '2022-10-06 11:18:18', '2022-10-06 11:18:18', 1),
(909, 2, 254, NULL, NULL, '2022-10-06', NULL, 50, 'COMPRA DE METALES', 1, 3, 1, '-3460.9600', '2022-10-06 11:31:30', '2022-10-06 11:31:30', 1),
(910, 2, 255, NULL, NULL, '2022-10-04', NULL, 61, 'MAMANI NAYRA JUDY', 1, 3, 1, '-3000.0000', '2022-10-06 11:33:02', '2022-10-06 11:33:02', 1),
(911, 2, 256, NULL, NULL, '2022-10-04', NULL, 61, 'JHONY PETER CANAZACA', 1, 3, 1, '-2000.0000', '2022-10-06 11:33:27', '2022-10-06 11:33:27', 1),
(912, 1, 6, NULL, NULL, '2022-10-05', NULL, 4, '0PE1000001 ZINC INDUST', 2, 3, 1, '68537.0000', '2022-10-06 11:34:49', '2022-10-06 11:34:49', 1),
(913, 3, 414, 14, 'LISBETH', '2022-10-05', NULL, NULL, 'DOCUMENTACION ', 2, 3, 1, '-1400.0000', '2022-10-06 11:36:11', '2022-10-06 11:36:11', 1),
(914, 3, 415, 1, 'BANCO', '2022-10-05', NULL, NULL, 'IMPUESTO ITF', 2, 3, 1, '-3.4000', '2022-10-06 11:37:34', '2022-10-06 11:37:34', 1),
(915, 2, 257, NULL, NULL, '2022-10-06', NULL, 37, 'RICARDO ROJAS ', 3, 3, 1, '-20000.0000', '2022-10-06 11:38:44', '2022-10-06 11:38:44', 1),
(916, 3, 417, 1, 'BANCO', '2022-10-05', NULL, NULL, 'IMPUESTO ITF', 3, 3, 1, '-1.5000', '2022-10-06 11:39:36', '2022-10-06 11:39:36', 1),
(919, 3, 418, 1, 'BANCO', '2022-10-05', NULL, NULL, 'IMPUESTO ITF', 4, 3, 1, '-0.4500', '2022-10-06 11:46:50', '2022-10-06 11:46:50', 1),
(920, 5, 6, NULL, 'BANCO', '2022-10-05', NULL, NULL, 'CHEQUE 00000064 MOV INTERNO ', 4, 3, 1, '-9800.0000', '2022-10-06 11:48:08', '2022-10-06 11:48:08', 1),
(921, 5, 6, NULL, 'BANCO', '2022-10-05', NULL, NULL, 'CHEQUE 00000064 MOV INTERNO ', 22, 3, 1, '9800.0000', '2022-10-06 11:48:08', '2022-10-06 11:48:08', 1),
(922, 1, 7, NULL, NULL, '2022-10-05', NULL, 90, 'VENTA DE PLASTICO', 5, 3, 1, '27794.2000', '2022-10-06 11:59:36', '2022-10-06 11:59:36', 1),
(923, 3, 419, 1, 'BANCO', '2022-10-05', NULL, NULL, 'IMPUESTO ITF ', 5, 3, 1, '-1.3500', '2022-10-06 12:00:08', '2022-10-06 12:00:08', 1),
(924, 3, 420, 1, 'BANCO', '2022-10-05', NULL, NULL, 'MANTENIM/ENVIO EST CTA', 14, 3, 1, '-38.5000', '2022-10-06 12:05:23', '2022-10-06 12:05:23', 1),
(925, 3, 421, 1, 'BANCO', '2022-10-05', NULL, NULL, 'MANTENIM/ ENVIO ESTA CTA ', 19, 3, 1, '-38.5000', '2022-10-06 12:17:37', '2022-10-06 12:17:37', 1),
(926, 3, 422, 1, 'BANCO', '2022-10-05', NULL, NULL, 'MANTENIM/ENVIO EST CTA', 21, 3, 1, '-32.5000', '2022-10-06 12:22:20', '2022-10-06 12:22:20', 1),
(927, 1, 58, NULL, NULL, '2022-10-06', NULL, 67, 'CAMBIO DE DOLAR $164700 - COBRE Y ALUMINIO ', 11, 3, 1, '651553.2000', '2022-10-06 16:22:06', '2022-10-06 16:22:06', 1),
(928, 3, 423, 1, 'BANCO', '2022-10-05', NULL, NULL, 'COM.MANTENIN ENVIO EST CTA', 11, 3, 1, '-35.0000', '2022-10-06 16:32:02', '2022-10-06 16:32:02', 1),
(929, 3, 424, 1, 'BANCO', '2022-10-06', NULL, NULL, 'ENVIO.EST .CTA', 11, 3, 1, '-3.5000', '2022-10-06 16:32:23', '2022-10-06 16:32:23', 1),
(930, 3, 425, 1, 'BANCO ', '2022-10-06', NULL, NULL, 'IMPUESTO ITF ', 11, 3, 1, '-32.0200', '2022-10-06 16:34:10', '2022-10-06 16:34:10', 1),
(931, 3, 426, 10, 'ALFREDO', '2022-10-06', NULL, NULL, 'ADELANTO', 22, 3, 1, '-100.0000', '2022-10-06 17:34:32', '2022-10-06 17:34:32', 1),
(932, 1, 60, NULL, NULL, '2022-10-06', NULL, 67, '$1909.38  ', 17, 3, 1, '7553.5000', '2022-10-07 09:47:01', '2022-10-07 09:47:01', 1),
(933, 3, 427, 14, 'TTP ', '2022-10-06', NULL, NULL, '$1328.23 Y $1156.21', 17, 3, 1, '-9831.2100', '2022-10-07 09:48:22', '2022-10-07 09:48:22', 1),
(934, 1, 61, NULL, NULL, '2022-10-07', NULL, 67, '$265 ', 17, 3, 1, '1048.3400', '2022-10-07 10:03:12', '2022-10-07 10:03:12', 1),
(935, 3, 430, 14, 'BANCO ', '2022-10-07', NULL, NULL, 'GASTOS BANCARIOS X2 CONTENEDORES', 17, 3, 1, '-1048.3400', '2022-10-07 10:03:57', '2022-10-07 10:03:57', 1),
(936, 3, 429, 1, 'BANCO', '2022-10-07', NULL, NULL, 'MANTENIM/ ENVIO EST CTA / ITFS ', 17, 3, 1, '-126.5000', '2022-10-07 10:05:43', '2022-10-07 10:05:43', 1),
(937, 2, 258, NULL, NULL, '2022-10-06', NULL, 52, 'MONEDAS ', 22, 3, 1, '-5000.0000', '2022-10-07 14:30:27', '2022-10-07 14:30:27', 1),
(938, 2, 259, NULL, NULL, '2022-10-07', NULL, 73, 'CARROS PUCALLPA GATOS LAADO- TAPONES- CABLE-PETROLEO-ELECTRICISTA-DADOS CARROS', 22, 3, 1, '-291.5000', '2022-10-07 14:50:20', '2022-10-07 14:50:20', 1),
(939, 3, 431, 10, 'DEISY ', '2022-10-06', NULL, NULL, 'ADELANTO ', 22, 3, 1, '-20.0000', '2022-10-07 14:51:00', '2022-10-07 14:51:00', 1),
(940, 3, 432, 2, 'ANIBAL', '2022-10-07', NULL, NULL, 'BLRR', 22, 8, 1, '-300.0000', '2022-10-07 14:51:59', '2022-10-07 14:51:59', 1),
(941, 2, 260, NULL, NULL, '2022-10-07', NULL, 79, 'MATERIALES PRENSA', 22, 8, 1, '-1000.0000', '2022-10-07 14:52:34', '2022-10-07 14:52:34', 1),
(942, 2, 261, NULL, NULL, '2022-10-07', NULL, 79, 'MANO DE OBRA', 22, 8, 1, '-2000.0000', '2022-10-07 14:52:50', '2022-10-07 14:52:50', 1),
(943, 3, 433, 10, 'DANIEL ', '2022-10-07', NULL, NULL, 'ADELANTO ', 22, 3, 1, '-20.0000', '2022-10-07 14:54:22', '2022-10-07 14:54:22', 1),
(944, 2, 262, NULL, NULL, '2022-10-07', NULL, 40, 'EFECTIVO', 22, 8, 1, '-721.2000', '2022-10-07 15:06:24', '2022-10-07 15:06:24', 1),
(945, 3, 434, 10, 'DANIEL', '2022-10-07', NULL, NULL, 'CANCELACION ', 22, 8, 1, '-162.0000', '2022-10-07 15:06:57', '2022-10-07 15:06:57', 1),
(946, 3, 435, 10, 'EDGAR', '2022-10-07', NULL, NULL, 'DEL 26 AL 1 DE OCTURE', 22, 8, 1, '-250.0000', '2022-10-07 15:07:37', '2022-10-07 15:07:37', 1),
(947, 3, 436, 4, 'EDUARDO', '2022-10-07', NULL, NULL, 'PAGO DE SISTEMA', 22, 8, 1, '-800.0000', '2022-10-07 15:08:23', '2022-10-07 15:08:23', 1),
(948, 3, 437, 10, 'LILLIAN ', '2022-10-07', NULL, NULL, 'ADELANTO ', 22, 8, 1, '-160.0000', '2022-10-07 15:08:48', '2022-10-07 15:08:48', 1),
(949, 2, 263, NULL, NULL, '2022-10-07', NULL, 43, 'CANCELACION DE CARRO - CAMPAÑA DE WILY ', 22, 8, 1, '-2300.0000', '2022-10-07 15:09:36', '2022-10-07 15:09:36', 1),
(950, 3, 438, 12, 'JUAN', '2022-10-07', NULL, NULL, '3 MENU DE JUAN ', 22, 8, 1, '-34.0000', '2022-10-07 15:10:44', '2022-10-07 15:10:44', 1),
(951, 3, 439, 11, 'EDY', '2022-10-07', NULL, NULL, 'BOTADA DE BASURA', 22, 8, 1, '-30.0000', '2022-10-07 15:11:32', '2022-10-07 15:11:32', 1),
(952, 3, 440, 8, 'EDY', '2022-10-07', NULL, NULL, 'POLICIA', 22, 8, 1, '-20.0000', '2022-10-07 15:11:50', '2022-10-07 15:11:50', 1),
(953, 3, 441, 10, 'JOSE', '2022-10-07', NULL, NULL, 'ADELANTO ', 22, 8, 1, '-50.0000', '2022-10-07 15:12:23', '2022-10-07 15:12:23', 1),
(954, 2, 264, NULL, NULL, '2022-10-07', NULL, 73, 'CARROS PUCALLPA', 22, 8, 1, '-550.0000', '2022-10-07 15:12:48', '2022-10-07 15:12:48', 1),
(955, 2, 265, NULL, NULL, '2022-10-07', NULL, 79, 'COMPRA DE MATERIALES', 22, 8, 1, '-1442.0000', '2022-10-07 15:13:17', '2022-10-07 15:13:17', 1),
(956, 3, 442, 11, 'SEÑORA DE LIMPIEZA', '2022-10-07', NULL, NULL, 'LIMPIEZA', 22, 8, 1, '-35.0000', '2022-10-07 15:14:02', '2022-10-07 15:14:02', 1),
(957, 3, 443, 11, 'LILLIAN', '2022-10-07', NULL, NULL, 'COMPRA DE BOLSA', 22, 8, 1, '-10.0000', '2022-10-07 15:14:31', '2022-10-07 15:14:31', 1),
(958, 3, 444, 9, 'LILLIAN', '2022-10-07', NULL, NULL, 'PEAJE', 22, 8, 1, '-10.0000', '2022-10-07 15:14:54', '2022-10-07 15:14:54', 1),
(959, 3, 445, 9, 'EDY', '2022-10-07', NULL, NULL, '2 PEAJES', 22, 8, 1, '-13.0000', '2022-10-07 15:17:08', '2022-10-07 15:17:08', 1),
(960, 3, 446, 2, 'EDY', '2022-10-07', NULL, NULL, 'COMBUSTIBLE AXF', 22, 8, 1, '-210.0000', '2022-10-07 15:17:41', '2022-10-07 15:17:41', 1),
(961, 3, 447, 10, 'DEISY', '2022-10-07', NULL, NULL, 'ADELANTO', 22, 8, 1, '-100.0000', '2022-10-07 15:18:05', '2022-10-07 15:18:05', 1),
(962, 3, 448, 10, 'LILLIAN', '2022-10-07', NULL, NULL, 'ADELANTO ', 22, 8, 1, '-110.0000', '2022-10-07 15:18:22', '2022-10-07 15:18:22', 1),
(963, 3, 449, 7, 'ORIOL', '2022-10-07', NULL, NULL, 'TAXI PARA ENTEGA DE CARTAS AL CALLAO', 22, 8, 1, '-70.0000', '2022-10-07 15:18:58', '2022-10-07 15:18:58', 1),
(964, 2, 266, NULL, NULL, '2022-10-07', NULL, 25, 'COMPRA DE METALES', 22, 8, 1, '-20078.0000', '2022-10-07 15:22:14', '2022-10-07 15:22:14', 1),
(965, 2, 267, NULL, NULL, '2022-10-07', NULL, 28, 'COMPRA DE METALES', 22, 8, 1, '-4800.0000', '2022-10-07 15:22:39', '2022-10-07 15:22:39', 1),
(966, 3, 450, 9, 'LILLIAN', '2022-10-07', NULL, NULL, 'PEAJE', 22, 8, 1, '-6.5000', '2022-10-07 15:23:48', '2022-10-07 15:23:48', 1),
(967, 3, 451, 2, 'EDY', '2022-10-07', NULL, NULL, 'GAS', 22, 8, 1, '-219.0000', '2022-10-07 15:24:08', '2022-10-07 15:24:08', 1),
(968, 3, 452, 11, 'SEÑORA DE LIMPIEZA', '2022-10-07', NULL, NULL, 'LIMPIEZA', 22, 8, 1, '-30.0000', '2022-10-07 15:25:02', '2022-10-07 15:25:02', 1),
(969, 3, 467, 10, 'DANIEL', '2022-10-07', NULL, NULL, 'ADELANTO ', 22, 8, 1, '-10.0000', '2022-10-07 15:26:36', '2022-10-07 15:26:36', 1),
(970, 2, 268, NULL, NULL, '2022-10-07', NULL, 40, 'FLETE', 22, 8, 1, '-3000.0000', '2022-10-07 15:26:58', '2022-10-07 15:26:58', 1),
(971, 2, 291, NULL, NULL, '2022-10-07', NULL, 79, 'MANO DE OBRA', 22, 8, 1, '-5000.0000', '2022-10-07 15:27:23', '2022-10-07 15:27:23', 1),
(972, 2, 270, NULL, NULL, '2022-10-07', NULL, 79, 'COMPRA DE MATERIAL ', 22, 8, 1, '-1000.0000', '2022-10-07 15:27:51', '2022-10-07 15:27:51', 1),
(973, 3, 454, 3, 'DELFHO', '2022-10-07', NULL, NULL, 'REPARACIONDE MONTA', 22, 8, 1, '-280.0000', '2022-10-07 15:32:03', '2022-10-07 15:32:03', 1),
(974, 3, 455, 10, 'JOSE', '2022-10-07', NULL, NULL, 'ADELANTO ', 22, 8, 1, '-100.0000', '2022-10-07 15:32:25', '2022-10-07 15:32:25', 1),
(975, 3, 456, 9, 'DIDIER', '2022-10-07', NULL, NULL, '2 PEAJES', 22, 8, 1, '-26.0000', '2022-10-07 15:34:35', '2022-10-07 15:34:35', 1),
(976, 3, 457, 3, 'DIDIER', '2022-10-07', NULL, NULL, 'LAVADO DE ARRO', 22, 8, 1, '-40.0000', '2022-10-07 15:35:05', '2022-10-07 15:35:05', 1),
(977, 3, 458, 13, 'VALERIANO', '2022-10-07', NULL, NULL, 'BALANZAS', 22, 8, 1, '-20.0000', '2022-10-07 15:37:06', '2022-10-07 15:37:06', 1),
(978, 3, 459, 2, 'DIDIER', '2022-10-07', NULL, NULL, 'GAS', 22, 8, 1, '-213.5000', '2022-10-07 16:01:47', '2022-10-07 16:01:47', 1),
(979, 3, 491, 6, 'DIDIER', '2022-10-07', NULL, NULL, 'MOVILIDAD PARA DEJAR FACTURAS ', 22, 8, 1, '-22.0000', '2022-10-07 16:03:11', '2022-10-07 16:03:11', 1),
(980, 3, 461, 7, 'EDY', '2022-10-07', NULL, NULL, 'TAXI ', 22, 8, 1, '-25.0000', '2022-10-07 16:10:56', '2022-10-07 16:10:56', 1),
(981, 3, 462, 6, 'EDY', '2022-10-07', NULL, NULL, 'CUCHILLAS', 22, 8, 1, '-7.5000', '2022-10-07 16:11:41', '2022-10-07 16:11:41', 1),
(982, 3, 463, 7, 'DANIEL', '2022-10-07', NULL, NULL, 'PASAJE ', 22, 8, 1, '-4.0000', '2022-10-07 16:12:51', '2022-10-07 16:12:51', 1),
(983, 3, 464, 12, 'EDY', '2022-10-07', NULL, NULL, 'GASEOSA', 22, 8, 1, '-15.0000', '2022-10-07 16:23:00', '2022-10-07 16:23:00', 1),
(984, 3, 465, 9, 'EDY', '2022-10-07', NULL, NULL, 'PEAJE', 22, 8, 1, '-6.5000', '2022-10-07 16:24:09', '2022-10-07 16:24:09', 1),
(985, 3, 466, 10, 'JOSE', '2022-10-07', NULL, NULL, 'ADELANTO ', 22, 8, 1, '-10.0000', '2022-10-07 16:42:06', '2022-10-07 16:42:06', 1),
(986, 1, 62, NULL, NULL, '2022-10-07', NULL, 35, 'DE CERRADURAS NACIONAL', 1, 3, 1, '85030.8600', '2022-10-10 10:57:35', '2022-10-10 10:57:35', 1),
(987, 1, 63, NULL, NULL, '2022-10-07', NULL, 4, '0PE1000001 ZINC INDUST', 1, 3, 1, '86681.6200', '2022-10-10 10:58:19', '2022-10-10 10:58:19', 1),
(988, 5, 7, NULL, 'deisy ', '2022-10-07', NULL, NULL, 'mov interno ', 1, 8, 1, '-97.0000', '2022-10-10 11:00:20', '2022-10-10 11:00:20', 1),
(989, 5, 7, NULL, 'deisy ', '2022-10-07', NULL, NULL, 'mov interno ', 22, 8, 1, '97.0000', '2022-10-10 11:00:21', '2022-10-10 11:00:21', 1),
(990, 3, 468, 11, 'SATELLITAL PATROL ', '2022-10-10', NULL, NULL, 'GPS', 1, 3, 1, '-294.7000', '2022-10-10 11:05:20', '2022-10-10 11:05:20', 1),
(991, 2, 271, NULL, NULL, '2022-10-07', NULL, 59, 'HUAYCA OSCO', 1, 3, 1, '-5700.0000', '2022-10-10 11:09:50', '2022-10-10 11:09:50', 1),
(992, 2, 272, NULL, NULL, '2022-10-10', NULL, 43, 'CHEQUE 00000029/ VIVIANA ', 1, 3, 1, '-12563.5000', '2022-10-10 11:10:42', '2022-10-10 11:10:42', 1),
(993, 2, 273, NULL, NULL, '2022-10-10', NULL, 54, 'ZEA AQUISE AMERICO ', 1, 3, 1, '-26737.5000', '2022-10-10 11:13:10', '2022-10-10 11:13:10', 1),
(994, 3, 469, 1, 'BANCO', '2022-10-07', NULL, NULL, 'IMPUESTO ITF ', 1, 3, 1, '-10.7000', '2022-10-10 11:13:41', '2022-10-10 11:13:41', 1),
(995, 1, 64, NULL, NULL, '2022-10-07', NULL, 4, ' 0PE1000001 ZINC INDUST', 2, 3, 1, '41495.1100', '2022-10-10 11:16:15', '2022-10-10 11:16:15', 1),
(996, 3, 470, 1, 'BANCO ', '2022-10-10', NULL, NULL, 'IMPUESTO ITF ', 2, 3, 1, '-2.0500', '2022-10-10 11:16:45', '2022-10-10 11:16:45', 1),
(997, 1, 65, NULL, NULL, '2022-10-10', NULL, 43, 'NACION 00000000000000 - LB OCTUBRE', 3, 3, 1, '298026.0000', '2022-10-10 11:30:32', '2022-10-10 11:30:32', 1),
(998, 2, 274, NULL, NULL, '2022-10-07', NULL, 33, 'LUSY DIAZ VASQUEZ', 3, 3, 1, '-4488.0000', '2022-10-10 11:48:50', '2022-10-10 11:48:50', 1),
(999, 2, 275, NULL, NULL, '2022-10-10', NULL, 1, 'RAUL VASQUEZ ', 3, 3, 1, '-5000.0000', '2022-10-10 11:56:13', '2022-10-10 11:56:13', 1),
(1002, 2, 276, NULL, NULL, '2022-10-07', NULL, 54, 'FUENTES CRUZ JENIFER ', 3, 3, 1, '-30000.0000', '2022-10-10 12:11:02', '2022-10-10 12:11:02', 1),
(1003, 3, 471, 1, 'BANCO', '2022-10-07', NULL, NULL, 'IMPUESTO ITF', 3, 3, 1, '-18.3500', '2022-10-10 12:34:45', '2022-10-10 12:34:45', 1),
(1004, 2, 277, NULL, NULL, '2022-10-08', NULL, 43, 'AGUIRRE MANZANO C. - MERLY ', 3, 3, 1, '-250.0000', '2022-10-10 14:16:46', '2022-10-10 14:16:46', 1),
(1005, 2, 278, NULL, NULL, '2022-10-08', NULL, 51, 'HUAMAN ESTUMBELO ', 3, 3, 1, '-1767.5000', '2022-10-10 14:18:05', '2022-10-10 14:18:05', 1),
(1006, 2, 292, NULL, NULL, '2022-10-10', NULL, 39, 'PEDRO/JULIAN/MIREYA', 3, 3, 1, '-20000.0000', '2022-10-10 14:20:36', '2022-10-10 14:20:36', 1),
(1007, 2, 280, NULL, NULL, '2022-10-08', NULL, 40, 'LOURDES MAMANI TI CAHUAN ', 3, 3, 1, '-10000.0000', '2022-10-10 14:22:25', '2022-10-10 14:22:25', 1),
(1008, 2, 281, NULL, NULL, '2022-10-08', NULL, 60, 'JIMMMY PORTALANZAS', 3, 3, 1, '-20000.0000', '2022-10-10 15:03:52', '2022-10-10 15:03:52', 1),
(1009, 3, 472, 1, 'BANCO', '2022-10-08', NULL, NULL, 'IMPUESTO ITF', 3, 3, 1, '-2.5500', '2022-10-10 15:05:58', '2022-10-10 15:05:58', 1),
(1010, 2, 282, NULL, NULL, '2022-10-10', NULL, 1, 'CANCELACION', 3, 3, 1, '-14255.0000', '2022-10-10 15:07:01', '2022-10-10 15:07:01', 1),
(1011, 2, 283, NULL, NULL, '2022-10-10', NULL, 17, 'VASQUEZ TORRES', 3, 3, 1, '-2000.0000', '2022-10-10 15:09:37', '2022-10-10 15:09:37', 1),
(1012, 2, 284, NULL, NULL, '2022-10-08', NULL, 61, 'CURO JUANITO HECTOR', 3, 3, 1, '-1800.0000', '2022-10-10 15:10:17', '2022-10-10 15:10:17', 1),
(1013, 2, 285, NULL, NULL, '2022-10-10', NULL, 41, 'FLORES SUEÑAS JHEISY', 3, 3, 1, '-5000.0000', '2022-10-10 15:11:04', '2022-10-10 15:11:04', 1),
(1014, 2, 286, NULL, NULL, '2022-10-06', NULL, 33, 'LUSY DIAZ', 3, 3, 1, '-500.0000', '2022-10-10 15:27:35', '2022-10-10 15:27:35', 1),
(1015, 2, 287, NULL, NULL, '2022-10-06', NULL, 101, 'ALICIA ZUÑIGAVARA', 3, 3, 1, '-35082.2000', '2022-10-10 15:29:15', '2022-10-10 15:29:15', 1),
(1016, 2, 288, NULL, NULL, '2022-10-06', NULL, 40, 'MERMA SAICO ', 3, 3, 1, '-12000.0000', '2022-10-10 16:19:55', '2022-10-10 16:19:55', 1),
(1017, 2, 289, NULL, NULL, '2022-10-06', NULL, 61, 'HECTOR CURO JUANITO ', 3, 3, 1, '-2000.0000', '2022-10-10 16:22:01', '2022-10-10 16:22:01', 1),
(1018, 1, 68, NULL, NULL, '2022-10-10', NULL, 90, 'CANCELACION DE PLASTICO', 5, 3, 1, '86.0000', '2022-10-10 16:28:17', '2022-10-10 16:28:17', 1),
(1020, 3, 474, 10, 'JUNIOR', '2022-10-07', NULL, NULL, 'DEL 3 AL 8 OCTUBRE', 5, 3, 1, '-266.0400', '2022-10-10 17:47:33', '2022-10-10 17:47:33', 1),
(1021, 3, 475, 10, 'JOSE AGURTO', '2022-10-07', NULL, NULL, 'DEL 3 AL 8 DE OCTUBRE ', 5, 3, 1, '-210.8300', '2022-10-11 11:50:08', '2022-10-11 11:50:08', 1),
(1022, 3, 476, 8, 'SERGIO', '2022-10-07', NULL, NULL, 'JOEL CASACHAGUA - PAGO ABOGADO DE GABY', 5, 3, 1, '-300.0000', '2022-10-11 11:51:19', '2022-10-11 11:51:19', 1),
(1023, 3, 477, 10, 'LILLIAN ', '2022-10-07', NULL, NULL, 'DEL 3 AL 8 DE OCTUBRE ', 5, 3, 1, '-303.0000', '2022-10-11 11:51:41', '2022-10-11 11:51:41', 1),
(1024, 3, 478, 10, 'ERICKSON', '2022-10-07', NULL, NULL, 'DEL 3 AL 8 DE OCTUBRE ', 5, 3, 1, '-350.0000', '2022-10-11 11:52:24', '2022-10-11 11:52:24', 1),
(1025, 3, 479, 10, 'EDIN ', '2022-10-07', NULL, NULL, 'DEL 3 AL 8 DE OCTUBRE ', 5, 3, 1, '-416.6700', '2022-10-11 11:53:01', '2022-10-11 11:53:01', 1),
(1026, 3, 480, 10, 'DIDIER', '2022-10-07', NULL, NULL, 'DEL 3 AL 8 DE OCTUBRE ', 5, 3, 1, '-416.6700', '2022-10-11 11:53:28', '2022-10-11 11:53:28', 1),
(1027, 3, 481, 10, 'VALERIANO', '2022-10-07', NULL, NULL, 'DEL 3 AL 8 DE OCTUBRE  - VACACIONES ', 5, 3, 1, '-500.0000', '2022-10-11 11:53:55', '2022-10-11 11:53:55', 1),
(1028, 3, 482, 10, 'ZORAIDA', '2022-10-07', NULL, NULL, 'QUINCENA ', 5, 3, 1, '-500.0000', '2022-10-11 11:54:34', '2022-10-11 11:54:34', 1),
(1029, 3, 483, 10, 'LUIS', '2022-10-07', NULL, NULL, 'DEL 3 AL 8 DE OCTUBRE ', 5, 3, 1, '-550.0000', '2022-10-11 11:55:21', '2022-10-11 11:55:21', 1),
(1030, 3, 484, 10, 'BEBETO', '2022-10-07', NULL, NULL, 'DEL 3 AL 8 DE OCTUBRE ', 5, 3, 1, '-600.0000', '2022-10-11 11:55:46', '2022-10-11 11:55:46', 1),
(1031, 3, 485, 10, 'ROSALINO ', '2022-10-07', NULL, NULL, 'DEL 3 AL 8 DE OCTUBRE ', 5, 3, 1, '-872.9000', '2022-10-11 11:56:48', '2022-10-11 11:56:48', 1),
(1032, 1, 67, NULL, NULL, '2022-10-10', NULL, 43, 'LIBERACION OCTUBRE BE Y RO MANJAS ', 5, 3, 1, '26384.0000', '2022-10-11 11:57:33', '2022-10-11 11:57:33', 1),
(1033, 3, 486, 1, 'BANCO', '2022-10-07', NULL, NULL, 'IMPUESTO ITF ', 5, 3, 1, '-1.3000', '2022-10-11 11:58:00', '2022-10-11 11:58:00', 1),
(1034, 1, 69, NULL, NULL, '2022-10-10', NULL, 4, '0PE1000002 ZINC INDUST', 6, 3, 1, '46251.9900', '2022-10-11 12:01:29', '2022-10-11 12:01:29', 1),
(1035, 3, 487, 1, 'BANCO', '2022-10-10', NULL, NULL, 'IMPUESTO ITF', 6, 3, 1, '-2.3000', '2022-10-11 12:02:05', '2022-10-11 12:02:05', 1),
(1036, 1, 70, NULL, NULL, '2022-10-10', NULL, 43, ' LIBERACION OCTUBRE SOGRUP 53', 7, 3, 1, '75687.3800', '2022-10-11 12:03:58', '2022-10-11 12:03:58', 1),
(1037, 3, 488, 1, 'BANCO', '2022-10-10', NULL, NULL, 'IMPUESTO ITF ', 7, 3, 1, '-3.7500', '2022-10-11 12:04:47', '2022-10-11 12:04:47', 1),
(1040, 5, 10, NULL, 'LILLIAN ', '2022-10-11', NULL, NULL, 'MOV INTER - FACTURA', 11, 3, 1, '-162497.8000', '2022-10-11 12:07:40', '2022-10-11 12:07:40', 1),
(1041, 5, 10, NULL, 'LILLIAN ', '2022-10-11', NULL, NULL, 'MOV INTER - FACTURA', 9, 3, 1, '162497.8000', '2022-10-11 12:07:40', '2022-10-11 12:07:40', 1),
(1042, 5, 11, NULL, 'LILLIAN ', '2022-10-11', NULL, NULL, 'MOV INTER - FACT', 11, 3, 1, '-128889.0400', '2022-10-11 12:08:59', '2022-10-11 12:08:59', 1),
(1043, 5, 11, NULL, 'LILLIAN ', '2022-10-11', NULL, NULL, 'MOV INTER - FACT', 9, 3, 1, '128889.0400', '2022-10-11 12:08:59', '2022-10-11 12:08:59', 1),
(1044, 5, 12, NULL, 'DEISY ', '2022-10-07', NULL, NULL, 'MOV INTERNO', 3, 3, 1, '-5000.0000', '2022-10-11 12:13:32', '2022-10-11 12:13:32', 1),
(1045, 5, 12, NULL, 'DEISY ', '2022-10-07', NULL, NULL, 'MOV INTERNO', 10, 3, 1, '5000.0000', '2022-10-11 12:13:33', '2022-10-11 12:13:33', 1),
(1046, 2, 290, NULL, NULL, '2022-10-07', NULL, 40, 'CHEQUE 00000071', 10, 3, 1, '-25000.0000', '2022-10-11 12:14:16', '2022-10-11 12:14:16', 1),
(1047, 3, 489, 1, 'BANCO ', '2022-10-07', NULL, NULL, 'IMPUESTO ITF', 10, 3, 1, '-1.5000', '2022-10-11 12:14:52', '2022-10-11 12:14:52', 1),
(1048, 1, 71, NULL, NULL, '2022-10-10', NULL, 43, 'LIBERACION OCTUBRE - WALL STREET ', 19, 3, 1, '25485.4000', '2022-10-11 12:23:31', '2022-10-11 12:23:31', 1),
(1049, 3, 490, 1, 'BANCO', '2022-10-10', NULL, NULL, 'IMPUESTO ITF ', 19, 3, 1, '-1.2500', '2022-10-11 12:24:14', '2022-10-11 12:24:14', 1),
(1050, 2, 293, NULL, NULL, '2022-10-11', NULL, 55, 'ANDRES/FERNANDO ', 1, 3, 1, '-45272.2500', '2022-10-11 15:05:19', '2022-10-11 15:05:19', 1),
(1051, 2, 294, NULL, NULL, '2022-10-11', NULL, 55, 'FERNANDO RIVERA CASTILLO', 1, 3, 1, '-17684.2000', '2022-10-11 15:06:15', '2022-10-11 15:06:15', 1),
(1052, 2, 295, NULL, NULL, '2022-10-11', NULL, 41, 'MERMA SAICO NORMA ', 1, 3, 1, '-7200.0000', '2022-10-11 15:06:50', '2022-10-11 15:06:50', 1),
(1053, 3, 492, 11, 'FIBER PRO', '2022-10-11', NULL, NULL, 'INTERNET ', 1, 3, 1, '-90.0000', '2022-10-11 15:07:51', '2022-10-11 15:07:51', 1),
(1054, 3, 493, 11, 'ENTEL ', '2022-10-11', NULL, NULL, 'TELEFONIA', 1, 3, 1, '-61.1100', '2022-10-11 15:08:29', '2022-10-11 15:08:29', 1),
(1055, 2, 296, NULL, NULL, '2022-10-11', NULL, 60, 'INVERSIONES DEL ORIENTE', 1, 3, 1, '-2500.0000', '2022-10-11 15:09:14', '2022-10-11 15:09:14', 1),
(1056, 1, 72, NULL, NULL, '2022-10-10', NULL, 4, ' 0PE1000001 ZINC INDUST', 2, 3, 1, '42022.2700', '2022-10-11 15:18:29', '2022-10-11 15:18:29', 1),
(1057, 3, 494, 1, 'BANCO ', '2022-10-10', NULL, NULL, 'IMPUESTO ITF ', 2, 3, 1, '-2.1000', '2022-10-11 15:19:00', '2022-10-11 15:19:00', 1),
(1058, 2, 297, NULL, NULL, '2022-10-11', NULL, 60, 'INVERSIONES  ORIENTAL ', 2, 3, 1, '-27120.0000', '2022-10-11 15:24:17', '2022-10-11 15:24:17', 1),
(1059, 2, 298, NULL, NULL, '2022-10-11', NULL, 16, 'TICSE ROSALES KATHERINE / ANDERSON DAVIS TRUJILLOS', 2, 3, 1, '-20000.0000', '2022-10-11 15:25:35', '2022-10-11 15:25:35', 1),
(1060, 2, 299, NULL, NULL, '2022-10-11', NULL, 41, 'SANDRA RAMIREZ', 2, 3, 1, '-5000.0000', '2022-10-11 16:07:56', '2022-10-11 16:07:56', 1),
(1061, 5, 13, NULL, 'VALERIANO', '2022-10-11', NULL, NULL, 'MOV INTERNO COMPRA METALES', 2, 3, 1, '-4120.0000', '2022-10-11 16:09:09', '2022-10-11 16:09:09', 1),
(1062, 5, 13, NULL, 'VALERIANO', '2022-10-11', NULL, NULL, 'MOV INTERNO COMPRA METALES', 22, 3, 1, '4120.0000', '2022-10-11 16:09:09', '2022-10-11 16:09:09', 1),
(1063, 3, 495, 9, 'VALERIANO', '2022-10-11', NULL, NULL, 'PEAJES', 2, 3, 1, '-52.0000', '2022-10-11 16:23:20', '2022-10-11 16:23:20', 1),
(1064, 2, 300, NULL, NULL, '2022-10-07', NULL, 40, 'TAMATA TICAHUANA LUCIANO ', 3, 3, 1, '-25000.0000', '2022-10-11 17:03:25', '2022-10-11 17:03:25', 1),
(1065, 3, 496, 1, 'BANCO', '2022-10-10', NULL, NULL, 'IMPUESTO ITF ', 3, 3, 1, '-1.6500', '2022-10-11 17:09:06', '2022-10-11 17:09:06', 1),
(1066, 2, 301, NULL, NULL, '2022-10-11', NULL, 43, 'GRISOLA AUTORIZADO X GLORIA ', 3, 3, 1, '-300.0000', '2022-10-11 17:14:01', '2022-10-11 17:14:01', 1),
(1067, 3, 497, 3, 'CONTINENTAL ', '2022-10-11', NULL, NULL, 'COMPRA DE LLANTAS PARA EL ISUZU ', 3, 3, 1, '-5230.0000', '2022-10-11 17:16:10', '2022-10-11 17:16:10', 1),
(1068, 2, 302, NULL, NULL, '2022-10-11', NULL, 44, 'HUAMAN MOYA SABINA ', 3, 3, 1, '-25451.5000', '2022-10-11 17:19:43', '2022-10-11 17:19:43', 1),
(1069, 2, 303, NULL, NULL, '2022-10-11', NULL, 39, 'FLORES FLORES MARIO ', 3, 3, 1, '-22590.0000', '2022-10-11 17:20:26', '2022-10-11 17:20:26', 1),
(1070, 2, 304, NULL, NULL, '2022-10-11', NULL, 54, 'CRUZ CHAMBI R', 3, 3, 1, '-20000.0000', '2022-10-11 17:21:08', '2022-10-11 17:21:08', 1),
(1071, 2, 305, NULL, NULL, '2022-10-10', NULL, 75, 'DIAZ VASQUEZ JAIME ', 3, 3, 1, '-10283.0000', '2022-10-11 17:22:58', '2022-10-11 17:22:58', 1),
(1072, 2, 306, NULL, NULL, '2022-10-11', NULL, 79, 'CABLES DE COBRE PARA MEDIDOR ', 3, 3, 1, '-1937.0000', '2022-10-11 17:24:07', '2022-10-11 17:24:07', 1),
(1073, 3, 498, 1, 'BANCO ', '2022-10-10', NULL, NULL, 'IMPUESTO ITF', 3, 3, 1, '-1.6500', '2022-10-11 17:24:56', '2022-10-11 17:24:56', 1),
(1074, 2, 307, NULL, NULL, '2022-10-11', NULL, 40, 'LIVIA TICAHUANA/MARIO TAMATA ', 4, 3, 1, '-50000.0000', '2022-10-11 17:27:53', '2022-10-11 17:27:53', 1),
(1075, 2, 308, NULL, NULL, '2022-10-11', NULL, 39, 'JACQUELINE RAMIREZ', 4, 3, 1, '-20000.0000', '2022-10-11 17:28:49', '2022-10-11 17:28:49', 1),
(1076, 5, 14, NULL, 'LILLIAN ', '2022-10-11', NULL, NULL, 'MOV INTERNO - CHEQUE 00000066', 4, 3, 1, '-300000.0000', '2022-10-11 17:29:47', '2022-10-11 17:29:47', 1),
(1077, 5, 14, NULL, 'LILLIAN ', '2022-10-11', NULL, NULL, 'MOV INTERNO - CHEQUE 00000066', 22, 3, 1, '300000.0000', '2022-10-11 17:29:48', '2022-10-11 17:29:48', 1),
(1078, 5, 15, NULL, 'LILLIAN ', '2022-10-11', NULL, NULL, 'MOV INTERNO - FACTURA LIFERLI ', 11, 3, 1, '-316240.0000', '2022-10-11 17:33:25', '2022-10-11 17:33:25', 1),
(1079, 5, 15, NULL, 'LILLIAN ', '2022-10-11', NULL, NULL, 'MOV INTERNO - FACTURA LIFERLI ', 13, 3, 1, '316240.0000', '2022-10-11 17:33:26', '2022-10-11 17:33:26', 1),
(1080, 5, 16, NULL, 'LILLIAN ', '2022-10-11', NULL, NULL, 'MOV INTERNO - FACT ', 11, 3, 1, '-191395.0000', '2022-10-11 17:46:43', '2022-10-11 17:46:43', 1),
(1081, 5, 16, NULL, 'LILLIAN ', '2022-10-11', NULL, NULL, 'MOV INTERNO - FACT ', 13, 3, 1, '191395.0000', '2022-10-11 17:46:43', '2022-10-11 17:46:43', 1),
(1083, 3, 500, 1, 'BANCO', '2022-10-11', NULL, NULL, 'IMPUESTO ITF', 11, 3, 1, '-25.3500', '2022-10-11 17:48:31', '2022-10-11 17:48:31', 1),
(1084, 1, 73, NULL, NULL, '2022-10-12', NULL, 66, 'A CUENTA DE BOLETAS RECOJO DE MATERIAL ', 5, 1, 1, '7000.0000', '2022-10-12 09:07:05', '2022-10-12 09:07:05', 1),
(1085, 3, 501, 1, 'EDY ', '2022-10-07', NULL, NULL, 'LAVADO DE CARRO ', 22, 3, 1, '-20.0000', '2022-10-12 10:05:14', '2022-10-12 10:05:14', 1),
(1086, 3, 502, 10, 'DANIEL ', '2022-10-07', NULL, NULL, 'DEL 3 AL 8 DE OCTUBRE', 22, 8, 1, '-340.0000', '2022-10-12 10:06:38', '2022-10-12 10:06:38', 1),
(1087, 3, 503, 10, 'EDGAR', '2022-10-12', NULL, NULL, 'DEL 3 A 8 DE OCTUBRE', 22, 8, 1, '-320.0000', '2022-10-12 10:07:09', '2022-10-12 10:07:09', 1),
(1088, 3, 504, 10, 'DEISY ', '2022-10-12', NULL, NULL, 'ADELANTO ', 22, 8, 1, '-550.0000', '2022-10-12 10:07:40', '2022-10-12 10:07:40', 1);
INSERT INTO `cajas` (`caj_id`, `caj_tipo`, `caj_numero`, `caj_tga_id`, `caj_responsable`, `caj_fecha`, `caj_col_id`, `caj_age_id`, `caj_observaciones`, `caj_cue_id`, `caj_t1m_id`, `caj_gt4_id`, `caj_monto`, `caj_created`, `caj_updated`, `caj_status`) VALUES
(1089, 2, 309, NULL, NULL, '2022-10-12', NULL, 39, 'A CUENTA PARA FLETE ', 22, 8, 1, '-5500.0000', '2022-10-12 10:09:49', '2022-10-12 10:09:49', 1),
(1090, 2, 310, NULL, NULL, '2022-10-12', NULL, 79, 'A CUENTA MATERIAL ', 22, 8, 1, '-1500.0000', '2022-10-12 10:10:18', '2022-10-12 10:10:18', 1),
(1091, 2, 311, NULL, NULL, '2022-10-10', NULL, 17, 'COMPRA DE METALES', 22, 8, 1, '-5891.0000', '2022-10-12 10:11:01', '2022-10-12 10:11:01', 1),
(1092, 2, 312, NULL, NULL, '2022-10-12', NULL, 44, 'COMPRA DE COBRE', 22, 3, 1, '-5000.0000', '2022-10-12 10:12:16', '2022-10-12 10:12:16', 1),
(1093, 3, 505, 10, 'DANIEL ', '2022-10-12', NULL, NULL, 'ADELANTO ', 22, 8, 1, '-300.0000', '2022-10-12 10:12:53', '2022-10-12 10:12:53', 1),
(1094, 3, 506, 12, 'DEISY', '2022-10-12', NULL, NULL, 'COMPRA DE AGUA', 22, 3, 1, '-10.0000', '2022-10-12 10:17:42', '2022-10-12 10:17:42', 1),
(1095, 3, 507, 10, 'DEISY', '2022-10-12', NULL, NULL, 'ADELANTO ', 22, 8, 1, '-10.0000', '2022-10-12 10:18:16', '2022-10-12 10:18:16', 1),
(1096, 2, 313, NULL, NULL, '2022-10-12', NULL, 102, 'COMPRA DE COBRE', 22, 3, 1, '-100000.0000', '2022-10-12 10:31:27', '2022-10-12 10:31:27', 1),
(1097, 2, 314, NULL, NULL, '2022-10-12', NULL, 32, 'COMPRA DE MATERIAL ', 22, 9, 1, '-4000.0000', '2022-10-12 11:03:18', '2022-10-12 11:03:18', 1),
(1098, 2, 315, NULL, NULL, '2022-10-12', NULL, 28, 'COMPRA DE METALES ', 22, 8, 1, '-30546.9000', '2022-10-12 11:05:19', '2022-10-12 11:05:19', 1),
(1099, 2, 316, NULL, NULL, '2022-10-12', NULL, 13, 'COMPRA DE COBRE ', 22, 3, 1, '-2197.5000', '2022-10-12 11:07:24', '2022-10-12 11:07:24', 1),
(1100, 2, 317, NULL, NULL, '2022-10-12', NULL, 32, 'COMPRA DE METALES ', 22, 9, 1, '-17255.6000', '2022-10-12 11:21:33', '2022-10-12 11:21:33', 1),
(1101, 1, 74, NULL, NULL, '2022-10-12', NULL, 43, 'PRESTAMO', 22, 8, 1, '50000.0000', '2022-10-12 11:27:22', '2022-10-12 11:27:22', 1),
(1102, 3, 508, 6, 'BEBETO', '2022-10-12', NULL, NULL, 'CUCHILLAS', 22, 8, 1, '-12.0000', '2022-10-12 11:41:59', '2022-10-12 11:41:59', 1),
(1103, 3, 515, 12, 'BEBETO', '2022-10-12', NULL, NULL, 'SPORADE', 22, 8, 1, '-12.5000', '2022-10-12 11:43:28', '2022-10-12 11:43:28', 1),
(1104, 3, 510, 8, 'BEBETO', '2022-10-12', NULL, NULL, 'REVISADOR ZINSA', 22, 8, 1, '-20.0000', '2022-10-12 11:44:04', '2022-10-12 11:44:04', 1),
(1105, 3, 511, 3, 'BEBETO ', '2022-10-12', NULL, NULL, 'LAVADO DE CARRO ', 22, 8, 1, '-40.0000', '2022-10-12 11:44:42', '2022-10-12 11:44:42', 1),
(1106, 3, 512, 8, 'BEBETO ', '2022-10-12', NULL, NULL, 'PAGO X APOYO A DARWIN ', 22, 8, 1, '-10.0000', '2022-10-12 11:45:39', '2022-10-12 11:45:39', 1),
(1107, 3, 513, 6, 'BEBETO ', '2022-10-12', NULL, NULL, '4 MASCARILLAS', 22, 8, 1, '-4.0000', '2022-10-12 11:46:30', '2022-10-12 11:46:30', 1),
(1108, 3, 514, 3, 'BEBETO ', '2022-10-12', NULL, NULL, 'LAVADO DE CAMIONETA ', 22, 8, 1, '-40.0000', '2022-10-12 11:48:48', '2022-10-12 11:48:48', 1),
(1109, 3, 515, 3, 'BEBETO ', '2022-10-12', NULL, NULL, 'COCHERA', 22, 8, 1, '-7.0000', '2022-10-12 11:49:13', '2022-10-12 11:49:13', 1),
(1110, 3, 516, 8, 'BEBETO', '2022-10-12', NULL, NULL, 'MONTACARGUISTA  ZINSA', 22, 8, 1, '-10.0000', '2022-10-12 11:50:15', '2022-10-12 11:50:15', 1),
(1111, 3, 517, 9, 'BEBETO ', '2022-10-12', NULL, NULL, 'PEAJES', 22, 8, 1, '-138.0000', '2022-10-12 11:54:30', '2022-10-12 11:54:30', 1),
(1112, 3, 518, 9, 'ROSALINO ', '2022-10-12', NULL, NULL, 'PEAJES ', 22, 9, 1, '-102.8000', '2022-10-12 12:10:52', '2022-10-12 12:10:52', 1),
(1113, 3, 519, 13, 'BALANZA', '2022-10-12', NULL, NULL, 'BALANZA', 22, 8, 1, '-10.0000', '2022-10-12 12:12:22', '2022-10-12 12:12:22', 1),
(1114, 3, 520, 3, 'ROSALINO', '2022-10-12', NULL, NULL, 'LAVADO DE CARRO', 22, 8, 1, '-70.0000', '2022-10-12 12:17:52', '2022-10-12 12:17:52', 1),
(1115, 3, 521, 12, 'ROSALINO', '2022-10-12', NULL, NULL, 'GASEOSA', 22, 8, 1, '-12.0000', '2022-10-12 12:18:21', '2022-10-12 12:18:21', 1),
(1116, 3, 522, 6, 'ROSALINO', '2022-10-12', NULL, NULL, 'CUCHILLA', 22, 8, 1, '-2.0000', '2022-10-12 12:19:09', '2022-10-12 12:19:09', 1),
(1117, 3, 523, 2, 'ROSALINO', '2022-10-12', NULL, NULL, 'ATV718', 22, 8, 1, '-600.0000', '2022-10-12 12:20:10', '2022-10-12 12:20:10', 1),
(1118, 2, 318, NULL, NULL, '2022-10-12', NULL, 43, 'GASTOS DE VIAJES', 22, 8, 1, '-650.0000', '2022-10-12 12:21:16', '2022-10-12 12:21:16', 1),
(1119, 3, 524, 10, 'ROSALINO', '2022-10-12', NULL, NULL, 'ADELANTO ', 22, 8, 1, '-272.9000', '2022-10-12 12:21:38', '2022-10-12 12:21:38', 1),
(1120, 3, 525, 1, 'BANCO', '2022-10-13', NULL, NULL, 'IMPUESTO ITF ', 1, 3, 1, '-1.6000', '2022-10-13 11:56:32', '2022-10-13 11:56:32', 1),
(1121, 1, 75, NULL, NULL, '2022-10-13', NULL, 43, 'LIBERACION OCTUBRE', 2, 3, 1, '109376.0000', '2022-10-13 11:57:59', '2022-10-13 11:57:59', 1),
(1122, 3, 526, 13, 'JAIME', '2022-10-12', NULL, NULL, 'CALIBRACION DE BALANZA', 2, 3, 1, '-70.0000', '2022-10-13 11:59:49', '2022-10-13 11:59:49', 1),
(1123, 3, 527, 14, 'ROGER LUQUE', '2022-10-13', NULL, NULL, 'ING - DECLARACION ', 2, 3, 1, '-500.0000', '2022-10-13 12:05:42', '2022-10-13 12:05:42', 1),
(1124, 2, 319, NULL, NULL, '2022-10-13', NULL, 40, 'ALEX RAMIREZ Y DANTE', 2, 3, 1, '-30000.0000', '2022-10-13 12:12:51', '2022-10-13 12:12:51', 1),
(1125, 2, 320, NULL, NULL, '2022-10-13', NULL, 41, 'WILIAN CHOQUEPUMA', 2, 3, 1, '-30000.0000', '2022-10-13 12:14:50', '2022-10-13 12:14:50', 1),
(1126, 3, 528, 1, 'BANCO', '2022-10-13', NULL, NULL, 'IMPUESTO ITF ', 2, 3, 1, '-8.4000', '2022-10-13 12:16:49', '2022-10-13 12:16:49', 1),
(1127, 2, 321, NULL, NULL, '2022-10-13', NULL, 32, 'VALERIANO SOLORZANO', 3, 3, 1, '-6700.0000', '2022-10-13 12:19:15', '2022-10-13 12:19:15', 1),
(1128, 2, 322, NULL, NULL, '2022-10-12', NULL, 61, 'SANCHEZ QUISPE JOSE', 3, 3, 1, '-10287.0000', '2022-10-13 12:21:48', '2022-10-13 12:21:48', 1),
(1129, 2, 323, NULL, NULL, '2022-10-13', NULL, 102, 'CAMILO GARCIO ', 3, 3, 1, '-11686.0000', '2022-10-13 12:37:16', '2022-10-13 12:37:16', 1),
(1130, 2, 324, NULL, NULL, '2022-10-13', NULL, 103, 'MARTINEZ SUARES MERY /ESPINOZA LEANDRO YUDY ', 3, 3, 1, '-28331.4000', '2022-10-13 12:41:58', '2022-10-13 12:41:58', 1),
(1131, 3, 529, 1, 'BANCO ', '2022-10-13', NULL, NULL, 'IMPUESTO ITF', 3, 3, 1, '-2.7500', '2022-10-13 12:46:30', '2022-10-13 12:46:30', 1),
(1132, 3, 530, 1, 'BANCO', '2022-10-13', NULL, NULL, 'IMPUESTO ITF ', 3, 3, 1, '-3.6000', '2022-10-13 12:47:14', '2022-10-13 12:47:14', 1),
(1133, 3, 531, 1, 'BANCO', '2022-10-13', NULL, NULL, 'IMPUESTO ITF ', 3, 3, 1, '-1.4300', '2022-10-13 12:47:51', '2022-10-13 12:47:51', 1),
(1134, 2, 325, NULL, NULL, '2022-10-13', NULL, 51, 'ALBERTO HUAMAN ', 4, 3, 1, '-30000.0000', '2022-10-13 12:49:15', '2022-10-13 12:49:15', 1),
(1135, 2, 326, NULL, NULL, '2022-10-13', NULL, 41, 'CRUZ CHAMBI ', 4, 3, 1, '-20000.0000', '2022-10-13 12:49:47', '2022-10-13 12:49:47', 1),
(1136, 2, 327, NULL, NULL, '2022-10-13', NULL, 14, 'COMPRA DE COBRE ', 4, 3, 1, '-19873.2000', '2022-10-13 12:50:25', '2022-10-13 12:50:25', 1),
(1137, 2, 329, NULL, NULL, '2022-10-13', NULL, 16, 'HURTADO CARRASCO MARIA ', 4, 3, 1, '-26690.0000', '2022-10-13 12:52:41', '2022-10-13 12:52:41', 1),
(1138, 3, 532, 1, 'BANCO', '2022-10-13', NULL, NULL, 'IMPUESTO ITF ', 4, 3, 1, '-1.3000', '2022-10-13 12:57:51', '2022-10-13 12:57:51', 1),
(1139, 3, 533, 1, 'BANCO', '2022-10-13', NULL, NULL, 'IMPUESTO ITF ', 4, 3, 1, '-18.5000', '2022-10-13 12:58:46', '2022-10-13 12:58:46', 1),
(1140, 2, 330, NULL, NULL, '2022-10-13', NULL, 49, 'AMERICA ALEJANDRA CUETO ', 5, 3, 1, '-7535.9000', '2022-10-13 13:00:34', '2022-10-13 13:00:34', 1),
(1141, 1, 76, NULL, NULL, '2022-10-13', NULL, 43, 'LIBERACION OCTUBRE ', 8, 3, 1, '85940.0000', '2022-10-13 13:05:38', '2022-10-13 13:05:38', 1),
(1142, 3, 534, 1, 'BANCO', '2022-10-13', NULL, NULL, 'IMPUESTO ITF ', 8, 3, 1, '-4.2500', '2022-10-13 13:06:01', '2022-10-13 13:06:01', 1),
(1143, 1, 77, NULL, NULL, '2022-10-13', NULL, 72, 'DEPOSITO ', 24, 3, 1, '10000.0000', '2022-10-13 13:08:55', '2022-10-13 13:08:55', 1),
(1144, 2, 331, NULL, NULL, '2022-10-13', NULL, 32, 'DEPOSITO EN CUENTA ', 22, 3, 1, '-4120.0000', '2022-10-13 13:10:03', '2022-10-13 13:10:03', 1),
(1145, 2, 332, NULL, NULL, '2022-10-14', NULL, 106, 'MARCO TORRES', 1, 3, 1, '-44851.0000', '2022-10-14 15:17:11', '2022-10-14 15:17:11', 1),
(1146, 2, 333, NULL, NULL, '2022-10-14', NULL, 43, 'ADELANTO DE PERMISOS', 1, 3, 1, '-1300.0000', '2022-10-14 15:19:08', '2022-10-14 15:19:08', 1),
(1147, 2, 334, NULL, NULL, '2022-10-13', NULL, 61, 'CCAMA QUISPE KEVIN', 1, 8, 1, '-2000.0000', '2022-10-14 15:23:29', '2022-10-14 15:23:29', 1),
(1148, 2, 335, NULL, NULL, '2022-10-12', NULL, 60, 'JIMMY PORTALANZAS', 1, 3, 1, '-20000.0000', '2022-10-14 15:24:21', '2022-10-14 15:24:21', 1),
(1149, 5, 17, NULL, 'DEISY', '2022-10-13', NULL, NULL, 'MOV INTERNO', 1, 3, 1, '-20000.0000', '2022-10-14 15:24:57', '2022-10-14 15:24:57', 1),
(1150, 5, 17, NULL, 'DEISY', '2022-10-13', NULL, NULL, 'MOV INTERNO', 6, 3, 1, '20000.0000', '2022-10-14 15:24:58', '2022-10-14 15:24:58', 1),
(1151, 3, 535, 1, 'BANCO ', '2022-10-13', NULL, NULL, 'IMPUESTO ITF ', 1, 3, 1, '-2.1000', '2022-10-14 15:25:40', '2022-10-14 15:25:40', 1),
(1152, 2, 336, NULL, NULL, '2022-10-14', NULL, 40, 'LIVIA/ALFREDO/SOLEDAD', 3, 3, 1, '-50000.0000', '2022-10-14 15:31:49', '2022-10-14 15:31:49', 1),
(1153, 3, 536, 1, 'BANCO', '2022-10-13', NULL, NULL, 'IMPUESTO ITF', 3, 3, 1, '-2.5000', '2022-10-14 15:32:38', '2022-10-14 15:32:38', 1),
(1154, 3, 537, 1, 'BANCO', '2022-10-13', NULL, NULL, 'IMPUESTO ITF ', 4, 3, 1, '-3.4500', '2022-10-14 15:34:16', '2022-10-14 15:34:16', 1),
(1155, 1, 79, NULL, NULL, '2022-10-14', NULL, 57, 'INTERBANSIN REFERENCIA', 5, 3, 1, '8367.9200', '2022-10-14 16:03:38', '2022-10-14 16:03:38', 1),
(1156, 3, 538, 1, 'BANCO', '2022-10-13', NULL, NULL, 'IMPUESTO ITF ', 5, 3, 1, '-0.3500', '2022-10-14 16:04:23', '2022-10-14 16:04:23', 1),
(1157, 5, 18, NULL, 'DEISY ', '2022-10-14', NULL, NULL, 'MOV INTERNO ', 9, 3, 1, '-75000.0000', '2022-10-14 16:48:30', '2022-10-14 16:48:30', 1),
(1158, 5, 18, NULL, 'DEISY ', '2022-10-14', NULL, NULL, 'MOV INTERNO ', 6, 3, 1, '75000.0000', '2022-10-14 16:48:30', '2022-10-14 16:48:30', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cdetalles`
--

CREATE TABLE `cdetalles` (
  `cde_id` bigint(20) NOT NULL,
  `cde_bie_id` bigint(20) DEFAULT NULL,
  `cde_ser_id` bigint(20) DEFAULT NULL,
  `cde_t6m_id` bigint(20) NOT NULL,
  `cde_com_id` bigint(20) NOT NULL,
  `cde_gta_id` bigint(20) NOT NULL,
  `cde_q` decimal(12,6) NOT NULL,
  `cde_vu` decimal(12,6) NOT NULL,
  `cde_igv` tinyint(1) NOT NULL,
  `cde_importe` decimal(24,12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cierremeses`
--

CREATE TABLE `cierremeses` (
  `cie_id` bigint(20) NOT NULL,
  `cie_periodo` date NOT NULL,
  `cie_alm_id` bigint(20) NOT NULL,
  `cie_bie_id` bigint(20) NOT NULL,
  `cie_qs` decimal(24,12) NOT NULL DEFAULT '0.000000000000',
  `cie_mts` decimal(24,12) NOT NULL DEFAULT '0.000000000000',
  `cie_qc` decimal(24,12) NOT NULL DEFAULT '0.000000000000',
  `cie_mtc` decimal(24,12) NOT NULL DEFAULT '0.000000000000',
  `cie_qv` decimal(24,12) NOT NULL DEFAULT '0.000000000000',
  `cie_mtv` decimal(24,12) NOT NULL DEFAULT '0.000000000000',
  `cie_start` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cierremeses`
--

INSERT INTO `cierremeses` (`cie_id`, `cie_periodo`, `cie_alm_id`, `cie_bie_id`, `cie_qs`, `cie_mts`, `cie_qc`, `cie_mtc`, `cie_qv`, `cie_mtv`, `cie_start`) VALUES
(1, '2022-08-12', 1, 4, '16479.700000000000', '429476.600000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', 1),
(2, '2022-08-12', 1, 5, '200.500000000000', '4866.190000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', 1),
(3, '2022-08-12', 1, 6, '29085.100000000000', '703580.850000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', 1),
(4, '2022-08-12', 1, 10, '146.000000000000', '1022.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', 1),
(5, '2022-08-12', 1, 11, '4437.100000000000', '68367.940000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', 1),
(6, '2022-08-12', 1, 15, '27.000000000000', '335.790000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', 1),
(7, '2022-08-12', 1, 16, '15.900000000000', '237.380000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', 1),
(8, '2022-08-12', 1, 13, '2076.500000000000', '44267.380000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', 1),
(9, '2022-08-12', 1, 17, '363.400000000000', '2117.950000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', 1),
(10, '2022-08-12', 1, 21, '8.000000000000', '494.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', 1),
(11, '2022-08-12', 1, 22, '680.400000000000', '2250.860000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', 1),
(12, '2022-08-12', 1, 23, '11877.500000000000', '56687.590000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', 1),
(13, '2022-08-12', 1, 24, '1256.200000000000', '6419.270000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', 1),
(14, '2022-08-12', 1, 30, '2707.500000000000', '17168.120000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', 1),
(15, '2022-08-12', 1, 33, '222.600000000000', '457.570000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', 1),
(16, '2022-08-12', 1, 34, '1080.500000000000', '2485.150000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', 1),
(17, '2022-08-12', 1, 25, '740.000000000000', '2948.450000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', 1),
(18, '2022-08-12', 1, 26, '2042.500000000000', '6470.850000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', 1),
(19, '2022-08-12', 1, 27, '51.300000000000', '361.740000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', 1),
(20, '2022-08-12', 1, 29, '9858.500000000000', '60661.720000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', 1),
(21, '2022-08-12', 1, 37, '3337.500000000000', '14217.330000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', 1),
(22, '2022-08-12', 1, 36, '600.500000000000', '4323.500000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', 1),
(23, '2022-08-12', 1, 38, '1536.500000000000', '1979.150000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', 1),
(24, '2022-08-12', 1, 35, '1066.500000000000', '3896.230000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colaboradores`
--

CREATE TABLE `colaboradores` (
  `col_id` bigint(20) NOT NULL,
  `col_gpe_id` bigint(20) NOT NULL,
  `col_gar_id` bigint(20) NOT NULL,
  `col_puesto` varchar(250) NOT NULL,
  `col_est_id` bigint(20) NOT NULL,
  `col_img` varchar(250) DEFAULT NULL,
  `col_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componentes`
--

CREATE TABLE `componentes` (
  `ico_id` bigint(20) NOT NULL,
  `ico_procesador` varchar(30) NOT NULL,
  `ico_so` varchar(30) NOT NULL,
  `ico_bios` varchar(30) NOT NULL,
  `ico_perifericos` varchar(200) DEFAULT NULL,
  `ico_programas` varchar(200) DEFAULT NULL,
  `ico_bie_mainboard` bigint(11) DEFAULT NULL,
  `ico_bie_monitor` bigint(11) DEFAULT NULL,
  `ico_bie_teclado` bigint(11) DEFAULT NULL,
  `ico_bie_mouse` bigint(11) DEFAULT NULL,
  `ico_bie_cpoder` bigint(11) DEFAULT NULL,
  `ico_bie_hdmi` bigint(11) DEFAULT NULL,
  `ico_bie_vga` bigint(11) DEFAULT NULL,
  `ico_bie_cotro` bigint(11) DEFAULT NULL,
  `ico_bie_ram` bigint(11) DEFAULT NULL,
  `ico_bie_ssd` bigint(11) DEFAULT NULL,
  `ico_bie_hhd` bigint(11) DEFAULT NULL,
  `ico_bie_fuentep` bigint(11) DEFAULT NULL,
  `ico_bie_tarjetag` bigint(11) DEFAULT NULL,
  `ico_bie_tarjetav` bigint(11) DEFAULT NULL,
  `ico_bie_tarjetar` bigint(11) DEFAULT NULL,
  `ico_bie_otroc` bigint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobantes`
--

CREATE TABLE `comprobantes` (
  `com_id` bigint(20) NOT NULL,
  `com_age_id` bigint(20) NOT NULL,
  `com_gt4_id` bigint(20) NOT NULL,
  `com_est_id` bigint(20) NOT NULL,
  `com_serie` varchar(4) NOT NULL,
  `com_numero` int(20) NOT NULL,
  `com_t12_id` bigint(20) NOT NULL,
  `com_t10_id` bigint(20) NOT NULL,
  `com_gtc_id` bigint(20) NOT NULL,
  `com_t1m_id` bigint(20) NOT NULL,
  `com_fechaE` date NOT NULL,
  `com_fechaR` date NOT NULL,
  `com_fechaV` date DEFAULT NULL,
  `com_subtotal` decimal(24,12) NOT NULL,
  `com_igv_id` json NOT NULL,
  `com_total` decimal(24,12) NOT NULL,
  `com_observaciones` text NOT NULL,
  `com_acr_id` bigint(20) DEFAULT NULL,
  `com_ncr_id` json DEFAULT NULL,
  `com_ticket` varchar(50) DEFAULT NULL,
  `com_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `com_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `com_cstatus` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuraciones`
--

CREATE TABLE `configuraciones` (
  `con_id` bigint(20) NOT NULL,
  `con_clave` varchar(15) NOT NULL,
  `con_valor` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE `cuentas` (
  `cue_id` bigint(20) NOT NULL,
  `cue_gem_id` bigint(20) DEFAULT NULL,
  `cue_nombre` varchar(200) NOT NULL,
  `cue_numero` int(11) DEFAULT NULL,
  `cue_gt4_id` bigint(20) DEFAULT '1',
  `cue_status` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`cue_id`, `cue_gem_id`, `cue_nombre`, `cue_numero`, `cue_gt4_id`, `cue_status`) VALUES
(1, NULL, 'YUMMIS', NULL, 1, 1),
(2, NULL, 'PLACYS', NULL, 1, 1),
(3, NULL, 'IPAYS GO', NULL, 1, 1),
(4, NULL, 'GRUP MERBLUN', NULL, 1, 1),
(5, NULL, 'DAMUN', NULL, 1, 1),
(6, NULL, 'CROSSCHIL', NULL, 1, 1),
(7, NULL, 'SOGRUP 53', NULL, 1, 1),
(8, NULL, 'DIPLOST', NULL, 1, 1),
(9, NULL, 'INDUSTRIAS GANS', NULL, 1, 1),
(10, NULL, 'ALIBUENO', NULL, 1, 1),
(11, NULL, 'LIFERLI', NULL, 1, 1),
(12, NULL, 'GRUPO 35', NULL, 1, 1),
(13, NULL, 'WORLD GOIN', NULL, 1, 1),
(14, NULL, 'GRUPO 29T', NULL, 1, 1),
(15, NULL, 'DOLARES', NULL, 2, 1),
(16, NULL, 'CORPDIERP', NULL, 1, 1),
(17, NULL, 'LIFERLI - DOLARES', NULL, 2, 1),
(19, NULL, 'WALL STREET', NULL, 1, 1),
(21, NULL, 'ORG VOÑICO', NULL, 1, 1),
(22, NULL, 'EFECTIVO', NULL, 1, 1),
(23, NULL, 'SCOTIACKBANK', NULL, 1, 1),
(24, NULL, 'BBVA', NULL, 1, 1),
(25, NULL, 'LLIAN LII', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `establecimientos`
--

CREATE TABLE `establecimientos` (
  `est_id` bigint(20) NOT NULL,
  `est_nombre` varchar(100) NOT NULL,
  `est_direccion` varchar(200) NOT NULL,
  `est_serie` varchar(2) NOT NULL,
  `est_logo` varchar(100) NOT NULL,
  `est_gdi_id` bigint(20) NOT NULL,
  `est_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `est_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `est_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `establecimientos`
--

INSERT INTO `establecimientos` (`est_id`, `est_nombre`, `est_direccion`, `est_serie`, `est_logo`, `est_gdi_id`, `est_created`, `est_updated`, `est_status`) VALUES
(1, 'Puente Piedra', 'Mz A, lote 12, tambo Inga, Ref. km 27 Panam. Norte', '01', 'cacel.png', 150125, '2022-07-25 12:30:55', '2022-07-25 12:30:55', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liquidez`
--

CREATE TABLE `liquidez` (
  `liq_id` bigint(20) NOT NULL,
  `liq_fecha` date NOT NULL,
  `liq_age_id` bigint(20) DEFAULT NULL,
  `liq_monto` decimal(24,4) DEFAULT NULL,
  `liq_status` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `liquidez`
--

INSERT INTO `liquidez` (`liq_id`, `liq_fecha`, `liq_age_id`, `liq_monto`, `liq_status`) VALUES
(1, '2022-09-01', 40, '218179.5500', 1),
(2, '2022-09-01', 51, '32323.2500', 1),
(3, '2022-09-01', 52, '64628.0000', 1),
(4, '2022-09-01', 54, '27803.5000', 1),
(5, '2022-09-01', 47, '13451.2000', 1),
(6, '2022-09-01', 55, '7600.0000', 1),
(7, '2022-09-01', 57, '48242.5300', 1),
(9, '2022-09-01', 41, '54367.0000', 1),
(10, '2022-09-01', 58, '16874.9500', 1),
(11, '2022-09-01', 45, '4000.0000', 1),
(12, '2022-09-01', 59, '12475.7500', 1),
(13, '2022-09-01', 60, '102500.0000', 1),
(14, '2022-09-01', 61, '46800.0000', 1),
(15, '2022-09-01', 39, '38035.0000', 1),
(16, '2022-09-01', 62, '705.5500', 1),
(17, '2022-09-01', 37, '5000.0000', 1),
(18, '2022-09-01', 65, '113327.2400', 1),
(20, '2022-09-01', 66, '396.7000', 1),
(21, '2022-09-01', 35, '172048.0700', 1),
(22, '2022-09-01', 4, '210362.2800', 1),
(23, '2022-09-01', 36, '-200000.0000', 1),
(24, '2022-09-01', 36, '-10144.9000', 1),
(25, '2022-09-01', 67, '459.0000', 1),
(26, '2022-09-01', 43, '-1446866.7700', 1),
(27, '2022-09-01', 18, '-311955.6600', 1),
(28, '2022-09-01', 68, '-69500.0000', 1),
(29, '2022-09-01', 40, '600.0000', 1),
(30, '2022-09-01', 69, '-4176.0000', 1),
(31, '2022-09-01', 70, '900.0000', 1),
(32, '2022-09-01', 71, '-6060.0000', 1),
(33, '2022-09-01', 16, '-34590.4500', 1),
(34, '2022-09-01', 72, '36427.0000', 1),
(35, '2022-09-01', 36, '-411.2000', 1),
(36, '2022-10-01', 1, NULL, 1),
(37, '2022-10-01', 3, NULL, 1),
(38, '2022-10-01', 4, '163023.6100', 1),
(39, '2022-10-01', 10, NULL, 1),
(40, '2022-10-01', 12, NULL, 1),
(41, '2022-10-01', 13, NULL, 1),
(42, '2022-10-01', 14, NULL, 1),
(43, '2022-10-01', 15, NULL, 1),
(44, '2022-10-01', 16, NULL, 1),
(45, '2022-10-01', 17, NULL, 1),
(46, '2022-10-01', 18, '-110383.9600', 1),
(47, '2022-10-01', 19, NULL, 1),
(48, '2022-10-01', 20, NULL, 1),
(49, '2022-10-01', 21, '6.0900', 1),
(50, '2022-10-01', 22, NULL, 1),
(51, '2022-10-01', 23, NULL, 1),
(52, '2022-10-01', 24, NULL, 1),
(53, '2022-10-01', 25, NULL, 1),
(54, '2022-10-01', 28, NULL, 1),
(55, '2022-10-01', 29, NULL, 1),
(56, '2022-10-01', 30, NULL, 1),
(57, '2022-10-01', 31, NULL, 1),
(58, '2022-10-01', 32, NULL, 1),
(59, '2022-10-01', 33, NULL, 1),
(60, '2022-10-01', 34, NULL, 1),
(61, '2022-10-01', 35, '0.0000', 1),
(62, '2022-10-01', 36, '-243510.0500', 1),
(63, '2022-10-01', 37, NULL, 1),
(64, '2022-10-01', 38, NULL, 1),
(65, '2022-10-01', 39, NULL, 1),
(66, '2022-10-01', 40, '-53721.2200', 1),
(67, '2022-10-01', 41, '0.0000', 1),
(68, '2022-10-01', 43, '-1427405.8700', 1),
(69, '2022-10-01', 44, NULL, 1),
(70, '2022-10-01', 45, '11863.5000', 1),
(71, '2022-10-01', 46, NULL, 1),
(72, '2022-10-01', 47, '24031.8500', 1),
(73, '2022-10-01', 48, '228.1500', 1),
(74, '2022-10-01', 49, '-0.0100', 1),
(75, '2022-10-01', 50, '-0.0100', 1),
(76, '2022-10-01', 51, '-1767.2500', 1),
(77, '2022-10-01', 52, '12689.2500', 1),
(78, '2022-10-01', 53, '-0.0100', 1),
(79, '2022-10-01', 54, '-16226.5000', 1),
(80, '2022-10-01', 55, NULL, 1),
(81, '2022-10-01', 57, '20286.4600', 1),
(82, '2022-10-01', 58, '6498.9500', 1),
(83, '2022-10-01', 59, '-5701.1000', 1),
(84, '2022-10-01', 60, '-0.0100', 1),
(85, '2022-10-01', 61, NULL, 1),
(86, '2022-10-01', 62, '705.5500', 1),
(87, '2022-10-01', 64, '0.3000', 1),
(88, '2022-10-01', 65, '82619.3400', 1),
(89, '2022-10-01', 66, '-279.8000', 1),
(90, '2022-10-01', 67, '676165.2100', 1),
(91, '2022-10-01', 68, '-69500.0000', 1),
(92, '2022-10-01', 69, '-4176.0000', 1),
(93, '2022-10-01', 70, '900.0000', 1),
(94, '2022-10-01', 71, '-6638.5000', 1),
(95, '2022-10-01', 72, '26427.0000', 1),
(96, '2022-10-01', 73, '8572.5000', 1),
(97, '2022-10-01', 74, '130000.0000', 1),
(98, '2022-10-01', 75, '-0.0100', 1),
(99, '2022-10-01', 76, '-600.0000', 1),
(100, '2022-10-01', 79, '36750.0000', 1),
(101, '2022-10-01', 80, NULL, 1),
(102, '2022-10-01', 81, NULL, 1),
(103, '2022-10-01', 82, '-223.0100', 1),
(104, '2022-10-01', 83, NULL, 1),
(105, '2022-10-01', 84, NULL, 1),
(106, '2022-10-01', 85, NULL, 1),
(107, '2022-10-01', 86, NULL, 1),
(108, '2022-10-01', 87, NULL, 1),
(109, '2022-10-01', 88, NULL, 1),
(110, '2022-10-01', 89, NULL, 1),
(111, '2022-10-01', 90, '27888.0000', 1),
(112, '2022-10-01', 92, NULL, 1),
(113, '2022-10-01', 98, '-561.0000', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdetalles`
--

CREATE TABLE `mdetalles` (
  `mde_id` bigint(20) NOT NULL,
  `mde_bie_id` bigint(20) NOT NULL,
  `mde_t6m_id` bigint(20) NOT NULL,
  `mde_gta_id` bigint(20) NOT NULL,
  `mde_mov_id` bigint(20) NOT NULL,
  `mde_q` decimal(12,6) NOT NULL,
  `mde_vu` decimal(12,6) NOT NULL,
  `mde_igv` tinyint(1) NOT NULL,
  `mde_importe` decimal(24,12) NOT NULL,
  `mde_detraccion` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mdetalles`
--

INSERT INTO `mdetalles` (`mde_id`, `mde_bie_id`, `mde_t6m_id`, `mde_gta_id`, `mde_mov_id`, `mde_q`, `mde_vu`, `mde_igv`, `mde_importe`, `mde_detraccion`) VALUES
(4, 24, 23, 9, 3, '2632.500000', '5.700000', 0, '15005.250000000000', 0),
(5, 6, 23, 9, 3, '548.000000', '24.000000', 0, '13152.000000000000', 0),
(6, 5, 23, 9, 3, '25.500000', '25.500000', 0, '650.250000000000', 0),
(7, 4, 23, 9, 3, '214.000000', '26.500000', 0, '5671.000000000000', 0),
(8, 22, 23, 9, 3, '950.000000', '3.600000', 0, '3420.000000000000', 0),
(9, 9, 23, 9, 4, '154.500000', '14.000000', 0, '2163.000000000000', 0),
(10, 6, 23, 9, 4, '167.000000', '24.300000', 0, '4058.100000000000', 0),
(11, 4, 23, 9, 4, '152.500000', '26.700000', 0, '4071.750000000000', 0),
(12, 5, 23, 9, 4, '140.000000', '25.700000', 0, '3598.000000000000', 0),
(13, 22, 23, 9, 4, '535.500000', '3.300000', 0, '1767.150000000000', 0),
(14, 11, 23, 9, 5, '87.500000', '16.300000', 0, '1426.250000000000', 0),
(15, 6, 23, 9, 5, '110.500000', '25.000000', 0, '2762.500000000000', 0),
(16, 4, 23, 9, 5, '492.000000', '27.000000', 0, '13284.000000000000', 0),
(17, 4, 23, 1, 6, '2757.000000', '26.000000', 0, '71682.000000000000', 15),
(18, 4, 23, 9, 7, '561.200000', '26.700000', 0, '14984.040000000000', 0),
(19, 6, 23, 9, 7, '24.800000', '24.300000', 0, '602.640000000000', 0),
(20, 4, 23, 9, 8, '707.200000', '26.700000', 0, '18882.240000000000', 0),
(21, 5, 23, 9, 8, '42.200000', '25.700000', 0, '1084.540000000000', 0),
(22, 6, 23, 9, 8, '63.900000', '24.300000', 0, '1552.770000000000', 0),
(23, 33, 23, 9, 9, '100.000000', '2.000000', 0, '200.000000000000', 0),
(24, 23, 23, 9, 9, '114.500000', '4.500000', 0, '515.250000000000', 0),
(25, 6, 23, 9, 9, '159.500000', '24.300000', 0, '3875.850000000000', 0),
(26, 5, 23, 9, 9, '16.000000', '24.700000', 0, '395.200000000000', 0),
(27, 38, 23, 9, 9, '8.500000', '0.500000', 0, '4.250000000000', 0),
(28, 37, 23, 9, 9, '13.000000', '3.500000', 0, '45.500000000000', 0),
(29, 27, 23, 9, 9, '38.500000', '7.000000', 0, '269.500000000000', 0),
(30, 11, 23, 9, 9, '103.000000', '16.000000', 0, '1648.000000000000', 0),
(31, 31, 23, 9, 9, '687.000000', '5.000000', 0, '3435.000000000000', 0),
(32, 29, 23, 9, 9, '127.000000', '5.000000', 0, '635.000000000000', 0),
(33, 25, 23, 9, 9, '108.000000', '3.500000', 0, '378.000000000000', 0),
(34, 19, 23, 9, 10, '3260.000000', '4.700000', 0, '15322.000000000000', 0),
(35, 11, 23, 9, 11, '1317.000000', '16.000000', 0, '21072.000000000000', 0),
(36, 5, 23, 9, 11, '340.500000', '26.000000', 0, '8853.000000000000', 0),
(37, 4, 23, 9, 11, '1197.000000', '27.000000', 0, '32319.000000000000', 0),
(38, 4, 23, 9, 12, '202.600000', '26.700000', 0, '5409.420000000000', 0),
(39, 24, 23, 9, 13, '4120.000000', '5.700000', 0, '23484.000000000000', 0),
(40, 19, 23, 9, 14, '13070.000000', '4.800000', 0, '62736.000000000000', 0),
(41, 6, 23, 9, 15, '563.100000', '24.300000', 0, '13683.330000000000', 0),
(42, 4, 23, 9, 16, '1876.300000', '26.700000', 0, '50097.210000000000', 0),
(43, 6, 23, 9, 17, '187.400000', '24.300000', 0, '4553.820000000000', 0),
(44, 5, 23, 9, 17, '267.000000', '24.700000', 0, '6594.900000000000', 0),
(45, 4, 23, 9, 17, '874.800000', '26.700000', 0, '23357.160000000000', 0),
(46, 6, 23, 9, 18, '319.000000', '24.300000', 0, '7751.700000000000', 0),
(47, 6, 23, 9, 19, '136.600000', '24.300000', 0, '3319.380000000000', 0),
(48, 4, 23, 9, 19, '164.800000', '26.700000', 0, '4400.160000000000', 0),
(49, 4, 23, 9, 20, '1977.400000', '26.800000', 0, '52994.320000000000', 0),
(50, 6, 23, 9, 20, '289.400000', '24.400000', 0, '7061.360000000000', 0),
(51, 4, 23, 1, 21, '5418.500000', '28.500000', 0, '154427.250000000000', 15),
(52, 4, 23, 9, 22, '1130.000000', '26.700000', 0, '30171.000000000000', 0),
(53, 4, 23, 1, 23, '9632.500000', '26.300000', 0, '253334.750000000000', 15),
(54, 5, 23, 1, 24, '1330.500000', '25.000000', 0, '33262.500000000000', 0),
(55, 5, 23, 1, 25, '1201.000000', '27.000000', 0, '32427.000000000000', 0),
(56, 4, 23, 9, 26, '220.500000', '27.700000', 0, '6107.850000000000', 0),
(57, 5, 23, 9, 26, '9.500000', '26.700000', 0, '253.650000000000', 0),
(58, 6, 23, 9, 26, '245.800000', '25.000000', 0, '6145.000000000000', 0),
(59, 24, 23, 9, 27, '87.200000', '6.000000', 0, '523.200000000000', 0),
(60, 4, 23, 9, 27, '257.800000', '27.700000', 0, '7141.060000000000', 0),
(61, 4, 23, 9, 28, '254.000000', '27.700000', 0, '7035.800000000000', 0),
(62, 4, 58, 9, 29, '581.000000', '27.700000', 0, '16093.700000000000', 0),
(63, 5, 23, 9, 29, '107.200000', '26.700000', 0, '2862.240000000000', 0),
(64, 5, 23, 9, 30, '83.200000', '27.000000', 0, '2246.400000000000', 0),
(65, 4, 23, 9, 30, '453.800000', '28.000000', 0, '12706.400000000000', 0),
(66, 18, 23, 1, 31, '1820.000000', '8.000000', 0, '14560.000000000000', 15),
(67, 5, 23, 1, 31, '7032.800000', '25.900000', 0, '182149.520000000000', 15),
(68, 6, 23, 9, 32, '384.500000', '25.500000', 0, '9804.750000000000', 0),
(69, 6, 23, 9, 33, '290.500000', '25.500000', 0, '7407.750000000000', 0),
(70, 4, 23, 9, 34, '1517.500000', '28.500000', 0, '43248.750000000000', 0),
(71, 5, 23, 9, 34, '420.000000', '27.500000', 0, '11550.000000000000', 0),
(72, 8, 23, 9, 34, '271.000000', '26.500000', 0, '7181.500000000000', 0),
(73, 19, 23, 9, 35, '15580.000000', '4.750000', 0, '74005.000000000000', 0),
(74, 6, 23, 9, 36, '184.000000', '25.500000', 0, '4692.000000000000', 0),
(75, 5, 23, 9, 36, '223.000000', '27.000000', 0, '6021.000000000000', 0),
(76, 6, 23, 9, 36, '423.500000', '28.500000', 0, '12069.750000000000', 0),
(77, 23, 23, 9, 36, '979.400000', '4.800000', 0, '4701.120000000000', 0),
(78, 44, 23, 9, 37, '15.500000', '2.200000', 0, '34.100000000000', 0),
(79, 22, 23, 9, 37, '737.000000', '3.300000', 0, '2432.100000000000', 0),
(80, 6, 23, 9, 37, '246.500000', '25.500000', 0, '6285.750000000000', 0),
(81, 5, 23, 9, 37, '148.000000', '27.700000', 0, '4099.600000000000', 0),
(82, 4, 23, 9, 37, '612.500000', '28.700000', 0, '17578.750000000000', 0),
(83, 35, 23, 9, 37, '29.000000', '4.000000', 0, '116.000000000000', 0),
(84, 11, 23, 9, 37, '175.500000', '17.000000', 0, '2983.500000000000', 0),
(85, 12, 23, 9, 37, '35.000000', '15.500000', 0, '542.500000000000', 0),
(86, 24, 23, 9, 37, '753.000000', '6.000000', 0, '4518.000000000000', 0),
(87, 21, 58, 9, 37, '438.000000', '65.000000', 0, '28470.000000000000', 0),
(88, 21, 58, 9, 37, '34.000000', '50.000000', 0, '1700.000000000000', 0),
(89, 21, 58, 9, 37, '39.000000', '95.000000', 0, '3705.000000000000', 0),
(90, 41, 23, 9, 38, '997.000000', '2.600000', 0, '2592.200000000000', 0),
(91, 25, 23, 9, 38, '722.000000', '3.500000', 0, '2527.000000000000', 0),
(92, 23, 23, 9, 38, '1265.500000', '4.800000', 0, '6074.400000000000', 0),
(93, 16, 23, 9, 38, '394.000000', '15.000000', 0, '5910.000000000000', 0),
(94, 6, 23, 9, 38, '886.000000', '25.000000', 0, '22150.000000000000', 0),
(95, 12, 23, 9, 38, '67.500000', '15.600000', 0, '1053.000000000000', 0),
(96, 5, 23, 9, 38, '461.000000', '27.000000', 0, '12447.000000000000', 0),
(97, 4, 23, 9, 38, '2118.500000', '28.000000', 0, '59318.000000000000', 0),
(98, 11, 23, 9, 38, '821.500000', '16.600000', 0, '13636.900000000000', 0),
(99, 15, 23, 9, 38, '10.500000', '13.000000', 0, '136.500000000000', 0),
(100, 35, 23, 9, 38, '34.500000', '4.000000', 0, '138.000000000000', 0),
(101, 33, 23, 9, 38, '81.500000', '2.200000', 0, '179.300000000000', 0),
(102, 26, 23, 9, 38, '30.000000', '3.200000', 0, '96.000000000000', 0),
(103, 22, 23, 9, 38, '111.000000', '3.300000', 0, '366.300000000000', 0),
(104, 19, 23, 9, 38, '17959.500000', '4.750000', 0, '85307.630000000000', 0),
(105, 4, 23, 9, 1, '16479.700000', '26.060948', 0, '429476.600000000000', 0),
(106, 5, 23, 9, 1, '200.500000', '24.270274', 0, '4866.190000000000', 0),
(107, 6, 23, 9, 1, '29085.100000', '24.190422', 0, '703580.850000000000', 0),
(108, 10, 23, 9, 1, '146.000000', '7.000000', 0, '1022.000000000000', 0),
(109, 11, 23, 9, 1, '4437.100000', '15.408249', 0, '68367.940000000000', 0),
(110, 15, 23, 9, 1, '27.000000', '12.436667', 0, '335.790000000000', 0),
(111, 16, 23, 9, 1, '15.900000', '14.929560', 0, '237.380000000000', 0),
(112, 13, 23, 9, 1, '2076.500000', '21.318266', 0, '44267.380000000000', 0),
(113, 17, 23, 9, 1, '363.400000', '5.828151', 0, '2117.950000000000', 0),
(114, 21, 58, 9, 1, '8.000000', '61.750000', 0, '494.000000000000', 0),
(115, 22, 23, 9, 1, '680.400000', '3.308142', 0, '2250.860000000000', 0),
(116, 23, 23, 9, 1, '11877.500000', '4.772687', 0, '56687.590000000000', 0),
(117, 24, 23, 9, 1, '1256.200000', '5.110070', 0, '6419.270000000000', 0),
(118, 30, 23, 9, 1, '2707.500000', '6.340949', 0, '17168.120000000000', 0),
(119, 33, 23, 9, 1, '222.600000', '2.055571', 0, '457.570000000000', 0),
(120, 34, 23, 9, 1, '1080.500000', '2.300000', 0, '2485.150000000000', 0),
(121, 25, 23, 9, 1, '740.000000', '3.984392', 0, '2948.450000000000', 0),
(122, 26, 23, 9, 1, '2042.500000', '3.168103', 0, '6470.850000000000', 0),
(123, 27, 23, 9, 1, '51.300000', '7.051462', 0, '361.740000000000', 0),
(124, 29, 23, 9, 1, '9858.500000', '6.153240', 0, '60661.720000000000', 0),
(125, 37, 23, 9, 1, '3337.500000', '4.259874', 0, '14217.330000000000', 0),
(126, 36, 23, 9, 1, '600.500000', '7.199833', 0, '4323.500000000000', 0),
(127, 38, 23, 9, 1, '1536.500000', '1.288090', 0, '1979.150000000000', 0),
(128, 35, 23, 9, 1, '1066.500000', '3.653286', 0, '3896.230000000000', 0),
(129, 24, 23, 9, 39, '1630.000000', '6.000000', 0, '9780.000000000000', 0),
(130, 6, 23, 9, 39, '214.000000', '24.500000', 0, '5243.000000000000', 0),
(131, 4, 23, 9, 39, '29.200000', '27.500000', 0, '803.000000000000', 0),
(132, 16, 23, 9, 39, '105.700000', '15.500000', 0, '1638.350000000000', 0),
(133, 4, 23, 9, 40, '135.000000', '28.000000', 0, '3780.000000000000', 0),
(134, 5, 23, 9, 40, '53.000000', '26.500000', 0, '1404.500000000000', 0),
(135, 19, 23, 9, 41, '13490.000000', '4.600000', 0, '62054.000000000000', 0),
(136, 4, 23, 9, 42, '5094.000000', '28.450000', 0, '144924.320000000000', 0),
(137, 5, 23, 9, 42, '2563.500000', '27.000000', 0, '69214.500000000000', 0),
(138, 6, 23, 9, 42, '6677.350000', '24.760000', 0, '165363.960000000000', 0),
(139, 10, 23, 9, 42, '24.000000', '7.000000', 0, '168.000000000000', 0),
(140, 11, 23, 9, 42, '4834.000000', '16.500000', 0, '79761.000000000000', 0),
(141, 8, 23, 9, 42, '5118.000000', '27.000000', 0, '138186.000000000000', 0),
(142, 12, 23, 9, 42, '2770.000000', '16.500000', 0, '45705.000000000000', 0),
(143, 15, 23, 9, 42, '38.000000', '13.390000', 0, '508.970000000000', 0),
(144, 16, 23, 9, 42, '1298.500000', '15.050000', 0, '19543.250000000000', 0),
(145, 13, 23, 9, 42, '63.500000', '18.090000', 0, '1148.610000000000', 0),
(146, 18, 23, 9, 42, '4648.400000', '7.980000', 0, '37092.110000000000', 0),
(147, 19, 23, 9, 42, '9573.500000', '4.780000', 0, '45775.030000000000', 0),
(148, 23, 23, 9, 42, '19815.500000', '4.760000', 0, '94363.440000000000', 0),
(149, 24, 23, 9, 42, '13834.900000', '5.780000', 0, '80001.040000000000', 0),
(150, 31, 23, 9, 42, '3661.500000', '5.510000', 0, '20167.120000000000', 0),
(151, 26, 23, 9, 42, '965.500000', '3.180000', 0, '3070.980000000000', 0),
(152, 25, 23, 9, 42, '3123.500000', '3.760000', 0, '11751.950000000000', 0),
(153, 27, 23, 9, 42, '20.000000', '101.500000', 0, '2030.060000000000', 0),
(154, 29, 23, 9, 42, '2354.500000', '5.910000', 0, '13912.280000000000', 0),
(155, 37, 23, 9, 42, '2068.500000', '4.050000', 0, '8374.680000000000', 0),
(156, 36, 23, 9, 42, '628.500000', '7.100000', 0, '4463.500000000000', 0),
(157, 38, 23, 9, 42, '462.000000', '1.000000', 0, '462.000000000000', 0),
(158, 35, 23, 9, 42, '695.500000', '6.480000', 0, '4504.870000000000', 0),
(161, 24, 23, 9, 45, '155.000000', '6.000000', 0, '930.000000000000', 0),
(162, 23, 23, 9, 45, '746.000000', '4.800000', 0, '3580.800000000000', 0),
(165, 6, 23, 9, 47, '66.000000', '24.500000', 0, '1617.000000000000', 0),
(166, 16, 23, 9, 47, '1.600000', '15.500000', 0, '24.800000000000', 0),
(167, 15, 23, 9, 47, '1.400000', '12.000000', 0, '16.800000000000', 0),
(168, 11, 23, 9, 47, '90.600000', '16.500000', 0, '1494.900000000000', 0),
(169, 5, 23, 9, 47, '84.000000', '26.500000', 0, '2226.000000000000', 0),
(170, 4, 23, 9, 47, '117.200000', '27.500000', 0, '3223.000000000000', 0),
(171, 19, 23, 1, 43, '9590.000000', '4.500000', 0, '43155.000000000000', 15),
(176, 35, 23, 9, 46, '695.500000', '4.700000', 0, '3268.850000000000', 0),
(177, 37, 23, 9, 46, '1434.500000', '4.400000', 0, '6311.800000000000', 0),
(178, 26, 23, 9, 49, '204.500000', '3.200000', 0, '654.400000000000', 0),
(179, 27, 23, 9, 49, '4.000000', '7.000000', 0, '28.000000000000', 0),
(180, 37, 23, 9, 49, '11.000000', '3.800000', 0, '41.800000000000', 0),
(181, 30, 23, 9, 49, '18.500000', '5.800000', 0, '107.300000000000', 0),
(182, 41, 23, 9, 49, '7.000000', '2.500000', 0, '17.500000000000', 0),
(183, 16, 23, 9, 49, '235.000000', '15.500000', 0, '3642.500000000000', 0),
(184, 19, 23, 9, 49, '7317.000000', '4.600000', 0, '33658.200000000000', 0),
(185, 33, 23, 9, 49, '235.000000', '2.200000', 0, '517.000000000000', 0),
(186, 23, 23, 9, 49, '932.000000', '4.800000', 0, '4473.600000000000', 0),
(187, 11, 23, 9, 49, '242.500000', '16.500000', 0, '4001.250000000000', 0),
(188, 12, 23, 9, 49, '32.000000', '15.000000', 0, '480.000000000000', 0),
(189, 5, 23, 9, 49, '232.500000', '26.500000', 0, '6161.250000000000', 0),
(190, 6, 23, 9, 49, '140.000000', '24.500000', 0, '3430.000000000000', 0),
(191, 29, 23, 9, 49, '24.500000', '5.000000', 0, '122.500000000000', 0),
(192, 35, 23, 9, 49, '24.500000', '4.000000', 0, '98.000000000000', 0),
(193, 6, 23, 9, 49, '347.500000', '24.500000', 0, '8513.750000000000', 0),
(194, 8, 23, 9, 49, '219.500000', '25.000000', 0, '5487.500000000000', 0),
(195, 31, 23, 9, 48, '449.500000', '6.000000', 0, '2697.000000000000', 0),
(196, 31, 23, 9, 48, '251.000000', '5.500000', 0, '1380.500000000000', 0),
(197, 33, 23, 9, 48, '294.500000', '4.000000', 0, '1178.000000000000', 0),
(198, 31, 23, 9, 48, '414.500000', '5.700000', 0, '2362.650000000000', 0),
(200, 4, 23, 1, 50, '5093.000000', '27.500000', 0, '140057.500000000000', 15),
(202, 33, 23, 9, 51, '49.500000', '2.200000', 0, '108.900000000000', 0),
(203, 11, 23, 9, 51, '64.500000', '16.000000', 0, '1032.000000000000', 0),
(204, 24, 23, 9, 51, '36.000000', '6.000000', 0, '216.000000000000', 0),
(205, 28, 23, 9, 51, '71.500000', '6.000000', 0, '429.000000000000', 0),
(206, 25, 23, 9, 51, '14.500000', '3.500000', 0, '50.750000000000', 0),
(207, 23, 23, 9, 51, '226.500000', '4.700000', 0, '1064.550000000000', 0),
(208, 27, 23, 9, 51, '31.500000', '7.000000', 0, '220.500000000000', 0),
(209, 15, 23, 9, 51, '24.500000', '13.000000', 0, '318.500000000000', 0),
(210, 23, 23, 9, 52, '460.000000', '4.800000', 0, '2208.000000000000', 0),
(211, 6, 23, 9, 52, '11.100000', '24.500000', 0, '271.950000000000', 0),
(213, 24, 23, 9, 53, '1069.000000', '6.000000', 0, '6414.000000000000', 0),
(214, 19, 23, 9, 53, '24102.500000', '4.600000', 0, '110871.500000000000', 0),
(215, 33, 23, 9, 53, '556.000000', '2.200000', 0, '1223.200000000000', 0),
(216, 35, 23, 9, 53, '57.000000', '4.000000', 0, '228.000000000000', 0),
(217, 22, 23, 9, 53, '160.000000', '3.000000', 0, '480.000000000000', 0),
(218, 26, 23, 9, 53, '190.000000', '3.200000', 0, '608.000000000000', 0),
(219, 23, 23, 9, 54, '148.000000', '4.800000', 0, '710.400000000000', 0),
(220, 33, 23, 9, 55, '138.500000', '2.200000', 0, '304.700000000000', 0),
(221, 25, 23, 9, 55, '71.000000', '3.500000', 0, '248.500000000000', 0),
(222, 26, 23, 9, 55, '51.500000', '3.200000', 0, '164.800000000000', 0),
(223, 29, 23, 9, 55, '155.000000', '5.000000', 0, '775.000000000000', 0),
(224, 24, 23, 9, 55, '397.000000', '6.000000', 0, '2382.000000000000', 0),
(225, 15, 23, 9, 55, '16.000000', '13.000000', 0, '208.000000000000', 0),
(226, 36, 23, 9, 55, '51.000000', '6.000000', 0, '306.000000000000', 0),
(227, 27, 23, 9, 55, '39.000000', '7.000000', 0, '273.000000000000', 0),
(228, 35, 23, 9, 55, '6.500000', '4.000000', 0, '26.000000000000', 0),
(229, 25, 23, 9, 56, '305.000000', '4.000000', 0, '1220.000000000000', 0),
(230, 28, 23, 9, 56, '865.000000', '6.000000', 0, '5190.000000000000', 0),
(231, 29, 23, 9, 56, '5.000000', '5.000000', 0, '25.000000000000', 0),
(232, 23, 23, 9, 56, '5479.500000', '4.800000', 0, '26301.600000000000', 0),
(233, 33, 23, 9, 56, '803.500000', '2.200000', 0, '1767.700000000000', 0),
(234, 24, 23, 9, 56, '257.000000', '6.000000', 0, '1542.000000000000', 0),
(235, 30, 23, 9, 56, '366.500000', '5.800000', 0, '2125.700000000000', 0),
(236, 32, 23, 9, 56, '34.500000', '5.000000', 0, '172.500000000000', 0),
(237, 4, 23, 9, 56, '544.000000', '28.000000', 0, '15232.000000000000', 0),
(238, 5, 23, 9, 56, '162.500000', '27.000000', 0, '4387.500000000000', 0),
(239, 6, 23, 9, 56, '111.000000', '25.000000', 0, '2775.000000000000', 0),
(240, 7, 23, 9, 56, '21.000000', '26.000000', 0, '546.000000000000', 0),
(241, 37, 23, 9, 56, '165.500000', '3.800000', 0, '628.900000000000', 0),
(242, 38, 23, 9, 56, '35.500000', '0.700000', 0, '24.850000000000', 0),
(243, 19, 23, 9, 57, '4740.000000', '4.600000', 0, '21804.000000000000', 0),
(244, 19, 23, 1, 58, '9970.000000', '4.500000', 0, '44865.000000000000', 15),
(245, 6, 23, 9, 51, '103.500000', '24.000000', 0, '2484.000000000000', 0),
(246, 4, 23, 9, 51, '15.000000', '27.500000', 0, '412.500000000000', 0),
(247, 4, 23, 9, 59, '308.500000', '28.000000', 0, '8638.000000000000', 0),
(248, 6, 23, 9, 59, '97.500000', '24.500000', 0, '2388.750000000000', 0),
(249, 27, 23, 9, 59, '51.000000', '7.000000', 0, '357.000000000000', 0),
(250, 33, 23, 9, 59, '420.000000', '2.200000', 0, '924.000000000000', 0),
(251, 23, 23, 9, 59, '1882.000000', '4.800000', 0, '9033.600000000000', 0),
(252, 23, 23, 9, 60, '482.500000', '4.800000', 0, '2316.000000000000', 0),
(253, 19, 23, 9, 61, '34310.000000', '4.650000', 0, '159541.500000000000', 0),
(254, 4, 23, 9, 62, '322.700000', '28.000000', 0, '9035.600000000000', 0),
(255, 5, 23, 9, 62, '112.500000', '26.500000', 0, '2981.250000000000', 0),
(256, 6, 23, 9, 62, '106.500000', '24.500000', 0, '2609.250000000000', 0),
(257, 4, 23, 9, 63, '208.500000', '28.000000', 0, '5838.000000000000', 0),
(258, 6, 23, 9, 63, '142.000000', '24.500000', 0, '3479.000000000000', 0),
(259, 5, 23, 9, 63, '72.800000', '26.500000', 0, '1929.200000000000', 0),
(260, 44, 23, 9, 64, '278.500000', '2.000000', 0, '557.000000000000', 0),
(263, 24, 23, 9, 64, '1653.000000', '6.100000', 0, '10083.300000000000', 0),
(264, 23, 23, 9, 64, '14.200000', '4.800000', 0, '68.160000000000', 0),
(270, 6, 23, 9, 66, '3.000000', '24.500000', 0, '73.500000000000', 0),
(271, 11, 23, 9, 66, '37.500000', '16.000000', 0, '600.000000000000', 0),
(272, 19, 23, 1, 67, '9640.000000', '4.500000', 0, '43380.000000000000', 15),
(273, 19, 23, 1, 68, '16570.000000', '4.500000', 0, '74565.000000000000', 15),
(274, 5, 23, 1, 69, '3030.000000', '27.500000', 0, '83325.000000000000', 15),
(275, 25, 23, 9, 65, '1130.000000', '4.800000', 0, '5424.000000000000', 0),
(276, 19, 23, 1, 70, '34340.000000', '4.600000', 0, '157964.000000000000', 15),
(277, 27, 23, 9, 71, '364.000000', '8.300000', 0, '3021.200000000000', 0),
(278, 15, 23, 9, 71, '41.500000', '16.500000', 0, '684.750000000000', 0),
(279, 29, 23, 9, 72, '637.000000', '5.000000', 0, '3185.000000000000', 0),
(280, 23, 23, 9, 72, '1465.500000', '4.600000', 0, '6741.300000000000', 0),
(281, 33, 23, 9, 72, '564.000000', '2.500000', 0, '1410.000000000000', 0),
(282, 24, 23, 9, 72, '351.500000', '5.600000', 0, '1968.400000000000', 0),
(283, 35, 23, 9, 72, '81.500000', '4.000000', 0, '326.000000000000', 0),
(284, 26, 23, 9, 72, '89.500000', '3.200000', 0, '286.400000000000', 0),
(285, 25, 23, 9, 72, '28.000000', '3.200000', 0, '89.600000000000', 0),
(286, 22, 23, 9, 72, '942.500000', '3.000000', 0, '2827.500000000000', 0),
(287, 40, 23, 9, 72, '5681.500000', '1.100000', 0, '6249.650000000000', 0),
(288, 30, 23, 9, 72, '123.500000', '5.700000', 0, '703.950000000000', 0),
(289, 6, 23, 9, 72, '371.000000', '24.500000', 0, '9089.500000000000', 0),
(290, 27, 23, 9, 72, '79.000000', '6.800000', 0, '537.200000000000', 0),
(291, 11, 23, 9, 72, '150.500000', '16.500000', 0, '2483.250000000000', 0),
(292, 12, 23, 9, 72, '18.500000', '15.500000', 0, '286.750000000000', 0),
(293, 4, 23, 9, 72, '258.000000', '27.500000', 0, '7095.000000000000', 0),
(294, 5, 23, 9, 72, '72.500000', '26.500000', 0, '1921.250000000000', 0),
(295, 31, 23, 9, 72, '6.500000', '4.500000', 0, '29.250000000000', 0),
(296, 21, 58, 9, 72, '161.000000', '60.000000', 0, '9660.000000000000', 0),
(298, 16, 23, 9, 72, '63.000000', '15.500000', 0, '976.500000000000', 0),
(299, 21, 58, 9, 72, '9.000000', '50.000000', 0, '450.000000000000', 0),
(300, 4, 23, 9, 73, '642.500000', '28.000000', 0, '17990.000000000000', 0),
(301, 5, 23, 9, 73, '32.800000', '26.500000', 0, '869.200000000000', 0),
(302, 6, 23, 9, 73, '67.800000', '24.500000', 0, '1661.100000000000', 0),
(303, 5, 23, 9, 74, '1000.000000', '27.000000', 0, '27000.000000000000', 0),
(304, 4, 23, 9, 75, '892.000000', '28.500000', 0, '25422.000000000000', 0),
(305, 6, 23, 9, 75, '82.000000', '25.000000', 0, '2050.000000000000', 0),
(306, 21, 58, 9, 75, '8.000000', '68.000000', 0, '544.000000000000', 0),
(307, 21, 58, 9, 75, '6.000000', '58.000000', 0, '348.000000000000', 0),
(308, 21, 58, 9, 75, '1.000000', '48.000000', 0, '48.000000000000', 0),
(309, 23, 23, 9, 76, '22920.000000', '5.200000', 0, '119184.000000000000', 0),
(310, 35, 23, 1, 49, '39.000000', '4.000000', 0, '156.000000000000', 0),
(311, 6, 23, 9, 77, '2795.000000', '25.500000', 0, '71272.500000000000', 0),
(312, 16, 23, 9, 78, '260.500000', '15.500000', 0, '4037.750000000000', 0),
(313, 4, 23, 9, 78, '244.000000', '28.500000', 0, '6954.000000000000', 0),
(314, 5, 23, 9, 78, '36.000000', '27.500000', 0, '990.000000000000', 0),
(315, 6, 23, 9, 78, '580.000000', '25.000000', 0, '14500.000000000000', 0),
(316, 23, 23, 9, 79, '5488.000000', '4.800000', 0, '26342.400000000000', 0),
(317, 4, 23, 9, 79, '3942.000000', '29.000000', 0, '114318.000000000000', 0),
(318, 6, 23, 9, 79, '1944.500000', '26.000000', 0, '50557.000000000000', 0),
(319, 27, 23, 9, 79, '411.000000', '7.500000', 0, '3082.500000000000', 0),
(320, 26, 23, 9, 79, '40.000000', '3.200000', 0, '128.000000000000', 0),
(321, 5, 23, 9, 79, '1315.000000', '28.000000', 0, '36820.000000000000', 0),
(322, 11, 23, 9, 79, '668.000000', '17.200000', 0, '11489.600000000000', 0),
(323, 16, 23, 9, 79, '98.500000', '15.700000', 0, '1546.450000000000', 0),
(324, 8, 23, 9, 79, '26.000000', '27.000000', 0, '702.000000000000', 0),
(325, 15, 23, 9, 79, '22.500000', '13.000000', 0, '292.500000000000', 0),
(326, 33, 23, 9, 79, '65.500000', '2.200000', 0, '144.100000000000', 0),
(328, 45, 23, 9, 72, '1650.000000', '2.500000', 0, '4125.000000000000', 0),
(329, 45, 23, 9, 80, '1650.000000', '2.500000', 0, '4125.000000000000', 0),
(330, 4, 23, 9, 81, '471.800000', '28.700000', 0, '13540.660000000000', 0),
(331, 6, 23, 9, 81, '116.100000', '25.000000', 0, '2902.500000000000', 0),
(332, 8, 23, 9, 81, '205.700000', '26.000000', 0, '5348.200000000000', 0),
(333, 19, 23, 9, 82, '1482.500000', '4.200000', 0, '6226.500000000000', 0),
(334, 16, 23, 9, 83, '943.000000', '15.700000', 0, '14805.100000000000', 0),
(335, 26, 23, 9, 83, '104.000000', '3.200000', 0, '332.800000000000', 0),
(337, 30, 23, 9, 83, '147.500000', '5.800000', 0, '855.500000000000', 0),
(338, 35, 23, 9, 83, '378.000000', '4.000000', 0, '1512.000000000000', 0),
(339, 37, 23, 9, 83, '345.500000', '3.800000', 0, '1312.900000000000', 0),
(340, 24, 23, 9, 83, '848.500000', '6.000000', 0, '5091.000000000000', 0),
(341, 40, 23, 9, 83, '3422.500000', '1.100000', 0, '3764.750000000000', 0),
(342, 29, 23, 9, 83, '156.000000', '5.000000', 0, '780.000000000000', 0),
(343, 23, 23, 9, 83, '30.500000', '4.800000', 0, '146.400000000000', 0),
(344, 43, 23, 9, 83, '34.500000', '6.000000', 0, '207.000000000000', 0),
(345, 38, 23, 9, 83, '66.000000', '0.700000', 0, '46.200000000000', 0),
(346, 19, 23, 9, 83, '141.000000', '4.200000', 0, '592.200000000000', 0),
(347, 4, 23, 9, 84, '1386.500000', '29.300000', 0, '40624.450000000000', 0),
(348, 6, 23, 9, 84, '155.500000', '25.500000', 0, '3965.250000000000', 0),
(349, 4, 23, 1, 85, '4096.000000', '27.500000', 0, '112640.000000000000', 15),
(351, 33, 23, 9, 87, '103.500000', '2.200000', 0, '227.700000000000', 0),
(353, 36, 23, 9, 87, '56.500000', '7.000000', 0, '395.500000000000', 0),
(354, 24, 23, 9, 87, '1074.000000', '6.000000', 0, '6444.000000000000', 0),
(355, 35, 23, 9, 87, '32.500000', '4.000000', 0, '130.000000000000', 0),
(357, 19, 23, 9, 87, '13891.000000', '4.600000', 0, '63898.600000000000', 0),
(358, 22, 23, 9, 87, '96.000000', '3.000000', 0, '288.000000000000', 0),
(360, 6, 23, 9, 87, '472.000000', '25.500000', 0, '12036.000000000000', 0),
(361, 26, 23, 9, 87, '155.000000', '3.200000', 0, '496.000000000000', 0),
(362, 27, 23, 9, 87, '24.000000', '7.000000', 0, '168.000000000000', 0),
(363, 4, 23, 9, 87, '2569.500000', '28.700000', 0, '73744.650000000000', 0),
(364, 5, 23, 9, 87, '544.500000', '27.500000', 0, '14973.750000000000', 0),
(366, 15, 23, 9, 87, '172.500000', '13.000000', 0, '2242.500000000000', 0),
(367, 29, 23, 9, 87, '411.000000', '5.000000', 0, '2055.000000000000', 0),
(368, 23, 23, 9, 87, '6907.000000', '4.820000', 0, '33291.740000000000', 0),
(369, 25, 23, 9, 87, '291.000000', '3.800000', 0, '1105.800000000000', 0),
(370, 29, 23, 9, 87, '193.500000', '4.800000', 0, '928.800000000000', 0),
(371, 25, 23, 9, 53, '342.000000', '3.800000', 0, '1299.600000000000', 0),
(372, 46, 23, 9, 72, '256.000000', '1.800000', 0, '460.800000000000', 0),
(373, 47, 23, 9, 72, '121.000000', '1.800000', 0, '217.800000000000', 0),
(374, 48, 23, 9, 72, '130.500000', '1.800000', 0, '234.900000000000', 0),
(375, 46, 23, 9, 88, '256.000000', '2.000000', 0, '512.000000000000', 0),
(376, 47, 23, 9, 88, '121.000000', '2.000000', 0, '242.000000000000', 0),
(377, 48, 23, 9, 88, '130.500000', '2.000000', 0, '261.000000000000', 0),
(378, 45, 23, 9, 88, '162.500000', '2.000000', 0, '325.000000000000', 0),
(379, 11, 23, 9, 89, '250.500000', '17.000000', 0, '4258.500000000000', 0),
(380, 23, 23, 9, 89, '367.500000', '4.800000', 0, '1764.000000000000', 0),
(381, 6, 23, 9, 89, '462.000000', '25.500000', 0, '11781.000000000000', 0),
(383, 5, 23, 9, 89, '160.500000', '27.500000', 0, '4413.750000000000', 0),
(384, 25, 23, 9, 89, '292.000000', '3.800000', 0, '1109.600000000000', 0),
(385, 23, 23, 9, 90, '2342.500000', '4.800000', 0, '11244.000000000000', 0),
(386, 4, 23, 9, 90, '529.500000', '29.000000', 0, '15355.500000000000', 0),
(387, 6, 23, 9, 90, '305.000000', '25.500000', 0, '7777.500000000000', 0),
(388, 16, 23, 9, 90, '248.000000', '16.000000', 0, '3968.000000000000', 0),
(389, 8, 23, 9, 90, '121.500000', '27.500000', 0, '3341.250000000000', 0),
(390, 35, 23, 9, 90, '22.500000', '4.200000', 0, '94.500000000000', 0),
(391, 5, 23, 9, 90, '371.000000', '28.000000', 0, '10388.000000000000', 0),
(392, 4, 23, 9, 89, '1261.500000', '28.700000', 0, '36205.050000000000', 0),
(393, 23, 23, 9, 91, '37.500000', '5.300000', 0, '198.750000000000', 0),
(394, 40, 23, 9, 92, '7830.000000', '1.250000', 0, '9787.500000000000', 0),
(395, 19, 23, 1, 93, '15520.000000', '4.500000', 0, '69840.000000000000', 15),
(396, 24, 23, 9, 94, '12.500000', '6.000000', 0, '75.000000000000', 0),
(397, 23, 23, 9, 94, '158.500000', '4.800000', 0, '760.800000000000', 0),
(398, 6, 23, 9, 94, '1673.500000', '25.500000', 0, '42674.250000000000', 0),
(400, 11, 23, 9, 95, '1597.400000', '17.000000', 0, '27155.800000000000', 0),
(402, 15, 23, 9, 96, '223.000000', '17.000000', 0, '3791.000000000000', 0),
(403, 33, 23, 9, 97, '4570.000000', '3.200000', 0, '14624.000000000000', 0),
(404, 24, 23, 9, 98, '1319.500000', '6.000000', 0, '7917.000000000000', 0),
(405, 35, 23, 9, 98, '485.000000', '4.000000', 0, '1940.000000000000', 0),
(406, 4, 23, 9, 98, '255.200000', '28.500000', 0, '7273.200000000000', 0),
(407, 5, 23, 9, 98, '52.800000', '27.500000', 0, '1452.000000000000', 0),
(408, 6, 23, 9, 98, '106.500000', '25.000000', 0, '2662.500000000000', 0),
(409, 6, 23, 9, 99, '217.500000', '25.000000', 0, '5437.500000000000', 0),
(410, 4, 23, 9, 99, '233.000000', '28.500000', 0, '6640.500000000000', 0),
(411, 6, 23, 9, 100, '807.000000', '25.500000', 0, '20578.500000000000', 0),
(412, 33, 23, 9, 83, '1668.500000', '2.200000', 0, '3670.700000000000', 0),
(415, 4, 23, 1, 101, '2034.500000', '27.200000', 0, '55338.400000000000', 15),
(416, 4, 23, 9, 102, '1505.500000', '29.200000', 0, '43960.600000000000', 0),
(417, 6, 23, 9, 102, '2149.000000', '25.500000', 0, '54799.500000000000', 0),
(418, 20, 23, 9, 103, '16390.000000', '4.300000', 0, '70477.000000000000', 0),
(419, 19, 23, 9, 104, '11900.000000', '4.300000', 0, '51170.000000000000', 0),
(420, 19, 23, 1, 105, '11860.000000', '4.400000', 0, '52184.000000000000', 15),
(421, 28, 23, 9, 106, '1310.000000', '7.000000', 0, '9170.000000000000', 0),
(423, 5, 23, 1, 107, '4728.400000', '27.500000', 0, '130031.000000000000', 15),
(424, 19, 23, 9, 108, '20450.000000', '4.550000', 0, '93047.500000000000', 0),
(425, 28, 23, 9, 109, '1310.000000', '7.000000', 0, '9170.000000000000', 0),
(426, 20, 23, 1, 110, '11900.000000', '4.400000', 0, '52360.000000000000', 15),
(427, 25, 23, 9, 111, '13.000000', '3.500000', 0, '45.500000000000', 0),
(428, 28, 23, 9, 111, '45.000000', '6.000000', 0, '270.000000000000', 0),
(429, 23, 23, 9, 111, '40.000000', '4.600000', 0, '184.000000000000', 0),
(430, 6, 23, 9, 111, '77.000000', '24.300000', 0, '1871.100000000000', 0),
(431, 11, 23, 9, 111, '13.500000', '16.500000', 0, '222.750000000000', 0),
(432, 5, 23, 9, 111, '11.000000', '26.500000', 0, '291.500000000000', 0),
(433, 24, 23, 9, 111, '25.500000', '6.000000', 0, '153.000000000000', 0),
(434, 35, 23, 9, 111, '2.500000', '4.000000', 0, '10.000000000000', 0),
(435, 33, 23, 9, 111, '8.000000', '2.200000', 0, '17.600000000000', 0),
(436, 6, 23, 9, 112, '596.700000', '25.000000', 0, '14917.500000000000', 0),
(437, 5, 23, 9, 112, '49.400000', '27.000000', 0, '1333.800000000000', 0),
(438, 4, 23, 9, 112, '102.300000', '28.000000', 0, '2864.400000000000', 0),
(439, 23, 23, 9, 113, '12752.000000', '4.900000', 0, '62484.800000000000', 0),
(440, 35, 23, 9, 113, '711.500000', '4.000000', 0, '2846.000000000000', 0),
(441, 24, 23, 9, 113, '953.500000', '6.000000', 0, '5721.000000000000', 0),
(442, 33, 23, 9, 113, '147.500000', '2.200000', 0, '324.500000000000', 0),
(443, 11, 23, 9, 113, '484.500000', '17.000000', 0, '8236.500000000000', 0),
(444, 12, 23, 9, 113, '55.000000', '16.500000', 0, '907.500000000000', 0),
(445, 16, 23, 9, 113, '140.000000', '15.700000', 0, '2198.000000000000', 0),
(446, 15, 23, 9, 113, '91.000000', '13.000000', 0, '1183.000000000000', 0),
(447, 15, 23, 9, 113, '11.500000', '12.000000', 0, '138.000000000000', 0),
(448, 4, 23, 9, 113, '207.500000', '28.000000', 0, '5810.000000000000', 0),
(449, 6, 23, 9, 113, '10.000000', '25.000000', 0, '250.000000000000', 0),
(450, 27, 23, 9, 113, '1.500000', '7.000000', 0, '10.500000000000', 0),
(451, 4, 23, 9, 114, '630.000000', '28.000000', 0, '17640.000000000000', 0),
(452, 5, 23, 9, 114, '247.500000', '26.500000', 0, '6558.750000000000', 0),
(453, 6, 23, 9, 114, '270.500000', '24.500000', 0, '6627.250000000000', 0),
(454, 43, 23, 9, 115, '34.000000', '7.000000', 0, '238.000000000000', 0),
(455, 16, 23, 9, 115, '111.000000', '16.000000', 0, '1776.000000000000', 0),
(456, 23, 23, 9, 115, '410.000000', '4.800000', 0, '1968.000000000000', 0),
(457, 6, 23, 9, 115, '500.500000', '25.500000', 0, '12762.750000000000', 0),
(458, 4, 23, 9, 115, '814.000000', '28.500000', 0, '23199.000000000000', 0),
(459, 27, 23, 9, 96, '628.500000', '8.500000', 0, '5342.250000000000', 0),
(460, 6, 23, 9, 116, '259.500000', '25.000000', 0, '6487.500000000000', 0),
(461, 4, 23, 9, 116, '604.000000', '28.000000', 0, '16912.000000000000', 0),
(462, 8, 23, 9, 116, '2259.500000', '26.000000', 0, '58747.000000000000', 0),
(463, 5, 23, 9, 116, '72.000000', '27.000000', 0, '1944.000000000000', 0),
(464, 4, 23, 9, 117, '413.000000', '27.500000', 0, '11357.500000000000', 0),
(465, 4, 23, 9, 118, '333.200000', '28.100000', 0, '9362.920000000000', 0),
(466, 5, 23, 9, 118, '35.000000', '27.000000', 0, '945.000000000000', 0),
(467, 8, 23, 9, 118, '28.500000', '26.000000', 0, '741.000000000000', 0),
(468, 6, 23, 9, 118, '56.000000', '25.000000', 0, '1400.000000000000', 0),
(469, 7, 23, 9, 118, '12.200000', '25.000000', 0, '305.000000000000', 0),
(470, 6, 23, 9, 119, '161.000000', '24.400000', 0, '3928.400000000000', 0),
(471, 11, 23, 9, 119, '82.300000', '17.000000', 0, '1399.100000000000', 0),
(472, 4, 23, 9, 119, '52.300000', '28.000000', 0, '1464.400000000000', 0),
(473, 27, 23, 9, 119, '42.500000', '7.000000', 0, '297.500000000000', 0),
(474, 4, 23, 9, 120, '62.000000', '28.000000', 0, '1736.000000000000', 0),
(475, 6, 23, 9, 120, '105.400000', '25.000000', 0, '2635.000000000000', 0),
(476, 5, 23, 9, 120, '97.800000', '27.000000', 0, '2640.600000000000', 0),
(477, 5, 23, 9, 120, '67.200000', '26.000000', 0, '1747.200000000000', 0),
(478, 11, 23, 9, 120, '60.000000', '17.000000', 0, '1020.000000000000', 0),
(479, 21, 58, 9, 120, '9.000000', '58.000000', 0, '522.000000000000', 0),
(480, 22, 23, 9, 120, '88.500000', '3.000000', 0, '265.500000000000', 0),
(481, 43, 23, 9, 120, '12.500000', '7.000000', 0, '87.500000000000', 0),
(482, 36, 23, 9, 120, '12.300000', '5.000000', 0, '61.500000000000', 0),
(483, 29, 23, 9, 120, '2.500000', '5.000000', 0, '12.500000000000', 0),
(484, 23, 23, 9, 120, '16.500000', '4.800000', 0, '79.200000000000', 0),
(485, 25, 23, 9, 120, '1.000000', '3.500000', 0, '3.500000000000', 0),
(486, 33, 23, 9, 120, '2.200000', '2.200000', 0, '4.840000000000', 0),
(487, 24, 23, 9, 120, '14.500000', '6.000000', 0, '87.000000000000', 0),
(488, 49, 23, 9, 121, '9960.000000', '2.700000', 0, '26892.000000000000', 0),
(489, 49, 23, 9, 122, '9960.000000', '2.800000', 0, '27888.000000000000', 0),
(490, 15, 23, 9, 123, '93.000000', '17.000000', 0, '1581.000000000000', 0),
(491, 6, 23, 9, 124, '1025.500000', '24.500000', 0, '25124.750000000000', 0),
(492, 16, 23, 9, 124, '661.000000', '16.000000', 0, '10576.000000000000', 0),
(493, 19, 23, 9, 125, '26560.000000', '4.500000', 0, '119520.000000000000', 0),
(495, 19, 23, 1, 126, '19510.000000', '4.400000', 0, '85844.000000000000', 15),
(496, 19, 23, 1, 127, '33200.000000', '4.500000', 0, '149400.000000000000', 15),
(497, 41, 23, 9, 125, '5280.000000', '2.600000', 0, '13728.000000000000', 0),
(498, 4, 23, 1, 128, '7228.500000', '27.500000', 0, '198783.750000000000', 15),
(499, 33, 23, 9, 129, '495.000000', '2.300000', 0, '1138.500000000000', 0),
(500, 22, 23, 9, 129, '55.000000', '3.200000', 0, '176.000000000000', 0),
(501, 24, 23, 9, 129, '98.000000', '5.500000', 0, '539.000000000000', 0),
(502, 23, 23, 9, 129, '25.500000', '4.800000', 0, '122.400000000000', 0),
(503, 26, 23, 9, 129, '12.500000', '3.000000', 0, '37.500000000000', 0),
(504, 28, 23, 9, 129, '90.000000', '6.000000', 0, '540.000000000000', 0),
(505, 4, 23, 9, 130, '102.000000', '28.000000', 0, '2856.000000000000', 0),
(506, 5, 23, 9, 130, '67.800000', '27.000000', 0, '1830.600000000000', 0),
(507, 6, 23, 9, 130, '84.800000', '25.000000', 0, '2120.000000000000', 0),
(508, 11, 23, 9, 130, '78.200000', '17.000000', 0, '1329.400000000000', 0),
(509, 22, 23, 9, 131, '1198.500000', '3.000000', 0, '3595.500000000000', 0),
(510, 21, 58, 9, 131, '185.000000', '59.730000', 0, '11050.000000000000', 0),
(511, 19, 23, 9, 132, '3595.500000', '3.630000', 0, '13036.000000000000', 0),
(512, 17, 23, 9, 132, '277.500000', '5.800000', 0, '1609.500000000000', 0),
(514, 19, 23, 9, 134, '4490.000000', '4.300000', 0, '19307.000000000000', 0),
(516, 17, 23, 9, 136, '892.500000', '2.770000', 0, '2472.220000000000', 0),
(522, 20, 23, 9, 135, '4490.000000', '4.300000', 0, '19307.000000000000', NULL),
(523, 4, 23, 9, 137, '18.500000', '27.000000', 0, '499.500000000000', 0),
(524, 5, 23, 9, 137, '13.500000', '25.000000', 0, '337.500000000000', 0),
(525, 6, 23, 9, 137, '65.500000', '23.500000', 0, '1539.250000000000', 0),
(526, 30, 23, 9, 137, '2022.500000', '6.800000', 0, '13753.000000000000', 0),
(527, 13, 23, 9, 138, '2664.000000', '21.000000', 0, '55944.000000000000', 0),
(528, 24, 23, 9, 139, '271.000000', '5.870000', 0, '1590.770000000000', 0),
(529, 33, 23, 9, 140, '271.000000', '5.870000', 0, '1590.770000000000', 0),
(531, 19, 23, 9, 141, '15570.000000', '4.300000', 0, '66951.000000000000', 0),
(532, 37, 23, 9, 142, '170.000000', '3.300000', 0, '561.000000000000', 0),
(533, 16, 23, 9, 143, '857.000000', '15.000000', 0, '12855.000000000000', 0),
(534, 17, 23, 9, 144, '1060.000000', '3.490000', 0, '3699.400000000000', 0),
(535, 18, 23, 9, 145, '1060.000000', '3.490000', 0, '3699.400000000000', 0),
(536, 17, 23, 1, 146, '110.000000', '3.490000', 0, '383.900000000000', 0),
(537, 41, 23, 1, 147, '2980.000000', '2.800000', 0, '8344.000000000000', 15),
(538, 41, 23, 1, 148, '2340.000000', '2.800000', 0, '6552.000000000000', 15),
(539, 23, 23, 9, 149, '60.000000', '4.830000', 0, '289.800000000000', 0),
(540, 19, 23, 1, 150, '15530.000000', '4.400000', 0, '68332.000000000000', 15),
(542, 4, 23, 9, 152, '10.500000', '28.560000', 0, '299.880000000000', 0),
(543, 4, 23, 9, 153, '11.000000', '28.560000', 0, '314.160000000000', 0),
(544, 6, 23, 9, 153, '16.500000', '25.140000', 0, '414.810000000000', 0),
(545, 35, 23, 9, 153, '4.500000', '4.080000', 0, '18.360000000000', 0),
(546, 24, 23, 9, 153, '121.000000', '5.870000', 0, '710.270000000000', 0),
(548, 4, 23, 9, 155, '8.500000', '28.560000', 0, '242.760000000000', 0),
(550, 4, 23, 9, 157, '26.000000', '28.560000', 0, '742.560000000000', 0),
(551, 4, 23, 9, 158, '10.500000', '28.560000', 0, '299.880000000000', 0),
(556, 6, 23, 9, 156, '32.000000', '25.140000', 0, '804.480000000000', 0),
(557, 24, 23, 9, 154, '60.000000', '5.870000', 0, '352.200000000000', 0),
(558, 6, 23, 9, 151, '22.000000', '25.140000', 0, '553.080000000000', 0),
(559, 19, 23, 1, 44, '13440.000000', '4.500000', 0, '60480.000000000000', 15),
(560, 4, 23, 1, 86, '2320.500000', '27.200000', 0, '63117.600000000000', 15),
(562, 4, 23, 9, 160, '257.800000', '27.000000', 0, '6960.600000000000', 0),
(563, 6, 23, 9, 160, '56.200000', '24.000000', 0, '1348.800000000000', 0),
(564, 11, 23, 9, 160, '27.000000', '16.800000', 0, '453.600000000000', 0),
(566, 25, 23, 9, 161, '2660.000000', '4.800000', 0, '12768.000000000000', 0),
(567, 6, 23, 9, 162, '21080.000000', '25.000000', 0, '527000.000000000000', 0),
(568, 23, 23, 9, 163, '23060.000000', '5.100000', 0, '117606.000000000000', 0),
(569, 24, 23, 1, 164, '20740.000000', '6.970000', 0, '144557.800000000000', 0),
(570, 24, 23, 9, 165, '60.000000', '5.870000', 0, '352.200000000000', 0),
(571, 23, 23, 9, 166, '210.000000', '4.830000', 0, '1014.300000000000', 0),
(572, 25, 23, 9, 167, '385.500000', '3.500000', 0, '1349.250000000000', 0),
(573, 29, 23, 9, 167, '725.000000', '5.000000', 0, '3625.000000000000', 0),
(574, 15, 23, 9, 167, '79.000000', '13.000000', 0, '1027.000000000000', 0),
(575, 16, 23, 9, 167, '151.050000', '15.500000', 0, '2341.280000000000', 0),
(576, 26, 23, 9, 167, '47.000000', '3.200000', 0, '150.400000000000', 0),
(577, 41, 23, 9, 167, '957.000000', '2.500000', 0, '2392.500000000000', 0),
(578, 6, 23, 9, 167, '1552.500000', '24.500000', 0, '38036.250000000000', 0),
(579, 4, 23, 9, 167, '2956.000000', '28.000000', 0, '82768.000000000000', 0),
(580, 5, 23, 9, 167, '732.000000', '27.000000', 0, '19764.000000000000', 0),
(581, 11, 23, 9, 167, '978.500000', '17.000000', 0, '16634.500000000000', 0),
(582, 12, 23, 9, 167, '366.500000', '15.500000', 0, '5680.750000000000', 0),
(583, 23, 23, 9, 167, '1086.500000', '4.800000', 0, '5215.200000000000', 0),
(584, 22, 23, 9, 167, '127.500000', '3.000000', 0, '382.500000000000', 0),
(585, 27, 23, 9, 167, '11.500000', '7.000000', 0, '80.500000000000', 0),
(586, 35, 23, 9, 167, '38.500000', '4.000000', 0, '154.000000000000', 0),
(587, 33, 23, 9, 167, '40.000000', '2.200000', 0, '88.000000000000', 0),
(588, 19, 23, 9, 167, '11280.000000', '4.400000', 0, '49632.000000000000', 0),
(589, 25, 23, 9, 168, '599.500000', '3.500000', 0, '2098.250000000000', 0),
(590, 11, 23, 9, 168, '635.000000', '17.000000', 0, '10795.000000000000', 0),
(591, 12, 23, 9, 168, '71.500000', '15.500000', 0, '1108.250000000000', 0),
(592, 6, 23, 9, 168, '310.500000', '24.500000', 0, '7607.250000000000', 0),
(593, 5, 23, 9, 168, '51.500000', '27.000000', 0, '1390.500000000000', 0),
(594, 16, 23, 9, 168, '5.500000', '15.500000', 0, '85.250000000000', 0),
(595, 4, 23, 9, 168, '826.500000', '28.000000', 0, '23142.000000000000', 0),
(596, 6, 23, 9, 169, '18.500000', '24.860000', 0, '459.910000000000', 0),
(597, 6, 23, 9, 170, '12.000000', '24.860000', 0, '298.320000000000', 0),
(598, 12, 23, 9, 171, '12.000000', '24.860000', 0, '298.320000000000', 0),
(599, 6, 23, 9, 172, '4.000000', '24.860000', 0, '99.440000000000', 0),
(600, 12, 23, 9, 173, '4.000000', '24.860000', 0, '99.440000000000', 0),
(601, 6, 23, 9, 174, '3.000000', '24.860000', 0, '74.580000000000', 0),
(602, 33, 23, 9, 175, '3.000000', '24.860000', 0, '74.580000000000', 0),
(603, 6, 23, 9, 176, '18.500000', '24.860000', 0, '459.910000000000', 0),
(604, 8, 23, 9, 177, '2159.200000', '26.640000', 0, '57521.090000000000', 0),
(605, 5, 23, 9, 178, '2159.200000', '26.640000', 0, '57521.090000000000', 0),
(606, 6, 23, 9, 179, '39.500000', '24.860000', 0, '981.970000000000', 0),
(607, 10, 23, 9, 180, '39.500000', '24.860000', 0, '981.970000000000', 0),
(608, 4, 23, 9, 181, '4672.590000', '28.230000', 0, '131907.220000000000', 0),
(609, 5, 23, 9, 182, '4672.590000', '28.230000', 0, '131907.220000000000', 0),
(610, 6, 23, 9, 183, '24.390000', '24.860000', 0, '606.340000000000', 0),
(611, 4, 23, 9, 184, '24.390000', '24.860000', 0, '606.340000000000', 0),
(612, 6, 23, 9, 185, '437.500000', '24.860000', 0, '10876.250000000000', 0),
(613, 19, 23, 9, 159, '9480.000000', '4.300000', 0, '40764.000000000000', 0),
(614, 19, 23, 1, 186, '9550.000000', '4.400000', 0, '42020.000000000000', 15),
(615, 19, 23, 9, 187, '2373.000000', '4.290000', 0, '10180.170000000000', 0),
(616, 45, 23, 9, 188, '162.500000', '2.500000', 0, '406.250000000000', 0),
(617, 29, 23, 9, 189, '238.500000', '5.450000', 0, '1299.830000000000', 0),
(618, 28, 23, 9, 190, '238.500000', '5.450000', 0, '1299.830000000000', 0),
(620, 27, 23, 9, 192, '277.500000', '16.390000', 0, '4548.230000000000', 0),
(627, 4, 23, 9, 193, '2857.000000', '28.195091', 0, '80553.376141115000', 0),
(628, 5, 23, 9, 193, '7383.990000', '27.581394', 0, '203660.739764080000', 0),
(629, 6, 23, 9, 193, '3747.560000', '24.860431', 0, '93165.955366960000', 0),
(630, 7, 23, 9, 193, '33.200000', '25.632530', 0, '851.000000000000', 0),
(631, 8, 23, 9, 193, '5819.500000', '26.640048', 0, '155031.758622960000', 0),
(632, 10, 23, 9, 193, '63.500000', '18.109764', 0, '1149.970000000000', 0),
(633, 11, 23, 9, 193, '10294.500000', '16.743616', 0, '172367.150000000000', 0),
(634, 12, 23, 9, 193, '3052.000000', '16.380669', 0, '49993.802722921000', 0),
(635, 13, 23, 9, 193, '2727.500000', '20.932213', 0, '57092.610000000000', 0),
(636, 15, 23, 9, 193, '98.900000', '12.980022', 0, '1283.724206869700', 0),
(637, 16, 23, 9, 193, '5179.350000', '15.448701', 0, '80014.230000000000', 0),
(638, 18, 23, 9, 193, '5708.400000', '7.145875', 0, '40791.510000000000', 0),
(639, 19, 23, 9, 193, '11280.000000', '4.400000', 0, '49632.000000000000', 0),
(640, 21, 58, 9, 193, '9.000000', '59.649485', 0, '536.845360824740', 0),
(641, 22, 23, 9, 193, '271.000000', '3.040590', 0, '824.000000000000', 0),
(642, 23, 23, 9, 193, '14988.700000', '4.824858', 0, '72318.342000431000', 0),
(643, 24, 23, 9, 193, '2477.400000', '5.872198', 0, '14547.783824117000', 0),
(644, 25, 23, 9, 193, '1676.000000', '3.613971', 0, '6057.015842239500', 0),
(645, 26, 23, 9, 193, '1859.500000', '3.188642', 0, '5929.280000000000', 0),
(646, 29, 23, 9, 193, '4425.500000', '5.446002', 0, '24101.282253271000', 0),
(647, 30, 23, 9, 193, '2678.500000', '6.550476', 0, '17545.450000000000', 0),
(648, 31, 23, 9, 193, '2553.000000', '5.505319', 0, '14055.078507442000', 0),
(649, 32, 23, 9, 193, '34.500000', '5.000000', 0, '172.500000000000', 0),
(650, 33, 23, 9, 193, '706.200000', '3.760213', 0, '2655.462224155900', 0),
(651, 35, 23, 9, 193, '1874.500000', '4.079102', 0, '7646.276557302600', 0),
(652, 36, 23, 9, 193, '748.300000', '6.984498', 0, '5226.500000000000', 0),
(653, 37, 23, 9, 193, '1326.000000', '3.875946', 0, '5139.503781737200', 0),
(654, 38, 23, 9, 193, '563.500000', '0.945963', 0, '533.050000000000', 0),
(655, 40, 23, 9, 193, '1274.000000', '1.100000', 0, '1401.400000000000', 0),
(656, 41, 23, 9, 193, '924.000000', '2.496433', 0, '2306.704369207500', 0),
(657, 43, 23, 9, 193, '81.000000', '6.574074', 0, '532.500000000000', 0),
(658, 44, 23, 9, 193, '278.500000', '2.000000', 0, '557.000000000000', 0),
(659, 19, 23, 1, 194, '11270.000000', '4.300000', 0, '48461.000000000000', 15),
(660, 4, 23, 9, 195, '741.400000', '27.500000', 0, '20388.500000000000', 0),
(661, 5, 23, 9, 195, '252.000000', '26.000000', 0, '6552.000000000000', 0),
(662, 12, 23, 9, 196, '59.500000', '16.380000', 0, '974.610000000000', 0),
(663, 27, 23, 9, 197, '59.500000', '16.380000', 0, '974.610000000000', 0),
(664, 15, 23, 9, 198, '79.000000', '17.000000', 0, '1343.000000000000', 0),
(665, 27, 23, 9, 198, '59.500000', '9.000000', 0, '535.500000000000', 0),
(666, 23, 23, 9, 199, '650.200000', '4.800000', 0, '3120.960000000000', 0),
(667, 22, 23, 9, 199, '36.000000', '3.000000', 0, '108.000000000000', 0),
(668, 21, 58, 9, 199, '4.000000', '58.000000', 0, '232.000000000000', 0),
(669, 5, 23, 1, 200, '3082.800000', '27.500000', 0, '84777.000000000000', 15),
(671, 6, 23, 9, 202, '184.200000', '25.000000', 0, '4605.000000000000', 0),
(672, 5, 23, 9, 202, '38.800000', '27.000000', 0, '1047.600000000000', 0),
(673, 23, 23, 9, 202, '438.600000', '5.000000', 0, '2193.000000000000', 0),
(674, 33, 23, 9, 202, '118.200000', '2.200000', 0, '260.040000000000', 0),
(675, 12, 23, 9, 203, '277.500000', '16.390000', 0, '4548.230000000000', 0),
(676, 6, 23, 9, 204, '418.800000', '25.000000', 0, '10470.000000000000', 0),
(677, 23, 23, 9, 204, '300.400000', '5.000000', 0, '1502.000000000000', 0),
(678, 32, 23, 9, 205, '739.500000', '6.000000', 0, '4437.000000000000', 0),
(679, 33, 23, 9, 205, '51.500000', '2.200000', 0, '113.300000000000', 0),
(680, 16, 23, 9, 205, '14.500000', '15.500000', 0, '224.750000000000', 0),
(681, 26, 23, 9, 205, '48.500000', '3.800000', 0, '184.300000000000', 0),
(682, 23, 23, 9, 205, '239.500000', '5.000000', 0, '1197.500000000000', 0),
(683, 37, 23, 9, 205, '96.500000', '3.800000', 0, '366.700000000000', 0),
(684, 30, 23, 9, 205, '40.500000', '6.500000', 0, '263.250000000000', 0),
(685, 4, 23, 9, 205, '110.000000', '28.000000', 0, '3080.000000000000', 0),
(686, 24, 23, 9, 205, '112.500000', '5.700000', 0, '641.250000000000', 0),
(687, 19, 23, 9, 206, '29900.000000', '4.400000', 0, '131560.000000000000', 0),
(689, 41, 23, 9, 206, '2750.000000', '2.600000', 0, '7150.000000000000', 0),
(690, 4, 23, 1, 207, '3208.000000', '28.050000', 0, '89984.400000000000', 15),
(691, 4, 23, 9, 208, '92.200000', '27.000000', 0, '2489.400000000000', 0),
(692, 5, 23, 9, 208, '35.400000', '26.000000', 0, '920.400000000000', 0),
(693, 6, 23, 9, 208, '84.400000', '23.500000', 0, '1983.400000000000', 0),
(694, 11, 23, 9, 208, '94.000000', '23.500000', 0, '2209.000000000000', 0),
(695, 17, 23, 9, 208, '23.400000', '5.500000', 0, '128.700000000000', 0),
(696, 33, 23, 9, 209, '131.500000', '2.200000', 0, '289.300000000000', 0),
(697, 29, 23, 9, 209, '309.000000', '5.000000', 0, '1545.000000000000', 0),
(698, 24, 23, 9, 209, '428.000000', '5.700000', 0, '2439.600000000000', 0),
(699, 35, 23, 9, 209, '116.500000', '4.300000', 0, '500.950000000000', 0),
(700, 26, 23, 9, 209, '217.500000', '3.800000', 0, '826.500000000000', 0),
(701, 5, 23, 9, 209, '135.000000', '27.500000', 0, '3712.500000000000', 0),
(702, 4, 23, 9, 209, '1060.000000', '28.000000', 0, '29680.000000000000', 0),
(703, 6, 23, 9, 209, '148.000000', '25.000000', 0, '3700.000000000000', 0),
(704, 16, 23, 9, 209, '93.500000', '15.500000', 0, '1449.250000000000', 0),
(705, 23, 23, 9, 209, '1055.500000', '5.000000', 0, '5277.500000000000', 0),
(706, 12, 23, 9, 209, '11.500000', '15.500000', 0, '178.250000000000', 0),
(707, 11, 23, 9, 209, '115.500000', '17.000000', 0, '1963.500000000000', 0),
(708, 15, 23, 9, 209, '12.500000', '14.000000', 0, '175.000000000000', 0),
(709, 25, 23, 9, 210, '187.500000', '3.500000', 0, '656.250000000000', 0),
(710, 4, 23, 9, 210, '1943.500000', '28.000000', 0, '54418.000000000000', 0),
(711, 33, 23, 9, 210, '5.500000', '2.200000', 0, '12.100000000000', 0),
(712, 22, 23, 9, 210, '61.500000', '3.300000', 0, '202.950000000000', 0),
(713, 19, 23, 9, 210, '10881.500000', '4.400000', 0, '47878.600000000000', 0),
(714, 24, 23, 9, 211, '188.000000', '6.000000', 0, '1128.000000000000', 0),
(715, 23, 23, 9, 211, '574.000000', '5.000000', 0, '2870.000000000000', 0),
(716, 6, 23, 9, 211, '207.500000', '25.300000', 0, '5249.750000000000', 0),
(717, 23, 23, 9, 212, '611.200000', '5.000000', 0, '3056.000000000000', 0),
(718, 6, 23, 9, 212, '791.600000', '25.000000', 0, '19790.000000000000', 0),
(719, 16, 23, 9, 212, '193.200000', '15.500000', 0, '2994.600000000000', 0),
(720, 26, 23, 9, 212, '382.000000', '3.800000', 0, '1451.600000000000', 0),
(721, 8, 23, 9, 212, '35.000000', '26.000000', 0, '910.000000000000', 0),
(722, 11, 23, 9, 212, '400.000000', '17.200000', 0, '6880.000000000000', 0),
(724, 5, 23, 9, 213, '712.000000', '27.500000', 0, '19580.000000000000', 0),
(725, 6, 23, 9, 213, '816.000000', '25.000000', 0, '20400.000000000000', 0),
(726, 4, 23, 9, 213, '878.500000', '28.000000', 0, '24598.000000000000', 0),
(728, 7, 23, 9, 213, '131.000000', '26.500000', 0, '3471.500000000000', 0),
(729, 4, 23, 9, 214, '90.800000', '28.000000', 0, '2542.400000000000', 0),
(730, 6, 23, 9, 214, '60.800000', '25.000000', 0, '1520.000000000000', 0),
(731, 26, 23, 9, 214, '22.800000', '3.800000', 0, '86.640000000000', 0),
(732, 16, 23, 9, 214, '53.200000', '15.500000', 0, '824.600000000000', 0),
(733, 25, 23, 9, 214, '4.200000', '3.500000', 0, '14.700000000000', 0),
(735, 33, 23, 9, 216, '389.000000', '2.200000', 0, '855.800000000000', 0),
(736, 26, 23, 9, 216, '581.500000', '3.800000', 0, '2209.700000000000', 0),
(737, 16, 23, 9, 216, '352.000000', '15.500000', 0, '5456.000000000000', 0),
(738, 23, 23, 9, 216, '199.000000', '5.000000', 0, '995.000000000000', 0),
(739, 6, 23, 9, 216, '74.000000', '24.000000', 0, '1776.000000000000', 0),
(741, 19, 23, 1, 215, '10920.000000', '4.300000', 0, '46956.000000000000', 15),
(746, 6, 58, 9, 216, '318.500000', '25.000000', 0, '7962.500000000000', 0),
(747, 11, 23, 9, 213, '542.500000', '17.000000', 0, '9222.500000000000', 0),
(748, 12, 23, 9, 213, '15.500000', '16.000000', 0, '248.000000000000', 0),
(751, 6, 23, 9, 217, '571.400000', '25.000000', 0, '14285.000000000000', 0),
(752, 5, 23, 9, 217, '12.900000', '27.500000', 0, '354.750000000000', 0);
INSERT INTO `mdetalles` (`mde_id`, `mde_bie_id`, `mde_t6m_id`, `mde_gta_id`, `mde_mov_id`, `mde_q`, `mde_vu`, `mde_igv`, `mde_importe`, `mde_detraccion`) VALUES
(753, 4, 23, 9, 217, '554.800000', '28.500000', 0, '15811.800000000000', 0),
(754, 4, 23, 9, 218, '390.500000', '28.000000', 0, '10934.000000000000', 0),
(756, 22, 23, 9, 218, '1487.500000', '3.800000', 0, '5652.500000000000', 0),
(757, 29, 23, 9, 218, '578.500000', '5.000000', 0, '2892.500000000000', 0),
(758, 33, 23, 9, 218, '552.000000', '2.200000', 0, '1214.400000000000', 0),
(759, 35, 23, 9, 218, '30.000000', '4.300000', 0, '129.000000000000', 0),
(760, 33, 23, 9, 218, '7.000000', '2.200000', 0, '15.400000000000', 0),
(761, 4, 23, 9, 219, '106.800000', '28.500000', 0, '3043.800000000000', 0),
(762, 6, 23, 9, 219, '126.800000', '25.000000', 0, '3170.000000000000', 0),
(763, 5, 23, 9, 219, '33.200000', '27.500000', 0, '913.000000000000', 0),
(765, 8, 23, 9, 219, '29.400000', '26.000000', 0, '764.400000000000', 0),
(766, 19, 23, 1, 220, '29760.000000', '4.400000', 0, '130944.000000000000', 15),
(767, 41, 23, 1, 220, '2760.000000', '2.700000', 0, '7452.000000000000', 15),
(768, 6, 23, 9, 221, '341.000000', '25.000000', 0, '8525.000000000000', 0),
(769, 16, 23, 9, 221, '35.000000', '15.500000', 0, '542.500000000000', 0),
(770, 15, 23, 9, 221, '93.500000', '13.000000', 0, '1215.500000000000', 0),
(771, 22, 23, 9, 218, '2092.000000', '3.400000', 0, '7112.800000000000', 0),
(772, 21, 58, 9, 218, '645.000000', '60.000000', 0, '38700.000000000000', 0),
(773, 21, 58, 9, 218, '36.000000', '40.000000', 0, '1440.000000000000', 0),
(774, 4, 23, 9, 222, '518.900000', '28.500000', 0, '14788.650000000000', 0),
(775, 6, 23, 9, 222, '65.000000', '25.000000', 0, '1625.000000000000', 0),
(776, 5, 23, 9, 222, '56.500000', '27.500000', 0, '1553.750000000000', 0),
(777, 7, 23, 9, 222, '73.300000', '26.000000', 0, '1905.800000000000', 0),
(778, 49, 23, 9, 223, '12900.000000', '2.300000', 0, '29670.000000000000', 0),
(779, 4, 23, 9, 224, '2209.000000', '28.500000', 0, '62956.500000000000', 0),
(780, 25, 23, 9, 225, '29.500000', '3.500000', 0, '103.250000000000', 0),
(781, 15, 23, 9, 225, '37.000000', '12.000000', 0, '444.000000000000', 0),
(782, 11, 23, 9, 225, '54.500000', '54.500000', 0, '2970.250000000000', 0),
(783, 4, 23, 9, 225, '44.000000', '27.500000', 0, '1210.000000000000', 0),
(784, 27, 23, 9, 225, '39.500000', '7.500000', 0, '296.250000000000', 0),
(785, 6, 23, 9, 225, '27.500000', '24.000000', 0, '660.000000000000', 0),
(786, 5, 23, 9, 225, '10.500000', '26.500000', 0, '278.250000000000', 0),
(787, 28, 23, 9, 225, '49.000000', '6.000000', 0, '294.000000000000', 0),
(788, 22, 23, 9, 225, '81.000000', '3.200000', 0, '259.200000000000', 0),
(789, 33, 23, 9, 225, '30.000000', '2.200000', 0, '66.000000000000', 0),
(790, 23, 23, 9, 225, '114.500000', '4.900000', 0, '561.050000000000', 0),
(791, 31, 23, 9, 225, '20.000000', '5.500000', 0, '110.000000000000', 0),
(792, 35, 23, 9, 225, '18.000000', '4.200000', 0, '75.600000000000', 0),
(793, 24, 23, 9, 225, '36.500000', '5.700000', 0, '208.050000000000', 0),
(794, 23, 23, 9, 226, '607.000000', '5.000000', 0, '3035.000000000000', 0),
(795, 4, 23, 9, 226, '1110.000000', '28.000000', 0, '31080.000000000000', 0),
(796, 5, 23, 9, 226, '422.000000', '27.500000', 0, '11605.000000000000', 0),
(797, 8, 23, 9, 226, '35.500000', '26.500000', 0, '940.750000000000', 0),
(798, 35, 23, 9, 226, '57.500000', '4.300000', 0, '247.250000000000', 0),
(800, 4, 23, 9, 227, '3891.500000', '28.700000', 0, '111686.050000000000', 0),
(801, 4, 23, 9, 228, '765.500000', '28.500000', 0, '21816.750000000000', 0),
(802, 6, 23, 9, 228, '177.500000', '25.000000', 0, '4437.500000000000', 0),
(803, 22, 23, 9, 228, '1111.500000', '3.800000', 0, '4223.700000000000', 0),
(804, 21, 58, 9, 228, '1.000000', '69.000000', 0, '69.000000000000', 0),
(805, 6, 23, 9, 229, '87.900000', '25.000000', 0, '2197.500000000000', 0),
(806, 11, 23, 9, 230, '431.000000', '17.200000', 0, '7413.200000000000', 0),
(807, 11, 23, 9, 231, '610.000000', '18.000000', 0, '10980.000000000000', 0),
(808, 6, 23, 9, 232, '617.000000', '25.200000', 0, '15548.400000000000', 0),
(809, 5, 23, 9, 232, '179.000000', '27.000000', 0, '4833.000000000000', 0),
(810, 8, 23, 9, 232, '300.000000', '26.500000', 0, '7950.000000000000', 0),
(811, 6, 23, 9, 233, '1590.500000', '25.300000', 0, '40239.650000000000', 0),
(812, 4, 23, 1, 234, '4384.500000', '28.000000', 0, '122766.000000000000', 15),
(813, 6, 23, 9, 235, '1261.000000', '25.300000', 0, '31903.300000000000', 0),
(814, 32, 23, 9, 236, '9803.000000', '6.000000', 0, '58818.000000000000', 0),
(815, 4, 23, 9, 237, '408.000000', '28.500000', 0, '11628.000000000000', 0),
(816, 5, 23, 9, 237, '92.000000', '27.500000', 0, '2530.000000000000', 0),
(817, 8, 23, 9, 237, '14.000000', '26.000000', 0, '364.000000000000', 0),
(818, 6, 23, 9, 237, '45.000000', '25.000000', 0, '1125.000000000000', 0),
(819, 11, 23, 9, 237, '10.000000', '16.800000', 0, '168.000000000000', 0),
(820, 23, 23, 9, 237, '953.000000', '5.000000', 0, '4765.000000000000', 0),
(821, 29, 23, 9, 237, '4.000000', '5.000000', 0, '20.000000000000', 0),
(822, 37, 23, 9, 238, '201.500000', '3.800000', 0, '765.700000000000', 0),
(823, 6, 23, 9, 239, '7447.500000', '25.650000', 0, '190995.000000000000', 0),
(824, 31, 23, 9, 240, '228.500000', '6.000000', 0, '1371.000000000000', 0),
(825, 23, 23, 9, 240, '852.500000', '5.000000', 0, '4262.500000000000', 0),
(826, 26, 23, 9, 240, '136.000000', '3.800000', 0, '516.800000000000', 0),
(827, 25, 23, 9, 240, '49.000000', '3.500000', 0, '171.500000000000', 0),
(828, 43, 23, 9, 240, '16.000000', '5.000000', 0, '80.000000000000', 0),
(829, 24, 23, 9, 240, '267.000000', '5.700000', 0, '1521.900000000000', 0),
(830, 16, 23, 9, 240, '47.500000', '15.500000', 0, '736.250000000000', 0),
(831, 11, 23, 9, 240, '457.000000', '17.000000', 0, '7769.000000000000', 0),
(832, 6, 23, 9, 240, '357.500000', '25.000000', 0, '8937.500000000000', 0),
(833, 35, 23, 9, 240, '83.500000', '4.300000', 0, '359.050000000000', 0),
(834, 5, 23, 9, 240, '136.000000', '27.000000', 0, '3672.000000000000', 0),
(835, 4, 23, 9, 240, '490.000000', '28.000000', 0, '13720.000000000000', 0),
(836, 33, 23, 9, 240, '111.000000', '2.200000', 0, '244.200000000000', 0),
(837, 21, 58, 9, 240, '20.500000', '59.000000', 0, '1209.500000000000', 0),
(838, 33, 23, 9, 240, '254.500000', '1.100000', 0, '279.950000000000', 0),
(839, 19, 23, 9, 241, '16060.000000', '4.400000', 0, '70664.000000000000', 0),
(840, 19, 23, 1, 242, '16010.000000', '4.300000', 0, '68843.000000000000', 15),
(841, 16, 23, 9, 243, '3288.500000', '16.000000', 0, '52616.000000000000', 0),
(842, 6, 23, 9, 243, '8619.000000', '25.500000', 0, '219784.500000000000', 0),
(843, 26, 23, 9, 243, '88.000000', '4.000000', 0, '352.000000000000', 0),
(844, 24, 23, 9, 243, '43.000000', '6.000000', 0, '258.000000000000', 0),
(845, 30, 23, 9, 243, '5.500000', '6.500000', 0, '35.750000000000', 0),
(846, 35, 23, 9, 243, '103.500000', '4.500000', 0, '465.750000000000', 0),
(847, 33, 23, 9, 243, '411.000000', '2.200000', 0, '904.200000000000', 0),
(848, 28, 23, 9, 243, '8.500000', '6.000000', 0, '51.000000000000', 0),
(849, 27, 23, 9, 243, '1.000000', '7.500000', 0, '7.500000000000', 0),
(850, 23, 23, 9, 243, '13533.500000', '5.100000', 0, '69020.850000000000', 0),
(851, 27, 23, 9, 243, '2.000000', '4.000000', 0, '8.000000000000', 0),
(852, 4, 23, 9, 244, '1682.500000', '28.500000', 0, '47951.250000000000', 0),
(853, 5, 23, 9, 244, '611.500000', '27.500000', 0, '16816.250000000000', 0),
(854, 16, 23, 9, 244, '171.500000', '15.500000', 0, '2658.250000000000', 0),
(855, 23, 23, 9, 244, '900.500000', '5.000000', 0, '4502.500000000000', 0),
(856, 23, 23, 9, 245, '583.000000', '5.000000', 0, '2915.000000000000', 0),
(857, 35, 23, 9, 245, '10.000000', '4.500000', 0, '45.000000000000', 0),
(858, 24, 23, 9, 245, '31.500000', '6.000000', 0, '189.000000000000', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mermas`
--

CREATE TABLE `mermas` (
  `mer_id` bigint(20) NOT NULL,
  `mer_alm_id` bigint(20) NOT NULL,
  `mer_bie_id` bigint(20) NOT NULL,
  `mer_fecha` date NOT NULL,
  `mer_descripcion` varchar(200) DEFAULT NULL,
  `mer_q` decimal(12,6) NOT NULL,
  `mer_vu` decimal(12,6) NOT NULL,
  `mer_mt` decimal(12,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mkinternos`
--

CREATE TABLE `mkinternos` (
  `mki_id` bigint(20) NOT NULL,
  `mki_fecha` date NOT NULL,
  `mki_alm_id` bigint(20) NOT NULL,
  `mki_i_bie_id` bigint(20) NOT NULL,
  `mki_f_bie_id` bigint(20) NOT NULL,
  `mki_descripcion` varchar(200) DEFAULT NULL,
  `mki_q` decimal(12,6) NOT NULL,
  `mki_vu` decimal(12,6) NOT NULL,
  `mki_mt` decimal(12,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `mov_id` bigint(20) NOT NULL,
  `mov_age_id` bigint(20) DEFAULT NULL,
  `mov_alm_id` bigint(20) NOT NULL,
  `mov_serie` varchar(4) NOT NULL,
  `mov_numero` bigint(20) NOT NULL,
  `mov_t12num` bigint(20) NOT NULL,
  `mov_gt4_id` bigint(20) NOT NULL,
  `mov_t12_id` bigint(20) NOT NULL,
  `mov_t10_id` bigint(20) NOT NULL,
  `mov_tce_id` bigint(20) NOT NULL,
  `mov_fechaE` date NOT NULL,
  `mov_fechaR` date NOT NULL,
  `mov_fechaV` date DEFAULT NULL,
  `mov_tipo` int(20) NOT NULL,
  `mov_subtotal` decimal(24,12) NOT NULL,
  `mov_igv_id` json NOT NULL,
  `mov_total` decimal(24,12) NOT NULL,
  `mov_ncr_id` json DEFAULT NULL,
  `mov_observaciones` text,
  `mov_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mov_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mov_mstatus` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`mov_id`, `mov_age_id`, `mov_alm_id`, `mov_serie`, `mov_numero`, `mov_t12num`, `mov_gt4_id`, `mov_t12_id`, `mov_t10_id`, `mov_tce_id`, `mov_fechaE`, `mov_fechaR`, `mov_fechaV`, `mov_tipo`, `mov_subtotal`, `mov_igv_id`, `mov_total`, `mov_ncr_id`, `mov_observaciones`, `mov_created`, `mov_updated`, `mov_mstatus`) VALUES
(1, NULL, 1, 'SI01', 1, 1, 1, 16, 1, 1, '2022-08-01', '2022-08-01', '2022-08-01', 2, '26.000000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"26.00\"}', '26.000000000000', NULL, NULL, '2022-08-22 21:50:10', '2022-08-22 21:50:10', 1),
(3, 10, 1, 'NE01', 1, 1, 1, 2, 49, 1, '2022-08-17', '2022-08-17', '2022-08-17', 2, '37898.500000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"37898.50\"}', '37898.500000000000', NULL, NULL, '2022-08-17 17:22:31', '2022-08-17 17:22:31', 1),
(4, 1, 1, 'NE01', 2, 2, 1, 2, 49, 1, '2022-08-17', '2022-08-17', '2022-08-17', 2, '15658.000000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"15658.00\"}', '15658.000000000000', NULL, NULL, '2022-08-17 17:28:33', '2022-08-17 17:28:33', 1),
(5, 28, 1, 'NE01', 3, 3, 1, 2, 49, 1, '2022-08-18', '2022-08-18', '2022-08-18', 2, '17472.750000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"17472.75\"}', '17472.750000000000', NULL, NULL, '2022-08-18 13:03:29', '2022-08-18 13:03:29', 1),
(6, 4, 1, 'NS01', 1, 1, 1, 1, 50, 1, '2022-08-18', '2022-08-18', '2022-08-18', 1, '71682.000000000000', '{\"mov_igv\": \"12902.76\", \"mov_gravada\": \"71682.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '84584.760000000000', NULL, NULL, '2022-08-18 13:26:31', '2022-08-18 13:26:31', 1),
(7, 13, 1, 'NE01', 4, 4, 1, 2, 49, 1, '2022-08-18', '2022-08-18', '2022-08-18', 2, '15586.680000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"15586.68\"}', '15586.680000000000', NULL, NULL, '2022-08-18 16:51:57', '2022-08-18 16:51:57', 1),
(8, 14, 1, 'NE01', 5, 5, 1, 2, 49, 1, '2022-08-18', '2022-08-18', '2022-08-18', 2, '21519.560000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"21519.56\"}', '21519.560000000000', NULL, NULL, '2022-08-18 17:19:29', '2022-08-18 17:19:29', 1),
(9, 12, 1, 'NE01', 6, 6, 1, 2, 49, 1, '2022-08-19', '2022-08-19', '2022-08-19', 2, '11401.550000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"11401.55\"}', '11401.550000000000', NULL, NULL, '2022-08-19 14:40:22', '2022-08-19 14:40:22', 1),
(10, 15, 1, 'NE01', 7, 7, 1, 2, 49, 1, '2022-08-19', '2022-08-19', '2022-08-19', 2, '15322.000000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"15322.00\"}', '15322.000000000000', NULL, NULL, '2022-08-19 14:53:54', '2022-08-19 14:53:54', 1),
(11, 16, 1, 'NE01', 8, 8, 1, 2, 49, 1, '2022-08-19', '2022-08-19', '2022-08-19', 2, '62244.000000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"62244.00\"}', '62244.000000000000', NULL, NULL, '2022-08-19 14:56:47', '2022-08-19 14:56:47', 1),
(12, 17, 1, 'NE01', 9, 9, 1, 2, 49, 1, '2022-08-19', '2022-08-19', '2022-08-19', 2, '5409.420000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"5409.42\"}', '5409.420000000000', NULL, NULL, '2022-08-19 15:02:39', '2022-08-19 15:02:39', 1),
(13, 18, 1, 'NE01', 10, 10, 1, 2, 49, 1, '2022-08-19', '2022-08-19', '2022-08-19', 2, '23484.000000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"23484.00\"}', '23484.000000000000', NULL, NULL, '2022-08-19 15:09:39', '2022-08-19 15:09:39', 1),
(14, 19, 1, 'NE01', 11, 11, 1, 2, 49, 1, '2022-08-19', '2022-08-19', '2022-08-19', 2, '62736.000000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"62736.00\"}', '62736.000000000000', NULL, NULL, '2022-08-19 15:10:37', '2022-08-19 15:10:37', 1),
(15, 20, 1, 'NE01', 12, 12, 1, 2, 49, 1, '2022-08-19', '2022-08-19', '2022-08-19', 2, '13683.330000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"13683.33\"}', '13683.330000000000', NULL, NULL, '2022-08-19 15:11:11', '2022-08-19 15:11:11', 1),
(16, 21, 1, 'NE01', 13, 13, 1, 2, 49, 1, '2022-08-19', '2022-08-19', '2022-08-19', 2, '50097.210000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"50097.21\"}', '50097.210000000000', NULL, NULL, '2022-08-19 15:11:39', '2022-08-19 15:11:39', 1),
(17, 22, 1, 'NE01', 14, 14, 1, 2, 49, 1, '2022-08-19', '2022-08-19', '2022-08-19', 2, '34505.880000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"34505.88\"}', '34505.880000000000', NULL, NULL, '2022-08-19 15:12:46', '2022-08-19 15:12:46', 1),
(18, 23, 1, 'NE01', 15, 15, 1, 2, 49, 1, '2022-08-19', '2022-08-19', '2022-08-19', 2, '7751.700000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"7751.70\"}', '7751.700000000000', NULL, NULL, '2022-08-19 15:13:40', '2022-08-19 15:13:40', 1),
(19, 24, 1, 'NE01', 16, 16, 1, 2, 49, 1, '2022-08-19', '2022-08-19', '2022-08-19', 2, '7719.540000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"7719.54\"}', '7719.540000000000', NULL, NULL, '2022-08-19 15:15:17', '2022-08-19 15:15:17', 1),
(20, 25, 1, 'NE01', 17, 17, 1, 2, 49, 1, '2022-08-19', '2022-08-19', '2022-08-19', 2, '60055.680000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"60055.68\"}', '60055.680000000000', NULL, NULL, '2022-08-19 15:16:58', '2022-08-19 15:16:58', 1),
(21, 29, 1, 'NS01', 2, 2, 1, 1, 50, 1, '2022-08-19', '2022-08-19', '2022-08-19', 1, '154427.250000000000', '{\"mov_igv\": \"27796.91\", \"mov_gravada\": \"154427.25\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '182224.160000000000', NULL, NULL, '2022-08-19 15:22:46', '2022-08-19 15:22:46', 1),
(22, 3, 1, 'NE01', 18, 18, 1, 2, 49, 1, '2022-08-19', '2022-08-19', '2022-08-19', 2, '30171.000000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"30171.00\"}', '30171.000000000000', NULL, NULL, '2022-08-19 15:23:50', '2022-08-19 15:23:50', 1),
(23, 4, 1, 'NS01', 3, 3, 1, 1, 50, 1, '2022-08-19', '2022-08-19', '2022-08-19', 1, '253334.750000000000', '{\"mov_igv\": \"45600.26\", \"mov_gravada\": \"253334.75\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '298935.010000000000', NULL, NULL, '2022-08-19 15:29:15', '2022-08-19 15:29:15', 1),
(24, 30, 1, 'NS01', 4, 4, 1, 1, 50, 1, '2022-08-19', '2022-08-19', '2022-08-19', 1, '33262.500000000000', '{\"mov_igv\": \"5987.25\", \"mov_gravada\": \"33262.50\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '39249.750000000000', NULL, NULL, '2022-08-19 15:30:03', '2022-08-19 15:30:03', 1),
(25, 31, 1, 'NS01', 5, 5, 1, 1, 50, 1, '2022-08-19', '2022-08-19', '2022-08-19', 1, '32427.000000000000', '{\"mov_igv\": \"5836.86\", \"mov_gravada\": \"32427.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '38263.860000000000', NULL, NULL, '2022-08-19 15:30:25', '2022-08-19 15:30:25', 1),
(26, 32, 1, 'NE01', 19, 19, 1, 2, 49, 1, '2022-08-19', '2022-08-19', '2022-08-19', 2, '12506.500000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"12506.50\"}', '12506.500000000000', NULL, NULL, '2022-08-19 15:41:47', '2022-08-19 15:41:47', 1),
(27, 33, 1, 'NE01', 20, 20, 1, 2, 49, 1, '2022-08-19', '2022-08-19', '2022-08-19', 2, '7664.260000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"7664.26\"}', '7664.260000000000', NULL, NULL, '2022-08-19 15:58:02', '2022-08-19 15:58:02', 1),
(28, 32, 1, 'NE01', 21, 21, 1, 2, 49, 1, '2022-08-19', '2022-08-19', '2022-08-19', 2, '7035.800000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"7035.80\"}', '7035.800000000000', NULL, NULL, '2022-08-19 15:58:31', '2022-08-19 15:58:31', 1),
(29, 14, 1, 'NE01', 22, 22, 1, 2, 49, 1, '2022-08-19', '2022-08-19', '2022-08-19', 2, '18955.950000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"18955.95\"}', '18955.950000000000', NULL, NULL, '2022-08-19 16:01:47', '2022-08-19 16:01:47', 1),
(30, 34, 1, 'NE01', 23, 23, 1, 2, 49, 1, '2022-08-19', '2022-08-19', '2022-08-19', 2, '14952.800000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"14952.80\"}', '14952.800000000000', NULL, NULL, '2022-08-19 16:04:39', '2022-08-19 16:04:39', 1),
(31, 35, 1, '01', 53, 6, 1, 1, 2, 1, '2022-08-19', '2022-08-19', '2022-08-19', 1, '196709.520000000000', '{\"mov_igv\": \"35407.71\", \"mov_gravada\": \"196709.52\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '232117.230000000000', NULL, 'YUMMIS BAD EIRL', '2022-08-19 16:33:23', '2022-08-19 16:33:23', 1),
(32, 36, 1, 'NE01', 24, 24, 1, 2, 49, 1, '2022-08-19', '2022-08-19', '2022-08-19', 2, '9804.750000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"9804.75\"}', '9804.750000000000', NULL, NULL, '2022-08-19 16:42:52', '2022-08-19 16:42:52', 1),
(33, 36, 1, 'NE01', 25, 25, 1, 2, 49, 1, '2022-08-19', '2022-08-19', '2022-08-19', 2, '7407.750000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"7407.75\"}', '7407.750000000000', NULL, NULL, '2022-08-19 16:44:29', '2022-08-19 16:44:29', 1),
(34, 16, 1, 'NE01', 26, 26, 1, 2, 49, 1, '2022-08-19', '2022-08-19', '2022-08-19', 2, '61980.250000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"61980.25\"}', '61980.250000000000', NULL, NULL, '2022-08-19 16:50:01', '2022-08-19 16:50:01', 1),
(35, 37, 1, 'NE01', 27, 27, 1, 2, 49, 1, '2022-08-19', '2022-08-19', '2022-08-19', 2, '74005.000000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"74005.00\"}', '74005.000000000000', NULL, NULL, '2022-08-19 17:04:07', '2022-08-19 17:04:07', 1),
(36, 38, 1, 'NE01', 28, 28, 1, 2, 49, 1, '2022-08-19', '2022-08-19', '2022-08-19', 2, '27483.870000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"27483.87\"}', '27483.870000000000', NULL, NULL, '2022-08-19 17:10:24', '2022-08-19 17:10:24', 1),
(37, 39, 1, 'NE01', 29, 29, 1, 2, 49, 1, '2022-08-23', '2022-08-23', '2022-08-23', 2, '72465.300000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"72465.30\"}', '72465.300000000000', NULL, NULL, '2022-08-23 15:28:42', '2022-08-23 15:28:42', 1),
(38, 40, 1, 'NE01', 30, 30, 1, 2, 49, 1, '2022-08-23', '2022-08-23', '2022-08-23', 2, '211932.230000000000', '{\"mov_igv\": \"0.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"211932.23\"}', '211932.230000000000', NULL, NULL, '2022-08-23 15:55:24', '2022-08-23 15:55:24', 1),
(39, 44, 1, 'NE01', 1, 1, 1, 2, 49, 1, '2022-09-06', '2022-09-06', '2022-09-06', 2, '17464.350000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"17464.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"17464.35\"}', '17464.350000000000', NULL, NULL, '2022-09-06 09:44:07', '2022-09-06 09:44:07', 1),
(40, 46, 1, 'NE01', 2, 2, 1, 2, 49, 1, '2022-09-07', '2022-09-07', '2022-09-07', 2, '5184.500000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"5185.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"5184.50\"}', '5184.500000000000', NULL, NULL, '2022-09-07 12:16:59', '2022-09-07 12:16:59', 1),
(41, 37, 1, 'NE01', 3, 3, 1, 2, 49, 1, '2022-09-07', '2022-09-07', '2022-09-07', 2, '62054.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"62054.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"62054.00\"}', '62054.000000000000', NULL, NULL, '2022-09-07 12:27:16', '2022-09-07 12:27:16', 1),
(42, NULL, 1, 'SI01', 1, 1, 1, 16, 1, 1, '2022-09-01', '2022-09-01', '2022-09-01', 2, '990492.670000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"990493.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"990492.67\"}', '990492.670000000000', NULL, NULL, '2022-09-07 13:12:43', '2022-09-07 13:12:43', 1),
(43, 4, 1, 'NS01', 1, 1, 1, 1, 50, 1, '2022-09-07', '2022-09-07', '2022-09-07', 1, '43155.000000000000', '{\"mov_igv\": \"7767.90\", \"mov_neto\": \"43284.47\", \"mov_gravada\": \"43155.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '50922.900000000000', NULL, NULL, '2022-09-07 13:19:41', '2022-09-07 13:19:41', 1),
(44, 4, 1, 'NS01', 2, 2, 1, 1, 50, 1, '2022-09-07', '2022-09-07', '2022-09-07', 1, '60480.000000000000', '{\"mov_igv\": \"10886.40\", \"mov_neto\": \"60661.44\", \"mov_gravada\": \"60480.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '71366.400000000000', NULL, 'OC:4500023132', '2022-09-07 13:20:34', '2022-09-07 13:20:34', 1),
(45, 36, 1, 'NE01', 4, 4, 1, 2, 49, 1, '2022-09-03', '2022-09-03', '2022-09-03', 2, '4510.800000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"4511.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"4510.80\"}', '4510.800000000000', NULL, NULL, '2022-09-07 13:28:01', '2022-09-07 13:28:01', 1),
(46, 47, 1, 'NS01', 3, 3, 1, 1, 50, 1, '2022-09-07', '2022-09-07', '2022-09-07', 1, '9580.650000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"9580.65\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"9580.65\"}', '9580.650000000000', NULL, NULL, '2022-09-07 13:33:27', '2022-09-07 13:33:27', 1),
(47, 45, 1, 'NE01', 5, 5, 1, 2, 49, 1, '2022-09-07', '2022-09-07', '2022-09-07', 2, '8602.500000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"8603.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"8602.50\"}', '8602.500000000000', NULL, NULL, '2022-09-07 13:38:09', '2022-09-07 13:38:09', 1),
(48, 48, 1, 'NS01', 4, 4, 1, 1, 50, 1, '2022-09-07', '2022-09-07', '2022-09-07', 1, '7618.150000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"7618.15\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"7618.15\"}', '7618.150000000000', NULL, NULL, '2022-09-07 15:28:43', '2022-09-07 15:28:43', 1),
(49, 41, 1, 'NE01', 6, 6, 1, 2, 49, 1, '2022-09-06', '2022-09-06', '2022-09-06', 2, '71590.550000000000', '{\"mov_igv\": \"28.08\", \"mov_neto\": \"71618.63\", \"mov_gravada\": \"156.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"71434.55\"}', '71618.630000000000', NULL, NULL, '2022-09-07 15:48:17', '2022-09-07 15:48:17', 1),
(50, 4, 1, 'NS01', 5, 5, 1, 1, 50, 1, '2022-09-07', '2022-09-07', '2022-09-07', 1, '140057.500000000000', '{\"mov_igv\": \"25210.35\", \"mov_neto\": \"140477.67\", \"mov_gravada\": \"140057.50\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '165267.850000000000', NULL, NULL, '2022-09-07 16:01:27', '2022-09-07 16:01:27', 1),
(51, 49, 1, 'NE01', 7, 7, 1, 2, 49, 1, '2022-09-07', '2022-09-07', '2022-09-07', 2, '6336.700000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"6336.70\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"6336.70\"}', '6336.700000000000', NULL, NULL, '2022-09-07 16:54:48', '2022-09-07 16:54:48', 1),
(52, 50, 1, 'NE01', 8, 8, 1, 2, 49, 1, '2022-09-07', '2022-09-07', '2022-09-07', 2, '2479.950000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"2480.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"2479.95\"}', '2479.950000000000', NULL, NULL, '2022-09-07 17:12:09', '2022-09-07 17:12:09', 1),
(53, 40, 1, 'NE01', 9, 9, 1, 2, 49, 1, '2022-09-08', '2022-09-08', '2022-09-08', 2, '121124.300000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"121124.30\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"121124.30\"}', '121124.300000000000', NULL, 'ADELANTO HASTA EL 08/09 - 218179.60\r\nQUEDARIA SALDANDO =  97055.30', '2022-09-08 10:54:07', '2022-09-08 10:54:07', 1),
(54, 36, 1, 'NE01', 10, 10, 1, 2, 49, 1, '2022-09-08', '2022-09-08', '2022-09-08', 2, '710.400000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"710.40\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"710.40\"}', '710.400000000000', NULL, NULL, '2022-09-08 10:54:52', '2022-09-08 10:54:52', 1),
(55, 54, 1, 'NE01', 11, 11, 1, 2, 49, 1, '2022-09-08', '2022-09-08', '2022-09-08', 2, '4688.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"4688.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"4688.00\"}', '4688.000000000000', NULL, NULL, '2022-09-08 11:12:50', '2022-09-08 11:12:50', 1),
(56, 52, 1, 'NE01', 12, 12, 1, 2, 49, 1, '2022-09-07', '2022-09-07', '2022-09-07', 2, '61938.750000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"61938.75\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"61938.75\"}', '61938.750000000000', NULL, NULL, '2022-09-08 16:39:42', '2022-09-08 16:39:42', 1),
(57, 76, 1, 'NE01', 13, 13, 1, 2, 49, 1, '2022-09-08', '2022-09-08', '2022-09-08', 2, '21804.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"21804.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"21804.00\"}', '21804.000000000000', NULL, 'ATV-718 \r\nTRASFERENCIA 1918964437066', '2022-09-08 17:51:27', '2022-09-08 17:51:27', 1),
(58, 4, 1, 'NS01', 6, 6, 1, 1, 50, 1, '2022-09-08', '2022-09-08', '2022-09-08', 1, '44865.000000000000', '{\"mov_igv\": \"8075.70\", \"mov_neto\": \"44999.59\", \"mov_gravada\": \"44865.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '52940.700000000000', NULL, 'GUIA 001-79 \r\nFACTURA 001-53 \r\nOC: 4500023132\r\nMATERIAL: EDGAR - 2 SACAS DE ALEX', '2022-09-08 18:10:47', '2022-09-08 18:10:47', 1),
(59, 75, 1, 'NE01', 14, 14, 1, 2, 49, 1, '2022-09-09', '2022-09-09', '2022-09-09', 2, '21341.350000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"21341.35\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"21341.35\"}', '21341.350000000000', NULL, 'RESPONSABLES DE COMPRA_: VALERIANO-ANIBAL ', '2022-09-09 09:50:37', '2022-09-09 09:50:37', 1),
(60, 21, 1, 'NE01', 15, 15, 1, 2, 49, 1, '2022-09-09', '2022-09-09', '2022-09-09', 2, '2316.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"2316.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"2316.00\"}', '2316.000000000000', NULL, 'RESPONSABLES DE COMPRA_: VALERIANO-ANIBAL ', '2022-09-09 09:51:20', '2022-09-09 09:51:20', 1),
(61, 61, 1, 'NE01', 16, 16, 1, 2, 49, 1, '2022-09-09', '2022-09-09', '2022-09-09', 2, '159541.500000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"159541.50\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"159541.50\"}', '159541.500000000000', NULL, NULL, '2022-09-09 09:52:45', '2022-09-09 09:52:45', 1),
(62, 21, 1, 'NE01', 17, 17, 1, 2, 49, 1, '2022-09-07', '2022-09-07', '2022-09-07', 2, '14626.100000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"14626.10\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"14626.10\"}', '14626.100000000000', NULL, NULL, '2022-09-09 12:27:08', '2022-09-09 12:27:08', 1),
(63, 64, 1, 'NE01', 18, 18, 1, 2, 49, 1, '2022-09-09', '2022-09-09', '2022-09-09', 2, '11246.200000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"11246.20\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"11246.20\"}', '11246.200000000000', NULL, NULL, '2022-09-09 12:31:44', '2022-09-09 12:31:44', 1),
(64, 53, 1, 'NE01', 19, 19, 1, 2, 49, 1, '2022-09-09', '2022-09-09', '2022-09-09', 2, '10708.460000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"10708.46\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"10708.46\"}', '10708.460000000000', NULL, NULL, '2022-09-09 12:39:40', '2022-09-09 12:39:40', 1),
(65, 80, 1, 'NS01', 7, 7, 1, 1, 50, 1, '2022-09-09', '2022-09-09', '2022-09-09', 1, '5424.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"5424.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"5424.00\"}', '5424.000000000000', NULL, NULL, '2022-09-09 16:33:08', '2022-09-09 16:33:08', 1),
(66, 81, 1, 'NE01', 20, 20, 1, 2, 49, 1, '2022-09-10', '2022-09-10', '2022-09-10', 2, '673.500000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"673.50\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"673.50\"}', '673.500000000000', NULL, NULL, '2022-09-10 12:37:13', '2022-09-10 12:37:13', 1),
(67, 4, 1, 'NS01', 8, 8, 1, 1, 50, 1, '2022-09-10', '2022-09-10', '2022-09-10', 1, '43380.000000000000', '{\"mov_igv\": \"7808.40\", \"mov_neto\": \"43510.14\", \"mov_gravada\": \"43380.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '51188.400000000000', NULL, 'OC4500023132\r\nFACTURA 54 MERBLUM', '2022-09-10 14:44:43', '2022-09-10 14:44:43', 1),
(68, 4, 1, 'NS01', 9, 9, 1, 1, 50, 1, '2022-09-10', '2022-09-10', '2022-09-10', 1, '74565.000000000000', '{\"mov_igv\": \"13421.70\", \"mov_neto\": \"74788.69\", \"mov_gravada\": \"74565.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '87986.700000000000', NULL, 'OC4500023132\r\nFACTURA 55 MERBLUM', '2022-09-10 14:45:11', '2022-09-10 14:45:11', 1),
(69, 35, 1, 'NS01', 10, 10, 1, 1, 50, 1, '2022-09-12', '2022-09-12', '2022-09-12', 1, '83325.000000000000', '{\"mov_igv\": \"14998.50\", \"mov_neto\": \"83574.97\", \"mov_gravada\": \"83325.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '98323.500000000000', NULL, NULL, '2022-09-12 08:43:25', '2022-09-12 08:43:25', 1),
(70, 65, 1, 'NS01', 11, 11, 1, 1, 50, 1, '2022-09-12', '2022-09-12', '2022-09-12', 1, '157964.000000000000', '{\"mov_igv\": \"28433.52\", \"mov_neto\": \"158437.89\", \"mov_gravada\": \"157964.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '186397.520000000000', NULL, 'CARGA DE JB', '2022-09-12 10:29:23', '2022-09-12 10:29:23', 1),
(71, 66, 1, 'NS01', 12, 12, 1, 1, 50, 1, '2022-09-12', '2022-09-12', '2022-09-12', 1, '3705.950000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"3705.95\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"3705.95\"}', '3705.950000000000', NULL, NULL, '2022-09-12 10:32:40', '2022-09-12 10:32:40', 1),
(72, 82, 1, 'NE01', 21, 21, 1, 2, 49, 1, '2022-09-12', '2022-09-12', '2022-09-12', 2, '61355.010000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"61355.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"61355.01\"}', '61355.010000000000', NULL, NULL, '2022-09-12 17:59:54', '2022-09-12 17:59:54', 1),
(73, 21, 1, 'NE01', 22, 22, 1, 2, 49, 1, '2022-09-13', '2022-09-13', '2022-09-13', 2, '20520.300000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"20520.30\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"20520.30\"}', '20520.300000000000', NULL, NULL, '2022-09-13 09:49:03', '2022-09-13 09:49:03', 1),
(74, 83, 1, 'NE01', 23, 23, 1, 2, 49, 1, '2022-09-12', '2022-09-12', '2022-09-12', 2, '27000.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"27000.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"27000.00\"}', '27000.000000000000', NULL, NULL, '2022-09-13 09:58:26', '2022-09-13 09:58:26', 1),
(75, 28, 1, 'NE01', 24, 24, 1, 2, 49, 1, '2022-09-13', '2022-09-13', '2022-09-13', 2, '28412.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"28412.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"28412.00\"}', '28412.000000000000', NULL, NULL, '2022-09-13 12:27:24', '2022-09-13 12:27:24', 1),
(76, 67, 1, 'NS01', 13, 13, 1, 1, 50, 1, '2022-09-13', '2022-09-13', '2022-09-13', 1, '119184.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"119184.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"119184.00\"}', '119184.000000000000', NULL, NULL, '2022-09-13 12:46:34', '2022-09-13 12:46:34', 1),
(77, 18, 1, 'NE01', 25, 25, 1, 2, 49, 1, '2022-09-13', '2022-09-13', '2022-09-13', 2, '71272.500000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"71272.50\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"71272.50\"}', '71272.500000000000', NULL, NULL, '2022-09-13 13:15:37', '2022-09-13 13:15:37', 1),
(78, 1, 1, 'NE01', 26, 26, 1, 2, 49, 1, '2022-09-13', '2022-09-13', '2022-09-13', 2, '26481.750000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"26481.75\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"26481.75\"}', '26481.750000000000', NULL, NULL, '2022-09-13 16:43:07', '2022-09-13 16:43:07', 1),
(79, 60, 1, 'NE01', 27, 27, 1, 2, 49, 1, '2022-09-13', '2022-09-13', '2022-09-13', 2, '245422.560000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"245422.55\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"245422.56\"}', '245422.560000000000', NULL, NULL, '2022-09-13 17:55:52', '2022-09-13 17:55:52', 1),
(80, 84, 1, 'NS01', 14, 14, 1, 1, 50, 1, '2022-09-14', '2022-09-14', '2022-09-14', 1, '4125.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"4125.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"4125.00\"}', '4125.000000000000', NULL, NULL, '2022-09-14 15:05:08', '2022-09-14 15:05:08', 1),
(81, 21, 1, 'NE01', 28, 28, 1, 2, 49, 1, '2022-09-14', '2022-09-14', '2022-09-14', 2, '21791.360000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"21791.36\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"21791.36\"}', '21791.360000000000', NULL, NULL, '2022-09-14 15:07:27', '2022-09-14 15:07:27', 1),
(82, 85, 1, 'NE01', 29, 29, 1, 2, 49, 1, '2022-09-14', '2022-09-14', '2022-09-14', 2, '6226.500000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"6226.50\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"6226.50\"}', '6226.500000000000', NULL, NULL, '2022-09-14 16:30:11', '2022-09-14 16:30:11', 1),
(83, 60, 1, 'NE01', 30, 30, 1, 2, 49, 1, '2022-09-14', '2022-09-14', '2022-09-14', 2, '33116.550000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"33116.55\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"33116.55\"}', '33116.550000000000', NULL, NULL, '2022-09-14 18:04:28', '2022-09-14 18:04:28', 1),
(84, 55, 1, 'NE01', 31, 31, 1, 2, 49, 1, '2022-09-15', '2022-09-15', '2022-09-15', 2, '44589.700000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"44589.70\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"44589.70\"}', '44589.700000000000', NULL, NULL, '2022-09-15 10:34:12', '2022-09-15 10:34:12', 1),
(85, 35, 1, 'NS01', 15, 15, 1, 1, 50, 1, '2022-09-15', '2022-09-15', '2022-09-15', 1, '112640.000000000000', '{\"mov_igv\": \"20275.20\", \"mov_neto\": \"112977.92\", \"mov_gravada\": \"112640.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '132915.200000000000', NULL, 'COMPLETO LA ORDEN ', '2022-09-15 11:12:15', '2022-09-15 11:12:15', 1),
(86, 4, 1, 'NS01', 16, 16, 1, 1, 50, 1, '2022-09-15', '2022-09-15', '2022-09-15', 1, '63117.600000000000', '{\"mov_igv\": \"11361.17\", \"mov_neto\": \"63306.95\", \"mov_gravada\": \"63117.60\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '74478.770000000000', NULL, 'ORDEN DE 3 TON ', '2022-09-15 11:16:33', '2022-09-15 11:16:33', 1),
(87, 40, 1, 'NE01', 32, 32, 1, 2, 49, 1, '2022-09-15', '2022-09-15', '2022-09-15', 2, '212426.040000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"212426.04\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"212426.04\"}', '212426.040000000000', NULL, NULL, '2022-09-15 12:07:38', '2022-09-15 12:07:38', 1),
(88, 86, 1, 'NS01', 17, 17, 1, 1, 50, 1, '2022-09-15', '2022-09-15', '2022-09-15', 1, '1340.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"1340.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"1340.00\"}', '1340.000000000000', NULL, NULL, '2022-09-15 16:05:31', '2022-09-15 16:05:31', 1),
(89, 54, 1, 'NE01', 33, 33, 1, 2, 49, 1, '2022-09-15', '2022-09-15', '2022-09-15', 2, '59531.900000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"59531.90\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"59531.90\"}', '59531.900000000000', NULL, NULL, '2022-09-15 16:11:23', '2022-09-15 16:11:23', 1),
(90, 16, 1, 'NE01', 34, 34, 1, 2, 49, 1, '2022-09-15', '2022-09-15', '2022-09-15', 2, '52168.750000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"52168.75\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"52168.75\"}', '52168.750000000000', NULL, NULL, '2022-09-15 16:50:56', '2022-09-15 16:50:56', 1),
(91, 69, 1, 'NS01', 18, 18, 1, 1, 50, 1, '2022-09-15', '2022-09-15', '2022-09-15', 1, '198.750000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"198.75\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"198.75\"}', '198.750000000000', NULL, NULL, '2022-09-15 17:13:57', '2022-09-15 17:13:57', 1),
(92, 87, 1, 'NS01', 19, 19, 1, 1, 50, 1, '2022-09-15', '2022-09-15', '2022-09-15', 1, '9787.500000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"9787.50\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"9787.50\"}', '9787.500000000000', NULL, NULL, '2022-09-15 17:31:53', '2022-09-15 17:31:53', 1),
(93, 4, 1, 'NS01', 20, 20, 1, 1, 50, 1, '2022-09-16', '2022-09-16', '2022-09-16', 1, '69840.000000000000', '{\"mov_igv\": \"12571.20\", \"mov_neto\": \"70049.52\", \"mov_gravada\": \"69840.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '82411.200000000000', NULL, 'MERBLUN 4500023132 PENDIENTE ENTREGAR 25270 KG', '2022-09-16 09:35:25', '2022-09-16 09:35:25', 1),
(94, 36, 1, 'NE01', 35, 35, 1, 2, 49, 1, '2022-09-16', '2022-09-16', '2022-09-16', 2, '43510.050000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"43510.05\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"43510.05\"}', '43510.050000000000', NULL, NULL, '2022-09-16 12:02:57', '2022-09-16 12:02:57', 1),
(95, 18, 1, 'NE01', 36, 36, 1, 2, 49, 1, '2022-09-16', '2022-09-16', '2022-09-16', 2, '27155.800000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"27155.80\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"27155.80\"}', '27155.800000000000', NULL, NULL, '2022-09-16 12:04:18', '2022-09-16 12:04:18', 1),
(96, 66, 1, 'NS01', 21, 21, 1, 1, 50, 1, '2022-09-16', '2022-09-16', '2022-09-16', 1, '9133.250000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"9133.25\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"9133.25\"}', '9133.250000000000', NULL, NULL, '2022-09-17 11:20:54', '2022-09-17 11:20:54', 1),
(97, 58, 1, 'NS01', 22, 22, 1, 1, 50, 1, '2022-09-17', '2022-09-17', '2022-09-17', 1, '14624.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"14624.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"14624.00\"}', '14624.000000000000', NULL, NULL, '2022-09-17 11:21:44', '2022-09-17 11:21:44', 1),
(98, 22, 1, 'NE01', 37, 37, 1, 2, 49, 1, '2022-09-17', '2022-09-17', '2022-09-17', 2, '21244.700000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"21244.70\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"21244.70\"}', '21244.700000000000', NULL, NULL, '2022-09-17 11:24:34', '2022-09-17 11:24:34', 1),
(99, 1, 1, 'NE01', 38, 38, 1, 2, 49, 1, '2022-09-17', '2022-09-17', '2022-09-17', 2, '12078.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"12078.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"12078.00\"}', '12078.000000000000', NULL, NULL, '2022-09-17 14:10:25', '2022-09-17 14:10:25', 1),
(100, 71, 1, 'NE01', 39, 39, 1, 2, 49, 1, '2022-09-17', '2022-09-17', '2022-09-17', 2, '20578.500000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"20578.50\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"20578.50\"}', '20578.500000000000', NULL, NULL, '2022-09-17 14:13:52', '2022-09-17 14:13:52', 1),
(101, 4, 1, 'NS01', 23, 23, 1, 1, 50, 1, '2022-09-19', '2022-09-19', '2022-09-19', 1, '55338.400000000000', '{\"mov_igv\": \"9960.91\", \"mov_neto\": \"55504.42\", \"mov_gravada\": \"55338.40\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '65299.310000000000', NULL, NULL, '2022-09-19 16:17:15', '2022-09-19 16:17:15', 1),
(102, 59, 1, 'NE01', 40, 40, 1, 2, 49, 1, '2022-09-20', '2022-09-20', '2022-09-20', 2, '98760.100000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"98760.10\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"98760.10\"}', '98760.100000000000', NULL, NULL, '2022-09-20 16:28:57', '2022-09-20 16:28:57', 1),
(103, 76, 1, 'NE01', 41, 41, 1, 2, 49, 1, '2022-09-20', '2022-09-20', '2022-09-20', 2, '70477.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"70477.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"70477.00\"}', '70477.000000000000', NULL, NULL, '2022-09-20 16:55:46', '2022-09-20 16:55:46', 1),
(104, 37, 1, 'NE01', 42, 42, 1, 2, 49, 1, '2022-09-20', '2022-09-20', '2022-09-20', 2, '51170.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"51170.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"51170.00\"}', '51170.000000000000', NULL, NULL, '2022-09-20 17:57:49', '2022-09-20 17:57:49', 1),
(105, 4, 1, 'NS01', 24, 24, 1, 1, 50, 1, '2022-09-20', '2022-09-20', '2022-09-20', 1, '52184.000000000000', '{\"mov_igv\": \"9393.12\", \"mov_neto\": \"52340.55\", \"mov_gravada\": \"52184.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '61577.120000000000', NULL, 'NUEVA OC  MATERIAL RICARDO ROJAS', '2022-09-20 18:02:25', '2022-09-20 18:02:25', 1),
(106, 48, 1, 'NE01', 43, 43, 1, 2, 49, 1, '2022-09-20', '2022-09-20', '2022-09-20', 2, '9170.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"9170.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"9170.00\"}', '9170.000000000000', NULL, NULL, '2022-09-20 18:04:08', '2022-09-20 18:04:08', 0),
(107, 35, 1, 'NS01', 25, 25, 1, 1, 50, 1, '2022-09-20', '2022-09-20', '2022-09-20', 1, '130031.000000000000', '{\"mov_igv\": \"23405.58\", \"mov_neto\": \"130421.09\", \"mov_gravada\": \"130031.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '153436.580000000000', NULL, NULL, '2022-09-20 18:21:20', '2022-09-20 18:21:20', 1),
(108, 89, 1, 'NE01', 44, 44, 1, 2, 49, 1, '2022-09-21', '2022-09-21', '2022-09-21', 2, '93047.500000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"93047.50\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"93047.50\"}', '93047.500000000000', NULL, NULL, '2022-09-21 09:57:11', '2022-09-21 09:57:11', 1),
(109, 48, 1, 'NS01', 26, 26, 1, 1, 50, 1, '2022-09-22', '2022-09-22', '2022-09-22', 1, '9170.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"9170.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"9170.00\"}', '9170.000000000000', NULL, NULL, '2022-09-22 10:01:56', '2022-09-22 10:01:56', 1),
(110, 4, 1, 'NS01', 27, 27, 1, 1, 50, 1, '2022-09-22', '2022-09-22', '2022-09-22', 1, '52360.000000000000', '{\"mov_igv\": \"9424.80\", \"mov_neto\": \"52517.08\", \"mov_gravada\": \"52360.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '61784.800000000000', NULL, 'guia 49 ', '2022-09-22 10:25:34', '2022-09-22 10:25:34', 1),
(111, 49, 1, 'NE01', 45, 45, 1, 2, 49, 1, '2022-09-22', '2022-09-22', '2022-09-22', 2, '3065.450000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"3065.45\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"3065.45\"}', '3065.450000000000', NULL, NULL, '2022-09-22 11:55:02', '2022-09-22 11:55:02', 1),
(112, 44, 1, 'NE01', 46, 46, 1, 2, 49, 1, '2022-09-22', '2022-09-22', '2022-09-22', 2, '19115.700000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"19115.70\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"19115.70\"}', '19115.700000000000', NULL, NULL, '2022-09-22 17:46:04', '2022-09-22 17:46:04', 1),
(113, 39, 1, 'NE01', 47, 47, 1, 2, 49, 1, '2022-09-23', '2022-09-23', '2022-09-23', 2, '90109.800000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"90109.80\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"90109.80\"}', '90109.800000000000', NULL, NULL, '2022-09-23 12:39:51', '2022-09-23 12:39:51', 1),
(114, 16, 1, 'NE01', 48, 48, 1, 2, 49, 1, '2022-09-23', '2022-09-23', '2022-09-23', 2, '30826.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"30826.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"30826.00\"}', '30826.000000000000', NULL, NULL, '2022-09-23 13:32:44', '2022-09-23 13:32:44', 1),
(115, 16, 1, 'NE01', 49, 49, 1, 2, 49, 1, '2022-09-23', '2022-09-23', '2022-09-23', 2, '39943.750000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"39943.75\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"39943.75\"}', '39943.750000000000', NULL, NULL, '2022-09-23 15:33:39', '2022-09-23 15:33:39', 1),
(116, 51, 1, 'NE01', 50, 50, 1, 2, 49, 1, '2022-09-23', '2022-09-23', '2022-09-23', 2, '84090.500000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"84090.50\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"84090.50\"}', '84090.500000000000', NULL, NULL, '2022-09-23 16:46:44', '2022-09-23 16:46:44', 1),
(117, 1, 1, 'NE01', 51, 51, 1, 2, 49, 1, '2022-09-24', '2022-09-24', '2022-09-24', 2, '11357.500000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"11357.50\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"11357.50\"}', '11357.500000000000', NULL, NULL, '2022-09-24 14:09:00', '2022-09-24 14:09:00', 1),
(118, 32, 1, 'NE01', 52, 52, 1, 2, 49, 1, '2022-09-24', '2022-09-24', '2022-09-24', 2, '12753.920000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"12753.92\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"12753.92\"}', '12753.920000000000', NULL, NULL, '2022-09-24 14:11:43', '2022-09-24 14:11:43', 1),
(119, 32, 1, 'NE01', 53, 53, 1, 2, 49, 1, '2022-09-24', '2022-09-24', '2022-09-24', 2, '7089.400000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"7089.40\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"7089.40\"}', '7089.400000000000', NULL, NULL, '2022-09-24 14:12:48', '2022-09-24 14:12:48', 1),
(120, 21, 1, 'NE01', 54, 54, 1, 2, 49, 1, '2022-09-24', '2022-09-24', '2022-09-24', 2, '10902.350000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"10902.34\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"10902.35\"}', '10902.350000000000', NULL, NULL, '2022-09-24 14:33:57', '2022-09-24 14:33:57', 1),
(121, 60, 1, 'NE01', 55, 55, 1, 2, 49, 1, '2022-09-24', '2022-09-24', '2022-09-24', 2, '26892.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"26892.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"26892.00\"}', '26892.000000000000', NULL, NULL, '2022-09-24 14:35:49', '2022-09-24 14:35:49', 1),
(122, 90, 1, 'NS01', 28, 28, 1, 1, 50, 1, '2022-09-24', '2022-09-24', '2022-09-24', 1, '27888.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"27888.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"27888.00\"}', '27888.000000000000', NULL, NULL, '2022-09-24 14:40:24', '2022-09-24 14:40:24', 1),
(123, 66, 1, 'NS01', 29, 29, 1, 1, 50, 1, '2022-09-24', '2022-09-24', '2022-09-24', 1, '1581.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"1581.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"1581.00\"}', '1581.000000000000', NULL, NULL, '2022-09-24 14:48:08', '2022-09-24 14:48:08', 1),
(124, 59, 1, 'NE01', 56, 56, 1, 2, 49, 1, '2022-09-24', '2022-09-24', '2022-09-24', 2, '35700.750000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"35700.75\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"35700.75\"}', '35700.750000000000', NULL, NULL, '2022-09-24 14:49:16', '2022-09-24 14:49:16', 1),
(125, 61, 1, 'NE01', 57, 57, 1, 2, 49, 1, '2022-09-24', '2022-09-24', '2022-09-24', 2, '133248.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"133248.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"133248.00\"}', '133248.000000000000', NULL, NULL, '2022-09-24 14:50:08', '2022-09-24 14:50:08', 1),
(126, 4, 1, 'NS01', 30, 30, 1, 1, 50, 1, '2022-09-26', '2022-09-26', '2022-09-26', 1, '85844.000000000000', '{\"mov_igv\": \"15451.92\", \"mov_neto\": \"86101.53\", \"mov_gravada\": \"85844.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '101295.920000000000', NULL, 'grupo lato aponte ', '2022-09-26 09:10:47', '2022-09-26 09:10:47', 1),
(127, 4, 1, 'NS01', 31, 31, 1, 1, 50, 1, '2022-09-26', '2022-09-26', '2022-09-26', 1, '149400.000000000000', '{\"mov_igv\": \"26892.00\", \"mov_neto\": \"149848.20\", \"mov_gravada\": \"149400.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '176292.000000000000', NULL, 'grupo de jorge bustos', '2022-09-26 09:11:59', '2022-09-26 09:11:59', 1),
(128, 4, 1, 'NS01', 32, 32, 1, 1, 50, 1, '2022-09-27', '2022-09-27', '2022-09-27', 1, '198783.750000000000', '{\"mov_igv\": \"35781.08\", \"mov_neto\": \"199380.10\", \"mov_gravada\": \"198783.75\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '234564.830000000000', NULL, NULL, '2022-09-27 09:32:42', '2022-09-27 09:32:42', 1),
(129, 32, 1, 'NE01', 58, 58, 1, 2, 49, 1, '2022-09-27', '2022-09-27', '2022-09-27', 2, '2553.400000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"2553.40\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"2553.40\"}', '2553.400000000000', NULL, NULL, '2022-09-27 09:36:34', '2022-09-27 09:36:34', 1),
(130, 45, 1, 'NE01', 59, 59, 1, 2, 49, 1, '2022-09-27', '2022-09-27', '2022-09-27', 2, '8136.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"8136.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"8136.00\"}', '8136.000000000000', NULL, NULL, '2022-09-27 09:39:15', '2022-09-27 09:39:15', 1),
(131, NULL, 1, 'NS01', 33, 33, 1, 1, 50, 1, '2022-09-25', '2022-09-25', '2022-09-25', 1, '14645.500000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"14645.50\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"14645.50\"}', '14645.500000000000', NULL, NULL, '2022-09-27 10:14:56', '2022-09-27 10:14:56', 1),
(132, NULL, 1, 'NE01', 60, 60, 1, 2, 49, 1, '2022-09-27', '2022-09-27', '2022-09-27', 2, '14645.500000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"14645.50\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"14645.50\"}', '14645.500000000000', NULL, NULL, '2022-09-27 10:17:24', '2022-09-27 10:17:24', 1),
(133, NULL, 1, 'TI01', 1, 1, 1, 18, 1, 1, '2022-09-25', '2022-09-25', '2022-09-25', 1, '19307.000000000000', '{\"mov_igv\": \"3475.26\", \"mov_neto\": \"22782.26\", \"mov_gravada\": \"19307.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '22782.260000000000', NULL, NULL, '2022-09-27 10:20:00', '2022-09-27 10:20:00', 1),
(134, NULL, 1, 'TI01', 1, 2, 1, 18, 1, 1, '2022-09-27', '2022-09-27', '2022-09-27', 2, '19307.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"19307.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"19307.00\"}', '19307.000000000000', NULL, NULL, '2022-09-27 10:20:00', '2022-09-27 10:20:00', 1),
(135, NULL, 1, 'TI01', 2, 2, 1, 18, 1, 1, '2022-09-27', '2022-09-27', '2022-09-27', 1, '19307.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"19307.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"19307.00\"}', '19307.000000000000', NULL, NULL, '2022-09-27 10:23:33', '2022-09-27 10:23:33', 1),
(136, NULL, 1, 'TI01', 2, 3, 1, 18, 1, 1, '2022-09-27', '2022-09-27', '2022-09-27', 2, '2472.220000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"2472.22\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"2472.22\"}', '2472.220000000000', NULL, NULL, '2022-09-27 10:23:33', '2022-09-27 10:23:33', 1),
(137, 92, 1, 'NE01', 61, 61, 1, 2, 49, 1, '2022-09-27', '2022-09-27', '2022-09-27', 2, '16129.250000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"16129.25\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"16129.25\"}', '16129.250000000000', NULL, NULL, '2022-09-27 16:37:49', '2022-09-27 16:37:49', 1),
(138, 76, 1, 'NE01', 62, 62, 1, 2, 49, 1, '2022-09-27', '2022-09-27', '2022-09-27', 2, '55944.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"55944.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"55944.00\"}', '55944.000000000000', NULL, NULL, '2022-09-27 17:47:19', '2022-09-27 17:47:19', 1),
(139, NULL, 1, 'TI01', 3, 3, 1, 18, 1, 1, '2022-09-28', '2022-09-28', '2022-09-28', 1, '1590.770000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"1590.77\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"1590.77\"}', '1590.770000000000', NULL, NULL, '2022-09-28 09:41:22', '2022-09-28 09:41:22', 1),
(140, NULL, 1, 'TI01', 3, 4, 1, 18, 1, 1, '2022-09-28', '2022-09-28', '2022-09-28', 2, '1590.770000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"1590.77\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"1590.77\"}', '1590.770000000000', NULL, NULL, '2022-09-28 09:41:22', '2022-09-28 09:41:22', 1),
(141, 37, 1, 'NE01', 63, 63, 1, 2, 49, 1, '2022-09-28', '2022-09-28', '2022-09-28', 2, '66951.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"66951.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"66951.00\"}', '66951.000000000000', NULL, NULL, '2022-09-28 16:01:00', '2022-09-28 16:01:00', 1),
(142, 98, 1, 'NE01', 64, 64, 1, 2, 49, 1, '2022-09-28', '2022-09-28', '2022-09-28', 2, '561.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"561.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"561.00\"}', '561.000000000000', NULL, NULL, '2022-09-28 17:04:57', '2022-09-28 17:04:57', 1),
(143, 1, 1, 'NE01', 65, 65, 1, 2, 49, 1, '2022-09-28', '2022-09-28', '2022-09-28', 2, '12855.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"12855.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"12855.00\"}', '12855.000000000000', NULL, NULL, '2022-09-28 17:08:06', '2022-09-28 17:08:06', 1),
(144, NULL, 1, 'TI01', 4, 4, 1, 18, 1, 1, '2022-09-29', '2022-09-29', '2022-09-29', 1, '3699.400000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"3699.40\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"3699.40\"}', '3699.400000000000', NULL, NULL, '2022-09-29 08:56:55', '2022-09-29 08:56:55', 1),
(145, NULL, 1, 'TI01', 4, 5, 1, 18, 1, 1, '2022-09-29', '2022-09-29', '2022-09-29', 2, '3699.400000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"3699.40\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"3699.40\"}', '3699.400000000000', NULL, NULL, '2022-09-29 08:56:55', '2022-09-29 08:56:55', 1),
(146, NULL, 1, 'ME01', 1, 1, 1, 13, 1, 1, '2022-09-29', '2022-09-29', '2022-09-29', 1, '383.900000000000', '{\"mov_igv\": \"69.10\", \"mov_neto\": \"453.00\", \"mov_gravada\": \"383.90\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '453.000000000000', NULL, NULL, '2022-09-29 09:00:16', '2022-09-29 09:00:16', 1),
(147, 57, 1, 'NS01', 34, 34, 1, 1, 50, 1, '2022-09-29', '2022-09-29', '2022-09-29', 1, '8344.000000000000', '{\"mov_igv\": \"1501.92\", \"mov_neto\": \"8369.03\", \"mov_gravada\": \"8344.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '9845.920000000000', NULL, NULL, '2022-09-29 09:02:55', '2022-09-29 09:02:55', 1),
(148, 57, 1, 'NS01', 35, 35, 1, 1, 50, 1, '2022-09-29', '2022-09-29', '2022-09-29', 1, '6552.000000000000', '{\"mov_igv\": \"1179.36\", \"mov_neto\": \"6571.66\", \"mov_gravada\": \"6552.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '7731.360000000000', NULL, NULL, '2022-09-29 09:03:34', '2022-09-29 09:03:34', 1),
(149, NULL, 1, 'ME01', 2, 2, 1, 13, 1, 1, '2022-09-29', '2022-09-29', '2022-09-29', 1, '289.800000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"289.80\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"289.80\"}', '289.800000000000', NULL, 'sacos', '2022-09-29 09:24:36', '2022-09-29 09:24:36', 1),
(150, 4, 1, 'NS01', 36, 36, 1, 1, 50, 1, '2022-09-29', '2022-09-29', '2022-09-29', 1, '68332.000000000000', '{\"mov_igv\": \"12299.76\", \"mov_neto\": \"68537.00\", \"mov_gravada\": \"68332.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '80631.760000000000', NULL, NULL, '2022-09-29 09:38:39', '2022-09-29 09:38:39', 1),
(151, NULL, 1, 'ME01', 3, 3, 1, 13, 1, 1, '2022-09-29', '2022-09-29', '2022-09-29', 1, '553.080000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"553.08\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"553.08\"}', '553.080000000000', NULL, 'merma quemado de cobre ', '2022-09-29 09:45:15', '2022-09-29 09:45:15', 1);
INSERT INTO `movimientos` (`mov_id`, `mov_age_id`, `mov_alm_id`, `mov_serie`, `mov_numero`, `mov_t12num`, `mov_gt4_id`, `mov_t12_id`, `mov_t10_id`, `mov_tce_id`, `mov_fechaE`, `mov_fechaR`, `mov_fechaV`, `mov_tipo`, `mov_subtotal`, `mov_igv_id`, `mov_total`, `mov_ncr_id`, `mov_observaciones`, `mov_created`, `mov_updated`, `mov_mstatus`) VALUES
(152, NULL, 1, 'ME01', 4, 4, 1, 13, 1, 1, '2022-09-29', '2022-09-29', '2022-09-29', 1, '299.880000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"299.88\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"299.88\"}', '299.880000000000', NULL, 'sacos en zinsa', '2022-09-29 09:46:02', '2022-09-29 09:46:02', 1),
(153, NULL, 1, 'ME01', 5, 5, 1, 13, 1, 1, '2022-09-29', '2022-09-29', '2022-09-29', 1, '1457.600000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"1457.60\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"1457.60\"}', '1457.600000000000', NULL, 'sacos', '2022-09-29 09:51:17', '2022-09-29 09:51:17', 1),
(154, NULL, 1, 'ME01', 6, 6, 1, 13, 1, 1, '2022-09-29', '2022-09-29', '2022-09-29', 1, '352.200000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"352.20\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"352.20\"}', '352.200000000000', NULL, 'diferencia balanza exportacion', '2022-09-29 09:52:11', '2022-09-29 09:52:11', 1),
(155, NULL, 1, 'ME01', 7, 7, 1, 13, 1, 1, '2022-09-29', '2022-09-29', '2022-09-29', 1, '242.760000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"242.76\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"242.76\"}', '242.760000000000', NULL, 'sacos', '2022-09-29 10:18:18', '2022-09-29 10:18:18', 1),
(156, NULL, 1, 'ME01', 8, 8, 1, 13, 1, 1, '2022-09-29', '2022-09-29', '2022-09-29', 1, '804.480000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"804.48\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"804.48\"}', '804.480000000000', NULL, 'sacos', '2022-09-29 10:18:52', '2022-09-29 10:18:52', 1),
(157, NULL, 1, 'ME01', 9, 9, 1, 13, 1, 1, '2022-09-29', '2022-09-29', '2022-09-29', 1, '742.560000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"742.56\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"742.56\"}', '742.560000000000', NULL, 'sacos', '2022-09-29 10:39:20', '2022-09-29 10:39:20', 1),
(158, NULL, 1, 'ME01', 10, 10, 1, 13, 1, 1, '2022-09-29', '2022-09-29', '2022-09-29', 1, '299.880000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"299.88\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"299.88\"}', '299.880000000000', NULL, 'sacos', '2022-09-29 10:41:19', '2022-09-29 10:41:19', 1),
(159, 19, 1, 'NE01', 66, 66, 1, 2, 49, 1, '2022-09-29', '2022-09-29', '2022-09-29', 2, '40764.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"40764.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"40764.00\"}', '40764.000000000000', NULL, NULL, '2022-09-29 17:20:07', '2022-09-29 17:20:07', 1),
(160, 32, 1, 'NE01', 67, 67, 1, 2, 49, 1, '2022-09-29', '2022-09-29', '2022-09-29', 2, '8763.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"8763.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"8763.00\"}', '8763.000000000000', NULL, NULL, '2022-09-29 17:21:23', '2022-09-29 17:21:23', 1),
(161, 80, 1, 'NS01', 37, 37, 1, 1, 50, 1, '2022-09-29', '2022-09-29', '2022-09-29', 1, '12768.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"12768.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"12768.00\"}', '12768.000000000000', NULL, NULL, '2022-09-29 17:26:25', '2022-09-29 17:26:25', 1),
(162, 67, 1, 'NS01', 38, 38, 1, 1, 50, 1, '2022-09-29', '2022-09-29', '2022-09-29', 1, '527000.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"527000.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"527000.00\"}', '527000.000000000000', NULL, NULL, '2022-09-29 18:33:58', '2022-09-29 18:33:58', 1),
(163, 67, 1, 'NS01', 39, 39, 1, 1, 50, 1, '2022-09-29', '2022-09-29', '2022-09-29', 1, '117606.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"117606.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"117606.00\"}', '117606.000000000000', NULL, NULL, '2022-09-29 18:45:59', '2022-09-29 18:45:59', 1),
(164, 67, 1, 'NS01', 40, 40, 1, 1, 50, 1, '2022-09-29', '2022-09-29', '2022-09-29', 1, '144557.800000000000', '{\"mov_igv\": \"26020.40\", \"mov_neto\": \"170578.20\", \"mov_gravada\": \"144557.80\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '170578.200000000000', NULL, NULL, '2022-09-29 18:46:29', '2022-09-29 18:46:29', 1),
(165, NULL, 1, 'ME01', 11, 11, 1, 13, 1, 1, '2022-09-29', '2022-09-29', '2022-09-29', 1, '352.200000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"352.20\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"352.20\"}', '352.200000000000', NULL, 'MERMA EN VARICACION PESO EXPORT', '2022-09-29 18:47:12', '2022-09-29 18:47:12', 1),
(166, NULL, 1, 'ME01', 12, 12, 1, 13, 1, 1, '2022-09-29', '2022-09-29', '2022-09-29', 1, '1014.300000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"1014.30\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"1014.30\"}', '1014.300000000000', NULL, 'MERMA EN VARICACION PESO EXPORT', '2022-09-29 18:47:35', '2022-09-29 18:47:35', 1),
(167, 40, 1, 'NE01', 68, 68, 1, 2, 49, 1, '2022-09-30', '2022-09-30', '2022-09-30', 2, '229321.130000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"229321.13\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"229321.13\"}', '229321.130000000000', NULL, NULL, '2022-09-30 14:21:31', '2022-09-30 14:21:31', 1),
(168, 54, 1, 'NE01', 69, 69, 1, 2, 49, 1, '2022-09-30', '2022-09-30', '2022-09-30', 2, '46226.500000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"46226.50\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"46226.50\"}', '46226.500000000000', NULL, NULL, '2022-09-30 16:14:47', '2022-09-30 16:14:47', 1),
(169, NULL, 1, 'ME01', 13, 13, 1, 13, 1, 1, '2022-09-30', '2022-09-30', '2022-09-30', 1, '459.910000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"459.91\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"459.91\"}', '459.910000000000', NULL, NULL, '2022-09-30 16:55:57', '2022-09-30 16:55:57', 1),
(170, NULL, 1, 'TI01', 5, 5, 1, 18, 1, 1, '2022-09-30', '2022-09-30', '2022-09-30', 1, '298.320000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"298.32\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"298.32\"}', '298.320000000000', NULL, NULL, '2022-09-30 16:56:32', '2022-09-30 16:56:32', 1),
(171, NULL, 1, 'TI01', 5, 6, 1, 18, 1, 1, '2022-09-30', '2022-09-30', '2022-09-30', 2, '298.320000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"298.32\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"298.32\"}', '298.320000000000', NULL, NULL, '2022-09-30 16:56:32', '2022-09-30 16:56:32', 1),
(172, NULL, 1, 'TI01', 6, 6, 1, 18, 1, 1, '2022-09-30', '2022-09-30', '2022-09-30', 1, '99.440000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"99.44\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"99.44\"}', '99.440000000000', NULL, NULL, '2022-09-30 16:58:34', '2022-09-30 16:58:34', 1),
(173, NULL, 1, 'TI01', 6, 7, 1, 18, 1, 1, '2022-09-30', '2022-09-30', '2022-09-30', 2, '99.440000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"99.44\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"99.44\"}', '99.440000000000', NULL, NULL, '2022-09-30 16:58:34', '2022-09-30 16:58:34', 1),
(174, NULL, 1, 'TI01', 7, 7, 1, 18, 1, 1, '2022-09-30', '2022-09-30', '2022-09-30', 1, '74.580000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"74.58\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"74.58\"}', '74.580000000000', NULL, NULL, '2022-09-30 16:59:20', '2022-09-30 16:59:20', 1),
(175, NULL, 1, 'TI01', 7, 8, 1, 18, 1, 1, '2022-09-30', '2022-09-30', '2022-09-30', 2, '74.580000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"74.58\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"74.58\"}', '74.580000000000', NULL, NULL, '2022-09-30 16:59:20', '2022-09-30 16:59:20', 1),
(176, NULL, 1, 'ME01', 14, 14, 1, 13, 1, 1, '2022-09-30', '2022-09-30', '2022-09-30', 1, '459.910000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"459.91\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"459.91\"}', '459.910000000000', NULL, NULL, '2022-09-30 17:15:09', '2022-09-30 17:15:09', 1),
(177, NULL, 1, 'TI01', 8, 8, 1, 18, 1, 1, '2022-09-30', '2022-09-30', '2022-09-30', 1, '57521.090000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"57521.09\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"57521.09\"}', '57521.090000000000', NULL, NULL, '2022-09-30 17:44:04', '2022-09-30 17:44:04', 1),
(178, NULL, 1, 'TI01', 8, 9, 1, 18, 1, 1, '2022-09-30', '2022-09-30', '2022-09-30', 2, '57521.090000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"57521.09\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"57521.09\"}', '57521.090000000000', NULL, NULL, '2022-09-30 17:44:04', '2022-09-30 17:44:04', 1),
(179, NULL, 1, 'TI01', 9, 9, 1, 18, 1, 1, '2022-09-30', '2022-09-30', '2022-09-30', 1, '981.970000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"981.97\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"981.97\"}', '981.970000000000', NULL, NULL, '2022-09-30 17:45:22', '2022-09-30 17:45:22', 1),
(180, NULL, 1, 'TI01', 9, 10, 1, 18, 1, 1, '2022-09-30', '2022-09-30', '2022-09-30', 2, '981.970000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"981.97\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"981.97\"}', '981.970000000000', NULL, NULL, '2022-09-30 17:45:22', '2022-09-30 17:45:22', 1),
(181, NULL, 1, 'TI01', 10, 10, 1, 18, 1, 1, '2022-09-30', '2022-09-30', '2022-09-30', 1, '131907.220000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"131907.22\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"131907.22\"}', '131907.220000000000', NULL, NULL, '2022-09-30 17:46:56', '2022-09-30 17:46:56', 1),
(182, NULL, 1, 'TI01', 10, 11, 1, 18, 1, 1, '2022-09-30', '2022-09-30', '2022-09-30', 2, '131907.220000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"131907.22\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"131907.22\"}', '131907.220000000000', NULL, NULL, '2022-09-30 17:46:56', '2022-09-30 17:46:56', 1),
(183, NULL, 1, 'TI01', 11, 11, 1, 18, 1, 1, '2022-09-30', '2022-09-30', '2022-09-30', 1, '606.340000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"606.34\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"606.34\"}', '606.340000000000', NULL, NULL, '2022-09-30 17:48:44', '2022-09-30 17:48:44', 1),
(184, NULL, 1, 'TI01', 11, 12, 1, 18, 1, 1, '2022-09-30', '2022-09-30', '2022-09-30', 2, '606.340000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"606.34\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"606.34\"}', '606.340000000000', NULL, NULL, '2022-09-30 17:48:44', '2022-09-30 17:48:44', 1),
(185, NULL, 1, 'ME01', 15, 15, 1, 13, 1, 1, '2022-09-30', '2022-09-30', '2022-09-30', 1, '10876.250000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"10876.25\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"10876.25\"}', '10876.250000000000', NULL, 'MERMA DIFERNECIA DE PESO', '2022-09-30 17:49:28', '2022-09-30 17:49:28', 1),
(186, 4, 1, 'NS01', 41, 41, 1, 1, 50, 1, '2022-09-30', '2022-09-30', '2022-09-30', 1, '42020.000000000000', '{\"mov_igv\": \"7563.60\", \"mov_neto\": \"42146.06\", \"mov_gravada\": \"42020.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '49583.600000000000', NULL, NULL, '2022-09-30 17:55:51', '2022-09-30 17:55:51', 1),
(187, NULL, 1, 'ME01', 16, 16, 1, 13, 1, 1, '2022-09-30', '2022-09-30', '2022-09-30', 1, '10180.170000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"10180.17\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"10180.17\"}', '10180.170000000000', NULL, 'MERMA DIFERENCIA EN PESO', '2022-09-30 17:57:50', '2022-09-30 17:57:50', 1),
(188, NULL, 1, '01', 1, 1, 1, 17, 1, 1, '2022-09-14', '2022-09-14', '2022-09-14', 2, '406.250000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"406.25\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"406.25\"}', '406.250000000000', NULL, NULL, '2022-09-30 18:23:56', '2022-09-30 18:23:56', 1),
(189, NULL, 1, 'TI01', 12, 12, 1, 18, 1, 1, '2022-09-21', '2022-09-21', '2022-09-21', 1, '1299.830000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"1299.83\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"1299.83\"}', '1299.830000000000', NULL, NULL, '2022-09-30 18:27:32', '2022-09-30 18:27:32', 1),
(190, NULL, 1, 'TI01', 12, 13, 1, 18, 1, 1, '2022-09-21', '2022-09-21', '2022-09-21', 2, '1299.830000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"1299.83\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"1299.83\"}', '1299.830000000000', NULL, NULL, '2022-09-30 18:27:32', '2022-09-30 18:27:32', 1),
(192, NULL, 1, 'TI01', 13, 14, 1, 18, 1, 1, '2022-09-15', '2022-09-15', '2022-09-15', 2, '4548.230000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"4548.23\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"4548.23\"}', '4548.230000000000', NULL, NULL, '2022-09-30 18:28:53', '2022-09-30 18:28:53', 1),
(193, NULL, 1, 'SI01', 1, 1, 1, 16, 1, 1, '2022-10-04', '2022-10-04', '2022-10-04', 2, '1.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"1.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"1.00\"}', '1.000000000000', NULL, NULL, '2022-10-04 08:36:52', '2022-10-04 08:36:52', 1),
(194, 4, 1, 'NS01', 1, 1, 1, 1, 50, 1, '2022-10-04', '2022-10-04', '2022-10-04', 1, '48461.000000000000', '{\"mov_igv\": \"8722.98\", \"mov_neto\": \"48606.38\", \"mov_gravada\": \"48461.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '57183.980000000000', NULL, 'placys larger \r\n', '2022-10-04 09:22:06', '2022-10-04 09:22:06', 1),
(195, 99, 1, 'NE01', 1, 1, 1, 2, 49, 1, '2022-10-04', '2022-10-04', '2022-10-04', 2, '26940.500000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"26940.50\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"26940.50\"}', '26940.500000000000', NULL, NULL, '2022-10-04 09:29:14', '2022-10-04 09:29:14', 1),
(196, NULL, 1, 'TI01', 14, 1, 1, 18, 1, 1, '2022-10-04', '2022-10-04', '2022-10-04', 1, '974.610000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"974.61\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"974.61\"}', '974.610000000000', NULL, NULL, '2022-10-04 09:59:09', '2022-10-04 09:59:09', 1),
(197, NULL, 1, 'TI01', 14, 2, 1, 18, 1, 1, '2022-10-04', '2022-10-04', '2022-10-04', 2, '974.610000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"974.61\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"974.61\"}', '974.610000000000', NULL, NULL, '2022-10-04 09:59:09', '2022-10-04 09:59:09', 1),
(198, 66, 1, 'NS01', 42, 2, 1, 1, 50, 1, '2022-10-04', '2022-10-04', '2022-10-04', 1, '1878.500000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"1878.50\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"1878.50\"}', '1878.500000000000', NULL, NULL, '2022-10-04 10:00:18', '2022-10-04 10:00:18', 1),
(199, 50, 1, 'NE01', 70, 2, 1, 2, 49, 1, '2022-10-04', '2022-10-04', '2022-10-04', 2, '3460.960000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"3460.96\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"3460.96\"}', '3460.960000000000', NULL, NULL, '2022-10-04 15:40:02', '2022-10-04 15:40:02', 1),
(200, 35, 1, 'NS01', 43, 3, 1, 1, 50, 1, '2022-10-05', '2022-10-05', '2022-10-05', 1, '84777.000000000000', '{\"mov_igv\": \"15259.86\", \"mov_neto\": \"85031.33\", \"mov_gravada\": \"84777.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '100036.860000000000', NULL, NULL, '2022-10-05 08:49:36', '2022-10-05 08:49:36', 1),
(202, 25, 1, 'NE01', 71, 3, 1, 2, 49, 1, '2022-10-05', '2022-10-05', '2022-10-05', 2, '8105.640000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"8105.64\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"8105.64\"}', '8105.640000000000', NULL, NULL, '2022-10-05 11:00:35', '2022-10-05 11:00:35', 1),
(203, NULL, 1, 'ME01', 17, 1, 1, 13, 1, 1, '2022-09-30', '2022-09-30', '2022-09-30', 1, '4548.230000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"4548.23\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"4548.23\"}', '4548.230000000000', NULL, NULL, '2022-10-05 11:01:15', '2022-10-05 11:01:15', 1),
(204, 25, 1, 'NE01', 72, 4, 1, 2, 49, 1, '2022-10-05', '2022-10-05', '2022-10-05', 2, '11972.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"11972.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"11972.00\"}', '11972.000000000000', NULL, NULL, '2022-10-05 12:13:17', '2022-10-05 12:13:17', 1),
(205, 28, 1, 'NE01', 73, 5, 1, 2, 49, 1, '2022-10-05', '2022-10-05', '2022-10-05', 2, '10508.050000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"10508.05\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"10508.05\"}', '10508.050000000000', NULL, NULL, '2022-10-05 12:33:20', '2022-10-05 12:33:20', 1),
(206, 61, 1, 'NE01', 74, 6, 1, 2, 49, 1, '2022-10-05', '2022-10-05', '2022-10-05', 2, '138710.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"138710.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"138710.00\"}', '138710.000000000000', NULL, NULL, '2022-10-05 13:24:26', '2022-10-05 13:24:26', 1),
(207, 4, 1, 'NS01', 44, 4, 1, 1, 50, 1, '2022-10-06', '2022-10-06', '2022-10-06', 1, '89984.400000000000', '{\"mov_igv\": \"16197.19\", \"mov_neto\": \"90254.35\", \"mov_gravada\": \"89984.40\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '106181.590000000000', NULL, NULL, '2022-10-06 09:48:45', '2022-10-06 09:48:45', 1),
(208, 45, 1, 'NE01', 75, 7, 1, 2, 49, 1, '2022-10-06', '2022-10-06', '2022-10-06', 2, '7730.910000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"7730.90\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"7730.91\"}', '7730.910000000000', NULL, NULL, '2022-10-06 09:56:10', '2022-10-06 09:56:10', 1),
(209, 54, 1, 'NE01', 76, 8, 1, 2, 49, 1, '2022-10-06', '2022-10-06', '2022-10-06', 2, '51737.350000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"51737.35\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"51737.35\"}', '51737.350000000000', NULL, NULL, '2022-10-06 16:32:16', '2022-10-06 16:32:16', 1),
(210, 40, 1, 'NE01', 77, 9, 1, 2, 49, 1, '2022-10-06', '2022-10-06', '2022-10-06', 2, '103167.900000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"103167.90\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"103167.90\"}', '103167.900000000000', NULL, NULL, '2022-10-06 16:37:37', '2022-10-06 16:37:37', 1),
(211, 36, 1, 'NE01', 78, 10, 1, 2, 49, 1, '2022-10-06', '2022-10-06', '2022-10-06', 2, '9247.750000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"9247.75\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"9247.75\"}', '9247.750000000000', NULL, NULL, '2022-10-06 16:40:34', '2022-10-06 16:40:34', 1),
(212, 101, 1, 'NE01', 79, 11, 1, 2, 49, 1, '2022-10-06', '2022-10-06', '2022-10-06', 2, '35082.200000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"35082.20\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"35082.20\"}', '35082.200000000000', NULL, NULL, '2022-10-06 16:45:46', '2022-10-06 16:45:46', 1),
(213, 52, 1, 'NE01', 80, 12, 1, 2, 49, 1, '2022-10-07', '2022-10-07', '2022-10-07', 2, '77520.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"77520.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"77520.00\"}', '77520.000000000000', NULL, NULL, '2022-10-07 09:46:03', '2022-10-07 09:46:03', 1),
(214, 33, 1, 'NE01', 81, 13, 1, 2, 49, 1, '2022-10-07', '2022-10-07', '2022-10-07', 2, '4988.340000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"4988.34\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"4988.34\"}', '4988.340000000000', NULL, NULL, '2022-10-07 10:51:27', '2022-10-07 10:51:27', 1),
(215, 4, 1, 'NS01', 45, 5, 1, 1, 50, 1, '2022-10-07', '2022-10-07', '2022-10-07', 1, '46956.000000000000', '{\"mov_igv\": \"8452.08\", \"mov_neto\": \"47096.87\", \"mov_gravada\": \"46956.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '55408.080000000000', NULL, NULL, '2022-10-07 16:23:45', '2022-10-07 16:23:45', 1),
(216, 1, 1, 'NE01', 82, 14, 1, 2, 49, 1, '2022-10-07', '2022-10-07', '2022-10-07', 2, '19255.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"19255.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"19255.00\"}', '19255.000000000000', NULL, NULL, '2022-10-07 17:49:38', '2022-10-07 17:49:38', 1),
(217, 44, 1, 'NE01', 83, 15, 1, 2, 49, 1, '2022-10-10', '2022-10-10', '2022-10-10', 2, '30451.550000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"30451.55\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"30451.55\"}', '30451.550000000000', NULL, NULL, '2022-10-10 12:33:57', '2022-10-10 12:33:57', 1),
(218, 39, 1, 'NE01', 84, 16, 1, 2, 49, 1, '2022-10-10', '2022-10-10', '2022-10-10', 2, '68090.600000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"68090.60\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"68090.60\"}', '68090.600000000000', NULL, NULL, '2022-10-10 12:49:31', '2022-10-10 12:49:31', 1),
(219, 17, 1, 'NE01', 85, 17, 1, 2, 49, 1, '2022-10-10', '2022-10-10', '2022-10-10', 2, '7891.200000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"7891.20\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"7891.20\"}', '7891.200000000000', NULL, NULL, '2022-10-10 14:55:19', '2022-10-10 14:55:19', 1),
(220, 57, 1, 'NS01', 46, 6, 1, 1, 50, 1, '2022-10-10', '2022-10-10', '2022-10-10', 1, '138396.000000000000', '{\"mov_igv\": \"24911.28\", \"mov_neto\": \"138811.19\", \"mov_gravada\": \"138396.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '163307.280000000000', NULL, NULL, '2022-10-10 15:42:59', '2022-10-10 15:42:59', 1),
(221, 75, 1, 'NE01', 86, 18, 1, 2, 49, 1, '2022-10-10', '2022-10-10', '2022-10-10', 2, '10283.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"10283.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"10283.00\"}', '10283.000000000000', NULL, NULL, '2022-10-10 16:33:20', '2022-10-10 16:33:20', 1),
(222, 14, 1, 'NE01', 87, 19, 1, 2, 49, 1, '2022-10-11', '2022-10-11', '2022-10-11', 2, '19873.200000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"19873.20\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"19873.20\"}', '19873.200000000000', NULL, NULL, '2022-10-11 10:25:58', '2022-10-11 10:25:58', 1),
(223, 60, 1, 'NE01', 88, 20, 1, 2, 49, 1, '2022-10-11', '2022-10-11', '2022-10-11', 2, '29670.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"29670.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"29670.00\"}', '29670.000000000000', NULL, NULL, '2022-10-11 12:37:36', '2022-10-11 12:37:36', 1),
(224, 55, 1, 'NE01', 89, 21, 1, 2, 49, 1, '2022-10-11', '2022-10-11', '2022-10-11', 2, '62956.500000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"62956.50\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"62956.50\"}', '62956.500000000000', NULL, NULL, '2022-10-11 16:34:45', '2022-10-11 16:34:45', 1),
(225, 49, 1, 'NE01', 90, 22, 1, 2, 49, 1, '2022-10-11', '2022-10-11', '2022-10-11', 2, '7535.910000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"7535.90\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"7535.91\"}', '7535.910000000000', NULL, NULL, '2022-10-11 16:48:59', '2022-10-11 16:48:59', 1),
(226, 16, 1, 'NE01', 91, 23, 1, 2, 49, 1, '2022-10-11', '2022-10-11', '2022-10-11', 2, '46908.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"46908.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"46908.00\"}', '46908.000000000000', NULL, NULL, '2022-10-11 17:18:39', '2022-10-11 17:18:39', 1),
(227, 102, 1, 'NE01', 92, 24, 1, 2, 49, 1, '2022-10-12', '2022-10-12', '2022-10-12', 2, '111686.050000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"111686.05\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"111686.05\"}', '111686.050000000000', NULL, NULL, '2022-10-12 10:18:17', '2022-10-12 10:18:17', 1),
(228, 28, 1, 'NE01', 93, 25, 1, 2, 49, 1, '2022-10-12', '2022-10-12', '2022-10-12', 2, '30546.950000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"30546.95\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"30546.95\"}', '30546.950000000000', NULL, NULL, '2022-10-12 10:50:52', '2022-10-12 10:50:52', 1),
(229, 13, 1, 'NE01', 94, 26, 1, 2, 49, 1, '2022-10-12', '2022-10-12', '2022-10-12', 2, '2197.500000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"2197.50\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"2197.50\"}', '2197.500000000000', NULL, NULL, '2022-10-12 10:53:16', '2022-10-12 10:53:16', 1),
(230, 66, 1, 'NE01', 95, 27, 1, 2, 49, 1, '2022-10-12', '2022-10-12', '2022-10-12', 2, '7413.200000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"7413.20\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"7413.20\"}', '7413.200000000000', NULL, NULL, '2022-10-12 11:06:04', '2022-10-12 11:06:04', 1),
(231, 66, 1, 'NS01', 47, 7, 1, 1, 50, 1, '2022-10-12', '2022-10-12', '2022-10-12', 1, '10980.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"10980.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"10980.00\"}', '10980.000000000000', NULL, NULL, '2022-10-12 11:06:52', '2022-10-12 11:06:52', 1),
(232, 103, 1, 'NE01', 96, 28, 1, 2, 49, 1, '2022-10-12', '2022-10-12', '2022-10-12', 2, '28331.400000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"28331.40\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"28331.40\"}', '28331.400000000000', NULL, NULL, '2022-10-12 12:31:39', '2022-10-12 12:31:39', 1),
(233, 36, 1, 'NE01', 97, 29, 1, 2, 49, 1, '2022-10-12', '2022-10-12', '2022-10-12', 2, '40239.650000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"40239.65\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"40239.65\"}', '40239.650000000000', NULL, NULL, '2022-10-12 14:38:50', '2022-10-12 14:38:50', 1),
(234, 4, 1, 'NS01', 48, 8, 1, 1, 50, 1, '2022-10-13', '2022-10-13', '2022-10-13', 1, '122766.000000000000', '{\"mov_igv\": \"22097.88\", \"mov_neto\": \"123134.30\", \"mov_gravada\": \"122766.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '144863.880000000000', NULL, 'CROSSCHILL EIRL ', '2022-10-13 09:04:32', '2022-10-13 09:04:32', 1),
(235, 36, 1, 'NE01', 98, 30, 1, 2, 49, 1, '2022-10-13', '2022-10-13', '2022-10-13', 2, '31903.300000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"31903.30\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"31903.30\"}', '31903.300000000000', NULL, NULL, '2022-10-13 09:23:33', '2022-10-13 09:23:33', 1),
(236, 104, 1, 'NE01', 99, 31, 1, 2, 49, 1, '2022-10-13', '2022-10-13', '2022-10-13', 2, '58818.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"58818.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"58818.00\"}', '58818.000000000000', NULL, NULL, '2022-10-13 10:42:44', '2022-10-13 10:42:44', 1),
(237, 32, 1, 'NE01', 100, 32, 1, 2, 49, 1, '2022-10-13', '2022-10-13', '2022-10-13', 2, '20600.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"20600.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"20600.00\"}', '20600.000000000000', NULL, NULL, '2022-10-13 10:50:35', '2022-10-13 10:50:35', 1),
(238, 32, 1, 'NE01', 101, 33, 1, 2, 49, 1, '2022-10-13', '2022-10-13', '2022-10-13', 2, '765.700000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"765.70\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"765.70\"}', '765.700000000000', NULL, NULL, '2022-10-13 10:51:35', '2022-10-13 10:51:35', 1),
(239, 105, 1, 'NE01', 102, 34, 1, 2, 49, 1, '2022-10-13', '2022-10-13', '2022-10-13', 2, '190995.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"190995.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"190995.00\"}', '190995.000000000000', NULL, NULL, '2022-10-13 10:56:53', '2022-10-13 10:56:53', 1),
(240, 106, 1, 'NE01', 103, 35, 1, 2, 49, 1, '2022-10-13', '2022-10-13', '2022-10-13', 2, '44851.150000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"44851.15\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"44851.15\"}', '44851.150000000000', NULL, NULL, '2022-10-13 18:57:04', '2022-10-13 18:57:04', 1),
(241, 37, 1, 'NE01', 104, 36, 1, 2, 49, 1, '2022-10-14', '2022-10-14', '2022-10-14', 2, '70664.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"70664.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"70664.00\"}', '70664.000000000000', NULL, NULL, '2022-10-14 08:23:35', '2022-10-14 08:23:35', 1),
(242, 4, 1, 'NS01', 49, 9, 1, 1, 50, 1, '2022-10-14', '2022-10-14', '2022-10-14', 1, '68843.000000000000', '{\"mov_igv\": \"12391.74\", \"mov_neto\": \"69049.53\", \"mov_gravada\": \"68843.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"0.00\"}', '81234.740000000000', NULL, 'YUMMIS BAD ', '2022-10-14 08:25:22', '2022-10-14 08:25:22', 1),
(243, 107, 1, 'NE01', 105, 37, 1, 2, 49, 1, '2022-10-14', '2022-10-14', '2022-10-14', 2, '343503.560000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"343503.55\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"343503.56\"}', '343503.560000000000', NULL, NULL, '2022-10-14 12:07:15', '2022-10-14 12:07:15', 1),
(244, 16, 1, 'NE01', 106, 38, 1, 2, 49, 1, '2022-10-14', '2022-10-14', '2022-10-14', 2, '71928.250000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"71928.25\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"71928.25\"}', '71928.250000000000', NULL, NULL, '2022-10-14 12:36:27', '2022-10-14 12:36:27', 1),
(245, 36, 1, 'NE01', 107, 39, 1, 2, 49, 1, '2022-10-14', '2022-10-14', '2022-10-14', 2, '3149.000000000000', '{\"mov_igv\": \"0.00\", \"mov_neto\": \"3149.00\", \"mov_gravada\": \"0.00\", \"mov_inafecta\": \"0.00\", \"mov_exonerada\": \"3149.00\"}', '3149.000000000000', NULL, NULL, '2022-10-14 17:06:09', '2022-10-14 17:06:09', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preliminares`
--

CREATE TABLE `preliminares` (
  `pre_id` bigint(20) NOT NULL,
  `pre_transaccion` int(11) NOT NULL,
  `pre_exportacion` int(11) NOT NULL,
  `pre_anticipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propiedades`
--

CREATE TABLE `propiedades` (
  `pro_id` bigint(20) NOT NULL,
  `pro_nombre` varchar(100) NOT NULL,
  `pro_type` varchar(20) NOT NULL DEFAULT 'varchar',
  `pro_revalue` int(3) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `propiedades`
--

INSERT INTO `propiedades` (`pro_id`, `pro_nombre`, `pro_type`, `pro_revalue`) VALUES
(1, 'color', '3', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsables`
--

CREATE TABLE `responsables` (
  `res_id` bigint(20) NOT NULL,
  `res_tar_id` bigint(20) NOT NULL,
  `res_gus_gpe_id` bigint(20) NOT NULL,
  `res_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rlegal`
--

CREATE TABLE `rlegal` (
  `rle_id` bigint(20) NOT NULL,
  `rle_ruc` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saldobienes`
--

CREATE TABLE `saldobienes` (
  `sal_id` bigint(20) NOT NULL,
  `sal_alm_id` bigint(20) NOT NULL,
  `sal_bie_id` bigint(20) NOT NULL,
  `sal_q` decimal(12,6) NOT NULL,
  `sal_p` decimal(12,6) NOT NULL,
  `sal_stockminimo` decimal(12,6) NOT NULL,
  `sal_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sal_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `satributos`
--

CREATE TABLE `satributos` (
  `sat_id` bigint(20) NOT NULL,
  `sat_ser_id` bigint(20) DEFAULT NULL,
  `sat_val_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `ser_id` bigint(20) NOT NULL,
  `ser_codigo` varchar(12) NOT NULL,
  `ser_nombre` varchar(200) NOT NULL,
  `ser_t6m_id` bigint(20) DEFAULT NULL,
  `ser_ser_id` bigint(20) DEFAULT NULL,
  `ser_alm_id` varchar(200) NOT NULL DEFAULT '[1]',
  `ser_p` decimal(12,6) NOT NULL,
  `ser_igv` tinyint(1) NOT NULL,
  `ser_img` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t1mediopagos`
--

CREATE TABLE `t1mediopagos` (
  `t1m_id` bigint(20) NOT NULL,
  `t1m_codigo` varchar(4) NOT NULL,
  `t1m_descripcion` text NOT NULL,
  `t1m_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `t1mediopagos`
--

INSERT INTO `t1mediopagos` (`t1m_id`, `t1m_codigo`, `t1m_descripcion`, `t1m_status`) VALUES
(1, '001', 'DEPÓSITO EN CUENTA', 1),
(2, '002', 'GIRO', 1),
(3, '003', 'TRANSFERENCIA DE FONDOS', 1),
(4, '004', 'ORDEN DE PAGO', 1),
(5, '005', 'TARJETA DE DÉBITO', 1),
(6, '006', 'TARJETA DE CRÉDITO', 1),
(7, '007', '\"CHEQUES CON LA CLÁUSULA DE \"\"NO NEGOCIABLE\"\", \"\"INTRANSFERIBLES\"\", \"\"NO A LA ORDEN\"\" U OTRA EQUIVALENTE, A QUE SE REFIERE EL INCISO F) DEL ARTICULO 5° DEL DECRETO LEGISLATIVO.\"', 1),
(8, '008', 'EFECTIVO, POR OPERACIONES EN LAS QUE NO EXISTE OBLIGACIÓN DE UTILIZAR MEDIOS DE PAGO', 1),
(9, '009', 'EFECTIVO, EN LOS DEMÁS CASOS', 1),
(10, '010', 'MEDIOS DE PAGO DE COMERCIO EXTERIOR', 1),
(11, '011', 'LETRAS DE CAMBIO', 1),
(12, '101', 'TRANSFERENCIAS - COMERCIO EXTERIOR', 1),
(13, '102', 'CHEQUES BANCARIOS  - COMERCIO EXTERIOR', 1),
(14, '103', 'ORDEN DE PAGO SIMPLE  - COMERCIO EXTERIOR', 1),
(15, '104', 'ORDEN DE PAGO DOCUMENTARIO  - COMERCIO EXTERIOR', 1),
(16, '105', 'REMESA SIMPLE  - COMERCIO EXTERIOR', 1),
(17, '106', 'REMESA DOCUMENTARIA  - COMERCIO EXTERIOR', 1),
(18, '107', 'CARTA DE CRÉDITO SIMPLE  - COMERCIO EXTERIOR', 1),
(19, '108', 'CARTA DE CRÉDITO DOCUMENTARIO  - COMERCIO EXTERIOR', 1),
(20, '999', 'OTROS MEDIOS DE PAGO (ESPECIFICAR)', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t3financieras`
--

CREATE TABLE `t3financieras` (
  `t3f_id` bigint(20) NOT NULL,
  `t3f_codigo` varchar(4) NOT NULL,
  `t3f_descripcion` text NOT NULL,
  `t3f_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t5existencias`
--

CREATE TABLE `t5existencias` (
  `t5e_id` bigint(20) NOT NULL,
  `t5e_codigo` varchar(4) NOT NULL,
  `t5e_descripcion` text NOT NULL,
  `t5e_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `t5existencias`
--

INSERT INTO `t5existencias` (`t5e_id`, `t5e_codigo`, `t5e_descripcion`, `t5e_status`) VALUES
(1, '01', 'MERCADERÍA', 1),
(2, '02', 'PRODUCTO TERMINADO', 1),
(3, '03', 'MATERIAS PRIMAS Y AUXILIARES - MATERIALES', 1),
(4, '04', 'ENVASES Y EMBALAJES', 1),
(5, '05', 'SUMINISTROS DIVERSOS', 1),
(6, '99', 'OTROS (ESPECIFICAR)', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t6medidas`
--

CREATE TABLE `t6medidas` (
  `t6m_id` bigint(20) NOT NULL,
  `t6m_codigo` varchar(4) NOT NULL,
  `t6m_sunat` varchar(4) NOT NULL,
  `t6m_descripcion` text NOT NULL,
  `t6m_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `t6medidas`
--

INSERT INTO `t6medidas` (`t6m_id`, `t6m_codigo`, `t6m_sunat`, `t6m_descripcion`, `t6m_status`) VALUES
(1, '00', '4A', 'BOBINAS', 1),
(2, '00', 'BJ', 'BALDE', 1),
(3, '10', 'BLL', 'BARRILES', 1),
(4, '00', 'BG', 'BOLSA', 1),
(5, '00', 'BO', 'BOTELLAS', 1),
(6, '12', 'BX', 'CAJA', 1),
(7, '00', 'CT', 'CARTONES', 1),
(8, '00', 'CMK', 'CENTIMETRO CUADRADO', 1),
(9, '00', 'CMQ', 'CENTIMETRO CUBICO', 1),
(10, '00', 'CMT', 'CENTIMETRO LINEAL', 1),
(11, '00', 'CEN', 'CIENTO DE UNIDADES', 1),
(12, '00', 'CY', 'CILINDRO', 1),
(13, '00', 'CJ', 'CONOS', 1),
(14, '00', 'DZN', 'DOCENA', 1),
(15, '00', 'DZP', 'DOCENA POR 10**6', 1),
(16, '00', 'BE', 'FARDO', 1),
(17, '09', 'GLI', 'GALON INGLES (4,545956L)', 1),
(18, '06', 'GRM', 'GRAMO', 1),
(19, '00', 'GRO', 'GRUESA', 1),
(20, '00', 'HLT', 'HECTOLITRO', 1),
(21, '00', 'LEF', 'HOJA', 1),
(22, '00', 'SET', 'JUEGO', 1),
(23, '01', 'KGM', 'KILOGRAMO', 1),
(24, '00', 'KTM', 'KILOMETRO', 1),
(25, '00', 'KWH', 'KILOVATIO HORA', 1),
(26, '00', 'KT', 'KIT', 1),
(27, '11', 'CA', 'LATAS', 1),
(28, '02', 'LBR', 'LIBRAS', 1),
(29, '08', 'LTR', 'LITRO', 1),
(30, '00', 'MWH', 'MEGAWATT HORA', 1),
(31, '15', 'MTR', 'METRO', 1),
(32, '00', 'MTK', 'METRO CUADRADO', 1),
(33, '14', 'MTQ', 'METRO CUBICO', 1),
(34, '00', 'MGM', 'MILIGRAMOS', 1),
(35, '00', 'MLT', 'MILILITRO', 1),
(36, '00', 'MMT', 'MILIMETRO', 1),
(37, '00', 'MMK', 'MILIMETRO CUADRADO', 1),
(38, '00', 'MMQ', 'MILIMETRO CUBICO', 1),
(39, '13', 'MLL', 'MILLARES', 1),
(40, '00', 'UM', 'MILLON DE UNIDADES', 1),
(41, '00', 'ONZ', 'ONZAS', 1),
(42, '00', 'PF', 'PALETAS', 1),
(43, '00', 'PK', 'PAQUETE', 1),
(44, '00', 'PR', 'PAR', 1),
(45, '00', 'FOT', 'PIES', 1),
(46, '00', 'FTK', 'PIES CUADRADOS', 1),
(47, '00', 'FTQ', 'PIES CUBICOS', 1),
(48, '00', 'C62', 'PIEZAS', 1),
(49, '00', 'PG', 'PLACAS', 1),
(50, '00', 'ST', 'PLIEGO', 1),
(51, '00', 'INH', 'PULGADAS', 1),
(52, '00', 'RM', 'RESMA', 1),
(53, '00', 'DR', 'TAMBOR', 1),
(54, '05', 'STN', 'TONELADA CORTA', 1),
(55, '03', 'LTN', 'TONELADA LARGA', 1),
(56, '04', 'TNE', 'TONELADAS MÉTRICAS', 1),
(57, '00', 'TU', 'TUBOS', 1),
(58, '07', 'NIU', 'UNIDAD (BIENES)', 1),
(59, '07', 'ZZ', 'UNIDAD (SERVICIOS)', 1),
(60, '00', 'GLL', 'US GALON (3,7843 L)', 1),
(61, '00', 'YRD', 'YARDA', 1),
(62, '00', 'YDK', 'YARDA CUADRADA', 1),
(63, '99', '999', 'OTROS (ESPECIFICAR)', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t7intangibles`
--

CREATE TABLE `t7intangibles` (
  `t7i_id` bigint(20) NOT NULL,
  `t7i_codigo` varchar(4) NOT NULL,
  `t7i_descripcion` text NOT NULL,
  `t7i_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t8libroregistros`
--

CREATE TABLE `t8libroregistros` (
  `t8l_id` bigint(20) NOT NULL,
  `t8l_codigo` varchar(4) NOT NULL,
  `t8l_descripcion` text NOT NULL,
  `t8l_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `t8libroregistros`
--

INSERT INTO `t8libroregistros` (`t8l_id`, `t8l_codigo`, `t8l_descripcion`, `t8l_status`) VALUES
(1, '01', 'LIBRO CAJA Y BANCOS', 1),
(2, '02', 'LIBRO DE INGRESOS Y GASTOS', 1),
(3, '03', 'LIBRO DE INVENTARIOS Y BALANCES', 1),
(4, '04', 'LIBRO DE RETENCIONES INCISOS E) Y F) DEL ARTICULO 34° DE LA LEY DEL IMPUESTO A LA RENTA', 1),
(5, '05', 'LIBRO DIARIO', 1),
(6, '06', 'LIBRO MAYOR', 1),
(7, '07', 'REGISTRO DE ACTIVOS FIJOS', 1),
(8, '08', 'REGISTRO DE COMPRAS', 1),
(9, '09', 'REGISTRO DE CONSIGNACIONES', 1),
(10, '10', 'REGISTRO DE COSTOS', 1),
(11, '11', 'REGISTRO DE HUÉSPEDES', 1),
(12, '12', 'REGISTRO DE INVENTARIO PERMANENTE EN UNIDADES FÍSICAS', 1),
(13, '13', 'REGISTRO DE INVENTARIO PERMANENTE VALORIZADO', 1),
(14, '14', 'REGISTRO DE VENTAS E INGRESOS', 1),
(15, '15', 'REGISTRO DE VENTAS E INGRESOS - ARTÍCULO 23° RESOLUCIÓN DE SUPERINTENDENCIA N° 266-2004/SUNAT', 1),
(16, '16', 'REGISTRO DEL RÉGIMEN DE PERCEPCIONES', 1),
(17, '17', 'REGISTRO DEL RÉGIMEN DE RETENCIONES', 1),
(18, '18', 'REGISTRO IVAP', 1),
(19, '19', 'REGISTRO(S) AUXILIAR(ES) DE ADQUISICIONES - ARTÍCULO 8° RESOLUCIÓN DE SUPERINTENDENCIA N° 022-98/SUNAT', 1),
(20, '20', 'REGISTRO(S) AUXILIAR(ES) DE ADQUISICIONES - INCISO A) PRIMER PÁRRAFO ARTÍCULO 5° RESOLUCIÓN DE SUPERINTENDENCIA N° 021-99/SUNAT', 1),
(21, '21', 'REGISTRO(S) AUXILIAR(ES) DE ADQUISICIONES - INCISO A) PRIMER PÁRRAFO ARTÍCULO 5° RESOLUCIÓN DE SUPERINTENDENCIA N° 142-2001/SUNAT', 1),
(22, '22', 'REGISTRO(S) AUXILIAR(ES) DE ADQUISICIONES - INCISO C) PRIMER PÁRRAFO ARTÍCULO 5° RESOLUCIÓN DE SUPERINTENDENCIA N° 256-2004/SUNAT', 1),
(23, '23', 'REGISTRO(S) AUXILIAR(ES) DE ADQUISICIONES - INCISO A) PRIMER PÁRRAFO ARTÍCULO 5° RESOLUCIÓN DE SUPERINTENDENCIA N° 257-2004/SUNAT', 1),
(24, '24', 'REGISTRO(S) AUXILIAR(ES) DE ADQUISICIONES - INCISO C) PRIMER PÁRRAFO ARTÍCULO 5° RESOLUCIÓN DE SUPERINTENDENCIA N° 258-2004/SUNAT', 1),
(25, '25', 'REGISTRO(S) AUXILIAR(ES) DE ADQUISICIONES - INCISO A) PRIMER PÁRRAFO ARTÍCULO 5° RESOLUCIÓN DE SUPERINTENDENCIA N° 259-2004/SUNAT', 1),
(26, '26', 'REGISTRO DE RETENCIONES ARTÍCULO 77-A DE LA LEY DEL IMPUESTO A LA RENTA', 1),
(27, '27', 'LIBRO DE ACTAS DE LA EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA', 1),
(28, '28', 'LIBRO DE ACTAS DE LA JUNTA GENERAL DE ACCIONISTAS', 1),
(29, '29', 'LIBRO DE ACTAS DEL DIRECTORIO', 1),
(30, '30', 'LIBRO DE MATRÍCULA DE ACCIONES', 1),
(31, '31', 'LIBRO DE PLANILLAS', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t9plancontables`
--

CREATE TABLE `t9plancontables` (
  `t9p_id` bigint(20) NOT NULL,
  `t9p_elemento` varchar(4) NOT NULL,
  `t9p_codigo` bigint(20) NOT NULL,
  `t9p_descripcion` text NOT NULL,
  `t9p_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `t9plancontables`
--

INSERT INTO `t9plancontables` (`t9p_id`, `t9p_elemento`, `t9p_codigo`, `t9p_descripcion`, `t9p_status`) VALUES
(1, '1', 10, 'EFECTIVO Y EQUIVALENTES DE EFECTIVO', 1),
(2, '1', 101, 'Caja', 1),
(3, '1', 102, 'Fondos fijos', 1),
(4, '1', 103, 'Efectivo y cheques en tránsito', 1),
(5, '1', 1031, 'Efectivo en tránsito', 1),
(6, '1', 1032, 'Cheques en tránsito', 1),
(7, '1', 104, 'Cuentas corrientes en instituciones financieras', 1),
(8, '1', 1041, 'Cuentas corrientes operativas', 1),
(9, '1', 1042, 'Cuentas corrientes para fines específicos', 1),
(10, '1', 105, 'Otros equivalentes de efectivo', 1),
(11, '1', 1051, 'Otro equivalentes de efectivo', 1),
(12, '1', 106, 'Depósitos en instituciones financieras', 1),
(13, '1', 1061, 'Depósitos de ahorro', 1),
(14, '1', 1062, 'Depósitos a plazo', 1),
(15, '1', 107, 'Fondos sujetos a restricción', 1),
(16, '1', 1071, 'Fondos en garantía', 1),
(17, '1', 1072, 'Fondos retenidos por mandato de la autoridad', 1),
(18, '1', 1073, 'Otros fondos sujetos a restricción', 1),
(19, '1', 11, 'INVERSIONES FINANCIERAS', 1),
(20, '1', 111, 'Inversiones mantenidas para negociación', 1),
(21, '1', 1111, 'Valores emitidos o garantizados por el Estado', 1),
(22, '1', 11111, 'Costo', 1),
(23, '1', 11112, 'Valor Razonable', 1),
(24, '1', 1112, 'Valores emitidos por el sistema financiero', 1),
(25, '1', 11121, 'Costo', 1),
(26, '1', 11122, 'Valor Razonable', 1),
(27, '1', 1113, 'Valores emitidos por entidades', 1),
(28, '1', 11131, 'Costo', 1),
(29, '1', 11132, 'Valor Razonable', 1),
(30, '1', 1114, 'Otros títulos representativos de deuda', 1),
(31, '1', 11141, 'Costo', 1),
(32, '1', 11142, 'Valor Razonable', 1),
(33, '1', 1115, 'Participaciones en entidades', 1),
(34, '1', 11151, 'Costo', 1),
(35, '1', 11152, 'Valor Razonable', 1),
(36, '1', 112, 'Otras inversiones financieras', 1),
(37, '1', 1121, 'Otras inversiones financieras', 1),
(38, '1', 11211, 'Costo', 1),
(39, '1', 11212, 'Valor Razonable', 1),
(40, '1', 113, 'Activos financieros  Acuerdo de compra', 1),
(41, '1', 1131, 'Inversiones mantenidas para negociación  Acuerdo de compra', 1),
(42, '1', 11311, 'Costo', 1),
(43, '1', 11312, 'Valor Razonable', 1),
(44, '1', 1132, 'Otras inversiones financieras', 1),
(45, '1', 11321, 'Costo', 1),
(46, '1', 11322, 'Valor Razonable', 1),
(47, '1', 12, 'CUENTAS POR COBRAR COMERCIALES  TERCEROS', 1),
(48, '1', 121, 'Facturas- boletas y otros comprobantes por cobrar', 1),
(49, '1', 1211, 'No emitidas', 1),
(50, '1', 1212, 'Emitidas en cartera', 1),
(51, '1', 1213, 'En cobranza', 1),
(52, '1', 1214, 'En descuento', 1),
(53, '1', 122, 'Anticipos de clientes', 1),
(54, '1', 123, 'Letras por cobrar', 1),
(55, '1', 1232, 'En cartera', 1),
(56, '1', 1233, 'En cobranza', 1),
(57, '1', 1234, 'En descuento', 1),
(58, '1', 13, 'CUENTAS POR COBRAR COMERCIALES  RELACIONADAS', 1),
(59, '1', 131, 'Facturas- boletas y otros comprobantes por cobrar', 1),
(60, '1', 1311, 'No emitidas', 1),
(61, '1', 1312, 'En cartera', 1),
(62, '1', 1313, 'En cobranza', 1),
(63, '1', 1314, 'En descuento', 1),
(64, '1', 132, 'Anticipos recibidos', 1),
(65, '1', 1321, 'Anticipos recibidos', 1),
(66, '1', 133, 'Letras por cobrar', 1),
(67, '1', 1331, 'En cartera', 1),
(68, '1', 1332, 'En cobranza', 1),
(69, '1', 1333, 'En descuento', 1),
(70, '1', 14, 'CUENTAS POR COBRAR AL PERSONAL- A LOS ACCIONISTAS (SOCIOS) y DIRECTORES', 1),
(71, '1', 141, 'Personal', 1),
(72, '1', 1411, 'Préstamos', 1),
(73, '1', 1412, 'Adelanto de remuneraciones', 1),
(74, '1', 1413, 'Entregas a rendir cuenta', 1),
(75, '1', 1419, 'Otras cuentas por cobrar al personal', 1),
(76, '1', 142, 'Accionistas (o socios)', 1),
(77, '1', 1421, 'Suscripciones por cobrar a socios o accionistas', 1),
(78, '1', 1422, 'Préstamos', 1),
(79, '1', 143, 'Directores', 1),
(80, '1', 1431, 'Préstamos', 1),
(81, '1', 1432, 'Adelanto de dietas', 1),
(82, '1', 1433, 'Entregas a rendir cuenta', 1),
(83, '1', 149, 'Diversas', 1),
(84, '1', 16, 'CUENTAS POR COBRAR DIVERSAS  TERCEROS', 1),
(85, '1', 161, 'Préstamos', 1),
(86, '1', 1611, 'Con garantía', 1),
(87, '1', 1612, 'Sin garantía', 1),
(88, '1', 162, 'Reclamaciones a terceros', 1),
(89, '1', 1621, 'Compañías aseguradoras', 1),
(90, '1', 1622, 'Transportadoras', 1),
(91, '1', 1623, 'Servicios públicos', 1),
(92, '1', 1624, 'Tributos', 1),
(93, '1', 1629, 'Otras', 1),
(94, '1', 163, 'Intereses- regalías y dividendos', 1),
(95, '1', 1631, 'Intereses', 1),
(96, '1', 1632, 'Regalías', 1),
(97, '1', 1633, 'Dividendos', 1),
(98, '1', 164, 'Depósitos otorgados en garantía', 1),
(99, '1', 1641, 'Préstamos de instituciones financieras', 1),
(100, '1', 1642, 'Préstamos de instituciones no financieras', 1),
(101, '1', 1643, 'Depósitos en garantía por alquileres', 1),
(102, '1', 1649, 'Otros depósitos en garantía', 1),
(103, '1', 165, 'Venta de activo inmovilizado', 1),
(104, '1', 1651, 'Inversión mobiliaria', 1),
(105, '1', 1652, 'Propiedades de inversión', 1),
(106, '1', 1653, 'Propiedad- planta y equipo', 1),
(107, '1', 1654, 'Intangibles', 1),
(108, '1', 1655, 'Activos biológicos', 1),
(109, '1', 1659, 'Otros activos inmovilizados', 1),
(110, '1', 166, 'Activos por instrumentos financieros', 1),
(111, '1', 1661, 'Instrumentos financieros primarios', 1),
(112, '1', 16611, 'Costo', 1),
(113, '1', 16612, 'Valor razonable', 1),
(114, '1', 1662, 'Instrumentos financieros derivados', 1),
(115, '1', 16621, 'Costo', 1),
(116, '1', 16622, 'Valor razonable', 1),
(117, '1', 167, 'Tributos por acreditar', 1),
(118, '1', 1671, 'Pagos a cuenta del impuesto a la renta', 1),
(119, '1', 1672, 'Pagos a cuenta de ITAN', 1),
(120, '1', 1673, 'IGV por acreditar en compras', 1),
(121, '1', 1674, 'IGV por acreditar no domiciliados', 1),
(122, '1', 1675, 'Obras por impuestos', 1),
(123, '1', 169, 'Otras cuentas por cobrar diversas', 1),
(124, '1', 1691, 'Entregas a rendir cuenta a terceros', 1),
(125, '1', 1699, 'Otras cuentas por cobrar diversas', 1),
(126, '1', 17, 'CUENTAS POR COBRAR DIVERSAS  RELACIONADAS', 1),
(127, '1', 171, 'Préstamos', 1),
(128, '1', 1711, 'Con garantía', 1),
(129, '1', 1712, 'Sin garantía', 1),
(130, '1', 173, 'Intereses- regalías y dividendos', 1),
(131, '1', 1731, 'Intereses', 1),
(132, '1', 1732, 'Regalías', 1),
(133, '1', 1733, 'Dividendos', 1),
(134, '1', 174, 'Depósitos otorgados en garantía', 1),
(135, '1', 1741, 'Préstamos de instituciones financieras', 1),
(136, '1', 1742, 'Préstamos de instituciones no financieras', 1),
(137, '1', 1743, 'Depósitos en garantía por alquileres', 1),
(138, '1', 1749, 'Otros depósitos en garantía', 1),
(139, '1', 175, 'Venta de activo inmovilizado', 1),
(140, '1', 1751, 'Inversión mobiliaria', 1),
(141, '1', 1752, 'Propiedades de inversión', 1),
(142, '1', 1753, 'Propiedad- planta y equipo', 1),
(143, '1', 1754, 'Intangibles', 1),
(144, '1', 1755, 'Activos biológicos', 1),
(145, '1', 1759, 'Otros activos inmovilizados', 1),
(146, '1', 176, 'Activos por instrumentos financieros', 1),
(147, '1', 1761, 'Instrumentos financieros primarios', 1),
(148, '1', 17611, 'Costo', 1),
(149, '1', 17612, 'Valor razonable', 1),
(150, '1', 1762, 'Instrumentos financieros derivados', 1),
(151, '1', 17621, 'Costo', 1),
(152, '1', 17622, 'Valor razonable', 1),
(153, '1', 179, 'Otras cuentas por cobrar diversas', 1),
(154, '1', 18, 'SERVICIOS Y OTROS CONTRATADOS POR ANTICIPADO', 1),
(155, '1', 181, 'Costos financieros', 1),
(156, '1', 182, 'Seguros', 1),
(157, '1', 183, 'Alquileres', 1),
(158, '1', 184, 'Primas pagadas por opciones', 1),
(159, '1', 185, 'Mantenimiento de activos inmovilizados', 1),
(160, '1', 189, 'Otros gastos contratados por anticipado', 1),
(161, '1', 19, 'ESTIMACIÓN DE CUENTAS DE COBRANZA DUDOSA', 1),
(162, '1', 191, 'Cuentas por cobrar comerciales  Terceros', 1),
(163, '1', 1911, 'Facturas- boletas y otros comprobantes por cobrar', 1),
(164, '1', 1913, 'Letras por cobrar', 1),
(165, '1', 192, 'Cuentas por cobrar comerciales  Relacionadas', 1),
(166, '1', 1921, 'Facturas- boletas y otros comprobantes por cobrar', 1),
(167, '1', 1923, 'Letras por cobrar', 1),
(168, '1', 193, 'Cuentas por cobrar al personal- a los accionistas (socios) y directores', 1),
(169, '1', 1931, 'Personal', 1),
(170, '1', 1932, 'Accionistas (o socios)', 1),
(171, '1', 1933, 'Directores', 1),
(172, '1', 1939, 'Diversas', 1),
(173, '1', 194, 'Cuentas por cobrar diversas  Terceros', 1),
(174, '1', 1941, 'Préstamos', 1),
(175, '1', 1942, 'Reclamaciones a terceros', 1),
(176, '1', 1943, 'Intereses- regalías y dividendos', 1),
(177, '1', 1944, 'Depósitos otorgados en garantía', 1),
(178, '1', 1945, 'Venta de activo inmovilizado', 1),
(179, '1', 1946, 'Activos por instrumentos financieros', 1),
(180, '1', 1949, 'Otras cuentas por cobrar diversas', 1),
(181, '1', 195, 'Cuentas por cobrar diversas  Relacionadas', 1),
(182, '1', 1951, 'Préstamos', 1),
(183, '1', 1953, 'Intereses- regalías y dividendos', 1),
(184, '1', 1954, 'Depósitos otorgados en garantía', 1),
(185, '1', 1955, 'Venta de activo inmovilizado', 1),
(186, '1', 1956, 'Activos por instrumentos financieros', 1),
(187, '1', 1959, 'Otras cuentas por cobrar diversas', 1),
(188, '2', 20, 'MERCADERÍAS', 1),
(189, '2', 201, 'Mercaderías', 1),
(190, '2', 2011, 'Mercaderías', 1),
(191, '2', 20111, 'Costo', 1),
(192, '2', 20114, 'Valor razonable', 1),
(193, '2', 21, 'PRODUCTOS TERMINADOS', 1),
(194, '2', 211, 'Productos terminados', 1),
(195, '2', 2111, 'Productos terminados', 1),
(196, '2', 21111, 'Costo', 1),
(197, '2', 21113, 'Costo de financiación', 1),
(198, '2', 21114, 'Valor razonable', 1),
(199, '2', 215, 'Inventario de servicios terminados', 1),
(200, '2', 2151, 'Servicios terminados', 1),
(201, '2', 21511, 'Costo', 1),
(202, '2', 22, 'SUBPRODUCTOS- DESECHOS Y DESPERDICIOS', 1),
(203, '2', 221, 'Subproductos', 1),
(204, '2', 222, 'Desechos y desperdicios', 1),
(205, '2', 23, 'PRODUCTOS EN PROCESO', 1),
(206, '2', 231, 'Productos en proceso', 1),
(207, '2', 2311, 'Productos en proceso', 1),
(208, '2', 23111, 'Costo', 1),
(209, '2', 23113, 'Costo de financiación', 1),
(210, '2', 235, 'Inventario de servicios en proceso', 1),
(211, '2', 2351, 'Servicios en proceso', 1),
(212, '2', 23511, 'Costo', 1),
(213, '2', 24, 'MATERIAS PRIMAS', 1),
(214, '2', 241, 'Materias primas', 1),
(215, '2', 2411, 'Materias primas', 1),
(216, '2', 24111, 'Costo', 1),
(217, '2', 24114, 'Valor razonable', 1),
(218, '2', 25, 'MATERIALES AUXILIARES- SUMINISTROS Y REPUESTOS', 1),
(219, '2', 251, 'Materiales auxiliares', 1),
(220, '2', 252, 'Suministros', 1),
(221, '2', 2521, 'Combustibles', 1),
(222, '2', 2522, 'Lubricantes', 1),
(223, '2', 2523, 'Energía', 1),
(224, '2', 2524, 'Otros suministros', 1),
(225, '2', 253, 'Repuestos', 1),
(226, '2', 26, 'ENVASES Y EMBALAJES', 1),
(227, '2', 261, 'Envases', 1),
(228, '2', 262, 'Embalajes', 1),
(229, '2', 27, 'ACTIVOS NO CORRIENTES MANTENIDOS PARA LA VENTA', 1),
(230, '2', 271, 'Propiedades de inversión', 1),
(231, '2', 2711, 'Terrenos', 1),
(232, '2', 27111, 'Costo', 1),
(233, '2', 27112, 'Revaluación', 1),
(234, '2', 27114, 'Valor razonable', 1),
(235, '2', 2712, 'Edificaciones', 1),
(236, '2', 27121, 'Costo', 1),
(237, '2', 27122, 'Revaluación', 1),
(238, '2', 27123, 'Costos de financiación', 1),
(239, '2', 27124, 'Valor razonable', 1),
(240, '2', 272, 'Propiedad- planta y equipo', 1),
(241, '2', 2720, 'Planta productora en producción', 1),
(242, '2', 27201, 'Costo', 1),
(243, '2', 27202, 'Revaluación', 1),
(244, '2', 27203, 'Costo de financiación', 1),
(245, '2', 27204, 'Valor razonable', 1),
(246, '2', 2721, 'Planta productora en desarrollo', 1),
(247, '2', 27211, 'Costo', 1),
(248, '2', 27212, 'Revaluación', 1),
(249, '2', 27213, 'Costo de financiación', 1),
(250, '2', 27214, 'Valor razonable', 1),
(251, '2', 2722, 'Terrenos', 1),
(252, '2', 27221, 'Costo', 1),
(253, '2', 27222, 'Revaluación', 1),
(254, '2', 2723, 'Edificaciones', 1),
(255, '2', 27231, 'Costo', 1),
(256, '2', 27232, 'Revaluación', 1),
(257, '2', 27233, 'Costo de financiación', 1),
(258, '2', 2724, 'Maquinarias y equipos de explotación', 1),
(259, '2', 27241, 'Costo', 1),
(260, '2', 27242, 'Revaluación', 1),
(261, '2', 27243, 'Costo de financiación', 1),
(262, '2', 2725, 'Unidades de transporte', 1),
(263, '2', 27251, 'Costo', 1),
(264, '2', 27252, 'Revaluación', 1),
(265, '2', 2726, 'Muebles y enseres', 1),
(266, '2', 27261, 'Costo', 1),
(267, '2', 27262, 'Revaluación', 1),
(268, '2', 2727, 'Equipos diversos', 1),
(269, '2', 27271, 'Costo', 1),
(270, '2', 27272, 'Revaluación', 1),
(271, '2', 2728, 'Herramientas y unidades de reemplazo', 1),
(272, '2', 27281, 'Costo', 1),
(273, '2', 27282, 'Revaluación', 1),
(274, '2', 2729, 'Obras en curso', 1),
(275, '2', 27291, 'Costo', 1),
(276, '2', 27292, 'Revaluación', 1),
(277, '2', 273, 'Intangibles', 1),
(278, '2', 2731, 'Concesiones- licencias y derechos', 1),
(279, '2', 27311, 'Costo', 1),
(280, '2', 27312, 'Revaluación', 1),
(281, '2', 2732, 'Patentes y propiedad industrial', 1),
(282, '2', 27321, 'Costo', 1),
(283, '2', 27322, 'Revaluación', 1),
(284, '2', 2733, 'Programas de computadora (software)', 1),
(285, '2', 27331, 'Costo', 1),
(286, '2', 27332, 'Revaluación', 1),
(287, '2', 2734, 'Costos de exploración y desarrollo', 1),
(288, '2', 27341, 'Costo', 1),
(289, '2', 27342, 'Revaluación', 1),
(290, '2', 2735, 'Fórmulas- diseños y prototipos', 1),
(291, '2', 27351, 'Costo', 1),
(292, '2', 27352, 'Revaluación', 1),
(293, '2', 2739, 'Otros activos intangibles', 1),
(294, '2', 27391, 'Costo', 1),
(295, '2', 27392, 'Revaluación', 1),
(296, '2', 274, 'Activos biológicos', 1),
(297, '2', 2741, 'Activos biológicos en producción', 1),
(298, '2', 27411, 'Costo', 1),
(299, '2', 27413, 'Costos de financiación', 1),
(300, '2', 27414, 'Valor razonable', 1),
(301, '2', 2742, 'Activos biológicos en desarrollo', 1),
(302, '2', 27421, 'Costo', 1),
(303, '2', 27423, 'Costos de financiación', 1),
(304, '2', 27424, 'Valor razonable', 1),
(305, '2', 275, 'Depreciación acumulada  Propiedades de inversión', 1),
(306, '2', 2752, 'Edificaciones', 1),
(307, '2', 27521, 'Costo', 1),
(308, '2', 27522, 'Revaluación', 1),
(309, '2', 27523, 'Costo de financiación', 1),
(310, '2', 276, 'Depreciación acumulada  Propiedad- planta y equipo', 1),
(311, '2', 2760, 'Planta productora en producción', 1),
(312, '2', 27601, 'Costo', 1),
(313, '2', 27602, 'Revaluación', 1),
(314, '2', 27603, 'Costo de financiación 27604 Valor razonable', 1),
(315, '2', 2762, 'Edificaciones', 1),
(316, '2', 27621, 'Costo', 1),
(317, '2', 27622, 'Revaluación', 1),
(318, '2', 27623, 'Costo de financiación', 1),
(319, '2', 2763, 'Maquinarias y equipo de explotación', 1),
(320, '2', 27631, 'Costo', 1),
(321, '2', 27632, 'Revaluación', 1),
(322, '2', 27633, 'Costo de financiación', 1),
(323, '2', 2764, 'Unidades de transporte', 1),
(324, '2', 27641, 'Costo', 1),
(325, '2', 27642, 'Revaluación', 1),
(326, '2', 2765, 'Muebles y enseres', 1),
(327, '2', 27651, 'Costo', 1),
(328, '2', 27652, 'Revaluación', 1),
(329, '2', 2766, 'Equipos diversos', 1),
(330, '2', 27661, 'Costo', 1),
(331, '2', 27662, 'Revaluación', 1),
(332, '2', 2767, 'Herramientas y unidades de reemplazo', 1),
(333, '2', 27671, 'Costo', 1),
(334, '2', 27672, 'Revaluación', 1),
(335, '2', 277, 'Amortización acumulada  Intangibles', 1),
(336, '2', 2771, 'Concesiones- licencias y derechos', 1),
(337, '2', 27711, 'Costo', 1),
(338, '2', 27712, 'Revaluación', 1),
(339, '2', 2772, 'Patentes y propiedad industrial', 1),
(340, '2', 27721, 'Costo', 1),
(341, '2', 27722, 'Revaluación', 1),
(342, '2', 2773, 'Programas de computadora (software)', 1),
(343, '2', 27731, 'Costo', 1),
(344, '2', 27732, 'Revaluación', 1),
(345, '2', 2774, 'Costos de exploración y desarrollo', 1),
(346, '2', 27741, 'Costo', 1),
(347, '2', 27742, 'Revaluación', 1),
(348, '2', 2775, 'Fórmulas- diseños y prototipos', 1),
(349, '2', 27751, 'Costo', 1),
(350, '2', 27752, 'Revaluación', 1),
(351, '2', 2779, 'Otros activos intangibles', 1),
(352, '2', 27791, 'Costo', 1),
(353, '2', 27792, 'Revaluación', 1),
(354, '2', 278, 'Depreciación acumulada  Activos biológicos', 1),
(355, '2', 2781, 'Activos biológicos en producción', 1),
(356, '2', 27811, 'Costo', 1),
(357, '2', 27813, 'Costo de financiación', 1),
(358, '2', 2782, 'Activos biológicos en desarrollo', 1),
(359, '2', 27821, 'Costo', 1),
(360, '2', 27823, 'Costo de financiación', 1),
(361, '2', 279, 'Desvalorización acumulada', 1),
(362, '2', 2791, 'Propiedad de inversión', 1),
(363, '2', 27910, 'Planta productora en producción', 1),
(364, '2', 27911, 'Planta productora en desarrollo', 1),
(365, '2', 27912, 'Terrenos', 1),
(366, '2', 27913, 'Edificaciones', 1),
(367, '2', 2793, 'Propiedad- planta y equipo', 1),
(368, '2', 27930, 'Plantas productoras en producción', 1),
(369, '2', 27931, 'Planta productora en desarrollo', 1),
(370, '2', 27932, 'Terrenos', 1),
(371, '2', 27933, 'Edificaciones', 1),
(372, '2', 27934, 'Maquinarias y equipos de explotación', 1),
(373, '2', 27935, 'Unidades de transporte', 1),
(374, '2', 27936, 'Muebles y enseres', 1),
(375, '2', 27937, 'Equipos diversos', 1),
(376, '2', 27938, 'Herramientas y unidades de reemplazo', 1),
(377, '2', 2794, 'Intangibles', 1),
(378, '2', 27941, 'Concesiones- licencias y otros derechos', 1),
(379, '2', 27942, 'Patentes y propiedad industrial', 1),
(380, '2', 27943, 'Programas de computadora (software)', 1),
(381, '2', 27944, 'Costos de exploración y desarrollo', 1),
(382, '2', 27945, 'Fórmulas- diseños y prototipos', 1),
(383, '2', 27949, 'Otros activos intangibles', 1),
(384, '2', 2795, 'Activos biológicos', 1),
(385, '2', 27951, 'Activos biológicos en producción', 1),
(386, '2', 27952, 'Activos biológicos en desarrollo', 1),
(387, '2', 28, 'INVENTARIOS POR RECIBIR', 1),
(388, '2', 281, 'Mercaderías', 1),
(389, '2', 284, 'Materias primas', 1),
(390, '2', 285, 'Materiales auxiliares- suministros y repuestos', 1),
(391, '2', 286, 'Envases y embalajes', 1),
(392, '2', 29, 'DESVALORIZACIÓN DE INVENTARIOS', 1),
(393, '2', 291, 'Mercaderías', 1),
(394, '2', 2911, 'Mercaderías', 1),
(395, '2', 29111, 'Costo', 1),
(396, '2', 292, 'Productos terminados', 1),
(397, '2', 2921, 'Productos terminados', 1),
(398, '2', 29211, 'Costo', 1),
(399, '2', 29213, 'Costo de financiación', 1),
(400, '2', 2925, 'Inventario de servicios terminados', 1),
(401, '2', 29251, 'Costo', 1),
(402, '2', 293, 'Subproductos- desechos y desperdicios', 1),
(403, '2', 2931, 'Subproductos', 1),
(404, '2', 2932, 'Desechos y desperdicios', 1),
(405, '2', 294, 'Productos en proceso', 1),
(406, '2', 2941, 'Productos en proceso', 1),
(407, '2', 29411, 'Costo', 1),
(408, '2', 29413, 'Costo de financiación', 1),
(409, '2', 2945, 'Inventario de servicios en proceso', 1),
(410, '2', 295, 'Materias primas', 1),
(411, '2', 2951, 'Materias primas', 1),
(412, '2', 29511, 'Costo', 1),
(413, '2', 296, 'Materiales auxiliares- suministros y repuestos', 1),
(414, '2', 2961, 'Materiales auxiliares', 1),
(415, '2', 2962, 'Suministros', 1),
(416, '2', 2963, 'Repuestos', 1),
(417, '2', 297, 'Envases y embalajes', 1),
(418, '2', 2971, 'Envases', 1),
(419, '2', 2972, 'Embalajes', 1),
(420, '2', 298, 'Existencias por recibir', 1),
(421, '2', 2981, 'Mercaderías', 1),
(422, '2', 2982, 'Materias primas', 1),
(423, '2', 2983, 'Materiales auxiliares- suministros y repuestos', 1),
(424, '2', 2984, 'Envases y embalajes', 1),
(425, '3', 30, 'INVERSIONES MOBILIARIAS', 1),
(426, '3', 301, 'Inversiones a ser mantenidas hasta el vencimiento', 1),
(427, '3', 3011, 'Instrumentos financieros representativos de deuda', 1),
(428, '3', 30111, 'Costo', 1),
(429, '3', 30114, 'Valor razonable', 1),
(430, '3', 302, 'Instrumentos financieros representativos de derecho patrimonial', 1),
(431, '3', 3021, 'Certificados de suscripción preferente', 1),
(432, '3', 3022, 'Acciones representativas de capital social  Comunes', 1),
(433, '3', 30221, 'Costo', 1),
(434, '3', 30224, 'Valor razonable', 1),
(435, '3', 30225, 'Participación patrimonial', 1),
(436, '3', 3023, 'Acciones representativas de capital social  Preferentes', 1),
(437, '3', 30231, 'Costo', 1),
(438, '3', 30234, 'Valor razonable', 1),
(439, '3', 30235, 'Participación patrimonial', 1),
(440, '3', 3024, 'Acciones de inversión', 1),
(441, '3', 30241, 'Costo', 1),
(442, '3', 30244, 'Valor razonable', 1),
(443, '3', 30245, 'Participación patrimonial', 1),
(444, '3', 3028, 'Otros títulos representativos de patrimonio', 1),
(445, '3', 30281, 'Costo', 1),
(446, '3', 30284, 'Valor razonable', 1),
(447, '3', 30285, 'Participación patrimonial', 1),
(448, '3', 303, 'Certificados de participación en fondos - Cuotas', 1),
(449, '3', 3031, 'Fondos de inversión', 1),
(450, '3', 30311, 'Costo', 1),
(451, '3', 30314, 'Valor razonable', 1),
(452, '3', 3032, 'Fondos mutuos', 1),
(453, '3', 30321, 'Costo', 1),
(454, '3', 30324, 'Valor razonable', 1),
(455, '3', 304, 'Participaciones en acuerdos conjuntos', 1),
(456, '3', 3041, 'Operaciones conjuntas', 1),
(457, '3', 30411, 'Costo', 1),
(458, '3', 30414, 'Valor razonable', 1),
(459, '3', 30415, 'Participación patrimonial', 1),
(460, '3', 3042, 'Negocios conjuntos', 1),
(461, '3', 30421, 'Costo', 1),
(462, '3', 30424, 'Valor razonable', 1),
(463, '3', 30425, 'Participación patrimonial', 1),
(464, '3', 308, 'Inversiones mobiliarias  Acuerdos de compra', 1),
(465, '3', 3081, 'Instrumentos financieros representativos de deuda  Acuerdo de compra', 1),
(466, '3', 30811, 'Costo', 1),
(467, '3', 30814, 'Valor razonable', 1),
(468, '3', 3082, 'Instrumentos financieros representativos de derecho patrimonial  Acuerdo de compra', 1),
(469, '3', 30821, 'Costo', 1),
(470, '3', 30824, 'Valor razonable', 1),
(471, '3', 31, 'PROPIEDADES DE INVERSIÓN', 1),
(472, '3', 311, 'Terrenos', 1),
(473, '3', 3111, 'Urbanos', 1),
(474, '3', 31111, 'Costo', 1),
(475, '3', 31112, 'Revaluación', 1),
(476, '3', 31114, 'Valor razonable', 1),
(477, '3', 3112, 'Rurales', 1),
(478, '3', 31121, 'Costo', 1),
(479, '3', 31122, 'Revaluación', 1),
(480, '3', 31124, 'Valor razonable', 1),
(481, '3', 312, 'Edificaciones', 1),
(482, '3', 3121, 'Edificaciones', 1),
(483, '3', 31211, 'Costo', 1),
(484, '3', 31212, 'Revaluación', 1),
(485, '3', 31213, 'Costos de financiación', 1),
(486, '3', 31214, 'Valor razonable', 1),
(487, '3', 313, 'Construcciones en curso', 1),
(488, '3', 3131, 'Edificaciones', 1),
(489, '3', 31311, 'Costo', 1),
(490, '3', 31312, 'Revaluación', 1),
(491, '3', 31313, 'Costos de financiación', 1),
(492, '3', 31314, 'Valor razonable', 1),
(493, '3', 32, 'ACTIVOS POR DERECHO DE USO', 1),
(494, '3', 321, 'Propiedades de inversión - Arrendamiento financiero', 1),
(495, '3', 3211, 'Terrenos', 1),
(496, '3', 32111, 'Costo', 1),
(497, '3', 32112, 'Revaluación', 1),
(498, '3', 32114, 'Valor razonable', 1),
(499, '3', 3212, 'Edificaciones', 1),
(500, '3', 32121, 'Costo', 1),
(501, '3', 32122, 'Revaluación', 1),
(502, '3', 32123, 'Costo de financiación', 1),
(503, '3', 32124, 'Valor razonable', 1),
(504, '3', 322, 'Propiedad- planta y equipo - Arrendamiento financiero', 1),
(505, '3', 3220, 'Planta productora en producción', 1),
(506, '3', 32201, 'Costo', 1),
(507, '3', 32202, 'Revaluación', 1),
(508, '3', 32203, 'Costo de financiación', 1),
(509, '3', 3221, 'Planta productora en desarrollo', 1),
(510, '3', 32211, 'Costo', 1),
(511, '3', 32212, 'Revaluación', 1),
(512, '3', 32213, 'Costo de financiación', 1),
(513, '3', 3222, 'Terrenos', 1),
(514, '3', 32221, 'Costo', 1),
(515, '3', 32222, 'Revaluación', 1),
(516, '3', 3223, 'Edificaciones', 1),
(517, '3', 32231, 'Costo', 1),
(518, '3', 32232, 'Revaluación', 1),
(519, '3', 32233, 'Costo de financiación', 1),
(520, '3', 3224, 'Maquinaria y equipo de explotación', 1),
(521, '3', 32241, 'Costo', 1),
(522, '3', 32242, 'Revaluación', 1),
(523, '3', 32243, 'Costo de financiación', 1),
(524, '3', 3225, 'Unidades de transporte', 1),
(525, '3', 32251, 'Costo', 1),
(526, '3', 32252, 'Revaluación', 1),
(527, '3', 3226, 'Muebles y enseres', 1),
(528, '3', 32261, 'Costo', 1),
(529, '3', 32262, 'Revaluación', 1),
(530, '3', 3227, 'Equipos diversos', 1),
(531, '3', 32271, 'Costo', 1),
(532, '3', 32272, 'Revaluación', 1),
(533, '3', 3228, 'Herramientas y unidades de reemplazo', 1),
(534, '3', 32281, 'Costo', 1),
(535, '3', 32282, 'Revaluación', 1),
(536, '3', 323, 'Propiedad- planta y equipo - Arrendamiento operativo', 1),
(537, '3', 3230, 'Planta productora en producción', 1),
(538, '3', 32301, 'Costo', 1),
(539, '3', 32302, 'Revaluación', 1),
(540, '3', 3232, 'Terrenos', 1),
(541, '3', 32321, 'Costo', 1),
(542, '3', 3233, 'Edificaciones', 1),
(543, '3', 32331, 'Costo', 1),
(544, '3', 32332, 'Revaluación', 1),
(545, '3', 3234, 'Maquinaria y equipo de explotación', 1),
(546, '3', 32341, 'Costo', 1),
(547, '3', 32342, 'Revaluación', 1),
(548, '3', 3235, 'Unidades de transporte', 1),
(549, '3', 32351, 'Costo', 1),
(550, '3', 32352, 'Revaluación', 1),
(551, '3', 3236, 'Equipos diversos', 1),
(552, '3', 32361, 'Costo', 1),
(553, '3', 32362, 'Revaluación', 1),
(554, '3', 33, 'PROPIEDAD- PLANTA Y EQUIPO', 1),
(555, '3', 330, 'Planta productora', 1),
(556, '3', 3301, 'Planta productora en producción', 1),
(557, '3', 33011, 'Costo', 1),
(558, '3', 33012, 'Revaluación', 1),
(559, '3', 33013, 'Costo de financiación', 1),
(560, '3', 33014, 'Valor razonable', 1),
(561, '3', 3302, 'Planta productora en desarrollo', 1),
(562, '3', 33021, 'Costo', 1),
(563, '3', 33022, 'Revaluación', 1),
(564, '3', 33023, 'Costo de financiación', 1),
(565, '3', 33024, 'Valor razonable', 1),
(566, '3', 331, 'Terrenos', 1),
(567, '3', 3311, 'Terrenos', 1),
(568, '3', 33111, 'Costo', 1),
(569, '3', 33112, 'Revaluación', 1),
(570, '3', 332, 'Edificaciones', 1),
(571, '3', 3321, 'Edificaciones', 1),
(572, '3', 33211, 'Costo', 1),
(573, '3', 33212, 'Revaluación', 1),
(574, '3', 33213, 'Costo de financiación', 1),
(575, '3', 3324, 'Instalaciones', 1),
(576, '3', 33241, 'Costo', 1),
(577, '3', 33242, 'Revaluación', 1),
(578, '3', 33243, 'Costo de financiación', 1),
(579, '3', 3325, 'Mejoras en locales arrendados.', 1),
(580, '3', 33251, 'Costo', 1),
(581, '3', 33252, 'Revaluación', 1),
(582, '3', 33253, 'Costo de Financiación', 1),
(583, '3', 333, 'Maquinaria y equipo de explotación', 1),
(584, '3', 3331, 'Maquinaria y equipo de explotación', 1),
(585, '3', 33311, 'Costo', 1),
(586, '3', 33312, 'Revaluación', 1),
(587, '3', 33313, 'Costo de financiación', 1),
(588, '3', 334, 'Unidades de transporte', 1),
(589, '3', 3341, 'Vehículos motorizados', 1),
(590, '3', 33411, 'Costo', 1),
(591, '3', 33412, 'Revaluación', 1),
(592, '3', 3342, 'Vehículos no motorizados', 1),
(593, '3', 33421, 'Costo', 1),
(594, '3', 33422, 'Revaluación', 1),
(595, '3', 335, 'Muebles y enseres', 1),
(596, '3', 3351, 'Muebles', 1),
(597, '3', 33511, 'Costo', 1),
(598, '3', 33512, 'Revaluación', 1),
(599, '3', 3352, 'Enseres', 1),
(600, '3', 33521, 'Costo', 1),
(601, '3', 33522, 'Revaluación', 1),
(602, '3', 336, 'Equipos diversos', 1),
(603, '3', 3361, 'Equipo para procesamiento de información', 1),
(604, '3', 33611, 'Costo', 1),
(605, '3', 33612, 'Revaluación', 1),
(606, '3', 3362, 'Equipo de comunicación', 1),
(607, '3', 33621, 'Costo', 1),
(608, '3', 33622, 'Revaluación', 1),
(609, '3', 3363, 'Equipo de seguridad', 1),
(610, '3', 33631, 'Costo', 1),
(611, '3', 33632, 'Revaluación', 1),
(612, '3', 3364, 'Equipo de medio ambiente', 1),
(613, '3', 33641, 'Costo', 1),
(614, '3', 33642, 'Revaluación', 1),
(615, '3', 3369, 'Otros equipos', 1),
(616, '3', 33691, 'Costo', 1),
(617, '3', 33692, 'Revaluación', 1),
(618, '3', 337, 'Herramientas y unidades de reemplazo', 1),
(619, '3', 3371, 'Herramientas', 1),
(620, '3', 33711, 'Costo', 1),
(621, '3', 33712, 'Revaluación', 1),
(622, '3', 3372, 'Unidades de reemplazo', 1),
(623, '3', 33721, 'Costo', 1),
(624, '3', 33722, 'Revaluación', 1),
(625, '3', 338, 'Unidades por recibir', 1),
(626, '3', 3381, 'Maquinaria y equipo de explotación', 1),
(627, '3', 3382, 'Equipo de transporte', 1),
(628, '3', 3383, 'Muebles y enseres', 1),
(629, '3', 3386, 'Equipos diversos', 1),
(630, '3', 3387, 'Herramientas y unidades de reemplazo', 1),
(631, '3', 339, 'Obras en curso', 1),
(632, '3', 3391, 'Adecuación de terrenos', 1),
(633, '3', 3392, 'Edificaciones en curso', 1),
(634, '3', 33921, 'Costo', 1),
(635, '3', 33922, 'Costo de financiación', 1),
(636, '3', 3393, 'Maquinaria en montaje', 1),
(637, '3', 33931, 'Costo', 1),
(638, '3', 33932, 'Costo de financiación', 1),
(639, '3', 34, 'INTANGIBLES', 1),
(640, '3', 341, 'Concesiones- licencias y otros derechos', 1),
(641, '3', 3411, 'Derechos por concesiones', 1),
(642, '3', 34111, 'Costo', 1),
(643, '3', 34112, 'Revaluación', 1),
(644, '3', 3412, 'Licencias', 1),
(645, '3', 34121, 'Costo', 1),
(646, '3', 34122, 'Revaluación', 1),
(647, '3', 3419, 'Otros derechos', 1),
(648, '3', 34191, 'Costo', 1),
(649, '3', 34192, 'Revaluación', 1),
(650, '3', 342, 'Patentes y propiedad industrial', 1),
(651, '3', 3421, 'Patentes', 1),
(652, '3', 34211, 'Costo', 1),
(653, '3', 34212, 'Revaluación', 1),
(654, '3', 3422, 'Marcas', 1),
(655, '3', 34221, 'Costo', 1),
(656, '3', 34222, 'Revaluación', 1),
(657, '3', 343, 'Programas de computadora (software)', 1),
(658, '3', 3431, 'Aplicaciones informáticas', 1),
(659, '3', 34311, 'Costo', 1),
(660, '3', 34312, 'Revaluación', 1),
(661, '3', 344, 'Costos de exploración y desarrollo', 1),
(662, '3', 3441, 'Costos de exploración', 1),
(663, '3', 34411, 'Costo', 1),
(664, '3', 34412, 'Revaluación', 1),
(665, '3', 34413, 'Costo de financiación', 1),
(666, '3', 3442, 'Costos de desarrollo', 1),
(667, '3', 34421, 'Costo', 1),
(668, '3', 34422, 'Revaluación', 1),
(669, '3', 34423, 'Costo de financiación', 1),
(670, '3', 345, 'Fórmulas- diseños y prototipos', 1),
(671, '3', 3451, 'Fórmulas', 1),
(672, '3', 34511, 'Costo', 1),
(673, '3', 34512, 'Revaluación', 1),
(674, '3', 3452, 'Diseños y prototipos', 1),
(675, '3', 34521, 'Costo', 1),
(676, '3', 34522, 'Revaluación', 1),
(677, '3', 347, 'Plusvalía mercantil', 1),
(678, '3', 3471, 'Plusvalía mercantil', 1),
(679, '3', 349, 'Otros activos intangibles', 1),
(680, '3', 3491, 'Otros activos intangibles', 1),
(681, '3', 34911, 'Costo', 1),
(682, '3', 34912, 'Revaluación', 1),
(683, '3', 35, 'ACTIVOS BIOLÓGICOS', 1),
(684, '3', 351, 'Activos biológicos en producción', 1),
(685, '3', 3511, 'De origen animal', 1),
(686, '3', 35111, 'Costo', 1),
(687, '3', 35113, 'Costo de financiación', 1),
(688, '3', 35114, 'Valor razonable', 1),
(689, '3', 3512, 'De origen vegetal', 1),
(690, '3', 35121, 'Costo', 1),
(691, '3', 35123, 'Costo de financiación', 1),
(692, '3', 35124, 'Valor razonable', 1),
(693, '3', 352, 'Activos biológicos en desarrollo', 1),
(694, '3', 3521, 'De origen animal', 1),
(695, '3', 35211, 'Costo', 1),
(696, '3', 35213, 'Costo de financiación', 1),
(697, '3', 35214, 'Valor razonable', 1),
(698, '3', 3522, 'De origen vegetal', 1),
(699, '3', 35221, 'Costo', 1),
(700, '3', 35223, 'Costo de financiación', 1),
(701, '3', 35224, 'Valor razonable', 1),
(702, '3', 36, 'DESVALORIZACIÓN DE ACTIVO INMOVILIZADO', 1),
(703, '3', 361, 'Desvalorización de propiedades de inversión', 1),
(704, '3', 3611, 'Terrenos', 1),
(705, '3', 36111, 'Costo', 1),
(706, '3', 36112, 'Revaluación', 1),
(707, '3', 3612, 'Edificaciones', 1),
(708, '3', 36121, 'Costo', 1),
(709, '3', 36122, 'Revaluación', 1),
(710, '3', 36123, 'Costo de financiación', 1),
(711, '3', 3613, 'Construcciones en curso - edificaciones', 1),
(712, '3', 36131, 'Costo', 1),
(713, '3', 36132, 'Revaluación', 1),
(714, '3', 36133, 'Costo de financiación', 1),
(715, '3', 362, 'Desvalorización de propiedades de inversión - Arrendamiento financiero', 1),
(716, '3', 3621, 'Terrenos', 1),
(717, '3', 36211, 'Costo', 1),
(718, '3', 36212, 'Revaluación', 1),
(719, '3', 3622, 'Edificaciones', 1),
(720, '3', 36221, 'Costo', 1),
(721, '3', 36222, 'Revaluación', 1),
(722, '3', 36223, 'Costo de financiación', 1),
(723, '3', 363, 'Desvalorización de propiedad- planta y equipo - Arrendamiento financiero', 1),
(724, '3', 3631, 'Terrenos', 1),
(725, '3', 36311, 'Costo', 1),
(726, '3', 36312, 'Revaluación', 1),
(727, '3', 3632, 'Edificaciones', 1),
(728, '3', 36321, 'Costo', 1),
(729, '3', 36322, 'Revaluación', 1),
(730, '3', 36323, 'Costo de financiación', 1),
(731, '3', 3633, 'Maquinaria y equipo de explotación', 1),
(732, '3', 36331, 'Costo', 1),
(733, '3', 36332, 'Revaluación', 1),
(734, '3', 36333, 'Costo de financiación', 1),
(735, '3', 3634, 'Unidades de transporte', 1),
(736, '3', 36341, 'Costo', 1),
(737, '3', 36342, 'Revaluación', 1),
(738, '3', 3635, 'Muebles y enseres', 1),
(739, '3', 36351, 'Costo', 1),
(740, '3', 36352, 'Revaluación', 1),
(741, '3', 3636, 'Equipos diversos', 1),
(742, '3', 36361, 'Costo', 1),
(743, '3', 36362, 'Revaluación', 1),
(744, '3', 364, 'Desvalorización de propiedad- planta y equipo', 1),
(745, '3', 3640, 'Planta productora en producción', 1),
(746, '3', 36401, 'Costo', 1),
(747, '3', 36402, 'Planta productora en producción - Revaluación', 1),
(748, '3', 36403, 'Planta productora en producción - Costo de financiación', 1),
(749, '3', 33404, 'Planta productora en producción - Valor razonable', 1),
(750, '3', 36405, 'Planta productora en desarrollo - Costo', 1),
(751, '3', 36406, 'Planta productora en desarrollo - Revaluación', 1),
(752, '3', 36407, 'Planta productora en desarrollo - Costo de financiación', 1),
(753, '3', 36408, 'Planta productora en desarrollo - Valor razonable', 1),
(754, '3', 3641, 'Terrenos', 1),
(755, '3', 36411, 'Costo', 1),
(756, '3', 36412, 'Revaluación', 1),
(757, '3', 3642, 'Edificaciones', 1),
(758, '3', 36421, 'Edificaciones - Costo', 1),
(759, '3', 36422, 'Edificaciones - Revaluación', 1),
(760, '3', 36423, 'Edificaciones - Costo de financiación', 1),
(761, '3', 36424, 'Instalaciones - Costo', 1),
(762, '3', 36425, 'Instalaciones - Revaluación', 1),
(763, '3', 36426, 'Instalaciones - Costo de financiación', 1),
(764, '3', 36427, 'Mejoras en locales arrendados - Costo', 1),
(765, '3', 36428, 'Mejoras en locales arrendados - Revaluación', 1),
(766, '3', 36429, 'Mejoras en locales arrendados - Costo de financiación', 1),
(767, '3', 3643, 'Maquinaria y equipo de explotación', 1),
(768, '3', 36431, 'Costo', 1),
(769, '3', 36432, 'Revaluación', 1),
(770, '3', 36433, 'Costo de financiación', 1),
(771, '3', 3644, 'Unidades de transporte', 1),
(772, '3', 36441, 'Costo', 1),
(773, '3', 36442, 'Revaluación', 1),
(774, '3', 3645, 'Muebles y enseres', 1),
(775, '3', 36451, 'Costo', 1),
(776, '3', 36452, 'Revaluación', 1),
(777, '3', 3646, 'Equipos diversos', 1),
(778, '3', 36461, 'Costo', 1),
(779, '3', 36462, 'Revaluación', 1),
(780, '3', 3647, 'Herramientas y unidades de reemplazo', 1),
(781, '3', 36471, 'Herramientas - Costo', 1),
(782, '3', 38472, 'Herramientas - Revaluación', 1),
(783, '3', 38473, 'Unidades de reemplazo - costo', 1),
(784, '3', 38474, 'Unidades de reemplazo - Revaluación', 1),
(785, '3', 3649, 'Obras en curso', 1),
(786, '3', 36491, 'Costo', 1),
(787, '3', 36492, 'Revaluación', 1),
(788, '3', 365, 'Desvalorización de intangibles', 1),
(789, '3', 3651, 'Concesiones- licencias y otros derechos', 1),
(790, '3', 36511, 'Costo', 1),
(791, '3', 36512, 'Revaluación', 1),
(792, '3', 3652, 'Patentes y propiedad industrial', 1),
(793, '3', 36521, 'Costo', 1),
(794, '3', 36522, 'Revaluación', 1),
(795, '3', 3653, 'Programas de computadora (software)', 1),
(796, '3', 36531, 'Costo', 1),
(797, '3', 36532, 'Revaluación', 1),
(798, '3', 3654, 'Costos de exploración y desarrollo', 1),
(799, '3', 36541, 'Costo', 1),
(800, '3', 36542, 'Revaluación', 1),
(801, '3', 36543, 'Costo de financiación', 1),
(802, '3', 3655, 'Fórmulas- diseños y prototipos', 1),
(803, '3', 36551, 'Costo', 1),
(804, '3', 36552, 'Revaluación', 1),
(805, '3', 3657, 'Plusvalía mercantil', 1),
(806, '3', 3659, 'Otros activos intangibles', 1),
(807, '3', 36591, 'Costo', 1),
(808, '3', 36592, 'Revaluación', 1),
(809, '3', 366, 'Desvalorización de activos biológicos', 1),
(810, '3', 3661, 'Activos biológicos en producción', 1),
(811, '3', 36611, 'Costo', 1),
(812, '3', 36613, 'Costo de financiación', 1),
(813, '3', 3662, 'Activos biológicos en desarrollo', 1),
(814, '3', 36621, 'Costo', 1),
(815, '3', 36622, 'Costo de financiación', 1),
(816, '3', 367, 'Desvalorización de inversiones mobiliarias', 1),
(817, '3', 3671, 'Inversiones a ser mantenidas hasta el vencimiento', 1),
(818, '3', 36711, 'Costo', 1),
(819, '3', 3672, 'Inversiones financieras representativas de derecho patrimonial', 1),
(820, '3', 36721, 'Costo', 1),
(821, '3', 3673, 'Otras inversiones financieras', 1),
(822, '3', 36731, 'Costo', 1),
(823, '3', 37, 'ACTIVO DIFERIDO', 1),
(824, '3', 371, 'Impuesto a la renta diferido', 1),
(825, '3', 3711, 'Impuesto a la renta diferido  Patrimonio', 1),
(826, '3', 3712, 'Impuesto a la renta diferido  Resultados', 1),
(827, '3', 372, 'Participaciones de los trabajadores diferidas', 1),
(828, '3', 3721, 'Participaciones de los trabajadores diferidas  Patrimonio', 1),
(829, '3', 3722, 'Participaciones de los trabajadores diferidas  Resultados', 1),
(830, '3', 373, 'Intereses diferidos', 1),
(831, '3', 3731, 'Intereses no devengados en transacciones con terceros', 1),
(832, '3', 3732, 'Intereses no devengados en medición a valor descontado', 1),
(833, '3', 38, 'OTROS ACTIVOS', 1),
(834, '3', 381, 'Bienes de arte y cultura', 1),
(835, '3', 3811, 'Obras de arte', 1),
(836, '3', 3812, 'Biblioteca', 1),
(837, '3', 3813, 'Otros', 1),
(838, '3', 382, 'Diversos', 1),
(839, '3', 3821, 'Monedas y joyas', 1),
(840, '3', 3822, 'Bienes entregados en comodato', 1),
(841, '3', 3823, 'Bienes recibidos en pago (adjudicados y realizables)', 1),
(842, '3', 3829, 'Otros', 1),
(843, '3', 39, 'DEPRECIACIÓN y AMORTIZACIÓN ACUMULADOS', 1),
(844, '3', 391, 'Depreciación acumulada propiedades de inversión', 1),
(845, '3', 3911, 'Edificaciones', 1),
(846, '3', 39111, 'Costo', 1),
(847, '3', 39112, 'Revaluación', 1),
(848, '3', 39113, 'Costo de financiación', 1),
(849, '3', 392, 'Depreciación acumulada propiedades de inversión - Arrendamiento financiero', 1),
(850, '3', 3921, 'Edificaciones', 1),
(851, '3', 39211, 'Costo', 1),
(852, '3', 39212, 'Revaluación', 1),
(853, '3', 39213, 'Costo de financiación', 1),
(854, '3', 393, 'Depreciación acumulada propiedad- planta y equipo - Arrendamiento financiero', 1),
(855, '3', 3932, 'Edificaciones', 1),
(856, '3', 39321, 'Costo', 1),
(857, '3', 39322, 'Revaluación', 1),
(858, '3', 39323, 'Costo de financiación', 1),
(859, '3', 3933, 'Maquinarias y equipos de explotación', 1),
(860, '3', 39331, 'Costo', 1),
(861, '3', 39332, 'Revaluación', 1),
(862, '3', 39333, 'Costo de financiación', 1),
(863, '3', 3934, 'Unidades de transporte', 1),
(864, '3', 39341, 'Costo', 1),
(865, '3', 39342, 'Revaluación', 1),
(866, '3', 3935, 'Muebles y enseres', 1),
(867, '3', 39351, 'Costo', 1),
(868, '3', 38352, 'Revaluación', 1),
(869, '3', 3936, 'Equipos diversos', 1),
(870, '3', 39361, 'Costo', 1),
(871, '3', 39362, 'Revaluación', 1),
(872, '3', 394, 'Depreciación acumulada - Arrendamiento operativo', 1),
(873, '3', 3941, 'Activos por derecho de uso - arrendamiento operativo', 1),
(874, '3', 39410, 'Plantas productoras', 1),
(875, '3', 39411, 'Terrenos', 1),
(876, '3', 39412, 'Edificaciones', 1),
(877, '3', 39413, 'Maquinarias y equipos de explotación', 1),
(878, '3', 39414, 'Unidades de transporte', 1),
(879, '3', 39415, 'Equipos diversos', 1),
(880, '3', 395, 'Depreciación acumulada de propiedad- planta y equipo', 1),
(881, '3', 3952, 'Depreciación acumulada - Costo', 1),
(882, '3', 39520, 'Plantas productoras', 1),
(883, '3', 39521, 'Edificaciones', 1),
(884, '3', 39522, 'Instalaciones', 1),
(885, '3', 39523, 'Mejoras en locales arrendados', 1),
(886, '3', 39524, 'Maquinarias y equipos de explotación', 1),
(887, '3', 39525, 'Unidades de transporte', 1),
(888, '3', 39526, 'Muebles y enseres', 1),
(889, '3', 39527, 'Equipos diversos', 1),
(890, '3', 39528, 'Herramientas', 1),
(891, '3', 39529, 'Unidades de reemplazo', 1),
(892, '3', 3953, 'Propiedad- planta y equipo - Revaluación', 1),
(893, '3', 39530, 'Plantas productoras', 1),
(894, '3', 39531, 'Edificaciones', 1),
(895, '3', 39532, 'Instalaciones', 1),
(896, '3', 39533, 'Mejoras en locales arrendados', 1),
(897, '3', 39534, 'Maquinarias y equipos de explotación', 1),
(898, '3', 39535, 'Unidades de transporte', 1),
(899, '3', 39536, 'Muebles y enseres', 1),
(900, '3', 39537, 'Equipos diversos', 1),
(901, '3', 39538, 'Herramientas y unidades de reemplazo', 1),
(902, '3', 3954, 'Propiedad- planta y equipo - Costo de financiación', 1),
(903, '3', 39540, 'Plantas productoras', 1),
(904, '3', 39541, 'Edificaciones', 1),
(905, '3', 39542, 'Maquinarias y equipos de explotación', 1),
(906, '3', 3955, 'Propiedad- planta y equipo - Valor razonable', 1),
(907, '3', 39550, 'Plantas productoras', 1),
(908, '3', 396, 'Amortización acumulada', 1),
(909, '3', 3961, 'Intangibles  Costo', 1),
(910, '3', 39611, 'Concesiones- licencias y otros derechos', 1),
(911, '3', 39612, 'Patentes y propiedad industrial', 1),
(912, '3', 39613, 'Programas de computadora (software)', 1),
(913, '3', 39614, 'Costos de exploración y desarrollo', 1),
(914, '3', 39615, 'Fórmulas- diseños y prototipos', 1),
(915, '3', 39619, 'Otros activos intangibles', 1),
(916, '3', 3962, 'Intangibles  Revaluación', 1),
(917, '3', 39621, 'Concesiones- licencias y otros derechos', 1),
(918, '3', 39622, 'Patentes y propiedad industrial', 1),
(919, '3', 39623, 'Programas de computadora (software)', 1),
(920, '3', 39624, 'Costos de exploración y desarrollo', 1),
(921, '3', 39625, 'Fórmulas- diseños y prototipos', 1),
(922, '3', 39629, 'Otros activos intangibles', 1),
(923, '3', 3963, 'Intangibles  Costos de financiación', 1),
(924, '3', 39633, 'Programas de computadora', 1),
(925, '3', 39634, 'Costos de exploración', 1),
(926, '3', 39635, 'Costos de desarrollo', 1),
(927, '3', 398, 'Depreciación acumulada - Activos biológicos en producción', 1),
(928, '3', 3981, 'Activos biológicos en producción - Costo', 1),
(929, '3', 39811, 'Activos biológicos en producción', 1),
(930, '4', 40, 'TRIBUTOS- CONTRAPRESTACIONES Y APORTES AL SISTEMA PÚBLICO DE PENSIONES Y DE SALUD POR PAGAR', 1),
(931, '4', 401, 'Gobierno nacional', 1),
(932, '4', 4011, 'Impuesto general a las ventas', 1),
(933, '4', 40111, 'IGV  Cuenta propia', 1),
(934, '4', 40112, 'IGV  Servicios prestados por no domiciliados', 1),
(935, '4', 40113, 'IGV  Régimen de percepciones', 1),
(936, '4', 40114, 'IGV  Régimen de retenciones', 1),
(937, '4', 40115, 'IGV  Importaciones', 1),
(938, '4', 40116, 'IGV  Destinado a operaciones gravadas', 1),
(939, '4', 40117, 'IGV - Destinado a operaciones comunes', 1),
(940, '4', 4012, 'Impuesto selectivo al consumo', 1),
(941, '4', 4015, 'Derechos aduaneros', 1),
(942, '4', 40151, 'Derechos arancelarios', 1),
(943, '4', 40152, 'Otros derechos arancelarios', 1),
(944, '4', 4017, 'Impuesto a la renta', 1),
(945, '4', 40171, 'Renta de tercera categoría', 1),
(946, '4', 40172, 'Renta de cuarta categoría', 1),
(947, '4', 40173, 'Renta de quinta categoría', 1),
(948, '4', 40174, 'Renta de no domiciliados', 1),
(949, '4', 40175, 'Otras retenciones', 1),
(950, '4', 4018, 'Otros impuestos y contraprestaciones', 1),
(951, '4', 40181, 'Impuesto a las transacciones financieras', 1),
(952, '4', 40182, 'Impuesto a los juegos de casino y tragamonedas', 1),
(953, '4', 40183, 'Tasas por la prestación de servicios públicos', 1),
(954, '4', 40184, 'Regalías', 1),
(955, '4', 40185, 'Impuesto a los dividendos', 1),
(956, '4', 40186, 'Impuesto temporal a los activos netos', 1),
(957, '4', 40189, 'Otros impuestos', 1),
(958, '4', 402, 'Certificados tributarios', 1),
(959, '4', 403, 'Instituciones públicas', 1),
(960, '4', 4031, 'ESSALUD', 1),
(961, '4', 4032, 'ONP', 1),
(962, '4', 4033, 'Contribución al SENATI', 1),
(963, '4', 4034, 'Contribución al SENCICO', 1),
(964, '4', 4039, 'Otras instituciones', 1),
(965, '4', 405, 'Gobiernos regionales', 1),
(966, '4', 406, 'Gobiernos locales', 1),
(967, '4', 4061, 'Impuestos', 1),
(968, '4', 40611, 'Impuesto al patrimonio vehicular', 1),
(969, '4', 40612, 'Impuesto a las apuestas', 1),
(970, '4', 40613, 'Impuesto a los juegos', 1),
(971, '4', 40614, 'Impuesto de alcabala', 1),
(972, '4', 40615, 'Impuesto predial', 1),
(973, '4', 40616, 'Impuesto a los espectáculos públicos no deportivos', 1),
(974, '4', 4062, 'Contribuciones', 1),
(975, '4', 4063, 'Tasas', 1),
(976, '4', 40631, 'Licencia de apertura de establecimientos', 1),
(977, '4', 40632, 'Transporte público', 1),
(978, '4', 40633, 'Estacionamiento de vehículos', 1),
(979, '4', 40634, 'Servicios públicos o arbitrios', 1),
(980, '4', 40635, 'Servicios administrativos o derechos', 1),
(981, '4', 409, 'Otros costos administrativos e intereses', 1),
(982, '4', 41, 'REMUNERACIONES Y PARTICIPACIONES POR PAGAR', 1),
(983, '4', 411, 'Remuneraciones por pagar', 1),
(984, '4', 4111, 'Sueldos y salarios por pagar', 1),
(985, '4', 4112, 'Comisiones por pagar', 1),
(986, '4', 4113, 'Remuneraciones en especie por pagar', 1),
(987, '4', 4114, 'Gratificaciones por pagar', 1),
(988, '4', 4115, 'Vacaciones por pagar', 1),
(989, '4', 413, 'Participaciones de los trabajadores por pagar', 1),
(990, '4', 415, 'Beneficios sociales de los trabajadores por pagar', 1),
(991, '4', 4151, 'Compensación por tiempo de servicios', 1),
(992, '4', 4152, 'Adelanto de compensación por tiempo de servicios', 1),
(993, '4', 4153, 'Pensiones y jubilaciones', 1),
(994, '4', 417, 'Administradoras de fondos de pensiones', 1),
(995, '4', 419, 'Otras remuneraciones y participaciones por pagar', 1),
(996, '4', 42, 'CUENTAS POR PAGAR COMERCIALES TERCEROS', 1),
(997, '4', 421, 'Facturas- boletas y otros comprobantes por pagar', 1),
(998, '4', 4211, 'No emitidas', 1),
(999, '4', 4212, 'Emitidas', 1),
(1000, '4', 422, 'Anticipos a proveedores', 1),
(1001, '4', 423, 'Letras por pagar', 1),
(1002, '4', 424, 'Honorarios por pagar', 1),
(1003, '4', 43, 'CUENTAS POR PAGAR COMERCIALES RELACIONADAS', 1),
(1004, '4', 431, 'Facturas- boletas y otros comprobantes por pagar', 1),
(1005, '4', 4311, 'No emitidas', 1),
(1006, '4', 4312, 'Emitidas', 1),
(1007, '4', 432, 'Anticipos otorgados', 1),
(1008, '4', 4321, 'Anticipos otorgados', 1),
(1009, '4', 433, 'Letras por pagar', 1),
(1010, '4', 4331, 'Letras por pagar', 1),
(1011, '4', 434, 'Honorarios por pagar', 1),
(1012, '4', 4341, 'Honorarios por pagar', 1),
(1013, '4', 44, 'CUENTAS POR PAGAR A LOS ACCIONISTAS (SOCIOS- PARTÍCIPES) Y DIRECTORES', 1),
(1014, '4', 441, 'Accionistas ( socios- partícipes)', 1),
(1015, '4', 4411, 'Préstamos', 1),
(1016, '4', 4412, 'Dividendos', 1),
(1017, '4', 4419, 'Otras cuentas por pagar', 1),
(1018, '4', 442, 'Directores', 1),
(1019, '4', 4421, 'Dietas', 1),
(1020, '4', 4429, 'Otras cuentas por pagar', 1),
(1021, '4', 45, 'OBLIGACIONES FINANCIERAS', 1),
(1022, '4', 451, 'Préstamos de instituciones financieras y otras entidades', 1),
(1023, '4', 4511, 'Instituciones financieras', 1),
(1024, '4', 4512, 'Otras entidades', 1),
(1025, '4', 452, 'Contratos de arrendamiento financiero', 1),
(1026, '4', 453, 'Obligaciones emitidas', 1),
(1027, '4', 4531, 'Bonos emitidos', 1),
(1028, '4', 4532, 'Bonos titulizados', 1),
(1029, '4', 4533, 'Papeles comerciales', 1),
(1030, '4', 4539, 'Otras obligaciones', 1),
(1031, '4', 454, 'Otros Instrumentos financieros por pagar', 1),
(1032, '4', 4541, 'Letras', 1),
(1033, '4', 4542, 'Papeles comerciales', 1),
(1034, '4', 4543, 'Bonos', 1),
(1035, '4', 4544, 'Pagarés', 1),
(1036, '4', 4545, 'Facturas conformadas', 1),
(1037, '4', 4549, 'Otras obligaciones financieras', 1),
(1038, '4', 455, 'Costos de financiación por pagar', 1),
(1039, '4', 4551, 'Préstamos de instituciones financieras y otras entidades', 1),
(1040, '4', 45511, 'Instituciones financieras', 1),
(1041, '4', 45512, 'Otras entidades', 1),
(1042, '4', 4552, 'Contratos de arrendamiento financiero', 1),
(1043, '4', 4553, 'Obligaciones emitidas', 1),
(1044, '4', 45531, 'Bonos emitidos', 1),
(1045, '4', 45532, 'Bonos titulizados', 1),
(1046, '4', 45533, 'Papeles comerciales', 1),
(1047, '4', 45539, 'Otras obligaciones', 1),
(1048, '4', 4554, 'Otros instrumentos financieros por pagar', 1),
(1049, '4', 45541, 'Letras', 1),
(1050, '4', 45542, 'Papeles comerciales', 1),
(1051, '4', 45543, 'Bonos', 1),
(1052, '4', 45544, 'Pagarés', 1),
(1053, '4', 45545, 'Facturas conformadas', 1),
(1054, '4', 45549, 'Otras obligaciones financieras', 1),
(1055, '4', 456, 'Préstamos con compromisos de recompra', 1),
(1056, '4', 46, 'CUENTAS POR PAGAR DIVERSAS  TERCEROS', 1),
(1057, '4', 461, 'Reclamaciones de terceros', 1),
(1058, '4', 464, 'Pasivos por instrumentos financieros', 1),
(1059, '4', 4641, 'Instrumentos financieros primarios', 1),
(1060, '4', 4642, 'Instrumentos financieros derivados', 1),
(1061, '4', 46421, 'Cartera de negociación', 1),
(1062, '4', 46422, 'Instrumentos de cobertura', 1),
(1063, '4', 465, 'Pasivos por compra de activo inmovilizado', 1),
(1064, '4', 4651, 'Inversiones mobiliarias', 1),
(1065, '4', 4652, 'Propiedades de inversión', 1),
(1066, '4', 4653, 'Activos adquiridos en arrendamiento financiero', 1),
(1067, '4', 4654, 'Propiedad- planta y equipo', 1),
(1068, '4', 4655, 'Intangibles', 1),
(1069, '4', 4656, 'Activos biológicos', 1),
(1070, '4', 466, 'Participación de terceros en acuerdos conjuntos', 1),
(1071, '4', 467, 'Depósitos recibidos en garantía', 1),
(1072, '4', 469, 'Otras cuentas por pagar diversas', 1),
(1073, '4', 4691, 'Subsidios gubernamentales', 1),
(1074, '4', 4692, 'Donaciones condicionadas', 1),
(1075, '4', 4699, 'Otras cuentas por pagar', 1),
(1076, '4', 47, 'CUENTAS POR PAGAR DIVERSAS  RELACIONADAS', 1),
(1077, '4', 471, 'Préstamos', 1),
(1078, '4', 472, 'Costos de financiación', 1),
(1079, '4', 473, 'Anticipos recibidos', 1),
(1080, '4', 474, 'Regalías', 1),
(1081, '4', 475, 'Dividendos', 1),
(1082, '4', 476, 'Depósitos recibidos en garantía', 1),
(1083, '4', 477, 'Pasivo por compra de activo inmovilizado', 1),
(1084, '4', 4771, 'Inversiones mobiliarias', 1),
(1085, '4', 4772, 'Inversiones inmobiliarias', 1),
(1086, '4', 4773, 'Activos adquiridos en arrendamiento financiero', 1),
(1087, '4', 4774, 'Propiedad- planta y equipo', 1),
(1088, '4', 4775, 'Intangibles', 1),
(1089, '4', 4776, 'Activos biológicos', 1),
(1090, '4', 479, 'Otras cuentas por pagar diversas', 1),
(1091, '4', 4791, 'Otras cuentas por pagar diversas', 1),
(1092, '4', 48, 'PROVISIONES', 1),
(1093, '4', 481, 'Provisión para litigios', 1),
(1094, '4', 482, 'Provisión por desmantelamiento- retiro o rehabilitación del inmovilizado', 1),
(1095, '4', 483, 'Provisión para reestructuraciones', 1),
(1096, '4', 484, 'Provisión para protección y remediación del medio ambiente', 1),
(1097, '4', 485, 'Provisión para gastos de responsabilidad social', 1),
(1098, '4', 486, 'Provisión para garantías', 1),
(1099, '4', 487, 'Provisión por activos por derecho de uso', 1),
(1100, '4', 489, 'Otras provisiones', 1),
(1101, '4', 49, 'PASIVO DIFERIDO', 1),
(1102, '4', 491, 'Impuesto a la renta diferido', 1),
(1103, '4', 4911, 'Impuesto a la renta diferido  Patrimonio', 1),
(1104, '4', 4912, 'Impuesto a la renta diferido  Resultados', 1),
(1105, '4', 492, 'Participaciones de los trabajadores diferidas', 1),
(1106, '4', 4921, 'Participaciones de los trabajadores diferidas  Patrimonio', 1),
(1107, '4', 4922, 'Participaciones de los trabajadores diferidas  Resultados', 1),
(1108, '4', 493, 'Intereses diferidos', 1),
(1109, '4', 4931, 'Intereses no devengados en transacciones con terceros', 1),
(1110, '4', 4932, 'Intereses no devengados en medición a valor descontado', 1),
(1111, '4', 494, 'Ganancia en venta con arrendamiento financiero paralelo', 1),
(1112, '4', 495, 'Subsidios recibidos diferidos', 1),
(1113, '4', 496, 'Ingresos diferidos', 1),
(1114, '4', 497, 'Costos diferidos', 1),
(1115, '5', 50, 'CAPITAL', 1),
(1116, '5', 501, 'Capital social', 1),
(1117, '5', 5011, 'Acciones', 1),
(1118, '5', 5012, 'Participaciones', 1),
(1119, '5', 502, 'Acciones en tesorería', 1),
(1120, '5', 51, 'ACCIONES DE INVERSIÓN', 1),
(1121, '5', 511, 'Acciones de inversión', 1),
(1122, '5', 512, 'Acciones de inversión en tesorería', 1),
(1123, '5', 52, 'CAPITAL ADICIONAL', 1),
(1124, '5', 521, 'Primas (descuento) de acciones', 1),
(1125, '5', 522, 'Capitalizaciones en trámite', 1),
(1126, '5', 5221, 'Aportes', 1);
INSERT INTO `t9plancontables` (`t9p_id`, `t9p_elemento`, `t9p_codigo`, `t9p_descripcion`, `t9p_status`) VALUES
(1127, '5', 5222, 'Reservas', 1),
(1128, '5', 5223, 'Acreencias', 1),
(1129, '5', 5224, 'Utilidades', 1),
(1130, '5', 523, 'Reducciones de capital pendientes de formalización', 1),
(1131, '5', 56, 'RESULTADOS NO REALIZADOS', 1),
(1132, '5', 561, 'Diferencia en cambio de inversiones permanentes en entidades extranjeras', 1),
(1133, '5', 562, 'Instrumentos financieros  Coberturas', 1),
(1134, '5', 563, 'Resultado en activos o pasivos financieros mantenidos para negociación', 1),
(1135, '5', 5631, 'Ganancia', 1),
(1136, '5', 5632, 'Pérdida', 1),
(1137, '5', 564, 'Resultado en otros activos o pasivos por inversiones financieras', 1),
(1138, '5', 5641, 'Ganancia', 1),
(1139, '5', 5642, 'Pérdida', 1),
(1140, '5', 565, 'Resultado en activos o pasivos financieros mantenidos para negociación  Compra o venta convencional fecha de liquidación', 1),
(1141, '5', 5651, 'Ganancia', 1),
(1142, '5', 5652, 'Pérdida', 1),
(1143, '5', 57, 'EXCEDENTE DE REVALUACIÓN', 1),
(1144, '5', 571, 'Excedente de revaluación', 1),
(1145, '5', 5711, 'Propiedad de inversión', 1),
(1146, '5', 57111, 'Adquisición directa', 1),
(1147, '5', 57112, 'Arrendamiento financiero', 1),
(1148, '5', 5712, 'Propiedad- planta y equipo', 1),
(1149, '5', 57121, 'Adquisición directa', 1),
(1150, '5', 57122, 'Arrendamiento financiero', 1),
(1151, '5', 5713, 'Intangibles', 1),
(1152, '5', 5714, 'Activos por derecho de uso - arrendamiento operativo', 1),
(1153, '5', 572, 'Excedente de revaluación  Acciones liberadas recibidas', 1),
(1154, '5', 573, 'Participación en excedente de revaluación  Inversiones en entidades relacionadas', 1),
(1155, '5', 58, 'RESERVAS', 1),
(1156, '5', 581, 'Reinversión', 1),
(1157, '5', 582, 'Legal', 1),
(1158, '5', 583, 'Contractuales', 1),
(1159, '5', 584, 'Estatutarias', 1),
(1160, '5', 585, 'Facultativas', 1),
(1161, '5', 589, 'Otras reservas', 1),
(1162, '5', 59, 'RESULTADOS ACUMULADOS', 1),
(1163, '5', 591, 'Utilidades no distribuidas', 1),
(1164, '5', 5911, 'Utilidades acumuladas', 1),
(1165, '5', 5912, 'Ingresos de años anteriores', 1),
(1166, '5', 592, 'Pérdidas acumuladas', 1),
(1167, '5', 5921, 'Pérdidas acumuladas', 1),
(1168, '5', 5922, 'Gastos de años anteriores', 1),
(1169, '6', 60, 'COMPRAS', 1),
(1170, '6', 601, 'Mercaderías', 1),
(1171, '6', 6011, 'Mercaderías', 1),
(1172, '6', 602, 'Materias primas', 1),
(1173, '6', 603, 'Materiales auxiliares- suministros y repuestos', 1),
(1174, '6', 6031, 'Materiales auxiliares', 1),
(1175, '6', 6032, 'Suministros', 1),
(1176, '6', 6033, 'Repuestos', 1),
(1177, '6', 604, 'Envases y embalajes', 1),
(1178, '6', 6041, 'Envases', 1),
(1179, '6', 6042, 'Embalajes', 1),
(1180, '6', 609, 'Costos vinculados con las compras', 1),
(1181, '6', 6091, 'Costos vinculados con las compras de mercaderías', 1),
(1182, '6', 60911, 'Transporte', 1),
(1183, '6', 60912, 'Seguros', 1),
(1184, '6', 60913, 'Derechos aduaneros', 1),
(1185, '6', 60914, 'Comisiones', 1),
(1186, '6', 60919, 'Otros costos', 1),
(1187, '6', 6092, 'Costos vinculados con las compras de materias primas', 1),
(1188, '6', 60921, 'Transporte', 1),
(1189, '6', 60922, 'Seguros', 1),
(1190, '6', 60923, 'Derechos aduaneros', 1),
(1191, '6', 60924, 'Comisiones', 1),
(1192, '6', 60925, 'Otros costos', 1),
(1193, '6', 6093, 'Costos vinculados con las compras de materiales- suministros y repuestos', 1),
(1194, '6', 60931, 'Transporte', 1),
(1195, '6', 60932, 'Seguros', 1),
(1196, '6', 60933, 'Derechos aduaneros', 1),
(1197, '6', 60934, 'Comisiones', 1),
(1198, '6', 60935, 'Otros costos', 1),
(1199, '6', 6094, 'Costos vinculados con las compras de envases y embalajes', 1),
(1200, '6', 60941, 'Transporte', 1),
(1201, '6', 60942, 'Seguros', 1),
(1202, '6', 60943, 'Derechos aduaneros', 1),
(1203, '6', 60944, 'Comisiones', 1),
(1204, '6', 60945, 'Otros costos', 1),
(1205, '6', 61, 'VARIACIÓN DE INVENTARIOS', 1),
(1206, '6', 611, 'Mercaderías', 1),
(1207, '6', 6111, 'Mercaderías', 1),
(1208, '6', 612, 'Materias primas', 1),
(1209, '6', 6121, 'Materias primas', 1),
(1210, '6', 613, 'Materiales auxiliares- suministros y repuestos', 1),
(1211, '6', 6131, 'Materiales auxiliares', 1),
(1212, '6', 6132, 'Suministros', 1),
(1213, '6', 6133, 'Repuestos', 1),
(1214, '6', 614, 'Envases y embalajes', 1),
(1215, '6', 6141, 'Envases', 1),
(1216, '6', 6142, 'Embalajes', 1),
(1217, '6', 62, 'GASTOS DE PERSONAL Y DIRECTORES', 1),
(1218, '6', 621, 'Remuneraciones', 1),
(1219, '6', 6211, 'Sueldos y salarios', 1),
(1220, '6', 6212, 'Comisiones', 1),
(1221, '6', 6213, 'Remuneraciones en especie', 1),
(1222, '6', 6214, 'Gratificaciones', 1),
(1223, '6', 6215, 'Vacaciones', 1),
(1224, '6', 622, 'Otras remuneraciones', 1),
(1225, '6', 623, 'Indemnizaciones al personal', 1),
(1226, '6', 624, 'Capacitación', 1),
(1227, '6', 625, 'Atención al personal', 1),
(1228, '6', 627, 'Seguridad- previsión social y otras contribuciones', 1),
(1229, '6', 6271, 'Régimen de prestaciones de salud', 1),
(1230, '6', 6272, 'Régimen de pensiones - Aporte de empresa', 1),
(1231, '6', 6273, 'Seguro complementario de trabajo de riesgo- accidentes de trabajo y enfermedades profesionales', 1),
(1232, '6', 6274, 'Seguro de vida', 1),
(1233, '6', 6275, 'Seguros particulares de prestaciones de salud  EPS y otros particulares', 1),
(1234, '6', 6276, 'Caja de beneficios de seguridad social del pescador', 1),
(1235, '6', 6277, 'Contribuciones al SENATI', 1),
(1236, '6', 628, 'Retribuciones al directorio', 1),
(1237, '6', 629, 'Beneficios sociales de los trabajadores', 1),
(1238, '6', 6291, 'Compensación por tiempo de servicio', 1),
(1239, '6', 6292, 'Pensiones y jubilaciones', 1),
(1240, '6', 6293, 'Otros beneficios post-empleo', 1),
(1241, '6', 6294, 'Participación en las utilidades', 1),
(1242, '6', 62941, 'Participación corriente', 1),
(1243, '6', 62942, 'Participación diferida', 1),
(1244, '6', 63, 'GASTOS DE SERVICIOS PRESTADOS POR TERCEROS', 1),
(1245, '6', 631, 'Transporte- correos y gastos de viaje', 1),
(1246, '6', 6311, 'Transporte', 1),
(1247, '6', 63111, 'De carga', 1),
(1248, '6', 63112, 'De pasajeros', 1),
(1249, '6', 6312, 'Correos', 1),
(1250, '6', 6313, 'Alojamiento', 1),
(1251, '6', 6314, 'Alimentación', 1),
(1252, '6', 6315, 'Otros gastos de viaje', 1),
(1253, '6', 632, 'Asesoría y consultoría', 1),
(1254, '6', 6321, 'Administrativa', 1),
(1255, '6', 6322, 'Legal y tributaria', 1),
(1256, '6', 6323, 'Auditoría y contable', 1),
(1257, '6', 6324, 'Mercadotecnia', 1),
(1258, '6', 6325, 'Medioambiental', 1),
(1259, '6', 6326, 'Investigación y desarrollo', 1),
(1260, '6', 6327, 'Producción', 1),
(1261, '6', 6329, 'Otros', 1),
(1262, '6', 633, 'Producción encargada a terceros', 1),
(1263, '6', 634, 'Mantenimiento y reparaciones', 1),
(1264, '6', 6341, 'Propiedad de inversión', 1),
(1265, '6', 6342, 'Activos por derecho de uso', 1),
(1266, '6', 63421, 'Financiero', 1),
(1267, '6', 63432, 'Operativo', 1),
(1268, '6', 6343, 'Propiedad- planta y equipo', 1),
(1269, '6', 6344, 'Intangibles', 1),
(1270, '6', 6345, 'Activos biológicos', 1),
(1271, '6', 635, 'Alquileres', 1),
(1272, '6', 6351, 'Terrenos', 1),
(1273, '6', 6352, 'Edificaciones', 1),
(1274, '6', 6353, 'Maquinarias y equipos de explotación', 1),
(1275, '6', 6354, 'Equipo de transporte', 1),
(1276, '6', 6355, 'Muebles y enseres', 1),
(1277, '6', 6356, 'Equipos diversos', 1),
(1278, '6', 636, 'Servicios básicos', 1),
(1279, '6', 6361, 'Energía eléctrica', 1),
(1280, '6', 6362, 'Gas', 1),
(1281, '6', 6363, 'Agua', 1),
(1282, '6', 6364, 'Teléfono', 1),
(1283, '6', 6365, 'Internet', 1),
(1284, '6', 6366, 'Radio', 1),
(1285, '6', 6367, 'Cable', 1),
(1286, '6', 637, 'Publicidad- publicaciones- relaciones públicas', 1),
(1287, '6', 6371, 'Publicidad', 1),
(1288, '6', 6372, 'Publicaciones', 1),
(1289, '6', 6373, 'Relaciones públicas', 1),
(1290, '6', 638, 'Servicios de contratistas', 1),
(1291, '6', 639, 'Otros servicios prestados por terceros', 1),
(1292, '6', 6391, 'Gastos bancarios', 1),
(1293, '6', 6392, 'Gastos de laboratorio', 1),
(1294, '6', 64, 'GASTOS POR TRIBUTOS', 1),
(1295, '6', 641, 'Gobierno nacional', 1),
(1296, '6', 6411, 'Impuesto general a las ventas y selectivo al consumo', 1),
(1297, '6', 6412, 'Impuesto a las transacciones financieras', 1),
(1298, '6', 6413, 'Impuesto temporal a los activos netos', 1),
(1299, '6', 6414, 'Impuesto a los juegos de casino y máquinas tragamonedas', 1),
(1300, '6', 6415, 'Regalías mineras', 1),
(1301, '6', 6416, 'Cánones', 1),
(1302, '6', 6419, 'Otros', 1),
(1303, '6', 642, 'Gobierno regional', 1),
(1304, '6', 643, 'Gobierno local', 1),
(1305, '6', 6431, 'Impuesto predial', 1),
(1306, '6', 6432, 'Arbitrios municipales y seguridad ciudadana', 1),
(1307, '6', 6433, 'Impuesto al patrimonio vehicular', 1),
(1308, '6', 6434, 'Licencia de funcionamiento', 1),
(1309, '6', 6439, 'Otros', 1),
(1310, '6', 644, 'Otros gastos por tributos', 1),
(1311, '6', 6442, 'Contribución al SENCICO', 1),
(1312, '6', 6443, 'Otros', 1),
(1313, '6', 645, 'Gastos en deuda tributaria', 1),
(1314, '6', 6451, 'Intereses', 1),
(1315, '6', 6452, 'intereses - fraccionamiento', 1),
(1316, '6', 6453, 'Multas', 1),
(1317, '6', 6454, 'Costas y otros', 1),
(1318, '6', 65, 'OTROS GASTOS DE GESTION', 1),
(1319, '6', 651, 'Seguros', 1),
(1320, '6', 652, 'Regalías', 1),
(1321, '6', 653, 'Suscripciones', 1),
(1322, '6', 654, 'Licencias y derechos de vigencia', 1),
(1323, '6', 655, 'Costo neto de enajenación de activos inmovilizados y operaciones discontinuadas', 1),
(1324, '6', 6551, 'Costo neto de enajenación de activos inmovilizados', 1),
(1325, '6', 65511, 'Inversiones mobiliarias', 1),
(1326, '6', 65512, 'Propiedades de inversión', 1),
(1327, '6', 65513, 'Activos por derecho de uso - arrendamiento financiero', 1),
(1328, '6', 65514, 'Propiedad- planta y equipo', 1),
(1329, '6', 65515, 'Intangibles', 1),
(1330, '6', 65516, 'Activos biológicos', 1),
(1331, '6', 6552, 'Operaciones discontinuadas  Abandono de activos', 1),
(1332, '6', 65521, 'Propiedades de inversión', 1),
(1333, '6', 65522, 'Activos por derecho de uso - Arrendamiento financiero', 1),
(1334, '6', 65523, 'Propiedad- planta y equipo', 1),
(1335, '6', 65524, 'Intangibles', 1),
(1336, '6', 65525, 'Activos biológicos', 1),
(1337, '6', 656, 'Suministros', 1),
(1338, '6', 658, 'Gestión medioambiental', 1),
(1339, '6', 659, 'Otros gastos de gestión', 1),
(1340, '6', 6591, 'Donaciones', 1),
(1341, '6', 6592, 'Sanciones administrativas', 1),
(1342, '6', 66, 'PERDIDA POR MEDICIÓN DE ACTIVOS NO FINANCIEROS AL VALOR RAZONABLE', 1),
(1343, '6', 661, 'Activo realizable', 1),
(1344, '6', 6611, 'Mercaderías', 1),
(1345, '6', 6612, 'Productos terminados', 1),
(1346, '6', 6613, 'Activos no corrientes mantenidos para la venta', 1),
(1347, '6', 66131, 'Propiedades de inversión', 1),
(1348, '6', 66132, 'Propiedad- planta y equipo', 1),
(1349, '6', 66133, 'Intangibles', 1),
(1350, '6', 66134, 'Activos biológicos', 1),
(1351, '6', 662, 'Activo inmovilizado', 1),
(1352, '6', 6621, 'Propiedades de inversión', 1),
(1353, '6', 6622, 'Activos biológicos', 1),
(1354, '6', 67, 'GASTOS FINANCIEROS', 1),
(1355, '6', 671, 'Gastos en operaciones de endeudamiento y otros', 1),
(1356, '6', 6711, 'Préstamos de instituciones financieras y otras entidades', 1),
(1357, '6', 6712, 'Contratos de arrendamiento financiero', 1),
(1358, '6', 6713, 'Emisión y colocación de instrumentos representativos de deuda y patrimonio', 1),
(1359, '6', 6714, 'Documentos vendidos o descontados', 1),
(1360, '6', 672, 'Pérdida por instrumentos financieros derivados', 1),
(1361, '6', 673, 'Intereses por préstamos y otras obligaciones', 1),
(1362, '6', 6731, 'Préstamos de instituciones financieras y otras entidades', 1),
(1363, '6', 67311, 'Instituciones financieras', 1),
(1364, '6', 67312, 'Otras entidades', 1),
(1365, '6', 6732, 'Contratos de arrendamiento financiero', 1),
(1366, '6', 6733, 'Otros instrumentos financieros por pagar', 1),
(1367, '6', 6734, 'Documentos vendidos o descontados', 1),
(1368, '6', 6735, 'Obligaciones emitidas', 1),
(1369, '6', 6736, 'Obligaciones comerciales', 1),
(1370, '6', 674, 'Gastos en operaciones de factoraje (factoring)', 1),
(1371, '6', 6741, 'Pérdida en instrumentos vendidos', 1),
(1372, '6', 675, 'Descuentos concedidos por pronto pago', 1),
(1373, '6', 676, 'Diferencia de cambio', 1),
(1374, '6', 677, 'Pérdida por medición de activos y pasivos financieros al valor razonable', 1),
(1375, '6', 6771, 'Inversiones mantenidas para negociación', 1),
(1376, '6', 6772, 'Otras inversiones financieras', 1),
(1377, '6', 6773, 'Otros', 1),
(1378, '6', 678, 'Participación en resultados de entidades relacionadas', 1),
(1379, '6', 6781, 'Participación en los resultados de subsidiarias y asociadas bajo el método del valor patrimonial', 1),
(1380, '6', 6782, 'Participaciones en negocios conjuntos', 1),
(1381, '6', 679, 'Otros gastos financieros', 1),
(1382, '6', 6791, 'Primas por opciones', 1),
(1383, '6', 6792, 'Gastos financieros en medición a valor descontado', 1),
(1384, '6', 6793, 'Gastos financieros en actualización de activos por derecho de uso', 1),
(1385, '6', 68, 'VALUACIÓN Y DETERIORO DE ACTIVOS Y PROVISIONES', 1),
(1386, '6', 681, 'Depreciación de propiedades de inversión', 1),
(1387, '6', 6811, 'Edificaciones', 1),
(1388, '6', 68111, 'Costo', 1),
(1389, '6', 68112, 'Revaluación', 1),
(1390, '6', 68113, 'Costo de financiación', 1),
(1391, '6', 682, 'Depreciación de activos por derecho de uso - arrendamiento financiero', 1),
(1392, '6', 6821, 'Propiedades de inversión', 1),
(1393, '6', 68211, 'Edificaciones', 1),
(1394, '6', 682111, 'Costo', 1),
(1395, '6', 682112, 'Revaluación', 1),
(1396, '6', 682113, 'Costo de financiación', 1),
(1397, '6', 6822, 'Propiedad- planta y equipo', 1),
(1398, '6', 68221, 'Edificaciones', 1),
(1399, '6', 682211, 'Costo', 1),
(1400, '6', 682212, 'Revaluación', 1),
(1401, '6', 682213, 'Costo de financiación', 1),
(1402, '6', 68222, 'Maquinarias y equipos de explotación', 1),
(1403, '6', 682221, 'Costo', 1),
(1404, '6', 682222, 'Revaluación', 1),
(1405, '6', 682223, 'Costo de financiación', 1),
(1406, '6', 68223, 'Unidades de transporte', 1),
(1407, '6', 682231, 'Costo', 1),
(1408, '6', 682232, 'Revaluación', 1),
(1409, '6', 68225, 'Equipos diversos', 1),
(1410, '6', 682251, 'Costo', 1),
(1411, '6', 682252, 'Revaluación', 1),
(1412, '6', 683, 'Depreciación de activos por derecho de uso - arrendamiento operativo', 1),
(1413, '6', 6831, 'Depreciación de activos por derecho de uso - arrendamiento operativo', 1),
(1414, '6', 68311, 'Edificaciones', 1),
(1415, '6', 683111, 'Costo', 1),
(1416, '6', 683112, 'Revaluación', 1),
(1417, '6', 68312, 'Maquinarias y equipos de explotación', 1),
(1418, '6', 683121, 'Costo', 1),
(1419, '6', 683122, 'Revaluación', 1),
(1420, '6', 68313, 'Unidades de transporte', 1),
(1421, '6', 683131, 'Costo', 1),
(1422, '6', 683132, 'Revaluación', 1),
(1423, '6', 68315, 'Equipos diversos', 1),
(1424, '6', 683351, 'Costo', 1),
(1425, '6', 683152, 'Revaluación', 1),
(1426, '6', 684, 'Depreciación de propiedad- planta y equipo', 1),
(1427, '6', 6841, 'Depreciación de propiedad- planta y equipo - Costo', 1),
(1428, '6', 68410, 'Plantas productoras', 1),
(1429, '6', 68411, 'Edificaciones', 1),
(1430, '6', 68412, 'Maquinarias y equipos de explotación', 1),
(1431, '6', 68413, 'Unidades de transporte', 1),
(1432, '6', 68414, 'Muebles y enseres', 1),
(1433, '6', 68415, 'Equipos diversos', 1),
(1434, '6', 68416, 'Herramientas y unidades de reemplazo', 1),
(1435, '6', 6842, 'Depreciación de propiedad- planta y equipo - Revaluación', 1),
(1436, '6', 68420, 'Plantas productoras', 1),
(1437, '6', 68421, 'Edificaciones', 1),
(1438, '6', 68422, 'Maquinarias y equipos de explotación', 1),
(1439, '6', 68423, 'Unidades de transporte', 1),
(1440, '6', 68424, 'Muebles y enseres', 1),
(1441, '6', 68425, 'Equipos diversos', 1),
(1442, '6', 68426, 'Herramientas y unidades de reemplazo', 1),
(1443, '6', 6843, 'Depreciación de propiedad- planta y equipo - Costos de financiación', 1),
(1444, '6', 68430, 'Plantas productoras', 1),
(1445, '6', 68431, 'Edificaciones', 1),
(1446, '6', 68432, 'Maquinarias y equipos de explotación', 1),
(1447, '6', 685, 'Depreciación de activos biológicos en producción', 1),
(1448, '6', 6851, 'Depreciación de activos biológicos en producción - costo', 1),
(1449, '6', 68511, 'Activos biológicos de origen animal', 1),
(1450, '6', 68512, 'Activos biológicos de origen vegetal', 1),
(1451, '6', 6852, 'Depreciación de activos biológicos en producción - costo de financiación', 1),
(1452, '6', 68521, 'Activos biológicos de origen animal', 1),
(1453, '6', 68522, 'Activos biológicos de origen vegetal', 1),
(1454, '6', 686, 'Amortización de intangibles', 1),
(1455, '6', 6861, 'Amortización de intangibles  Costo', 1),
(1456, '6', 68611, 'Concesiones- licencias y otros derechos', 1),
(1457, '6', 68612, 'Patentes y propiedad industrial', 1),
(1458, '6', 68613, 'Programas de computadora (software)', 1),
(1459, '6', 68614, 'Costos de exploración y desarrollo', 1),
(1460, '6', 68615, 'Fórmulas- diseños y prototipos', 1),
(1461, '6', 68619, 'Otros activos intangibles', 1),
(1462, '6', 6862, 'Amortización de intangibles  Revaluación', 1),
(1463, '6', 68621, 'Concesiones- licencias y otros derechos', 1),
(1464, '6', 68622, 'Patentes y propiedad industrial', 1),
(1465, '6', 68623, 'Programas de computadora (software)', 1),
(1466, '6', 68624, 'Costos de exploración y desarrollo', 1),
(1467, '6', 68625, 'Fórmulas- diseños y prototipos', 1),
(1468, '6', 68629, 'Otros activos intangibles', 1),
(1469, '6', 687, 'Valuación de activos', 1),
(1470, '6', 6871, 'Estimación de cuentas de cobranza dudosa', 1),
(1471, '6', 68711, 'Cuentas por cobrar comerciales  Terceros', 1),
(1472, '6', 68712, 'Cuentas por cobrar comerciales  Relacionadas', 1),
(1473, '6', 68713, 'Cuentas por cobrar al personal- a los accionistas (socios) y directores', 1),
(1474, '6', 68714, 'Cuentas por cobrar diversas  Terceros', 1),
(1475, '6', 68715, 'Cuentas por cobrar diversas  Relacionadas', 1),
(1476, '6', 6873, 'Desvalorización de inversiones mobiliarias', 1),
(1477, '6', 68731, 'Inversiones a ser mantenidas hasta el vencimiento', 1),
(1478, '6', 68732, 'Instrumentos financieros representativos de derecho patrimonial', 1),
(1479, '6', 688, 'Deterioro del valor de los activos', 1),
(1480, '6', 6881, 'Desvalorización de propiedad de inversión', 1),
(1481, '6', 68812, 'Edificaciones', 1),
(1482, '6', 68813, 'Construcciones en curso', 1),
(1483, '6', 6882, 'Desvalorización de activos por derecho de uso - arrendamiento financiero', 1),
(1484, '6', 68820, 'Planta productora en producción', 1),
(1485, '6', 68821, 'Planta productora en desarrollo', 1),
(1486, '6', 68822, 'Terrenos', 1),
(1487, '6', 68823, 'Edificaciones', 1),
(1488, '6', 68824, 'Maquinarias y equipos de explotación', 1),
(1489, '6', 68825, 'Unidades de transporte', 1),
(1490, '6', 68826, 'Muebles y enseres', 1),
(1491, '6', 68827, 'Equipos diversos', 1),
(1492, '6', 68828, 'Herramientas y unidades de reemplazo', 1),
(1493, '6', 6883, 'Desvalorización de propiedad- planta y equipo', 1),
(1494, '6', 68830, 'Planta productora en producción', 1),
(1495, '6', 68831, 'Planta productora en desarrollo', 1),
(1496, '6', 68832, 'Terrenos', 1),
(1497, '6', 68833, 'Edificaciones', 1),
(1498, '6', 68834, 'Maquinarias y equipos de explotación', 1),
(1499, '6', 68835, 'Unidades de transporte', 1),
(1500, '6', 68836, 'Muebles y enseres', 1),
(1501, '6', 68837, 'Equipos diversos', 1),
(1502, '6', 68838, 'Herramientas y unidades de reemplazo', 1),
(1503, '6', 6884, 'Desvalorización de intangibles', 1),
(1504, '6', 68841, 'Concesiones- licencias y otros derechos', 1),
(1505, '6', 68842, 'Patentes y propiedad industrial', 1),
(1506, '6', 68843, 'Programas de computadora (software)', 1),
(1507, '6', 68844, 'Costos de exploración y desarrollo', 1),
(1508, '6', 68845, 'Fórmulas- diseños y prototipos', 1),
(1509, '6', 68846, 'Otros activos intangibles', 1),
(1510, '6', 68847, 'Plusvalía mercantil', 1),
(1511, '6', 6889, 'Desvalorización de activos biológicos en producción', 1),
(1512, '6', 68891, 'Activos biológicos de origen animal', 1),
(1513, '6', 68892, 'Activos biológicos de origen vegetal', 1),
(1514, '6', 689, 'Provisiones', 1),
(1515, '6', 6891, 'Provisión para litigios', 1),
(1516, '6', 68911, 'Provisión para litigios  Costo', 1),
(1517, '6', 68912, 'Provisión para litigios  Actualización financiera', 1),
(1518, '6', 6892, 'Provisión por desmantelamiento- retiro o rehabilitación del inmovilizado', 1),
(1519, '6', 68921, 'Provisión por desmantelamiento- retiro o rehabilitación del inmovilizado  Costo', 1),
(1520, '6', 68922, 'Provisión por desmantelamiento- retiro o rehabilitación del inmovilizado  Actualización financiera', 1),
(1521, '6', 6893, 'Provisión para reestructuraciones', 1),
(1522, '6', 6894, 'Provisión para protección y remediación del medio ambiente', 1),
(1523, '6', 68941, 'Provisión para protección y remediación del medio ambiente  Costo', 1),
(1524, '6', 68942, 'Provisión para protección y remediación del medio ambiente  Actualización financiera', 1),
(1525, '6', 6896, 'Provisión para garantías', 1),
(1526, '6', 68961, 'Provisión para garantías  Costo', 1),
(1527, '6', 68962, 'Provisión para garantías  Actualización financiera', 1),
(1528, '6', 6897, 'Provisión por activos por derecho de uso', 1),
(1529, '6', 68971, 'Provisión por activos por derecho de uso arrendamiento operativo', 1),
(1530, '6', 68972, 'Provisión por activos por derecho de uso arrendamiento operativo - actualización financiera', 1),
(1531, '6', 6899, 'Otras provisiones', 1),
(1532, '6', 69, 'COSTO DE VENTAS', 1),
(1533, '6', 691, 'Mercaderías', 1),
(1534, '6', 6911, 'Mercaderías - exportación', 1),
(1535, '6', 69111, 'Terceros', 1),
(1536, '6', 69112, 'Relacionadas', 1),
(1537, '6', 6912, 'Mercaderías - venta local', 1),
(1538, '6', 69121, 'Terceros', 1),
(1539, '6', 69122, 'Relacionadas', 1),
(1540, '6', 692, 'Productos terminados', 1),
(1541, '6', 6921, 'Productos terminados - Exportación', 1),
(1542, '6', 69211, 'Terceros', 1),
(1543, '6', 69212, 'Relacionadas', 1),
(1544, '6', 6922, 'Productos terminados - Venta local', 1),
(1545, '6', 69221, 'Terceros', 1),
(1546, '6', 69222, 'Relacionadas', 1),
(1547, '6', 6923, 'Costos de financiación  Productos terminados', 1),
(1548, '6', 69231, 'Terceros', 1),
(1549, '6', 69232, 'Relacionadas', 1),
(1550, '6', 6924, 'Costos de producción no absorbido  Productos terminados', 1),
(1551, '6', 6925, 'Costo de ineficiencia  Productos terminados', 1),
(1552, '6', 693, 'Servicios terminados', 1),
(1553, '6', 6931, 'Servicios  Exportación', 1),
(1554, '6', 69311, 'Terceros', 1),
(1555, '6', 69312, 'Relacionadas', 1),
(1556, '6', 6932, 'Servicios  local', 1),
(1557, '6', 69321, 'Terceros', 1),
(1558, '6', 69322, 'Relacionadas', 1),
(1559, '6', 694, 'Subproductos- desechos y desperdicios', 1),
(1560, '6', 6941, 'Subproductos', 1),
(1561, '6', 69411, 'Terceros', 1),
(1562, '6', 69412, 'Relacionadas', 1),
(1563, '6', 6942, 'Desechos y desperdicios', 1),
(1564, '6', 69421, 'Terceros', 1),
(1565, '6', 69422, 'Relacionadas', 1),
(1566, '6', 695, 'Gastos por desvalorización de inventarios al costo', 1),
(1567, '6', 6951, 'Mercaderías', 1),
(1568, '6', 6952, 'Productos terminados', 1),
(1569, '6', 6953, 'Subproductos- desechos y desperdicios', 1),
(1570, '6', 6954, 'Productos en proceso', 1),
(1571, '6', 6955, 'Materias primas', 1),
(1572, '6', 6956, 'Materiales auxiliares- suministros y repuestos', 1),
(1573, '6', 6957, 'Envases y embalajes', 1),
(1574, '6', 6958, 'Inventarios por recibir', 1),
(1575, '7', 70, 'VENTAS', 1),
(1576, '7', 701, 'Mercaderías', 1),
(1577, '7', 7011, 'Mercaderías - venta de exportación', 1),
(1578, '7', 70111, 'Terceros', 1),
(1579, '7', 70112, 'Relacionadas', 1),
(1580, '7', 7012, 'Mercaderías - venta local', 1),
(1581, '7', 70121, 'Terceros', 1),
(1582, '7', 70122, 'Relacionadas', 1),
(1583, '7', 702, 'Productos terminados', 1),
(1584, '7', 7021, 'Productos terminados - venta de exportación', 1),
(1585, '7', 70211, 'Terceros', 1),
(1586, '7', 70212, 'Relacionadas', 1),
(1587, '7', 7022, 'Productos terminados - venta local', 1),
(1588, '7', 70221, 'Terceros', 1),
(1589, '7', 70222, 'Relacionadas', 1),
(1590, '7', 703, 'Servicios terminados', 1),
(1591, '7', 7031, 'Servicios  exportación', 1),
(1592, '7', 70311, 'Terceros', 1),
(1593, '7', 70312, 'Relacionadas', 1),
(1594, '7', 7032, 'Servicios  local', 1),
(1595, '7', 70321, 'Terceros', 1),
(1596, '7', 70322, 'Relacionadas', 1),
(1597, '7', 704, 'Subproductos- desechos y desperdicios', 1),
(1598, '7', 7041, 'Subproductos', 1),
(1599, '7', 70411, 'Terceros', 1),
(1600, '7', 70412, 'Relacionadas', 1),
(1601, '7', 7042, 'Desechos y desperdicios', 1),
(1602, '7', 70421, 'Terceros', 1),
(1603, '7', 70422, 'Relacionadas', 1),
(1604, '7', 709, 'Devoluciones sobre ventas', 1),
(1605, '7', 7091, 'Mercaderías - Venta de exportación', 1),
(1606, '7', 70911, 'Terceros', 1),
(1607, '7', 70912, 'Relacionadas', 1),
(1608, '7', 7092, 'Mercaderías - Venta local', 1),
(1609, '7', 70921, 'Terceros', 1),
(1610, '7', 70922, 'Relacionadas', 1),
(1611, '7', 7093, 'Productos terminados - Venta de exportación', 1),
(1612, '7', 70931, 'Terceros', 1),
(1613, '7', 70932, 'Relacionadas', 1),
(1614, '7', 7094, 'Productos terminados - Venta local', 1),
(1615, '7', 70941, 'Terceros', 1),
(1616, '7', 70942, 'Relacionadas', 1),
(1617, '7', 7095, 'Inventarios de servicios rechazados', 1),
(1618, '7', 70951, 'Terceros', 1),
(1619, '7', 70952, 'Relacionadas', 1),
(1620, '7', 7096, 'Subproductos- desechos y desperdicios', 1),
(1621, '7', 70961, 'Terceros', 1),
(1622, '7', 70962, 'Relacionadas', 1),
(1623, '7', 71, 'VARIACIÓN DE LA PRODUCCIÓN ALMACENADA', 1),
(1624, '7', 711, 'Variación de productos terminados', 1),
(1625, '7', 7111, 'Productos terminados', 1),
(1626, '7', 712, 'Variación de subproductos- desechos y desperdicios', 1),
(1627, '7', 7121, 'Subproductos', 1),
(1628, '7', 7122, 'Desechos y desperdicios', 1),
(1629, '7', 713, 'Variación de productos en proceso', 1),
(1630, '7', 7131, 'Productos en proceso de manufactura', 1),
(1631, '7', 714, 'Variación de envases y embalajes', 1),
(1632, '7', 7141, 'Envases', 1),
(1633, '7', 7142, 'Embalajes', 1),
(1634, '7', 715, 'Variación de inventarios de servicios', 1),
(1635, '7', 7151, ' Inventarios de servicios en proceso', 1),
(1636, '7', 72, 'PRODUCCIÓN DE ACTIVO INMOVILIZADO', 1),
(1637, '7', 721, 'Propiedades de inversión', 1),
(1638, '7', 7211, 'Edificaciones', 1),
(1639, '7', 722, 'Propiedad- planta y equipo', 1),
(1640, '7', 7220, 'Planta productora', 1),
(1641, '7', 7221, 'Edificaciones', 1),
(1642, '7', 7222, 'Maquinarias y otros equipos de explotación', 1),
(1643, '7', 7223, 'Unidades de transporte', 1),
(1644, '7', 7224, 'Muebles y enseres', 1),
(1645, '7', 7225, 'Equipos diversos', 1),
(1646, '7', 723, 'Intangibles', 1),
(1647, '7', 7231, 'Programas de computadora (software)', 1),
(1648, '7', 7232, 'Costos de exploración y desarrollo', 1),
(1649, '7', 7233, 'Fórmulas- diseños y prototipos', 1),
(1650, '7', 724, 'Activos biológicos', 1),
(1651, '7', 7241, 'Activos biológicos en desarrollo de origen animal', 1),
(1652, '7', 7242, 'Activos biológicos en desarrollo de origen vegetal', 1),
(1653, '7', 725, 'Costos de financiación capitalizados', 1),
(1654, '7', 7251, 'Costos de financiación  Propiedades de inversión', 1),
(1655, '7', 72511, 'Plantas productoras en desarrollo', 1),
(1656, '7', 72512, 'Edificaciones', 1),
(1657, '7', 7252, 'Costos de financiación  Propiedad- planta y equipo', 1),
(1658, '7', 72521, 'Plantas productoras en desarrollo', 1),
(1659, '7', 72522, 'Edificaciones', 1),
(1660, '7', 72523, 'Maquinarias y otros equipos de explotación', 1),
(1661, '7', 7253, 'Costos de financiación  Intangibles', 1),
(1662, '7', 7254, 'Costos de financiación  Activos biológicos en desarrollo', 1),
(1663, '7', 72541, 'Activos biológicos de origen animal', 1),
(1664, '7', 72542, 'Activos biológicos de origen vegetal', 1),
(1665, '7', 73, 'DESCUENTOS- REBAJAS Y BONIFICACIONES OBTENIDOS', 1),
(1666, '7', 731, 'Descuentos- rebajas y bonificaciones obtenidos', 1),
(1667, '7', 7311, 'Terceros', 1),
(1668, '7', 7312, 'Relacionadas', 1),
(1669, '7', 74, 'DESCUENTOS- REBAJAS y BONIFICACIONES CONCEDIDOS', 1),
(1670, '7', 741, 'Descuentos- rebajas y bonificaciones concedidos', 1),
(1671, '7', 7411, 'Terceros', 1),
(1672, '7', 7412, 'Relacionadas', 1),
(1673, '7', 75, 'OTROS INGRESOS DE GESTIÓN', 1),
(1674, '7', 751, 'Servicios en beneficio del personal', 1),
(1675, '7', 752, 'Comisiones y corretajes', 1),
(1676, '7', 753, 'Regalías', 1),
(1677, '7', 754, 'Alquileres', 1),
(1678, '7', 7540, 'Plantas productoras', 1),
(1679, '7', 7541, 'Terrenos', 1),
(1680, '7', 7542, 'Edificaciones', 1),
(1681, '7', 7543, 'Maquinarias y equipos de explotación', 1),
(1682, '7', 7544, 'Unidades de transporte', 1),
(1683, '7', 7545, 'Equipos diversos', 1),
(1684, '7', 755, 'Recuperación de cuentas de valuación', 1),
(1685, '7', 7551, 'Recuperación  Cuentas de cobranza dudosa', 1),
(1686, '7', 7552, 'Recuperación  Desvalorización de inventarios', 1),
(1687, '7', 7553, 'Recuperación  Desvalorización de inversiones mobiliarias', 1),
(1688, '7', 756, 'Enajenación de activos inmovilizados', 1),
(1689, '7', 7561, 'Inversiones mobiliarias', 1),
(1690, '7', 7562, 'Propiedades de inversión', 1),
(1691, '7', 7563, 'Activos adquiridos en arrendamiento financiero', 1),
(1692, '7', 7564, 'Propiedad- planta y equipo', 1),
(1693, '7', 7565, 'Intangibles', 1),
(1694, '7', 7566, 'Activos biológicos', 1),
(1695, '7', 757, 'Recuperación de deterioro de cuentas de activos inmovilizados', 1),
(1696, '7', 7571, 'Recuperación de deterioro de propiedades de inversión', 1),
(1697, '7', 7572, 'Recuperación de deterioro de propiedad- planta y equipo', 1),
(1698, '7', 7573, 'Recuperación de deterioro de intangibles', 1),
(1699, '7', 7574, 'Recuperación de deterioro de activos biológicos', 1),
(1700, '7', 759, 'Otros ingresos de gestión', 1),
(1701, '7', 7591, 'Subsidios gubernamentales', 1),
(1702, '7', 7592, 'Reclamos al seguro', 1),
(1703, '7', 7593, 'Donaciones', 1),
(1704, '7', 7594, 'Devoluciones tributarias', 1),
(1705, '7', 7599, 'Otros ingresos de gestión', 1),
(1706, '7', 76, 'GANANCIA POR MEDICIÓN DE ACTIVOS NO FINANCIEROS AL VALOR RAZONABLE', 1),
(1707, '7', 761, 'Activo realizable', 1),
(1708, '7', 7611, 'Mercaderías', 1),
(1709, '7', 7612, 'Productos terminados', 1),
(1710, '7', 7613, 'Activos no corrientes mantenidos para la venta', 1),
(1711, '7', 76131, 'Propiedades de inversión', 1),
(1712, '7', 76132, 'Propiedad- planta y equipo', 1),
(1713, '7', 76133, 'Intangibles', 1),
(1714, '7', 76134, 'Activos biológicos', 1),
(1715, '7', 762, 'Activo inmovilizado', 1),
(1716, '7', 7621, 'Propiedades de inversión', 1),
(1717, '7', 7622, 'Activos biológicos', 1),
(1718, '7', 77, 'INGRESOS FINANCIEROS', 1),
(1719, '7', 771, 'Ganancia por instrumento financiero derivado', 1),
(1720, '7', 772, 'Rendimientos ganados', 1),
(1721, '7', 7721, 'Depósitos en instituciones financieras', 1),
(1722, '7', 7722, 'Cuentas por cobrar comerciales', 1),
(1723, '7', 7723, 'Préstamos otorgados', 1),
(1724, '7', 7724, 'Inversiones a ser mantenidas hasta el vencimiento', 1),
(1725, '7', 7725, 'Instrumentos financieros representativos de derecho patrimonial', 1),
(1726, '7', 773, 'Dividendos', 1),
(1727, '7', 774, 'Ingresos en operaciones de factoraje (factoring)', 1),
(1728, '7', 775, 'Descuentos obtenidos por pronto pago', 1),
(1729, '7', 776, 'Diferencia en cambio', 1),
(1730, '7', 777, 'Ganancia por medición de activos y pasivos financieros al valor razonable', 1),
(1731, '7', 7771, 'Inversiones mantenidas para negociación', 1),
(1732, '7', 7772, 'Otras inversiones', 1),
(1733, '7', 7773, 'Otras', 1),
(1734, '7', 778, 'Participación en resultados de entidades relacionadas', 1),
(1735, '7', 7781, 'Participación en los resultados de subsidiarias y asociadas bajo el método del valor patrimonial', 1),
(1736, '7', 7782, 'Ingresos por participaciones en negocios conjuntos', 1),
(1737, '7', 779, 'Otros ingresos financieros', 1),
(1738, '7', 7792, 'Ingresos financieros en medición a valor descontado', 1),
(1739, '7', 78, 'CARGAS CUBIERTAS POR PROVISIONES', 1),
(1740, '7', 781, 'Cargas cubiertas por provisiones', 1),
(1741, '7', 79, 'CARGAS IMPUTABLES A CUENTAS DE COSTOS Y GASTOS', 1),
(1742, '7', 791, 'Cargas imputables a cuentas de costos y gastos', 1),
(1743, '7', 792, 'Gastos financieros imputables a cuentas de inventarios', 1),
(1744, '8', 80, 'MARGEN COMERCIAL', 1),
(1745, '8', 801, 'Margen comercial', 1),
(1746, '8', 81, 'PRODUCCIÓN DEL EJERCICIO', 1),
(1747, '8', 811, 'Producción de bienes', 1),
(1748, '8', 812, 'Producción de servicios', 1),
(1749, '8', 813, 'Producción de activo inmovilizado', 1),
(1750, '8', 82, 'VALOR AGREGADO', 1),
(1751, '8', 821, 'Valor agregado', 1),
(1752, '8', 83, 'EXCEDENTE BRUTO (INSUFICIENCIA BRUTA) DE EXPLOTACIÓN', 1),
(1753, '8', 831, 'Excedente bruto (insuficiencia bruta) de explotación', 1),
(1754, '8', 84, 'RESULTADO DE EXPLOTACIÓN', 1),
(1755, '8', 841, 'Resultado de explotación', 1),
(1756, '8', 85, 'RESULTADO ANTES DE PARTICIPACIONES E IMPUESTOS', 1),
(1757, '8', 851, 'Resultado antes del impuesto a las ganancias', 1),
(1758, '8', 88, 'IMPUESTO A LA RENTA', 1),
(1759, '8', 881, 'Impuesto a las ganancias  Corriente', 1),
(1760, '8', 882, 'Impuesto a las ganancias  Diferido', 1),
(1761, '8', 89, 'DETERMINACIÓN DEL RESULTADO DEL EJERCICIO', 1),
(1762, '8', 891, 'Utilidad', 1),
(1763, '8', 892, 'Pérdida', 1),
(1764, '9', 90, 'COSTO DE PRODUCCIÓN', 1),
(1765, '9', 91, 'COSTO DE SERVICIOS', 1),
(1766, '9', 92, 'COSTOS POR DISTRIBUIR', 1),
(1767, '9', 94, 'GASTOS ADMINISTRATIVOS', 1),
(1768, '9', 95, 'GASTOS DE VENTAS', 1),
(1769, '9', 97, 'GASTOS FINANCIEROS', 1),
(1770, '0', 1, 'BIENES Y VALORES ENTREGADOS', 1),
(1771, '0', 2, 'DERECHOS SOBRE INSTRUMENTOS FINANCIEROS', 1),
(1772, '0', 3, 'OTRAS CUENTAS DE ORDEN DEUDORAS', 1),
(1773, '0', 4, 'CONTRAPARTIDA DE CUENTAS DE ORDEN DEUDORAS', 1),
(1774, '0', 6, 'BIENES Y VALORES RECIBIDOS', 1),
(1775, '0', 7, 'COMPROMISOS SOBRE INSTRUMENTOS FINANCIEROS', 1),
(1776, '0', 8, 'OTRAS CUENTAS DE ORDEN ACREEDORAS', 1),
(1777, '0', 9, 'CONTRAPARTIDA DE CUENTAS DE ORDEN ACREEDORAS', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t10comprobantes`
--

CREATE TABLE `t10comprobantes` (
  `t10_id` bigint(20) NOT NULL,
  `t10_codigo` varchar(4) NOT NULL,
  `t10_descripcion` text NOT NULL,
  `t10_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `t10comprobantes`
--

INSERT INTO `t10comprobantes` (`t10_id`, `t10_codigo`, `t10_descripcion`, `t10_status`) VALUES
(1, '00', 'Otros (especificar)', 1),
(2, '01', 'Factura Electrónica', 1),
(3, '02', 'Recibo por Honorarios', 0),
(4, '03', 'Boleta de Venta Electrónica', 1),
(5, '04', 'Liquidación de compra', 0),
(6, '05', 'Boleto de compañía de aviación comercial por el servicio de transporte aéreo de pasajeros', 0),
(7, '06', 'Carta de porte aéreo por el servicio de transporte de carga aérea', 0),
(8, '07', 'Nota de crédito', 0),
(9, '08', 'Nota de débito', 0),
(10, '09', 'Guía de remisión - Remitente', 0),
(11, '10', 'Recibo por Arrendamiento', 0),
(12, '11', 'Póliza emitida por las Bolsas de Valores, Bolsas de Productos o Agentes de Intermediación por operaciones realizadas en las Bolsas de Valores o Productos o fuera de las mismas, autorizadas por CONASEV', 0),
(13, '12', 'Ticket o cinta emitido por máquina registradora', 0),
(14, '13', 'Documento emitido por bancos, instituciones financieras, crediticias y de seguros que se encuentren bajo el control de la Superintendencia de Banca y Seguros', 0),
(15, '14', 'Recibo por servicios públicos de suministro de energía eléctrica, agua, teléfono, telex y telegráficos y otros servicios complementarios que se incluyan en el recibo de servicio público', 0),
(16, '15', 'Boleto emitido por las empresas de transporte público urbano de pasajeros', 0),
(17, '16', 'Boleto de viaje emitido por las empresas de transporte público interprovincial de pasajeros dentro del país', 0),
(18, '17', 'Documento emitido por la Iglesia Católica por el arrendamiento de bienes inmuebles', 0),
(19, '18', 'Documento emitido por las Administradoras Privadas de Fondo de Pensiones que se encuentran bajo la supervisión de la Superintendencia de Administradoras Privadas de Fondos de Pensiones', 0),
(20, '19', 'Boleto o entrada por atracciones y espectáculos públicos', 0),
(21, '20', 'Comprobante de Retención', 0),
(22, '21', 'Conocimiento de embarque por el servicio de transporte de carga marítima', 0),
(23, '22', 'Comprobante por Operaciones No Habituales', 0),
(24, '23', 'Pólizas de Adjudicación emitidas con ocasión del remate o adjudicación de bienes por venta forzada, por los martilleros o las entidades que rematen o subasten bienes por cuenta de terceros', 0),
(25, '24', 'Certificado de pago de regalías emitidas por PERUPETRO S.A', 0),
(26, '25', 'Documento de Atribución (Ley del Impuesto General a las Ventas e Impuesto Selectivo al Consumo, Art. 19º, último párrafo, R.S. N° 022-98-SUNAT).', 0),
(27, '26', 'Recibo por el Pago de la Tarifa por Uso de Agua Superficial con fines agrarios y por el pago de la Cuota para la ejecución de una determinada obra o actividad acordada por la Asamblea General de la Comisión de Regantes o Resolución expedida por el Jefe de la Unidad de Aguas y de Riego (Decreto Supremo N° 003-90-AG, Arts. 28 y 48)', 0),
(28, '27', 'Seguro Complementario de Trabajo de Riesgo', 0),
(29, '28', 'Tarifa Unificada de Uso de Aeropuerto', 0),
(30, '29', 'Documentos emitidos por la COFOPRI en calidad de oferta de venta de terrenos, los correspondientes a las subastas públicas y a la retribución de los servicios que presta', 0),
(31, '30', 'Documentos emitidos por las empresas que desempeñan el rol adquirente en los sistemas de pago mediante tarjetas de crédito y débito', 0),
(32, '31', 'Guía de Remisión - Transportista', 1),
(33, '32', 'Documentos emitidos por las empresas recaudadoras de la denominada Garantía de Red Principal a la que hace referencia el numeral 7.6 del artículo 7° de la Ley N° 27133  Ley de Promoción del Desarrollo de la Industria del Gas Natural', 0),
(34, '34', 'Documento del Operador', 0),
(35, '35', 'Documento del Partícipe', 0),
(36, '36', 'Recibo de Distribución de Gas Natural', 0),
(37, '37', 'Documentos que emitan los concesionarios del servicio de revisiones técnicas vehiculares, por la prestación de dicho servicio', 0),
(38, '50', 'Declaración Única de Aduanas - Importación definitiva', 0),
(39, '52', 'Despacho Simplificado - Importación Simplificada', 0),
(40, '53', 'Declaración de Mensajería o Courier', 0),
(41, '54', 'Liquidación de Cobranza', 0),
(42, '87', 'Nota de Crédito Especial', 0),
(43, '88', 'Nota de Débito Especial', 0),
(44, '91', 'Comprobante de No Domiciliado', 0),
(45, '96', 'Exceso de crédito fiscal por retiro de bienes', 0),
(46, '97', 'Nota de Crédito - No Domiciliado', 0),
(47, '98', 'Nota de Débito - No Domiciliado', 0),
(48, '99', 'Otros -Consolidado de Boletas de Venta', 0),
(49, '00', 'Nota de Entrada', 1),
(50, '00', 'Nota de Salida', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t11aduanas`
--

CREATE TABLE `t11aduanas` (
  `t11_id` bigint(20) NOT NULL,
  `t11_codigo` varchar(4) NOT NULL,
  `t11_descripcion` text NOT NULL,
  `t11_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t12operaciones`
--

CREATE TABLE `t12operaciones` (
  `t12_id` bigint(20) NOT NULL,
  `t12_codigo` varchar(4) NOT NULL,
  `t12_descripcion` text NOT NULL,
  `t12_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `t12operaciones`
--

INSERT INTO `t12operaciones` (`t12_id`, `t12_codigo`, `t12_descripcion`, `t12_status`) VALUES
(1, '01', 'VENTA', 1),
(2, '02', 'COMPRA', 1),
(3, '03', 'CONSIGNACIÓN RECIBIDA', 0),
(4, '04', 'CONSIGNACIÓN ENTREGADA', 0),
(5, '05', 'DEVOLUCIÓN RECIBIDA', 0),
(6, '06', 'DEVOLUCIÓN ENTREGADA', 0),
(7, '07', 'PROMOCIÓN', 0),
(8, '08', 'PREMIO', 0),
(9, '09', 'DONACIÓN', 0),
(10, '10', 'SALIDA A PRODUCCIÓN', 0),
(11, '11', 'TRANSFERENCIA ENTRE ALMACENES', 0),
(12, '12', 'RETIRO', 0),
(13, '13', 'MERMAS', 1),
(14, '14', 'DESMEDROS', 0),
(15, '15', 'DESTRUCCIÓN', 0),
(16, '16', 'SALDO INICIAL', 1),
(17, '99', 'OTROS (ESPECIFICAR)', 0),
(18, '99', 'TRANSFERENCIA ENTRE MATERIALES', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `tar_id` bigint(20) NOT NULL,
  `tar_gar_id` bigint(20) NOT NULL,
  `tar_nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `tar_descripcion` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `tar_imagen` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `tar_file` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `tar_comentario` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `tar_inicio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tar_fin` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tar_ava_id` bigint(20) NOT NULL,
  `tar_pri_id` bigint(20) NOT NULL,
  `tar_baground` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `tar_colorText` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcespeciales`
--

CREATE TABLE `tcespeciales` (
  `tce_id` bigint(20) NOT NULL,
  `tce_gtc_id` bigint(20) DEFAULT NULL,
  `tce_compra` decimal(6,4) DEFAULT NULL,
  `tce_venta` decimal(6,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tcespeciales`
--

INSERT INTO `tcespeciales` (`tce_id`, `tce_gtc_id`, `tce_compra`, `tce_venta`) VALUES
(1, 290, NULL, NULL),
(2, 292, NULL, NULL),
(3, 293, NULL, NULL),
(4, 294, NULL, NULL),
(5, NULL, NULL, NULL),
(6, NULL, NULL, NULL),
(7, NULL, NULL, NULL),
(8, NULL, NULL, NULL),
(9, NULL, NULL, NULL),
(10, NULL, NULL, NULL),
(11, NULL, NULL, NULL),
(12, NULL, NULL, NULL),
(13, NULL, NULL, NULL),
(14, NULL, NULL, NULL),
(15, NULL, NULL, NULL),
(16, NULL, NULL, NULL),
(17, NULL, NULL, NULL),
(18, NULL, NULL, NULL),
(19, NULL, NULL, NULL),
(20, NULL, NULL, NULL),
(21, NULL, NULL, NULL),
(22, NULL, NULL, NULL),
(23, NULL, NULL, NULL),
(24, NULL, NULL, NULL),
(25, NULL, NULL, NULL),
(26, NULL, NULL, NULL),
(27, NULL, NULL, NULL),
(28, NULL, NULL, NULL),
(29, NULL, NULL, NULL),
(30, NULL, NULL, NULL),
(31, NULL, NULL, NULL),
(32, NULL, NULL, NULL),
(33, NULL, NULL, NULL),
(34, NULL, NULL, NULL),
(35, NULL, NULL, NULL),
(36, NULL, NULL, NULL),
(37, NULL, NULL, NULL),
(38, NULL, NULL, NULL),
(39, NULL, NULL, NULL),
(40, NULL, NULL, NULL),
(41, NULL, NULL, NULL),
(42, NULL, NULL, NULL),
(43, NULL, NULL, NULL),
(44, NULL, NULL, NULL),
(45, NULL, NULL, NULL),
(46, NULL, NULL, NULL),
(47, NULL, NULL, NULL),
(48, NULL, NULL, NULL),
(49, NULL, NULL, NULL),
(50, NULL, NULL, NULL),
(51, NULL, NULL, NULL),
(52, NULL, NULL, NULL),
(53, NULL, NULL, NULL),
(54, NULL, NULL, NULL),
(55, NULL, NULL, NULL),
(56, NULL, NULL, NULL),
(57, NULL, NULL, NULL),
(58, NULL, NULL, NULL),
(59, NULL, NULL, NULL),
(60, NULL, NULL, NULL),
(61, NULL, NULL, NULL),
(62, NULL, NULL, NULL),
(63, NULL, NULL, NULL),
(64, NULL, NULL, NULL),
(65, NULL, NULL, NULL),
(66, NULL, NULL, NULL),
(67, NULL, NULL, NULL),
(68, NULL, NULL, NULL),
(69, NULL, NULL, NULL),
(70, NULL, NULL, NULL),
(71, NULL, NULL, NULL),
(72, NULL, NULL, NULL),
(73, NULL, NULL, NULL),
(74, NULL, NULL, NULL),
(75, NULL, NULL, NULL),
(76, NULL, NULL, NULL),
(77, NULL, NULL, NULL),
(78, NULL, NULL, NULL),
(79, NULL, NULL, NULL),
(80, NULL, NULL, NULL),
(81, NULL, NULL, NULL),
(82, NULL, NULL, NULL),
(83, NULL, NULL, NULL),
(84, NULL, NULL, NULL),
(85, NULL, NULL, NULL),
(86, NULL, NULL, NULL),
(87, NULL, NULL, NULL),
(88, NULL, NULL, NULL),
(89, NULL, NULL, NULL),
(90, NULL, NULL, NULL),
(91, NULL, NULL, NULL),
(92, NULL, NULL, NULL),
(93, NULL, NULL, NULL),
(94, NULL, NULL, NULL),
(95, NULL, NULL, NULL),
(96, NULL, NULL, NULL),
(97, NULL, NULL, NULL),
(98, NULL, NULL, NULL),
(99, NULL, NULL, NULL),
(100, NULL, NULL, NULL),
(101, NULL, NULL, NULL),
(102, NULL, NULL, NULL),
(103, NULL, NULL, NULL),
(104, NULL, NULL, NULL),
(105, NULL, NULL, NULL),
(106, NULL, NULL, NULL),
(107, NULL, NULL, NULL),
(108, NULL, NULL, NULL),
(109, NULL, NULL, NULL),
(110, NULL, NULL, NULL),
(111, NULL, NULL, NULL),
(112, NULL, NULL, NULL),
(113, NULL, NULL, NULL),
(114, NULL, NULL, NULL),
(115, NULL, NULL, NULL),
(116, NULL, NULL, NULL),
(117, NULL, NULL, NULL),
(118, NULL, NULL, NULL),
(119, NULL, NULL, NULL),
(120, NULL, NULL, NULL),
(121, NULL, NULL, NULL),
(122, NULL, NULL, NULL),
(123, NULL, NULL, NULL),
(124, NULL, NULL, NULL),
(125, NULL, NULL, NULL),
(126, NULL, NULL, NULL),
(127, NULL, NULL, NULL),
(128, NULL, NULL, NULL),
(129, NULL, NULL, NULL),
(130, NULL, NULL, NULL),
(131, NULL, NULL, NULL),
(132, NULL, NULL, NULL),
(133, NULL, NULL, NULL),
(134, NULL, NULL, NULL),
(135, NULL, NULL, NULL),
(136, NULL, NULL, NULL),
(137, NULL, NULL, NULL),
(138, NULL, NULL, NULL),
(139, NULL, NULL, NULL),
(140, NULL, NULL, NULL),
(141, NULL, NULL, NULL),
(142, NULL, NULL, NULL),
(143, NULL, NULL, NULL),
(144, NULL, NULL, NULL),
(145, NULL, NULL, NULL),
(146, NULL, NULL, NULL),
(147, NULL, NULL, NULL),
(148, NULL, NULL, NULL),
(149, NULL, NULL, NULL),
(150, NULL, NULL, NULL),
(151, NULL, NULL, NULL),
(152, NULL, NULL, NULL),
(153, NULL, NULL, NULL),
(154, NULL, NULL, NULL),
(155, NULL, NULL, NULL),
(156, NULL, NULL, NULL),
(157, NULL, NULL, NULL),
(158, NULL, NULL, NULL),
(159, NULL, NULL, NULL),
(160, NULL, NULL, NULL),
(161, NULL, NULL, NULL),
(162, NULL, NULL, NULL),
(163, NULL, NULL, NULL),
(164, NULL, NULL, NULL),
(165, NULL, NULL, NULL),
(166, NULL, NULL, NULL),
(167, NULL, NULL, NULL),
(168, NULL, NULL, NULL),
(169, NULL, NULL, NULL),
(170, NULL, NULL, NULL),
(171, NULL, NULL, NULL),
(172, NULL, NULL, NULL),
(173, NULL, NULL, NULL),
(174, NULL, NULL, NULL),
(175, NULL, NULL, NULL),
(176, NULL, NULL, NULL),
(177, NULL, NULL, NULL),
(178, NULL, NULL, NULL),
(179, NULL, NULL, NULL),
(180, NULL, NULL, NULL),
(181, NULL, NULL, NULL),
(182, NULL, NULL, NULL),
(183, NULL, NULL, NULL),
(184, NULL, NULL, NULL),
(185, NULL, NULL, NULL),
(186, NULL, NULL, NULL),
(187, NULL, NULL, NULL),
(188, NULL, NULL, NULL),
(189, NULL, NULL, NULL),
(190, NULL, NULL, NULL),
(191, NULL, NULL, NULL),
(192, NULL, NULL, NULL),
(193, NULL, NULL, NULL),
(194, NULL, NULL, NULL),
(195, NULL, NULL, NULL),
(196, NULL, NULL, NULL),
(197, NULL, NULL, NULL),
(198, NULL, NULL, NULL),
(199, NULL, NULL, NULL),
(200, NULL, NULL, NULL),
(201, NULL, NULL, NULL),
(202, NULL, NULL, NULL),
(203, NULL, NULL, NULL),
(204, NULL, NULL, NULL),
(205, NULL, NULL, NULL),
(206, NULL, NULL, NULL),
(207, NULL, NULL, NULL),
(208, NULL, NULL, NULL),
(209, NULL, NULL, NULL),
(210, NULL, NULL, NULL),
(211, NULL, NULL, NULL),
(212, NULL, NULL, NULL),
(213, NULL, NULL, NULL),
(214, NULL, NULL, NULL),
(215, NULL, NULL, NULL),
(216, NULL, NULL, NULL),
(217, NULL, NULL, NULL),
(218, NULL, NULL, NULL),
(219, NULL, NULL, NULL),
(220, NULL, NULL, NULL),
(221, NULL, NULL, NULL),
(222, NULL, NULL, NULL),
(223, NULL, NULL, NULL),
(224, NULL, NULL, NULL),
(225, NULL, NULL, NULL),
(226, NULL, NULL, NULL),
(227, NULL, NULL, NULL),
(228, NULL, NULL, NULL),
(229, NULL, NULL, NULL),
(230, NULL, NULL, NULL),
(231, NULL, NULL, NULL),
(232, NULL, NULL, NULL),
(233, NULL, NULL, NULL),
(234, NULL, NULL, NULL),
(235, NULL, NULL, NULL),
(236, NULL, NULL, NULL),
(237, NULL, NULL, NULL),
(238, NULL, NULL, NULL),
(239, NULL, NULL, NULL),
(240, NULL, NULL, NULL),
(241, NULL, NULL, NULL),
(242, NULL, NULL, NULL),
(243, NULL, NULL, NULL),
(244, NULL, NULL, NULL),
(245, NULL, NULL, NULL),
(246, NULL, NULL, NULL),
(247, NULL, NULL, NULL),
(248, NULL, NULL, NULL),
(249, NULL, NULL, NULL),
(250, NULL, NULL, NULL),
(251, NULL, NULL, NULL),
(252, NULL, NULL, NULL),
(253, NULL, NULL, NULL),
(254, NULL, NULL, NULL),
(255, NULL, NULL, NULL),
(256, NULL, NULL, NULL),
(257, NULL, NULL, NULL),
(258, NULL, NULL, NULL),
(259, NULL, NULL, NULL),
(260, NULL, NULL, NULL),
(261, NULL, NULL, NULL),
(262, NULL, NULL, NULL),
(263, NULL, NULL, NULL),
(264, NULL, NULL, NULL),
(265, NULL, NULL, NULL),
(266, NULL, NULL, NULL),
(267, NULL, NULL, NULL),
(268, NULL, NULL, NULL),
(269, NULL, NULL, NULL),
(270, NULL, NULL, NULL),
(271, NULL, NULL, NULL),
(272, NULL, NULL, NULL),
(273, NULL, NULL, NULL),
(274, NULL, NULL, NULL),
(275, NULL, NULL, NULL),
(276, NULL, NULL, NULL),
(277, NULL, NULL, NULL),
(278, NULL, NULL, NULL),
(279, NULL, NULL, NULL),
(280, NULL, NULL, NULL),
(281, NULL, NULL, NULL),
(282, NULL, NULL, NULL),
(283, NULL, NULL, NULL),
(284, NULL, NULL, NULL),
(285, NULL, NULL, NULL),
(286, NULL, NULL, NULL),
(287, NULL, NULL, NULL),
(288, NULL, NULL, NULL),
(289, NULL, NULL, NULL),
(290, NULL, NULL, NULL),
(291, NULL, NULL, NULL),
(292, NULL, NULL, NULL),
(293, NULL, NULL, NULL),
(294, NULL, NULL, NULL),
(295, NULL, NULL, NULL),
(296, NULL, NULL, NULL),
(297, NULL, NULL, NULL),
(298, NULL, NULL, NULL),
(299, NULL, NULL, NULL),
(300, NULL, NULL, NULL),
(301, NULL, NULL, NULL),
(302, NULL, NULL, NULL),
(303, NULL, NULL, NULL),
(304, NULL, NULL, NULL),
(305, NULL, NULL, NULL),
(306, NULL, NULL, NULL),
(307, NULL, NULL, NULL),
(308, NULL, NULL, NULL),
(309, NULL, NULL, NULL),
(310, NULL, NULL, NULL),
(311, NULL, NULL, NULL),
(312, NULL, NULL, NULL),
(313, NULL, NULL, NULL),
(314, NULL, NULL, NULL),
(315, NULL, NULL, NULL),
(316, NULL, NULL, NULL),
(317, NULL, NULL, NULL),
(318, NULL, NULL, NULL),
(319, NULL, NULL, NULL),
(320, NULL, NULL, NULL),
(321, NULL, NULL, NULL),
(322, NULL, NULL, NULL),
(323, NULL, NULL, NULL),
(324, NULL, NULL, NULL),
(325, NULL, NULL, NULL),
(326, NULL, NULL, NULL),
(327, NULL, NULL, NULL),
(328, NULL, NULL, NULL),
(329, NULL, NULL, NULL),
(330, NULL, NULL, NULL),
(331, NULL, NULL, NULL),
(332, NULL, NULL, NULL),
(333, NULL, NULL, NULL),
(334, NULL, NULL, NULL),
(335, NULL, NULL, NULL),
(336, NULL, NULL, NULL),
(337, NULL, NULL, NULL),
(338, NULL, NULL, NULL),
(339, NULL, NULL, NULL),
(340, NULL, NULL, NULL),
(341, NULL, NULL, NULL),
(342, NULL, NULL, NULL),
(343, NULL, NULL, NULL),
(344, NULL, NULL, NULL),
(345, NULL, NULL, NULL),
(346, NULL, NULL, NULL),
(347, NULL, NULL, NULL),
(348, NULL, NULL, NULL),
(349, NULL, NULL, NULL),
(350, NULL, NULL, NULL),
(351, NULL, NULL, NULL),
(352, NULL, NULL, NULL),
(353, NULL, NULL, NULL),
(354, NULL, NULL, NULL),
(355, NULL, NULL, NULL),
(356, NULL, NULL, NULL),
(357, NULL, NULL, NULL),
(358, NULL, NULL, NULL),
(359, NULL, NULL, NULL),
(360, NULL, NULL, NULL),
(361, NULL, NULL, NULL),
(362, NULL, NULL, NULL),
(363, NULL, NULL, NULL),
(364, NULL, NULL, NULL),
(365, NULL, NULL, NULL),
(366, NULL, NULL, NULL),
(367, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tgastos`
--

CREATE TABLE `tgastos` (
  `tga_id` bigint(20) NOT NULL,
  `tga_nombre` varchar(200) DEFAULT NULL,
  `tga_status` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tgastos`
--

INSERT INTO `tgastos` (`tga_id`, `tga_nombre`, `tga_status`) VALUES
(1, 'BANCO', 1),
(2, 'COMBUSTIBLE', 1),
(3, 'GASTO DE CAMION', 1),
(4, 'GASTOS DE OFICINA', 1),
(5, 'GASTOS DE TRAMITE', 1),
(6, 'HERRAMIENTAS/ UNIFORMES', 1),
(7, 'MOVILIDAD/ FLETE', 1),
(8, 'OTROS GASTOS', 1),
(9, 'PEAJE', 1),
(10, 'PLANILLA', 1),
(11, 'SERVICIOS BASICOS', 1),
(12, 'VEATICOS/ COMIDA', 1),
(13, 'BALANZA', 1),
(14, 'GASTO DE EXPORTACION', 1),
(15, 'IMPLEMENTACIÓN', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titulares`
--

CREATE TABLE `titulares` (
  `iti_id` bigint(20) NOT NULL,
  `iti_dispositivos` varchar(60) NOT NULL,
  `iti_col_id` bigint(20) NOT NULL,
  `iti_passold` varchar(250) NOT NULL,
  `iti_passnow` varchar(250) NOT NULL,
  `iti_imgdisp` varchar(250) NOT NULL,
  `iti_bie_id` bigint(11) DEFAULT NULL,
  `iti_ico_id` bigint(20) DEFAULT NULL,
  `iti_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicaciones`
--

CREATE TABLE `ubicaciones` (
  `ubi_id` bigint(20) NOT NULL,
  `ubi_gdi_id` bigint(20) NOT NULL,
  `ubi_gar_id` bigint(20) NOT NULL,
  `ubi_est_id` bigint(20) DEFAULT NULL,
  `ubi_piso` int(11) NOT NULL,
  `ubi_etrabajo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valores`
--

CREATE TABLE `valores` (
  `val_id` bigint(20) NOT NULL,
  `val_pro_id` bigint(20) NOT NULL,
  `val_valor` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `valores`
--

INSERT INTO `valores` (`val_id`, `val_pro_id`, `val_valor`) VALUES
(1, 1, 'amarillo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aatributos`
--
ALTER TABLE `aatributos`
  ADD PRIMARY KEY (`aat_id`),
  ADD KEY `aatributos_activos` (`aat_act_id`),
  ADD KEY `aatributos_valores` (`aat_val_id`);

--
-- Indices de la tabla `acreditos`
--
ALTER TABLE `acreditos`
  ADD PRIMARY KEY (`acr_id`);

--
-- Indices de la tabla `activos`
--
ALTER TABLE `activos`
  ADD PRIMARY KEY (`act_id`),
  ADD KEY `activos_t9plancontables` (`act_t9p_id`);

--
-- Indices de la tabla `adetalles`
--
ALTER TABLE `adetalles`
  ADD PRIMARY KEY (`ade_id`),
  ADD KEY `adetalles_activos` (`ade_act_id`),
  ADD KEY `adetalles_adscripciones` (`ade_ads_id`);

--
-- Indices de la tabla `adscripciones`
--
ALTER TABLE `adscripciones`
  ADD PRIMARY KEY (`ads_id`),
  ADD KEY `adscripciones_colaboradores` (`ads_col_id`),
  ADD KEY `adscripciones_ubicaciones` (`ads_ubi_id`);

--
-- Indices de la tabla `agentes`
--
ALTER TABLE `agentes`
  ADD PRIMARY KEY (`age_id`),
  ADD KEY `agentes_gpersonas` (`age_gpe_id`),
  ADD KEY `agentes_gempresas` (`age_gem_id`);

--
-- Indices de la tabla `almacenes`
--
ALTER TABLE `almacenes`
  ADD PRIMARY KEY (`alm_id`),
  ADD KEY `almacenes_estableciminetos` (`alm_est_id`),
  ADD KEY `almacenes_gdistritos` (`alm_gdi_id`);

--
-- Indices de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD PRIMARY KEY (`asi_id`),
  ADD KEY `asistencias_gempresas` (`asi_gem_id`),
  ADD KEY `asistencias_gpersonas` (`asi_gpe_id`);

--
-- Indices de la tabla `batributos`
--
ALTER TABLE `batributos`
  ADD PRIMARY KEY (`bat_id`),
  ADD KEY `batributos_valores` (`bat_val_id`),
  ADD KEY `batributos_bienes` (`bat_bie_id`);

--
-- Indices de la tabla `bbienes`
--
ALTER TABLE `bbienes`
  ADD PRIMARY KEY (`bbi_id`),
  ADD KEY `bbienes_t5existencias` (`bbi_t5e_id`),
  ADD KEY `bbienes_c70_t9plancontables` (`bbi_c70_id`),
  ADD KEY `bbienes_c60_t9plancontables` (`bbi_c60_id`),
  ADD KEY `bbienes_c61_t9plancontables` (`bbi_c61_id`);

--
-- Indices de la tabla `bienes`
--
ALTER TABLE `bienes`
  ADD PRIMARY KEY (`bie_id`),
  ADD KEY `bienes_bbienes` (`bie_bbi_id`),
  ADD KEY `bienes_t6medidas` (`bie_t6m_id`);

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
  ADD KEY `cajas_gt4monedas` (`caj_gt4_id`);

--
-- Indices de la tabla `cdetalles`
--
ALTER TABLE `cdetalles`
  ADD PRIMARY KEY (`cde_id`),
  ADD KEY `cdetalles_servicios` (`cde_ser_id`),
  ADD KEY `cdetalles_bienes` (`cde_bie_id`),
  ADD KEY `cdetalles_t6medidas` (`cde_t6m_id`),
  ADD KEY `cdetalles_comprobantes` (`cde_com_id`),
  ADD KEY `cdetalles_tafectaciones` (`cde_gta_id`);

--
-- Indices de la tabla `cierremeses`
--
ALTER TABLE `cierremeses`
  ADD PRIMARY KEY (`cie_id`),
  ADD KEY `cierremeses_bienes` (`cie_bie_id`),
  ADD KEY `cierremeses_almacenes` (`cie_alm_id`);

--
-- Indices de la tabla `colaboradores`
--
ALTER TABLE `colaboradores`
  ADD PRIMARY KEY (`col_id`),
  ADD KEY `colaboradores_establecimientos` (`col_est_id`),
  ADD KEY `colaboradores_personas` (`col_gpe_id`),
  ADD KEY `colaboradores_areas` (`col_gar_id`);

--
-- Indices de la tabla `componentes`
--
ALTER TABLE `componentes`
  ADD PRIMARY KEY (`ico_id`),
  ADD KEY `componentes_bienes_mainboard` (`ico_bie_mainboard`),
  ADD KEY `componentes_bienes_monitor` (`ico_bie_monitor`),
  ADD KEY `componentes_bienes_teclado` (`ico_bie_teclado`),
  ADD KEY `componentes_bienes_mouse` (`ico_bie_mouse`),
  ADD KEY `componentes_bienes_cpoder` (`ico_bie_cpoder`),
  ADD KEY `componentes_bienes_hdmi` (`ico_bie_hdmi`),
  ADD KEY `componentes_bienes_vga` (`ico_bie_vga`),
  ADD KEY `componentes_bienes_cotro` (`ico_bie_cotro`),
  ADD KEY `componentes_bienes_ram` (`ico_bie_ram`),
  ADD KEY `componentes_bienes_ssd` (`ico_bie_ssd`),
  ADD KEY `componentes_bienes_hhd` (`ico_bie_hhd`),
  ADD KEY `componentes_bienes_fuentep` (`ico_bie_fuentep`),
  ADD KEY `componentes_bienes_tarjetag` (`ico_bie_tarjetag`),
  ADD KEY `componentes_bienes_tarjetav` (`ico_bie_tarjetav`),
  ADD KEY `componentes_bienes_tarjetar` (`ico_bie_tarjetar`),
  ADD KEY `componentes_bienes_otroc` (`ico_bie_otroc`);

--
-- Indices de la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  ADD PRIMARY KEY (`com_id`),
  ADD KEY `comprobantes_agentes` (`com_age_id`),
  ADD KEY `comprobantes_establecimientos` (`com_est_id`),
  ADD KEY `comprobantes_t10comprobantes` (`com_t10_id`),
  ADD KEY `comprobantes_t1mediospagos` (`com_t1m_id`),
  ADD KEY `comprobantes_t12operaciones` (`com_t12_id`),
  ADD KEY `comprobantes_acreditos` (`com_acr_id`),
  ADD KEY `comprobantes_gt4monedas` (`com_gt4_id`);

--
-- Indices de la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  ADD PRIMARY KEY (`con_id`);

--
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`cue_id`),
  ADD KEY `cuentas_gempresas` (`cue_gem_id`),
  ADD KEY `cuentas_gt4monedas` (`cue_gt4_id`);

--
-- Indices de la tabla `establecimientos`
--
ALTER TABLE `establecimientos`
  ADD PRIMARY KEY (`est_id`),
  ADD KEY `establecimientos_gdistritos` (`est_gdi_id`);

--
-- Indices de la tabla `liquidez`
--
ALTER TABLE `liquidez`
  ADD PRIMARY KEY (`liq_id`),
  ADD KEY `liquidez_agentes` (`liq_age_id`);

--
-- Indices de la tabla `mdetalles`
--
ALTER TABLE `mdetalles`
  ADD PRIMARY KEY (`mde_id`),
  ADD KEY `mdetalles_bienes` (`mde_bie_id`),
  ADD KEY `mdetalles_t6medidas` (`mde_t6m_id`),
  ADD KEY `mdetalles_movimientos` (`mde_mov_id`),
  ADD KEY `mdetalles_tafectaciones` (`mde_gta_id`);

--
-- Indices de la tabla `mermas`
--
ALTER TABLE `mermas`
  ADD KEY `mermas_bienes` (`mer_bie_id`),
  ADD KEY `mermas_almacenes` (`mer_alm_id`);

--
-- Indices de la tabla `mkinternos`
--
ALTER TABLE `mkinternos`
  ADD KEY `mkinternos_i_bienes` (`mki_i_bie_id`),
  ADD KEY `mkinternos_f_bienes` (`mki_f_bie_id`),
  ADD KEY `mkinternos_almacenes` (`mki_alm_id`);

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
  ADD KEY `movimientos_gt4monedas` (`mov_gt4_id`);

--
-- Indices de la tabla `preliminares`
--
ALTER TABLE `preliminares`
  ADD PRIMARY KEY (`pre_id`);

--
-- Indices de la tabla `propiedades`
--
ALTER TABLE `propiedades`
  ADD PRIMARY KEY (`pro_id`);

--
-- Indices de la tabla `responsables`
--
ALTER TABLE `responsables`
  ADD PRIMARY KEY (`res_id`),
  ADD KEY `responsables_tareas` (`res_tar_id`),
  ADD KEY `responsables_gusuarios` (`res_gus_gpe_id`);

--
-- Indices de la tabla `rlegal`
--
ALTER TABLE `rlegal`
  ADD PRIMARY KEY (`rle_id`);

--
-- Indices de la tabla `saldobienes`
--
ALTER TABLE `saldobienes`
  ADD PRIMARY KEY (`sal_id`),
  ADD KEY `saldobienes_bienes` (`sal_bie_id`),
  ADD KEY `saldobienes_almacenes` (`sal_alm_id`);

--
-- Indices de la tabla `satributos`
--
ALTER TABLE `satributos`
  ADD PRIMARY KEY (`sat_id`),
  ADD KEY `satributos_valores` (`sat_val_id`),
  ADD KEY `satributos_servicios` (`sat_ser_id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`ser_id`),
  ADD KEY `servicios_t6medidas` (`ser_t6m_id`);

--
-- Indices de la tabla `t1mediopagos`
--
ALTER TABLE `t1mediopagos`
  ADD PRIMARY KEY (`t1m_id`);

--
-- Indices de la tabla `t3financieras`
--
ALTER TABLE `t3financieras`
  ADD PRIMARY KEY (`t3f_id`);

--
-- Indices de la tabla `t5existencias`
--
ALTER TABLE `t5existencias`
  ADD PRIMARY KEY (`t5e_id`);

--
-- Indices de la tabla `t6medidas`
--
ALTER TABLE `t6medidas`
  ADD PRIMARY KEY (`t6m_id`);

--
-- Indices de la tabla `t7intangibles`
--
ALTER TABLE `t7intangibles`
  ADD PRIMARY KEY (`t7i_id`);

--
-- Indices de la tabla `t8libroregistros`
--
ALTER TABLE `t8libroregistros`
  ADD PRIMARY KEY (`t8l_id`);

--
-- Indices de la tabla `t9plancontables`
--
ALTER TABLE `t9plancontables`
  ADD PRIMARY KEY (`t9p_id`);

--
-- Indices de la tabla `t10comprobantes`
--
ALTER TABLE `t10comprobantes`
  ADD PRIMARY KEY (`t10_id`);

--
-- Indices de la tabla `t11aduanas`
--
ALTER TABLE `t11aduanas`
  ADD PRIMARY KEY (`t11_id`);

--
-- Indices de la tabla `t12operaciones`
--
ALTER TABLE `t12operaciones`
  ADD PRIMARY KEY (`t12_id`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`tar_id`),
  ADD KEY `tareas_gareas` (`tar_gar_id`);

--
-- Indices de la tabla `tcespeciales`
--
ALTER TABLE `tcespeciales`
  ADD PRIMARY KEY (`tce_id`),
  ADD KEY `tcespeciales_gtcambios` (`tce_gtc_id`);

--
-- Indices de la tabla `tgastos`
--
ALTER TABLE `tgastos`
  ADD PRIMARY KEY (`tga_id`);

--
-- Indices de la tabla `titulares`
--
ALTER TABLE `titulares`
  ADD PRIMARY KEY (`iti_id`),
  ADD KEY `titulares_bienes` (`iti_bie_id`),
  ADD KEY `titulares_componentes` (`iti_ico_id`),
  ADD KEY `titulares_colaboradores` (`iti_col_id`);

--
-- Indices de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD PRIMARY KEY (`ubi_id`),
  ADD KEY `ubicaciones_establecimientos` (`ubi_est_id`),
  ADD KEY `ubicaciones_gdistritos` (`ubi_gdi_id`),
  ADD KEY `ubicaciones_gareas` (`ubi_gar_id`);

--
-- Indices de la tabla `valores`
--
ALTER TABLE `valores`
  ADD PRIMARY KEY (`val_id`),
  ADD KEY `valores_propiedades` (`val_pro_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aatributos`
--
ALTER TABLE `aatributos`
  MODIFY `aat_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `acreditos`
--
ALTER TABLE `acreditos`
  MODIFY `acr_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `activos`
--
ALTER TABLE `activos`
  MODIFY `act_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `adetalles`
--
ALTER TABLE `adetalles`
  MODIFY `ade_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `adscripciones`
--
ALTER TABLE `adscripciones`
  MODIFY `ads_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `agentes`
--
ALTER TABLE `agentes`
  MODIFY `age_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT de la tabla `almacenes`
--
ALTER TABLE `almacenes`
  MODIFY `alm_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  MODIFY `asi_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `batributos`
--
ALTER TABLE `batributos`
  MODIFY `bat_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bbienes`
--
ALTER TABLE `bbienes`
  MODIFY `bbi_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `bienes`
--
ALTER TABLE `bienes`
  MODIFY `bie_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `cajas`
--
ALTER TABLE `cajas`
  MODIFY `caj_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1159;

--
-- AUTO_INCREMENT de la tabla `cdetalles`
--
ALTER TABLE `cdetalles`
  MODIFY `cde_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cierremeses`
--
ALTER TABLE `cierremeses`
  MODIFY `cie_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `colaboradores`
--
ALTER TABLE `colaboradores`
  MODIFY `col_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `componentes`
--
ALTER TABLE `componentes`
  MODIFY `ico_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  MODIFY `com_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  MODIFY `con_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  MODIFY `cue_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `establecimientos`
--
ALTER TABLE `establecimientos`
  MODIFY `est_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `liquidez`
--
ALTER TABLE `liquidez`
  MODIFY `liq_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT de la tabla `mdetalles`
--
ALTER TABLE `mdetalles`
  MODIFY `mde_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=859;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `mov_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT de la tabla `preliminares`
--
ALTER TABLE `preliminares`
  MODIFY `pre_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `propiedades`
--
ALTER TABLE `propiedades`
  MODIFY `pro_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `responsables`
--
ALTER TABLE `responsables`
  MODIFY `res_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rlegal`
--
ALTER TABLE `rlegal`
  MODIFY `rle_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `saldobienes`
--
ALTER TABLE `saldobienes`
  MODIFY `sal_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `satributos`
--
ALTER TABLE `satributos`
  MODIFY `sat_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `ser_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t1mediopagos`
--
ALTER TABLE `t1mediopagos`
  MODIFY `t1m_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `t3financieras`
--
ALTER TABLE `t3financieras`
  MODIFY `t3f_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t5existencias`
--
ALTER TABLE `t5existencias`
  MODIFY `t5e_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `t6medidas`
--
ALTER TABLE `t6medidas`
  MODIFY `t6m_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `t7intangibles`
--
ALTER TABLE `t7intangibles`
  MODIFY `t7i_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t8libroregistros`
--
ALTER TABLE `t8libroregistros`
  MODIFY `t8l_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `t9plancontables`
--
ALTER TABLE `t9plancontables`
  MODIFY `t9p_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1778;

--
-- AUTO_INCREMENT de la tabla `t10comprobantes`
--
ALTER TABLE `t10comprobantes`
  MODIFY `t10_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `t11aduanas`
--
ALTER TABLE `t11aduanas`
  MODIFY `t11_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t12operaciones`
--
ALTER TABLE `t12operaciones`
  MODIFY `t12_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `tar_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tcespeciales`
--
ALTER TABLE `tcespeciales`
  MODIFY `tce_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=368;

--
-- AUTO_INCREMENT de la tabla `tgastos`
--
ALTER TABLE `tgastos`
  MODIFY `tga_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `titulares`
--
ALTER TABLE `titulares`
  MODIFY `iti_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  MODIFY `ubi_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `valores`
--
ALTER TABLE `valores`
  MODIFY `val_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aatributos`
--
ALTER TABLE `aatributos`
  ADD CONSTRAINT `aatributos_activos` FOREIGN KEY (`aat_act_id`) REFERENCES `activos` (`act_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `aatributos_valores` FOREIGN KEY (`aat_val_id`) REFERENCES `valores` (`val_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `activos`
--
ALTER TABLE `activos`
  ADD CONSTRAINT `activos_t9plancontables` FOREIGN KEY (`act_t9p_id`) REFERENCES `t9plancontables` (`t9p_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `adetalles`
--
ALTER TABLE `adetalles`
  ADD CONSTRAINT `adetalles_activos` FOREIGN KEY (`ade_act_id`) REFERENCES `activos` (`act_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `adetalles_adscripciones` FOREIGN KEY (`ade_ads_id`) REFERENCES `adscripciones` (`ads_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `adscripciones`
--
ALTER TABLE `adscripciones`
  ADD CONSTRAINT `adscripciones_colaboradores` FOREIGN KEY (`ads_col_id`) REFERENCES `colaboradores` (`col_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `adscripciones_ubicaciones` FOREIGN KEY (`ads_ubi_id`) REFERENCES `ubicaciones` (`ubi_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `agentes`
--
ALTER TABLE `agentes`
  ADD CONSTRAINT `agentes_gempresas` FOREIGN KEY (`age_gem_id`) REFERENCES `company5_bd_cacel`.`empresas` (`gem_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `agentes_gpersonas` FOREIGN KEY (`age_gpe_id`) REFERENCES `company5_bd_cacel`.`personas` (`gpe_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `almacenes`
--
ALTER TABLE `almacenes`
  ADD CONSTRAINT `almacenes_estableciminetos` FOREIGN KEY (`alm_est_id`) REFERENCES `establecimientos` (`est_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `almacenes_gdistritos` FOREIGN KEY (`alm_gdi_id`) REFERENCES `company5_bd_cacel`.`distritos` (`gdi_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD CONSTRAINT `asistencias_gempresas` FOREIGN KEY (`asi_gem_id`) REFERENCES `company5_bd_cacel`.`empresas` (`gem_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asistencias_gpersonas` FOREIGN KEY (`asi_gpe_id`) REFERENCES `company5_bd_cacel`.`personas` (`gpe_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `batributos`
--
ALTER TABLE `batributos`
  ADD CONSTRAINT `batributos_bienes` FOREIGN KEY (`bat_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `batributos_valores` FOREIGN KEY (`bat_val_id`) REFERENCES `valores` (`val_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `bbienes`
--
ALTER TABLE `bbienes`
  ADD CONSTRAINT `bbienes_c60_t9plancontables` FOREIGN KEY (`bbi_c60_id`) REFERENCES `t9plancontables` (`t9p_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bbienes_c61_t9plancontables` FOREIGN KEY (`bbi_c61_id`) REFERENCES `t9plancontables` (`t9p_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bbienes_c70_t9plancontables` FOREIGN KEY (`bbi_c70_id`) REFERENCES `t9plancontables` (`t9p_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bbienes_t5existencias` FOREIGN KEY (`bbi_t5e_id`) REFERENCES `t5existencias` (`t5e_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `bienes`
--
ALTER TABLE `bienes`
  ADD CONSTRAINT `bienes_bbienes` FOREIGN KEY (`bie_bbi_id`) REFERENCES `bbienes` (`bbi_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bienes_t6medidas` FOREIGN KEY (`bie_t6m_id`) REFERENCES `t6medidas` (`t6m_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD CONSTRAINT `cajas_agentes` FOREIGN KEY (`caj_age_id`) REFERENCES `agentes` (`age_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cajas_colaboradores` FOREIGN KEY (`caj_col_id`) REFERENCES `colaboradores` (`col_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cajas_cuentas` FOREIGN KEY (`caj_cue_id`) REFERENCES `cuentas` (`cue_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cajas_gt4monedas` FOREIGN KEY (`caj_gt4_id`) REFERENCES `company5_bd_cacel`.`t4monedas` (`gt4_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cajas_t1mediopagos` FOREIGN KEY (`caj_t1m_id`) REFERENCES `t1mediopagos` (`t1m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cajas_tgastos` FOREIGN KEY (`caj_tga_id`) REFERENCES `tgastos` (`tga_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cdetalles`
--
ALTER TABLE `cdetalles`
  ADD CONSTRAINT `cdetalles_bienes` FOREIGN KEY (`cde_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cdetalles_comprobantes` FOREIGN KEY (`cde_com_id`) REFERENCES `comprobantes` (`com_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cdetalles_servicios` FOREIGN KEY (`cde_ser_id`) REFERENCES `servicios` (`ser_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cdetalles_t6medidas` FOREIGN KEY (`cde_t6m_id`) REFERENCES `t6medidas` (`t6m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cdetalles_tafectaciones` FOREIGN KEY (`cde_gta_id`) REFERENCES `company5_bd_cacel`.`tafectaciones` (`gta_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cierremeses`
--
ALTER TABLE `cierremeses`
  ADD CONSTRAINT `cierremeses_almacenes` FOREIGN KEY (`cie_alm_id`) REFERENCES `almacenes` (`alm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cierremeses_bienes` FOREIGN KEY (`cie_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `colaboradores`
--
ALTER TABLE `colaboradores`
  ADD CONSTRAINT `colaboradores_areas` FOREIGN KEY (`col_gar_id`) REFERENCES `company5_bd_cacel`.`areas` (`gar_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `colaboradores_establecimientos` FOREIGN KEY (`col_est_id`) REFERENCES `establecimientos` (`est_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `colaboradores_personas` FOREIGN KEY (`col_gpe_id`) REFERENCES `company5_bd_cacel`.`personas` (`gpe_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `componentes`
--
ALTER TABLE `componentes`
  ADD CONSTRAINT `componentes_bienes_cotro` FOREIGN KEY (`ico_bie_cotro`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `componentes_bienes_cpoder` FOREIGN KEY (`ico_bie_cpoder`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `componentes_bienes_fuentep` FOREIGN KEY (`ico_bie_fuentep`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `componentes_bienes_hdmi` FOREIGN KEY (`ico_bie_hdmi`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `componentes_bienes_hhd` FOREIGN KEY (`ico_bie_hhd`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `componentes_bienes_mainboard` FOREIGN KEY (`ico_bie_mainboard`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `componentes_bienes_monitor` FOREIGN KEY (`ico_bie_monitor`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `componentes_bienes_mouse` FOREIGN KEY (`ico_bie_mouse`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `componentes_bienes_otroc` FOREIGN KEY (`ico_bie_otroc`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `componentes_bienes_ram` FOREIGN KEY (`ico_bie_ram`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `componentes_bienes_ssd` FOREIGN KEY (`ico_bie_ssd`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `componentes_bienes_tarjetag` FOREIGN KEY (`ico_bie_tarjetag`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `componentes_bienes_tarjetar` FOREIGN KEY (`ico_bie_tarjetar`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `componentes_bienes_tarjetav` FOREIGN KEY (`ico_bie_tarjetav`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `componentes_bienes_teclado` FOREIGN KEY (`ico_bie_teclado`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `componentes_bienes_vga` FOREIGN KEY (`ico_bie_vga`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  ADD CONSTRAINT `comprobantes_acreditos` FOREIGN KEY (`com_acr_id`) REFERENCES `acreditos` (`acr_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comprobantes_agentes` FOREIGN KEY (`com_age_id`) REFERENCES `agentes` (`age_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comprobantes_establecimientos` FOREIGN KEY (`com_est_id`) REFERENCES `establecimientos` (`est_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comprobantes_gt4monedas` FOREIGN KEY (`com_gt4_id`) REFERENCES `company5_bd_cacel`.`t4monedas` (`gt4_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comprobantes_preliminares` FOREIGN KEY (`com_id`) REFERENCES `preliminares` (`pre_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comprobantes_t10comprobantes` FOREIGN KEY (`com_t10_id`) REFERENCES `t10comprobantes` (`t10_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comprobantes_t12operaciones` FOREIGN KEY (`com_t12_id`) REFERENCES `t12operaciones` (`t12_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comprobantes_t1mediospagos` FOREIGN KEY (`com_t1m_id`) REFERENCES `t1mediopagos` (`t1m_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD CONSTRAINT `cuentas_gempresas` FOREIGN KEY (`cue_gem_id`) REFERENCES `company5_bd_cacel`.`empresas` (`gem_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cuentas_gt4monedas` FOREIGN KEY (`cue_gt4_id`) REFERENCES `company5_bd_cacel`.`t4monedas` (`gt4_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `establecimientos`
--
ALTER TABLE `establecimientos`
  ADD CONSTRAINT `establecimientos_gdistritos` FOREIGN KEY (`est_gdi_id`) REFERENCES `company5_bd_cacel`.`distritos` (`gdi_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `liquidez`
--
ALTER TABLE `liquidez`
  ADD CONSTRAINT `liquidez_agentes` FOREIGN KEY (`liq_age_id`) REFERENCES `agentes` (`age_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mdetalles`
--
ALTER TABLE `mdetalles`
  ADD CONSTRAINT `mdetalles_bienes` FOREIGN KEY (`mde_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mdetalles_movimientos` FOREIGN KEY (`mde_mov_id`) REFERENCES `movimientos` (`mov_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mdetalles_t6medidas` FOREIGN KEY (`mde_t6m_id`) REFERENCES `t6medidas` (`t6m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mdetalles_tafectaciones` FOREIGN KEY (`mde_gta_id`) REFERENCES `company5_bd_cacel`.`tafectaciones` (`gta_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mermas`
--
ALTER TABLE `mermas`
  ADD CONSTRAINT `mermas_almacenes` FOREIGN KEY (`mer_alm_id`) REFERENCES `almacenes` (`alm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mermas_bienes` FOREIGN KEY (`mer_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mkinternos`
--
ALTER TABLE `mkinternos`
  ADD CONSTRAINT `mkinternos_almacenes` FOREIGN KEY (`mki_alm_id`) REFERENCES `almacenes` (`alm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mkinternos_f_bienes` FOREIGN KEY (`mki_f_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mkinternos_i_bienes` FOREIGN KEY (`mki_i_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_agentes` FOREIGN KEY (`mov_age_id`) REFERENCES `agentes` (`age_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_almacenes` FOREIGN KEY (`mov_alm_id`) REFERENCES `almacenes` (`alm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_gt4monedas` FOREIGN KEY (`mov_gt4_id`) REFERENCES `company5_bd_cacel`.`t4monedas` (`gt4_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_t10comprobantes` FOREIGN KEY (`mov_t10_id`) REFERENCES `t10comprobantes` (`t10_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_t12operaciones` FOREIGN KEY (`mov_t12_id`) REFERENCES `t12operaciones` (`t12_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_tcespeciales` FOREIGN KEY (`mov_tce_id`) REFERENCES `tcespeciales` (`tce_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `responsables`
--
ALTER TABLE `responsables`
  ADD CONSTRAINT `responsables_gusuarios` FOREIGN KEY (`res_gus_gpe_id`) REFERENCES `company5_bd_cacel`.`usuarios` (`gus_gpe_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `responsables_tareas` FOREIGN KEY (`res_tar_id`) REFERENCES `tareas` (`tar_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `saldobienes`
--
ALTER TABLE `saldobienes`
  ADD CONSTRAINT `saldobienes_almacenes` FOREIGN KEY (`sal_alm_id`) REFERENCES `almacenes` (`alm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `saldobienes_bienes` FOREIGN KEY (`sal_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `satributos`
--
ALTER TABLE `satributos`
  ADD CONSTRAINT `satributos_servicios` FOREIGN KEY (`sat_ser_id`) REFERENCES `servicios` (`ser_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `satributos_valores` FOREIGN KEY (`sat_val_id`) REFERENCES `valores` (`val_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `servicios_t6medidas` FOREIGN KEY (`ser_t6m_id`) REFERENCES `t6medidas` (`t6m_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `tareas_gareas` FOREIGN KEY (`tar_gar_id`) REFERENCES `company5_bd_cacel`.`areas` (`gar_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tcespeciales`
--
ALTER TABLE `tcespeciales`
  ADD CONSTRAINT `tcespeciales_gtcambios` FOREIGN KEY (`tce_gtc_id`) REFERENCES `company5_bd_cacel`.`tcambios` (`gtc_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `titulares`
--
ALTER TABLE `titulares`
  ADD CONSTRAINT `titulares_bienes` FOREIGN KEY (`iti_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `titulares_colaboradores` FOREIGN KEY (`iti_col_id`) REFERENCES `colaboradores` (`col_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `titulares_componentes` FOREIGN KEY (`iti_ico_id`) REFERENCES `componentes` (`ico_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD CONSTRAINT `ubicaciones_establecimientos` FOREIGN KEY (`ubi_est_id`) REFERENCES `establecimientos` (`est_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ubicaciones_gareas` FOREIGN KEY (`ubi_gar_id`) REFERENCES `company5_bd_cacel`.`areas` (`gar_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ubicaciones_gdistritos` FOREIGN KEY (`ubi_gdi_id`) REFERENCES `company5_bd_cacel`.`distritos` (`gdi_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `valores`
--
ALTER TABLE `valores`
  ADD CONSTRAINT `valores_propiedades` FOREIGN KEY (`val_pro_id`) REFERENCES `propiedades` (`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
