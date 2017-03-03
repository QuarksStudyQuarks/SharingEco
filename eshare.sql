-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: eshare
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `Make` varchar(64) NOT NULL,
  `Model` varchar(64) NOT NULL,
  `Yr` int(11) NOT NULL,
  `Color` varchar(64) NOT NULL,
  `Price` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  KEY `ID` (`ID`),
  CONSTRAINT `car_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `post` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES ('dodge','avenger',2014,'black',11111,1),('dodge','avenger',2015,'white',22222,2);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house`
--

DROP TABLE IF EXISTS `house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `house` (
  `Rent` int(11) NOT NULL,
  `Sqft` int(11) NOT NULL,
  `Rooms` int(11) NOT NULL,
  `Baths` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  KEY `ID` (`ID`),
  CONSTRAINT `house_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `post` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house`
--

LOCK TABLES `house` WRITE;
/*!40000 ALTER TABLE `house` DISABLE KEYS */;
INSERT INTO `house` VALUES (1300,1000,2,2,1),(1100,900,2,1,2);
/*!40000 ALTER TABLE `house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail`
--

DROP TABLE IF EXISTS `mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail` (
  `SendID` int(11) NOT NULL,
  `RecID` int(11) NOT NULL,
  `TimeSent` mediumtext NOT NULL,
  `Message` varchar(4096) NOT NULL,
  KEY `SendID` (`SendID`),
  KEY `RecID` (`RecID`),
  CONSTRAINT `mail_ibfk_1` FOREIGN KEY (`SendID`) REFERENCES `user` (`ID`),
  CONSTRAINT `mail_ibfk_2` FOREIGN KEY (`RecID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail`
--

LOCK TABLES `mail` WRITE;
/*!40000 ALTER TABLE `mail` DISABLE KEYS */;
INSERT INTO `mail` VALUES (1,2,'1486770509','Hi this is Matt, I\'d like to rent your house'),(2,1,'1486770512','Sounds great, here is my phone number 408-867-5309. Call me between 8am and 10pm mon to sat to schedule a viewing');
/*!40000 ALTER TABLE `mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `ID` int(11) NOT NULL,
  `DateCreated` date NOT NULL,
  `CreatorID` int(11) NOT NULL,
  `Title` varchar(256) NOT NULL,
  `ItemType` varchar(32) NOT NULL,
  `Description` varchar(4096) DEFAULT NULL,
  `AvailStart` date NOT NULL,
  `AvailEnd` date NOT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `CarID` int(11) DEFAULT '0',
  `HouseID` int(11) DEFAULT '0',
  `imgsrc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CreatorID` (`CreatorID`),
  KEY `post_ibfk_1_idx` (`CarID`),
  KEY `post_ibfk_3_idx` (`HouseID`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`CreatorID`) REFERENCES `user` (`ID`),
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`CarID`) REFERENCES `car` (`ID`),
  CONSTRAINT `post_ibfk_3` FOREIGN KEY (`HouseID`) REFERENCES `house` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'2017-02-28',1,'2014 usesd dodge','car','used car','2017-02-28','2018-02-28','fremont',1,1,'./carimg/car1.jpg'),(2,'2017-02-28',1,'2015 new dodge','car','new car','2017-02-28','2018-02-28','fremont',2,1,NULL),(3,'2017-02-28',1,'2Ba3Bed house','house','big house ','2017-02-28','2018-02-28','union city',1,1,NULL),(4,'2017-02-28',1,'1Ba2Bed house','house','small house','2017-02-28','2018-02-28','union city',1,2,NULL);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PassHash` varchar(64) NOT NULL,
  `PassSalt` varchar(8) NOT NULL,
  `Fname` varchar(32) NOT NULL,
  `Lname` varchar(32) NOT NULL,
  `Email` varchar(128) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'12f2d0cfacf10953fba3bb1aa1ea6bff817f997d1b574f840bf16fbe6e29e942','thissalt','Matt','Davis','Mdavis2599@gmail.com'),(2,'78a096f49651dc644eaa3a9ba43abae627a197035aef180d8cff82b894d0bff7','thatsalt','John','Doe','JohnDoe@gmail.com'),(3,'1e8eb238ff32189a634f06c65319f40e','3fb848c7','kaichen','zhu','kaichenzhu@yahoo.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-03 13:04:51
