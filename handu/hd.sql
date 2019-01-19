-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: handudb
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add head img',7,'add_headimg'),(20,'Can change head img',7,'change_headimg'),(21,'Can delete head img',7,'delete_headimg'),(22,'Can add hot',8,'add_hot'),(23,'Can change hot',8,'change_hot'),(24,'Can delete hot',8,'delete_hot'),(25,'Can add list',9,'add_list'),(26,'Can change list',9,'change_list'),(27,'Can delete list',9,'delete_list'),(28,'Can add list2',10,'add_list2'),(29,'Can change list2',10,'change_list2'),(30,'Can delete list2',10,'delete_list2'),(31,'Can add list3',11,'add_list3'),(32,'Can change list3',11,'change_list3'),(33,'Can delete list3',11,'delete_list3'),(34,'Can add list4',12,'add_list4'),(35,'Can change list4',12,'change_list4'),(36,'Can delete list4',12,'delete_list4'),(37,'Can add list5',13,'add_list5'),(38,'Can change list5',13,'change_list5'),(39,'Can delete list5',13,'delete_list5'),(40,'Can add user',14,'add_user'),(41,'Can change user',14,'change_user'),(42,'Can delete user',14,'delete_user'),(43,'Can add user m',15,'add_userm'),(44,'Can change user m',15,'change_userm'),(45,'Can delete user m',15,'delete_userm'),(46,'Can add cart',16,'add_cart'),(47,'Can change cart',16,'change_cart'),(48,'Can delete cart',16,'delete_cart');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(16,'handuapp','cart'),(7,'handuapp','headimg'),(8,'handuapp','hot'),(9,'handuapp','list'),(10,'handuapp','list2'),(11,'handuapp','list3'),(12,'handuapp','list4'),(13,'handuapp','list5'),(14,'handuapp','user'),(15,'handuapp','userm'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-01-15 10:41:15.280300'),(2,'auth','0001_initial','2019-01-15 10:41:16.245487'),(3,'admin','0001_initial','2019-01-15 10:41:16.527245'),(4,'admin','0002_logentry_remove_auto_add','2019-01-15 10:41:16.584086'),(5,'contenttypes','0002_remove_content_type_name','2019-01-15 10:41:16.767349'),(6,'auth','0002_alter_permission_name_max_length','2019-01-15 10:41:16.872180'),(7,'auth','0003_alter_user_email_max_length','2019-01-15 10:41:16.962791'),(8,'auth','0004_alter_user_username_opts','2019-01-15 10:41:16.981452'),(9,'auth','0005_alter_user_last_login_null','2019-01-15 10:41:17.042892'),(10,'auth','0006_require_contenttypes_0002','2019-01-15 10:41:17.049593'),(11,'auth','0007_alter_validators_add_error_messages','2019-01-15 10:41:17.072544'),(12,'auth','0008_alter_user_username_max_length','2019-01-15 10:41:17.201472'),(13,'handuapp','0001_initial','2019-01-15 10:41:17.626690'),(14,'sessions','0001_initial','2019-01-15 10:41:17.699157'),(15,'handuapp','0002_userm','2019-01-15 13:09:13.734755'),(16,'handuapp','0003_auto_20190115_1310','2019-01-15 13:11:10.343874'),(17,'handuapp','0004_cart','2019-01-16 08:55:04.430536');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `handuapp_cart`
--

DROP TABLE IF EXISTS `handuapp_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `handuapp_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `isselect` tinyint(1) NOT NULL,
  `list1_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `handuapp_cart_list1_id_14188b69_fk_handuapp_list_id` (`list1_id`),
  KEY `handuapp_cart_user_id_ccea851a_fk_handuapp_user_id` (`user_id`),
  CONSTRAINT `handuapp_cart_list1_id_14188b69_fk_handuapp_list_id` FOREIGN KEY (`list1_id`) REFERENCES `handuapp_list` (`id`),
  CONSTRAINT `handuapp_cart_user_id_ccea851a_fk_handuapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `handuapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `handuapp_cart`
--

LOCK TABLES `handuapp_cart` WRITE;
/*!40000 ALTER TABLE `handuapp_cart` DISABLE KEYS */;
INSERT INTO `handuapp_cart` VALUES (1,0,1,2,5),(2,0,1,5,5),(3,0,1,4,5),(4,0,1,7,5),(5,0,1,6,5),(6,1,1,3,5),(7,0,1,1,5),(8,0,1,9,5),(9,0,1,8,5),(10,4,1,4,6),(11,0,1,10,5);
/*!40000 ALTER TABLE `handuapp_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `handuapp_headimg`
--

