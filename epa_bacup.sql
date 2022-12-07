CREATE DATABASE  IF NOT EXISTS `ferrreteria_epa` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ferrreteria_epa`;
-- MySQL dump 10.13  Distrib 5.7.40, for Win64 (x86_64)
--
-- Host: localhost    Database: ferrreteria_epa
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.14-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `ID_CATEGORIA` int(11) NOT NULL,
  `NOMBRE_CATEGORIA` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_CATEGORIA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (2,'test45'),(3,'test');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario_bitcora`
--

DROP TABLE IF EXISTS `inventario_bitcora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario_bitcora` (
  `ID_BITACORA` int(11) NOT NULL,
  `FECHA_BITACORA` date NOT NULL,
  `CLASE_MOVIMIENTO` varchar(3) NOT NULL,
  `LLAVE_MOVIMIENTO` varchar(250) NOT NULL,
  `REFERENCIA_MOVIMIENTO` varchar(250) NOT NULL,
  PRIMARY KEY (`ID_BITACORA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_bitcora`
--

LOCK TABLES `inventario_bitcora` WRITE;
/*!40000 ALTER TABLE `inventario_bitcora` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario_bitcora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `ID_MARCA` int(11) NOT NULL,
  `NOMBRE_MARCA` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_MARCA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'TEST25'),(2,'TEST2'),(3,'TEST32');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `ID_PRODUCTO` int(11) NOT NULL,
  `ID_CATEGORIA` int(11) NOT NULL,
  `ID_MARCA` int(11) NOT NULL,
  `NOMBRE_PRODUCTO` varchar(100) NOT NULL,
  `DESCRIPCION` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ID_PRODUCTO`,`ID_CATEGORIA`,`ID_MARCA`),
  KEY `fk_PRODUCTOS_CATEGORIAS_idx` (`ID_CATEGORIA`),
  KEY `fk_PRODUCTO_MARCA1_idx` (`ID_MARCA`),
  CONSTRAINT `fk_PRODUCTOS_CATEGORIAS` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `categoria` (`ID_CATEGORIA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUCTO_MARCA1` FOREIGN KEY (`ID_MARCA`) REFERENCES `marca` (`ID_MARCA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,2,3,'QWEQW','TEDS'),(2,2,2,'TEST23','TEDS'),(3,3,2,'ERER','TEDS'),(4,3,3,'ERE','TEDS'),(5,3,3,'3423','TEDS');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_existencia`
--

DROP TABLE IF EXISTS `producto_existencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto_existencia` (
  `ID_PRODUCTO` int(11) NOT NULL,
  `EXISTENCIA` int(11) NOT NULL,
  PRIMARY KEY (`ID_PRODUCTO`),
  CONSTRAINT `fk_PRODUCTO_EXISTENCIA_PRODUCTO1` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_existencia`
--

LOCK TABLES `producto_existencia` WRITE;
/*!40000 ALTER TABLE `producto_existencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_existencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepcion_producto`
--

DROP TABLE IF EXISTS `recepcion_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recepcion_producto` (
  `ID_RECEPCION` int(11) NOT NULL,
  `FECHA_RECEPCION` datetime NOT NULL,
  `ESTADO_RECEPCION` varchar(2) NOT NULL,
  `OBSERVACIONES` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_RECEPCION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepcion_producto`
--

LOCK TABLES `recepcion_producto` WRITE;
/*!40000 ALTER TABLE `recepcion_producto` DISABLE KEYS */;
INSERT INTO `recepcion_producto` VALUES (1,'2022-10-16 12:00:28','DI','32323'),(2,'2022-10-16 12:00:47','DI','32323'),(3,'2022-10-16 11:51:38','SO','eERWERre22');
/*!40000 ALTER TABLE `recepcion_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepcion_producto_deta`
--

DROP TABLE IF EXISTS `recepcion_producto_deta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recepcion_producto_deta` (
  `ID_RECEPCION` int(11) NOT NULL,
  `ID_RECEPCION_DETA` int(11) NOT NULL,
  `CANTIDAD_RECEPCION` int(11) NOT NULL,
  `ID_PRODUCTO` int(11) NOT NULL,
  PRIMARY KEY (`ID_RECEPCION`,`ID_RECEPCION_DETA`),
  KEY `fk_RECEPCION_PRODUCTO_DETA_PRODUCTO1_idx` (`ID_PRODUCTO`),
  CONSTRAINT `fk_RECEPCION_DETA_RECEPCION1` FOREIGN KEY (`ID_RECEPCION`) REFERENCES `recepcion_producto` (`ID_RECEPCION`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_RECEPCION_PRODUCTO_DETA_PRODUCTO1` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepcion_producto_deta`
--

LOCK TABLES `recepcion_producto_deta` WRITE;
/*!40000 ALTER TABLE `recepcion_producto_deta` DISABLE KEYS */;
INSERT INTO `recepcion_producto_deta` VALUES (1,1,123,1),(1,2,25,2),(2,3,25,3),(2,4,45,4),(3,1,6,1),(3,2,45,1);
/*!40000 ALTER TABLE `recepcion_producto_deta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salida_producto`
--

DROP TABLE IF EXISTS `salida_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salida_producto` (
  `ID_SALIDA` int(11) NOT NULL,
  `FECHA_SALIDA` datetime NOT NULL,
  `ESTADO_SALIDA` varchar(2) NOT NULL,
  `OBSERVACIONES` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_SALIDA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salida_producto`
--

LOCK TABLES `salida_producto` WRITE;
/*!40000 ALTER TABLE `salida_producto` DISABLE KEYS */;
INSERT INTO `salida_producto` VALUES (1,'2022-10-16 12:56:28','DI','RWEF'),(2,'2022-10-16 12:56:46','AP','RREWRWEF');
/*!40000 ALTER TABLE `salida_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salida_producto_deta`
--

DROP TABLE IF EXISTS `salida_producto_deta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salida_producto_deta` (
  `ID_SALIDA` int(11) NOT NULL,
  `ID_SALIDA_DETA` int(11) NOT NULL,
  `ID_PRODUCTO` int(11) NOT NULL,
  `CANTIDAD_SALIDA` int(11) NOT NULL,
  PRIMARY KEY (`ID_SALIDA`,`ID_SALIDA_DETA`),
  KEY `fk_SALIDA_PRODUCTO_DETA_PRODUCTO1_idx` (`ID_PRODUCTO`),
  CONSTRAINT `fk_SALIDA_PRODUCTO_DETA_PRODUCTO1` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SALIDA_PRODUCTO_DETA_SALIDA_PRODUCTO1` FOREIGN KEY (`ID_SALIDA`) REFERENCES `salida_producto` (`ID_SALIDA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salida_producto_deta`
--

LOCK TABLES `salida_producto_deta` WRITE;
/*!40000 ALTER TABLE `salida_producto_deta` DISABLE KEYS */;
INSERT INTO `salida_producto_deta` VALUES (1,1,1,25),(1,2,2,35),(2,1,2,45);
/*!40000 ALTER TABLE `salida_producto_deta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `ID_USUARIO` int(11) NOT NULL,
  `NOMBRE_USUARIO` varchar(150) NOT NULL,
  `LOGIN_USUARIO` varchar(45) NOT NULL,
  `CLAVE` varchar(32) NOT NULL,
  PRIMARY KEY (`ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2,'Maria','0','ae5424bf03a5d2b3efd00a161dcbbfac'),(3,'Maria','Mr1','ae5424bf03a5d2b3efd00a161dcbbfac');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_categoria`
--

DROP TABLE IF EXISTS `v_categoria`;
/*!50001 DROP VIEW IF EXISTS `v_categoria`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_categoria` AS SELECT 
 1 AS `ID_CATEGORIA`,
 1 AS `NOMBRE_CATEGORIA`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_inventario_bitacora`
--

DROP TABLE IF EXISTS `v_inventario_bitacora`;
/*!50001 DROP VIEW IF EXISTS `v_inventario_bitacora`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_inventario_bitacora` AS SELECT 
 1 AS `ID_BITACORA`,
 1 AS `FECHA_BITACORA`,
 1 AS `CLASE_MOVIMIENTO`,
 1 AS `LLAVE_MOVIMIENTO`,
 1 AS `REFERENCIA_MOVIMIENTO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_marca`
--

DROP TABLE IF EXISTS `v_marca`;
/*!50001 DROP VIEW IF EXISTS `v_marca`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_marca` AS SELECT 
 1 AS `ID_MARCA`,
 1 AS `NOMBRE_MARCA`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_producto`
--

DROP TABLE IF EXISTS `v_producto`;
/*!50001 DROP VIEW IF EXISTS `v_producto`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_producto` AS SELECT 
 1 AS `ID_PRODUCTO`,
 1 AS `ID_CATEGORIA`,
 1 AS `NOMBRE_CATEGORIA`,
 1 AS `ID_MARCA`,
 1 AS `NOMBRE_MARCA`,
 1 AS `NOMBRE_PRODUCTO`,
 1 AS `DESCRIPCION`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_producto_existencia`
--

DROP TABLE IF EXISTS `v_producto_existencia`;
/*!50001 DROP VIEW IF EXISTS `v_producto_existencia`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_producto_existencia` AS SELECT 
 1 AS `ID_PRODUCTO`,
 1 AS `EXISTENCIA`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_recepcion_producto`
--

DROP TABLE IF EXISTS `v_recepcion_producto`;
/*!50001 DROP VIEW IF EXISTS `v_recepcion_producto`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_recepcion_producto` AS SELECT 
 1 AS `ID_RECEPCION`,
 1 AS `FECHA_RECEPCION`,
 1 AS `ESTADO_RECEPCION`,
 1 AS `NOMBRE_ESTADO_RECEPCION`,
 1 AS `OBSERVACIONES`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_recepcion_producto_deta`
--

DROP TABLE IF EXISTS `v_recepcion_producto_deta`;
/*!50001 DROP VIEW IF EXISTS `v_recepcion_producto_deta`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_recepcion_producto_deta` AS SELECT 
 1 AS `ID_RECEPCION`,
 1 AS `ID_RECEPCION_DETA`,
 1 AS `CANTIDAD_RECEPCION`,
 1 AS `ID_PRODUCTO`,
 1 AS `NOMBRE_PRODUCTO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_salida_producto`
--

DROP TABLE IF EXISTS `v_salida_producto`;
/*!50001 DROP VIEW IF EXISTS `v_salida_producto`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_salida_producto` AS SELECT 
 1 AS `ID_SALIDA`,
 1 AS `FECHA_SALIDA`,
 1 AS `ESTADO_SALIDA`,
 1 AS `NOMBRE_ESTADO_SALIDA`,
 1 AS `OBSERVACIONES`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_salida_producto_deta`
--

DROP TABLE IF EXISTS `v_salida_producto_deta`;
/*!50001 DROP VIEW IF EXISTS `v_salida_producto_deta`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_salida_producto_deta` AS SELECT 
 1 AS `ID_SALIDA`,
 1 AS `ID_SALIDA_DETA`,
 1 AS `ID_PRODUCTO`,
 1 AS `NOMBRE_PRODUCTO`,
 1 AS `CANTIDAD_SALIDA`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_usuarios`
--

DROP TABLE IF EXISTS `v_usuarios`;
/*!50001 DROP VIEW IF EXISTS `v_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_usuarios` AS SELECT 
 1 AS `ID_USUARIO`,
 1 AS `NOMBRE_USUARIO`,
 1 AS `LOGIN_USUARIO`,
 1 AS `CLAVE`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'ferrreteria_epa'
--

--
-- Dumping routines for database 'ferrreteria_epa'
--
/*!50003 DROP PROCEDURE IF EXISTS `PRAL_DATA_CATEGORIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_DATA_CATEGORIA`(
in TIPO_CONSULTA INT,
in xID_CATEGORIA INT,
in OPCION_CONSULTA INT
)
BEGIN
	IF (TIPO_CONSULTA=1) THEN
		SELECT * FROM V_CATEGORIA AS A;
       
	ELSEIF (TIPO_CONSULTA=2) THEN
		SELECT * FROM V_CATEGORIA AS A
        where A.ID_CATEGORIA=xID_CATEGORIA;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRAL_DATA_MARCA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_DATA_MARCA`(
in TIPO_CONSULTA INT,
in xID_MARCA INT,
in OPCION_CONSULTA INT
)
BEGIN
	IF (TIPO_CONSULTA=1) THEN
		SELECT * FROM V_MARCA AS A;
       
	ELSEIF (TIPO_CONSULTA=2) THEN
		SELECT * FROM V_MARCA AS A
        where A.ID_MARCA=xID_MARCA;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRAL_DATA_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_DATA_PRODUCTO`(
in TIPO_CONSULTA INT,
in xID_PRODUCTO INT,
in OPCION_CONSULTA INT
)
BEGIN
	IF (TIPO_CONSULTA=1) THEN
		SELECT * FROM V_PRODUCTO AS A;
       
	ELSEIF (TIPO_CONSULTA=2) THEN
		SELECT * FROM V_PRODUCTO AS A
        where A.ID_PRODUCTO=xID_PRODUCTO;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRAL_DATA_RECEPCION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_DATA_RECEPCION`(
in TIPO_CONSULTA INT,
in xID_RECEPCION INT,
in OPCION_CONSULTA INT
)
BEGIN
	IF (TIPO_CONSULTA=1) THEN
		SELECT * FROM V_RECEPCION_PRODUCTO AS A;
       
	ELSEIF (TIPO_CONSULTA=2) THEN
		SELECT * FROM V_RECEPCION_PRODUCTO AS A
        where A.ID_RECEPCION=xID_RECEPCION;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRAL_DATA_RECEPCION_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_DATA_RECEPCION_PRODUCTO`(
in TIPO_CONSULTA INT,
in xID_RECEPCION INT,
in OPCION_CONSULTA INT
)
BEGIN
	IF (TIPO_CONSULTA=1) THEN
		SELECT * FROM V_RECEPCION_PRODUCTO AS A;
       
	ELSEIF (TIPO_CONSULTA=2) THEN
		SELECT * FROM V_RECEPCION_PRODUCTO AS A
        where A.ID_RECEPCION=xID_RECEPCION;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRAL_DATA_RECEPCION_PRODUCTO_DETA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_DATA_RECEPCION_PRODUCTO_DETA`(
in TIPO_CONSULTA INT,
in xID_RECEPCION INT,
in xID_RECEPCION_DETA INT,
in OPCION_CONSULTA INT
)
BEGIN
	IF (TIPO_CONSULTA=1) THEN
		SELECT * FROM V_RECEPCION_PRODUCTO_DETA AS A
         where A.ID_RECEPCION=xID_RECEPCION;
       
	ELSEIF (TIPO_CONSULTA=2) THEN
		SELECT * FROM V_RECEPCION_PRODUCTO_DETA AS A
        where A.ID_RECEPCION=xID_RECEPCION
        AND A.ID_RECEPCION_DETA=xID_RECEPCION_DETA;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRAL_DATA_SALIDA_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_DATA_SALIDA_PRODUCTO`(
in TIPO_CONSULTA INT,
in xID_SALIDA INT,
in OPCION_CONSULTA INT
)
BEGIN
	IF (TIPO_CONSULTA=1) THEN
		SELECT * FROM V_SALIDA_PRODUCTO AS A;
       
	ELSEIF (TIPO_CONSULTA=2) THEN
		SELECT * FROM V_SALIDA_PRODUCTO AS A
        where A.ID_SALIDA=xID_SALIDA;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRAL_DATA_SALIDA_PRODUCTO_DETA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_DATA_SALIDA_PRODUCTO_DETA`(
in TIPO_CONSULTA INT,
in xID_SALIDA INT,
in xID_SALIDA_DETA INT,
in OPCION_CONSULTA INT
)
BEGIN
	IF (TIPO_CONSULTA=1) THEN
		SELECT * FROM V_SALIDA_PRODUCTO_DETA AS A
         where A.ID_SALIDA=xID_SALIDA;
       
	ELSEIF (TIPO_CONSULTA=2) THEN
		SELECT * FROM V_SALIDA_PRODUCTO_DETA AS A
        where A.ID_SALIDA=xID_SALIDA
        AND A.ID_SALIDA_DETA=xID_SALIDA_DETA;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRAL_DATA_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_DATA_USUARIO`(
in TIPO_CONSULTA INT,
in xID_USUARIO INT,
in OPCION_CONSULTA INT
)
BEGIN
	IF (TIPO_CONSULTA=1) THEN
		SELECT * FROM V_USUARIOS AS A;
       
	ELSEIF (TIPO_CONSULTA=2) THEN
		SELECT * FROM V_USUARIOS AS A
        where A.ID_USUARIO=xID_USUARIO;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRAL_MTTO_CATEGORIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_MTTO_CATEGORIA`(
IN TIPO_ACTUALIZA INT,
IN xID_CATEGORIA INT,
IN xNOMBRE_CATEGORIA VARCHAR(100))
BEGIN
	IF (TIPO_ACTUALIZA=1) THEN
		SELECT @ID_CATEGORIA := ifnull(max(a.ID_CATEGORIA),0)+1 FROM categoria as a ;
		INSERT INTO categoria(ID_CATEGORIA,NOMBRE_CATEGORIA) VALUES(@ID_CATEGORIA,xNOMBRE_CATEGORIA);
    ELSEIF(TIPO_ACTUALIZA=2) THEN
		update categoria set NOMBRE_CATEGORIA=xNOMBRE_CATEGORIA
        where categoria.ID_CATEGORIA=xID_CATEGORIA;
	elseif(TIPO_ACTUALIZA=3) THEN
		DELETE FROM categoria where ID_CATEGORIA=xID_CATEGORIA; 
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRAL_MTTO_MARCA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_MTTO_MARCA`(
IN TIPO_ACTUALIZA INT,
IN xID_MARCA INT,
IN xNOMBRE_MARCA VARCHAR(100)
)
BEGIN
	IF (TIPO_ACTUALIZA=1) THEN
		SELECT @ID_MARCA := ifnull(max(a.ID_MARCA),0)+1 FROM MARCA as a ;
		INSERT INTO MARCA(ID_MARCA,NOMBRE_MARCA) VALUES(@ID_MARCA,xNOMBRE_MARCA);
    ELSEIF(TIPO_ACTUALIZA=2) THEN
		update MARCA set NOMBRE_MARCA=xNOMBRE_MARCA
        where MARCA.ID_MARCA=xID_MARCA;
	elseif(TIPO_ACTUALIZA=3) THEN
		DELETE FROM MARCA where ID_MARCA=xID_MARCA; 
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRAL_MTTO_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_MTTO_PRODUCTO`(
IN TIPO_ACTUALIZA INT,
IN xID_PRODUCTO INT,
IN xID_CATEGORIA INT,
IN xID_MARCA INT,
IN xNOMBRE_PRODUCTO VARCHAR(100),
IN xDESCRIPCION VARCHAR(150)
)
BEGIN
	IF (TIPO_ACTUALIZA=1) THEN
		SELECT @ID_PRODUCTO := ifnull(max(a.ID_PRODUCTO),0)+1 FROM PRODUCTO as a ;
		INSERT INTO PRODUCTO(ID_PRODUCTO,ID_CATEGORIA,ID_MARCA,NOMBRE_PRODUCTO,DESCRIPCION) VALUES(@ID_PRODUCTO,xID_CATEGORIA,xID_MARCA,xNOMBRE_PRODUCTO,xDESCRIPCION);
    ELSEIF(TIPO_ACTUALIZA=2) THEN
		update PRODUCTO set ID_CATEGORIA=xID_CATEGORIA,ID_MARCA=xID_MARCA,NOMBRE_PRODUCTO=xNOMBRE_PRODUCTO,DESCRIPCION=xDESCRIPCION
        where PRODUCTO.ID_PRODUCTO=xID_PRODUCTO;
	elseif(TIPO_ACTUALIZA=3) THEN
		DELETE FROM PRODUCTO where ID_PRODUCTO=xID_PRODUCTO; 
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRAL_MTTO_RECEPCION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_MTTO_RECEPCION`(
IN TIPO_ACTUALIZA INT,
IN xID_RECEPCION INT,
IN xFECHA_RECEPCION VARCHAR(100),
IN xESTADO_RECEPCION VARCHAR(2),
IN xOBSERVACIONES VARCHAR(255)
)
BEGIN
	IF (TIPO_ACTUALIZA=1) THEN
		SELECT @ID_RECEPCION := ifnull(max(a.ID_RECEPCION),0)+1 FROM RECEPCION_PRODUCTO as a ;
		INSERT INTO RECEPCION_PRODUCTO(ID_RECEPCION,FECHA_RECEPCION,ESTADO_RECEPCION,OBSERVACIONES) VALUES(@ID_RECEPCION,xFECHA_RECEPCION,xESTADO_RECEPCION,xOBSERVACIONES);
    ELSEIF(TIPO_ACTUALIZA=2) THEN
		update RECEPCION_PRODUCTO set FECHA_RECEPCION=xFECHA_RECEPCION,ESTADO_RECEPCION=xESTADO_RECEPCION,OBSERVACIONES=xOBSERVACIONES
        where RECEPCION_PRODUCTO.ID_RECEPCION=xID_RECEPCION;
	elseif(TIPO_ACTUALIZA=3) THEN
		DELETE FROM RECEPCION_PRODUCTO where ID_RECEPCION=xID_RECEPCION; 
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRAL_MTTO_RECEPCION_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_MTTO_RECEPCION_PRODUCTO`(
IN TIPO_ACTUALIZA INT,
IN xID_RECEPCION INT,
IN xFECHA_RECEPCION VARCHAR(100),
IN xESTADO_RECEPCION VARCHAR(2),
IN xOBSERVACIONES VARCHAR(255)
)
BEGIN
	IF (TIPO_ACTUALIZA=1) THEN
		SELECT @ID_RECEPCION := ifnull(max(a.ID_RECEPCION),0)+1 FROM RECEPCION_PRODUCTO as a ;
		INSERT INTO RECEPCION_PRODUCTO(ID_RECEPCION,FECHA_RECEPCION,ESTADO_RECEPCION,OBSERVACIONES) VALUES(@ID_RECEPCION,xFECHA_RECEPCION,xESTADO_RECEPCION,xOBSERVACIONES);
    ELSEIF(TIPO_ACTUALIZA=2) THEN
		update RECEPCION_PRODUCTO set FECHA_RECEPCION=xFECHA_RECEPCION,ESTADO_RECEPCION=xESTADO_RECEPCION,OBSERVACIONES=xOBSERVACIONES
        where RECEPCION_PRODUCTO.ID_RECEPCION=xID_RECEPCION;
	elseif(TIPO_ACTUALIZA=3) THEN
		DELETE FROM RECEPCION_PRODUCTO where ID_RECEPCION=xID_RECEPCION; 
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRAL_MTTO_RECEPCION_PRODUCTO_DETA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_MTTO_RECEPCION_PRODUCTO_DETA`(
IN TIPO_ACTUALIZA INT,
IN xID_RECEPCION INT,
IN xID_RECEPCION_DETA INT,
IN xCANTIDAD_RECEPCION INT,
IN xID_PRODUCTO INT
)
BEGIN
	IF (TIPO_ACTUALIZA=1) THEN
		SELECT @ID_RECEPCION_DETA := ifnull(max(a.ID_RECEPCION_DETA),0)+1 FROM RECEPCION_PRODUCTO_DETA as a  WHERE a.ID_RECEPCION=xID_RECEPCION;
		INSERT INTO RECEPCION_PRODUCTO_DETA(ID_RECEPCION,ID_RECEPCION_DETA,CANTIDAD_RECEPCION,ID_PRODUCTO) VALUES(xID_RECEPCION,@ID_RECEPCION_DETA,xCANTIDAD_RECEPCION,xID_PRODUCTO);
    ELSEIF(TIPO_ACTUALIZA=2) THEN
		update RECEPCION_PRODUCTO_DETA set CANTIDAD_RECEPCION=xCANTIDAD_RECEPCION,ID_PRODUCTO=xID_PRODUCTO
        where RECEPCION_PRODUCTO_DETA.ID_RECEPCION=xID_RECEPCION
        AND RECEPCION_PRODUCTO_DETA.ID_RECEPCION_DETA=xID_RECEPCION_DETA;
	elseif(TIPO_ACTUALIZA=3) THEN
		DELETE FROM RECEPCION_PRODUCTO_DETA 
        where ID_RECEPCION=xID_RECEPCION 
        and ID_RECEPCION_DETA=xID_RECEPCION_DETA; 
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRAL_MTTO_SALIDA_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_MTTO_SALIDA_PRODUCTO`(
IN TIPO_ACTUALIZA INT,
IN xID_SALIDA INT,
IN xFECHA_SALIDA VARCHAR(100),
IN xESTADO_SALIDA VARCHAR(2),
IN xOBSERVACIONES VARCHAR(255)
)
BEGIN
	IF (TIPO_ACTUALIZA=1) THEN
		SELECT @ID_SALIDA := ifnull(max(a.ID_SALIDA),0)+1 FROM SALIDA_PRODUCTO as a ;
		INSERT INTO SALIDA_PRODUCTO(ID_SALIDA,FECHA_SALIDA,ESTADO_SALIDA,OBSERVACIONES) VALUES(@ID_SALIDA,xFECHA_SALIDA,xESTADO_SALIDA,xOBSERVACIONES);
    ELSEIF(TIPO_ACTUALIZA=2) THEN
		update SALIDA_PRODUCTO set FECHA_SALIDA=xFECHA_SALIDA,ESTADO_SALIDA=xESTADO_SALIDA,OBSERVACIONES=xOBSERVACIONES
        where SALIDA_PRODUCTO.ID_SALIDA=xID_SALIDA;
	elseif(TIPO_ACTUALIZA=3) THEN
		DELETE FROM SALIDA_PRODUCTO where ID_SALIDA=xID_SALIDA; 
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRAL_MTTO_SALIDA_PRODUCTO_DETA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_MTTO_SALIDA_PRODUCTO_DETA`(
IN TIPO_ACTUALIZA INT,
IN xID_SALIDA INT,
IN xID_SALIDA_DETA INT,
IN xCANTIDAD_SALIDA INT,
IN xID_PRODUCTO INT
)
BEGIN
	IF (TIPO_ACTUALIZA=1) THEN
		SELECT @ID_SALIDA_DETA := ifnull(max(a.ID_SALIDA_DETA),0)+1 FROM SALIDA_PRODUCTO_DETA as a  WHERE a.ID_SALIDA=xID_SALIDA;
		INSERT INTO SALIDA_PRODUCTO_DETA(ID_SALIDA,ID_SALIDA_DETA,CANTIDAD_SALIDA,ID_PRODUCTO) VALUES(xID_SALIDA,@ID_SALIDA_DETA,xCANTIDAD_SALIDA,xID_PRODUCTO);
    ELSEIF(TIPO_ACTUALIZA=2) THEN
		update SALIDA_PRODUCTO_DETA set CANTIDAD_SALIDA=xCANTIDAD_SALIDA,ID_PRODUCTO=xID_PRODUCTO
        where SALIDA_PRODUCTO_DETA.ID_SALIDA=xID_SALIDA
        AND SALIDA_PRODUCTO_DETA.ID_SALIDA_DETA=xID_SALIDA_DETA;
	elseif(TIPO_ACTUALIZA=3) THEN
		DELETE FROM SALIDA_PRODUCTO_DETA 
        where ID_SALIDA=xID_SALIDA 
        and ID_SALIDA_DETA=xID_SALIDA_DETA; 
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRAL_MTTO_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_MTTO_USUARIO`(
IN TIPO_ACTUALIZA INT,
IN xID_USUARIO INT,
IN xNOMBRE_USUARIO VARCHAR(100),
IN xLOGIN_USUARIO VARCHAR(45),
IN xCLAVE VARCHAR(32)
)
BEGIN
	IF (TIPO_ACTUALIZA=1) THEN
		SELECT @ID_USUARIO := ifnull(max(a.ID_USUARIO),0)+1 FROM USUARIOS as a ;
		INSERT INTO USUARIOS(ID_USUARIO,NOMBRE_USUARIO,LOGIN_USUARIO,CLAVE) VALUES(@ID_USUARIO,xNOMBRE_USUARIO,xLOGIN_USUARIO,md5(xCLAVE));
    ELSEIF(TIPO_ACTUALIZA=2) THEN
		update USUARIOS set NOMBRE_USUARIO=xNOMBRE_USUARIO,LOGIN_USUARIO=xLOGIN_USUARIO,CLAVE=xCLAVE
        where USUARIOS.ID_USUARIO=xID_USUARIO;
	elseif(TIPO_ACTUALIZA=3) THEN
		DELETE FROM USUARIOS where ID_USUARIO=xID_USUARIO; 
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRAL_MTTO_USUARIOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_MTTO_USUARIOS`(
IN TIPO_ACTUALIZA INT,
IN xID_USUARIO INT,
IN xNOMBRE_USUARIO VARCHAR(100),
IN xLOGIN_USUARIO INT(45),
IN xCLAVE VARCHAR(32)
)
BEGIN
	IF (TIPO_ACTUALIZA=1) THEN
		SELECT @ID_USUARIO := ifnull(max(a.ID_USUARIO),0)+1 FROM USUARIO as a ;
		INSERT INTO USUARIO(ID_USUARIO,NOMBRE_USUARIO,LOGIN_USUARIO,CLAVE) VALUES(@ID_USUARIO,xNOMBRE_USUARIO,xID_MARCA,xLOGIN_USUARIO,md5(xCLAVE));
    ELSEIF(TIPO_ACTUALIZA=2) THEN
		update USUARIO set ID_CATEGORIA=xID_CATEGORIA,ID_MARCA=xID_MARCA,NOMBRE_USUARIO=xNOMBRE_USUARIO,DESCRIPCION=xDESCRIPCION
        where USUARIO.ID_USUARIO=xID_USUARIO;
	elseif(TIPO_ACTUALIZA=3) THEN
		DELETE FROM USUARIO where ID_USUARIO=xID_USUARIO; 
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_categoria`
--

/*!50001 DROP VIEW IF EXISTS `v_categoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_categoria` AS select `a`.`ID_CATEGORIA` AS `ID_CATEGORIA`,`a`.`NOMBRE_CATEGORIA` AS `NOMBRE_CATEGORIA` from `categoria` `a` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_inventario_bitacora`
--

/*!50001 DROP VIEW IF EXISTS `v_inventario_bitacora`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_inventario_bitacora` AS select `inventario_bitcora`.`ID_BITACORA` AS `ID_BITACORA`,`inventario_bitcora`.`FECHA_BITACORA` AS `FECHA_BITACORA`,`inventario_bitcora`.`CLASE_MOVIMIENTO` AS `CLASE_MOVIMIENTO`,`inventario_bitcora`.`LLAVE_MOVIMIENTO` AS `LLAVE_MOVIMIENTO`,`inventario_bitcora`.`REFERENCIA_MOVIMIENTO` AS `REFERENCIA_MOVIMIENTO` from `inventario_bitcora` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_marca`
--

/*!50001 DROP VIEW IF EXISTS `v_marca`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_marca` AS select `marca`.`ID_MARCA` AS `ID_MARCA`,`marca`.`NOMBRE_MARCA` AS `NOMBRE_MARCA` from `marca` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_producto`
--

/*!50001 DROP VIEW IF EXISTS `v_producto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_producto` AS select `a`.`ID_PRODUCTO` AS `ID_PRODUCTO`,`a`.`ID_CATEGORIA` AS `ID_CATEGORIA`,`c`.`NOMBRE_CATEGORIA` AS `NOMBRE_CATEGORIA`,`a`.`ID_MARCA` AS `ID_MARCA`,`b`.`NOMBRE_MARCA` AS `NOMBRE_MARCA`,`a`.`NOMBRE_PRODUCTO` AS `NOMBRE_PRODUCTO`,`a`.`DESCRIPCION` AS `DESCRIPCION` from ((`producto` `a` join `marca` `b` on(`a`.`ID_MARCA` = `b`.`ID_MARCA`)) join `categoria` `c` on(`a`.`ID_CATEGORIA` = `c`.`ID_CATEGORIA`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_producto_existencia`
--

/*!50001 DROP VIEW IF EXISTS `v_producto_existencia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_producto_existencia` AS select `producto_existencia`.`ID_PRODUCTO` AS `ID_PRODUCTO`,`producto_existencia`.`EXISTENCIA` AS `EXISTENCIA` from `producto_existencia` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_recepcion_producto`
--

/*!50001 DROP VIEW IF EXISTS `v_recepcion_producto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_recepcion_producto` AS select `a`.`ID_RECEPCION` AS `ID_RECEPCION`,`a`.`FECHA_RECEPCION` AS `FECHA_RECEPCION`,`a`.`ESTADO_RECEPCION` AS `ESTADO_RECEPCION`,case when `a`.`ESTADO_RECEPCION` = 'DI' then 'DIGITADO' when `a`.`ESTADO_RECEPCION` = 'AP' then 'APLICADO' else '' end AS `NOMBRE_ESTADO_RECEPCION`,`a`.`OBSERVACIONES` AS `OBSERVACIONES` from `recepcion_producto` `a` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_recepcion_producto_deta`
--

/*!50001 DROP VIEW IF EXISTS `v_recepcion_producto_deta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_recepcion_producto_deta` AS select `a`.`ID_RECEPCION` AS `ID_RECEPCION`,`a`.`ID_RECEPCION_DETA` AS `ID_RECEPCION_DETA`,`a`.`CANTIDAD_RECEPCION` AS `CANTIDAD_RECEPCION`,`a`.`ID_PRODUCTO` AS `ID_PRODUCTO`,`b`.`NOMBRE_PRODUCTO` AS `NOMBRE_PRODUCTO` from (`recepcion_producto_deta` `a` join `producto` `b` on(`a`.`ID_PRODUCTO` = `b`.`ID_PRODUCTO`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_salida_producto`
--

/*!50001 DROP VIEW IF EXISTS `v_salida_producto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_salida_producto` AS select `a`.`ID_SALIDA` AS `ID_SALIDA`,`a`.`FECHA_SALIDA` AS `FECHA_SALIDA`,`a`.`ESTADO_SALIDA` AS `ESTADO_SALIDA`,case when `a`.`ESTADO_SALIDA` = 'DI' then 'DIGITADO' when `a`.`ESTADO_SALIDA` = 'AP' then 'APLICADO' else '' end AS `NOMBRE_ESTADO_SALIDA`,`a`.`OBSERVACIONES` AS `OBSERVACIONES` from `salida_producto` `a` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_salida_producto_deta`
--

/*!50001 DROP VIEW IF EXISTS `v_salida_producto_deta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_salida_producto_deta` AS select `a`.`ID_SALIDA` AS `ID_SALIDA`,`a`.`ID_SALIDA_DETA` AS `ID_SALIDA_DETA`,`a`.`ID_PRODUCTO` AS `ID_PRODUCTO`,`b`.`NOMBRE_PRODUCTO` AS `NOMBRE_PRODUCTO`,`a`.`CANTIDAD_SALIDA` AS `CANTIDAD_SALIDA` from (`salida_producto_deta` `a` join `producto` `b` on(`a`.`ID_PRODUCTO` = `b`.`ID_PRODUCTO`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `v_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_usuarios` AS select `usuarios`.`ID_USUARIO` AS `ID_USUARIO`,`usuarios`.`NOMBRE_USUARIO` AS `NOMBRE_USUARIO`,`usuarios`.`LOGIN_USUARIO` AS `LOGIN_USUARIO`,`usuarios`.`CLAVE` AS `CLAVE` from `usuarios` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-16 15:02:32
