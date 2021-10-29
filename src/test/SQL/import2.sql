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
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_code` varchar(100) NOT NULL,
  `job_name` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jbo_code` (`job_code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'hardware','线路','2021-10-29 11:11:08',NULL),(2,'structural','结构','2021-10-29 11:11:08',NULL),(3,'software','软件','2021-10-29 11:11:08',NULL),(4,'manufacturing','工艺','2021-10-29 11:11:08',NULL),(5,'artDesign','美工','2021-10-29 11:11:08',NULL),(6,'cert','认证','2021-10-29 11:11:08',NULL),(7,'quality','质量','2021-10-29 11:11:08',NULL),(8,'teamLeader','项目负责人','2021-10-29 11:11:08',NULL);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_user`
--

DROP TABLE IF EXISTS `job_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_user`
--

LOCK TABLES `job_user` WRITE;
/*!40000 ALTER TABLE `job_user` DISABLE KEYS */;
INSERT INTO `job_user` VALUES (1,1,1,'2021-10-29 14:10:57',NULL),(2,3,3,'2021-10-29 14:12:21',NULL),(3,3,4,'2021-10-29 14:22:11',NULL);
/*!40000 ALTER TABLE `job_user` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=10006 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_type`
--

LOCK TABLES `project_type` WRITE;
/*!40000 ALTER TABLE `project_type` DISABLE KEYS */;
INSERT INTO `project_type` VALUES (10004,'出口'),(2,'原生派生'),(1,'原生自研'),(10005,'工程机');
/*!40000 ALTER TABLE `project_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,1,10,'2021-10-29 14:09:40',NULL),(2,2,10,'2021-10-29 14:10:06',NULL),(3,3,10,'2021-10-29 14:10:18',NULL);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
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
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tbl`
--

LOCK TABLES `user_tbl` WRITE;
/*!40000 ALTER TABLE `user_tbl` DISABLE KEYS */;
INSERT INTO `user_tbl` VALUES (1,'san.zhang','张三','2021-10-27 10:56:41','2021-10-27 10:56:44',NULL,1,NULL),(2,'si.li','李四','2021-10-27 10:57:21','2021-10-27 10:57:23',NULL,1,NULL),(3,'zhuge','诸葛(软件)','2021-10-29 14:11:48','2021-10-29 14:20:25',NULL,1,NULL),(4,'ouyang','欧阳','2021-10-29 14:20:25','2021-10-29 14:20:34',NULL,1,NULL);
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

-- Dump completed on 2021-10-29 16:34:03
