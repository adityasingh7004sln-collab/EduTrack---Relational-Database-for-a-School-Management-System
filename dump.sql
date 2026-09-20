-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: aryan
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `zipcode` int NOT NULL,
  `city` varchar(25) NOT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(25) NOT NULL DEFAULT 'india',
  `post` varchar(25) DEFAULT 'default',
  PRIMARY KEY (`zipcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (201301,'noida','up','india','HAMZA DAK'),(209801,'unnao','up','india','HAMZA DAK'),(211001,'prayagraj','up','india','HAMZA DAK'),(221001,'varanasi','up','india','HAMZA DAK'),(222001,'jaunpur','up','india','HAMZA DAK'),(222302,'lambhua','up','india','HAMZA DAK'),(224001,'faizabad','up','india','HAMZA DAK'),(224122,'ambedkar nagar','up','india','HAMZA DAK'),(225001,'barabanki','up','india','HAMZA DAK'),(226001,'lucknow','up','india','HAMZA DAK'),(227405,'amethi','up','india','HAMZA DAK'),(227409,'gauriganj','up','india','HAMZA DAK'),(228145,'kadipur','up','india','HAMZA DAK'),(228151,'kurebhar','up','india','HAMZA DAK'),(229001,'raebareli','up','india','HAMZA DAK'),(230001,'pratapgarh','up','india','HAMZA DAK'),(241001,'hardoi','up','india','HAMZA DAK'),(243001,'bareilly','up','india','HAMZA DAK'),(250001,'meerut','up','india','HAMZA DAK'),(261001,'sitapur','up','india','HAMZA DAK'),(262701,'lakhimpur kheri','up','india','HAMZA DAK'),(271002,'gonda','up','india','HAMZA DAK'),(272001,'basti','up','india','HAMZA DAK'),(273001,'gorakhpur','up','india','HAMZA DAK'),(275101,'mau','up','india','HAMZA DAK'),(276001,'azamgarh','up','india','HAMZA DAK'),(277001,'ballia','up','india','HAMZA DAK'),(282001,'agra','up','india','HAMZA DAK');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `session_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `status` enum('absent','present') NOT NULL,
  KEY `session_id` (`session_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `session` (`session_id`),
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment` (
  `enrollment_id` int NOT NULL,
  `session_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `status` enum('passes','failed') DEFAULT NULL,
  PRIMARY KEY (`enrollment_id`),
  KEY `session_id` (`session_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `session` (`session_id`),
  CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade` (
  `enrollment_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `exam_type` varchar(25) NOT NULL,
  `marks` int DEFAULT NULL,
  `status` enum('absent','present') NOT NULL,
  KEY `enrollment_id` (`enrollment_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollment` (`enrollment_id`),
  CONSTRAINT `grade_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `session_id` int NOT NULL,
  `year_start` date NOT NULL,
  `year_end` date NOT NULL,
  `class_no` int DEFAULT NULL,
  `section` enum('a','b','c') DEFAULT 'a',
  `class_teacher_id` int DEFAULT NULL,
  `room_no` char(5) NOT NULL,
  PRIMARY KEY (`session_id`),
  UNIQUE KEY `year_start` (`year_start`,`year_end`,`class_no`,`section`),
  KEY `class_teacher_id` (`class_teacher_id`),
  CONSTRAINT `session_ibfk_1` FOREIGN KEY (`class_teacher_id`) REFERENCES `teacher` (`teacher_id`),
  CONSTRAINT `session_chk_1` CHECK ((`class_no` between 1 and 12))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `sid_id` int NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `middle_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `dob` date NOT NULL,
  `doa` date DEFAULT '2026-04-01',
  `zip_code` int DEFAULT NULL,
  `dol` date DEFAULT NULL,
  `guardian_contact` int DEFAULT NULL,
  `guardian_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`sid_id`),
  KEY `zip_code` (`zip_code`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`zip_code`) REFERENCES `address` (`zipcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'arun','kumar',NULL,'2009-09-23','2026-04-01',201301,NULL,956437569,'raju'),(2,'jayat','kumar','sahu','2009-11-03','2026-04-01',211001,NULL,94150465,'ashwani'),(3,'diksha','null','jaisawal','2009-07-23','2026-04-01',222001,NULL,91467937,'ramji jaisawal'),(4,'vinay ','null','kapoor','2009-03-09','2026-04-01',221001,NULL,91509537,'raji kalu'),(5,'vani','kumari','null','2009-04-13','2026-04-01',201301,NULL,91467932,'krish kapoor'),(6,'sara','ali','khan','2009-03-12','2026-04-01',228145,NULL,97860004,'saif ali'),(7,'naga','null','arjun','2009-08-16','2026-04-01',228151,NULL,95390232,'naga chaitan'),(8,'jayat','kumar','sahu','2009-11-03','2026-04-01',211001,NULL,94150465,'ashwani'),(9,'diksha','null','jaisawal','2009-07-23','2026-04-01',222001,NULL,91467937,'ramji jaisawal'),(10,'vinay ','null','kapoor','2009-03-09','2026-04-01',221001,NULL,91509537,'raji kalu'),(11,'vani','kumari','null','2009-04-13','2026-04-01',201301,NULL,91467932,'krish kapoor'),(12,'sara','ali','khan','2009-03-12','2026-04-01',228145,NULL,97860004,'saif ali'),(13,'naga','null','arjun','2009-08-16','2026-04-01',228151,NULL,95390232,'naga chaitan');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `subject_id` int NOT NULL,
  `sub_name` varchar(25) NOT NULL,
  `class_level` varchar(35) NOT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `teacher_id` int NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `middle_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `doj` date DEFAULT NULL,
  `dol` date DEFAULT NULL,
  `govt_id` bigint NOT NULL,
  `degree` varchar(25) NOT NULL,
  `post` varchar(25) NOT NULL,
  `zipcode` int NOT NULL,
  PRIMARY KEY (`teacher_id`),
  UNIQUE KEY `govt_id` (`govt_id`),
  KEY `zipcode` (`zipcode`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`zipcode`) REFERENCES `address` (`zipcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (122,'ashwani','kumar','dubey','1974-08-10','2014-08-07',NULL,2280685775789,'b.ed|','PGT',227409),(123,'amit',NULL,'singh','1979-10-14','2017-10-07',NULL,22806857897789,'b.ed|','PGT',227409),(124,'om','prakash','verma','1982-03-14','2014-09-09',NULL,2280685775908,'b.ed|','PGT',227409);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaches`
--

DROP TABLE IF EXISTS `teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teaches` (
  `session_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  `subject_id` int NOT NULL,
  KEY `session_id` (`session_id`),
  KEY `subject_id` (`subject_id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `session` (`session_id`),
  CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  CONSTRAINT `teaches_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaches`
--

LOCK TABLES `teaches` WRITE;
/*!40000 ALTER TABLE `teaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `teaches` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-05 14:08:34
