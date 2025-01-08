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
-- Table structure for table `users`
--
USE `job-management`;

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT 'avatar',
  `background` varchar(255) DEFAULT 'background',
  `age` int DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `isVerified` tinyint(1) DEFAULT '0',
  `isTwoFactor` tinyint(1) DEFAULT '0',
  `smsCode` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(10) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `save_post` mediumtext,
  PRIMARY KEY (`id`),
  KEY `users_status_foreign` (`status`),
  CONSTRAINT `users_status_foreign` FOREIGN KEY (`status`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('23','HUỲNH VĂN THẠNH1','vth1@yopmail.com','422d91062a801c533bd7e51f99144043376b875f04dc504b42eb1a0b36bb35aa24658e7e058760317c7b07bd39007288d6b5ed80adc4e02f2c66481ee14c7027','user','{\"public_id\":\"\",\"url\":\"https://res.cloudinary.com/vth20/image/upload/fl_preserve_transparency/v1658138187/dbhvs4ankmsdsdhkszlp.jpg?_s=public-apps\"}','background',NULL,'2024-05-29',1,0,NULL,'2024-05-17 09:43:43','2024-05-17 09:43:43',NULL,'0944095157','[\"701\",\"922\"]'),('2eb4a8fc-e615-4bc9-8175-0baecf6ba3b7','huynh van thanh','thanhtest@yopmail.com','b87fa0a0a8393ee01e433011d14fe6e732c7ad90ae9ac140117e8c2b8e26a46ba297eed9d2661d22f5afde22c43f511f06fde11c01919ce7c753b47fdf6d1a6d','user','{\"public_id\":\"\",\"url\":\"https://res.cloudinary.com/vth20/image/upload/fl_preserve_transparency/v1658138187/dbhvs4ankmsdsdhkszlp.jpg?_s=public-apps\"}','background',NULL,NULL,0,0,NULL,'2024-06-17 14:18:19','2024-06-17 14:18:19',NULL,NULL,NULL),('33','HUỲNH VĂN THẠNH1','vth1@yopmail.com','422d91062a801c533bd7e51f99144043376b875f04dc504b42eb1a0b36bb35aa24658e7e058760317c7b07bd39007288d6b5ed80adc4e02f2c66481ee14c7027','user','{\"public_id\":\"\",\"url\":\"https://res.cloudinary.com/vth20/image/upload/fl_preserve_transparency/v1658138187/dbhvs4ankmsdsdhkszlp.jpg?_s=public-apps\"}','background',NULL,'2024-05-29',1,0,NULL,'2024-05-17 09:43:43','2024-05-17 09:43:43',NULL,'0944095157','[\"701\",\"922\"]'),('3333','HUỲNH VĂN THẠNH1','vth1@yopmail.com','422d91062a801c533bd7e51f99144043376b875f04dc504b42eb1a0b36bb35aa24658e7e058760317c7b07bd39007288d6b5ed80adc4e02f2c66481ee14c7027','user','{\"public_id\":\"\",\"url\":\"https://res.cloudinary.com/vth20/image/upload/fl_preserve_transparency/v1658138187/dbhvs4ankmsdsdhkszlp.jpg?_s=public-apps\"}','background',NULL,'2024-05-29',1,0,NULL,'2024-05-17 09:43:43','2024-05-17 09:43:43',NULL,'0944095157','[\"701\",\"922\"]'),('4da042f6-15a0-45aa-ba88-bd1b6fccef27','ee11','vt2wh@yopmail.com','b87fa0a0a8393ee01e433011d14fe6e732c7ad90ae9ac140117e8c2b8e26a46ba297eed9d2661d22f5afde22c43f511f06fde11c01919ce7c753b47fdf6d1a6d','user','{\"public_id\":\"\",\"url\":\"https://res.cloudinary.com/vth20/image/upload/fl_preserve_transparency/v1658138187/dbhvs4ankmsdsdhkszlp.jpg?_s=public-apps\"}','background',NULL,NULL,0,0,NULL,'2024-04-17 10:12:50','2024-05-17 10:12:50',NULL,NULL,NULL),('95ed3457-cd37-463c-be2c-61d575d2f1a3','huynh van thanh','thanhtest1@yopmail.com','b87fa0a0a8393ee01e433011d14fe6e732c7ad90ae9ac140117e8c2b8e26a46ba297eed9d2661d22f5afde22c43f511f06fde11c01919ce7c753b47fdf6d1a6d','user','{\"public_id\":\"\",\"url\":\"https://res.cloudinary.com/vth20/image/upload/fl_preserve_transparency/v1658138187/dbhvs4ankmsdsdhkszlp.jpg?_s=public-apps\"}','background',NULL,NULL,0,0,NULL,'2024-06-17 14:40:43','2024-06-17 14:40:43',NULL,NULL,NULL),('admin_id','admin','admin@yopmail.com','b87fa0a0a8393ee01e433011d14fe6e732c7ad90ae9ac140117e8c2b8e26a46ba297eed9d2661d22f5afde22c43f511f06fde11c01919ce7c753b47fdf6d1a6d','admin','{\"public_id\":\"\",\"url\":\"https://res.cloudinary.com/vth20/image/upload/fl_preserve_transparency/v1658138187/dbhvs4ankmsdsdhkszlp.jpg?_s=public-apps\"}','background',25,NULL,1,0,NULL,'2024-05-12 10:45:47','2024-05-12 10:45:47',NULL,NULL,NULL),('b8819b29-0728-414c-a14e-63e17083663a','huynh van thanh','vv@yopmail.com','b87fa0a0a8393ee01e433011d14fe6e732c7ad90ae9ac140117e8c2b8e26a46ba297eed9d2661d22f5afde22c43f511f06fde11c01919ce7c753b47fdf6d1a6d','user','{\"public_id\":\"\",\"url\":\"https://res.cloudinary.com/vth20/image/upload/fl_preserve_transparency/v1658138187/dbhvs4ankmsdsdhkszlp.jpg?_s=public-apps\"}','background',NULL,NULL,0,0,NULL,'2024-06-17 14:53:00','2024-06-17 14:53:00',NULL,NULL,NULL),('cc2de178-dc6a-4a11-a4f8-c7a4202f3ba8','huynh van thanh','vv@yopmail.com','b87fa0a0a8393ee01e433011d14fe6e732c7ad90ae9ac140117e8c2b8e26a46ba297eed9d2661d22f5afde22c43f511f06fde11c01919ce7c753b47fdf6d1a6d','user','{\"public_id\":\"\",\"url\":\"https://res.cloudinary.com/vth20/image/upload/fl_preserve_transparency/v1658138187/dbhvs4ankmsdsdhkszlp.jpg?_s=public-apps\"}','background',NULL,NULL,0,0,NULL,'2024-06-17 14:52:53','2024-06-17 14:52:53',NULL,NULL,NULL),('company_id','BAP JSC .CO','bap-sofware@yopmail.com','b87fa0a0a8393ee01e433011d14fe6e732c7ad90ae9ac140117e8c2b8e26a46ba297eed9d2661d22f5afde22c43f511f06fde11c01919ce7c753b47fdf6d1a6d','user','{\"public_id\":\"\",\"url\":\"https://res.cloudinary.com/vth20/image/upload/fl_preserve_transparency/v1658138187/dbhvs4ankmsdsdhkszlp.jpg?_s=public-apps\"}','background',NULL,NULL,1,0,NULL,'2024-04-12 10:45:47','2024-05-12 10:45:47',NULL,NULL,NULL),('dc39cca8-fc98-4439-b51e-deedb5e8fd26','huynh van thanh','thanhtest@yopmail.com','b87fa0a0a8393ee01e433011d14fe6e732c7ad90ae9ac140117e8c2b8e26a46ba297eed9d2661d22f5afde22c43f511f06fde11c01919ce7c753b47fdf6d1a6d','user','{\"public_id\":\"\",\"url\":\"https://res.cloudinary.com/vth20/image/upload/fl_preserve_transparency/v1658138187/dbhvs4ankmsdsdhkszlp.jpg?_s=public-apps\"}','background',NULL,NULL,1,0,NULL,'2024-06-17 14:18:23','2024-06-17 14:18:23',NULL,NULL,NULL),('e7fc7baa-f6c7-4cb1-9b86-d36b8b7110c0','ee11','vtwh@yopmail.com','b87fa0a0a8393ee01e433011d14fe6e732c7ad90ae9ac140117e8c2b8e26a46ba297eed9d2661d22f5afde22c43f511f06fde11c01919ce7c753b47fdf6d1a6d','user','{\"public_id\":\"\",\"url\":\"https://res.cloudinary.com/vth20/image/upload/fl_preserve_transparency/v1658138187/dbhvs4ankmsdsdhkszlp.jpg?_s=public-apps\"}','background',NULL,NULL,0,0,NULL,'2024-05-17 09:55:18','2024-05-17 09:55:18',NULL,NULL,NULL),('fb7db1af-64e1-4344-a95e-d482cbb120b','HUỲNH VĂN THẠNH1','vth1@yopmail.com','422d91062a801c533bd7e51f99144043376b875f04dc504b42eb1a0b36bb35aa24658e7e058760317c7b07bd39007288d6b5ed80adc4e02f2c66481ee14c7027','user','{\"public_id\":\"\",\"url\":\"https://res.cloudinary.com/vth20/image/upload/fl_preserve_transparency/v1658138187/dbhvs4ankmsdsdhkszlp.jpg?_s=public-apps\"}','background',NULL,'2024-05-29',1,0,NULL,'2024-03-17 09:43:43','2024-05-17 09:43:43',NULL,'0944095157','[\"701\",\"922\"]'),('fb7db1af-64e1-4344-a95e-d482cbb1560b','HUỲNH VĂN THẠNH1','vth1@yopmail.com','422d91062a801c533bd7e51f99144043376b875f04dc504b42eb1a0b36bb35aa24658e7e058760317c7b07bd39007288d6b5ed80adc4e02f2c66481ee14c7027','user','{\"public_id\":\"\",\"url\":\"https://res.cloudinary.com/vth20/image/upload/fl_preserve_transparency/v1658138187/dbhvs4ankmsdsdhkszlp.jpg?_s=public-apps\"}','background',NULL,'2024-05-29',1,0,NULL,'2024-05-17 09:43:43','2024-05-17 09:43:43',NULL,'0944095157','[\"701\",\"922\"]'),('fb7db1af-64e1-4344-a95e-d482cbb1560f','HUỲNH VĂN THẠNH','vth@yopmail.com','6f24f7c95d7c9b7de2cabdbfe99196ba8df6573e9f86ab020ca13fd350d1ac1616a7b41f3cda49d9eb6245acd4f086e5f4481ce58db4b2f3923702c4f82f2af5','user','{\"public_id\":\"\",\"url\":\"https://res.cloudinary.com/vth20/image/upload/fl_preserve_transparency/v1658138187/dbhvs4ankmsdsdhkszlp.jpg?_s=public-apps\"}','background',NULL,'2024-05-29',1,0,NULL,'2024-03-17 09:43:43','2024-05-17 09:43:43',NULL,'0944095157','[\"701\",\"922\"]'),('fb7db1af-64e12-4344-a95e-d482cbb1560b','HUỲNH VĂN THẠNH1','vth1@yopmail.com','422d91062a801c533bd7e51f99144043376b875f04dc504b42eb1a0b36bb35aa24658e7e058760317c7b07bd39007288d6b5ed80adc4e02f2c66481ee14c7027','user','{\"public_id\":\"\",\"url\":\"https://res.cloudinary.com/vth20/image/upload/fl_preserve_transparency/v1658138187/dbhvs4ankmsdsdhkszlp.jpg?_s=public-apps\"}','background',NULL,'2024-05-29',1,0,NULL,'2024-05-17 09:43:43','2024-05-17 09:43:43',NULL,'0944095157','[\"701\",\"922\"]'),('user_id','user','user-carreerconnect@yopmail.com','b87fa0a0a8393ee01e433011d14fe6e732c7ad90ae9ac140117e8c2b8e26a46ba297eed9d2661d22f5afde22c43f511f06fde11c01919ce7c753b47fdf6d1a6d','user','{\"public_id\":\"\",\"url\":\"https://res.cloudinary.com/vth20/image/upload/fl_preserve_transparency/v1658138187/dbhvs4ankmsdsdhkszlp.jpg?_s=public-apps\"}','background',NULL,NULL,1,0,NULL,'2024-03-12 10:45:47','2024-05-12 10:45:47',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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
