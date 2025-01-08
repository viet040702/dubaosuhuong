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
-- Table structure for table `major_category`
--
use `job-management`;

DROP TABLE IF EXISTS `major_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `major_category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major_category`
--

LOCK TABLES `major_category` WRITE;
/*!40000 ALTER TABLE `major_category` DISABLE KEYS */;
INSERT INTO `major_category` VALUES (1,'Y học','2024-05-12 10:45:47','2024-05-12 10:45:47'),(2,'Quản trị','2024-05-12 10:45:47','2024-05-12 10:45:47'),(3,'Công nghệ thông tin','2024-05-12 10:45:47','2024-05-12 10:45:47'),(4,'Sư phạm','2024-05-12 10:45:47','2024-05-12 10:45:47'),(5,'Ngôn ngữ Anh','2024-05-12 10:45:47','2024-05-12 10:45:47'),(6,'Ngôn ngữ Nga','2024-05-12 10:45:47','2024-05-12 10:45:47'),(7,'Ngôn ngữ Pháp','2024-05-12 10:45:47','2024-05-12 10:45:47'),(8,'Ngôn ngữ Trung Quốc','2024-05-12 10:45:47','2024-05-12 10:45:47'),(9,'Ngôn ngữ Nhật','2024-05-12 10:45:47','2024-05-12 10:45:47'),(10,'Ngôn ngữ Hàn Quốc','2024-05-12 10:45:47','2024-05-12 10:45:47'),(11,'Ngôn ngữ Thái Lan','2024-05-12 10:45:47','2024-05-12 10:45:47'),(12,'Khoa học xã hội','2024-05-12 10:45:47','2024-05-12 10:45:47'),(13,'Tài chính','2024-05-12 10:45:47','2024-05-12 10:45:47'),(14,'Luật','2024-05-12 10:45:47','2024-05-12 10:45:47'),(15,'Công nghệ sinh học','2024-05-12 10:45:47','2024-05-12 10:45:47'),(16,'Xây dựng','2024-05-12 10:45:47','2024-05-12 10:45:47'),(17,'Du lịch','2024-05-12 10:45:47','2024-05-12 10:45:47'),(18,'Khoa học y sinh','2024-05-12 10:45:47','2024-05-12 10:45:47'),(19,'Công nghệ nano','2024-05-12 10:45:47','2024-05-12 10:45:47'),(20,'Maketing','2024-05-12 10:45:47','2024-05-12 10:45:47'),(21,'Kế toán','2024-05-12 10:45:47','2024-05-12 10:45:47'),(22,'Khoa học dữ liệu','2024-05-12 10:45:47','2024-05-12 10:45:47'),(23,'Kinh tế','2024-05-12 10:45:47','2024-05-12 10:45:47'),(24,'Chương trình chính quy quốc tế','2024-05-12 10:45:47','2024-05-12 10:45:47'),(25,'Hóa học','2024-05-12 10:45:47','2024-05-12 10:45:47'),(26,'Báo chí','2024-05-12 10:45:47','2024-05-12 10:45:47'),(27,'Xã hội','2024-05-12 10:45:47','2024-05-12 10:45:47'),(28,'Quản lý tài nguyên và môi trường','2024-05-12 10:45:47','2024-05-12 10:45:47'),(29,'Tâm lý học','2024-05-12 10:45:47','2024-05-12 10:45:47'),(30,'Cơ khí','2024-05-12 10:45:47','2024-05-12 10:45:47'),(31,'Cơ điện tử','2024-05-12 10:45:47','2024-05-12 10:45:47'),(32,'Kỹ thuật ô tô','2024-05-12 10:45:47','2024-05-12 10:45:47'),(33,'Kỹ thuật nhiệt','2024-05-12 10:45:47','2024-05-12 10:45:47'),(34,'Điện tử viễn thông','2024-05-12 10:45:47','2024-05-12 10:45:47'),(35,'Tự động hóa','2024-05-12 10:45:47','2024-05-12 10:45:47'),(36,'Môi trường','2024-05-12 10:45:47','2024-05-12 10:45:47'),(37,'Kỹ thuật thực phẩm','2024-05-12 10:45:47','2024-05-12 10:45:47'),(38,'Kiến trúc','2024-05-12 10:45:47','2024-05-12 10:45:47'),(39,'Chế tạo máy','2024-05-12 10:45:47','2024-05-12 10:45:47'),(40,'Dầu khí','2024-05-12 10:45:47','2024-05-12 10:45:47'),(41,'Kỹ thuật tàu thủy','2024-05-12 10:45:47','2024-05-12 10:45:47'),(42,'Kỹ thuật điện','2024-05-12 10:45:47','2024-05-12 10:45:47'),(43,'Công nghệ thực phẩm','2024-05-12 10:45:47','2024-05-12 10:45:47'),(44,'Hệ thống công nghiệp','2024-05-12 10:45:47','2024-05-12 10:45:47'),(45,'Hệ thống nhúng','2024-05-12 10:45:47','2024-05-12 10:45:47'),(46,'Chương trình cử nhân chính quy quốc tế','2024-05-12 10:45:47','2024-05-12 10:45:47'),(47,'Y sinh','2024-05-12 10:45:47','2024-05-12 10:45:47'),(48,'Vật lý','2024-05-12 10:45:47','2024-05-12 10:45:47'),(49,'Unknown','2024-05-22 19:48:52','2024-05-22 19:48:52');
/*!40000 ALTER TABLE `major_category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-22 22:27:13
