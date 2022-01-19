-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: school
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `CourseNo` varchar(20) NOT NULL,
  `CrsDesc` varchar(100) DEFAULT NULL,
  `CrsUnits` int DEFAULT NULL,
  PRIMARY KEY (`CourseNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('FIN300','FUNDAMENTALS OF FINANCE',4),('FIN450','PRINCIPLES OF INVESTMENTS',4),('FIN480','CORPORATE FINANCE',4),('IS320','FUNDAMENTALS OF BUSINESS PROGRAMMING',4),('IS460','SYSTEMS ANALYSIS',4),('IS470','BUSINESS DATA COMMUNICATIONS',4),('IS480','FUNDAMENTALS OF DATABASE MANAGEMENT',4);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment` (
  `RegNo` int DEFAULT NULL,
  `OfferNo` int DEFAULT NULL,
  `EnrGrade` float DEFAULT NULL,
  KEY `fk_regno_enroll` (`RegNo`),
  KEY `fk_offerno_enroll` (`OfferNo`),
  CONSTRAINT `fk_offerno_enroll` FOREIGN KEY (`OfferNo`) REFERENCES `offering` (`OfferNo`),
  CONSTRAINT `fk_regno_enroll` FOREIGN KEY (`RegNo`) REFERENCES `registration` (`RegNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (1234,1234,3.2),(1236,1234,3.6),(1238,1234,3.2),(1240,4444,2.5),(1242,1234,3.8),(1244,4321,3.1),(1246,4444,2.9),(1248,4321,3.8),(1250,4321,3.2),(1252,4321,3.4),(1254,4321,3.1),(1256,4444,3.3),(1256,5678,3.4),(1258,5679,NULL),(1258,9876,NULL),(1260,5679,3.1),(1260,9876,3.3),(1262,5679,3.1),(1262,9876,3.5),(1264,5679,3.2),(1264,9876,2.9),(1266,5679,3.5),(1268,5679,3.5),(1268,9876,3.6),(1270,5679,3),(1272,5679,3.3),(1274,5679,3.4),(1274,9876,2.8);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `FacSSN` varchar(20) NOT NULL,
  `FacFirstName` varchar(20) DEFAULT NULL,
  `FacLastName` varchar(20) DEFAULT NULL,
  `FacCity` varchar(25) DEFAULT NULL,
  `FacState` char(2) DEFAULT NULL,
  `FacDept` varchar(10) DEFAULT NULL,
  `FacRank` varchar(20) DEFAULT NULL,
  `FacSalary` int DEFAULT NULL,
  `FacSupervisor` varchar(20) DEFAULT NULL,
  `FacHireDate` date DEFAULT NULL,
  `FacZipCode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`FacSSN`),
  KEY `fk_super_fac` (`FacSupervisor`),
  CONSTRAINT `fk_super_fac` FOREIGN KEY (`FacSupervisor`) REFERENCES `faculty` (`FacSSN`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES ('098765432','LEONARD','VINCE','SEATTLE','WA','MS','ASST',35000,'654321098','1995-04-10','981119921'),('543210987','VICTORIA','EMMANUEL','BOTHELL','WA','MS','PROF',120000,NULL,'1996-04-15','980112242'),('654321098','LEONARD','FIBON','SEATTLE','WA','MS','ASSC',70000,'543210987','1994-05-01','981210094'),('765432109','NICKI','MACON','BELLEVUE','WA','FIN','PROF',65000,NULL,'1997-04-11','980159945'),('876543210','CRISTOPHER','COLAN','SEATTLE','WA','MS','ASST',40000,'654321098','1999-03-01','981141332'),('987654321','JULIA','MILLS','SEATTLE','WA','FIN','ASSC',75000,'765432109','2000-03-15','981149954');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offering`
--

DROP TABLE IF EXISTS `offering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offering` (
  `OfferNo` int NOT NULL,
  `CourseNo` varchar(20) DEFAULT NULL,
  `OffTerm` varchar(20) DEFAULT NULL,
  `OffYear` int DEFAULT NULL,
  `OffLocation` varchar(20) DEFAULT NULL,
  `OffTime` varchar(20) DEFAULT NULL,
  `FacSSN` varchar(20) DEFAULT NULL,
  `OffDays` varchar(5) DEFAULT NULL,
  `OffLimit` int DEFAULT NULL,
  `OffNumEnrolled` int DEFAULT NULL,
  PRIMARY KEY (`OfferNo`),
  KEY `fk_facssn_offer` (`FacSSN`),
  KEY `fk_courseno_offer` (`CourseNo`),
  CONSTRAINT `fk_courseno_offer` FOREIGN KEY (`CourseNo`) REFERENCES `course` (`CourseNo`),
  CONSTRAINT `fk_facssn_offer` FOREIGN KEY (`FacSSN`) REFERENCES `faculty` (`FacSSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offering`
--

LOCK TABLES `offering` WRITE;
/*!40000 ALTER TABLE `offering` DISABLE KEYS */;
INSERT INTO `offering` VALUES (1111,'IS320','SUMMER',2006,'BLM302','10:30 AM',NULL,'MW',10,0),(1234,'IS320','FALL',2005,'BLM302','10:30 AM','098765432','MW',10,5),(2222,'IS460','SUMMER',2005,'BLM412','1:30 PM',NULL,'TTH',30,0),(3333,'IS320','SPRING',2006,'BLM214','8:30 AM','098765432','MW',20,0),(4321,'IS320','FALL',2005,'BLM214','3:30 PM','098765432','TTH',15,5),(4444,'IS320','WINTER',2006,'BLM302','3:30 PM','543210987','TTH',10,2),(5555,'FIN300','WINTER',2006,'BLM207','8:30 AM','765432109','MW',15,0),(5678,'IS480','WINTER',2006,'BLM302','10:30 AM','987654321','MW',20,1),(5679,'IS480','SPRING',2006,'BLM412','3:30 PM','876543210','TTH',10,9),(6666,'FIN450','WINTER',2006,'BLM212','10:30 AM','987654321','TTH',20,0),(7777,'FIN480','SPRING',2006,'BLM305','1:30 PM','765432109','MW',20,0),(8888,'IS320','SUMMER',2006,'BLM405','1:30 PM','654321098','MW',20,0),(9876,'IS460','SPRING',2006,'BLM307','1:30 PM','654321098','TTH',10,6);
/*!40000 ALTER TABLE `offering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration` (
  `RegNo` int NOT NULL,
  `StdSSN` varchar(20) DEFAULT NULL,
  `RegStatus` char(1) DEFAULT NULL,
  `RegDate` date DEFAULT NULL,
  `RegTerm` varchar(20) DEFAULT NULL,
  `RegYear` int DEFAULT NULL,
  PRIMARY KEY (`RegNo`),
  KEY `fk_stdssn_reg` (`StdSSN`),
  CONSTRAINT `fk_stdssn_reg` FOREIGN KEY (`StdSSN`) REFERENCES `student` (`StdSSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES (1234,'123456789','P','2005-03-29','Fall',2005),(1236,'234567890','P','2005-03-29','Fall',2005),(1238,'345678901','P','2005-03-29','Fall',2005),(1240,'678901234','P','2005-10-29','Winter',2006),(1242,'567890123','P','2005-03-29','Fall',2005),(1244,'678901234','P','2005-03-29','Fall',2006),(1246,'124567890','P','2005-10-29','Winter',2006),(1248,'789012345','P','2005-03-29','Fall',2005),(1250,'876543210','P','2005-03-29','Fall',2005),(1252,'890123456','P','2005-03-29','Fall',2005),(1254,'901234567','P','2005-03-29','Fall',2005),(1256,'123456789','F','2005-11-02','Winter',2006),(1258,'234567890','F','2006-02-27','Spring',2006),(1260,'345678901','F','2006-02-27','Spring',2006),(1262,'456789012','F','2006-02-27','Spring',2006),(1264,'567890123','F','2003-02-27','Spring',2006),(1266,'124567890','F','2006-02-27','Spring',2006),(1268,'678901234','F','2006-02-26','Spring',2006),(1270,'789012345','P','2006-02-28','Spring',2006),(1272,'890123456','P','2006-02-28','Spring',2006),(1274,'901234567','F','2006-02-27','Spring',2006);
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `StdSSN` varchar(20) NOT NULL,
  `StdFirstName` varchar(20) DEFAULT NULL,
  `StdLastName` varchar(20) DEFAULT NULL,
  `StdCity` varchar(25) DEFAULT NULL,
  `StdState` char(2) DEFAULT NULL,
  `StdMajor` varchar(20) DEFAULT NULL,
  `StdClass` char(2) DEFAULT NULL,
  `StdGPA` float DEFAULT NULL,
  `StdZip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`StdSSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('123456789','HOMER','WELLS','SEATTLE','WA','IS','FR',3,'981211111'),('124567890','BOB','NORBERT','BOTHELL','WA','FIN','JR',2.7,'980112121'),('234567890','CANDY','KENDALL','TACOMA','WA','ACCT','JR',3.5,'990423321'),('345678901','WALLY','KENDALL','SEATTLE','WA','IS','SR',2.8,'981231141'),('456789012','JOE','ESTRADA','SEATTLE','WA','FIN','SR',3.2,'981212333'),('567890123','MARIAH','DODGE','SEATTLE','WA','IS','JR',3.6,'981140021'),('678901234','TESS','DODGE','REDMOND','WA','ACCT','SO',3.3,'981162344'),('789012345','ROBERTO','MORALES','SEATTLE','WA','FIN','JR',2.5,'981212212'),('876543210','CRISTOPHER','COLAN','SEATTLE','WA','IS','SR',4,'981141332'),('890123456','LUKE','BRAZZI','SEATTLE','WA','IS','SR',2.2,'981160021'),('901234567','WILLIAM','PILGRIM','BOTHELL','WA','IS','SO',3.8,'981131885');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'school'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-19 22:27:33
