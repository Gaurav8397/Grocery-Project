-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: grocery1
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `address_entity`
--

DROP TABLE IF EXISTS `address_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_entity` (
  `address_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address_line1` varchar(255) NOT NULL,
  `address_line2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `pincode` bigint(20) NOT NULL,
  `state` varchar(255) NOT NULL,
  `customer_entity_customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `FK2fig3jcguttdl0pdubx66vnau` (`customer_entity_customer_id`),
  CONSTRAINT `FK2fig3jcguttdl0pdubx66vnau` FOREIGN KEY (`customer_entity_customer_id`) REFERENCES `customer_entity` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_entity`
--

LOCK TABLES `address_entity` WRITE;
/*!40000 ALTER TABLE `address_entity` DISABLE KEYS */;
INSERT INTO `address_entity` VALUES (1,'bulding no 2 ,lane 2','sai chowk','Pune',424020,'Maharashtra',NULL),(2,'Bulding no 2 ,lane 2,Samarth nagar','Sai chowk,New Snagvi','Pune',425507,'Maharashtra',NULL),(3,'Happy colony','Karve Nagar','Pune',404025,'Maharashtra',NULL),(4,'Ring road, Lane 2','ShivajiNagar','Pune',404036,'Maharashtra',NULL),(5,'Bulding no 2 ,lane 2,Samarth nagar','Sai chowk,New Snagvi','Mumbai',202520,'Maharashtra',NULL),(6,'Nishigandha appartment ,lane 2','Sai nagar,Warje Malwadi','Pune',858502,'Maharashtra',NULL),(7,'Bulding no 2 ,lane 2,Samarth nagar','Sai nagar,Warje Malwadi','Mumbai',425507,'Maharashtra',NULL);
/*!40000 ALTER TABLE `address_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_entity`
--

DROP TABLE IF EXISTS `bank_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_entity` (
  `bank_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_no` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `ifsc_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_entity`
--

LOCK TABLES `bank_entity` WRITE;
/*!40000 ALTER TABLE `bank_entity` DISABLE KEYS */;
INSERT INTO `bank_entity` VALUES (1,'12546555','cbi','158635'),(2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `bank_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_entity`
--

DROP TABLE IF EXISTS `cart_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_entity` (
  `cart_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_entity_customer_id` bigint(20) DEFAULT NULL,
  `shop_entity_shop_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `FK1h3xqp7nbmgg6e2hpafe2xkv8` (`customer_entity_customer_id`),
  KEY `FKakdkt1fyhhki6iu2jqfurbsv7` (`shop_entity_shop_id`),
  CONSTRAINT `FK1h3xqp7nbmgg6e2hpafe2xkv8` FOREIGN KEY (`customer_entity_customer_id`) REFERENCES `customer_entity` (`customer_id`),
  CONSTRAINT `FKakdkt1fyhhki6iu2jqfurbsv7` FOREIGN KEY (`shop_entity_shop_id`) REFERENCES `shop_entity` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_entity`
--

LOCK TABLES `cart_entity` WRITE;
/*!40000 ALTER TABLE `cart_entity` DISABLE KEYS */;
INSERT INTO `cart_entity` VALUES (8,1,6);
/*!40000 ALTER TABLE `cart_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_entity_product_entities`
--

DROP TABLE IF EXISTS `cart_entity_product_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_entity_product_entities` (
  `cart_entity_cart_id` bigint(20) NOT NULL,
  `product_entities_product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`cart_entity_cart_id`,`product_entities_product_id`),
  UNIQUE KEY `UK_cpp7rkafe0lay3nb671ktrxtn` (`product_entities_product_id`),
  CONSTRAINT `FKce6agw2022293jhxi5dfwdyyw` FOREIGN KEY (`product_entities_product_id`) REFERENCES `product_entity` (`product_id`),
  CONSTRAINT `FKjv8gl4shbc6ikys7nu3huogqg` FOREIGN KEY (`cart_entity_cart_id`) REFERENCES `cart_entity` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_entity_product_entities`
--

LOCK TABLES `cart_entity_product_entities` WRITE;
/*!40000 ALTER TABLE `cart_entity_product_entities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_entity_product_entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_product_entity`
--

DROP TABLE IF EXISTS `cart_product_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_product_entity` (
  `cart_product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pro_quantity` int(11) NOT NULL,
  `pro_brandname` varchar(255) NOT NULL,
  `pro_description` varchar(255) DEFAULT NULL,
  `pro_image` varchar(255) DEFAULT NULL,
  `pro_name` varchar(255) NOT NULL,
  `pro_price` double NOT NULL,
  `pro_weight` varchar(255) NOT NULL,
  PRIMARY KEY (`cart_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_product_entity`
--

LOCK TABLES `cart_product_entity` WRITE;
/*!40000 ALTER TABLE `cart_product_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_product_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_entity`
--

DROP TABLE IF EXISTS `category_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_entity` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pro_category` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `UK_euu0o4ek5qoqgaqob4rxeuxo5` (`pro_category`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_entity`
--

LOCK TABLES `category_entity` WRITE;
/*!40000 ALTER TABLE `category_entity` DISABLE KEYS */;
INSERT INTO `category_entity` VALUES (5,'detergent'),(2,'Salt'),(3,'Shampoo'),(1,'Soap'),(6,'Sprouts'),(4,'Tooth-Paste');
/*!40000 ALTER TABLE `category_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_entity_product_entities`
--

DROP TABLE IF EXISTS `category_entity_product_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_entity_product_entities` (
  `category_entity_category_id` bigint(20) NOT NULL,
  `product_entities_product_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_hfrfol0dt3fpphybjpu5bo83o` (`product_entities_product_id`),
  KEY `FKopbji0pp3l6guj8qi30kva3i` (`category_entity_category_id`),
  CONSTRAINT `FKkccbudc4qekdy89jpljpukefj` FOREIGN KEY (`product_entities_product_id`) REFERENCES `product_entity` (`product_id`),
  CONSTRAINT `FKopbji0pp3l6guj8qi30kva3i` FOREIGN KEY (`category_entity_category_id`) REFERENCES `category_entity` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_entity_product_entities`
--

LOCK TABLES `category_entity_product_entities` WRITE;
/*!40000 ALTER TABLE `category_entity_product_entities` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_entity_product_entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity`
--

DROP TABLE IF EXISTS `customer_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_entity` (
  `customer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `record_status` varchar(255) DEFAULT NULL,
  `reg_date` date NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `UK_hsgodkx07n8pgvk484yft8gk` (`email`),
  UNIQUE KEY `UK_2f2qnl8kelq8n43ck04tfpa8p` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity`
--

LOCK TABLES `customer_entity` WRITE;
/*!40000 ALTER TABLE `customer_entity` DISABLE KEYS */;
INSERT INTO `customer_entity` VALUES (1,'sanketsonar407@gmail.com','Sanket','Sonar',8888551172,'Active','2020-09-17'),(2,'sidhu12@gmail.com','Rajendra','Patil',8669116749,'Active','2020-09-18');
/*!40000 ALTER TABLE `customer_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_address_entities`
--

DROP TABLE IF EXISTS `customer_entity_address_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_entity_address_entities` (
  `customer_entity_customer_id` bigint(20) NOT NULL,
  `address_entities_address_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_iw4mviiv81qibravgnl530mf6` (`address_entities_address_id`),
  KEY `FKao0akfuqv4p8u19x1gsgal4y3` (`customer_entity_customer_id`),
  CONSTRAINT `FK1y9woew7qkt63cqmau909f4tv` FOREIGN KEY (`address_entities_address_id`) REFERENCES `address_entity` (`address_id`),
  CONSTRAINT `FKao0akfuqv4p8u19x1gsgal4y3` FOREIGN KEY (`customer_entity_customer_id`) REFERENCES `customer_entity` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_address_entities`
--

LOCK TABLES `customer_entity_address_entities` WRITE;
/*!40000 ALTER TABLE `customer_entity_address_entities` DISABLE KEYS */;
INSERT INTO `customer_entity_address_entities` VALUES (1,1),(1,5),(1,7),(2,2),(2,4),(2,6);
/*!40000 ALTER TABLE `customer_entity_address_entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_report1`
--

DROP TABLE IF EXISTS `daily_report1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_report1` (
  `day` int(11) NOT NULL,
  `amount` double NOT NULL,
  `count` int(11) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_report1`
--

LOCK TABLES `daily_report1` WRITE;
/*!40000 ALTER TABLE `daily_report1` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_report1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_entity`
--

DROP TABLE IF EXISTS `login_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_entity` (
  `login_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_admin` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `customer_entity_customer_id` bigint(20) DEFAULT NULL,
  `shop_entity_shop_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `UK_e5xbgckipixsc6xqx3fk6vpl1` (`user_name`),
  KEY `FK4ontwoq25uab18k98k111c0q0` (`customer_entity_customer_id`),
  KEY `FK6nndbanbnt9gwsge8wlo5417w` (`shop_entity_shop_id`),
  CONSTRAINT `FK4ontwoq25uab18k98k111c0q0` FOREIGN KEY (`customer_entity_customer_id`) REFERENCES `customer_entity` (`customer_id`),
  CONSTRAINT `FK6nndbanbnt9gwsge8wlo5417w` FOREIGN KEY (`shop_entity_shop_id`) REFERENCES `shop_entity` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_entity`
--

LOCK TABLES `login_entity` WRITE;
/*!40000 ALTER TABLE `login_entity` DISABLE KEYS */;
INSERT INTO `login_entity` VALUES (1,'true','admin','Active','admin',NULL,NULL),(3,'false','Sanket@999','Active','sanketsonar407@gmail.com',1,NULL),(5,'false','Raju@888','Active','sidhu12@gmail.com',2,NULL),(6,'false','Gaurav@999','Active','gauravmaha97@gmail.com',NULL,6),(7,'false','Shidhu@999','Active','patilsiddhant9615@gamil.com',NULL,7);
/*!40000 ALTER TABLE `login_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_role_entity`
--

DROP TABLE IF EXISTS `login_role_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_role_entity` (
  `login_id` bigint(20) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`login_id`,`role_id`),
  KEY `FKkeh0tsgna21vyqg9auuav3l9g` (`role_id`),
  CONSTRAINT `FKekt7s6kcr898rcvmhqr93j70n` FOREIGN KEY (`login_id`) REFERENCES `login_entity` (`login_id`),
  CONSTRAINT `FKkeh0tsgna21vyqg9auuav3l9g` FOREIGN KEY (`role_id`) REFERENCES `role_entity` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_role_entity`
--

LOCK TABLES `login_role_entity` WRITE;
/*!40000 ALTER TABLE `login_role_entity` DISABLE KEYS */;
INSERT INTO `login_role_entity` VALUES (1,1),(1,2),(6,2),(7,2),(1,3),(3,3),(5,3);
/*!40000 ALTER TABLE `login_role_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monthly_report`
--

DROP TABLE IF EXISTS `monthly_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monthly_report` (
  `month` varchar(255) NOT NULL,
  `amount` double NOT NULL,
  `count` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_report`
--

LOCK TABLES `monthly_report` WRITE;
/*!40000 ALTER TABLE `monthly_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `monthly_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_entity`
--

DROP TABLE IF EXISTS `order_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_entity` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `delivery_charge` double NOT NULL,
  `order_amount` double NOT NULL,
  `order_date` datetime NOT NULL,
  `order_status` varchar(255) NOT NULL,
  `payment_mode` varchar(255) NOT NULL,
  `total_amount` double NOT NULL,
  `address_entity_address_id` bigint(20) DEFAULT NULL,
  `customer_entity_customer_id` bigint(20) DEFAULT NULL,
  `total_Quantity` double DEFAULT NULL,
  `shop_entity_shop_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FKqv7cnfswciy9yimg76twv9leg` (`address_entity_address_id`),
  KEY `FKkn8mw1yox6jbyb9k4qffpmku0` (`customer_entity_customer_id`),
  KEY `FK70l33jdwm1dwbbnqk02aj5xfc` (`shop_entity_shop_id`),
  CONSTRAINT `FK70l33jdwm1dwbbnqk02aj5xfc` FOREIGN KEY (`shop_entity_shop_id`) REFERENCES `shop_entity` (`shop_id`),
  CONSTRAINT `FKkn8mw1yox6jbyb9k4qffpmku0` FOREIGN KEY (`customer_entity_customer_id`) REFERENCES `customer_entity` (`customer_id`),
  CONSTRAINT `FKqv7cnfswciy9yimg76twv9leg` FOREIGN KEY (`address_entity_address_id`) REFERENCES `address_entity` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_entity`
--

LOCK TABLES `order_entity` WRITE;
/*!40000 ALTER TABLE `order_entity` DISABLE KEYS */;
INSERT INTO `order_entity` VALUES (1,40,250,'2020-09-17 00:00:00','Delivered','Cash On Delivery',270,1,1,5,6),(2,40,520,'2020-09-15 00:00:00','Delivered','Cash On Delivery',540,1,1,3,6),(3,30,360,'2020-09-18 00:00:00','In Process','Cash On Delivery',390,2,2,6,7),(4,40,680,'2020-09-15 00:00:00','Delivered','Cash On Delivery',720,2,2,7,6),(5,30,600,'2020-08-15 00:00:00','Delivered','Cash On Delivery',630,1,1,3,7),(6,30,1200,'2020-06-12 00:00:00','Delivered','Cash On Delivery',1230,2,2,10,6),(7,40,950,'2018-08-05 00:00:00','Delivered','Cash On Delivery',990,1,1,6,7),(8,20,660,'2019-05-23 00:00:00','Delivered','Cash On Delivery',680,2,2,7,6),(9,30,600,'2020-10-05 00:00:00','Pending','Cash On Delivery',630,1,1,6,6),(10,40,850,'2020-10-03 00:00:00','Pending','Cash On Delivry',890,1,2,8,6),(11,30,1200,'2020-10-01 00:00:00','Delivered','Cash On Delivery',1230,2,2,8,7),(13,40,665,'2020-10-23 13:37:06','pending','Cash On Delivery',705,1,1,18,6),(15,40,314,'2020-10-23 13:50:57','pending','Cash On Delivery',354,1,1,24,7),(17,40,246,'2020-10-23 14:08:26','pending','Cash On Delivery',286,1,1,15,7),(18,40,1138,'2020-10-23 14:16:45','pending','Cash On Delivery',1178,1,1,14,6),(20,40,950,'2020-10-24 13:50:49','pending','Cash On Delivery',990,1,1,12,6),(21,40,170,'2020-10-24 14:06:06','pending','Cash On Delivery',210,1,1,10,7),(22,40,54,'2020-10-24 14:24:08','pending','Cash On Delivery',94,1,1,3,7),(23,40,888,'2020-10-24 14:24:08','pending','Cash On Delivery',928,1,1,12,6);
/*!40000 ALTER TABLE `order_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_entity_product_entities`
--

DROP TABLE IF EXISTS `order_entity_product_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_entity_product_entities` (
  `order_entity_order_id` bigint(20) NOT NULL,
  `product_entities_order_product_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_bdvuk6rhmktnoipxf8eioolcg` (`product_entities_order_product_id`),
  KEY `FKkwqpwv953vm42mxc49ql8kuel` (`order_entity_order_id`),
  CONSTRAINT `FK35af0xy94igsutas8i0yywe3c` FOREIGN KEY (`product_entities_order_product_id`) REFERENCES `order_product_entity` (`order_product_id`),
  CONSTRAINT `FKkwqpwv953vm42mxc49ql8kuel` FOREIGN KEY (`order_entity_order_id`) REFERENCES `order_entity` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_entity_product_entities`
--

LOCK TABLES `order_entity_product_entities` WRITE;
/*!40000 ALTER TABLE `order_entity_product_entities` DISABLE KEYS */;
INSERT INTO `order_entity_product_entities` VALUES (13,19),(13,20),(13,21),(13,22),(15,28),(15,29),(15,30),(15,31),(15,32),(17,35),(17,36),(17,37),(18,38),(18,39),(18,40),(18,41),(20,46),(20,47),(20,48),(20,49),(21,50),(21,51),(21,52),(21,53),(22,54),(23,55),(23,56),(23,57),(23,58);
/*!40000 ALTER TABLE `order_entity_product_entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product_entity`
--

DROP TABLE IF EXISTS `order_product_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product_entity` (
  `order_product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_brand_name` varchar(255) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_image` longblob,
  `product_name` varchar(255) NOT NULL,
  `product_price` double NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_status` varchar(255) NOT NULL,
  `order_entity_order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`order_product_id`),
  KEY `FKa9r47pvpwfxisfj12b65nk0tk` (`order_entity_order_id`),
  CONSTRAINT `FKa9r47pvpwfxisfj12b65nk0tk` FOREIGN KEY (`order_entity_order_id`) REFERENCES `order_entity` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product_entity`
--

LOCK TABLES `order_product_entity` WRITE;
/*!40000 ALTER TABLE `order_product_entity` DISABLE KEYS */;
INSERT INTO `order_product_entity` VALUES (19,'Colgate','Deep freshness',_binary 'Colgate.jpg','Colgate',20,3,'Available',NULL),(20,'Dove','Silk with deep neutralization',_binary 'No.1.jpg','Dove',35,5,'Available',NULL),(21,'Panteen','Anti dandruff',_binary 'Dove1.jpg','Panteen',3,8,'Available',NULL),(22,'Ved farm','best product',_binary 'No.1.jpg','chana dal',203,2,'Available',NULL),(28,'Lux','Skin care soap',_binary 'Lux.jpg','Lux',28,3,'Available',NULL),(29,'Godrej','Skin care soap',_binary 'No.1.jpg','No. 1',18,5,'Available',NULL),(30,'Dove','Anti dandruff shampoo',_binary 'Dove1.jpg','Dove',2,10,'Available',NULL),(31,'Colgate','Deep freshness',_binary 'Colgate.jpg','Colgate',20,4,'Available',NULL),(32,'Tata','',_binary 'IMG_20181214_131640_HDR.jpg','Tata Salt',20,2,'Available',NULL),(35,'Dove','Anti dandruff shampoo',_binary 'Dove1.jpg','Dove',2,3,'Available',NULL),(36,'Colgate','Deep freshness',_binary 'Colgate.jpg','Colgate',20,8,'Available',NULL),(37,'Tata','',_binary 'IMG_20181214_131640_HDR.jpg','Tata Salt',20,4,'Available',NULL),(38,'Lux','',_binary 'Lux.jpg','Lux',25,5,'Available',NULL),(39,'Rin','Shudhh saphedi ki pehchan',_binary 'rashmika-mandanna-beautiful-hd-photos-mobile-wallpapers-hd-androidiphone-czxp.jpg','Rin',65,3,'Available',NULL),(40,'Panteen','Anti dandruff',_binary 'Dove1.jpg','Panteen',3,2,'Available',NULL),(41,'Ved farm','best product',_binary 'No.1.jpg','chana dal',203,4,'Available',NULL),(46,'Lux','',_binary 'Lux.jpg','Lux',25,3,'Available',NULL),(47,'Rin','Shudhh saphedi ki pehchan',_binary 'rashmika-mandanna-beautiful-hd-photos-mobile-wallpapers-hd-androidiphone-czxp.jpg','Rin',65,4,'Available',NULL),(48,'Panteen','Anti dandruff',_binary 'Dove1.jpg','Panteen',3,2,'Available',NULL),(49,'Ved farm','best product',_binary 'No.1.jpg','chana dal',203,3,'Available',NULL),(50,'Lux','Skin care soap',_binary 'Lux.jpg','Lux',28,3,'Available',NULL),(51,'Dove','Anti dandruff shampoo',_binary 'Dove1.jpg','Dove',2,3,'Available',NULL),(52,'Colgate','Deep freshness',_binary 'Colgate.jpg','Colgate',20,2,'Available',NULL),(53,'Tata','',_binary 'IMG_20181214_131640_HDR.jpg','Tata Salt',20,2,'Available',NULL),(54,'Godrej','Skin care soap',_binary 'No.1.jpg','No. 1',18,3,'Available',NULL),(55,'Lux','',_binary 'Lux.jpg','Lux',25,3,'Available',NULL),(56,'Rin','Shudhh saphedi ki pehchan',_binary 'rashmika-mandanna-beautiful-hd-photos-mobile-wallpapers-hd-androidiphone-czxp.jpg','Rin',65,3,'Available',NULL),(57,'Panteen','Anti dandruff',_binary 'Dove1.jpg','Panteen',3,3,'Available',NULL),(58,'Ved farm','best product',_binary 'No.1.jpg','chana dal',203,3,'Available',NULL);
/*!40000 ALTER TABLE `order_product_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_entity`
--

DROP TABLE IF EXISTS `product_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_entity` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pro_brandname` varchar(255) NOT NULL,
  `pro_description` varchar(255) NOT NULL,
  `pro_image` varchar(255) NOT NULL,
  `pro_name` varchar(255) NOT NULL,
  `pro_price` double NOT NULL,
  `pro_status` varchar(255) NOT NULL,
  `pro_weight` varchar(255) NOT NULL,
  `category_entity_category_id` bigint(20) DEFAULT NULL,
  `shop_entity_shop_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKh4xcx00q0xjt7386firgiri4l` (`category_entity_category_id`),
  KEY `FK24qlws8j4elesgtncnh9vieu2` (`shop_entity_shop_id`),
  CONSTRAINT `FK24qlws8j4elesgtncnh9vieu2` FOREIGN KEY (`shop_entity_shop_id`) REFERENCES `shop_entity` (`shop_id`),
  CONSTRAINT `FKh4xcx00q0xjt7386firgiri4l` FOREIGN KEY (`category_entity_category_id`) REFERENCES `category_entity` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_entity`
--

LOCK TABLES `product_entity` WRITE;
/*!40000 ALTER TABLE `product_entity` DISABLE KEYS */;
INSERT INTO `product_entity` VALUES (6,'Lux','','Lux.jpg','Lux',25,'Available','125 gm',1,6),(8,'Godrej','Skin care soap','No.1.jpg','No. 1',18,'Available','120 gm',1,7),(12,'Colgate','Deep freshness','Colgate.jpg','Colgate',20,'Available','20 gm',4,6),(13,'Tata','Desh ka shudh namak','IMG_20181214_131640_HDR.jpg','Tata Salt',20,'Available','1 kg',2,6),(14,'Dove','Silk with deep neutralization','No.1.jpg','Dove',35,'Available','125 gm',1,6),(15,'Rin','Shudhh saphedi ki pehchan','rashmika-mandanna-beautiful-hd-photos-mobile-wallpapers-hd-androidiphone-czxp.jpg','Rin',65,'Available','1 kg',5,6),(16,'Panteen','Anti dandruff','Dove1.jpg','Panteen',3,'Available','2 gm',3,6),(17,'Ved farm','best product','No.1.jpg','chana dal',203,'Available','500 gm',6,6);
/*!40000 ALTER TABLE `product_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_entity`
--

DROP TABLE IF EXISTS `role_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_entity` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_entity`
--

LOCK TABLES `role_entity` WRITE;
/*!40000 ALTER TABLE `role_entity` DISABLE KEYS */;
INSERT INTO `role_entity` VALUES (1,'ADMIN'),(2,'VENDOR'),(3,'USER');
/*!40000 ALTER TABLE `role_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_entity`
--

DROP TABLE IF EXISTS `shop_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_entity` (
  `shop_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address_line1` varchar(255) NOT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `pincode` bigint(20) NOT NULL,
  `record_status` varchar(255) DEFAULT NULL,
  `reg_date` date NOT NULL,
  `registration_type` varchar(255) DEFAULT NULL,
  `shop_name` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `bank_entity_bank_id` bigint(20) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`shop_id`),
  UNIQUE KEY `UK_8j8fdeu9sfhgrcrlu90e2p8bf` (`email`),
  UNIQUE KEY `UK_q5sx6toegkghgyvb5adc96y6c` (`mobile`),
  KEY `FKpuepcwjokmmoa3svsj1lalnpk` (`bank_entity_bank_id`),
  CONSTRAINT `FKpuepcwjokmmoa3svsj1lalnpk` FOREIGN KEY (`bank_entity_bank_id`) REFERENCES `bank_entity` (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_entity`
--

LOCK TABLES `shop_entity` WRITE;
/*!40000 ALTER TABLE `shop_entity` DISABLE KEYS */;
INSERT INTO `shop_entity` VALUES (6,'Bulding no 2 ,lane 2,Samarth nagar','Sai nagar,Warje Malwadi','Pune','gauravmaha97@gmail.com','Gaurav','Mahajan',7709919993,202520,'Active','2020-09-29','free','Sham Kirana','Maharashtra',1,'rashmika-mandanna_156074980000.jpg'),(7,'Shop no.10, Ground floor','Gandhi Market, Sai chowk','Pune','patilsiddhant9615@gamil.com','Siddhesh','Patil',9098991922,202520,'Active','2020-09-29','free','Mahavir Enterprises','Maharashtra',1,'rashmika-mandanna-beautiful-hd-photos-mobile-wallpapers-hd-androidiphone-czxp.jpg');
/*!40000 ALTER TABLE `shop_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yearly_report`
--

DROP TABLE IF EXISTS `yearly_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yearly_report` (
  `year` int(11) NOT NULL,
  `amount` double NOT NULL,
  `count` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yearly_report`
--

LOCK TABLES `yearly_report` WRITE;
/*!40000 ALTER TABLE `yearly_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `yearly_report` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-26 13:51:08
