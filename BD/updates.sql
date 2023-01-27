
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

ALTER TABLE `mdetalles` ADD `mde_ref_mov_id` BIGINT NULL AFTER `mde_des`;