DROP TABLE IF EXISTS `handuapp_headimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `handuapp_headimg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `headimg` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `handuapp_headimg`
--

LOCK TABLES `handuapp_headimg` WRITE;
/*!40000 ALTER TABLE `handuapp_headimg` DISABLE KEYS */;
INSERT INTO `handuapp_headimg` VALUES (1,'static/images/banner-1.jpg'),(2,'static/images/banner-2.jpg'),(3,'static/images/banner-1.jpg'),(4,'static/images/banner-2.jpg');
/*!40000 ALTER TABLE `handuapp_headimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `handuapp_hot`
--

DROP TABLE IF EXISTS `handuapp_hot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `handuapp_hot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timg` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `price` varchar(40) NOT NULL,
  `unit` varchar(40) NOT NULL,
  `wimg` varchar(40) NOT NULL,
  `sold` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `handuapp_hot`
--

LOCK TABLES `handuapp_hot` WRITE;
/*!40000 ALTER TABLE `handuapp_hot` DISABLE KEYS */;
INSERT INTO `handuapp_hot` VALUES (1,'static/images/01.png','2017韩版女夏装新款显','158.00','328.00','static/images/007.jpg','已售出6666笔'),(2,'static/images/02.png','2017韩版女夏装新款宽','158.00','328.00','static/images/008.jpg','已售出8888笔'),(3,'static/images/03.png','2017韩版女夏装新款显','158.00','328.00','static/images/003.jpg','已售出6666笔'),(4,'static/images/04.png','2017韩版女夏装新款显','158.00','328.00','static/images/004.jpg','已售出8888笔'),(5,'static/images/05.png','2017韩版女夏装新款显','158.00','328.00','static/images/005.jpg','已售出6666笔'),(6,'static/images/06.png','2017韩版女夏装新款显','158.00','328.00','static/images/004.jpg','已售出8888笔'),(7,'static/images/07.png','2017韩版女夏装新款显','158.00','328.00','static/images/007.jpg','已售出6666笔'),(8,'static/images/08.png','2017韩版女夏装新款显','158.00','328.00','static/images/008.jpg','已售出8888笔'),(9,'static/images/01.png','2017韩版女夏装新款显','158.00','328.00','static/images/007.jpg','已售出6666笔'),(10,'static/images/02.png','2017韩版女夏装新款宽','158.00','328.00','static/images/008.jpg','已售出8888笔'),(11,'static/images/03.png','2017韩版女夏装新款显','158.00','328.00','static/images/003.jpg','已售出6666笔'),(12,'static/images/04.png','2017韩版女夏装新款显','158.00','328.00','static/images/004.jpg','已售出8888笔'),(13,'static/images/05.png','2017韩版女夏装新款显','158.00','328.00','static/images/005.jpg','已售出6666笔'),(14,'static/images/06.png','2017韩版女夏装新款显','158.00','328.00','static/images/004.jpg','已售出8888笔'),(15,'static/images/07.png','2017韩版女夏装新款显','158.00','328.00','static/images/007.jpg','已售出6666笔'),(16,'static/images/08.png','2017韩版女夏装新款显','158.00','328.00','static/images/008.jpg','已售出8888笔');
/*!40000 ALTER TABLE `handuapp_hot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `handuapp_list`
--

DROP TABLE IF EXISTS `handuapp_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `handuapp_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` varchar(30) NOT NULL,
  `unit` varchar(30) NOT NULL,
  `text` varchar(30) NOT NULL,
  `name` varchar(60) NOT NULL,
  `headimg` varchar(30) NOT NULL,
  `midimg` varchar(30) NOT NULL,
  `smallimg1` varchar(30) NOT NULL,
  `smallimg2` varchar(30) NOT NULL,
  `smallimg3` varchar(30) NOT NULL,
  `smallimg4` varchar(30) NOT NULL,
  `smallimg5` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `handuapp_list`
--

LOCK TABLES `handuapp_list` WRITE;
/*!40000 ALTER TABLE `handuapp_list` DISABLE KEYS */;
INSERT INTO `handuapp_list` VALUES (1,'106','200.0','立即抢购','韩都衣舍2017韩版女装秋装新款宽松显瘦蕾丝长袖T恤OKY9216湲0818','/static/images/111.jpg','/static/images/detail1.jpg','/static/images/detail1.jpg','/static/images/detail1-2.jpg','/static/images/detail1-3.jpg','/static/images/detail1-4.jpg','/static/images/detail1-5.jpg'),(2,'88','178.0','立即抢购','韩都衣舍2017韩版女装秋装新款宽松百搭打底上衣长袖T恤DQ8860堯','/static/images/222.jpg','/static/images/detail2.jpg','/static/images/detail2.jpg','/static/images/detail2-2.jpg','/static/images/detail2-3.jpg','/static/images/detail2-4.jpg','/static/images/detail2-5.jpg'),(3,'126','200.0','立即抢购','韩都衣舍2017韩版女装秋装新款宽松字母印花短款T恤AA8247玎0824','/static/images/333.jpg','/static/images/detail3.jpg','/static/images/detail3.jpg','/static/images/detail3-2.jpg','/static/images/detail3-3.jpg','/static/images/detail3-4.jpg','/static/images/detail3-2.jpg'),(4,'233','200.0','立即抢购','韩都衣舍2017秋装新款女装韩版纯色百搭打底连帽卫衣TK9717婏0809','/static/images/444.jpg','/static/images/detail4.jpg','/static/images/detail4.jpg','/static/images/detail4-2.jpg','/static/images/detail4-3.jpg','/static/images/detail4-4.jpg','/static/images/detail4-5.jpg'),(5,'125','200.0','立即抢购','韩都衣舍2017秋装新款韩版女装字母宽松收腰连衣裙MR7586汩0802','/static/images/555.jpg','/static/images/detail5.jpg','/static/images/detail5.jpg','/static/images/detail5-2.jpg','/static/images/detail5-3.jpg','/static/images/detail5-4.jpg','/static/images/detail5-5.jpg'),(6,'231','200.0','立即抢购','韩都衣舍2017韩版女秋装新款纯色宽松网纱长袖T恤EQ9084婋0726','/static/images/666.jpg','/static/images/detail6.jpg','/static/images/detail6.jpg','/static/images/detail6-2.jpg','/static/images/detail6-3.jpg','/static/images/detail6-4.jpg','/static/images/detail6-5.jpg'),(7,'221','200.0','立即抢购','韩都衣舍2017韩版女装秋新款宽松V领不对称飘带T恤AA8841玎0828','/static/images/777.jpg','/static/images/detail7.jpg','/static/images/detail7.jpg','/static/images/detail7-2.jpg','/static/images/detail7-3.jpg','/static/images/detail7-4.jpg','/static/images/detail7-5.jpg'),(8,'235','200.0','立即抢购','韩都衣舍2017秋装新款韩版女装系带针织长袖连衣裙MR7196汩0731','/static/images/888.jpg','/static/images/detail8.jpg','/static/images/detail8.jpg','/static/images/detail8-2.jpg','/static/images/detail8-3.jpg','/static/images/detail8-4.jpg','/static/images/detail8-5.jpg'),(9,'324','200.0','立即抢购','韩都衣舍2017秋装新女韩版字母织带上衣宽松连帽卫衣TK8340婏0817','/static/images/999.jpg','/static/images/detail9.jpg','/static/images/detail9.jpg','/static/images/detail9-2.jpg','/static/images/detail9-3.jpg','/static/images/detail9-4.jpg','/static/images/detail9-5.jpg'),(10,'221','200.0','立即抢购','韩都衣舍2017韩版女秋装新款宽松字母织带长袖T恤EJ8473廵0726','/static/images/000.jpg','/static/images/detail10.jpg','/static/images/detail10.jpg','/static/images/detail10-2.jpg','/static/images/detail10-3.jpg','/static/images/detail10-4.jpg','/static/images/detail10-5.jpg');
/*!40000 ALTER TABLE `handuapp_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `handuapp_list2`
--

DROP TABLE IF EXISTS `handuapp_list2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `handuapp_list2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` varchar(60) NOT NULL,
  `unit` varchar(60) NOT NULL,
  `text` varchar(60) NOT NULL,
  `himg` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `handuapp_list2`
--

LOCK TABLES `handuapp_list2` WRITE;
/*!40000 ALTER TABLE `handuapp_list2` DISABLE KEYS */;
INSERT INTO `handuapp_list2` VALUES (1,'106','200','立即抢购','static/images/1111.jpg'),(2,'106','200','立即抢购','static/images/2222.jpg'),(3,'106','200','立即抢购','static/images/3333.jpg'),(4,'106','200','立即抢购','static/images/4444.jpg'),(5,'106','200','立即抢购','static/images/5555.jpg');
/*!40000 ALTER TABLE `handuapp_list2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `handuapp_list3`
--

DROP TABLE IF EXISTS `handuapp_list3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `handuapp_list3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` varchar(60) NOT NULL,
  `unit` varchar(60) NOT NULL,
  `text` varchar(60) NOT NULL,
  `himg` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `handuapp_list3`
--

LOCK TABLES `handuapp_list3` WRITE;
/*!40000 ALTER TABLE `handuapp_list3` DISABLE KEYS */;
INSERT INTO `handuapp_list3` VALUES (1,'106','200','立即抢购','static/images/11111.jpg'),(2,'106','200','立即抢购','static/images/22222.jpg'),(3,'106','200','立即抢购','static/images/33333.jpg'),(4,'106','200','立即抢购','static/images/44444.jpg'),(5,'106','200','立即抢购','static/images/55555.jpg'),(6,'106','200','立即抢购','static/images/111111.jpg'),(7,'106','200','立即抢购','static/images/222222.jpg'),(8,'106','200','立即抢购','static/images/333333.jpg'),(9,'106','200','立即抢购','static/images/444444.jpg'),(10,'106','200','立即抢购','static/images/555555.jpg'),(11,'106','200','立即抢购','static/images/1111111.jpg'),(12,'106','200','立即抢购','static/images/2222222.jpg'),(13,'106','200','立即抢购','static/images/3333333.jpg'),(14,'106','200','立即抢购','static/images/4444444.jpg'),(15,'106','200','立即抢购','static/images/5555555.jpg');
/*!40000 ALTER TABLE `handuapp_list3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `handuapp_list4`
--

DROP TABLE IF EXISTS `handuapp_list4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `handuapp_list4` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` varchar(60) NOT NULL,
  `unit` varchar(60) NOT NULL,
  `text` varchar(60) NOT NULL,
  `himg` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `handuapp_list4`
--

LOCK TABLES `handuapp_list4` WRITE;
/*!40000 ALTER TABLE `handuapp_list4` DISABLE KEYS */;
/*!40000 ALTER TABLE `handuapp_list4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `handuapp_list5`
--

DROP TABLE IF EXISTS `handuapp_list5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `handuapp_list5` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` varchar(60) NOT NULL,
  `unit` varchar(60) NOT NULL,
  `text` varchar(60) NOT NULL,
  `himg` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `handuapp_list5`
--

LOCK TABLES `handuapp_list5` WRITE;
/*!40000 ALTER TABLE `handuapp_list5` DISABLE KEYS */;
/*!40000 ALTER TABLE `handuapp_list5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `handuapp_user`
--

DROP TABLE IF EXISTS `handuapp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `handuapp_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `handuapp_user`
--

LOCK TABLES `handuapp_user` WRITE;
/*!40000 ALTER TABLE `handuapp_user` DISABLE KEYS */;
INSERT INTO `handuapp_user` VALUES (5,'18611111111','fb7501217d60223532975f9785dfe0f767ce31a49896357c0d2ce2c9d9b25c2d','de8f6115b2a532d46a3c1eef3fd3b71d'),(6,'18622222222','698feee62784852fa04f9ee626f6b3969958b601dbd945bf61cbbe86853b3811','ac575e3a6a129da5ed206958e9b7f501');
/*!40000 ALTER TABLE `handuapp_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-19  3:30:51
