-- MySQL dump 10.13  Distrib 5.7.20, for Win64 (x86_64)
--
-- Host: localhost    Database: bball
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game` (
  `id` char(36) NOT NULL,
  `home` char(36) NOT NULL,
  `away` char(36) NOT NULL,
  `day` varchar(10) NOT NULL,
  `date` datetime NOT NULL,
  `homescore` int(11) DEFAULT NULL,
  `awayscore` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES ('c4df0baf-13da-11e9-9846-cc2f713dca42','1e8e278d-13d9-11e9-9846-cc2f713dca42','1e8e1b0f-13d9-11e9-9846-cc2f713dca42','01/08/2019','2010-01-08 17:00:00',11,20),('ce787d1a-13de-11e9-9846-cc2f713dca42','1e8e1b0f-13d9-11e9-9846-cc2f713dca42','1e8e2836-13d9-11e9-9846-cc2f713dca42','1/10/2019','2019-01-10 16:00:00',NULL,NULL),('ce79b013-13de-11e9-9846-cc2f713dca42','1e8e2888-13d9-11e9-9846-cc2f713dca42','1e8e1b0f-13d9-11e9-9846-cc2f713dca42','1/15/2019','2019-01-15 17:00:00',NULL,NULL),('ce79b258-13de-11e9-9846-cc2f713dca42','1e8e28cb-13d9-11e9-9846-cc2f713dca42','1e8e1b0f-13d9-11e9-9846-cc2f713dca42','1/17/2019','2019-01-17 17:00:00',NULL,NULL),('ce79b2bb-13de-11e9-9846-cc2f713dca42','1e8e1b0f-13d9-11e9-9846-cc2f713dca42','1e8e28cb-13d9-11e9-9846-cc2f713dca42','1/24/2019','2019-01-24 16:00:00',NULL,NULL),('ce79b30c-13de-11e9-9846-cc2f713dca42','1e8e2836-13d9-11e9-9846-cc2f713dca42','1e8e1b0f-13d9-11e9-9846-cc2f713dca42','1/31/2019','2019-01-31 17:00:00',NULL,NULL),('ce79b38f-13de-11e9-9846-cc2f713dca42','1e8e1b0f-13d9-11e9-9846-cc2f713dca42','1e8e278d-13d9-11e9-9846-cc2f713dca42','2/5/2019','2019-02-05 16:00:00',NULL,NULL),('ce79b3dc-13de-11e9-9846-cc2f713dca42','1e8e1b0f-13d9-11e9-9846-cc2f713dca42','1e8e2888-13d9-11e9-9846-cc2f713dca42','2/7/2019','2019-02-07 16:00:00',NULL,NULL);
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level` (
  `id` char(36) NOT NULL,
  `level` varchar(20) NOT NULL,
  `abbr` varchar(5) DEFAULT NULL,
  `year` char(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES ('5f89128b-13d8-11e9-9846-cc2f713dca42','Varsity','V','2018'),('5f892f4e-13d8-11e9-9846-cc2f713dca42','Junior Varsity','JV','2018'),('5f893076-13d8-11e9-9846-cc2f713dca42','Varsity','V','2019'),('5f8930dc-13d8-11e9-9846-cc2f713dca42','Junior Varsity','JV','2019');
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `id` char(36) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `position` varchar(10) DEFAULT NULL,
  `uniform` int(11) DEFAULT NULL,
  `school` char(36) NOT NULL,
  `grade` int(11) NOT NULL,
  `level` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES ('19d28b85-13da-11e9-9846-cc2f713dca42','Sky','Player-1','F/C',1,'1e8e1b0f-13d9-11e9-9846-cc2f713dca42',7,'5f893076-13d8-11e9-9846-cc2f713dca42'),('19d29b52-13da-11e9-9846-cc2f713dca42','Walenca','Player-5','F',5,'1e8e1b0f-13d9-11e9-9846-cc2f713dca42',8,'5f893076-13d8-11e9-9846-cc2f713dca42'),('19d29c1b-13da-11e9-9846-cc2f713dca42','Nikia','Player-8','F/C',8,'1e8e1b0f-13d9-11e9-9846-cc2f713dca42',7,'5f893076-13d8-11e9-9846-cc2f713dca42'),('19d29c53-13da-11e9-9846-cc2f713dca42','Paris','Player-10','SG',10,'1e8e1b0f-13d9-11e9-9846-cc2f713dca42',7,'5f893076-13d8-11e9-9846-cc2f713dca42'),('19d29c8f-13da-11e9-9846-cc2f713dca42','Ava','Player-14','C/F',14,'1e8e1b0f-13d9-11e9-9846-cc2f713dca42',7,'5f893076-13d8-11e9-9846-cc2f713dca42'),('19d29d74-13da-11e9-9846-cc2f713dca42','Jenna','Player-15','F/C',15,'1e8e1b0f-13d9-11e9-9846-cc2f713dca42',7,'5f893076-13d8-11e9-9846-cc2f713dca42'),('19d29da9-13da-11e9-9846-cc2f713dca42','Maya','Player-17','PG/F',17,'1e8e1b0f-13d9-11e9-9846-cc2f713dca42',7,'5f893076-13d8-11e9-9846-cc2f713dca42'),('19d29de1-13da-11e9-9846-cc2f713dca42','Rohanna','Player-23','PG/SG',23,'1e8e1b0f-13d9-11e9-9846-cc2f713dca42',8,'5f893076-13d8-11e9-9846-cc2f713dca42'),('19d29e1a-13da-11e9-9846-cc2f713dca42','Savannah','Player-25','F/C',25,'1e8e1b0f-13d9-11e9-9846-cc2f713dca42',7,'5f893076-13d8-11e9-9846-cc2f713dca42');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school` (
  `id` char(36) NOT NULL,
  `school` varchar(50) NOT NULL,
  `short` varchar(30) DEFAULT NULL,
  `abbr` varchar(5) DEFAULT NULL,
  `mascot` varchar(30) NOT NULL,
  `street` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `st` char(2) NOT NULL DEFAULT 'CA',
  `zip` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` VALUES ('1e8e1b0f-13d9-11e9-9846-cc2f713dca42','Natomas Charter School Leading Edge Academy','Natomas Charter','NCSLE','Lady Knights','4600 Blackrock Drive','Sacramento','CA','95835'),('1e8e278d-13d9-11e9-9846-cc2f713dca42','Capital Christian Middle School','Capital Christian','CCMS','Cougars','9470 Micron Ave.','Sacramento','CA','95827'),('1e8e2836-13d9-11e9-9846-cc2f713dca42','Mills Middle School Stem Academy','Mills','MMSA','Mustangs','10439 Coloma Rd.','Rancho Cordova','CA','95670'),('1e8e2888-13d9-11e9-9846-cc2f713dca42','W. E. Mitchell Middle School','Mitchell','WEMMS','Marauders','2100 Zinfandel Dr.','Rancho Cordova','CA','95670'),('1e8e28cb-13d9-11e9-9846-cc2f713dca42','Bradshaw Christian Middle School','Bradshaw Christian','BCMS','Pride','8324 Bradshaw Rd.','Sacrmento','CA','95829');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statline`
--

DROP TABLE IF EXISTS `statline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statline` (
  `id` char(36) NOT NULL,
  `player` char(36) NOT NULL,
  `game` char(36) NOT NULL,
  `minutes` float(4,2) DEFAULT NULL,
  `rebounds` int(11) DEFAULT NULL,
  `off_rebounds` int(11) DEFAULT NULL,
  `fga` int(11) DEFAULT NULL,
  `fgm` int(11) DEFAULT NULL,
  `fta` int(11) DEFAULT NULL,
  `ftm` int(11) DEFAULT NULL,
  `steals` int(11) DEFAULT NULL,
  `assists` int(11) DEFAULT NULL,
  `turnovers` int(11) DEFAULT NULL,
  `tpa` int(11) DEFAULT NULL,
  `tpm` int(11) DEFAULT NULL,
  `inactive` tinyint(4) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '1',
  `createdby` varchar(40) NOT NULL,
  `createddate` datetime NOT NULL,
  `modifiedby` varchar(40) DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statline`
--

LOCK TABLES `statline` WRITE;
/*!40000 ALTER TABLE `statline` DISABLE KEYS */;
/*!40000 ALTER TABLE `statline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats` (
  `id` char(36) NOT NULL,
  `game` char(36) NOT NULL,
  `player` char(36) NOT NULL,
  `fga` int(11) DEFAULT NULL,
  `fgm` int(11) DEFAULT NULL,
  `tpa` int(11) DEFAULT NULL,
  `tpm` int(11) DEFAULT NULL,
  `fta` int(11) DEFAULT NULL,
  `ftm` int(11) DEFAULT NULL,
  `offrebound` int(11) DEFAULT NULL,
  `defrebound` int(11) DEFAULT NULL,
  `assist` int(11) DEFAULT NULL,
  `block` int(11) DEFAULT NULL,
  `steal` int(11) DEFAULT NULL,
  `tips` int(11) DEFAULT NULL,
  `drawncharges` int(11) DEFAULT NULL,
  `turnovers` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats`
--

LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
INSERT INTO `stats` VALUES ('02e09d6f-13dd-11e9-9846-cc2f713dca42','c4df0baf-13da-11e9-9846-cc2f713dca42','19d28b85-13da-11e9-9846-cc2f713dca42',5,0,0,0,0,0,0,2,0,0,4,1,0,1),('02e0a91a-13dd-11e9-9846-cc2f713dca42','c4df0baf-13da-11e9-9846-cc2f713dca42','19d29b52-13da-11e9-9846-cc2f713dca42',6,1,0,0,0,0,0,2,0,0,9,5,0,4),('02e0aa06-13dd-11e9-9846-cc2f713dca42','c4df0baf-13da-11e9-9846-cc2f713dca42','19d29c1b-13da-11e9-9846-cc2f713dca42',0,0,0,0,0,0,0,2,0,0,4,1,0,2),('02e0aa57-13dd-11e9-9846-cc2f713dca42','c4df0baf-13da-11e9-9846-cc2f713dca42','19d29c53-13da-11e9-9846-cc2f713dca42',6,0,0,0,2,0,0,1,9,1,6,9,0,6),('02e0aaa1-13dd-11e9-9846-cc2f713dca42','c4df0baf-13da-11e9-9846-cc2f713dca42','19d29c8f-13da-11e9-9846-cc2f713dca42',9,3,0,0,2,0,1,5,5,13,9,1,0,1),('02e0ab24-13dd-11e9-9846-cc2f713dca42','c4df0baf-13da-11e9-9846-cc2f713dca42','19d29d74-13da-11e9-9846-cc2f713dca42',4,0,0,0,0,0,0,4,1,10,6,1,0,4),('02e0abdb-13dd-11e9-9846-cc2f713dca42','c4df0baf-13da-11e9-9846-cc2f713dca42','19d29da9-13da-11e9-9846-cc2f713dca42',5,0,3,1,1,0,1,6,8,3,3,5,0,6),('02e0ac22-13dd-11e9-9846-cc2f713dca42','c4df0baf-13da-11e9-9846-cc2f713dca42','19d29de1-13da-11e9-9846-cc2f713dca42',0,0,5,3,0,0,1,1,1,0,2,6,0,0),('02e0ac73-13dd-11e9-9846-cc2f713dca42','c4df0baf-13da-11e9-9846-cc2f713dca42','19d29e1a-13da-11e9-9846-cc2f713dca42',0,0,0,0,0,0,2,2,4,8,1,2,0,0),('c9353755-13e0-11e9-9846-cc2f713dca42','ce787d1a-13de-11e9-9846-cc2f713dca42','19d28b85-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9366cb3-13e0-11e9-9846-cc2f713dca42','ce787d1a-13de-11e9-9846-cc2f713dca42','19d29b52-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9366e92-13e0-11e9-9846-cc2f713dca42','ce787d1a-13de-11e9-9846-cc2f713dca42','19d29c1b-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9366f2a-13e0-11e9-9846-cc2f713dca42','ce787d1a-13de-11e9-9846-cc2f713dca42','19d29c53-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9366f6d-13e0-11e9-9846-cc2f713dca42','ce787d1a-13de-11e9-9846-cc2f713dca42','19d29c8f-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9366fb0-13e0-11e9-9846-cc2f713dca42','ce787d1a-13de-11e9-9846-cc2f713dca42','19d29d74-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9366fec-13e0-11e9-9846-cc2f713dca42','ce787d1a-13de-11e9-9846-cc2f713dca42','19d29da9-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367028-13e0-11e9-9846-cc2f713dca42','ce787d1a-13de-11e9-9846-cc2f713dca42','19d29de1-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367067-13e0-11e9-9846-cc2f713dca42','ce787d1a-13de-11e9-9846-cc2f713dca42','19d29e1a-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c93670a0-13e0-11e9-9846-cc2f713dca42','ce79b013-13de-11e9-9846-cc2f713dca42','19d28b85-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c93670e3-13e0-11e9-9846-cc2f713dca42','ce79b013-13de-11e9-9846-cc2f713dca42','19d29b52-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367122-13e0-11e9-9846-cc2f713dca42','ce79b013-13de-11e9-9846-cc2f713dca42','19d29c1b-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367162-13e0-11e9-9846-cc2f713dca42','ce79b013-13de-11e9-9846-cc2f713dca42','19d29c53-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c936719d-13e0-11e9-9846-cc2f713dca42','ce79b013-13de-11e9-9846-cc2f713dca42','19d29c8f-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c93671d9-13e0-11e9-9846-cc2f713dca42','ce79b013-13de-11e9-9846-cc2f713dca42','19d29d74-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367266-13e0-11e9-9846-cc2f713dca42','ce79b013-13de-11e9-9846-cc2f713dca42','19d29da9-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367294-13e0-11e9-9846-cc2f713dca42','ce79b013-13de-11e9-9846-cc2f713dca42','19d29de1-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c93672bf-13e0-11e9-9846-cc2f713dca42','ce79b013-13de-11e9-9846-cc2f713dca42','19d29e1a-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c93673c0-13e0-11e9-9846-cc2f713dca42','ce79b258-13de-11e9-9846-cc2f713dca42','19d28b85-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c93673ee-13e0-11e9-9846-cc2f713dca42','ce79b258-13de-11e9-9846-cc2f713dca42','19d29b52-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c936742d-13e0-11e9-9846-cc2f713dca42','ce79b258-13de-11e9-9846-cc2f713dca42','19d29c1b-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367458-13e0-11e9-9846-cc2f713dca42','ce79b258-13de-11e9-9846-cc2f713dca42','19d29c53-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367482-13e0-11e9-9846-cc2f713dca42','ce79b258-13de-11e9-9846-cc2f713dca42','19d29c8f-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c93674a9-13e0-11e9-9846-cc2f713dca42','ce79b258-13de-11e9-9846-cc2f713dca42','19d29d74-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c93674d3-13e0-11e9-9846-cc2f713dca42','ce79b258-13de-11e9-9846-cc2f713dca42','19d29da9-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c93674fd-13e0-11e9-9846-cc2f713dca42','ce79b258-13de-11e9-9846-cc2f713dca42','19d29de1-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c936752b-13e0-11e9-9846-cc2f713dca42','ce79b258-13de-11e9-9846-cc2f713dca42','19d29e1a-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367559-13e0-11e9-9846-cc2f713dca42','ce79b2bb-13de-11e9-9846-cc2f713dca42','19d28b85-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367583-13e0-11e9-9846-cc2f713dca42','ce79b2bb-13de-11e9-9846-cc2f713dca42','19d29b52-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c93675b1-13e0-11e9-9846-cc2f713dca42','ce79b2bb-13de-11e9-9846-cc2f713dca42','19d29c1b-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c93675df-13e0-11e9-9846-cc2f713dca42','ce79b2bb-13de-11e9-9846-cc2f713dca42','19d29c53-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c936760d-13e0-11e9-9846-cc2f713dca42','ce79b2bb-13de-11e9-9846-cc2f713dca42','19d29c8f-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367637-13e0-11e9-9846-cc2f713dca42','ce79b2bb-13de-11e9-9846-cc2f713dca42','19d29d74-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367665-13e0-11e9-9846-cc2f713dca42','ce79b2bb-13de-11e9-9846-cc2f713dca42','19d29da9-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c936768f-13e0-11e9-9846-cc2f713dca42','ce79b2bb-13de-11e9-9846-cc2f713dca42','19d29de1-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c93676c4-13e0-11e9-9846-cc2f713dca42','ce79b2bb-13de-11e9-9846-cc2f713dca42','19d29e1a-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c93676f2-13e0-11e9-9846-cc2f713dca42','ce79b30c-13de-11e9-9846-cc2f713dca42','19d28b85-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367720-13e0-11e9-9846-cc2f713dca42','ce79b30c-13de-11e9-9846-cc2f713dca42','19d29b52-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c936774e-13e0-11e9-9846-cc2f713dca42','ce79b30c-13de-11e9-9846-cc2f713dca42','19d29c1b-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c936777c-13e0-11e9-9846-cc2f713dca42','ce79b30c-13de-11e9-9846-cc2f713dca42','19d29c53-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c93677ad-13e0-11e9-9846-cc2f713dca42','ce79b30c-13de-11e9-9846-cc2f713dca42','19d29c8f-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c93677db-13e0-11e9-9846-cc2f713dca42','ce79b30c-13de-11e9-9846-cc2f713dca42','19d29d74-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367805-13e0-11e9-9846-cc2f713dca42','ce79b30c-13de-11e9-9846-cc2f713dca42','19d29da9-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c936782c-13e0-11e9-9846-cc2f713dca42','ce79b30c-13de-11e9-9846-cc2f713dca42','19d29de1-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367853-13e0-11e9-9846-cc2f713dca42','ce79b30c-13de-11e9-9846-cc2f713dca42','19d29e1a-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367881-13e0-11e9-9846-cc2f713dca42','ce79b38f-13de-11e9-9846-cc2f713dca42','19d28b85-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c93678ab-13e0-11e9-9846-cc2f713dca42','ce79b38f-13de-11e9-9846-cc2f713dca42','19d29b52-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c93678f5-13e0-11e9-9846-cc2f713dca42','ce79b38f-13de-11e9-9846-cc2f713dca42','19d29c1b-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c93679a9-13e0-11e9-9846-cc2f713dca42','ce79b38f-13de-11e9-9846-cc2f713dca42','19d29c53-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c93679de-13e0-11e9-9846-cc2f713dca42','ce79b38f-13de-11e9-9846-cc2f713dca42','19d29c8f-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367a08-13e0-11e9-9846-cc2f713dca42','ce79b38f-13de-11e9-9846-cc2f713dca42','19d29d74-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367a36-13e0-11e9-9846-cc2f713dca42','ce79b38f-13de-11e9-9846-cc2f713dca42','19d29da9-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367a87-13e0-11e9-9846-cc2f713dca42','ce79b38f-13de-11e9-9846-cc2f713dca42','19d29de1-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367ab5-13e0-11e9-9846-cc2f713dca42','ce79b38f-13de-11e9-9846-cc2f713dca42','19d29e1a-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367adf-13e0-11e9-9846-cc2f713dca42','ce79b3dc-13de-11e9-9846-cc2f713dca42','19d28b85-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367b09-13e0-11e9-9846-cc2f713dca42','ce79b3dc-13de-11e9-9846-cc2f713dca42','19d29b52-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367b34-13e0-11e9-9846-cc2f713dca42','ce79b3dc-13de-11e9-9846-cc2f713dca42','19d29c1b-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367b5e-13e0-11e9-9846-cc2f713dca42','ce79b3dc-13de-11e9-9846-cc2f713dca42','19d29c53-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367b8c-13e0-11e9-9846-cc2f713dca42','ce79b3dc-13de-11e9-9846-cc2f713dca42','19d29c8f-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367bbd-13e0-11e9-9846-cc2f713dca42','ce79b3dc-13de-11e9-9846-cc2f713dca42','19d29d74-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367beb-13e0-11e9-9846-cc2f713dca42','ce79b3dc-13de-11e9-9846-cc2f713dca42','19d29da9-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367c15-13e0-11e9-9846-cc2f713dca42','ce79b3dc-13de-11e9-9846-cc2f713dca42','19d29de1-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c9367c47-13e0-11e9-9846-cc2f713dca42','ce79b3dc-13de-11e9-9846-cc2f713dca42','19d29e1a-13da-11e9-9846-cc2f713dca42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bball'
--
/*!50003 DROP FUNCTION IF EXISTS `findTeamIdByMascot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `findTeamIdByMascot`(p_mascot VARCHAR(20)) RETURNS char(36) CHARSET utf8
    DETERMINISTIC
BEGIN
DECLARE cId CHAR(36);
SELECT id INTO cId
FROM school
WHERE mascot = p_mascot;
RETURN cId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `decrementCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `decrementCount`(in p_statLineId char(36), in p_stat varchar(20))
begin
if p_stat = 'fga' then
update stats
set fga = (fga - 1)
where id = p_statLineId;
else
if p_stat = 'fgm' then
update stats
set fga = (fga - 1), fgm = (fgm -1)
where id = p_statLineId;
else
if p_stat = 'tpa' then
update stats
set tpa = (tpa - 1)
where id = p_statLineId;
else
if p_stat = 'tpm' then
update stats
set tpa = (tpa - 1), tpm = (tpm - 1)
where id = p_statLineId;
else
if p_stat = 'fta' then
update stats
set fta = (fta - 1)
where id = p_statLineId;
else
if p_stat = 'ftm' then
update stats
set fta = (fta - 1), ftm = (ftm - 1)
where id = p_statLineId;
else
if p_stat = 'offrebound' then
update stats
set offrebound = (offrebound - 1)
where id = p_statLineId;
else
if p_stat = 'defrebound' then
update stats
set defrebound = (defrebound - 1)
where id = p_statLineId;
else
if p_stat = 'assist' then
update stats
set assist = (assist - 1)
where id = p_statLineId;
else
if p_stat = 'block' then
update stats
set block = (block - 1)
where id = p_statLineId;
else
if p_stat = 'steal' then
update stats
set steal = (steal - 1)
where id = p_statLineId;
else
if p_stat = 'tips' then
update stats
set tips = (tips - 1)
where id = p_statLineId;
else
if p_stat = 'drawncharges' then
update stats
set drawnCharges = (drawnCharges - 1)
where id = p_statLineId;
else
if p_stat = 'turnovers' then
update stats
set turnovers = (turnovers - 1)
where id = p_statLineId;
end if;end if;end if;end if;end if;end if;end if;end if;end if;end if;end if;end if;end if;end if;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `defBoard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `defBoard`(in p_statLineId char(36))
begin
update stats
set defrebound = (defrebound + 1)
where id = p_statLineId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `defended` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `defended`(in p_statLineId char(36))
begin
update stats
set tips = (tips + 1)
where id = p_statLineId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dime`(in p_statLineId char(36))
begin
update stats
set assist = (assist + 1)
where id = p_statLineId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `drawCharge` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `drawCharge`(in p_statLineId char(36))
begin
update stats
set drawnCharges = (drawnCharges + 1)
where id = p_statLineId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getGameStats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getGameStats`(in p_gameId char(36))
begin
select s.id,
p.firstname, 
p.uniform,
s.fga,
s.fgm,
s.tpa,
s.tpm,
s.fta,
s.ftm,
s.offrebound,
s.defrebound,
s.assist,
s.block,
s.steal,
s.tips,
s.drawncharges,
s.turnovers
from stats s inner join player p on s.player = p.id
where s.game = p_gameId
order by p.uniform;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getStatsLine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getStatsLine`(in p_statId char(36))
begin
select s.id,
p.firstname,
p.uniform,
s.fga,
s.fgm,
s.tpa,
s.tpm,
s.fta,
s.ftm,
s.offrebound,
s.defrebound,
s.assist,
s.block,
s.steal,
s.tips,
s.drawncharges,
s.turnovers
from stats s inner join player p on s.player = p.id
where s.id = p_statId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getVarsityGames` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getVarsityGames`()
begin
select g.id as id, v.short as away, h.short as home, g.day as date 
from game g inner join school v on g.away = v.id
inner join school h on g.home = h.id
order by g.day;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertLevel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertLevel`(
IN `p_level` VARCHAR(36),
IN `p_year` INT)
BEGIN
INSERT INTO `level`(`id`,`level`,`year`,`inactive`,`version`,`createdby`,`createddate`)
VALUES (`uuid`(),`p_level`,`p_year`,0,1,USER(),NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertPlayer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertPlayer`(
IN `p_firstname` VARCHAR(20),
IN `p_lastname` VARCHAR(20),
IN `p_position` VARCHAR(5),
IN `p_team` CHAR(36),
IN `p_level` CHAR(36),
IN `p_uniform` INT)
BEGIN
DECLARE teamId CHAR(36);
SET teamId = findTeamIdByMascot(p_team);
INSERT INTO `player`(`id`,`firstname`,`lastname`,`position`,`team`,`level`,`uniform`,`inactive`,`version`,`createdby`,`createddate`)
VALUES (`uuid`(),`p_firstname`,`p_lastname`,`p_position`,`teamId`,`p_level`,`p_uniform`,0,1,USER(),NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertSchool` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSchool`(
IN `p_school` VARCHAR(50), 
IN `p_street` VARCHAR(40), 
IN `p_city` VARCHAR(30), 
IN `p_state` VARCHAR(2), 
IN `p_zip` VARCHAR(5))
BEGIN
INSERT INTO `school`(`id`,`school`,`street`,`city`,`state`,`zip`,`inactive`,`version`,`createdby`,`createddate`)
VALUES(uuid(),`p_school`,`p_street`,`p_city`,`p_state`,`p_zip`,0,1,USER(),NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `madeFreeThrow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `madeFreeThrow`(in p_statLineId char(36))
begin
update stats
set fta = (fta + 1),
ftm = (ftm + 1)
where id = p_statLineId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `madeShot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `madeShot`(in p_statLineId char(36))
begin
update stats
set fga = (fga + 1),
fgm = (fgm + 1)
where id = p_statLineId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `madeTre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `madeTre`(in p_statLineId char(36))
begin
update stats
set tpa = (tpa + 1),
tpm = (tpm + 1)
where id = p_statLineId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `missedFreeThrow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `missedFreeThrow`(in p_statLineId char(36))
begin
update stats
set fta = (fta + 1)
where id = p_statLineId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `missedShot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `missedShot`(in p_statLineId char(36))
begin
update stats 
set fga = (fga + 1)
where id = p_statLineId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `missedTre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `missedTre`(in p_statLineId char(36))
begin 
update stats
set tpa = (tpa + 1)
where id = p_statLineId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `noNo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `noNo`(in p_statLineId char(36))
begin
update stats
set turnovers = (turnovers + 1)
where id = p_statLineId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `offBoard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `offBoard`(in p_statLineId char(36))
begin
update stats
set offrebound = (offrebound + 1)
where id = p_statLineId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pick` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pick`(in p_statLineId char(36))
begin
update stats
set steal = (steal + 1)
where id = p_statLineId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `swat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `swat`(in p_statLineId char(36))
begin
update stats
set block = (block + 1)
where id = p_statLineId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-10 12:58:24
