-- MySQL dump 10.13  Distrib 5.7.23-23, for Linux (x86_64)
--
-- Host: localhost    Database: company5_bd_20602849172
-- ------------------------------------------------------
-- Server version	5.7.23-23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Table structure for table `aatributos`
--

DROP TABLE IF EXISTS `aatributos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aatributos` (
  `aat_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `aat_act_id` bigint(20) NOT NULL,
  `aat_val_id` bigint(20) NOT NULL,
  PRIMARY KEY (`aat_id`),
  KEY `aatributos_activos` (`aat_act_id`),
  KEY `aatributos_valores` (`aat_val_id`),
  CONSTRAINT `aatributos_activos` FOREIGN KEY (`aat_act_id`) REFERENCES `activos` (`act_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aatributos_valores` FOREIGN KEY (`aat_val_id`) REFERENCES `valores` (`val_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aatributos`
--

LOCK TABLES `aatributos` WRITE;
/*!40000 ALTER TABLE `aatributos` DISABLE KEYS */;
/*!40000 ALTER TABLE `aatributos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acreditos`
--

DROP TABLE IF EXISTS `acreditos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acreditos` (
  `acr_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `acr_monto` decimal(12,6) NOT NULL,
  `acr_ncuota` int(12) NOT NULL,
  `acr_interes` decimal(6,4) NOT NULL,
  `acr_fechapago` date NOT NULL,
  PRIMARY KEY (`acr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acreditos`
--

LOCK TABLES `acreditos` WRITE;
/*!40000 ALTER TABLE `acreditos` DISABLE KEYS */;
/*!40000 ALTER TABLE `acreditos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activos`
--

DROP TABLE IF EXISTS `activos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activos` (
  `act_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `act_codigo` varchar(250) NOT NULL,
  `act_nombre` varchar(250) NOT NULL,
  `act_t9p_id` bigint(20) NOT NULL,
  `act_act_id` bigint(20) DEFAULT NULL,
  `act_img` varchar(200) DEFAULT NULL,
  `act_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`act_id`),
  KEY `activos_t9plancontables` (`act_t9p_id`),
  CONSTRAINT `activos_t9plancontables` FOREIGN KEY (`act_t9p_id`) REFERENCES `t9plancontables` (`t9p_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activos`
--

LOCK TABLES `activos` WRITE;
/*!40000 ALTER TABLE `activos` DISABLE KEYS */;
/*!40000 ALTER TABLE `activos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adetalles`
--

DROP TABLE IF EXISTS `adetalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adetalles` (
  `ade_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ade_q` int(11) NOT NULL,
  `ade_act_id` bigint(20) NOT NULL,
  `ade_serie` varchar(200) DEFAULT NULL,
  `ade_fechaA` date NOT NULL,
  `ade_vutil` int(11) NOT NULL,
  `ade_vu` decimal(12,6) NOT NULL,
  `ade_mt` decimal(12,6) NOT NULL,
  `ade_ads_id` bigint(20) NOT NULL,
  PRIMARY KEY (`ade_id`),
  KEY `adetalles_activos` (`ade_act_id`),
  KEY `adetalles_adscripciones` (`ade_ads_id`),
  CONSTRAINT `adetalles_activos` FOREIGN KEY (`ade_act_id`) REFERENCES `activos` (`act_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `adetalles_adscripciones` FOREIGN KEY (`ade_ads_id`) REFERENCES `adscripciones` (`ads_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adetalles`
--

LOCK TABLES `adetalles` WRITE;
/*!40000 ALTER TABLE `adetalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `adetalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adscripciones`
--

DROP TABLE IF EXISTS `adscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adscripciones` (
  `ads_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ads_cunico` int(11) NOT NULL,
  `ads_fecha` date NOT NULL,
  `ads_col_id` bigint(20) DEFAULT NULL,
  `ads_ubi_id` bigint(20) NOT NULL,
  `ads_tipo` int(2) NOT NULL,
  `ads_motivo` varchar(250) DEFAULT NULL,
  `ads_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ads_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ads_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ads_id`),
  KEY `adscripciones_colaboradores` (`ads_col_id`),
  KEY `adscripciones_ubicaciones` (`ads_ubi_id`),
  CONSTRAINT `adscripciones_colaboradores` FOREIGN KEY (`ads_col_id`) REFERENCES `colaboradores` (`col_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `adscripciones_ubicaciones` FOREIGN KEY (`ads_ubi_id`) REFERENCES `ubicaciones` (`ubi_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adscripciones`
--

LOCK TABLES `adscripciones` WRITE;
/*!40000 ALTER TABLE `adscripciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `adscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agentes`
--

DROP TABLE IF EXISTS `agentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agentes` (
  `age_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `age_gpe_id` bigint(20) DEFAULT NULL,
  `age_gem_id` bigint(20) DEFAULT NULL,
  `age_tipo` int(11) NOT NULL DEFAULT '1',
  `age_arrbienes` json DEFAULT NULL,
  `age_monto` decimal(12,6) DEFAULT NULL,
  `age_status` int(11) NOT NULL DEFAULT '1',
  `age_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `age_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`age_id`),
  KEY `agentes_gpersonas` (`age_gpe_id`),
  KEY `agentes_gempresas` (`age_gem_id`),
  CONSTRAINT `agentes_gempresas` FOREIGN KEY (`age_gem_id`) REFERENCES `company5_se_socios`.`empresas` (`gem_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `agentes_gpersonas` FOREIGN KEY (`age_gpe_id`) REFERENCES `company5_se_socios`.`personas` (`gpe_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agentes`
--

LOCK TABLES `agentes` WRITE;
/*!40000 ALTER TABLE `agentes` DISABLE KEYS */;
INSERT INTO `agentes` (`age_id`, `age_gpe_id`, `age_gem_id`, `age_tipo`, `age_arrbienes`, `age_monto`, `age_status`, `age_created`, `age_updated`) VALUES (1,10,NULL,1,NULL,NULL,1,'2022-07-25 13:41:19','2022-07-25 13:41:19'),(2,NULL,12,2,NULL,NULL,1,'2022-12-23 16:49:00','2022-12-23 16:49:00');
/*!40000 ALTER TABLE `agentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almacenes`
--

DROP TABLE IF EXISTS `almacenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almacenes` (
  `alm_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alm_gdi_id` bigint(20) NOT NULL,
  `alm_nombre` varchar(20) NOT NULL,
  `alm_direccion` varchar(200) NOT NULL,
  `alm_imagen` varchar(100) DEFAULT NULL,
  `alm_est_id` bigint(20) NOT NULL,
  `alm_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `alm_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `alm_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`alm_id`),
  KEY `almacenes_estableciminetos` (`alm_est_id`),
  KEY `almacenes_gdistritos` (`alm_gdi_id`),
  CONSTRAINT `almacenes_estableciminetos` FOREIGN KEY (`alm_est_id`) REFERENCES `establecimientos` (`est_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `almacenes_gdistritos` FOREIGN KEY (`alm_gdi_id`) REFERENCES `company5_se_socios`.`distritos` (`gdi_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacenes`
--

LOCK TABLES `almacenes` WRITE;
/*!40000 ALTER TABLE `almacenes` DISABLE KEYS */;
INSERT INTO `almacenes` (`alm_id`, `alm_gdi_id`, `alm_nombre`, `alm_direccion`, `alm_imagen`, `alm_est_id`, `alm_created`, `alm_updated`, `alm_status`) VALUES (1,150125,'PRINCIPAL','Mz A, lote 12, tambo Inga, Ref. km 27 Panam. Norte',NULL,1,'2022-07-25 12:30:55','2022-07-25 12:30:55',1);
/*!40000 ALTER TABLE `almacenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistencias`
--

DROP TABLE IF EXISTS `asistencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asistencias` (
  `asi_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `asi_col_id` bigint(20) NOT NULL,
  `asi_ext` int(11) DEFAULT NULL,
  `asi_horaE` datetime NOT NULL,
  `asi_horaS` datetime DEFAULT NULL,
  `asi_obs` text,
  PRIMARY KEY (`asi_id`),
  KEY `asistencias_colaboradores` (`asi_col_id`),
  CONSTRAINT `asistencias_ibfk_1` FOREIGN KEY (`asi_col_id`) REFERENCES `colaboradores` (`col_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batributos`
--

DROP TABLE IF EXISTS `batributos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batributos` (
  `bat_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bat_bie_id` bigint(20) DEFAULT NULL,
  `bat_val_id` bigint(20) NOT NULL,
  PRIMARY KEY (`bat_id`),
  KEY `batributos_valores` (`bat_val_id`),
  KEY `batributos_bienes` (`bat_bie_id`),
  CONSTRAINT `batributos_bienes` FOREIGN KEY (`bat_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `batributos_valores` FOREIGN KEY (`bat_val_id`) REFERENCES `valores` (`val_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batributos`
--

LOCK TABLES `batributos` WRITE;
/*!40000 ALTER TABLE `batributos` DISABLE KEYS */;
/*!40000 ALTER TABLE `batributos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bbienes`
--

DROP TABLE IF EXISTS `bbienes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbienes` (
  `bbi_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bbi_t5e_id` bigint(20) NOT NULL,
  `bbi_c70_id` bigint(20) NOT NULL,
  `bbi_c60_id` bigint(20) NOT NULL,
  `bbi_c61_id` bigint(20) NOT NULL,
  PRIMARY KEY (`bbi_id`),
  KEY `bbienes_t5existencias` (`bbi_t5e_id`),
  KEY `bbienes_c70_t9plancontables` (`bbi_c70_id`),
  KEY `bbienes_c60_t9plancontables` (`bbi_c60_id`),
  KEY `bbienes_c61_t9plancontables` (`bbi_c61_id`),
  CONSTRAINT `bbienes_c60_t9plancontables` FOREIGN KEY (`bbi_c60_id`) REFERENCES `t9plancontables` (`t9p_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bbienes_c61_t9plancontables` FOREIGN KEY (`bbi_c61_id`) REFERENCES `t9plancontables` (`t9p_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bbienes_c70_t9plancontables` FOREIGN KEY (`bbi_c70_id`) REFERENCES `t9plancontables` (`t9p_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bbienes_t5existencias` FOREIGN KEY (`bbi_t5e_id`) REFERENCES `t5existencias` (`t5e_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbienes`
--

LOCK TABLES `bbienes` WRITE;
/*!40000 ALTER TABLE `bbienes` DISABLE KEYS */;
INSERT INTO `bbienes` (`bbi_id`, `bbi_t5e_id`, `bbi_c70_id`, `bbi_c60_id`, `bbi_c61_id`) VALUES (1,1,1576,1170,1206),(2,1,1576,1170,1206),(3,1,1576,1170,1206),(4,1,1576,1170,1206),(5,1,1576,1170,1206),(6,1,1576,1170,1206),(7,1,1576,1170,1206),(8,1,1576,1170,1206),(9,1,1576,1170,1206),(10,1,1576,1170,1206),(11,1,1576,1170,1206),(12,1,1576,1170,1206),(13,1,1576,1170,1206),(14,1,1576,1170,1206),(15,1,1576,1170,1206),(16,1,1576,1170,1206),(17,1,1576,1170,1206),(18,1,1576,1170,1206),(19,1,1576,1170,1206),(20,1,1576,1170,1206),(21,1,1576,1170,1206),(22,1,1576,1170,1206),(23,1,1576,1170,1206),(24,1,1576,1170,1206),(25,1,1576,1170,1206),(26,1,1576,1170,1206),(27,1,1576,1170,1206),(28,1,1576,1170,1206),(29,1,1576,1170,1206),(30,1,1576,1170,1206),(31,1,1576,1170,1206),(32,1,1576,1170,1206),(33,1,1576,1170,1206),(34,1,1576,1170,1206),(35,1,1576,1170,1206),(36,1,1576,1170,1206),(37,1,1576,1170,1206),(38,1,1576,1170,1206),(39,1,1576,1170,1206),(40,1,1576,1170,1206),(41,1,1576,1170,1206),(42,1,1576,1170,1206),(43,1,1576,1170,1206),(44,1,1576,1170,1206),(45,1,1576,1170,1206),(46,1,1576,1170,1206),(47,1,1576,1170,1206),(48,1,1576,1170,1206),(49,1,1576,1170,1206),(50,1,1576,1170,1206),(51,1,1576,1170,1206),(52,1,1576,1170,1206);
/*!40000 ALTER TABLE `bbienes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bienes`
--

DROP TABLE IF EXISTS `bienes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bienes` (
  `bie_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bie_codigo` varchar(12) NOT NULL,
  `bie_nombre` varchar(200) NOT NULL,
  `bie_bbi_id` bigint(20) DEFAULT NULL,
  `bie_t6m_id` bigint(20) DEFAULT NULL,
  `bie_bie_id` bigint(20) DEFAULT NULL,
  `bie_alm_id` json NOT NULL,
  `bie_p` decimal(12,6) NOT NULL DEFAULT '0.000000',
  `bie_igv` tinyint(1) NOT NULL DEFAULT '0',
  `bie_img` text,
  `bie_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`bie_id`),
  KEY `bienes_bbienes` (`bie_bbi_id`),
  KEY `bienes_t6medidas` (`bie_t6m_id`),
  CONSTRAINT `bienes_bbienes` FOREIGN KEY (`bie_bbi_id`) REFERENCES `bbienes` (`bbi_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bienes_t6medidas` FOREIGN KEY (`bie_t6m_id`) REFERENCES `t6medidas` (`t6m_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bienes`
--

LOCK TABLES `bienes` WRITE;
/*!40000 ALTER TABLE `bienes` DISABLE KEYS */;
INSERT INTO `bienes` (`bie_id`, `bie_codigo`, `bie_nombre`, `bie_bbi_id`, `bie_t6m_id`, `bie_bie_id`, `bie_alm_id`, `bie_p`, `bie_igv`, `bie_img`, `bie_status`) VALUES (4,'CO001','Cobre Brillante',5,23,NULL,'[1]',26.000000,0,'[]',1),(5,'CO002','Cobre Grueso',6,23,NULL,'[1]',24.500000,0,'[]',1),(6,'CO003','Cobre Delgado',7,23,NULL,'[1]',24.000000,0,'[]',1),(7,'CO004','Cobre Estañado',8,23,NULL,'[1]',24.500000,0,'[]',1),(8,'CO005','Cobre Telefonico',9,23,NULL,'[1]',24.000000,0,'[]',1),(9,'CO006','Escoria de cobre',10,23,NULL,'[1]',13.000000,0,'[]',1),(10,'CO007','Tierra de cobre',11,23,NULL,'[1]',7.000000,0,'[]',1),(11,'BR001','Bronce Limpio',12,23,NULL,'[1]',15.410000,0,'[]',1),(12,'BR002','Bronce Sucio',13,23,NULL,'[1]',15.410000,0,'[]',1),(13,'BR003','Bronce Rojo',14,23,NULL,'[1]',15.410000,0,'[]',1),(14,'BR004','Bronce Masiso',15,23,NULL,'[1]',15.410000,0,'[]',1),(15,'BR005','Viruta de Bronce',16,23,NULL,'[1]',15.410000,0,'[]',1),(16,'BR006','Radiador de Bronce',17,23,NULL,'[1]',15.410000,0,'[]',1),(17,'PB001','Plomo chatarra ',18,23,NULL,'[1]',5.000000,0,'[]',1),(18,'PB002','Plomo lingote',19,23,NULL,'[1]',5.500000,0,'[]',1),(19,'PB003','Grupo Automotriz',20,23,NULL,'[1]',5.000000,0,'[]',1),(20,'PB004','Grupo Industrial',21,23,NULL,'[1]',5.000000,0,'[]',1),(21,'PB005','Bateria Estandar',22,58,NULL,'[1]',65.000000,0,'[]',1),(22,'PB006','Tierra de baterias',23,23,NULL,'[1]',3.500000,0,'[]',1),(23,'AL001','Aluminio Duro',24,23,NULL,'[1]',4.000000,0,'[]',1),(24,'AL002','Aluminio Perfil',25,23,NULL,'[1]',4.000000,0,'[]',1),(25,'AL003','Cocalata ',26,23,NULL,'[1]',4.000000,0,'[]',1),(26,'AL004','Radiador de Aluminio',27,23,NULL,'[1]',4.000000,0,'[]',1),(27,'AL005','Antimonio',28,23,NULL,'[1]',4.000000,0,'[]',1),(28,'AL006','Aluminio Olla Limpia',29,23,NULL,'[1]',4.000000,0,'[]',1),(29,'AL007','Aluminio Olla Sucia',30,23,NULL,'[1]',4.000000,0,'[]',1),(30,'AL008','Aluminio Cable Limpio',31,23,NULL,'[1]',4.000000,0,'[]',1),(31,'AL009','Aluminio Cable Sulfa.',32,23,NULL,'[1]',5.000000,0,'[]',1),(32,'AL010','Aluminio Cable Grasa',33,23,NULL,'[1]',5.000000,0,'[]',1),(33,'AL011','Chapa ',34,23,NULL,'[1]',3.000000,0,'[]',1),(34,'AL012','Bocamasa',35,23,NULL,'[1]',3.000000,0,'[]',1),(35,'AL013','Carroceria',36,23,NULL,'[1]',4.000000,0,'[]',1),(36,'AL014','Offset',37,23,NULL,'[1]',4.000000,0,'[]',1),(37,'AC001','Acero Inox',38,23,NULL,'[1]',6.000000,0,'[]',1),(38,'AC002','Acero Chino',39,23,NULL,'[1]',4.000000,0,'[]',1),(39,'FI001','Chatarra ',40,23,NULL,'[1]',0.500000,0,'[]',1),(40,'FI002','Fierro Fundido',41,23,NULL,'[1]',1.000000,0,'[]',1),(41,'PL001','Casco plastico ',42,23,NULL,'[1]',2.500000,0,'[]',1),(43,'CO008','Radiado de CU / AL',44,23,NULL,'[1]',5.000000,0,'[]',1),(44,'AL15','Viruta de Aluminio',46,23,NULL,'[1]',4.000000,0,'[]',1),(45,'PL','PVC',47,23,NULL,'[1]',2.000000,0,'[]',1),(46,'PL','FILL',48,23,NULL,'[1]',2.000000,0,'[]',1),(47,'JAVA','JAVA',49,23,NULL,'[1]',0.000000,0,'[]',1),(48,'PL','LONA',50,23,NULL,'[1]',2.000000,0,'[]',1),(49,'PL','PET BOTELLA',51,23,NULL,'[1]',2.500000,0,'[]',1),(50,'CBL','Cable Blando',52,23,50,'[1]',8.000000,0,'[]',1);
/*!40000 ALTER TABLE `bienes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cajas`
--

DROP TABLE IF EXISTS `cajas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cajas` (
  `caj_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `caj_tipo` int(1) NOT NULL,
  `caj_numero` bigint(20) NOT NULL,
  `caj_tga_id` bigint(20) DEFAULT NULL,
  `caj_responsable` text,
  `caj_fecha` date NOT NULL,
  `caj_col_id` bigint(20) DEFAULT NULL,
  `caj_age_id` bigint(20) DEFAULT NULL,
  `caj_observaciones` text,
  `caj_cue_id` bigint(20) DEFAULT NULL,
  `caj_t1m_id` bigint(20) DEFAULT NULL,
  `caj_gt4_id` bigint(20) DEFAULT '1',
  `caj_monto` decimal(24,4) NOT NULL,
  `caj_gus_id` bigint(20) DEFAULT NULL,
  `caj_caj_id` bigint(20) DEFAULT NULL,
  `caj_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `caj_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `caj_status` int(1) DEFAULT '1',
  PRIMARY KEY (`caj_id`),
  KEY `cajas_tgastos` (`caj_tga_id`),
  KEY `cajas_colaboradores` (`caj_col_id`),
  KEY `cajas_agentes` (`caj_age_id`),
  KEY `cajas_cuentas` (`caj_cue_id`),
  KEY `cajas_t1mediopagos` (`caj_t1m_id`),
  KEY `cajas_gt4monedas` (`caj_gt4_id`),
  KEY `cajas_gusuarios` (`caj_gus_id`),
  CONSTRAINT `cajas_agentes` FOREIGN KEY (`caj_age_id`) REFERENCES `agentes` (`age_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cajas_colaboradores` FOREIGN KEY (`caj_col_id`) REFERENCES `colaboradores` (`col_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cajas_cuentas` FOREIGN KEY (`caj_cue_id`) REFERENCES `cuentas` (`cue_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cajas_gt4monedas` FOREIGN KEY (`caj_gt4_id`) REFERENCES `company5_se_socios`.`t4monedas` (`gt4_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cajas_gusuarios` FOREIGN KEY (`caj_gus_id`) REFERENCES `company5_se_socios`.`usuarios` (`gus_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cajas_t1mediopagos` FOREIGN KEY (`caj_t1m_id`) REFERENCES `t1mediopagos` (`t1m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cajas_tgastos` FOREIGN KEY (`caj_tga_id`) REFERENCES `tgastos` (`tga_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `cdetalles`
--

DROP TABLE IF EXISTS `cdetalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdetalles` (
  `cde_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cde_bie_id` bigint(20) DEFAULT NULL,
  `cde_ser_id` bigint(20) DEFAULT NULL,
  `cde_t6m_id` bigint(20) NOT NULL,
  `cde_com_id` bigint(20) NOT NULL,
  `cde_gta_id` bigint(20) NOT NULL,
  `cde_q` decimal(12,6) NOT NULL,
  `cde_vu` decimal(12,6) NOT NULL,
  `cde_igv` tinyint(1) NOT NULL,
  `cde_importe` decimal(24,12) NOT NULL,
  PRIMARY KEY (`cde_id`),
  KEY `cdetalles_servicios` (`cde_ser_id`),
  KEY `cdetalles_bienes` (`cde_bie_id`),
  KEY `cdetalles_t6medidas` (`cde_t6m_id`),
  KEY `cdetalles_comprobantes` (`cde_com_id`),
  KEY `cdetalles_tafectaciones` (`cde_gta_id`),
  CONSTRAINT `cdetalles_bienes` FOREIGN KEY (`cde_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cdetalles_comprobantes` FOREIGN KEY (`cde_com_id`) REFERENCES `comprobantes` (`com_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cdetalles_servicios` FOREIGN KEY (`cde_ser_id`) REFERENCES `servicios` (`ser_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cdetalles_t6medidas` FOREIGN KEY (`cde_t6m_id`) REFERENCES `t6medidas` (`t6m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cdetalles_tafectaciones` FOREIGN KEY (`cde_gta_id`) REFERENCES `company5_se_socios`.`tafectaciones` (`gta_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdetalles`
--

LOCK TABLES `cdetalles` WRITE;
/*!40000 ALTER TABLE `cdetalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdetalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cierremeses`
--

DROP TABLE IF EXISTS `cierremeses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cierremeses` (
  `cie_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cie_periodo` date NOT NULL,
  `cie_alm_id` bigint(20) NOT NULL,
  `cie_bie_id` bigint(20) NOT NULL,
  `cie_qs` decimal(24,12) NOT NULL DEFAULT '0.000000000000',
  `cie_mts` decimal(24,12) NOT NULL DEFAULT '0.000000000000',
  `cie_qc` decimal(24,12) NOT NULL DEFAULT '0.000000000000',
  `cie_mtc` decimal(24,12) NOT NULL DEFAULT '0.000000000000',
  `cie_qv` decimal(24,12) NOT NULL DEFAULT '0.000000000000',
  `cie_mtv` decimal(24,12) NOT NULL DEFAULT '0.000000000000',
  `cie_start` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`cie_id`),
  KEY `cierremeses_bienes` (`cie_bie_id`),
  KEY `cierremeses_almacenes` (`cie_alm_id`),
  CONSTRAINT `cierremeses_almacenes` FOREIGN KEY (`cie_alm_id`) REFERENCES `almacenes` (`alm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cierremeses_bienes` FOREIGN KEY (`cie_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `colaboradores`
--

DROP TABLE IF EXISTS `colaboradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colaboradores` (
  `col_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `col_cod` int(11) NOT NULL,
  `col_gpe_id` bigint(20) NOT NULL,
  `col_gar_id` bigint(20) NOT NULL,
  `col_puesto` varchar(250) NOT NULL,
  `col_est_id` bigint(20) NOT NULL,
  `col_img` varchar(250) DEFAULT NULL,
  `col_ruc` varchar(11) DEFAULT NULL,
  `col_clavesol` varchar(50) DEFAULT NULL,
  `col_cuenta` varchar(50) DEFAULT NULL,
  `col_viaja` tinyint(1) DEFAULT NULL,
  `col_sbase` decimal(12,2) DEFAULT NULL,
  `col_fechaIT` date DEFAULT NULL,
  `col_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`col_id`),
  KEY `colaboradores_establecimientos` (`col_est_id`),
  KEY `colaboradores_personas` (`col_gpe_id`),
  KEY `colaboradores_areas` (`col_gar_id`),
  CONSTRAINT `colaboradores_areas` FOREIGN KEY (`col_gar_id`) REFERENCES `company5_se_socios`.`areas` (`gar_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `colaboradores_establecimientos` FOREIGN KEY (`col_est_id`) REFERENCES `establecimientos` (`est_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `colaboradores_personas` FOREIGN KEY (`col_gpe_id`) REFERENCES `company5_se_socios`.`personas` (`gpe_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `componentes`
--

DROP TABLE IF EXISTS `componentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `componentes` (
  `ico_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ico_procesador` varchar(30) NOT NULL,
  `ico_so` varchar(30) NOT NULL,
  `ico_bios` varchar(30) NOT NULL,
  `ico_perifericos` varchar(200) DEFAULT NULL,
  `ico_programas` varchar(200) DEFAULT NULL,
  `ico_bie_mainboard` bigint(11) DEFAULT NULL,
  `ico_bie_monitor` bigint(11) DEFAULT NULL,
  `ico_bie_teclado` bigint(11) DEFAULT NULL,
  `ico_bie_mouse` bigint(11) DEFAULT NULL,
  `ico_bie_cpoder` bigint(11) DEFAULT NULL,
  `ico_bie_hdmi` bigint(11) DEFAULT NULL,
  `ico_bie_vga` bigint(11) DEFAULT NULL,
  `ico_bie_cotro` bigint(11) DEFAULT NULL,
  `ico_bie_ram` bigint(11) DEFAULT NULL,
  `ico_bie_ssd` bigint(11) DEFAULT NULL,
  `ico_bie_hhd` bigint(11) DEFAULT NULL,
  `ico_bie_fuentep` bigint(11) DEFAULT NULL,
  `ico_bie_tarjetag` bigint(11) DEFAULT NULL,
  `ico_bie_tarjetav` bigint(11) DEFAULT NULL,
  `ico_bie_tarjetar` bigint(11) DEFAULT NULL,
  `ico_bie_otroc` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`ico_id`),
  KEY `componentes_bienes_mainboard` (`ico_bie_mainboard`),
  KEY `componentes_bienes_monitor` (`ico_bie_monitor`),
  KEY `componentes_bienes_teclado` (`ico_bie_teclado`),
  KEY `componentes_bienes_mouse` (`ico_bie_mouse`),
  KEY `componentes_bienes_cpoder` (`ico_bie_cpoder`),
  KEY `componentes_bienes_hdmi` (`ico_bie_hdmi`),
  KEY `componentes_bienes_vga` (`ico_bie_vga`),
  KEY `componentes_bienes_cotro` (`ico_bie_cotro`),
  KEY `componentes_bienes_ram` (`ico_bie_ram`),
  KEY `componentes_bienes_ssd` (`ico_bie_ssd`),
  KEY `componentes_bienes_hhd` (`ico_bie_hhd`),
  KEY `componentes_bienes_fuentep` (`ico_bie_fuentep`),
  KEY `componentes_bienes_tarjetag` (`ico_bie_tarjetag`),
  KEY `componentes_bienes_tarjetav` (`ico_bie_tarjetav`),
  KEY `componentes_bienes_tarjetar` (`ico_bie_tarjetar`),
  KEY `componentes_bienes_otroc` (`ico_bie_otroc`),
  CONSTRAINT `componentes_bienes_cotro` FOREIGN KEY (`ico_bie_cotro`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `componentes_bienes_cpoder` FOREIGN KEY (`ico_bie_cpoder`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `componentes_bienes_fuentep` FOREIGN KEY (`ico_bie_fuentep`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `componentes_bienes_hdmi` FOREIGN KEY (`ico_bie_hdmi`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `componentes_bienes_hhd` FOREIGN KEY (`ico_bie_hhd`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `componentes_bienes_mainboard` FOREIGN KEY (`ico_bie_mainboard`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `componentes_bienes_monitor` FOREIGN KEY (`ico_bie_monitor`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `componentes_bienes_mouse` FOREIGN KEY (`ico_bie_mouse`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `componentes_bienes_otroc` FOREIGN KEY (`ico_bie_otroc`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `componentes_bienes_ram` FOREIGN KEY (`ico_bie_ram`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `componentes_bienes_ssd` FOREIGN KEY (`ico_bie_ssd`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `componentes_bienes_tarjetag` FOREIGN KEY (`ico_bie_tarjetag`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `componentes_bienes_tarjetar` FOREIGN KEY (`ico_bie_tarjetar`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `componentes_bienes_tarjetav` FOREIGN KEY (`ico_bie_tarjetav`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `componentes_bienes_teclado` FOREIGN KEY (`ico_bie_teclado`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `componentes_bienes_vga` FOREIGN KEY (`ico_bie_vga`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componentes`
--

LOCK TABLES `componentes` WRITE;
/*!40000 ALTER TABLE `componentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `componentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprobantes`
--

DROP TABLE IF EXISTS `comprobantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprobantes` (
  `com_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `com_age_id` bigint(20) NOT NULL,
  `com_gt4_id` bigint(20) NOT NULL,
  `com_est_id` bigint(20) NOT NULL,
  `com_serie` varchar(4) NOT NULL,
  `com_numero` int(20) NOT NULL,
  `com_t12_id` bigint(20) NOT NULL,
  `com_t10_id` bigint(20) NOT NULL,
  `com_gtc_id` bigint(20) NOT NULL,
  `com_t1m_id` bigint(20) NOT NULL,
  `com_fechaE` date NOT NULL,
  `com_fechaR` date NOT NULL,
  `com_fechaV` date DEFAULT NULL,
  `com_subtotal` decimal(24,12) NOT NULL,
  `com_igv_id` json NOT NULL,
  `com_total` decimal(24,12) NOT NULL,
  `com_observaciones` text NOT NULL,
  `com_acr_id` bigint(20) DEFAULT NULL,
  `com_ncr_id` json DEFAULT NULL,
  `com_ticket` varchar(50) DEFAULT NULL,
  `com_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `com_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `com_cstatus` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`com_id`),
  KEY `comprobantes_agentes` (`com_age_id`),
  KEY `comprobantes_establecimientos` (`com_est_id`),
  KEY `comprobantes_t10comprobantes` (`com_t10_id`),
  KEY `comprobantes_t1mediospagos` (`com_t1m_id`),
  KEY `comprobantes_t12operaciones` (`com_t12_id`),
  KEY `comprobantes_acreditos` (`com_acr_id`),
  KEY `comprobantes_gt4monedas` (`com_gt4_id`),
  CONSTRAINT `comprobantes_acreditos` FOREIGN KEY (`com_acr_id`) REFERENCES `acreditos` (`acr_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comprobantes_agentes` FOREIGN KEY (`com_age_id`) REFERENCES `agentes` (`age_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comprobantes_establecimientos` FOREIGN KEY (`com_est_id`) REFERENCES `establecimientos` (`est_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comprobantes_gt4monedas` FOREIGN KEY (`com_gt4_id`) REFERENCES `company5_se_socios`.`t4monedas` (`gt4_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comprobantes_preliminares` FOREIGN KEY (`com_id`) REFERENCES `preliminares` (`pre_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comprobantes_t10comprobantes` FOREIGN KEY (`com_t10_id`) REFERENCES `t10comprobantes` (`t10_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comprobantes_t12operaciones` FOREIGN KEY (`com_t12_id`) REFERENCES `t12operaciones` (`t12_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comprobantes_t1mediospagos` FOREIGN KEY (`com_t1m_id`) REFERENCES `t1mediopagos` (`t1m_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobantes`
--

LOCK TABLES `comprobantes` WRITE;
/*!40000 ALTER TABLE `comprobantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprobantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuraciones`
--

DROP TABLE IF EXISTS `configuraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuraciones` (
  `con_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `con_clave` varchar(15) NOT NULL,
  `con_valor` varchar(80) NOT NULL,
  PRIMARY KEY (`con_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuraciones`
--

LOCK TABLES `configuraciones` WRITE;
/*!40000 ALTER TABLE `configuraciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuraciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuentas` (
  `cue_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cue_gem_id` bigint(20) DEFAULT NULL,
  `cue_nombre` varchar(200) NOT NULL,
  `cue_numero` int(11) DEFAULT NULL,
  `cue_gt4_id` bigint(20) DEFAULT '1',
  `cue_status` int(1) DEFAULT '1',
  PRIMARY KEY (`cue_id`),
  KEY `cuentas_gempresas` (`cue_gem_id`),
  KEY `cuentas_gt4monedas` (`cue_gt4_id`),
  CONSTRAINT `cuentas_gempresas` FOREIGN KEY (`cue_gem_id`) REFERENCES `company5_se_socios`.`empresas` (`gem_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cuentas_gt4monedas` FOREIGN KEY (`cue_gt4_id`) REFERENCES `company5_se_socios`.`t4monedas` (`gt4_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `establecimientos`
--

DROP TABLE IF EXISTS `establecimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `establecimientos` (
  `est_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `est_nombre` varchar(100) NOT NULL,
  `est_direccion` varchar(200) NOT NULL,
  `est_serie` varchar(2) NOT NULL,
  `est_logo` varchar(100) NOT NULL,
  `est_gdi_id` bigint(20) NOT NULL,
  `est_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `est_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `est_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`est_id`),
  KEY `establecimientos_gdistritos` (`est_gdi_id`),
  CONSTRAINT `establecimientos_gdistritos` FOREIGN KEY (`est_gdi_id`) REFERENCES `company5_se_socios`.`distritos` (`gdi_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `establecimientos`
--

LOCK TABLES `establecimientos` WRITE;
/*!40000 ALTER TABLE `establecimientos` DISABLE KEYS */;
INSERT INTO `establecimientos` (`est_id`, `est_nombre`, `est_direccion`, `est_serie`, `est_logo`, `est_gdi_id`, `est_created`, `est_updated`, `est_status`) VALUES (1,'Puente Piedra','Mz A, lote 12, tambo Inga, Ref. km 27 Panam. Norte','01','cacel.png',150125,'2022-07-25 12:30:55','2022-07-25 12:30:55',1);
/*!40000 ALTER TABLE `establecimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liquidez`
--

DROP TABLE IF EXISTS `liquidez`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liquidez` (
  `liq_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `liq_fecha` date NOT NULL,
  `liq_age_id` bigint(20) DEFAULT NULL,
  `liq_monto` decimal(24,4) DEFAULT NULL,
  `liq_status` int(1) DEFAULT '1',
  PRIMARY KEY (`liq_id`),
  KEY `liquidez_agentes` (`liq_age_id`),
  CONSTRAINT `liquidez_agentes` FOREIGN KEY (`liq_age_id`) REFERENCES `agentes` (`age_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `mdetalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdetalles` (
  `mde_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mde_bie_id` bigint(20) NOT NULL,
  `mde_t6m_id` bigint(20) NOT NULL,
  `mde_gta_id` bigint(20) NOT NULL,
  `mde_mov_id` bigint(20) NOT NULL,
  `mde_q` decimal(12,6) NOT NULL,
  `mde_vu` decimal(12,6) NOT NULL,
  `mde_igv` tinyint(1) NOT NULL,
  `mde_importe` decimal(24,12) NOT NULL,
  `mde_detraccion` int(3) DEFAULT NULL,
  PRIMARY KEY (`mde_id`),
  KEY `mdetalles_bienes` (`mde_bie_id`),
  KEY `mdetalles_t6medidas` (`mde_t6m_id`),
  KEY `mdetalles_movimientos` (`mde_mov_id`),
  KEY `mdetalles_tafectaciones` (`mde_gta_id`),
  CONSTRAINT `mdetalles_bienes` FOREIGN KEY (`mde_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mdetalles_movimientos` FOREIGN KEY (`mde_mov_id`) REFERENCES `movimientos` (`mov_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mdetalles_t6medidas` FOREIGN KEY (`mde_t6m_id`) REFERENCES `t6medidas` (`t6m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mdetalles_tafectaciones` FOREIGN KEY (`mde_gta_id`) REFERENCES `company5_se_socios`.`tafectaciones` (`gta_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `mermas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mermas` (
  `mer_id` bigint(20) NOT NULL,
  `mer_alm_id` bigint(20) NOT NULL,
  `mer_bie_id` bigint(20) NOT NULL,
  `mer_fecha` date NOT NULL,
  `mer_descripcion` varchar(200) DEFAULT NULL,
  `mer_q` decimal(12,6) NOT NULL,
  `mer_vu` decimal(12,6) NOT NULL,
  `mer_mt` decimal(12,6) NOT NULL,
  KEY `mermas_bienes` (`mer_bie_id`),
  KEY `mermas_almacenes` (`mer_alm_id`),
  CONSTRAINT `mermas_almacenes` FOREIGN KEY (`mer_alm_id`) REFERENCES `almacenes` (`alm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mermas_bienes` FOREIGN KEY (`mer_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mermas`
--

LOCK TABLES `mermas` WRITE;
/*!40000 ALTER TABLE `mermas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mermas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mkinternos`
--

DROP TABLE IF EXISTS `mkinternos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mkinternos` (
  `mki_id` bigint(20) NOT NULL,
  `mki_fecha` date NOT NULL,
  `mki_alm_id` bigint(20) NOT NULL,
  `mki_i_bie_id` bigint(20) NOT NULL,
  `mki_f_bie_id` bigint(20) NOT NULL,
  `mki_descripcion` varchar(200) DEFAULT NULL,
  `mki_q` decimal(12,6) NOT NULL,
  `mki_vu` decimal(12,6) NOT NULL,
  `mki_mt` decimal(12,6) NOT NULL,
  KEY `mkinternos_i_bienes` (`mki_i_bie_id`),
  KEY `mkinternos_f_bienes` (`mki_f_bie_id`),
  KEY `mkinternos_almacenes` (`mki_alm_id`),
  CONSTRAINT `mkinternos_almacenes` FOREIGN KEY (`mki_alm_id`) REFERENCES `almacenes` (`alm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mkinternos_f_bienes` FOREIGN KEY (`mki_f_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mkinternos_i_bienes` FOREIGN KEY (`mki_i_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mkinternos`
--

LOCK TABLES `mkinternos` WRITE;
/*!40000 ALTER TABLE `mkinternos` DISABLE KEYS */;
/*!40000 ALTER TABLE `mkinternos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientos` (
  `mov_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mov_age_id` bigint(20) DEFAULT NULL,
  `mov_alm_id` bigint(20) NOT NULL,
  `mov_serie` varchar(4) NOT NULL,
  `mov_numero` bigint(20) NOT NULL,
  `mov_t12num` bigint(20) NOT NULL,
  `mov_gt4_id` bigint(20) NOT NULL,
  `mov_t12_id` bigint(20) NOT NULL,
  `mov_t10_id` bigint(20) NOT NULL,
  `mov_tce_id` bigint(20) NOT NULL,
  `mov_cue_id` bigint(20) DEFAULT NULL,
  `mov_fechaE` date NOT NULL,
  `mov_fechaR` date NOT NULL,
  `mov_fechaV` date DEFAULT NULL,
  `mov_tipo` int(20) NOT NULL,
  `mov_subtotal` decimal(24,12) NOT NULL,
  `mov_igv_id` json NOT NULL,
  `mov_total` decimal(24,12) NOT NULL,
  `mov_ncr_id` json DEFAULT NULL,
  `mov_observaciones` text,
  `mov_gus_id` bigint(20) DEFAULT NULL,
  `mov_mov_id` bigint(20) DEFAULT NULL,
  `mov_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mov_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mov_mstatus` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`mov_id`),
  KEY `movimientos_agentes` (`mov_age_id`),
  KEY `movimientos_almacenes` (`mov_alm_id`),
  KEY `movimientos_t12operaciones` (`mov_t12_id`),
  KEY `movimientos_tcespeciales` (`mov_tce_id`),
  KEY `movimientos_t10comprobantes` (`mov_t10_id`),
  KEY `movimientos_gt4monedas` (`mov_gt4_id`),
  KEY `movimientos_gusuarios` (`mov_gus_id`),
  KEY `movimientos_cuentas` (`mov_cue_id`),
  CONSTRAINT `movimientos_agentes` FOREIGN KEY (`mov_age_id`) REFERENCES `agentes` (`age_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movimientos_almacenes` FOREIGN KEY (`mov_alm_id`) REFERENCES `almacenes` (`alm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movimientos_cuentas` FOREIGN KEY (`mov_cue_id`) REFERENCES `cuentas` (`cue_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movimientos_gt4monedas` FOREIGN KEY (`mov_gt4_id`) REFERENCES `company5_se_socios`.`t4monedas` (`gt4_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movimientos_gusuarios` FOREIGN KEY (`mov_gus_id`) REFERENCES `company5_se_socios`.`usuarios` (`gus_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movimientos_t10comprobantes` FOREIGN KEY (`mov_t10_id`) REFERENCES `t10comprobantes` (`t10_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movimientos_t12operaciones` FOREIGN KEY (`mov_t12_id`) REFERENCES `t12operaciones` (`t12_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movimientos_tcespeciales` FOREIGN KEY (`mov_tce_id`) REFERENCES `tcespeciales` (`tce_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `ppagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppagos` (
  `ppa_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ppa_tipo` int(2) NOT NULL DEFAULT '0',
  `ppa_col_id` bigint(20) NOT NULL,
  `ppa_caj_id` bigint(20) NOT NULL,
  `ppa_fecha` date NOT NULL,
  `ppa_gus_id` bigint(20) NOT NULL,
  PRIMARY KEY (`ppa_id`),
  KEY `ppagos_colaboradores` (`ppa_col_id`),
  KEY `ppagos_cajas` (`ppa_caj_id`),
  KEY `ppagos_usuarios` (`ppa_gus_id`),
  CONSTRAINT `ppagos_ibfk_1` FOREIGN KEY (`ppa_col_id`) REFERENCES `colaboradores` (`col_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ppagos_ibfk_2` FOREIGN KEY (`ppa_caj_id`) REFERENCES `cajas` (`caj_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ppagos_ibfk_3` FOREIGN KEY (`ppa_gus_id`) REFERENCES `company5_se_socios`.`usuarios` (`gus_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `preliminares`
--

DROP TABLE IF EXISTS `preliminares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preliminares` (
  `pre_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pre_transaccion` int(11) NOT NULL,
  `pre_exportacion` int(11) NOT NULL,
  `pre_anticipo` int(11) NOT NULL,
  PRIMARY KEY (`pre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preliminares`
--

LOCK TABLES `preliminares` WRITE;
/*!40000 ALTER TABLE `preliminares` DISABLE KEYS */;
/*!40000 ALTER TABLE `preliminares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propiedades`
--

DROP TABLE IF EXISTS `propiedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propiedades` (
  `pro_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pro_nombre` varchar(100) NOT NULL,
  `pro_type` varchar(20) NOT NULL DEFAULT 'varchar',
  `pro_revalue` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedades`
--

LOCK TABLES `propiedades` WRITE;
/*!40000 ALTER TABLE `propiedades` DISABLE KEYS */;
INSERT INTO `propiedades` (`pro_id`, `pro_nombre`, `pro_type`, `pro_revalue`) VALUES (1,'color','3',1);
/*!40000 ALTER TABLE `propiedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsables`
--

DROP TABLE IF EXISTS `responsables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responsables` (
  `res_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `res_tar_id` bigint(20) NOT NULL,
  `res_gus_gpe_id` bigint(20) NOT NULL,
  `res_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`res_id`),
  KEY `responsables_tareas` (`res_tar_id`),
  KEY `responsables_gusuarios` (`res_gus_gpe_id`),
  CONSTRAINT `responsables_gusuarios` FOREIGN KEY (`res_gus_gpe_id`) REFERENCES `company5_se_socios`.`usuarios` (`gus_gpe_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `responsables_tareas` FOREIGN KEY (`res_tar_id`) REFERENCES `tareas` (`tar_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsables`
--

LOCK TABLES `responsables` WRITE;
/*!40000 ALTER TABLE `responsables` DISABLE KEYS */;
/*!40000 ALTER TABLE `responsables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rlegal`
--

DROP TABLE IF EXISTS `rlegal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rlegal` (
  `rle_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rle_ruc` varchar(11) NOT NULL,
  PRIMARY KEY (`rle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rlegal`
--

LOCK TABLES `rlegal` WRITE;
/*!40000 ALTER TABLE `rlegal` DISABLE KEYS */;
/*!40000 ALTER TABLE `rlegal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saldobienes`
--

DROP TABLE IF EXISTS `saldobienes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saldobienes` (
  `sal_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sal_alm_id` bigint(20) NOT NULL,
  `sal_bie_id` bigint(20) NOT NULL,
  `sal_q` decimal(12,6) NOT NULL,
  `sal_p` decimal(12,6) NOT NULL,
  `sal_stockminimo` decimal(12,6) NOT NULL,
  `sal_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sal_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sal_id`),
  KEY `saldobienes_bienes` (`sal_bie_id`),
  KEY `saldobienes_almacenes` (`sal_alm_id`),
  CONSTRAINT `saldobienes_almacenes` FOREIGN KEY (`sal_alm_id`) REFERENCES `almacenes` (`alm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `saldobienes_bienes` FOREIGN KEY (`sal_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saldobienes`
--

LOCK TABLES `saldobienes` WRITE;
/*!40000 ALTER TABLE `saldobienes` DISABLE KEYS */;
/*!40000 ALTER TABLE `saldobienes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `satributos`
--

DROP TABLE IF EXISTS `satributos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `satributos` (
  `sat_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sat_ser_id` bigint(20) DEFAULT NULL,
  `sat_val_id` bigint(20) NOT NULL,
  PRIMARY KEY (`sat_id`),
  KEY `satributos_valores` (`sat_val_id`),
  KEY `satributos_servicios` (`sat_ser_id`),
  CONSTRAINT `satributos_servicios` FOREIGN KEY (`sat_ser_id`) REFERENCES `servicios` (`ser_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `satributos_valores` FOREIGN KEY (`sat_val_id`) REFERENCES `valores` (`val_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `satributos`
--

LOCK TABLES `satributos` WRITE;
/*!40000 ALTER TABLE `satributos` DISABLE KEYS */;
/*!40000 ALTER TABLE `satributos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicios` (
  `ser_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ser_codigo` varchar(12) NOT NULL,
  `ser_nombre` varchar(200) NOT NULL,
  `ser_t6m_id` bigint(20) DEFAULT NULL,
  `ser_ser_id` bigint(20) DEFAULT NULL,
  `ser_alm_id` varchar(200) NOT NULL DEFAULT '[1]',
  `ser_p` decimal(12,6) NOT NULL,
  `ser_igv` tinyint(1) NOT NULL,
  `ser_img` text,
  PRIMARY KEY (`ser_id`),
  KEY `servicios_t6medidas` (`ser_t6m_id`),
  CONSTRAINT `servicios_t6medidas` FOREIGN KEY (`ser_t6m_id`) REFERENCES `t6medidas` (`t6m_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t10comprobantes`
--

DROP TABLE IF EXISTS `t10comprobantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t10comprobantes` (
  `t10_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `t10_codigo` varchar(4) NOT NULL,
  `t10_descripcion` text NOT NULL,
  `t10_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`t10_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t10comprobantes`
--

LOCK TABLES `t10comprobantes` WRITE;
/*!40000 ALTER TABLE `t10comprobantes` DISABLE KEYS */;
INSERT INTO `t10comprobantes` (`t10_id`, `t10_codigo`, `t10_descripcion`, `t10_status`) VALUES (1,'00','Otros (especificar)',1),(2,'01','Factura Electrónica',1),(3,'02','Recibo por Honorarios',0),(4,'03','Boleta de Venta Electrónica',1),(5,'04','Liquidación de compra',0),(6,'05','Boleto de compañía de aviación comercial por el servicio de transporte aéreo de pasajeros',0),(7,'06','Carta de porte aéreo por el servicio de transporte de carga aérea',0),(8,'07','Nota de crédito',0),(9,'08','Nota de débito',0),(10,'09','Guía de remisión - Remitente',0),(11,'10','Recibo por Arrendamiento',0),(12,'11','Póliza emitida por las Bolsas de Valores, Bolsas de Productos o Agentes de Intermediación por operaciones realizadas en las Bolsas de Valores o Productos o fuera de las mismas, autorizadas por CONASEV',0),(13,'12','Ticket o cinta emitido por máquina registradora',0),(14,'13','Documento emitido por bancos, instituciones financieras, crediticias y de seguros que se encuentren bajo el control de la Superintendencia de Banca y Seguros',0),(15,'14','Recibo por servicios públicos de suministro de energía eléctrica, agua, teléfono, telex y telegráficos y otros servicios complementarios que se incluyan en el recibo de servicio público',0),(16,'15','Boleto emitido por las empresas de transporte público urbano de pasajeros',0),(17,'16','Boleto de viaje emitido por las empresas de transporte público interprovincial de pasajeros dentro del país',0),(18,'17','Documento emitido por la Iglesia Católica por el arrendamiento de bienes inmuebles',0),(19,'18','Documento emitido por las Administradoras Privadas de Fondo de Pensiones que se encuentran bajo la supervisión de la Superintendencia de Administradoras Privadas de Fondos de Pensiones',0),(20,'19','Boleto o entrada por atracciones y espectáculos públicos',0),(21,'20','Comprobante de Retención',0),(22,'21','Conocimiento de embarque por el servicio de transporte de carga marítima',0),(23,'22','Comprobante por Operaciones No Habituales',0),(24,'23','Pólizas de Adjudicación emitidas con ocasión del remate o adjudicación de bienes por venta forzada, por los martilleros o las entidades que rematen o subasten bienes por cuenta de terceros',0),(25,'24','Certificado de pago de regalías emitidas por PERUPETRO S.A',0),(26,'25','Documento de Atribución (Ley del Impuesto General a las Ventas e Impuesto Selectivo al Consumo, Art. 19º, último párrafo, R.S. N° 022-98-SUNAT).',0),(27,'26','Recibo por el Pago de la Tarifa por Uso de Agua Superficial con fines agrarios y por el pago de la Cuota para la ejecución de una determinada obra o actividad acordada por la Asamblea General de la Comisión de Regantes o Resolución expedida por el Jefe de la Unidad de Aguas y de Riego (Decreto Supremo N° 003-90-AG, Arts. 28 y 48)',0),(28,'27','Seguro Complementario de Trabajo de Riesgo',0),(29,'28','Tarifa Unificada de Uso de Aeropuerto',0),(30,'29','Documentos emitidos por la COFOPRI en calidad de oferta de venta de terrenos, los correspondientes a las subastas públicas y a la retribución de los servicios que presta',0),(31,'30','Documentos emitidos por las empresas que desempeñan el rol adquirente en los sistemas de pago mediante tarjetas de crédito y débito',0),(32,'31','Guía de Remisión - Transportista',1),(33,'32','Documentos emitidos por las empresas recaudadoras de la denominada Garantía de Red Principal a la que hace referencia el numeral 7.6 del artículo 7° de la Ley N° 27133  Ley de Promoción del Desarrollo de la Industria del Gas Natural',0),(34,'34','Documento del Operador',0),(35,'35','Documento del Partícipe',0),(36,'36','Recibo de Distribución de Gas Natural',0),(37,'37','Documentos que emitan los concesionarios del servicio de revisiones técnicas vehiculares, por la prestación de dicho servicio',0),(38,'50','Declaración Única de Aduanas - Importación definitiva',0),(39,'52','Despacho Simplificado - Importación Simplificada',0),(40,'53','Declaración de Mensajería o Courier',0),(41,'54','Liquidación de Cobranza',0),(42,'87','Nota de Crédito Especial',0),(43,'88','Nota de Débito Especial',0),(44,'91','Comprobante de No Domiciliado',0),(45,'96','Exceso de crédito fiscal por retiro de bienes',0),(46,'97','Nota de Crédito - No Domiciliado',0),(47,'98','Nota de Débito - No Domiciliado',0),(48,'99','Otros -Consolidado de Boletas de Venta',0),(49,'00','Nota de Entrada',1),(50,'00','Nota de Salida',1),(51,'00','Exportacion',1);
/*!40000 ALTER TABLE `t10comprobantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t11aduanas`
--

DROP TABLE IF EXISTS `t11aduanas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t11aduanas` (
  `t11_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `t11_codigo` varchar(4) NOT NULL,
  `t11_descripcion` text NOT NULL,
  `t11_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`t11_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t11aduanas`
--

LOCK TABLES `t11aduanas` WRITE;
/*!40000 ALTER TABLE `t11aduanas` DISABLE KEYS */;
/*!40000 ALTER TABLE `t11aduanas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t12operaciones`
--

DROP TABLE IF EXISTS `t12operaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t12operaciones` (
  `t12_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `t12_codigo` varchar(4) NOT NULL,
  `t12_descripcion` text NOT NULL,
  `t12_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`t12_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t12operaciones`
--

LOCK TABLES `t12operaciones` WRITE;
/*!40000 ALTER TABLE `t12operaciones` DISABLE KEYS */;
INSERT INTO `t12operaciones` (`t12_id`, `t12_codigo`, `t12_descripcion`, `t12_status`) VALUES (1,'01','VENTA',1),(2,'02','COMPRA',1),(3,'03','CONSIGNACIÓN RECIBIDA',0),(4,'04','CONSIGNACIÓN ENTREGADA',0),(5,'05','DEVOLUCIÓN RECIBIDA',0),(6,'06','DEVOLUCIÓN ENTREGADA',0),(7,'07','PROMOCIÓN',0),(8,'08','PREMIO',0),(9,'09','DONACIÓN',0),(10,'10','SALIDA A PRODUCCIÓN',0),(11,'11','TRANSFERENCIA ENTRE ALMACENES',0),(12,'12','RETIRO',0),(13,'13','MERMAS',1),(14,'14','DESMEDROS',0),(15,'15','DESTRUCCIÓN',0),(16,'16','SALDO INICIAL',1),(17,'99','OTROS (ESPECIFICAR)',0),(18,'99','TRANSFERENCIA ENTRE MATERIALES',1);
/*!40000 ALTER TABLE `t12operaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t1mediopagos`
--

DROP TABLE IF EXISTS `t1mediopagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1mediopagos` (
  `t1m_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `t1m_codigo` varchar(4) NOT NULL,
  `t1m_descripcion` text NOT NULL,
  `t1m_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`t1m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t1mediopagos`
--

LOCK TABLES `t1mediopagos` WRITE;
/*!40000 ALTER TABLE `t1mediopagos` DISABLE KEYS */;
INSERT INTO `t1mediopagos` (`t1m_id`, `t1m_codigo`, `t1m_descripcion`, `t1m_status`) VALUES (1,'001','DEPÓSITO EN CUENTA',1),(2,'002','GIRO',1),(3,'003','TRANSFERENCIA DE FONDOS',1),(4,'004','ORDEN DE PAGO',0),(5,'005','TARJETA DE DÉBITO',0),(6,'006','TARJETA DE CRÉDITO',0),(7,'007','\"CHEQUES CON LA CLÁUSULA DE \"\"NO NEGOCIABLE\"\", \"\"INTRANSFERIBLES\"\", \"\"NO A LA ORDEN\"\" U OTRA EQUIVALENTE, A QUE SE REFIERE EL INCISO F) DEL ARTICULO 5° DEL DECRETO LEGISLATIVO.\"',0),(8,'008','EFECTIVO, POR OPERACIONES EN LAS QUE NO EXISTE OBLIGACIÓN DE UTILIZAR MEDIOS DE PAGO',0),(9,'009','EFECTIVO, EN LOS DEMÁS CASOS',1),(10,'010','MEDIOS DE PAGO DE COMERCIO EXTERIOR',0),(11,'011','LETRAS DE CAMBIO',0),(12,'101','TRANSFERENCIAS - COMERCIO EXTERIOR',0),(13,'102','CHEQUES',1),(14,'103','ORDEN DE PAGO SIMPLE  - COMERCIO EXTERIOR',0),(15,'104','ORDEN DE PAGO DOCUMENTARIO  - COMERCIO EXTERIOR',0),(16,'105','REMESA SIMPLE  - COMERCIO EXTERIOR',0),(17,'106','REMESA DOCUMENTARIA  - COMERCIO EXTERIOR',0),(18,'107','CARTA DE CRÉDITO SIMPLE  - COMERCIO EXTERIOR',0),(19,'108','CARTA DE CRÉDITO DOCUMENTARIO  - COMERCIO EXTERIOR',0),(20,'999','OTROS MEDIOS DE PAGO (ESPECIFICAR)',0);
/*!40000 ALTER TABLE `t1mediopagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t3financieras`
--

DROP TABLE IF EXISTS `t3financieras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t3financieras` (
  `t3f_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `t3f_codigo` varchar(4) NOT NULL,
  `t3f_descripcion` text NOT NULL,
  `t3f_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`t3f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t3financieras`
--

LOCK TABLES `t3financieras` WRITE;
/*!40000 ALTER TABLE `t3financieras` DISABLE KEYS */;
/*!40000 ALTER TABLE `t3financieras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t5existencias`
--

DROP TABLE IF EXISTS `t5existencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t5existencias` (
  `t5e_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `t5e_codigo` varchar(4) NOT NULL,
  `t5e_descripcion` text NOT NULL,
  `t5e_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`t5e_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t5existencias`
--

LOCK TABLES `t5existencias` WRITE;
/*!40000 ALTER TABLE `t5existencias` DISABLE KEYS */;
INSERT INTO `t5existencias` (`t5e_id`, `t5e_codigo`, `t5e_descripcion`, `t5e_status`) VALUES (1,'01','MERCADERÍA',1),(2,'02','PRODUCTO TERMINADO',1),(3,'03','MATERIAS PRIMAS Y AUXILIARES - MATERIALES',1),(4,'04','ENVASES Y EMBALAJES',1),(5,'05','SUMINISTROS DIVERSOS',1),(6,'99','OTROS (ESPECIFICAR)',1);
/*!40000 ALTER TABLE `t5existencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t6medidas`
--

DROP TABLE IF EXISTS `t6medidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t6medidas` (
  `t6m_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `t6m_codigo` varchar(4) NOT NULL,
  `t6m_sunat` varchar(4) NOT NULL,
  `t6m_descripcion` text NOT NULL,
  `t6m_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`t6m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t6medidas`
--

LOCK TABLES `t6medidas` WRITE;
/*!40000 ALTER TABLE `t6medidas` DISABLE KEYS */;
INSERT INTO `t6medidas` (`t6m_id`, `t6m_codigo`, `t6m_sunat`, `t6m_descripcion`, `t6m_status`) VALUES (1,'00','4A','BOBINAS',1),(2,'00','BJ','BALDE',1),(3,'10','BLL','BARRILES',1),(4,'00','BG','BOLSA',1),(5,'00','BO','BOTELLAS',1),(6,'12','BX','CAJA',1),(7,'00','CT','CARTONES',1),(8,'00','CMK','CENTIMETRO CUADRADO',1),(9,'00','CMQ','CENTIMETRO CUBICO',1),(10,'00','CMT','CENTIMETRO LINEAL',1),(11,'00','CEN','CIENTO DE UNIDADES',1),(12,'00','CY','CILINDRO',1),(13,'00','CJ','CONOS',1),(14,'00','DZN','DOCENA',1),(15,'00','DZP','DOCENA POR 10**6',1),(16,'00','BE','FARDO',1),(17,'09','GLI','GALON INGLES (4,545956L)',1),(18,'06','GRM','GRAMO',1),(19,'00','GRO','GRUESA',1),(20,'00','HLT','HECTOLITRO',1),(21,'00','LEF','HOJA',1),(22,'00','SET','JUEGO',1),(23,'01','KGM','KILOGRAMO',1),(24,'00','KTM','KILOMETRO',1),(25,'00','KWH','KILOVATIO HORA',1),(26,'00','KT','KIT',1),(27,'11','CA','LATAS',1),(28,'02','LBR','LIBRAS',1),(29,'08','LTR','LITRO',1),(30,'00','MWH','MEGAWATT HORA',1),(31,'15','MTR','METRO',1),(32,'00','MTK','METRO CUADRADO',1),(33,'14','MTQ','METRO CUBICO',1),(34,'00','MGM','MILIGRAMOS',1),(35,'00','MLT','MILILITRO',1),(36,'00','MMT','MILIMETRO',1),(37,'00','MMK','MILIMETRO CUADRADO',1),(38,'00','MMQ','MILIMETRO CUBICO',1),(39,'13','MLL','MILLARES',1),(40,'00','UM','MILLON DE UNIDADES',1),(41,'00','ONZ','ONZAS',1),(42,'00','PF','PALETAS',1),(43,'00','PK','PAQUETE',1),(44,'00','PR','PAR',1),(45,'00','FOT','PIES',1),(46,'00','FTK','PIES CUADRADOS',1),(47,'00','FTQ','PIES CUBICOS',1),(48,'00','C62','PIEZAS',1),(49,'00','PG','PLACAS',1),(50,'00','ST','PLIEGO',1),(51,'00','INH','PULGADAS',1),(52,'00','RM','RESMA',1),(53,'00','DR','TAMBOR',1),(54,'05','STN','TONELADA CORTA',1),(55,'03','LTN','TONELADA LARGA',1),(56,'04','TNE','TONELADAS MÉTRICAS',1),(57,'00','TU','TUBOS',1),(58,'07','NIU','UNIDAD (BIENES)',1),(59,'07','ZZ','UNIDAD (SERVICIOS)',1),(60,'00','GLL','US GALON (3,7843 L)',1),(61,'00','YRD','YARDA',1),(62,'00','YDK','YARDA CUADRADA',1),(63,'99','999','OTROS (ESPECIFICAR)',1);
/*!40000 ALTER TABLE `t6medidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t7intangibles`
--

DROP TABLE IF EXISTS `t7intangibles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t7intangibles` (
  `t7i_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `t7i_codigo` varchar(4) NOT NULL,
  `t7i_descripcion` text NOT NULL,
  `t7i_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`t7i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t7intangibles`
--

LOCK TABLES `t7intangibles` WRITE;
/*!40000 ALTER TABLE `t7intangibles` DISABLE KEYS */;
/*!40000 ALTER TABLE `t7intangibles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t8libroregistros`
--

DROP TABLE IF EXISTS `t8libroregistros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t8libroregistros` (
  `t8l_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `t8l_codigo` varchar(4) NOT NULL,
  `t8l_descripcion` text NOT NULL,
  `t8l_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`t8l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t8libroregistros`
--

LOCK TABLES `t8libroregistros` WRITE;
/*!40000 ALTER TABLE `t8libroregistros` DISABLE KEYS */;
INSERT INTO `t8libroregistros` (`t8l_id`, `t8l_codigo`, `t8l_descripcion`, `t8l_status`) VALUES (1,'01','LIBRO CAJA Y BANCOS',1),(2,'02','LIBRO DE INGRESOS Y GASTOS',1),(3,'03','LIBRO DE INVENTARIOS Y BALANCES',1),(4,'04','LIBRO DE RETENCIONES INCISOS E) Y F) DEL ARTICULO 34° DE LA LEY DEL IMPUESTO A LA RENTA',1),(5,'05','LIBRO DIARIO',1),(6,'06','LIBRO MAYOR',1),(7,'07','REGISTRO DE ACTIVOS FIJOS',1),(8,'08','REGISTRO DE COMPRAS',1),(9,'09','REGISTRO DE CONSIGNACIONES',1),(10,'10','REGISTRO DE COSTOS',1),(11,'11','REGISTRO DE HUÉSPEDES',1),(12,'12','REGISTRO DE INVENTARIO PERMANENTE EN UNIDADES FÍSICAS',1),(13,'13','REGISTRO DE INVENTARIO PERMANENTE VALORIZADO',1),(14,'14','REGISTRO DE VENTAS E INGRESOS',1),(15,'15','REGISTRO DE VENTAS E INGRESOS - ARTÍCULO 23° RESOLUCIÓN DE SUPERINTENDENCIA N° 266-2004/SUNAT',1),(16,'16','REGISTRO DEL RÉGIMEN DE PERCEPCIONES',1),(17,'17','REGISTRO DEL RÉGIMEN DE RETENCIONES',1),(18,'18','REGISTRO IVAP',1),(19,'19','REGISTRO(S) AUXILIAR(ES) DE ADQUISICIONES - ARTÍCULO 8° RESOLUCIÓN DE SUPERINTENDENCIA N° 022-98/SUNAT',1),(20,'20','REGISTRO(S) AUXILIAR(ES) DE ADQUISICIONES - INCISO A) PRIMER PÁRRAFO ARTÍCULO 5° RESOLUCIÓN DE SUPERINTENDENCIA N° 021-99/SUNAT',1),(21,'21','REGISTRO(S) AUXILIAR(ES) DE ADQUISICIONES - INCISO A) PRIMER PÁRRAFO ARTÍCULO 5° RESOLUCIÓN DE SUPERINTENDENCIA N° 142-2001/SUNAT',1),(22,'22','REGISTRO(S) AUXILIAR(ES) DE ADQUISICIONES - INCISO C) PRIMER PÁRRAFO ARTÍCULO 5° RESOLUCIÓN DE SUPERINTENDENCIA N° 256-2004/SUNAT',1),(23,'23','REGISTRO(S) AUXILIAR(ES) DE ADQUISICIONES - INCISO A) PRIMER PÁRRAFO ARTÍCULO 5° RESOLUCIÓN DE SUPERINTENDENCIA N° 257-2004/SUNAT',1),(24,'24','REGISTRO(S) AUXILIAR(ES) DE ADQUISICIONES - INCISO C) PRIMER PÁRRAFO ARTÍCULO 5° RESOLUCIÓN DE SUPERINTENDENCIA N° 258-2004/SUNAT',1),(25,'25','REGISTRO(S) AUXILIAR(ES) DE ADQUISICIONES - INCISO A) PRIMER PÁRRAFO ARTÍCULO 5° RESOLUCIÓN DE SUPERINTENDENCIA N° 259-2004/SUNAT',1),(26,'26','REGISTRO DE RETENCIONES ARTÍCULO 77-A DE LA LEY DEL IMPUESTO A LA RENTA',1),(27,'27','LIBRO DE ACTAS DE LA EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA',1),(28,'28','LIBRO DE ACTAS DE LA JUNTA GENERAL DE ACCIONISTAS',1),(29,'29','LIBRO DE ACTAS DEL DIRECTORIO',1),(30,'30','LIBRO DE MATRÍCULA DE ACCIONES',1),(31,'31','LIBRO DE PLANILLAS',1);
/*!40000 ALTER TABLE `t8libroregistros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t9plancontables`
--

DROP TABLE IF EXISTS `t9plancontables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t9plancontables` (
  `t9p_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `t9p_elemento` varchar(4) NOT NULL,
  `t9p_codigo` bigint(20) NOT NULL,
  `t9p_descripcion` text NOT NULL,
  `t9p_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`t9p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1778 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t9plancontables`
--

LOCK TABLES `t9plancontables` WRITE;
/*!40000 ALTER TABLE `t9plancontables` DISABLE KEYS */;
INSERT INTO `t9plancontables` (`t9p_id`, `t9p_elemento`, `t9p_codigo`, `t9p_descripcion`, `t9p_status`) VALUES (1,'1',10,'EFECTIVO Y EQUIVALENTES DE EFECTIVO',1),(2,'1',101,'Caja',1),(3,'1',102,'Fondos fijos',1),(4,'1',103,'Efectivo y cheques en tránsito',1),(5,'1',1031,'Efectivo en tránsito',1),(6,'1',1032,'Cheques en tránsito',1),(7,'1',104,'Cuentas corrientes en instituciones financieras',1),(8,'1',1041,'Cuentas corrientes operativas',1),(9,'1',1042,'Cuentas corrientes para fines específicos',1),(10,'1',105,'Otros equivalentes de efectivo',1),(11,'1',1051,'Otro equivalentes de efectivo',1),(12,'1',106,'Depósitos en instituciones financieras',1),(13,'1',1061,'Depósitos de ahorro',1),(14,'1',1062,'Depósitos a plazo',1),(15,'1',107,'Fondos sujetos a restricción',1),(16,'1',1071,'Fondos en garantía',1),(17,'1',1072,'Fondos retenidos por mandato de la autoridad',1),(18,'1',1073,'Otros fondos sujetos a restricción',1),(19,'1',11,'INVERSIONES FINANCIERAS',1),(20,'1',111,'Inversiones mantenidas para negociación',1),(21,'1',1111,'Valores emitidos o garantizados por el Estado',1),(22,'1',11111,'Costo',1),(23,'1',11112,'Valor Razonable',1),(24,'1',1112,'Valores emitidos por el sistema financiero',1),(25,'1',11121,'Costo',1),(26,'1',11122,'Valor Razonable',1),(27,'1',1113,'Valores emitidos por entidades',1),(28,'1',11131,'Costo',1),(29,'1',11132,'Valor Razonable',1),(30,'1',1114,'Otros títulos representativos de deuda',1),(31,'1',11141,'Costo',1),(32,'1',11142,'Valor Razonable',1),(33,'1',1115,'Participaciones en entidades',1),(34,'1',11151,'Costo',1),(35,'1',11152,'Valor Razonable',1),(36,'1',112,'Otras inversiones financieras',1),(37,'1',1121,'Otras inversiones financieras',1),(38,'1',11211,'Costo',1),(39,'1',11212,'Valor Razonable',1),(40,'1',113,'Activos financieros  Acuerdo de compra',1),(41,'1',1131,'Inversiones mantenidas para negociación  Acuerdo de compra',1),(42,'1',11311,'Costo',1),(43,'1',11312,'Valor Razonable',1),(44,'1',1132,'Otras inversiones financieras',1),(45,'1',11321,'Costo',1),(46,'1',11322,'Valor Razonable',1),(47,'1',12,'CUENTAS POR COBRAR COMERCIALES  TERCEROS',1),(48,'1',121,'Facturas- boletas y otros comprobantes por cobrar',1),(49,'1',1211,'No emitidas',1),(50,'1',1212,'Emitidas en cartera',1),(51,'1',1213,'En cobranza',1),(52,'1',1214,'En descuento',1),(53,'1',122,'Anticipos de clientes',1),(54,'1',123,'Letras por cobrar',1),(55,'1',1232,'En cartera',1),(56,'1',1233,'En cobranza',1),(57,'1',1234,'En descuento',1),(58,'1',13,'CUENTAS POR COBRAR COMERCIALES  RELACIONADAS',1),(59,'1',131,'Facturas- boletas y otros comprobantes por cobrar',1),(60,'1',1311,'No emitidas',1),(61,'1',1312,'En cartera',1),(62,'1',1313,'En cobranza',1),(63,'1',1314,'En descuento',1),(64,'1',132,'Anticipos recibidos',1),(65,'1',1321,'Anticipos recibidos',1),(66,'1',133,'Letras por cobrar',1),(67,'1',1331,'En cartera',1),(68,'1',1332,'En cobranza',1),(69,'1',1333,'En descuento',1),(70,'1',14,'CUENTAS POR COBRAR AL PERSONAL- A LOS ACCIONISTAS (SOCIOS) y DIRECTORES',1),(71,'1',141,'Personal',1),(72,'1',1411,'Préstamos',1),(73,'1',1412,'Adelanto de remuneraciones',1),(74,'1',1413,'Entregas a rendir cuenta',1),(75,'1',1419,'Otras cuentas por cobrar al personal',1),(76,'1',142,'Accionistas (o socios)',1),(77,'1',1421,'Suscripciones por cobrar a socios o accionistas',1),(78,'1',1422,'Préstamos',1),(79,'1',143,'Directores',1),(80,'1',1431,'Préstamos',1),(81,'1',1432,'Adelanto de dietas',1),(82,'1',1433,'Entregas a rendir cuenta',1),(83,'1',149,'Diversas',1),(84,'1',16,'CUENTAS POR COBRAR DIVERSAS  TERCEROS',1),(85,'1',161,'Préstamos',1),(86,'1',1611,'Con garantía',1),(87,'1',1612,'Sin garantía',1),(88,'1',162,'Reclamaciones a terceros',1),(89,'1',1621,'Compañías aseguradoras',1),(90,'1',1622,'Transportadoras',1),(91,'1',1623,'Servicios públicos',1),(92,'1',1624,'Tributos',1),(93,'1',1629,'Otras',1),(94,'1',163,'Intereses- regalías y dividendos',1),(95,'1',1631,'Intereses',1),(96,'1',1632,'Regalías',1),(97,'1',1633,'Dividendos',1),(98,'1',164,'Depósitos otorgados en garantía',1),(99,'1',1641,'Préstamos de instituciones financieras',1),(100,'1',1642,'Préstamos de instituciones no financieras',1),(101,'1',1643,'Depósitos en garantía por alquileres',1),(102,'1',1649,'Otros depósitos en garantía',1),(103,'1',165,'Venta de activo inmovilizado',1),(104,'1',1651,'Inversión mobiliaria',1),(105,'1',1652,'Propiedades de inversión',1),(106,'1',1653,'Propiedad- planta y equipo',1),(107,'1',1654,'Intangibles',1),(108,'1',1655,'Activos biológicos',1),(109,'1',1659,'Otros activos inmovilizados',1),(110,'1',166,'Activos por instrumentos financieros',1),(111,'1',1661,'Instrumentos financieros primarios',1),(112,'1',16611,'Costo',1),(113,'1',16612,'Valor razonable',1),(114,'1',1662,'Instrumentos financieros derivados',1),(115,'1',16621,'Costo',1),(116,'1',16622,'Valor razonable',1),(117,'1',167,'Tributos por acreditar',1),(118,'1',1671,'Pagos a cuenta del impuesto a la renta',1),(119,'1',1672,'Pagos a cuenta de ITAN',1),(120,'1',1673,'IGV por acreditar en compras',1),(121,'1',1674,'IGV por acreditar no domiciliados',1),(122,'1',1675,'Obras por impuestos',1),(123,'1',169,'Otras cuentas por cobrar diversas',1),(124,'1',1691,'Entregas a rendir cuenta a terceros',1),(125,'1',1699,'Otras cuentas por cobrar diversas',1),(126,'1',17,'CUENTAS POR COBRAR DIVERSAS  RELACIONADAS',1),(127,'1',171,'Préstamos',1),(128,'1',1711,'Con garantía',1),(129,'1',1712,'Sin garantía',1),(130,'1',173,'Intereses- regalías y dividendos',1),(131,'1',1731,'Intereses',1),(132,'1',1732,'Regalías',1),(133,'1',1733,'Dividendos',1),(134,'1',174,'Depósitos otorgados en garantía',1),(135,'1',1741,'Préstamos de instituciones financieras',1),(136,'1',1742,'Préstamos de instituciones no financieras',1),(137,'1',1743,'Depósitos en garantía por alquileres',1),(138,'1',1749,'Otros depósitos en garantía',1),(139,'1',175,'Venta de activo inmovilizado',1),(140,'1',1751,'Inversión mobiliaria',1),(141,'1',1752,'Propiedades de inversión',1),(142,'1',1753,'Propiedad- planta y equipo',1),(143,'1',1754,'Intangibles',1),(144,'1',1755,'Activos biológicos',1),(145,'1',1759,'Otros activos inmovilizados',1),(146,'1',176,'Activos por instrumentos financieros',1),(147,'1',1761,'Instrumentos financieros primarios',1),(148,'1',17611,'Costo',1),(149,'1',17612,'Valor razonable',1),(150,'1',1762,'Instrumentos financieros derivados',1),(151,'1',17621,'Costo',1),(152,'1',17622,'Valor razonable',1),(153,'1',179,'Otras cuentas por cobrar diversas',1),(154,'1',18,'SERVICIOS Y OTROS CONTRATADOS POR ANTICIPADO',1),(155,'1',181,'Costos financieros',1),(156,'1',182,'Seguros',1),(157,'1',183,'Alquileres',1),(158,'1',184,'Primas pagadas por opciones',1),(159,'1',185,'Mantenimiento de activos inmovilizados',1),(160,'1',189,'Otros gastos contratados por anticipado',1),(161,'1',19,'ESTIMACIÓN DE CUENTAS DE COBRANZA DUDOSA',1),(162,'1',191,'Cuentas por cobrar comerciales  Terceros',1),(163,'1',1911,'Facturas- boletas y otros comprobantes por cobrar',1),(164,'1',1913,'Letras por cobrar',1),(165,'1',192,'Cuentas por cobrar comerciales  Relacionadas',1),(166,'1',1921,'Facturas- boletas y otros comprobantes por cobrar',1),(167,'1',1923,'Letras por cobrar',1),(168,'1',193,'Cuentas por cobrar al personal- a los accionistas (socios) y directores',1),(169,'1',1931,'Personal',1),(170,'1',1932,'Accionistas (o socios)',1),(171,'1',1933,'Directores',1),(172,'1',1939,'Diversas',1),(173,'1',194,'Cuentas por cobrar diversas  Terceros',1),(174,'1',1941,'Préstamos',1),(175,'1',1942,'Reclamaciones a terceros',1),(176,'1',1943,'Intereses- regalías y dividendos',1),(177,'1',1944,'Depósitos otorgados en garantía',1),(178,'1',1945,'Venta de activo inmovilizado',1),(179,'1',1946,'Activos por instrumentos financieros',1),(180,'1',1949,'Otras cuentas por cobrar diversas',1),(181,'1',195,'Cuentas por cobrar diversas  Relacionadas',1),(182,'1',1951,'Préstamos',1),(183,'1',1953,'Intereses- regalías y dividendos',1),(184,'1',1954,'Depósitos otorgados en garantía',1),(185,'1',1955,'Venta de activo inmovilizado',1),(186,'1',1956,'Activos por instrumentos financieros',1),(187,'1',1959,'Otras cuentas por cobrar diversas',1),(188,'2',20,'MERCADERÍAS',1),(189,'2',201,'Mercaderías',1),(190,'2',2011,'Mercaderías',1),(191,'2',20111,'Costo',1),(192,'2',20114,'Valor razonable',1),(193,'2',21,'PRODUCTOS TERMINADOS',1),(194,'2',211,'Productos terminados',1),(195,'2',2111,'Productos terminados',1),(196,'2',21111,'Costo',1),(197,'2',21113,'Costo de financiación',1),(198,'2',21114,'Valor razonable',1),(199,'2',215,'Inventario de servicios terminados',1),(200,'2',2151,'Servicios terminados',1),(201,'2',21511,'Costo',1),(202,'2',22,'SUBPRODUCTOS- DESECHOS Y DESPERDICIOS',1),(203,'2',221,'Subproductos',1),(204,'2',222,'Desechos y desperdicios',1),(205,'2',23,'PRODUCTOS EN PROCESO',1),(206,'2',231,'Productos en proceso',1),(207,'2',2311,'Productos en proceso',1),(208,'2',23111,'Costo',1),(209,'2',23113,'Costo de financiación',1),(210,'2',235,'Inventario de servicios en proceso',1),(211,'2',2351,'Servicios en proceso',1),(212,'2',23511,'Costo',1),(213,'2',24,'MATERIAS PRIMAS',1),(214,'2',241,'Materias primas',1),(215,'2',2411,'Materias primas',1),(216,'2',24111,'Costo',1),(217,'2',24114,'Valor razonable',1),(218,'2',25,'MATERIALES AUXILIARES- SUMINISTROS Y REPUESTOS',1),(219,'2',251,'Materiales auxiliares',1),(220,'2',252,'Suministros',1),(221,'2',2521,'Combustibles',1),(222,'2',2522,'Lubricantes',1),(223,'2',2523,'Energía',1),(224,'2',2524,'Otros suministros',1),(225,'2',253,'Repuestos',1),(226,'2',26,'ENVASES Y EMBALAJES',1),(227,'2',261,'Envases',1),(228,'2',262,'Embalajes',1),(229,'2',27,'ACTIVOS NO CORRIENTES MANTENIDOS PARA LA VENTA',1),(230,'2',271,'Propiedades de inversión',1),(231,'2',2711,'Terrenos',1),(232,'2',27111,'Costo',1),(233,'2',27112,'Revaluación',1),(234,'2',27114,'Valor razonable',1),(235,'2',2712,'Edificaciones',1),(236,'2',27121,'Costo',1),(237,'2',27122,'Revaluación',1),(238,'2',27123,'Costos de financiación',1),(239,'2',27124,'Valor razonable',1),(240,'2',272,'Propiedad- planta y equipo',1),(241,'2',2720,'Planta productora en producción',1),(242,'2',27201,'Costo',1),(243,'2',27202,'Revaluación',1),(244,'2',27203,'Costo de financiación',1),(245,'2',27204,'Valor razonable',1),(246,'2',2721,'Planta productora en desarrollo',1),(247,'2',27211,'Costo',1),(248,'2',27212,'Revaluación',1),(249,'2',27213,'Costo de financiación',1),(250,'2',27214,'Valor razonable',1),(251,'2',2722,'Terrenos',1),(252,'2',27221,'Costo',1),(253,'2',27222,'Revaluación',1),(254,'2',2723,'Edificaciones',1),(255,'2',27231,'Costo',1),(256,'2',27232,'Revaluación',1),(257,'2',27233,'Costo de financiación',1),(258,'2',2724,'Maquinarias y equipos de explotación',1),(259,'2',27241,'Costo',1),(260,'2',27242,'Revaluación',1),(261,'2',27243,'Costo de financiación',1),(262,'2',2725,'Unidades de transporte',1),(263,'2',27251,'Costo',1),(264,'2',27252,'Revaluación',1),(265,'2',2726,'Muebles y enseres',1),(266,'2',27261,'Costo',1),(267,'2',27262,'Revaluación',1),(268,'2',2727,'Equipos diversos',1),(269,'2',27271,'Costo',1),(270,'2',27272,'Revaluación',1),(271,'2',2728,'Herramientas y unidades de reemplazo',1),(272,'2',27281,'Costo',1),(273,'2',27282,'Revaluación',1),(274,'2',2729,'Obras en curso',1),(275,'2',27291,'Costo',1),(276,'2',27292,'Revaluación',1),(277,'2',273,'Intangibles',1),(278,'2',2731,'Concesiones- licencias y derechos',1),(279,'2',27311,'Costo',1),(280,'2',27312,'Revaluación',1),(281,'2',2732,'Patentes y propiedad industrial',1),(282,'2',27321,'Costo',1),(283,'2',27322,'Revaluación',1),(284,'2',2733,'Programas de computadora (software)',1),(285,'2',27331,'Costo',1),(286,'2',27332,'Revaluación',1),(287,'2',2734,'Costos de exploración y desarrollo',1),(288,'2',27341,'Costo',1),(289,'2',27342,'Revaluación',1),(290,'2',2735,'Fórmulas- diseños y prototipos',1),(291,'2',27351,'Costo',1),(292,'2',27352,'Revaluación',1),(293,'2',2739,'Otros activos intangibles',1),(294,'2',27391,'Costo',1),(295,'2',27392,'Revaluación',1),(296,'2',274,'Activos biológicos',1),(297,'2',2741,'Activos biológicos en producción',1),(298,'2',27411,'Costo',1),(299,'2',27413,'Costos de financiación',1),(300,'2',27414,'Valor razonable',1),(301,'2',2742,'Activos biológicos en desarrollo',1),(302,'2',27421,'Costo',1),(303,'2',27423,'Costos de financiación',1),(304,'2',27424,'Valor razonable',1),(305,'2',275,'Depreciación acumulada  Propiedades de inversión',1),(306,'2',2752,'Edificaciones',1),(307,'2',27521,'Costo',1),(308,'2',27522,'Revaluación',1),(309,'2',27523,'Costo de financiación',1),(310,'2',276,'Depreciación acumulada  Propiedad- planta y equipo',1),(311,'2',2760,'Planta productora en producción',1),(312,'2',27601,'Costo',1),(313,'2',27602,'Revaluación',1),(314,'2',27603,'Costo de financiación 27604 Valor razonable',1),(315,'2',2762,'Edificaciones',1),(316,'2',27621,'Costo',1),(317,'2',27622,'Revaluación',1),(318,'2',27623,'Costo de financiación',1),(319,'2',2763,'Maquinarias y equipo de explotación',1),(320,'2',27631,'Costo',1),(321,'2',27632,'Revaluación',1),(322,'2',27633,'Costo de financiación',1),(323,'2',2764,'Unidades de transporte',1),(324,'2',27641,'Costo',1),(325,'2',27642,'Revaluación',1),(326,'2',2765,'Muebles y enseres',1),(327,'2',27651,'Costo',1),(328,'2',27652,'Revaluación',1),(329,'2',2766,'Equipos diversos',1),(330,'2',27661,'Costo',1),(331,'2',27662,'Revaluación',1),(332,'2',2767,'Herramientas y unidades de reemplazo',1),(333,'2',27671,'Costo',1),(334,'2',27672,'Revaluación',1),(335,'2',277,'Amortización acumulada  Intangibles',1),(336,'2',2771,'Concesiones- licencias y derechos',1),(337,'2',27711,'Costo',1),(338,'2',27712,'Revaluación',1),(339,'2',2772,'Patentes y propiedad industrial',1),(340,'2',27721,'Costo',1),(341,'2',27722,'Revaluación',1),(342,'2',2773,'Programas de computadora (software)',1),(343,'2',27731,'Costo',1),(344,'2',27732,'Revaluación',1),(345,'2',2774,'Costos de exploración y desarrollo',1),(346,'2',27741,'Costo',1),(347,'2',27742,'Revaluación',1),(348,'2',2775,'Fórmulas- diseños y prototipos',1),(349,'2',27751,'Costo',1),(350,'2',27752,'Revaluación',1),(351,'2',2779,'Otros activos intangibles',1),(352,'2',27791,'Costo',1),(353,'2',27792,'Revaluación',1),(354,'2',278,'Depreciación acumulada  Activos biológicos',1),(355,'2',2781,'Activos biológicos en producción',1),(356,'2',27811,'Costo',1),(357,'2',27813,'Costo de financiación',1),(358,'2',2782,'Activos biológicos en desarrollo',1),(359,'2',27821,'Costo',1),(360,'2',27823,'Costo de financiación',1),(361,'2',279,'Desvalorización acumulada',1),(362,'2',2791,'Propiedad de inversión',1),(363,'2',27910,'Planta productora en producción',1),(364,'2',27911,'Planta productora en desarrollo',1),(365,'2',27912,'Terrenos',1),(366,'2',27913,'Edificaciones',1),(367,'2',2793,'Propiedad- planta y equipo',1),(368,'2',27930,'Plantas productoras en producción',1),(369,'2',27931,'Planta productora en desarrollo',1),(370,'2',27932,'Terrenos',1),(371,'2',27933,'Edificaciones',1),(372,'2',27934,'Maquinarias y equipos de explotación',1),(373,'2',27935,'Unidades de transporte',1),(374,'2',27936,'Muebles y enseres',1),(375,'2',27937,'Equipos diversos',1),(376,'2',27938,'Herramientas y unidades de reemplazo',1),(377,'2',2794,'Intangibles',1),(378,'2',27941,'Concesiones- licencias y otros derechos',1),(379,'2',27942,'Patentes y propiedad industrial',1),(380,'2',27943,'Programas de computadora (software)',1),(381,'2',27944,'Costos de exploración y desarrollo',1),(382,'2',27945,'Fórmulas- diseños y prototipos',1),(383,'2',27949,'Otros activos intangibles',1),(384,'2',2795,'Activos biológicos',1),(385,'2',27951,'Activos biológicos en producción',1),(386,'2',27952,'Activos biológicos en desarrollo',1),(387,'2',28,'INVENTARIOS POR RECIBIR',1),(388,'2',281,'Mercaderías',1),(389,'2',284,'Materias primas',1),(390,'2',285,'Materiales auxiliares- suministros y repuestos',1),(391,'2',286,'Envases y embalajes',1),(392,'2',29,'DESVALORIZACIÓN DE INVENTARIOS',1),(393,'2',291,'Mercaderías',1),(394,'2',2911,'Mercaderías',1),(395,'2',29111,'Costo',1),(396,'2',292,'Productos terminados',1),(397,'2',2921,'Productos terminados',1),(398,'2',29211,'Costo',1),(399,'2',29213,'Costo de financiación',1),(400,'2',2925,'Inventario de servicios terminados',1),(401,'2',29251,'Costo',1),(402,'2',293,'Subproductos- desechos y desperdicios',1),(403,'2',2931,'Subproductos',1),(404,'2',2932,'Desechos y desperdicios',1),(405,'2',294,'Productos en proceso',1),(406,'2',2941,'Productos en proceso',1),(407,'2',29411,'Costo',1),(408,'2',29413,'Costo de financiación',1),(409,'2',2945,'Inventario de servicios en proceso',1),(410,'2',295,'Materias primas',1),(411,'2',2951,'Materias primas',1),(412,'2',29511,'Costo',1),(413,'2',296,'Materiales auxiliares- suministros y repuestos',1),(414,'2',2961,'Materiales auxiliares',1),(415,'2',2962,'Suministros',1),(416,'2',2963,'Repuestos',1),(417,'2',297,'Envases y embalajes',1),(418,'2',2971,'Envases',1),(419,'2',2972,'Embalajes',1),(420,'2',298,'Existencias por recibir',1),(421,'2',2981,'Mercaderías',1),(422,'2',2982,'Materias primas',1),(423,'2',2983,'Materiales auxiliares- suministros y repuestos',1),(424,'2',2984,'Envases y embalajes',1),(425,'3',30,'INVERSIONES MOBILIARIAS',1),(426,'3',301,'Inversiones a ser mantenidas hasta el vencimiento',1),(427,'3',3011,'Instrumentos financieros representativos de deuda',1),(428,'3',30111,'Costo',1),(429,'3',30114,'Valor razonable',1),(430,'3',302,'Instrumentos financieros representativos de derecho patrimonial',1),(431,'3',3021,'Certificados de suscripción preferente',1),(432,'3',3022,'Acciones representativas de capital social  Comunes',1),(433,'3',30221,'Costo',1),(434,'3',30224,'Valor razonable',1),(435,'3',30225,'Participación patrimonial',1),(436,'3',3023,'Acciones representativas de capital social  Preferentes',1),(437,'3',30231,'Costo',1),(438,'3',30234,'Valor razonable',1),(439,'3',30235,'Participación patrimonial',1),(440,'3',3024,'Acciones de inversión',1),(441,'3',30241,'Costo',1),(442,'3',30244,'Valor razonable',1),(443,'3',30245,'Participación patrimonial',1),(444,'3',3028,'Otros títulos representativos de patrimonio',1),(445,'3',30281,'Costo',1),(446,'3',30284,'Valor razonable',1),(447,'3',30285,'Participación patrimonial',1),(448,'3',303,'Certificados de participación en fondos - Cuotas',1),(449,'3',3031,'Fondos de inversión',1),(450,'3',30311,'Costo',1),(451,'3',30314,'Valor razonable',1),(452,'3',3032,'Fondos mutuos',1),(453,'3',30321,'Costo',1),(454,'3',30324,'Valor razonable',1),(455,'3',304,'Participaciones en acuerdos conjuntos',1),(456,'3',3041,'Operaciones conjuntas',1),(457,'3',30411,'Costo',1),(458,'3',30414,'Valor razonable',1),(459,'3',30415,'Participación patrimonial',1),(460,'3',3042,'Negocios conjuntos',1),(461,'3',30421,'Costo',1),(462,'3',30424,'Valor razonable',1),(463,'3',30425,'Participación patrimonial',1),(464,'3',308,'Inversiones mobiliarias  Acuerdos de compra',1),(465,'3',3081,'Instrumentos financieros representativos de deuda  Acuerdo de compra',1),(466,'3',30811,'Costo',1),(467,'3',30814,'Valor razonable',1),(468,'3',3082,'Instrumentos financieros representativos de derecho patrimonial  Acuerdo de compra',1),(469,'3',30821,'Costo',1),(470,'3',30824,'Valor razonable',1),(471,'3',31,'PROPIEDADES DE INVERSIÓN',1),(472,'3',311,'Terrenos',1),(473,'3',3111,'Urbanos',1),(474,'3',31111,'Costo',1),(475,'3',31112,'Revaluación',1),(476,'3',31114,'Valor razonable',1),(477,'3',3112,'Rurales',1),(478,'3',31121,'Costo',1),(479,'3',31122,'Revaluación',1),(480,'3',31124,'Valor razonable',1),(481,'3',312,'Edificaciones',1),(482,'3',3121,'Edificaciones',1),(483,'3',31211,'Costo',1),(484,'3',31212,'Revaluación',1),(485,'3',31213,'Costos de financiación',1),(486,'3',31214,'Valor razonable',1),(487,'3',313,'Construcciones en curso',1),(488,'3',3131,'Edificaciones',1),(489,'3',31311,'Costo',1),(490,'3',31312,'Revaluación',1),(491,'3',31313,'Costos de financiación',1),(492,'3',31314,'Valor razonable',1),(493,'3',32,'ACTIVOS POR DERECHO DE USO',1),(494,'3',321,'Propiedades de inversión - Arrendamiento financiero',1),(495,'3',3211,'Terrenos',1),(496,'3',32111,'Costo',1),(497,'3',32112,'Revaluación',1),(498,'3',32114,'Valor razonable',1),(499,'3',3212,'Edificaciones',1),(500,'3',32121,'Costo',1),(501,'3',32122,'Revaluación',1),(502,'3',32123,'Costo de financiación',1),(503,'3',32124,'Valor razonable',1),(504,'3',322,'Propiedad- planta y equipo - Arrendamiento financiero',1),(505,'3',3220,'Planta productora en producción',1),(506,'3',32201,'Costo',1),(507,'3',32202,'Revaluación',1),(508,'3',32203,'Costo de financiación',1),(509,'3',3221,'Planta productora en desarrollo',1),(510,'3',32211,'Costo',1),(511,'3',32212,'Revaluación',1),(512,'3',32213,'Costo de financiación',1),(513,'3',3222,'Terrenos',1),(514,'3',32221,'Costo',1),(515,'3',32222,'Revaluación',1),(516,'3',3223,'Edificaciones',1),(517,'3',32231,'Costo',1),(518,'3',32232,'Revaluación',1),(519,'3',32233,'Costo de financiación',1),(520,'3',3224,'Maquinaria y equipo de explotación',1),(521,'3',32241,'Costo',1),(522,'3',32242,'Revaluación',1),(523,'3',32243,'Costo de financiación',1),(524,'3',3225,'Unidades de transporte',1),(525,'3',32251,'Costo',1),(526,'3',32252,'Revaluación',1),(527,'3',3226,'Muebles y enseres',1),(528,'3',32261,'Costo',1),(529,'3',32262,'Revaluación',1),(530,'3',3227,'Equipos diversos',1),(531,'3',32271,'Costo',1),(532,'3',32272,'Revaluación',1),(533,'3',3228,'Herramientas y unidades de reemplazo',1),(534,'3',32281,'Costo',1),(535,'3',32282,'Revaluación',1),(536,'3',323,'Propiedad- planta y equipo - Arrendamiento operativo',1),(537,'3',3230,'Planta productora en producción',1),(538,'3',32301,'Costo',1),(539,'3',32302,'Revaluación',1),(540,'3',3232,'Terrenos',1),(541,'3',32321,'Costo',1),(542,'3',3233,'Edificaciones',1),(543,'3',32331,'Costo',1),(544,'3',32332,'Revaluación',1),(545,'3',3234,'Maquinaria y equipo de explotación',1),(546,'3',32341,'Costo',1),(547,'3',32342,'Revaluación',1),(548,'3',3235,'Unidades de transporte',1),(549,'3',32351,'Costo',1),(550,'3',32352,'Revaluación',1),(551,'3',3236,'Equipos diversos',1),(552,'3',32361,'Costo',1),(553,'3',32362,'Revaluación',1),(554,'3',33,'PROPIEDAD- PLANTA Y EQUIPO',1),(555,'3',330,'Planta productora',1),(556,'3',3301,'Planta productora en producción',1),(557,'3',33011,'Costo',1),(558,'3',33012,'Revaluación',1),(559,'3',33013,'Costo de financiación',1),(560,'3',33014,'Valor razonable',1),(561,'3',3302,'Planta productora en desarrollo',1),(562,'3',33021,'Costo',1),(563,'3',33022,'Revaluación',1),(564,'3',33023,'Costo de financiación',1),(565,'3',33024,'Valor razonable',1),(566,'3',331,'Terrenos',1),(567,'3',3311,'Terrenos',1),(568,'3',33111,'Costo',1),(569,'3',33112,'Revaluación',1),(570,'3',332,'Edificaciones',1),(571,'3',3321,'Edificaciones',1),(572,'3',33211,'Costo',1),(573,'3',33212,'Revaluación',1),(574,'3',33213,'Costo de financiación',1),(575,'3',3324,'Instalaciones',1),(576,'3',33241,'Costo',1),(577,'3',33242,'Revaluación',1),(578,'3',33243,'Costo de financiación',1),(579,'3',3325,'Mejoras en locales arrendados.',1),(580,'3',33251,'Costo',1),(581,'3',33252,'Revaluación',1),(582,'3',33253,'Costo de Financiación',1),(583,'3',333,'Maquinaria y equipo de explotación',1),(584,'3',3331,'Maquinaria y equipo de explotación',1),(585,'3',33311,'Costo',1),(586,'3',33312,'Revaluación',1),(587,'3',33313,'Costo de financiación',1),(588,'3',334,'Unidades de transporte',1),(589,'3',3341,'Vehículos motorizados',1),(590,'3',33411,'Costo',1),(591,'3',33412,'Revaluación',1),(592,'3',3342,'Vehículos no motorizados',1),(593,'3',33421,'Costo',1),(594,'3',33422,'Revaluación',1),(595,'3',335,'Muebles y enseres',1),(596,'3',3351,'Muebles',1),(597,'3',33511,'Costo',1),(598,'3',33512,'Revaluación',1),(599,'3',3352,'Enseres',1),(600,'3',33521,'Costo',1),(601,'3',33522,'Revaluación',1),(602,'3',336,'Equipos diversos',1),(603,'3',3361,'Equipo para procesamiento de información',1),(604,'3',33611,'Costo',1),(605,'3',33612,'Revaluación',1),(606,'3',3362,'Equipo de comunicación',1),(607,'3',33621,'Costo',1),(608,'3',33622,'Revaluación',1),(609,'3',3363,'Equipo de seguridad',1),(610,'3',33631,'Costo',1),(611,'3',33632,'Revaluación',1),(612,'3',3364,'Equipo de medio ambiente',1),(613,'3',33641,'Costo',1),(614,'3',33642,'Revaluación',1),(615,'3',3369,'Otros equipos',1),(616,'3',33691,'Costo',1),(617,'3',33692,'Revaluación',1),(618,'3',337,'Herramientas y unidades de reemplazo',1),(619,'3',3371,'Herramientas',1),(620,'3',33711,'Costo',1),(621,'3',33712,'Revaluación',1),(622,'3',3372,'Unidades de reemplazo',1),(623,'3',33721,'Costo',1),(624,'3',33722,'Revaluación',1),(625,'3',338,'Unidades por recibir',1),(626,'3',3381,'Maquinaria y equipo de explotación',1),(627,'3',3382,'Equipo de transporte',1),(628,'3',3383,'Muebles y enseres',1),(629,'3',3386,'Equipos diversos',1),(630,'3',3387,'Herramientas y unidades de reemplazo',1),(631,'3',339,'Obras en curso',1),(632,'3',3391,'Adecuación de terrenos',1),(633,'3',3392,'Edificaciones en curso',1),(634,'3',33921,'Costo',1),(635,'3',33922,'Costo de financiación',1),(636,'3',3393,'Maquinaria en montaje',1),(637,'3',33931,'Costo',1),(638,'3',33932,'Costo de financiación',1),(639,'3',34,'INTANGIBLES',1),(640,'3',341,'Concesiones- licencias y otros derechos',1),(641,'3',3411,'Derechos por concesiones',1),(642,'3',34111,'Costo',1),(643,'3',34112,'Revaluación',1),(644,'3',3412,'Licencias',1),(645,'3',34121,'Costo',1),(646,'3',34122,'Revaluación',1),(647,'3',3419,'Otros derechos',1),(648,'3',34191,'Costo',1),(649,'3',34192,'Revaluación',1),(650,'3',342,'Patentes y propiedad industrial',1),(651,'3',3421,'Patentes',1),(652,'3',34211,'Costo',1),(653,'3',34212,'Revaluación',1),(654,'3',3422,'Marcas',1),(655,'3',34221,'Costo',1),(656,'3',34222,'Revaluación',1),(657,'3',343,'Programas de computadora (software)',1),(658,'3',3431,'Aplicaciones informáticas',1),(659,'3',34311,'Costo',1),(660,'3',34312,'Revaluación',1),(661,'3',344,'Costos de exploración y desarrollo',1),(662,'3',3441,'Costos de exploración',1),(663,'3',34411,'Costo',1),(664,'3',34412,'Revaluación',1),(665,'3',34413,'Costo de financiación',1),(666,'3',3442,'Costos de desarrollo',1),(667,'3',34421,'Costo',1),(668,'3',34422,'Revaluación',1),(669,'3',34423,'Costo de financiación',1),(670,'3',345,'Fórmulas- diseños y prototipos',1),(671,'3',3451,'Fórmulas',1),(672,'3',34511,'Costo',1),(673,'3',34512,'Revaluación',1),(674,'3',3452,'Diseños y prototipos',1),(675,'3',34521,'Costo',1),(676,'3',34522,'Revaluación',1),(677,'3',347,'Plusvalía mercantil',1),(678,'3',3471,'Plusvalía mercantil',1),(679,'3',349,'Otros activos intangibles',1),(680,'3',3491,'Otros activos intangibles',1),(681,'3',34911,'Costo',1),(682,'3',34912,'Revaluación',1),(683,'3',35,'ACTIVOS BIOLÓGICOS',1),(684,'3',351,'Activos biológicos en producción',1),(685,'3',3511,'De origen animal',1),(686,'3',35111,'Costo',1),(687,'3',35113,'Costo de financiación',1),(688,'3',35114,'Valor razonable',1),(689,'3',3512,'De origen vegetal',1),(690,'3',35121,'Costo',1),(691,'3',35123,'Costo de financiación',1),(692,'3',35124,'Valor razonable',1),(693,'3',352,'Activos biológicos en desarrollo',1),(694,'3',3521,'De origen animal',1),(695,'3',35211,'Costo',1),(696,'3',35213,'Costo de financiación',1),(697,'3',35214,'Valor razonable',1),(698,'3',3522,'De origen vegetal',1),(699,'3',35221,'Costo',1),(700,'3',35223,'Costo de financiación',1),(701,'3',35224,'Valor razonable',1),(702,'3',36,'DESVALORIZACIÓN DE ACTIVO INMOVILIZADO',1),(703,'3',361,'Desvalorización de propiedades de inversión',1),(704,'3',3611,'Terrenos',1),(705,'3',36111,'Costo',1),(706,'3',36112,'Revaluación',1),(707,'3',3612,'Edificaciones',1),(708,'3',36121,'Costo',1),(709,'3',36122,'Revaluación',1),(710,'3',36123,'Costo de financiación',1),(711,'3',3613,'Construcciones en curso - edificaciones',1),(712,'3',36131,'Costo',1),(713,'3',36132,'Revaluación',1),(714,'3',36133,'Costo de financiación',1),(715,'3',362,'Desvalorización de propiedades de inversión - Arrendamiento financiero',1),(716,'3',3621,'Terrenos',1),(717,'3',36211,'Costo',1),(718,'3',36212,'Revaluación',1),(719,'3',3622,'Edificaciones',1),(720,'3',36221,'Costo',1),(721,'3',36222,'Revaluación',1),(722,'3',36223,'Costo de financiación',1),(723,'3',363,'Desvalorización de propiedad- planta y equipo - Arrendamiento financiero',1),(724,'3',3631,'Terrenos',1),(725,'3',36311,'Costo',1),(726,'3',36312,'Revaluación',1),(727,'3',3632,'Edificaciones',1),(728,'3',36321,'Costo',1),(729,'3',36322,'Revaluación',1),(730,'3',36323,'Costo de financiación',1),(731,'3',3633,'Maquinaria y equipo de explotación',1),(732,'3',36331,'Costo',1),(733,'3',36332,'Revaluación',1),(734,'3',36333,'Costo de financiación',1),(735,'3',3634,'Unidades de transporte',1),(736,'3',36341,'Costo',1),(737,'3',36342,'Revaluación',1),(738,'3',3635,'Muebles y enseres',1),(739,'3',36351,'Costo',1),(740,'3',36352,'Revaluación',1),(741,'3',3636,'Equipos diversos',1),(742,'3',36361,'Costo',1),(743,'3',36362,'Revaluación',1),(744,'3',364,'Desvalorización de propiedad- planta y equipo',1),(745,'3',3640,'Planta productora en producción',1),(746,'3',36401,'Costo',1),(747,'3',36402,'Planta productora en producción - Revaluación',1),(748,'3',36403,'Planta productora en producción - Costo de financiación',1),(749,'3',33404,'Planta productora en producción - Valor razonable',1),(750,'3',36405,'Planta productora en desarrollo - Costo',1),(751,'3',36406,'Planta productora en desarrollo - Revaluación',1),(752,'3',36407,'Planta productora en desarrollo - Costo de financiación',1),(753,'3',36408,'Planta productora en desarrollo - Valor razonable',1),(754,'3',3641,'Terrenos',1),(755,'3',36411,'Costo',1),(756,'3',36412,'Revaluación',1),(757,'3',3642,'Edificaciones',1),(758,'3',36421,'Edificaciones - Costo',1),(759,'3',36422,'Edificaciones - Revaluación',1),(760,'3',36423,'Edificaciones - Costo de financiación',1),(761,'3',36424,'Instalaciones - Costo',1),(762,'3',36425,'Instalaciones - Revaluación',1),(763,'3',36426,'Instalaciones - Costo de financiación',1),(764,'3',36427,'Mejoras en locales arrendados - Costo',1),(765,'3',36428,'Mejoras en locales arrendados - Revaluación',1),(766,'3',36429,'Mejoras en locales arrendados - Costo de financiación',1),(767,'3',3643,'Maquinaria y equipo de explotación',1),(768,'3',36431,'Costo',1),(769,'3',36432,'Revaluación',1),(770,'3',36433,'Costo de financiación',1),(771,'3',3644,'Unidades de transporte',1),(772,'3',36441,'Costo',1),(773,'3',36442,'Revaluación',1),(774,'3',3645,'Muebles y enseres',1),(775,'3',36451,'Costo',1),(776,'3',36452,'Revaluación',1),(777,'3',3646,'Equipos diversos',1),(778,'3',36461,'Costo',1),(779,'3',36462,'Revaluación',1),(780,'3',3647,'Herramientas y unidades de reemplazo',1),(781,'3',36471,'Herramientas - Costo',1),(782,'3',38472,'Herramientas - Revaluación',1),(783,'3',38473,'Unidades de reemplazo - costo',1),(784,'3',38474,'Unidades de reemplazo - Revaluación',1),(785,'3',3649,'Obras en curso',1),(786,'3',36491,'Costo',1),(787,'3',36492,'Revaluación',1),(788,'3',365,'Desvalorización de intangibles',1),(789,'3',3651,'Concesiones- licencias y otros derechos',1),(790,'3',36511,'Costo',1),(791,'3',36512,'Revaluación',1),(792,'3',3652,'Patentes y propiedad industrial',1),(793,'3',36521,'Costo',1),(794,'3',36522,'Revaluación',1),(795,'3',3653,'Programas de computadora (software)',1),(796,'3',36531,'Costo',1),(797,'3',36532,'Revaluación',1),(798,'3',3654,'Costos de exploración y desarrollo',1),(799,'3',36541,'Costo',1),(800,'3',36542,'Revaluación',1),(801,'3',36543,'Costo de financiación',1),(802,'3',3655,'Fórmulas- diseños y prototipos',1),(803,'3',36551,'Costo',1),(804,'3',36552,'Revaluación',1),(805,'3',3657,'Plusvalía mercantil',1),(806,'3',3659,'Otros activos intangibles',1),(807,'3',36591,'Costo',1),(808,'3',36592,'Revaluación',1),(809,'3',366,'Desvalorización de activos biológicos',1),(810,'3',3661,'Activos biológicos en producción',1),(811,'3',36611,'Costo',1),(812,'3',36613,'Costo de financiación',1),(813,'3',3662,'Activos biológicos en desarrollo',1),(814,'3',36621,'Costo',1),(815,'3',36622,'Costo de financiación',1),(816,'3',367,'Desvalorización de inversiones mobiliarias',1),(817,'3',3671,'Inversiones a ser mantenidas hasta el vencimiento',1),(818,'3',36711,'Costo',1),(819,'3',3672,'Inversiones financieras representativas de derecho patrimonial',1),(820,'3',36721,'Costo',1),(821,'3',3673,'Otras inversiones financieras',1),(822,'3',36731,'Costo',1),(823,'3',37,'ACTIVO DIFERIDO',1),(824,'3',371,'Impuesto a la renta diferido',1),(825,'3',3711,'Impuesto a la renta diferido  Patrimonio',1),(826,'3',3712,'Impuesto a la renta diferido  Resultados',1),(827,'3',372,'Participaciones de los trabajadores diferidas',1),(828,'3',3721,'Participaciones de los trabajadores diferidas  Patrimonio',1),(829,'3',3722,'Participaciones de los trabajadores diferidas  Resultados',1),(830,'3',373,'Intereses diferidos',1),(831,'3',3731,'Intereses no devengados en transacciones con terceros',1),(832,'3',3732,'Intereses no devengados en medición a valor descontado',1),(833,'3',38,'OTROS ACTIVOS',1),(834,'3',381,'Bienes de arte y cultura',1),(835,'3',3811,'Obras de arte',1),(836,'3',3812,'Biblioteca',1),(837,'3',3813,'Otros',1),(838,'3',382,'Diversos',1),(839,'3',3821,'Monedas y joyas',1),(840,'3',3822,'Bienes entregados en comodato',1),(841,'3',3823,'Bienes recibidos en pago (adjudicados y realizables)',1),(842,'3',3829,'Otros',1),(843,'3',39,'DEPRECIACIÓN y AMORTIZACIÓN ACUMULADOS',1),(844,'3',391,'Depreciación acumulada propiedades de inversión',1),(845,'3',3911,'Edificaciones',1),(846,'3',39111,'Costo',1),(847,'3',39112,'Revaluación',1),(848,'3',39113,'Costo de financiación',1),(849,'3',392,'Depreciación acumulada propiedades de inversión - Arrendamiento financiero',1),(850,'3',3921,'Edificaciones',1),(851,'3',39211,'Costo',1),(852,'3',39212,'Revaluación',1),(853,'3',39213,'Costo de financiación',1),(854,'3',393,'Depreciación acumulada propiedad- planta y equipo - Arrendamiento financiero',1),(855,'3',3932,'Edificaciones',1),(856,'3',39321,'Costo',1),(857,'3',39322,'Revaluación',1),(858,'3',39323,'Costo de financiación',1),(859,'3',3933,'Maquinarias y equipos de explotación',1),(860,'3',39331,'Costo',1),(861,'3',39332,'Revaluación',1),(862,'3',39333,'Costo de financiación',1),(863,'3',3934,'Unidades de transporte',1),(864,'3',39341,'Costo',1),(865,'3',39342,'Revaluación',1),(866,'3',3935,'Muebles y enseres',1),(867,'3',39351,'Costo',1),(868,'3',38352,'Revaluación',1),(869,'3',3936,'Equipos diversos',1),(870,'3',39361,'Costo',1),(871,'3',39362,'Revaluación',1),(872,'3',394,'Depreciación acumulada - Arrendamiento operativo',1),(873,'3',3941,'Activos por derecho de uso - arrendamiento operativo',1),(874,'3',39410,'Plantas productoras',1),(875,'3',39411,'Terrenos',1),(876,'3',39412,'Edificaciones',1),(877,'3',39413,'Maquinarias y equipos de explotación',1),(878,'3',39414,'Unidades de transporte',1),(879,'3',39415,'Equipos diversos',1),(880,'3',395,'Depreciación acumulada de propiedad- planta y equipo',1),(881,'3',3952,'Depreciación acumulada - Costo',1),(882,'3',39520,'Plantas productoras',1),(883,'3',39521,'Edificaciones',1),(884,'3',39522,'Instalaciones',1),(885,'3',39523,'Mejoras en locales arrendados',1),(886,'3',39524,'Maquinarias y equipos de explotación',1),(887,'3',39525,'Unidades de transporte',1),(888,'3',39526,'Muebles y enseres',1),(889,'3',39527,'Equipos diversos',1),(890,'3',39528,'Herramientas',1),(891,'3',39529,'Unidades de reemplazo',1),(892,'3',3953,'Propiedad- planta y equipo - Revaluación',1),(893,'3',39530,'Plantas productoras',1),(894,'3',39531,'Edificaciones',1),(895,'3',39532,'Instalaciones',1),(896,'3',39533,'Mejoras en locales arrendados',1),(897,'3',39534,'Maquinarias y equipos de explotación',1),(898,'3',39535,'Unidades de transporte',1),(899,'3',39536,'Muebles y enseres',1),(900,'3',39537,'Equipos diversos',1),(901,'3',39538,'Herramientas y unidades de reemplazo',1),(902,'3',3954,'Propiedad- planta y equipo - Costo de financiación',1),(903,'3',39540,'Plantas productoras',1),(904,'3',39541,'Edificaciones',1),(905,'3',39542,'Maquinarias y equipos de explotación',1),(906,'3',3955,'Propiedad- planta y equipo - Valor razonable',1),(907,'3',39550,'Plantas productoras',1),(908,'3',396,'Amortización acumulada',1),(909,'3',3961,'Intangibles  Costo',1),(910,'3',39611,'Concesiones- licencias y otros derechos',1),(911,'3',39612,'Patentes y propiedad industrial',1),(912,'3',39613,'Programas de computadora (software)',1),(913,'3',39614,'Costos de exploración y desarrollo',1),(914,'3',39615,'Fórmulas- diseños y prototipos',1),(915,'3',39619,'Otros activos intangibles',1),(916,'3',3962,'Intangibles  Revaluación',1),(917,'3',39621,'Concesiones- licencias y otros derechos',1),(918,'3',39622,'Patentes y propiedad industrial',1),(919,'3',39623,'Programas de computadora (software)',1),(920,'3',39624,'Costos de exploración y desarrollo',1),(921,'3',39625,'Fórmulas- diseños y prototipos',1),(922,'3',39629,'Otros activos intangibles',1),(923,'3',3963,'Intangibles  Costos de financiación',1),(924,'3',39633,'Programas de computadora',1),(925,'3',39634,'Costos de exploración',1),(926,'3',39635,'Costos de desarrollo',1),(927,'3',398,'Depreciación acumulada - Activos biológicos en producción',1),(928,'3',3981,'Activos biológicos en producción - Costo',1),(929,'3',39811,'Activos biológicos en producción',1),(930,'4',40,'TRIBUTOS- CONTRAPRESTACIONES Y APORTES AL SISTEMA PÚBLICO DE PENSIONES Y DE SALUD POR PAGAR',1),(931,'4',401,'Gobierno nacional',1),(932,'4',4011,'Impuesto general a las ventas',1),(933,'4',40111,'IGV  Cuenta propia',1),(934,'4',40112,'IGV  Servicios prestados por no domiciliados',1),(935,'4',40113,'IGV  Régimen de percepciones',1),(936,'4',40114,'IGV  Régimen de retenciones',1),(937,'4',40115,'IGV  Importaciones',1),(938,'4',40116,'IGV  Destinado a operaciones gravadas',1),(939,'4',40117,'IGV - Destinado a operaciones comunes',1),(940,'4',4012,'Impuesto selectivo al consumo',1),(941,'4',4015,'Derechos aduaneros',1),(942,'4',40151,'Derechos arancelarios',1),(943,'4',40152,'Otros derechos arancelarios',1),(944,'4',4017,'Impuesto a la renta',1),(945,'4',40171,'Renta de tercera categoría',1),(946,'4',40172,'Renta de cuarta categoría',1),(947,'4',40173,'Renta de quinta categoría',1),(948,'4',40174,'Renta de no domiciliados',1),(949,'4',40175,'Otras retenciones',1),(950,'4',4018,'Otros impuestos y contraprestaciones',1),(951,'4',40181,'Impuesto a las transacciones financieras',1),(952,'4',40182,'Impuesto a los juegos de casino y tragamonedas',1),(953,'4',40183,'Tasas por la prestación de servicios públicos',1),(954,'4',40184,'Regalías',1),(955,'4',40185,'Impuesto a los dividendos',1),(956,'4',40186,'Impuesto temporal a los activos netos',1),(957,'4',40189,'Otros impuestos',1),(958,'4',402,'Certificados tributarios',1),(959,'4',403,'Instituciones públicas',1),(960,'4',4031,'ESSALUD',1),(961,'4',4032,'ONP',1),(962,'4',4033,'Contribución al SENATI',1),(963,'4',4034,'Contribución al SENCICO',1),(964,'4',4039,'Otras instituciones',1),(965,'4',405,'Gobiernos regionales',1),(966,'4',406,'Gobiernos locales',1),(967,'4',4061,'Impuestos',1),(968,'4',40611,'Impuesto al patrimonio vehicular',1),(969,'4',40612,'Impuesto a las apuestas',1),(970,'4',40613,'Impuesto a los juegos',1),(971,'4',40614,'Impuesto de alcabala',1),(972,'4',40615,'Impuesto predial',1),(973,'4',40616,'Impuesto a los espectáculos públicos no deportivos',1),(974,'4',4062,'Contribuciones',1),(975,'4',4063,'Tasas',1),(976,'4',40631,'Licencia de apertura de establecimientos',1),(977,'4',40632,'Transporte público',1),(978,'4',40633,'Estacionamiento de vehículos',1),(979,'4',40634,'Servicios públicos o arbitrios',1),(980,'4',40635,'Servicios administrativos o derechos',1),(981,'4',409,'Otros costos administrativos e intereses',1),(982,'4',41,'REMUNERACIONES Y PARTICIPACIONES POR PAGAR',1),(983,'4',411,'Remuneraciones por pagar',1),(984,'4',4111,'Sueldos y salarios por pagar',1),(985,'4',4112,'Comisiones por pagar',1),(986,'4',4113,'Remuneraciones en especie por pagar',1),(987,'4',4114,'Gratificaciones por pagar',1),(988,'4',4115,'Vacaciones por pagar',1),(989,'4',413,'Participaciones de los trabajadores por pagar',1),(990,'4',415,'Beneficios sociales de los trabajadores por pagar',1),(991,'4',4151,'Compensación por tiempo de servicios',1),(992,'4',4152,'Adelanto de compensación por tiempo de servicios',1),(993,'4',4153,'Pensiones y jubilaciones',1),(994,'4',417,'Administradoras de fondos de pensiones',1),(995,'4',419,'Otras remuneraciones y participaciones por pagar',1),(996,'4',42,'CUENTAS POR PAGAR COMERCIALES TERCEROS',1),(997,'4',421,'Facturas- boletas y otros comprobantes por pagar',1),(998,'4',4211,'No emitidas',1),(999,'4',4212,'Emitidas',1),(1000,'4',422,'Anticipos a proveedores',1),(1001,'4',423,'Letras por pagar',1),(1002,'4',424,'Honorarios por pagar',1),(1003,'4',43,'CUENTAS POR PAGAR COMERCIALES RELACIONADAS',1),(1004,'4',431,'Facturas- boletas y otros comprobantes por pagar',1),(1005,'4',4311,'No emitidas',1),(1006,'4',4312,'Emitidas',1),(1007,'4',432,'Anticipos otorgados',1),(1008,'4',4321,'Anticipos otorgados',1),(1009,'4',433,'Letras por pagar',1),(1010,'4',4331,'Letras por pagar',1),(1011,'4',434,'Honorarios por pagar',1),(1012,'4',4341,'Honorarios por pagar',1),(1013,'4',44,'CUENTAS POR PAGAR A LOS ACCIONISTAS (SOCIOS- PARTÍCIPES) Y DIRECTORES',1),(1014,'4',441,'Accionistas ( socios- partícipes)',1),(1015,'4',4411,'Préstamos',1),(1016,'4',4412,'Dividendos',1),(1017,'4',4419,'Otras cuentas por pagar',1),(1018,'4',442,'Directores',1),(1019,'4',4421,'Dietas',1),(1020,'4',4429,'Otras cuentas por pagar',1),(1021,'4',45,'OBLIGACIONES FINANCIERAS',1),(1022,'4',451,'Préstamos de instituciones financieras y otras entidades',1),(1023,'4',4511,'Instituciones financieras',1),(1024,'4',4512,'Otras entidades',1),(1025,'4',452,'Contratos de arrendamiento financiero',1),(1026,'4',453,'Obligaciones emitidas',1),(1027,'4',4531,'Bonos emitidos',1),(1028,'4',4532,'Bonos titulizados',1),(1029,'4',4533,'Papeles comerciales',1),(1030,'4',4539,'Otras obligaciones',1),(1031,'4',454,'Otros Instrumentos financieros por pagar',1),(1032,'4',4541,'Letras',1),(1033,'4',4542,'Papeles comerciales',1),(1034,'4',4543,'Bonos',1),(1035,'4',4544,'Pagarés',1),(1036,'4',4545,'Facturas conformadas',1),(1037,'4',4549,'Otras obligaciones financieras',1),(1038,'4',455,'Costos de financiación por pagar',1),(1039,'4',4551,'Préstamos de instituciones financieras y otras entidades',1),(1040,'4',45511,'Instituciones financieras',1),(1041,'4',45512,'Otras entidades',1),(1042,'4',4552,'Contratos de arrendamiento financiero',1),(1043,'4',4553,'Obligaciones emitidas',1),(1044,'4',45531,'Bonos emitidos',1),(1045,'4',45532,'Bonos titulizados',1),(1046,'4',45533,'Papeles comerciales',1),(1047,'4',45539,'Otras obligaciones',1),(1048,'4',4554,'Otros instrumentos financieros por pagar',1),(1049,'4',45541,'Letras',1),(1050,'4',45542,'Papeles comerciales',1),(1051,'4',45543,'Bonos',1),(1052,'4',45544,'Pagarés',1),(1053,'4',45545,'Facturas conformadas',1),(1054,'4',45549,'Otras obligaciones financieras',1),(1055,'4',456,'Préstamos con compromisos de recompra',1),(1056,'4',46,'CUENTAS POR PAGAR DIVERSAS  TERCEROS',1),(1057,'4',461,'Reclamaciones de terceros',1),(1058,'4',464,'Pasivos por instrumentos financieros',1),(1059,'4',4641,'Instrumentos financieros primarios',1),(1060,'4',4642,'Instrumentos financieros derivados',1),(1061,'4',46421,'Cartera de negociación',1),(1062,'4',46422,'Instrumentos de cobertura',1),(1063,'4',465,'Pasivos por compra de activo inmovilizado',1),(1064,'4',4651,'Inversiones mobiliarias',1),(1065,'4',4652,'Propiedades de inversión',1),(1066,'4',4653,'Activos adquiridos en arrendamiento financiero',1),(1067,'4',4654,'Propiedad- planta y equipo',1),(1068,'4',4655,'Intangibles',1),(1069,'4',4656,'Activos biológicos',1),(1070,'4',466,'Participación de terceros en acuerdos conjuntos',1),(1071,'4',467,'Depósitos recibidos en garantía',1),(1072,'4',469,'Otras cuentas por pagar diversas',1),(1073,'4',4691,'Subsidios gubernamentales',1),(1074,'4',4692,'Donaciones condicionadas',1),(1075,'4',4699,'Otras cuentas por pagar',1),(1076,'4',47,'CUENTAS POR PAGAR DIVERSAS  RELACIONADAS',1),(1077,'4',471,'Préstamos',1),(1078,'4',472,'Costos de financiación',1),(1079,'4',473,'Anticipos recibidos',1),(1080,'4',474,'Regalías',1),(1081,'4',475,'Dividendos',1),(1082,'4',476,'Depósitos recibidos en garantía',1),(1083,'4',477,'Pasivo por compra de activo inmovilizado',1),(1084,'4',4771,'Inversiones mobiliarias',1),(1085,'4',4772,'Inversiones inmobiliarias',1),(1086,'4',4773,'Activos adquiridos en arrendamiento financiero',1),(1087,'4',4774,'Propiedad- planta y equipo',1),(1088,'4',4775,'Intangibles',1),(1089,'4',4776,'Activos biológicos',1),(1090,'4',479,'Otras cuentas por pagar diversas',1),(1091,'4',4791,'Otras cuentas por pagar diversas',1),(1092,'4',48,'PROVISIONES',1),(1093,'4',481,'Provisión para litigios',1),(1094,'4',482,'Provisión por desmantelamiento- retiro o rehabilitación del inmovilizado',1),(1095,'4',483,'Provisión para reestructuraciones',1),(1096,'4',484,'Provisión para protección y remediación del medio ambiente',1),(1097,'4',485,'Provisión para gastos de responsabilidad social',1),(1098,'4',486,'Provisión para garantías',1),(1099,'4',487,'Provisión por activos por derecho de uso',1),(1100,'4',489,'Otras provisiones',1),(1101,'4',49,'PASIVO DIFERIDO',1),(1102,'4',491,'Impuesto a la renta diferido',1),(1103,'4',4911,'Impuesto a la renta diferido  Patrimonio',1),(1104,'4',4912,'Impuesto a la renta diferido  Resultados',1),(1105,'4',492,'Participaciones de los trabajadores diferidas',1),(1106,'4',4921,'Participaciones de los trabajadores diferidas  Patrimonio',1),(1107,'4',4922,'Participaciones de los trabajadores diferidas  Resultados',1),(1108,'4',493,'Intereses diferidos',1),(1109,'4',4931,'Intereses no devengados en transacciones con terceros',1),(1110,'4',4932,'Intereses no devengados en medición a valor descontado',1),(1111,'4',494,'Ganancia en venta con arrendamiento financiero paralelo',1),(1112,'4',495,'Subsidios recibidos diferidos',1),(1113,'4',496,'Ingresos diferidos',1),(1114,'4',497,'Costos diferidos',1),(1115,'5',50,'CAPITAL',1),(1116,'5',501,'Capital social',1),(1117,'5',5011,'Acciones',1),(1118,'5',5012,'Participaciones',1),(1119,'5',502,'Acciones en tesorería',1),(1120,'5',51,'ACCIONES DE INVERSIÓN',1),(1121,'5',511,'Acciones de inversión',1),(1122,'5',512,'Acciones de inversión en tesorería',1),(1123,'5',52,'CAPITAL ADICIONAL',1),(1124,'5',521,'Primas (descuento) de acciones',1),(1125,'5',522,'Capitalizaciones en trámite',1),(1126,'5',5221,'Aportes',1),(1127,'5',5222,'Reservas',1),(1128,'5',5223,'Acreencias',1),(1129,'5',5224,'Utilidades',1),(1130,'5',523,'Reducciones de capital pendientes de formalización',1),(1131,'5',56,'RESULTADOS NO REALIZADOS',1),(1132,'5',561,'Diferencia en cambio de inversiones permanentes en entidades extranjeras',1),(1133,'5',562,'Instrumentos financieros  Coberturas',1),(1134,'5',563,'Resultado en activos o pasivos financieros mantenidos para negociación',1),(1135,'5',5631,'Ganancia',1),(1136,'5',5632,'Pérdida',1),(1137,'5',564,'Resultado en otros activos o pasivos por inversiones financieras',1),(1138,'5',5641,'Ganancia',1),(1139,'5',5642,'Pérdida',1),(1140,'5',565,'Resultado en activos o pasivos financieros mantenidos para negociación  Compra o venta convencional fecha de liquidación',1),(1141,'5',5651,'Ganancia',1),(1142,'5',5652,'Pérdida',1),(1143,'5',57,'EXCEDENTE DE REVALUACIÓN',1),(1144,'5',571,'Excedente de revaluación',1),(1145,'5',5711,'Propiedad de inversión',1),(1146,'5',57111,'Adquisición directa',1),(1147,'5',57112,'Arrendamiento financiero',1),(1148,'5',5712,'Propiedad- planta y equipo',1),(1149,'5',57121,'Adquisición directa',1),(1150,'5',57122,'Arrendamiento financiero',1),(1151,'5',5713,'Intangibles',1),(1152,'5',5714,'Activos por derecho de uso - arrendamiento operativo',1),(1153,'5',572,'Excedente de revaluación  Acciones liberadas recibidas',1),(1154,'5',573,'Participación en excedente de revaluación  Inversiones en entidades relacionadas',1),(1155,'5',58,'RESERVAS',1),(1156,'5',581,'Reinversión',1),(1157,'5',582,'Legal',1),(1158,'5',583,'Contractuales',1),(1159,'5',584,'Estatutarias',1),(1160,'5',585,'Facultativas',1),(1161,'5',589,'Otras reservas',1),(1162,'5',59,'RESULTADOS ACUMULADOS',1),(1163,'5',591,'Utilidades no distribuidas',1),(1164,'5',5911,'Utilidades acumuladas',1),(1165,'5',5912,'Ingresos de años anteriores',1),(1166,'5',592,'Pérdidas acumuladas',1),(1167,'5',5921,'Pérdidas acumuladas',1),(1168,'5',5922,'Gastos de años anteriores',1),(1169,'6',60,'COMPRAS',1),(1170,'6',601,'Mercaderías',1),(1171,'6',6011,'Mercaderías',1),(1172,'6',602,'Materias primas',1),(1173,'6',603,'Materiales auxiliares- suministros y repuestos',1),(1174,'6',6031,'Materiales auxiliares',1),(1175,'6',6032,'Suministros',1),(1176,'6',6033,'Repuestos',1),(1177,'6',604,'Envases y embalajes',1),(1178,'6',6041,'Envases',1),(1179,'6',6042,'Embalajes',1),(1180,'6',609,'Costos vinculados con las compras',1),(1181,'6',6091,'Costos vinculados con las compras de mercaderías',1),(1182,'6',60911,'Transporte',1),(1183,'6',60912,'Seguros',1),(1184,'6',60913,'Derechos aduaneros',1),(1185,'6',60914,'Comisiones',1),(1186,'6',60919,'Otros costos',1),(1187,'6',6092,'Costos vinculados con las compras de materias primas',1),(1188,'6',60921,'Transporte',1),(1189,'6',60922,'Seguros',1),(1190,'6',60923,'Derechos aduaneros',1),(1191,'6',60924,'Comisiones',1),(1192,'6',60925,'Otros costos',1),(1193,'6',6093,'Costos vinculados con las compras de materiales- suministros y repuestos',1),(1194,'6',60931,'Transporte',1),(1195,'6',60932,'Seguros',1),(1196,'6',60933,'Derechos aduaneros',1),(1197,'6',60934,'Comisiones',1),(1198,'6',60935,'Otros costos',1),(1199,'6',6094,'Costos vinculados con las compras de envases y embalajes',1),(1200,'6',60941,'Transporte',1),(1201,'6',60942,'Seguros',1),(1202,'6',60943,'Derechos aduaneros',1),(1203,'6',60944,'Comisiones',1),(1204,'6',60945,'Otros costos',1),(1205,'6',61,'VARIACIÓN DE INVENTARIOS',1),(1206,'6',611,'Mercaderías',1),(1207,'6',6111,'Mercaderías',1),(1208,'6',612,'Materias primas',1),(1209,'6',6121,'Materias primas',1),(1210,'6',613,'Materiales auxiliares- suministros y repuestos',1),(1211,'6',6131,'Materiales auxiliares',1),(1212,'6',6132,'Suministros',1),(1213,'6',6133,'Repuestos',1),(1214,'6',614,'Envases y embalajes',1),(1215,'6',6141,'Envases',1),(1216,'6',6142,'Embalajes',1),(1217,'6',62,'GASTOS DE PERSONAL Y DIRECTORES',1),(1218,'6',621,'Remuneraciones',1),(1219,'6',6211,'Sueldos y salarios',1),(1220,'6',6212,'Comisiones',1),(1221,'6',6213,'Remuneraciones en especie',1),(1222,'6',6214,'Gratificaciones',1),(1223,'6',6215,'Vacaciones',1),(1224,'6',622,'Otras remuneraciones',1),(1225,'6',623,'Indemnizaciones al personal',1),(1226,'6',624,'Capacitación',1),(1227,'6',625,'Atención al personal',1),(1228,'6',627,'Seguridad- previsión social y otras contribuciones',1),(1229,'6',6271,'Régimen de prestaciones de salud',1),(1230,'6',6272,'Régimen de pensiones - Aporte de empresa',1),(1231,'6',6273,'Seguro complementario de trabajo de riesgo- accidentes de trabajo y enfermedades profesionales',1),(1232,'6',6274,'Seguro de vida',1),(1233,'6',6275,'Seguros particulares de prestaciones de salud  EPS y otros particulares',1),(1234,'6',6276,'Caja de beneficios de seguridad social del pescador',1),(1235,'6',6277,'Contribuciones al SENATI',1),(1236,'6',628,'Retribuciones al directorio',1),(1237,'6',629,'Beneficios sociales de los trabajadores',1),(1238,'6',6291,'Compensación por tiempo de servicio',1),(1239,'6',6292,'Pensiones y jubilaciones',1),(1240,'6',6293,'Otros beneficios post-empleo',1),(1241,'6',6294,'Participación en las utilidades',1),(1242,'6',62941,'Participación corriente',1),(1243,'6',62942,'Participación diferida',1),(1244,'6',63,'GASTOS DE SERVICIOS PRESTADOS POR TERCEROS',1),(1245,'6',631,'Transporte- correos y gastos de viaje',1),(1246,'6',6311,'Transporte',1),(1247,'6',63111,'De carga',1),(1248,'6',63112,'De pasajeros',1),(1249,'6',6312,'Correos',1),(1250,'6',6313,'Alojamiento',1),(1251,'6',6314,'Alimentación',1),(1252,'6',6315,'Otros gastos de viaje',1),(1253,'6',632,'Asesoría y consultoría',1),(1254,'6',6321,'Administrativa',1),(1255,'6',6322,'Legal y tributaria',1),(1256,'6',6323,'Auditoría y contable',1),(1257,'6',6324,'Mercadotecnia',1),(1258,'6',6325,'Medioambiental',1),(1259,'6',6326,'Investigación y desarrollo',1),(1260,'6',6327,'Producción',1),(1261,'6',6329,'Otros',1),(1262,'6',633,'Producción encargada a terceros',1),(1263,'6',634,'Mantenimiento y reparaciones',1),(1264,'6',6341,'Propiedad de inversión',1),(1265,'6',6342,'Activos por derecho de uso',1),(1266,'6',63421,'Financiero',1),(1267,'6',63432,'Operativo',1),(1268,'6',6343,'Propiedad- planta y equipo',1),(1269,'6',6344,'Intangibles',1),(1270,'6',6345,'Activos biológicos',1),(1271,'6',635,'Alquileres',1),(1272,'6',6351,'Terrenos',1),(1273,'6',6352,'Edificaciones',1),(1274,'6',6353,'Maquinarias y equipos de explotación',1),(1275,'6',6354,'Equipo de transporte',1),(1276,'6',6355,'Muebles y enseres',1),(1277,'6',6356,'Equipos diversos',1),(1278,'6',636,'Servicios básicos',1),(1279,'6',6361,'Energía eléctrica',1),(1280,'6',6362,'Gas',1),(1281,'6',6363,'Agua',1),(1282,'6',6364,'Teléfono',1),(1283,'6',6365,'Internet',1),(1284,'6',6366,'Radio',1),(1285,'6',6367,'Cable',1),(1286,'6',637,'Publicidad- publicaciones- relaciones públicas',1),(1287,'6',6371,'Publicidad',1),(1288,'6',6372,'Publicaciones',1),(1289,'6',6373,'Relaciones públicas',1),(1290,'6',638,'Servicios de contratistas',1),(1291,'6',639,'Otros servicios prestados por terceros',1),(1292,'6',6391,'Gastos bancarios',1),(1293,'6',6392,'Gastos de laboratorio',1),(1294,'6',64,'GASTOS POR TRIBUTOS',1),(1295,'6',641,'Gobierno nacional',1),(1296,'6',6411,'Impuesto general a las ventas y selectivo al consumo',1),(1297,'6',6412,'Impuesto a las transacciones financieras',1),(1298,'6',6413,'Impuesto temporal a los activos netos',1),(1299,'6',6414,'Impuesto a los juegos de casino y máquinas tragamonedas',1),(1300,'6',6415,'Regalías mineras',1),(1301,'6',6416,'Cánones',1),(1302,'6',6419,'Otros',1),(1303,'6',642,'Gobierno regional',1),(1304,'6',643,'Gobierno local',1),(1305,'6',6431,'Impuesto predial',1),(1306,'6',6432,'Arbitrios municipales y seguridad ciudadana',1),(1307,'6',6433,'Impuesto al patrimonio vehicular',1),(1308,'6',6434,'Licencia de funcionamiento',1),(1309,'6',6439,'Otros',1),(1310,'6',644,'Otros gastos por tributos',1),(1311,'6',6442,'Contribución al SENCICO',1),(1312,'6',6443,'Otros',1),(1313,'6',645,'Gastos en deuda tributaria',1),(1314,'6',6451,'Intereses',1),(1315,'6',6452,'intereses - fraccionamiento',1),(1316,'6',6453,'Multas',1),(1317,'6',6454,'Costas y otros',1),(1318,'6',65,'OTROS GASTOS DE GESTION',1),(1319,'6',651,'Seguros',1),(1320,'6',652,'Regalías',1),(1321,'6',653,'Suscripciones',1),(1322,'6',654,'Licencias y derechos de vigencia',1),(1323,'6',655,'Costo neto de enajenación de activos inmovilizados y operaciones discontinuadas',1),(1324,'6',6551,'Costo neto de enajenación de activos inmovilizados',1),(1325,'6',65511,'Inversiones mobiliarias',1),(1326,'6',65512,'Propiedades de inversión',1),(1327,'6',65513,'Activos por derecho de uso - arrendamiento financiero',1),(1328,'6',65514,'Propiedad- planta y equipo',1),(1329,'6',65515,'Intangibles',1),(1330,'6',65516,'Activos biológicos',1),(1331,'6',6552,'Operaciones discontinuadas  Abandono de activos',1),(1332,'6',65521,'Propiedades de inversión',1),(1333,'6',65522,'Activos por derecho de uso - Arrendamiento financiero',1),(1334,'6',65523,'Propiedad- planta y equipo',1),(1335,'6',65524,'Intangibles',1),(1336,'6',65525,'Activos biológicos',1),(1337,'6',656,'Suministros',1),(1338,'6',658,'Gestión medioambiental',1),(1339,'6',659,'Otros gastos de gestión',1),(1340,'6',6591,'Donaciones',1),(1341,'6',6592,'Sanciones administrativas',1),(1342,'6',66,'PERDIDA POR MEDICIÓN DE ACTIVOS NO FINANCIEROS AL VALOR RAZONABLE',1),(1343,'6',661,'Activo realizable',1),(1344,'6',6611,'Mercaderías',1),(1345,'6',6612,'Productos terminados',1),(1346,'6',6613,'Activos no corrientes mantenidos para la venta',1),(1347,'6',66131,'Propiedades de inversión',1),(1348,'6',66132,'Propiedad- planta y equipo',1),(1349,'6',66133,'Intangibles',1),(1350,'6',66134,'Activos biológicos',1),(1351,'6',662,'Activo inmovilizado',1),(1352,'6',6621,'Propiedades de inversión',1),(1353,'6',6622,'Activos biológicos',1),(1354,'6',67,'GASTOS FINANCIEROS',1),(1355,'6',671,'Gastos en operaciones de endeudamiento y otros',1),(1356,'6',6711,'Préstamos de instituciones financieras y otras entidades',1),(1357,'6',6712,'Contratos de arrendamiento financiero',1),(1358,'6',6713,'Emisión y colocación de instrumentos representativos de deuda y patrimonio',1),(1359,'6',6714,'Documentos vendidos o descontados',1),(1360,'6',672,'Pérdida por instrumentos financieros derivados',1),(1361,'6',673,'Intereses por préstamos y otras obligaciones',1),(1362,'6',6731,'Préstamos de instituciones financieras y otras entidades',1),(1363,'6',67311,'Instituciones financieras',1),(1364,'6',67312,'Otras entidades',1),(1365,'6',6732,'Contratos de arrendamiento financiero',1),(1366,'6',6733,'Otros instrumentos financieros por pagar',1),(1367,'6',6734,'Documentos vendidos o descontados',1),(1368,'6',6735,'Obligaciones emitidas',1),(1369,'6',6736,'Obligaciones comerciales',1),(1370,'6',674,'Gastos en operaciones de factoraje (factoring)',1),(1371,'6',6741,'Pérdida en instrumentos vendidos',1),(1372,'6',675,'Descuentos concedidos por pronto pago',1),(1373,'6',676,'Diferencia de cambio',1),(1374,'6',677,'Pérdida por medición de activos y pasivos financieros al valor razonable',1),(1375,'6',6771,'Inversiones mantenidas para negociación',1),(1376,'6',6772,'Otras inversiones financieras',1),(1377,'6',6773,'Otros',1),(1378,'6',678,'Participación en resultados de entidades relacionadas',1),(1379,'6',6781,'Participación en los resultados de subsidiarias y asociadas bajo el método del valor patrimonial',1),(1380,'6',6782,'Participaciones en negocios conjuntos',1),(1381,'6',679,'Otros gastos financieros',1),(1382,'6',6791,'Primas por opciones',1),(1383,'6',6792,'Gastos financieros en medición a valor descontado',1),(1384,'6',6793,'Gastos financieros en actualización de activos por derecho de uso',1),(1385,'6',68,'VALUACIÓN Y DETERIORO DE ACTIVOS Y PROVISIONES',1),(1386,'6',681,'Depreciación de propiedades de inversión',1),(1387,'6',6811,'Edificaciones',1),(1388,'6',68111,'Costo',1),(1389,'6',68112,'Revaluación',1),(1390,'6',68113,'Costo de financiación',1),(1391,'6',682,'Depreciación de activos por derecho de uso - arrendamiento financiero',1),(1392,'6',6821,'Propiedades de inversión',1),(1393,'6',68211,'Edificaciones',1),(1394,'6',682111,'Costo',1),(1395,'6',682112,'Revaluación',1),(1396,'6',682113,'Costo de financiación',1),(1397,'6',6822,'Propiedad- planta y equipo',1),(1398,'6',68221,'Edificaciones',1),(1399,'6',682211,'Costo',1),(1400,'6',682212,'Revaluación',1),(1401,'6',682213,'Costo de financiación',1),(1402,'6',68222,'Maquinarias y equipos de explotación',1),(1403,'6',682221,'Costo',1),(1404,'6',682222,'Revaluación',1),(1405,'6',682223,'Costo de financiación',1),(1406,'6',68223,'Unidades de transporte',1),(1407,'6',682231,'Costo',1),(1408,'6',682232,'Revaluación',1),(1409,'6',68225,'Equipos diversos',1),(1410,'6',682251,'Costo',1),(1411,'6',682252,'Revaluación',1),(1412,'6',683,'Depreciación de activos por derecho de uso - arrendamiento operativo',1),(1413,'6',6831,'Depreciación de activos por derecho de uso - arrendamiento operativo',1),(1414,'6',68311,'Edificaciones',1),(1415,'6',683111,'Costo',1),(1416,'6',683112,'Revaluación',1),(1417,'6',68312,'Maquinarias y equipos de explotación',1),(1418,'6',683121,'Costo',1),(1419,'6',683122,'Revaluación',1),(1420,'6',68313,'Unidades de transporte',1),(1421,'6',683131,'Costo',1),(1422,'6',683132,'Revaluación',1),(1423,'6',68315,'Equipos diversos',1),(1424,'6',683351,'Costo',1),(1425,'6',683152,'Revaluación',1),(1426,'6',684,'Depreciación de propiedad- planta y equipo',1),(1427,'6',6841,'Depreciación de propiedad- planta y equipo - Costo',1),(1428,'6',68410,'Plantas productoras',1),(1429,'6',68411,'Edificaciones',1),(1430,'6',68412,'Maquinarias y equipos de explotación',1),(1431,'6',68413,'Unidades de transporte',1),(1432,'6',68414,'Muebles y enseres',1),(1433,'6',68415,'Equipos diversos',1),(1434,'6',68416,'Herramientas y unidades de reemplazo',1),(1435,'6',6842,'Depreciación de propiedad- planta y equipo - Revaluación',1),(1436,'6',68420,'Plantas productoras',1),(1437,'6',68421,'Edificaciones',1),(1438,'6',68422,'Maquinarias y equipos de explotación',1),(1439,'6',68423,'Unidades de transporte',1),(1440,'6',68424,'Muebles y enseres',1),(1441,'6',68425,'Equipos diversos',1),(1442,'6',68426,'Herramientas y unidades de reemplazo',1),(1443,'6',6843,'Depreciación de propiedad- planta y equipo - Costos de financiación',1),(1444,'6',68430,'Plantas productoras',1),(1445,'6',68431,'Edificaciones',1),(1446,'6',68432,'Maquinarias y equipos de explotación',1),(1447,'6',685,'Depreciación de activos biológicos en producción',1),(1448,'6',6851,'Depreciación de activos biológicos en producción - costo',1),(1449,'6',68511,'Activos biológicos de origen animal',1),(1450,'6',68512,'Activos biológicos de origen vegetal',1),(1451,'6',6852,'Depreciación de activos biológicos en producción - costo de financiación',1),(1452,'6',68521,'Activos biológicos de origen animal',1),(1453,'6',68522,'Activos biológicos de origen vegetal',1),(1454,'6',686,'Amortización de intangibles',1),(1455,'6',6861,'Amortización de intangibles  Costo',1),(1456,'6',68611,'Concesiones- licencias y otros derechos',1),(1457,'6',68612,'Patentes y propiedad industrial',1),(1458,'6',68613,'Programas de computadora (software)',1),(1459,'6',68614,'Costos de exploración y desarrollo',1),(1460,'6',68615,'Fórmulas- diseños y prototipos',1),(1461,'6',68619,'Otros activos intangibles',1),(1462,'6',6862,'Amortización de intangibles  Revaluación',1),(1463,'6',68621,'Concesiones- licencias y otros derechos',1),(1464,'6',68622,'Patentes y propiedad industrial',1),(1465,'6',68623,'Programas de computadora (software)',1),(1466,'6',68624,'Costos de exploración y desarrollo',1),(1467,'6',68625,'Fórmulas- diseños y prototipos',1),(1468,'6',68629,'Otros activos intangibles',1),(1469,'6',687,'Valuación de activos',1),(1470,'6',6871,'Estimación de cuentas de cobranza dudosa',1),(1471,'6',68711,'Cuentas por cobrar comerciales  Terceros',1),(1472,'6',68712,'Cuentas por cobrar comerciales  Relacionadas',1),(1473,'6',68713,'Cuentas por cobrar al personal- a los accionistas (socios) y directores',1),(1474,'6',68714,'Cuentas por cobrar diversas  Terceros',1),(1475,'6',68715,'Cuentas por cobrar diversas  Relacionadas',1),(1476,'6',6873,'Desvalorización de inversiones mobiliarias',1),(1477,'6',68731,'Inversiones a ser mantenidas hasta el vencimiento',1),(1478,'6',68732,'Instrumentos financieros representativos de derecho patrimonial',1),(1479,'6',688,'Deterioro del valor de los activos',1),(1480,'6',6881,'Desvalorización de propiedad de inversión',1),(1481,'6',68812,'Edificaciones',1),(1482,'6',68813,'Construcciones en curso',1),(1483,'6',6882,'Desvalorización de activos por derecho de uso - arrendamiento financiero',1),(1484,'6',68820,'Planta productora en producción',1),(1485,'6',68821,'Planta productora en desarrollo',1),(1486,'6',68822,'Terrenos',1),(1487,'6',68823,'Edificaciones',1),(1488,'6',68824,'Maquinarias y equipos de explotación',1),(1489,'6',68825,'Unidades de transporte',1),(1490,'6',68826,'Muebles y enseres',1),(1491,'6',68827,'Equipos diversos',1),(1492,'6',68828,'Herramientas y unidades de reemplazo',1),(1493,'6',6883,'Desvalorización de propiedad- planta y equipo',1),(1494,'6',68830,'Planta productora en producción',1),(1495,'6',68831,'Planta productora en desarrollo',1),(1496,'6',68832,'Terrenos',1),(1497,'6',68833,'Edificaciones',1),(1498,'6',68834,'Maquinarias y equipos de explotación',1),(1499,'6',68835,'Unidades de transporte',1),(1500,'6',68836,'Muebles y enseres',1),(1501,'6',68837,'Equipos diversos',1),(1502,'6',68838,'Herramientas y unidades de reemplazo',1),(1503,'6',6884,'Desvalorización de intangibles',1),(1504,'6',68841,'Concesiones- licencias y otros derechos',1),(1505,'6',68842,'Patentes y propiedad industrial',1),(1506,'6',68843,'Programas de computadora (software)',1),(1507,'6',68844,'Costos de exploración y desarrollo',1),(1508,'6',68845,'Fórmulas- diseños y prototipos',1),(1509,'6',68846,'Otros activos intangibles',1),(1510,'6',68847,'Plusvalía mercantil',1),(1511,'6',6889,'Desvalorización de activos biológicos en producción',1),(1512,'6',68891,'Activos biológicos de origen animal',1),(1513,'6',68892,'Activos biológicos de origen vegetal',1),(1514,'6',689,'Provisiones',1),(1515,'6',6891,'Provisión para litigios',1),(1516,'6',68911,'Provisión para litigios  Costo',1),(1517,'6',68912,'Provisión para litigios  Actualización financiera',1),(1518,'6',6892,'Provisión por desmantelamiento- retiro o rehabilitación del inmovilizado',1),(1519,'6',68921,'Provisión por desmantelamiento- retiro o rehabilitación del inmovilizado  Costo',1),(1520,'6',68922,'Provisión por desmantelamiento- retiro o rehabilitación del inmovilizado  Actualización financiera',1),(1521,'6',6893,'Provisión para reestructuraciones',1),(1522,'6',6894,'Provisión para protección y remediación del medio ambiente',1),(1523,'6',68941,'Provisión para protección y remediación del medio ambiente  Costo',1),(1524,'6',68942,'Provisión para protección y remediación del medio ambiente  Actualización financiera',1),(1525,'6',6896,'Provisión para garantías',1),(1526,'6',68961,'Provisión para garantías  Costo',1),(1527,'6',68962,'Provisión para garantías  Actualización financiera',1),(1528,'6',6897,'Provisión por activos por derecho de uso',1),(1529,'6',68971,'Provisión por activos por derecho de uso arrendamiento operativo',1),(1530,'6',68972,'Provisión por activos por derecho de uso arrendamiento operativo - actualización financiera',1),(1531,'6',6899,'Otras provisiones',1),(1532,'6',69,'COSTO DE VENTAS',1),(1533,'6',691,'Mercaderías',1),(1534,'6',6911,'Mercaderías - exportación',1),(1535,'6',69111,'Terceros',1),(1536,'6',69112,'Relacionadas',1),(1537,'6',6912,'Mercaderías - venta local',1),(1538,'6',69121,'Terceros',1),(1539,'6',69122,'Relacionadas',1),(1540,'6',692,'Productos terminados',1),(1541,'6',6921,'Productos terminados - Exportación',1),(1542,'6',69211,'Terceros',1),(1543,'6',69212,'Relacionadas',1),(1544,'6',6922,'Productos terminados - Venta local',1),(1545,'6',69221,'Terceros',1),(1546,'6',69222,'Relacionadas',1),(1547,'6',6923,'Costos de financiación  Productos terminados',1),(1548,'6',69231,'Terceros',1),(1549,'6',69232,'Relacionadas',1),(1550,'6',6924,'Costos de producción no absorbido  Productos terminados',1),(1551,'6',6925,'Costo de ineficiencia  Productos terminados',1),(1552,'6',693,'Servicios terminados',1),(1553,'6',6931,'Servicios  Exportación',1),(1554,'6',69311,'Terceros',1),(1555,'6',69312,'Relacionadas',1),(1556,'6',6932,'Servicios  local',1),(1557,'6',69321,'Terceros',1),(1558,'6',69322,'Relacionadas',1),(1559,'6',694,'Subproductos- desechos y desperdicios',1),(1560,'6',6941,'Subproductos',1),(1561,'6',69411,'Terceros',1),(1562,'6',69412,'Relacionadas',1),(1563,'6',6942,'Desechos y desperdicios',1),(1564,'6',69421,'Terceros',1),(1565,'6',69422,'Relacionadas',1),(1566,'6',695,'Gastos por desvalorización de inventarios al costo',1),(1567,'6',6951,'Mercaderías',1),(1568,'6',6952,'Productos terminados',1),(1569,'6',6953,'Subproductos- desechos y desperdicios',1),(1570,'6',6954,'Productos en proceso',1),(1571,'6',6955,'Materias primas',1),(1572,'6',6956,'Materiales auxiliares- suministros y repuestos',1),(1573,'6',6957,'Envases y embalajes',1),(1574,'6',6958,'Inventarios por recibir',1),(1575,'7',70,'VENTAS',1),(1576,'7',701,'Mercaderías',1),(1577,'7',7011,'Mercaderías - venta de exportación',1),(1578,'7',70111,'Terceros',1),(1579,'7',70112,'Relacionadas',1),(1580,'7',7012,'Mercaderías - venta local',1),(1581,'7',70121,'Terceros',1),(1582,'7',70122,'Relacionadas',1),(1583,'7',702,'Productos terminados',1),(1584,'7',7021,'Productos terminados - venta de exportación',1),(1585,'7',70211,'Terceros',1),(1586,'7',70212,'Relacionadas',1),(1587,'7',7022,'Productos terminados - venta local',1),(1588,'7',70221,'Terceros',1),(1589,'7',70222,'Relacionadas',1),(1590,'7',703,'Servicios terminados',1),(1591,'7',7031,'Servicios  exportación',1),(1592,'7',70311,'Terceros',1),(1593,'7',70312,'Relacionadas',1),(1594,'7',7032,'Servicios  local',1),(1595,'7',70321,'Terceros',1),(1596,'7',70322,'Relacionadas',1),(1597,'7',704,'Subproductos- desechos y desperdicios',1),(1598,'7',7041,'Subproductos',1),(1599,'7',70411,'Terceros',1),(1600,'7',70412,'Relacionadas',1),(1601,'7',7042,'Desechos y desperdicios',1),(1602,'7',70421,'Terceros',1),(1603,'7',70422,'Relacionadas',1),(1604,'7',709,'Devoluciones sobre ventas',1),(1605,'7',7091,'Mercaderías - Venta de exportación',1),(1606,'7',70911,'Terceros',1),(1607,'7',70912,'Relacionadas',1),(1608,'7',7092,'Mercaderías - Venta local',1),(1609,'7',70921,'Terceros',1),(1610,'7',70922,'Relacionadas',1),(1611,'7',7093,'Productos terminados - Venta de exportación',1),(1612,'7',70931,'Terceros',1),(1613,'7',70932,'Relacionadas',1),(1614,'7',7094,'Productos terminados - Venta local',1),(1615,'7',70941,'Terceros',1),(1616,'7',70942,'Relacionadas',1),(1617,'7',7095,'Inventarios de servicios rechazados',1),(1618,'7',70951,'Terceros',1),(1619,'7',70952,'Relacionadas',1),(1620,'7',7096,'Subproductos- desechos y desperdicios',1),(1621,'7',70961,'Terceros',1),(1622,'7',70962,'Relacionadas',1),(1623,'7',71,'VARIACIÓN DE LA PRODUCCIÓN ALMACENADA',1),(1624,'7',711,'Variación de productos terminados',1),(1625,'7',7111,'Productos terminados',1),(1626,'7',712,'Variación de subproductos- desechos y desperdicios',1),(1627,'7',7121,'Subproductos',1),(1628,'7',7122,'Desechos y desperdicios',1),(1629,'7',713,'Variación de productos en proceso',1),(1630,'7',7131,'Productos en proceso de manufactura',1),(1631,'7',714,'Variación de envases y embalajes',1),(1632,'7',7141,'Envases',1),(1633,'7',7142,'Embalajes',1),(1634,'7',715,'Variación de inventarios de servicios',1),(1635,'7',7151,' Inventarios de servicios en proceso',1),(1636,'7',72,'PRODUCCIÓN DE ACTIVO INMOVILIZADO',1),(1637,'7',721,'Propiedades de inversión',1),(1638,'7',7211,'Edificaciones',1),(1639,'7',722,'Propiedad- planta y equipo',1),(1640,'7',7220,'Planta productora',1),(1641,'7',7221,'Edificaciones',1),(1642,'7',7222,'Maquinarias y otros equipos de explotación',1),(1643,'7',7223,'Unidades de transporte',1),(1644,'7',7224,'Muebles y enseres',1),(1645,'7',7225,'Equipos diversos',1),(1646,'7',723,'Intangibles',1),(1647,'7',7231,'Programas de computadora (software)',1),(1648,'7',7232,'Costos de exploración y desarrollo',1),(1649,'7',7233,'Fórmulas- diseños y prototipos',1),(1650,'7',724,'Activos biológicos',1),(1651,'7',7241,'Activos biológicos en desarrollo de origen animal',1),(1652,'7',7242,'Activos biológicos en desarrollo de origen vegetal',1),(1653,'7',725,'Costos de financiación capitalizados',1),(1654,'7',7251,'Costos de financiación  Propiedades de inversión',1),(1655,'7',72511,'Plantas productoras en desarrollo',1),(1656,'7',72512,'Edificaciones',1),(1657,'7',7252,'Costos de financiación  Propiedad- planta y equipo',1),(1658,'7',72521,'Plantas productoras en desarrollo',1),(1659,'7',72522,'Edificaciones',1),(1660,'7',72523,'Maquinarias y otros equipos de explotación',1),(1661,'7',7253,'Costos de financiación  Intangibles',1),(1662,'7',7254,'Costos de financiación  Activos biológicos en desarrollo',1),(1663,'7',72541,'Activos biológicos de origen animal',1),(1664,'7',72542,'Activos biológicos de origen vegetal',1),(1665,'7',73,'DESCUENTOS- REBAJAS Y BONIFICACIONES OBTENIDOS',1),(1666,'7',731,'Descuentos- rebajas y bonificaciones obtenidos',1),(1667,'7',7311,'Terceros',1),(1668,'7',7312,'Relacionadas',1),(1669,'7',74,'DESCUENTOS- REBAJAS y BONIFICACIONES CONCEDIDOS',1),(1670,'7',741,'Descuentos- rebajas y bonificaciones concedidos',1),(1671,'7',7411,'Terceros',1),(1672,'7',7412,'Relacionadas',1),(1673,'7',75,'OTROS INGRESOS DE GESTIÓN',1),(1674,'7',751,'Servicios en beneficio del personal',1),(1675,'7',752,'Comisiones y corretajes',1),(1676,'7',753,'Regalías',1),(1677,'7',754,'Alquileres',1),(1678,'7',7540,'Plantas productoras',1),(1679,'7',7541,'Terrenos',1),(1680,'7',7542,'Edificaciones',1),(1681,'7',7543,'Maquinarias y equipos de explotación',1),(1682,'7',7544,'Unidades de transporte',1),(1683,'7',7545,'Equipos diversos',1),(1684,'7',755,'Recuperación de cuentas de valuación',1),(1685,'7',7551,'Recuperación  Cuentas de cobranza dudosa',1),(1686,'7',7552,'Recuperación  Desvalorización de inventarios',1),(1687,'7',7553,'Recuperación  Desvalorización de inversiones mobiliarias',1),(1688,'7',756,'Enajenación de activos inmovilizados',1),(1689,'7',7561,'Inversiones mobiliarias',1),(1690,'7',7562,'Propiedades de inversión',1),(1691,'7',7563,'Activos adquiridos en arrendamiento financiero',1),(1692,'7',7564,'Propiedad- planta y equipo',1),(1693,'7',7565,'Intangibles',1),(1694,'7',7566,'Activos biológicos',1),(1695,'7',757,'Recuperación de deterioro de cuentas de activos inmovilizados',1),(1696,'7',7571,'Recuperación de deterioro de propiedades de inversión',1),(1697,'7',7572,'Recuperación de deterioro de propiedad- planta y equipo',1),(1698,'7',7573,'Recuperación de deterioro de intangibles',1),(1699,'7',7574,'Recuperación de deterioro de activos biológicos',1),(1700,'7',759,'Otros ingresos de gestión',1),(1701,'7',7591,'Subsidios gubernamentales',1),(1702,'7',7592,'Reclamos al seguro',1),(1703,'7',7593,'Donaciones',1),(1704,'7',7594,'Devoluciones tributarias',1),(1705,'7',7599,'Otros ingresos de gestión',1),(1706,'7',76,'GANANCIA POR MEDICIÓN DE ACTIVOS NO FINANCIEROS AL VALOR RAZONABLE',1),(1707,'7',761,'Activo realizable',1),(1708,'7',7611,'Mercaderías',1),(1709,'7',7612,'Productos terminados',1),(1710,'7',7613,'Activos no corrientes mantenidos para la venta',1),(1711,'7',76131,'Propiedades de inversión',1),(1712,'7',76132,'Propiedad- planta y equipo',1),(1713,'7',76133,'Intangibles',1),(1714,'7',76134,'Activos biológicos',1),(1715,'7',762,'Activo inmovilizado',1),(1716,'7',7621,'Propiedades de inversión',1),(1717,'7',7622,'Activos biológicos',1),(1718,'7',77,'INGRESOS FINANCIEROS',1),(1719,'7',771,'Ganancia por instrumento financiero derivado',1),(1720,'7',772,'Rendimientos ganados',1),(1721,'7',7721,'Depósitos en instituciones financieras',1),(1722,'7',7722,'Cuentas por cobrar comerciales',1),(1723,'7',7723,'Préstamos otorgados',1),(1724,'7',7724,'Inversiones a ser mantenidas hasta el vencimiento',1),(1725,'7',7725,'Instrumentos financieros representativos de derecho patrimonial',1),(1726,'7',773,'Dividendos',1),(1727,'7',774,'Ingresos en operaciones de factoraje (factoring)',1),(1728,'7',775,'Descuentos obtenidos por pronto pago',1),(1729,'7',776,'Diferencia en cambio',1),(1730,'7',777,'Ganancia por medición de activos y pasivos financieros al valor razonable',1),(1731,'7',7771,'Inversiones mantenidas para negociación',1),(1732,'7',7772,'Otras inversiones',1),(1733,'7',7773,'Otras',1),(1734,'7',778,'Participación en resultados de entidades relacionadas',1),(1735,'7',7781,'Participación en los resultados de subsidiarias y asociadas bajo el método del valor patrimonial',1),(1736,'7',7782,'Ingresos por participaciones en negocios conjuntos',1),(1737,'7',779,'Otros ingresos financieros',1),(1738,'7',7792,'Ingresos financieros en medición a valor descontado',1),(1739,'7',78,'CARGAS CUBIERTAS POR PROVISIONES',1),(1740,'7',781,'Cargas cubiertas por provisiones',1),(1741,'7',79,'CARGAS IMPUTABLES A CUENTAS DE COSTOS Y GASTOS',1),(1742,'7',791,'Cargas imputables a cuentas de costos y gastos',1),(1743,'7',792,'Gastos financieros imputables a cuentas de inventarios',1),(1744,'8',80,'MARGEN COMERCIAL',1),(1745,'8',801,'Margen comercial',1),(1746,'8',81,'PRODUCCIÓN DEL EJERCICIO',1),(1747,'8',811,'Producción de bienes',1),(1748,'8',812,'Producción de servicios',1),(1749,'8',813,'Producción de activo inmovilizado',1),(1750,'8',82,'VALOR AGREGADO',1),(1751,'8',821,'Valor agregado',1),(1752,'8',83,'EXCEDENTE BRUTO (INSUFICIENCIA BRUTA) DE EXPLOTACIÓN',1),(1753,'8',831,'Excedente bruto (insuficiencia bruta) de explotación',1),(1754,'8',84,'RESULTADO DE EXPLOTACIÓN',1),(1755,'8',841,'Resultado de explotación',1),(1756,'8',85,'RESULTADO ANTES DE PARTICIPACIONES E IMPUESTOS',1),(1757,'8',851,'Resultado antes del impuesto a las ganancias',1),(1758,'8',88,'IMPUESTO A LA RENTA',1),(1759,'8',881,'Impuesto a las ganancias  Corriente',1),(1760,'8',882,'Impuesto a las ganancias  Diferido',1),(1761,'8',89,'DETERMINACIÓN DEL RESULTADO DEL EJERCICIO',1),(1762,'8',891,'Utilidad',1),(1763,'8',892,'Pérdida',1),(1764,'9',90,'COSTO DE PRODUCCIÓN',1),(1765,'9',91,'COSTO DE SERVICIOS',1),(1766,'9',92,'COSTOS POR DISTRIBUIR',1),(1767,'9',94,'GASTOS ADMINISTRATIVOS',1),(1768,'9',95,'GASTOS DE VENTAS',1),(1769,'9',97,'GASTOS FINANCIEROS',1),(1770,'0',1,'BIENES Y VALORES ENTREGADOS',1),(1771,'0',2,'DERECHOS SOBRE INSTRUMENTOS FINANCIEROS',1),(1772,'0',3,'OTRAS CUENTAS DE ORDEN DEUDORAS',1),(1773,'0',4,'CONTRAPARTIDA DE CUENTAS DE ORDEN DEUDORAS',1),(1774,'0',6,'BIENES Y VALORES RECIBIDOS',1),(1775,'0',7,'COMPROMISOS SOBRE INSTRUMENTOS FINANCIEROS',1),(1776,'0',8,'OTRAS CUENTAS DE ORDEN ACREEDORAS',1),(1777,'0',9,'CONTRAPARTIDA DE CUENTAS DE ORDEN ACREEDORAS',1);
/*!40000 ALTER TABLE `t9plancontables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tareas`
--

DROP TABLE IF EXISTS `tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tareas` (
  `tar_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tar_gar_id` bigint(20) NOT NULL,
  `tar_nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `tar_descripcion` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `tar_imagen` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `tar_file` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `tar_comentario` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `tar_inicio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tar_fin` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tar_ava_id` bigint(20) NOT NULL,
  `tar_pri_id` bigint(20) NOT NULL,
  `tar_baground` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `tar_colorText` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  PRIMARY KEY (`tar_id`),
  KEY `tareas_gareas` (`tar_gar_id`),
  CONSTRAINT `tareas_gareas` FOREIGN KEY (`tar_gar_id`) REFERENCES `company5_se_socios`.`areas` (`gar_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tareas`
--

LOCK TABLES `tareas` WRITE;
/*!40000 ALTER TABLE `tareas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcespeciales`
--

DROP TABLE IF EXISTS `tcespeciales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcespeciales` (
  `tce_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tce_gtc_id` bigint(20) DEFAULT NULL,
  `tce_compra` decimal(6,4) DEFAULT NULL,
  `tce_venta` decimal(6,4) DEFAULT NULL,
  PRIMARY KEY (`tce_id`),
  KEY `tcespeciales_gtcambios` (`tce_gtc_id`),
  CONSTRAINT `tcespeciales_gtcambios` FOREIGN KEY (`tce_gtc_id`) REFERENCES `company5_se_socios`.`tcambios` (`gtc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=874 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcespeciales`
--

LOCK TABLES `tcespeciales` WRITE;
/*!40000 ALTER TABLE `tcespeciales` DISABLE KEYS */;
INSERT INTO `tcespeciales` (`tce_id`, `tce_gtc_id`, `tce_compra`, `tce_venta`) VALUES (1,290,NULL,NULL),(2,292,NULL,NULL),(3,293,NULL,NULL),(4,294,NULL,NULL),(5,NULL,NULL,NULL),(6,NULL,NULL,NULL),(7,NULL,NULL,NULL),(8,NULL,NULL,NULL),(9,NULL,NULL,NULL),(10,NULL,NULL,NULL),(11,NULL,NULL,NULL),(12,NULL,NULL,NULL),(13,NULL,NULL,NULL),(14,NULL,NULL,NULL),(15,NULL,NULL,NULL),(16,NULL,NULL,NULL),(17,NULL,NULL,NULL),(18,NULL,NULL,NULL),(19,NULL,NULL,NULL),(20,NULL,NULL,NULL),(21,NULL,NULL,NULL),(22,NULL,NULL,NULL),(23,NULL,NULL,NULL),(24,NULL,NULL,NULL),(25,NULL,NULL,NULL),(26,NULL,NULL,NULL),(27,NULL,NULL,NULL),(28,NULL,NULL,NULL),(29,NULL,NULL,NULL),(30,NULL,NULL,NULL),(31,NULL,NULL,NULL),(32,NULL,NULL,NULL),(33,NULL,NULL,NULL),(34,NULL,NULL,NULL),(35,NULL,NULL,NULL),(36,NULL,NULL,NULL),(37,NULL,NULL,NULL),(38,NULL,NULL,NULL),(39,NULL,NULL,NULL),(40,NULL,NULL,NULL),(41,NULL,NULL,NULL),(42,NULL,NULL,NULL),(43,NULL,NULL,NULL),(44,NULL,NULL,NULL),(45,NULL,NULL,NULL),(46,NULL,NULL,NULL),(47,NULL,NULL,NULL),(48,NULL,NULL,NULL),(49,NULL,NULL,NULL),(50,NULL,NULL,NULL),(51,NULL,NULL,NULL),(52,NULL,NULL,NULL),(53,NULL,NULL,NULL),(54,NULL,NULL,NULL),(55,NULL,NULL,NULL),(56,NULL,NULL,NULL),(57,NULL,NULL,NULL),(58,NULL,NULL,NULL),(59,NULL,NULL,NULL),(60,NULL,NULL,NULL),(61,NULL,NULL,NULL),(62,NULL,NULL,NULL),(63,NULL,NULL,NULL),(64,NULL,NULL,NULL),(65,NULL,NULL,NULL),(66,NULL,NULL,NULL),(67,NULL,NULL,NULL),(68,NULL,NULL,NULL),(69,NULL,NULL,NULL),(70,NULL,NULL,NULL),(71,NULL,NULL,NULL),(72,NULL,NULL,NULL),(73,NULL,NULL,NULL),(74,NULL,NULL,NULL),(75,NULL,NULL,NULL),(76,NULL,NULL,NULL),(77,NULL,NULL,NULL),(78,NULL,NULL,NULL),(79,NULL,NULL,NULL),(80,NULL,NULL,NULL),(81,NULL,NULL,NULL),(82,NULL,NULL,NULL),(83,NULL,NULL,NULL),(84,NULL,NULL,NULL),(85,NULL,NULL,NULL),(86,NULL,NULL,NULL),(87,NULL,NULL,NULL),(88,NULL,NULL,NULL),(89,NULL,NULL,NULL),(90,NULL,NULL,NULL),(91,NULL,NULL,NULL),(92,NULL,NULL,NULL),(93,NULL,NULL,NULL),(94,NULL,NULL,NULL),(95,NULL,NULL,NULL),(96,NULL,NULL,NULL),(97,NULL,NULL,NULL),(98,NULL,NULL,NULL),(99,NULL,NULL,NULL),(100,NULL,NULL,NULL),(101,NULL,NULL,NULL),(102,NULL,NULL,NULL),(103,NULL,NULL,NULL),(104,NULL,NULL,NULL),(105,NULL,NULL,NULL),(106,NULL,NULL,NULL),(107,NULL,NULL,NULL),(108,NULL,NULL,NULL),(109,NULL,NULL,NULL),(110,NULL,NULL,NULL),(111,NULL,NULL,NULL),(112,NULL,NULL,NULL),(113,NULL,NULL,NULL),(114,NULL,NULL,NULL),(115,NULL,NULL,NULL),(116,NULL,NULL,NULL),(117,NULL,NULL,NULL),(118,NULL,NULL,NULL),(119,NULL,NULL,NULL),(120,NULL,NULL,NULL),(121,NULL,NULL,NULL),(122,NULL,NULL,NULL),(123,NULL,NULL,NULL),(124,NULL,NULL,NULL),(125,NULL,NULL,NULL),(126,NULL,NULL,NULL),(127,NULL,NULL,NULL),(128,NULL,NULL,NULL),(129,NULL,NULL,NULL),(130,NULL,NULL,NULL),(131,NULL,NULL,NULL),(132,NULL,NULL,NULL),(133,NULL,NULL,NULL),(134,NULL,NULL,NULL),(135,NULL,NULL,NULL),(136,NULL,NULL,NULL),(137,NULL,NULL,NULL),(138,NULL,NULL,NULL),(139,NULL,NULL,NULL),(140,NULL,NULL,NULL),(141,NULL,NULL,NULL),(142,NULL,NULL,NULL),(143,NULL,NULL,NULL),(144,NULL,NULL,NULL),(145,NULL,NULL,NULL),(146,NULL,NULL,NULL),(147,NULL,NULL,NULL),(148,NULL,NULL,NULL),(149,NULL,NULL,NULL),(150,NULL,NULL,NULL),(151,NULL,NULL,NULL),(152,NULL,NULL,NULL),(153,NULL,NULL,NULL),(154,NULL,NULL,NULL),(155,NULL,NULL,NULL),(156,NULL,NULL,NULL),(157,NULL,NULL,NULL),(158,NULL,NULL,NULL),(159,NULL,NULL,NULL),(160,NULL,NULL,NULL),(161,NULL,NULL,NULL),(162,NULL,NULL,NULL),(163,NULL,NULL,NULL),(164,NULL,NULL,NULL),(165,NULL,NULL,NULL),(166,NULL,NULL,NULL),(167,NULL,NULL,NULL),(168,NULL,NULL,NULL),(169,NULL,NULL,NULL),(170,NULL,NULL,NULL),(171,NULL,NULL,NULL),(172,NULL,NULL,NULL),(173,NULL,NULL,NULL),(174,NULL,NULL,NULL),(175,NULL,NULL,NULL),(176,NULL,NULL,NULL),(177,NULL,NULL,NULL),(178,NULL,NULL,NULL),(179,NULL,NULL,NULL),(180,NULL,NULL,NULL),(181,NULL,NULL,NULL),(182,NULL,NULL,NULL),(183,NULL,NULL,NULL),(184,NULL,NULL,NULL),(185,NULL,NULL,NULL),(186,NULL,NULL,NULL),(187,NULL,NULL,NULL),(188,NULL,NULL,NULL),(189,NULL,NULL,NULL),(190,NULL,NULL,NULL),(191,NULL,NULL,NULL),(192,NULL,NULL,NULL),(193,NULL,NULL,NULL),(194,NULL,NULL,NULL),(195,NULL,NULL,NULL),(196,NULL,NULL,NULL),(197,NULL,NULL,NULL),(198,NULL,NULL,NULL),(199,NULL,NULL,NULL),(200,NULL,NULL,NULL),(201,NULL,NULL,NULL),(202,NULL,NULL,NULL),(203,NULL,NULL,NULL),(204,NULL,NULL,NULL),(205,NULL,NULL,NULL),(206,NULL,NULL,NULL),(207,NULL,NULL,NULL),(208,NULL,NULL,NULL),(209,NULL,NULL,NULL),(210,NULL,NULL,NULL),(211,NULL,NULL,NULL),(212,NULL,NULL,NULL),(213,NULL,NULL,NULL),(214,NULL,NULL,NULL),(215,NULL,NULL,NULL),(216,NULL,NULL,NULL),(217,NULL,NULL,NULL),(218,NULL,NULL,NULL),(219,NULL,NULL,NULL),(220,NULL,NULL,NULL),(221,NULL,NULL,NULL),(222,NULL,NULL,NULL),(223,NULL,NULL,NULL),(224,NULL,NULL,NULL),(225,NULL,NULL,NULL),(226,NULL,NULL,NULL),(227,NULL,NULL,NULL),(228,NULL,NULL,NULL),(229,NULL,NULL,NULL),(230,NULL,NULL,NULL),(231,NULL,NULL,NULL),(232,NULL,NULL,NULL),(233,NULL,NULL,NULL),(234,NULL,NULL,NULL),(235,NULL,NULL,NULL),(236,NULL,NULL,NULL),(237,NULL,NULL,NULL),(238,NULL,NULL,NULL),(239,NULL,NULL,NULL),(240,NULL,NULL,NULL),(241,NULL,NULL,NULL),(242,NULL,NULL,NULL),(243,NULL,NULL,NULL),(244,NULL,NULL,NULL),(245,NULL,NULL,NULL),(246,NULL,NULL,NULL),(247,NULL,NULL,NULL),(248,NULL,NULL,NULL),(249,NULL,NULL,NULL),(250,NULL,NULL,NULL),(251,NULL,NULL,NULL),(252,NULL,NULL,NULL),(253,NULL,NULL,NULL),(254,NULL,NULL,NULL),(255,NULL,NULL,NULL),(256,NULL,NULL,NULL),(257,NULL,NULL,NULL),(258,NULL,NULL,NULL),(259,NULL,NULL,NULL),(260,NULL,NULL,NULL),(261,NULL,NULL,NULL),(262,NULL,NULL,NULL),(263,NULL,NULL,NULL),(264,NULL,NULL,NULL),(265,NULL,NULL,NULL),(266,NULL,NULL,NULL),(267,NULL,NULL,NULL),(268,NULL,NULL,NULL),(269,NULL,NULL,NULL),(270,NULL,NULL,NULL),(271,NULL,NULL,NULL),(272,NULL,NULL,NULL),(273,NULL,NULL,NULL),(274,NULL,NULL,NULL),(275,NULL,NULL,NULL),(276,NULL,NULL,NULL),(277,NULL,NULL,NULL),(278,NULL,NULL,NULL),(279,NULL,NULL,NULL),(280,NULL,NULL,NULL),(281,NULL,NULL,NULL),(282,NULL,NULL,NULL),(283,NULL,NULL,NULL),(284,NULL,NULL,NULL),(285,NULL,NULL,NULL),(286,NULL,NULL,NULL),(287,NULL,NULL,NULL),(288,NULL,NULL,NULL),(289,NULL,NULL,NULL),(290,NULL,NULL,NULL),(291,NULL,NULL,NULL),(292,NULL,NULL,NULL),(293,NULL,NULL,NULL),(294,NULL,NULL,NULL),(295,NULL,NULL,NULL),(296,NULL,NULL,NULL),(297,NULL,NULL,NULL),(298,NULL,NULL,NULL),(299,NULL,NULL,NULL),(300,NULL,NULL,NULL),(301,NULL,NULL,NULL),(302,NULL,NULL,NULL),(303,NULL,NULL,NULL),(304,NULL,NULL,NULL),(305,NULL,NULL,NULL),(306,NULL,NULL,NULL),(307,NULL,NULL,NULL),(308,NULL,NULL,NULL),(309,NULL,NULL,NULL),(310,NULL,NULL,NULL),(311,NULL,NULL,NULL),(312,NULL,NULL,NULL),(313,NULL,NULL,NULL),(314,NULL,NULL,NULL),(315,NULL,NULL,NULL),(316,NULL,NULL,NULL),(317,NULL,NULL,NULL),(318,NULL,NULL,NULL),(319,NULL,NULL,NULL),(320,NULL,NULL,NULL),(321,NULL,NULL,NULL),(322,NULL,NULL,NULL),(323,NULL,NULL,NULL),(324,NULL,NULL,NULL),(325,NULL,NULL,NULL),(326,NULL,NULL,NULL),(327,NULL,NULL,NULL),(328,NULL,NULL,NULL),(329,NULL,NULL,NULL),(330,NULL,NULL,NULL),(331,NULL,NULL,NULL),(332,NULL,NULL,NULL),(333,NULL,NULL,NULL),(334,NULL,NULL,NULL),(335,NULL,NULL,NULL),(336,NULL,NULL,NULL),(337,NULL,NULL,NULL),(338,NULL,NULL,NULL),(339,NULL,NULL,NULL),(340,NULL,NULL,NULL),(341,NULL,NULL,NULL),(342,NULL,NULL,NULL),(343,NULL,NULL,NULL),(344,NULL,NULL,NULL),(345,NULL,NULL,NULL),(346,NULL,NULL,NULL),(347,NULL,NULL,NULL),(348,NULL,NULL,NULL),(349,NULL,NULL,NULL),(350,NULL,NULL,NULL),(351,NULL,NULL,NULL),(352,NULL,NULL,NULL),(353,NULL,NULL,NULL),(354,NULL,NULL,NULL),(355,NULL,NULL,NULL),(356,NULL,NULL,NULL),(357,NULL,NULL,NULL),(358,NULL,NULL,NULL),(359,NULL,NULL,NULL),(360,NULL,NULL,NULL),(361,NULL,NULL,NULL),(362,NULL,NULL,NULL),(363,NULL,NULL,NULL),(364,NULL,NULL,NULL),(365,NULL,NULL,NULL),(366,NULL,NULL,NULL),(367,NULL,NULL,NULL),(368,NULL,NULL,NULL),(369,NULL,NULL,NULL),(370,NULL,NULL,NULL),(371,NULL,NULL,NULL),(372,NULL,NULL,NULL),(373,NULL,NULL,NULL),(374,NULL,NULL,NULL),(375,NULL,NULL,NULL),(376,NULL,NULL,NULL),(377,NULL,NULL,NULL),(378,NULL,NULL,NULL),(379,NULL,NULL,NULL),(380,NULL,NULL,NULL),(381,NULL,NULL,NULL),(382,NULL,NULL,NULL),(383,NULL,NULL,NULL),(384,NULL,NULL,NULL),(385,NULL,NULL,NULL),(386,NULL,NULL,NULL),(387,NULL,NULL,NULL),(388,NULL,NULL,NULL),(389,NULL,NULL,NULL),(390,NULL,NULL,NULL),(391,NULL,NULL,NULL),(392,NULL,NULL,NULL),(393,NULL,NULL,NULL),(394,NULL,NULL,NULL),(395,NULL,NULL,NULL),(396,NULL,NULL,NULL),(397,NULL,NULL,NULL),(398,NULL,NULL,NULL),(399,NULL,NULL,NULL),(400,NULL,NULL,NULL),(401,NULL,NULL,NULL),(402,NULL,NULL,NULL),(403,NULL,NULL,NULL),(404,NULL,NULL,NULL),(405,NULL,NULL,NULL),(406,NULL,NULL,NULL),(407,NULL,NULL,NULL),(408,NULL,NULL,NULL),(409,NULL,NULL,NULL),(410,NULL,NULL,NULL),(411,NULL,NULL,NULL),(412,NULL,NULL,NULL),(413,NULL,NULL,NULL),(414,NULL,NULL,NULL),(415,NULL,NULL,NULL),(416,NULL,NULL,NULL),(417,NULL,NULL,NULL),(418,NULL,NULL,NULL),(419,NULL,NULL,NULL),(420,NULL,NULL,NULL),(421,NULL,NULL,NULL),(422,NULL,NULL,NULL),(423,NULL,NULL,NULL),(424,NULL,NULL,NULL),(425,NULL,NULL,NULL),(426,NULL,NULL,NULL),(427,NULL,NULL,NULL),(428,NULL,NULL,NULL),(429,NULL,NULL,NULL),(430,NULL,NULL,NULL),(431,NULL,NULL,NULL),(432,NULL,NULL,NULL),(433,NULL,NULL,NULL),(434,NULL,NULL,NULL),(435,NULL,NULL,NULL),(436,NULL,NULL,NULL),(437,NULL,NULL,NULL),(438,NULL,NULL,NULL),(439,NULL,NULL,NULL),(440,NULL,NULL,NULL),(441,NULL,NULL,NULL),(442,NULL,NULL,NULL),(443,NULL,NULL,NULL),(444,NULL,NULL,NULL),(445,NULL,NULL,NULL),(446,NULL,NULL,NULL),(447,NULL,NULL,NULL),(448,NULL,NULL,NULL),(449,NULL,NULL,NULL),(450,NULL,NULL,NULL),(451,NULL,NULL,NULL),(452,NULL,NULL,NULL),(453,NULL,NULL,NULL),(454,NULL,NULL,NULL),(455,NULL,NULL,NULL),(456,NULL,NULL,NULL),(457,NULL,NULL,NULL),(458,NULL,NULL,NULL),(459,NULL,NULL,NULL),(460,NULL,NULL,NULL),(461,NULL,NULL,NULL),(462,NULL,NULL,NULL),(463,NULL,NULL,NULL),(464,NULL,NULL,NULL),(465,NULL,NULL,NULL),(466,NULL,NULL,NULL),(467,NULL,NULL,NULL),(468,NULL,NULL,NULL),(469,NULL,NULL,NULL),(470,NULL,NULL,NULL),(471,NULL,NULL,NULL),(472,NULL,NULL,NULL),(473,NULL,NULL,NULL),(474,NULL,NULL,NULL),(475,NULL,NULL,NULL),(476,NULL,NULL,NULL),(477,NULL,NULL,NULL),(478,NULL,NULL,NULL),(479,NULL,NULL,NULL),(480,NULL,NULL,NULL),(481,NULL,NULL,NULL),(482,NULL,NULL,NULL),(483,NULL,NULL,NULL),(484,NULL,NULL,NULL),(485,NULL,NULL,NULL),(486,NULL,NULL,NULL),(487,NULL,NULL,NULL),(488,NULL,NULL,NULL),(489,NULL,NULL,NULL),(490,NULL,NULL,NULL),(491,NULL,NULL,NULL),(492,NULL,NULL,NULL),(493,NULL,NULL,NULL),(494,NULL,NULL,NULL),(495,NULL,NULL,NULL),(496,NULL,NULL,NULL),(497,NULL,NULL,NULL),(498,NULL,NULL,NULL),(499,NULL,NULL,NULL),(500,NULL,NULL,NULL),(501,NULL,NULL,NULL),(502,NULL,NULL,NULL),(503,NULL,NULL,NULL),(504,NULL,NULL,NULL),(505,NULL,NULL,NULL),(506,NULL,NULL,NULL),(507,NULL,NULL,NULL),(508,NULL,NULL,NULL),(509,NULL,NULL,NULL),(510,NULL,NULL,NULL),(511,NULL,NULL,NULL),(512,NULL,NULL,NULL),(513,NULL,NULL,NULL),(514,NULL,NULL,NULL),(515,NULL,NULL,NULL),(516,NULL,NULL,NULL),(517,NULL,NULL,NULL),(518,NULL,NULL,NULL),(519,NULL,NULL,NULL),(520,NULL,NULL,NULL),(521,NULL,NULL,NULL),(522,NULL,NULL,NULL),(523,NULL,NULL,NULL),(524,NULL,NULL,NULL),(525,NULL,NULL,NULL),(526,NULL,NULL,NULL),(527,NULL,NULL,NULL),(528,NULL,NULL,NULL),(529,NULL,NULL,NULL),(530,NULL,NULL,NULL),(531,NULL,NULL,NULL),(532,NULL,NULL,NULL),(533,NULL,NULL,NULL),(534,NULL,NULL,NULL),(535,NULL,NULL,NULL),(536,NULL,NULL,NULL),(537,NULL,NULL,NULL),(538,NULL,NULL,NULL),(539,NULL,NULL,NULL),(540,NULL,NULL,NULL),(541,NULL,NULL,NULL),(542,NULL,NULL,NULL),(543,NULL,NULL,NULL),(544,NULL,NULL,NULL),(545,NULL,NULL,NULL),(546,NULL,NULL,NULL),(547,NULL,NULL,NULL),(548,NULL,NULL,NULL),(549,NULL,NULL,NULL),(550,NULL,NULL,NULL),(551,NULL,NULL,NULL),(552,NULL,NULL,NULL),(553,NULL,NULL,NULL),(554,NULL,NULL,NULL),(555,NULL,NULL,NULL),(556,NULL,NULL,NULL),(557,NULL,NULL,NULL),(558,NULL,NULL,NULL),(559,NULL,NULL,NULL),(560,NULL,NULL,NULL),(561,NULL,NULL,NULL),(562,NULL,NULL,NULL),(563,NULL,NULL,NULL),(564,NULL,NULL,NULL),(565,NULL,NULL,NULL),(566,NULL,NULL,NULL),(567,NULL,NULL,NULL),(568,NULL,NULL,NULL),(569,NULL,NULL,NULL),(570,NULL,NULL,NULL),(571,NULL,NULL,NULL),(572,NULL,NULL,NULL),(573,NULL,NULL,NULL),(574,NULL,NULL,NULL),(575,NULL,NULL,NULL),(576,NULL,NULL,NULL),(577,NULL,NULL,NULL),(578,NULL,NULL,NULL),(579,NULL,NULL,NULL),(580,NULL,NULL,NULL),(581,NULL,NULL,NULL),(582,NULL,NULL,NULL),(583,NULL,NULL,NULL),(584,NULL,NULL,NULL),(585,NULL,NULL,NULL),(586,NULL,NULL,NULL),(587,NULL,NULL,NULL),(588,NULL,NULL,NULL),(589,NULL,NULL,NULL),(590,NULL,NULL,NULL),(591,NULL,NULL,NULL),(592,NULL,NULL,NULL),(593,NULL,NULL,NULL),(594,NULL,NULL,NULL),(595,NULL,NULL,NULL),(596,NULL,NULL,NULL),(597,NULL,NULL,NULL),(598,NULL,NULL,NULL),(599,NULL,NULL,NULL),(600,NULL,NULL,NULL),(601,NULL,NULL,NULL),(602,NULL,NULL,NULL),(603,NULL,NULL,NULL),(604,NULL,NULL,NULL),(605,NULL,NULL,NULL),(606,NULL,NULL,NULL),(607,NULL,NULL,NULL),(608,NULL,NULL,NULL),(609,NULL,NULL,NULL),(610,NULL,NULL,NULL),(611,NULL,NULL,NULL),(612,NULL,NULL,NULL),(613,NULL,NULL,NULL),(614,NULL,NULL,NULL),(615,NULL,NULL,NULL),(616,NULL,NULL,NULL),(617,NULL,NULL,NULL),(618,NULL,NULL,NULL),(619,NULL,NULL,NULL),(620,NULL,NULL,NULL),(621,NULL,NULL,NULL),(622,NULL,NULL,NULL),(623,NULL,NULL,NULL),(624,NULL,NULL,NULL),(625,NULL,NULL,NULL),(626,NULL,NULL,NULL),(627,NULL,NULL,NULL),(628,NULL,NULL,NULL),(629,NULL,NULL,NULL),(630,NULL,NULL,NULL),(631,NULL,NULL,NULL),(632,NULL,NULL,NULL),(633,NULL,NULL,NULL),(634,NULL,NULL,NULL),(635,NULL,NULL,NULL),(636,NULL,NULL,NULL),(637,NULL,NULL,NULL),(638,NULL,NULL,NULL),(639,NULL,NULL,NULL),(640,NULL,NULL,NULL),(641,NULL,NULL,NULL),(642,NULL,NULL,NULL),(643,NULL,NULL,NULL),(644,NULL,NULL,NULL),(645,NULL,NULL,NULL),(646,NULL,NULL,NULL),(647,NULL,NULL,NULL),(648,NULL,NULL,NULL),(649,NULL,NULL,NULL),(650,NULL,NULL,NULL),(651,NULL,NULL,NULL),(652,NULL,NULL,NULL),(653,NULL,NULL,NULL),(654,NULL,NULL,NULL),(655,NULL,NULL,NULL),(656,NULL,NULL,NULL),(657,NULL,NULL,NULL),(658,NULL,NULL,NULL),(659,NULL,NULL,NULL),(660,NULL,NULL,NULL),(661,NULL,NULL,NULL),(662,NULL,NULL,NULL),(663,NULL,NULL,NULL),(664,NULL,NULL,NULL),(665,NULL,NULL,NULL),(666,NULL,NULL,NULL),(667,NULL,NULL,NULL),(668,NULL,NULL,NULL),(669,NULL,NULL,NULL),(670,NULL,NULL,NULL),(671,NULL,NULL,NULL),(672,NULL,NULL,NULL),(673,NULL,NULL,NULL),(674,NULL,NULL,NULL),(675,NULL,NULL,NULL),(676,NULL,NULL,NULL),(677,NULL,NULL,NULL),(678,NULL,NULL,NULL),(679,NULL,NULL,NULL),(680,NULL,NULL,NULL),(681,NULL,NULL,NULL),(682,NULL,NULL,NULL),(683,NULL,NULL,NULL),(684,NULL,NULL,NULL),(685,NULL,NULL,NULL),(686,NULL,NULL,NULL),(687,NULL,NULL,NULL),(688,NULL,NULL,NULL),(689,NULL,NULL,NULL),(690,NULL,NULL,NULL),(691,NULL,NULL,NULL),(692,NULL,NULL,NULL),(693,NULL,NULL,NULL),(694,NULL,NULL,NULL),(695,NULL,NULL,NULL),(696,NULL,NULL,NULL),(697,NULL,NULL,NULL),(698,NULL,NULL,NULL),(699,NULL,NULL,NULL),(700,NULL,NULL,NULL),(701,NULL,NULL,NULL),(702,NULL,NULL,NULL),(703,NULL,NULL,NULL),(704,NULL,NULL,NULL),(705,NULL,NULL,NULL),(706,NULL,NULL,NULL),(707,NULL,NULL,NULL),(708,NULL,NULL,NULL),(709,NULL,NULL,NULL),(710,NULL,NULL,NULL),(711,NULL,NULL,NULL),(712,NULL,NULL,NULL),(713,NULL,NULL,NULL),(714,NULL,NULL,NULL),(715,NULL,NULL,NULL),(716,NULL,NULL,NULL),(717,NULL,NULL,NULL),(718,NULL,NULL,NULL),(719,NULL,NULL,NULL),(720,NULL,NULL,NULL),(721,NULL,NULL,NULL),(722,NULL,NULL,NULL),(723,NULL,NULL,NULL),(724,NULL,NULL,NULL),(725,NULL,NULL,NULL),(726,NULL,NULL,NULL),(727,NULL,NULL,NULL),(728,NULL,NULL,NULL),(729,NULL,NULL,NULL),(730,NULL,NULL,NULL),(731,NULL,NULL,NULL),(732,NULL,NULL,NULL),(733,NULL,NULL,NULL),(734,NULL,NULL,NULL),(735,NULL,NULL,NULL),(736,NULL,NULL,NULL),(737,NULL,NULL,NULL),(738,NULL,NULL,NULL),(739,NULL,NULL,NULL),(740,NULL,NULL,NULL),(741,NULL,NULL,NULL),(742,NULL,NULL,NULL),(743,NULL,NULL,NULL),(744,NULL,NULL,NULL),(745,NULL,NULL,NULL),(746,NULL,NULL,NULL),(747,NULL,NULL,NULL),(748,NULL,NULL,NULL),(749,NULL,NULL,NULL),(750,NULL,NULL,NULL),(751,NULL,NULL,NULL),(752,NULL,NULL,NULL),(753,NULL,NULL,NULL),(754,NULL,NULL,NULL),(755,NULL,NULL,NULL),(756,NULL,NULL,NULL),(757,NULL,NULL,NULL),(758,NULL,NULL,NULL),(759,NULL,NULL,NULL),(760,NULL,NULL,NULL),(761,NULL,NULL,NULL),(762,NULL,NULL,NULL),(763,NULL,NULL,NULL),(764,NULL,NULL,NULL),(765,NULL,NULL,NULL),(766,NULL,NULL,NULL),(767,NULL,NULL,NULL),(768,NULL,NULL,NULL),(769,NULL,NULL,NULL),(770,NULL,NULL,NULL),(771,NULL,NULL,NULL),(772,NULL,NULL,NULL),(773,NULL,NULL,NULL),(774,NULL,NULL,NULL),(775,NULL,NULL,NULL),(776,NULL,NULL,NULL),(777,NULL,NULL,NULL),(778,NULL,NULL,NULL),(779,NULL,NULL,NULL),(780,NULL,NULL,NULL),(781,NULL,NULL,NULL),(782,NULL,NULL,NULL),(783,NULL,NULL,NULL),(784,NULL,NULL,NULL),(785,NULL,NULL,NULL),(786,NULL,NULL,NULL),(787,NULL,NULL,NULL),(788,NULL,NULL,NULL),(789,NULL,NULL,NULL),(790,NULL,NULL,NULL),(791,NULL,NULL,NULL),(792,NULL,NULL,NULL),(793,NULL,NULL,NULL),(794,NULL,NULL,NULL),(795,NULL,NULL,NULL),(796,NULL,NULL,NULL),(797,NULL,NULL,NULL),(798,NULL,NULL,NULL),(799,NULL,NULL,NULL),(800,NULL,NULL,NULL),(801,NULL,NULL,NULL),(802,NULL,NULL,NULL),(803,NULL,NULL,NULL),(804,NULL,NULL,NULL),(805,NULL,NULL,NULL),(806,NULL,NULL,NULL),(807,NULL,NULL,NULL),(808,NULL,NULL,NULL),(809,NULL,NULL,NULL),(810,NULL,NULL,NULL),(811,NULL,NULL,NULL),(812,NULL,NULL,NULL),(813,NULL,NULL,NULL),(814,NULL,NULL,NULL),(815,NULL,NULL,NULL),(816,NULL,NULL,NULL),(817,NULL,NULL,NULL),(818,NULL,NULL,NULL),(819,NULL,NULL,NULL),(820,NULL,NULL,NULL),(821,NULL,NULL,NULL),(822,NULL,NULL,NULL),(823,NULL,NULL,NULL),(824,NULL,NULL,NULL),(825,NULL,NULL,NULL),(826,NULL,NULL,NULL),(827,NULL,NULL,NULL),(828,295,NULL,NULL),(829,296,NULL,NULL),(830,297,NULL,NULL),(831,298,NULL,NULL),(832,299,NULL,NULL),(833,300,NULL,NULL),(834,301,NULL,NULL),(835,302,NULL,NULL),(836,303,NULL,NULL),(837,304,NULL,NULL),(838,305,NULL,NULL),(839,306,NULL,NULL),(840,307,NULL,NULL),(841,308,NULL,NULL),(842,309,NULL,NULL),(843,310,NULL,NULL),(844,311,NULL,NULL),(845,312,NULL,NULL),(846,313,NULL,NULL),(847,314,NULL,NULL),(848,315,NULL,NULL),(849,316,NULL,NULL),(850,317,NULL,NULL),(851,318,NULL,NULL),(852,319,NULL,NULL),(853,320,NULL,NULL),(854,321,NULL,NULL),(855,322,NULL,NULL),(856,323,NULL,NULL),(857,324,NULL,NULL),(858,325,NULL,NULL),(859,326,NULL,NULL),(860,327,NULL,NULL),(861,328,NULL,NULL),(862,329,NULL,NULL),(863,330,NULL,NULL),(864,331,NULL,NULL),(865,332,NULL,NULL),(866,333,NULL,NULL),(867,334,NULL,NULL),(868,335,NULL,NULL),(869,336,NULL,NULL),(870,337,NULL,NULL),(871,338,NULL,NULL),(872,339,NULL,NULL),(873,340,NULL,NULL);
/*!40000 ALTER TABLE `tcespeciales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgastos`
--

DROP TABLE IF EXISTS `tgastos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgastos` (
  `tga_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tga_nombre` varchar(200) DEFAULT NULL,
  `tga_status` int(1) DEFAULT '1',
  PRIMARY KEY (`tga_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `titulares`
--

DROP TABLE IF EXISTS `titulares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titulares` (
  `iti_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `iti_dispositivos` varchar(60) NOT NULL,
  `iti_col_id` bigint(20) NOT NULL,
  `iti_passold` varchar(250) NOT NULL,
  `iti_passnow` varchar(250) NOT NULL,
  `iti_imgdisp` varchar(250) NOT NULL,
  `iti_bie_id` bigint(11) DEFAULT NULL,
  `iti_ico_id` bigint(20) DEFAULT NULL,
  `iti_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`iti_id`),
  KEY `titulares_bienes` (`iti_bie_id`),
  KEY `titulares_componentes` (`iti_ico_id`),
  KEY `titulares_colaboradores` (`iti_col_id`),
  CONSTRAINT `titulares_bienes` FOREIGN KEY (`iti_bie_id`) REFERENCES `bienes` (`bie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `titulares_colaboradores` FOREIGN KEY (`iti_col_id`) REFERENCES `colaboradores` (`col_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `titulares_componentes` FOREIGN KEY (`iti_ico_id`) REFERENCES `componentes` (`ico_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulares`
--

LOCK TABLES `titulares` WRITE;
/*!40000 ALTER TABLE `titulares` DISABLE KEYS */;
/*!40000 ALTER TABLE `titulares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicaciones`
--

DROP TABLE IF EXISTS `ubicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubicaciones` (
  `ubi_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ubi_gdi_id` bigint(20) NOT NULL,
  `ubi_gar_id` bigint(20) NOT NULL,
  `ubi_est_id` bigint(20) DEFAULT NULL,
  `ubi_piso` int(11) NOT NULL,
  `ubi_etrabajo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ubi_id`),
  KEY `ubicaciones_establecimientos` (`ubi_est_id`),
  KEY `ubicaciones_gdistritos` (`ubi_gdi_id`),
  KEY `ubicaciones_gareas` (`ubi_gar_id`),
  CONSTRAINT `ubicaciones_establecimientos` FOREIGN KEY (`ubi_est_id`) REFERENCES `establecimientos` (`est_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ubicaciones_gareas` FOREIGN KEY (`ubi_gar_id`) REFERENCES `company5_se_socios`.`areas` (`gar_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ubicaciones_gdistritos` FOREIGN KEY (`ubi_gdi_id`) REFERENCES `company5_se_socios`.`distritos` (`gdi_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicaciones`
--

LOCK TABLES `ubicaciones` WRITE;
/*!40000 ALTER TABLE `ubicaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valores`
--

DROP TABLE IF EXISTS `valores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valores` (
  `val_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `val_pro_id` bigint(20) NOT NULL,
  `val_valor` text NOT NULL,
  PRIMARY KEY (`val_id`),
  KEY `valores_propiedades` (`val_pro_id`),
  CONSTRAINT `valores_propiedades` FOREIGN KEY (`val_pro_id`) REFERENCES `propiedades` (`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valores`
--

LOCK TABLES `valores` WRITE;
/*!40000 ALTER TABLE `valores` DISABLE KEYS */;
INSERT INTO `valores` (`val_id`, `val_pro_id`, `val_valor`) VALUES (1,1,'amarillo');
/*!40000 ALTER TABLE `valores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'company5_bd_20602849172'
--

--
-- Dumping routines for database 'company5_bd_20602849172'
--
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-12 13:53:47
