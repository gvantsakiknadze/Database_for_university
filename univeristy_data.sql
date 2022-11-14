-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: data_university
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int NOT NULL,
  `course_number` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `id` int NOT NULL,
  `faculty_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'Economics'),(2,'Computer Science'),(3,'Law'),(4,'Mathematics');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty_courses`
--

DROP TABLE IF EXISTS `faculty_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty_courses` (
  `id` int NOT NULL,
  `faculty_id` int NOT NULL,
  `courses_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `faculty_id` (`faculty_id`),
  KEY `courses_id` (`courses_id`),
  CONSTRAINT `faculty_courses_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`),
  CONSTRAINT `faculty_courses_ibfk_2` FOREIGN KEY (`courses_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty_courses`
--

LOCK TABLES `faculty_courses` WRITE;
/*!40000 ALTER TABLE `faculty_courses` DISABLE KEYS */;
INSERT INTO `faculty_courses` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,1),(6,2,2),(7,2,3),(8,2,4),(9,3,1),(10,3,2),(11,3,3),(12,3,4),(13,4,1),(14,4,2),(15,4,3),(16,4,4);
/*!40000 ALTER TABLE `faculty_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturer` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `person_id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `second_address` varchar(255) DEFAULT NULL,
  `house_number` varchar(255) DEFAULT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(255) NOT NULL,
  `bank_account` varchar(255) NOT NULL,
  `rank_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer`
--

LOCK TABLES `lecturer` WRITE;
/*!40000 ALTER TABLE `lecturer` DISABLE KEYS */;
INSERT INTO `lecturer` VALUES (1,'John','Smith','0200398475','john@gmail.com','Tbilisi.Saburtalo str','Tbilisi.chavchavadze 21','10B','1970-12-20','Male','GE1002934582002','Assosiate Lecturer'),(2,'Mzia','Metreveli','0120039183','mzia@gmail.com','Tbilisi.Mitskevichi str.20','Tbilisi.TsinTsadze str. 78','22A','1967-03-01','Female','GE12938401234596','Assistant Professor'),(3,'Levan','Beridze','0100983472','levan23@gmail.com','Tbilisi.Vazha-pshavela str.20','Tbilisi.Chavchavadze str. 56','25A','1967-03-01','Male','GE12938341234596','Assistant Professor'),(4,'Mariam','Kharaishvili','0100293845','Mariam23@gmail.com','Tbilisi.Pekini 70',NULL,NULL,'1980-03-12','Female','GE12364810442456','Associate Lecturer');
/*!40000 ALTER TABLE `lecturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer_subject`
--

DROP TABLE IF EXISTS `lecturer_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturer_subject` (
  `id` int NOT NULL,
  `lecturer_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `subject_timetable_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lecturer_id` (`lecturer_id`),
  KEY `subject_id` (`subject_id`),
  KEY `subject_timetable_id` (`subject_timetable_id`),
  CONSTRAINT `lecturer_subject_ibfk_1` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturer` (`id`),
  CONSTRAINT `lecturer_subject_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  CONSTRAINT `lecturer_subject_ibfk_3` FOREIGN KEY (`subject_timetable_id`) REFERENCES `subject_timetable` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer_subject`
--

LOCK TABLES `lecturer_subject` WRITE;
/*!40000 ALTER TABLE `lecturer_subject` DISABLE KEYS */;
INSERT INTO `lecturer_subject` VALUES (1,1,1,1),(2,3,2,1),(3,4,3,2),(4,2,5,4),(5,4,4,3);
/*!40000 ALTER TABLE `lecturer_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `person_id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `second_address` varchar(255) DEFAULT NULL,
  `house_number` varchar(255) DEFAULT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(255) NOT NULL,
  `faculty_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `faculty_id` (`faculty_id`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'Elene','Makharadze','0100293746','elene@gmail.com','Tbilisi.Nutsubidze str',NULL,'40','1980-11-12','Female',1);
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `person_id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `second_address` varchar(255) DEFAULT NULL,
  `house_number` varchar(255) DEFAULT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(255) NOT NULL,
  `faculty_id` int NOT NULL,
  `courses_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `faculty_id` (`faculty_id`),
  KEY `courses_id` (`courses_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`courses_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Gvantsa','Kiknadze','0100293846','gvantsa27@gmail.com','Tbilisi.Chavchavadze. 55b',NULL,NULL,'1998-12-27','Female',2,1),(2,'Ketevan','Gugulashvili','0119385732','Ketevan@gmail.com','Tbilisi.Abashidze str',NULL,NULL,'1999-04-01','Female',1,3),(3,'Nino','Mukeria','0100293847','nino@gmail.com','Tbilisi.Nutsubidze str',NULL,'20','1999-05-12','Female',4,2),(4,'Sophio','Datunashvili','0100293845','sophio@gmail.com','Tbilisi.Abashidze str',NULL,NULL,'1999-12-12','Female',3,4);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_timetable`
--

DROP TABLE IF EXISTS `subject_timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_timetable` (
  `id` int NOT NULL,
  `weekday` varchar(255) NOT NULL,
  `start_time` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_timetable`
--

LOCK TABLES `subject_timetable` WRITE;
/*!40000 ALTER TABLE `subject_timetable` DISABLE KEYS */;
INSERT INTO `subject_timetable` VALUES (1,'Monday','12:00:00'),(2,'Tuesday','13:00:00'),(3,'Tuesday','15:00:00'),(4,'Wednesday','11:00:00'),(5,'Thursday','12:00:00'),(6,'Friday','15:00:00');
/*!40000 ALTER TABLE `subject_timetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `id` int NOT NULL,
  `subject_name` varchar(255) NOT NULL,
  `courses_id` int NOT NULL,
  `faculty_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_id` (`courses_id`),
  KEY `faculty_id` (`faculty_id`),
  CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`courses_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `subjects_ibfk_2` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Calculus',1,4),(2,'Python',2,2),(3,'Econometrics 3',3,1),(4,'World_history',1,3),(5,'Bachelor\'s_Thesis',4,1);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-14 10:13:56
