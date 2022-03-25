CREATE DATABASE  IF NOT EXISTS `muestra_basica` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `muestra_basica`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: muestra_basica
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `apellido` char(30) NOT NULL,
  `nombre` char(30) NOT NULL,
  `documento_nro` char(9) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ap` (`apellido`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Flores','Antonio Javier','28557881'),(2,'Pérez','Mariana','32100458'),(3,'Silva','Cristina Mabel','35125400'),(4,'Páez','Pablo','110223412'),(5,'Medina','Ana Fabiana','110200177'),(6,'Medina','Daniel','40655822'),(7,'Silva','Mariana Alejandra','40155444');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `fecha` date NOT NULL,
  `total` float(12,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_factura_cliente1_idx` (`cliente_id`),
  CONSTRAINT `fk_factura_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,5,'2021-07-10',600.00),(2,4,'2021-07-10',1140.00),(3,1,'2021-07-11',362.50),(4,1,'2021-07-12',220.00),(5,4,'2021-07-12',1350.00),(6,4,'2021-07-12',100.00);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_detalle`
--

DROP TABLE IF EXISTS `factura_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_detalle` (
  `factura_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `cantidad` float(7,2) NOT NULL,
  `importe` float(12,2) NOT NULL,
  PRIMARY KEY (`factura_id`,`producto_id`),
  KEY `fk_factura_has_producto_producto1_idx` (`producto_id`),
  KEY `fk_factura_has_producto_factura_idx` (`factura_id`),
  CONSTRAINT `fk_factura_has_producto_factura` FOREIGN KEY (`factura_id`) REFERENCES `factura` (`id`),
  CONSTRAINT `fk_factura_has_producto_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_detalle`
--

LOCK TABLES `factura_detalle` WRITE;
/*!40000 ALTER TABLE `factura_detalle` DISABLE KEYS */;
INSERT INTO `factura_detalle` VALUES (1,2,5.00,600.00),(2,3,2.00,470.00),(2,5,1.00,220.00),(2,6,4.50,450.00),(3,2,1.25,150.00),(3,4,2.50,212.50),(4,5,1.00,220.00),(5,1,3.50,665.00),(5,2,5.00,600.00),(5,4,1.00,85.00),(6,1,1.00,100.00);
/*!40000 ALTER TABLE `factura_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `stock` float(7,2) DEFAULT NULL,
  `precio` float(12,2) NOT NULL,
  `unidad_medida_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_producto_unidad_medida1_idx` (`unidad_medida_id`),
  CONSTRAINT `fk_producto_unidad_medida1` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medida` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Arroz suelto',100.50,190.00,1),(2,'Maíz suelto',150.30,120.00,1),(3,'Aceite suelto',47.00,235.00,3),(4,'Azúcar suelto',260.00,85.00,1),(5,'Salchichas x6',24.00,220.00,4),(6,'Vinagre suelto',32.00,100.00,3),(7,'Sal 250 GRS.',10.00,60.00,4),(8,'Azúcar x10Kgs',5.00,578.00,1),(9,'Harina X1Kg',NULL,100.00,NULL);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'DOCENTE'),(2,'ESTUDIANTE'),(3,'ADMINISTRATIVO');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_medida`
--

DROP TABLE IF EXISTS `unidad_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidad_medida` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_medida`
--

LOCK TABLES `unidad_medida` WRITE;
/*!40000 ALTER TABLE `unidad_medida` DISABLE KEYS */;
INSERT INTO `unidad_medida` VALUES (1,'KGS'),(2,'MTS'),(3,'LTS'),(4,'PAQ'),(5,'MM');
/*!40000 ALTER TABLE `unidad_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `apellido` char(30) NOT NULL,
  `nombre` char(30) NOT NULL,
  `ocupacion` varchar(15) DEFAULT NULL,
  `hobby` varchar(35) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `puntaje` tinyint NOT NULL,
  `rol_id` int NOT NULL,
  `email` varchar(70) NOT NULL,
  `contrasenia` char(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_usuario_rol_idx` (`rol_id`),
  CONSTRAINT `FK_usuario_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Flores','Jorge','PROGRAMADOR',NULL,'1980-01-10',1,1,'flores@gmail.com','mypass12'),(2,'Diaz','Mario',NULL,'FUTBOL','1985-05-05',3,3,'diaz@gmail.com','mypass34'),(3,'Manrique','Mabel','POLICIA','BOXEO','1986-07-15',2,2,'manrique@gmail.com','mypass56'),(4,'Perez','Alejandra',NULL,NULL,'1990-10-01',4,2,'perez@gmail.com','mypass78'),(5,'Aguilar','Noel','ANALISTA','AJEDREZ','1990-10-15',2,1,'aguilar@gmail.com','mypass90'),(6,'Sanchez','Manuel','POLICIA','FUTBOL','1980-10-20',5,2,'sanchez@gmail.com','mypass21');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-08 19:53:56
