-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: zuizhong
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `manager_id` int NOT NULL AUTO_INCREMENT COMMENT 'The ID of the manager account.',
  `manager_password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '123456' COMMENT 'The password of the manager account.',
  `manager_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Manager' COMMENT 'The username (name) of the manager account.',
  `manager_power` int NOT NULL DEFAULT '1' COMMENT 'The system power of the manager account',
  `manager_birthday` date DEFAULT NULL,
  `manager_gender` varchar(16) DEFAULT NULL,
  `manager_description` varchar(128) DEFAULT NULL,
  `manager_avatar` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'123456','Josh',1,'2022-01-23','male','aaaaaa','https://upload-bbs.mihoyo.com/upload/2022/10/11/79886929/f2cef2da4d4d482be2de6a79dea418d8_4679347854352903607.jpg?x-oss-process=image/resize,s_600/quality,q_80/auto-orient,0/interlace,1/format,jpg'),(2,'123','Tom',0,NULL,'male','个人信息展示网站响应式模板HTML+CSS+JavaScript。主要包括的页面有HOME,ABOUT,MOVIE,SPORTS,TRAVEL,SINGLE,CONTACT等总共7个页面。','https://uploadstatic.mihoyo.com/bh3-wiki/2022/08/02/264755623/687c941513a8a39dd352f83ba8589023_4679549929451567579.png'),(3,'abc','Ming',1,NULL,'female','QMplus disruption on Tuesday 18th October between 9pm and 11pm BST Please be aware that there will be some','https://upload-bbs.mihoyo.com/upload/2022/10/18/22740605/8ef8f60237188fc72007298d5bc25897_3932678233459372214.jpg?x-oss-process=image/resize,s_600/quality,q_80/auto-orient,0/interlace,1/format,jpg');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker` (
  `worker_id` int NOT NULL,
  `worker_password` char(32) DEFAULT NULL,
  `worker_name` char(32) DEFAULT NULL,
  PRIMARY KEY (`worker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (1,'123456','kiana'),(2,'123456','admin'),(3,'123','kevin'),(4,'TruE54.8','Elysia'),(12,'12','12'),(101,'KianaK423','Durandalaa'),(123,'123','123'),(2020215117,'dj114133643','Dai_ji'),(2020215118,'7363248423','mc_zhuang'),(2020215119,'iltyforever_123','WEN_LONG'),(2020215120,'kaola_hahaha','Lu_haocheng'),(2020215121,'ABCDXXX_2022','YUE_KAI'),(2020215122,'yong_bu_yan_bai','Jia_Hui');
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-20 14:45:11
