-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 01-02-2023 a las 15:38:19
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
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `gus_id` bigint NOT NULL,
  `gus_gpe_id` bigint DEFAULT NULL,
  `gus_imagen` varchar(200) DEFAULT NULL,
  `gus_gro_id` bigint NOT NULL,
  `gus_user` varchar(100) NOT NULL,
  `gus_password` varchar(250) NOT NULL,
  `gus_token` varchar(300) DEFAULT NULL,
  `gus_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gus_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gus_telefono` varchar(20) DEFAULT NULL,
  `gus_gcl_id` bigint NOT NULL,
  `gus_gar_id` bigint NOT NULL,
  `gus_status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`gus_id`, `gus_gpe_id`, `gus_imagen`, `gus_gro_id`, `gus_user`, `gus_password`, `gus_token`, `gus_create`, `gus_update`, `gus_telefono`, `gus_gcl_id`, `gus_gar_id`, `gus_status`) VALUES
(1, 1, NULL, 1, 'admin@companycacel.com', '9e69e7e29351ad837503c44a5971edebc9b7e6d8601c89c284b1b59bf37afa80', '055e0be16265233e1f48-5153e62e7464c471bae0-e91b70804d3a84189850-83ff46c1c5a1ab0c670e', '2022-07-25 12:30:39', '2022-07-25 12:30:39', NULL, 1, 1, 1);

--
-- Índices para tablas volcadas
--

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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `gus_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

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
