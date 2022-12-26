INSERT INTO `t10comprobantes` (`t10_id`, `t10_codigo`, `t10_descripcion`, `t10_status`) VALUES (NULL, '00', 'Exportacion', '1');
ALTER TABLE `asistencias` ADD `asi_ext` INT NULL DEFAULT NULL AFTER `asi_col_id`;

ALTER TABLE `modulos` ADD `gmo_gmo_id` BIGINT NULL AFTER `gmo_descripcion`;