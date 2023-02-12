-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 12-02-2023 a las 02:13:47
-- Versión del servidor: 10.5.12-MariaDB-cll-lve
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u125097058_bd_graciela`
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
-- Estructura de tabla para la tabla `accesos`
--

CREATE TABLE `accesos` (
  `gac_id` bigint(20) NOT NULL,
  `gac_gus_id` bigint(20) NOT NULL,
  `gac_gcl_id` bigint(20) NOT NULL,
  `gac_use` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='g';

--
-- Volcado de datos para la tabla `accesos`
--

INSERT INTO `accesos` (`gac_id`, `gac_gus_id`, `gac_gcl_id`, `gac_use`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acreditos`
--

CREATE TABLE `acreditos` (
  `acr_id` bigint(20) NOT NULL,
  `acr_monto` decimal(12,6) NOT NULL,
  `acr_ncuota` int(11) NOT NULL,
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
  `act_status` int(11) NOT NULL DEFAULT 1
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
  `ads_tipo` int(11) NOT NULL,
  `ads_motivo` varchar(250) DEFAULT NULL,
  `ads_created` datetime NOT NULL DEFAULT current_timestamp(),
  `ads_updated` datetime NOT NULL DEFAULT current_timestamp(),
  `ads_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agentes`
--

CREATE TABLE `agentes` (
  `age_id` bigint(20) NOT NULL,
  `age_gpe_id` bigint(20) DEFAULT NULL,
  `age_gem_id` bigint(20) DEFAULT NULL,
  `age_tipo` int(11) NOT NULL DEFAULT 1,
  `age_arrbienes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`age_arrbienes`)),
  `age_monto` decimal(12,6) DEFAULT NULL,
  `age_marca` varchar(10) NOT NULL,
  `age_status` int(11) NOT NULL DEFAULT 1,
  `age_created` datetime NOT NULL DEFAULT current_timestamp(),
  `age_updated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `agentes`
--

INSERT INTO `agentes` (`age_id`, `age_gpe_id`, `age_gem_id`, `age_tipo`, `age_arrbienes`, `age_monto`, `age_marca`, `age_status`, `age_created`, `age_updated`) VALUES
(5, 4, NULL, 1, NULL, NULL, 'CRISTIAN', 1, '2023-02-10 21:20:02', '2023-02-10 21:20:02'),
(6, 5, NULL, 1, NULL, NULL, 'MSR', 1, '2023-02-10 21:43:33', '2023-02-10 21:43:33');

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
  `alm_created` datetime NOT NULL DEFAULT current_timestamp(),
  `alm_updated` datetime NOT NULL DEFAULT current_timestamp(),
  `alm_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `almacenes`
--

INSERT INTO `almacenes` (`alm_id`, `alm_gdi_id`, `alm_nombre`, `alm_direccion`, `alm_imagen`, `alm_est_id`, `alm_created`, `alm_updated`, `alm_status`) VALUES
(1, 150125, 'PRINCIPAL', 'Mz A, lote 12, tambo Inga, Ref. km 27 Panam. Norte', NULL, 1, '2022-07-25 12:30:55', '2022-07-25 12:30:55', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `gar_id` bigint(20) NOT NULL,
  `gar_nombre` varchar(60) NOT NULL,
  `gar_descripcion` varchar(150) NOT NULL,
  `gar_gar_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='g';

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`gar_id`, `gar_nombre`, `gar_descripcion`, `gar_gar_id`) VALUES
(1, 'Directorio', 'Area de los gerentes', NULL),
(2, 'Finanzas', 'Area de los finanzas', NULL),
(3, 'Operaciones', 'Operaciones', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencias`
--

CREATE TABLE `asistencias` (
  `asi_id` bigint(20) NOT NULL,
  `asi_col_id` bigint(20) NOT NULL,
  `asi_ext` int(11) DEFAULT NULL,
  `asi_horaE` datetime NOT NULL,
  `asi_horaS` datetime DEFAULT NULL,
  `asi_obs` text DEFAULT NULL
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
(51, 1, 1576, 1170, 1206),
(52, 1, 1576, 1170, 1206),
(53, 1, 1576, 1170, 1206),
(54, 1, 1576, 1170, 1206),
(55, 1, 1576, 1170, 1206),
(56, 1, 1576, 1170, 1206),
(57, 1, 1576, 1170, 1206),
(58, 1, 1576, 1170, 1206),
(59, 1, 1576, 1170, 1206),
(60, 1, 1576, 1170, 1206),
(61, 1, 1576, 1170, 1206),
(62, 1, 1576, 1170, 1206),
(63, 1, 1576, 1170, 1206),
(64, 1, 1576, 1170, 1206),
(65, 1, 1576, 1170, 1206);

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
  `bie_alm_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`bie_alm_id`)),
  `bie_p` decimal(12,6) NOT NULL DEFAULT 0.000000,
  `bie_igv` tinyint(1) NOT NULL DEFAULT 0,
  `bie_img` text DEFAULT NULL,
  `bie_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bienes`
--

