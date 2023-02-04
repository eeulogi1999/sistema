
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


ALTER TABLE `agentes` ADD `age_gt4_id` BIGINT NOT NULL DEFAULT '1' AFTER `age_monto`;
ALTER TABLE `agentes` ADD CONSTRAINT `agentes_t4monedas` FOREIGN KEY (`age_gt4_id`) REFERENCES `company5_bd_cacel`.`t4monedas`(`gt4_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `cajas` ADD `caj_tce_id` BIGINT NULL AFTER `caj_caj_id`;
ALTER TABLE `cajas` ADD CONSTRAINT `cajas_tcespeciales` FOREIGN KEY (`caj_tce_id`) REFERENCES `tcespeciales`(`tce_id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `movimientos` CHANGE `mov_serie` `mov_serie` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL;


ALTER TABLE `tcambios` ADD `gtc_origen` INT NOT NULL DEFAULT '1' AFTER `gtc_gt4_id`;


CREATE TABLE `company5_bd_20602849172`.`simulaciones` (`sim_id` BIGINT NOT NULL AUTO_INCREMENT ,
 `sim_tipo` INT NOT NULL , `sim_bie_id` BIGINT NOT NULL , `sim_qtn` DECIMAL(12,6) NOT NULL DEFAULT '20' ,
  `sin_qkg` DECIMAL(12,6) NOT NULL DEFAULT '1' , `sim_ptn` DECIMAL(12,6) NOT NULL ,
   `sim_pkg` DECIMAL(12,6) NOT NULL , `sim_p_1` DECIMAL(12,6) NULL , `sim_p_2` DECIMAL(12,6) NULL ,
    `sim_p_3` DECIMAL(12,6) NULL , `sim_p_4` DECIMAL(12,6) NULL , `sim_det` DECIMAL(6,4) NOT NULL DEFAULT '17.7' ,
     `sim_exp` DECIMAL(6,4) NOT NULL DEFAULT '93' , `sim_cadm` DECIMAL(6,4) NOT NULL DEFAULT '15' , 
     `sim_plus` DECIMAL(6,4) NOT NULL DEFAULT '0' , `sim_created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP , 
     `sim_gus_id` BIGINT NOT NULL , PRIMARY KEY (`sim_id`)) ENGINE = InnoDB;


     ALTER TABLE `simulaciones` CHANGE `sin_qkg` `sim_qkg` DECIMAL(12,6) NOT NULL DEFAULT '1.000000';
     ALTER TABLE `simulaciones` ADD `sim_obs` TEXT NULL AFTER `sim_gus_id`;
     ALTER TABLE `simulaciones` ADD CONSTRAINT `simulaciones_bienes` FOREIGN KEY (`sim_bie_id`) REFERENCES `bienes`(`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE;
     ALTER TABLE `simulaciones` ADD CONSTRAINT `simulaciones_usuarios` FOREIGN KEY (`sim_gus_id`) REFERENCES `company5_bd_cacel`.`usuarios`(`gus_id`) ON DELETE CASCADE ON UPDATE CASCADE;
     ALTER TABLE `simulaciones` ADD `sim_g` DECIMAL(12,6) NOT NULL DEFAULT '0.56' AFTER `sim_p_4`;
     ALTER TABLE `simulaciones` ADD `sim_tce_id` BIGINT NOT NULL AFTER `sim_g`;
     ALTER TABLE `simulaciones` ADD CONSTRAINT `simulaciones_tcespeciales` FOREIGN KEY (`sim_tce_id`) REFERENCES `tcespeciales`(`tce_id`) ON DELETE CASCADE ON UPDATE CASCADE;
     ALTER TABLE `simulaciones` ADD `sim_pc` DECIMAL(12,6) NOT NULL DEFAULT '29' AFTER `sim_p_4`;
     ALTER TABLE `simulaciones` ADD `sim_pm` DECIMAL(12,6) NOT NULL DEFAULT '29' AFTER `sim_pc`;
     ALTER TABLE `simulaciones` ADD `sim_igv` DECIMAL(12,6) NOT NULL AFTER `sim_exp`;

     ALTER TABLE `simulaciones` ADD `sim_imp` DECIMAL(12,6) NOT NULL AFTER `sim_igv`;