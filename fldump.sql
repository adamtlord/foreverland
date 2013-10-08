-- MySQL dump 10.13  Distrib 5.6.10, for osx10.8 (x86_64)
--
-- Host: localhost    Database: foreverland
-- ------------------------------------------------------
-- Server version	5.6.10

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
-- Table structure for table `accounts_userprofile`
--

DROP TABLE IF EXISTS `accounts_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `newsletter_subscribe` tinyint(1) NOT NULL,
  `picture` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_id_refs_id_a240fa0c` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_userprofile`
--

LOCK TABLES `accounts_userprofile` WRITE;
/*!40000 ALTER TABLE `accounts_userprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ahm_files`
--

DROP TABLE IF EXISTS `ahm_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ahm_files` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `file` varchar(255) NOT NULL,
  `password` varchar(40) NOT NULL,
  `download_count` int(11) NOT NULL,
  `access` varchar(6) NOT NULL,
  `show_counter` int(11) NOT NULL,
  `link_label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ahm_files`
--

LOCK TABLES `ahm_files` WRITE;
/*!40000 ALTER TABLE `ahm_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `ahm_files` ENABLE KEYS */;
UNLOCK TABLES;

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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `permission_id_refs_id_6ba0f519` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=280 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add migration history',8,'add_migrationhistory'),(23,'Can change migration history',8,'change_migrationhistory'),(24,'Can delete migration history',8,'delete_migrationhistory'),(25,'Can add testimonial',9,'add_testimonial'),(26,'Can change testimonial',9,'change_testimonial'),(27,'Can delete testimonial',9,'delete_testimonial'),(28,'Can add member',10,'add_member'),(29,'Can change member',10,'change_member'),(30,'Can delete member',10,'delete_member'),(31,'Can add venue',11,'add_venue'),(32,'Can change venue',11,'change_venue'),(33,'Can delete venue',11,'delete_venue'),(34,'Can add show',12,'add_show'),(35,'Can change show',12,'change_show'),(36,'Can delete show',12,'delete_show'),(37,'Can add song',13,'add_song'),(38,'Can change song',13,'change_song'),(39,'Can delete song',13,'delete_song'),(40,'Can add setlist',14,'add_setlist'),(41,'Can change setlist',14,'change_setlist'),(42,'Can delete setlist',14,'delete_setlist'),(43,'Can add setlist song',15,'add_setlistsong'),(44,'Can change setlist song',15,'change_setlistsong'),(45,'Can delete setlist song',15,'delete_setlistsong'),(46,'Can add album',16,'add_album'),(47,'Can change album',16,'change_album'),(48,'Can delete album',16,'delete_album'),(49,'Can add tag',17,'add_tag'),(50,'Can change tag',17,'change_tag'),(51,'Can delete tag',17,'delete_tag'),(52,'Can add image',18,'add_image'),(53,'Can change image',18,'change_image'),(54,'Can delete image',18,'delete_image'),(55,'Can add video',19,'add_video'),(56,'Can change video',19,'change_video'),(57,'Can delete video',19,'delete_video'),(58,'Can add user profile',20,'add_userprofile'),(59,'Can change user profile',20,'change_userprofile'),(60,'Can delete user profile',20,'delete_userprofile'),(61,'Can add registration profile',21,'add_registrationprofile'),(62,'Can change registration profile',21,'change_registrationprofile'),(63,'Can delete registration profile',21,'delete_registrationprofile'),(67,'Can add wp bwbps categories',23,'add_wpbwbpscategories'),(68,'Can change wp bwbps categories',23,'change_wpbwbpscategories'),(69,'Can delete wp bwbps categories',23,'delete_wpbwbpscategories'),(70,'Can add wp bwbps customdata',24,'add_wpbwbpscustomdata'),(71,'Can change wp bwbps customdata',24,'change_wpbwbpscustomdata'),(72,'Can delete wp bwbps customdata',24,'delete_wpbwbpscustomdata'),(73,'Can add wp bwbps favorites',25,'add_wpbwbpsfavorites'),(74,'Can change wp bwbps favorites',25,'change_wpbwbpsfavorites'),(75,'Can delete wp bwbps favorites',25,'delete_wpbwbpsfavorites'),(76,'Can add wp bwbps fields',26,'add_wpbwbpsfields'),(77,'Can change wp bwbps fields',26,'change_wpbwbpsfields'),(78,'Can delete wp bwbps fields',26,'delete_wpbwbpsfields'),(79,'Can add wp bwbps forms',27,'add_wpbwbpsforms'),(80,'Can change wp bwbps forms',27,'change_wpbwbpsforms'),(81,'Can delete wp bwbps forms',27,'delete_wpbwbpsforms'),(82,'Can add wp bwbps galleries',28,'add_wpbwbpsgalleries'),(83,'Can change wp bwbps galleries',28,'change_wpbwbpsgalleries'),(84,'Can delete wp bwbps galleries',28,'delete_wpbwbpsgalleries'),(85,'Can add wp bwbps imageratings',29,'add_wpbwbpsimageratings'),(86,'Can change wp bwbps imageratings',29,'change_wpbwbpsimageratings'),(87,'Can delete wp bwbps imageratings',29,'delete_wpbwbpsimageratings'),(88,'Can add wp bwbps images',30,'add_wpbwbpsimages'),(89,'Can change wp bwbps images',30,'change_wpbwbpsimages'),(90,'Can delete wp bwbps images',30,'delete_wpbwbpsimages'),(91,'Can add wp bwbps layouts',31,'add_wpbwbpslayouts'),(92,'Can change wp bwbps layouts',31,'change_wpbwbpslayouts'),(93,'Can delete wp bwbps layouts',31,'delete_wpbwbpslayouts'),(94,'Can add wp bwbps lookup',32,'add_wpbwbpslookup'),(95,'Can change wp bwbps lookup',32,'change_wpbwbpslookup'),(96,'Can delete wp bwbps lookup',32,'delete_wpbwbpslookup'),(97,'Can add wp bwbps params',33,'add_wpbwbpsparams'),(98,'Can change wp bwbps params',33,'change_wpbwbpsparams'),(99,'Can delete wp bwbps params',33,'delete_wpbwbpsparams'),(100,'Can add wp bwbps ratingssummary',34,'add_wpbwbpsratingssummary'),(101,'Can change wp bwbps ratingssummary',34,'change_wpbwbpsratingssummary'),(102,'Can delete wp bwbps ratingssummary',34,'delete_wpbwbpsratingssummary'),(103,'Can add wp commentmeta',35,'add_wpcommentmeta'),(104,'Can change wp commentmeta',35,'change_wpcommentmeta'),(105,'Can delete wp commentmeta',35,'delete_wpcommentmeta'),(106,'Can add wp comments',36,'add_wpcomments'),(107,'Can change wp comments',36,'change_wpcomments'),(108,'Can delete wp comments',36,'delete_wpcomments'),(109,'Can add wp gigpress artists',37,'add_wpgigpressartists'),(110,'Can change wp gigpress artists',37,'change_wpgigpressartists'),(111,'Can delete wp gigpress artists',37,'delete_wpgigpressartists'),(112,'Can add wp gigpress shows',38,'add_wpgigpressshows'),(113,'Can change wp gigpress shows',38,'change_wpgigpressshows'),(114,'Can delete wp gigpress shows',38,'delete_wpgigpressshows'),(115,'Can add wp gigpress tours',39,'add_wpgigpresstours'),(116,'Can change wp gigpress tours',39,'change_wpgigpresstours'),(117,'Can delete wp gigpress tours',39,'delete_wpgigpresstours'),(118,'Can add wp gigpress venues',40,'add_wpgigpressvenues'),(119,'Can change wp gigpress venues',40,'change_wpgigpressvenues'),(120,'Can delete wp gigpress venues',40,'delete_wpgigpressvenues'),(121,'Can add wp links',41,'add_wplinks'),(122,'Can change wp links',41,'change_wplinks'),(123,'Can delete wp links',41,'delete_wplinks'),(124,'Can add wp ngg album',42,'add_wpnggalbum'),(125,'Can change wp ngg album',42,'change_wpnggalbum'),(126,'Can delete wp ngg album',42,'delete_wpnggalbum'),(127,'Can add wp ngg gallery',43,'add_wpngggallery'),(128,'Can change wp ngg gallery',43,'change_wpngggallery'),(129,'Can delete wp ngg gallery',43,'delete_wpngggallery'),(130,'Can add wp ngg pictures',44,'add_wpnggpictures'),(131,'Can change wp ngg pictures',44,'change_wpnggpictures'),(132,'Can delete wp ngg pictures',44,'delete_wpnggpictures'),(142,'Can add wp options',48,'add_wpoptions'),(143,'Can change wp options',48,'change_wpoptions'),(144,'Can delete wp options',48,'delete_wpoptions'),(145,'Can add wp postmeta',49,'add_wppostmeta'),(146,'Can change wp postmeta',49,'change_wppostmeta'),(147,'Can delete wp postmeta',49,'delete_wppostmeta'),(148,'Can add wp posts',50,'add_wpposts'),(149,'Can change wp posts',50,'change_wpposts'),(150,'Can delete wp posts',50,'delete_wpposts'),(151,'Can add wp randomtext',51,'add_wprandomtext'),(152,'Can change wp randomtext',51,'change_wprandomtext'),(153,'Can delete wp randomtext',51,'delete_wprandomtext'),(154,'Can add wp term relationships',52,'add_wptermrelationships'),(155,'Can change wp term relationships',52,'change_wptermrelationships'),(156,'Can delete wp term relationships',52,'delete_wptermrelationships'),(157,'Can add wp term taxonomy',53,'add_wptermtaxonomy'),(158,'Can change wp term taxonomy',53,'change_wptermtaxonomy'),(159,'Can delete wp term taxonomy',53,'delete_wptermtaxonomy'),(160,'Can add wp terms',54,'add_wpterms'),(161,'Can change wp terms',54,'change_wpterms'),(162,'Can delete wp terms',54,'delete_wpterms'),(163,'Can add wp usermeta',55,'add_wpusermeta'),(164,'Can change wp usermeta',55,'change_wpusermeta'),(165,'Can delete wp usermeta',55,'delete_wpusermeta'),(166,'Can add wp users',56,'add_wpusers'),(167,'Can change wp users',56,'change_wpusers'),(168,'Can delete wp users',56,'delete_wpusers'),(169,'Can add wp wpb2d excluded files',57,'add_wpwpb2dexcludedfiles'),(170,'Can change wp wpb2d excluded files',57,'change_wpwpb2dexcludedfiles'),(171,'Can delete wp wpb2d excluded files',57,'delete_wpwpb2dexcludedfiles'),(172,'Can add wp wpb2d options',58,'add_wpwpb2doptions'),(173,'Can change wp wpb2d options',58,'change_wpwpb2doptions'),(174,'Can delete wp wpb2d options',58,'delete_wpwpb2doptions'),(175,'Can add wp wpb2d premium extensions',59,'add_wpwpb2dpremiumextensions'),(176,'Can change wp wpb2d premium extensions',59,'change_wpwpb2dpremiumextensions'),(177,'Can delete wp wpb2d premium extensions',59,'delete_wpwpb2dpremiumextensions'),(178,'Can add wp wpb2d processed files',60,'add_wpwpb2dprocessedfiles'),(179,'Can change wp wpb2d processed files',60,'change_wpwpb2dprocessedfiles'),(180,'Can delete wp wpb2d processed files',60,'delete_wpwpb2dprocessedfiles'),(277,'Can add ahm files',93,'add_ahmfiles'),(278,'Can change ahm files',93,'change_ahmfiles'),(279,'Can delete ahm files',93,'delete_ahmfiles');
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
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'sha1$f845f$aecde55c9ba5e88a646728071c2ae54f4b47684f','2013-01-01 00:00:02',1,'admin','','','admin@tivix.com',1,1,'2013-01-01 00:00:01');
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
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `group_id_refs_id_274b862c` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `permission_id_refs_id_35d9ac25` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_refs_id_c0d12874` (`user_id`),
  KEY `content_type_id_refs_id_93d2d1f8` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=828 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2013-09-27 10:35:52',1,9,'1','I laughed, I cried, it was better than CATS. I\'d see it again and again. Fan 4 Lyfe.',1,''),(2,'2013-09-29 21:08:06',1,11,'2','Don Quixote\'s International Music Hall',3,''),(3,'2013-09-29 21:08:06',1,11,'1','Bimbo\'s 365 Club',3,''),(4,'2013-09-30 10:47:37',1,12,'402','06/23/13 Belly Up Aspen',3,''),(5,'2013-09-30 10:47:37',1,12,'401','06/22/13 Rock Into The Wild',3,''),(6,'2013-09-30 10:47:37',1,12,'400','06/21/13 Cervantes\' Masterpiece Ballroom',3,''),(7,'2013-09-30 10:47:37',1,12,'399','09/13/13 Redwood City Music on the Square',3,''),(8,'2013-09-30 10:47:37',1,12,'398','09/28/13 Mystic Theatre',3,''),(9,'2013-09-30 10:47:37',1,12,'397','08/16/13 Brisbane Concerts in the Park',3,''),(10,'2013-09-30 10:47:37',1,12,'396','08/23/13 Powerhouse Pub',3,''),(11,'2013-09-30 10:47:37',1,12,'395','07/05/13 Blackhawk Plaza',3,''),(12,'2013-09-30 10:47:37',1,12,'394','06/14/13 The New Parish',3,''),(13,'2013-09-30 10:47:37',1,12,'393','06/13/13 Los Altos Summer Concert Series',3,''),(14,'2013-09-30 10:47:37',1,12,'392','05/25/13 Harlow\'s',3,''),(15,'2013-09-30 10:47:37',1,12,'391','05/18/13 Slim\'s',3,''),(16,'2013-09-30 10:47:37',1,12,'390','06/27/13 Montgomery Village',3,''),(17,'2013-09-30 10:47:37',1,12,'389','08/10/13 California Beer Fest',3,''),(18,'2013-09-30 10:47:37',1,12,'388','07/11/13 Music & Market Series',3,''),(19,'2013-09-30 10:47:37',1,12,'387','09/21/13 California Beer Fest',3,''),(20,'2013-09-30 10:47:37',1,12,'386','02/22/13 The New Parish',3,''),(21,'2013-09-30 10:47:37',1,12,'385','02/22/13 The New Parish',3,''),(22,'2013-09-30 10:47:37',1,12,'384','01/25/13 Club Fox',3,''),(23,'2013-09-30 10:47:37',1,12,'383','10/19/13 Club Fox',3,''),(24,'2013-09-30 10:47:37',1,12,'382','07/20/13 Club Fox',3,''),(25,'2013-09-30 10:47:37',1,12,'381','04/20/13 Club Fox',3,''),(26,'2013-09-30 10:47:37',1,12,'380','01/26/13 Bimbo\'s',3,''),(27,'2013-09-30 10:47:37',1,12,'379','12/28/13 Don Quixote\'s',3,''),(28,'2013-09-30 10:47:37',1,12,'378','05/17/13 Don Quixote\'s',3,''),(29,'2013-09-30 10:47:37',1,12,'377','08/24/13 Bimbo\'s',3,''),(30,'2013-09-30 10:47:37',1,12,'376','06/08/13 Black Oak Casino',3,''),(31,'2013-09-30 10:47:37',1,12,'375','10/26/13 Bimbo\'s',3,''),(32,'2013-09-30 10:47:37',1,12,'374','10/18/13 Don Quixote\'s',3,''),(33,'2013-09-30 10:47:37',1,12,'373','07/26/13 Don Quixote\'s',3,''),(34,'2013-09-30 10:47:37',1,12,'372','04/20/13 The New Parish',3,''),(35,'2013-09-30 10:47:37',1,12,'371','04/12/13 Bimbo\'s',3,''),(36,'2013-09-30 10:47:37',1,12,'370','03/02/13 Mystic Theatre',3,''),(37,'2013-09-30 10:47:37',1,12,'369','02/23/13 Don Quixote\'s',3,''),(38,'2013-09-30 10:47:37',1,12,'368','02/16/14 The New Parish',3,''),(39,'2013-09-30 10:47:38',1,12,'367','01/12/13 Sweetwater Music Hall',3,''),(40,'2013-09-30 10:47:38',1,12,'366','12/29/12 Club Fox',3,''),(41,'2013-09-30 10:47:38',1,12,'365','10/25/12 Reunion Nightclub',3,''),(42,'2013-09-30 10:47:38',1,12,'364','11/18/12 Pittsburg Creative Arts Building',3,''),(43,'2013-09-30 10:47:38',1,12,'363','10/05/12 Jon Lovitz Comedy Club',3,''),(44,'2013-09-30 10:47:38',1,12,'362','10/27/12 Bimbo\'s',3,''),(45,'2013-09-30 10:47:38',1,12,'361','09/14/12 Velvet Jones',3,''),(46,'2013-09-30 10:47:38',1,12,'360','08/30/12 Montgomery Village',3,''),(47,'2013-09-30 10:47:38',1,12,'359','10/06/12 California Beer Fest',3,''),(48,'2013-09-30 10:47:38',1,12,'358','09/13/12 Fulton 55',3,''),(49,'2013-09-30 10:47:38',1,12,'357','08/02/12 Hood River Summer Concerts Series',3,''),(50,'2013-09-30 10:47:38',1,12,'356','08/01/12 Concerts in the Park - Sounds of Summer Series',3,''),(51,'2013-09-30 10:47:38',1,12,'355','07/25/12 Pruneyard Concert Series',3,''),(52,'2013-09-30 10:47:38',1,12,'354','07/14/12 George\'s Night Club',3,''),(53,'2013-09-30 10:47:38',1,12,'353','08/09/12 Music & Market Series',3,''),(54,'2013-09-30 10:47:38',1,12,'352','08/31/12 Redwood City Music on the Square',3,''),(55,'2013-09-30 10:47:38',1,12,'351','08/18/12 Silverton Casino Hotel',3,''),(56,'2013-09-30 10:47:38',1,12,'350','08/17/12 Friday Night Live @ Trails Park',3,''),(57,'2013-09-30 10:47:38',1,12,'349','01/05/13 Powerhouse Pub',3,''),(58,'2013-09-30 10:47:38',1,12,'348','12/28/12 Don Quixote\'s',3,''),(59,'2013-09-30 10:47:38',1,12,'347','12/08/12 Dan\'s Bar',3,''),(60,'2013-09-30 10:47:38',1,12,'346','07/20/12 Dan\'s Bar',3,''),(61,'2013-09-30 10:47:38',1,12,'345','07/13/12 Stonecreek Village Summer Concert Series',3,''),(62,'2013-09-30 10:47:38',1,12,'344','06/01/12 El Dorado Hills Concert Series',3,''),(63,'2013-09-30 10:47:38',1,12,'343','12/01/12 George\'s Night Club',3,''),(64,'2013-09-30 10:47:38',1,12,'342','11/16/12 The New Parish',3,''),(65,'2013-09-30 10:47:38',1,12,'341','05/11/12 The New Parish',3,''),(66,'2013-09-30 10:47:38',1,12,'340','09/22/12 California Beer Fest',3,''),(67,'2013-09-30 10:47:38',1,12,'339','09/15/12 California Beer Fest',3,''),(68,'2013-09-30 10:47:38',1,12,'338','07/28/12 California Beer Fest',3,''),(69,'2013-09-30 10:47:38',1,12,'337','11/17/12 Red Devil Lounge',3,''),(70,'2013-09-30 10:47:38',1,12,'336','09/21/12 Red Devil Lounge',3,''),(71,'2013-09-30 10:47:38',1,12,'335','08/25/12 Bimbo\'s',3,''),(72,'2013-09-30 10:47:38',1,12,'334','07/27/12 Red Devil Lounge',3,''),(73,'2013-09-30 10:47:38',1,12,'333','07/06/12 Blackhawk Plaza',3,''),(74,'2013-09-30 10:47:38',1,12,'332','06/23/12 Bimbo\'s',3,''),(75,'2013-09-30 10:47:38',1,12,'331','02/10/12 Fulton 55',3,''),(76,'2013-09-30 10:47:38',1,12,'330','09/28/12 Don Quixote\'s',3,''),(77,'2013-09-30 10:47:38',1,12,'329','08/11/12 Don Quixote\'s',3,''),(78,'2013-09-30 10:47:38',1,12,'328','06/02/12 Don Quixote\'s',3,''),(79,'2013-09-30 10:47:38',1,12,'327','04/27/12 Don Quixote\'s',3,''),(80,'2013-09-30 10:47:38',1,12,'326','02/24/12 Don Quixote\'s',3,''),(81,'2013-09-30 10:47:38',1,12,'325','02/04/12 The New Parish',3,''),(82,'2013-09-30 10:47:38',1,12,'324','01/05/12 Private Event',3,''),(83,'2013-09-30 10:47:38',1,12,'323','12/17/11 Private Event',3,''),(84,'2013-09-30 10:47:38',1,12,'322','09/29/12 Palo Alto Black & White Ball',3,''),(85,'2013-09-30 10:47:38',1,12,'321','05/12/12 Private Event',3,''),(86,'2013-09-30 10:47:38',1,12,'320','04/20/12 Red Devil Lounge',3,''),(87,'2013-09-30 10:47:38',1,12,'319','03/31/12 Dan\'s Bar',3,''),(88,'2013-09-30 10:47:38',1,12,'318','03/23/12 George\'s Night Club',3,''),(89,'2013-09-30 10:47:38',1,12,'317','03/09/12 Bimbo\'s',3,''),(90,'2013-09-30 10:47:38',1,12,'316','02/25/12 Dan\'s Bar',3,''),(91,'2013-09-30 10:47:38',1,12,'315','02/03/12 Red Devil Lounge',3,''),(92,'2013-09-30 10:47:38',1,12,'314','01/14/12 Dan\'s Bar',3,''),(93,'2013-09-30 10:47:38',1,12,'313','12/31/11 Bimbo\'s',3,''),(94,'2013-09-30 10:47:38',1,12,'312','11/19/11 George\'s Night Club',3,''),(95,'2013-09-30 10:47:38',1,12,'311','12/16/11 Private Event',3,''),(96,'2013-09-30 10:47:38',1,12,'310','10/20/11 Private Event',3,''),(97,'2013-09-30 10:47:38',1,12,'309','11/04/11 Stockton Empire Theatre',3,''),(98,'2013-09-30 10:47:38',1,12,'308','10/21/11 The Avalon',3,''),(99,'2013-09-30 10:47:38',1,12,'307','08/28/11 Oakland Chinatown StreetFest',3,''),(100,'2013-09-30 10:47:38',1,12,'306','12/09/11 Private Event',3,''),(101,'2013-09-30 10:47:38',1,12,'305','03/30/12 Powerhouse Pub',3,''),(102,'2013-09-30 10:47:38',1,12,'304','12/03/11 Red Devil Lounge',3,''),(103,'2013-09-30 10:47:38',1,12,'303','11/11/11 Powerhouse Pub',3,''),(104,'2013-09-30 10:47:50',1,12,'302','11/05/11 Dan\'s Bar',3,''),(105,'2013-09-30 10:47:50',1,12,'301','10/29/11 Bimbo\'s',3,''),(106,'2013-09-30 10:47:50',1,12,'300','09/30/11 Fulton 55',3,''),(107,'2013-09-30 10:47:50',1,12,'299','11/12/11 The Knitting Factory',3,''),(108,'2013-09-30 10:47:50',1,12,'298','07/04/11 SF Independence Day Extravaganza',3,''),(109,'2013-09-30 10:47:50',1,12,'297','07/19/12 Los Altos Summer Concert Series',3,''),(110,'2013-09-30 10:47:50',1,12,'296','09/24/11 Mountain House Concert Series',3,''),(111,'2013-09-30 10:47:50',1,12,'295','08/26/11 The Showroom',3,''),(112,'2013-09-30 10:47:50',1,12,'294','07/22/11 Private Event',3,''),(113,'2013-09-30 10:47:50',1,12,'293','05/13/11 Last Day Saloon',3,''),(114,'2013-09-30 10:47:50',1,12,'292','06/04/11 Dan\'s Bar',3,''),(115,'2013-09-30 10:47:50',1,12,'291','07/23/11 Private Event',3,''),(116,'2013-09-30 10:47:50',1,12,'290','08/14/11 Private Event',3,''),(117,'2013-09-30 10:47:50',1,12,'289','08/06/11 Lake Mission Viejo Concert Series',3,''),(118,'2013-09-30 10:47:50',1,12,'288','12/30/11 Don Quixote\'s',3,''),(119,'2013-09-30 10:47:50',1,12,'287','07/27/11 Pruneyard Concert Series',3,''),(120,'2013-09-30 10:47:50',1,12,'286','06/18/11 Harlow\'s',3,''),(121,'2013-09-30 10:47:50',1,12,'285','06/15/11 Pittsburg Pops Series',3,''),(122,'2013-09-30 10:47:50',1,12,'284','07/30/11 Brentwood Concert Series',3,''),(123,'2013-09-30 10:47:50',1,12,'283','07/15/11 Blackhawk Plaza',3,''),(124,'2013-09-30 10:47:50',1,12,'282','04/23/11 Bimbo\'s',3,''),(125,'2013-09-30 10:47:50',1,12,'281','04/09/11 Dan\'s Bar',3,''),(126,'2013-09-30 10:47:50',1,12,'280','05/28/11 Private Event',3,''),(127,'2013-09-30 10:47:50',1,12,'279','05/27/11 Brooklyn Bowl',3,''),(128,'2013-09-30 10:47:50',1,12,'278','06/24/11 The 2nd Annual Moonwalker Event',3,''),(129,'2013-09-30 10:47:50',1,12,'277','08/27/11 Uptown Theatre',3,''),(130,'2013-09-30 10:47:50',1,12,'276','11/18/11 Don Quixote\'s',3,''),(131,'2013-09-30 10:47:50',1,12,'275','10/28/11 Pepper Belly\'s',3,''),(132,'2013-09-30 10:47:50',1,12,'274','09/17/11 Don Quixote\'s',3,''),(133,'2013-09-30 10:47:50',1,12,'273','09/16/11 Lodi Grape & Harvest Festival',3,''),(134,'2013-09-30 10:47:50',1,12,'272','09/15/11 Music & Market Series',3,''),(135,'2013-09-30 10:47:50',1,12,'271','09/09/11 Redwood City Music on the Square',3,''),(136,'2013-09-30 10:47:50',1,12,'270','08/13/11 El Dorado Hills Concert Series',3,''),(137,'2013-09-30 10:47:50',1,12,'269','07/16/11 Don Quixote\'s',3,''),(138,'2013-09-30 10:47:50',1,12,'268','07/09/11 West Side Theatre',3,''),(139,'2013-09-30 10:47:50',1,12,'267','07/08/11 Alameda Crab Cove',3,''),(140,'2013-09-30 10:47:50',1,12,'266','06/26/11 Los Gatos Music in the Park',3,''),(141,'2013-09-30 10:47:50',1,12,'265','06/25/11 Fox Theatre',3,''),(142,'2013-09-30 10:47:50',1,12,'264','05/21/11 Don Quixote\'s',3,''),(143,'2013-09-30 10:47:50',1,12,'263','04/29/11 Harlow\'s',3,''),(144,'2013-09-30 10:47:50',1,12,'262','03/26/11 Harlow\'s',3,''),(145,'2013-09-30 10:47:50',1,12,'261','03/19/11 The Showroom',3,''),(146,'2013-09-30 10:47:50',1,12,'260','03/12/11 Don Quixote\'s',3,''),(147,'2013-09-30 10:47:50',1,12,'259','02/28/11 Private Event',3,''),(148,'2013-09-30 10:47:50',1,12,'258','02/26/11 El Campanil Theatre',3,''),(149,'2013-09-30 10:47:50',1,12,'257','02/18/11 Fox Theatre',3,''),(150,'2013-09-30 10:47:50',1,12,'256','02/12/11 Red Devil Lounge',3,''),(151,'2013-09-30 10:47:50',1,12,'255','01/29/11 San Ramon Valley High School Fundraiser',3,''),(152,'2013-09-30 10:47:50',1,12,'254','01/22/11 Bimbo\'s',3,''),(153,'2013-09-30 10:47:50',1,12,'253','01/14/11 Don Quixote\'s',3,''),(154,'2013-09-30 10:47:50',1,12,'252','01/08/11 Harlow\'s',3,''),(155,'2013-09-30 10:47:50',1,12,'251','12/31/10 Fiesta Bowl Invitational',3,''),(156,'2013-09-30 10:47:50',1,12,'250','12/30/10 Fiesta Bowl Parade VIP Reception',3,''),(157,'2013-09-30 10:47:50',1,12,'249','12/18/10 Fat Cat Music House & Lounge',3,''),(158,'2013-09-30 10:47:50',1,12,'248','11/19/10 Red Devil Lounge',3,''),(159,'2013-09-30 10:47:50',1,12,'247','11/06/10 19 Broadway',3,''),(160,'2013-09-30 10:47:50',1,12,'246','10/29/10 Yoshi\'s',3,''),(161,'2013-09-30 10:47:50',1,12,'245','10/16/10 Don Quixote\'s',3,''),(162,'2013-09-30 10:47:50',1,12,'244','10/08/10 Redwood City Music on the Square',3,''),(163,'2013-09-30 10:47:50',1,12,'243','10/02/10 Palo Alto Black & White Ball',3,''),(164,'2013-09-30 10:47:50',1,12,'242','09/24/10 Powerhouse Pub',3,''),(165,'2013-09-30 10:47:50',1,12,'241','09/11/10 Webster Street Jam',3,''),(166,'2013-09-30 10:47:50',1,12,'240','09/10/10 Friday Night Live @ Trails Park',3,''),(167,'2013-09-30 10:47:50',1,12,'239','08/28/10 Red Devil Lounge',3,''),(168,'2013-09-30 10:47:50',1,12,'238','08/21/10 19 Broadway',3,''),(169,'2013-09-30 10:47:50',1,12,'237','08/20/10 Don Quixote\'s',3,''),(170,'2013-09-30 10:47:50',1,12,'236','08/19/10 Music & Market Series',3,''),(171,'2013-09-30 10:47:50',1,12,'235','08/15/10 Napa Town & Country Fair',3,''),(172,'2013-09-30 10:47:50',1,12,'234','08/05/10 San Jose Music in the Park',3,''),(173,'2013-09-30 10:47:50',1,12,'233','07/17/10 19 Broadway',3,''),(174,'2013-09-30 10:47:50',1,12,'232','07/10/10 Powerhouse Pub',3,''),(175,'2013-09-30 10:47:50',1,12,'231','07/09/10 Blackhawk Plaza',3,''),(176,'2013-09-30 10:47:50',1,12,'230','06/27/10 SF Pride Celebration',3,''),(177,'2013-09-30 10:47:50',1,12,'229','06/25/10 Regency Theatre',3,''),(178,'2013-09-30 10:47:50',1,12,'228','06/23/10 Alameda County Fair',3,''),(179,'2013-09-30 10:47:50',1,12,'227','06/11/10 Alameda Crab Cove',3,''),(180,'2013-09-30 10:47:50',1,12,'226','06/03/10 Private Event',3,''),(181,'2013-09-30 10:47:50',1,12,'225','05/30/10 Golden Gate Fields',3,''),(182,'2013-09-30 10:47:50',1,12,'224','05/29/10 Last Day Saloon',3,''),(183,'2013-09-30 10:47:50',1,12,'223','05/22/10 Black & White Ball',3,''),(184,'2013-09-30 10:47:50',1,12,'222','05/13/10 Private Event',3,''),(185,'2013-09-30 10:47:50',1,12,'221','05/08/10 Don Quixote\'s',3,''),(186,'2013-09-30 10:47:50',1,12,'220','04/30/10 AT&T Park',3,''),(187,'2013-09-30 10:47:50',1,12,'219','04/24/10 Red Devil Lounge',3,''),(188,'2013-09-30 10:47:50',1,12,'218','04/23/10 Harlow\'s',3,''),(189,'2013-09-30 10:47:50',1,12,'217','04/03/10 19 Broadway',3,''),(190,'2013-09-30 10:47:50',1,12,'216','03/26/10 Last Day Saloon',3,''),(191,'2013-09-30 10:47:50',1,12,'215','03/20/10 Mezzanine',3,''),(192,'2013-09-30 10:47:50',1,12,'214','02/26/10 Mezzanine',3,''),(193,'2013-09-30 10:47:50',1,12,'213','02/12/10 Don Quixote\'s',3,''),(194,'2013-09-30 10:47:50',1,12,'212','01/02/10 Last Day Saloon',3,''),(195,'2013-09-30 10:47:50',1,12,'211','01/01/10 Red Devil Lounge',3,''),(196,'2013-09-30 10:47:50',1,12,'210','12/18/09 Private Event',3,''),(197,'2013-09-30 10:47:50',1,12,'209','11/14/09 19 Broadway',3,''),(198,'2013-09-30 10:47:50',1,12,'208','10/30/09 Last Day Saloon',3,''),(199,'2013-09-30 10:47:50',1,12,'207','10/09/09 Redwood City Music on the Square',3,''),(200,'2013-09-30 10:47:50',1,12,'206','09/11/09 Slim\'s',3,''),(201,'2013-09-30 10:47:50',1,12,'205','08/29/09 The Catalyst',3,''),(202,'2013-09-30 10:47:50',1,12,'204','07/11/09 Slim\'s',3,''),(203,'2013-09-30 10:47:50',1,12,'203','06/20/09 Bimbo\'s',3,''),(204,'2013-09-30 10:47:50',1,12,'202','06/23/13 Belly Up Aspen',3,''),(205,'2013-09-30 10:47:50',1,12,'201','06/22/13 Rock Into The Wild',3,''),(206,'2013-09-30 10:47:50',1,12,'200','06/21/13 Cervantes\' Masterpiece Ballroom',3,''),(207,'2013-09-30 10:47:50',1,12,'199','09/13/13 Redwood City Music on the Square',3,''),(208,'2013-09-30 10:47:50',1,12,'198','09/28/13 Mystic Theatre',3,''),(209,'2013-09-30 10:47:50',1,12,'197','08/16/13 Brisbane Concerts in the Park',3,''),(210,'2013-09-30 10:47:50',1,12,'196','08/23/13 Powerhouse Pub',3,''),(211,'2013-09-30 10:47:50',1,12,'195','07/05/13 Blackhawk Plaza',3,''),(212,'2013-09-30 10:47:50',1,12,'194','06/14/13 The New Parish',3,''),(213,'2013-09-30 10:47:50',1,12,'193','06/13/13 Los Altos Summer Concert Series',3,''),(214,'2013-09-30 10:47:50',1,12,'192','05/25/13 Harlow\'s',3,''),(215,'2013-09-30 10:47:50',1,12,'191','05/18/13 Slim\'s',3,''),(216,'2013-09-30 10:47:50',1,12,'190','06/27/13 Montgomery Village',3,''),(217,'2013-09-30 10:47:50',1,12,'189','08/10/13 California Beer Fest',3,''),(218,'2013-09-30 10:47:50',1,12,'188','07/11/13 Music & Market Series',3,''),(219,'2013-09-30 10:47:50',1,12,'187','09/21/13 California Beer Fest',3,''),(220,'2013-09-30 10:47:50',1,12,'186','02/22/13 The New Parish',3,''),(221,'2013-09-30 10:47:50',1,12,'185','02/22/13 The New Parish',3,''),(222,'2013-09-30 10:47:50',1,12,'184','01/25/13 Club Fox',3,''),(223,'2013-09-30 10:47:50',1,12,'183','10/19/13 Club Fox',3,''),(224,'2013-09-30 10:47:50',1,12,'182','07/20/13 Club Fox',3,''),(225,'2013-09-30 10:47:50',1,12,'181','04/20/13 Club Fox',3,''),(226,'2013-09-30 10:47:50',1,12,'180','01/26/13 Bimbo\'s',3,''),(227,'2013-09-30 10:47:50',1,12,'179','12/28/13 Don Quixote\'s',3,''),(228,'2013-09-30 10:47:50',1,12,'178','05/17/13 Don Quixote\'s',3,''),(229,'2013-09-30 10:47:50',1,12,'177','08/24/13 Bimbo\'s',3,''),(230,'2013-09-30 10:47:50',1,12,'176','06/08/13 Black Oak Casino',3,''),(231,'2013-09-30 10:47:50',1,12,'175','10/26/13 Bimbo\'s',3,''),(232,'2013-09-30 10:47:50',1,12,'174','10/18/13 Don Quixote\'s',3,''),(233,'2013-09-30 10:47:50',1,12,'173','07/26/13 Don Quixote\'s',3,''),(234,'2013-09-30 10:47:50',1,12,'172','04/20/13 The New Parish',3,''),(235,'2013-09-30 10:47:50',1,12,'171','04/12/13 Bimbo\'s',3,''),(236,'2013-09-30 10:47:50',1,12,'170','03/02/13 Mystic Theatre',3,''),(237,'2013-09-30 10:47:50',1,12,'169','02/23/13 Don Quixote\'s',3,''),(238,'2013-09-30 10:47:50',1,12,'168','02/16/14 The New Parish',3,''),(239,'2013-09-30 10:47:50',1,12,'167','01/12/13 Sweetwater Music Hall',3,''),(240,'2013-09-30 10:47:50',1,12,'166','12/29/12 Club Fox',3,''),(241,'2013-09-30 10:47:50',1,12,'165','10/25/12 Reunion Nightclub',3,''),(242,'2013-09-30 10:47:50',1,12,'164','11/18/12 Pittsburg Creative Arts Building',3,''),(243,'2013-09-30 10:47:50',1,12,'163','10/05/12 Jon Lovitz Comedy Club',3,''),(244,'2013-09-30 10:47:50',1,12,'162','10/27/12 Bimbo\'s',3,''),(245,'2013-09-30 10:47:50',1,12,'161','09/14/12 Velvet Jones',3,''),(246,'2013-09-30 10:47:50',1,12,'160','08/30/12 Montgomery Village',3,''),(247,'2013-09-30 10:47:50',1,12,'159','10/06/12 California Beer Fest',3,''),(248,'2013-09-30 10:47:50',1,12,'158','09/13/12 Fulton 55',3,''),(249,'2013-09-30 10:47:50',1,12,'157','08/02/12 Hood River Summer Concerts Series',3,''),(250,'2013-09-30 10:47:50',1,12,'156','08/01/12 Concerts in the Park - Sounds of Summer Series',3,''),(251,'2013-09-30 10:47:50',1,12,'155','07/25/12 Pruneyard Concert Series',3,''),(252,'2013-09-30 10:47:50',1,12,'154','07/14/12 George\'s Night Club',3,''),(253,'2013-09-30 10:47:50',1,12,'153','08/09/12 Music & Market Series',3,''),(254,'2013-09-30 10:47:50',1,12,'152','08/31/12 Redwood City Music on the Square',3,''),(255,'2013-09-30 10:47:50',1,12,'151','08/18/12 Silverton Casino Hotel',3,''),(256,'2013-09-30 10:47:50',1,12,'150','08/17/12 Friday Night Live @ Trails Park',3,''),(257,'2013-09-30 10:47:50',1,12,'149','01/05/13 Powerhouse Pub',3,''),(258,'2013-09-30 10:47:50',1,12,'148','12/28/12 Don Quixote\'s',3,''),(259,'2013-09-30 10:47:50',1,12,'147','12/08/12 Dan\'s Bar',3,''),(260,'2013-09-30 10:47:50',1,12,'146','07/20/12 Dan\'s Bar',3,''),(261,'2013-09-30 10:47:50',1,12,'145','07/13/12 Stonecreek Village Summer Concert Series',3,''),(262,'2013-09-30 10:47:50',1,12,'144','06/01/12 El Dorado Hills Concert Series',3,''),(263,'2013-09-30 10:47:50',1,12,'143','12/01/12 George\'s Night Club',3,''),(264,'2013-09-30 10:47:50',1,12,'142','11/16/12 The New Parish',3,''),(265,'2013-09-30 10:47:50',1,12,'141','05/11/12 The New Parish',3,''),(266,'2013-09-30 10:47:50',1,12,'140','09/22/12 California Beer Fest',3,''),(267,'2013-09-30 10:47:50',1,12,'139','09/15/12 California Beer Fest',3,''),(268,'2013-09-30 10:47:50',1,12,'138','07/28/12 California Beer Fest',3,''),(269,'2013-09-30 10:47:50',1,12,'137','11/17/12 Red Devil Lounge',3,''),(270,'2013-09-30 10:47:50',1,12,'136','09/21/12 Red Devil Lounge',3,''),(271,'2013-09-30 10:47:50',1,12,'135','08/25/12 Bimbo\'s',3,''),(272,'2013-09-30 10:47:50',1,12,'134','07/27/12 Red Devil Lounge',3,''),(273,'2013-09-30 10:47:50',1,12,'133','07/06/12 Blackhawk Plaza',3,''),(274,'2013-09-30 10:47:50',1,12,'132','06/23/12 Bimbo\'s',3,''),(275,'2013-09-30 10:47:50',1,12,'131','02/10/12 Fulton 55',3,''),(276,'2013-09-30 10:47:50',1,12,'130','09/28/12 Don Quixote\'s',3,''),(277,'2013-09-30 10:47:50',1,12,'129','08/11/12 Don Quixote\'s',3,''),(278,'2013-09-30 10:47:50',1,12,'128','06/02/12 Don Quixote\'s',3,''),(279,'2013-09-30 10:47:50',1,12,'127','04/27/12 Don Quixote\'s',3,''),(280,'2013-09-30 10:47:50',1,12,'126','02/24/12 Don Quixote\'s',3,''),(281,'2013-09-30 10:47:50',1,12,'125','02/04/12 The New Parish',3,''),(282,'2013-09-30 10:47:50',1,12,'124','01/05/12 Private Event',3,''),(283,'2013-09-30 10:47:50',1,12,'123','12/17/11 Private Event',3,''),(284,'2013-09-30 10:47:50',1,12,'122','09/29/12 Palo Alto Black & White Ball',3,''),(285,'2013-09-30 10:47:50',1,12,'121','05/12/12 Private Event',3,''),(286,'2013-09-30 10:47:50',1,12,'120','04/20/12 Red Devil Lounge',3,''),(287,'2013-09-30 10:47:50',1,12,'119','03/31/12 Dan\'s Bar',3,''),(288,'2013-09-30 10:47:50',1,12,'118','03/23/12 George\'s Night Club',3,''),(289,'2013-09-30 10:47:50',1,12,'117','03/09/12 Bimbo\'s',3,''),(290,'2013-09-30 10:47:50',1,12,'116','02/25/12 Dan\'s Bar',3,''),(291,'2013-09-30 10:47:50',1,12,'115','02/03/12 Red Devil Lounge',3,''),(292,'2013-09-30 10:47:50',1,12,'114','01/14/12 Dan\'s Bar',3,''),(293,'2013-09-30 10:47:50',1,12,'113','12/31/11 Bimbo\'s',3,''),(294,'2013-09-30 10:47:50',1,12,'112','11/19/11 George\'s Night Club',3,''),(295,'2013-09-30 10:47:50',1,12,'111','12/16/11 Private Event',3,''),(296,'2013-09-30 10:47:50',1,12,'110','10/20/11 Private Event',3,''),(297,'2013-09-30 10:47:50',1,12,'109','11/04/11 Stockton Empire Theatre',3,''),(298,'2013-09-30 10:47:50',1,12,'108','10/21/11 The Avalon',3,''),(299,'2013-09-30 10:47:50',1,12,'107','08/28/11 Oakland Chinatown StreetFest',3,''),(300,'2013-09-30 10:47:50',1,12,'106','12/09/11 Private Event',3,''),(301,'2013-09-30 10:47:50',1,12,'105','03/30/12 Powerhouse Pub',3,''),(302,'2013-09-30 10:47:50',1,12,'104','12/03/11 Red Devil Lounge',3,''),(303,'2013-09-30 10:47:50',1,12,'103','11/11/11 Powerhouse Pub',3,''),(304,'2013-09-30 10:47:50',1,12,'102','11/05/11 Dan\'s Bar',3,''),(305,'2013-09-30 10:47:50',1,12,'101','10/29/11 Bimbo\'s',3,''),(306,'2013-09-30 10:47:50',1,12,'100','09/30/11 Fulton 55',3,''),(307,'2013-09-30 10:47:50',1,12,'99','11/12/11 The Knitting Factory',3,''),(308,'2013-09-30 10:47:50',1,12,'98','07/04/11 SF Independence Day Extravaganza',3,''),(309,'2013-09-30 10:47:50',1,12,'97','07/19/12 Los Altos Summer Concert Series',3,''),(310,'2013-09-30 10:47:50',1,12,'96','09/24/11 Mountain House Concert Series',3,''),(311,'2013-09-30 10:47:50',1,12,'95','08/26/11 The Showroom',3,''),(312,'2013-09-30 10:47:50',1,12,'94','07/22/11 Private Event',3,''),(313,'2013-09-30 10:47:50',1,12,'93','05/13/11 Last Day Saloon',3,''),(314,'2013-09-30 10:47:50',1,12,'92','06/04/11 Dan\'s Bar',3,''),(315,'2013-09-30 10:47:50',1,12,'91','07/23/11 Private Event',3,''),(316,'2013-09-30 10:47:50',1,12,'90','08/14/11 Private Event',3,''),(317,'2013-09-30 10:47:50',1,12,'89','08/06/11 Lake Mission Viejo Concert Series',3,''),(318,'2013-09-30 10:47:50',1,12,'88','12/30/11 Don Quixote\'s',3,''),(319,'2013-09-30 10:47:50',1,12,'87','07/27/11 Pruneyard Concert Series',3,''),(320,'2013-09-30 10:47:50',1,12,'86','06/18/11 Harlow\'s',3,''),(321,'2013-09-30 10:47:50',1,12,'85','06/15/11 Pittsburg Pops Series',3,''),(322,'2013-09-30 10:47:50',1,12,'84','07/30/11 Brentwood Concert Series',3,''),(323,'2013-09-30 10:47:50',1,12,'83','07/15/11 Blackhawk Plaza',3,''),(324,'2013-09-30 10:47:50',1,12,'82','04/23/11 Bimbo\'s',3,''),(325,'2013-09-30 10:47:50',1,12,'81','04/09/11 Dan\'s Bar',3,''),(326,'2013-09-30 10:47:50',1,12,'80','05/28/11 Private Event',3,''),(327,'2013-09-30 10:47:50',1,12,'79','05/27/11 Brooklyn Bowl',3,''),(328,'2013-09-30 10:47:50',1,12,'78','06/24/11 The 2nd Annual Moonwalker Event',3,''),(329,'2013-09-30 10:47:50',1,12,'77','08/27/11 Uptown Theatre',3,''),(330,'2013-09-30 10:47:50',1,12,'76','11/18/11 Don Quixote\'s',3,''),(331,'2013-09-30 10:47:50',1,12,'75','10/28/11 Pepper Belly\'s',3,''),(332,'2013-09-30 10:47:50',1,12,'74','09/17/11 Don Quixote\'s',3,''),(333,'2013-09-30 10:47:50',1,12,'73','09/16/11 Lodi Grape & Harvest Festival',3,''),(334,'2013-09-30 10:47:50',1,12,'72','09/15/11 Music & Market Series',3,''),(335,'2013-09-30 10:47:50',1,12,'71','09/09/11 Redwood City Music on the Square',3,''),(336,'2013-09-30 10:47:50',1,12,'70','08/13/11 El Dorado Hills Concert Series',3,''),(337,'2013-09-30 10:47:50',1,12,'69','07/16/11 Don Quixote\'s',3,''),(338,'2013-09-30 10:47:50',1,12,'68','07/09/11 West Side Theatre',3,''),(339,'2013-09-30 10:47:50',1,12,'67','07/08/11 Alameda Crab Cove',3,''),(340,'2013-09-30 10:47:50',1,12,'66','06/26/11 Los Gatos Music in the Park',3,''),(341,'2013-09-30 10:47:50',1,12,'65','06/25/11 Fox Theatre',3,''),(342,'2013-09-30 10:47:50',1,12,'64','05/21/11 Don Quixote\'s',3,''),(343,'2013-09-30 10:47:50',1,12,'63','04/29/11 Harlow\'s',3,''),(344,'2013-09-30 10:47:50',1,12,'62','03/26/11 Harlow\'s',3,''),(345,'2013-09-30 10:47:50',1,12,'61','03/19/11 The Showroom',3,''),(346,'2013-09-30 10:47:50',1,12,'60','03/12/11 Don Quixote\'s',3,''),(347,'2013-09-30 10:47:50',1,12,'59','02/28/11 Private Event',3,''),(348,'2013-09-30 10:47:50',1,12,'58','02/26/11 El Campanil Theatre',3,''),(349,'2013-09-30 10:47:50',1,12,'57','02/18/11 Fox Theatre',3,''),(350,'2013-09-30 10:47:50',1,12,'56','02/12/11 Red Devil Lounge',3,''),(351,'2013-09-30 10:47:50',1,12,'55','01/29/11 San Ramon Valley High School Fundraiser',3,''),(352,'2013-09-30 10:47:50',1,12,'54','01/22/11 Bimbo\'s',3,''),(353,'2013-09-30 10:47:50',1,12,'53','01/14/11 Don Quixote\'s',3,''),(354,'2013-09-30 10:47:50',1,12,'52','01/08/11 Harlow\'s',3,''),(355,'2013-09-30 10:47:50',1,12,'51','12/31/10 Fiesta Bowl Invitational',3,''),(356,'2013-09-30 10:47:50',1,12,'50','12/30/10 Fiesta Bowl Parade VIP Reception',3,''),(357,'2013-09-30 10:47:50',1,12,'49','12/18/10 Fat Cat Music House & Lounge',3,''),(358,'2013-09-30 10:47:50',1,12,'48','11/19/10 Red Devil Lounge',3,''),(359,'2013-09-30 10:47:50',1,12,'47','11/06/10 19 Broadway',3,''),(360,'2013-09-30 10:47:50',1,12,'46','10/29/10 Yoshi\'s',3,''),(361,'2013-09-30 10:47:50',1,12,'45','10/16/10 Don Quixote\'s',3,''),(362,'2013-09-30 10:47:50',1,12,'44','10/08/10 Redwood City Music on the Square',3,''),(363,'2013-09-30 10:47:50',1,12,'43','10/02/10 Palo Alto Black & White Ball',3,''),(364,'2013-09-30 10:47:50',1,12,'42','09/24/10 Powerhouse Pub',3,''),(365,'2013-09-30 10:47:50',1,12,'41','09/11/10 Webster Street Jam',3,''),(366,'2013-09-30 10:47:50',1,12,'40','09/10/10 Friday Night Live @ Trails Park',3,''),(367,'2013-09-30 10:47:50',1,12,'39','08/28/10 Red Devil Lounge',3,''),(368,'2013-09-30 10:47:50',1,12,'38','08/21/10 19 Broadway',3,''),(369,'2013-09-30 10:47:50',1,12,'37','08/20/10 Don Quixote\'s',3,''),(370,'2013-09-30 10:47:50',1,12,'36','08/19/10 Music & Market Series',3,''),(371,'2013-09-30 10:47:50',1,12,'35','08/15/10 Napa Town & Country Fair',3,''),(372,'2013-09-30 10:47:50',1,12,'34','08/05/10 San Jose Music in the Park',3,''),(373,'2013-09-30 10:47:50',1,12,'33','07/17/10 19 Broadway',3,''),(374,'2013-09-30 10:47:50',1,12,'32','07/10/10 Powerhouse Pub',3,''),(375,'2013-09-30 10:47:50',1,12,'31','07/09/10 Blackhawk Plaza',3,''),(376,'2013-09-30 10:47:50',1,12,'30','06/27/10 SF Pride Celebration',3,''),(377,'2013-09-30 10:47:50',1,12,'29','06/25/10 Regency Theatre',3,''),(378,'2013-09-30 10:47:50',1,12,'28','06/23/10 Alameda County Fair',3,''),(379,'2013-09-30 10:47:50',1,12,'27','06/11/10 Alameda Crab Cove',3,''),(380,'2013-09-30 10:47:50',1,12,'26','06/03/10 Private Event',3,''),(381,'2013-09-30 10:47:50',1,12,'25','05/30/10 Golden Gate Fields',3,''),(382,'2013-09-30 10:47:50',1,12,'24','05/29/10 Last Day Saloon',3,''),(383,'2013-09-30 10:47:50',1,12,'23','05/22/10 Black & White Ball',3,''),(384,'2013-09-30 10:47:50',1,12,'22','05/13/10 Private Event',3,''),(385,'2013-09-30 10:47:50',1,12,'21','05/08/10 Don Quixote\'s',3,''),(386,'2013-09-30 10:47:50',1,12,'20','04/30/10 AT&T Park',3,''),(387,'2013-09-30 10:47:50',1,12,'19','04/24/10 Red Devil Lounge',3,''),(388,'2013-09-30 10:47:50',1,12,'18','04/23/10 Harlow\'s',3,''),(389,'2013-09-30 10:47:50',1,12,'17','04/03/10 19 Broadway',3,''),(390,'2013-09-30 10:47:50',1,12,'16','03/26/10 Last Day Saloon',3,''),(391,'2013-09-30 10:47:50',1,12,'15','03/20/10 Mezzanine',3,''),(392,'2013-09-30 10:47:50',1,12,'14','02/26/10 Mezzanine',3,''),(393,'2013-09-30 10:47:50',1,12,'13','02/12/10 Don Quixote\'s',3,''),(394,'2013-09-30 10:47:50',1,12,'12','01/02/10 Last Day Saloon',3,''),(395,'2013-09-30 10:47:50',1,12,'11','01/01/10 Red Devil Lounge',3,''),(396,'2013-09-30 10:47:50',1,12,'10','12/18/09 Private Event',3,''),(397,'2013-09-30 10:47:50',1,12,'9','11/14/09 19 Broadway',3,''),(398,'2013-09-30 10:47:50',1,12,'8','10/30/09 Last Day Saloon',3,''),(399,'2013-09-30 10:47:50',1,12,'7','10/09/09 Redwood City Music on the Square',3,''),(400,'2013-09-30 10:47:50',1,12,'6','09/11/09 Slim\'s',3,''),(401,'2013-09-30 10:47:50',1,12,'5','08/29/09 The Catalyst',3,''),(402,'2013-09-30 10:47:50',1,12,'4','07/11/09 Slim\'s',3,''),(403,'2013-09-30 10:47:50',1,12,'3','06/20/09 Bimbo\'s',3,''),(404,'2013-09-30 11:22:31',1,12,'494','07/22/11 Private Event',2,'Changed public.'),(405,'2013-09-30 11:22:44',1,12,'491','07/23/11 Private Event',2,'Changed public.'),(406,'2013-09-30 11:28:07',1,12,'613','06/20/09 Bimbo\'s',3,''),(407,'2013-09-30 11:28:07',1,12,'403','06/20/09 Bimbo\'s',3,''),(408,'2013-09-30 11:28:07',1,12,'614','07/11/09 Slim\'s',3,''),(409,'2013-09-30 11:28:07',1,12,'404','07/11/09 Slim\'s',3,''),(410,'2013-09-30 11:28:07',1,12,'615','08/29/09 The Catalyst',3,''),(411,'2013-09-30 11:28:07',1,12,'405','08/29/09 The Catalyst',3,''),(412,'2013-09-30 11:28:07',1,12,'616','09/11/09 Slim\'s',3,''),(413,'2013-09-30 11:28:07',1,12,'406','09/11/09 Slim\'s',3,''),(414,'2013-09-30 11:28:07',1,12,'617','10/09/09 Redwood City Music on the Square',3,''),(415,'2013-09-30 11:28:07',1,12,'407','10/09/09 Redwood City Music on the Square',3,''),(416,'2013-09-30 11:28:07',1,12,'618','10/30/09 Last Day Saloon',3,''),(417,'2013-09-30 11:28:07',1,12,'408','10/30/09 Last Day Saloon',3,''),(418,'2013-09-30 11:28:07',1,12,'619','11/14/09 19 Broadway',3,''),(419,'2013-09-30 11:28:07',1,12,'409','11/14/09 19 Broadway',3,''),(420,'2013-09-30 11:28:07',1,12,'620','12/18/09 Private Event',3,''),(421,'2013-09-30 11:28:07',1,12,'410','12/18/09 Private Event',3,''),(422,'2013-09-30 11:28:07',1,12,'621','01/01/10 Red Devil Lounge',3,''),(423,'2013-09-30 11:28:07',1,12,'411','01/01/10 Red Devil Lounge',3,''),(424,'2013-09-30 11:28:07',1,12,'622','01/02/10 Last Day Saloon',3,''),(425,'2013-09-30 11:28:07',1,12,'412','01/02/10 Last Day Saloon',3,''),(426,'2013-09-30 11:28:07',1,12,'623','02/12/10 Don Quixote\'s',3,''),(427,'2013-09-30 11:28:07',1,12,'413','02/12/10 Don Quixote\'s',3,''),(428,'2013-09-30 11:28:07',1,12,'624','02/26/10 Mezzanine',3,''),(429,'2013-09-30 11:28:07',1,12,'414','02/26/10 Mezzanine',3,''),(430,'2013-09-30 11:28:07',1,12,'625','03/20/10 Mezzanine',3,''),(431,'2013-09-30 11:28:07',1,12,'415','03/20/10 Mezzanine',3,''),(432,'2013-09-30 11:28:07',1,12,'626','03/26/10 Last Day Saloon',3,''),(433,'2013-09-30 11:28:07',1,12,'416','03/26/10 Last Day Saloon',3,''),(434,'2013-09-30 11:28:07',1,12,'627','04/03/10 19 Broadway',3,''),(435,'2013-09-30 11:28:07',1,12,'417','04/03/10 19 Broadway',3,''),(436,'2013-09-30 11:28:07',1,12,'628','04/23/10 Harlow\'s',3,''),(437,'2013-09-30 11:28:07',1,12,'418','04/23/10 Harlow\'s',3,''),(438,'2013-09-30 11:28:07',1,12,'629','04/24/10 Red Devil Lounge',3,''),(439,'2013-09-30 11:28:07',1,12,'419','04/24/10 Red Devil Lounge',3,''),(440,'2013-09-30 11:28:07',1,12,'630','04/30/10 AT&T Park',3,''),(441,'2013-09-30 11:28:07',1,12,'420','04/30/10 AT&T Park',3,''),(442,'2013-09-30 11:28:07',1,12,'631','05/08/10 Don Quixote\'s',3,''),(443,'2013-09-30 11:28:07',1,12,'421','05/08/10 Don Quixote\'s',3,''),(444,'2013-09-30 11:28:07',1,12,'632','05/13/10 Private Event',3,''),(445,'2013-09-30 11:28:07',1,12,'422','05/13/10 Private Event',3,''),(446,'2013-09-30 11:28:07',1,12,'633','05/22/10 Black & White Ball',3,''),(447,'2013-09-30 11:28:07',1,12,'423','05/22/10 Black & White Ball',3,''),(448,'2013-09-30 11:28:07',1,12,'634','05/29/10 Last Day Saloon',3,''),(449,'2013-09-30 11:28:07',1,12,'424','05/29/10 Last Day Saloon',3,''),(450,'2013-09-30 11:28:07',1,12,'635','05/30/10 Golden Gate Fields',3,''),(451,'2013-09-30 11:28:07',1,12,'425','05/30/10 Golden Gate Fields',3,''),(452,'2013-09-30 11:28:07',1,12,'636','06/03/10 Private Event',3,''),(453,'2013-09-30 11:28:07',1,12,'426','06/03/10 Private Event',3,''),(454,'2013-09-30 11:28:07',1,12,'637','06/11/10 Alameda Crab Cove',3,''),(455,'2013-09-30 11:28:07',1,12,'427','06/11/10 Alameda Crab Cove',3,''),(456,'2013-09-30 11:28:07',1,12,'638','06/23/10 Alameda County Fair',3,''),(457,'2013-09-30 11:28:07',1,12,'428','06/23/10 Alameda County Fair',3,''),(458,'2013-09-30 11:28:07',1,12,'639','06/25/10 Regency Theatre',3,''),(459,'2013-09-30 11:28:07',1,12,'429','06/25/10 Regency Theatre',3,''),(460,'2013-09-30 11:28:07',1,12,'640','06/27/10 SF Pride Celebration',3,''),(461,'2013-09-30 11:28:07',1,12,'430','06/27/10 SF Pride Celebration',3,''),(462,'2013-09-30 11:28:07',1,12,'641','07/09/10 Blackhawk Plaza',3,''),(463,'2013-09-30 11:28:07',1,12,'431','07/09/10 Blackhawk Plaza',3,''),(464,'2013-09-30 11:28:07',1,12,'642','07/10/10 Powerhouse Pub',3,''),(465,'2013-09-30 11:28:07',1,12,'432','07/10/10 Powerhouse Pub',3,''),(466,'2013-09-30 11:28:07',1,12,'643','07/17/10 19 Broadway',3,''),(467,'2013-09-30 11:28:07',1,12,'433','07/17/10 19 Broadway',3,''),(468,'2013-09-30 11:28:07',1,12,'644','08/05/10 San Jose Music in the Park',3,''),(469,'2013-09-30 11:28:07',1,12,'434','08/05/10 San Jose Music in the Park',3,''),(470,'2013-09-30 11:28:07',1,12,'645','08/15/10 Napa Town & Country Fair',3,''),(471,'2013-09-30 11:28:07',1,12,'435','08/15/10 Napa Town & Country Fair',3,''),(472,'2013-09-30 11:28:07',1,12,'646','08/19/10 Music & Market Series',3,''),(473,'2013-09-30 11:28:07',1,12,'436','08/19/10 Music & Market Series',3,''),(474,'2013-09-30 11:28:07',1,12,'647','08/20/10 Don Quixote\'s',3,''),(475,'2013-09-30 11:28:07',1,12,'437','08/20/10 Don Quixote\'s',3,''),(476,'2013-09-30 11:28:07',1,12,'648','08/21/10 19 Broadway',3,''),(477,'2013-09-30 11:28:07',1,12,'438','08/21/10 19 Broadway',3,''),(478,'2013-09-30 11:28:07',1,12,'649','08/28/10 Red Devil Lounge',3,''),(479,'2013-09-30 11:28:07',1,12,'439','08/28/10 Red Devil Lounge',3,''),(480,'2013-09-30 11:28:07',1,12,'650','09/10/10 Friday Night Live @ Trails Park',3,''),(481,'2013-09-30 11:28:07',1,12,'440','09/10/10 Friday Night Live @ Trails Park',3,''),(482,'2013-09-30 11:28:07',1,12,'651','09/11/10 Webster Street Jam',3,''),(483,'2013-09-30 11:28:07',1,12,'441','09/11/10 Webster Street Jam',3,''),(484,'2013-09-30 11:28:07',1,12,'652','09/24/10 Powerhouse Pub',3,''),(485,'2013-09-30 11:28:07',1,12,'442','09/24/10 Powerhouse Pub',3,''),(486,'2013-09-30 11:28:07',1,12,'653','10/02/10 Palo Alto Black & White Ball',3,''),(487,'2013-09-30 11:28:07',1,12,'443','10/02/10 Palo Alto Black & White Ball',3,''),(488,'2013-09-30 11:28:07',1,12,'654','10/08/10 Redwood City Music on the Square',3,''),(489,'2013-09-30 11:28:07',1,12,'444','10/08/10 Redwood City Music on the Square',3,''),(490,'2013-09-30 11:28:07',1,12,'655','10/16/10 Don Quixote\'s',3,''),(491,'2013-09-30 11:28:07',1,12,'445','10/16/10 Don Quixote\'s',3,''),(492,'2013-09-30 11:28:07',1,12,'656','10/29/10 Yoshi\'s',3,''),(493,'2013-09-30 11:28:07',1,12,'446','10/29/10 Yoshi\'s',3,''),(494,'2013-09-30 11:28:07',1,12,'657','11/06/10 19 Broadway',3,''),(495,'2013-09-30 11:28:07',1,12,'447','11/06/10 19 Broadway',3,''),(496,'2013-09-30 11:28:07',1,12,'658','11/19/10 Red Devil Lounge',3,''),(497,'2013-09-30 11:28:07',1,12,'448','11/19/10 Red Devil Lounge',3,''),(498,'2013-09-30 11:28:07',1,12,'659','12/18/10 Fat Cat Music House & Lounge',3,''),(499,'2013-09-30 11:28:07',1,12,'449','12/18/10 Fat Cat Music House & Lounge',3,''),(500,'2013-09-30 11:28:07',1,12,'660','12/30/10 Fiesta Bowl Parade VIP Reception',3,''),(501,'2013-09-30 11:28:07',1,12,'450','12/30/10 Fiesta Bowl Parade VIP Reception',3,''),(502,'2013-09-30 11:28:07',1,12,'661','12/31/10 Fiesta Bowl Invitational',3,''),(503,'2013-09-30 11:28:07',1,12,'451','12/31/10 Fiesta Bowl Invitational',3,''),(504,'2013-09-30 11:28:07',1,12,'662','01/08/11 Harlow\'s',3,''),(505,'2013-09-30 11:28:07',1,12,'452','01/08/11 Harlow\'s',3,''),(506,'2013-09-30 11:28:07',1,12,'663','01/14/11 Don Quixote\'s',3,''),(507,'2013-09-30 11:28:07',1,12,'453','01/14/11 Don Quixote\'s',3,''),(508,'2013-09-30 11:28:07',1,12,'664','01/22/11 Bimbo\'s',3,''),(509,'2013-09-30 11:28:07',1,12,'454','01/22/11 Bimbo\'s',3,''),(510,'2013-09-30 11:28:07',1,12,'665','01/29/11 San Ramon Valley High School Fundraiser',3,''),(511,'2013-09-30 11:28:07',1,12,'455','01/29/11 San Ramon Valley High School Fundraiser',3,''),(512,'2013-09-30 11:28:07',1,12,'666','02/12/11 Red Devil Lounge',3,''),(513,'2013-09-30 11:28:07',1,12,'456','02/12/11 Red Devil Lounge',3,''),(514,'2013-09-30 11:28:07',1,12,'667','02/18/11 Fox Theatre',3,''),(515,'2013-09-30 11:28:07',1,12,'457','02/18/11 Fox Theatre',3,''),(516,'2013-09-30 11:28:07',1,12,'668','02/26/11 El Campanil Theatre',3,''),(517,'2013-09-30 11:28:07',1,12,'458','02/26/11 El Campanil Theatre',3,''),(518,'2013-09-30 11:28:07',1,12,'669','02/28/11 Private Event',3,''),(519,'2013-09-30 11:28:07',1,12,'459','02/28/11 Private Event',3,''),(520,'2013-09-30 11:28:07',1,12,'670','03/12/11 Don Quixote\'s',3,''),(521,'2013-09-30 11:28:07',1,12,'460','03/12/11 Don Quixote\'s',3,''),(522,'2013-09-30 11:28:07',1,12,'671','03/19/11 The Showroom',3,''),(523,'2013-09-30 11:28:07',1,12,'461','03/19/11 The Showroom',3,''),(524,'2013-09-30 11:28:07',1,12,'672','03/26/11 Harlow\'s',3,''),(525,'2013-09-30 11:28:07',1,12,'462','03/26/11 Harlow\'s',3,''),(526,'2013-09-30 11:28:07',1,12,'691','04/09/11 Dan\'s Bar',3,''),(527,'2013-09-30 11:28:07',1,12,'481','04/09/11 Dan\'s Bar',3,''),(528,'2013-09-30 11:28:07',1,12,'692','04/23/11 Bimbo\'s',3,''),(529,'2013-09-30 11:28:07',1,12,'482','04/23/11 Bimbo\'s',3,''),(530,'2013-09-30 11:28:07',1,12,'673','04/29/11 Harlow\'s',3,''),(531,'2013-09-30 11:28:07',1,12,'463','04/29/11 Harlow\'s',3,''),(532,'2013-09-30 11:28:07',1,12,'703','05/13/11 Last Day Saloon',3,''),(533,'2013-09-30 11:28:07',1,12,'493','05/13/11 Last Day Saloon',3,''),(534,'2013-09-30 11:28:07',1,12,'674','05/21/11 Don Quixote\'s',3,''),(535,'2013-09-30 11:28:07',1,12,'464','05/21/11 Don Quixote\'s',3,''),(536,'2013-09-30 11:28:07',1,12,'689','05/27/11 Brooklyn Bowl',3,''),(537,'2013-09-30 11:28:07',1,12,'479','05/27/11 Brooklyn Bowl',3,''),(538,'2013-09-30 11:28:07',1,12,'690','05/28/11 Private Event',3,''),(539,'2013-09-30 11:28:07',1,12,'480','05/28/11 Private Event',3,''),(540,'2013-09-30 11:28:07',1,12,'702','06/04/11 Dan\'s Bar',3,''),(541,'2013-09-30 11:28:07',1,12,'492','06/04/11 Dan\'s Bar',3,''),(542,'2013-09-30 11:28:07',1,12,'695','06/15/11 Pittsburg Pops Series',3,''),(543,'2013-09-30 11:28:07',1,12,'485','06/15/11 Pittsburg Pops Series',3,''),(544,'2013-09-30 11:28:07',1,12,'696','06/18/11 Harlow\'s',3,''),(545,'2013-09-30 11:28:07',1,12,'486','06/18/11 Harlow\'s',3,''),(546,'2013-09-30 11:28:07',1,12,'688','06/24/11 The 2nd Annual Moonwalker Event',3,''),(547,'2013-09-30 11:28:07',1,12,'478','06/24/11 The 2nd Annual Moonwalker Event',3,''),(548,'2013-09-30 11:28:07',1,12,'675','06/25/11 Fox Theatre',3,''),(549,'2013-09-30 11:28:07',1,12,'465','06/25/11 Fox Theatre',3,''),(550,'2013-09-30 11:28:07',1,12,'676','06/26/11 Los Gatos Music in the Park',3,''),(551,'2013-09-30 11:28:07',1,12,'466','06/26/11 Los Gatos Music in the Park',3,''),(552,'2013-09-30 11:28:07',1,12,'708','07/04/11 SF Independence Day Extravaganza',3,''),(553,'2013-09-30 11:28:07',1,12,'498','07/04/11 SF Independence Day Extravaganza',3,''),(554,'2013-09-30 11:28:07',1,12,'677','07/08/11 Alameda Crab Cove',3,''),(555,'2013-09-30 11:28:07',1,12,'467','07/08/11 Alameda Crab Cove',3,''),(556,'2013-09-30 11:28:07',1,12,'678','07/09/11 West Side Theatre',3,''),(557,'2013-09-30 11:28:07',1,12,'468','07/09/11 West Side Theatre',3,''),(558,'2013-09-30 11:28:07',1,12,'693','07/15/11 Blackhawk Plaza',3,''),(559,'2013-09-30 11:28:07',1,12,'483','07/15/11 Blackhawk Plaza',3,''),(560,'2013-09-30 11:28:07',1,12,'679','07/16/11 Don Quixote\'s',3,''),(561,'2013-09-30 11:28:07',1,12,'469','07/16/11 Don Quixote\'s',3,''),(562,'2013-09-30 11:28:07',1,12,'704','07/22/11 Private Event',3,''),(563,'2013-09-30 11:28:07',1,12,'494','07/22/11 Private Event',3,''),(564,'2013-09-30 11:28:07',1,12,'701','07/23/11 Private Event',3,''),(565,'2013-09-30 11:28:07',1,12,'491','07/23/11 Private Event',3,''),(566,'2013-09-30 11:28:07',1,12,'697','07/27/11 Pruneyard Concert Series',3,''),(567,'2013-09-30 11:28:07',1,12,'487','07/27/11 Pruneyard Concert Series',3,''),(568,'2013-09-30 11:28:07',1,12,'694','07/30/11 Brentwood Concert Series',3,''),(569,'2013-09-30 11:28:07',1,12,'484','07/30/11 Brentwood Concert Series',3,''),(570,'2013-09-30 11:28:07',1,12,'699','08/06/11 Lake Mission Viejo Concert Series',3,''),(571,'2013-09-30 11:28:07',1,12,'489','08/06/11 Lake Mission Viejo Concert Series',3,''),(572,'2013-09-30 11:28:07',1,12,'680','08/13/11 El Dorado Hills Concert Series',3,''),(573,'2013-09-30 11:28:07',1,12,'470','08/13/11 El Dorado Hills Concert Series',3,''),(574,'2013-09-30 11:28:07',1,12,'700','08/14/11 Private Event',3,''),(575,'2013-09-30 11:28:07',1,12,'490','08/14/11 Private Event',3,''),(576,'2013-09-30 11:28:07',1,12,'705','08/26/11 The Showroom',3,''),(577,'2013-09-30 11:28:07',1,12,'495','08/26/11 The Showroom',3,''),(578,'2013-09-30 11:28:07',1,12,'687','08/27/11 Uptown Theatre',3,''),(579,'2013-09-30 11:28:07',1,12,'477','08/27/11 Uptown Theatre',3,''),(580,'2013-09-30 11:28:07',1,12,'717','08/28/11 Oakland Chinatown StreetFest',3,''),(581,'2013-09-30 11:28:07',1,12,'507','08/28/11 Oakland Chinatown StreetFest',3,''),(582,'2013-09-30 11:28:07',1,12,'681','09/09/11 Redwood City Music on the Square',3,''),(583,'2013-09-30 11:28:07',1,12,'471','09/09/11 Redwood City Music on the Square',3,''),(584,'2013-09-30 11:28:07',1,12,'682','09/15/11 Music & Market Series',3,''),(585,'2013-09-30 11:28:07',1,12,'472','09/15/11 Music & Market Series',3,''),(586,'2013-09-30 11:28:07',1,12,'683','09/16/11 Lodi Grape & Harvest Festival',3,''),(587,'2013-09-30 11:28:07',1,12,'473','09/16/11 Lodi Grape & Harvest Festival',3,''),(588,'2013-09-30 11:28:07',1,12,'684','09/17/11 Don Quixote\'s',3,''),(589,'2013-09-30 11:28:07',1,12,'474','09/17/11 Don Quixote\'s',3,''),(590,'2013-09-30 11:28:07',1,12,'706','09/24/11 Mountain House Concert Series',3,''),(591,'2013-09-30 11:28:07',1,12,'496','09/24/11 Mountain House Concert Series',3,''),(592,'2013-09-30 11:28:07',1,12,'710','09/30/11 Fulton 55',3,''),(593,'2013-09-30 11:28:07',1,12,'500','09/30/11 Fulton 55',3,''),(594,'2013-09-30 11:28:07',1,12,'720','10/20/11 Private Event',3,''),(595,'2013-09-30 11:28:07',1,12,'510','10/20/11 Private Event',3,''),(596,'2013-09-30 11:28:07',1,12,'718','10/21/11 The Avalon',3,''),(597,'2013-09-30 11:28:07',1,12,'508','10/21/11 The Avalon',3,''),(598,'2013-09-30 11:28:07',1,12,'685','10/28/11 Pepper Belly\'s',3,''),(599,'2013-09-30 11:28:07',1,12,'475','10/28/11 Pepper Belly\'s',3,''),(600,'2013-09-30 11:28:07',1,12,'711','10/29/11 Bimbo\'s',3,''),(601,'2013-09-30 11:28:07',1,12,'501','10/29/11 Bimbo\'s',3,''),(602,'2013-09-30 11:28:07',1,12,'719','11/04/11 Stockton Empire Theatre',3,''),(603,'2013-09-30 11:28:07',1,12,'509','11/04/11 Stockton Empire Theatre',3,''),(604,'2013-09-30 11:28:07',1,12,'712','11/05/11 Dan\'s Bar',3,''),(605,'2013-09-30 11:28:07',1,12,'502','11/05/11 Dan\'s Bar',3,''),(606,'2013-09-30 11:28:07',1,12,'713','11/11/11 Powerhouse Pub',3,''),(607,'2013-09-30 11:28:07',1,12,'503','11/11/11 Powerhouse Pub',3,''),(608,'2013-09-30 11:28:07',1,12,'709','11/12/11 The Knitting Factory',3,''),(609,'2013-09-30 11:28:07',1,12,'499','11/12/11 The Knitting Factory',3,''),(610,'2013-09-30 11:28:07',1,12,'686','11/18/11 Don Quixote\'s',3,''),(611,'2013-09-30 11:28:07',1,12,'476','11/18/11 Don Quixote\'s',3,''),(612,'2013-09-30 11:28:07',1,12,'722','11/19/11 George\'s Night Club',3,''),(613,'2013-09-30 11:28:07',1,12,'512','11/19/11 George\'s Night Club',3,''),(614,'2013-09-30 11:28:07',1,12,'714','12/03/11 Red Devil Lounge',3,''),(615,'2013-09-30 11:28:07',1,12,'504','12/03/11 Red Devil Lounge',3,''),(616,'2013-09-30 11:28:07',1,12,'716','12/09/11 Private Event',3,''),(617,'2013-09-30 11:28:07',1,12,'506','12/09/11 Private Event',3,''),(618,'2013-09-30 11:28:07',1,12,'721','12/16/11 Private Event',3,''),(619,'2013-09-30 11:28:07',1,12,'511','12/16/11 Private Event',3,''),(620,'2013-09-30 11:28:07',1,12,'733','12/17/11 Private Event',3,''),(621,'2013-09-30 11:28:07',1,12,'523','12/17/11 Private Event',3,''),(622,'2013-09-30 11:28:07',1,12,'698','12/30/11 Don Quixote\'s',3,''),(623,'2013-09-30 11:28:07',1,12,'488','12/30/11 Don Quixote\'s',3,''),(624,'2013-09-30 11:28:07',1,12,'723','12/31/11 Bimbo\'s',3,''),(625,'2013-09-30 11:28:07',1,12,'513','12/31/11 Bimbo\'s',3,''),(626,'2013-09-30 11:28:07',1,12,'734','01/05/12 Private Event',3,''),(627,'2013-09-30 11:28:07',1,12,'524','01/05/12 Private Event',3,''),(628,'2013-09-30 11:28:07',1,12,'724','01/14/12 Dan\'s Bar',3,''),(629,'2013-09-30 11:28:07',1,12,'514','01/14/12 Dan\'s Bar',3,''),(630,'2013-09-30 11:28:07',1,12,'725','02/03/12 Red Devil Lounge',3,''),(631,'2013-09-30 11:28:07',1,12,'515','02/03/12 Red Devil Lounge',3,''),(632,'2013-09-30 11:28:07',1,12,'735','02/04/12 The New Parish',3,''),(633,'2013-09-30 11:28:07',1,12,'525','02/04/12 The New Parish',3,''),(634,'2013-09-30 11:28:07',1,12,'741','02/10/12 Fulton 55',3,''),(635,'2013-09-30 11:28:07',1,12,'531','02/10/12 Fulton 55',3,''),(636,'2013-09-30 11:28:07',1,12,'736','02/24/12 Don Quixote\'s',3,''),(637,'2013-09-30 11:28:07',1,12,'526','02/24/12 Don Quixote\'s',3,''),(638,'2013-09-30 11:28:07',1,12,'726','02/25/12 Dan\'s Bar',3,''),(639,'2013-09-30 11:28:07',1,12,'516','02/25/12 Dan\'s Bar',3,''),(640,'2013-09-30 11:28:07',1,12,'727','03/09/12 Bimbo\'s',3,''),(641,'2013-09-30 11:28:07',1,12,'517','03/09/12 Bimbo\'s',3,''),(642,'2013-09-30 11:28:07',1,12,'728','03/23/12 George\'s Night Club',3,''),(643,'2013-09-30 11:28:07',1,12,'518','03/23/12 George\'s Night Club',3,''),(644,'2013-09-30 11:28:07',1,12,'715','03/30/12 Powerhouse Pub',3,''),(645,'2013-09-30 11:28:07',1,12,'505','03/30/12 Powerhouse Pub',3,''),(646,'2013-09-30 11:28:07',1,12,'729','03/31/12 Dan\'s Bar',3,''),(647,'2013-09-30 11:28:07',1,12,'519','03/31/12 Dan\'s Bar',3,''),(648,'2013-09-30 11:28:07',1,12,'730','04/20/12 Red Devil Lounge',3,''),(649,'2013-09-30 11:28:07',1,12,'520','04/20/12 Red Devil Lounge',3,''),(650,'2013-09-30 11:28:07',1,12,'737','04/27/12 Don Quixote\'s',3,''),(651,'2013-09-30 11:28:07',1,12,'527','04/27/12 Don Quixote\'s',3,''),(652,'2013-09-30 11:28:07',1,12,'751','05/11/12 The New Parish',3,''),(653,'2013-09-30 11:28:07',1,12,'541','05/11/12 The New Parish',3,''),(654,'2013-09-30 11:28:07',1,12,'731','05/12/12 Private Event',3,''),(655,'2013-09-30 11:28:07',1,12,'521','05/12/12 Private Event',3,''),(656,'2013-09-30 11:28:07',1,12,'754','06/01/12 El Dorado Hills Concert Series',3,''),(657,'2013-09-30 11:28:07',1,12,'544','06/01/12 El Dorado Hills Concert Series',3,''),(658,'2013-09-30 11:28:07',1,12,'738','06/02/12 Don Quixote\'s',3,''),(659,'2013-09-30 11:28:07',1,12,'528','06/02/12 Don Quixote\'s',3,''),(660,'2013-09-30 11:28:07',1,12,'742','06/23/12 Bimbo\'s',3,''),(661,'2013-09-30 11:28:07',1,12,'532','06/23/12 Bimbo\'s',3,''),(662,'2013-09-30 11:28:07',1,12,'743','07/06/12 Blackhawk Plaza',3,''),(663,'2013-09-30 11:28:07',1,12,'533','07/06/12 Blackhawk Plaza',3,''),(664,'2013-09-30 11:28:07',1,12,'755','07/13/12 Stonecreek Village Summer Concert Series',3,''),(665,'2013-09-30 11:28:07',1,12,'545','07/13/12 Stonecreek Village Summer Concert Series',3,''),(666,'2013-09-30 11:28:07',1,12,'764','07/14/12 George\'s Night Club',3,''),(667,'2013-09-30 11:28:07',1,12,'554','07/14/12 George\'s Night Club',3,''),(668,'2013-09-30 11:28:07',1,12,'707','07/19/12 Los Altos Summer Concert Series',3,''),(669,'2013-09-30 11:28:07',1,12,'497','07/19/12 Los Altos Summer Concert Series',3,''),(670,'2013-09-30 11:28:07',1,12,'756','07/20/12 Dan\'s Bar',3,''),(671,'2013-09-30 11:28:07',1,12,'546','07/20/12 Dan\'s Bar',3,''),(672,'2013-09-30 11:28:07',1,12,'765','07/25/12 Pruneyard Concert Series',3,''),(673,'2013-09-30 11:28:07',1,12,'555','07/25/12 Pruneyard Concert Series',3,''),(674,'2013-09-30 11:28:07',1,12,'744','07/27/12 Red Devil Lounge',3,''),(675,'2013-09-30 11:28:07',1,12,'534','07/27/12 Red Devil Lounge',3,''),(676,'2013-09-30 11:28:07',1,12,'748','07/28/12 California Beer Fest',3,''),(677,'2013-09-30 11:28:07',1,12,'538','07/28/12 California Beer Fest',3,''),(678,'2013-09-30 11:28:07',1,12,'766','08/01/12 Concerts in the Park - Sounds of Summer Series',3,''),(679,'2013-09-30 11:28:07',1,12,'556','08/01/12 Concerts in the Park - Sounds of Summer Series',3,''),(680,'2013-09-30 11:28:07',1,12,'767','08/02/12 Hood River Summer Concerts Series',3,''),(681,'2013-09-30 11:28:07',1,12,'557','08/02/12 Hood River Summer Concerts Series',3,''),(682,'2013-09-30 11:28:07',1,12,'763','08/09/12 Music & Market Series',3,''),(683,'2013-09-30 11:28:07',1,12,'553','08/09/12 Music & Market Series',3,''),(684,'2013-09-30 11:28:07',1,12,'739','08/11/12 Don Quixote\'s',3,''),(685,'2013-09-30 11:28:07',1,12,'529','08/11/12 Don Quixote\'s',3,''),(686,'2013-09-30 11:28:07',1,12,'760','08/17/12 Friday Night Live @ Trails Park',3,''),(687,'2013-09-30 11:28:07',1,12,'550','08/17/12 Friday Night Live @ Trails Park',3,''),(688,'2013-09-30 11:28:07',1,12,'761','08/18/12 Silverton Casino Hotel',3,''),(689,'2013-09-30 11:28:07',1,12,'551','08/18/12 Silverton Casino Hotel',3,''),(690,'2013-09-30 11:28:07',1,12,'745','08/25/12 Bimbo\'s',3,''),(691,'2013-09-30 11:28:07',1,12,'535','08/25/12 Bimbo\'s',3,''),(692,'2013-09-30 11:28:07',1,12,'770','08/30/12 Montgomery Village',3,''),(693,'2013-09-30 11:28:07',1,12,'560','08/30/12 Montgomery Village',3,''),(694,'2013-09-30 11:28:07',1,12,'762','08/31/12 Redwood City Music on the Square',3,''),(695,'2013-09-30 11:28:07',1,12,'552','08/31/12 Redwood City Music on the Square',3,''),(696,'2013-09-30 11:28:07',1,12,'768','09/13/12 Fulton 55',3,''),(697,'2013-09-30 11:28:07',1,12,'558','09/13/12 Fulton 55',3,''),(698,'2013-09-30 11:28:07',1,12,'771','09/14/12 Velvet Jones',3,''),(699,'2013-09-30 11:28:07',1,12,'561','09/14/12 Velvet Jones',3,''),(700,'2013-09-30 11:28:07',1,12,'749','09/15/12 California Beer Fest',3,''),(701,'2013-09-30 11:28:07',1,12,'539','09/15/12 California Beer Fest',3,''),(702,'2013-09-30 11:28:07',1,12,'746','09/21/12 Red Devil Lounge',3,''),(703,'2013-09-30 11:28:07',1,12,'536','09/21/12 Red Devil Lounge',3,''),(704,'2013-09-30 11:28:07',1,12,'750','09/22/12 California Beer Fest',3,''),(705,'2013-09-30 11:28:07',1,12,'540','09/22/12 California Beer Fest',3,''),(706,'2013-09-30 11:28:07',1,12,'740','09/28/12 Don Quixote\'s',3,''),(707,'2013-09-30 11:28:07',1,12,'530','09/28/12 Don Quixote\'s',3,''),(708,'2013-09-30 11:28:07',1,12,'732','09/29/12 Palo Alto Black & White Ball',3,''),(709,'2013-09-30 11:28:07',1,12,'522','09/29/12 Palo Alto Black & White Ball',3,''),(710,'2013-09-30 11:28:07',1,12,'773','10/05/12 Jon Lovitz Comedy Club',3,''),(711,'2013-09-30 11:28:07',1,12,'563','10/05/12 Jon Lovitz Comedy Club',3,''),(712,'2013-09-30 11:28:07',1,12,'769','10/06/12 California Beer Fest',3,''),(713,'2013-09-30 11:28:07',1,12,'559','10/06/12 California Beer Fest',3,''),(714,'2013-09-30 11:28:07',1,12,'775','10/25/12 Reunion Nightclub',3,''),(715,'2013-09-30 11:28:07',1,12,'565','10/25/12 Reunion Nightclub',3,''),(716,'2013-09-30 11:28:07',1,12,'772','10/27/12 Bimbo\'s',3,''),(717,'2013-09-30 11:28:07',1,12,'562','10/27/12 Bimbo\'s',3,''),(718,'2013-09-30 11:28:07',1,12,'752','11/16/12 The New Parish',3,''),(719,'2013-09-30 11:28:07',1,12,'542','11/16/12 The New Parish',3,''),(720,'2013-09-30 11:28:07',1,12,'747','11/17/12 Red Devil Lounge',3,''),(721,'2013-09-30 11:28:07',1,12,'537','11/17/12 Red Devil Lounge',3,''),(722,'2013-09-30 11:28:07',1,12,'774','11/18/12 Pittsburg Creative Arts Building',3,''),(723,'2013-09-30 11:28:07',1,12,'564','11/18/12 Pittsburg Creative Arts Building',3,''),(724,'2013-09-30 11:28:07',1,12,'753','12/01/12 George\'s Night Club',3,''),(725,'2013-09-30 11:28:07',1,12,'543','12/01/12 George\'s Night Club',3,''),(726,'2013-09-30 11:28:07',1,12,'757','12/08/12 Dan\'s Bar',3,''),(727,'2013-09-30 11:28:07',1,12,'547','12/08/12 Dan\'s Bar',3,''),(728,'2013-09-30 11:28:07',1,12,'758','12/28/12 Don Quixote\'s',3,''),(729,'2013-09-30 11:28:07',1,12,'548','12/28/12 Don Quixote\'s',3,''),(730,'2013-09-30 11:28:07',1,12,'776','12/29/12 Club Fox',3,''),(731,'2013-09-30 11:28:07',1,12,'566','12/29/12 Club Fox',3,''),(732,'2013-09-30 11:28:07',1,12,'759','01/05/13 Powerhouse Pub',3,''),(733,'2013-09-30 11:28:07',1,12,'549','01/05/13 Powerhouse Pub',3,''),(734,'2013-09-30 11:28:07',1,12,'777','01/12/13 Sweetwater Music Hall',3,''),(735,'2013-09-30 11:28:07',1,12,'567','01/12/13 Sweetwater Music Hall',3,''),(736,'2013-09-30 11:28:07',1,12,'794','01/25/13 Club Fox',3,''),(737,'2013-09-30 11:28:07',1,12,'584','01/25/13 Club Fox',3,''),(738,'2013-09-30 11:28:07',1,12,'790','01/26/13 Bimbo\'s',3,''),(739,'2013-09-30 11:28:07',1,12,'580','01/26/13 Bimbo\'s',3,''),(740,'2013-09-30 11:28:07',1,12,'796','02/22/13 The New Parish',3,''),(741,'2013-09-30 11:28:07',1,12,'795','02/22/13 The New Parish',3,''),(742,'2013-09-30 11:28:07',1,12,'586','02/22/13 The New Parish',3,''),(743,'2013-09-30 11:28:07',1,12,'585','02/22/13 The New Parish',3,''),(744,'2013-09-30 11:28:07',1,12,'779','02/23/13 Don Quixote\'s',3,''),(745,'2013-09-30 11:28:07',1,12,'569','02/23/13 Don Quixote\'s',3,''),(746,'2013-09-30 11:28:07',1,12,'780','03/02/13 Mystic Theatre',3,''),(747,'2013-09-30 11:28:07',1,12,'570','03/02/13 Mystic Theatre',3,''),(748,'2013-09-30 11:28:07',1,12,'781','04/12/13 Bimbo\'s',3,''),(749,'2013-09-30 11:28:07',1,12,'571','04/12/13 Bimbo\'s',3,''),(750,'2013-09-30 11:28:07',1,12,'791','04/20/13 Club Fox',3,''),(751,'2013-09-30 11:28:07',1,12,'581','04/20/13 Club Fox',3,''),(752,'2013-09-30 11:28:07',1,12,'782','04/20/13 The New Parish',3,''),(753,'2013-09-30 11:28:07',1,12,'572','04/20/13 The New Parish',3,''),(754,'2013-09-30 11:28:07',1,12,'788','05/17/13 Don Quixote\'s',3,''),(755,'2013-09-30 11:28:07',1,12,'578','05/17/13 Don Quixote\'s',3,''),(756,'2013-09-30 11:28:07',1,12,'801','05/18/13 Slim\'s',3,''),(757,'2013-09-30 11:28:07',1,12,'591','05/18/13 Slim\'s',3,''),(758,'2013-09-30 11:28:07',1,12,'802','05/25/13 Harlow\'s',3,''),(759,'2013-09-30 11:28:08',1,12,'592','05/25/13 Harlow\'s',3,''),(760,'2013-09-30 11:28:08',1,12,'786','06/08/13 Black Oak Casino',3,''),(761,'2013-09-30 11:28:08',1,12,'576','06/08/13 Black Oak Casino',3,''),(762,'2013-09-30 11:28:08',1,12,'803','06/13/13 Los Altos Summer Concert Series',3,''),(763,'2013-09-30 11:28:08',1,12,'593','06/13/13 Los Altos Summer Concert Series',3,''),(764,'2013-09-30 11:28:08',1,12,'804','06/14/13 The New Parish',3,''),(765,'2013-09-30 11:28:08',1,12,'594','06/14/13 The New Parish',3,''),(766,'2013-09-30 11:28:08',1,12,'810','06/21/13 Cervantes\' Masterpiece Ballroom',3,''),(767,'2013-09-30 11:28:08',1,12,'600','06/21/13 Cervantes\' Masterpiece Ballroom',3,''),(768,'2013-09-30 11:28:08',1,12,'811','06/22/13 Rock Into The Wild',3,''),(769,'2013-09-30 11:28:08',1,12,'601','06/22/13 Rock Into The Wild',3,''),(770,'2013-09-30 11:28:08',1,12,'812','06/23/13 Belly Up Aspen',3,''),(771,'2013-09-30 11:28:08',1,12,'602','06/23/13 Belly Up Aspen',3,''),(772,'2013-09-30 11:28:08',1,12,'800','06/27/13 Montgomery Village',3,''),(773,'2013-09-30 11:28:08',1,12,'590','06/27/13 Montgomery Village',3,''),(774,'2013-09-30 11:28:08',1,12,'805','07/05/13 Blackhawk Plaza',3,''),(775,'2013-09-30 11:28:08',1,12,'595','07/05/13 Blackhawk Plaza',3,''),(776,'2013-09-30 11:28:08',1,12,'820','07/06/13 Fairmont Scottsdale Princess Resort',3,''),(777,'2013-09-30 11:28:08',1,12,'610','07/06/13 Fairmont Scottsdale Princess Resort',3,''),(778,'2013-09-30 11:28:08',1,12,'798','07/11/13 Music & Market Series',3,''),(779,'2013-09-30 11:28:08',1,12,'588','07/11/13 Music & Market Series',3,''),(780,'2013-09-30 11:28:08',1,12,'813','07/12/13 House of Blues San Diego',3,''),(781,'2013-09-30 11:28:08',1,12,'603','07/12/13 House of Blues San Diego',3,''),(782,'2013-09-30 11:28:08',1,12,'814','07/13/13 House of Blues Anaheim',3,''),(783,'2013-09-30 11:28:08',1,12,'604','07/13/13 House of Blues Anaheim',3,''),(784,'2013-09-30 11:28:08',1,12,'816','07/19/13 Sweetwater Music Hall',3,''),(785,'2013-09-30 11:28:08',1,12,'606','07/19/13 Sweetwater Music Hall',3,''),(786,'2013-09-30 11:28:08',1,12,'792','07/20/13 Club Fox',3,''),(787,'2013-09-30 11:28:08',1,12,'582','07/20/13 Club Fox',3,''),(788,'2013-09-30 11:28:08',1,12,'783','07/26/13 Don Quixote\'s',3,''),(789,'2013-09-30 11:28:08',1,12,'573','07/26/13 Don Quixote\'s',3,''),(790,'2013-09-30 11:28:08',1,12,'821','07/27/13 Sonoma County Fair',3,''),(791,'2013-09-30 11:28:08',1,12,'611','07/27/13 Sonoma County Fair',3,''),(792,'2013-09-30 11:28:08',1,12,'817','08/01/13 Windsor Summer Nights on the Green',3,''),(793,'2013-09-30 11:28:08',1,12,'607','08/01/13 Windsor Summer Nights on the Green',3,''),(794,'2013-09-30 11:28:08',1,12,'799','08/10/13 California Beer Fest',3,''),(795,'2013-09-30 11:28:08',1,12,'589','08/10/13 California Beer Fest',3,''),(796,'2013-09-30 11:28:08',1,12,'807','08/16/13 Brisbane Concerts in the Park',3,''),(797,'2013-09-30 11:28:08',1,12,'597','08/16/13 Brisbane Concerts in the Park',3,''),(798,'2013-09-30 11:28:08',1,12,'806','08/23/13 Powerhouse Pub',3,''),(799,'2013-09-30 11:28:08',1,12,'596','08/23/13 Powerhouse Pub',3,''),(800,'2013-09-30 11:28:08',1,12,'787','08/24/13 Bimbo\'s',3,''),(801,'2013-09-30 11:28:08',1,12,'577','08/24/13 Bimbo\'s',3,''),(802,'2013-09-30 11:28:08',1,12,'818','09/07/13 The Catalyst',3,''),(803,'2013-09-30 11:28:08',1,12,'608','09/07/13 The Catalyst',3,''),(804,'2013-09-30 11:28:08',1,12,'809','09/13/13 Redwood City Music on the Square',3,''),(805,'2013-09-30 11:28:08',1,12,'599','09/13/13 Redwood City Music on the Square',3,''),(806,'2013-09-30 11:28:08',1,12,'797','09/21/13 California Beer Fest',3,''),(807,'2013-09-30 11:28:08',1,12,'587','09/21/13 California Beer Fest',3,''),(808,'2013-09-30 11:28:08',1,12,'815','09/27/13 Summertime at the Maritime Vallejo',3,''),(809,'2013-09-30 11:28:08',1,12,'605','09/27/13 Summertime at the Maritime Vallejo',3,''),(810,'2013-09-30 11:28:08',1,12,'808','09/28/13 Mystic Theatre',3,''),(811,'2013-09-30 11:28:08',1,12,'598','09/28/13 Mystic Theatre',3,''),(812,'2013-09-30 11:28:08',1,12,'784','10/18/13 Don Quixote\'s',3,''),(813,'2013-09-30 11:28:08',1,12,'574','10/18/13 Don Quixote\'s',3,''),(814,'2013-09-30 11:28:08',1,12,'793','10/19/13 Club Fox',3,''),(815,'2013-09-30 11:28:08',1,12,'583','10/19/13 Club Fox',3,''),(816,'2013-09-30 11:28:08',1,12,'785','10/26/13 Bimbo\'s',3,''),(817,'2013-09-30 11:28:08',1,12,'575','10/26/13 Bimbo\'s',3,''),(818,'2013-09-30 11:28:08',1,12,'819','11/15/13 Powerhouse Pub',3,''),(819,'2013-09-30 11:28:08',1,12,'609','11/15/13 Powerhouse Pub',3,''),(820,'2013-09-30 11:28:08',1,12,'822','12/14/13 Silicon Valley Ball',3,''),(821,'2013-09-30 11:28:08',1,12,'612','12/14/13 Silicon Valley Ball',3,''),(822,'2013-09-30 11:28:08',1,12,'789','12/28/13 Don Quixote\'s',3,''),(823,'2013-09-30 11:28:08',1,12,'579','12/28/13 Don Quixote\'s',3,''),(824,'2013-09-30 11:28:08',1,12,'778','02/16/14 The New Parish',3,''),(825,'2013-09-30 11:28:08',1,12,'568','02/16/14 The New Parish',3,''),(826,'2013-09-30 12:41:13',1,12,'995','10/26/13 Bimbo\'s',2,'Changed doors_time, ticket_price, ticket_url and opener.'),(827,'2013-09-30 12:41:35',1,12,'995','10/26/13 Bimbo\'s',2,'Changed ages.');
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
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'site','sites','site'),(8,'migration history','south','migrationhistory'),(9,'testimonial','marketing','testimonial'),(10,'member','members','member'),(11,'venue','shows','venue'),(12,'show','shows','show'),(13,'song','songs','song'),(14,'setlist','songs','setlist'),(15,'setlist song','songs','setlistsong'),(16,'album','media','album'),(17,'tag','media','tag'),(18,'image','media','image'),(19,'video','media','video'),(20,'user profile','accounts','userprofile'),(21,'registration profile','registration','registrationprofile'),(23,'wp bwbps categories','legacy','wpbwbpscategories'),(24,'wp bwbps customdata','legacy','wpbwbpscustomdata'),(25,'wp bwbps favorites','legacy','wpbwbpsfavorites'),(26,'wp bwbps fields','legacy','wpbwbpsfields'),(27,'wp bwbps forms','legacy','wpbwbpsforms'),(28,'wp bwbps galleries','legacy','wpbwbpsgalleries'),(29,'wp bwbps imageratings','legacy','wpbwbpsimageratings'),(30,'wp bwbps images','legacy','wpbwbpsimages'),(31,'wp bwbps layouts','legacy','wpbwbpslayouts'),(32,'wp bwbps lookup','legacy','wpbwbpslookup'),(33,'wp bwbps params','legacy','wpbwbpsparams'),(34,'wp bwbps ratingssummary','legacy','wpbwbpsratingssummary'),(35,'wp commentmeta','legacy','wpcommentmeta'),(36,'wp comments','legacy','wpcomments'),(37,'wp gigpress artists','legacy','wpgigpressartists'),(38,'wp gigpress shows','legacy','wpgigpressshows'),(39,'wp gigpress tours','legacy','wpgigpresstours'),(40,'wp gigpress venues','legacy','wpgigpressvenues'),(41,'wp links','legacy','wplinks'),(42,'wp ngg album','legacy','wpnggalbum'),(43,'wp ngg gallery','legacy','wpngggallery'),(44,'wp ngg pictures','legacy','wpnggpictures'),(48,'wp options','legacy','wpoptions'),(49,'wp postmeta','legacy','wppostmeta'),(50,'wp posts','legacy','wpposts'),(51,'wp randomtext','legacy','wprandomtext'),(52,'wp term relationships','legacy','wptermrelationships'),(53,'wp term taxonomy','legacy','wptermtaxonomy'),(54,'wp terms','legacy','wpterms'),(55,'wp usermeta','legacy','wpusermeta'),(56,'wp users','legacy','wpusers'),(57,'wp wpb2d excluded files','legacy','wpwpb2dexcludedfiles'),(58,'wp wpb2d options','legacy','wpwpb2doptions'),(59,'wp wpb2d premium extensions','legacy','wpwpb2dpremiumextensions'),(60,'wp wpb2d processed files','legacy','wpwpb2dprocessedfiles'),(93,'ahm files','legacy','ahmfiles');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('a3fziwcwmb03gerjulg7k30y8zzgnfir','MGJlODliOWUwMWMyZWY0ZGRjMTEwYmJhZDU3Zjc1ZWExNDliOGRmMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==','2013-10-14 20:20:01'),('h2xb1ua3odl49mun175ro14qd55tlr82','MGJlODliOWUwMWMyZWY0ZGRjMTEwYmJhZDU3Zjc1ZWExNDliOGRmMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==','2013-10-11 10:35:20'),('maumkyjquqnccg0y67121v2tzf4d2o4m','MGJlODliOWUwMWMyZWY0ZGRjMTEwYmJhZDU3Zjc1ZWExNDliOGRmMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==','2013-10-11 15:04:30'),('ttirm5y2shsdi8gd6y79uzxpg6io8keu','MGJlODliOWUwMWMyZWY0ZGRjMTEwYmJhZDU3Zjc1ZWExNDliOGRmMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==','2013-10-15 13:05:57'),('ylf2puco5izirpee8j6fyqu1s92218tn','NzM1N2E4MGE5NjE2Y2E5YWE1ZWIwMDc0NjE5NGZmZWNkZmU3OWQ4ZjqAAn1xAS4=','2013-10-15 16:23:59');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'foreverland.com','foreverland.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_testimonial`
--

