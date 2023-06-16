-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lab8
-- ------------------------------------------------------
-- Server version	8.0.32

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-16  2:42:57
