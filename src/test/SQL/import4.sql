-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: localhost    Database: ppmp
-- ------------------------------------------------------
-- Server version	5.7.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
  UNIQUE KEY `job_code` (`job_code`)
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
  `team_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
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
INSERT INTO `job_user` VALUES (1,1,2,'2021-10-29 14:10:57','2021-11-01 09:13:50'),(2,2,3,'2021-10-29 14:12:21','2021-11-01 09:39:26'),(3,2,4,'2021-10-29 14:22:11','2021-11-01 09:39:26');
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
-- Table structure for table `tb_document`
--

DROP TABLE IF EXISTS `tb_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `md5` varchar(100) DEFAULT NULL,
  `save_path` varchar(100) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `permission` varchar(50) DEFAULT NULL,
  `suffix` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_by` int(10) unsigned DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_document`
--

LOCK TABLES `tb_document` WRITE;
/*!40000 ALTER TABLE `tb_document` DISABLE KEYS */;
INSERT INTO `tb_document` VALUES (1,1,'directory','立项',0,NULL,NULL,NULL,NULL,NULL,'2021-11-05 09:22:58',NULL,1,1),(2,1,'directory','研发资料',0,NULL,NULL,NULL,NULL,NULL,'2021-11-05 09:38:36','2021-11-05 09:38:45',1,1),(3,1,'directory','评审',0,NULL,NULL,NULL,NULL,NULL,'2021-11-05 09:50:59',NULL,1,1),(4,1,'directory','试验报告',0,NULL,NULL,NULL,NULL,NULL,'2021-11-05 09:50:59',NULL,1,1),(5,1,'file','上传项目资料注意事项.doc',0,'4d624e8e5e8d2f1fb5e5091afc562289',NULL,39592,NULL,'doc','2021-11-05 09:56:25',NULL,1,1),(6,1,'file','开发需求书.doc',1,NULL,NULL,4396,NULL,'doc','2021-11-05 09:59:03',NULL,1,1),(7,1,'file','立项申请表.pdf',1,NULL,NULL,NULL,NULL,NULL,'2021-11-05 10:00:23',NULL,NULL,NULL),(8,1,'file','BOM资料打包压缩资料.7z',2,NULL,NULL,NULL,NULL,NULL,'2021-11-05 10:01:37',NULL,NULL,NULL),(9,1,'directory','方案阶段',3,NULL,NULL,NULL,NULL,NULL,'2021-11-05 10:03:24',NULL,NULL,NULL),(10,1,'directory','样机阶段',3,NULL,NULL,NULL,NULL,NULL,'2021-11-05 10:03:49',NULL,NULL,NULL),(11,1,'file','方案评审意见书.doc',9,NULL,NULL,NULL,NULL,NULL,'2021-11-05 10:04:42',NULL,NULL,NULL),(12,1,'file','样机评审意见书.doc',10,NULL,NULL,NULL,NULL,NULL,'2021-11-05 10:05:16',NULL,NULL,NULL),(13,1,'file','能效测量报告.doc',4,NULL,NULL,NULL,NULL,'doc','2021-11-05 10:07:34',NULL,NULL,NULL),(14,1,'file','光电测量报告.doc',4,NULL,NULL,NULL,NULL,'doc','2021-11-05 10:07:34',NULL,NULL,NULL),(15,1,'file','辐射测量报告.pdf',4,NULL,NULL,NULL,NULL,'pdf','2021-11-05 10:07:34',NULL,NULL,NULL),(16,1,'directory','质量报告',0,NULL,NULL,NULL,NULL,NULL,'2021-11-05 10:08:27',NULL,NULL,NULL),(17,1,'directory','生产数据',0,NULL,NULL,NULL,NULL,NULL,'2021-11-05 10:08:54',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tb_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,1,10,'2021-10-29 14:09:40','2021-11-01 09:12:43'),(2,3,10,'2021-10-29 14:10:06','2021-11-01 09:39:09');
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

-- Dump completed on 2021-11-07 21:32:57
