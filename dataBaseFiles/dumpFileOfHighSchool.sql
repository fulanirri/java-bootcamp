CREATE DATABASE  IF NOT EXISTS `high-school` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `high-school`;
-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: high-school
-- ------------------------------------------------------
-- Server version	5.5.41-0+wheezy1

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
-- Temporary table structure for view `view_student_course_final`
--

DROP TABLE IF EXISTS `view_student_course_final`;
/*!50001 DROP VIEW IF EXISTS `view_student_course_final`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_student_course_final` (
  `regNum` tinyint NOT NULL,
  `lastName` tinyint NOT NULL,
  `firstName` tinyint NOT NULL,
  `course` tinyint NOT NULL,
  `final` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Course_has_Student`
--

DROP TABLE IF EXISTS `Course_has_Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Course_has_Student` (
  `Course_idCourse` int(11) NOT NULL,
  `Student_regNum` int(11) NOT NULL,
  `parcial1` mediumtext,
  `parcial2` mediumtext,
  `parcial3` mediumtext,
  `final` mediumtext,
  PRIMARY KEY (`Course_idCourse`,`Student_regNum`),
  KEY `fk_Course_has_Student_Student1` (`Student_regNum`),
  KEY `fk_Course_has_Student_Course` (`Course_idCourse`),
  CONSTRAINT `fk_Course_has_Student_Course` FOREIGN KEY (`Course_idCourse`) REFERENCES `Course` (`idCourse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Course_has_Student_Student1` FOREIGN KEY (`Student_regNum`) REFERENCES `Student` (`regNum`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course_has_Student`
--

LOCK TABLES `Course_has_Student` WRITE;
/*!40000 ALTER TABLE `Course_has_Student` DISABLE KEYS */;
INSERT INTO `Course_has_Student` VALUES (1,1,'7','7','7','9'),(1,2,'5','5','5','4'),(1,3,'5.8','4.9','10','9'),(1,4,'7.9','8.5','5','6'),(1,20,'8.8','7.9','8.9','9.99'),(2,5,'5.9','8','9.9','8.8'),(2,6,'7.9','8.5','5','6'),(2,7,'5.8','4.9','10','9'),(2,8,'5','5','5','4'),(3,9,'7.9','8.5','5','6'),(3,10,'5.8','4.9','10','9'),(3,11,'7.9','8.5','5','6'),(3,12,'7','7','7','9'),(4,13,'5','5','5','4'),(4,14,'7','7','7','9'),(4,15,'7.9','8.5','5','6'),(4,16,'5.9','8','9.9','8.8'),(4,20,'8.8','7.9','8.9','7'),(5,17,'7','7','7','9'),(5,18,'7','7','7','9'),(5,19,'5.9','8','9.9','8.8'),(5,20,'7.9','8.5','5','6');
/*!40000 ALTER TABLE `Course_has_Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `regNum` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  PRIMARY KEY (`regNum`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (1,'Elida','Mckillip','1997-11-24'),(2,'Hermila','Blazier','1998-03-10'),(3,'Vanda','Niemi','1998-03-24'),(4,'Kori','Penrod','1998-04-21'),(5,'Mirian','Depasquale','1998-05-06'),(6,'Issac','Bachman','1998-10-08'),(7,'Fausto','Welle','1998-12-31'),(8,'Elroy','Hixson','1996-03-26'),(9,'Rosendo','Jelks','1996-04-05'),(10,'Nola','Caywood','1997-01-22'),(11,'Danny','Rine','1997-04-25'),(12,'Franklyn','Marotz','1996-06-13'),(13,'Heath','Haught','1996-07-25'),(14,'Mitzie','Wurtz','1997-12-25'),(15,'Rochell','Litchford','1997-06-09'),(16,'Gail','Drye','1997-06-23'),(17,'Leo','Banas','1996-06-13'),(18,'Linwood','Whitfield','1996-07-22'),(19,'Emory','Buttars','1996-10-21'),(20,'Sybil','Ricken','1982-10-27');
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hour`
--

DROP TABLE IF EXISTS `Hour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hour` (
  `idHour` int(11) NOT NULL AUTO_INCREMENT,
  `startHour` time DEFAULT NULL,
  `finishHour` time DEFAULT NULL,
  PRIMARY KEY (`idHour`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hour`
--

LOCK TABLES `Hour` WRITE;
/*!40000 ALTER TABLE `Hour` DISABLE KEYS */;
INSERT INTO `Hour` VALUES (1,'08:00:00','10:00:00'),(2,'10:00:00','12:00:00'),(3,'13:00:00','15:00:00'),(4,'15:00:00','17:00:00');
/*!40000 ALTER TABLE `Hour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Schedule`
--

DROP TABLE IF EXISTS `Schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Schedule` (
  `idWeekDay` int(11) NOT NULL,
  `idHour` int(11) NOT NULL,
  `idCourse` int(11) NOT NULL,
  PRIMARY KEY (`idWeekDay`,`idHour`,`idCourse`),
  KEY `fk_Schedule_WeekDay1` (`idWeekDay`),
  KEY `fk_Schedule_Hour1` (`idHour`),
  KEY `fk_Schedule_Course1` (`idCourse`),
  CONSTRAINT `fk_Schedule_Course1` FOREIGN KEY (`idCourse`) REFERENCES `Course` (`idCourse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Schedule_Hour1` FOREIGN KEY (`idHour`) REFERENCES `Hour` (`idHour`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Schedule_WeekDay1` FOREIGN KEY (`idWeekDay`) REFERENCES `WeekDay` (`idWeekDay`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Schedule`
--

LOCK TABLES `Schedule` WRITE;
/*!40000 ALTER TABLE `Schedule` DISABLE KEYS */;
INSERT INTO `Schedule` VALUES (1,1,1),(2,2,2),(2,3,3),(2,4,3),(3,1,4),(4,3,5),(4,4,5),(5,3,5);
/*!40000 ALTER TABLE `Schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `count_failed`
--

DROP TABLE IF EXISTS `count_failed`;
/*!50001 DROP VIEW IF EXISTS `count_failed`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `count_failed` (
  `count_failed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `count_passed`
--

DROP TABLE IF EXISTS `count_passed`;
/*!50001 DROP VIEW IF EXISTS `count_passed`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `count_passed` (
  `count_passed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_student_teachers_course`
--

DROP TABLE IF EXISTS `view_student_teachers_course`;
/*!50001 DROP VIEW IF EXISTS `view_student_teachers_course`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_student_teachers_course` (
  `course` tinyint NOT NULL,
  `teacherLastName` tinyint NOT NULL,
  `teacherFirstName` tinyint NOT NULL,
  `studentFirstName` tinyint NOT NULL,
  `studentLastName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Teacher`
--

DROP TABLE IF EXISTS `Teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teacher` (
  `idTeacher` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  PRIMARY KEY (`idTeacher`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teacher`
--

LOCK TABLES `Teacher` WRITE;
/*!40000 ALTER TABLE `Teacher` DISABLE KEYS */;
INSERT INTO `Teacher` VALUES (1,'Charles','Darwin','1975-03-21'),(2,'William','Shakespeare','1975-10-01'),(3,'Dennis','Ritchie','1977-11-09'),(4,'Hebe','Rabuffetti','1980-07-30'),(5,'Albert','Einstein','1982-10-27');
/*!40000 ALTER TABLE `Teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Course`
--

DROP TABLE IF EXISTS `Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Course` (
  `idCourse` int(11) NOT NULL AUTO_INCREMENT,
  `course` varchar(45) DEFAULT NULL,
  `teacherLastName` varchar(45) DEFAULT NULL,
  `teacherFirstName` varchar(45) DEFAULT NULL,
  `hoursWeek` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCourse`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
INSERT INTO `Course` VALUES (1,'Biology','Darwin','Charles',2),(2,'Math','Rabuffetti','Hebe',2),(3,'Physics','Einstein','Albert',4),(4,'Literature','Shakespeare','William',2),(5,'Programming','Ritchie','Dennis',6);
/*!40000 ALTER TABLE `Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WeekDay`
--

DROP TABLE IF EXISTS `WeekDay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WeekDay` (
  `idWeekDay` int(11) NOT NULL AUTO_INCREMENT,
  `dayName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idWeekDay`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WeekDay`
--

LOCK TABLES `WeekDay` WRITE;
/*!40000 ALTER TABLE `WeekDay` DISABLE KEYS */;
INSERT INTO `WeekDay` VALUES (1,'Monday'),(2,'Tuesday'),(3,'Wednesday'),(4,'Thursday'),(5,'Friday'),(6,'Saturday'),(7,'Sunday');
/*!40000 ALTER TABLE `WeekDay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teacher_has_Course`
--

DROP TABLE IF EXISTS `Teacher_has_Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teacher_has_Course` (
  `Teacher_idTeacher` int(11) NOT NULL,
  `Course_idCourse` int(11) NOT NULL,
  PRIMARY KEY (`Teacher_idTeacher`,`Course_idCourse`),
  KEY `fk_Teacher_has_Course_Course1` (`Course_idCourse`),
  KEY `fk_Teacher_has_Course_Teacher1` (`Teacher_idTeacher`),
  CONSTRAINT `fk_Teacher_has_Course_Course1` FOREIGN KEY (`Course_idCourse`) REFERENCES `Course` (`idCourse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Teacher_has_Course_Teacher1` FOREIGN KEY (`Teacher_idTeacher`) REFERENCES `Teacher` (`idTeacher`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teacher_has_Course`
--

LOCK TABLES `Teacher_has_Course` WRITE;
/*!40000 ALTER TABLE `Teacher_has_Course` DISABLE KEYS */;
INSERT INTO `Teacher_has_Course` VALUES (1,1),(4,2),(5,3),(2,4),(3,5);
/*!40000 ALTER TABLE `Teacher_has_Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_teacher_schedule`
--

DROP TABLE IF EXISTS `view_teacher_schedule`;
/*!50001 DROP VIEW IF EXISTS `view_teacher_schedule`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_teacher_schedule` (
  `teacherLastName` tinyint NOT NULL,
  `teacherFirstName` tinyint NOT NULL,
  `dayName` tinyint NOT NULL,
  `startHour` tinyint NOT NULL,
  `finishHour` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_student_course_final`
--

/*!50001 DROP TABLE IF EXISTS `view_student_course_final`*/;
/*!50001 DROP VIEW IF EXISTS `view_student_course_final`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_student_course_final` AS select `b`.`regNum` AS `regNum`,`b`.`lastName` AS `lastName`,`b`.`firstName` AS `firstName`,`c`.`course` AS `course`,`a`.`final` AS `final` from ((`Course_has_Student` `a` join `Student` `b` on((`b`.`regNum` = `a`.`Student_regNum`))) join `Course` `c` on((`c`.`idCourse` = `a`.`Course_idCourse`))) order by `b`.`lastName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `count_failed`
--

/*!50001 DROP TABLE IF EXISTS `count_failed`*/;
/*!50001 DROP VIEW IF EXISTS `count_failed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `count_failed` AS select count(`Course_has_Student`.`final`) AS `count_failed` from `Course_has_Student` where (`Course_has_Student`.`final` < 6) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `count_passed`
--

/*!50001 DROP TABLE IF EXISTS `count_passed`*/;
/*!50001 DROP VIEW IF EXISTS `count_passed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `count_passed` AS select count(`Course_has_Student`.`final`) AS `count_passed` from `Course_has_Student` where (`Course_has_Student`.`final` >= 6) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_student_teachers_course`
--

/*!50001 DROP TABLE IF EXISTS `view_student_teachers_course`*/;
/*!50001 DROP VIEW IF EXISTS `view_student_teachers_course`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_student_teachers_course` AS select `b`.`course` AS `course`,`b`.`teacherLastName` AS `teacherLastName`,`b`.`teacherFirstName` AS `teacherFirstName`,`c`.`lastName` AS `studentFirstName`,`c`.`firstName` AS `studentLastName` from ((`Course_has_Student` `a` join `Course` `b` on((`b`.`idCourse` = `a`.`Course_idCourse`))) join `Student` `c` on((`c`.`regNum` = `a`.`Student_regNum`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_teacher_schedule`
--

/*!50001 DROP TABLE IF EXISTS `view_teacher_schedule`*/;
/*!50001 DROP VIEW IF EXISTS `view_teacher_schedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_teacher_schedule` AS select `a`.`teacherLastName` AS `teacherLastName`,`a`.`teacherFirstName` AS `teacherFirstName`,`c`.`dayName` AS `dayName`,`d`.`startHour` AS `startHour`,`d`.`finishHour` AS `finishHour` from (((`Schedule` `b` join `Course` `a` on((`a`.`idCourse` = `b`.`idCourse`))) join `Hour` `d` on((`d`.`idHour` = `b`.`idHour`))) join `WeekDay` `c` on((`c`.`idWeekDay` = `b`.`idWeekDay`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'high-school'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-02  3:08:11
