-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 23-01-2023 a las 16:06:57
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
-- Base de datos: `u125097058_elplatanal`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` bigint(20) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `portada` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `ruta` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombre`, `descripcion`, `portada`, `datecreated`, `ruta`, `status`) VALUES
(1, 'CONVENCIONAL', 'Plátanos convencionales', 'portada_categoria.png', '2021-07-21 22:38:51', 'convencional', 1),
(2, 'BOMBITA', 'Plátanos Bombita', 'portada_categoria.jpg', '2021-07-21 22:39:17', 'bombita', 1),
(3, 'BETA', 'Plátanos Beta', 'portada_categoria.png', '2021-07-21 22:39:43', 'beta', 1),
(4, 'JUMBO', 'Plátanos Jumbo', 'portada_categoria.png', '2021-07-21 22:40:42', 'jumbo', 1),
(5, 'TRIPLE', 'Plátanos Triple', 'portada_categoria.png', '2021-07-21 22:41:19', 'triple', 1),
(18, 'GASEOSA', 'GASEOSA DE PET', 'portada_categoria.png', '2022-01-11 13:15:57', 'gaseosa', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` bigint(20) NOT NULL,
  `pedidoid` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido_prov`
--

CREATE TABLE `detalle_pedido_prov` (
  `id` bigint(20) NOT NULL,
  `pedidoprov_id` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioFlete` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `observacion` varchar(300) COLLATE utf8mb4_swedish_ci NOT NULL,
  `personaid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `detalle_pedido_prov`
--

INSERT INTO `detalle_pedido_prov` (`id`, `pedidoprov_id`, `productoid`, `precio`, `cantidad`, `precioFlete`, `total`, `observacion`, `personaid`) VALUES
(1, 2, 21, '27.00', 69, '5.50', '1863.00', ' ', 0),
(2, 2, 23, '48.00', 37, '5.50', '1776.00', ' ', 0),
(3, 2, 22, '40.00', 17, '5.50', '680.00', ' ', 0),
(4, 2, 25, '5.50', 2, '5.50', '11.00', ' ', 0),
(5, 2, 24, '28.00', 1, '5.50', '28.00', ' ', 0),
(6, 4, 4, '15.00', 143, '4.00', '2145.00', ' ', 0),
(7, 4, 31, '13.00', 1, '4.00', '13.00', ' ', 0),
(8, 4, 1, '11.50', 54, '4.00', '621.00', ' ', 0),
(9, 4, 2, '18.00', 35, '4.00', '630.00', ' ', 0),
(10, 4, 24, '25.00', 4, '5.50', '100.00', ' ', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id` bigint(20) NOT NULL,
  `ventaId` bigint(20) NOT NULL,
  `productoId` bigint(20) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

CREATE TABLE `imagen` (
  `id` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `img` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `idmodulo` bigint(20) NOT NULL,
  `titulo` varchar(50) COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`idmodulo`, `titulo`, `descripcion`, `status`) VALUES
(1, 'Dashboard', 'Dashboard', 1),
(2, 'Usuarios', 'Usuarios del sistema', 1),
(3, 'Clientes', 'Clientes del Platanal', 1),
(4, 'Productos', 'Todos los productos', 1),
(5, 'Proveedores', 'Proveedores del platanal', 1),
(6, 'Caterogías', 'Caterogías Productos', 1),
(7, 'Prestamos', 'Préstamo a Proveedores', 1),
(8, 'Venta', 'Modulo de venta', 1),
(9, 'Pedido a Proveedores', 'Generar pedido de abastecimiento de productos a proveedores', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idpedido` bigint(20) NOT NULL,
  `referenciacobro` varchar(255) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `idtransaccionpaypal` varchar(255) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `datospaypal` text COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `personaid` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `costo_envio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `monto` decimal(11,2) NOT NULL,
  `tipopagoid` bigint(20) NOT NULL,
  `direccion_envio` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_prov`
--

CREATE TABLE `pedido_prov` (
  `idpedido_prov` bigint(20) NOT NULL,
  `proveedorid` bigint(20) NOT NULL,
  `fecha_pedido` date NOT NULL,
  `fecha_pago` date NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `flete` decimal(10,2) NOT NULL,
  `comision` decimal(11,2) NOT NULL,
  `cajon1` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `cajon2` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `cajon3` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `papel1` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `papel2` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `bolsa` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `montogasto` decimal(10,2) NOT NULL,
  `montoParcial` decimal(11,2) NOT NULL,
  `adelanto` decimal(10,2) NOT NULL,
  `descuento` decimal(10,2) NOT NULL,
  `ImporteTotal` decimal(10,2) NOT NULL,
  `observacion` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `importeFinal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `pedido_prov`
--

INSERT INTO `pedido_prov` (`idpedido_prov`, `proveedorid`, `fecha_pedido`, `fecha_pago`, `subtotal`, `flete`, `comision`, `cajon1`, `cajon2`, `cajon3`, `papel1`, `papel2`, `bolsa`, `montogasto`, `montoParcial`, `adelanto`, `descuento`, `ImporteTotal`, `observacion`, `importeFinal`) VALUES
(2, 67, '2021-10-30', '2021-11-02', '4358.00', '693.00', '126.00', 'TRIPLE> 90 X 3.7 = 333', '0', '0', 'BLANCO> 1 X 120 = 120', '0', 'Seleccione> 0 X 0 = 0', '1272.00', '3086.00', '0.00', '0.00', '2886.00', '', '2886.00'),
(4, 121, '2021-10-31', '2021-11-02', '3509.00', '954.00', '237.00', '0', '0', '0', '0', '0', '0', '1191.00', '2318.00', '0.00', '0.00', '2318.00', '', '2318.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `idpermiso` bigint(20) NOT NULL,
  `rolid` bigint(20) NOT NULL,
  `moduloid` bigint(20) NOT NULL,
  `r` int(11) NOT NULL DEFAULT 0,
  `w` int(11) NOT NULL DEFAULT 0,
  `u` int(11) NOT NULL DEFAULT 0,
  `d` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`idpermiso`, `rolid`, `moduloid`, `r`, `w`, `u`, `d`) VALUES
(698, 3, 1, 1, 0, 0, 0),
(699, 3, 2, 0, 0, 0, 0),
(700, 3, 3, 0, 0, 0, 0),
(701, 3, 4, 1, 0, 0, 0),
(702, 3, 5, 1, 0, 0, 0),
(703, 3, 6, 0, 0, 0, 0),
(716, 7, 1, 1, 0, 0, 0),
(717, 7, 2, 0, 0, 0, 0),
(718, 7, 3, 0, 0, 0, 0),
(719, 7, 4, 0, 0, 0, 0),
(720, 7, 5, 1, 0, 0, 0),
(721, 7, 6, 0, 0, 0, 0),
(743, 2, 1, 1, 0, 0, 0),
(744, 2, 2, 0, 0, 0, 0),
(745, 2, 3, 0, 0, 0, 0),
(746, 2, 4, 0, 0, 0, 0),
(747, 2, 5, 0, 0, 0, 0),
(748, 2, 6, 0, 0, 0, 0),
(749, 2, 7, 0, 0, 0, 0),
(811, 1, 1, 1, 1, 1, 1),
(812, 1, 2, 1, 1, 1, 1),
(813, 1, 3, 1, 1, 1, 1),
(814, 1, 4, 1, 1, 1, 1),
(815, 1, 5, 1, 1, 1, 1),
(816, 1, 6, 1, 1, 1, 1),
(817, 1, 7, 1, 1, 1, 1),
(818, 1, 8, 1, 1, 1, 1),
(819, 1, 9, 1, 1, 1, 1),
(847, 5, 1, 0, 0, 0, 0),
(848, 5, 2, 0, 0, 0, 0),
(849, 5, 3, 0, 0, 0, 0),
(850, 5, 4, 0, 0, 0, 0),
(851, 5, 5, 0, 0, 0, 0),
(852, 5, 6, 0, 0, 0, 0),
(853, 5, 7, 0, 0, 0, 0),
(854, 5, 8, 0, 0, 0, 0),
(855, 5, 9, 0, 0, 0, 0),
(874, 9, 1, 1, 0, 0, 0),
(875, 9, 2, 1, 0, 0, 0),
(876, 9, 3, 1, 1, 1, 0),
(877, 9, 4, 1, 1, 1, 1),
(878, 9, 5, 1, 1, 1, 1),
(879, 9, 6, 1, 1, 1, 1),
(880, 9, 7, 1, 1, 1, 1),
(881, 9, 8, 0, 0, 0, 0),
(882, 9, 9, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` bigint(20) NOT NULL,
  `identificacion` varchar(30) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `nombres` varchar(80) COLLATE utf8mb4_swedish_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `f_nacimiento` date NOT NULL,
  `tipo_cliente` varchar(60) COLLATE utf8mb4_swedish_ci NOT NULL,
  `email_user` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `password` varchar(75) COLLATE utf8mb4_swedish_ci NOT NULL,
  `nit` varchar(20) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `nombrefiscal` varchar(80) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `direccionfiscal` varchar(100) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `nomb_marca` varchar(60) COLLATE utf8mb4_swedish_ci NOT NULL,
  `num_cuenta` varchar(60) COLLATE utf8mb4_swedish_ci NOT NULL,
  `prestamo` decimal(10,2) NOT NULL,
  `token` varchar(100) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `rolid` bigint(20) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `identificacion`, `nombres`, `apellidos`, `telefono`, `f_nacimiento`, `tipo_cliente`, `email_user`, `password`, `nit`, `nombrefiscal`, `direccionfiscal`, `nomb_marca`, `num_cuenta`, `prestamo`, `token`, `rolid`, `datecreated`, `status`) VALUES
(1, '2409198920', 'Admin', 'Platanal De Graciela', 1234567, '2018-07-17', '', 'elplatanaldegraciela384.1@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '24252622', 'Abel OSH', 'Antigua Guatemala', '', '', '0.00', '', 1, '2020-08-13 00:51:44', 1),
(2, '65465465', 'Johan Chanel', 'Perez', 987846545, '0000-00-00', '', 'pjohan831@gmail.com', '686dd4419d5da11febc928e2f4df2daa16dd8e3d6b8201b80abf99a32f4d4b83', '', '', '', '', '', '0.00', '', 1, '2020-08-22 00:27:17', 1),
(3, '77419034', 'MERY INGRID', 'SURCO CRUZ', 936585176, '2021-10-19', '', 'ingridsurco.c@gmail.com', '971d26d38a251922a7540eba7b3f08bce438503c6d202e8c45ad4bf55b745e51', NULL, NULL, NULL, '', '', '0.00', NULL, 9, '2021-10-07 17:24:31', 1),
(4, '76771309', 'Elias', 'Anaya C', 983830234, '0000-00-00', '', 'eliasconelan@gmail.com', 'a6e8639a2e40e9f9b3032b9a4615bf98cd217ab61e332ddff7dbdd32ba25f67d', NULL, NULL, NULL, '', '', '0.00', NULL, 1, '2021-10-12 03:56:18', 1),
(5, '77777777', 'Sergio', 'Chávez Santos', 988770506, '0000-00-00', '', 'sergio@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, NULL, '', '', '0.00', NULL, 1, '2021-10-12 04:23:32', 1),
(6, '74945537', 'ABEL', 'SABINO AGUIRRE', 918237410, '2000-04-22', '', 'abels@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'LIHAN', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(7, '46825062', 'ADAN', 'TORRES VALLES', 917951783, '2000-09-02', '', 'adant@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'ATV', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(8, '23017007', 'AICSA', 'TIJERO TIRADO', 975804624, '2000-04-10', '', 'aicsat@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'SHAMBO', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(9, '75722984', 'ALDAIR ', 'PICON MAYS', 986947531, '0000-00-00', '', 'aldairp@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'GUTY', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(10, '23142083', 'ALDEGUNDO ', 'DAMACIO INOCENTE', 915126588, '2000-01-30', '', 'aldegundod@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'GUNDO', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(11, '22732112', 'ALEJANDRO ', 'LAVADO VALDIVIA', 0, '0000-00-00', '', 'alejandrol@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'LAVADO', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(12, '40753222', 'ALICIA', 'EVARISTO MARTIN', 962989121, '2000-12-18', '', 'aliciae@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', 'TINGO MARIA', 'JHAIR', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(13, '23015114', 'ANA ', 'ALEJO MILLAN', 941425927, '2000-05-08', '', 'anaa@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'ANNY', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(14, '41253467', 'ANTONIO ', 'ECHEVARRIA BERNARDO ', 991068889, '2000-03-20', '', 'antonioe@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'AEB', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(15, '22269975', 'ARMANDO ', 'RETIS ROSAS', 0, '2000-03-15', '', 'armandor@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'JHOR', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(16, '22981713', 'BENANCIO ', 'MELGAREJO SALAZAR', 945434554, '2000-04-01', '', 'benanciom@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'BMZ', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(17, '22660696', 'BENITO ', 'CUSQUI CAJAS', 937798333, '0000-00-00', '', 'benitoc@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'OSO', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(18, '23008086', 'BENITO ', 'HUAMANCAYO COLQUE', 953028126, '2000-03-29', '', 'benitoh@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'LIZET', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(19, '43812390', 'BENJAMIN', 'SANTOS OLIVAS', 932370081, '1980-04-02', '', 'benjamins@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', 'TINGO MARIA', 'B', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(20, '40022853', 'CARLOS ', 'URDAY RUIZ', 936892668, '2000-12-17', '', 'carlosu@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'KELLY ', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(21, '23011675', 'CARMEN ', 'UZURIAGA CHAVEZ', 961710822, '0000-00-00', '', 'carmenu@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'KEVIN', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(22, '23005635', 'CELITH ', 'PIZARRO REATEGUI', 918482639, '2000-09-18', '', 'celithp@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'CELITH', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(23, '22709275', 'CELSO ', 'REYES SANTOS', 982833260, '0000-00-00', '', 'celsor@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'REYES', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(24, '22505133', 'CLORINDA ', 'MODESTO DAVILA', 999460825, '2000-12-31', '', 'clorindam@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'CMC', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(25, '48025117', 'CRISTIAN ', 'NAZARIO CRISPIN', 917937949, '2000-09-05', '', 'cristiann@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'CRISTIAN', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(26, '72747384', 'DAMIAN ', 'NAZAR VARGAS', 918237410, '2000-01-01', '', 'damiann@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'O', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(27, '44904182', 'DARWIN ', 'LINO ALARCON', 928991747, '2000-02-07', '', 'darwinl@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'DPLA', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(28, '22979460', 'DESIDERIO ', 'LOPEZ VARGAS', 962728030, '0000-00-00', '', 'desideriol@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'PROFE', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(29, '23009388', 'DESIDERIO ', 'TORRES GUEVARA', 991734979, '2000-10-05', '', 'desideriot@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'DTG', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(30, '45684070', 'DUVAL ', 'GUERRERO ABAD', 967458367, '2000-08-10', '', 'duvalg@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'C', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(31, '76401829', 'EDEBELTON ', 'VENTURA AQUINO', 930376117, '2000-05-16', '', 'edebeltonv@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'VENTURA', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(32, '43467349', 'EDGAR ', 'NAZAR VARGAS', 918237410, '2000-02-12', '', 'edgarn@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'E', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(33, '47714040', 'EDUARDO ', 'JUAREZ CABRERA', 973743025, '2000-11-08', '', 'eduardoj@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'WCS', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(34, '27292828', 'ELEUTERIO ', 'CHUQUICAHUA QUINTO', 920536172, '2000-10-20', '', 'eleuterioc@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'LINO', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(35, '46226891', 'ELIAS ', 'SANTAMARIA GUARDIAN', 914703500, '2000-03-02', '', 'eliass@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'ELIAS', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(36, '48758041', 'ELIAS ', 'SIMON ALMO', 992730995, '2000-08-01', '', 'eliass@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'BAS', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(37, '23015028', 'ELISA ', 'BENANCIO ROMERO', 932645527, '2000-07-05', '', 'elisab@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'IB', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(38, '44468572', 'ELMER ', 'CAJAS TUCTO', 935289760, '2000-04-26', '', 'elmerc@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'JTT', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(39, '46620516', 'ELVIS ', 'NAZARIO CRISPIN', 974985482, '2000-11-24', '', 'elvisn@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'ELVIS', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(40, '48410348', 'EMERSON', 'SANCHEZ TRINIDAD', 932889992, '1990-11-14', '', 'emersons@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', 'TINGO MARIA', 'YEYKO', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(41, '9536171', 'EMILIA ', 'GUARDIAN BEDOYA', 958488253, '2000-05-22', '', 'emiliag@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'BEDOYA', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(42, '22983364', 'ERNESTO ', 'MAYS ALVARADO', 971551007, '2000-04-05', '', 'ernestom@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'MAYS', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(43, '23014091', 'EUGENIA', 'BENANCIO DE SANTAMARIA', 992501713, '2000-09-06', '', 'eugeniab@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', 'TINGO MARIA', 'YESLIN', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(44, '22979406', 'EUGENIA', 'SANCHES BLAS', 939859180, '1992-09-06', '', 'eugenias@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', 'TINGO MARIA', 'BLAS', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(45, '43391160', 'EUGENIO ', 'SANTAMARIA BAYLON', 950270162, '2000-09-12', '', 'eugenios@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'BAYLOJ', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(46, '41289794', 'EVER ', 'REYES MOLINA', 928322475, '2000-12-02', '', 'everr@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'ANAI', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(47, '915831', 'FELIX ', 'RUIZ SANCHEZ', 0, '2000-07-24', '', 'felixr@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'FRS', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(48, '47211409', 'FERRER ', 'SANTOS OLIVAS', 955670734, '2000-04-05', '', 'ferrers@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'Z', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(49, '46707235', 'FIORELLA ', 'PANDURO URDAY', 972457547, '0000-00-00', '', 'fiorellap@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'PU', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(50, '23005746', 'FLAVIO ', 'URDAY RUIZ', 932600087, '2000-01-25', '', 'flaviou@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'F', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(51, '48249040', 'FRANCISCO ', 'ESPINOZA ALANIA', 958717022, '2000-12-10', '', 'franciscoe@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'EAJ', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(52, '22981435', 'GENARO ', 'ISUZA RENGITO', 0, '2000-11-08', '', 'genaroi@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'ADRI', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(53, '23001544', 'GENOVEVA ', 'RIOS GATICA', 982446540, '2000-01-15', '', 'genovevar@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'RIOS', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(54, '44636078', 'GUSTAVO ', 'SANTAMARIA BENANCIO', 943338218, '2000-11-19', '', 'gustavos@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'KRIS', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(55, '43815490', 'HAMILTON ', 'ESPINOZA ALANIA', 961260701, '2000-09-14', '', 'hamiltone@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'ERA', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(56, '41086220', 'HECTOR ', 'GARCIA RIVERA', 962736672, '0000-00-00', '', 'hectorg@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'BILL', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(57, '42604202', 'HERMELINDA ', 'SIMON RAMOS', 935537400, '2000-07-07', '', 'hermelindas@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'EMELY', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(58, '22496554', 'HONORATO ', 'ARCE SANTAMARIA', 917083050, '2000-02-08', '', 'honoratoa@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'ARCE', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(59, '9627530', 'IGNACIO ', 'GUERRA LOZANO', 918482639, '2000-11-26', '', 'ignaciog@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'NACHO', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(60, '76985141', 'IVAN ', 'BUSTAMANTE ADAN', 957692729, '2000-06-10', '', 'ivanb@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'KIMI', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(61, '23020022', 'JACINTO ', 'LAZO GONZALES', 930381889, '2000-08-17', '', 'jacintol@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'DELICIAS', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(62, '22473868', 'JACINTO ', 'SANTAMARIA FALCON', 963742657, '2000-07-03', '', 'jacintos@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'JSF', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(63, '76912750', 'JACK ', 'GALLARDO TAPULLIMA', 984036381, '2000-08-17', '', 'jackg@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'JACK', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(64, '73307172', 'JESSICA ', 'DAMACIO RUEDA', 915126588, '2000-03-29', '', 'jessicad@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'G', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(65, '42825909', 'JES?S ', 'MORALES MARTEL', 991051704, '2000-12-25', '', 'jes?sm@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'OLEK', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(66, '42716988', 'JHANET ', 'AMPUDIA INGA', 914389621, '2000-09-26', '', 'jhaneta@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'D', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(67, '41771082', 'JORGE ', 'LUIS EVARISTO VICENTE', 958529013, '2000-04-04', '', 'jorgel@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'JLE', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(68, '80357959', 'JOSE ', 'GABRIEL REYEZ ZEA', 925600250, '2000-11-16', '', 'joseg@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'ZEA', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(69, '40571449', 'JOSE ', 'RUIZ BARDALES', 956763044, '2000-06-19', '', 'joser@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'JDR', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(70, '43390023', 'JUAN ', 'CONDEZO CRISPIN', 921974783, '2000-05-10', '', 'juanc@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'J', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(71, '47115681', 'JUAN ', 'JUSTO FALCON', 944021174, '2000-05-22', '', 'juanj@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'JUSTO', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(72, '22983207', 'JUANA ', 'TRINIDAD BERROSPI', 984036381, '2000-10-23', '', 'juanat@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'THIAGO', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(73, '23014071', 'JUSTINIANO', 'SANTAMARIA MARTIN', 940156167, '1990-04-11', '', 'justinianos@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', 'Tingo Maria', 'JHOSEPH', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(74, '45436309', 'KENNEDY ', 'SANCHEZ ROMERO', 979960774, '2000-11-11', '', 'kennedys@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'KSR', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(75, '43580146', 'LENIN ', 'LAVADO CALIXTO', 999186194, '2000-03-18', '', 'leninl@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'LENIN', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(76, '23020985', 'LEONCIO ', 'CANALES SHAPIAMA', 957212049, '2000-03-23', '', 'leoncioc@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'DYLAN', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(77, '48257885', 'LEYDI ', 'RAIMUNDO HUAMAN', 961260701, '2000-09-26', '', 'leydir@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'LEYDI', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(78, '74950844', 'LIZETH ', 'CONDEZO AMPUDIA', 914389621, '2000-10-13', '', 'lizethc@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'LCA', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(79, '44999772', 'LUCER ', 'RETIS ROJAS', 930381816, '2000-05-01', '', 'lucerr@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'JAELY', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(80, '40741783', 'LUDIZ ', 'MELGAREJO LAVADO', 942416727, '2000-12-29', '', 'ludizm@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'GEMELOS', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(81, '42101980', 'LUIS ', 'ARAUJO ALEJO', 987426128, '2000-10-10', '', 'luisa@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'LUIS ANDRES', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(82, '22645582', 'LUIS ', 'CELADITA GASPAR', 967587370, '2000-09-07', '', 'luisc@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'MAYCOL', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(83, '23005560', 'LUIS ', 'RUIZ SEYJAS', 962324793, '2000-10-18', '', 'luisr@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'LUIS E.', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(84, '76983814', 'LUY ', 'ARAUJO ILLGUA', 914381160, '2000-07-05', '', 'luya@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'JHON', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(85, '22515882', 'LUZMILA ', 'CLEMENTE DOLORES', 929476925, '2000-01-02', '', 'luzmilac@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'LCD', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(86, '47845098', 'MAGDALENA ', 'MEZA VILLAR', 952949489, '0000-00-00', '', 'magdalenam@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'MMV', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(87, '22980822', 'MARCELINO ', 'TRINIDAD AQUINO', 932889992, '2000-01-16', '', 'marcelinot@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'PT', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(88, '43584173', 'MARCO ', 'ANTONIO CACHAY OTELLANA', 917817509, '2000-03-27', '', 'marcoa@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'SANTA', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(89, '67158201', 'MARLEY ', 'ARAUJO ILLGUA', 940171572, '2000-10-01', '', 'marleya@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'MAR', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(90, '77140454', 'MARQUI?O ', 'CRISPIN AZADO', 993327200, '2000-08-09', '', 'marqui?oc@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'MCA', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(91, '46542491', 'MAYCOL ', 'MATOS RAFAEL', 942041653, '0000-00-00', '', 'maycolm@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'MATOS', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(92, '70318208', 'MICHEL ', 'GOMEZ CHAVEZ', 935572150, '2000-12-21', '', 'michelg@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'ASM', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(93, '46231362', 'MISAEL ', 'SIMON RAMOS', 927331152, '2000-11-23', '', 'misaels@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'MSR', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(94, '41017790', 'MOISES ', 'BETETA DEL AGUILA', 930381816, '2000-01-15', '', 'moisesb@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'MOICO', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(95, '40462279', 'NAVARRO ', 'VERAMENDI CARRILLO', 978138969, '2000-10-24', '', 'navarrov@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'VRA', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(96, '44258180', 'NELSON ', 'AMBICHO TINEO', 983268342, '2000-08-04', '', 'nelsona@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'NAT', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(97, '75699339', 'NELSON ', 'CONDEZO NAZARIO', 983811382, '2000-04-23', '', 'nelsonc@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'NCN', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(98, '22479757', 'NOE ', 'NAZARIO MATIAS', 928308404, '2000-08-18', '', 'noen@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'NOE ', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(99, '22979811', 'OTILIA ', 'REATEGUI CRISTANCHO', 918482639, '2000-05-24', '', 'otiliar@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'OTILIA', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(100, '47097501', 'RAUL ', 'VALLE QUINTANA', 914609738, '2000-07-29', '', 'raulv@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'VALLES', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(101, '22757395', 'RODOLFO ', 'GONZALES RAMIREZ', 940952957, '2000-08-12', '', 'rodolfog@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'RGR', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(102, '40810569', 'ROGELIO ', 'SANTAMARIA BENANCIO', 991986911, '2000-01-28', '', 'rogelios@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'JHOEL', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(103, '22984336', 'ROMULO ', 'PISCO AGUIRRE', 918279609, '2000-09-06', '', 'romulop@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'PISCO', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(104, '46471614', 'ROY ', 'ROJAS SOTO', 956329545, '2000-06-06', '', 'royr@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'RR', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(105, '45574373', 'ROY ', 'SANCHEZ PINEDO', 932638817, '2000-01-15', '', 'roys@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'ROY', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(106, '22980938', 'SABINO ', 'SIMON RIVERA', 984036381, '2000-12-30', '', 'sabinos@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'YAS ', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(107, '80366764', 'SAMUEL ', 'GUERRERO ABAD', 967458367, '2000-07-22', '', 'samuelg@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'A', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(108, '41248243', 'SAUL ', 'ESPINOZA QUISPE', 949141564, '2000-01-24', '', 'saule@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'TQM', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(109, '23005387', 'SEGUNDO ', 'MARTINES DEL AGUILA', 961505165, '2000-04-12', '', 'segundom@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'TANI', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(110, '23640636', 'SIMEON ', 'GALVEZ GUTIERREZ', 942774855, '2000-12-29', '', 'simeong@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'JGA', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(111, '41738402', 'SIMEON ', 'MORALES MARTEL', 966736092, '2000-02-18', '', 'simeonm@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'YAZURI', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(112, '22733236', 'SUICI ', 'CARBAJAL FALCON', 945724007, '2000-10-25', '', 'suicic@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'TEDDY', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(113, '22456650', 'TEODORO ', 'ISLA HUARANGA', 992811769, '0000-00-00', '', 'teodoroi@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'HUARANGA', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(114, '47858920', 'TEOFILO ', 'VASQUEZ CERIACO', 0, '2000-01-17', '', 'teofilov@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'MARYORIT', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(115, '22984736', 'TOMAS ', 'TAPULLIMAC JESUS', 931562389, '2000-03-14', '', 'tomast@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'CHE', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(116, '22980828', 'WALDER ', 'ANGULO LOZANO', 990453094, '2000-01-24', '', 'waldera@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'YACORE', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(117, '45354105', 'WALTER ', 'ESPINOZA ALANIA', 967052961, '2000-09-18', '', 'waltere@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'NEYMAR', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(118, '73600338', 'YERSON ', 'CONDEZO CRISPIN', 931158779, '2000-06-08', '', 'yersonc@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'YCC', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(119, '43903963', 'YODIS ', 'CAJAS PRESENTACION', 936427986, '2000-03-06', '', 'yodisc@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'DH', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(120, '22965643', 'ZOCIMO', 'REYES FALCON', 984696571, '2000-06-19', '', 'zocimor@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', 'CARITO', '', '0.00', '', 5, '2021-10-28 00:00:00', 1),
(121, '47648798', 'YERSON', 'PINEDO ORTEGA', 922904700, '2000-05-03', '', 'yerson@gmail.com', '434b4934f967005c3dfd79107021ad6e17e0009e6eb7f8765f0a349b4fda3bab', NULL, NULL, 'TINGO MARIA', 'YPO', '', '0.00', NULL, 5, '2021-11-02 22:35:45', 1),
(122, '76771300', 'Elias', 'Anaya', 983830234, '2022-01-27', 'Tiburones', 'elias123@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '76771300', 'Elias', 'Avi Los rosales', '', '', '0.00', NULL, 7, '2022-01-11 13:07:46', 1),
(123, '76771301', 'Elias Hola', 'Hola', 985623851, '2022-01-27', '', 'holaelias@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, 'San Ramon', 'EliasH SAC', '421448579546', '0.00', NULL, 5, '2022-01-11 13:19:08', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `idprestamo` bigint(20) NOT NULL,
  `personaid` bigint(20) NOT NULL,
  `prestamo` float NOT NULL,
  `amortizacion` float NOT NULL,
  `ultima_amortizacion` decimal(10,2) NOT NULL,
  `deuda` float NOT NULL,
  `ruta` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `fecha_resgistro` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`idprestamo`, `personaid`, `prestamo`, `amortizacion`, `ultima_amortizacion`, `deuda`, `ruta`, `fecha_resgistro`, `status`) VALUES
(1, 56, 11000, 0, '0.00', 11000, '', '2021-11-02 20:50:21', 1),
(2, 67, 11200, 200, '0.00', 11000, '', '2021-11-02 20:51:42', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` bigint(20) NOT NULL,
  `categoriaid` bigint(20) NOT NULL,
  `codigo` varchar(30) COLLATE utf8mb4_swedish_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `imagen` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `ruta` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `categoriaid`, `codigo`, `nombre`, `descripcion`, `precio`, `stock`, `imagen`, `datecreated`, `ruta`, `status`) VALUES
(1, 1, 'PBICO', 'BIZCOCHO', 'Pl?tano Bizcocho', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Bizcocho', 1),
(2, 1, 'PMACO', 'MANZANO', 'Pl?tano Manzano', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Manzano', 1),
(3, 1, 'PISCO', 'ISLA', 'Pl?tano Isla', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Isla', 1),
(4, 1, 'PBECO', 'BELLACO', 'Pl?tano Bellaco', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Bellaco', 1),
(5, 1, 'PPACO', 'PALILLO', 'Pl?tano Palillo', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Palillo', 1),
(6, 2, 'PBIBO', 'BIZCOCHO', 'Pl?tano Bizcocho', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Bizcocho', 1),
(7, 2, 'PMABO', 'MANZANO', 'Pl?tano Manzano', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Manzano', 1),
(8, 2, 'PISBO', 'ISLA', 'Pl?tano Isla', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Isla', 1),
(9, 2, 'PBEBO', 'BELLACO', 'Pl?tano Bellaco', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Bellaco', 1),
(10, 2, 'PPABO', 'PALILLO', 'Pl?tano Palillo', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Palillo', 1),
(11, 3, 'PBIBE', 'BIZCOCHO', 'Pl?tano Bizcocho', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Bizcocho', 1),
(12, 3, 'PMABE', 'MANZANO', 'Pl?tano Manzano', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Manzano', 1),
(13, 3, 'PISBE', 'ISLA', 'Pl?tano Isla', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Isla', 1),
(14, 3, 'PBEBE', 'BELLACO', 'Pl?tano Bellaco', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Bellaco', 1),
(15, 3, 'PPABE', 'PALILLO', 'Pl?tano Palillo', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Palillo', 1),
(16, 4, 'PBIJU', 'BIZCOCHO', 'Pl?tano Bizcocho', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Bizcocho', 1),
(17, 4, 'PMAJU', 'MANZANO', 'Pl?tano Manzano', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Manzano', 1),
(18, 4, 'PISJU', 'ISLA', 'Pl?tano Isla', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Isla', 1),
(19, 4, 'PBEJU', 'BELLACO', 'Pl?tano Bellaco', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Bellaco', 1),
(20, 4, 'PPAJU', 'PALILLO', 'Pl?tano Palillo', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Palillo', 1),
(21, 5, 'PBITR', 'BIZCOCHO', 'Pl?tano Bizcocho', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Bizcocho', 1),
(22, 5, 'PMATR', 'MANZANO', 'Pl?tano Manzano', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Manzano', 1),
(23, 5, 'PISTR', 'ISLA', 'Pl?tano Isla', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Isla', 1),
(24, 5, 'PBETR', 'BELLACO', 'Pl?tano Bellaco', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Bellaco', 1),
(25, 5, 'PPATR', 'PALILLO', 'Pl?tano Palillo', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Palillo', 1),
(26, 1, 'PMOCO', 'MORADO', 'Pl?tano Morado Convencional', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Morado', 1),
(27, 2, 'PMOBO', 'MORADO', 'Pl?tano Morado Bombita', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Morado', 1),
(28, 3, 'PMOBE', 'MORADO', 'Pl?tano Morado Beta', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Morado', 1),
(29, 4, 'PMOJU', 'MORADO', 'Pl?tano Morado Jumbo', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Morado', 1),
(30, 5, 'PMOTR', 'MORADO', 'Pl?tano Morado Triple', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Morado', 1),
(31, 1, 'PSECO', 'SEDA', 'Pl?tano Seda Convencional', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Seda', 1),
(32, 2, 'PSEBO', 'SEDA', 'Pl?tano Seda Bombita', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Seda', 1),
(33, 3, 'PSEBE', 'SEDA', 'Pl?tano Seda Beta', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Seda', 1),
(34, 4, 'PSEJU', 'SEDA', 'Pl?tano Seda Jumbo', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Seda', 1),
(35, 5, 'PSETR', 'SEDA', 'Pl?tano Seda Triple', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Seda', 1),
(36, 1, 'PSACO', 'SAPITO', 'Pl?tano Sapito Convencional', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Sapito', 1),
(37, 2, 'PSABO', 'SAPITO', 'Pl?tano Sapito Bombita', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Sapito', 1),
(38, 3, 'PSABE', 'SAPITO', 'Pl?tano Sapito Beta', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Sapito', 1),
(39, 4, 'PSAJU', 'SAPITO', 'Pl?tano Sapito Jumbo', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Sapito', 1),
(40, 5, 'PSATR', 'SAPITO', 'Pl?tano Sapito Triple', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Sapito', 1),
(41, 1, 'PPACO', 'PAPAYA', 'Pl?tano Papaya Convencional', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Papaya', 1),
(42, 2, 'PPABO', 'PAPAYA', 'Pl?tano Papaya Bombita', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Papaya', 1),
(43, 3, 'PPABE', 'PAPAYA', 'Pl?tano Papaya Beta', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Papaya', 1),
(44, 4, 'PPAJU', 'PAPAYA', 'Pl?tano Papaya Jumbo', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Papaya', 1),
(45, 5, 'PPATR', 'PAPAYA', 'Pl?tano Papaya Triple', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Papaya', 1),
(46, 1, 'PCOCO', 'COCONA', 'Pl?tano Cocona Convencional', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Cocona', 1),
(47, 2, 'PCOBO', 'COCONA', 'Pl?tano Cocona Bombita', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Cocona', 1),
(48, 3, 'PCOBE', 'COCONA', 'Pl?tano Cocona Beta', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Cocona', 1),
(49, 4, 'PCOJU', 'COCONA', 'Pl?tano Cocona Jumbo', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Cocona', 1),
(50, 5, 'PCOTR', 'COCONA', 'Pl?tano Cocona Triple', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Cocona', 1),
(51, 1, 'PAGCO', 'AGUAJE', 'Pl?tano Aguaje Convencional', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Aguaje', 1),
(52, 2, 'PAGBO', 'AGUAJE', 'Pl?tano Aguaje Bombita', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Aguaje', 1),
(53, 3, 'PAGBE', 'AGUAJE', 'Pl?tano Aguaje Beta', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Aguaje', 1),
(54, 4, 'PAGJU', 'AGUAJE', 'Pl?tano Aguaje Jumbo', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Aguaje', 1),
(55, 5, 'PAGTR', 'AGUAJE', 'Pl?tano Aguaje Triple', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Aguaje', 1),
(56, 1, 'PPICO', 'PITUCA', 'Pl?tano Pituca Convencional', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Pituca', 1),
(57, 2, 'PPIBO', 'PITUCA', 'Pl?tano Pituca Bombita', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Pituca', 1),
(58, 3, 'PPIBE', 'PITUCA', 'Pl?tano Pituca Beta', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Pituca', 1),
(59, 4, 'PPIJU', 'PITUCA', 'Pl?tano Pituca Jumbo', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Pituca', 1),
(60, 5, 'PPITR', 'PITUCA', 'Pl?tano Pituca Triple', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Pituca', 1),
(61, 1, 'PTOCO', 'TORONJA', 'Pl?tano Toronja Convencional', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Toronja', 1),
(62, 2, 'PTOBO', 'TORONJA', 'Pl?tano Toronja Bombita', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Toronja', 1),
(63, 3, 'PTOBE', 'TORONJA', 'Pl?tano Toronja Beta', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Toronja', 1),
(64, 4, 'PTOJU', 'TORONJA', 'Pl?tano Toronja Jumbo', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Toronja', 1),
(65, 5, 'PTOTR', 'TORONJA', 'Pl?tano Toronja Triple', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Toronja', 1),
(66, 1, 'PLICO', 'LIBRE', 'Pl?tano Libre Convencional', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Libre', 1),
(67, 2, 'PLIBO', 'LIBRE', 'Pl?tano Libre Bombita', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Libre', 1),
(68, 3, 'PLIBE', 'LIBRE', 'Pl?tano Libre Beta', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Libre', 1),
(69, 4, 'PLIJU', 'LIBRE', 'Pl?tano Libre Jumbo', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'Libre', 1),
(70, 5, 'PLITR', 'LIBRE', '<p>Platano Libre Triple</p>', '0.00', 0, 'imagen.jpg', '0000-00-00 00:00:00', 'libre', 1),
(71, 1, 'GASEO', 'Gaseosa', '<p>Gaseosa Inka Cola</p>', '7.00', 30, '', '2022-01-11 13:13:03', 'gaseosa', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reembolso`
--

CREATE TABLE `reembolso` (
  `id` bigint(20) NOT NULL,
  `pedidoid` bigint(20) NOT NULL,
  `idtransaccion` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `datosreembolso` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `observacion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` varchar(150) COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `reembolso`
--

INSERT INTO `reembolso` (`id`, `pedidoid`, `idtransaccion`, `datosreembolso`, `observacion`, `status`) VALUES
(1, 13, '3YL95553L27747319', '{\"id\":\"3YL95553L27747319\",\"status\":\"COMPLETED\",\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/refunds\\/3YL95553L27747319\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/89T8947688556831X\",\"rel\":\"up\",\"method\":\"GET\"}]}', 'Descripcion reembolso', 'COMPLETED'),
(2, 17, '54U51016166442224', '{\"id\":\"54U51016166442224\",\"status\":\"COMPLETED\",\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/refunds\\/54U51016166442224\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/1RJ71409ML289001F\",\"rel\":\"up\",\"method\":\"GET\"}]}', 'Prueba Tienda Virtual', 'COMPLETED');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` bigint(20) NOT NULL,
  `nombrerol` varchar(50) COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `nombrerol`, `descripcion`, `status`) VALUES
(1, 'Administrador', 'Acceso a todo el sistema', 1),
(2, 'Supervisores', 'Supervisor de tienda', 1),
(3, 'Vendedores', 'Acceso a módulo ventas', 2),
(4, 'Servicio al cliente', 'Servicio al cliente sistema', 2),
(5, 'Proveedor', 'Proveedores de negocio', 1),
(6, 'Resporteria', 'Resporteria Sistema', 2),
(7, 'Cliente', 'Clientes tienda', 1),
(8, 'Ejemplo rol', 'Ejemplo rol sitema', 0),
(9, 'Coordinador', 'Coordinador', 1),
(10, 'Consulta Ventas', 'Consulta Ventas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suscripciones`
--

CREATE TABLE `suscripciones` (
  `idsuscripcion` bigint(20) NOT NULL,
  `nombre` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopago`
--

CREATE TABLE `tipopago` (
  `idtipopago` bigint(20) NOT NULL,
  `tipopago` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `tipopago`
--

INSERT INTO `tipopago` (`idtipopago`, `tipopago`, `status`) VALUES
(1, 'PayPal', 1),
(2, 'Efectivo', 1),
(3, 'Tarjeta', 1),
(4, 'Cheque', 1),
(5, 'Despósito Bancario', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` bigint(20) NOT NULL,
  `Monto_total` decimal(10,2) NOT NULL,
  `usuarioId` bigint(20) NOT NULL,
  `fecha_venta` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `Monto_total`, `usuarioId`, `fecha_venta`) VALUES
(1, '529.00', 2, '2021-10-12 06:14:55');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedidoid` (`pedidoid`),
  ADD KEY `productoid` (`productoid`);

--
-- Indices de la tabla `detalle_pedido_prov`
--
ALTER TABLE `detalle_pedido_prov`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productoid` (`productoid`),
  ADD KEY `pedidoprov_id` (`pedidoprov_id`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ventaId` (`ventaId`) USING BTREE,
  ADD KEY `productoId` (`productoId`) USING BTREE;

--
-- Indices de la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productoid` (`productoid`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`idmodulo`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idpedido`),
  ADD KEY `personaid` (`personaid`),
  ADD KEY `tipopagoid` (`tipopagoid`);

--
-- Indices de la tabla `pedido_prov`
--
ALTER TABLE `pedido_prov`
  ADD PRIMARY KEY (`idpedido_prov`),
  ADD KEY `proveedorid` (`proveedorid`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`idpermiso`),
  ADD KEY `rolid` (`rolid`),
  ADD KEY `moduloid` (`moduloid`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`),
  ADD KEY `rolid` (`rolid`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`idprestamo`),
  ADD KEY `personaid` (`personaid`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `categoriaid` (`categoriaid`);

--
-- Indices de la tabla `reembolso`
--
ALTER TABLE `reembolso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedidoid` (`pedidoid`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `suscripciones`
--
ALTER TABLE `suscripciones`
  ADD PRIMARY KEY (`idsuscripcion`);

--
-- Indices de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  ADD PRIMARY KEY (`idtipopago`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `usuarioId` (`usuarioId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido_prov`
--
ALTER TABLE `detalle_pedido_prov`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `idmodulo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idpedido` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido_prov`
--
ALTER TABLE `pedido_prov`
  MODIFY `idpedido_prov` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `idpermiso` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=883;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `idprestamo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de la tabla `reembolso`
--
ALTER TABLE `reembolso`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `suscripciones`
--
ALTER TABLE `suscripciones`
  MODIFY `idsuscripcion` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  MODIFY `idtipopago` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido_prov`
--
ALTER TABLE `detalle_pedido_prov`
  ADD CONSTRAINT `detalle_pedido_prov_ibfk_2` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_pedido_prov_ibfk_3` FOREIGN KEY (`pedidoprov_id`) REFERENCES `pedido_prov` (`idpedido_prov`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`productoId`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`ventaId`) REFERENCES `venta` (`id_venta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`personaid`) REFERENCES `persona` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`tipopagoid`) REFERENCES `tipopago` (`idtipopago`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido_prov`
--
ALTER TABLE `pedido_prov`
  ADD CONSTRAINT `pedido_prov_ibfk_1` FOREIGN KEY (`proveedorid`) REFERENCES `persona` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`moduloid`) REFERENCES `modulo` (`idmodulo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`personaid`) REFERENCES `persona` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoriaid`) REFERENCES `categoria` (`idcategoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`usuarioId`) REFERENCES `persona` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
