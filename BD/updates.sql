
ALTER TABLE `mdetalles` ADD `mde_des` JSON NULL AFTER `mde_igv`;

ALTER TABLE `mdetalles` ADD `mde_desm` DECIMAL(12,6) NULL AFTER `mde_des`;


CREATE TABLE `u125097058_bd_graciela`.`descuentos` 
(`des_id` BIGINT NOT NULL AUTO_INCREMENT , `des_t6m_id` BIGINT NOT NULL ,
 `des_tga_id` BIGINT NOT NULL , `des_q` DECIMAL(12,4) NOT NULL ,
  `des_p` DECIMAL(12,4) NOT NULL , `des_mt` DECIMAL(12,4) NOT NULL ,
   `des_mov_id` BIGINT NOT NULL , PRIMARY KEY (`des_id`)) ENGINE = InnoDB;
   ALTER TABLE `descuentos` ADD CONSTRAINT `descuentos_t6medidas` FOREIGN KEY (`des_t6m_id`) REFERENCES `t6medidas`(`t6m_id`) ON DELETE CASCADE ON UPDATE CASCADE;
   ALTER TABLE `descuentos` ADD CONSTRAINT `descuentos_tgastos` FOREIGN KEY (`des_tga_id`) REFERENCES `tgastos`(`tga_id`) ON DELETE CASCADE ON UPDATE CASCADE;
   ALTER TABLE `descuentos` ADD CONSTRAINT `descuentos_movimientos` FOREIGN KEY (`des_mov_id`) REFERENCES `movimientos`(`mov_id`) ON DELETE CASCADE ON UPDATE CASCADE;

   INSERT INTO `tgastos` (`tga_id`, `tga_nombre`, `tga_status`) VALUES (NULL, 'FLETE', '1'), (NULL, 'CAJA 1', '1'), (NULL, 'CAJA 2', '1'), (NULL, 'CAJA 3', '1'), (NULL, 'CAJA 4', '1'), (NULL, 'BOLSA 1', '1'), (NULL, 'BOLSA 2', '1'), (NULL, 'BOLSA 3', '1');