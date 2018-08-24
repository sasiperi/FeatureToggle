-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: demo_webapp
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Current Database: `demo_webapp`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `demo_webapp` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `demo_webapp`;

--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorities` (
  `username` varchar(50) DEFAULT NULL,
  `authority` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES ('sasi','ROLE_USER'),('peri','ROLE_ADMIN'),('sasi','ROLE_BETA-TESTER');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`user_role_id`),
  UNIQUE KEY `uni_username_role` (`role`,`username`),
  KEY `fk_username_idx` (`username`),
  CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (2,'peri','ADMIN'),(4,'peri','ROLE_ADMIN'),(3,'sasi','ROLE_USER'),(1,'sasi','USER');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(45) NOT NULL,
  `password` varchar(300) DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('peri','$2a$10$IXpIkXmHIGE0HYIAA/LaauF5Q.J.djUqxRS9buX/vDjgoGD9rgwAu',1),('sasi','$2a$10$Xh3LTxnXRD7EhQp5p5lzFOCnviDeItlHJwY27CXk6hdoxn41N7C8m',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `ff4j_demo`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ff4j_demo` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ff4j_demo`;

--
-- Table structure for table `ff4j_audit`
--

DROP TABLE IF EXISTS `ff4j_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ff4j_audit` (
  `EVT_UUID` varchar(40) NOT NULL,
  `EVT_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EVT_TYPE` varchar(30) NOT NULL,
  `EVT_NAME` varchar(30) NOT NULL,
  `EVT_ACTION` varchar(30) NOT NULL,
  `EVT_HOSTNAME` varchar(100) NOT NULL,
  `EVT_SOURCE` varchar(30) NOT NULL,
  `EVT_DURATION` int(11) DEFAULT NULL,
  `EVT_USER` varchar(30) DEFAULT NULL,
  `EVT_VALUE` varchar(100) DEFAULT NULL,
  `EVT_KEYS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EVT_UUID`,`EVT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ff4j_audit`
--

LOCK TABLES `ff4j_audit` WRITE;
/*!40000 ALTER TABLE `ff4j_audit` DISABLE KEYS */;
INSERT INTO `ff4j_audit` VALUES ('113c6b0c-818e-41ab-a541-da4cc0ffee40','2018-08-23 04:17:13','feature','sasi-f1','checkOff','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('169346c8-634c-4dac-8f18-ce0f479aa92a','2018-08-23 04:17:29','feature','sasi-f1','checkOn','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('1874cfa7-42a5-4e52-b461-8bcb83d58330','2018-08-23 03:21:48','feature','sasi-f2','checkOn','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('1a621f01-a760-4499-9730-c6cd26eaf0ba','2018-08-22 23:04:19','feature','sasi-f2','toggle-on','LOH068ND447GLYF','JAVA_API',11426116,NULL,NULL,''),('1a826651-558e-436b-86cd-73c548a97e3c','2018-08-23 04:17:13','feature','sasi-f1','checkOff','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('230840c1-f825-46f0-998d-3ec7aa071c75','2018-08-23 04:17:29','feature','sasi-f1','checkOn','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('2bd6de76-b18b-4577-aad2-8fdc9b6ae26f','2018-08-22 23:06:41','feature','sasi-f2','checkOn','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('3054094c-5a3b-4dc1-9284-f033e2a4b2ee','2018-08-23 04:17:29','feature','sasi-f1','checkOn','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('30e904b3-1ace-4970-81db-46e2079c58f3','2018-08-22 22:53:35','feature','sasi-f2','checkOff','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('372b5b3e-29e6-46da-9a30-1e3844e7f49e','2018-08-22 22:50:58','feature','sasi-f2','checkOff','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('3ae8b9c6-0970-4f0d-9232-2cf1758791a2','2018-08-22 21:57:00','feature','sasi-f1','checkOff','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('3ef24d91-6712-41e8-9223-7141e2fa071d','2018-08-23 03:22:57','feature','sasi-f2','checkOn','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('3f011b64-5770-44a5-8440-39f6bacabb3a','2018-08-23 04:17:29','feature','sasi-f1','checkOn','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('42903ecc-cb48-4741-861d-a05dedd0d5da','2018-08-22 22:09:55','feature','sasi-f1','toggle-on','LOH068ND447GLYF','JAVA_API',10555986,NULL,NULL,''),('46b083c1-b0f3-4655-9007-93d6cd85437b','2018-08-22 22:54:48','feature','sasi-f2','checkOff','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('5ebc8747-e78a-4df4-b144-8e75bd5107ec','2018-08-23 04:17:13','feature','sasi-f1','checkOff','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('619e6874-afb2-460f-8818-d894eac97e57','2018-08-22 21:54:05','feature','sasi-f1','checkOff','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('62b6bd7d-49c1-43fc-8b99-1756d0296966','2018-08-24 14:15:12','feature','Beta-Feature','create','LOH068ND447GLYF','JAVA_API',105212040,NULL,NULL,''),('661466f2-816c-4a4d-ae76-3d20d219a911','2018-08-23 04:17:29','feature','sasi-f1','checkOn','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('6f58e15f-f4fb-4d66-be7d-a21cb07fd362','2018-08-23 04:17:29','feature','sasi-f1','checkOn','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('7baf35a1-0834-4c4f-947a-04219b548b02','2018-08-23 04:17:29','feature','sasi-f2','checkOn','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('852ab7ad-2b38-407a-80bf-8dd3b2cb5cd3','2018-08-23 04:17:13','feature','sasi-f1','checkOff','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('8ad9c76b-fef1-434d-91f4-139505898a9e','2018-08-23 04:07:42','feature','sasi-f2','checkOn','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('8e9bacc1-d851-4403-93f3-8c59b4c04119','2018-08-23 04:17:29','feature','sasi-f1','checkOn','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('93f3918b-f2f3-40a9-b699-5d72f1a67ca4','2018-08-23 04:17:23','feature','sasi-f1','toggle-on','LOH068ND447GLYF','JAVA_API',18731944,NULL,NULL,''),('94e9a126-a7ef-405f-a4b1-c3814f675581','2018-08-23 04:17:13','feature','sasi-f1','checkOff','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('96b3167e-d6ae-44d8-824d-13b9b3256a94','2018-08-23 04:17:13','feature','sasi-f1','checkOff','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('a0ce6274-e31d-49f1-a9f0-19049d51027b','2018-08-23 04:17:13','feature','sasi-f1','checkOff','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('ba263e36-cd3a-4302-800f-496ad87a2223','2018-08-23 03:48:35','feature','sasi-f2','checkOn','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('ba2f930e-8939-496c-a9e1-d7b4d00df738','2018-08-23 04:17:13','feature','sasi-f2','checkOn','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('bc8e86e1-f467-4c17-ac69-1ca59d3d4765','2018-08-23 03:22:54','feature','sasi-f2','checkOn','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('c397e282-06fd-4004-b029-d913279ccb81','2018-08-23 03:22:36','feature','sasi-f1','toggle-off','LOH068ND447GLYF','JAVA_API',13337439,NULL,NULL,''),('d1e76e6b-deac-43ce-b063-41a7fc591c95','2018-08-23 04:17:13','feature','sasi-f1','checkOff','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('e29803b6-a33f-4eed-8de8-45bef812d836','2018-08-22 22:53:27','feature','sasi-f2','checkOff','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('e678824e-b429-44e1-854a-114c83ec0501','2018-08-22 23:06:09','feature','sasi-f2','checkOn','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('f46b9f6d-6ef5-4011-9bcf-44c25d3942a4','2018-08-22 22:42:04','feature','For Properties','create-schema','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('f6bd9b11-aa07-4e57-b877-b09ef2fc1ecd','2018-08-22 22:42:04','feature','For Features','create-schema','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('f97ca51f-3952-4eb4-9f6e-37a7d8e29d0e','2018-08-22 23:02:58','feature','sasi-f2','checkOff','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,''),('fe9243ea-2add-4bdf-ada2-41cee4391ad1','2018-08-23 04:17:29','feature','sasi-f1','checkOn','LOH068ND447GLYF','JAVA_API',0,NULL,NULL,'');
/*!40000 ALTER TABLE `ff4j_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ff4j_custom_properties`
--

DROP TABLE IF EXISTS `ff4j_custom_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ff4j_custom_properties` (
  `PROPERTY_ID` varchar(100) NOT NULL,
  `CLAZZ` varchar(255) NOT NULL,
  `CURRENTVALUE` varchar(255) DEFAULT NULL,
  `FIXEDVALUES` varchar(1000) DEFAULT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  `FEAT_UID` varchar(100) NOT NULL,
  PRIMARY KEY (`PROPERTY_ID`,`FEAT_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ff4j_custom_properties`
--

LOCK TABLES `ff4j_custom_properties` WRITE;
/*!40000 ALTER TABLE `ff4j_custom_properties` DISABLE KEYS */;
INSERT INTO `ff4j_custom_properties` VALUES ('digitValue','org.ff4j.property.PropertyInt','1','0, 1, 2, 3',NULL,'first'),('myLogLevel','org.ff4j.property.PropertyLogLevel','DEBUG','WARN, ERROR, FATAL, INFO, DEBUG, TRACE',NULL,'first'),('ppboolean','org.ff4j.property.PropertyBoolean','true','false, true',NULL,'first'),('ppdouble','org.ff4j.property.PropertyDouble','12.5',NULL,NULL,'first'),('ppint','org.ff4j.property.PropertyInt','12',NULL,NULL,'first'),('ppListInt','org.ff4j.property.PropertyString','12,13,14',NULL,NULL,'first'),('ppstring','org.ff4j.property.PropertyString','hello',NULL,NULL,'first'),('regionIdentifier','org.ff4j.property.PropertyString','AMER','SSSS, AMER, EAST',NULL,'first');
/*!40000 ALTER TABLE `ff4j_custom_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ff4j_features`
--

DROP TABLE IF EXISTS `ff4j_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ff4j_features` (
  `FEAT_UID` varchar(100) NOT NULL,
  `ENABLE` int(11) NOT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  `STRATEGY` varchar(1000) DEFAULT NULL,
  `EXPRESSION` varchar(255) DEFAULT NULL,
  `GROUPNAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FEAT_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ff4j_features`
--

LOCK TABLES `ff4j_features` WRITE;
/*!40000 ALTER TABLE `ff4j_features` DISABLE KEYS */;
INSERT INTO `ff4j_features` VALUES ('Awesome-Sasi-1-Feature',0,'',NULL,NULL,NULL),('AwesomeFeature',1,'some desc',NULL,NULL,NULL),('Beta-Feature',0,'Only for Beta Users',NULL,NULL,NULL),('exp-sasi',0,NULL,'org.ff4j.strategy.el.ExpressionFlipStrategy','expression=f1 & f2 | !f1 | f2',NULL),('f2',0,'',NULL,NULL,NULL),('first',1,'description',NULL,NULL,NULL),('forth',1,'description','org.ff4j.strategy.el.ExpressionFlipStrategy','expression=third | second','GRP1'),('sasi-f1',1,'',NULL,NULL,NULL),('sasi-f2',1,'',NULL,NULL,NULL),('second',0,'description',NULL,NULL,'GRP0'),('third',0,NULL,NULL,NULL,'GRP1');
/*!40000 ALTER TABLE `ff4j_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ff4j_properties`
--

DROP TABLE IF EXISTS `ff4j_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ff4j_properties` (
  `PROPERTY_ID` varchar(100) NOT NULL,
  `CLAZZ` varchar(255) NOT NULL,
  `CURRENTVALUE` varchar(255) DEFAULT NULL,
  `FIXEDVALUES` varchar(1000) DEFAULT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`PROPERTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ff4j_properties`
--

LOCK TABLES `ff4j_properties` WRITE;
/*!40000 ALTER TABLE `ff4j_properties` DISABLE KEYS */;
INSERT INTO `ff4j_properties` VALUES ('a','org.ff4j.property.PropertyString','AMER','AMER, EAST',NULL),('b','org.ff4j.property.PropertyString','12',NULL,NULL),('c','org.ff4j.property.PropertyString','12.5',NULL,NULL),('d','org.ff4j.property.PropertyString','true',NULL,NULL),('e','org.ff4j.property.PropertyString','hello',NULL,NULL),('f','org.ff4j.property.PropertyString','12,13,14',NULL,NULL),('g','org.ff4j.property.PropertyLogLevel','DEBUG','WARN, ERROR, FATAL, INFO, DEBUG, TRACE',NULL),('SampleProperty','org.ff4j.property.PropertyString','go-sasi!',NULL,NULL),('SamplePropertyIn','org.ff4j.property.PropertyInt','12',NULL,NULL);
/*!40000 ALTER TABLE `ff4j_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ff4j_roles`
--

DROP TABLE IF EXISTS `ff4j_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ff4j_roles` (
  `FEAT_UID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`FEAT_UID`,`ROLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ff4j_roles`
--

LOCK TABLES `ff4j_roles` WRITE;
/*!40000 ALTER TABLE `ff4j_roles` DISABLE KEYS */;
INSERT INTO `ff4j_roles` VALUES ('first','USER'),('forth','ADMINISTRATOR'),('forth','BETA-TESTER'),('second','USER'),('third','ADMINISTRATOR'),('third','BETA-TESTER');
/*!40000 ALTER TABLE `ff4j_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-24 10:37:06
