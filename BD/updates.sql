INSERT INTO `t10comprobantes` (`t10_id`, `t10_codigo`, `t10_descripcion`, `t10_status`) VALUES (NULL, '00', 'Exportacion', '1');
ALTER TABLE `asistencias` ADD `asi_ext` INT NULL DEFAULT NULL AFTER `asi_col_id`;

ALTER TABLE `modulos` ADD `gmo_gmo_id` BIGINT NULL AFTER `gmo_descripcion`;


-- 2023
ALTER TABLE `usuarios` CHANGE `gus_token` `gus_token` VARCHAR(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL;
ALTER TABLE `clientes` CHANGE `gcl_imagen` `gcl_imagen` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL;

ALTER TABLE `accesos` ADD `gac_use` INT NOT NULL DEFAULT '1' AFTER `gac_gcl_id`;

ALTER TABLE `modulos` ADD `gmo_icon` VARCHAR(100) NULL AFTER `gmo_descripcion`;
ALTER TABLE `modulos` ADD `gmo_path` VARCHAR(200) NOT NULL DEFAULT '#' AFTER `gmo_descripcion`;

ALTER TABLE `modulos` CHANGE `gmo_descripcion` `gmo_descripcion` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NULL;

ALTER TABLE `tpermisos` CHANGE `gtp_r` `gtp_r` INT NOT NULL DEFAULT '1';
ALTER TABLE `tpermisos` CHANGE `gtp_w` `gtp_r` INT NOT NULL DEFAULT '1';
ALTER TABLE `tpermisos` CHANGE `gtp_u` `gtp_u` INT NOT NULL DEFAULT '1';
ALTER TABLE `tpermisos` CHANGE `gtp_d` `gtp_d` INT NOT NULL DEFAULT '1';