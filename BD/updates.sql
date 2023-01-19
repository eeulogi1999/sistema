

ALTER TABLE `colaboradores` ADD `col_ppagos` JSON NULL DEFAULT NULL AFTER `col_fechaIT`;

CREATE TABLE `company5_bd_20602849172`.
`sweeks`(`swe_id`
    INT NOT NULL AUTO_INCREMENT, `swe_col_id`
    BIGINT NOT NULL, `swe_week`
    INT NOT NULL, `swe_saldo`
    DECIMAL(12, 6) NOT NULL, PRIMARY KEY(`swe_id`)) ENGINE = InnoDB;


    ALTER TABLE `sweeks` ADD CONSTRAINT `sweeks_colaborador` FOREIGN KEY (`swe_col_id`) REFERENCES `colaboradores`(`col_id`) ON DELETE CASCADE ON UPDATE CASCADE;


    ALTER TABLE `colaboradores` CHANGE `col_ppagos` `col_hsbase` JSON NULL DEFAULT NULL;



    ALTER TABLE `cuentas` ADD `cue_porcentaje` INT NULL AFTER `cue_gt4_id`;


    ALTER TABLE `ubicaciones` CHANGE `ubi_piso` `ubi_clave` VARCHAR(220) DEFAULT 'Nombre';
    ALTER TABLE `ubicaciones` CHANGE `ubi_etrabajo` `ubi_valor` VARCHAR(220) NOT NULL;
    ALTER TABLE `ubicaciones` ADD `ubi_ubi_id` BIGINT NULL AFTER `ubi_valor`;
    ALTER TABLE `ubicaciones` ADD `ubi_status` INT NOT NULL DEFAULT '1' AFTER `ubi_ubi_id`;
    ALTER TABLE `ubicaciones` CHANGE `ubi_gdi_id` `ubi_gdi_id` BIGINT NULL;
    ALTER TABLE `ubicaciones` CHANGE `ubi_gar_id` `ubi_gar_id` BIGINT NULL;

    ALTER TABLE `activos` ADD `act_valor` DECIMAL(12,6) NOT NULL DEFAULT '0' AFTER `act_act_id`;
    ALTER TABLE `activos` CHANGE `act_t9p_id` `act_t9p_id` BIGINT NULL;