DROP TABLE IF EXISTS `marketing_testimonial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marketing_testimonial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote` longtext NOT NULL,
  `source` varchar(100) DEFAULT NULL,
  `show_id` int(11) DEFAULT NULL,
  `featured` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `show_id_refs_id_a248bc04` (`show_id`),
  CONSTRAINT `show_id_refs_id_a248bc04` FOREIGN KEY (`show_id`) REFERENCES `shows_show` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=338 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_testimonial`
--

LOCK TABLES `marketing_testimonial` WRITE;
/*!40000 ALTER TABLE `marketing_testimonial` DISABLE KEYS */;
INSERT INTO `marketing_testimonial` VALUES (1,'I laughed, I cried, it was better than CATS. I\'d see it again and again. Fan 4 Lyfe.','Some Dude',NULL,1),(2,'I went, not knowing exactly what to expect. Spent the afternoon listening to MJ with my family, getting psyched up. Foreverland BLEW ME AWAY! ',NULL,NULL,1),(3,'Great music. Great dancing and show. You guys rock!',NULL,NULL,1),(4,'Fan for life! Vocals and music are dead-on! And the energy from the band is amazing! You look like you’re having as much fun as the crowd. Keep up the great work.',NULL,NULL,1),(5,'My husband saw your show at the Grape festival here in Lodi. He told me I need to see you so when your show was in Stockton we went. It was last night. You guys are amazing.I am ready to see you again. I hope you are coming this way again.',NULL,NULL,1),(6,'Fell in love with your band when I saw you for the first time in Redwood City over the summer. Had to see you again – so went to the Avalon show. OMG – it was such fun. Great great band. I am sold. Will be going to as many local venues you are at.',NULL,NULL,1),(7,'Saw the show tonight at the Avalon in Sunnyvale, you guys are so talented! The show was incredible!!! I want more FOREVERLAND!!! When is the CD coming out? LOVE, LOVE, LOVE you guys!!!',NULL,NULL,1),(8,'Wow, a great show! You guys have made your concert so fun to be a part of. The singers, the horns, your dance moves, your precision is phenomenal! Matthew Layne….is the best! We hope you will come to Fresno again. Maybe the Big Fresno Fair 2012??? Thanks for coming to Fresno.',NULL,NULL,1),(9,'What a great show! You guys were amazing! I will be bringing many friends with me when you return in November',NULL,NULL,1),(10,'I went to see your 9 o’clock show, I am huge fan of Michael Jackson, so anything that has to do with MJ I’m there. I was very impressed and really enjoyed the show, it was awesome. Can’t wait to see you guys in November at the Empire.',NULL,NULL,1),(11,'Really fun show. Great dancing, great vocals and great musicians. High energy and totally entertaining. Everyone was dancing in the aisles. We had a fantastic time!',NULL,NULL,1),(12,'Every member of your band always puts out 200% without a blink! Thank you for always being such “super stars” in your own right. My group was amazed at the sounds of voice and instrument. Every player is an equal. Thank you, thank you again.',NULL,NULL,1),(13,'Me & the wife had a great time. The music was fantastic & the energy was real. Would love to see these guys again. Hopefully they make it close to Vacaville or somewhere in the area. These guys should make a big name for themselves in the entertainment industry.',NULL,NULL,1),(14,'Always awsome, energetic and fun! Love you guys!!!',NULL,NULL,1),(15,'What a show. A great tribute to Michael Jackson. If you ever have a chance to see these guys, do not miss it. It’s very rare to see a couple thousand people of all ages that into a concert. Thanks for coming to Lake Mission Viejo, really hope you come back.',NULL,NULL,1),(16,'Incredible Night!!! Danced for 2 hours solid! These guys are the real deal I hope you come back to Mission Viejo again next year. Best concert in years at the lake… Everyone should see these guys you will not regret it!!',NULL,NULL,1),(17,'A great night! The whole band was a blast…these guys have the formula and worked hard on stage. The horn section was fantastic too. It was super the way the guys coordinated singing and dancing the songs…tag teaming..Foreverland did not skimp on their show…if you have a chance to see them you will be delighted…',NULL,NULL,1),(18,'Wow wow wow wow wow what a great concert! These guys were so entertaining. We enjoyed it so much!!!!! My friends and I feel so blessed to be apart of such a fun and auctioned pack night.',NULL,NULL,1),(19,'The show last night was awesome! We danced & sang along & had a great time! And I loved that they performed extra songs for us! Their talent, energy, and creativity really honors our pop legend, Michael Jackson!',NULL,NULL,1),(20,'That was the best show I’ve see in a long time. Y’all killed it. I have blisters from dancing so much. Thank you.',NULL,NULL,1),(21,'OMG! I saw you guys last Friday evening in Blackhawk Danville! YOU GUYS were AWESOME!',NULL,NULL,1),(22,'I attended your show. You were everything I expected and much more. Hope to see you guys again… and again. Thanks for being a group of uncompromising talent!',NULL,NULL,1),(23,'Just got home from your show in Newman… loved, loved, loved it!!! You guys are fantastic and put on one %&*# of a show. Come back again!',NULL,NULL,1),(24,'Saw you guys at Bimbo\'s last night, you freaking killed it, stomped it, and knocked it outta the park! Can\'t wait for June when you are back there. Thanks for a great night.',NULL,NULL,1),(25,'Great show at Crab Cove! Incredible energy – you rock the house!',NULL,NULL,1),(26,'We don’t live in SF and hadn’t researched the planned festivities; we were just there to see the fireworks. Boy, are we glad we happened along as you began your set…you are fantastic!!! Couldn’t believe your energy as you masterfully delivered one song after another. I think you covered Michael’s whole career!!! Great!!!',NULL,NULL,1),(27,'Saw your show tonight in downtown Pittsburg…loved it! Great sound, great energy, excellent performance! Thanks! We’ll be back!',NULL,NULL,1),(28,'Super sick. Dancing and singing were spot on. Rocked out in the front row for the whole show. AWESOME!!!',NULL,NULL,1),(29,'I was at the Brooklyn Bowl Tribute concert for MJ . It was fabulous!!!! You guys really nailed it with the singing and all the instruments really gave it that full rich sound that Michael loved. I am so glad I went.The crowd was really into your performance. You are right up there with the best MJ performances I have seen since he passed. Great, great job!!!!!!!! Please come to NYC again ANYTIME!!!!',NULL,NULL,1),(30,'Show was amazing!! I am a die-hard MJ fan but never had the opportunity to see him perform live. I felt like this was the closest I could get to it. You guys are wonderful performers and musicians. I could not stop dancing or smiling the entire evening!',NULL,NULL,1),(31,'WOW, what a show! This was my first time seeing Foreverland, and I must say that although I was expecting a great time, I did not expect such an incredible level of talent and showmanship. I danced so hard, I ended up on stage during “The Girl is Mine”. Ha! It is obvious that you all have a great amount of love and care for the music of MJ, and performing Off the Wall and Thriller in their entireties was an enormous treat for this huge fan. Thank you SO MUCH! I will definitely be seeing you all again! xoxo',NULL,NULL,1),(32,'To say you guys were beyond expectations is understatement to Infinity! You all were, every one of you were, utterly phenomenal! The singers...WHOA! The horn section? \"I am not worthy!  I am not worthy!\" The cover of Thriller?????  OMG WORTH the price of admission AND the bottle of vodka to reserve the table! People, go to this show! Foreverland is so much fun and SUCH an amazing tribute band......you will have the time of your life!',NULL,NULL,1),(33,'Bought 12 VIP tickets with table reserved upstairs to watch you guys while we celebrated my wife\'s bday this past Sat at Red Devil Lounge. You guys were awesome and we all had a great time! Thanks for jamming and keeping the MJ spirit alive!',NULL,NULL,1),(34,'Awesome. Fantastic. Entertaining. So glad I went. Was a near 2 hour drive and well worth the evening. I hope to see you again in the east bay! Great work and you look like you are having a great time entertaining the crowd!!',NULL,NULL,1),(35,'AWESOME AWESOME AWESOME show! Would definitely see it again & definitely telling all my friends about it! I am a huge MJ fan & am so sad I never saw him in concert...this is truly the next best thing! You guys are great!',NULL,NULL,1),(36,'Great Concert! Fun, energetic, great singing & instrument playing. Hope to see you all again soon.',NULL,NULL,1),(37,'Great show once again. The performance as a whole was simply amazing.  The singing, dancing, horns and the fact that there are 14 members all together on that one stage, fantastic.  Superb entertainment... I hope they come back again, because me and my girlfriends will be there for sure... Thanx guys for the show',NULL,NULL,1),(38,'What an amazing show!!!  You guys tore it up!  Such amazing musicians and such an amazing tribute.  The music was off the hook, the dancing great, the voices were simply incredible.  I danced my ass off all night nonstop.  Thank you so much for a wonderful wonderful time!  I\'ll be back again and again and again!',NULL,NULL,1),(39,'Fabulous band.  Seen \'em twice, first at Fox Theater in Redwood City, then Don Quixote\'s in Felton... Unbelievable, and CANNOT sit down while they play.  EXCELLENT!',NULL,NULL,1),(40,'Thanks for playing at our wedding!  You all did an excellent job and everyone is still talking about how well the band performed.  You truly helped make our wedding unforgettable, and having Michael be a part our special day was truly magical.',NULL,NULL,1),(41,'OMG!  We were there and they were so awesome.  So many songs, done perfectly and their rhythm is electrifying.  Their dance steps, choreography and energy was beyond amazing.  I\'m sure they were having as much fun as the crowd was.',NULL,NULL,1),(42,'The show was too good for words.  You guys went beyond the call of duty in terms of entertainment.  The energy that the band put on on this night was beyond belief.  Thank you so much for all that you give.  I have seen you at least ten times, but this show was the BOMB!',NULL,NULL,1),(43,'Thanks for the amazing talent, both musical and theatrical, and energy and precision and passion for Michael Jackson\'s great music, that your all bring to your shows.',NULL,NULL,1),(44,'Amaizing!!! Music! Performance! Full of energy, what a great show. Let’s brings bands of this quality more often! Loved every note of it. Thanks so much for coming to Santa Barbara!',NULL,NULL,1),(45,'It was FANTASTIC!!! My boyfriend and I had a great time! We danced the entire night away. People we saw at the beginning of the show weren’t seen again until the end because they were on the dance floor the entire night. I am a HUGE Michael Jackson fan and Foreverland did right by him. EXCELLENT!!!',NULL,NULL,1),(46,'We see you guys as often as we can, usually in the summer at outdoor venues, but we will make it a habit to get to your indoor venues as well! What a great night and quite possibly the best band working out there! MJ forever, Foreverland forever!',NULL,NULL,1),(47,'My first time seeing the band and they were fantastic. I invited six friends and we were all so impressed. The sound and energy they put out was so great and I danced to almost every song. Happy feet all the way!',NULL,NULL,1),(48,'I’m not usually a fan of cover bands or tribute bands, but you guys had me singing and dancing, too! Definitely a show to see if you want to leave with a smile on your face!',NULL,NULL,1),(49,'First time seeing you guys, we loved it!! Hope we can make it next year!! Can hardly wait!',NULL,NULL,1),(50,'I was part of the AV team and I gotta tell you, that was an amazing show you guys put on! You guys rocked!!!',NULL,NULL,1),(51,'AMAZING AMAZING AMAZING!!!! What a fantastic performance at the Fairmont Scottsdale Princess tonight. If you ever have the opportunity to catch their show RUN and JUMP at the chance. You do not want to miss them. I will for sure be at their show if they are in a city near me again!',NULL,NULL,1),(52,'I wouldn’t miss your concert for anything. You rocked it again.',NULL,NULL,1),(53,'They don’t just play, they dance and bring down the house.',NULL,NULL,1),(54,'WOW, WOW, WOW! Foreverland embodies the music, magic, and message of Michael Jackson with their high energy, eclectic show! Everyone needs to see their show!',NULL,NULL,1),(55,'Dynamite show by a tight ensemble. Liked that it wasn’t a MJ impersonation; rather just let his music speak for itself. You let the Spirit of Joy in his songs shine thru. Thanks!',NULL,NULL,1),(56,'Unbelievable performance! Thoroughly enjoyed this talented group of singers and musicians!',NULL,NULL,1),(57,'As is always the case, a great show, full of excitement, passion, energy and tribute to an everlasting gift for humanity.',NULL,NULL,1),(58,'I went, not knowing exactly what to expect. Spent the afternoon listening to MJ with my family, getting psyched up. Foreverland BLEW ME AWAY! ',NULL,NULL,1),(59,'Great music. Great dancing and show. You guys rock!',NULL,NULL,1),(60,'Fan for life! Vocals and music are dead-on! And the energy from the band is amazing! You look like you’re having as much fun as the crowd. Keep up the great work.',NULL,NULL,1),(61,'My husband saw your show at the Grape festival here in Lodi. He told me I need to see you so when your show was in Stockton we went. It was last night. You guys are amazing.I am ready to see you again. I hope you are coming this way again.',NULL,NULL,1),(62,'Fell in love with your band when I saw you for the first time in Redwood City over the summer. Had to see you again – so went to the Avalon show. OMG – it was such fun. Great great band. I am sold. Will be going to as many local venues you are at.',NULL,NULL,1),(63,'Saw the show tonight at the Avalon in Sunnyvale, you guys are so talented! The show was incredible!!! I want more FOREVERLAND!!! When is the CD coming out? LOVE, LOVE, LOVE you guys!!!',NULL,NULL,1),(64,'Wow, a great show! You guys have made your concert so fun to be a part of. The singers, the horns, your dance moves, your precision is phenomenal! Matthew Layne….is the best! We hope you will come to Fresno again. Maybe the Big Fresno Fair 2012??? Thanks for coming to Fresno.',NULL,NULL,1),(65,'What a great show! You guys were amazing! I will be bringing many friends with me when you return in November',NULL,NULL,1),(66,'I went to see your 9 o’clock show, I am huge fan of Michael Jackson, so anything that has to do with MJ I’m there. I was very impressed and really enjoyed the show, it was awesome. Can’t wait to see you guys in November at the Empire.',NULL,NULL,1),(67,'Really fun show. Great dancing, great vocals and great musicians. High energy and totally entertaining. Everyone was dancing in the aisles. We had a fantastic time!',NULL,NULL,1),(68,'Every member of your band always puts out 200% without a blink! Thank you for always being such “super stars” in your own right. My group was amazed at the sounds of voice and instrument. Every player is an equal. Thank you, thank you again.',NULL,NULL,1),(69,'Me & the wife had a great time. The music was fantastic & the energy was real. Would love to see these guys again. Hopefully they make it close to Vacaville or somewhere in the area. These guys should make a big name for themselves in the entertainment industry.',NULL,NULL,1),(70,'Always awsome, energetic and fun! Love you guys!!!',NULL,NULL,1),(71,'What a show. A great tribute to Michael Jackson. If you ever have a chance to see these guys, do not miss it. It’s very rare to see a couple thousand people of all ages that into a concert. Thanks for coming to Lake Mission Viejo, really hope you come back.',NULL,NULL,1),(72,'Incredible Night!!! Danced for 2 hours solid! These guys are the real deal I hope you come back to Mission Viejo again next year. Best concert in years at the lake… Everyone should see these guys you will not regret it!!',NULL,NULL,1),(73,'A great night! The whole band was a blast…these guys have the formula and worked hard on stage. The horn section was fantastic too. It was super the way the guys coordinated singing and dancing the songs…tag teaming..Foreverland did not skimp on their show…if you have a chance to see them you will be delighted…',NULL,NULL,1),(74,'Wow wow wow wow wow what a great concert! These guys were so entertaining. We enjoyed it so much!!!!! My friends and I feel so blessed to be apart of such a fun and auctioned pack night.',NULL,NULL,1),(75,'The show last night was awesome! We danced & sang along & had a great time! And I loved that they performed extra songs for us! Their talent, energy, and creativity really honors our pop legend, Michael Jackson!',NULL,NULL,1),(76,'That was the best show I’ve see in a long time. Y’all killed it. I have blisters from dancing so much. Thank you.',NULL,NULL,1),(77,'OMG! I saw you guys last Friday evening in Blackhawk Danville! YOU GUYS were AWESOME!',NULL,NULL,1),(78,'I attended your show. You were everything I expected and much more. Hope to see you guys again… and again. Thanks for being a group of uncompromising talent!',NULL,NULL,1),(79,'Just got home from your show in Newman… loved, loved, loved it!!! You guys are fantastic and put on one %&*# of a show. Come back again!',NULL,NULL,1),(80,'Saw you guys at Bimbo\'s last night, you freaking killed it, stomped it, and knocked it outta the park! Can\'t wait for June when you are back there. Thanks for a great night.',NULL,NULL,1),(81,'Great show at Crab Cove! Incredible energy – you rock the house!',NULL,NULL,1),(82,'We don’t live in SF and hadn’t researched the planned festivities; we were just there to see the fireworks. Boy, are we glad we happened along as you began your set…you are fantastic!!! Couldn’t believe your energy as you masterfully delivered one song after another. I think you covered Michael’s whole career!!! Great!!!',NULL,NULL,1),(83,'Saw your show tonight in downtown Pittsburg…loved it! Great sound, great energy, excellent performance! Thanks! We’ll be back!',NULL,NULL,1),(84,'Super sick. Dancing and singing were spot on. Rocked out in the front row for the whole show. AWESOME!!!',NULL,NULL,1),(85,'I was at the Brooklyn Bowl Tribute concert for MJ . It was fabulous!!!! You guys really nailed it with the singing and all the instruments really gave it that full rich sound that Michael loved. I am so glad I went.The crowd was really into your performance. You are right up there with the best MJ performances I have seen since he passed. Great, great job!!!!!!!! Please come to NYC again ANYTIME!!!!',NULL,NULL,1),(86,'Show was amazing!! I am a die-hard MJ fan but never had the opportunity to see him perform live. I felt like this was the closest I could get to it. You guys are wonderful performers and musicians. I could not stop dancing or smiling the entire evening!',NULL,NULL,1),(87,'WOW, what a show! This was my first time seeing Foreverland, and I must say that although I was expecting a great time, I did not expect such an incredible level of talent and showmanship. I danced so hard, I ended up on stage during “The Girl is Mine”. Ha! It is obvious that you all have a great amount of love and care for the music of MJ, and performing Off the Wall and Thriller in their entireties was an enormous treat for this huge fan. Thank you SO MUCH! I will definitely be seeing you all again! xoxo',NULL,NULL,1),(88,'To say you guys were beyond expectations is understatement to Infinity! You all were, every one of you were, utterly phenomenal! The singers...WHOA! The horn section? \"I am not worthy!  I am not worthy!\" The cover of Thriller?????  OMG WORTH the price of admission AND the bottle of vodka to reserve the table! People, go to this show! Foreverland is so much fun and SUCH an amazing tribute band......you will have the time of your life!',NULL,NULL,1),(89,'Bought 12 VIP tickets with table reserved upstairs to watch you guys while we celebrated my wife\'s bday this past Sat at Red Devil Lounge. You guys were awesome and we all had a great time! Thanks for jamming and keeping the MJ spirit alive!',NULL,NULL,1),(90,'Awesome. Fantastic. Entertaining. So glad I went. Was a near 2 hour drive and well worth the evening. I hope to see you again in the east bay! Great work and you look like you are having a great time entertaining the crowd!!',NULL,NULL,1),(91,'AWESOME AWESOME AWESOME show! Would definitely see it again & definitely telling all my friends about it! I am a huge MJ fan & am so sad I never saw him in concert...this is truly the next best thing! You guys are great!',NULL,NULL,1),(92,'Great Concert! Fun, energetic, great singing & instrument playing. Hope to see you all again soon.',NULL,NULL,1),(93,'Great show once again. The performance as a whole was simply amazing.  The singing, dancing, horns and the fact that there are 14 members all together on that one stage, fantastic.  Superb entertainment... I hope they come back again, because me and my girlfriends will be there for sure... Thanx guys for the show',NULL,NULL,1),(94,'What an amazing show!!!  You guys tore it up!  Such amazing musicians and such an amazing tribute.  The music was off the hook, the dancing great, the voices were simply incredible.  I danced my ass off all night nonstop.  Thank you so much for a wonderful wonderful time!  I\'ll be back again and again and again!',NULL,NULL,1),(95,'Fabulous band.  Seen \'em twice, first at Fox Theater in Redwood City, then Don Quixote\'s in Felton... Unbelievable, and CANNOT sit down while they play.  EXCELLENT!',NULL,NULL,1),(96,'Thanks for playing at our wedding!  You all did an excellent job and everyone is still talking about how well the band performed.  You truly helped make our wedding unforgettable, and having Michael be a part our special day was truly magical.',NULL,NULL,1),(97,'OMG!  We were there and they were so awesome.  So many songs, done perfectly and their rhythm is electrifying.  Their dance steps, choreography and energy was beyond amazing.  I\'m sure they were having as much fun as the crowd was.',NULL,NULL,1),(98,'The show was too good for words.  You guys went beyond the call of duty in terms of entertainment.  The energy that the band put on on this night was beyond belief.  Thank you so much for all that you give.  I have seen you at least ten times, but this show was the BOMB!',NULL,NULL,1),(99,'Thanks for the amazing talent, both musical and theatrical, and energy and precision and passion for Michael Jackson\'s great music, that your all bring to your shows.',NULL,NULL,1),(100,'Amaizing!!! Music! Performance! Full of energy, what a great show. Let’s brings bands of this quality more often! Loved every note of it. Thanks so much for coming to Santa Barbara!',NULL,NULL,1),(101,'It was FANTASTIC!!! My boyfriend and I had a great time! We danced the entire night away. People we saw at the beginning of the show weren’t seen again until the end because they were on the dance floor the entire night. I am a HUGE Michael Jackson fan and Foreverland did right by him. EXCELLENT!!!',NULL,NULL,1),(102,'We see you guys as often as we can, usually in the summer at outdoor venues, but we will make it a habit to get to your indoor venues as well! What a great night and quite possibly the best band working out there! MJ forever, Foreverland forever!',NULL,NULL,1),(103,'My first time seeing the band and they were fantastic. I invited six friends and we were all so impressed. The sound and energy they put out was so great and I danced to almost every song. Happy feet all the way!',NULL,NULL,1),(104,'I’m not usually a fan of cover bands or tribute bands, but you guys had me singing and dancing, too! Definitely a show to see if you want to leave with a smile on your face!',NULL,NULL,1),(105,'First time seeing you guys, we loved it!! Hope we can make it next year!! Can hardly wait!',NULL,NULL,1),(106,'I was part of the AV team and I gotta tell you, that was an amazing show you guys put on! You guys rocked!!!',NULL,NULL,1),(107,'AMAZING AMAZING AMAZING!!!! What a fantastic performance at the Fairmont Scottsdale Princess tonight. If you ever have the opportunity to catch their show RUN and JUMP at the chance. You do not want to miss them. I will for sure be at their show if they are in a city near me again!',NULL,NULL,1),(108,'I wouldn’t miss your concert for anything. You rocked it again.',NULL,NULL,1),(109,'They don’t just play, they dance and bring down the house.',NULL,NULL,1),(110,'WOW, WOW, WOW! Foreverland embodies the music, magic, and message of Michael Jackson with their high energy, eclectic show! Everyone needs to see their show!',NULL,NULL,1),(111,'Dynamite show by a tight ensemble. Liked that it wasn’t a MJ impersonation; rather just let his music speak for itself. You let the Spirit of Joy in his songs shine thru. Thanks!',NULL,NULL,1),(112,'Unbelievable performance! Thoroughly enjoyed this talented group of singers and musicians!',NULL,NULL,1),(113,'As is always the case, a great show, full of excitement, passion, energy and tribute to an everlasting gift for humanity.',NULL,NULL,1),(114,'I went, not knowing exactly what to expect. Spent the afternoon listening to MJ with my family, getting psyched up. Foreverland BLEW ME AWAY! ',NULL,NULL,1),(115,'Great music. Great dancing and show. You guys rock!',NULL,NULL,1),(116,'Fan for life! Vocals and music are dead-on! And the energy from the band is amazing! You look like you’re having as much fun as the crowd. Keep up the great work.',NULL,NULL,1),(117,'My husband saw your show at the Grape festival here in Lodi. He told me I need to see you so when your show was in Stockton we went. It was last night. You guys are amazing.I am ready to see you again. I hope you are coming this way again.',NULL,NULL,1),(118,'Fell in love with your band when I saw you for the first time in Redwood City over the summer. Had to see you again – so went to the Avalon show. OMG – it was such fun. Great great band. I am sold. Will be going to as many local venues you are at.',NULL,NULL,1),(119,'Saw the show tonight at the Avalon in Sunnyvale, you guys are so talented! The show was incredible!!! I want more FOREVERLAND!!! When is the CD coming out? LOVE, LOVE, LOVE you guys!!!',NULL,NULL,1),(120,'Wow, a great show! You guys have made your concert so fun to be a part of. The singers, the horns, your dance moves, your precision is phenomenal! Matthew Layne….is the best! We hope you will come to Fresno again. Maybe the Big Fresno Fair 2012??? Thanks for coming to Fresno.',NULL,NULL,1),(121,'What a great show! You guys were amazing! I will be bringing many friends with me when you return in November',NULL,NULL,1),(122,'I went to see your 9 o’clock show, I am huge fan of Michael Jackson, so anything that has to do with MJ I’m there. I was very impressed and really enjoyed the show, it was awesome. Can’t wait to see you guys in November at the Empire.',NULL,NULL,1),(123,'Really fun show. Great dancing, great vocals and great musicians. High energy and totally entertaining. Everyone was dancing in the aisles. We had a fantastic time!',NULL,NULL,1),(124,'Every member of your band always puts out 200% without a blink! Thank you for always being such “super stars” in your own right. My group was amazed at the sounds of voice and instrument. Every player is an equal. Thank you, thank you again.',NULL,NULL,1),(125,'Me & the wife had a great time. The music was fantastic & the energy was real. Would love to see these guys again. Hopefully they make it close to Vacaville or somewhere in the area. These guys should make a big name for themselves in the entertainment industry.',NULL,NULL,1),(126,'Always awsome, energetic and fun! Love you guys!!!',NULL,NULL,1),(127,'What a show. A great tribute to Michael Jackson. If you ever have a chance to see these guys, do not miss it. It’s very rare to see a couple thousand people of all ages that into a concert. Thanks for coming to Lake Mission Viejo, really hope you come back.',NULL,NULL,1),(128,'Incredible Night!!! Danced for 2 hours solid! These guys are the real deal I hope you come back to Mission Viejo again next year. Best concert in years at the lake… Everyone should see these guys you will not regret it!!',NULL,NULL,1),(129,'A great night! The whole band was a blast…these guys have the formula and worked hard on stage. The horn section was fantastic too. It was super the way the guys coordinated singing and dancing the songs…tag teaming..Foreverland did not skimp on their show…if you have a chance to see them you will be delighted…',NULL,NULL,1),(130,'Wow wow wow wow wow what a great concert! These guys were so entertaining. We enjoyed it so much!!!!! My friends and I feel so blessed to be apart of such a fun and auctioned pack night.',NULL,NULL,1),(131,'The show last night was awesome! We danced & sang along & had a great time! And I loved that they performed extra songs for us! Their talent, energy, and creativity really honors our pop legend, Michael Jackson!',NULL,NULL,1),(132,'That was the best show I’ve see in a long time. Y’all killed it. I have blisters from dancing so much. Thank you.',NULL,NULL,1),(133,'OMG! I saw you guys last Friday evening in Blackhawk Danville! YOU GUYS were AWESOME!',NULL,NULL,1),(134,'I attended your show. You were everything I expected and much more. Hope to see you guys again… and again. Thanks for being a group of uncompromising talent!',NULL,NULL,1),(135,'Just got home from your show in Newman… loved, loved, loved it!!! You guys are fantastic and put on one %&*# of a show. Come back again!',NULL,NULL,1),(136,'Saw you guys at Bimbo\'s last night, you freaking killed it, stomped it, and knocked it outta the park! Can\'t wait for June when you are back there. Thanks for a great night.',NULL,NULL,1),(137,'Great show at Crab Cove! Incredible energy – you rock the house!',NULL,NULL,1),(138,'We don’t live in SF and hadn’t researched the planned festivities; we were just there to see the fireworks. Boy, are we glad we happened along as you began your set…you are fantastic!!! Couldn’t believe your energy as you masterfully delivered one song after another. I think you covered Michael’s whole career!!! Great!!!',NULL,NULL,1),(139,'Saw your show tonight in downtown Pittsburg…loved it! Great sound, great energy, excellent performance! Thanks! We’ll be back!',NULL,NULL,1),(140,'Super sick. Dancing and singing were spot on. Rocked out in the front row for the whole show. AWESOME!!!',NULL,NULL,1),(141,'I was at the Brooklyn Bowl Tribute concert for MJ . It was fabulous!!!! You guys really nailed it with the singing and all the instruments really gave it that full rich sound that Michael loved. I am so glad I went.The crowd was really into your performance. You are right up there with the best MJ performances I have seen since he passed. Great, great job!!!!!!!! Please come to NYC again ANYTIME!!!!',NULL,NULL,1),(142,'Show was amazing!! I am a die-hard MJ fan but never had the opportunity to see him perform live. I felt like this was the closest I could get to it. You guys are wonderful performers and musicians. I could not stop dancing or smiling the entire evening!',NULL,NULL,1),(143,'WOW, what a show! This was my first time seeing Foreverland, and I must say that although I was expecting a great time, I did not expect such an incredible level of talent and showmanship. I danced so hard, I ended up on stage during “The Girl is Mine”. Ha! It is obvious that you all have a great amount of love and care for the music of MJ, and performing Off the Wall and Thriller in their entireties was an enormous treat for this huge fan. Thank you SO MUCH! I will definitely be seeing you all again! xoxo',NULL,NULL,1),(144,'To say you guys were beyond expectations is understatement to Infinity! You all were, every one of you were, utterly phenomenal! The singers...WHOA! The horn section? \"I am not worthy!  I am not worthy!\" The cover of Thriller?????  OMG WORTH the price of admission AND the bottle of vodka to reserve the table! People, go to this show! Foreverland is so much fun and SUCH an amazing tribute band......you will have the time of your life!',NULL,NULL,1),(145,'Bought 12 VIP tickets with table reserved upstairs to watch you guys while we celebrated my wife\'s bday this past Sat at Red Devil Lounge. You guys were awesome and we all had a great time! Thanks for jamming and keeping the MJ spirit alive!',NULL,NULL,1),(146,'Awesome. Fantastic. Entertaining. So glad I went. Was a near 2 hour drive and well worth the evening. I hope to see you again in the east bay! Great work and you look like you are having a great time entertaining the crowd!!',NULL,NULL,1),(147,'AWESOME AWESOME AWESOME show! Would definitely see it again & definitely telling all my friends about it! I am a huge MJ fan & am so sad I never saw him in concert...this is truly the next best thing! You guys are great!',NULL,NULL,1),(148,'Great Concert! Fun, energetic, great singing & instrument playing. Hope to see you all again soon.',NULL,NULL,1),(149,'Great show once again. The performance as a whole was simply amazing.  The singing, dancing, horns and the fact that there are 14 members all together on that one stage, fantastic.  Superb entertainment... I hope they come back again, because me and my girlfriends will be there for sure... Thanx guys for the show',NULL,NULL,1),(150,'What an amazing show!!!  You guys tore it up!  Such amazing musicians and such an amazing tribute.  The music was off the hook, the dancing great, the voices were simply incredible.  I danced my ass off all night nonstop.  Thank you so much for a wonderful wonderful time!  I\'ll be back again and again and again!',NULL,NULL,1),(151,'Fabulous band.  Seen \'em twice, first at Fox Theater in Redwood City, then Don Quixote\'s in Felton... Unbelievable, and CANNOT sit down while they play.  EXCELLENT!',NULL,NULL,1),(152,'Thanks for playing at our wedding!  You all did an excellent job and everyone is still talking about how well the band performed.  You truly helped make our wedding unforgettable, and having Michael be a part our special day was truly magical.',NULL,NULL,1),(153,'OMG!  We were there and they were so awesome.  So many songs, done perfectly and their rhythm is electrifying.  Their dance steps, choreography and energy was beyond amazing.  I\'m sure they were having as much fun as the crowd was.',NULL,NULL,1),(154,'The show was too good for words.  You guys went beyond the call of duty in terms of entertainment.  The energy that the band put on on this night was beyond belief.  Thank you so much for all that you give.  I have seen you at least ten times, but this show was the BOMB!',NULL,NULL,1),(155,'Thanks for the amazing talent, both musical and theatrical, and energy and precision and passion for Michael Jackson\'s great music, that your all bring to your shows.',NULL,NULL,1),(156,'Amaizing!!! Music! Performance! Full of energy, what a great show. Let’s brings bands of this quality more often! Loved every note of it. Thanks so much for coming to Santa Barbara!',NULL,NULL,1),(157,'It was FANTASTIC!!! My boyfriend and I had a great time! We danced the entire night away. People we saw at the beginning of the show weren’t seen again until the end because they were on the dance floor the entire night. I am a HUGE Michael Jackson fan and Foreverland did right by him. EXCELLENT!!!',NULL,NULL,1),(158,'We see you guys as often as we can, usually in the summer at outdoor venues, but we will make it a habit to get to your indoor venues as well! What a great night and quite possibly the best band working out there! MJ forever, Foreverland forever!',NULL,NULL,1),(159,'My first time seeing the band and they were fantastic. I invited six friends and we were all so impressed. The sound and energy they put out was so great and I danced to almost every song. Happy feet all the way!',NULL,NULL,1),(160,'I’m not usually a fan of cover bands or tribute bands, but you guys had me singing and dancing, too! Definitely a show to see if you want to leave with a smile on your face!',NULL,NULL,1),(161,'First time seeing you guys, we loved it!! Hope we can make it next year!! Can hardly wait!',NULL,NULL,1),(162,'I was part of the AV team and I gotta tell you, that was an amazing show you guys put on! You guys rocked!!!',NULL,NULL,1),(163,'AMAZING AMAZING AMAZING!!!! What a fantastic performance at the Fairmont Scottsdale Princess tonight. If you ever have the opportunity to catch their show RUN and JUMP at the chance. You do not want to miss them. I will for sure be at their show if they are in a city near me again!',NULL,NULL,1),(164,'I wouldn’t miss your concert for anything. You rocked it again.',NULL,NULL,1),(165,'They don’t just play, they dance and bring down the house.',NULL,NULL,1),(166,'WOW, WOW, WOW! Foreverland embodies the music, magic, and message of Michael Jackson with their high energy, eclectic show! Everyone needs to see their show!',NULL,NULL,1),(167,'Dynamite show by a tight ensemble. Liked that it wasn’t a MJ impersonation; rather just let his music speak for itself. You let the Spirit of Joy in his songs shine thru. Thanks!',NULL,NULL,1),(168,'Unbelievable performance! Thoroughly enjoyed this talented group of singers and musicians!',NULL,NULL,1),(169,'As is always the case, a great show, full of excitement, passion, energy and tribute to an everlasting gift for humanity.',NULL,NULL,1),(170,'I went, not knowing exactly what to expect. Spent the afternoon listening to MJ with my family, getting psyched up. Foreverland BLEW ME AWAY! ',NULL,NULL,1),(171,'Great music. Great dancing and show. You guys rock!',NULL,NULL,1),(172,'Fan for life! Vocals and music are dead-on! And the energy from the band is amazing! You look like you’re having as much fun as the crowd. Keep up the great work.',NULL,NULL,1),(173,'My husband saw your show at the Grape festival here in Lodi. He told me I need to see you so when your show was in Stockton we went. It was last night. You guys are amazing.I am ready to see you again. I hope you are coming this way again.',NULL,NULL,1),(174,'Fell in love with your band when I saw you for the first time in Redwood City over the summer. Had to see you again – so went to the Avalon show. OMG – it was such fun. Great great band. I am sold. Will be going to as many local venues you are at.',NULL,NULL,1),(175,'Saw the show tonight at the Avalon in Sunnyvale, you guys are so talented! The show was incredible!!! I want more FOREVERLAND!!! When is the CD coming out? LOVE, LOVE, LOVE you guys!!!',NULL,NULL,1),(176,'Wow, a great show! You guys have made your concert so fun to be a part of. The singers, the horns, your dance moves, your precision is phenomenal! Matthew Layne….is the best! We hope you will come to Fresno again. Maybe the Big Fresno Fair 2012??? Thanks for coming to Fresno.',NULL,NULL,1),(177,'What a great show! You guys were amazing! I will be bringing many friends with me when you return in November',NULL,NULL,1),(178,'I went to see your 9 o’clock show, I am huge fan of Michael Jackson, so anything that has to do with MJ I’m there. I was very impressed and really enjoyed the show, it was awesome. Can’t wait to see you guys in November at the Empire.',NULL,NULL,1),(179,'Really fun show. Great dancing, great vocals and great musicians. High energy and totally entertaining. Everyone was dancing in the aisles. We had a fantastic time!',NULL,NULL,1),(180,'Every member of your band always puts out 200% without a blink! Thank you for always being such “super stars” in your own right. My group was amazed at the sounds of voice and instrument. Every player is an equal. Thank you, thank you again.',NULL,NULL,1),(181,'Me & the wife had a great time. The music was fantastic & the energy was real. Would love to see these guys again. Hopefully they make it close to Vacaville or somewhere in the area. These guys should make a big name for themselves in the entertainment industry.',NULL,NULL,1),(182,'Always awsome, energetic and fun! Love you guys!!!',NULL,NULL,1),(183,'What a show. A great tribute to Michael Jackson. If you ever have a chance to see these guys, do not miss it. It’s very rare to see a couple thousand people of all ages that into a concert. Thanks for coming to Lake Mission Viejo, really hope you come back.',NULL,NULL,1),(184,'Incredible Night!!! Danced for 2 hours solid! These guys are the real deal I hope you come back to Mission Viejo again next year. Best concert in years at the lake… Everyone should see these guys you will not regret it!!',NULL,NULL,1),(185,'A great night! The whole band was a blast…these guys have the formula and worked hard on stage. The horn section was fantastic too. It was super the way the guys coordinated singing and dancing the songs…tag teaming..Foreverland did not skimp on their show…if you have a chance to see them you will be delighted…',NULL,NULL,1),(186,'Wow wow wow wow wow what a great concert! These guys were so entertaining. We enjoyed it so much!!!!! My friends and I feel so blessed to be apart of such a fun and auctioned pack night.',NULL,NULL,1),(187,'The show last night was awesome! We danced & sang along & had a great time! And I loved that they performed extra songs for us! Their talent, energy, and creativity really honors our pop legend, Michael Jackson!',NULL,NULL,1),(188,'That was the best show I’ve see in a long time. Y’all killed it. I have blisters from dancing so much. Thank you.',NULL,NULL,1),(189,'OMG! I saw you guys last Friday evening in Blackhawk Danville! YOU GUYS were AWESOME!',NULL,NULL,1),(190,'I attended your show. You were everything I expected and much more. Hope to see you guys again… and again. Thanks for being a group of uncompromising talent!',NULL,NULL,1),(191,'Just got home from your show in Newman… loved, loved, loved it!!! You guys are fantastic and put on one %&*# of a show. Come back again!',NULL,NULL,1),(192,'Saw you guys at Bimbo\'s last night, you freaking killed it, stomped it, and knocked it outta the park! Can\'t wait for June when you are back there. Thanks for a great night.',NULL,NULL,1),(193,'Great show at Crab Cove! Incredible energy – you rock the house!',NULL,NULL,1),(194,'We don’t live in SF and hadn’t researched the planned festivities; we were just there to see the fireworks. Boy, are we glad we happened along as you began your set…you are fantastic!!! Couldn’t believe your energy as you masterfully delivered one song after another. I think you covered Michael’s whole career!!! Great!!!',NULL,NULL,1),(195,'Saw your show tonight in downtown Pittsburg…loved it! Great sound, great energy, excellent performance! Thanks! We’ll be back!',NULL,NULL,1),(196,'Super sick. Dancing and singing were spot on. Rocked out in the front row for the whole show. AWESOME!!!',NULL,NULL,1),(197,'I was at the Brooklyn Bowl Tribute concert for MJ . It was fabulous!!!! You guys really nailed it with the singing and all the instruments really gave it that full rich sound that Michael loved. I am so glad I went.The crowd was really into your performance. You are right up there with the best MJ performances I have seen since he passed. Great, great job!!!!!!!! Please come to NYC again ANYTIME!!!!',NULL,NULL,1),(198,'Show was amazing!! I am a die-hard MJ fan but never had the opportunity to see him perform live. I felt like this was the closest I could get to it. You guys are wonderful performers and musicians. I could not stop dancing or smiling the entire evening!',NULL,NULL,1),(199,'WOW, what a show! This was my first time seeing Foreverland, and I must say that although I was expecting a great time, I did not expect such an incredible level of talent and showmanship. I danced so hard, I ended up on stage during “The Girl is Mine”. Ha! It is obvious that you all have a great amount of love and care for the music of MJ, and performing Off the Wall and Thriller in their entireties was an enormous treat for this huge fan. Thank you SO MUCH! I will definitely be seeing you all again! xoxo',NULL,NULL,1),(200,'To say you guys were beyond expectations is understatement to Infinity! You all were, every one of you were, utterly phenomenal! The singers...WHOA! The horn section? \"I am not worthy!  I am not worthy!\" The cover of Thriller?????  OMG WORTH the price of admission AND the bottle of vodka to reserve the table! People, go to this show! Foreverland is so much fun and SUCH an amazing tribute band......you will have the time of your life!',NULL,NULL,1),(201,'Bought 12 VIP tickets with table reserved upstairs to watch you guys while we celebrated my wife\'s bday this past Sat at Red Devil Lounge. You guys were awesome and we all had a great time! Thanks for jamming and keeping the MJ spirit alive!',NULL,NULL,1),(202,'Awesome. Fantastic. Entertaining. So glad I went. Was a near 2 hour drive and well worth the evening. I hope to see you again in the east bay! Great work and you look like you are having a great time entertaining the crowd!!',NULL,NULL,1),(203,'AWESOME AWESOME AWESOME show! Would definitely see it again & definitely telling all my friends about it! I am a huge MJ fan & am so sad I never saw him in concert...this is truly the next best thing! You guys are great!',NULL,NULL,1),(204,'Great Concert! Fun, energetic, great singing & instrument playing. Hope to see you all again soon.',NULL,NULL,1),(205,'Great show once again. The performance as a whole was simply amazing.  The singing, dancing, horns and the fact that there are 14 members all together on that one stage, fantastic.  Superb entertainment... I hope they come back again, because me and my girlfriends will be there for sure... Thanx guys for the show',NULL,NULL,1),(206,'What an amazing show!!!  You guys tore it up!  Such amazing musicians and such an amazing tribute.  The music was off the hook, the dancing great, the voices were simply incredible.  I danced my ass off all night nonstop.  Thank you so much for a wonderful wonderful time!  I\'ll be back again and again and again!',NULL,NULL,1),(207,'Fabulous band.  Seen \'em twice, first at Fox Theater in Redwood City, then Don Quixote\'s in Felton... Unbelievable, and CANNOT sit down while they play.  EXCELLENT!',NULL,NULL,1),(208,'Thanks for playing at our wedding!  You all did an excellent job and everyone is still talking about how well the band performed.  You truly helped make our wedding unforgettable, and having Michael be a part our special day was truly magical.',NULL,NULL,1),(209,'OMG!  We were there and they were so awesome.  So many songs, done perfectly and their rhythm is electrifying.  Their dance steps, choreography and energy was beyond amazing.  I\'m sure they were having as much fun as the crowd was.',NULL,NULL,1),(210,'The show was too good for words.  You guys went beyond the call of duty in terms of entertainment.  The energy that the band put on on this night was beyond belief.  Thank you so much for all that you give.  I have seen you at least ten times, but this show was the BOMB!',NULL,NULL,1),(211,'Thanks for the amazing talent, both musical and theatrical, and energy and precision and passion for Michael Jackson\'s great music, that your all bring to your shows.',NULL,NULL,1),(212,'Amaizing!!! Music! Performance! Full of energy, what a great show. Let’s brings bands of this quality more often! Loved every note of it. Thanks so much for coming to Santa Barbara!',NULL,NULL,1),(213,'It was FANTASTIC!!! My boyfriend and I had a great time! We danced the entire night away. People we saw at the beginning of the show weren’t seen again until the end because they were on the dance floor the entire night. I am a HUGE Michael Jackson fan and Foreverland did right by him. EXCELLENT!!!',NULL,NULL,1),(214,'We see you guys as often as we can, usually in the summer at outdoor venues, but we will make it a habit to get to your indoor venues as well! What a great night and quite possibly the best band working out there! MJ forever, Foreverland forever!',NULL,NULL,1),(215,'My first time seeing the band and they were fantastic. I invited six friends and we were all so impressed. The sound and energy they put out was so great and I danced to almost every song. Happy feet all the way!',NULL,NULL,1),(216,'I’m not usually a fan of cover bands or tribute bands, but you guys had me singing and dancing, too! Definitely a show to see if you want to leave with a smile on your face!',NULL,NULL,1),(217,'First time seeing you guys, we loved it!! Hope we can make it next year!! Can hardly wait!',NULL,NULL,1),(218,'I was part of the AV team and I gotta tell you, that was an amazing show you guys put on! You guys rocked!!!',NULL,NULL,1),(219,'AMAZING AMAZING AMAZING!!!! What a fantastic performance at the Fairmont Scottsdale Princess tonight. If you ever have the opportunity to catch their show RUN and JUMP at the chance. You do not want to miss them. I will for sure be at their show if they are in a city near me again!',NULL,NULL,1),(220,'I wouldn’t miss your concert for anything. You rocked it again.',NULL,NULL,1),(221,'They don’t just play, they dance and bring down the house.',NULL,NULL,1),(222,'WOW, WOW, WOW! Foreverland embodies the music, magic, and message of Michael Jackson with their high energy, eclectic show! Everyone needs to see their show!',NULL,NULL,1),(223,'Dynamite show by a tight ensemble. Liked that it wasn’t a MJ impersonation; rather just let his music speak for itself. You let the Spirit of Joy in his songs shine thru. Thanks!',NULL,NULL,1),(224,'Unbelievable performance! Thoroughly enjoyed this talented group of singers and musicians!',NULL,NULL,1),(225,'As is always the case, a great show, full of excitement, passion, energy and tribute to an everlasting gift for humanity.',NULL,NULL,1),(226,'I went, not knowing exactly what to expect. Spent the afternoon listening to MJ with my family, getting psyched up. Foreverland BLEW ME AWAY! ',NULL,NULL,1),(227,'Great music. Great dancing and show. You guys rock!',NULL,NULL,1),(228,'Fan for life! Vocals and music are dead-on! And the energy from the band is amazing! You look like you’re having as much fun as the crowd. Keep up the great work.',NULL,NULL,1),(229,'My husband saw your show at the Grape festival here in Lodi. He told me I need to see you so when your show was in Stockton we went. It was last night. You guys are amazing.I am ready to see you again. I hope you are coming this way again.',NULL,NULL,1),(230,'Fell in love with your band when I saw you for the first time in Redwood City over the summer. Had to see you again – so went to the Avalon show. OMG – it was such fun. Great great band. I am sold. Will be going to as many local venues you are at.',NULL,NULL,1),(231,'Saw the show tonight at the Avalon in Sunnyvale, you guys are so talented! The show was incredible!!! I want more FOREVERLAND!!! When is the CD coming out? LOVE, LOVE, LOVE you guys!!!',NULL,NULL,1),(232,'Wow, a great show! You guys have made your concert so fun to be a part of. The singers, the horns, your dance moves, your precision is phenomenal! Matthew Layne….is the best! We hope you will come to Fresno again. Maybe the Big Fresno Fair 2012??? Thanks for coming to Fresno.',NULL,NULL,1),(233,'What a great show! You guys were amazing! I will be bringing many friends with me when you return in November',NULL,NULL,1),(234,'I went to see your 9 o’clock show, I am huge fan of Michael Jackson, so anything that has to do with MJ I’m there. I was very impressed and really enjoyed the show, it was awesome. Can’t wait to see you guys in November at the Empire.',NULL,NULL,1),(235,'Really fun show. Great dancing, great vocals and great musicians. High energy and totally entertaining. Everyone was dancing in the aisles. We had a fantastic time!',NULL,NULL,1),(236,'Every member of your band always puts out 200% without a blink! Thank you for always being such “super stars” in your own right. My group was amazed at the sounds of voice and instrument. Every player is an equal. Thank you, thank you again.',NULL,NULL,1),(237,'Me & the wife had a great time. The music was fantastic & the energy was real. Would love to see these guys again. Hopefully they make it close to Vacaville or somewhere in the area. These guys should make a big name for themselves in the entertainment industry.',NULL,NULL,1),(238,'Always awsome, energetic and fun! Love you guys!!!',NULL,NULL,1),(239,'What a show. A great tribute to Michael Jackson. If you ever have a chance to see these guys, do not miss it. It’s very rare to see a couple thousand people of all ages that into a concert. Thanks for coming to Lake Mission Viejo, really hope you come back.',NULL,NULL,1),(240,'Incredible Night!!! Danced for 2 hours solid! These guys are the real deal I hope you come back to Mission Viejo again next year. Best concert in years at the lake… Everyone should see these guys you will not regret it!!',NULL,NULL,1),(241,'A great night! The whole band was a blast…these guys have the formula and worked hard on stage. The horn section was fantastic too. It was super the way the guys coordinated singing and dancing the songs…tag teaming..Foreverland did not skimp on their show…if you have a chance to see them you will be delighted…',NULL,NULL,1),(242,'Wow wow wow wow wow what a great concert! These guys were so entertaining. We enjoyed it so much!!!!! My friends and I feel so blessed to be apart of such a fun and auctioned pack night.',NULL,NULL,1),(243,'The show last night was awesome! We danced & sang along & had a great time! And I loved that they performed extra songs for us! Their talent, energy, and creativity really honors our pop legend, Michael Jackson!',NULL,NULL,1),(244,'That was the best show I’ve see in a long time. Y’all killed it. I have blisters from dancing so much. Thank you.',NULL,NULL,1),(245,'OMG! I saw you guys last Friday evening in Blackhawk Danville! YOU GUYS were AWESOME!',NULL,NULL,1),(246,'I attended your show. You were everything I expected and much more. Hope to see you guys again… and again. Thanks for being a group of uncompromising talent!',NULL,NULL,1),(247,'Just got home from your show in Newman… loved, loved, loved it!!! You guys are fantastic and put on one %&*# of a show. Come back again!',NULL,NULL,1),(248,'Saw you guys at Bimbo\'s last night, you freaking killed it, stomped it, and knocked it outta the park! Can\'t wait for June when you are back there. Thanks for a great night.',NULL,NULL,1),(249,'Great show at Crab Cove! Incredible energy – you rock the house!',NULL,NULL,1),(250,'We don’t live in SF and hadn’t researched the planned festivities; we were just there to see the fireworks. Boy, are we glad we happened along as you began your set…you are fantastic!!! Couldn’t believe your energy as you masterfully delivered one song after another. I think you covered Michael’s whole career!!! Great!!!',NULL,NULL,1),(251,'Saw your show tonight in downtown Pittsburg…loved it! Great sound, great energy, excellent performance! Thanks! We’ll be back!',NULL,NULL,1),(252,'Super sick. Dancing and singing were spot on. Rocked out in the front row for the whole show. AWESOME!!!',NULL,NULL,1),(253,'I was at the Brooklyn Bowl Tribute concert for MJ . It was fabulous!!!! You guys really nailed it with the singing and all the instruments really gave it that full rich sound that Michael loved. I am so glad I went.The crowd was really into your performance. You are right up there with the best MJ performances I have seen since he passed. Great, great job!!!!!!!! Please come to NYC again ANYTIME!!!!',NULL,NULL,1),(254,'Show was amazing!! I am a die-hard MJ fan but never had the opportunity to see him perform live. I felt like this was the closest I could get to it. You guys are wonderful performers and musicians. I could not stop dancing or smiling the entire evening!',NULL,NULL,1),(255,'WOW, what a show! This was my first time seeing Foreverland, and I must say that although I was expecting a great time, I did not expect such an incredible level of talent and showmanship. I danced so hard, I ended up on stage during “The Girl is Mine”. Ha! It is obvious that you all have a great amount of love and care for the music of MJ, and performing Off the Wall and Thriller in their entireties was an enormous treat for this huge fan. Thank you SO MUCH! I will definitely be seeing you all again! xoxo',NULL,NULL,1),(256,'To say you guys were beyond expectations is understatement to Infinity! You all were, every one of you were, utterly phenomenal! The singers...WHOA! The horn section? \"I am not worthy!  I am not worthy!\" The cover of Thriller?????  OMG WORTH the price of admission AND the bottle of vodka to reserve the table! People, go to this show! Foreverland is so much fun and SUCH an amazing tribute band......you will have the time of your life!',NULL,NULL,1),(257,'Bought 12 VIP tickets with table reserved upstairs to watch you guys while we celebrated my wife\'s bday this past Sat at Red Devil Lounge. You guys were awesome and we all had a great time! Thanks for jamming and keeping the MJ spirit alive!',NULL,NULL,1),(258,'Awesome. Fantastic. Entertaining. So glad I went. Was a near 2 hour drive and well worth the evening. I hope to see you again in the east bay! Great work and you look like you are having a great time entertaining the crowd!!',NULL,NULL,1),(259,'AWESOME AWESOME AWESOME show! Would definitely see it again & definitely telling all my friends about it! I am a huge MJ fan & am so sad I never saw him in concert...this is truly the next best thing! You guys are great!',NULL,NULL,1),(260,'Great Concert! Fun, energetic, great singing & instrument playing. Hope to see you all again soon.',NULL,NULL,1),(261,'Great show once again. The performance as a whole was simply amazing.  The singing, dancing, horns and the fact that there are 14 members all together on that one stage, fantastic.  Superb entertainment... I hope they come back again, because me and my girlfriends will be there for sure... Thanx guys for the show',NULL,NULL,1),(262,'What an amazing show!!!  You guys tore it up!  Such amazing musicians and such an amazing tribute.  The music was off the hook, the dancing great, the voices were simply incredible.  I danced my ass off all night nonstop.  Thank you so much for a wonderful wonderful time!  I\'ll be back again and again and again!',NULL,NULL,1),(263,'Fabulous band.  Seen \'em twice, first at Fox Theater in Redwood City, then Don Quixote\'s in Felton... Unbelievable, and CANNOT sit down while they play.  EXCELLENT!',NULL,NULL,1),(264,'Thanks for playing at our wedding!  You all did an excellent job and everyone is still talking about how well the band performed.  You truly helped make our wedding unforgettable, and having Michael be a part our special day was truly magical.',NULL,NULL,1),(265,'OMG!  We were there and they were so awesome.  So many songs, done perfectly and their rhythm is electrifying.  Their dance steps, choreography and energy was beyond amazing.  I\'m sure they were having as much fun as the crowd was.',NULL,NULL,1),(266,'The show was too good for words.  You guys went beyond the call of duty in terms of entertainment.  The energy that the band put on on this night was beyond belief.  Thank you so much for all that you give.  I have seen you at least ten times, but this show was the BOMB!',NULL,NULL,1),(267,'Thanks for the amazing talent, both musical and theatrical, and energy and precision and passion for Michael Jackson\'s great music, that your all bring to your shows.',NULL,NULL,1),(268,'Amaizing!!! Music! Performance! Full of energy, what a great show. Let’s brings bands of this quality more often! Loved every note of it. Thanks so much for coming to Santa Barbara!',NULL,NULL,1),(269,'It was FANTASTIC!!! My boyfriend and I had a great time! We danced the entire night away. People we saw at the beginning of the show weren’t seen again until the end because they were on the dance floor the entire night. I am a HUGE Michael Jackson fan and Foreverland did right by him. EXCELLENT!!!',NULL,NULL,1),(270,'We see you guys as often as we can, usually in the summer at outdoor venues, but we will make it a habit to get to your indoor venues as well! What a great night and quite possibly the best band working out there! MJ forever, Foreverland forever!',NULL,NULL,1),(271,'My first time seeing the band and they were fantastic. I invited six friends and we were all so impressed. The sound and energy they put out was so great and I danced to almost every song. Happy feet all the way!',NULL,NULL,1),(272,'I’m not usually a fan of cover bands or tribute bands, but you guys had me singing and dancing, too! Definitely a show to see if you want to leave with a smile on your face!',NULL,NULL,1),(273,'First time seeing you guys, we loved it!! Hope we can make it next year!! Can hardly wait!',NULL,NULL,1),(274,'I was part of the AV team and I gotta tell you, that was an amazing show you guys put on! You guys rocked!!!',NULL,NULL,1),(275,'AMAZING AMAZING AMAZING!!!! What a fantastic performance at the Fairmont Scottsdale Princess tonight. If you ever have the opportunity to catch their show RUN and JUMP at the chance. You do not want to miss them. I will for sure be at their show if they are in a city near me again!',NULL,NULL,1),(276,'I wouldn’t miss your concert for anything. You rocked it again.',NULL,NULL,1),(277,'They don’t just play, they dance and bring down the house.',NULL,NULL,1),(278,'WOW, WOW, WOW! Foreverland embodies the music, magic, and message of Michael Jackson with their high energy, eclectic show! Everyone needs to see their show!',NULL,NULL,1),(279,'Dynamite show by a tight ensemble. Liked that it wasn’t a MJ impersonation; rather just let his music speak for itself. You let the Spirit of Joy in his songs shine thru. Thanks!',NULL,NULL,1),(280,'Unbelievable performance! Thoroughly enjoyed this talented group of singers and musicians!',NULL,NULL,1),(281,'As is always the case, a great show, full of excitement, passion, energy and tribute to an everlasting gift for humanity.',NULL,NULL,1),(282,'I went, not knowing exactly what to expect. Spent the afternoon listening to MJ with my family, getting psyched up. Foreverland BLEW ME AWAY! ',NULL,NULL,1),(283,'Great music. Great dancing and show. You guys rock!',NULL,NULL,1),(284,'Fan for life! Vocals and music are dead-on! And the energy from the band is amazing! You look like you’re having as much fun as the crowd. Keep up the great work.',NULL,NULL,1),(285,'My husband saw your show at the Grape festival here in Lodi. He told me I need to see you so when your show was in Stockton we went. It was last night. You guys are amazing.I am ready to see you again. I hope you are coming this way again.',NULL,NULL,1),(286,'Fell in love with your band when I saw you for the first time in Redwood City over the summer. Had to see you again – so went to the Avalon show. OMG – it was such fun. Great great band. I am sold. Will be going to as many local venues you are at.',NULL,NULL,1),(287,'Saw the show tonight at the Avalon in Sunnyvale, you guys are so talented! The show was incredible!!! I want more FOREVERLAND!!! When is the CD coming out? LOVE, LOVE, LOVE you guys!!!',NULL,NULL,1),(288,'Wow, a great show! You guys have made your concert so fun to be a part of. The singers, the horns, your dance moves, your precision is phenomenal! Matthew Layne….is the best! We hope you will come to Fresno again. Maybe the Big Fresno Fair 2012??? Thanks for coming to Fresno.',NULL,NULL,1),(289,'What a great show! You guys were amazing! I will be bringing many friends with me when you return in November',NULL,NULL,1),(290,'I went to see your 9 o’clock show, I am huge fan of Michael Jackson, so anything that has to do with MJ I’m there. I was very impressed and really enjoyed the show, it was awesome. Can’t wait to see you guys in November at the Empire.',NULL,NULL,1),(291,'Really fun show. Great dancing, great vocals and great musicians. High energy and totally entertaining. Everyone was dancing in the aisles. We had a fantastic time!',NULL,NULL,1),(292,'Every member of your band always puts out 200% without a blink! Thank you for always being such “super stars” in your own right. My group was amazed at the sounds of voice and instrument. Every player is an equal. Thank you, thank you again.',NULL,NULL,1),(293,'Me & the wife had a great time. The music was fantastic & the energy was real. Would love to see these guys again. Hopefully they make it close to Vacaville or somewhere in the area. These guys should make a big name for themselves in the entertainment industry.',NULL,NULL,1),(294,'Always awsome, energetic and fun! Love you guys!!!',NULL,NULL,1),(295,'What a show. A great tribute to Michael Jackson. If you ever have a chance to see these guys, do not miss it. It’s very rare to see a couple thousand people of all ages that into a concert. Thanks for coming to Lake Mission Viejo, really hope you come back.',NULL,NULL,1),(296,'Incredible Night!!! Danced for 2 hours solid! These guys are the real deal I hope you come back to Mission Viejo again next year. Best concert in years at the lake… Everyone should see these guys you will not regret it!!',NULL,NULL,1),(297,'A great night! The whole band was a blast…these guys have the formula and worked hard on stage. The horn section was fantastic too. It was super the way the guys coordinated singing and dancing the songs…tag teaming..Foreverland did not skimp on their show…if you have a chance to see them you will be delighted…',NULL,NULL,1),(298,'Wow wow wow wow wow what a great concert! These guys were so entertaining. We enjoyed it so much!!!!! My friends and I feel so blessed to be apart of such a fun and auctioned pack night.',NULL,NULL,1),(299,'The show last night was awesome! We danced & sang along & had a great time! And I loved that they performed extra songs for us! Their talent, energy, and creativity really honors our pop legend, Michael Jackson!',NULL,NULL,1),(300,'That was the best show I’ve see in a long time. Y’all killed it. I have blisters from dancing so much. Thank you.',NULL,NULL,1),(301,'OMG! I saw you guys last Friday evening in Blackhawk Danville! YOU GUYS were AWESOME!',NULL,NULL,1),(302,'I attended your show. You were everything I expected and much more. Hope to see you guys again… and again. Thanks for being a group of uncompromising talent!',NULL,NULL,1),(303,'Just got home from your show in Newman… loved, loved, loved it!!! You guys are fantastic and put on one %&*# of a show. Come back again!',NULL,NULL,1),(304,'Saw you guys at Bimbo\'s last night, you freaking killed it, stomped it, and knocked it outta the park! Can\'t wait for June when you are back there. Thanks for a great night.',NULL,NULL,1),(305,'Great show at Crab Cove! Incredible energy – you rock the house!',NULL,NULL,1),(306,'We don’t live in SF and hadn’t researched the planned festivities; we were just there to see the fireworks. Boy, are we glad we happened along as you began your set…you are fantastic!!! Couldn’t believe your energy as you masterfully delivered one song after another. I think you covered Michael’s whole career!!! Great!!!',NULL,NULL,1),(307,'Saw your show tonight in downtown Pittsburg…loved it! Great sound, great energy, excellent performance! Thanks! We’ll be back!',NULL,NULL,1),(308,'Super sick. Dancing and singing were spot on. Rocked out in the front row for the whole show. AWESOME!!!',NULL,NULL,1),(309,'I was at the Brooklyn Bowl Tribute concert for MJ . It was fabulous!!!! You guys really nailed it with the singing and all the instruments really gave it that full rich sound that Michael loved. I am so glad I went.The crowd was really into your performance. You are right up there with the best MJ performances I have seen since he passed. Great, great job!!!!!!!! Please come to NYC again ANYTIME!!!!',NULL,NULL,1),(310,'Show was amazing!! I am a die-hard MJ fan but never had the opportunity to see him perform live. I felt like this was the closest I could get to it. You guys are wonderful performers and musicians. I could not stop dancing or smiling the entire evening!',NULL,NULL,1),(311,'WOW, what a show! This was my first time seeing Foreverland, and I must say that although I was expecting a great time, I did not expect such an incredible level of talent and showmanship. I danced so hard, I ended up on stage during “The Girl is Mine”. Ha! It is obvious that you all have a great amount of love and care for the music of MJ, and performing Off the Wall and Thriller in their entireties was an enormous treat for this huge fan. Thank you SO MUCH! I will definitely be seeing you all again! xoxo',NULL,NULL,1),(312,'To say you guys were beyond expectations is understatement to Infinity! You all were, every one of you were, utterly phenomenal! The singers...WHOA! The horn section? \"I am not worthy!  I am not worthy!\" The cover of Thriller?????  OMG WORTH the price of admission AND the bottle of vodka to reserve the table! People, go to this show! Foreverland is so much fun and SUCH an amazing tribute band......you will have the time of your life!',NULL,NULL,1),(313,'Bought 12 VIP tickets with table reserved upstairs to watch you guys while we celebrated my wife\'s bday this past Sat at Red Devil Lounge. You guys were awesome and we all had a great time! Thanks for jamming and keeping the MJ spirit alive!',NULL,NULL,1),(314,'Awesome. Fantastic. Entertaining. So glad I went. Was a near 2 hour drive and well worth the evening. I hope to see you again in the east bay! Great work and you look like you are having a great time entertaining the crowd!!',NULL,NULL,1),(315,'AWESOME AWESOME AWESOME show! Would definitely see it again & definitely telling all my friends about it! I am a huge MJ fan & am so sad I never saw him in concert...this is truly the next best thing! You guys are great!',NULL,NULL,1),(316,'Great Concert! Fun, energetic, great singing & instrument playing. Hope to see you all again soon.',NULL,NULL,1),(317,'Great show once again. The performance as a whole was simply amazing.  The singing, dancing, horns and the fact that there are 14 members all together on that one stage, fantastic.  Superb entertainment... I hope they come back again, because me and my girlfriends will be there for sure... Thanx guys for the show',NULL,NULL,1),(318,'What an amazing show!!!  You guys tore it up!  Such amazing musicians and such an amazing tribute.  The music was off the hook, the dancing great, the voices were simply incredible.  I danced my ass off all night nonstop.  Thank you so much for a wonderful wonderful time!  I\'ll be back again and again and again!',NULL,NULL,1),(319,'Fabulous band.  Seen \'em twice, first at Fox Theater in Redwood City, then Don Quixote\'s in Felton... Unbelievable, and CANNOT sit down while they play.  EXCELLENT!',NULL,NULL,1),(320,'Thanks for playing at our wedding!  You all did an excellent job and everyone is still talking about how well the band performed.  You truly helped make our wedding unforgettable, and having Michael be a part our special day was truly magical.',NULL,NULL,1),(321,'OMG!  We were there and they were so awesome.  So many songs, done perfectly and their rhythm is electrifying.  Their dance steps, choreography and energy was beyond amazing.  I\'m sure they were having as much fun as the crowd was.',NULL,NULL,1),(322,'The show was too good for words.  You guys went beyond the call of duty in terms of entertainment.  The energy that the band put on on this night was beyond belief.  Thank you so much for all that you give.  I have seen you at least ten times, but this show was the BOMB!',NULL,NULL,1),(323,'Thanks for the amazing talent, both musical and theatrical, and energy and precision and passion for Michael Jackson\'s great music, that your all bring to your shows.',NULL,NULL,1),(324,'Amaizing!!! Music! Performance! Full of energy, what a great show. Let’s brings bands of this quality more often! Loved every note of it. Thanks so much for coming to Santa Barbara!',NULL,NULL,1),(325,'It was FANTASTIC!!! My boyfriend and I had a great time! We danced the entire night away. People we saw at the beginning of the show weren’t seen again until the end because they were on the dance floor the entire night. I am a HUGE Michael Jackson fan and Foreverland did right by him. EXCELLENT!!!',NULL,NULL,1),(326,'We see you guys as often as we can, usually in the summer at outdoor venues, but we will make it a habit to get to your indoor venues as well! What a great night and quite possibly the best band working out there! MJ forever, Foreverland forever!',NULL,NULL,1),(327,'My first time seeing the band and they were fantastic. I invited six friends and we were all so impressed. The sound and energy they put out was so great and I danced to almost every song. Happy feet all the way!',NULL,NULL,1),(328,'I’m not usually a fan of cover bands or tribute bands, but you guys had me singing and dancing, too! Definitely a show to see if you want to leave with a smile on your face!',NULL,NULL,1),(329,'First time seeing you guys, we loved it!! Hope we can make it next year!! Can hardly wait!',NULL,NULL,1),(330,'I was part of the AV team and I gotta tell you, that was an amazing show you guys put on! You guys rocked!!!',NULL,NULL,1),(331,'AMAZING AMAZING AMAZING!!!! What a fantastic performance at the Fairmont Scottsdale Princess tonight. If you ever have the opportunity to catch their show RUN and JUMP at the chance. You do not want to miss them. I will for sure be at their show if they are in a city near me again!',NULL,NULL,1),(332,'I wouldn’t miss your concert for anything. You rocked it again.',NULL,NULL,1),(333,'They don’t just play, they dance and bring down the house.',NULL,NULL,1),(334,'WOW, WOW, WOW! Foreverland embodies the music, magic, and message of Michael Jackson with their high energy, eclectic show! Everyone needs to see their show!',NULL,NULL,1),(335,'Dynamite show by a tight ensemble. Liked that it wasn’t a MJ impersonation; rather just let his music speak for itself. You let the Spirit of Joy in his songs shine thru. Thanks!',NULL,NULL,1),(336,'Unbelievable performance! Thoroughly enjoyed this talented group of singers and musicians!',NULL,NULL,1),(337,'As is always the case, a great show, full of excitement, passion, energy and tribute to an everlasting gift for humanity.',NULL,NULL,1);
/*!40000 ALTER TABLE `marketing_testimonial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_album`
--

DROP TABLE IF EXISTS `media_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_album`
--

LOCK TABLES `media_album` WRITE;
/*!40000 ALTER TABLE `media_album` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_album_show`
--

