CREATE DATABASE  IF NOT EXISTS `lab8` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lab8`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lab8
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudades` (
  `idciudades` int NOT NULL,
  `nombreCiudad` varchar(45) NOT NULL,
  PRIMARY KEY (`idciudades`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (1,'Puno'),(2,'Cusco'),(3,'Lima'),(4,'Tacna'),(5,'Tarapoto'),(6,'Arequipa'),(7,'Trujillo'),(8,'Apurimac');
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresaseguros`
--

DROP TABLE IF EXISTS `empresaseguros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresaseguros` (
  `idempresaSeguros` int NOT NULL,
  `nombreEmpresaSeguro` varchar(45) NOT NULL,
  PRIMARY KEY (`idempresaSeguros`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresaseguros`
--

LOCK TABLES `empresaseguros` WRITE;
/*!40000 ALTER TABLE `empresaseguros` DISABLE KEYS */;
INSERT INTO `empresaseguros` VALUES (1,'Rimac'),(2,'Pacifico'),(3,'La positiva'),(4,'Seguro Internacional'),(5,'Otro');
/*!40000 ALTER TABLE `empresaseguros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidad` (
  `idespecialidad` int NOT NULL,
  `nombreEspecialidad` varchar(45) NOT NULL,
  PRIMARY KEY (`idespecialidad`),
  UNIQUE KEY `idespecialidad_UNIQUE` (`idespecialidad`),
  UNIQUE KEY `nombreEspecialidad_UNIQUE` (`nombreEspecialidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad`
--

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
INSERT INTO `especialidad` VALUES (2,'Ingenieria Civil'),(1,'Ingenieria de Telecomunicaciones'),(3,'Ingenieria Industrial'),(4,'Ingenieria Mecanica');
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historialviajes`
--

DROP TABLE IF EXISTS `historialviajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historialviajes` (
  `identificadorViaje` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int NOT NULL,
  `idCiudadDestino` int NOT NULL,
  `idCiudadOrigen` int NOT NULL,
  `fechaReserva` datetime NOT NULL,
  `fechaViaje` datetime NOT NULL,
  `numeroBoletos` int NOT NULL,
  `idEmpresaSeguro` int NOT NULL,
  `costoUnitario` int NOT NULL,
  `costoViaje` int DEFAULT NULL,
  PRIMARY KEY (`identificadorViaje`),
  KEY `fk_historialViajes_usuarios1_idx` (`idUsuario`),
  KEY `fk_historialViajes_empresaSeguros1_idx` (`idEmpresaSeguro`),
  KEY `fk_historialViajes_ciudades1_idx` (`idCiudadDestino`),
  KEY `fk_historialViajes_ciudades2_idx` (`idCiudadOrigen`),
  CONSTRAINT `fk_historialViajes_ciudades1` FOREIGN KEY (`idCiudadDestino`) REFERENCES `ciudades` (`idciudades`),
  CONSTRAINT `fk_historialViajes_ciudades2` FOREIGN KEY (`idCiudadOrigen`) REFERENCES `ciudades` (`idciudades`),
  CONSTRAINT `fk_historialViajes_empresaSeguros1` FOREIGN KEY (`idEmpresaSeguro`) REFERENCES `empresaseguros` (`idempresaSeguros`),
  CONSTRAINT `fk_historialViajes_usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historialviajes`
--

LOCK TABLES `historialviajes` WRITE;
/*!40000 ALTER TABLE `historialviajes` DISABLE KEYS */;
INSERT INTO `historialviajes` VALUES (1,1,2,3,'2023-06-01 00:00:00','2023-06-15 00:00:00',5,1,50,0),(2,2,3,4,'2023-07-01 00:00:00','2023-07-15 00:00:00',3,2,60,0),(3,1,2,3,'2023-01-01 00:00:00','2023-01-15 00:00:00',5,1,50,0),(4,2,2,4,'2023-02-01 00:00:00','2023-02-15 00:00:00',3,2,60,0),(5,3,3,7,'2023-03-01 00:00:00','2023-03-15 00:00:00',5,3,80,0),(6,1,3,7,'2023-04-01 00:00:00','2023-04-15 00:00:00',3,4,90,0),(7,2,2,1,'2023-05-01 00:00:00','2023-05-15 00:00:00',5,5,30,0),(8,3,5,4,'2023-06-01 00:00:00','2023-06-15 00:00:00',3,4,20,0),(9,1,6,3,'2023-07-01 00:00:00','2023-07-15 00:00:00',5,3,10,0),(10,2,7,4,'2023-08-01 00:00:00','2023-08-15 00:00:00',3,1,60,0),(11,3,5,3,'2023-09-01 00:00:00','2023-09-15 00:00:00',5,1,50,0),(12,1,3,4,'2023-10-01 00:00:00','2023-10-15 00:00:00',3,3,80,0),(13,2,1,3,'2023-11-01 00:00:00','2023-11-15 00:00:00',5,2,90,0),(14,3,3,4,'2023-12-01 00:00:00','2023-12-15 00:00:00',3,2,90,0);
/*!40000 ALTER TABLE `historialviajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `fechaNacimiento` datetime NOT NULL,
  `codigoPucp` int NOT NULL,
  `correoPucp` varchar(45) NOT NULL,
  `contrasenia` varchar(45) NOT NULL,
  `confirmacionContrasenia` varchar(45) NOT NULL,
  `idespecialidad` int NOT NULL,
  `costoTotal` int NOT NULL,
  `contraHasheada` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_usuarios_especialidad_idx` (`idespecialidad`),
  CONSTRAINT `fk_usuarios_especialidad` FOREIGN KEY (`idespecialidad`) REFERENCES `especialidad` (`idespecialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Juan','Pérez','1990-01-01 00:00:00',12345678,'juan.perez@pucp.edu.pe','12345678','12345678',1,100,'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f'),(2,'María','Gómez','1992-03-15 00:00:00',98765432,'maria.gomez@pucp.edu.pe','98765432','98765432',2,150,'4e20613ec3a63732f98630b9429e1600d47a08f059496d39ffd353f0c3038f39'),(3,'Carlos','López','1988-07-20 00:00:00',45678901,'carlos.lopez@pucp.edu.pe','45678901','45678901',1,200,'6a5ef7bdbf8db33f0192c3a106dbe58fd9651f5d7bf8b094897eebd2b5514194');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'lab8'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-17 12:22:25
