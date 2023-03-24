
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


CREATE TABLE `company5_bd_20602849172`.`prices` (`pri_id` BIGINT NOT NULL AUTO_INCREMENT ,
 `pri_bie_id` BIGINT NOT NULL , 
 `pri_tipo` INT NOT NULL ,
 `pri_p` DECIMAL(7,4) NOT NULL , 
 `pri_fecha` DATETIME NOT NULL ,
  PRIMARY KEY (`pri_id`)) ENGINE = InnoDB;

  ALTER TABLE `prices` ADD CONSTRAINT `prices_bienes` FOREIGN KEY (`pri_bie_id`) REFERENCES `bienes`(`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE `prices` ADD `pri_gus_id` BIGINT NOT NULL AFTER `pri_fecha`;
  ALTER TABLE `prices` ADD  CONSTRAINT `prices_gusuarios` FOREIGN KEY (`pri_gus_id`) REFERENCES `company5_bd_cacel`.`usuarios`(`gus_id`) ON DELETE CASCADE ON UPDATE CASCADE;

  SELECT MAX(`pri_fecha`) FROM `prices` WHERE `pri_bie_id`= 4;
(SELECT DISTINCT `pri_bie_id` from `prices` WHERE `pri_tipo` = 1);
SELECT max(`pri_fecha`) FROM `prices` WHERE `pri_tipo`=1 and `pri_bie_id`= 4;

CREATE TABLE `company5_bd_20602849172`.`rcomisiones` (`rco_id` 
BIGINT NOT NULL AUTO_INCREMENT , `rco_bie_id` BIGINT NOT NULL , `rco_q` 
DECIMAL(12,4) NOT NULL , `rco_st` DECIMAL(12,4) NOT NULL , `rco_porc` 
DECIMAL(12,4) NOT NULL , `rco_fecha` DATE NOT NULL , PRIMARY KEY (`rco_id`)) ENGINE = InnoDB;

ALTER TABLE `rcomisiones` ADD CONSTRAINT `rcomisiones_bienes` FOREIGN KEY (`rco_bie_id`) REFERENCES `bienes`(`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `rcomisiones` ADD `rco_age_id` BIGINT NOT NULL AFTER `rco_bie_id`;
ALTER TABLE `rcomisiones` ADD CONSTRAINT `rcomisiones_agentes` FOREIGN KEY (`rco_age_id`) REFERENCES `agentes`(`age_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `rcomisiones` CHANGE `rco_porc` `rco_porc` DECIMAL(12,4) NOT NULL DEFAULT '0';



CREATE TABLE `nrcomisiones` (
  `nrc_id` bigint PRIMARY KEY AUTO_INCREMENT,
  `nrc_fechai` date NOT NULL,
  `nrc_fechaf` date NOT NULL,
  `nrc_age_id` bigint NOT NULL,
  `nrc_monto` decimal(12,4) NOT NULL,
  `nrc_gus_id` bigint NOT NULL,
  `rco_json` json NOT NULL,
  `rco_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rco_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

ALTER TABLE `nrcomisiones` ADD CONSTRAINT `nrc_age` FOREIGN KEY (`nrc_age_id`) REFERENCES `agentes`(`age_id`) ON DELETE CASCADE ON UPDATE CASCADE; ALTER TABLE `nrcomisiones` ADD CONSTRAINT `nrc_gus` FOREIGN KEY (`nrc_gus_id`) REFERENCES `company5_bd_cacel`.`usuarios`(`gus_id`) ON DELETE CASCADE ON UPDATE CASCADE;