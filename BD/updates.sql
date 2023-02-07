
    ALTER TABLE `ubicaciones` CHANGE `ubi_piso` `ubi_clave` VARCHAR(220) DEFAULT 'Nombre';
    ALTER TABLE `ubicaciones` CHANGE `ubi_etrabajo` `ubi_valor` VARCHAR(220) NOT NULL;
    ALTER TABLE `ubicaciones` ADD `ubi_ubi_id` BIGINT NULL AFTER `ubi_valor`;
    ALTER TABLE `ubicaciones` ADD `ubi_status` INT NOT NULL DEFAULT '1' AFTER `ubi_ubi_id`;
    ALTER TABLE `ubicaciones` CHANGE `ubi_gdi_id` `ubi_gdi_id` BIGINT NULL;
    ALTER TABLE `ubicaciones` CHANGE `ubi_gar_id` `ubi_gar_id` BIGINT NULL;

    ALTER TABLE `activos` ADD `act_valor` DECIMAL(12,6) NOT NULL DEFAULT '0' AFTER `act_act_id`;
    ALTER TABLE `activos` CHANGE `act_t9p_id` `act_t9p_id` BIGINT NULL;

    ALTER TABLE `ubicaciones` CHANGE `ubi_gdi_id` `ubi_alm_id` BIGINT NULL DEFAULT NULL;

    ALTER TABLE `ubicaciones` DROP FOREIGN KEY `ubicaciones_gdistritos`; ALTER TABLE `ubicaciones` ADD CONSTRAINT `ubicaciones_almacenes` FOREIGN KEY (`ubi_alm_id`) REFERENCES `almacenes`(`alm_id`) ON DELETE CASCADE ON UPDATE CASCADE;
    ALTER TABLE `adscripciones` CHANGE `ads_motivo` `ads_desc` VARCHAR(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL;




CREATE TABLE `company5_bd_cacel`.`logs` (
    `log_id` BIGINT NOT NULL AUTO_INCREMENT , 
    `log_table` VARCHAR(100) NOT NULL , 
    `log_sql` TEXT NOT NULL , 
    `log_restore` TEXT NOT NULL , 
    `log_datetime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP , 
    PRIMARY KEY (`log_id`)) ENGINE = InnoDB;



INSERT INTO `empresas` (`gem_id`, `gem_ruc`, `gem_razonsocial`, `gem_direccion`, `gem_gdi_id`, `gem_email`, `gem_status`) VALUES 
(NULL, '20609315327', 'IMPORT & EXPORT FIVADOYS S.A.C.', 'CAR.CAR. PANAMERICANA NORTE KM 232.5 LOTE. 06', '150125', NULL, '1');
INSERT INTO `clientes` (`gcl_id`, `gcl_gem_id`, `gcl_imagen`, `gcl_correo`, `gcl_pweb`, `gcl_telefono`, `gcl_status`) VALUES 
(NULL, '16', 'liferli.png', 'inversionesferlisac@gmail.com', 'www.page.com', '922012611', '1');
INSERT INTO `usuarios` (`gus_id`, `gus_gpe_id`, `gus_imagen`, `gus_gro_id`, `gus_user`, `gus_password`, `gus_token`, `gus_create`, `gus_update`, `gus_telefono`, `gus_gcl_id`, `gus_gar_id`, `gus_status`) VALUES 
(NULL, '141', NULL, '2', 'norte3@companycacel.com', '', NULL, '2023-01-19 14:21:28', '2023-01-19 14:21:28', NULL, '3', '3', '1');