-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: localhost    Database: student_homework
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `caiwu`
--

DROP TABLE IF EXISTS `caiwu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caiwu` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `owner` varchar(7) DEFAULT NULL,
  `hotel` int(7) DEFAULT NULL,
  `orderId` int(7) DEFAULT NULL,
  `sum` double DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caiwu`
--

LOCK TABLES `caiwu` WRITE;
/*!40000 ALTER TABLE `caiwu` DISABLE KEYS */;
INSERT INTO `caiwu` VALUES (1,'d73105e',4,35,380,'到账'),(4,NULL,4,36,100,'到账'),(5,NULL,4,38,100,'到账'),(6,'5c84eb9',6,40,190,'到账'),(7,NULL,6,41,200,'到账'),(8,'380b1bf',4,42,285,'到账'),(9,NULL,8,43,200,'到账'),(10,'380b1bf',8,44,190,'到账'),(11,'140ef6e',9,47,95,'到账'),(12,'7234cd1',11,49,190,'到账'),(13,NULL,11,51,200,'到账');
/*!40000 ALTER TABLE `caiwu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homework`
--

DROP TABLE IF EXISTS `homework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homework` (
  `sid` varchar(20) NOT NULL,
  `cid` varchar(50) NOT NULL,
  `result` varchar(20) NOT NULL DEFAULT 'unsubmitted',
  PRIMARY KEY (`sid`,`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homework`
--

LOCK TABLES `homework` WRITE;
/*!40000 ALTER TABLE `homework` DISABLE KEYS */;
INSERT INTO `homework` VALUES ('141250001','Linux系统基础','unsubmitted'),('141250001','微积分','failed'),('141250001','离散数学','passed'),('141250002','Linux系统基础','unsubmitted'),('141250002','微积分','failed'),('141250002','离散数学','passed'),('141250003','Linux系统基础','unsubmitted'),('141250003','微积分','failed'),('141250003','离散数学','passed');
/*!40000 ALTER TABLE `homework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `owner` varchar(7) NOT NULL,
  `price` double NOT NULL,
  `roomNum` int(11) NOT NULL,
  `state` varchar(255) NOT NULL,
  `time` datetime DEFAULT NULL,
  `remainNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (4,'汉口路22号','北京旅馆','c01e976',100,200,'审批通过','2017-03-15 00:00:00',94),(5,'汉口路33号','南京旅馆','807f97c',100,100,'审批通过','2017-03-15 00:00:00',100),(6,'汉口路66号','北京旅馆2','8af858e',200,100,'审批通过','2017-03-15 00:00:00',99),(8,'浙江汉口路33号','浙江旅馆','41cc609',200,100,'审批通过','2017-03-20 00:00:00',98),(9,'啦啦路22号','啦啦旅馆','b744a2d',200,100,'审批通过','2017-03-22 00:00:00',100),(10,'苏州22号','苏州旅馆','c2800e6',100,100,'等待审批','2017-03-22 00:00:00',100),(11,'上海路33号','上海旅馆','fa72930',200,100,'审批通过','2017-03-22 00:00:00',99);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderList`
--

