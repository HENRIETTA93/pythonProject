CREATE DATABASE  IF NOT EXISTS `treasurehunters` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `treasurehunters`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: treasurehunters
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
-- Table structure for table `badge`
--

DROP TABLE IF EXISTS `badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badge` (
  `badgeID` int(11) NOT NULL AUTO_INCREMENT,
  `badgeName` varchar(20) DEFAULT NULL,
  `badgeDescription` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`badgeID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badge`
--

LOCK TABLES `badge` WRITE;
/*!40000 ALTER TABLE `badge` DISABLE KEYS */;
INSERT INTO `badge` VALUES (1,'Welcome','This is your first badge!'),(2,'Beacon','Congrats on finding your first beacon!'),(3,'Treasure','Congrats on your first treasure!'),(4,'100Treasures','You\'ve found 100 treasures!'),(5,'500Treasures','You\'ve found 500 treasures!'),(6,'5000Treasures','You\'ve found 5000 treasures!'),(7,'BoyScout','Keep on truck\'in!'),(8,'RealmKnight','Knight of the Realm and Saviour of the Meek!'),(9,'TimeTraveller','Man from Gallifrey! Who?'),(10,'PowerRanger','Mighty Morphin Treasure Hunter!'),(11,'Knightmare','Master of the night!'),(12,'BlackBeard','Argh! I be Black Beard! Where be my booty?'),(13,'CaptainSponge','Life\'s true treasure is having fun!'),(14,'PeepingTom','Sneakiest sneak of sneakington'),(15,'AdvanceTreasureFair','Congrats on finishing your first Advanced Quest!'),(16,'HowCute','You\'ve completed your first mini quest!'),(17,'Meow','The cats out of the bag!');
/*!40000 ALTER TABLE `badge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phonenumber`
--

DROP TABLE IF EXISTS `phonenumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phonenumber` (
  `username` varchar(30) NOT NULL,
  `phoneNumber` char(10) NOT NULL,
  PRIMARY KEY (`username`,`phoneNumber`),
  CONSTRAINT `phonenumber_ibfk_1` FOREIGN KEY (`username`) REFERENCES `player` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phonenumber`
--

LOCK TABLES `phonenumber` WRITE;
/*!40000 ALTER TABLE `phonenumber` DISABLE KEYS */;
INSERT INTO `phonenumber` VALUES ('banana95','3698521478'),('chickenNeck','0145232147'),('chickenNeck','0412354789'),('chickenNeck','0425647895'),('drwho','0458987896'),('frankie','0400123977'),('frankie','0733405211'),('haxman','2587487456'),('jeffas','0485778991'),('jerry','0400123456'),('jojo','0456789012'),('jojo','0466111222'),('jojo123','3725896523'),('ml','5554785471'),('namasaya','2314528974'),('nikki','0215154878'),('twowong','3802545411');
/*!40000 ALTER TABLE `phonenumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `username` varchar(30) NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `gender` enum('Female','Male','Other','Prefer not to disclose') DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(320) NOT NULL,
  `streetNumber` varchar(15) DEFAULT NULL,
  `streetName` varchar(30) DEFAULT NULL,
  `suburb` varchar(45) DEFAULT NULL,
  `state` enum('QLD','SA','VIC','NSW','TAS','WA','NT','ACT') DEFAULT NULL,
  `postcode` char(4) DEFAULT NULL,
  `creationDateTime` datetime NOT NULL,
  `totalPoints` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES ('banana95','Alanna','Davidson','Female','1995-05-14','banana95@gmail.com','587','Gumby Road','Sunnybank Hills','QLD','4109','2017-03-14 21:45:38',615),('chickenNeck','Graham','Marshall','Male','1995-10-25','chickenoregg@gmail.com','53','Thugsta Drive','Helensvale','QLD','4212','2017-09-07 17:00:44',50),('drwho','Doctor','Who','Male','1800-01-01','tardis@whoville.com','1','PhoneBooth','Mount Gravatt East','QLD','4122','2017-05-09 11:00:05',520),('frankie','Frank','Terry','Male','1999-03-12','hellofrankie@gmail.com','1800','Zelda Street','Linkburb','QLD','4000','2017-09-06 07:00:05',10),('haxman','Allisandra','Zanita','Female','1972-08-11','haxinator@outlook.com','78','O\'Grady Street','Upper Mount Gravatt','QLD','4122','2017-05-15 14:36:05',15),('jeffas','Jeffrey','Davidson','Male','1987-12-04','spanky4321@gmail.com','31/50','Ronker Road','Woolloongabba','QLD','4053','2017-10-17 12:00:44',311),('jerry','Jerry','Seinfield','Other','1967-12-04','jezza@hotmail.com','3/5999','Elanor Road','Wishart','QLD','4122','2017-09-07 18:00:44',50),('jojo','Joanne','Kay','Prefer not to disclose','2000-08-02','joanne.kay@qut.edu.au','7','Latrobe Tce','Docklands','VIC','2000','2017-09-06 07:00:05',20),('jojo123','Jessica','Kanikian','Female','1998-11-21','jessica.kanikian@connect.qut.edu.au','17','Main Street','Upper Mount Gravatt','QLD','4122','2017-08-04 13:00:00',20),('ml','Tsai','MengLung','Male','1990-03-02','melt@gmail.com','341','Main Street','Mount Gravatt','QLD','4122','2017-09-06 07:00:05',420),('namasaya','Sietta','Stonebert','Female','1989-03-05','namasaya1989@yahoo.com','21-29','Farris Street','Mount Gravatt','QLD','4122','2017-09-06 07:00:05',220),('nikki','Nikki','Storm','Female','1989-08-11','faceofthestorminator@outlook.com','1007','National Circuit','Barton','ACT','2600','2017-09-09 14:36:05',80),('twowong','Jason','Wong','Male','1989-11-15','twowongoneright@hotmail.com','124','Seetan Street','Sunnybank Hills','QLD','4109','2017-09-09 14:36:05',380);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerprogress`
--

DROP TABLE IF EXISTS `playerprogress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playerprogress` (
  `questID` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `progress` enum('active','complete','inactive') DEFAULT NULL,
  PRIMARY KEY (`questID`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `playerprogressquestID` FOREIGN KEY (`questID`) REFERENCES `quest` (`questID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `player` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerprogress`
--

LOCK TABLES `playerprogress` WRITE;
/*!40000 ALTER TABLE `playerprogress` DISABLE KEYS */;
INSERT INTO `playerprogress` VALUES (1,'banana95','complete'),(1,'chickenNeck','complete'),(1,'drwho','active'),(1,'frankie','inactive'),(1,'haxman','active'),(1,'jerry','active'),(1,'jojo','complete'),(1,'jojo123','complete'),(1,'namasaya','complete'),(1,'nikki','complete'),(1,'twowong','complete'),(2,'banana95','complete'),(2,'drwho','active'),(2,'frankie','active'),(2,'jeffas','complete'),(2,'jerry','inactive'),(2,'ml','inactive'),(2,'nikki','complete'),(3,'banana95','complete'),(3,'drwho','complete'),(3,'frankie','active'),(4,'banana95','active'),(4,'jerry','inactive'),(5,'jerry','active'),(6,'jojo','complete'),(7,'banana95','complete'),(7,'nikki','complete'),(8,'frankie','active'),(9,'banana95','inactive'),(9,'jerry','inactive'),(9,'nikki','complete'),(11,'banana95','complete'),(11,'frankie','inactive'),(12,'jeffas','inactive');
/*!40000 ALTER TABLE `playerprogress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playertreasure`
--

DROP TABLE IF EXISTS `playertreasure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playertreasure` (
  `username` varchar(30) NOT NULL,
  `treasureID` int(11) NOT NULL,
  PRIMARY KEY (`username`,`treasureID`),
  KEY `treasureID_idx` (`treasureID`),
  CONSTRAINT `treasureID` FOREIGN KEY (`treasureID`) REFERENCES `treasure` (`treasureID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usernametreasure` FOREIGN KEY (`username`) REFERENCES `player` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playertreasure`
--

LOCK TABLES `playertreasure` WRITE;
/*!40000 ALTER TABLE `playertreasure` DISABLE KEYS */;
INSERT INTO `playertreasure` VALUES ('banana95',1),('frankie',1),('jerry',1),('banana95',2),('frankie',2),('jerry',2),('banana95',3),('chickenNeck',3),('frankie',3),('jeffas',4),('jojo',4),('nikki',4),('chickenNeck',5),('chickenNeck',6),('drwho',6),('haxman',8),('jojo',14),('jeffas',15),('jojo123',15),('twowong',15),('namasaya',23),('ml',27);
/*!40000 ALTER TABLE `playertreasure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase` (
  `purchaseID` int(11) NOT NULL AUTO_INCREMENT,
  `storeID` int(11) NOT NULL,
  `badgeID` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `cost` int(11) NOT NULL,
  `purchaseDateTime` datetime NOT NULL,
  PRIMARY KEY (`purchaseID`),
  KEY `store_idx` (`storeID`),
  KEY `badge_idx` (`badgeID`),
  KEY `usernamepurchase_idx` (`username`),
  CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`badgeID`) REFERENCES `badge` (`badgeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`storeID`) REFERENCES `store` (`storeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `purchase_ibfk_3` FOREIGN KEY (`username`) REFERENCES `player` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (1,1,1,'frankie',0,'2017-09-10 03:05:00'),(2,1,2,'nikki',20,'2017-09-12 12:35:00'),(3,5,1,'jerry',0,'2017-09-15 07:25:00'),(4,3,4,'jerry',2,'2017-09-15 07:25:00'),(5,1,1,'banana95',0,'2017-05-12 07:24:00'),(6,13,4,'banana95',0,'2017-09-15 07:24:00'),(7,2,15,'banana95',34,'2017-09-15 08:24:00'),(8,2,17,'banana95',15,'2017-09-15 09:34:00'),(9,2,3,'banana95',0,'2017-06-15 13:42:00'),(10,6,12,'jeffas',21,'2017-09-15 07:28:00');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quest`
--

DROP TABLE IF EXISTS `quest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quest` (
  `questID` int(11) NOT NULL AUTO_INCREMENT,
  `questName` varchar(45) DEFAULT NULL,
  `beacon` varchar(45) DEFAULT NULL,
  `story` text,
  `advanceQuestID` int(11) DEFAULT NULL,
  PRIMARY KEY (`questID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quest`
--

LOCK TABLES `quest` WRITE;
/*!40000 ALTER TABLE `quest` DISABLE KEYS */;
INSERT INTO `quest` VALUES (1,'Good Will','QUT Gardens Point Campus, Brisbane','Venture to the brown waters of mucky muck over a bridge of good will. Good luck!',NULL),(2,'Mini Good Will','Good Will Bridge, Brisbane','Gaze across the waters of mucky muck in search of a floating cat',1),(3,'South Bank','South Bank','Stumble upon the site of EXPO 88 and hunt its many treasures',NULL),(4,'Mini South Bank 1','Information Centre, South Bank','You\'re lost! Go in search of a map',3),(5,'Mini South Bank 2','Big Wheel, South Bank','The Wheel marks the Spot. Round and round and round...',3),(6,'Mini South Bank 3','Exhibition Centre, South Bank','There be a place of booths and booty a plenty. Find a magical machine selling golden vests of glory',3),(7,'Mini South Bank 4','QPAC, South Bank','Welcome, welcome, one and all. Find a man in a costume.',3),(8,'Surfing','Surfers Paradise Beach, Gold Coast','Argh me lad (or lady) we be headin to the sea! Buried below a sign of silver surf boards be the treasure we seek.',NULL),(9,'Dreamers','Dreamworld Entry, Gold Coast','Ick they be but plastic but the people of the dream world will pay precious gold for this booty',NULL),(10,'Seaworld Seal','Seaworld, Gold Coast','Splish splash, hunt the seal who be a show off.',NULL),(11,'Dump','Recycle Centre, Logan','Pooh-ey! What a dump!?! Mix with the Logans to find discarded treasure that shimmers',NULL),(12,'Valley','Fortitude Valley','Drunks and derelicts. Clubbers and bouncers. Seek the gates out of there.',NULL);
/*!40000 ALTER TABLE `quest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `storeID` int(11) NOT NULL AUTO_INCREMENT,
  `storeName` varchar(45) DEFAULT NULL,
  `openTime` time DEFAULT NULL,
  `closeTime` time DEFAULT NULL,
  PRIMARY KEY (`storeID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'Farmer Joes','08:00:00','16:00:00'),(2,'All traders','01:00:00','23:00:00'),(3,'24/7','00:01:00','23:59:00'),(4,'Farmer Joes','08:00:00','16:00:00'),(5,'Banana Pants','01:30:00','23:30:00'),(6,'FaceyFacey','15:00:00','23:59:00'),(7,'Black Death','21:00:00','23:00:00'),(8,'Phone Booth','00:10:00','23:10:00'),(9,'Pineapple under the sea','00:01:00','23:59:00'),(10,'Yo Mumma\'s House','08:00:00','16:00:00'),(11,'Weapon\'s Mart','01:00:00','23:00:00'),(12,'Bag it up Shoppy','00:01:00','23:59:00'),(13,'Kangaroo-la-lu','06:00:00','11:00:00');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treasure`
--

DROP TABLE IF EXISTS `treasure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treasure` (
  `treasureID` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `points` int(11) NOT NULL DEFAULT '0',
  `webpage` varchar(100) NOT NULL,
  `questID` int(11) DEFAULT NULL,
  `type` enum('common','rare','ultra-rare','elite','uncommon') DEFAULT NULL,
  PRIMARY KEY (`treasureID`),
  KEY `questID` (`questID`),
  CONSTRAINT `questID` FOREIGN KEY (`questID`) REFERENCES `quest` (`questID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treasure`
--

LOCK TABLES `treasure` WRITE;
/*!40000 ALTER TABLE `treasure` DISABLE KEYS */;
INSERT INTO `treasure` VALUES (1,'Pebble',10,'www.rocky.com',1,'common'),(2,'City Cat',15,'www.meow.com.au',1,'ultra-rare'),(3,'Rainbow',30,'www.redandblueandgreenandpurple.com.au/qut',1,'elite'),(4,'Pidgeon',5,'https://qut.edu.au/treasurehunter',1,'common'),(5,'Gold medalleon',100,'https://treasurehunters.com/9998%$uios&#js',1,'uncommon'),(6,'Ibis',20,'https://www.test.com.au',1,'elite'),(7,'Dirty dish rag',5,'www.howdirty.com',11,'common'),(8,'Rusty bike',5,'www.howrusty.com',11,'common'),(9,'Southbank Map',10,'www.directionsatlast.com',2,'common'),(10,'Brisbane Map',15,'www.directionstocity',2,'ultra-rare'),(11,'Gold Coast Map',30,'www.waveymap.com',2,'elite'),(12,'Star Fish',25,'www.pointyfish.com',10,'common'),(13,'Only 1 exists!',100,'https://treasurehunters.com/9998%$uios&#js',1,'uncommon'),(14,'Sea cucumber',150,'https://www.test.com.au',10,'elite'),(15,'Cigarette Butt',5,'www.ewwwwhowdirty.com',12,'common'),(16,'Bouncer',65,'www.youhaveguts.com',12,'rare'),(17,'Red lego brick',10,'www.lego.com/red',9,'common'),(18,'Blue lego brick',10,'www.lego.com/blue',9,'common'),(19,'Green lego brick',10,'www.lego.com/green',9,'common'),(20,'Lego House',20,'www.lego.com/house',9,'rare'),(21,'Lego Batman',100,'www.lego.com/batman',9,'ultra-rare'),(22,'Seal',20,'www.splishsplash.me',10,'uncommon'),(23,'Stage',22,'www.encore.com',7,'uncommon'),(24,'Life Line Book Fest Sign',200,'www.howrusty.com',6,'ultra-rare'),(25,'Brisbane Sign',30,'www.hellobrisbane.com',3,'uncommon'),(26,'Big Wheel Ticket',300,'www.nooneridesthewheel.com',5,'ultra-rare'),(27,'Surfboard',40,'www.waverider.com',8,'uncommon');
/*!40000 ALTER TABLE `treasure` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-09 19:43:15
