ALTER TABLE `bienes` CHANGE `bie_p` `bie_p` DECIMAL(12,6) NOT NULL DEFAULT '0';
ALTER TABLE `bienes` CHANGE `bie_alm_id` `bie_alm_id` JSON NOT NULL;

UPDATE `bienes` SET `bie_alm_id` = '[1]';
UPDATE `bienes` SET `bie_p`= 0 WHERE `bie_p` IS NULL;
ALTER TABLE `bienes` CHANGE `bie_p` `bie_p` DECIMAL(12,6) NOT NULL DEFAULT '0.000000';


ALTER TABLE `cajas` CHANGE `caj_cue_id` `caj_cue_id` BIGINT(20) NULL;

ALTER TABLE `movimientos` ADD `mov_gus_id` BIGINT NULL DEFAULT NULL AFTER `mov_observaciones`, ADD INDEX `movimientos_gusuarios` (`mov_gus_id`);
ALTER TABLE `movimientos` ADD CONSTRAINT `movimientos_gusuarios` FOREIGN KEY (`mov_gus_id`) REFERENCES `company5_bd_cacel`.`usuarios`(`gus_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `cajas` ADD `caj_gus_id` BIGINT NULL DEFAULT NULL AFTER `caj_monto`, ADD INDEX `cajas_gusuarios` (`caj_gus_id`);
ALTER TABLE `cajas` ADD CONSTRAINT `cajas_gusuarios` FOREIGN KEY (`caj_gus_id`) REFERENCES `company5_bd_cacel`.`usuarios`(`gus_id`) ON DELETE CASCADE ON UPDATE CASCADE;

DELETE FROM `modulos` WHERE 1;
INSERT INTO `modulos` (`gmo_id`, `gmo_titulo`, `gmo_descripcion`, `gmo_status`) VALUES
(1, 'Administrativo', 'Administrativo', 1),
(2, 'Logistica', 'Logistica', 1),
(3, 'Finanzas', 'Finanzas', 1),
(4, 'Gerencial', 'Gerencial', 1),
(5, 'Otros', 'Otros', 1);

alter table `modulos` AUTO_INCREMENT=6;
DELETE FROM `tpermisos` WHERE 1;
INSERT INTO `tpermisos` (`gtp_id`, `gtp_r`, `gtp_w`, `gtp_u`, `gtp_d`, `gtp_gro_id`, `gtp_gmo_id`) VALUES
(1, 1, 1, 1, 1, 1, 1),
(2, 1, 1, 1, 1, 1, 2),
(3, 1, 1, 1, 1, 1, 3),
(4, 1, 1, 1, 1, 1, 4),
(5, 1, 1, 1, 1, 1, 5),
(6, 0, 0, 0, 0, 2, 1),
(7, 1, 1, 1, 1, 2, 2),
(8, 1, 0, 0, 0, 2, 3),
(9, 1, 1, 1, 1, 2, 4),
(10,1, 0, 0, 0, 2, 5),
(11, 0, 0, 0, 0, 3, 1),
(12, 1, 0, 0, 0, 3, 2),
(13, 1, 1, 1, 1, 3, 3),
(14, 1, 1, 1, 1, 3, 4),
(15, 1, 0, 0, 0, 3, 5),
(16, 0, 0, 0, 0, 4, 1),
(17, 1, 0, 0, 0, 4, 2),
(18, 1, 0, 0, 0, 4, 3),
(19, 1, 0, 0, 0, 4, 4),
(20, 1, 0, 0, 0, 4, 5);




DROP TABLE `asistencias`;

CREATE TABLE `asistencias` (
  `asi_id` bigint(20) PRIMARY KEY AUTO_INCREMENT,
  `asi_col_id` bigint(20) NOT NULL,
  `asi_horaE` datetime NOT NULL,
  `asi_horaS` datetime NOT NULL,
  `asi_obs` text NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `asistencias` ADD INDEX `asistencias_colaboradores` (`asi_col_id`);
ALTER TABLE `asistencias` ADD CONSTRAINT `asistencias_colaboradores` FOREIGN KEY (`asi_col_id`) REFERENCES `colaboradores`(`col_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `colaboradores` ADD `col_cod` INT NOT NULL AFTER `col_id`;
ALTER TABLE `personas` CHANGE `gpe_gdi_id` `gpe_gdi_id` BIGINT NOT NULL DEFAULT '150101';
ALTER TABLE `personas` CHANGE `gpe_gt2_id` `gpe_gt2_id` BIGINT NOT NULL DEFAULT '2';
INSERT INTO `areas` (`gar_id`, `gar_nombre`, `gar_descripcion`, `gar_gar_id`) VALUES (3, 'Operaciones', 'Operaciones', NULL);
ALTER TABLE `asistencias` CHANGE `asi_horaS` `asi_horaS` DATETIME NULL;

ALTER TABLE `colaboradores` 
ADD `col_sbase` DECIMAL(12,2) NULL AFTER `col_fechaIT`,
ADD `col_viaja` tinyint(1)   NULL AFTER `col_fechaIT`,
ADD `col_cuenta` varchar(50)  NULL AFTER `col_fechaIT`,
ADD `col_clavesol` varchar(50)  NULL AFTER `col_fechaIT`,
ADD `col_ruc` varchar(11)  NULL AFTER `col_fechaIT`;

CREATE TABLE `ppagos` (
  `ppa_id` bigint(20) PRIMARY KEY AUTO_INCREMENT,
  `ppa_tipo` int(2) NOT NULL DEFAULT 0,
  `ppa_col_id` bigint(20) NOT NULL,
  `ppa_caj_id` bigint(20) NOT NULL,
  `ppa_fecha` date NOT NULL,
  `ppa_gus_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `ppagos` ADD INDEX `ppagos_colaboradores` (`ppa_col_id`);
ALTER TABLE `ppagos` ADD INDEX `ppagos_cajas` (`ppa_caj_id`);
ALTER TABLE `ppagos` ADD INDEX `ppagos_usuarios` (`ppa_gus_id`);
ALTER TABLE `ppagos` ADD FOREIGN KEY (`ppa_col_id`) REFERENCES `colaboradores`(`col_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `ppagos` ADD FOREIGN KEY (`ppa_caj_id`) REFERENCES `cajas`(`caj_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `ppagos` ADD FOREIGN KEY (`ppa_gus_id`) REFERENCES `company5_bd_cacel`.`usuarios`(`gus_id`) ON DELETE CASCADE ON UPDATE CASCADE;



ALTER TABLE `movimientos` ADD `mov_mov_id` BIGINT NULL AFTER `mov_gus_id`;
ALTER TABLE `cajas` ADD `caj_caj_id` BIGINT NULL AFTER `caj_gus_id`;
ALTER TABLE `movimientos` ADD `mov_cue_id` BIGINT NULL AFTER `mov_tce_id`;
ALTER TABLE `movimientos` ADD INDEX `movimientos_cuentas` (`mov_cue_id`);
ALTER TABLE `movimientos` ADD CONSTRAINT `movimientos_cuentas` FOREIGN KEY (`mov_cue_id`) REFERENCES `cuentas`(`cue_id`) ON DELETE CASCADE ON UPDATE CASCADE;