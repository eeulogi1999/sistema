INSERT INTO `t10comprobantes` (`t10_id`, `t10_codigo`, `t10_descripcion`, `t10_status`) VALUES (NULL, '00', 'Exportacion', '1');
ALTER TABLE `asistencias` ADD `asi_ext` INT NULL DEFAULT NULL AFTER `asi_col_id`;

ALTER TABLE `modulos` ADD `gmo_gmo_id` BIGINT NULL AFTER `gmo_descripcion`;


-- 2023
ALTER TABLE `usuarios` CHANGE `gus_token` `gus_token` VARCHAR(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL;
ALTER TABLE `clientes` CHANGE `gcl_imagen` `gcl_imagen` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL;

ALTER TABLE `accesos` ADD `gac_use` INT NOT NULL DEFAULT '1' AFTER `gac_gcl_id`;