CREATE DATABASE  IF NOT EXISTS `Database` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Database`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: ec2-18-216-224-152.us-east-2.compute.amazonaws.com    Database: Database
-- ------------------------------------------------------
-- Server version	8.0.17

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `Contains`
--

DROP TABLE IF EXISTS `Contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contains` (
  `UniqueID` int(11) NOT NULL,
  `TransitLineName` varchar(45) NOT NULL,
  `Origin` varchar(45) DEFAULT NULL,
  `Destination` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UniqueID`,`TransitLineName`),
  KEY `TransitLineName` (`TransitLineName`),
  CONSTRAINT `Contains_ibfk_1` FOREIGN KEY (`UniqueID`) REFERENCES `TrainStation` (`UniqueID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Contains_ibfk_2` FOREIGN KEY (`TransitLineName`) REFERENCES `TrainSchedule` (`TransitLineName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contains`
--

LOCK TABLES `Contains` WRITE;
/*!40000 ALTER TABLE `Contains` DISABLE KEYS */;
INSERT INTO `Contains` VALUES (1,'ACLS Line 1','Penn Station','Edison Train Station'),(2,'ATP Line 1','New York City Train Station','Edison Train Station'),(3,'ACLS Line 2','Trenton Train Station','Allentown Train Port'),(4,'ATP Line 2','Miami Station','Myrtle Beach Train Station'),(5,'BS Line 1','New Brunswick Train Station','Kentucky Station'),(6,'BS Line 2','Northeast Corridor','Penn Station'),(7,'COR Line 1','Princeton Train Station','Trenton Train Station'),(8,'CU Line 1','Edison Train Station','Metuchen Transit Station'),(9,'DCL Line 1','Deleware Corridor Line','Soho Underground'),(10,'ETS Line 1','Metuchen Transit Station','Bossanova Station'),(11,'JES Line 1','Allentown Train Port','Chinatown Underground'),(12,'KS Line 1','Bossanova Station','Miami Station'),(13,'MBTS Line 1','Atlanta Corridor Line Station','Jamestown ENC Station'),(14,'MS Line 1','Jamestown ENC Station','New York City Train Station'),(15,'MS Line 2','Soho Underground','New Brunswick Train Station'),(16,'MTS Line 1','Ye Old Rail Lines','Atlanta Corridor Line Station'),(17,'NBTS Line 1','Chinatown Underground','Soho Underground'),(18,'NC Line 1','Myrtle Beach Train Station','Chinatown Underground'),(19,'SU Line 1','Charolette On Rails','Kentucky Station'),(20,'YORL Line 1','Kentucky Station','Trenton Train Station');
/*!40000 ALTER TABLE `Contains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `E-mail` varchar(45) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `E-mail_UNIQUE` (`E-mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('','','','',''),('binary','bombs','Menendez','David','binarybombs@gmail.com'),('bruhmoment','bruh','Bruh','Tracy','facetracy@gmail.com'),('chris','clemente','Chris','Clemente','clementine@gmail.com'),('cokie','cool','Cokie','Shmokie','coolcoolcool@yahoo.com'),('csdatabase','password','Nick','Rytelewski','cs336@scarletmail.rutgers.edu'),('deymious','evil','John','Francisco','deymious@yahoo.com'),('dogboots','shallow','Colia','Goattee','goatstatus@scarletmail.rutgers.edu'),('engineer','tool','Steve','Harris','toolbox@whitehouse.gov'),('jeep','wrangle','Snake','Wrangler','fillitin@msn.com'),('joeythegoat','goated','Joey','Goat','goatstatus@gmail.com'),('jones','goated','Sam','Jones','plague@msn.com'),('jooba','scube','Joe','Shmoe','randomemail@msn.com'),('juicedakiddd','juiced','Juice','WRLD','juicewrld@gmail.com'),('kleen','dood','Dan','Kleenie','shmackaroo@gmail.com'),('macand','cheese','Mac','Miller','macmiller@yahoo.com'),('mag','ronnie','Ronnie','Mags','tracer@yahoo.com'),('nickryt','fireee','Nick','Ryt','nickryt@gmail.com'),('obama','president','Barack','Obama','obama@whitehouse.gov'),('trump','president','Donald','Trump','trump@whitehouse.gov'),('valia','valia','Valia','TA','valia@scarletmail.rutgers.edu');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `ssn` varchar(11) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `admin` tinyint(4) NOT NULL,
  `customerRep` tinyint(4) NOT NULL,
  PRIMARY KEY (`ssn`),
  UNIQUE KEY `ssn_UNIQUE` (`ssn`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES ('1','---------','---------','','',0,0),('122-22-2121','Big','Boss','admin','password',1,0),('122-43-2884','Zoey','Poor','livipour','coolin',0,1),('136-19-7985','Frank','Sham','shammy','shoes',0,1),('240-09-1337','Bob','Marshall','bobmarsh','marshy',0,1),('432-19-1408','Sam','Sheckl','sheklman','sam',1,0),('478-88-8890','Joe','Shmoe','liljoey','jstheking',1,0),('482-22-1538','Dan','Stan','stan','thisismypassword',0,1),('732-99-3249','Martha','Dorothy','socks','fuzzy',0,1),('832-21-2225','Xiaxio','Ziazangpuo','shmackers','wodies',0,1),('952-84-7653','Carl','Wheezer','carlwheezer','stow',0,1);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Has`
--

DROP TABLE IF EXISTS `Has`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Has` (
  `id` int(4) NOT NULL,
  `TransitLineName` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TransitLineName` (`TransitLineName`),
  CONSTRAINT `Has_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Train` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Has_ibfk_2` FOREIGN KEY (`TransitLineName`) REFERENCES `TrainSchedule` (`TransitLineName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Has`
--

LOCK TABLES `Has` WRITE;
/*!40000 ALTER TABLE `Has` DISABLE KEYS */;
/*!40000 ALTER TABLE `Has` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Messages`
--

DROP TABLE IF EXISTS `Messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Messages` (
  `ssn` varchar(11) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `Question` varchar(150) NOT NULL,
  `Answer` varchar(200) NOT NULL,
  `UniqueNumber` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`UniqueNumber`),
  KEY `ssn` (`ssn`),
  KEY `username` (`username`),
  CONSTRAINT `Messages_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `Employee` (`ssn`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Messages_ibfk_2` FOREIGN KEY (`username`) REFERENCES `Customer` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Messages`
--

LOCK TABLES `Messages` WRITE;
/*!40000 ALTER TABLE `Messages` DISABLE KEYS */;
INSERT INTO `Messages` VALUES ('1','chris','My credit card was charged twice for only one transaction. What should I do?','',1),('1','jones','How would I go about reserving an entire train for myself?','',2),('732-99-3249','dogboots','I missed my train, is it possible to get a refund?','It is not possible, you must buy another ticket.',3),('732-99-3249','engineer','Can I get a military discount?','Yes you can! Just check the veteran checkbox when reserving a train!',4),('1','jooba','Are there any high speed trains that can take me from NY to LA?','',5),('240-09-1337','binary','When is my train coming today?','Later!',6);
/*!40000 ALTER TABLE `Messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Planned`
--

DROP TABLE IF EXISTS `Planned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Planned` (
  `ReservationNumber` bigint(11) NOT NULL,
  `TransitLineName` varchar(45) NOT NULL,
  PRIMARY KEY (`ReservationNumber`,`TransitLineName`),
  KEY `TransitLineName` (`TransitLineName`),
  CONSTRAINT `Planned_ibfk_1` FOREIGN KEY (`ReservationNumber`) REFERENCES `Reservation` (`ReservationNumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Planned_ibfk_2` FOREIGN KEY (`TransitLineName`) REFERENCES `TrainSchedule` (`TransitLineName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Planned`
--

LOCK TABLES `Planned` WRITE;
/*!40000 ALTER TABLE `Planned` DISABLE KEYS */;
INSERT INTO `Planned` VALUES (5,'ACLS Line 1'),(1,'ATP Line 1'),(3,'MBTS Line 1'),(4,'PTS Line 2'),(2,'TTS Line 1.1');
/*!40000 ALTER TABLE `Planned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Requests`
--

DROP TABLE IF EXISTS `Requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Requests` (
  `ReservationNumber` bigint(11) NOT NULL,
  `Username` varchar(45) NOT NULL,
  PRIMARY KEY (`ReservationNumber`,`Username`),
  KEY `Username` (`Username`),
  CONSTRAINT `Requests_ibfk_1` FOREIGN KEY (`ReservationNumber`) REFERENCES `Reservation` (`ReservationNumber`),
  CONSTRAINT `Requests_ibfk_2` FOREIGN KEY (`Username`) REFERENCES `Customer` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Requests`
--

LOCK TABLES `Requests` WRITE;
/*!40000 ALTER TABLE `Requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `Requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservation`
--

DROP TABLE IF EXISTS `Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reservation` (
  `ReservationNumber` bigint(11) NOT NULL,
  `Passenger` varchar(45) NOT NULL,
  `Fare` double NOT NULL,
  `trip` int(11) NOT NULL,
  `departTime` datetime DEFAULT NULL,
  `origin` varchar(45) DEFAULT NULL,
  `destination` varchar(45) DEFAULT NULL,
  `transitLine` varchar(45) DEFAULT NULL,
  `canceled` int(11) DEFAULT NULL,
  PRIMARY KEY (`ReservationNumber`),
  UNIQUE KEY `ReservationNumber_UNIQUE` (`ReservationNumber`),
  KEY `transitLine` (`transitLine`),
  CONSTRAINT `Reservation_ibfk_1` FOREIGN KEY (`transitLine`) REFERENCES `TrainSchedule` (`TransitLineName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservation`
--

LOCK TABLES `Reservation` WRITE;
/*!40000 ALTER TABLE `Reservation` DISABLE KEYS */;
INSERT INTO `Reservation` VALUES (1,'dogboots',18.45,0,'2020-09-05 13:00:00','Allentown Train Port','Myrtle Beach Train Station','ATP Line 1',0),(2,'binary',2,0,'2020-09-05 12:10:00','Trenton Train Station','Kentucky Station','TTS Line 1.1',0),(3,'jooba',3.57,0,'2020-09-21 05:00:00','Myrtle Beach Train Station','Soho Underground','MBTS Line 1',0),(4,'juicedakiddd',3.45,0,'2010-01-01 01:00:00','Princeton Train Station','New Brunswick Train Station','PTS Line 2',0),(5,'kleen',14.45,1,'2010-01-01 01:00:00','Atlanta Corridor Line Station','Bossanova Station','PTS Line 2',0),(6,'binary',40.875,0,'2020-09-21 00:00:00','Allentown Train Port','Chinatown Underground','JES Line 1',1);
/*!40000 ALTER TABLE `Reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Train`
--

DROP TABLE IF EXISTS `Train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Train` (
  `id` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Train`
--

LOCK TABLES `Train` WRITE;
/*!40000 ALTER TABLE `Train` DISABLE KEYS */;
INSERT INTO `Train` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45);
/*!40000 ALTER TABLE `Train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TrainSchedule`
--

DROP TABLE IF EXISTS `TrainSchedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TrainSchedule` (
  `TransitLineName` varchar(45) NOT NULL,
  `Fare` double NOT NULL,
  `TravelTime` time NOT NULL,
  `ArrivalDateTime` datetime NOT NULL,
  `DepartureDateTime` datetime NOT NULL,
  `Stops` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TransitLineName`),
  UNIQUE KEY `TransitLineName_UNIQUE` (`TransitLineName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TrainSchedule`
--

LOCK TABLES `TrainSchedule` WRITE;
/*!40000 ALTER TABLE `TrainSchedule` DISABLE KEYS */;
INSERT INTO `TrainSchedule` VALUES ('ACLS Line 1',14.45,'02:00:00','2010-01-01 03:00:00','2010-01-01 02:00:00','Edison Station'),('ACLS Line 2',3.55,'01:00:00','2020-08-19 12:00:00','2020-09-05 11:00:00','Soho Underground'),('ATP Line 1',18.45,'01:00:00','2020-09-05 14:00:00','2020-09-05 13:00:00','Ye Old Rail Lines'),('ATP Line 2',8.55,'04:05:00','2020-09-05 08:05:00','2020-09-05 04:00:00','Northeast Corridor'),('BS Line 1',14.45,'01:00:00','2020-09-05 14:00:00','2020-09-05 13:00:00','Princeton Train Station'),('BS Line 2',3.55,'00:00:10','2020-09-08 08:00:10','2020-09-05 08:00:00','Miami Station'),('COR Line 1',7.99,'02:00:00','2020-09-20 08:00:00','2020-09-21 06:00:00','Penn Station'),('CU Line 1',2.75,'03:00:00','2020-09-20 14:00:00','2020-09-21 11:00:00','Edison Train Station, Princeton Train Station'),('DCL Line 1',4.99,'06:00:00','2020-09-05 14:00:00','2020-09-05 08:00:00','Jamestown ENC Station'),('ETS Line 1',11.99,'02:00:00','2020-09-05 10:00:00','2020-09-05 08:00:00','Bossanova Station'),('JES Line 1',54.5,'12:00:00','2020-09-20 12:00:00','2020-09-21 00:00:00','Charolette On Rails, Delaware Corridor Line'),('KS Line 1',19.43,'10:00:00','2020-09-20 15:00:00','2020-09-21 05:00:00','Delaware Corridor Line'),('MBTS Line 1',3.57,'01:00:00','2020-09-20 06:00:00','2020-09-21 05:00:00','Princeton Train Station'),('MS Line 1',8.99,'00:45:00','2020-09-05 15:00:00','2020-09-05 15:45:00','Atlanta Corridor Line Station'),('MS Line 2',0.5,'01:00:00','2020-09-05 11:00:00','2020-09-05 12:00:00','Bossanova Station'),('MTS Line 1',7.3,'01:00:00','2020-09-05 14:00:00','2020-09-05 13:00:00','Jamestown ENC Station'),('NBTS Line 1',8.99,'00:45:00','2020-09-05 15:00:00','2020-09-05 15:45:00','Northeast Corridor'),('NC Line 1',19.99,'02:00:00','2020-09-05 13:00:00','2020-09-05 15:00:00','New Brunswick Train Station'),('NYCTS Line 1',6,'01:30:00','2020-09-05 12:00:00','2020-09-05 10:30:00','Trenton Train Station'),('NYCTS Line 2',25,'05:00:00','2020-09-05 11:00:00','2020-09-05 06:00:00','Bossanova Station'),('NYCTS Line 3',16.75,'03:00:00','2020-09-05 17:00:00','2020-09-05 14:00:00','Jamestown ENC Station'),('PS Line 1',7.5,'01:30:00','2020-09-05 12:00:00','2020-09-05 10:30:00','New York City Train Station, Trenton Train St'),('PS Line 2',3.75,'03:00:00','2020-09-05 09:00:00','2020-09-05 06:00:00','Northeast Corridor'),('PS Line 3',9.99,'01:00:00','2020-09-05 13:00:00','2020-09-05 14:00:00','Allentown Train Port '),('PTS Line 1',12.99,'02:00:00','2020-09-05 10:00:00','2020-09-05 08:00:00','Allentown Train Port'),('PTS Line 2',3.45,'01:00:00','2020-09-05 05:00:00','2020-09-05 04:00:00','Northeast Corridor'),('PTS Line 3',10.75,'03:00:00','2020-09-05 17:00:00','2020-09-05 14:00:00','Ye Old Rail Lines'),('SU Line 1',54.5,'03:30:00','2020-09-11 09:30:00','2020-09-11 06:00:00',''),('TTS Line 1.1',2.5,'00:15:00','2020-09-05 12:00:00','2020-09-05 12:10:00','Bossanova Station'),('YORL Line 1',10.5,'02:00:00','2020-09-21 14:00:00','2020-09-21 12:00:00','Bossanova Station, Edison Train Station');
/*!40000 ALTER TABLE `TrainSchedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TrainStation`
--

DROP TABLE IF EXISTS `TrainStation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TrainStation` (
  `UniqueID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  PRIMARY KEY (`UniqueID`),
  UNIQUE KEY `UniqueID_UNIQUE` (`UniqueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TrainStation`
--

LOCK TABLES `TrainStation` WRITE;
/*!40000 ALTER TABLE `TrainStation` DISABLE KEYS */;
INSERT INTO `TrainStation` VALUES (1,'Penn Station','Philidelphia','PA'),(2,'New York City Train Station','New York City','NY'),(3,'Trenton Train Station','Trenton','NJ'),(4,'Miami Station','Miami','FL'),(5,'New Brunswick Train Station','New Brunswick','NJ'),(6,'Northeast Corridor','Kearny','NJ'),(7,'Princeton Train Station','Princeton','NJ'),(8,'Edison Train Station','Edison','NJ'),(9,'Deleware Corridor Line','Delaware','DE'),(10,'Metuchen Transit Station','Metuchen','NJ'),(11,'Allentown Train Port','Allentown','PA'),(12,'Bossanova Station','Bossanova','FL'),(13,'Atlanta Corridor Line Station','Atlanta','GA'),(14,'Jamestown ENC Station','Jamestown','NY'),(15,'Soho Underground','New York City','NY'),(16,'Ye Old Rail Lines','Virginia Beach','VA'),(17,'Chinatown Underground','New York City','CA'),(18,'Myrtle Beach Train Station','Myrtle Beach','SC'),(19,'Charolette On Rails','Charolette','NC'),(20,'Kentucky Station','Kentuckyville','KY');
/*!40000 ALTER TABLE `TrainStation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TransitLine`
--

DROP TABLE IF EXISTS `TransitLine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TransitLine` (
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TransitLine`
--

LOCK TABLES `TransitLine` WRITE;
/*!40000 ALTER TABLE `TransitLine` DISABLE KEYS */;
/*!40000 ALTER TABLE `TransitLine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorksAt`
--

DROP TABLE IF EXISTS `WorksAt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorksAt` (
  `UniqueID` int(11) NOT NULL,
  `ssn` varchar(10) NOT NULL,
  PRIMARY KEY (`ssn`),
  KEY `UniqueID` (`UniqueID`),
  CONSTRAINT `WorksAt_ibfk_1` FOREIGN KEY (`UniqueID`) REFERENCES `TrainStation` (`UniqueID`),
  CONSTRAINT `WorksAt_ibfk_2` FOREIGN KEY (`ssn`) REFERENCES `Employee` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorksAt`
--

LOCK TABLES `WorksAt` WRITE;
/*!40000 ALTER TABLE `WorksAt` DISABLE KEYS */;
/*!40000 ALTER TABLE `WorksAt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorksOn`
--

DROP TABLE IF EXISTS `WorksOn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorksOn` (
  `ssn` varchar(10) NOT NULL,
  `id` int(4) NOT NULL,
  PRIMARY KEY (`ssn`),
  KEY `id` (`id`),
  CONSTRAINT `WorksOn_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Train` (`id`),
  CONSTRAINT `WorksOn_ibfk_2` FOREIGN KEY (`ssn`) REFERENCES `Employee` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorksOn`
--

LOCK TABLES `WorksOn` WRITE;
/*!40000 ALTER TABLE `WorksOn` DISABLE KEYS */;
/*!40000 ALTER TABLE `WorksOn` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-07 21:12:40
