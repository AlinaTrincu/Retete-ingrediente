-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: alina_trincu
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `ingrediente`
--

DROP TABLE IF EXISTS `ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingrediente` (
  `idingredient` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nume` varchar(45) DEFAULT NULL,
  `unitate_de_masura` varchar(45) DEFAULT NULL,
  `pret` int DEFAULT NULL,
  `data_expirare` date DEFAULT NULL,
  PRIMARY KEY (`idingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingrediente`
--

LOCK TABLES `ingrediente` WRITE;
/*!40000 ALTER TABLE `ingrediente` DISABLE KEYS */;
INSERT INTO `ingrediente` VALUES (1,'paste','grame',9,'2024-11-16'),(2,'apa','litri',3,'2027-12-24'),(3,'sare','grame',4,'2025-09-07'),(4,'kaiser','grame',10,'2024-01-27'),(5,'smantana','grame',15,'2024-04-17'),(6,'parmezan','grame',8,'2025-06-15'),(7,'oua','bucati',7,'2024-02-19'),(8,'branza','grame',10,'2023-12-19'),(9,'piper','grame',2,'2026-08-02'),(10,'faina','grame',8,'2027-09-13'),(11,'zahar','grame',5,'2026-04-26'),(12,'frisca','mililitri',16,'2025-06-02'),(13,'ciocolata','grame',5,'2026-10-15');
/*!40000 ALTER TABLE `ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingrediente_reteta`
--

DROP TABLE IF EXISTS `ingrediente_reteta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingrediente_reteta` (
  `idlegatura` bigint unsigned NOT NULL AUTO_INCREMENT,
  `idreteta` bigint unsigned DEFAULT NULL,
  `idingredient` bigint unsigned DEFAULT NULL,
  `cantitate_ingredient` float DEFAULT NULL,
  PRIMARY KEY (`idlegatura`),
  KEY `fk_reteta_1_idx` (`idreteta`),
  KEY `fk_retete_2_idx` (`idingredient`),
  CONSTRAINT `fk_retete_1` FOREIGN KEY (`idreteta`) REFERENCES `retete` (`idreteta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_retete_2` FOREIGN KEY (`idingredient`) REFERENCES `ingrediente` (`idingredient`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingrediente_reteta`
--

LOCK TABLES `ingrediente_reteta` WRITE;
/*!40000 ALTER TABLE `ingrediente_reteta` DISABLE KEYS */;
INSERT INTO `ingrediente_reteta` VALUES (1,1,12,3),(2,1,2,3),(3,1,3,0.2),(4,1,4,2),(5,1,5,4),(6,1,6,1),(7,1,7,2),(11,1,9,0.005),(17,1,1,3),(19,1,1,3),(20,1,1,3),(21,1,1,2),(25,1,4,3);
/*!40000 ALTER TABLE `ingrediente_reteta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retete`
--

DROP TABLE IF EXISTS `retete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `retete` (
  `idreteta` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nume` varchar(45) DEFAULT NULL,
  `timp_de_preparare` int DEFAULT NULL,
  `dificultate` varchar(45) DEFAULT NULL,
  `numar_portii` int DEFAULT NULL,
  PRIMARY KEY (`idreteta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retete`
--

LOCK TABLES `retete` WRITE;
/*!40000 ALTER TABLE `retete` DISABLE KEYS */;
INSERT INTO `retete` VALUES (1,'Paste Carbonara',30,'mediu',4),(2,'Omleta',10,'usor-mediu',1),(7,'pizza',1,'greu',2);
/*!40000 ALTER TABLE `retete` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-06 10:47:29