DROP TABLE IF EXISTS `orderList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderList` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `startday` datetime DEFAULT NULL,
  `endday` datetime DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `ordertime` datetime DEFAULT NULL,
  `hotelId` int(7) unsigned zerofill DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `summoney` double DEFAULT NULL,
  `memberId` varchar(7) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `roomNo` int(11) NOT NULL,
  `cardState` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderList`
--

LOCK TABLES `orderList` WRITE;
/*!40000 ALTER TABLE `orderList` DISABLE KEYS */;
INSERT INTO `orderList` VALUES (35,'2017-03-15 00:00:00','2017-03-15 00:00:00',2,'2017-03-15 00:00:00',0000004,'北京旅馆',100,380,'d73105e','已完成',2,'会员订单'),(36,'2017-03-15 00:00:00','2017-03-15 00:00:00',1,'2017-03-15 00:00:00',0000004,'北京旅馆',100,100,'梨花','已完成',1,'非会员订单'),(37,'2017-03-15 00:00:00',NULL,1,'2017-03-15 00:00:00',0000004,'北京旅馆',100,100,'梨花','正在进行中',1,'非会员订单'),(38,'2017-03-15 00:00:00',NULL,1,'2017-03-15 00:00:00',0000004,'北京旅馆',100,100,'梅花','正在进行中',1,'非会员订单'),(39,'2017-04-01 00:00:00',NULL,2,'2017-03-15 00:00:00',0000004,'北京旅馆',100,380,'fa8df3b','已取消',2,NULL),(40,'2017-03-15 00:00:00','2017-03-15 00:00:00',1,'2017-03-15 00:00:00',0000006,'北京旅馆2',200,190,'5c84eb9','已完成',1,'会员订单'),(41,'2017-03-15 00:00:00',NULL,1,'2017-03-15 00:00:00',0000006,'北京旅馆2',200,200,'网舞','正在进行中',1,'非会员订单'),(42,'2017-03-20 00:00:00',NULL,1,'2017-03-20 00:00:00',0000004,'北京旅馆',100,285,'380b1bf','正在进行中',3,'会员订单'),(43,'2017-03-20 00:00:00','2017-03-20 00:00:00',1,'2017-03-20 00:00:00',0000008,'浙江旅馆',200,200,'小小花','已完成',1,'非会员订单'),(44,'2017-03-20 00:00:00',NULL,1,'2017-03-20 00:00:00',0000008,'浙江旅馆',200,190,'380b1bf','正在进行中',1,'会员订单'),(45,'2017-03-20 00:00:00',NULL,1,'2017-03-20 00:00:00',0000008,'浙江旅馆',200,190,'380b1bf','未完成,点击取消预定',1,NULL),(46,'2017-03-22 00:00:00',NULL,1,'2017-03-22 00:00:00',0000009,'啦啦旅馆',100,95,'140ef6e','已取消',1,NULL),(47,'2017-03-22 00:00:00','2017-03-22 00:00:00',1,'2017-03-22 00:00:00',0000009,'啦啦旅馆',100,95,'140ef6e','已完成',1,'会员订单'),(48,'2017-03-22 00:00:00',NULL,1,'2017-03-22 00:00:00',0000004,'北京旅馆',100,95,'140ef6e','未完成,点击取消预定',1,NULL),(49,'2017-03-22 00:00:00','2017-03-22 00:00:00',1,'2017-03-22 00:00:00',0000011,'上海旅馆',200,190,'7234cd1','已完成',1,'会员订单'),(50,'2017-03-22 00:00:00',NULL,1,'2017-03-22 00:00:00',0000004,'北京旅馆',100,285,'7234cd1','已取消',3,NULL),(51,'2017-03-22 00:00:00',NULL,1,'2017-03-22 00:00:00',0000011,'上海旅馆',200,200,'启用','正在进行中',1,'非会员订单');
/*!40000 ALTER TABLE `orderList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `sid` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('141250001','李华','123456'),('141250002','王丽','666666'),('141250003','魏忠贤','654321');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` varchar(7) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `bankId` varchar(45) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `consumption` double DEFAULT NULL,
  `point` double DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `createdTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('140ef6e','小草','123456','1234567890123456789',0,0,'NORMAL正常使用',1905,95,95,'1995-01-10 00:00:00','2017-03-22 02:01:57'),('380b1bf','小明','123456','1234567890123456789',0,0,'NORMAL正常使用',1528,475,0,'1996-01-10 00:00:00','2017-03-20 03:00:37'),('41cc609','小花','123456','1234567890123456789',1,0,NULL,0,0,0,NULL,'2017-03-20 02:45:32'),('5c84eb9','张三','123456','1234567890123456789',0,0,'NORMAL正常使用',1810,190,190,'1996-10-01 00:00:00','2017-03-15 10:54:03'),('7234cd1','吴晓','123456','1234567890123456789',0,0,'STOP停止',10811,190,0,'1996-01-10 00:00:00','2017-03-22 07:34:34'),('807f97c','张思','123456','1234567890123456789',1,0,NULL,0,0,0,NULL,'2017-03-15 10:55:27'),('8af858e','张流','123456','1234567890123456789',1,0,NULL,0,0,0,NULL,'2017-03-15 11:01:26'),('b744a2d','啦啦','123456','1234567890123456789',1,0,NULL,0,0,0,NULL,'2017-03-22 02:01:16'),('c01e976','李明','123456','1234567890123456789',1,0,NULL,0,0,0,NULL,'2017-03-15 05:04:39'),('c2800e6','笑笑','123456','1234567890123456789',1,0,NULL,0,0,0,NULL,'2017-03-22 07:25:51'),('d73105e','王丽丽','123456','1234567890123456789',0,0,'NORMAL正常使用',1620,380,380,'1996-10-01 00:00:00','2017-03-15 05:01:36'),('fa72930','吴秦月','123456','1234567890123456789',1,0,NULL,0,0,0,NULL,'2017-03-22 07:33:17'),('fa8df3b','彰武','123456','12345678901234567890',0,0,'NORMAL正常使用',2000,0,0,'1996-10-01 00:00:00','2017-03-15 10:59:47'),('m000001','总经理','123456','1234567890123456789',2,0,NULL,0,0,0,'2016-11-11 00:00:00','2016-11-10 16:00:00');
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

-- Dump completed on 2017-05-19 15:22:57
