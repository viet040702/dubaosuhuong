-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: localhost    Database: job-management
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `post_data`
--
use `job-management`;

DROP TABLE IF EXISTS `post_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` mediumtext,
  `time` mediumtext,
  `city` mediumtext,
  `age` mediumtext,
  `sexual` mediumtext,
  `probationTime` mediumtext,
  `workWay` mediumtext,
  `right` mediumtext,
  `company` mediumtext,
  `job` mediumtext,
  `place` mediumtext,
  `numberEmployees` varchar(255) DEFAULT NULL,
  `experience` mediumtext,
  `level` mediumtext,
  `salary` mediumtext,
  `education` mediumtext,
  `description` mediumtext,
  `requirements` mediumtext,
  `deadline` mediumtext,
  `images` mediumtext,
  `link` mediumtext,
  `crawl_data_id` int unsigned DEFAULT NULL,
  `type` enum('facebook','linkedin','topdev','itviec','post') NOT NULL,
  `contact` mediumtext,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_data_crawl_data_id_foreign` (`crawl_data_id`),
  KEY `post_data_user_id_foreign` (`user_id`),
  CONSTRAINT `post_data_crawl_data_id_foreign` FOREIGN KEY (`crawl_data_id`) REFERENCES `crawl_data` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_data_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `post_data` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_data`
--

LOCK TABLES `post_data` WRITE;
/*!40000 ALTER TABLE `post_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-22 22:27:12