DROP TABLE IF EXISTS `media_album_show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_album_show` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) NOT NULL,
  `show_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `album_id` (`album_id`,`show_id`),
  KEY `show_id_refs_id_bf9a24a1` (`show_id`),
  CONSTRAINT `album_id_refs_id_ae743636` FOREIGN KEY (`album_id`) REFERENCES `media_album` (`id`),
  CONSTRAINT `show_id_refs_id_bf9a24a1` FOREIGN KEY (`show_id`) REFERENCES `shows_show` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_album_show`
--

LOCK TABLES `media_album_show` WRITE;
/*!40000 ALTER TABLE `media_album_show` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_album_show` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_image`
--

DROP TABLE IF EXISTS `media_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `thumbnail` varchar(100) DEFAULT NULL,
  `created` datetime NOT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `thumbnail2` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_image`
--

LOCK TABLES `media_image` WRITE;
/*!40000 ALTER TABLE `media_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_image_albums`
--

DROP TABLE IF EXISTS `media_image_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_image_albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_id` (`image_id`,`album_id`),
  KEY `album_id_refs_id_99c1f77c` (`album_id`),
  CONSTRAINT `album_id_refs_id_99c1f77c` FOREIGN KEY (`album_id`) REFERENCES `media_album` (`id`),
  CONSTRAINT `image_id_refs_id_a36a09ad` FOREIGN KEY (`image_id`) REFERENCES `media_image` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_image_albums`
--

LOCK TABLES `media_image_albums` WRITE;
/*!40000 ALTER TABLE `media_image_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_image_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_image_show`
--

DROP TABLE IF EXISTS `media_image_show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_image_show` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) NOT NULL,
  `show_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_id` (`image_id`,`show_id`),
  KEY `show_id_refs_id_087c54c3` (`show_id`),
  CONSTRAINT `image_id_refs_id_7d084121` FOREIGN KEY (`image_id`) REFERENCES `media_image` (`id`),
  CONSTRAINT `show_id_refs_id_087c54c3` FOREIGN KEY (`show_id`) REFERENCES `shows_show` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_image_show`
--

LOCK TABLES `media_image_show` WRITE;
/*!40000 ALTER TABLE `media_image_show` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_image_show` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_image_tags`
--

DROP TABLE IF EXISTS `media_image_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_image_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_id` (`image_id`,`tag_id`),
  KEY `tag_id_refs_id_5d46a2c6` (`tag_id`),
  CONSTRAINT `image_id_refs_id_38c57086` FOREIGN KEY (`image_id`) REFERENCES `media_image` (`id`),
  CONSTRAINT `tag_id_refs_id_5d46a2c6` FOREIGN KEY (`tag_id`) REFERENCES `media_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_image_tags`
--

LOCK TABLES `media_image_tags` WRITE;
/*!40000 ALTER TABLE `media_image_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_image_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_tag`
--

DROP TABLE IF EXISTS `media_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_tag`
--

LOCK TABLES `media_tag` WRITE;
/*!40000 ALTER TABLE `media_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_video`
--

DROP TABLE IF EXISTS `media_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) DEFAULT NULL,
  `url` varchar(200) NOT NULL,
  `embed_type` varchar(10) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_video`
--

LOCK TABLES `media_video` WRITE;
/*!40000 ALTER TABLE `media_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_video_albums`
--

DROP TABLE IF EXISTS `media_video_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_video_albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `video_id` (`video_id`,`album_id`),
  KEY `album_id_refs_id_9ff15f99` (`album_id`),
  CONSTRAINT `album_id_refs_id_9ff15f99` FOREIGN KEY (`album_id`) REFERENCES `media_album` (`id`),
  CONSTRAINT `video_id_refs_id_04ae9b8e` FOREIGN KEY (`video_id`) REFERENCES `media_video` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_video_albums`
--

LOCK TABLES `media_video_albums` WRITE;
/*!40000 ALTER TABLE `media_video_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_video_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_video_show`
--

DROP TABLE IF EXISTS `media_video_show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_video_show` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `show_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `video_id` (`video_id`,`show_id`),
  KEY `show_id_refs_id_021ec1be` (`show_id`),
  CONSTRAINT `show_id_refs_id_021ec1be` FOREIGN KEY (`show_id`) REFERENCES `shows_show` (`id`),
  CONSTRAINT `video_id_refs_id_2a8dceb2` FOREIGN KEY (`video_id`) REFERENCES `media_video` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_video_show`
--

LOCK TABLES `media_video_show` WRITE;
/*!40000 ALTER TABLE `media_video_show` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_video_show` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_video_tags`
--

DROP TABLE IF EXISTS `media_video_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_video_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `video_id` (`video_id`,`tag_id`),
  KEY `tag_id_refs_id_d0cd5802` (`tag_id`),
  CONSTRAINT `tag_id_refs_id_d0cd5802` FOREIGN KEY (`tag_id`) REFERENCES `media_tag` (`id`),
  CONSTRAINT `video_id_refs_id_ddf3cd14` FOREIGN KEY (`video_id`) REFERENCES `media_video` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_video_tags`
--

LOCK TABLES `media_video_tags` WRITE;
/*!40000 ALTER TABLE `media_video_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_video_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members_member`
--

DROP TABLE IF EXISTS `members_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `display_first` varchar(50) DEFAULT NULL,
  `display_last` varchar(50) DEFAULT NULL,
  `instrument` varchar(100) DEFAULT NULL,
  `section` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `bio` longtext,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members_member`
--

LOCK TABLES `members_member` WRITE;
/*!40000 ALTER TABLE `members_member` DISABLE KEYS */;
INSERT INTO `members_member` VALUES (1,'Adam','Lord','Tuckerman','Adam','Lord','Bass','r','1980-09-07','2009-03-24','',1),(2,'Alex','deCarville','Mervin','Alex','deCarville','Drums','r',NULL,'2012-03-18','',1),(3,'Nils','Erickson','','Nils','Erickson','Guitar','r',NULL,'2012-03-18','',1),(4,'Luke','Kirley','','Luke','Kirley','Trombone','h',NULL,'2012-03-18','',1),(5,'Lou','Esposito II','','Lou','Esposito II','Percussion','r',NULL,'2012-03-18','',0),(6,'Ari','Margolis','','Ari','Margolis','Keyboards','r',NULL,NULL,'',1),(7,'Max','Delaney','','Max','Delaney','Guitar','r',NULL,'2012-03-18','',1),(8,'Max','Sternberg','','Max','Sternberg','Trumpet','h',NULL,NULL,'',1),(9,'Manuel','Angel','','Manny','Angel','Trumpet','h',NULL,'2012-03-18','',1),(10,'Dave','Arms','','Dave','Arms','Trombone','h',NULL,'2012-03-18','',1),(11,'Matthew','Christiansen','Layne','Matthew','Layne','Vocals','v',NULL,'2012-03-18','',1),(12,'Mark','Edwards','Alan','Mark','Edwards','Vocals','v',NULL,'2012-03-18','',1),(13,'Carlos','Soto','Xavier','Carlos','Xavier','Vocals','v',NULL,NULL,'',1),(14,'Lisa','Andersen','Leuschner','Lisa','Leuschner','Vocals','v',NULL,NULL,'',1);
/*!40000 ALTER TABLE `members_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_registrationprofile`
--

DROP TABLE IF EXISTS `registration_registrationprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_registrationprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `activation_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_id_refs_id_954d2985` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_registrationprofile`
--

LOCK TABLES `registration_registrationprofile` WRITE;
/*!40000 ALTER TABLE `registration_registrationprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_registrationprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shows_show`
--

DROP TABLE IF EXISTS `shows_show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shows_show` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `public` tinyint(1) NOT NULL,
  `venue_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `doors_time` time DEFAULT NULL,
  `ticket_price` varchar(100) DEFAULT NULL,
  `ticket_url` varchar(200) DEFAULT NULL,
  `ages` varchar(100) DEFAULT NULL,
  `opener` varchar(200) DEFAULT NULL,
  `notes` longtext,
  `gross` decimal(10,2) DEFAULT NULL,
  `commission` decimal(10,2) DEFAULT NULL,
  `sound_cost` decimal(10,2) DEFAULT NULL,
  `in_ears_cost` decimal(10,2) DEFAULT NULL,
  `print_ship_cost` decimal(10,2) DEFAULT NULL,
  `ads_cost` decimal(10,2) DEFAULT NULL,
  `other_cost` decimal(10,2) DEFAULT NULL,
  `net` decimal(10,2) DEFAULT NULL,
  `payout` decimal(10,2) DEFAULT NULL,
  `to_account` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `venue_id_refs_id_f26453c7` (`venue_id`),
  CONSTRAINT `venue_id_refs_id_f26453c7` FOREIGN KEY (`venue_id`) REFERENCES `shows_venue` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1033 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows_show`
--

LOCK TABLES `shows_show` WRITE;
/*!40000 ALTER TABLE `shows_show` DISABLE KEYS */;
INSERT INTO `shows_show` VALUES (823,1,1,'2009-06-20 00:00:01',NULL,'','','',NULL,'Opening for Superbooty',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(824,1,2,'2009-07-11 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(825,1,3,'2009-08-29 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(826,1,2,'2009-09-11 00:00:01',NULL,'','','',NULL,'Sex w/ No Hands opening',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(827,1,4,'2009-10-09 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(828,1,5,'2009-10-30 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(829,1,6,'2009-11-14 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(830,0,7,'2009-12-18 00:00:01',NULL,'','','',NULL,'Private Event for Salesforce.com, Inc., opening for Kool & The Gang',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(831,1,8,'2010-01-01 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(832,1,5,'2010-01-02 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(833,1,9,'2010-02-12 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(834,1,10,'2010-02-26 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(835,1,10,'2010-03-20 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(836,1,5,'2010-03-26 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(837,1,6,'2010-04-03 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(838,1,11,'2010-04-23 00:00:01',NULL,'','','',NULL,'Opening for The Cheeseballs',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(839,1,8,'2010-04-24 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(840,1,12,'2010-04-30 19:00:00',NULL,'','','',NULL,'SF Giants vs. Colorado Rockies (Game starts at 7pm)\r\nForeverland will be acapella singing and leading the crowd in “Take Me Out To The Ballgame” during 7th Inning Stretch!\r\nDon’t miss this chance to see Foreverland’s mugs on the jumbotron!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(841,1,9,'2010-05-08 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(842,0,13,'2010-05-13 00:00:01',NULL,'','','',NULL,'Private Event for Google, Inc. at the Monterey Bay Aquarium',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(843,1,14,'2010-05-22 00:00:01',NULL,'','','',NULL,'War Memorial Opera House Café\r\nThe SF Symphony’s 2010 Black & White Ball is a benefit for Adventures in Music, which offers free music education to every first through fifth grader in San Francisco public schools.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(844,1,5,'2010-05-29 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(845,1,15,'2010-05-30 00:00:01',NULL,'','','',NULL,'Foreverland plays in between the races!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(846,0,7,'2010-06-03 00:00:01',NULL,'','','',NULL,'Private Event for Meeting Professionals International',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(847,1,16,'2010-06-11 17:30:00',NULL,'FREE','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(848,1,17,'2010-06-23 18:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(849,1,18,'2010-06-25 00:00:01',NULL,'','www.theregencyballroom.com','',NULL,'Remembering Michael Jackson on the 1-year anniversary of his passing<br />More info at <a href=\"http://www.vintage415.com/flyers/moonwalker/\">http://www.vintage415.com/flyers/moonwalker/</a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(850,1,19,'2010-06-27 17:00:00',NULL,'','','',NULL,'Main Stage in front of SF City Hall',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(851,1,20,'2010-07-09 19:00:00',NULL,'FREE','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(852,1,21,'2010-07-10 22:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(853,1,6,'2010-07-17 20:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(854,1,22,'2010-08-05 18:45:00',NULL,'FREE','','',NULL,'Sponsored by KISS FM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(855,1,23,'2010-08-15 17:30:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(856,1,24,'2010-08-19 18:00:00',NULL,'FREE','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(857,1,9,'2010-08-20 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(858,1,6,'2010-08-21 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(859,1,8,'2010-08-28 00:00:01',NULL,'','','',NULL,'Michael\'s Birthday Celebration',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(860,1,25,'2010-09-10 19:00:00',NULL,'FREE','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(861,1,26,'2010-09-11 17:30:00',NULL,'FREE','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(862,1,21,'2010-09-24 00:00:01',NULL,'','','',NULL,'Folsom Live Music Fest!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(863,1,27,'2010-10-02 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(864,1,4,'2010-10-08 18:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(865,1,9,'2010-10-16 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(866,1,28,'2010-10-29 00:00:01',NULL,'','','',NULL,'\"The MJ Thriller Halloween Ball featuring Foreverland! Coming October 29th to Yoshi’s SF to terrify your neighborhood!\"\r\nGhoulish and ghastly attire encouraged. Prizes for scariest costume, MJ Look-a-like, and best erotic costume.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(867,1,6,'2010-11-06 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(868,1,8,'2010-11-19 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(869,1,29,'2010-12-18 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(870,1,30,'2010-12-30 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(871,1,31,'2010-12-31 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(872,1,11,'2011-01-08 00:00:01',NULL,'','','',NULL,'Opening for The Cheeseballs',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(873,1,9,'2011-01-14 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(874,1,1,'2011-01-22 00:00:01',NULL,'','','',NULL,'With Wonderbread Five',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(875,1,32,'2011-01-29 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(876,1,8,'2011-02-12 00:00:01',NULL,'$15','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(877,1,33,'2011-02-18 20:00:00',NULL,'','http://tickets.foxrwc.com/eventperformances.asp?evt=33','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(878,1,34,'2011-02-26 20:00:00',NULL,'','','',NULL,'American Cancer Society Relay for Life',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(879,0,7,'2011-02-28 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(880,1,9,'2011-03-12 20:30:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(881,1,35,'2011-03-19 22:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(882,1,11,'2011-03-26 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(883,1,11,'2011-04-29 22:00:00',NULL,'','','',NULL,'<a href=\"http://www.facebook.com/event.php?eid=209906659028506\">RSVP on Facebook</a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(884,1,9,'2011-05-21 00:00:01',NULL,'','','',NULL,'<a href=\"http://www.facebook.com/event.php?eid=119580804788227\">RSVP on Facebook</a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(885,1,33,'2011-06-25 00:00:01',NULL,'','http://tickets.foxrwc.com/eventperformances.asp?evt=158','',NULL,'The 2nd Annual Moonwalker Event\r\nCelebrating the life and legacy of Michael Jackson',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(886,1,36,'2011-06-26 17:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(887,1,16,'2011-07-08 17:30:00',NULL,'','','',NULL,'Foreverland returns to one of our favorite outdoor events, Concerts at The Cove in Alameda, CA on Friday July 8th! ALL AGES and FREE! We play from 5:30pm-7:30pm.\r\n<a href=\"http://www.facebook.com/event.php?eid=130218420394162\">RSVP on Facebook!</a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(888,1,37,'2011-07-09 20:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(889,1,9,'2011-07-16 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(890,1,38,'2011-08-13 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(891,1,4,'2011-09-09 18:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(892,1,24,'2011-09-15 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(893,1,39,'2011-09-16 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(894,1,9,'2011-09-17 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(895,1,58,'2011-10-28 00:00:01',NULL,'','','',NULL,'Thriller Halloween Ball',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(896,1,9,'2011-11-18 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(897,1,51,'2011-08-27 20:00:00',NULL,'','http://www.ticketmaster.com/event/1C0046B78A9B4FD6?artistid=1474826&majorcatid=10001&minorcatid=52','No Minors',NULL,'MJ\'s Birthday Bash',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(898,1,49,'2011-06-24 00:00:01',NULL,'','http://foreverlandsf.eventbrite.com/','',NULL,'Celebrating the life and legacy of Michael Jackson\r\nFeaturing Foreverland\r\nat Mezzanine in San Fancisco',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(899,1,41,'2011-05-27 20:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(900,0,42,'2011-05-28 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(901,1,43,'2011-04-09 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(902,1,1,'2011-04-23 22:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(903,1,20,'2011-07-15 19:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(904,1,44,'2011-07-30 19:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(905,1,45,'2011-06-15 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(906,1,11,'2011-06-18 22:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(907,1,46,'2011-07-27 18:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(908,1,9,'2011-12-30 20:30:00',NULL,'','','',NULL,'Join us at Don Quixote\'s for a Pre-NYE Bash Bash!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(909,1,47,'2011-08-06 19:00:00',NULL,'','','',NULL,'Private Event - limited to LMV Association members and their guests.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(910,0,48,'2011-08-14 16:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(911,0,50,'2011-07-23 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(912,1,43,'2011-06-04 22:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(913,1,5,'2011-05-13 22:00:00',NULL,'','','',NULL,'<span style=\"color:red\">Friday the 13th MJ Thriller Party!</span><br /><br />\r\n\r\n<a href=\"http://www.facebook.com/event.php?eid=170846222969178\">RSVP on Facebook</a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(914,0,7,'2011-07-22 22:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(915,1,35,'2011-08-26 22:00:00',NULL,'$18 adv/$20 door','','',NULL,'MJ\'s Birthday Bash!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(916,1,52,'2011-09-24 17:00:00',NULL,'','','',NULL,'<a href=\"http://www.mhcsd.com/?q=node/247\">Click here for more info</a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(917,1,63,'2012-07-19 18:30:00',NULL,'','','All Ages',NULL,'\"Tunes Under the Trees\" at Grant Park Center',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(918,1,54,'2011-07-04 18:00:00',NULL,'FREE','','All Ages',NULL,'We are on from 6pm-7:30pm.\r\nPop Rocks plays after so us so make sure ya get a spot on the lawn before 6pm!\r\n<a href=\"http://www.facebook.com/event.php?eid=243448595680608\">RSVP on Facebook</a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(919,1,55,'2011-11-12 20:00:00',NULL,'$16','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(920,1,53,'2011-09-30 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(921,1,1,'2011-10-29 00:00:01',NULL,'','http://www.bimbos365club.com/event/56969/','',NULL,'Thriller Halloween Ball!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(922,1,43,'2011-11-05 22:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(923,1,21,'2011-11-11 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(924,1,8,'2011-12-03 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(925,1,21,'2012-03-30 22:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(926,0,56,'2011-12-09 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(927,1,57,'2011-08-28 16:00:00',NULL,'FREE','','All Ages',NULL,'Foreverland will be playing on the \"Popular\" stage at 8th and Harrison',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(928,1,59,'2011-10-21 00:00:01',NULL,'','','',NULL,'Thriller Halloween Ball!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(929,1,60,'2011-11-04 19:30:00',NULL,'','http://www.brownpapertickets.com/event/199198','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(930,0,7,'2011-10-20 20:00:00',NULL,'','','',NULL,'for America Scores Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(931,0,7,'2011-12-16 00:00:01',NULL,'','','',NULL,'at DeYoung Museum',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(932,1,61,'2011-11-19 21:30:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(933,1,1,'2011-12-31 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(934,1,43,'2012-01-14 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(935,1,8,'2012-02-03 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(936,1,43,'2012-02-25 22:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(937,1,1,'2012-03-09 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(938,1,61,'2012-03-23 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(939,1,43,'2012-03-31 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(940,1,8,'2012-04-20 22:00:00',NULL,'','http://www.ticketfly.com/purchase/event/95627','',NULL,'<a href=\"http://www.ticketfly.com/purchase/event/95627\">Tickets on sale now!</a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(941,0,62,'2012-05-12 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(942,1,27,'2012-09-29 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(943,0,7,'2011-12-17 20:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(944,0,7,'2012-01-05 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(945,1,64,'2012-02-04 20:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(946,1,9,'2012-02-24 20:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(947,1,9,'2012-04-27 20:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(948,1,9,'2012-06-02 20:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(949,1,9,'2012-08-11 20:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(950,1,9,'2012-09-28 20:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(951,1,53,'2012-02-10 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(952,1,1,'2012-06-23 00:00:01',NULL,'','','',NULL,'Come see Foreverland perform Michael Jackson\'s album <em>Number Ones</em> in its entirety at the incredible Bimbo\'s 365 club! Get your tickets here: <a>http://www.bimbos365club.com/event/110473/</a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(953,1,20,'2012-07-06 19:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(954,1,8,'2012-07-27 22:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(955,1,1,'2012-08-25 22:00:00',NULL,'','','',NULL,'Foreverland plays the BAD album in its entirety! With a string section! You don\'t want to miss this.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(956,1,8,'2012-09-21 22:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(957,1,8,'2012-11-17 21:00:00',NULL,'$15','http://www.ticketfly.com/purchase/event/153125','',NULL,'<b>BATTLE OF THE BAY</b> Night Two: Foreverland will perform the entire <em>Bad</em> album!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(958,1,66,'2012-07-28 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(959,1,67,'2012-09-15 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(960,1,68,'2012-09-22 15:45:00',NULL,'','http://ticketderby.com/event/the-california-beer-festival-marin-county-craft-heaven-ticket-id-8074','No Minors',NULL,'Enter promo code \"Foreverland\" to get a special discount! The Legendary California Beer Festival (CBF) is coming to Marin County on Saturday September 22, 2012 at beautiful Stafford Lake in Navoto.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(961,1,64,'2012-05-11 22:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(962,1,64,'2012-11-16 21:00:00',NULL,'$15-$20','http://www.ticketfly.com/purchase/event/165729','',NULL,'<b>BATTLE OF THE BAY</b> Night One: Foreverland will perform the entire <em>Off The Wall</em> album!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(963,1,61,'2012-12-01 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(964,1,38,'2012-06-01 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(965,1,65,'2012-07-13 18:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(966,1,43,'2012-07-20 21:30:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(967,1,43,'2012-12-08 22:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(968,1,9,'2012-12-28 20:30:00',NULL,'','','',NULL,'Second Annual Pre-NYE Bash!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(969,1,21,'2013-01-05 21:30:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(970,1,25,'2012-08-17 19:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(971,1,70,'2012-08-18 00:00:01',NULL,'','','',NULL,'Daytime Pool Party!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(972,1,4,'2012-08-31 18:00:00',NULL,'','','',NULL,'TBA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(973,1,24,'2012-08-09 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(974,1,61,'2012-07-14 21:30:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(975,1,46,'2012-07-25 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(976,1,71,'2012-08-01 18:30:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(977,1,72,'2012-08-02 19:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(978,1,53,'2012-09-13 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(979,1,75,'2012-10-06 00:00:01',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(980,1,77,'2012-08-30 17:30:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(981,1,76,'2012-09-14 21:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(982,1,1,'2012-10-27 21:00:00',NULL,'$22','http://www.ticketfly.com/purchase/event/161901?wrKey=4699C01D42D71975C089B338F157D681','No Minors',NULL,'FOREVERLAND is back at Bimbo’s to throw the most THRILLING Halloween party in the Bay! Complete with ghouls, ghosts, zombies and werewolves, you won\'t want to miss this larger-than-life tribute to the one and only Mr. Michael Jackson. <br /><br />\r\n\r\nCostumes HIGHLY encouraged!!!!<br /><br />\r\n\r\nThis event sold out in advance last year, so be sure to <a href=\"http://www.bimbos365club.com/event/161901/\">get your tickets early</a><br />\r\n<a href=\"http://www.facebook.com/events/376271069114339/\">RSVP on Facebook</a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(983,1,78,'2012-10-05 21:30:00',NULL,'$10','http://thejonlovitzcomedyclub.com/show.cfm?id=191574&amp;cart','',NULL,'Ages 18+',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(984,1,79,'2012-11-18 18:30:00',NULL,'$10/$15','','All Ages',NULL,'Fundraiser for the Pittsburg High School Marching Show Band! Come out to PHS to see Foreverland and help us send the PHS Pirates Marching Show Band to London! Doors open at 5:30pm.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(985,1,80,'2012-10-25 21:30:00',NULL,'$10','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(986,1,81,'2012-12-29 21:10:00',NULL,'','','No Minors',NULL,'21+',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(987,1,82,'2013-01-12 21:30:00',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(988,1,64,'2014-02-16 21:30:00',NULL,'','','No Minors',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(989,1,9,'2013-02-23 20:00:00',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(990,1,83,'2013-03-02 21:30:00',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(991,1,1,'2013-04-12 22:00:00',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(992,1,64,'2013-04-20 21:30:00',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(993,1,9,'2013-07-26 20:00:00',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(994,1,9,'2013-10-18 20:00:00',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(995,1,1,'2013-10-26 22:00:00','21:00:00','$22','http://www.ticketfly.com/purchase/event/362449','21+','Pop Fiction','FOREVERLAND is back at Bimbo’s to throw the most THRILLING Halloween party in the Bay! Complete with ghouls, ghosts, zombies and werewolves, you won’t want to miss this larger-than-life tribute to the one and only Mr. Michael Jackson. \r\n\r\nCostumes HIGHLY encouraged!!!!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(996,1,84,'2013-06-08 00:00:01',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(997,1,1,'2013-08-24 22:00:00',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(998,1,9,'2013-05-17 20:00:00',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(999,1,9,'2013-12-28 20:00:00',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1000,1,1,'2013-01-26 22:00:00',NULL,'','','No Minors',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1001,1,81,'2013-04-20 21:00:00',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1002,1,81,'2013-07-20 21:00:00',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1003,1,81,'2013-10-19 21:00:00',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1004,1,81,'2013-01-25 21:00:00',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1005,1,64,'2013-02-22 21:00:00',NULL,'','','No Minors',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1006,1,64,'2013-02-22 21:00:00',NULL,'','','No Minors',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1007,1,67,'2013-09-21 15:00:00',NULL,'','','No Minors',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1008,1,24,'2013-07-11 18:30:00',NULL,'Free','','All Ages',NULL,'Todos Santos Plaza, Willow Pass Rd. and Grant Streets. For more information please call 925-671-3464.<br>\r\n<a href=\"http://www.communityconcerts.com/\">www.communityconcerts.com</a><br>\r\n<a href=\"http://www.concordfirst.org/\">www.concordfirst.org/</a>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1009,1,66,'2013-08-10 15:00:00',NULL,'','','No Minors',NULL,'Aptos VIlage Park',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1010,1,77,'2013-06-27 17:00:00',NULL,'FREE','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1011,1,2,'2013-05-18 21:00:00',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1012,1,11,'2013-05-25 21:00:00',NULL,'','','No Minors',NULL,'Ages 21+',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1013,1,63,'2013-06-13 18:30:00',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1014,1,64,'2013-06-14 21:00:00',NULL,'','','No Minors',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1015,1,20,'2013-07-05 19:00:00',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1016,1,21,'2013-08-23 22:00:00',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1017,1,85,'2013-08-16 17:00:00',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1018,1,83,'2013-09-28 21:30:00',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1019,1,4,'2013-09-13 18:00:00',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1020,1,86,'2013-06-21 20:00:00',NULL,'$12/$15','http://www.ticketfly.com/purchase/event/260063','All Ages/Licensed',NULL,'Our Denver debut! Ages 16+',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1021,1,87,'2013-06-22 18:30:00',NULL,'','','All Ages/Licensed',NULL,'At the Wild Animal Sanctuary in Keenesburg, Colorado!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1022,1,88,'2013-06-23 00:00:01',NULL,'','http://www.bellyupaspen.com/events/','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1023,1,90,'2013-07-12 21:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1024,1,91,'2013-07-13 21:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1025,1,92,'2013-09-27 20:00:00',NULL,'$10','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1026,1,82,'2013-07-19 21:00:00',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1027,1,93,'2013-08-01 18:00:00',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1028,1,3,'2013-09-07 22:00:00',NULL,'','','',NULL,'Playing in the Catalyst Front Room',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1029,1,21,'2013-11-15 22:00:00',NULL,'','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1030,1,94,'2013-07-06 20:00:00',NULL,'','http://www.scottsdaleprincess.com/seasonal-events/summer-at-the-princess','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1031,1,95,'2013-07-27 18:30:00',NULL,'','','All Ages',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1032,1,96,'2013-12-14 22:30:00',NULL,'','http://siliconvalleyball.com/tickets/','All Ages',NULL,'At the Fox Theatre!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `shows_show` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shows_venue`
--

DROP TABLE IF EXISTS `shows_venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shows_venue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venue_name` varchar(200) DEFAULT NULL,
  `venue_image` varchar(100) NOT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `website` varchar(200) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `notes` longtext,
  `ltlng` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows_venue`
--

LOCK TABLES `shows_venue` WRITE;
/*!40000 ALTER TABLE `shows_venue` DISABLE KEYS */;
INSERT INTO `shows_venue` VALUES (1,'Bimbo\'s','venues/bimbos.gif','1025 Columbus Ave.',NULL,'San Francisco','CA',NULL,'U.S.A.',NULL,'http://www.bimbos365club.com/',NULL,NULL,'37.8038148,-122.4153814'),(2,'Slim\'s','venues/slims-s.png','333 11th St.',NULL,'San Francisco','CA',NULL,'U.S.A.',NULL,'http://www.slims-sf.com/',NULL,NULL,'37.7715108,-122.4132772'),(3,'The Catalyst','venues/catalyst-s.png','1011 Pacific Ave.',NULL,'Santa Cruz','CA',NULL,'U.S.A.',NULL,'http://www.catalystclub.com/',NULL,NULL,'36.971278,-122.025915'),(4,'Redwood City Music on the Square','venues/redwood-city.jpg','Courthouse Square',NULL,'Redwood City','CA',NULL,'U.S.A.',NULL,'http://www.redwoodcity.org/events/musiconthesquare.html',NULL,NULL,'37.4852152,-122.2363548'),(5,'Last Day Saloon','venues/lastday.jpg','120 5th Street',NULL,'Santa Rosa','CA',NULL,'U.S.A.',NULL,'www.lastdaysaloon.com',NULL,NULL,'38.438337,-122.719987'),(6,'19 Broadway','venues/19broadway.jpg','7 Broadway Blvd.',NULL,'Fairfax','CA',NULL,'U.S.A.',NULL,'www.19broadway.com',NULL,NULL,'37.98688,-122.5872612'),(7,'Private Event','venues/','',NULL,'San Francisco','CA',NULL,'U.S.A.',NULL,'',NULL,NULL,'37.7749295,-122.4194155'),(8,'Red Devil Lounge','venues/reddevil.jpg','1695 Polk Street',NULL,'San Francisco','CA',NULL,'U.S.A.',NULL,'www.reddevillounge.com',NULL,NULL,'37.7922832,-122.4211881'),(9,'Don Quixote\'s','venues/dqs.jpg','6275 California 9',NULL,'Felton','CA',NULL,'U.S.A.',NULL,'www.donquixotesmusic.info',NULL,NULL,'37.052616,-122.0732329'),(10,'Mezzanine','venues/mezzanine.gif','444 Jessie Street',NULL,'San Francisco','CA',NULL,'U.S.A.',NULL,'www.mezzaninesf.com',NULL,NULL,'37.7824843,-122.4080736'),(11,'Harlow\'s','venues/harlows.gif','2708 1/2 J St',NULL,'Sacramento','CA',NULL,'U.S.A.',NULL,'www.harlows.com',NULL,NULL,'38.5737964,-121.4702323'),(12,'AT&T Park','venues/giants.gif','24 Willie Mays Plaza',NULL,'San Francisco','CA',NULL,'U.S.A.',NULL,'sanfrancisco.giants.mlb.com',NULL,NULL,'37.7781428,-122.3908715'),(13,'Private Event','venues/','',NULL,'Monterey','CA',NULL,'U.S.A.',NULL,'',NULL,NULL,'36.6002378,-121.8946761'),(14,'Black & White Ball','venues/bwball.gif','Civic Center',NULL,'San Francisco','CA',NULL,'U.S.A.',NULL,'http://www.sfsymphony.org/season/default.aspx?id=42038',NULL,NULL,'37.7815533,-122.4156427'),(15,'Golden Gate Fields','venues/ggf.jpg','1100 Eastshore Frontage Road',NULL,'Berkeley','CA',NULL,'U.S.A.',NULL,'www.goldengatefields.com',NULL,NULL,'37.8627464,-122.3029449'),(16,'Alameda Crab Cove','venues/crabcove.gif','1252 McKay Avenue',NULL,'Alameda','CA',NULL,'U.S.A.',NULL,'',NULL,NULL,'37.7696842,-122.2783595'),(17,'Alameda County Fair','venues/alameda-county-fair.gif','4501 Pleasanton Avenue',NULL,'Pleasanton','CA',NULL,'U.S.A.',NULL,'http://www.alamedacountyfair.com/',NULL,NULL,'37.66169,-121.887367'),(18,'Regency Theatre','venues/regencymoonwalker.gif','1300 Van Ness Avenue',NULL,'San Francisco','CA',NULL,'U.S.A.',NULL,'http://www.regencycentersf.com/',NULL,NULL,'37.7876126,-122.421678'),(19,'SF Pride Celebration','venues/pride.gif','Civic Center',NULL,'San Francisco','CA',NULL,'U.S.A.',NULL,'http://www.sfpride.org/',NULL,NULL,'37.7815533,-122.4156427'),(20,'Blackhawk Plaza','venues/bp.gif','4040 Blackhawk Plaza',NULL,'Danville','CA',NULL,'U.S.A.',NULL,'www.shopblackhawkplaza.com',NULL,NULL,'37.8006577,-121.9203399'),(21,'Powerhouse Pub','venues/PH_Pub.png','614 Sutter St.',NULL,'Folsom','CA',NULL,'U.S.A.',NULL,'http://www.powerhousepub.com/',NULL,NULL,'38.6781581,-121.1762784'),(22,'San Jose Music in the Park','venues/sj.gif','Plaza de Cesar Chavez',NULL,'San Jose','CA',NULL,'U.S.A.',NULL,'www.sjdowntown.com/Music_in_the_Park.html',NULL,NULL,'37.3320044,-121.8895243'),(23,'Napa Town & Country Fair','venues/napa.jpg','575 3rd Street',NULL,'Napa','CA',NULL,'U.S.A.',NULL,'http://www.napavalleyexpo.com',NULL,NULL,'38.2983785,-122.2786387'),(24,'Music & Market Series','venues/todos.jpg','Todos Santos Plaza',NULL,'Concord','CA',NULL,'U.S.A.',NULL,'http://www.concordtsba.org/',NULL,NULL,'37.977195,-122.0336677'),(25,'Friday Night Live @ Trails Park','venues/summerlin.jpg','',NULL,'Summerlin','NV',NULL,'U.S.A.',NULL,'',NULL,NULL,'36.1871005,-115.2956118'),(26,'Webster Street Jam','venues/crabcove.gif','Webster Street',NULL,'Alameda','CA',NULL,'U.S.A.',NULL,'http://www.westalamedabusiness.com/events/jam.html',NULL,NULL,'37.7801968,-122.276581'),(27,'Palo Alto Black & White Ball','venues/paloaltobw.gif','1305 Middlefield Road',NULL,'Palo Alto','CA',NULL,'U.S.A.',NULL,'http://www.thepaloaltoblackandwhiteball.org/',NULL,NULL,''),(28,'Yoshi\'s','venues/yoshis.jpg','1330 Fillmore St.',NULL,'San Francisco','CA',NULL,'U.S.A.',NULL,'http://www.yoshis.com/sanfrancisco',NULL,NULL,'37.7819162,-122.4323059'),(29,'Fat Cat Music House & Lounge','venues/fatcat.jpg','930 11th Street',NULL,'Modesto','CA',NULL,'U.S.A.',NULL,'www.fatcatmodesto.com',NULL,NULL,'37.6407842,-120.9986473'),(30,'Fiesta Bowl Parade VIP Reception','venues/fiestabowl.gif','For McDowell Radisson',NULL,'Fort McDowell','AZ',NULL,'U.S.A.',NULL,'',NULL,NULL,'33.6367105,-111.6745826'),(31,'Fiesta Bowl Invitational','venues/fiestabowl.gif','The Phoenician',NULL,'Phoenix','AZ',NULL,'U.S.A.',NULL,'',NULL,NULL,'33.5091418,-111.9447968'),(32,'San Ramon Valley High School Fundraiser','venues/','501 Danville Blvd',NULL,'Danville','CA',NULL,'U.S.A.',NULL,'',NULL,NULL,'37.8260853,-122.006033'),(33,'Fox Theatre','venues/bigfox.jpg','2223 Broadway St',NULL,'Redwood City','CA',NULL,'U.S.A.',NULL,'http://www.foxrwc.com/',NULL,NULL,'37.4864543,-122.2297766'),(34,'El Campanil Theatre','venues/relay.jpg','602 West Second Street',NULL,'Antioch','CA',NULL,'U.S.A.',NULL,'www.elcampaniltheatre.com/',NULL,NULL,'38.017201,-121.813994'),(35,'The Showroom','venues/showroom.jpg','1000 Van Ness Avenue',NULL,'San Francisco','CA',NULL,'U.S.A.',NULL,'http://www.theshowroomsf.com/',NULL,NULL,'37.7850262,-122.4209061'),(36,'Los Gatos Music in the Park','venues/lgmip.jpg','110 E. Main St.',NULL,'Los Gatos','CA',NULL,'U.S.A.',NULL,'http://www.lgmip.com/',NULL,NULL,'37.2209934,-121.9785339'),(37,'West Side Theatre','venues/westsidetheater.gif','1331 Main Street',NULL,'Newman','CA',NULL,'U.S.A.',NULL,'http://www.westsidetheatre.org/',NULL,NULL,'37.3152996,-121.0226991'),(38,'El Dorado Hills Concert Series','venues/eldhills.jpg','1021 Harvard Way',NULL,'El Dorado Hills','CA',NULL,'U.S.A.',NULL,'http://www.edhcsd.org/',NULL,NULL,''),(39,'Lodi Grape & Harvest Festival','venues/lodi.jpg','413 East Lockeford St.',NULL,'Lodi','CA',NULL,'U.S.A.',NULL,'http://www.grapefestival.com',NULL,NULL,'38.1392809,-121.263364'),(40,'TBA','venues/','',NULL,'TBA','',NULL,'U.S.A.',NULL,'',NULL,NULL,'32.2435007,-110.9474386'),(41,'Brooklyn Bowl','venues/brooklynbowl.png','61 Wythe Avenue',NULL,'Brooklyn','NY',NULL,'U.S.A.',NULL,'http://brooklynbowl.com/',NULL,NULL,'40.721876,-73.957676'),(42,'Private Event','venues/princeton.png','',NULL,'Princeton','NJ',NULL,'U.S.A.',NULL,'',NULL,NULL,'40.3572976,-74.6672226'),(43,'Dan\'s Bar','venues/dans.jpg','1524 Civic Dr',NULL,'Walnut Creek','CA','','U.S.A.',NULL,'http://www.dansbar.com',NULL,NULL,'37.901833,-122.062478'),(44,'Brentwood Concert Series','venues/brentwood.png','Triology at the Vineyards',NULL,'Brentwood','CA',NULL,'U.S.A.',NULL,'',NULL,NULL,'37.9026613,-121.7304535'),(45,'Pittsburg Pops Series','venues/pittspops.png','Railroad Ave & E 5th St. Pittsburg, CA',NULL,'Pittsburg','CA',NULL,'U.S.A.',NULL,'http://www.shopoldtown.com/PittsburgPops.htm',NULL,NULL,'38.0319849,-121.8836821'),(46,'Pruneyard Concert Series','venues/pruneyard.jpg','1875 Bascom Ave',NULL,'Campbell','CA',NULL,'U.S.A.',NULL,'http://www.pruneyard.com/News/Default.aspx?ItemTypeID=e5175c0b-3e04-4ffb-b315-61c1f158db16',NULL,NULL,'37.2882795,-121.9333534'),(47,'Lake Mission Viejo Concert Series','venues/lmva.jpg','22555 Olympiad Road',NULL,'Mission Viejo','CA',NULL,'U.S.A.',NULL,'http://www.lakemissionviejo.org',NULL,NULL,'33.6378918,-117.6420166'),(48,'Private Event','venues/belvedere.jpg','450 San Rafael Avenue',NULL,'Belvedere','CA',NULL,'U.S.A.',NULL,'',NULL,NULL,'37.8741958,-122.4655347'),(49,'The 2nd Annual Moonwalker Event','venues/moonmezz.jpg','Mezzanine, 444 Jessie Street',NULL,'San Francisco','CA',NULL,'U.S.A.',NULL,'',NULL,NULL,''),(50,'Private Event','venues/','',NULL,'Guerneville','CA',NULL,'U.S.A.',NULL,'',NULL,NULL,''),(51,'Uptown Theatre','venues/uptownnapa.jpg','1350 3rd Street',NULL,'Napa','CA',NULL,'U.S.A.',NULL,'http://www.uptowntheatrenapa.com/',NULL,NULL,'38.296541,-122.287477'),(52,'Mountain House Concert Series','venues/','Central Community Park,‎ 25 Main Street',NULL,'Mountain House','CA',NULL,'U.S.A.',NULL,'',NULL,NULL,'37.7805215,-121.5409253'),(53,'Fulton 55','venues/fulton55.jpg','875 Divisadero Street',NULL,'Fresno','CA',NULL,'U.S.A.',NULL,'http://www.fulton55.com/',NULL,NULL,'36.7436339,-119.8007076'),(54,'SF Independence Day Extravaganza','venues/july4.jpg','Aquatic Park at Jefferson and Hyde Streets',NULL,'San Francisco','',NULL,'U.S.A.',NULL,'http://www.visitfishermanswharf.com/events/fourthofjuly.aspx',NULL,NULL,'37.7994887,-122.4189979'),(55,'The Knitting Factory','venues/knit.jpg','211 N Virginia St',NULL,'Reno','NV',NULL,'U.S.A.',NULL,'http://re.knittingfactory.com/',NULL,NULL,'39.527131,-119.813749'),(56,'Private Event','venues/','',NULL,'San Jose','CA',NULL,'U.S.A.',NULL,'',NULL,NULL,'37.3393857,-121.8949555'),(57,'Oakland Chinatown StreetFest','venues/oakchina.jpg','8th St & Harrison St',NULL,'Oakland','CA',NULL,'U.S.A.',NULL,'http://www.oaklandchinatownstreetfest.com',NULL,NULL,'37.798808,-122.2701684'),(58,'Pepper Belly\'s','venues/pepper.jpg','849 Texas St',NULL,'Fairfield','CA',NULL,'U.S.A.',NULL,'http://www.pepperbellys.com/',NULL,NULL,'38.248986,-122.044351'),(59,'The Avalon','venues/avalon.jpg','777 Lawrence Expressway',NULL,'Santa Clara','CA',NULL,'U.S.A.',NULL,'http://www.AvalonSantaClara.com',NULL,NULL,'37.33721,-121.9955568'),(60,'Stockton Empire Theatre','venues/empire.jpg','1825 Pacific Avenue',NULL,'Stockton','CA',NULL,'U.S.A.',NULL,'www.stocktonempiretheatre.com',NULL,NULL,'37.969268,-121.299335'),(61,'George\'s Night Club','venues/georges.jpg','842 4th Street',NULL,'San Rafael','CA',NULL,'U.S.A.',NULL,'http://www.georgesnightclub.com/',NULL,NULL,'37.9728848,-122.5248269'),(62,'Private Event','venues/','',NULL,'Mill Valley','CA',NULL,'U.S.A.',NULL,'',NULL,NULL,'37.9060368,-122.5449763'),(63,'Los Altos Summer Concert Series','venues/losaltos.png','97 Hillview Ave',NULL,'Los Altos','CA','94022','U.S.A.',NULL,'',NULL,NULL,'37.3796312,-122.1120217'),(64,'The New Parish','venues/newparish.jpg','579 18th Street',NULL,'Oakland','CA','','U.S.A.',NULL,'http://www.thenewparish.com/',NULL,NULL,'37.8079465,-122.2728477'),(65,'Stonecreek Village Summer Concert Series','venues/stonecreek.jpg','Pacific Avenue and Robinhood Drive',NULL,'Stockton','CA',NULL,'U.S.A.',NULL,'http://www.shopstonecreekvillage.com/summer-concerts-at-stonecreek-village.html',NULL,NULL,'38.0005685,-121.3164838'),(66,'California Beer Fest','venues/calibeer.jpg','',NULL,'Santa Cruz','CA','','U.S.A.',NULL,'http://www.californiabeerfestival.com/',NULL,NULL,'36.9741171,-122.0307963'),(67,'California Beer Fest','venues/calibeer.jpg','',NULL,'Ventura','CA',NULL,'U.S.A.',NULL,'http://www.californiabeerfestival.com/',NULL,NULL,'34.2746405,-119.2290053'),(68,'California Beer Fest','venues/calibeer.jpg','Stafford Lake Park',NULL,'Novato','CA','','U.S.A.',NULL,'http://www.californiabeerfestival.com/',NULL,NULL,'38.1152431,-122.6542179'),(69,'California Beer Fest','venues/calibeer.jpg','Claremont Village',NULL,'Claremont','CA',NULL,'U.S.A.',NULL,'http://www.californiabeerfestival.com/claremont.html',NULL,NULL,'34.1093243,-117.7021046'),(70,'Silverton Casino Hotel','venues/silverton.jpg','3333 Blue Diamond Road',NULL,'Las Vegas','CA',NULL,'U.S.A.',NULL,'silvertoncasino.com',NULL,NULL,''),(71,'Concerts in the Park - Sounds of Summer Series','venues/lakeoswego.jpg','199 Foothills Road',NULL,'Lake Oswego','OR',NULL,'U.S.A.',NULL,'',NULL,NULL,'45.4208897,-122.6589358'),(72,'Hood River Summer Concerts Series','venues/hoodriver.jpg','Jackson Park',NULL,'Hood River','OR',NULL,'U.S.A.',NULL,'',NULL,NULL,'45.7035605,-121.5269002'),(73,'Winstons','venues/winstons.png','1921 Bacon St.',NULL,'San Diego','CA',NULL,'U.S.A.',NULL,'http://winstonsob.com/',NULL,NULL,'32.7471222,-117.2506279'),(74,'Hoberg\'s','venues/hobergs.jpg','Highway 175 at Entrance Road',NULL,'Cobb','CA','95426','U.S.A.',NULL,'http://www.hobergsclub.com/',NULL,NULL,'38.8388599,-122.720299'),(75,'California Beer Fest','venues/calibeer.jpg','Bonelli Park, 120 Via Verde',NULL,'San Dimas','CA','','U.S.A.',NULL,'',NULL,NULL,'34.0779917,-117.8130704'),(76,'Velvet Jones','venues/velvetjones.gif','423 State Street',NULL,'Santa Barbara','CA','','U.S.A.',NULL,'http://velvet-jones.com/',NULL,NULL,'34.4163029,-119.6950392'),(77,'Montgomery Village','venues/montvillage.gif','911 Village Court',NULL,'Santa Rosa','CA','','U.S.A.',NULL,'',NULL,NULL,'38.4456433,-122.6867444'),(78,'Jon Lovitz Comedy Club','venues/lovitz.jpg','1000 Universal Studios Blvd #222 (on City Walk)',NULL,'Universal City, Los Angeles','CA','91608','U.S.A.',NULL,'http://thejonlovitzcomedyclub.com/',NULL,NULL,'34.1397694,-118.3505779'),(79,'Pittsburg Creative Arts Building','venues/phs.png','250 School Street',NULL,'Pittsburg, CA','CA','94565','U.S.A.',NULL,'',NULL,NULL,'38.0208562,-121.8852218'),(80,'Reunion Nightclub','venues/reunion.jpg','4370 Town Center Blvd., Suite 100',NULL,'El Dorado Hills','CA','95762','U.S.A.',NULL,'http://www.reunion-nightclub.com/',NULL,NULL,'38.650861,-121.063847'),(81,'Club Fox','venues/clubfox.jpg','2223 Broadway',NULL,'Redwood City','CA','94063','U.S.A.',NULL,'http://www.clubfoxrwc.com/',NULL,NULL,'37.4864543,-122.2297766'),(82,'Sweetwater Music Hall','venues/sweetwater.jpg','19 Corte Madera Ave',NULL,'Mill Valley','CA','94941','U.S.A.',NULL,'http://www.sweetwatermusichall.com/',NULL,NULL,'37.9069236,-122.5479581'),(83,'Mystic Theatre','venues/mystic.jpg','21 Petaluma Blvd N',NULL,'Petaluma','CA','94952','U.S.A.',NULL,'http://www.mystictheatre.com/',NULL,NULL,'38.2345939,-122.6404233'),(84,'Black Oak Casino','venues/blackoak.jpg','19400 Cherry Valley Boulevard North',NULL,'Tuolumne','CA','95379','U.S.A.',NULL,'http://www.blackoakcasino.com/',NULL,NULL,'37.9736504,-120.2391667'),(85,'Brisbane Concerts in the Park','venues/brisbane.png','11 Old County Road',NULL,'Brisbane','CA','94005','U.S.A.',NULL,'http://www.ci.brisbane.ca.us/departments/parks-and-recreation/special-events',NULL,NULL,'37.6849481,-122.4009184'),(86,'Cervantes\' Masterpiece Ballroom','venues/cervantes.png','2637 Welton St',NULL,'Denver','CO','80205','U.S.A.',NULL,'http://www.cervantesmasterpiece.com/',NULL,NULL,'39.7544946,-104.9785364'),(87,'Rock Into The Wild','venues/rockwild.gif','1946 County Road 53',NULL,'Keenesburg','CO','80643','U.S.A.',NULL,'http://www.rockintothewild.org/',NULL,NULL,'40.027523,-104.559808'),(88,'Belly Up Aspen','venues/bellyupaspen.png','150 S Galena St',NULL,'Aspen','CO','81611','U.S.A.',NULL,'http://www.bellyupaspen.com/',NULL,NULL,'39.1897721,-106.8182373'),(90,'House of Blues San Diego','venues/hob.gif','1055 Fifth Avenue',NULL,'San Diego','CA','92101','U.S.A.',NULL,'http://www.houseofblues.com/venues/clubvenues/sandiego/',NULL,NULL,'32.716238,-117.1601285'),(91,'House of Blues Anaheim','venues/hob.gif','1530 S. Disneyland Dr.',NULL,'Anaheim','CA','92802','U.S.A.',NULL,'http://www.houseofblues.com/venues/clubvenues/anaheim/',NULL,NULL,'33.8095868,-117.9229975'),(92,'Summertime at the Maritime Vallejo','venues/calmaritime.png','Cal Maritime',NULL,'Vallejo','CA','94590','U.S.A.',NULL,'http://www.csum.edu/web/faculty-and-staff/concert-series',NULL,NULL,''),(93,'Windsor Summer Nights on the Green','venues/windsor.jpg','Windsor Town Green',NULL,'Windsor','CA','95492','U.S.A.',NULL,'http://www.ci.windsor.ca.us/index.aspx?NID=342',NULL,NULL,'38.5487024,-122.8149729'),(94,'Fairmont Scottsdale Princess Resort','venues/fairmont.gif','7575 East Princess Drive',NULL,'Scottsdale','AZ','85255','U.S.A.',NULL,'http://www.scottsdaleprincess.com/',NULL,NULL,'33.6445687,-111.915912'),(95,'Sonoma County Fair','venues/sonomafair.jpg','1350 Bennet Valley Road',NULL,'Santa Rosa','CA','95404','U.S.A.',NULL,'http://www.sonomacountyfair.com/fair/sonoma-county-fair.php',NULL,NULL,'38.432974,-122.7010645'),(96,'Silicon Valley Ball','venues/svb.jpg','',NULL,'Redwood City','CA','94603','U.S.A.',NULL,'http://siliconvalleyball.com/',NULL,NULL,'37.4852152,-122.2363548');
/*!40000 ALTER TABLE `shows_venue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs_setlist`
--

DROP TABLE IF EXISTS `songs_setlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songs_setlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `show_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `show_id_refs_id_42f582bf` (`show_id`),
  CONSTRAINT `show_id_refs_id_42f582bf` FOREIGN KEY (`show_id`) REFERENCES `shows_show` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs_setlist`
--

LOCK TABLES `songs_setlist` WRITE;
/*!40000 ALTER TABLE `songs_setlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `songs_setlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs_setlistsong`
--

DROP TABLE IF EXISTS `songs_setlistsong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songs_setlistsong` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `song_id` int(11) NOT NULL,
  `setlist_id` int(11) NOT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `setlist_id_refs_id_273fcf38` (`setlist_id`),
  KEY `song_id_refs_id_b3055939` (`song_id`),
  CONSTRAINT `setlist_id_refs_id_273fcf38` FOREIGN KEY (`setlist_id`) REFERENCES `songs_setlist` (`id`),
  CONSTRAINT `song_id_refs_id_b3055939` FOREIGN KEY (`song_id`) REFERENCES `songs_song` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs_setlistsong`
--

LOCK TABLES `songs_setlistsong` WRITE;
/*!40000 ALTER TABLE `songs_setlistsong` DISABLE KEYS */;
/*!40000 ALTER TABLE `songs_setlistsong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs_song`
--

DROP TABLE IF EXISTS `songs_song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songs_song` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `original_artist` varchar(200) DEFAULT NULL,
  `original_album` varchar(200) DEFAULT NULL,
  `release_year` varchar(200) DEFAULT NULL,
  `foh_notes` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs_song`
--

LOCK TABLES `songs_song` WRITE;
/*!40000 ALTER TABLE `songs_song` DISABLE KEYS */;
/*!40000 ALTER TABLE `songs_song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs_song_singer`
--

DROP TABLE IF EXISTS `songs_song_singer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songs_song_singer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `song_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `song_id` (`song_id`,`member_id`),
  KEY `member_id_refs_id_83d77dfd` (`member_id`),
  CONSTRAINT `member_id_refs_id_83d77dfd` FOREIGN KEY (`member_id`) REFERENCES `members_member` (`id`),
  CONSTRAINT `song_id_refs_id_f0ff2641` FOREIGN KEY (`song_id`) REFERENCES `songs_song` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs_song_singer`
--

LOCK TABLES `songs_song_singer` WRITE;
/*!40000 ALTER TABLE `songs_song_singer` DISABLE KEYS */;
/*!40000 ALTER TABLE `songs_song_singer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'django_extensions','0001_empty','2013-09-27 10:34:30'),(4,'shows','0001_initial','2013-10-01 13:11:31'),(5,'shows','0002_initial','2013-10-01 13:14:35'),(6,'shows','0003_auto__add_field_venue_ltlng','2013-10-01 13:15:26');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bwbps_categories`
--

DROP TABLE IF EXISTS `wp_bwbps_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bwbps_categories` (
  `id` bigint(20) NOT NULL,
  `image_id` bigint(20) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `tag_name` varchar(250) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bwbps_categories`
--

LOCK TABLES `wp_bwbps_categories` WRITE;
/*!40000 ALTER TABLE `wp_bwbps_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bwbps_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bwbps_customdata`
--

DROP TABLE IF EXISTS `wp_bwbps_customdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bwbps_customdata` (
  `id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  `bwbps_status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bwbps_customdata`
--

LOCK TABLES `wp_bwbps_customdata` WRITE;
/*!40000 ALTER TABLE `wp_bwbps_customdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bwbps_customdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bwbps_favorites`
--

DROP TABLE IF EXISTS `wp_bwbps_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bwbps_favorites` (
  `favorite_id` bigint(20) NOT NULL,
  `image_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`favorite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bwbps_favorites`
--

LOCK TABLES `wp_bwbps_favorites` WRITE;
/*!40000 ALTER TABLE `wp_bwbps_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bwbps_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bwbps_fields`
--

DROP TABLE IF EXISTS `wp_bwbps_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bwbps_fields` (
  `field_id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `numeric_field` int(11) NOT NULL,
  `multi_val` int(11) NOT NULL,
  `default_val` varchar(255) NOT NULL,
  `auto_capitalize` int(11) DEFAULT NULL,
  `keyboard_type` int(11) DEFAULT NULL,
  `html_filter` int(11) DEFAULT NULL,
  `date_format` int(11) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bwbps_fields`
--

LOCK TABLES `wp_bwbps_fields` WRITE;
/*!40000 ALTER TABLE `wp_bwbps_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bwbps_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bwbps_forms`
--

DROP TABLE IF EXISTS `wp_bwbps_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bwbps_forms` (
  `form_id` int(11) NOT NULL,
  `form_name` varchar(30) NOT NULL,
  `form` longtext NOT NULL,
  `css` longtext NOT NULL,
  `fields_used` longtext NOT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bwbps_forms`
--

LOCK TABLES `wp_bwbps_forms` WRITE;
/*!40000 ALTER TABLE `wp_bwbps_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bwbps_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bwbps_galleries`
--

DROP TABLE IF EXISTS `wp_bwbps_galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bwbps_galleries` (
  `gallery_id` bigint(20) NOT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `gallery_name` varchar(255) NOT NULL,
  `gallery_description` longtext NOT NULL,
  `gallery_type` int(11) NOT NULL,
  `caption` longtext NOT NULL,
  `add_text` varchar(255) NOT NULL,
  `upload_form_caption` varchar(255) NOT NULL,
  `contrib_role` int(11) NOT NULL,
  `anchor_class` varchar(255) NOT NULL,
  `img_count` bigint(20) DEFAULT NULL,
  `img_rel` varchar(255) NOT NULL,
  `img_class` varchar(255) NOT NULL,
  `img_perrow` int(11) DEFAULT NULL,
  `img_perpage` int(11) DEFAULT NULL,
  `mini_aspect` int(11) DEFAULT NULL,
  `mini_width` int(11) DEFAULT NULL,
  `mini_height` int(11) DEFAULT NULL,
  `thumb_aspect` int(11) DEFAULT NULL,
  `thumb_width` int(11) DEFAULT NULL,
  `thumb_height` int(11) DEFAULT NULL,
  `medium_aspect` int(11) DEFAULT NULL,
  `medium_width` int(11) DEFAULT NULL,
  `medium_height` int(11) DEFAULT NULL,
  `image_aspect` int(11) DEFAULT NULL,
  `image_width` int(11) DEFAULT NULL,
  `image_height` int(11) DEFAULT NULL,
  `show_caption` int(11) DEFAULT NULL,
  `nofollow_caption` int(11) DEFAULT NULL,
  `caption_template` varchar(255) NOT NULL,
  `show_imgcaption` int(11) DEFAULT NULL,
  `img_status` int(11) DEFAULT NULL,
  `allow_no_image` int(11) DEFAULT NULL,
  `suppress_no_image` int(11) DEFAULT NULL,
  `default_image` varchar(255) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime NOT NULL,
  `layout_id` int(11) DEFAULT NULL,
  `use_customform` int(11) DEFAULT NULL,
  `custom_formid` int(11) DEFAULT NULL,
  `use_customfields` int(11) DEFAULT NULL,
  `cover_imageid` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `sort_field` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `poll_id` int(11) DEFAULT NULL,
  `rating_position` int(11) DEFAULT NULL,
  `hide_toggle_ratings` int(11) DEFAULT NULL,
  `pext_insert_setid` int(11) DEFAULT NULL,
  `max_user_uploads` int(11) DEFAULT NULL,
  `uploads_period` int(11) DEFAULT NULL,
  PRIMARY KEY (`gallery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bwbps_galleries`
--

LOCK TABLES `wp_bwbps_galleries` WRITE;
/*!40000 ALTER TABLE `wp_bwbps_galleries` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bwbps_galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bwbps_imageratings`
--

DROP TABLE IF EXISTS `wp_bwbps_imageratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bwbps_imageratings` (
  `rating_id` bigint(20) NOT NULL,
  `image_id` bigint(20) NOT NULL,
  `gallery_id` bigint(20) DEFAULT NULL,
  `poll_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_ip` varchar(30) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` varchar(250) NOT NULL,
  `updated_date` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`rating_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bwbps_imageratings`
--

LOCK TABLES `wp_bwbps_imageratings` WRITE;
/*!40000 ALTER TABLE `wp_bwbps_imageratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bwbps_imageratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bwbps_images`
--

DROP TABLE IF EXISTS `wp_bwbps_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bwbps_images` (
  `image_id` bigint(20) NOT NULL,
  `gallery_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `comment_id` bigint(20) DEFAULT NULL,
  `image_name` varchar(250) NOT NULL,
  `image_caption` longtext NOT NULL,
  `file_type` int(11) DEFAULT NULL,
  `file_name` longtext NOT NULL,
  `file_url` longtext NOT NULL,
  `mini_url` longtext NOT NULL,
  `thumb_url` longtext NOT NULL,
  `medium_url` longtext NOT NULL,
  `image_url` longtext NOT NULL,
  `wp_attach_id` bigint(20) DEFAULT NULL,
  `url` varchar(250) NOT NULL,
  `custom_fields` longtext NOT NULL,
  `meta_data` longtext NOT NULL,
  `geolong` double DEFAULT NULL,
  `geolat` double DEFAULT NULL,
  `img_attribution` longtext NOT NULL,
  `img_license` int(11) DEFAULT NULL,
  `updated_by` bigint(20) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `alerted` int(11) NOT NULL,
  `seq` bigint(20) NOT NULL,
  `favorites_cnt` bigint(20) DEFAULT NULL,
  `avg_rating` double NOT NULL,
  `rating_cnt` bigint(20) NOT NULL,
  `votes_sum` bigint(20) NOT NULL,
  `votes_cnt` bigint(20) NOT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bwbps_images`
--

LOCK TABLES `wp_bwbps_images` WRITE;
/*!40000 ALTER TABLE `wp_bwbps_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bwbps_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bwbps_layouts`
--

DROP TABLE IF EXISTS `wp_bwbps_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bwbps_layouts` (
  `layout_id` int(11) NOT NULL,
  `layout_name` varchar(30) NOT NULL,
  `layout_type` int(11) NOT NULL,
  `layout` longtext NOT NULL,
  `alt_layout` longtext NOT NULL,
  `wrapper` longtext NOT NULL,
  `cells_perrow` int(11) NOT NULL,
  `css` longtext NOT NULL,
  `pagination_class` varchar(255) NOT NULL,
  `lists` varchar(255) NOT NULL,
  `post_type` varchar(20) NOT NULL,
  `fields_used` longtext NOT NULL,
  `footer_layout` longtext NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bwbps_layouts`
--

LOCK TABLES `wp_bwbps_layouts` WRITE;
/*!40000 ALTER TABLE `wp_bwbps_layouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bwbps_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bwbps_lookup`
--

DROP TABLE IF EXISTS `wp_bwbps_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bwbps_lookup` (
  `id` int(11) NOT NULL,
  `field_id` int(11) DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `seq` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bwbps_lookup`
--

LOCK TABLES `wp_bwbps_lookup` WRITE;
/*!40000 ALTER TABLE `wp_bwbps_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bwbps_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bwbps_params`
--

DROP TABLE IF EXISTS `wp_bwbps_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bwbps_params` (
  `id` bigint(20) NOT NULL,
  `param_group` varchar(20) NOT NULL,
  `param` varchar(100) NOT NULL,
  `num_value` double DEFAULT NULL,
  `text_value` varchar(255) NOT NULL,
  `user_ip` varchar(30) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bwbps_params`
--

LOCK TABLES `wp_bwbps_params` WRITE;
/*!40000 ALTER TABLE `wp_bwbps_params` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bwbps_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bwbps_ratingssummary`
--

DROP TABLE IF EXISTS `wp_bwbps_ratingssummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bwbps_ratingssummary` (
  `rating_id` bigint(20) NOT NULL,
  `image_id` bigint(20) NOT NULL,
  `gallery_id` bigint(20) DEFAULT NULL,
  `poll_id` bigint(20) DEFAULT NULL,
  `avg_rating` double NOT NULL,
  `rating_cnt` bigint(20) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`rating_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bwbps_ratingssummary`
--

LOCK TABLES `wp_bwbps_ratingssummary` WRITE;
/*!40000 ALTER TABLE `wp_bwbps_ratingssummary` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bwbps_ratingssummary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) NOT NULL,
  `comment_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` longtext NOT NULL,
  PRIMARY KEY (`meta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) NOT NULL,
  `comment_post_ID` bigint(20) NOT NULL,
  `comment_author` longtext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL,
  `comment_author_url` varchar(200) NOT NULL,
  `comment_author_IP` varchar(100) NOT NULL,
  `comment_date` datetime NOT NULL,
  `comment_date_gmt` datetime NOT NULL,
  `comment_content` longtext NOT NULL,
  `comment_karma` int(11) NOT NULL,
  `comment_approved` varchar(20) NOT NULL,
  `comment_agent` varchar(255) NOT NULL,
  `comment_type` varchar(20) NOT NULL,
  `comment_parent` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`comment_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_gigpress_artists`
--

DROP TABLE IF EXISTS `wp_gigpress_artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_gigpress_artists` (
  `artist_id` int(11) NOT NULL,
  `artist_name` varchar(255) NOT NULL,
  `artist_order` int(11) DEFAULT NULL,
  `artist_alpha` varchar(255) NOT NULL,
  `artist_url` varchar(255) NOT NULL,
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_gigpress_artists`
--

LOCK TABLES `wp_gigpress_artists` WRITE;
/*!40000 ALTER TABLE `wp_gigpress_artists` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_gigpress_artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_gigpress_shows`
--

DROP TABLE IF EXISTS `wp_gigpress_shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_gigpress_shows` (
  `show_id` int(11) NOT NULL,
  `show_artist_id` int(11) NOT NULL,
  `show_venue_id` int(11) NOT NULL,
  `show_tour_id` int(11) DEFAULT NULL,
  `show_date` date NOT NULL,
  `show_multi` int(11) DEFAULT NULL,
  `show_time` longtext NOT NULL,
  `show_expire` date NOT NULL,
  `show_price` varchar(255) NOT NULL,
  `show_tix_url` varchar(255) NOT NULL,
  `show_tix_phone` varchar(255) NOT NULL,
  `show_ages` varchar(255) NOT NULL,
  `show_notes` longtext NOT NULL,
  `show_related` bigint(20) DEFAULT NULL,
  `show_status` varchar(32) NOT NULL,
  `show_tour_restore` int(11) DEFAULT NULL,
  `show_address` varchar(255) NOT NULL,
  `show_locale` varchar(255) NOT NULL,
  `show_country` varchar(2) NOT NULL,
  `show_venue` varchar(255) NOT NULL,
  `show_venue_url` varchar(255) NOT NULL,
  `show_venue_phone` varchar(255) NOT NULL,
  `show_external_url` varchar(255) NOT NULL,
  PRIMARY KEY (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_gigpress_shows`
--

LOCK TABLES `wp_gigpress_shows` WRITE;
/*!40000 ALTER TABLE `wp_gigpress_shows` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_gigpress_shows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_gigpress_tours`
--

DROP TABLE IF EXISTS `wp_gigpress_tours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_gigpress_tours` (
  `tour_id` int(11) NOT NULL,
  `tour_name` varchar(255) NOT NULL,
  `tour_status` varchar(32) NOT NULL,
  PRIMARY KEY (`tour_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_gigpress_tours`
--

LOCK TABLES `wp_gigpress_tours` WRITE;
/*!40000 ALTER TABLE `wp_gigpress_tours` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_gigpress_tours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_gigpress_venues`
--

DROP TABLE IF EXISTS `wp_gigpress_venues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_gigpress_venues` (
  `venue_id` int(11) NOT NULL,
  `venue_name` varchar(255) NOT NULL,
  `venue_address` varchar(255) NOT NULL,
  `venue_city` varchar(255) NOT NULL,
  `venue_country` varchar(2) NOT NULL,
  `venue_url` varchar(255) NOT NULL,
  `venue_phone` varchar(255) NOT NULL,
  `venue_state` varchar(255) NOT NULL,
  `venue_postal_code` varchar(32) NOT NULL,
  PRIMARY KEY (`venue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_gigpress_venues`
--

LOCK TABLES `wp_gigpress_venues` WRITE;
/*!40000 ALTER TABLE `wp_gigpress_venues` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_gigpress_venues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) NOT NULL,
  `link_url` varchar(255) NOT NULL,
  `link_name` varchar(255) NOT NULL,
  `link_image` varchar(255) NOT NULL,
  `link_target` varchar(25) NOT NULL,
  `link_description` varchar(255) NOT NULL,
  `link_visible` varchar(20) NOT NULL,
  `link_owner` bigint(20) NOT NULL,
  `link_rating` int(11) NOT NULL,
  `link_updated` datetime NOT NULL,
  `link_rel` varchar(255) NOT NULL,
  `link_notes` longtext NOT NULL,
  `link_rss` varchar(255) NOT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_ngg_album`
--

DROP TABLE IF EXISTS `wp_ngg_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_ngg_album` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `previewpic` bigint(20) NOT NULL,
  `albumdesc` longtext NOT NULL,
  `sortorder` longtext NOT NULL,
  `pageid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_ngg_album`
--

LOCK TABLES `wp_ngg_album` WRITE;
/*!40000 ALTER TABLE `wp_ngg_album` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_ngg_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_ngg_gallery`
--

DROP TABLE IF EXISTS `wp_ngg_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_ngg_gallery` (
  `gid` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `path` longtext NOT NULL,
  `title` longtext NOT NULL,
  `galdesc` longtext NOT NULL,
  `pageid` bigint(20) NOT NULL,
  `previewpic` bigint(20) NOT NULL,
  `author` bigint(20) NOT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_ngg_gallery`
--

LOCK TABLES `wp_ngg_gallery` WRITE;
/*!40000 ALTER TABLE `wp_ngg_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_ngg_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_ngg_pictures`
--

DROP TABLE IF EXISTS `wp_ngg_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_ngg_pictures` (
  `pid` bigint(20) NOT NULL,
  `image_slug` varchar(255) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `galleryid` bigint(20) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `alttext` longtext NOT NULL,
  `imagedate` datetime NOT NULL,
  `exclude` int(11) DEFAULT NULL,
  `sortorder` bigint(20) NOT NULL,
  `meta_data` longtext NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_ngg_pictures`
--

LOCK TABLES `wp_ngg_pictures` WRITE;
/*!40000 ALTER TABLE `wp_ngg_pictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_ngg_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_nggcf_field_values`
--

DROP TABLE IF EXISTS `wp_nggcf_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_nggcf_field_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` bigint(20) NOT NULL,
  `pid` bigint(20) NOT NULL,
  `fid` bigint(20) NOT NULL,
  `field_value` longtext NOT NULL,
  `ngg_type` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_nggcf_field_values`
--

LOCK TABLES `wp_nggcf_field_values` WRITE;
/*!40000 ALTER TABLE `wp_nggcf_field_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_nggcf_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_nggcf_fields`
--

DROP TABLE IF EXISTS `wp_nggcf_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_nggcf_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` bigint(20) NOT NULL,
  `field_name` longtext NOT NULL,
  `field_type` longtext NOT NULL,
  `ngg_type` int(11) NOT NULL,
  `drop_options` longtext NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_nggcf_fields`
--

LOCK TABLES `wp_nggcf_fields` WRITE;
/*!40000 ALTER TABLE `wp_nggcf_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_nggcf_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_nggcf_fields_link`
--

DROP TABLE IF EXISTS `wp_nggcf_fields_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_nggcf_fields_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` bigint(20) NOT NULL,
  `field_id` bigint(20) NOT NULL,
  `gid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_nggcf_fields_link`
--

LOCK TABLES `wp_nggcf_fields_link` WRITE;
/*!40000 ALTER TABLE `wp_nggcf_fields_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_nggcf_fields_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) NOT NULL,
  `option_name` varchar(64) NOT NULL,
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL,
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` longtext NOT NULL,
  PRIMARY KEY (`meta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) NOT NULL,
  `post_author` bigint(20) NOT NULL,
  `post_date` datetime NOT NULL,
  `post_date_gmt` datetime NOT NULL,
  `post_content` longtext NOT NULL,
  `post_title` longtext NOT NULL,
  `post_excerpt` longtext NOT NULL,
  `post_status` varchar(20) NOT NULL,
  `comment_status` varchar(20) NOT NULL,
  `ping_status` varchar(20) NOT NULL,
  `post_password` varchar(20) NOT NULL,
  `post_name` varchar(200) NOT NULL,
  `to_ping` longtext NOT NULL,
  `pinged` longtext NOT NULL,
  `post_modified` datetime NOT NULL,
  `post_modified_gmt` datetime NOT NULL,
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) NOT NULL,
  `guid` varchar(255) NOT NULL,
  `menu_order` int(11) NOT NULL,
  `post_type` varchar(20) NOT NULL,
  `post_mime_type` varchar(100) NOT NULL,
  `comment_count` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_randomtext`
--

DROP TABLE IF EXISTS `wp_randomtext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_randomtext` (
  `randomtext_id` int(11) NOT NULL,
  `category` varchar(32) NOT NULL,
  `text` longtext NOT NULL,
  `visible` varchar(3) NOT NULL,
  `user_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`randomtext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_randomtext`
--

LOCK TABLES `wp_randomtext` WRITE;
/*!40000 ALTER TABLE `wp_randomtext` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_randomtext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) NOT NULL,
  `term_taxonomy_id` bigint(20) NOT NULL,
  `term_order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) NOT NULL,
  `term_id` bigint(20) NOT NULL,
  `taxonomy` varchar(32) NOT NULL,
  `description` longtext NOT NULL,
  `parent` bigint(20) NOT NULL,
  `count` bigint(20) NOT NULL,
  PRIMARY KEY (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `term_group` bigint(20) NOT NULL,
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` longtext NOT NULL,
  PRIMARY KEY (`umeta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) NOT NULL,
  `user_login` varchar(60) NOT NULL,
  `user_pass` varchar(64) NOT NULL,
  `user_nicename` varchar(50) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_url` varchar(100) NOT NULL,
  `user_registered` datetime NOT NULL,
  `user_activation_key` varchar(60) NOT NULL,
  `user_status` int(11) NOT NULL,
  `display_name` varchar(250) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wpb2d_excluded_files`
--

DROP TABLE IF EXISTS `wp_wpb2d_excluded_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_wpb2d_excluded_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(255) NOT NULL,
  `isdir` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wpb2d_excluded_files`
--

LOCK TABLES `wp_wpb2d_excluded_files` WRITE;
/*!40000 ALTER TABLE `wp_wpb2d_excluded_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wpb2d_excluded_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wpb2d_options`
--

DROP TABLE IF EXISTS `wp_wpb2d_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_wpb2d_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wpb2d_options`
--

LOCK TABLES `wp_wpb2d_options` WRITE;
/*!40000 ALTER TABLE `wp_wpb2d_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wpb2d_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wpb2d_premium_extensions`
--

DROP TABLE IF EXISTS `wp_wpb2d_premium_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_wpb2d_premium_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wpb2d_premium_extensions`
--

LOCK TABLES `wp_wpb2d_premium_extensions` WRITE;
/*!40000 ALTER TABLE `wp_wpb2d_premium_extensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wpb2d_premium_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wpb2d_processed_files`
--

DROP TABLE IF EXISTS `wp_wpb2d_processed_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_wpb2d_processed_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(255) NOT NULL,
  `offset` int(11) NOT NULL,
  `uploadid` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wpb2d_processed_files`
--

LOCK TABLES `wp_wpb2d_processed_files` WRITE;
/*!40000 ALTER TABLE `wp_wpb2d_processed_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wpb2d_processed_files` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-04 15:28:23
