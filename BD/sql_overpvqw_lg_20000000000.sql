-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 12-09-2022 a las 11:47:54
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
-- Base de datos: `company5_lg_20602849172`
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


CREATE TABLE `acreditos` (
    `acr_id` bigint(20) NOT NULL,
    `acr_monto` decimal(12,6) NOT NULL,
    `acr_ncuota` int(12) NOT NULL,
    `acr_interes` decimal(6,4) NOT NULL,
    `acr_fechapago` date NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `activos` (
    `act_id` bigint(20) NOT NULL,
    `act_codigo` varchar(250) NOT NULL,
    `act_nombre` varchar(250) NOT NULL,
    `act_t9p_id` bigint(20) NOT NULL,
    `act_act_id` bigint(20) DEFAULT NULL,
    `act_img` varchar(200) DEFAULT NULL,
    `act_status` int(11) NOT NULL DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


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


CREATE TABLE `batributos` (
    `bat_id` bigint(20) NOT NULL,
    `bat_bie_id` bigint(20) DEFAULT NULL,
    `bat_val_id` bigint(20) NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `bbienes` (
  `bbi_id` bigint(20) NOT NULL,
  `bbi_t5e_id` bigint(20) NOT NULL,
  `bbi_c70_id` bigint(20) NOT NULL,
  `bbi_c60_id` bigint(20) NOT NULL,
  `bbi_c61_id` bigint(20) NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `bienes` (
  `bie_id` bigint(20) NOT NULL,
  `bie_codigo` varchar(12) NOT NULL,
  `bie_nombre` varchar(200) NOT NULL,
  `bie_bbi_id` bigint(20) DEFAULT NULL,
  `bie_t6m_id` bigint(20) DEFAULT NULL,
  `bie_bie_id` bigint(20) DEFAULT NULL,
  `bie_alm_id` json NOT NULL,
  `bie_p` decimal(12,6)  NOT NULL DEFAULT '0.000000',
  `bie_igv` tinyint(1) NOT NULL DEFAULT '0',
  `bie_img` text,
  `bie_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


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
  `caj_cue_id` bigint(20) NOT NULL,
  `caj_t1m_id` bigint(20) DEFAULT NULL,
  `caj_gt4_id` bigint(20) DEFAULT '1',
  `caj_monto` decimal(24,4) NOT NULL,
  `caj_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `caj_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `caj_status` int(1) DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `colaboradores` (
    `col_id` bigint(20) NOT NULL,
    `col_gpe_id` bigint(20) NOT NULL,
    `col_gar_id` bigint(20) NOT NULL,
    `col_puesto` varchar(250) NOT NULL,
    `col_est_id` bigint(20) NOT NULL,
    `col_img` varchar(250) DEFAULT NULL,
    `col_status` int(11) NOT NULL DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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


CREATE TABLE `configuraciones` (
  `con_id` bigint(20) NOT NULL,
  `con_clave` varchar(15) NOT NULL,
  `con_valor` varchar(80) NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `cuentas` (
  `cue_id` bigint(20) NOT NULL,
  `cue_gem_id` bigint(20) DEFAULT NULL,
  `cue_nombre` varchar(200) NOT NULL,
  `cue_numero` int(11) DEFAULT NULL,
  `cue_gt4_id` bigint(20) DEFAULT '1',
  `cue_status` int(1) DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


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



CREATE TABLE `liquidez` (
    `liq_id` bigint(20) NOT NULL,
    `liq_fecha` date NOT NULL,
    `liq_age_id` bigint(20) DEFAULT NULL,
    `liq_monto` decimal(24,4) DEFAULT NULL,
    `liq_status` int(1) DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


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

CREATE TABLE `preliminares` (
  `pre_id` bigint(20) NOT NULL,
  `pre_transaccion` int(11) NOT NULL,
  `pre_exportacion` int(11) NOT NULL,
  `pre_anticipo` int(11) NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `propiedades` (
  `pro_id` bigint(20) NOT NULL,
  `pro_nombre` varchar(100) NOT NULL,
  `pro_type` varchar(20) NOT NULL DEFAULT 'varchar',
  `pro_revalue` int(3) NOT NULL DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `responsables` (
  `res_id` bigint(20) NOT NULL,
  `res_tar_id` bigint(20) NOT NULL,
  `res_gus_gpe_id` bigint(20) NOT NULL,
  `res_status` int(11) NOT NULL DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `rlegal` (
  `rle_id` bigint(20) NOT NULL,
  `rle_ruc` varchar(11) NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


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


CREATE TABLE `satributos` (
  `sat_id` bigint(20) NOT NULL,
  `sat_ser_id` bigint(20) DEFAULT NULL,
  `sat_val_id` bigint(20) NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `t1mediopagos` (
  `t1m_id` bigint(20) NOT NULL,
  `t1m_codigo` varchar(4) NOT NULL,
  `t1m_descripcion` text NOT NULL,
  `t1m_status` int(11) NOT NULL DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t3financieras` (
    `t3f_id` bigint(20) NOT NULL,
    `t3f_codigo` varchar(4) NOT NULL,
    `t3f_descripcion` text NOT NULL,
    `t3f_status` int(11) NOT NULL DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `t5existencias` (
    `t5e_id` bigint(20) NOT NULL,
    `t5e_codigo` varchar(4) NOT NULL,
    `t5e_descripcion` text NOT NULL,
    `t5e_status` int(11) NOT NULL DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `t6medidas` (
    `t6m_id` bigint(20) NOT NULL,
    `t6m_codigo` varchar(4) NOT NULL,
    `t6m_sunat` varchar(4) NOT NULL,
    `t6m_descripcion` text NOT NULL,
    `t6m_status` int(11) NOT NULL DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t7intangibles` (
  `t7i_id` bigint(20) NOT NULL,
  `t7i_codigo` varchar(4) NOT NULL,
  `t7i_descripcion` text NOT NULL,
  `t7i_status` int(11) NOT NULL DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t8libroregistros` (
  `t8l_id` bigint(20) NOT NULL,
  `t8l_codigo` varchar(4) NOT NULL,
  `t8l_descripcion` text NOT NULL,
  `t8l_status` int(11) NOT NULL DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `t9plancontables` (
  `t9p_id` bigint(20) NOT NULL,
  `t9p_elemento` varchar(4) NOT NULL,
  `t9p_codigo` bigint(20) NOT NULL,
  `t9p_descripcion` text NOT NULL,
  `t9p_status` int(11) NOT NULL DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `t10comprobantes` (
    `t10_id` bigint(20) NOT NULL,
    `t10_codigo` varchar(4) NOT NULL,
    `t10_descripcion` text NOT NULL,
    `t10_status` int(11) NOT NULL DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t11aduanas` (
  `t11_id` bigint(20) NOT NULL,
  `t11_codigo` varchar(4) NOT NULL,
  `t11_descripcion` text NOT NULL,
  `t11_status` int(11) NOT NULL DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t12operaciones` (
  `t12_id` bigint(20) NOT NULL,
  `t12_codigo` varchar(4) NOT NULL,
  `t12_descripcion` text NOT NULL,
  `t12_status` int(11) NOT NULL DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `tcespeciales` (
  `tce_id` bigint(20) NOT NULL,
  `tce_gtc_id` bigint(20) DEFAULT NULL,
  `tce_compra` decimal(6,4) DEFAULT NULL,
  `tce_venta` decimal(6,4) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tgastos` (
  `tga_id` bigint(20) NOT NULL,
  `tga_nombre` varchar(200) DEFAULT NULL,
  `tga_status` int(1) DEFAULT '1'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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


CREATE TABLE `ubicaciones` (
  `ubi_id` bigint(20) NOT NULL,
  `ubi_gdi_id` bigint(20) NOT NULL,
  `ubi_gar_id` bigint(20) NOT NULL,
  `ubi_est_id` bigint(20) DEFAULT NULL,
  `ubi_piso` int(11) NOT NULL,
  `ubi_etrabajo` varchar(20) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `valores` (
  `val_id` bigint(20) NOT NULL,
  `val_pro_id` bigint(20) NOT NULL,
  `val_valor` text NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- add key
  ALTER TABLE `aatributos`
    ADD PRIMARY KEY (`aat_id`),
    ADD KEY `aatributos_activos` (`aat_act_id`),
    ADD KEY `aatributos_valores` (`aat_val_id`);


  ALTER TABLE `acreditos`
    ADD PRIMARY KEY (`acr_id`);

  ALTER TABLE `activos`
    ADD PRIMARY KEY (`act_id`),
    ADD KEY `activos_t9plancontables` (`act_t9p_id`);

  ALTER TABLE `adetalles`
    ADD PRIMARY KEY (`ade_id`),
    ADD KEY `adetalles_activos` (`ade_act_id`),
    ADD KEY `adetalles_adscripciones` (`ade_ads_id`);

  ALTER TABLE `adscripciones`
    ADD PRIMARY KEY (`ads_id`),
    ADD KEY `adscripciones_colaboradores` (`ads_col_id`),
    ADD KEY `adscripciones_ubicaciones` (`ads_ubi_id`);

  ALTER TABLE `agentes`
    ADD PRIMARY KEY (`age_id`),
    ADD KEY `agentes_gpersonas` (`age_gpe_id`),
    ADD KEY `agentes_gempresas` (`age_gem_id`);

  ALTER TABLE `almacenes`
    ADD PRIMARY KEY (`alm_id`),
    ADD KEY `almacenes_estableciminetos` (`alm_est_id`),
    ADD KEY `almacenes_gdistritos` (`alm_gdi_id`);

  ALTER TABLE `asistencias`
    ADD PRIMARY KEY (`asi_id`),
    ADD KEY `asistencias_gempresas` (`asi_gem_id`),
    ADD KEY `asistencias_gpersonas` (`asi_gpe_id`);

  ALTER TABLE `batributos`
    ADD PRIMARY KEY (`bat_id`),
    ADD KEY `batributos_valores` (`bat_val_id`),
    ADD KEY `batributos_bienes` (`bat_bie_id`);

  ALTER TABLE `bbienes`
    ADD PRIMARY KEY (`bbi_id`),
    ADD KEY `bbienes_t5existencias` (`bbi_t5e_id`),
    ADD KEY `bbienes_c70_t9plancontables` (`bbi_c70_id`),
    ADD KEY `bbienes_c60_t9plancontables` (`bbi_c60_id`),
    ADD KEY `bbienes_c61_t9plancontables` (`bbi_c61_id`);

  ALTER TABLE `bienes`
    ADD PRIMARY KEY (`bie_id`),
    ADD KEY `bienes_bbienes` (`bie_bbi_id`),
    ADD KEY `bienes_t6medidas` (`bie_t6m_id`);

  ALTER TABLE `cajas`
    ADD PRIMARY KEY (`caj_id`),
    ADD KEY `cajas_tgastos` (`caj_tga_id`),
    ADD KEY `cajas_colaboradores` (`caj_col_id`),
    ADD KEY `cajas_agentes` (`caj_age_id`),
    ADD KEY `cajas_cuentas` (`caj_cue_id`),
    ADD KEY `cajas_t1mediopagos` (`caj_t1m_id`),
    ADD KEY `cajas_gt4monedas` (`caj_gt4_id`);

  ALTER TABLE `cdetalles`
    ADD PRIMARY KEY (`cde_id`),
    ADD KEY `cdetalles_servicios` (`cde_ser_id`),
    ADD KEY `cdetalles_bienes` (`cde_bie_id`),
    ADD KEY `cdetalles_t6medidas` (`cde_t6m_id`),
    ADD KEY `cdetalles_comprobantes` (`cde_com_id`),
    ADD KEY `cdetalles_tafectaciones` (`cde_gta_id`);

  ALTER TABLE `cierremeses`
    ADD PRIMARY KEY (`cie_id`),
    ADD KEY `cierremeses_bienes` (`cie_bie_id`),
    ADD KEY `cierremeses_almacenes` (`cie_alm_id`);

  ALTER TABLE `colaboradores`
    ADD PRIMARY KEY (`col_id`),
    ADD KEY `colaboradores_establecimientos` (`col_est_id`),
    ADD KEY `colaboradores_personas` (`col_gpe_id`),
    ADD KEY `colaboradores_areas` (`col_gar_id`);

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


  ALTER TABLE `comprobantes`
    ADD PRIMARY KEY (`com_id`),
    ADD KEY `comprobantes_agentes` (`com_age_id`),
    ADD KEY `comprobantes_establecimientos` (`com_est_id`),
    ADD KEY `comprobantes_t10comprobantes` (`com_t10_id`),
    ADD KEY `comprobantes_t1mediospagos` (`com_t1m_id`),
    ADD KEY `comprobantes_t12operaciones` (`com_t12_id`),
    ADD KEY `comprobantes_acreditos` (`com_acr_id`),
    ADD KEY `comprobantes_gt4monedas` (`com_gt4_id`);

  ALTER TABLE `configuraciones`
    ADD PRIMARY KEY (`con_id`);

  ALTER TABLE `cuentas`
    ADD PRIMARY KEY (`cue_id`),
    ADD KEY `cuentas_gempresas` (`cue_gem_id`),
    ADD KEY `cuentas_gt4monedas` (`cue_gt4_id`);

  ALTER TABLE `establecimientos`
    ADD PRIMARY KEY (`est_id`),
    ADD KEY `establecimientos_gdistritos` (`est_gdi_id`);

  ALTER TABLE `liquidez`
    ADD PRIMARY KEY (`liq_id`),
    ADD KEY `liquidez_agentes` (`liq_age_id`);

  ALTER TABLE `mdetalles`
    ADD PRIMARY KEY (`mde_id`),
    ADD KEY `mdetalles_bienes` (`mde_bie_id`),
    ADD KEY `mdetalles_t6medidas` (`mde_t6m_id`),
    ADD KEY `mdetalles_movimientos` (`mde_mov_id`),
    ADD KEY `mdetalles_tafectaciones` (`mde_gta_id`);

  ALTER TABLE `mermas`
    ADD KEY `mermas_bienes` (`mer_bie_id`),
    ADD KEY `mermas_almacenes` (`mer_alm_id`);

  ALTER TABLE `mkinternos`
    ADD KEY `mkinternos_i_bienes` (`mki_i_bie_id`),
    ADD KEY `mkinternos_f_bienes` (`mki_f_bie_id`),
    ADD KEY `mkinternos_almacenes` (`mki_alm_id`);

  ALTER TABLE `movimientos`
    ADD PRIMARY KEY (`mov_id`),
    ADD KEY `movimientos_agentes` (`mov_age_id`),
    ADD KEY `movimientos_almacenes` (`mov_alm_id`),
    ADD KEY `movimientos_t12operaciones` (`mov_t12_id`),
    ADD KEY `movimientos_tcespeciales` (`mov_tce_id`),
    ADD KEY `movimientos_t10comprobantes` (`mov_t10_id`),
    ADD KEY `movimientos_gt4monedas` (`mov_gt4_id`);

  ALTER TABLE `preliminares`
    ADD PRIMARY KEY (`pre_id`);

  ALTER TABLE `propiedades`
    ADD PRIMARY KEY (`pro_id`);

  ALTER TABLE `responsables`
    ADD PRIMARY KEY (`res_id`),
    ADD KEY `responsables_tareas` (`res_tar_id`),
    ADD KEY `responsables_gusuarios` (`res_gus_gpe_id`);

  ALTER TABLE `rlegal`
    ADD PRIMARY KEY (`rle_id`);

  ALTER TABLE `saldobienes`
    ADD PRIMARY KEY (`sal_id`),
    ADD KEY `saldobienes_bienes` (`sal_bie_id`),
    ADD KEY `saldobienes_almacenes` (`sal_alm_id`);

  ALTER TABLE `satributos`
    ADD PRIMARY KEY (`sat_id`),
    ADD KEY `satributos_valores` (`sat_val_id`),
    ADD KEY `satributos_servicios` (`sat_ser_id`);

  ALTER TABLE `servicios`
    ADD PRIMARY KEY (`ser_id`),
    ADD KEY `servicios_t6medidas` (`ser_t6m_id`);

  ALTER TABLE `t1mediopagos`
    ADD PRIMARY KEY (`t1m_id`);

  ALTER TABLE `t3financieras`
    ADD PRIMARY KEY (`t3f_id`);

  ALTER TABLE `t5existencias`
    ADD PRIMARY KEY (`t5e_id`);

  ALTER TABLE `t6medidas`
    ADD PRIMARY KEY (`t6m_id`);

  ALTER TABLE `t7intangibles`
    ADD PRIMARY KEY (`t7i_id`);

  ALTER TABLE `t8libroregistros`
    ADD PRIMARY KEY (`t8l_id`);

  ALTER TABLE `t9plancontables`
    ADD PRIMARY KEY (`t9p_id`);

  ALTER TABLE `t10comprobantes`
    ADD PRIMARY KEY (`t10_id`);

  ALTER TABLE `t11aduanas`
    ADD PRIMARY KEY (`t11_id`);

  ALTER TABLE `t12operaciones`
    ADD PRIMARY KEY (`t12_id`);

  ALTER TABLE `tareas`
    ADD PRIMARY KEY (`tar_id`),
    ADD KEY `tareas_gareas` (`tar_gar_id`);

  ALTER TABLE `tcespeciales`
    ADD PRIMARY KEY (`tce_id`),
    ADD KEY `tcespeciales_gtcambios` (`tce_gtc_id`);

  ALTER TABLE `tgastos`
    ADD PRIMARY KEY (`tga_id`);

  ALTER TABLE `titulares`
    ADD PRIMARY KEY (`iti_id`),
    ADD KEY `titulares_bienes` (`iti_bie_id`),
    ADD KEY `titulares_componentes` (`iti_ico_id`),
    ADD KEY `titulares_colaboradores` (`iti_col_id`);

  ALTER TABLE `ubicaciones`
    ADD PRIMARY KEY (`ubi_id`),
    ADD KEY `ubicaciones_establecimientos` (`ubi_est_id`),
    ADD KEY `ubicaciones_gdistritos` (`ubi_gdi_id`),
    ADD KEY `ubicaciones_gareas` (`ubi_gar_id`);

  ALTER TABLE `valores`
    ADD PRIMARY KEY (`val_id`),
    ADD KEY `valores_propiedades` (`val_pro_id`);

-- Auto Increment
  ALTER TABLE `aatributos`
    MODIFY `aat_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `acreditos`
    MODIFY `acr_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `activos`
    MODIFY `act_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `adetalles`
    MODIFY `ade_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `adscripciones`
    MODIFY `ads_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `agentes`
    MODIFY `age_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

  ALTER TABLE `almacenes`
    MODIFY `alm_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

  ALTER TABLE `asistencias`
    MODIFY `asi_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `batributos`
    MODIFY `bat_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `bbienes`
    MODIFY `bbi_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

  ALTER TABLE `bienes`
    MODIFY `bie_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

  ALTER TABLE `cajas`
    MODIFY `caj_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

  ALTER TABLE `cdetalles`
    MODIFY `cde_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `cierremeses`
    MODIFY `cie_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

  ALTER TABLE `colaboradores`
    MODIFY `col_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `componentes`
    MODIFY `ico_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `comprobantes`
    MODIFY `com_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `configuraciones`
    MODIFY `con_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `cuentas`
    MODIFY `cue_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

  ALTER TABLE `establecimientos`
    MODIFY `est_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

  ALTER TABLE `liquidez`
    MODIFY `liq_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

  ALTER TABLE `mdetalles`
    MODIFY `mde_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=279;

  ALTER TABLE `movimientos`
    MODIFY `mov_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

  ALTER TABLE `preliminares`
    MODIFY `pre_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `propiedades`
    MODIFY `pro_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `responsables`
    MODIFY `res_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `rlegal`
    MODIFY `rle_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `saldobienes`
    MODIFY `sal_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `satributos`
    MODIFY `sat_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `servicios`
    MODIFY `ser_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `t1mediopagos`
    MODIFY `t1m_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

  ALTER TABLE `t3financieras`
    MODIFY `t3f_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `t5existencias`
    MODIFY `t5e_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

  ALTER TABLE `t6medidas`
    MODIFY `t6m_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

  ALTER TABLE `t7intangibles`
    MODIFY `t7i_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `t8libroregistros`
    MODIFY `t8l_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

  ALTER TABLE `t9plancontables`
    MODIFY `t9p_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1778;

  ALTER TABLE `t10comprobantes`
    MODIFY `t10_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

  ALTER TABLE `t11aduanas`
    MODIFY `t11_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `t12operaciones`
    MODIFY `t12_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

  ALTER TABLE `tareas`
    MODIFY `tar_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `tcespeciales`
    MODIFY `tce_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

  ALTER TABLE `tgastos`
    MODIFY `tga_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

  ALTER TABLE `titulares`
    MODIFY `iti_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `ubicaciones`
    MODIFY `ubi_id` bigint(20) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `valores`
    MODIFY `val_id` bigint(20) NOT NULL AUTO_INCREMENT;


-- FOREING KEY 
  ALTER TABLE `aatributos`
    ADD CONSTRAINT `aatributos_activos` FOREIGN KEY (`aat_act_id`) REFERENCES `activos` (`act_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `aatributos_valores` FOREIGN KEY (`aat_val_id`) REFERENCES `valores` (`val_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `activos`
    ADD CONSTRAINT `activos_t9plancontables` FOREIGN KEY (`act_t9p_id`) REFERENCES `t9plancontables` (`t9p_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `adetalles`
    ADD CONSTRAINT `adetalles_activos` FOREIGN KEY (`ade_act_id`) REFERENCES `activos` (`act_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `adetalles_adscripciones` FOREIGN KEY (`ade_ads_id`) REFERENCES `adscripciones` (`ads_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `adscripciones`
    ADD CONSTRAINT `adscripciones_colaboradores` FOREIGN KEY (`ads_col_id`) REFERENCES `colaboradores` (`col_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `adscripciones_ubicaciones` FOREIGN KEY (`ads_ubi_id`) REFERENCES `ubicaciones` (`ubi_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `agentes`
    ADD CONSTRAINT `agentes_gempresas` FOREIGN KEY (`age_gem_id`) REFERENCES `overpvqw_lg_regomsa`.`empresas` (`gem_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `agentes_gpersonas` FOREIGN KEY (`age_gpe_id`) REFERENCES `overpvqw_lg_regomsa`.`personas` (`gpe_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `almacenes`
    ADD CONSTRAINT `almacenes_estableciminetos` FOREIGN KEY (`alm_est_id`) REFERENCES `establecimientos` (`est_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `almacenes_gdistritos` FOREIGN KEY (`alm_gdi_id`) REFERENCES `overpvqw_lg_regomsa`.`distritos` (`gdi_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `asistencias`
    ADD CONSTRAINT `asistencias_gempresas` FOREIGN KEY (`asi_gem_id`) REFERENCES `overpvqw_lg_regomsa`.`empresas` (`gem_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `asistencias_gpersonas` FOREIGN KEY (`asi_gpe_id`) REFERENCES `overpvqw_lg_regomsa`.`personas` (`gpe_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `batributos`
    ADD CONSTRAINT `batributos_bienes` FOREIGN KEY (`bat_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `batributos_valores` FOREIGN KEY (`bat_val_id`) REFERENCES `valores` (`val_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `bbienes`
    ADD CONSTRAINT `bbienes_c60_t9plancontables` FOREIGN KEY (`bbi_c60_id`) REFERENCES `t9plancontables` (`t9p_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `bbienes_c61_t9plancontables` FOREIGN KEY (`bbi_c61_id`) REFERENCES `t9plancontables` (`t9p_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `bbienes_c70_t9plancontables` FOREIGN KEY (`bbi_c70_id`) REFERENCES `t9plancontables` (`t9p_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `bbienes_t5existencias` FOREIGN KEY (`bbi_t5e_id`) REFERENCES `t5existencias` (`t5e_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `bienes`
    ADD CONSTRAINT `bienes_bbienes` FOREIGN KEY (`bie_bbi_id`) REFERENCES `bbienes` (`bbi_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `bienes_t6medidas` FOREIGN KEY (`bie_t6m_id`) REFERENCES `t6medidas` (`t6m_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `cajas`
    ADD CONSTRAINT `cajas_agentes` FOREIGN KEY (`caj_age_id`) REFERENCES `agentes` (`age_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `cajas_colaboradores` FOREIGN KEY (`caj_col_id`) REFERENCES `colaboradores` (`col_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `cajas_cuentas` FOREIGN KEY (`caj_cue_id`) REFERENCES `cuentas` (`cue_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `cajas_gt4monedas` FOREIGN KEY (`caj_gt4_id`) REFERENCES `overpvqw_lg_regomsa`.`t4monedas` (`gt4_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `cajas_t1mediopagos` FOREIGN KEY (`caj_t1m_id`) REFERENCES `t1mediopagos` (`t1m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `cajas_tgastos` FOREIGN KEY (`caj_tga_id`) REFERENCES `tgastos` (`tga_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `cdetalles`
    ADD CONSTRAINT `cdetalles_bienes` FOREIGN KEY (`cde_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `cdetalles_comprobantes` FOREIGN KEY (`cde_com_id`) REFERENCES `comprobantes` (`com_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `cdetalles_servicios` FOREIGN KEY (`cde_ser_id`) REFERENCES `servicios` (`ser_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `cdetalles_t6medidas` FOREIGN KEY (`cde_t6m_id`) REFERENCES `t6medidas` (`t6m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `cdetalles_tafectaciones` FOREIGN KEY (`cde_gta_id`) REFERENCES `overpvqw_lg_regomsa`.`tafectaciones` (`gta_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `cierremeses`
    ADD CONSTRAINT `cierremeses_almacenes` FOREIGN KEY (`cie_alm_id`) REFERENCES `almacenes` (`alm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `cierremeses_bienes` FOREIGN KEY (`cie_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `colaboradores`
    ADD CONSTRAINT `colaboradores_areas` FOREIGN KEY (`col_gar_id`) REFERENCES `overpvqw_lg_regomsa`.`areas` (`gar_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `colaboradores_establecimientos` FOREIGN KEY (`col_est_id`) REFERENCES `establecimientos` (`est_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `colaboradores_personas` FOREIGN KEY (`col_gpe_id`) REFERENCES `overpvqw_lg_regomsa`.`personas` (`gpe_id`) ON DELETE CASCADE ON UPDATE CASCADE;


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

  ALTER TABLE `comprobantes`
    ADD CONSTRAINT `comprobantes_acreditos` FOREIGN KEY (`com_acr_id`) REFERENCES `acreditos` (`acr_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `comprobantes_agentes` FOREIGN KEY (`com_age_id`) REFERENCES `agentes` (`age_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `comprobantes_establecimientos` FOREIGN KEY (`com_est_id`) REFERENCES `establecimientos` (`est_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `comprobantes_gt4monedas` FOREIGN KEY (`com_gt4_id`) REFERENCES `overpvqw_lg_regomsa`.`t4monedas` (`gt4_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `comprobantes_preliminares` FOREIGN KEY (`com_id`) REFERENCES `preliminares` (`pre_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `comprobantes_t10comprobantes` FOREIGN KEY (`com_t10_id`) REFERENCES `t10comprobantes` (`t10_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `comprobantes_t12operaciones` FOREIGN KEY (`com_t12_id`) REFERENCES `t12operaciones` (`t12_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `comprobantes_t1mediospagos` FOREIGN KEY (`com_t1m_id`) REFERENCES `t1mediopagos` (`t1m_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `cuentas`
    ADD CONSTRAINT `cuentas_gempresas` FOREIGN KEY (`cue_gem_id`) REFERENCES `overpvqw_lg_regomsa`.`empresas` (`gem_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `cuentas_gt4monedas` FOREIGN KEY (`cue_gt4_id`) REFERENCES `overpvqw_lg_regomsa`.`t4monedas` (`gt4_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `establecimientos`
    ADD CONSTRAINT `establecimientos_gdistritos` FOREIGN KEY (`est_gdi_id`) REFERENCES `overpvqw_lg_regomsa`.`distritos` (`gdi_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `liquidez`
    ADD CONSTRAINT `liquidez_agentes` FOREIGN KEY (`liq_age_id`) REFERENCES `agentes` (`age_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `mdetalles`
    ADD CONSTRAINT `mdetalles_bienes` FOREIGN KEY (`mde_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `mdetalles_movimientos` FOREIGN KEY (`mde_mov_id`) REFERENCES `movimientos` (`mov_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `mdetalles_t6medidas` FOREIGN KEY (`mde_t6m_id`) REFERENCES `t6medidas` (`t6m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `mdetalles_tafectaciones` FOREIGN KEY (`mde_gta_id`) REFERENCES `overpvqw_lg_regomsa`.`tafectaciones` (`gta_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `mermas`
    ADD CONSTRAINT `mermas_almacenes` FOREIGN KEY (`mer_alm_id`) REFERENCES `almacenes` (`alm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `mermas_bienes` FOREIGN KEY (`mer_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `mkinternos`
    ADD CONSTRAINT `mkinternos_almacenes` FOREIGN KEY (`mki_alm_id`) REFERENCES `almacenes` (`alm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `mkinternos_f_bienes` FOREIGN KEY (`mki_f_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `mkinternos_i_bienes` FOREIGN KEY (`mki_i_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `movimientos`
    ADD CONSTRAINT `movimientos_agentes` FOREIGN KEY (`mov_age_id`) REFERENCES `agentes` (`age_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `movimientos_almacenes` FOREIGN KEY (`mov_alm_id`) REFERENCES `almacenes` (`alm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `movimientos_gt4monedas` FOREIGN KEY (`mov_gt4_id`) REFERENCES `overpvqw_lg_regomsa`.`t4monedas` (`gt4_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `movimientos_t10comprobantes` FOREIGN KEY (`mov_t10_id`) REFERENCES `t10comprobantes` (`t10_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `movimientos_t12operaciones` FOREIGN KEY (`mov_t12_id`) REFERENCES `t12operaciones` (`t12_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `movimientos_tcespeciales` FOREIGN KEY (`mov_tce_id`) REFERENCES `tcespeciales` (`tce_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `responsables`
    ADD CONSTRAINT `responsables_gusuarios` FOREIGN KEY (`res_gus_gpe_id`) REFERENCES `overpvqw_lg_regomsa`.`usuarios` (`gus_gpe_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `responsables_tareas` FOREIGN KEY (`res_tar_id`) REFERENCES `tareas` (`tar_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `saldobienes`
    ADD CONSTRAINT `saldobienes_almacenes` FOREIGN KEY (`sal_alm_id`) REFERENCES `almacenes` (`alm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `saldobienes_bienes` FOREIGN KEY (`sal_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `satributos`
    ADD CONSTRAINT `satributos_servicios` FOREIGN KEY (`sat_ser_id`) REFERENCES `servicios` (`ser_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `satributos_valores` FOREIGN KEY (`sat_val_id`) REFERENCES `valores` (`val_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `servicios`
    ADD CONSTRAINT `servicios_t6medidas` FOREIGN KEY (`ser_t6m_id`) REFERENCES `t6medidas` (`t6m_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `tareas`
    ADD CONSTRAINT `tareas_gareas` FOREIGN KEY (`tar_gar_id`) REFERENCES `overpvqw_lg_regomsa`.`areas` (`gar_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `tcespeciales`
    ADD CONSTRAINT `tcespeciales_gtcambios` FOREIGN KEY (`tce_gtc_id`) REFERENCES `overpvqw_lg_regomsa`.`tcambios` (`gtc_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `titulares`
    ADD CONSTRAINT `titulares_bienes` FOREIGN KEY (`iti_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `titulares_colaboradores` FOREIGN KEY (`iti_col_id`) REFERENCES `colaboradores` (`col_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `titulares_componentes` FOREIGN KEY (`iti_ico_id`) REFERENCES `componentes` (`ico_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `ubicaciones`
    ADD CONSTRAINT `ubicaciones_establecimientos` FOREIGN KEY (`ubi_est_id`) REFERENCES `establecimientos` (`est_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `ubicaciones_gareas` FOREIGN KEY (`ubi_gar_id`) REFERENCES `overpvqw_lg_regomsa`.`areas` (`gar_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `ubicaciones_gdistritos` FOREIGN KEY (`ubi_gdi_id`) REFERENCES `overpvqw_lg_regomsa`.`distritos` (`gdi_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `valores`
    ADD CONSTRAINT `valores_propiedades` FOREIGN KEY (`val_pro_id`) REFERENCES `propiedades` (`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE;
  COMMIT;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