INSERT INTO `bienes` (`bie_id`, `bie_codigo`, `bie_nombre`, `bie_bbi_id`, `bie_t6m_id`, `bie_bie_id`, `bie_alm_id`, `bie_p`, `bie_igv`, `bie_img`, `bie_status`) VALUES
(1, 'BIZ00', 'BIZCOCHO', 53, 64, NULL, '[1]', '0.000000', 0, '[]', 1),
(2, 'MAN', 'MANZANO', 54, 64, NULL, '[1]', '0.000000', 0, '[]', 1),
(3, 'IS00', 'ISLA', 55, 64, NULL, '[1]', '0.000000', 0, '[]', 1),
(4, 'BE00', 'BELLACO', 56, 64, NULL, '[1]', '0.000000', 0, '[]', 1),
(5, 'PA00', 'PALILLO', 57, 64, 5, '[1]', '0.000000', 0, '[]', 1),
(6, 'MO00', 'MORADO', 58, 64, 6, '[1]', '0.000000', 0, '[]', 1),
(7, 'SE00', 'SEDA', 59, 64, NULL, '[1]', '0.000000', 0, '[]', 1),
(8, 'SA00', 'SAPITO', 60, 64, NULL, '[1]', '0.000000', 0, '[]', 1),
(9, 'PA00', 'PAPAYA', 61, 64, NULL, '[1]', '0.000000', 0, '[]', 1),
(10, 'CO00', 'COCONA', 62, 64, 10, '[1]', '0.000000', 0, '[]', 1),
(11, 'AG00', 'AGUAJE', 63, 64, NULL, '[1]', '0.000000', 0, '[]', 1),
(12, 'PI00', 'PITUCA', 64, 64, NULL, '[1]', '0.000000', 0, '[]', 1),
(13, 'TO00', 'TORONJA', 65, 64, 13, '[1]', '0.000000', 0, '[]', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `caj_id` bigint(20) NOT NULL,
  `caj_tipo` int(11) NOT NULL,
  `caj_numero` bigint(20) NOT NULL,
  `caj_tga_id` bigint(20) DEFAULT NULL,
  `caj_responsable` text DEFAULT NULL,
  `caj_fecha` date NOT NULL,
  `caj_col_id` bigint(20) DEFAULT NULL,
  `caj_age_id` bigint(20) DEFAULT NULL,
  `caj_observaciones` text DEFAULT NULL,
  `caj_cue_id` bigint(20) DEFAULT NULL,
  `caj_t1m_id` bigint(20) DEFAULT NULL,
  `caj_gt4_id` bigint(20) DEFAULT 1,
  `caj_monto` decimal(24,4) NOT NULL,
  `caj_gus_id` bigint(20) DEFAULT NULL,
  `caj_caj_id` bigint(20) DEFAULT NULL,
  `caj_created` datetime NOT NULL DEFAULT current_timestamp(),
  `caj_updated` datetime NOT NULL DEFAULT current_timestamp(),
  `caj_status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `cie_qs` decimal(24,12) NOT NULL DEFAULT 0.000000000000,
  `cie_mts` decimal(24,12) NOT NULL DEFAULT 0.000000000000,
  `cie_qc` decimal(24,12) NOT NULL DEFAULT 0.000000000000,
  `cie_mtc` decimal(24,12) NOT NULL DEFAULT 0.000000000000,
  `cie_qv` decimal(24,12) NOT NULL DEFAULT 0.000000000000,
  `cie_mtv` decimal(24,12) NOT NULL DEFAULT 0.000000000000,
  `cie_start` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `gcl_id` bigint(20) NOT NULL,
  `gcl_gem_id` bigint(20) DEFAULT NULL,
  `gcl_imagen` varchar(200) DEFAULT NULL,
  `gcl_correo` varchar(200) NOT NULL,
  `gcl_pweb` varchar(200) NOT NULL,
  `gcl_telefono` varchar(10) DEFAULT NULL,
  `gcl_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='g';

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`gcl_id`, `gcl_gem_id`, `gcl_imagen`, `gcl_correo`, `gcl_pweb`, `gcl_telefono`, `gcl_status`) VALUES
(1, 1, 'img_77d01642f1e6ee813bd86da650b431c5.jpg', 'informes@company.com', 'www.grrepresentaciones.com', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colaboradores`
--

CREATE TABLE `colaboradores` (
  `col_id` bigint(20) NOT NULL,
  `col_cod` int(11) NOT NULL,
  `col_gpe_id` bigint(20) NOT NULL,
  `col_gar_id` bigint(20) NOT NULL,
  `col_puesto` varchar(250) NOT NULL,
  `col_est_id` bigint(20) NOT NULL,
  `col_img` varchar(250) DEFAULT NULL,
  `col_ruc` varchar(11) DEFAULT NULL,
  `col_clavesol` varchar(50) DEFAULT NULL,
  `col_cuenta` varchar(50) DEFAULT NULL,
  `col_viaja` tinyint(1) DEFAULT NULL,
  `col_sbase` decimal(12,2) DEFAULT NULL,
  `col_fechaIT` date DEFAULT NULL,
  `col_status` int(11) NOT NULL DEFAULT 1
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
  `ico_bie_mainboard` bigint(20) DEFAULT NULL,
  `ico_bie_monitor` bigint(20) DEFAULT NULL,
  `ico_bie_teclado` bigint(20) DEFAULT NULL,
  `ico_bie_mouse` bigint(20) DEFAULT NULL,
  `ico_bie_cpoder` bigint(20) DEFAULT NULL,
  `ico_bie_hdmi` bigint(20) DEFAULT NULL,
  `ico_bie_vga` bigint(20) DEFAULT NULL,
  `ico_bie_cotro` bigint(20) DEFAULT NULL,
  `ico_bie_ram` bigint(20) DEFAULT NULL,
  `ico_bie_ssd` bigint(20) DEFAULT NULL,
  `ico_bie_hhd` bigint(20) DEFAULT NULL,
  `ico_bie_fuentep` bigint(20) DEFAULT NULL,
  `ico_bie_tarjetag` bigint(20) DEFAULT NULL,
  `ico_bie_tarjetav` bigint(20) DEFAULT NULL,
  `ico_bie_tarjetar` bigint(20) DEFAULT NULL,
  `ico_bie_otroc` bigint(20) DEFAULT NULL
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
  `com_numero` int(11) NOT NULL,
  `com_t12_id` bigint(20) NOT NULL,
  `com_t10_id` bigint(20) NOT NULL,
  `com_gtc_id` bigint(20) NOT NULL,
  `com_t1m_id` bigint(20) NOT NULL,
  `com_fechaE` date NOT NULL,
  `com_fechaR` date NOT NULL,
  `com_fechaV` date DEFAULT NULL,
  `com_subtotal` decimal(24,12) NOT NULL,
  `com_igv_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`com_igv_id`)),
  `com_total` decimal(24,12) NOT NULL,
  `com_observaciones` text NOT NULL,
  `com_acr_id` bigint(20) DEFAULT NULL,
  `com_ncr_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`com_ncr_id`)),
  `com_ticket` varchar(50) DEFAULT NULL,
  `com_created` datetime NOT NULL DEFAULT current_timestamp(),
  `com_updated` datetime NOT NULL DEFAULT current_timestamp(),
  `com_cstatus` int(11) NOT NULL DEFAULT 1
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
  `cue_gt4_id` bigint(20) DEFAULT 1,
  `cue_status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `gde_id` bigint(20) NOT NULL,
  `gde_departamento` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='g';

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`gde_id`, `gde_departamento`) VALUES
(1, 'AMAZONAS'),
(2, 'ANCASH'),
(3, 'APURIMAC'),
(4, 'AREQUIPA'),
(5, 'AYACUCHO'),
(6, 'CAJAMARCA'),
(7, 'PROV. CONST. DEL CALLAO'),
(8, 'CUSCO'),
(9, 'HUANCAVELICA'),
(10, 'HUANUCO'),
(11, 'ICA'),
(12, 'JUNIN'),
(13, 'LA LIBERTAD'),
(14, 'LAMBAYEQUE'),
(15, 'LIMA'),
(16, 'LORETO'),
(17, 'MADRE DE DIOS'),
(18, 'MOQUEGUA'),
(19, 'PASCO'),
(20, 'PIURA'),
(21, 'PUNO'),
(22, 'SAN MARTIN'),
(23, 'TACNA'),
(24, 'TUMBES'),
(25, 'UCAYALI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuentos`
--

CREATE TABLE `descuentos` (
  `des_id` bigint(20) NOT NULL,
  `des_t6m_id` bigint(20) DEFAULT NULL,
  `des_tga_id` bigint(20) NOT NULL,
  `des_q` decimal(12,4) NOT NULL,
  `des_p` decimal(12,4) NOT NULL,
  `des_mt` decimal(12,4) NOT NULL,
  `des_mov_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `descuentos`
--

INSERT INTO `descuentos` (`des_id`, `des_t6m_id`, `des_tga_id`, `des_q`, `des_p`, `des_mt`, `des_mov_id`) VALUES
(1, 68, 1, '171.0000', '6.0000', '1026.0000', 7),
(2, 65, 1, '14.0000', '4.5000', '63.0000', 7),
(3, 68, 2, '180.0000', '3.7000', '666.0000', 7),
(4, 65, 3, '10.0000', '2.7000', '27.0000', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distritos`
--

CREATE TABLE `distritos` (
  `gdi_id` bigint(20) NOT NULL,
  `gdi_distrito` varchar(60) DEFAULT NULL,
  `gdi_gpr_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='g';

--
-- Volcado de datos para la tabla `distritos`
--

INSERT INTO `distritos` (`gdi_id`, `gdi_distrito`, `gdi_gpr_id`) VALUES
(10101, 'CHACHAPOYAS', 101),
(10102, 'ASUNCION', 101),
(10103, 'BALSAS', 101),
(10104, 'CHETO', 101),
(10105, 'CHILIQUIN', 101),
(10106, 'CHUQUIBAMBA', 101),
(10107, 'GRANADA', 101),
(10108, 'HUANCAS', 101),
(10109, 'LA JALCA', 101),
(10110, 'LEIMEBAMBA', 101),
(10111, 'LEVANTO', 101),
(10112, 'MAGDALENA', 101),
(10113, 'MARISCAL CASTILLA', 101),
(10114, 'MOLINOPAMPA', 101),
(10115, 'MONTEVIDEO', 101),
(10116, 'OLLEROS', 101),
(10117, 'QUINJALCA', 101),
(10118, 'SAN FRANCISCO DE DAGUAS', 101),
(10119, 'SAN ISIDRO DE MAINO', 101),
(10120, 'SOLOCO', 101),
(10121, 'SONCHE', 101),
(10201, 'BAGUA', 102),
(10202, 'ARAMANGO', 102),
(10203, 'COPALLIN', 102),
(10204, 'EL PARCO', 102),
(10205, 'IMAZA', 102),
(10206, 'LA PECA', 102),
(10301, 'JUMBILLA', 103),
(10302, 'CHISQUILLA', 103),
(10303, 'CHURUJA', 103),
(10304, 'COROSHA', 103),
(10305, 'CUISPES', 103),
(10306, 'FLORIDA', 103),
(10307, 'JAZAN', 103),
(10308, 'RECTA', 103),
(10309, 'SAN CARLOS', 103),
(10310, 'SHIPASBAMBA', 103),
(10311, 'VALERA', 103),
(10312, 'YAMBRASBAMBA', 103),
(10401, 'NIEVA', 104),
(10402, 'EL CENEPA', 104),
(10403, 'RIO SANTIAGO', 104),
(10501, 'LAMUD', 105),
(10502, 'CAMPORREDONDO', 105),
(10503, 'COCABAMBA', 105),
(10504, 'COLCAMAR', 105),
(10505, 'CONILA', 105),
(10506, 'INGUILPATA', 105),
(10507, 'LONGUITA', 105),
(10508, 'LONYA CHICO', 105),
(10509, 'LUYA', 105),
(10510, 'LUYA VIEJO', 105),
(10511, 'MARIA', 105),
(10512, 'OCALLI', 105),
(10513, 'OCUMAL', 105),
(10514, 'PISUQUIA', 105),
(10515, 'PROVIDENCIA', 105),
(10516, 'SAN CRISTOBAL', 105),
(10517, 'SAN FRANCISCO DEL YESO', 105),
(10518, 'SAN JERONIMO', 105),
(10519, 'SAN JUAN DE LOPECANCHA', 105),
(10520, 'SANTA CATALINA', 105),
(10521, 'SANTO TOMAS', 105),
(10522, 'TINGO', 105),
(10523, 'TRITA', 105),
(10601, 'SAN NICOLAS', 106),
(10602, 'CHIRIMOTO', 106),
(10603, 'COCHAMAL', 106),
(10604, 'HUAMBO', 106),
(10605, 'LIMABAMBA', 106),
(10606, 'LONGAR', 106),
(10607, 'MARISCAL BENAVIDES', 106),
(10608, 'MILPUC', 106),
(10609, 'OMIA', 106),
(10610, 'SANTA ROSA', 106),
(10611, 'TOTORA', 106),
(10612, 'VISTA ALEGRE', 106),
(10701, 'BAGUA GRANDE', 107),
(10702, 'CAJARURO', 107),
(10703, 'CUMBA', 107),
(10704, 'EL MILAGRO', 107),
(10705, 'JAMALCA', 107),
(10706, 'LONYA GRANDE', 107),
(10707, 'YAMON', 107),
(20101, 'HUARAZ', 201),
(20102, 'COCHABAMBA', 201),
(20103, 'COLCABAMBA', 201),
(20104, 'HUANCHAY', 201),
(20105, 'INDEPENDENCIA', 201),
(20106, 'JANGAS', 201),
(20107, 'LA LIBERTAD', 201),
(20108, 'OLLEROS', 201),
(20109, 'PAMPAS', 201),
(20110, 'PARIACOTO', 201),
(20111, 'PIRA', 201),
(20112, 'TARICA', 201),
(20201, 'AIJA', 202),
(20202, 'CORIS', 202),
(20203, 'HUACLLAN', 202),
(20204, 'LA MERCED', 202),
(20205, 'SUCCHA', 202),
(20301, 'LLAMELLIN', 203),
(20302, 'ACZO', 203),
(20303, 'CHACCHO', 203),
(20304, 'CHINGAS', 203),
(20305, 'MIRGAS', 203),
(20306, 'SAN JUAN DE RONTOY', 203),
(20401, 'CHACAS', 204),
(20402, 'ACOCHACA', 204),
(20501, 'CHIQUIAN', 205),
(20502, 'ABELARDO PARDO LEZAMETA', 205),
(20503, 'ANTONIO RAYMONDI', 205),
(20504, 'AQUIA', 205),
(20505, 'CAJACAY', 205),
(20506, 'CANIS', 205),
(20507, 'COLQUIOC', 205),
(20508, 'HUALLANCA', 205),
(20509, 'HUASTA', 205),
(20510, 'HUAYLLACAYAN', 205),
(20511, 'LA PRIMAVERA', 205),
(20512, 'MANGAS', 205),
(20513, 'PACLLON', 205),
(20514, 'SAN MIGUEL DE CORPANQUI', 205),
(20515, 'TICLLOS', 205),
(20601, 'CARHUAZ', 206),
(20602, 'ACOPAMPA', 206),
(20603, 'AMASHCA', 206),
(20604, 'ANTA', 206),
(20605, 'ATAQUERO', 206),
(20606, 'MARCARA', 206),
(20607, 'PARIAHUANCA', 206),
(20608, 'SAN MIGUEL DE ACO', 206),
(20609, 'SHILLA', 206),
(20610, 'TINCO', 206),
(20611, 'YUNGAR', 206),
(20701, 'SAN LUIS', 207),
(20702, 'SAN NICOLAS', 207),
(20703, 'YAUYA', 207),
(20801, 'CASMA', 208),
(20802, 'BUENA VISTA ALTA', 208),
(20803, 'COMANDANTE NOEL', 208),
(20804, 'YAUTAN', 208),
(20901, 'CORONGO', 209),
(20902, 'ACO', 209),
(20903, 'BAMBAS', 209),
(20904, 'CUSCA', 209),
(20905, 'LA PAMPA', 209),
(20906, 'YANAC', 209),
(20907, 'YUPAN', 209),
(21001, 'HUARI', 210),
(21002, 'ANRA', 210),
(21003, 'CAJAY', 210),
(21004, 'CHAVIN DE HUANTAR', 210),
(21005, 'HUACACHI', 210),
(21006, 'HUACCHIS', 210),
(21007, 'HUACHIS', 210),
(21008, 'HUANTAR', 210),
(21009, 'MASIN', 210),
(21010, 'PAUCAS', 210),
(21011, 'PONTO', 210),
(21012, 'RAHUAPAMPA', 210),
(21013, 'RAPAYAN', 210),
(21014, 'SAN MARCOS', 210),
(21015, 'SAN PEDRO DE CHANA', 210),
(21016, 'UCO', 210),
(21101, 'HUARMEY', 211),
(21102, 'COCHAPETI', 211),
(21103, 'CULEBRAS', 211),
(21104, 'HUAYAN', 211),
(21105, 'MALVAS', 211),
(21201, 'CARAZ', 212),
(21202, 'HUALLANCA', 212),
(21203, 'HUATA', 212),
(21204, 'HUAYLAS', 212),
(21205, 'MATO', 212),
(21206, 'PAMPAROMAS', 212),
(21207, 'PUEBLO LIBRE / 1', 212),
(21208, 'SANTA CRUZ', 212),
(21209, 'SANTO TORIBIO', 212),
(21210, 'YURACMARCA', 212),
(21301, 'PISCOBAMBA', 213),
(21302, 'CASCA', 213),
(21303, 'ELEAZAR GUZMAN BARRON', 213),
(21304, 'FIDEL OLIVAS ESCUDERO', 213),
(21305, 'LLAMA', 213),
(21306, 'LLUMPA', 213),
(21307, 'LUCMA', 213),
(21308, 'MUSGA', 213),
(21401, 'OCROS', 214),
(21402, 'ACAS', 214),
(21403, 'CAJAMARQUILLA', 214),
(21404, 'CARHUAPAMPA', 214),
(21405, 'COCHAS', 214),
(21406, 'CONGAS', 214),
(21407, 'LLIPA', 214),
(21408, 'SAN CRISTOBAL DE RAJAN', 214),
(21409, 'SAN PEDRO', 214),
(21410, 'SANTIAGO DE CHILCAS', 214),
(21501, 'CABANA', 215),
(21502, 'BOLOGNESI', 215),
(21503, 'CONCHUCOS', 215),
(21504, 'HUACASCHUQUE', 215),
(21505, 'HUANDOVAL', 215),
(21506, 'LACABAMBA', 215),
(21507, 'LLAPO', 215),
(21508, 'PALLASCA', 215),
(21509, 'PAMPAS', 215),
(21510, 'SANTA ROSA', 215),
(21511, 'TAUCA', 215),
(21601, 'POMABAMBA', 216),
(21602, 'HUAYLLAN', 216),
(21603, 'PAROBAMBA', 216),
(21604, 'QUINUABAMBA', 216),
(21701, 'RECUAY', 217),
(21702, 'CATAC', 217),
(21703, 'COTAPARACO', 217),
(21704, 'HUAYLLAPAMPA', 217),
(21705, 'LLACLLIN', 217),
(21706, 'MARCA', 217),
(21707, 'PAMPAS CHICO', 217),
(21708, 'PARARIN', 217),
(21709, 'TAPACOCHA', 217),
(21710, 'TICAPAMPA', 217),
(21801, 'CHIMBOTE', 218),
(21802, 'CACERES DEL PERU', 218),
(21803, 'COISHCO', 218),
(21804, 'MACATE', 218),
(21805, 'MORO', 218),
(21806, 'NEPEÑA', 218),
(21807, 'SAMANCO', 218),
(21808, 'SANTA', 218),
(21809, 'NUEVO CHIMBOTE', 218),
(21901, 'SIHUAS', 219),
(21902, 'ACOBAMBA', 219),
(21903, 'ALFONSO UGARTE', 219),
(21904, 'CASHAPAMPA', 219),
(21905, 'CHINGALPO', 219),
(21906, 'HUAYLLABAMBA', 219),
(21907, 'QUICHES', 219),
(21908, 'RAGASH', 219),
(21909, 'SAN JUAN', 219),
(21910, 'SICSIBAMBA', 219),
(22001, 'YUNGAY', 220),
(22002, 'CASCAPARA', 220),
(22003, 'MANCOS', 220),
(22004, 'MATACOTO', 220),
(22005, 'QUILLO', 220),
(22006, 'RANRAHIRCA', 220),
(22007, 'SHUPLUY', 220),
(22008, 'YANAMA', 220),
(30101, 'ABANCAY', 301),
(30102, 'CHACOCHE', 301),
(30103, 'CIRCA', 301),
(30104, 'CURAHUASI', 301),
(30105, 'HUANIPACA', 301),
(30106, 'LAMBRAMA', 301),
(30107, 'PICHIRHUA', 301),
(30108, 'SAN PEDRO DE CACHORA', 301),
(30109, 'TAMBURCO', 301),
(30201, 'ANDAHUAYLAS', 302),
(30202, 'ANDARAPA', 302),
(30203, 'CHIARA', 302),
(30204, 'HUANCARAMA', 302),
(30205, 'HUANCARAY', 302),
(30206, 'HUAYANA', 302),
(30207, 'KISHUARA', 302),
(30208, 'PACOBAMBA', 302),
(30209, 'PACUCHA', 302),
(30210, 'PAMPACHIRI', 302),
(30211, 'POMACOCHA', 302),
(30212, 'SAN ANTONIO DE CACHI', 302),
(30213, 'SAN JERONIMO', 302),
(30214, 'SAN MIGUEL DE CHACCRAMPA', 302),
(30215, 'SANTA MARIA DE CHICMO', 302),
(30216, 'TALAVERA', 302),
(30217, 'TUMAY HUARACA', 302),
(30218, 'TURPO', 302),
(30219, 'KAQUIABAMBA', 302),
(30301, 'ANTABAMBA', 303),
(30302, 'EL ORO', 303),
(30303, 'HUAQUIRCA', 303),
(30304, 'JUAN ESPINOZA MEDRANO', 303),
(30305, 'OROPESA', 303),
(30306, 'PACHACONAS', 303),
(30307, 'SABAINO', 303),
(30401, 'CHALHUANCA', 304),
(30402, 'CAPAYA', 304),
(30403, 'CARAYBAMBA', 304),
(30404, 'CHAPIMARCA', 304),
(30405, 'COLCABAMBA', 304),
(30406, 'COTARUSE', 304),
(30407, 'HUAYLLO', 304),
(30408, 'JUSTO APU SAHUARAURA', 304),
(30409, 'LUCRE', 304),
(30410, 'POCOHUANCA', 304),
(30411, 'SAN JUAN DE CHACÑA', 304),
(30412, 'SAÑAYCA', 304),
(30413, 'SORAYA', 304),
(30414, 'TAPAIRIHUA', 304),
(30415, 'TINTAY', 304),
(30416, 'TORAYA', 304),
(30417, 'YANACA', 304),
(30501, 'TAMBOBAMBA', 305),
(30502, 'COTABAMBAS', 305),
(30503, 'COYLLURQUI', 305),
(30504, 'HAQUIRA', 305),
(30505, 'MARA', 305),
(30506, 'CHALLHUAHUACHO', 305),
(30601, 'CHINCHEROS', 306),
(30602, 'ANCO-HUALLO', 306),
(30603, 'COCHARCAS', 306),
(30604, 'HUACCANA', 306),
(30605, 'OCOBAMBA', 306),
(30606, 'ONGOY', 306),
(30607, 'URANMARCA', 306),
(30608, 'RANRACANCHA', 306),
(30701, 'CHUQUIBAMBILLA', 307),
(30702, 'CURPAHUASI', 307),
(30703, 'GAMARRA', 307),
(30704, 'HUAYLLATI', 307),
(30705, 'MAMARA', 307),
(30706, 'MICAELA BASTIDAS', 307),
(30707, 'PATAYPAMPA', 307),
(30708, 'PROGRESO', 307),
(30709, 'SAN ANTONIO', 307),
(30710, 'SANTA ROSA', 307),
(30711, 'TURPAY', 307),
(30712, 'VILCABAMBA', 307),
(30713, 'VIRUNDO', 307),
(30714, 'CURASCO', 307),
(40101, 'AREQUIPA', 401),
(40102, 'ALTO SELVA ALEGRE', 401),
(40103, 'CAYMA', 401),
(40104, 'CERRO COLORADO', 401),
(40105, 'CHARACATO', 401),
(40106, 'CHIGUATA', 401),
(40107, 'JACOBO HUNTER', 401),
(40108, 'LA JOYA', 401),
(40109, 'MARIANO MELGAR', 401),
(40110, 'MIRAFLORES', 401),
(40111, 'MOLLEBAYA', 401),
(40112, 'PAUCARPATA', 401),
(40113, 'POCSI', 401),
(40114, 'POLOBAYA', 401),
(40115, 'QUEQUEÑA', 401),
(40116, 'SABANDIA', 401),
(40117, 'SACHACA', 401),
(40118, 'SAN JUAN DE SIGUAS /1', 401),
(40119, 'SAN JUAN DE TARUCANI', 401),
(40120, 'SANTA ISABEL DE SIGUAS', 401),
(40121, 'SANTA RITA DE SIGUAS', 401),
(40122, 'SOCABAYA', 401),
(40123, 'TIABAYA', 401),
(40124, 'UCHUMAYO', 401),
(40125, 'VITOR', 401),
(40126, 'YANAHUARA', 401),
(40127, 'YARABAMBA', 401),
(40128, 'YURA', 401),
(40129, 'JOSE LUIS BUSTAMANTE Y RIVERO', 401),
(40201, 'CAMANA', 402),
(40202, 'JOSE MARIA QUIMPER', 402),
(40203, 'MARIANO NICOLAS VALCARCEL', 402),
(40204, 'MARISCAL CACERES', 402),
(40205, 'NICOLAS DE PIEROLA', 402),
(40206, 'OCOÑA', 402),
(40207, 'QUILCA', 402),
(40208, 'SAMUEL PASTOR', 402),
(40301, 'CARAVELI', 403),
(40302, 'ACARI', 403),
(40303, 'ATICO', 403),
(40304, 'ATIQUIPA', 403),
(40305, 'BELLA UNION', 403),
(40306, 'CAHUACHO', 403),
(40307, 'CHALA', 403),
(40308, 'CHAPARRA', 403),
(40309, 'HUANUHUANU', 403),
(40310, 'JAQUI', 403),
(40311, 'LOMAS', 403),
(40312, 'QUICACHA', 403),
(40313, 'YAUCA', 403),
(40401, 'APLAO', 404),
(40402, 'ANDAGUA', 404),
(40403, 'AYO', 404),
(40404, 'CHACHAS', 404),
(40405, 'CHILCAYMARCA', 404),
(40406, 'CHOCO', 404),
(40407, 'HUANCARQUI', 404),
(40408, 'MACHAGUAY', 404),
(40409, 'ORCOPAMPA', 404),
(40410, 'PAMPACOLCA', 404),
(40411, 'TIPAN', 404),
(40412, 'UÑON', 404),
(40413, 'URACA', 404),
(40414, 'VIRACO', 404),
(40501, 'CHIVAY', 405),
(40502, 'ACHOMA', 405),
(40503, 'CABANACONDE', 405),
(40504, 'CALLALLI', 405),
(40505, 'CAYLLOMA', 405),
(40506, 'COPORAQUE', 405),
(40507, 'HUAMBO', 405),
(40508, 'HUANCA', 405),
(40509, 'ICHUPAMPA', 405),
(40510, 'LARI', 405),
(40511, 'LLUTA', 405),
(40512, 'MACA', 405),
(40513, 'MADRIGAL', 405),
(40514, 'SAN ANTONIO DE CHUCA 2/', 405),
(40515, 'SIBAYO', 405),
(40516, 'TAPAY', 405),
(40517, 'TISCO', 405),
(40518, 'TUTI', 405),
(40519, 'YANQUE', 405),
(40520, 'MAJES', 405),
(40601, 'CHUQUIBAMBA', 406),
(40602, 'ANDARAY', 406),
(40603, 'CAYARANI', 406),
(40604, 'CHICHAS', 406),
(40605, 'IRAY', 406),
(40606, 'RIO GRANDE', 406),
(40607, 'SALAMANCA', 406),
(40608, 'YANAQUIHUA', 406),
(40701, 'MOLLENDO', 407),
(40702, 'COCACHACRA', 407),
(40703, 'DEAN VALDIVIA', 407),
(40704, 'ISLAY', 407),
(40705, 'MEJIA', 407),
(40706, 'PUNTA DE BOMBON', 407),
(40801, 'COTAHUASI', 408),
(40802, 'ALCA', 408),
(40803, 'CHARCANA', 408),
(40804, 'HUAYNACOTAS', 408),
(40805, 'PAMPAMARCA', 408),
(40806, 'PUYCA', 408),
(40807, 'QUECHUALLA', 408),
(40808, 'SAYLA', 408),
(40809, 'TAURIA', 408),
(40810, 'TOMEPAMPA', 408),
(40811, 'TORO', 408),
(50101, 'AYACUCHO', 501),
(50102, 'ACOCRO', 501),
(50103, 'ACOS VINCHOS', 501),
(50104, 'CARMEN ALTO', 501),
(50105, 'CHIARA', 501),
(50106, 'OCROS', 501),
(50107, 'PACAYCASA', 501),
(50108, 'QUINUA', 501),
(50109, 'SAN JOSE DE TICLLAS', 501),
(50110, 'SAN JUAN BAUTISTA', 501),
(50111, 'SANTIAGO DE PISCHA', 501),
(50112, 'SOCOS', 501),
(50113, 'TAMBILLO', 501),
(50114, 'VINCHOS', 501),
(50115, 'JESUS NAZARENO', 501),
(50201, 'CANGALLO', 502),
(50202, 'CHUSCHI', 502),
(50203, 'LOS MOROCHUCOS', 502),
(50204, 'MARIA PARADO DE BELLIDO', 502),
(50205, 'PARAS', 502),
(50206, 'TOTOS', 502),
(50301, 'SANCOS', 503),
(50302, 'CARAPO', 503),
(50303, 'SACSAMARCA', 503),
(50304, 'SANTIAGO DE LUCANAMARCA', 503),
(50401, 'HUANTA', 504),
(50402, 'AYAHUANCO', 504),
(50403, 'HUAMANGUILLA', 504),
(50404, 'IGUAIN', 504),
(50405, 'LURICOCHA', 504),
(50406, 'SANTILLANA', 504),
(50407, 'SIVIA', 504),
(50408, 'LLOCHEGUA', 504),
(50501, 'SAN MIGUEL', 505),
(50502, 'ANCO', 505),
(50503, 'AYNA', 505),
(50504, 'CHILCAS', 505),
(50505, 'CHUNGUI', 505),
(50506, 'LUIS CARRANZA', 505),
(50507, 'SANTA ROSA', 505),
(50508, 'TAMBO', 505),
(50601, 'PUQUIO', 506),
(50602, 'AUCARA', 506),
(50603, 'CABANA', 506),
(50604, 'CARMEN SALCEDO', 506),
(50605, 'CHAVIÑA', 506),
(50606, 'CHIPAO', 506),
(50607, 'HUAC-HUAS', 506),
(50608, 'LARAMATE', 506),
(50609, 'LEONCIO PRADO', 506),
(50610, 'LLAUTA', 506),
(50611, 'LUCANAS', 506),
(50612, 'OCAÑA', 506),
(50613, 'OTOCA', 506),
(50614, 'SAISA', 506),
(50615, 'SAN CRISTOBAL', 506),
(50616, 'SAN JUAN', 506),
(50617, 'SAN PEDRO', 506),
(50618, 'SAN PEDRO DE PALCO', 506),
(50619, 'SANCOS', 506),
(50620, 'SANTA ANA DE HUAYCAHUACHO', 506),
(50621, 'SANTA LUCIA', 506),
(50701, 'CORACORA', 507),
(50702, 'CHUMPI', 507),
(50703, 'CORONEL CASTAÑEDA', 507),
(50704, 'PACAPAUSA', 507),
(50705, 'PULLO', 507),
(50706, 'PUYUSCA', 507),
(50707, 'SAN FRANCISCO DE RAVACAYCO', 507),
(50708, 'UPAHUACHO', 507),
(50801, 'PAUSA', 508),
(50802, 'COLTA', 508),
(50803, 'CORCULLA', 508),
(50804, 'LAMPA', 508),
(50805, 'MARCABAMBA', 508),
(50806, 'OYOLO', 508),
(50807, 'PARARCA', 508),
(50808, 'SAN JAVIER DE ALPABAMBA', 508),
(50809, 'SAN JOSE DE USHUA', 508),
(50810, 'SARA SARA', 508),
(50901, 'QUEROBAMBA', 509),
(50902, 'BELEN', 509),
(50903, 'CHALCOS', 509),
(50904, 'CHILCAYOC', 509),
(50905, 'HUACAÑA', 509),
(50906, 'MORCOLLA', 509),
(50907, 'PAICO', 509),
(50908, 'SAN PEDRO DE LARCAY', 509),
(50909, 'SAN SALVADOR DE QUIJE', 509),
(50910, 'SANTIAGO DE PAUCARAY', 509),
(50911, 'SORAS', 509),
(51001, 'HUANCAPI', 510),
(51002, 'ALCAMENCA', 510),
(51003, 'APONGO', 510),
(51004, 'ASQUIPATA', 510),
(51005, 'CANARIA', 510),
(51006, 'CAYARA', 510),
(51007, 'COLCA', 510),
(51008, 'HUAMANQUIQUIA', 510),
(51009, 'HUANCARAYLLA', 510),
(51010, 'HUAYA', 510),
(51011, 'SARHUA', 510),
(51012, 'VILCANCHOS', 510),
(51101, 'VILCAS HUAMAN', 511),
(51102, 'ACCOMARCA', 511),
(51103, 'CARHUANCA', 511),
(51104, 'CONCEPCION', 511),
(51105, 'HUAMBALPA', 511),
(51106, 'INDEPENDENCIA /1', 511),
(51107, 'SAURAMA', 511),
(51108, 'VISCHONGO', 511),
(60101, 'CAJAMARCA', 601),
(60102, 'ASUNCION', 601),
(60103, 'CHETILLA', 601),
(60104, 'COSPAN', 601),
(60105, 'ENCAÑADA', 601),
(60106, 'JESUS', 601),
(60107, 'LLACANORA', 601),
(60108, 'LOS BAÑOS DEL INCA', 601),
(60109, 'MAGDALENA', 601),
(60110, 'MATARA', 601),
(60111, 'NAMORA', 601),
(60112, 'SAN JUAN', 601),
(60201, 'CAJABAMBA', 602),
(60202, 'CACHACHI', 602),
(60203, 'CONDEBAMBA', 602),
(60204, 'SITACOCHA', 602),
(60301, 'CELENDIN', 603),
(60302, 'CHUMUCH', 603),
(60303, 'CORTEGANA', 603),
(60304, 'HUASMIN', 603),
(60305, 'JORGE CHAVEZ', 603),
(60306, 'JOSE GALVEZ', 603),
(60307, 'MIGUEL IGLESIAS', 603),
(60308, 'OXAMARCA', 603),
(60309, 'SOROCHUCO', 603),
(60310, 'SUCRE', 603),
(60311, 'UTCO', 603),
(60312, 'LA LIBERTAD DE PALLAN', 603),
(60401, 'CHOTA', 604),
(60402, 'ANGUIA', 604),
(60403, 'CHADIN', 604),
(60404, 'CHIGUIRIP', 604),
(60405, 'CHIMBAN', 604),
(60406, 'CHOROPAMPA', 604),
(60407, 'COCHABAMBA', 604),
(60408, 'CONCHAN', 604),
(60409, 'HUAMBOS', 604),
(60410, 'LAJAS', 604),
(60411, 'LLAMA', 604),
(60412, 'MIRACOSTA', 604),
(60413, 'PACCHA', 604),
(60414, 'PION', 604),
(60415, 'QUEROCOTO', 604),
(60416, 'SAN JUAN DE LICUPIS', 604),
(60417, 'TACABAMBA', 604),
(60418, 'TOCMOCHE', 604),
(60419, 'CHALAMARCA', 604),
(60501, 'CONTUMAZA', 605),
(60502, 'CHILETE', 605),
(60503, 'CUPISNIQUE', 605),
(60504, 'GUZMANGO', 605),
(60505, 'SAN BENITO', 605),
(60506, 'SANTA CRUZ DE TOLED', 605),
(60507, 'TANTARICA', 605),
(60508, 'YONAN', 605),
(60601, 'CUTERVO', 606),
(60602, 'CALLAYUC', 606),
(60603, 'CHOROS', 606),
(60604, 'CUJILLO', 606),
(60605, 'LA RAMADA', 606),
(60606, 'PIMPINGOS', 606),
(60607, 'QUEROCOTILLO', 606),
(60608, 'SAN ANDRES DE CUTERVO', 606),
(60609, 'SAN JUAN DE CUTERVO', 606),
(60610, 'SAN LUIS DE LUCMA', 606),
(60611, 'SANTA CRUZ', 606),
(60612, 'SANTO DOMINGO DE LA CAPILLA', 606),
(60613, 'SANTO TOMAS', 606),
(60614, 'SOCOTA', 606),
(60615, 'TORIBIO CASANOVA', 606),
(60701, 'BAMBAMARCA', 607),
(60702, 'CHUGUR', 607),
(60703, 'HUALGAYOC', 607),
(60801, 'JAEN', 608),
(60802, 'BELLAVISTA', 608),
(60803, 'CHONTALI', 608),
(60804, 'COLASAY', 608),
(60805, 'HUABAL', 608),
(60806, 'LAS PIRIAS', 608),
(60807, 'POMAHUACA', 608),
(60808, 'PUCARA', 608),
(60809, 'SALLIQUE', 608),
(60810, 'SAN FELIPE', 608),
(60811, 'SAN JOSE DEL ALTO', 608),
(60812, 'SANTA ROSA', 608),
(60901, 'SAN IGNACIO', 609),
(60902, 'CHIRINOS', 609),
(60903, 'HUARANGO', 609),
(60904, 'LA COIPA', 609),
(60905, 'NAMBALLE', 609),
(60906, 'SAN JOSE DE LOURDES', 609),
(60907, 'TABACONAS', 609),
(61001, 'PEDRO GALVEZ', 610),
(61002, 'CHANCAY', 610),
(61003, 'EDUARDO VILLANUEVA', 610),
(61004, 'GREGORIO PITA', 610),
(61005, 'ICHOCAN', 610),
(61006, 'JOSE MANUEL QUIROZ', 610),
(61007, 'JOSE SABOGAL', 610),
(61101, 'SAN MIGUEL', 611),
(61102, 'BOLIVAR', 611),
(61103, 'CALQUIS', 611),
(61104, 'CATILLUC', 611),
(61105, 'EL PRADO', 611),
(61106, 'LA FLORIDA', 611),
(61107, 'LLAPA', 611),
(61108, 'NANCHOC', 611),
(61109, 'NIEPOS', 611),
(61110, 'SAN GREGORIO', 611),
(61111, 'SAN SILVESTRE DE COCHAN', 611),
(61112, 'TONGOD', 611),
(61113, 'UNION AGUA BLANCA', 611),
(61201, 'SAN PABLO', 612),
(61202, 'SAN BERNARDINO', 612),
(61203, 'SAN LUIS', 612),
(61204, 'TUMBADEN', 612),
(61301, 'SANTA CRUZ', 613),
(61302, 'ANDABAMBA', 613),
(61303, 'CATACHE', 613),
(61304, 'CHANCAYBAÑOS', 613),
(61305, 'LA ESPERANZA', 613),
(61306, 'NINABAMBA', 613),
(61307, 'PULAN', 613),
(61308, 'SAUCEPAMPA', 613),
(61309, 'SEXI', 613),
(61310, 'UTICYACU', 613),
(61311, 'YAUYUCAN', 613),
(70101, 'CALLAO', 701),
(70102, 'BELLAVISTA', 701),
(70103, 'CARMEN DE LA LEGUA REYNOSO', 701),
(70104, 'LA PERLA', 701),
(70105, 'LA PUNTA', 701),
(70106, 'VENTANILLA', 701),
(80101, 'CUSCO', 801),
(80102, 'CCORCA', 801),
(80103, 'POROY', 801),
(80104, 'SAN JERONIMO', 801),
(80105, 'SAN SEBASTIAN', 801),
(80106, 'SANTIAGO', 801),
(80107, 'SAYLLA', 801),
(80108, 'WANCHAQ', 801),
(80201, 'ACOMAYO', 802),
(80202, 'ACOPIA', 802),
(80203, 'ACOS', 802),
(80204, 'MOSOC LLACTA', 802),
(80205, 'POMACANCHI', 802),
(80206, 'RONDOCAN', 802),
(80207, 'SANGARARA', 802),
(80301, 'ANTA', 803),
(80302, 'ANCAHUASI', 803),
(80303, 'CACHIMAYO', 803),
(80304, 'CHINCHAYPUJIO', 803),
(80305, 'HUAROCONDO', 803),
(80306, 'LIMATAMBO', 803),
(80307, 'MOLLEPATA', 803),
(80308, 'PUCYURA', 803),
(80309, 'ZURITE', 803),
(80401, 'CALCA', 804),
(80402, 'COYA', 804),
(80403, 'LAMAY', 804),
(80404, 'LARES', 804),
(80405, 'PISAC', 804),
(80406, 'SAN SALVADOR', 804),
(80407, 'TARAY', 804),
(80408, 'YANATILE', 804),
(80501, 'YANAOCA', 805),
(80502, 'CHECCA', 805),
(80503, 'KUNTURKANKI', 805),
(80504, 'LANGUI', 805),
(80505, 'LAYO', 805),
(80506, 'PAMPAMARCA', 805),
(80507, 'QUEHUE', 805),
(80508, 'TUPAC AMARU', 805),
(80601, 'SICUANI', 806),
(80602, 'CHECACUPE', 806),
(80603, 'COMBAPATA', 806),
(80604, 'MARANGANI', 806),
(80605, 'PITUMARCA', 806),
(80606, 'SAN PABLO', 806),
(80607, 'SAN PEDRO', 806),
(80608, 'TINTA', 806),
(80701, 'SANTO TOMAS', 807),
(80702, 'CAPACMARCA', 807),
(80703, 'CHAMACA', 807),
(80704, 'COLQUEMARCA', 807),
(80705, 'LIVITACA', 807),
(80706, 'LLUSCO', 807),
(80707, 'QUIÑOTA', 807),
(80708, 'VELILLE', 807),
(80801, 'ESPINAR', 808),
(80802, 'CONDOROMA', 808),
(80803, 'COPORAQUE', 808),
(80804, 'OCORURO', 808),
(80805, 'PALLPATA', 808),
(80806, 'PICHIGUA', 808),
(80807, 'SUYCKUTAMBO 3/', 808),
(80808, 'ALTO PICHIGUA', 808),
(80901, 'SANTA ANA', 809),
(80902, 'ECHARATE', 809),
(80903, 'HUAYOPATA /1', 809),
(80904, 'MARANURA', 809),
(80905, 'OCOBAMBA /2', 809),
(80906, 'QUELLOUNO', 809),
(80907, 'KIMBIRI', 809),
(80908, 'SANTA TERESA', 809),
(80909, 'VILCABAMBA', 809),
(80910, 'PICHARI', 809),
(81001, 'PARURO', 810),
(81002, 'ACCHA', 810),
(81003, 'CCAPI', 810),
(81004, 'COLCHA', 810),
(81005, 'HUANOQUITE', 810),
(81006, 'OMACHA', 810),
(81007, 'PACCARITAMBO', 810),
(81008, 'PILLPINTO', 810),
(81009, 'YAURISQUE', 810),
(81101, 'PAUCARTAMBO', 811),
(81102, 'CAICAY', 811),
(81103, 'CHALLABAMBA', 811),
(81104, 'COLQUEPATA', 811),
(81105, 'HUANCARANI', 811),
(81106, 'KOSÑIPATA', 811),
(81201, 'URCOS', 812),
(81202, 'ANDAHUAYLILLAS', 812),
(81203, 'CAMANTI', 812),
(81204, 'CCARHUAYO', 812),
(81205, 'CCATCA', 812),
(81206, 'CUSIPATA', 812),
(81207, 'HUARO', 812),
(81208, 'LUCRE', 812),
(81209, 'MARCAPATA', 812),
(81210, 'OCONGATE', 812),
(81211, 'OROPESA', 812),
(81212, 'QUIQUIJANA', 812),
(81301, 'URUBAMBA', 813),
(81302, 'CHINCHERO', 813),
(81303, 'HUAYLLABAMBA', 813),
(81304, 'MACHUPICCHU', 813),
(81305, 'MARAS', 813),
(81306, 'OLLANTAYTAMBO', 813),
(81307, 'YUCAY', 813),
(90101, 'HUANCAVELICA', 901),
(90102, 'ACOBAMBILLA', 901),
(90103, 'ACORIA', 901),
(90104, 'CONAYCA', 901),
(90105, 'CUENCA', 901),
(90106, 'HUACHOCOLPA', 901),
(90107, 'HUAYLLAHUARA', 901),
(90108, 'IZCUCHACA', 901),
(90109, 'LARIA', 901),
(90110, 'MANTA', 901),
(90111, 'MARISCAL CACERES', 901),
(90112, 'MOYA', 901),
(90113, 'NUEVO OCCORO', 901),
(90114, 'PALCA', 901),
(90115, 'PILCHACA', 901),
(90116, 'VILCA', 901),
(90117, 'YAULI', 901),
(90118, 'ASCENSION', 901),
(90119, 'HUANDO', 901),
(90201, 'ACOBAMBA', 902),
(90202, 'ANDABAMBA', 902),
(90203, 'ANTA', 902),
(90204, 'CAJA', 902),
(90205, 'MARCAS', 902),
(90206, 'PAUCARA', 902),
(90207, 'POMACOCHA', 902),
(90208, 'ROSARIO', 902),
(90301, 'LIRCAY', 903),
(90302, 'ANCHONGA', 903),
(90303, 'CALLANMARCA', 903),
(90304, 'CCOCHACCASA', 903),
(90305, 'CHINCHO', 903),
(90306, 'CONGALLA', 903),
(90307, 'HUANCA-HUANCA', 903),
(90308, 'HUAYLLAY GRANDE', 903),
(90309, 'JULCAMARCA', 903),
(90310, 'SAN ANTONIO DE ANTAPARCO', 903),
(90311, 'SANTO TOMAS DE PATA', 903),
(90312, 'SECCLLA', 903),
(90401, 'CASTROVIRREYNA', 904),
(90402, 'ARMA', 904),
(90403, 'AURAHUA', 904),
(90404, 'CAPILLAS', 904),
(90405, 'CHUPAMARCA', 904),
(90406, 'COCAS', 904),
(90407, 'HUACHOS', 904),
(90408, 'HUAMATAMBO', 904),
(90409, 'MOLLEPAMPA', 904),
(90410, 'SAN JUAN', 904),
(90411, 'SANTA ANA', 904),
(90412, 'TANTARA', 904),
(90413, 'TICRAPO', 904),
(90501, 'CHURCAMPA', 905),
(90502, 'ANCO', 905),
(90503, 'CHINCHIHUASI', 905),
(90504, 'EL CARMEN', 905),
(90505, 'LA MERCED', 905),
(90506, 'LOCROJA', 905),
(90507, 'PAUCARBAMBA', 905),
(90508, 'SAN MIGUEL DE MAYOCC', 905),
(90509, 'SAN PEDRO DE CORIS', 905),
(90510, 'PACHAMARCA', 905),
(90601, 'HUAYTARA', 906),
(90602, 'AYAVI', 906),
(90603, 'CORDOVA', 906),
(90604, 'HUAYACUNDO ARMA', 906),
(90605, 'LARAMARCA', 906),
(90606, 'OCOYO', 906),
(90607, 'PILPICHACA', 906),
(90608, 'QUERCO', 906),
(90609, 'QUITO-ARMA', 906),
(90610, 'SAN ANTONIO DE CUSICANCHA', 906),
(90611, 'SAN FRANCISCO DE SANGAYAICO', 906),
(90612, 'SAN ISIDRO', 906),
(90613, 'SANTIAGO DE CHOCORVOS', 906),
(90614, 'SANTIAGO DE QUIRAHUARA', 906),
(90615, 'SANTO DOMINGO DE CAPILLAS', 906),
(90616, 'TAMBO', 906),
(90701, 'PAMPAS', 907),
(90702, 'ACOSTAMBO', 907),
(90703, 'ACRAQUIA', 907),
(90704, 'AHUAYCHA', 907),
(90705, 'COLCABAMBA', 907),
(90706, 'DANIEL HERNANDEZ', 907),
(90707, 'HUACHOCOLPA', 907),
(90709, 'HUARIBAMBA', 907),
(90710, 'ÑAHUIMPUQUIO', 907),
(90711, 'PAZOS', 907),
(90713, 'QUISHUAR', 907),
(90714, 'SALCABAMBA', 907),
(90715, 'SALCAHUASI', 907),
(90716, 'SAN MARCOS DE ROCCHAC', 907),
(90717, 'SURCUBAMBA', 907),
(90718, 'TINTAY PUNCU', 907),
(100101, 'HUANUCO', 1001),
(100102, 'AMARILIS', 1001),
(100103, 'CHINCHAO', 1001),
(100104, 'CHURUBAMBA', 1001),
(100105, 'MARGOS', 1001),
(100106, 'QUISQUI', 1001),
(100107, 'SAN FRANCISCO DE CAYRAN', 1001),
(100108, 'SAN PEDRO DE CHAULAN', 1001),
(100109, 'SANTA MARIA DEL VALLE', 1001),
(100110, 'YARUMAYO', 1001),
(100111, 'PILLCO MARCA', 1001),
(100201, 'AMBO', 1002),
(100202, 'CAYNA', 1002),
(100203, 'COLPAS', 1002),
(100204, 'CONCHAMARCA', 1002),
(100205, 'HUACAR', 1002),
(100206, 'SAN FRANCISCO', 1002),
(100207, 'SAN RAFAEL', 1002),
(100208, 'TOMAY KICHWA', 1002),
(100301, 'LA UNION', 1003),
(100307, 'CHUQUIS', 1003),
(100311, 'MARIAS', 1003),
(100313, 'PACHAS', 1003),
(100316, 'QUIVILLA', 1003),
(100317, 'RIPAN', 1003),
(100321, 'SHUNQUI', 1003),
(100322, 'SILLAPATA', 1003),
(100323, 'YANAS', 1003),
(100401, 'HUACAYBAMBA', 1004),
(100402, 'CANCHABAMBA', 1004),
(100403, 'COCHABAMBA', 1004),
(100404, 'PINRA', 1004),
(100501, 'LLATA', 1005),
(100502, 'ARANCAY', 1005),
(100503, 'CHAVIN DE PARIARCA', 1005),
(100504, 'JACAS GRANDE', 1005),
(100505, 'JIRCAN', 1005),
(100506, 'MIRAFLORES', 1005),
(100507, 'MONZON', 1005),
(100508, 'PUNCHAO', 1005),
(100509, 'PUÑOS', 1005),
(100510, 'SINGA', 1005),
(100511, 'TANTAMAYO', 1005),
(100601, 'RUPA-RUPA', 1006),
(100602, 'DANIEL ALOMIA ROBLES', 1006),
(100603, 'HERMILIO VALDIZAN', 1006),
(100604, 'JOSE CRESPO Y CASTILLO', 1006),
(100605, 'LUYANDO 1/', 1006),
(100606, 'MARIANO DAMASO BERAUN', 1006),
(100701, 'HUACRACHUCO', 1007),
(100702, 'CHOLON', 1007),
(100703, 'SAN BUENAVENTURA', 1007),
(100801, 'PANAO', 1008),
(100802, 'CHAGLLA', 1008),
(100803, 'MOLINO', 1008),
(100804, 'UMARI', 1008),
(100901, 'PUERTO INCA', 1009),
(100902, 'CODO DEL POZUZO', 1009),
(100903, 'HONORIA', 1009),
(100904, 'TOURNAVISTA', 1009),
(100905, 'YUYAPICHIS', 1009),
(101001, 'JESUS', 1010),
(101002, 'BAÑOS', 1010),
(101003, 'JIVIA', 1010),
(101004, 'QUEROPALCA', 1010),
(101005, 'RONDOS', 1010),
(101006, 'SAN FRANCISCO DE ASIS', 1010),
(101007, 'SAN MIGUEL DE CAURI', 1010),
(101101, 'CHAVINILLO', 1011),
(101102, 'CAHUAC', 1011),
(101103, 'CHACABAMBA', 1011),
(101104, 'APARICIO POMARES', 1011),
(101105, 'JACAS CHICO', 1011),
(101106, 'OBAS', 1011),
(101107, 'PAMPAMARCA', 1011),
(101108, 'CHORAS', 1011),
(110101, 'ICA', 1101),
(110102, 'LA TINGUIÑA', 1101),
(110103, 'LOS AQUIJES', 1101),
(110104, 'OCUCAJE', 1101),
(110105, 'PACHACUTEC', 1101),
(110106, 'PARCONA', 1101),
(110107, 'PUEBLO NUEVO', 1101),
(110108, 'SALAS', 1101),
(110109, 'SAN JOSE DE LOS MOLINOS', 1101),
(110110, 'SAN JUAN BAUTISTA', 1101),
(110111, 'SANTIAGO', 1101),
(110112, 'SUBTANJALLA', 1101),
(110113, 'TATE', 1101),
(110114, 'YAUCA DEL ROSARIO 1/', 1101),
(110201, 'CHINCHA ALTA', 1102),
(110202, 'ALTO LARAN', 1102),
(110203, 'CHAVIN', 1102),
(110204, 'CHINCHA BAJA', 1102),
(110205, 'EL CARMEN', 1102),
(110206, 'GROCIO PRADO', 1102),
(110207, 'PUEBLO NUEVO', 1102),
(110208, 'SAN JUAN DE YANAC', 1102),
(110209, 'SAN PEDRO DE HUACARPANA', 1102),
(110210, 'SUNAMPE', 1102),
(110211, 'TAMBO DE MORA', 1102),
(110301, 'NAZCA', 1103),
(110302, 'CHANGUILLO', 1103),
(110303, 'EL INGENIO', 1103),
(110304, 'MARCONA', 1103),
(110305, 'VISTA ALEGRE', 1103),
(110401, 'PALPA', 1104),
(110402, 'LLIPATA', 1104),
(110403, 'RIO GRANDE', 1104),
(110404, 'SANTA CRUZ', 1104),
(110405, 'TIBILLO', 1104),
(110501, 'PISCO', 1105),
(110502, 'HUANCANO', 1105),
(110503, 'HUMAY', 1105),
(110504, 'INDEPENDENCIA', 1105),
(110505, 'PARACAS', 1105),
(110506, 'SAN ANDRES', 1105),
(110507, 'SAN CLEMENTE', 1105),
(110508, 'TUPAC AMARU INCA', 1105),
(120101, 'HUANCAYO', 1201),
(120104, 'CARHUACALLANGA', 1201),
(120105, 'CHACAPAMPA', 1201),
(120106, 'CHICCHE', 1201),
(120107, 'CHILCA', 1201),
(120108, 'CHONGOS ALTO', 1201),
(120111, 'CHUPURO', 1201),
(120112, 'COLCA', 1201),
(120113, 'CULLHUAS', 1201),
(120114, 'EL TAMBO', 1201),
(120116, 'HUACRAPUQUIO', 1201),
(120117, 'HUALHUAS', 1201),
(120119, 'HUANCAN', 1201),
(120120, 'HUASICANCHA', 1201),
(120121, 'HUAYUCACHI', 1201),
(120122, 'INGENIO', 1201),
(120124, 'PARIAHUANCA 1/', 1201),
(120125, 'PILCOMAYO', 1201),
(120126, 'PUCARA', 1201),
(120127, 'QUICHUAY', 1201),
(120128, 'QUILCAS', 1201),
(120129, 'SAN AGUSTIN', 1201),
(120130, 'SAN JERONIMO DE TUNAN', 1201),
(120132, 'SAÑO', 1201),
(120133, 'SAPALLANGA', 1201),
(120134, 'SICAYA', 1201),
(120135, 'SANTO DOMINGO DE ACOBAMBA', 1201),
(120136, 'VIQUES', 1201),
(120201, 'CONCEPCION', 1202),
(120202, 'ACO', 1202),
(120203, 'ANDAMARCA', 1202),
(120204, 'CHAMBARA', 1202),
(120205, 'COCHAS', 1202),
(120206, 'COMAS', 1202),
(120207, 'HEROINAS TOLEDO', 1202),
(120208, 'MANZANARES', 1202),
(120209, 'MARISCAL CASTILLA', 1202),
(120210, 'MATAHUASI', 1202),
(120211, 'MITO', 1202),
(120212, 'NUEVE DE JULIO', 1202),
(120213, 'ORCOTUNA', 1202),
(120214, 'SAN JOSE DE QUERO', 1202),
(120215, 'SANTA ROSA DE OCOPA', 1202),
(120301, 'CHANCHAMAYO', 1203),
(120302, 'PERENE', 1203),
(120303, 'PICHANAQUI', 1203),
(120304, 'SAN LUIS DE SHUARO', 1203),
(120305, 'SAN RAMON', 1203),
(120306, 'VITOC', 1203),
(120401, 'JAUJA', 1204),
(120402, 'ACOLLA', 1204),
(120403, 'APATA', 1204),
(120404, 'ATAURA', 1204),
(120405, 'CANCHAYLLO', 1204),
(120406, 'CURICACA', 1204),
(120407, 'EL MANTARO', 1204),
(120408, 'HUAMALI', 1204),
(120409, 'HUARIPAMPA', 1204),
(120410, 'HUERTAS', 1204),
(120411, 'JANJAILLO', 1204),
(120412, 'JULCAN', 1204),
(120413, 'LEONOR ORDOÑEZ', 1204),
(120414, 'LLOCLLAPAMPA', 1204),
(120415, 'MARCO', 1204),
(120416, 'MASMA', 1204),
(120417, 'MASMA CHICCHE', 1204),
(120418, 'MOLINOS', 1204),
(120419, 'MONOBAMBA', 1204),
(120420, 'MUQUI', 1204),
(120421, 'MUQUIYAUYO', 1204),
(120422, 'PACA', 1204),
(120423, 'PACCHA', 1204),
(120424, 'PANCAN', 1204),
(120425, 'PARCO', 1204),
(120426, 'POMACANCHA', 1204),
(120427, 'RICRAN', 1204),
(120428, 'SAN LORENZO', 1204),
(120429, 'SAN PEDRO DE CHUNAN', 1204),
(120430, 'SAUSA', 1204),
(120431, 'SINCOS', 1204),
(120432, 'TUNAN MARCA', 1204),
(120433, 'YAULI', 1204),
(120434, 'YAUYOS', 1204),
(120501, 'JUNIN', 1205),
(120502, 'CARHUAMAYO', 1205),
(120503, 'ONDORES', 1205),
(120504, 'ULCUMAYO', 1205),
(120601, 'SATIPO', 1206),
(120602, 'COVIRIALI', 1206),
(120603, 'LLAYLLA', 1206),
(120604, 'MAZAMARI', 1206),
(120605, 'PAMPA HERMOSA', 1206),
(120606, 'PANGOA', 1206),
(120607, 'RIO NEGRO', 1206),
(120608, 'RIO TAMBO', 1206),
(120701, 'TARMA', 1207),
(120702, 'ACOBAMBA', 1207),
(120703, 'HUARICOLCA', 1207),
(120704, 'HUASAHUASI', 1207),
(120705, 'LA UNION', 1207),
(120706, 'PALCA', 1207),
(120707, 'PALCAMAYO', 1207),
(120708, 'SAN PEDRO DE CAJAS', 1207),
(120709, 'TAPO', 1207),
(120801, 'LA OROYA', 1208),
(120802, 'CHACAPALPA', 1208),
(120803, 'HUAY-HUAY', 1208),
(120804, 'MARCAPOMACOCHA', 1208),
(120805, 'MOROCOCHA', 1208),
(120806, 'PACCHA', 1208),
(120807, 'SANTA BARBARA DE CARHUACAYAN', 1208),
(120808, 'SANTA ROSA DE SACCO', 1208),
(120809, 'SUITUCANCHA', 1208),
(120810, 'YAULI', 1208),
(120901, 'CHUPACA', 1209),
(120902, 'AHUAC', 1209),
(120903, 'CHONGOS BAJO', 1209),
(120904, 'HUACHAC', 1209),
(120905, 'HUAMANCACA CHICO', 1209),
(120906, 'SAN JUAN DE ISCOS', 1209),
(120907, 'SAN JUAN DE JARPA', 1209),
(120908, 'TRES DE DICIEMBRE', 1209),
(120909, 'YANACANCHA', 1209),
(130101, 'TRUJILLO', 1301),
(130102, 'EL PORVENIR', 1301),
(130103, 'FLORENCIA DE MORA', 1301),
(130104, 'HUANCHACO', 1301),
(130105, 'LA ESPERANZA', 1301),
(130106, 'LAREDO', 1301),
(130107, 'MOCHE', 1301),
(130108, 'POROTO', 1301),
(130109, 'SALAVERRY', 1301),
(130110, 'SIMBAL', 1301),
(130111, 'VICTOR LARCO HERRERA', 1301),
(130201, 'ASCOPE', 1302),
(130202, 'CHICAMA', 1302),
(130203, 'CHOCOPE', 1302),
(130204, 'MAGDALENA DE CAO', 1302),
(130205, 'PAIJAN', 1302),
(130206, 'RAZURI', 1302),
(130207, 'SANTIAGO DE CAO', 1302),
(130208, 'CASA GRANDE', 1302),
(130301, 'BOLIVAR', 1303),
(130302, 'BAMBAMARCA', 1303),
(130303, 'CONDORMARCA /1', 1303),
(130304, 'LONGOTEA', 1303),
(130305, 'UCHUMARCA', 1303),
(130306, 'UCUNCHA', 1303),
(130401, 'CHEPEN', 1304),
(130402, 'PACANGA', 1304),
(130403, 'PUEBLO NUEVO', 1304),
(130501, 'JULCAN', 1305),
(130502, 'CALAMARCA', 1305),
(130503, 'CARABAMBA', 1305),
(130504, 'HUASO', 1305),
(130601, 'OTUZCO', 1306),
(130602, 'AGALLPAMPA', 1306),
(130604, 'CHARAT', 1306),
(130605, 'HUARANCHAL', 1306),
(130606, 'LA CUESTA', 1306),
(130608, 'MACHE', 1306),
(130610, 'PARANDAY', 1306),
(130611, 'SALPO', 1306),
(130613, 'SINSICAP', 1306),
(130614, 'USQUIL', 1306),
(130701, 'SAN PEDRO DE LLOC', 1307),
(130702, 'GUADALUPE', 1307),
(130703, 'JEQUETEPEQUE', 1307),
(130704, 'PACASMAYO', 1307),
(130705, 'SAN JOSE', 1307),
(130801, 'TAYABAMBA', 1308),
(130802, 'BULDIBUYO', 1308),
(130803, 'CHILLIA', 1308),
(130804, 'HUANCASPATA', 1308),
(130805, 'HUAYLILLAS', 1308),
(130806, 'HUAYO', 1308),
(130807, 'ONGON', 1308),
(130808, 'PARCOY', 1308),
(130809, 'PATAZ', 1308),
(130810, 'PIAS', 1308),
(130811, 'SANTIAGO DE CHALLAS', 1308),
(130812, 'TAURIJA', 1308),
(130813, 'URPAY', 1308),
(130901, 'HUAMACHUCO', 1309),
(130902, 'CHUGAY', 1309),
(130903, 'COCHORCO', 1309),
(130904, 'CURGOS', 1309),
(130905, 'MARCABAL', 1309),
(130906, 'SANAGORAN', 1309),
(130907, 'SARIN', 1309),
(130908, 'SARTIMBAMBA', 1309),
(131001, 'SANTIAGO DE CHUCO', 1310),
(131002, 'ANGASMARCA', 1310),
(131003, 'CACHICADAN', 1310),
(131004, 'MOLLEBAMBA', 1310),
(131005, 'MOLLEPATA', 1310),
(131006, 'QUIRUVILCA', 1310),
(131007, 'SANTA CRUZ DE CHUCA', 1310),
(131008, 'SITABAMBA', 1310),
(131101, 'CASCAS', 1311),
(131102, 'LUCMA', 1311),
(131103, 'COMPIN', 1311),
(131104, 'SAYAPULLO', 1311),
(131201, 'VIRU', 1312),
(131202, 'CHAO', 1312),
(131203, 'GUADALUPITO', 1312),
(140101, 'CHICLAYO', 1401),
(140102, 'CHONGOYAPE', 1401),
(140103, 'ETEN', 1401),
(140104, 'ETEN PUERTO', 1401),
(140105, 'JOSE LEONARDO ORTIZ', 1401),
(140106, 'LA VICTORIA', 1401),
(140107, 'LAGUNAS', 1401),
(140108, 'MONSEFU', 1401),
(140109, 'NUEVA ARICA', 1401),
(140110, 'OYOTUN', 1401),
(140111, 'PICSI', 1401),
(140112, 'PIMENTEL', 1401),
(140113, 'REQUE', 1401),
(140114, 'SANTA ROSA', 1401),
(140115, 'SAÑA', 1401),
(140116, 'CAYALTI', 1401),
(140117, 'PATAPO', 1401),
(140118, 'POMALCA', 1401),
(140119, 'PUCALA', 1401),
(140120, 'TUMAN', 1401),
(140201, 'FERREÑAFE', 1402),
(140202, 'CAÑARIS', 1402),
(140203, 'INCAHUASI', 1402),
(140204, 'MANUEL ANTONIO MESONES MURO', 1402),
(140205, 'PITIPO', 1402),
(140206, 'PUEBLO NUEVO', 1402),
(140301, 'LAMBAYEQUE', 1403),
(140302, 'CHOCHOPE', 1403),
(140303, 'ILLIMO', 1403),
(140304, 'JAYANCA', 1403),
(140305, 'MOCHUMI', 1403),
(140306, 'MORROPE', 1403),
(140307, 'MOTUPE', 1403),
(140308, 'OLMOS', 1403),
(140309, 'PACORA', 1403),
(140310, 'SALAS', 1403),
(140311, 'SAN JOSE', 1403),
(140312, 'TUCUME', 1403),
(150101, 'LIMA', 1501),
(150102, 'ANCON', 1501),
(150103, 'ATE', 1501),
(150104, 'BARRANCO', 1501),
(150105, 'BREÑA', 1501),
(150106, 'CARABAYLLO', 1501),
(150107, 'CHACLACAYO', 1501),
(150108, 'CHORRILLOS', 1501),
(150109, 'CIENEGUILLA', 1501),
(150110, 'COMAS', 1501),
(150111, 'EL AGUSTINO', 1501),
(150112, 'INDEPENDENCIA', 1501),
(150113, 'JESUS MARIA', 1501),
(150114, 'LA MOLINA', 1501),
(150115, 'LA VICTORIA', 1501),
(150116, 'LINCE', 1501),
(150117, 'LOS OLIVOS', 1501),
(150118, 'LURIGANCHO', 1501),
(150119, 'LURIN', 1501),
(150120, 'MAGDALENA DEL MAR', 1501),
(150121, 'PUEBLO LIBRE', 1501),
(150122, 'MIRAFLORES', 1501),
(150123, 'PACHACAMAC', 1501),
(150124, 'PUCUSANA', 1501),
(150125, 'PUENTE PIEDRA', 1501),
(150126, 'PUNTA HERMOSA', 1501),
(150127, 'PUNTA NEGRA', 1501),
(150128, 'RIMAC', 1501),
(150129, 'SAN BARTOLO', 1501),
(150130, 'SAN BORJA', 1501),
(150131, 'SAN ISIDRO', 1501),
(150132, 'SAN JUAN DE LURIGANCHO', 1501),
(150133, 'SAN JUAN DE MIRAFLORES', 1501),
(150134, 'SAN LUIS', 1501),
(150135, 'SAN MARTIN DE PORRES', 1501),
(150136, 'SAN MIGUEL', 1501),
(150137, 'SANTA ANITA', 1501),
(150138, 'SANTA MARIA DEL MAR', 1501),
(150139, 'SANTA ROSA', 1501),
(150140, 'SANTIAGO DE SURCO', 1501),
(150141, 'SURQUILLO', 1501),
(150142, 'VILLA EL SALVADOR', 1501),
(150143, 'VILLA MARIA DEL TRIUNFO', 1501),
(150201, 'BARRANCA', 1502),
(150202, 'PARAMONGA', 1502),
(150203, 'PATIVILCA', 1502),
(150204, 'SUPE', 1502),
(150205, 'SUPE PUERTO', 1502),
(150301, 'CAJATAMBO', 1503),
(150302, 'COPA', 1503),
(150303, 'GORGOR', 1503),
(150304, 'HUANCAPON', 1503),
(150305, 'MANAS', 1503),
(150401, 'CANTA', 1504),
(150402, 'ARAHUAY', 1504),
(150403, 'HUAMANTANGA', 1504),
(150404, 'HUAROS', 1504),
(150405, 'LACHAQUI', 1504),
(150406, 'SAN BUENAVENTURA', 1504),
(150407, 'SANTA ROSA DE QUIVES', 1504),
(150501, 'SAN VICENTE DE CAÑETE', 1505),
(150502, 'ASIA', 1505),
(150503, 'CALANGO', 1505),
(150504, 'CERRO AZUL', 1505),
(150505, 'CHILCA', 1505),
(150506, 'COAYLLO', 1505),
(150507, 'IMPERIAL', 1505),
(150508, 'LUNAHUANA', 1505),
(150509, 'MALA', 1505),
(150510, 'NUEVO IMPERIAL', 1505),
(150511, 'PACARAN', 1505),
(150512, 'QUILMANA', 1505),
(150513, 'SAN ANTONIO', 1505),
(150514, 'SAN LUIS', 1505),
(150515, 'SANTA CRUZ DE FLORES', 1505),
(150516, 'ZUÑIGA', 1505),
(150601, 'HUARAL', 1506),
(150602, 'ATAVILLOS ALTO', 1506),
(150603, 'ATAVILLOS BAJO', 1506),
(150604, 'AUCALLAMA', 1506),
(150605, 'CHANCAY', 1506),
(150606, 'IHUARI', 1506),
(150607, 'LAMPIAN', 1506),
(150608, 'PACARAOS', 1506),
(150609, 'SAN MIGUEL DE ACOS', 1506),
(150610, 'SANTA CRUZ DE ANDAMARCA', 1506),
(150611, 'SUMBILCA', 1506),
(150612, 'VEINTISIETE DE NOVIEMBRE', 1506),
(150701, 'MATUCANA', 1507),
(150702, 'ANTIOQUIA', 1507),
(150703, 'CALLAHUANCA', 1507),
(150704, 'CARAMPOMA', 1507),
(150705, 'CHICLA', 1507),
(150706, 'CUENCA', 1507),
(150707, 'HUACHUPAMPA', 1507),
(150708, 'HUANZA', 1507),
(150709, 'HUAROCHIRI', 1507),
(150710, 'LAHUAYTAMBO', 1507),
(150711, 'LANGA', 1507),
(150712, 'LARAOS', 1507),
(150713, 'MARIATANA', 1507),
(150714, 'RICARDO PALMA', 1507),
(150715, 'SAN ANDRES DE TUPICOCHA', 1507),
(150716, 'SAN ANTONIO', 1507),
(150717, 'SAN BARTOLOME', 1507),
(150718, 'SAN DAMIAN', 1507),
(150719, 'SAN JUAN DE IRIS', 1507),
(150720, 'SAN JUAN DE TANTARANCHE', 1507),
(150721, 'SAN LORENZO DE QUINTI', 1507),
(150722, 'SAN MATEO', 1507),
(150723, 'SAN MATEO DE OTAO', 1507),
(150724, 'SAN PEDRO DE CASTA', 1507),
(150725, 'SAN PEDRO DE HUANCAYRE', 1507),
(150726, 'SANGALLAYA', 1507),
(150727, 'SANTA CRUZ DE COCACHACRA', 1507),
(150728, 'SANTA EULALIA', 1507),
(150729, 'SANTIAGO DE ANCHUCAYA', 1507),
(150730, 'SANTIAGO DE TUNA', 1507),
(150731, 'SANTO DOMINGO DE LOS OLLEROS', 1507),
(150732, 'SURCO', 1507),
(150801, 'HUACHO', 1508),
(150802, 'AMBAR', 1508),
(150803, 'CALETA DE CARQUIN', 1508),
(150804, 'CHECRAS', 1508),
(150805, 'HUALMAY', 1508),
(150806, 'HUAURA', 1508),
(150807, 'LEONCIO PRADO', 1508),
(150808, 'PACCHO', 1508),
(150809, 'SANTA LEONOR', 1508),
(150810, 'SANTA MARIA', 1508),
(150811, 'SAYAN', 1508),
(150812, 'VEGUETA', 1508),
(150901, 'OYON', 1509),
(150902, 'ANDAJES', 1509),
(150903, 'CAUJUL', 1509),
(150904, 'COCHAMARCA', 1509),
(150905, 'NAVAN', 1509),
(150906, 'PACHANGARA', 1509),
(151001, 'YAUYOS', 1510),
(151002, 'ALIS', 1510),
(151003, 'ALLAUCA', 1510),
(151004, 'AYAVIRI', 1510),
(151005, 'AZANGARO', 1510),
(151006, 'CACRA', 1510),
(151007, 'CARANIA', 1510),
(151008, 'CATAHUASI', 1510),
(151009, 'CHOCOS', 1510),
(151010, 'COCHAS', 1510),
(151011, 'COLONIA', 1510),
(151012, 'HONGOS', 1510),
(151013, 'HUAMPARA', 1510),
(151014, 'HUANCAYA', 1510),
(151015, 'HUANGASCAR', 1510),
(151016, 'HUANTAN', 1510),
(151017, 'HUAÑEC', 1510),
(151018, 'LARAOS', 1510),
(151019, 'LINCHA', 1510),
(151020, 'MADEAN', 1510),
(151021, 'MIRAFLORES', 1510),
(151022, 'OMAS', 1510),
(151023, 'PUTINZA', 1510),
(151024, 'QUINCHES', 1510),
(151025, 'QUINOCAY', 1510),
(151026, 'SAN JOAQUIN', 1510),
(151027, 'SAN PEDRO DE PILAS', 1510),
(151028, 'TANTA', 1510),
(151029, 'TAURIPAMPA', 1510),
(151030, 'TOMAS', 1510),
(151031, 'TUPE', 1510),
(151032, 'VIÑAC', 1510),
(151033, 'VITIS', 1510),
(160101, 'IQUITOS', 1601),
(160102, 'ALTO NANAY', 1601),
(160103, 'FERNANDO LORES', 1601),
(160104, 'INDIANA', 1601),
(160105, 'LAS AMAZONAS', 1601),
(160106, 'MAZAN', 1601),
(160107, 'NAPO', 1601),
(160108, 'PUNCHANA', 1601),
(160109, 'PUTUMAYO', 1601),
(160110, 'TORRES CAUSANA', 1601),
(160112, 'BELEN', 1601),
(160113, 'SAN JUAN BAUTISTA', 1601),
(160114, 'TENIENTE MANUEL CLAVERO', 1601),
(160201, 'YURIMAGUAS', 1602),
(160202, 'BALSAPUERTO', 1602),
(160205, 'JEBEROS', 1602),
(160206, 'LAGUNAS', 1602),
(160210, 'SANTA CRUZ', 1602),
(160211, 'TENIENTE CESAR LOPEZ ROJAS', 1602),
(160301, 'NAUTA', 1603),
(160302, 'PARINARI', 1603),
(160303, 'TIGRE', 1603),
(160304, 'TROMPETEROS', 1603),
(160305, 'URARINAS', 1603),
(160401, 'RAMON CASTILLA', 1604),
(160402, 'PEBAS', 1604),
(160403, 'YAVARI /1', 1604),
(160404, 'SAN PABLO', 1604),
(160501, 'REQUENA', 1605),
(160502, 'ALTO TAPICHE', 1605),
(160503, 'CAPELO', 1605),
(160504, 'EMILIO SAN MARTIN', 1605),
(160505, 'MAQUIA', 1605),
(160506, 'PUINAHUA', 1605),
(160507, 'SAQUENA', 1605),
(160508, 'SOPLIN', 1605),
(160509, 'TAPICHE', 1605),
(160510, 'JENARO HERRERA', 1605),
(160511, 'YAQUERANA', 1605),
(160601, 'CONTAMANA', 1606),
(160602, 'INAHUAYA', 1606),
(160603, 'PADRE MARQUEZ', 1606),
(160604, 'PAMPA HERMOSA', 1606),
(160605, 'SARAYACU', 1606),
(160606, 'VARGAS GUERRA', 1606),
(160701, 'BARRANCA', 1607),
(160702, 'CAHUAPANAS', 1607),
(160703, 'MANSERICHE', 1607),
(160704, 'MORONA', 1607),
(160705, 'PASTAZA', 1607),
(160706, 'ANDOAS', 1607),
(170101, 'TAMBOPATA', 1701),
(170102, 'INAMBARI', 1701),
(170103, 'LAS PIEDRAS', 1701),
(170104, 'LABERINTO', 1701),
(170201, 'MANU', 1702),
(170202, 'FITZCARRALD', 1702),
(170203, 'MADRE DE DIOS', 1702),
(170204, 'HUEPETUHE', 1702),
(170301, 'IÑAPARI', 1703),
(170302, 'IBERIA', 1703),
(170303, 'TAHUAMANU', 1703),
(180101, 'MOQUEGUA', 1801),
(180102, 'CARUMAS', 1801),
(180103, 'CUCHUMBAYA', 1801),
(180104, 'SAMEGUA', 1801),
(180105, 'SAN CRISTOBAL', 1801),
(180106, 'TORATA', 1801),
(180201, 'OMATE', 1802),
(180202, 'CHOJATA', 1802),
(180203, 'COALAQUE', 1802),
(180204, 'ICHUÑA', 1802),
(180205, 'LA CAPILLA', 1802),
(180206, 'LLOQUE', 1802),
(180207, 'MATALAQUE', 1802),
(180208, 'PUQUINA', 1802),
(180209, 'QUINISTAQUILLAS', 1802),
(180210, 'UBINAS', 1802),
(180211, 'YUNGA', 1802),
(180301, 'ILO', 1803),
(180302, 'EL ALGARROBAL', 1803),
(180303, 'PACOCHA', 1803),
(190101, 'CHAUPIMARCA', 1901),
(190102, 'HUACHON', 1901),
(190103, 'HUARIACA', 1901),
(190104, 'HUAYLLAY', 1901),
(190105, 'NINACACA', 1901),
(190106, 'PALLANCHACRA', 1901),
(190107, 'PAUCARTAMBO', 1901),
(190108, 'SAN FRANCISCO DE ASIS DE YARUSYACAN', 1901),
(190109, 'SIMON BOLIVAR', 1901),
(190110, 'TICLACAYAN', 1901),
(190111, 'TINYAHUARCO', 1901),
(190112, 'VICCO', 1901),
(190113, 'YANACANCHA', 1901),
(190201, 'YANAHUANCA', 1902),
(190202, 'CHACAYAN', 1902),
(190203, 'GOYLLARISQUIZGA', 1902),
(190204, 'PAUCAR', 1902),
(190205, 'SAN PEDRO DE PILLAO', 1902),
(190206, 'SANTA ANA DE TUSI', 1902),
(190207, 'TAPUC', 1902),
(190208, 'VILCABAMBA', 1902),
(190301, 'OXAPAMPA', 1903),
(190302, 'CHONTABAMBA', 1903),
(190303, 'HUANCABAMBA', 1903),
(190304, 'PALCAZU', 1903),
(190305, 'POZUZO', 1903),
(190306, 'PUERTO BERMUDEZ', 1903),
(190307, 'VILLA RICA', 1903),
(200101, 'PIURA', 2001),
(200104, 'CASTILLA', 2001),
(200105, 'CATACAOS', 2001),
(200107, 'CURA MORI', 2001),
(200108, 'EL TALLAN', 2001),
(200109, 'LA ARENA', 2001),
(200110, 'LA UNION', 2001),
(200111, 'LAS LOMAS', 2001),
(200114, 'TAMBO GRANDE', 2001),
(200201, 'AYABACA', 2002),
(200202, 'FRIAS', 2002),
(200203, 'JILILI', 2002),
(200204, 'LAGUNAS', 2002),
(200205, 'MONTERO', 2002),
(200206, 'PACAIPAMPA', 2002),
(200207, 'PAIMAS', 2002),
(200208, 'SAPILLICA', 2002),
(200209, 'SICCHEZ', 2002),
(200210, 'SUYO', 2002),
(200301, 'HUANCABAMBA', 2003),
(200302, 'CANCHAQUE', 2003),
(200303, 'EL CARMEN DE LA FRONTERA', 2003),
(200304, 'HUARMACA', 2003),
(200305, 'LALAQUIZ', 2003),
(200306, 'SAN MIGUEL DE EL FAIQUE', 2003),
(200307, 'SONDOR', 2003),
(200308, 'SONDORILLO', 2003),
(200401, 'CHULUCANAS', 2004),
(200402, 'BUENOS AIRES', 2004),
(200403, 'CHALACO', 2004),
(200404, 'LA MATANZA', 2004),
(200405, 'MORROPON', 2004),
(200406, 'SALITRAL', 2004),
(200407, 'SAN JUAN DE BIGOTE', 2004),
(200408, 'SANTA CATALINA DE MOSSA', 2004),
(200409, 'SANTO DOMINGO', 2004),
(200410, 'YAMANGO', 2004),
(200501, 'PAITA', 2005),
(200502, 'AMOTAPE', 2005),
(200503, 'ARENAL', 2005),
(200504, 'COLAN', 2005),
(200505, 'LA HUACA', 2005),
(200506, 'TAMARINDO', 2005),
(200507, 'VICHAYAL', 2005),
(200601, 'SULLANA', 2006),
(200602, 'BELLAVISTA', 2006),
(200603, 'IGNACIO ESCUDERO', 2006),
(200604, 'LANCONES', 2006),
(200605, 'MARCAVELICA', 2006),
(200606, 'MIGUEL CHECA', 2006),
(200607, 'QUERECOTILLO', 2006),
(200608, 'SALITRAL', 2006),
(200701, 'PARIÑAS', 2007),
(200702, 'EL ALTO', 2007),
(200703, 'LA BREA', 2007),
(200704, 'LOBITOS', 2007),
(200705, 'LOS ORGANOS', 2007),
(200706, 'MANCORA', 2007),
(200801, 'SECHURA', 2008),
(200802, 'BELLAVISTA DE LA UNION', 2008),
(200803, 'BERNAL', 2008),
(200804, 'CRISTO NOS VALGA', 2008),
(200805, 'VICE', 2008),
(200806, 'RINCONADA LLICUAR', 2008),
(210101, 'PUNO', 2101),
(210102, 'ACORA', 2101),
(210103, 'AMANTANI', 2101),
(210104, 'ATUNCOLLA', 2101),
(210105, 'CAPACHICA', 2101),
(210106, 'CHUCUITO', 2101),
(210107, 'COATA', 2101),
(210108, 'HUATA', 2101),
(210109, 'MAÑAZO', 2101),
(210110, 'PAUCARCOLLA', 2101),
(210111, 'PICHACANI', 2101),
(210112, 'PLATERIA', 2101),
(210113, 'SAN ANTONIO /1', 2101),
(210114, 'TIQUILLACA', 2101),
(210115, 'VILQUE', 2101),
(210201, 'AZANGARO', 2102),
(210202, 'ACHAYA', 2102),
(210203, 'ARAPA', 2102),
(210204, 'ASILLO', 2102),
(210205, 'CAMINACA', 2102),
(210206, 'CHUPA', 2102),
(210207, 'JOSE DOMINGO CHOQUEHUANCA', 2102),
(210208, 'MUÑANI', 2102),
(210209, 'POTONI', 2102),
(210210, 'SAMAN', 2102),
(210211, 'SAN ANTON', 2102),
(210212, 'SAN JOSE', 2102),
(210213, 'SAN JUAN DE SALINAS', 2102),
(210214, 'SANTIAGO DE PUPUJA', 2102),
(210215, 'TIRAPATA', 2102),
(210301, 'MACUSANI', 2103),
(210302, 'AJOYANI', 2103),
(210303, 'AYAPATA', 2103),
(210304, 'COASA', 2103),
(210305, 'CORANI', 2103),
(210306, 'CRUCERO', 2103),
(210307, 'ITUATA 2/', 2103),
(210308, 'OLLACHEA', 2103),
(210309, 'SAN GABAN', 2103),
(210310, 'USICAYOS', 2103),
(210401, 'JULI', 2104),
(210402, 'DESAGUADERO', 2104),
(210403, 'HUACULLANI', 2104),
(210404, 'KELLUYO', 2104),
(210405, 'PISACOMA', 2104),
(210406, 'POMATA', 2104),
(210407, 'ZEPITA', 2104),
(210501, 'ILAVE', 2105),
(210502, 'CAPAZO', 2105),
(210503, 'PILCUYO', 2105),
(210504, 'SANTA ROSA', 2105),
(210505, 'CONDURIRI', 2105),
(210601, 'HUANCANE', 2106),
(210602, 'COJATA', 2106),
(210603, 'HUATASANI', 2106),
(210604, 'INCHUPALLA', 2106),
(210605, 'PUSI', 2106),
(210606, 'ROSASPATA', 2106),
(210607, 'TARACO', 2106),
(210608, 'VILQUE CHICO', 2106),
(210701, 'LAMPA', 2107),
(210702, 'CABANILLA', 2107),
(210703, 'CALAPUJA', 2107),
(210704, 'NICASIO', 2107),
(210705, 'OCUVIRI', 2107),
(210706, 'PALCA', 2107),
(210707, 'PARATIA', 2107),
(210708, 'PUCARA', 2107),
(210709, 'SANTA LUCIA', 2107),
(210710, 'VILAVILA', 2107),
(210801, 'AYAVIRI', 2108),
(210802, 'ANTAUTA', 2108),
(210803, 'CUPI', 2108),
(210804, 'LLALLI', 2108),
(210805, 'MACARI', 2108),
(210806, 'NUÑOA', 2108),
(210807, 'ORURILLO', 2108),
(210808, 'SANTA ROSA', 2108),
(210809, 'UMACHIRI', 2108),
(210901, 'MOHO', 2109),
(210902, 'CONIMA', 2109),
(210903, 'HUAYRAPATA', 2109),
(210904, 'TILALI', 2109),
(211001, 'PUTINA', 2110),
(211002, 'ANANEA', 2110),
(211003, 'PEDRO VILCA APAZA', 2110),
(211004, 'QUILCAPUNCU', 2110),
(211005, 'SINA', 2110),
(211101, 'JULIACA', 2111),
(211102, 'CABANA', 2111),
(211103, 'CABANILLAS', 2111),
(211104, 'CARACOTO', 2111),
(211201, 'SANDIA', 2112),
(211202, 'CUYOCUYO', 2112),
(211203, 'LIMBANI', 2112),
(211204, 'PATAMBUCO', 2112),
(211205, 'PHARA', 2112),
(211206, 'QUIACA', 2112),
(211207, 'SAN JUAN DEL ORO', 2112),
(211208, 'YANAHUAYA', 2112),
(211209, 'ALTO INAMBARI', 2112),
(211210, 'SAN PEDRO DE PUTINA PUNCO', 2112),
(211301, 'YUNGUYO', 2113),
(211302, 'ANAPIA', 2113),
(211303, 'COPANI', 2113),
(211304, 'CUTURAPI', 2113),
(211305, 'OLLARAYA', 2113),
(211306, 'TINICACHI', 2113),
(211307, 'UNICACHI', 2113),
(220101, 'MOYOBAMBA', 2201),
(220102, 'CALZADA', 2201),
(220103, 'HABANA', 2201),
(220104, 'JEPELACIO', 2201),
(220105, 'SORITOR', 2201),
(220106, 'YANTALO', 2201),
(220201, 'BELLAVISTA', 2202),
(220202, 'ALTO BIAVO', 2202),
(220203, 'BAJO BIAVO', 2202),
(220204, 'HUALLAGA', 2202),
(220205, 'SAN PABLO', 2202),
(220206, 'SAN RAFAEL', 2202),
(220301, 'SAN JOSE DE SISA', 2203),
(220302, 'AGUA BLANCA', 2203),
(220303, 'SAN MARTIN', 2203),
(220304, 'SANTA ROSA', 2203),
(220305, 'SHATOJA', 2203),
(220401, 'SAPOSOA', 2204),
(220402, 'ALTO SAPOSOA', 2204),
(220403, 'EL ESLABON', 2204),
(220404, 'PISCOYACU', 2204),
(220405, 'SACANCHE', 2204),
(220406, 'TINGO DE SAPOSOA', 2204),
(220501, 'LAMAS', 2205),
(220502, 'ALONSO DE ALVARADO', 2205),
(220503, 'BARRANQUITA', 2205),
(220504, 'CAYNARACHI 1/', 2205),
(220505, 'CUÑUMBUQUI', 2205),
(220506, 'PINTO RECODO', 2205),
(220507, 'RUMISAPA', 2205),
(220508, 'SAN ROQUE DE CUMBAZA', 2205),
(220509, 'SHANAO', 2205),
(220510, 'TABALOSOS', 2205),
(220511, 'ZAPATERO', 2205),
(220601, 'JUANJUI', 2206),
(220602, 'CAMPANILLA', 2206),
(220603, 'HUICUNGO', 2206),
(220604, 'PACHIZA', 2206),
(220605, 'PAJARILLO', 2206),
(220701, 'PICOTA', 2207),
(220702, 'BUENOS AIRES', 2207),
(220703, 'CASPISAPA', 2207),
(220704, 'PILLUANA', 2207),
(220705, 'PUCACACA', 2207),
(220706, 'SAN CRISTOBAL', 2207),
(220707, 'SAN HILARION', 2207),
(220708, 'SHAMBOYACU', 2207),
(220709, 'TINGO DE PONASA', 2207),
(220710, 'TRES UNIDOS', 2207),
(220801, 'RIOJA', 2208),
(220802, 'AWAJUN', 2208),
(220803, 'ELIAS SOPLIN VARGAS', 2208),
(220804, 'NUEVA CAJAMARCA', 2208),
(220805, 'PARDO MIGUEL', 2208),
(220806, 'POSIC', 2208),
(220807, 'SAN FERNANDO', 2208),
(220808, 'YORONGOS', 2208),
(220809, 'YURACYACU', 2208),
(220901, 'TARAPOTO', 2209),
(220902, 'ALBERTO LEVEAU', 2209),
(220903, 'CACATACHI', 2209),
(220904, 'CHAZUTA', 2209),
(220905, 'CHIPURANA', 2209),
(220906, 'EL PORVENIR', 2209),
(220907, 'HUIMBAYOC', 2209),
(220908, 'JUAN GUERRA', 2209),
(220909, 'LA BANDA DE SHILCAYO', 2209),
(220910, 'MORALES', 2209),
(220911, 'PAPAPLAYA', 2209),
(220912, 'SAN ANTONIO', 2209),
(220913, 'SAUCE', 2209),
(220914, 'SHAPAJA', 2209),
(221001, 'TOCACHE', 2210),
(221002, 'NUEVO PROGRESO', 2210),
(221003, 'POLVORA', 2210),
(221004, 'SHUNTE 2/', 2210),
(221005, 'UCHIZA', 2210),
(230101, 'TACNA', 2301),
(230102, 'ALTO DE LA ALIANZA', 2301),
(230103, 'CALANA', 2301),
(230104, 'CIUDAD NUEVA', 2301),
(230105, 'INCLAN', 2301),
(230106, 'PACHIA', 2301),
(230107, 'PALCA', 2301),
(230108, 'POCOLLAY', 2301),
(230109, 'SAMA', 2301),
(230110, 'CORONEL GREGORIO ALBARRACIN LANCHIPA', 2301),
(230201, 'CANDARAVE', 2302),
(230202, 'CAIRANI', 2302),
(230203, 'CAMILACA', 2302),
(230204, 'CURIBAYA', 2302),
(230205, 'HUANUARA', 2302),
(230206, 'QUILAHUANI', 2302),
(230301, 'LOCUMBA', 2303),
(230302, 'ILABAYA', 2303),
(230303, 'ITE', 2303),
(230401, 'TARATA', 2304),
(230402, 'HEROES ALBARRACIN', 2304),
(230403, 'ESTIQUE', 2304),
(230404, 'ESTIQUE-PAMPA', 2304),
(230405, 'SITAJARA', 2304),
(230406, 'SUSAPAYA', 2304),
(230407, 'TARUCACHI', 2304),
(230408, 'TICACO', 2304),
(240101, 'TUMBES', 2401),
(240102, 'CORRALES', 2401),
(240103, 'LA CRUZ', 2401),
(240104, 'PAMPAS DE HOSPITAL', 2401),
(240105, 'SAN JACINTO', 2401),
(240106, 'SAN JUAN DE LA VIRGEN', 2401),
(240201, 'ZORRITOS', 2402),
(240202, 'CASITAS', 2402),
(240203, 'CANOAS DE PUNTA SAL', 2402),
(240301, 'ZARUMILLA', 2403),
(240302, 'AGUAS VERDES', 2403),
(240303, 'MATAPALO', 2403),
(240304, 'PAPAYAL', 2403),
(250101, 'CALLERIA', 2501),
(250102, 'CAMPOVERDE', 2501),
(250103, 'IPARIA', 2501),
(250104, 'MASISEA', 2501),
(250105, 'YARINACOCHA', 2501),
(250106, 'NUEVA REQUENA', 2501),
(250107, 'MANANTAY', 2501),
(250201, 'RAYMONDI', 2502),
(250202, 'SEPAHUA', 2502),
(250203, 'TAHUANIA', 2502),
(250204, 'YURUA', 2502),
(250301, 'PADRE ABAD', 2503),
(250302, 'IRAZOLA', 2503),
(250303, 'CURIMANA', 2503),
(250401, 'PURUS', 2504);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `gem_id` bigint(20) NOT NULL,
  `gem_ruc` varchar(11) NOT NULL,
  `gem_razonsocial` varchar(100) NOT NULL,
  `gem_direccion` text NOT NULL,
  `gem_gdi_id` bigint(20) NOT NULL DEFAULT 0,
  `gem_email` varchar(150) DEFAULT NULL,
  `gem_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='g';

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`gem_id`, `gem_ruc`, `gem_razonsocial`, `gem_direccion`, `gem_gdi_id`, `gem_email`, `gem_status`) VALUES
(1, '20000000000', 'EL PLATANAL S.A.C.', '***', 140106, 'sergiochavez.384@elplatanaldegraciela384.com', 1);

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
  `est_created` datetime NOT NULL DEFAULT current_timestamp(),
  `est_updated` datetime NOT NULL DEFAULT current_timestamp(),
  `est_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `establecimientos`
--

INSERT INTO `establecimientos` (`est_id`, `est_nombre`, `est_direccion`, `est_serie`, `est_logo`, `est_gdi_id`, `est_created`, `est_updated`, `est_status`) VALUES
(1, 'PUESTO 384', 'Mz A, lote 12, tambo Inga, Ref. km 27 Panam. Norte', '01', 'cacel.png', 150125, '2022-07-25 12:30:55', '2022-07-25 12:30:55', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liquidez`
--

CREATE TABLE `liquidez` (
  `liq_id` bigint(20) NOT NULL,
  `liq_fecha` date NOT NULL,
  `liq_age_id` bigint(20) DEFAULT NULL,
  `liq_monto` decimal(24,4) DEFAULT NULL,
  `liq_status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `mde_des` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`mde_des`)),
  `mde_desm` decimal(12,6) DEFAULT NULL,
  `mde_importe` decimal(24,12) NOT NULL,
  `mde_detraccion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mdetalles`
--

INSERT INTO `mdetalles` (`mde_id`, `mde_bie_id`, `mde_t6m_id`, `mde_gta_id`, `mde_mov_id`, `mde_q`, `mde_vu`, `mde_igv`, `mde_des`, `mde_desm`, `mde_importe`, `mde_detraccion`) VALUES
(6, 1, 68, 9, 7, '165.000000', '42.000000', 0, NULL, '0.000000', '6930.000000000000', 0),
(7, 2, 68, 9, 7, '6.000000', '55.000000', 0, NULL, '0.000000', '330.000000000000', 0),
(8, 1, 65, 9, 7, '14.000000', '22.000000', 0, NULL, '0.000000', '308.000000000000', 0);

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
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `gmo_id` bigint(20) NOT NULL,
  `gmo_titulo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `gmo_descripcion` text DEFAULT NULL,
  `gmo_gmo_id` bigint(20) DEFAULT NULL,
  `gmo_path` varchar(200) NOT NULL DEFAULT '#',
  `gmo_icon` varchar(100) DEFAULT NULL,
  `gmo_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='g';

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`gmo_id`, `gmo_titulo`, `gmo_descripcion`, `gmo_gmo_id`, `gmo_path`, `gmo_icon`, `gmo_status`) VALUES
(1, 'DASHBOARD', NULL, NULL, '/dashboard', 'fa fa-dashboard', 1),
(2, 'ADMINISTRACION', NULL, NULL, '#', 'fas fa-users-cog', 1),
(3, 'Usuarios', NULL, 2, '/usuarios', 'fas fa-user-alt', 1),
(4, 'Roles', NULL, 2, '/roles', 'fas fa-portrait', 1),
(5, 'Almacenes', NULL, 2, '/almacenes', 'fas fa-building', 1),
(6, 'Modulos', NULL, 2, '/modulos', 'fas fa-warehouse', 1),
(7, 'Empresas', NULL, 2, '/empresas', 'fas fa-building', 1),
(8, 'BASES DE DATOS', NULL, NULL, '#', 'fas fa-database', 1),
(9, 'Clientes', NULL, 8, '/Agentes/clientes', 'fa fa-database', 1),
(10, 'Proveedores', NULL, 8, '/Agentes/proveedores', 'fas fa-user-check', 1),
(11, 'Cuentas', NULL, 8, '/Cuentas', 'fas fa-file-invoice-dollar', 1),
(12, 'Bienes', NULL, 8, '/bienes', 'fas fa-clipboard-list', 1),
(13, 'LOGISTICO', NULL, NULL, '#', 'fas fa-boxes', 1),
(14, 'Entradas', NULL, 13, '#', 'fa fa-database', 1),
(15, 'Saldos Iniciales', NULL, 14, '/sbienes', 'fas fa-warehouse', 1),
(16, 'COMPRAS Y CUADRE', NULL, 13, '/entradas', 'far fa-file-alt', 1),
(17, 'Salidas', NULL, 13, '#', 'fas fa-user-check', 1),
(18, 'Notas de Salidas', NULL, 17, '/salidas', 'far fa-file-alt', 1),
(19, 'Mermas', NULL, 17, '/mermas', 'fas fa-pallet', 1),
(20, 'Transferencias', NULL, 17, '/transferencias', 'fas fa-dolly-flatbed', 1),
(21, 'Saldos', NULL, 13, '/Bienes/sbienes', 'fas fa-warehouse', 1),
(22, 'Ventas', NULL, 13, '/Gerencial/cventas', 'fas fa-chart-line', 1),
(23, 'FINANCIERO', NULL, NULL, '#', 'fas fa-landmark', 1),
(24, 'Cuentas', NULL, 23, '/cuentas', 'fas fa-file-invoice-dollar', 1),
(25, 'Saldo Inicial', NULL, 23, '/Cajas/scuentas', 'fas fa-wallet', 1),
(26, 'Ingresos', NULL, 23, '/Cajas/ingresos', 'fas fa-hand-holding-usd', 1),
(27, 'Egresos', NULL, 23, '/Cajas/egresos', 'fas fa-receipt', 1),
(28, 'Gastos', NULL, 23, '/Cajas/gastos', 'fas fa-stamp', 1),
(29, 'Sub Total Gastos', NULL, 23, '/Cajas/subgastos', 'fas fa-stamp', 1),
(30, 'Caja Internos', NULL, 23, '/Cajas/cinternos', 'fas fa-coins', 1),
(31, 'Ingresos Otros', NULL, 23, '/Cajas/iadicionales', 'fas fa-donate', 1),
(32, 'LIQUIDEZ', NULL, NULL, '#', 'fas fa-handshake', 1),
(33, 'Notas de Credito', NULL, 32, '/Liquidez/castigos', 'fas fa-file-invoice', 1),
(34, 'Notas de Debito', NULL, 32, '/Liquidez/premios', 'fas fa-file-invoice', 1),
(35, 'Estado Actual', NULL, 32, '/liquidez?t=ncuadre', 'fas fa-id-card-alt', 1),
(36, 'Historial Cuadre', NULL, 32, '/liquidez?t=cuadre', 'fas fa-id-card-alt', 1),
(37, 'GERENCIAL', NULL, NULL, '#', 'fas fa-chart-pie', 1),
(38, 'Resumen Capital', NULL, 37, '/gerencial', 'fas fa-file-alt', 1),
(39, 'Resumen de Materiales', NULL, 37, '/Bienes/Smateriales', 'fas fa-file-alt', 1),
(40, 'Margen en Ventas', NULL, 37, '/Gerencial/cventas', 'fas fa-file-alt', 1),
(41, 'Detracciones', NULL, 37, '/Gerencial/detracciones', 'fas fa-file-alt', 1),
(42, 'Exportaciones', NULL, 37, '/Gerencial/exportaciones', 'fas fa-file-alt', 1),
(43, 'Estado de Resultados', NULL, 37, '/Gerencial/resultados', 'fas fa-file-alt', 1),
(44, 'RR.HH.', NULL, NULL, '#', 'far fa-address-book', 1),
(45, 'Personales', NULL, 44, '/colaboradores', 'fas fa-address-book', 1),
(46, 'Asistencias', NULL, 44, '/asistencias', 'fas fa-check-circle', 1),
(47, 'Planillas', NULL, 44, '/planillas', 'fas fa-calendar-check', 1),
(48, 'Pagos Planillas', NULL, 44, '/ppagos', 'fas fa-money-bill-wave', 1),
(49, 'OTROS', NULL, NULL, '#', 'fas fa-folder-open', 1),
(50, 'utilitarios', NULL, 49, '/utilitarios', 'fas fa-lightbulb', 1),
(51, 'SALIR', NULL, NULL, '/logout', 'fa fa-sign-out', 1),
(52, 'Volumen de Ventas', NULL, 13, '/Gerencial/volumen', 'fas fa-chart-line', 1);

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
  `mov_cue_id` bigint(20) DEFAULT NULL,
  `mov_fechaE` date NOT NULL,
  `mov_fechaR` date NOT NULL,
  `mov_fechaV` date DEFAULT NULL,
  `mov_tipo` int(11) NOT NULL,
  `mov_subtotal` decimal(24,12) NOT NULL,
  `mov_igv_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`mov_igv_id`)),
  `mov_total` decimal(24,12) NOT NULL,
  `mov_ncr_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`mov_ncr_id`)),
  `mov_observaciones` text DEFAULT NULL,
  `mov_gus_id` bigint(20) DEFAULT NULL,
  `mov_mov_id` bigint(20) DEFAULT NULL,
  `mov_created` datetime NOT NULL DEFAULT current_timestamp(),
  `mov_updated` datetime NOT NULL DEFAULT current_timestamp(),
  `mov_mstatus` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`mov_id`, `mov_age_id`, `mov_alm_id`, `mov_serie`, `mov_numero`, `mov_t12num`, `mov_gt4_id`, `mov_t12_id`, `mov_t10_id`, `mov_tce_id`, `mov_cue_id`, `mov_fechaE`, `mov_fechaR`, `mov_fechaV`, `mov_tipo`, `mov_subtotal`, `mov_igv_id`, `mov_total`, `mov_ncr_id`, `mov_observaciones`, `mov_gus_id`, `mov_mov_id`, `mov_created`, `mov_updated`, `mov_mstatus`) VALUES
(7, 6, 1, 'NE01', 1, 1, 1, 2, 49, 1, NULL, '2023-02-10', '2023-02-10', '2023-02-10', 2, '7568.000000000000', '{\"mov_exonerada\":\"7568.00\",\"mov_inafecta\":\"0.00\",\"mov_gravada\":\"0.00\",\"mov_des\":\"1026.01\",\"mov_igv\":\"0.00\",\"mov_neto\":\"6541.99\"}', '6541.990000000000', NULL, NULL, 2, NULL, '2023-02-10 21:52:16', '2023-02-10 21:52:16', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `gpe_id` bigint(20) NOT NULL,
  `gpe_identificacion` varchar(20) NOT NULL,
  `gpe_nombre` varchar(60) NOT NULL,
  `gpe_apellidos` varchar(60) NOT NULL,
  `gpe_direccion` varchar(100) DEFAULT NULL,
  `gpe_telefono` varchar(9) DEFAULT NULL,
  `gpe_celular` varchar(9) DEFAULT NULL,
  `gpe_ecivil` varchar(50) DEFAULT NULL,
  `gpe_nacionalidad` varchar(60) DEFAULT NULL,
  `gpe_capacidad` varchar(50) DEFAULT NULL,
  `gpe_fechan` date DEFAULT NULL,
  `gpe_gt2_id` bigint(20) NOT NULL DEFAULT 2,
  `gpe_gdi_id` bigint(20) NOT NULL DEFAULT 150101,
  `gpe_email` varchar(150) DEFAULT NULL,
  `gpe_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='g';

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`gpe_id`, `gpe_identificacion`, `gpe_nombre`, `gpe_apellidos`, `gpe_direccion`, `gpe_telefono`, `gpe_celular`, `gpe_ecivil`, `gpe_nacionalidad`, `gpe_capacidad`, `gpe_fechan`, `gpe_gt2_id`, `gpe_gdi_id`, `gpe_email`, `gpe_status`) VALUES
(1, '24091989', 'Eduardo', 'Eulogio Anquipa', 'Direccion Fiscal de persona', NULL, NULL, NULL, NULL, NULL, NULL, 1, 150142, NULL, 1),
(2, '24091990', 'Mery', '***', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 150101, NULL, 1),
(4, '48025117', 'Segundo Cristian', 'Nasario', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 100604, NULL, 1),
(5, '46231362', 'MISAEL', 'SIMON RAMOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 150101, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ppagos`
--

CREATE TABLE `ppagos` (
  `ppa_id` bigint(20) NOT NULL,
  `ppa_tipo` int(11) NOT NULL DEFAULT 0,
  `ppa_col_id` bigint(20) NOT NULL,
  `ppa_caj_id` bigint(20) NOT NULL,
  `ppa_fecha` date NOT NULL,
  `ppa_gus_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `pro_revalue` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `propiedades`
--

INSERT INTO `propiedades` (`pro_id`, `pro_nombre`, `pro_type`, `pro_revalue`) VALUES
(1, 'color', '3', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `gpr_id` bigint(20) NOT NULL,
  `gpr_provincia` varchar(60) DEFAULT NULL,
  `gpr_gde_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='g';

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`gpr_id`, `gpr_provincia`, `gpr_gde_id`) VALUES
(101, 'CHACHAPOYAS', 1),
(102, 'BAGUA', 1),
(103, 'BONGARA', 1),
(104, 'CONDORCANQUI', 1),
(105, 'LUYA', 1),
(106, 'RODRIGUEZ DE MENDOZA', 1),
(107, 'UTCUBAMBA', 1),
(201, 'HUARAZ', 2),
(202, 'AIJA', 2),
(203, 'ANTONIO RAYMONDI', 2),
(204, 'ASUNCION', 2),
(205, 'BOLOGNESI', 2),
(206, 'CARHUAZ', 2),
(207, 'CARLOS FERMIN FITZCARRALD', 2),
(208, 'CASMA', 2),
(209, 'CORONGO', 2),
(210, 'HUARI', 2),
(211, 'HUARMEY', 2),
(212, 'HUAYLAS', 2),
(213, 'MARISCAL LUZURIAGA', 2),
(214, 'OCROS', 2),
(215, 'PALLASCA', 2),
(216, 'POMABAMBA', 2),
(217, 'RECUAY', 2),
(218, 'SANTA', 2),
(219, 'SIHUAS', 2),
(220, 'YUNGAY', 2),
(301, 'ABANCAY', 3),
(302, 'ANDAHUAYLAS', 3),
(303, 'ANTABAMBA', 3),
(304, 'AYMARAES', 3),
(305, 'COTABAMBAS', 3),
(306, 'CHINCHEROS', 3),
(307, 'GRAU', 3),
(401, 'AREQUIPA', 4),
(402, 'CAMANA', 4),
(403, 'CARAVELI', 4),
(404, 'CASTILLA', 4),
(405, 'CAYLLOMA', 4),
(406, 'CONDESUYOS', 4),
(407, 'ISLAY', 4),
(408, 'LA UNION', 4),
(501, 'HUAMANGA', 5),
(502, 'CANGALLO', 5),
(503, 'HUANCA SANCOS', 5),
(504, 'HUANTA', 5),
(505, 'LA MAR', 5),
(506, 'LUCANAS', 5),
(507, 'PARINACOCHAS', 5),
(508, 'PAUCAR DEL SARA SARA', 5),
(509, 'SUCRE', 5),
(510, 'VICTOR FAJARDO', 5),
(511, 'VILCAS HUAMAN', 5),
(601, 'CAJAMARCA', 6),
(602, 'CAJABAMBA', 6),
(603, 'CELENDIN', 6),
(604, 'CHOTA', 6),
(605, 'CONTUMAZA', 6),
(606, 'CUTERVO', 6),
(607, 'HUALGAYOC', 6),
(608, 'JAEN', 6),
(609, 'SAN IGNACIO', 6),
(610, 'SAN MARCOS', 6),
(611, 'SAN MIGUEL', 6),
(612, 'SAN PABLO', 6),
(613, 'SANTA CRUZ', 6),
(701, 'PROV. CONST. DEL CALLAO', 7),
(801, 'CUSCO', 8),
(802, 'ACOMAYO', 8),
(803, 'ANTA', 8),
(804, 'CALCA', 8),
(805, 'CANAS', 8),
(806, 'CANCHIS', 8),
(807, 'CHUMBIVILCAS', 8),
(808, 'ESPINAR', 8),
(809, 'LA CONVENCION', 8),
(810, 'PARURO', 8),
(811, 'PAUCARTAMBO', 8),
(812, 'QUISPICANCHI', 8),
(813, 'URUBAMBA', 8),
(901, 'HUANCAVELICA', 9),
(902, 'ACOBAMBA', 9),
(903, 'ANGARAES', 9),
(904, 'CASTROVIRREYNA', 9),
(905, 'CHURCAMPA', 9),
(906, 'HUAYTARA', 9),
(907, 'TAYACAJA', 9),
(1001, 'HUANUCO', 10),
(1002, 'AMBO', 10),
(1003, 'DOS DE MAYO', 10),
(1004, 'HUACAYBAMBA', 10),
(1005, 'HUAMALIES', 10),
(1006, 'LEONCIO PRADO', 10),
(1007, 'MARAÑON', 10),
(1008, 'PACHITEA', 10),
(1009, 'PUERTO INCA', 10),
(1010, 'LAURICOCHA', 10),
(1011, 'YAROWILCA', 10),
(1101, 'ICA', 11),
(1102, 'CHINCHA', 11),
(1103, 'NAZCA', 11),
(1104, 'PALPA', 11),
(1105, 'PISCO', 11),
(1201, 'HUANCAYO', 12),
(1202, 'CONCEPCION', 12),
(1203, 'CHANCHAMAYO', 12),
(1204, 'JAUJA', 12),
(1205, 'JUNIN', 12),
(1206, 'SATIPO', 12),
(1207, 'TARMA', 12),
(1208, 'YAULI', 12),
(1209, 'CHUPACA', 12),
(1301, 'TRUJILLO', 13),
(1302, 'ASCOPE', 13),
(1303, 'BOLIVAR', 13),
(1304, 'CHEPEN', 13),
(1305, 'JULCAN', 13),
(1306, 'OTUZCO', 13),
(1307, 'PACASMAYO', 13),
(1308, 'PATAZ', 13),
(1309, 'SANCHEZ CARRION', 13),
(1310, 'SANTIAGO DE CHUCO', 13),
(1311, 'GRAN CHIMU', 13),
(1312, 'VIRU', 13),
(1401, 'CHICLAYO', 14),
(1402, 'FERREÑAFE', 14),
(1403, 'LAMBAYEQUE', 14),
(1501, 'LIMA', 15),
(1502, 'BARRANCA', 15),
(1503, 'CAJATAMBO', 15),
(1504, 'CANTA', 15),
(1505, 'CAÑETE', 15),
(1506, 'HUARAL', 15),
(1507, 'HUAROCHIRI', 15),
(1508, 'HUAURA', 15),
(1509, 'OYON', 15),
(1510, 'YAUYOS', 15),
(1601, 'MAYNAS', 16),
(1602, 'ALTO AMAZONAS', 16),
(1603, 'LORETO', 16),
(1604, 'MARISCAL RAMON CASTILLA', 16),
(1605, 'REQUENA', 16),
(1606, 'UCAYALI', 16),
(1607, 'DATEM DEL MARAÑON', 16),
(1701, 'TAMBOPATA', 17),
(1702, 'MANU', 17),
(1703, 'TAHUAMANU', 17),
(1801, 'MARISCAL NIETO', 18),
(1802, 'GENERAL SANCHEZ CERRO', 18),
(1803, 'ILO', 18),
(1901, 'PASCO', 19),
(1902, 'DANIEL ALCIDES CARRION', 19),
(1903, 'OXAPAMPA', 19),
(2001, 'PIURA', 20),
(2002, 'AYABACA', 20),
(2003, 'HUANCABAMBA', 20),
(2004, 'MORROPON', 20),
(2005, 'PAITA', 20),
(2006, 'SULLANA', 20),
(2007, 'TALARA', 20),
(2008, 'SECHURA', 20),
(2101, 'PUNO', 21),
(2102, 'AZANGARO', 21),
(2103, 'CARABAYA', 21),
(2104, 'CHUCUITO', 21),
(2105, 'EL COLLAO', 21),
(2106, 'HUANCANE', 21),
(2107, 'LAMPA', 21),
(2108, 'MELGAR', 21),
(2109, 'MOHO', 21),
(2110, 'SAN ANTONIO DE PUTINA', 21),
(2111, 'SAN ROMAN', 21),
(2112, 'SANDIA', 21),
(2113, 'YUNGUYO', 21),
(2201, 'MOYOBAMBA', 22),
(2202, 'BELLAVISTA', 22),
(2203, 'EL DORADO', 22),
(2204, 'HUALLAGA', 22),
(2205, 'LAMAS', 22),
(2206, 'MARISCAL CACERES', 22),
(2207, 'PICOTA', 22),
(2208, 'RIOJA', 22),
(2209, 'SAN MARTIN', 22),
(2210, 'TOCACHE', 22),
(2301, 'TACNA', 23),
(2302, 'CANDARAVE', 23),
(2303, 'JORGE BASADRE', 23),
(2304, 'TARATA', 23),
(2401, 'TUMBES', 24),
(2402, 'CONTRALMIRANTE VILLAR', 24),
(2403, 'ZARUMILLA', 24),
(2501, 'CORONEL PORTILLO', 25),
(2502, 'ATALAYA', 25),
(2503, 'PADRE ABAD', 25),
(2504, 'PURUS', 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsables`
--

CREATE TABLE `responsables` (
  `res_id` bigint(20) NOT NULL,
  `res_tar_id` bigint(20) NOT NULL,
  `res_gus_gpe_id` bigint(20) NOT NULL,
  `res_status` int(11) NOT NULL DEFAULT 1
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
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `gro_id` bigint(20) NOT NULL,
  `gro_nombrerol` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `gro_descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `gro_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='g';

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`gro_id`, `gro_nombrerol`, `gro_descripcion`, `gro_status`) VALUES
(1, 'Administrador', 'Acceso a todo el sistema 	', 1),
(2, 'Logistica', 'Logistica', 1),
(3, 'Finanzas', 'Finanzas', 1),
(4, 'Gerencial', 'Gerencial', 1),
(5, 'Auditoría', 'Auditoria de Gastos', 1);

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
  `sal_created` datetime NOT NULL DEFAULT current_timestamp(),
  `sal_updated` datetime NOT NULL DEFAULT current_timestamp()
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
  `ser_img` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t1mediopagos`
--

CREATE TABLE `t1mediopagos` (
  `t1m_id` bigint(20) NOT NULL,
  `t1m_codigo` varchar(4) NOT NULL,
  `t1m_descripcion` text NOT NULL,
  `t1m_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `t1mediopagos`
--

INSERT INTO `t1mediopagos` (`t1m_id`, `t1m_codigo`, `t1m_descripcion`, `t1m_status`) VALUES
(1, '001', 'DEPÓSITO EN CUENTA', 1),
(2, '002', 'GIRO', 1),
(3, '003', 'TRANSFERENCIA DE FONDOS', 1),
(4, '004', 'ORDEN DE PAGO', 0),
(5, '005', 'TARJETA DE DÉBITO', 0),
(6, '006', 'TARJETA DE CRÉDITO', 0),
(7, '007', '\"CHEQUES CON LA CLÁUSULA DE \"\"NO NEGOCIABLE\"\", \"\"INTRANSFERIBLES\"\", \"\"NO A LA ORDEN\"\" U OTRA EQUIVALENTE, A QUE SE REFIERE EL INCISO F) DEL ARTICULO 5° DEL DECRETO LEGISLATIVO.\"', 0),
(8, '008', 'EFECTIVO, POR OPERACIONES EN LAS QUE NO EXISTE OBLIGACIÓN DE UTILIZAR MEDIOS DE PAGO', 0),
(9, '009', 'EFECTIVO, EN LOS DEMÁS CASOS', 1),
(10, '010', 'MEDIOS DE PAGO DE COMERCIO EXTERIOR', 0),
(11, '011', 'LETRAS DE CAMBIO', 0),
(12, '101', 'TRANSFERENCIAS - COMERCIO EXTERIOR', 0),
(13, '102', 'CHEQUES', 1),
(14, '103', 'ORDEN DE PAGO SIMPLE  - COMERCIO EXTERIOR', 0),
(15, '104', 'ORDEN DE PAGO DOCUMENTARIO  - COMERCIO EXTERIOR', 0),
(16, '105', 'REMESA SIMPLE  - COMERCIO EXTERIOR', 0),
(17, '106', 'REMESA DOCUMENTARIA  - COMERCIO EXTERIOR', 0),
(18, '107', 'CARTA DE CRÉDITO SIMPLE  - COMERCIO EXTERIOR', 0),
(19, '108', 'CARTA DE CRÉDITO DOCUMENTARIO  - COMERCIO EXTERIOR', 0),
(20, '999', 'OTROS MEDIOS DE PAGO (ESPECIFICAR)', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t2identidades`
--

CREATE TABLE `t2identidades` (
  `gt2_id` bigint(20) NOT NULL,
  `gt2_codigo` varchar(4) NOT NULL,
  `gt2_descripcion` text NOT NULL,
  `gt2_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='g';

--
-- Volcado de datos para la tabla `t2identidades`
--

INSERT INTO `t2identidades` (`gt2_id`, `gt2_codigo`, `gt2_descripcion`, `gt2_status`) VALUES
(1, '00', 'OTROS TIPOS DE DOCUMENTOS', 1),
(2, '01', 'DOCUMENTO NACIONAL DE IDENTIDAD (DNI)', 1),
(3, '04', 'CARNET DE EXTRANJERIA', 1),
(4, '06', 'REGISTRO ÚNICO DE CONTRIBUYENTES', 1),
(5, '07', 'PASAPORTE', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t3financieras`
--

CREATE TABLE `t3financieras` (
  `t3f_id` bigint(20) NOT NULL,
  `t3f_codigo` varchar(4) NOT NULL,
  `t3f_descripcion` text NOT NULL,
  `t3f_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t4monedas`
--

CREATE TABLE `t4monedas` (
  `gt4_id` bigint(20) NOT NULL,
  `gt4_codigo` varchar(4) NOT NULL,
  `gt4_sunat` varchar(4) NOT NULL,
  `gt4_simbolo` varchar(6) NOT NULL,
  `gt4_descripcion` text NOT NULL,
  `gt4_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='g';

--
-- Volcado de datos para la tabla `t4monedas`
--

INSERT INTO `t4monedas` (`gt4_id`, `gt4_codigo`, `gt4_sunat`, `gt4_simbolo`, `gt4_descripcion`, `gt4_status`) VALUES
(1, '01', 'PEN', 'S/', 'SOLES', 1),
(2, '02', 'USD', '$', 'DÓLARES AMERICANOS', 1),
(3, '00', 'EUR', '€', 'EURO', 1),
(4, '09', '099', '', 'OTRA MONEDA (ESPECIFICAR)', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t5existencias`
--

CREATE TABLE `t5existencias` (
  `t5e_id` bigint(20) NOT NULL,
  `t5e_codigo` varchar(4) NOT NULL,
  `t5e_descripcion` text NOT NULL,
  `t5e_status` int(11) NOT NULL DEFAULT 1
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
  `t6m_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `t6medidas`
--

INSERT INTO `t6medidas` (`t6m_id`, `t6m_codigo`, `t6m_sunat`, `t6m_descripcion`, `t6m_status`) VALUES
(1, '00', '4A', 'BOBINAS', 0),
(2, '00', 'BJ', 'BALDE', 0),
(3, '10', 'BLL', 'BARRILES', 0),
(4, '00', 'BG', 'BOLSA', 0),
(5, '00', 'BO', 'BOTELLAS', 0),
(6, '12', 'BX', 'CAJA', 0),
(7, '00', 'CT', 'CARTONES', 0),
(8, '00', 'CMK', 'CENTIMETRO CUADRADO', 0),
(9, '00', 'CMQ', 'CENTIMETRO CUBICO', 0),
(10, '00', 'CMT', 'CENTIMETRO LINEAL', 0),
(11, '00', 'CEN', 'CIENTO DE UNIDADES', 0),
(12, '00', 'CY', 'CILINDRO', 0),
(13, '00', 'CJ', 'CONOS', 0),
(14, '00', 'DZN', 'DOCENA', 0),
(15, '00', 'DZP', 'DOCENA POR 10**6', 0),
(16, '00', 'BE', 'FARDO', 0),
(17, '09', 'GLI', 'GALON INGLES (4,545956L)', 0),
(18, '06', 'GRM', 'GRAMO', 0),
(19, '00', 'GRO', 'GRUESA', 0),
(20, '00', 'HLT', 'HECTOLITRO', 0),
(21, '00', 'LEF', 'HOJA', 0),
(22, '00', 'SET', 'JUEGO', 0),
(23, '01', 'KGM', 'KILOGRAMO', 0),
(24, '00', 'KTM', 'KILOMETRO', 0),
(25, '00', 'KWH', 'KILOVATIO HORA', 0),
(26, '00', 'KT', 'KIT', 0),
(27, '11', 'CA', 'LATAS', 0),
(28, '02', 'LBR', 'LIBRAS', 0),
(29, '08', 'LTR', 'LITRO', 0),
(30, '00', 'MWH', 'MEGAWATT HORA', 0),
(31, '15', 'MTR', 'METRO', 0),
(32, '00', 'MTK', 'METRO CUADRADO', 0),
(33, '14', 'MTQ', 'METRO CUBICO', 0),
(34, '00', 'MGM', 'MILIGRAMOS', 0),
(35, '00', 'MLT', 'MILILITRO', 0),
(36, '00', 'MMT', 'MILIMETRO', 0),
(37, '00', 'MMK', 'MILIMETRO CUADRADO', 0),
(38, '00', 'MMQ', 'MILIMETRO CUBICO', 0),
(39, '13', 'MLL', 'MILLARES', 0),
(40, '00', 'UM', 'MILLON DE UNIDADES', 0),
(41, '00', 'ONZ', 'ONZAS', 0),
(42, '00', 'PF', 'PALETAS', 0),
(43, '00', 'PK', 'PAQUETE', 0),
(44, '00', 'PR', 'PAR', 0),
(45, '00', 'FOT', 'PIES', 0),
(46, '00', 'FTK', 'PIES CUADRADOS', 0),
(47, '00', 'FTQ', 'PIES CUBICOS', 0),
(48, '00', 'C62', 'PIEZAS', 0),
(49, '00', 'PG', 'PLACAS', 0),
(50, '00', 'ST', 'PLIEGO', 0),
(51, '00', 'INH', 'PULGADAS', 0),
(52, '00', 'RM', 'RESMA', 0),
(53, '00', 'DR', 'TAMBOR', 0),
(54, '05', 'STN', 'TONELADA CORTA', 0),
(55, '03', 'LTN', 'TONELADA LARGA', 0),
(56, '04', 'TNE', 'TONELADAS MÉTRICAS', 0),
(57, '00', 'TU', 'TUBOS', 0),
(58, '07', 'NIU', 'UNIDAD (BIENES)', 0),
(59, '07', 'ZZ', 'UNIDAD (SERVICIOS)', 0),
(60, '00', 'GLL', 'US GALON (3,7843 L)', 0),
(61, '00', 'YRD', 'YARDA', 0),
(62, '00', 'YDK', 'YARDA CUADRADA', 0),
(63, '99', '999', 'OTROS (ESPECIFICAR)', 0),
(64, 'CO', '00', 'CONVENCIONAL', 1),
(65, 'BO', '00', 'BOMBITA', 1),
(66, 'BE', '00', 'BETA', 1),
(67, 'JU', '00', 'JUMBO', 1),
(68, 'TR', '00', 'TRIPLE', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t7intangibles`
--

CREATE TABLE `t7intangibles` (
  `t7i_id` bigint(20) NOT NULL,
  `t7i_codigo` varchar(4) NOT NULL,
  `t7i_descripcion` text NOT NULL,
  `t7i_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t8libroregistros`
--

CREATE TABLE `t8libroregistros` (
  `t8l_id` bigint(20) NOT NULL,
  `t8l_codigo` varchar(4) NOT NULL,
  `t8l_descripcion` text NOT NULL,
  `t8l_status` int(11) NOT NULL DEFAULT 1
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
  `t9p_status` int(11) NOT NULL DEFAULT 1
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
  `t10_status` int(11) NOT NULL DEFAULT 1
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
(50, '00', 'Nota de Salida', 1),
(51, '00', 'Exportacion', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t11aduanas`
--

CREATE TABLE `t11aduanas` (
  `t11_id` bigint(20) NOT NULL,
  `t11_codigo` varchar(4) NOT NULL,
  `t11_descripcion` text NOT NULL,
  `t11_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t12operaciones`
--

CREATE TABLE `t12operaciones` (
  `t12_id` bigint(20) NOT NULL,
  `t12_codigo` varchar(4) NOT NULL,
  `t12_descripcion` text NOT NULL,
  `t12_status` int(11) NOT NULL DEFAULT 1
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
-- Estructura de tabla para la tabla `tafectaciones`
--

CREATE TABLE `tafectaciones` (
  `gta_id` bigint(20) NOT NULL,
  `gta_codigo` varchar(10) NOT NULL,
  `gta_descripcion` varchar(200) NOT NULL,
  `gta_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='g';

--
-- Volcado de datos para la tabla `tafectaciones`
--

INSERT INTO `tafectaciones` (`gta_id`, `gta_codigo`, `gta_descripcion`, `gta_status`) VALUES
(1, '10', 'Gravado - Operación Onerosa', 1),
(2, '11', 'Gravado - Retiro por premio', 0),
(3, '12', 'Gravado - Retiro por donación', 0),
(4, '13', 'Gravado - Retiro', 0),
(5, '14', 'Gravado - Retiro por publicidad', 0),
(6, '15', 'Gravado - Bonificaciones', 0),
(7, '16', 'Gravado - Retiro por entrega a trabajadores', 0),
(8, '17', 'Gravado - IVAP', 0),
(9, '20', 'Exonerado - Operación Onerosa', 1),
(10, '21', 'Exonerado - Transferencia Gratuita', 0),
(11, '30', 'Inafecto - Operación Onerosa', 0),
(12, '31', 'Inafecto - Retiro por Bonificación', 0),
(13, '32', 'Inafecto - Retiro', 0),
(14, '33', 'Inafecto - Retiro por Muestras Médicas', 0),
(15, '34', 'Inafecto - Retiro por Convenio Colectivo', 0),
(16, '35', 'Inafecto - Retiro por premio', 0),
(17, '36', 'Inafecto - Retiro por publicidad', 0),
(18, '40', 'Exportación', 0);

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
  `tar_inicio` datetime NOT NULL DEFAULT current_timestamp(),
  `tar_fin` datetime NOT NULL DEFAULT current_timestamp(),
  `tar_ava_id` bigint(20) NOT NULL,
  `tar_pri_id` bigint(20) NOT NULL,
  `tar_baground` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `tar_colorText` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcambios`
--

CREATE TABLE `tcambios` (
  `gtc_id` bigint(20) NOT NULL,
  `gtc_gt4_id` bigint(20) NOT NULL,
  `gtc_fecha` date NOT NULL,
  `gtc_tcompra` decimal(10,4) NOT NULL,
  `gtc_tventa` decimal(10,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='g';

--
-- Volcado de datos para la tabla `tcambios`
--

INSERT INTO `tcambios` (`gtc_id`, `gtc_gt4_id`, `gtc_fecha`, `gtc_tcompra`, `gtc_tventa`) VALUES
(1, 2, '2023-01-25', '3.8800', '3.8850'),
(2, 2, '2023-02-10', '3.8630', '3.8690');

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
(1, 1, NULL, NULL),
(2, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tgastos`
--

CREATE TABLE `tgastos` (
  `tga_id` bigint(20) NOT NULL,
  `tga_nombre` varchar(200) DEFAULT NULL,
  `tga_status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tgastos`
--

INSERT INTO `tgastos` (`tga_id`, `tga_nombre`, `tga_status`) VALUES
(1, 'FLETE', 1),
(2, 'CAJA 1', 1),
(3, 'CAJA 2', 1),
(4, 'CAJA 3', 1),
(5, 'CAJA 4', 1),
(6, 'BOLSA 1', 1),
(7, 'BOLSA 2', 1),
(8, 'BOLSA 3', 1),
(9, 'COMISION', 1),
(10, 'PAPEL 1', 1),
(11, 'PAPEL 2', 1),
(12, 'PAPEL 3', 1),
(13, 'OTROS', 1);

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
  `iti_bie_id` bigint(20) DEFAULT NULL,
  `iti_ico_id` bigint(20) DEFAULT NULL,
  `iti_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpermisos`
--

CREATE TABLE `tpermisos` (
  `gtp_id` bigint(20) NOT NULL,
  `gtp_r` int(11) NOT NULL DEFAULT 1,
  `gtp_w` int(11) NOT NULL DEFAULT 1,
  `gtp_u` int(11) NOT NULL DEFAULT 1,
  `gtp_d` int(11) NOT NULL DEFAULT 1,
  `gtp_gro_id` bigint(20) NOT NULL,
  `gtp_gmo_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='g';

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
(52, 1, 1, 1, 1, 2, 1),
(53, 0, 0, 0, 0, 2, 2),
(54, 1, 1, 1, 1, 2, 3),
(55, 1, 1, 1, 1, 2, 4),
(56, 1, 1, 1, 1, 2, 5),
(57, 1, 1, 1, 1, 2, 6),
(58, 1, 1, 1, 1, 2, 7),
(59, 1, 1, 1, 1, 2, 8),
(60, 1, 1, 1, 1, 2, 9),
(61, 1, 1, 1, 1, 2, 10),
(62, 0, 0, 0, 0, 2, 11),
(63, 1, 1, 1, 1, 2, 12),
(64, 1, 1, 1, 1, 2, 13),
(65, 0, 0, 0, 0, 2, 14),
(66, 0, 0, 0, 0, 2, 15),
(67, 1, 1, 1, 1, 2, 16),
(68, 0, 0, 0, 0, 2, 17),
(69, 0, 0, 0, 0, 2, 18),
(70, 0, 0, 0, 0, 2, 19),
(71, 0, 0, 0, 0, 2, 20),
(72, 0, 0, 0, 0, 2, 21),
(73, 0, 0, 0, 0, 2, 22),
(74, 0, 0, 0, 0, 2, 23),
(75, 1, 1, 1, 1, 2, 24),
(76, 1, 1, 1, 1, 2, 25),
(77, 1, 1, 1, 1, 2, 26),
(78, 1, 1, 1, 1, 2, 27),
(79, 1, 1, 1, 1, 2, 28),
(80, 1, 1, 1, 1, 2, 29),
(81, 1, 1, 1, 1, 2, 30),
(82, 1, 1, 1, 1, 2, 31),
(83, 0, 0, 0, 0, 2, 32),
(84, 1, 1, 1, 1, 2, 33),
(85, 1, 1, 1, 1, 2, 34),
(86, 1, 1, 1, 1, 2, 35),
(87, 0, 0, 0, 0, 2, 36),
(88, 0, 0, 0, 0, 2, 37),
(89, 0, 0, 0, 0, 2, 38),
(90, 0, 0, 0, 0, 2, 39),
(91, 0, 0, 0, 0, 2, 40),
(92, 0, 0, 0, 0, 2, 41),
(93, 1, 1, 1, 1, 2, 42),
(94, 1, 1, 1, 1, 2, 43),
(95, 0, 0, 0, 0, 2, 44),
(96, 1, 1, 1, 1, 2, 45),
(97, 1, 1, 1, 1, 2, 46),
(98, 1, 1, 1, 1, 2, 47),
(99, 1, 1, 1, 1, 2, 48),
(100, 0, 0, 0, 0, 2, 49),
(101, 0, 0, 0, 0, 2, 50),
(102, 1, 1, 1, 1, 2, 51),
(103, 1, 1, 1, 1, 3, 1),
(104, 0, 0, 0, 0, 3, 2),
(105, 1, 1, 1, 1, 3, 3),
(106, 1, 1, 1, 1, 3, 4),
(107, 1, 1, 1, 1, 3, 5),
(108, 1, 1, 1, 1, 3, 6),
(109, 1, 1, 1, 1, 3, 7),
(110, 1, 1, 1, 1, 3, 8),
(111, 1, 1, 1, 1, 3, 9),
(112, 1, 1, 1, 1, 3, 10),
(113, 1, 1, 1, 1, 3, 11),
(114, 1, 1, 1, 1, 3, 12),
(115, 1, 1, 1, 1, 3, 13),
(116, 1, 1, 1, 1, 3, 14),
(117, 1, 1, 1, 1, 3, 15),
(118, 1, 1, 1, 1, 3, 16),
(119, 1, 1, 1, 1, 3, 17),
(120, 1, 1, 1, 1, 3, 18),
(121, 1, 1, 1, 1, 3, 19),
(122, 1, 1, 1, 1, 3, 20),
(123, 1, 1, 1, 1, 3, 21),
(124, 1, 1, 1, 1, 3, 22),
(125, 1, 1, 1, 1, 3, 23),
(126, 1, 1, 1, 1, 3, 24),
(127, 1, 1, 1, 1, 3, 25),
(128, 1, 1, 1, 1, 3, 26),
(129, 1, 1, 1, 1, 3, 27),
(130, 1, 1, 1, 1, 3, 28),
(131, 1, 1, 1, 1, 3, 29),
(132, 1, 1, 1, 1, 3, 30),
(133, 1, 1, 1, 1, 3, 31),
(134, 1, 1, 1, 1, 3, 32),
(135, 1, 1, 1, 1, 3, 33),
(136, 1, 1, 1, 1, 3, 34),
(137, 1, 1, 1, 1, 3, 35),
(138, 1, 1, 1, 1, 3, 36),
(139, 1, 1, 1, 1, 3, 37),
(140, 0, 0, 0, 0, 3, 38),
(141, 0, 0, 0, 0, 3, 39),
(142, 0, 0, 0, 0, 3, 40),
(143, 0, 0, 0, 0, 3, 41),
(144, 1, 1, 1, 1, 3, 42),
(145, 1, 1, 1, 1, 3, 43),
(146, 1, 1, 1, 1, 3, 44),
(147, 0, 0, 0, 0, 3, 45),
(148, 0, 0, 0, 0, 3, 46),
(149, 1, 1, 1, 1, 3, 47),
(150, 1, 1, 1, 1, 3, 48),
(151, 0, 0, 0, 0, 3, 49),
(152, 1, 1, 1, 1, 3, 50),
(153, 1, 1, 1, 1, 3, 51),
(154, 1, 1, 1, 1, 4, 1),
(155, 1, 1, 1, 1, 4, 2),
(156, 1, 1, 1, 1, 4, 3),
(157, 1, 1, 1, 1, 4, 4),
(158, 1, 1, 1, 1, 4, 5),
(159, 1, 1, 1, 1, 4, 6),
(160, 1, 1, 1, 1, 4, 7),
(161, 0, 0, 0, 0, 4, 8),
(162, 1, 1, 1, 1, 4, 9),
(163, 1, 1, 1, 1, 4, 10),
(164, 1, 1, 1, 1, 4, 11),
(165, 1, 1, 1, 1, 4, 12),
(166, 0, 0, 0, 0, 4, 13),
(167, 1, 1, 1, 1, 4, 14),
(168, 1, 1, 1, 1, 4, 15),
(169, 1, 1, 1, 1, 4, 16),
(170, 1, 1, 1, 1, 4, 17),
(171, 1, 1, 1, 1, 4, 18),
(172, 1, 1, 1, 1, 4, 19),
(173, 1, 1, 1, 1, 4, 20),
(174, 1, 1, 1, 1, 4, 21),
(175, 1, 1, 1, 1, 4, 22),
(176, 0, 0, 0, 0, 4, 23),
(177, 1, 1, 1, 1, 4, 24),
(178, 1, 1, 1, 1, 4, 25),
(179, 1, 1, 1, 1, 4, 26),
(180, 1, 1, 1, 1, 4, 27),
(181, 1, 1, 1, 1, 4, 28),
(182, 1, 1, 1, 1, 4, 29),
(183, 1, 1, 1, 1, 4, 30),
(184, 1, 1, 1, 1, 4, 31),
(185, 1, 1, 1, 1, 4, 32),
(186, 0, 0, 0, 0, 4, 33),
(187, 0, 0, 0, 0, 4, 34),
(188, 1, 1, 1, 1, 4, 35),
(189, 0, 0, 0, 0, 4, 36),
(190, 1, 1, 1, 1, 4, 37),
(191, 1, 1, 1, 1, 4, 38),
(192, 1, 1, 1, 1, 4, 39),
(193, 1, 1, 1, 1, 4, 40),
(194, 1, 1, 1, 1, 4, 41),
(195, 1, 1, 1, 1, 4, 42),
(196, 1, 1, 1, 1, 4, 43),
(197, 0, 0, 0, 0, 4, 44),
(198, 1, 1, 1, 1, 4, 45),
(199, 1, 1, 1, 1, 4, 46),
(200, 1, 1, 1, 1, 4, 47),
(201, 1, 1, 1, 1, 4, 48),
(202, 0, 0, 0, 0, 4, 49),
(203, 1, 1, 1, 1, 4, 50),
(204, 1, 1, 1, 1, 4, 51),
(205, 1, 1, 1, 1, 5, 1),
(206, 0, 0, 0, 0, 5, 2),
(207, 1, 1, 1, 1, 5, 3),
(208, 1, 1, 1, 1, 5, 4),
(209, 1, 1, 1, 1, 5, 5),
(210, 1, 1, 1, 1, 5, 6),
(211, 1, 1, 1, 1, 5, 7),
(212, 0, 0, 0, 0, 5, 8),
(213, 1, 1, 1, 1, 5, 9),
(214, 1, 1, 1, 1, 5, 10),
(215, 1, 1, 1, 1, 5, 11),
(216, 1, 1, 1, 1, 5, 12),
(217, 0, 0, 0, 0, 5, 13),
(218, 1, 1, 1, 1, 5, 14),
(219, 1, 1, 1, 1, 5, 15),
(220, 1, 1, 1, 1, 5, 16),
(221, 1, 1, 1, 1, 5, 17),
(222, 1, 1, 1, 1, 5, 18),
(223, 1, 1, 1, 1, 5, 19),
(224, 1, 1, 1, 1, 5, 20),
(225, 1, 1, 1, 1, 5, 21),
(226, 1, 1, 1, 1, 5, 22),
(227, 1, 1, 1, 1, 5, 23),
(228, 0, 0, 0, 0, 5, 24),
(229, 0, 0, 0, 0, 5, 25),
(230, 0, 0, 0, 0, 5, 26),
(231, 0, 0, 0, 0, 5, 27),
(232, 1, 1, 1, 1, 5, 28),
(233, 1, 1, 1, 1, 5, 29),
(234, 0, 0, 0, 0, 5, 30),
(235, 0, 0, 0, 0, 5, 31),
(236, 0, 0, 0, 0, 5, 32),
(237, 1, 1, 1, 1, 5, 33),
(238, 1, 1, 1, 1, 5, 34),
(239, 1, 1, 1, 1, 5, 35),
(240, 1, 1, 1, 1, 5, 36),
(241, 0, 0, 0, 0, 5, 37),
(242, 1, 1, 1, 1, 5, 38),
(243, 1, 1, 1, 1, 5, 39),
(244, 1, 1, 1, 1, 5, 40),
(245, 1, 1, 1, 1, 5, 41),
(246, 1, 1, 1, 1, 5, 42),
(247, 1, 1, 1, 1, 5, 43),
(248, 0, 0, 0, 0, 5, 44),
(249, 1, 1, 1, 1, 5, 45),
(250, 1, 1, 1, 1, 5, 46),
(251, 1, 1, 1, 1, 5, 47),
(252, 1, 1, 1, 1, 5, 48),
(253, 0, 0, 0, 0, 5, 49),
(254, 1, 1, 1, 1, 5, 50),
(255, 1, 1, 1, 1, 5, 51),
(256, 1, 1, 1, 1, 1, 52),
(257, 0, 0, 0, 0, 2, 52),
(258, 1, 1, 1, 1, 3, 52);

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
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `gus_id` bigint(20) NOT NULL,
  `gus_gpe_id` bigint(20) DEFAULT NULL,
  `gus_imagen` varchar(200) DEFAULT NULL,
  `gus_gro_id` bigint(20) NOT NULL,
  `gus_user` varchar(100) NOT NULL,
  `gus_password` varchar(250) NOT NULL,
  `gus_token` varchar(300) DEFAULT NULL,
  `gus_create` datetime NOT NULL DEFAULT current_timestamp(),
  `gus_update` datetime NOT NULL DEFAULT current_timestamp(),
  `gus_telefono` varchar(20) DEFAULT NULL,
  `gus_gcl_id` bigint(20) NOT NULL,
  `gus_gar_id` bigint(20) NOT NULL,
  `gus_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='g';

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`gus_id`, `gus_gpe_id`, `gus_imagen`, `gus_gro_id`, `gus_user`, `gus_password`, `gus_token`, `gus_create`, `gus_update`, `gus_telefono`, `gus_gcl_id`, `gus_gar_id`, `gus_status`) VALUES
(1, 1, NULL, 1, 'admin@companycacel.com', '9e69e7e29351ad837503c44a5971edebc9b7e6d8601c89c284b1b59bf37afa80', '055e0be16265233e1f48-5153e62e7464c471bae0-e91b70804d3a84189850-83ff46c1c5a1ab0c670e', '2022-07-25 12:30:39', '2022-07-25 12:30:39', NULL, 1, 1, 1),
(2, 2, NULL, 2, 'mery.384@elplatanaldegraciela384.com', '6fcb6b16558579e3c5b98483266dae5775d3bf35010c9326c7297a4c8d08bda2', NULL, '2023-01-25 10:33:09', '2023-01-25 10:33:09', NULL, 1, 3, 1);

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
-- Indices de la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD PRIMARY KEY (`gac_id`),
  ADD KEY `accesos_usuarios` (`gac_gus_id`),
  ADD KEY `accesos_clientes` (`gac_gcl_id`);

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
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`gar_id`);

--
-- Indices de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD PRIMARY KEY (`asi_id`),
  ADD KEY `asistencias_colaboradores` (`asi_col_id`);

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
  ADD KEY `cajas_gt4monedas` (`caj_gt4_id`),
  ADD KEY `cajas_gusuarios` (`caj_gus_id`);

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
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`gcl_id`),
  ADD UNIQUE KEY `gcl_gem_id` (`gcl_gem_id`);

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
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`gde_id`);

--
-- Indices de la tabla `descuentos`
--
ALTER TABLE `descuentos`
  ADD PRIMARY KEY (`des_id`),
  ADD KEY `descuentos_t6medidas` (`des_t6m_id`),
  ADD KEY `descuentos_tgastos` (`des_tga_id`),
  ADD KEY `descuentos_movimientos` (`des_mov_id`);

--
-- Indices de la tabla `distritos`
--
ALTER TABLE `distritos`
  ADD PRIMARY KEY (`gdi_id`),
  ADD KEY `distritos_provincias` (`gdi_gpr_id`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`gem_id`),
  ADD KEY `empresas_distritos` (`gem_gdi_id`);

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
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`gmo_id`);

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
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`gpe_id`),
  ADD KEY `personas_distritos` (`gpe_gdi_id`),
  ADD KEY `personas_t2identidades` (`gpe_gt2_id`);

--
-- Indices de la tabla `ppagos`
--
ALTER TABLE `ppagos`
  ADD PRIMARY KEY (`ppa_id`),
  ADD KEY `ppagos_colaboradores` (`ppa_col_id`),
  ADD KEY `ppagos_cajas` (`ppa_caj_id`),
  ADD KEY `ppagos_usuarios` (`ppa_gus_id`);

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
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`gpr_id`),
  ADD KEY `provincias_distritos` (`gpr_gde_id`);

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
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`gro_id`);

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
-- Indices de la tabla `t2identidades`
--
ALTER TABLE `t2identidades`
  ADD PRIMARY KEY (`gt2_id`);

--
-- Indices de la tabla `t3financieras`
--
ALTER TABLE `t3financieras`
  ADD PRIMARY KEY (`t3f_id`);

--
-- Indices de la tabla `t4monedas`
--
ALTER TABLE `t4monedas`
  ADD PRIMARY KEY (`gt4_id`);

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
-- Indices de la tabla `tafectaciones`
--
ALTER TABLE `tafectaciones`
  ADD PRIMARY KEY (`gta_id`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`tar_id`),
  ADD KEY `tareas_gareas` (`tar_gar_id`);

--
-- Indices de la tabla `tcambios`
--
ALTER TABLE `tcambios`
  ADD PRIMARY KEY (`gtc_id`),
  ADD KEY `tcambios_t4monedas` (`gtc_gt4_id`);

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
-- Indices de la tabla `tpermisos`
--
ALTER TABLE `tpermisos`
  ADD PRIMARY KEY (`gtp_id`),
  ADD KEY `tpermisos_roles` (`gtp_gro_id`),
  ADD KEY `tpermisos_modulos` (`gtp_gmo_id`);

--
-- Indices de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD PRIMARY KEY (`ubi_id`),
  ADD KEY `ubicaciones_establecimientos` (`ubi_est_id`),
  ADD KEY `ubicaciones_gdistritos` (`ubi_gdi_id`),
  ADD KEY `ubicaciones_gareas` (`ubi_gar_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`gus_id`),
  ADD UNIQUE KEY `gus_gpe_id` (`gus_gpe_id`),
  ADD KEY `usuarios_roles` (`gus_gro_id`),
  ADD KEY `usuarios_clientes` (`gus_gcl_id`),
  ADD KEY `usuarios_areas` (`gus_gar_id`);

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
-- AUTO_INCREMENT de la tabla `accesos`
--
ALTER TABLE `accesos`
  MODIFY `gac_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `age_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `almacenes`
--
ALTER TABLE `almacenes`
  MODIFY `alm_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `gar_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `bbi_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `bienes`
--
ALTER TABLE `bienes`
  MODIFY `bie_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `cajas`
--
ALTER TABLE `cajas`
  MODIFY `caj_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cdetalles`
--
ALTER TABLE `cdetalles`
  MODIFY `cde_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cierremeses`
--
ALTER TABLE `cierremeses`
  MODIFY `cie_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `gcl_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `cue_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `gde_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `descuentos`
--
ALTER TABLE `descuentos`
  MODIFY `des_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `distritos`
--
ALTER TABLE `distritos`
  MODIFY `gdi_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250402;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `gem_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `establecimientos`
--
ALTER TABLE `establecimientos`
  MODIFY `est_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `liquidez`
--
ALTER TABLE `liquidez`
  MODIFY `liq_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mdetalles`
--
ALTER TABLE `mdetalles`
  MODIFY `mde_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `gmo_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `mov_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `gpe_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ppagos`
--
ALTER TABLE `ppagos`
  MODIFY `ppa_id` bigint(20) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `gpr_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2505;

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
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `gro_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- AUTO_INCREMENT de la tabla `t2identidades`
--
ALTER TABLE `t2identidades`
  MODIFY `gt2_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `t3financieras`
--
ALTER TABLE `t3financieras`
  MODIFY `t3f_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t4monedas`
--
ALTER TABLE `t4monedas`
  MODIFY `gt4_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `t5existencias`
--
ALTER TABLE `t5existencias`
  MODIFY `t5e_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `t6medidas`
--
ALTER TABLE `t6medidas`
  MODIFY `t6m_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

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
  MODIFY `t10_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

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
-- AUTO_INCREMENT de la tabla `tafectaciones`
--
ALTER TABLE `tafectaciones`
  MODIFY `gta_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `tar_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tcambios`
--
ALTER TABLE `tcambios`
  MODIFY `gtc_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tcespeciales`
--
ALTER TABLE `tcespeciales`
  MODIFY `tce_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tgastos`
--
ALTER TABLE `tgastos`
  MODIFY `tga_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `titulares`
--
ALTER TABLE `titulares`
  MODIFY `iti_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tpermisos`
--
ALTER TABLE `tpermisos`
  MODIFY `gtp_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  MODIFY `ubi_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `gus_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- Filtros para la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD CONSTRAINT `accesos_clientes` FOREIGN KEY (`gac_gcl_id`) REFERENCES `clientes` (`gcl_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `accesos_usuarios` FOREIGN KEY (`gac_gus_id`) REFERENCES `usuarios` (`gus_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `agentes_gempresas` FOREIGN KEY (`age_gem_id`) REFERENCES `empresas` (`gem_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `agentes_gpersonas` FOREIGN KEY (`age_gpe_id`) REFERENCES `personas` (`gpe_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `almacenes`
--
ALTER TABLE `almacenes`
  ADD CONSTRAINT `almacenes_estableciminetos` FOREIGN KEY (`alm_est_id`) REFERENCES `establecimientos` (`est_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `almacenes_gdistritos` FOREIGN KEY (`alm_gdi_id`) REFERENCES `distritos` (`gdi_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD CONSTRAINT `asistencias_ibfk_1` FOREIGN KEY (`asi_col_id`) REFERENCES `colaboradores` (`col_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `cajas_gt4monedas` FOREIGN KEY (`caj_gt4_id`) REFERENCES `t4monedas` (`gt4_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cajas_gusuarios` FOREIGN KEY (`caj_gus_id`) REFERENCES `usuarios` (`gus_id`) ON DELETE CASCADE ON UPDATE CASCADE,
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
  ADD CONSTRAINT `cdetalles_tafectaciones` FOREIGN KEY (`cde_gta_id`) REFERENCES `tafectaciones` (`gta_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cierremeses`
--
ALTER TABLE `cierremeses`
  ADD CONSTRAINT `cierremeses_almacenes` FOREIGN KEY (`cie_alm_id`) REFERENCES `almacenes` (`alm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cierremeses_bienes` FOREIGN KEY (`cie_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_empresas` FOREIGN KEY (`gcl_gem_id`) REFERENCES `empresas` (`gem_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `colaboradores`
--
ALTER TABLE `colaboradores`
  ADD CONSTRAINT `colaboradores_areas` FOREIGN KEY (`col_gar_id`) REFERENCES `areas` (`gar_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `colaboradores_establecimientos` FOREIGN KEY (`col_est_id`) REFERENCES `establecimientos` (`est_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `colaboradores_personas` FOREIGN KEY (`col_gpe_id`) REFERENCES `personas` (`gpe_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `comprobantes_gt4monedas` FOREIGN KEY (`com_gt4_id`) REFERENCES `t4monedas` (`gt4_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comprobantes_preliminares` FOREIGN KEY (`com_id`) REFERENCES `preliminares` (`pre_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comprobantes_t10comprobantes` FOREIGN KEY (`com_t10_id`) REFERENCES `t10comprobantes` (`t10_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comprobantes_t12operaciones` FOREIGN KEY (`com_t12_id`) REFERENCES `t12operaciones` (`t12_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comprobantes_t1mediospagos` FOREIGN KEY (`com_t1m_id`) REFERENCES `t1mediopagos` (`t1m_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD CONSTRAINT `cuentas_gempresas` FOREIGN KEY (`cue_gem_id`) REFERENCES `empresas` (`gem_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cuentas_gt4monedas` FOREIGN KEY (`cue_gt4_id`) REFERENCES `t4monedas` (`gt4_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `descuentos`
--
ALTER TABLE `descuentos`
  ADD CONSTRAINT `descuentos_movimientos` FOREIGN KEY (`des_mov_id`) REFERENCES `movimientos` (`mov_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `descuentos_t6medidas` FOREIGN KEY (`des_t6m_id`) REFERENCES `t6medidas` (`t6m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `descuentos_tgastos` FOREIGN KEY (`des_tga_id`) REFERENCES `tgastos` (`tga_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `distritos`
--
ALTER TABLE `distritos`
  ADD CONSTRAINT `distritos_provincias` FOREIGN KEY (`gdi_gpr_id`) REFERENCES `provincias` (`gpr_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `empresas_distritos` FOREIGN KEY (`gem_gdi_id`) REFERENCES `distritos` (`gdi_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `establecimientos`
--
ALTER TABLE `establecimientos`
  ADD CONSTRAINT `establecimientos_gdistritos` FOREIGN KEY (`est_gdi_id`) REFERENCES `distritos` (`gdi_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `mdetalles_tafectaciones` FOREIGN KEY (`mde_gta_id`) REFERENCES `tafectaciones` (`gta_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `movimientos_cuentas` FOREIGN KEY (`mov_cue_id`) REFERENCES `cuentas` (`cue_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_gt4monedas` FOREIGN KEY (`mov_gt4_id`) REFERENCES `t4monedas` (`gt4_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_gusuarios` FOREIGN KEY (`mov_gus_id`) REFERENCES `usuarios` (`gus_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_t10comprobantes` FOREIGN KEY (`mov_t10_id`) REFERENCES `t10comprobantes` (`t10_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_t12operaciones` FOREIGN KEY (`mov_t12_id`) REFERENCES `t12operaciones` (`t12_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_tcespeciales` FOREIGN KEY (`mov_tce_id`) REFERENCES `tcespeciales` (`tce_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `personas_distritos` FOREIGN KEY (`gpe_gdi_id`) REFERENCES `distritos` (`gdi_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `personas_t2identidades` FOREIGN KEY (`gpe_gt2_id`) REFERENCES `t2identidades` (`gt2_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ppagos`
--
ALTER TABLE `ppagos`
  ADD CONSTRAINT `ppagos_ibfk_1` FOREIGN KEY (`ppa_col_id`) REFERENCES `colaboradores` (`col_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ppagos_ibfk_2` FOREIGN KEY (`ppa_caj_id`) REFERENCES `cajas` (`caj_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ppagos_ibfk_3` FOREIGN KEY (`ppa_gus_id`) REFERENCES `usuarios` (`gus_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD CONSTRAINT `provincias_distritos` FOREIGN KEY (`gpr_gde_id`) REFERENCES `departamentos` (`gde_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `responsables`
--
ALTER TABLE `responsables`
  ADD CONSTRAINT `responsables_gusuarios` FOREIGN KEY (`res_gus_gpe_id`) REFERENCES `usuarios` (`gus_gpe_id`) ON DELETE CASCADE ON UPDATE CASCADE,
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
  ADD CONSTRAINT `tareas_gareas` FOREIGN KEY (`tar_gar_id`) REFERENCES `areas` (`gar_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tcambios`
--
ALTER TABLE `tcambios`
  ADD CONSTRAINT `tcambios_t4monedas` FOREIGN KEY (`gtc_gt4_id`) REFERENCES `t4monedas` (`gt4_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tcespeciales`
--
ALTER TABLE `tcespeciales`
  ADD CONSTRAINT `tcespeciales_gtcambios` FOREIGN KEY (`tce_gtc_id`) REFERENCES `tcambios` (`gtc_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `titulares`
--
ALTER TABLE `titulares`
  ADD CONSTRAINT `titulares_bienes` FOREIGN KEY (`iti_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `titulares_colaboradores` FOREIGN KEY (`iti_col_id`) REFERENCES `colaboradores` (`col_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `titulares_componentes` FOREIGN KEY (`iti_ico_id`) REFERENCES `componentes` (`ico_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tpermisos`
--
ALTER TABLE `tpermisos`
  ADD CONSTRAINT `tpermisos_modulos` FOREIGN KEY (`gtp_gmo_id`) REFERENCES `modulos` (`gmo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tpermisos_roles` FOREIGN KEY (`gtp_gro_id`) REFERENCES `roles` (`gro_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_areas` FOREIGN KEY (`gus_gar_id`) REFERENCES `areas` (`gar_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_clientes` FOREIGN KEY (`gus_gcl_id`) REFERENCES `clientes` (`gcl_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_personas` FOREIGN KEY (`gus_gpe_id`) REFERENCES `personas` (`gpe_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_roles` FOREIGN KEY (`gus_gro_id`) REFERENCES `roles` (`gro_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
