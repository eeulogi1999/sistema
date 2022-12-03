-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 12-09-2022 a las 11:47:45
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
-- Base de datos: `company5_bd_cacel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesos`
--

CREATE TABLE `accesos` (
  `gac_id` bigint(20) NOT NULL,
  `gac_gus_id` bigint(20) NOT NULL,
  `gac_gcl_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `areas` (
    `gar_id` bigint(20) NOT NULL,
    `gar_nombre` varchar(60) NOT NULL,
    `gar_descripcion` varchar(150) NOT NULL,
    `gar_gar_id` bigint(20) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `clientes` (
    `gcl_id` bigint(20) NOT NULL,
    `gcl_gem_id` bigint(20) DEFAULT NULL,
    `gcl_imagen` varchar(200) NOT NULL,
    `gcl_correo` varchar(200) NOT NULL,
    `gcl_pweb` varchar(200) NOT NULL,
    `gcl_telefono` varchar(10) DEFAULT NULL,
    `gcl_status` int(11) NOT NULL DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `departamentos` (
    `gde_id` bigint(20) NOT NULL,
    `gde_departamento` varchar(60) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `distritos` (
    `gdi_id` bigint(20) NOT NULL,
    `gdi_distrito` varchar(60) DEFAULT NULL,
    `gdi_gpr_id` bigint(20) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `empresas` (
    `gem_id` bigint(20) NOT NULL,
    `gem_ruc` varchar(11) NOT NULL,
    `gem_razonsocial` varchar(100) NOT NULL,
    `gem_direccion` text NOT NULL,
    `gem_gdi_id` bigint(20) NOT NULL DEFAULT '0',
    `gem_email` varchar(150) DEFAULT NULL,
    `gem_status` int(11) NOT NULL DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `modulos` (
    `gmo_id` bigint(20) NOT NULL,
    `gmo_titulo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
    `gmo_descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
    `gmo_status` int(11) NOT NULL DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
    `gpe_gt2_id` bigint(20) NOT NULL,
    `gpe_gdi_id` bigint(20) NOT NULL DEFAULT '0',
    `gpe_email` varchar(150) DEFAULT NULL,
    `gpe_status` int(11) NOT NULL DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `provincias` (
    `gpr_id` bigint(20) NOT NULL,
    `gpr_provincia` varchar(60) DEFAULT NULL,
    `gpr_gde_id` bigint(20) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `roles` (
    `gro_id` bigint(20) NOT NULL,
    `gro_nombrerol` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
    `gro_descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
    `gro_status` int(11) NOT NULL DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t2identidades` (
    `gt2_id` bigint(20) NOT NULL,
    `gt2_codigo` varchar(4) NOT NULL,
    `gt2_descripcion` text NOT NULL,
    `gt2_status` int(11) NOT NULL DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t4monedas` (
    `gt4_id` bigint(20) NOT NULL,
    `gt4_codigo` varchar(4) NOT NULL,
    `gt4_sunat` varchar(4) NOT NULL,
    `gt4_simbolo` varchar(6) NOT NULL,
    `gt4_descripcion` text NOT NULL,
    `gt4_status` int(11) NOT NULL DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `tafectaciones` (
    `gta_id` bigint(20) NOT NULL,
    `gta_codigo` varchar(10) NOT NULL,
    `gta_descripcion` varchar(200) NOT NULL,
    `gta_status` int(11) NOT NULL DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `tcambios` (
    `gtc_id` bigint(20) NOT NULL,
    `gtc_gt4_id` bigint(20) NOT NULL,
    `gtc_fecha` date NOT NULL,
    `gtc_tcompra` decimal(10,4) NOT NULL,
    `gtc_tventa` decimal(10,4) NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `tpermisos` (
    `gtp_id` bigint(20) NOT NULL,
    `gtp_r` int(11) NOT NULL DEFAULT '0',
    `gtp_w` int(11) NOT NULL DEFAULT '0',
    `gtp_u` int(11) NOT NULL DEFAULT '0',
    `gtp_d` int(11) NOT NULL DEFAULT '0',
    `gtp_gro_id` bigint(20) NOT NULL,
    `gtp_gmo_id` bigint(20) NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `usuarios` (
    `gus_id` bigint(20) NOT NULL,
    `gus_gpe_id` bigint(20) DEFAULT NULL,
    `gus_imagen` varchar(200) DEFAULT NULL,
    `gus_gro_id` bigint(20) NOT NULL,
    `gus_user` varchar(100) NOT NULL,
    `gus_password` varchar(250) NOT NULL,
    `gus_token` varchar(300) NOT NULL,
    `gus_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `gus_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `gus_telefono` varchar(20) DEFAULT NULL,
    `gus_gcl_id` bigint(20) NOT NULL,
    `gus_gar_id` bigint(20) NOT NULL,
    `gus_status` int(11) NOT NULL DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `accesos`
  ADD PRIMARY KEY (`gac_id`),
  ADD KEY `accesos_usuarios` (`gac_gus_id`),
  ADD KEY `accesos_clientes` (`gac_gcl_id`);

ALTER TABLE `areas`
  ADD PRIMARY KEY (`gar_id`);

ALTER TABLE `clientes`
  ADD PRIMARY KEY (`gcl_id`),
  ADD UNIQUE KEY `gcl_gem_id` (`gcl_gem_id`);

ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`gde_id`);

ALTER TABLE `distritos`
  ADD PRIMARY KEY (`gdi_id`),
  ADD KEY `distritos_provincias` (`gdi_gpr_id`);

ALTER TABLE `empresas`
  ADD PRIMARY KEY (`gem_id`),
  ADD KEY `empresas_distritos` (`gem_gdi_id`);

ALTER TABLE `modulos`
  ADD PRIMARY KEY (`gmo_id`);

ALTER TABLE `personas`
  ADD PRIMARY KEY (`gpe_id`),
  ADD KEY `personas_distritos` (`gpe_gdi_id`),
  ADD KEY `personas_t2identidades` (`gpe_gt2_id`);

ALTER TABLE `provincias`
  ADD PRIMARY KEY (`gpr_id`),
  ADD KEY `provincias_distritos` (`gpr_gde_id`);

ALTER TABLE `roles`
  ADD PRIMARY KEY (`gro_id`);

ALTER TABLE `t2identidades`
  ADD PRIMARY KEY (`gt2_id`);

ALTER TABLE `t4monedas`
  ADD PRIMARY KEY (`gt4_id`);

ALTER TABLE `tafectaciones`
  ADD PRIMARY KEY (`gta_id`);

ALTER TABLE `tcambios`
  ADD PRIMARY KEY (`gtc_id`),
  ADD KEY `tcambios_t4monedas` (`gtc_gt4_id`);

ALTER TABLE `tpermisos`
  ADD PRIMARY KEY (`gtp_id`),
  ADD KEY `tpermisos_roles` (`gtp_gro_id`),
  ADD KEY `tpermisos_modulos` (`gtp_gmo_id`);

ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`gus_id`),
  ADD UNIQUE KEY `gus_gpe_id` (`gus_gpe_id`),
  ADD KEY `usuarios_roles` (`gus_gro_id`),
  ADD KEY `usuarios_clientes` (`gus_gcl_id`),
  ADD KEY `usuarios_areas` (`gus_gar_id`);

ALTER TABLE `accesos`
  MODIFY `gac_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `areas`
  MODIFY `gar_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `clientes`
  MODIFY `gcl_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `departamentos`
  MODIFY `gde_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

ALTER TABLE `distritos`
  MODIFY `gdi_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250402;

ALTER TABLE `empresas`
  MODIFY `gem_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `modulos`
  MODIFY `gmo_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

ALTER TABLE `personas`
  MODIFY `gpe_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `provincias`
  MODIFY `gpr_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2505;

ALTER TABLE `roles`
  MODIFY `gro_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `t2identidades`
  MODIFY `gt2_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `t4monedas`
  MODIFY `gt4_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `tafectaciones`
  MODIFY `gta_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

ALTER TABLE `tcambios`
  MODIFY `gtc_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=295;

ALTER TABLE `tpermisos`
  MODIFY `gtp_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

ALTER TABLE `usuarios`
  MODIFY `gus_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `accesos`
  ADD CONSTRAINT `accesos_clientes` FOREIGN KEY (`gac_gcl_id`) REFERENCES `clientes` (`gcl_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `accesos_usuarios` FOREIGN KEY (`gac_gus_id`) REFERENCES `usuarios` (`gus_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_empresas` FOREIGN KEY (`gcl_gem_id`) REFERENCES `empresas` (`gem_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `distritos`
  ADD CONSTRAINT `distritos_provincias` FOREIGN KEY (`gdi_gpr_id`) REFERENCES `provincias` (`gpr_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `empresas`
  ADD CONSTRAINT `empresas_distritos` FOREIGN KEY (`gem_gdi_id`) REFERENCES `distritos` (`gdi_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `personas`
  ADD CONSTRAINT `personas_distritos` FOREIGN KEY (`gpe_gdi_id`) REFERENCES `distritos` (`gdi_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `personas_t2identidades` FOREIGN KEY (`gpe_gt2_id`) REFERENCES `t2identidades` (`gt2_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `provincias`
  ADD CONSTRAINT `provincias_distritos` FOREIGN KEY (`gpr_gde_id`) REFERENCES `departamentos` (`gde_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `tcambios`
  ADD CONSTRAINT `tcambios_t4monedas` FOREIGN KEY (`gtc_gt4_id`) REFERENCES `t4monedas` (`gt4_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `tpermisos`
  ADD CONSTRAINT `tpermisos_modulos` FOREIGN KEY (`gtp_gmo_id`) REFERENCES `modulos` (`gmo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tpermisos_roles` FOREIGN KEY (`gtp_gro_id`) REFERENCES `roles` (`gro_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_areas` FOREIGN KEY (`gus_gar_id`) REFERENCES `areas` (`gar_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_clientes` FOREIGN KEY (`gus_gcl_id`) REFERENCES `clientes` (`gcl_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_personas` FOREIGN KEY (`gus_gpe_id`) REFERENCES `personas` (`gpe_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_roles` FOREIGN KEY (`gus_gro_id`) REFERENCES `roles` (`gro_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
