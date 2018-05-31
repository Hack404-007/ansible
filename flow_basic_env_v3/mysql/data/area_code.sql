-- MySQL dump 10.13  Distrib 5.6.22, for Linux (x86_64)
--
-- Host: localhost    Database: flow_fmp
-- ------------------------------------------------------
-- Server version	5.6.22-log

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
-- Table structure for table `area_code`
--

DROP TABLE IF EXISTS `area_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_code` (
  `area_code` varchar(10) NOT NULL COMMENT '编码',
  `area_name` varchar(32) DEFAULT NULL COMMENT '名称',
  `display_order` int(11) DEFAULT NULL COMMENT '显示顺序,降序',
  PRIMARY KEY (`area_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_code`
--

LOCK TABLES `area_code` WRITE;
/*!40000 ALTER TABLE `area_code` DISABLE KEYS */;
INSERT INTO `area_code` VALUES ('00','全国',999),('11','北京',990),('12','天津',980),('13','河北',970),('14','山西',960),('15','内蒙古自治区',950),('21','辽宁',940),('22','吉林',930),('23','黑龙江',920),('31','上海',910),('32','江苏',900),('33','浙江',890),('34','安徽',880),('35','福建',870),('36','江西',860),('37','山东',850),('41','河南',840),('42','湖北',830),('43','湖南',820),('44','广东',998),('45','广西壮族自治区',800),('46','海南',790),('50','重庆',780),('51','四川',770),('52','贵州',760),('53','云南',750),('54','西藏自治区',740),('61','陕西',730),('62','甘肃',720),('63','青海',710),('64','宁夏回族自治区',700),('65','新疆维吾尔自治区',690);
/*!40000 ALTER TABLE `area_code` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-08 20:11:54
