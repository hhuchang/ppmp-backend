-- MySQL dump 10.13  Distrib 5.7.28, for Win64 (x86_64)
--
-- Host: localhost    Database: ppmp
-- ------------------------------------------------------
-- Server version	5.7.28-log

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
-- Table structure for table `project_status`
--

DROP TABLE IF EXISTS `project_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_code` varchar(100) NOT NULL,
  `status_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_code` (`status_code`)
) ENGINE=InnoDB AUTO_INCREMENT=10005 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_status`
--

LOCK TABLES `project_status` WRITE;
/*!40000 ALTER TABLE `project_status` DISABLE KEYS */;
INSERT INTO `project_status` VALUES (10001,'created','已创建'),(10002,'initialized','已就绪'),(10003,'processing','进行中'),(10004,'closed','已关闭');
/*!40000 ALTER TABLE `project_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_tbl`
--

DROP TABLE IF EXISTS `project_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_tbl` (
  `project_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) NOT NULL,
  `project_code` varchar(100) NOT NULL,
  `manager_id` int(10) unsigned DEFAULT NULL,
  `project_type_id` int(10) unsigned DEFAULT NULL,
  `createBy_id` int(10) unsigned DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `status_id` int(10) unsigned DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`project_id`),
  UNIQUE KEY `project_code` (`project_code`),
  KEY `fk_manager` (`manager_id`),
  KEY `fk_create_by` (`createBy_id`),
  KEY `fk_status` (`status_id`),
  KEY `fk_type` (`project_type_id`),
  CONSTRAINT `fk_create_by` FOREIGN KEY (`createBy_id`) REFERENCES `user_tbl` (`id`),
  CONSTRAINT `fk_manager` FOREIGN KEY (`manager_id`) REFERENCES `user_tbl` (`id`),
  CONSTRAINT `fk_status` FOREIGN KEY (`status_id`) REFERENCES `project_status` (`id`),
  CONSTRAINT `fk_type` FOREIGN KEY (`project_type_id`) REFERENCES `project_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_tbl`
--

LOCK TABLES `project_tbl` WRITE;
/*!40000 ALTER TABLE `project_tbl` DISABLE KEYS */;
INSERT INTO `project_tbl` VALUES (10,'测试项目名称','测试项目code',1,1,2,'2021-10-27 09:54:47','2021-10-27 09:54:53','2021-10-27 09:54:57','2021-11-27 09:55:05','测试url',10001,'测试备注'),(11,'发动机MICHENF名称','XR-GOOGO',NULL,NULL,NULL,'2021-10-28 14:32:41','2021-10-28 14:52:04',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `project_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_type`
--

DROP TABLE IF EXISTS `project_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10004 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_type`
--

LOCK TABLES `project_type` WRITE;
/*!40000 ALTER TABLE `project_type` DISABLE KEYS */;
INSERT INTO `project_type` VALUES (2,'原生派生'),(1,'原生自研');
/*!40000 ALTER TABLE `project_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tbl`
--

DROP TABLE IF EXISTS `user_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tbl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `real_name` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `avatar` varchar(100) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tbl`
--

LOCK TABLES `user_tbl` WRITE;
/*!40000 ALTER TABLE `user_tbl` DISABLE KEYS */;
INSERT INTO `user_tbl` VALUES (1,'san.zhang','张三','2021-10-27 10:56:41','2021-10-27 10:56:44',NULL,1),(2,'si.li','李四','2021-10-27 10:57:21','2021-10-27 10:57:23',NULL,1);
/*!40000 ALTER TABLE `user_tbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-28 16:35:46
