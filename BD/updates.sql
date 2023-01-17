

ALTER TABLE `colaboradores` ADD `col_ppagos` JSON NULL DEFAULT NULL AFTER `col_fechaIT`;

CREATE TABLE `company5_bd_20602849172`.
`sweeks`(`swe_id`
    INT NOT NULL AUTO_INCREMENT, `swe_col_id`
    BIGINT NOT NULL, `swe_week`
    INT NOT NULL, `swe_saldo`
    DECIMAL(12, 6) NOT NULL, PRIMARY KEY(`swe_id`)) ENGINE = InnoDB;


    ALTER TABLE `sweeks` ADD CONSTRAINT `sweeks_colaborador` FOREIGN KEY (`swe_col_id`) REFERENCES `colaboradores`(`col_id`) ON DELETE CASCADE ON UPDATE CASCADE;


    ALTER TABLE `colaboradores` CHANGE `col_ppagos` `col_hsbase` JSON NULL DEFAULT NULL;