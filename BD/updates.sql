
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

-- now 2023-01-26
SET global general_log = 1;
SET global log_output = 'table';


SET GLOBAL general_log = 'OFF';
RENAME TABLE general_log TO general_log_temp;
DELETE FROM `general_log_temp` WHERE `event_time` < '2023-01-27';
RENAME TABLE general_log_temp TO general_log;
SET GLOBAL general_log = 'ON';
select * from mysql.general_log
--jdsiuf