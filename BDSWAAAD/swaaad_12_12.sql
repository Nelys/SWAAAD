/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 10.1.21-MariaDB : Database - swaaad
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`swaaad` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `swaaad`;

/*Table structure for table `actividad_pedagogica` */

DROP TABLE IF EXISTS `actividad_pedagogica`;

CREATE TABLE `actividad_pedagogica` (
  `ID_ACTIVIDAD` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA` datetime DEFAULT NULL,
  `DESCRIPCION` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_CURSO` int(11) NOT NULL,
  PRIMARY KEY (`ID_ACTIVIDAD`),
  KEY `FK_CURSO_ACTIVIDADPEDAGOGICA` (`ID_CURSO`),
  CONSTRAINT `FK_CURSO_ACTIVIDADPEDAGOGICA` FOREIGN KEY (`ID_CURSO`) REFERENCES `curso` (`ID_CURSO`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `actividad_pedagogica` */

insert  into `actividad_pedagogica`(`ID_ACTIVIDAD`,`FECHA`,`DESCRIPCION`,`ID_CURSO`) values (1,'2017-12-14 18:10:00','Revisión de tarea',1),(2,'2017-12-16 00:00:00','Revision de trabajo Final',1),(3,'2017-12-18 00:00:00','Examen Final',1),(4,'2017-10-31 00:00:00','dfvf',1),(5,'2017-12-21 09:30:00','Fiesta Navidad',1),(6,'2017-12-18 20:18:00','Exposición',1);

/*Table structure for table `alumno` */

DROP TABLE IF EXISTS `alumno`;

CREATE TABLE `alumno` (
  `ID_ALUMNO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRES` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APELLIDOS` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GENERO` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NOMBRES_APODERADO` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APELLIDOS_APODERADO` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_APODERADO` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_ALUMNO`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `alumno` */

insert  into `alumno`(`ID_ALUMNO`,`NOMBRES`,`APELLIDOS`,`GENERO`,`EMAIL`,`NOMBRES_APODERADO`,`APELLIDOS_APODERADO`,`EMAIL_APODERADO`) values (3,'Luis','Condori','M','luis@hotmail.com',NULL,NULL,NULL),(4,'nelys','mollocondo','F','','','',''),(5,'Motta Rondón','Milagros A.','F','milagros.motta@gmail.com','','Motta ','Motta@hotmail.com'),(6,'Núñez Chávez','Diana Margior','F','diana.núñez@gmail.com','','Núñez ','Núñez@hotmail.com'),(7,'Ortiz Delgado','Shirley Patric','F','shirley.ortiz@gmail.com','','Ortiz ','Ortiz@hotmail.com'),(8,'Osorio Vargas','Ana Paula','F','ana.osorio@gmail.com','','Osorio ','Osorio@hotmail.com'),(9,'Peña Villafuerte','Lizeth Diana','F','lizeth.peña@gmail.com','','Peña ','Peña@hotmail.com'),(10,'Pillco Ramos','Luz Clara','F','luz.pillco@gmail.com','','Pillco ','Pillco@hotmail.com'),(11,'Pineda Fernández','Alanys Virginia','F','alanys.pineda@gmail.com','','Pineda ','Pineda@hotmail.com'),(12,'Quiroz Condori','Carla Daniela','F','carla.quiroz@gmail.com','','Quiroz ','Quiroz@hotmail.com'),(13,'Rios Salas','Yakelyn Pao','F','yakelyn.rios@gmail.com','','Rios ','Rios@hotmail.com'),(14,'Rodríguez Delelis','Virginia del Carme','F','virginiarodríguez@gmail.com','','Rodríguez ','Rodrígue@hotmail.com'),(15,'Rondón De La Cruz','Carola Andrea Alex','F','carola.rondón@gmail.com','','Rondón ','Rondón@hotmail.com'),(16,'Salas Rodriguez','Stephanie Alexan','F','stephanie.salas@gmail.com','','Salas ','Salas@hotmail.com'),(17,'Smith Postigo','Luciana Anthua','F','luciana.smith@gmail.com','','Smith ','Smith@hotmail.com'),(18,'Tejada Mamani','Jose Manuel','M','jose.tejada@gmail.com','','Tejada ','Tejada@hotmail.com'),(19,'Valdivia Cisneros','Andrea Del Carmen','F','andrea.valdivia@gmail.com','','Valdivia ','Valdivia@hotmail.com'),(20,'Valdivia Paredes','Rosse Mary','F','rosse.valdivia@gmail.com','','Valdivia ','Valdivia@hotmail.com'),(21,'Valdivia Tinajeros','Clara Giannella','F','clara.valdivia@gmail.com','','Valdivia ','Valdivia@hotmail.com'),(22,'Valencia Neyra','Fabiola Cristin','F','fabiola.valencia@gmail.com','','Valencia ','Valencia@hotmail.com'),(23,'Hanco Mamani','Richard  A.','M','richard.hanco@gmail.com','','Hanco ','Hanco@hotmail.com'),(24,'Zevallos Barriga','Denise Antonella','F','denise.zevallos@gmail.com','','Zevallos ','Zevallos@hotmail.com'),(25,'Carlos','Gutierrez','M','carlog@gmail.com','','',''),(26,'Motta Rondón','Milagros A.','F','milagros.motta@gmail.com','','Motta ','Motta @hotmail.com'),(27,'Núñez Chávez','Diana Margior','F','diana.nunez@gmail.com','','Núñez ','Núñez @hotmail.com'),(28,'Ortiz Delgado','Shirley Patric','F','shirley.ortiz@gmail.com','','Ortiz ','Ortiz @hotmail.com'),(29,'Osorio Vargas','Ana Paula','F','ana.osorio@gmail.com','','Osorio ','Osorio @hotmail.com'),(30,'Peña Villafuerte','Lizeth Diana','F','lizeth.p@gmail.com','','Peña ','Peña @hotmail.com'),(31,'Pillco Ramos','Luz Clara','F','luz.pillco@gmail.com','','Pillco ','Pillco @hotmail.com'),(32,'Pineda Fernández','Alanys Virginia','F','alanys.pineda@gmail.com','','Pineda ','Pineda @hotmail.com'),(33,'Quiroz Condori','Carla Daniela','F','carla.quiroz@gmail.com','','Quiroz ','Quiroz @hotmail.com'),(34,'Rios Salas','Yakelyn Pao','F','yakelyn.rios@gmail.com','','Rios ','Rios @hotmail.com'),(35,'Rodríguez Delelis','Virginia del Carme','F','virginia.rodriguez@gmail.com','','Rodríguez ','Rodríguez @hotmail.com'),(36,'Rondón De La Cruz','Carola Andrea Alex','F','carola.rondon@gmail.com','','Rondón ','Rondón @hotmail.com'),(37,'Salas Rodriguez','Stephanie Alexan','F','stephanie.salas@gmail.com','','Salas ','Salas @hotmail.com'),(38,'Smith Postigo','Luciana Anthua','F','luciana.smith@gmail.com','','Smith ','Smith @hotmail.com'),(39,'Tejada Mamani','Jose Manuel','M','jose.tejada@gmail.com','','Tejada ','Tejada @hotmail.com'),(40,'Valdivia Cisneros','Andrea Del Carmen','F','andrea.valdivia@gmail.com','','Valdivia ','Valdivia @hotmail.com'),(41,'Valdivia Paredes','Rosse Mary','F','rosse.valdivia@gmail.com','','Valdivia ','Valdivia @hotmail.com'),(42,'Valdivia Tinajeros','Clara Giannella','F','clara.valdivia@gmail.com','','Valdivia ','Valdivia @hotmail.com'),(43,'Valencia Neyra','Fabiola Cristin','F','fabiola.valencia@gmail.com','','Valencia ','Valencia @hotmail.com'),(44,'Hanco Mamani','Richard  A.','M','richard.hanco@gmail.com','','Hanco ','Hanco @hotmail.com'),(45,'Zevallos Barriga','Denise Antonella','F','denise.zevallos@gmail.com','','Zevallos ','Zevallos @hotmail.com');

/*Table structure for table `asistencia` */

DROP TABLE IF EXISTS `asistencia`;

CREATE TABLE `asistencia` (
  `ID_ASISTENCIA` int(11) NOT NULL AUTO_INCREMENT,
  `ESTADO` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `ID_CURSO_ALUMNO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_ASISTENCIA`),
  KEY `FK_CURSOALUMNO_ASISTENCIA` (`ID_CURSO_ALUMNO`),
  CONSTRAINT `FK_CURSOALUMNO_ASISTENCIA` FOREIGN KEY (`ID_CURSO_ALUMNO`) REFERENCES `curso_alumno` (`ID_CURSO_ALUMNO`)
) ENGINE=InnoDB AUTO_INCREMENT=799 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `asistencia` */

insert  into `asistencia`(`ID_ASISTENCIA`,`ESTADO`,`FECHA`,`ID_CURSO_ALUMNO`) values (1,'A','2017-12-01',4),(2,'A','2017-12-01',5),(3,'A','2017-12-01',6),(4,'F','2017-12-01',7),(5,'A','2017-12-01',8),(6,'A','2017-12-01',9),(7,'A','2017-12-01',10),(8,'A','2017-12-01',11),(9,'A','2017-12-01',12),(10,'A','2017-12-01',13),(11,'A','2017-12-01',14),(12,'A','2017-12-01',15),(13,'A','2017-12-01',16),(14,'A','2017-12-01',17),(15,'F','2017-12-01',18),(16,'A','2017-12-01',19),(17,'A','2017-12-01',20),(18,'A','2017-12-01',21),(19,'A','2017-12-01',22),(20,'A','2017-12-01',23),(21,'A','2017-12-01',24),(22,'A','2017-12-04',4),(23,'A','2017-12-04',5),(24,'A','2017-12-04',6),(25,'A','2017-12-04',7),(26,'A','2017-12-04',8),(27,'A','2017-12-04',9),(28,'A','2017-12-04',10),(29,'A','2017-12-04',11),(30,'A','2017-12-04',12),(31,'A','2017-12-04',13),(32,'A','2017-12-04',14),(33,'A','2017-12-04',15),(34,'T','2017-12-04',16),(35,'A','2017-12-04',17),(36,'A','2017-12-04',18),(37,'A','2017-12-04',19),(38,'A','2017-12-04',20),(39,'A','2017-12-04',21),(40,'A','2017-12-04',22),(41,'A','2017-12-04',23),(42,'A','2017-12-04',24),(43,'A','2017-12-05',4),(44,'A','2017-12-05',5),(45,'A','2017-12-05',6),(46,'A','2017-12-05',7),(47,'A','2017-12-05',8),(48,'A','2017-12-05',9),(49,'A','2017-12-05',10),(50,'A','2017-12-05',11),(51,'A','2017-12-05',12),(52,'A','2017-12-05',13),(53,'A','2017-12-05',14),(54,'A','2017-12-05',15),(55,'A','2017-12-05',16),(56,'A','2017-12-05',17),(57,'A','2017-12-05',18),(58,'A','2017-12-05',19),(59,'A','2017-12-05',20),(60,'A','2017-12-05',21),(61,'A','2017-12-05',22),(62,'A','2017-12-05',23),(63,'A','2017-12-05',24),(64,'A','2017-12-06',4),(65,'A','2017-12-06',5),(66,'A','2017-12-06',6),(67,'A','2017-12-06',7),(68,'A','2017-12-06',8),(69,'A','2017-12-06',9),(70,'A','2017-12-06',10),(71,'A','2017-12-06',11),(72,'A','2017-12-06',12),(73,'A','2017-12-06',13),(74,'A','2017-12-06',14),(75,'A','2017-12-06',15),(76,'A','2017-12-06',16),(77,'A','2017-12-06',17),(78,'A','2017-12-06',18),(79,'A','2017-12-06',19),(80,'A','2017-12-06',20),(81,'A','2017-12-06',21),(82,'A','2017-12-06',22),(83,'A','2017-12-06',23),(84,'A','2017-12-06',24),(85,'A','2017-12-07',4),(86,'A','2017-12-07',5),(87,'A','2017-12-07',6),(88,'A','2017-12-07',7),(89,'A','2017-12-07',8),(90,'A','2017-12-07',9),(91,'A','2017-12-07',10),(92,'A','2017-12-07',11),(93,'A','2017-12-07',12),(94,'A','2017-12-07',13),(95,'A','2017-12-07',14),(96,'A','2017-12-07',15),(97,'A','2017-12-07',16),(98,'A','2017-12-07',17),(99,'A','2017-12-07',18),(100,'A','2017-12-07',19),(101,'A','2017-12-07',20),(102,'A','2017-12-07',21),(103,'A','2017-12-07',22),(104,'A','2017-12-07',23),(105,'A','2017-12-07',24),(106,'A','2017-12-08',4),(107,'A','2017-12-08',5),(108,'F','2017-12-08',6),(109,'A','2017-12-08',7),(110,'A','2017-12-08',8),(111,'A','2017-12-08',9),(112,'A','2017-12-08',10),(113,'A','2017-12-08',11),(114,'A','2017-12-08',12),(115,'A','2017-12-08',13),(116,'T','2017-12-08',14),(117,'A','2017-12-08',15),(118,'A','2017-12-08',16),(119,'A','2017-12-08',17),(120,'A','2017-12-08',18),(121,'A','2017-12-08',19),(122,'A','2017-12-08',20),(123,'F','2017-12-08',21),(124,'A','2017-12-08',22),(125,'A','2017-12-08',23),(126,'A','2017-12-08',24),(127,'A','2017-12-11',4),(128,'A','2017-12-11',5),(129,'A','2017-12-11',6),(130,'A','2017-12-11',7),(131,'A','2017-12-11',8),(132,'A','2017-12-11',9),(133,'A','2017-12-11',10),(134,'A','2017-12-11',11),(135,'A','2017-12-11',12),(136,'A','2017-12-11',13),(137,'A','2017-12-11',14),(138,'A','2017-12-11',15),(139,'A','2017-12-11',16),(140,'A','2017-12-11',17),(141,'A','2017-12-11',18),(142,'A','2017-12-11',19),(143,'A','2017-12-11',20),(144,'A','2017-12-11',21),(145,'A','2017-12-11',22),(146,'A','2017-12-11',23),(147,'A','2017-12-11',24),(148,'A','2017-12-12',4),(149,'A','2017-12-12',5),(150,'A','2017-12-12',6),(151,'A','2017-12-12',7),(152,'A','2017-12-12',8),(153,'A','2017-12-12',9),(154,'A','2017-12-12',10),(155,'A','2017-12-12',11),(156,'A','2017-12-12',12),(157,'A','2017-12-12',13),(158,'A','2017-12-12',14),(159,'A','2017-12-12',15),(160,'A','2017-12-12',16),(161,'A','2017-12-12',17),(162,'A','2017-12-12',18),(163,'A','2017-12-12',19),(164,'A','2017-12-12',20),(165,'A','2017-12-12',21),(166,'A','2017-12-12',22),(167,'A','2017-12-12',23),(168,'A','2017-12-12',24),(169,'A','2017-12-13',4),(170,'A','2017-12-13',5),(171,'A','2017-12-13',6),(172,'A','2017-12-13',7),(173,'A','2017-12-13',8),(174,'A','2017-12-13',9),(175,'A','2017-12-13',10),(176,'A','2017-12-13',11),(177,'A','2017-12-13',12),(178,'A','2017-12-13',13),(179,'A','2017-12-13',14),(180,'A','2017-12-13',15),(181,'A','2017-12-13',16),(182,'A','2017-12-13',17),(183,'A','2017-12-13',18),(184,'A','2017-12-13',19),(185,'A','2017-12-13',20),(186,'A','2017-12-13',21),(187,'A','2017-12-13',22),(188,'A','2017-12-13',23),(189,'A','2017-12-13',24),(190,'A','2017-12-14',4),(191,'A','2017-12-14',5),(192,'A','2017-12-14',6),(193,'A','2017-12-14',7),(194,'A','2017-12-14',8),(195,'A','2017-12-14',9),(196,'A','2017-12-14',10),(197,'A','2017-12-14',11),(198,'A','2017-12-14',12),(199,'A','2017-12-14',13),(200,'A','2017-12-14',14),(201,'A','2017-12-14',15),(202,'A','2017-12-14',16),(203,'A','2017-12-14',17),(204,'A','2017-12-14',18),(205,'A','2017-12-14',19),(206,'A','2017-12-14',20),(207,'A','2017-12-14',21),(208,'A','2017-12-14',22),(209,'A','2017-12-14',23),(210,'A','2017-12-14',24),(211,'A','2017-12-15',4),(212,'A','2017-12-15',5),(213,'A','2017-12-15',6),(214,'A','2017-12-15',7),(215,'A','2017-12-15',8),(216,'A','2017-12-15',9),(217,'A','2017-12-15',10),(218,'A','2017-12-15',11),(219,'A','2017-12-15',12),(220,'A','2017-12-15',13),(221,'A','2017-12-15',14),(222,'A','2017-12-15',15),(223,'A','2017-12-15',16),(224,'A','2017-12-15',17),(225,'A','2017-12-15',18),(226,'A','2017-12-15',19),(227,'A','2017-12-15',20),(228,'A','2017-12-15',21),(229,'A','2017-12-15',22),(230,'A','2017-12-15',23),(231,'A','2017-12-15',24),(232,'A','2017-08-21',4),(233,'A','2017-08-21',5),(234,'A','2017-08-21',6),(235,'A','2017-08-21',7),(236,'A','2017-08-21',8),(237,'A','2017-08-21',9),(238,'A','2017-08-21',10),(239,'A','2017-08-21',11),(240,'A','2017-08-21',12),(241,'A','2017-08-21',13),(242,'A','2017-08-21',14),(243,'A','2017-08-21',15),(244,'A','2017-08-21',16),(245,'A','2017-08-21',17),(246,'A','2017-08-21',18),(247,'A','2017-08-21',19),(248,'A','2017-08-21',20),(249,'A','2017-08-21',21),(250,'A','2017-08-21',22),(251,'A','2017-08-21',23),(252,'A','2017-08-21',24),(253,'A','2017-08-22',4),(254,'A','2017-08-22',5),(255,'A','2017-08-22',6),(256,'A','2017-08-22',7),(257,'A','2017-08-22',8),(258,'A','2017-08-22',9),(259,'A','2017-08-22',10),(260,'A','2017-08-22',11),(261,'A','2017-08-22',12),(262,'A','2017-08-22',13),(263,'A','2017-08-22',14),(264,'A','2017-08-22',15),(265,'A','2017-08-22',16),(266,'A','2017-08-22',17),(267,'A','2017-08-22',18),(268,'A','2017-08-22',19),(269,'A','2017-08-22',20),(270,'A','2017-08-22',21),(271,'A','2017-08-22',22),(272,'A','2017-08-22',23),(273,'A','2017-08-22',24),(274,'T','2017-08-23',4),(275,'A','2017-08-23',5),(276,'F','2017-08-23',6),(277,'A','2017-08-23',7),(278,'F','2017-08-23',8),(279,'A','2017-08-23',9),(280,'A','2017-08-23',10),(281,'A','2017-08-23',11),(282,'A','2017-08-23',12),(283,'A','2017-08-23',13),(284,'A','2017-08-23',14),(285,'A','2017-08-23',15),(286,'A','2017-08-23',16),(287,'A','2017-08-23',17),(288,'A','2017-08-23',18),(289,'A','2017-08-23',19),(290,'A','2017-08-23',20),(291,'A','2017-08-23',21),(292,'A','2017-08-23',22),(293,'A','2017-08-23',23),(294,'A','2017-08-23',24),(295,'A','2017-08-24',4),(296,'A','2017-08-24',5),(297,'A','2017-08-24',6),(298,'A','2017-08-24',7),(299,'A','2017-08-24',8),(300,'A','2017-08-24',9),(301,'A','2017-08-24',10),(302,'A','2017-08-24',11),(303,'A','2017-08-24',12),(304,'A','2017-08-24',13),(305,'A','2017-08-24',14),(306,'A','2017-08-24',15),(307,'A','2017-08-24',16),(308,'A','2017-08-24',17),(309,'A','2017-08-24',18),(310,'A','2017-08-24',19),(311,'A','2017-08-24',20),(312,'A','2017-08-24',21),(313,'A','2017-08-24',22),(314,'A','2017-08-24',23),(315,'A','2017-08-24',24),(316,'A','2017-08-25',4),(317,'T','2017-08-25',5),(318,'A','2017-08-25',6),(319,'F','2017-08-25',7),(320,'A','2017-08-25',8),(321,'A','2017-08-25',9),(322,'A','2017-08-25',10),(323,'A','2017-08-25',11),(324,'A','2017-08-25',12),(325,'T','2017-08-25',13),(326,'A','2017-08-25',14),(327,'A','2017-08-25',15),(328,'F','2017-08-25',16),(329,'A','2017-08-25',17),(330,'A','2017-08-25',18),(331,'A','2017-08-25',19),(332,'A','2017-08-25',20),(333,'A','2017-08-25',21),(334,'A','2017-08-25',22),(335,'A','2017-08-25',23),(336,'A','2017-08-25',24),(337,'A','2017-08-28',4),(338,'A','2017-08-28',5),(339,'T','2017-08-28',6),(340,'A','2017-08-28',7),(341,'F','2017-08-28',8),(342,'A','2017-08-28',9),(343,'F','2017-08-28',10),(344,'A','2017-08-28',11),(345,'A','2017-08-28',12),(346,'A','2017-08-28',13),(347,'A','2017-08-28',14),(348,'A','2017-08-28',15),(349,'A','2017-08-28',16),(350,'A','2017-08-28',17),(351,'A','2017-08-28',18),(352,'A','2017-08-28',19),(353,'A','2017-08-28',20),(354,'A','2017-08-28',21),(355,'A','2017-08-28',22),(356,'A','2017-08-28',23),(357,'A','2017-08-28',24),(358,'A','2017-08-29',4),(359,'A','2017-08-29',5),(360,'A','2017-08-29',6),(361,'A','2017-08-29',7),(362,'T','2017-08-29',8),(363,'A','2017-08-29',9),(364,'A','2017-08-29',10),(365,'A','2017-08-29',11),(366,'F','2017-08-29',12),(367,'A','2017-08-29',13),(368,'A','2017-08-29',14),(369,'A','2017-08-29',15),(370,'A','2017-08-29',16),(371,'A','2017-08-29',17),(372,'A','2017-08-29',18),(373,'A','2017-08-29',19),(374,'A','2017-08-29',20),(375,'A','2017-08-29',21),(376,'A','2017-08-29',22),(377,'A','2017-08-29',23),(378,'A','2017-08-29',24),(379,'A','2017-08-30',4),(380,'A','2017-08-30',5),(381,'A','2017-08-30',6),(382,'A','2017-08-30',7),(383,'A','2017-08-30',8),(384,'A','2017-08-30',9),(385,'A','2017-08-30',10),(386,'A','2017-08-30',11),(387,'A','2017-08-30',12),(388,'A','2017-08-30',13),(389,'A','2017-08-30',14),(390,'A','2017-08-30',15),(391,'A','2017-08-30',16),(392,'A','2017-08-30',17),(393,'A','2017-08-30',18),(394,'A','2017-08-30',19),(395,'A','2017-08-30',20),(396,'A','2017-08-30',21),(397,'A','2017-08-30',22),(398,'A','2017-08-30',23),(399,'A','2017-08-30',24),(400,'A','2017-09-04',4),(401,'A','2017-09-04',5),(402,'A','2017-09-04',6),(403,'A','2017-09-04',7),(404,'A','2017-09-04',8),(405,'A','2017-09-04',9),(406,'A','2017-09-04',10),(407,'A','2017-09-04',11),(408,'A','2017-09-04',12),(409,'A','2017-09-04',13),(410,'A','2017-09-04',14),(411,'A','2017-09-04',15),(412,'A','2017-09-04',16),(413,'A','2017-09-04',17),(414,'A','2017-09-04',18),(415,'A','2017-09-04',19),(416,'A','2017-09-04',20),(417,'A','2017-09-04',21),(418,'A','2017-09-04',22),(419,'A','2017-09-04',23),(420,'A','2017-09-04',24),(421,'A','2017-09-05',4),(422,'A','2017-09-05',5),(423,'A','2017-09-05',6),(424,'A','2017-09-05',7),(425,'A','2017-09-05',8),(426,'A','2017-09-05',9),(427,'A','2017-09-05',10),(428,'A','2017-09-05',11),(429,'A','2017-09-05',12),(430,'A','2017-09-05',13),(431,'A','2017-09-05',14),(432,'A','2017-09-05',15),(433,'A','2017-09-05',16),(434,'A','2017-09-05',17),(435,'A','2017-09-05',18),(436,'A','2017-09-05',19),(437,'A','2017-09-05',20),(438,'A','2017-09-05',21),(439,'A','2017-09-05',22),(440,'A','2017-09-05',23),(441,'A','2017-09-05',24),(442,'A','2017-09-06',4),(443,'A','2017-09-06',5),(444,'A','2017-09-06',6),(445,'A','2017-09-06',7),(446,'A','2017-09-06',8),(447,'A','2017-09-06',9),(448,'A','2017-09-06',10),(449,'A','2017-09-06',11),(450,'A','2017-09-06',12),(451,'A','2017-09-06',13),(452,'A','2017-09-06',14),(453,'A','2017-09-06',15),(454,'A','2017-09-06',16),(455,'A','2017-09-06',17),(456,'A','2017-09-06',18),(457,'A','2017-09-06',19),(458,'A','2017-09-06',20),(459,'A','2017-09-06',21),(460,'A','2017-09-06',22),(461,'A','2017-09-06',23),(462,'A','2017-09-06',24),(463,'A','2017-09-07',4),(464,'A','2017-09-07',5),(465,'A','2017-09-07',6),(466,'A','2017-09-07',7),(467,'A','2017-09-07',8),(468,'A','2017-09-07',9),(469,'A','2017-09-07',10),(470,'A','2017-09-07',11),(471,'A','2017-09-07',12),(472,'A','2017-09-07',13),(473,'A','2017-09-07',14),(474,'A','2017-09-07',15),(475,'A','2017-09-07',16),(476,'A','2017-09-07',17),(477,'A','2017-09-07',18),(478,'A','2017-09-07',19),(479,'A','2017-09-07',20),(480,'A','2017-09-07',21),(481,'A','2017-09-07',22),(482,'A','2017-09-07',23),(483,'A','2017-09-07',24),(484,'A','2017-09-08',4),(485,'A','2017-09-08',5),(486,'A','2017-09-08',6),(487,'A','2017-09-08',7),(488,'A','2017-09-08',8),(489,'A','2017-09-08',9),(490,'A','2017-09-08',10),(491,'A','2017-09-08',11),(492,'A','2017-09-08',12),(493,'A','2017-09-08',13),(494,'A','2017-09-08',14),(495,'A','2017-09-08',15),(496,'A','2017-09-08',16),(497,'A','2017-09-08',17),(498,'A','2017-09-08',18),(499,'A','2017-09-08',19),(500,'A','2017-09-08',20),(501,'A','2017-09-08',21),(502,'A','2017-09-08',22),(503,'A','2017-09-08',23),(504,'A','2017-09-08',24),(505,'A','2017-09-11',4),(506,'A','2017-09-11',5),(507,'A','2017-09-11',6),(508,'A','2017-09-11',7),(509,'A','2017-09-11',8),(510,'A','2017-09-11',9),(511,'A','2017-09-11',10),(512,'A','2017-09-11',11),(513,'A','2017-09-11',12),(514,'A','2017-09-11',13),(515,'A','2017-09-11',14),(516,'A','2017-09-11',15),(517,'A','2017-09-11',16),(518,'A','2017-09-11',17),(519,'A','2017-09-11',18),(520,'A','2017-09-11',19),(521,'A','2017-09-11',20),(522,'A','2017-09-11',21),(523,'A','2017-09-11',22),(524,'A','2017-09-11',23),(525,'A','2017-09-11',24),(526,'A','2017-09-12',4),(527,'F','2017-09-12',5),(528,'A','2017-09-12',6),(529,'F','2017-09-12',7),(530,'A','2017-09-12',8),(531,'A','2017-09-12',9),(532,'A','2017-09-12',10),(533,'A','2017-09-12',11),(534,'A','2017-09-12',12),(535,'A','2017-09-12',13),(536,'A','2017-09-12',14),(537,'T','2017-09-12',15),(538,'A','2017-09-12',16),(539,'A','2017-09-12',17),(540,'A','2017-09-12',18),(541,'A','2017-09-12',19),(542,'A','2017-09-12',20),(543,'A','2017-09-12',21),(544,'A','2017-09-12',22),(545,'A','2017-09-12',23),(546,'A','2017-09-12',24),(547,'A','2017-09-13',4),(548,'A','2017-09-13',5),(549,'F','2017-09-13',6),(550,'A','2017-09-13',7),(551,'A','2017-09-13',8),(552,'A','2017-09-13',9),(553,'A','2017-09-13',10),(554,'A','2017-09-13',11),(555,'A','2017-09-13',12),(556,'A','2017-09-13',13),(557,'A','2017-09-13',14),(558,'A','2017-09-13',15),(559,'A','2017-09-13',16),(560,'A','2017-09-13',17),(561,'A','2017-09-13',18),(562,'A','2017-09-13',19),(563,'A','2017-09-13',20),(564,'A','2017-09-13',21),(565,'A','2017-09-13',22),(566,'F','2017-09-13',23),(567,'A','2017-09-13',24),(568,'A','2017-09-14',4),(569,'A','2017-09-14',5),(570,'A','2017-09-14',6),(571,'A','2017-09-14',7),(572,'A','2017-09-14',8),(573,'A','2017-09-14',9),(574,'A','2017-09-14',10),(575,'F','2017-09-14',11),(576,'A','2017-09-14',12),(577,'A','2017-09-14',13),(578,'A','2017-09-14',14),(579,'A','2017-09-14',15),(580,'A','2017-09-14',16),(581,'A','2017-09-14',17),(582,'A','2017-09-14',18),(583,'A','2017-09-14',19),(584,'A','2017-09-14',20),(585,'A','2017-09-14',21),(586,'A','2017-09-14',22),(587,'A','2017-09-14',23),(588,'A','2017-09-14',24),(589,'A','2017-10-16',4),(590,'A','2017-10-16',5),(591,'A','2017-10-16',6),(592,'A','2017-10-16',7),(593,'A','2017-10-16',8),(594,'A','2017-10-16',9),(595,'A','2017-10-16',10),(596,'A','2017-10-16',11),(597,'A','2017-10-16',12),(598,'A','2017-10-16',13),(599,'A','2017-10-16',14),(600,'A','2017-10-16',15),(601,'A','2017-10-16',16),(602,'A','2017-10-16',17),(603,'A','2017-10-16',18),(604,'A','2017-10-16',19),(605,'A','2017-10-16',20),(606,'A','2017-10-16',21),(607,'A','2017-10-16',22),(608,'A','2017-10-16',23),(609,'A','2017-10-16',24),(610,'A','2017-10-17',4),(611,'A','2017-10-17',5),(612,'A','2017-10-17',6),(613,'A','2017-10-17',7),(614,'A','2017-10-17',8),(615,'A','2017-10-17',9),(616,'A','2017-10-17',10),(617,'A','2017-10-17',11),(618,'A','2017-10-17',12),(619,'A','2017-10-17',13),(620,'A','2017-10-17',14),(621,'A','2017-10-17',15),(622,'A','2017-10-17',16),(623,'A','2017-10-17',17),(624,'A','2017-10-17',18),(625,'A','2017-10-17',19),(626,'A','2017-10-17',20),(627,'A','2017-10-17',21),(628,'A','2017-10-17',22),(629,'A','2017-10-17',23),(630,'A','2017-10-17',24),(631,'A','2017-10-18',4),(632,'A','2017-10-18',5),(633,'A','2017-10-18',6),(634,'A','2017-10-18',7),(635,'A','2017-10-18',8),(636,'A','2017-10-18',9),(637,'A','2017-10-18',10),(638,'A','2017-10-18',11),(639,'A','2017-10-18',12),(640,'A','2017-10-18',13),(641,'A','2017-10-18',14),(642,'A','2017-10-18',15),(643,'A','2017-10-18',16),(644,'A','2017-10-18',17),(645,'A','2017-10-18',18),(646,'A','2017-10-18',19),(647,'A','2017-10-18',20),(648,'A','2017-10-18',21),(649,'A','2017-10-18',22),(650,'A','2017-10-18',23),(651,'A','2017-10-18',24),(652,'A','2017-10-19',4),(653,'A','2017-10-19',5),(654,'A','2017-10-19',6),(655,'A','2017-10-19',7),(656,'A','2017-10-19',8),(657,'A','2017-10-19',9),(658,'A','2017-10-19',10),(659,'A','2017-10-19',11),(660,'A','2017-10-19',12),(661,'A','2017-10-19',13),(662,'A','2017-10-19',14),(663,'A','2017-10-19',15),(664,'A','2017-10-19',16),(665,'A','2017-10-19',17),(666,'A','2017-10-19',18),(667,'A','2017-10-19',19),(668,'A','2017-10-19',20),(669,'A','2017-10-19',21),(670,'A','2017-10-19',22),(671,'A','2017-10-19',23),(672,'A','2017-10-19',24),(673,'A','2017-10-20',4),(674,'A','2017-10-20',5),(675,'A','2017-10-20',6),(676,'A','2017-10-20',7),(677,'A','2017-10-20',8),(678,'A','2017-10-20',9),(679,'A','2017-10-20',10),(680,'A','2017-10-20',11),(681,'A','2017-10-20',12),(682,'A','2017-10-20',13),(683,'A','2017-10-20',14),(684,'A','2017-10-20',15),(685,'A','2017-10-20',16),(686,'A','2017-10-20',17),(687,'A','2017-10-20',18),(688,'A','2017-10-20',19),(689,'A','2017-10-20',20),(690,'A','2017-10-20',21),(691,'A','2017-10-20',22),(692,'A','2017-10-20',23),(693,'A','2017-10-20',24),(694,'A','2017-11-13',4),(695,'A','2017-11-13',5),(696,'A','2017-11-13',6),(697,'A','2017-11-13',7),(698,'A','2017-11-13',8),(699,'A','2017-11-13',9),(700,'A','2017-11-13',10),(701,'A','2017-11-13',11),(702,'A','2017-11-13',12),(703,'A','2017-11-13',13),(704,'A','2017-11-13',14),(705,'A','2017-11-13',15),(706,'A','2017-11-13',16),(707,'A','2017-11-13',17),(708,'A','2017-11-13',18),(709,'A','2017-11-13',19),(710,'A','2017-11-13',20),(711,'A','2017-11-13',21),(712,'A','2017-11-13',22),(713,'A','2017-11-13',23),(714,'A','2017-11-13',24),(715,'A','2017-11-14',4),(716,'A','2017-11-14',5),(717,'A','2017-11-14',6),(718,'A','2017-11-14',7),(719,'A','2017-11-14',8),(720,'A','2017-11-14',9),(721,'A','2017-11-14',10),(722,'A','2017-11-14',11),(723,'A','2017-11-14',12),(724,'A','2017-11-14',13),(725,'A','2017-11-14',14),(726,'T','2017-11-14',15),(727,'A','2017-11-14',16),(728,'A','2017-11-14',17),(729,'A','2017-11-14',18),(730,'A','2017-11-14',19),(731,'A','2017-11-14',20),(732,'A','2017-11-14',21),(733,'A','2017-11-14',22),(734,'A','2017-11-14',23),(735,'A','2017-11-14',24),(736,'A','2017-11-15',4),(737,'A','2017-11-15',5),(738,'A','2017-11-15',6),(739,'A','2017-11-15',7),(740,'A','2017-11-15',8),(741,'A','2017-11-15',9),(742,'A','2017-11-15',10),(743,'A','2017-11-15',11),(744,'A','2017-11-15',12),(745,'A','2017-11-15',13),(746,'A','2017-11-15',14),(747,'A','2017-11-15',15),(748,'F','2017-11-15',16),(749,'A','2017-11-15',17),(750,'A','2017-11-15',18),(751,'A','2017-11-15',19),(752,'A','2017-11-15',20),(753,'A','2017-11-15',21),(754,'A','2017-11-15',22),(755,'A','2017-11-15',23),(756,'A','2017-11-15',24),(757,'F','2017-11-16',4),(758,'F','2017-11-16',5),(759,'F','2017-11-16',6),(760,'A','2017-11-16',7),(761,'A','2017-11-16',8),(762,'A','2017-11-16',9),(763,'A','2017-11-16',10),(764,'A','2017-11-16',11),(765,'A','2017-11-16',12),(766,'A','2017-11-16',13),(767,'A','2017-11-16',14),(768,'A','2017-11-16',15),(769,'A','2017-11-16',16),(770,'A','2017-11-16',17),(771,'A','2017-11-16',18),(772,'A','2017-11-16',19),(773,'A','2017-11-16',20),(774,'A','2017-11-16',21),(775,'A','2017-11-16',22),(776,'A','2017-11-16',23),(777,'A','2017-11-16',24),(778,'A','2017-11-17',4),(779,'A','2017-11-17',5),(780,'A','2017-11-17',6),(781,'A','2017-11-17',7),(782,'A','2017-11-17',8),(783,'A','2017-11-17',9),(784,'A','2017-11-17',10),(785,'A','2017-11-17',11),(786,'A','2017-11-17',12),(787,'A','2017-11-17',13),(788,'A','2017-11-17',14),(789,'A','2017-11-17',15),(790,'A','2017-11-17',16),(791,'A','2017-11-17',17),(792,'F','2017-11-17',18),(793,'A','2017-11-17',19),(794,'A','2017-11-17',20),(795,'A','2017-11-17',21),(796,'A','2017-11-17',22),(797,'A','2017-11-17',23),(798,'A','2017-11-17',24);

/*Table structure for table `aula_dinamica` */

DROP TABLE IF EXISTS `aula_dinamica`;

CREATE TABLE `aula_dinamica` (
  `ID_AULA_DINAMICA` int(11) NOT NULL AUTO_INCREMENT,
  `COORD_X` int(11) DEFAULT NULL,
  `COORD_Y` int(11) DEFAULT NULL,
  `COLOR_TEXTO` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLOR_FONDO` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ESTADO` bit(1) DEFAULT NULL,
  `ID_CURSO_ALUMNO` int(11) NOT NULL,
  PRIMARY KEY (`ID_AULA_DINAMICA`),
  KEY `fk_AULA_DINAMICA_CURSOALUMNO` (`ID_CURSO_ALUMNO`),
  CONSTRAINT `fk_AULA_DINAMICA_CURSOALUMNO` FOREIGN KEY (`ID_CURSO_ALUMNO`) REFERENCES `curso_alumno` (`ID_CURSO_ALUMNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `aula_dinamica` */

/*Table structure for table `curso` */

DROP TABLE IF EXISTS `curso`;

CREATE TABLE `curso` (
  `ID_CURSO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_CURSO` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `INSTITUCION` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GRADO` int(11) DEFAULT NULL,
  `SECCION` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ANIO` int(4) DEFAULT NULL,
  `ID_DOCENTE` int(11) NOT NULL,
  `ESTADO` bit(1) DEFAULT b'1',
  PRIMARY KEY (`ID_CURSO`),
  KEY `fk_CURSO_DOCENTE1` (`ID_DOCENTE`),
  CONSTRAINT `fk_CURSO_DOCENTE1` FOREIGN KEY (`ID_DOCENTE`) REFERENCES `docente` (`ID_DOCENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `curso` */

insert  into `curso`(`ID_CURSO`,`NOMBRE_CURSO`,`INSTITUCION`,`GRADO`,`SECCION`,`ANIO`,`ID_DOCENTE`,`ESTADO`) values (1,'Matematica','Arequipa',5,'E',2017,1,''),(2,'Aritmetica','Mendel',3,'A',2016,1,'\0'),(3,'Seguridad informática','San Martin',4,'F',2016,1,'\0'),(5,'Matematica','Arequipa',2,'A',2017,1,''),(6,'Matematica','Arequipa',2,'B',2017,1,'\0'),(7,'Matematica','Arequipa',2,'C',2017,1,''),(8,'Matematica','Arequipa',2,'D',2017,1,''),(9,'Matematica','Arequipa',3,'A',2017,1,''),(10,'Matematica','Arequipa',3,'B',2017,1,''),(11,'Matematica','Arequipa',3,'C',2017,1,''),(12,'Educación por el arte','Magisterial',2,'A',2017,3,''),(13,'Educacion por el Arte','Magisterial',2,'B',2017,3,''),(14,'Educacion por el arte','Magisterial',2,'C',2017,3,''),(15,'Educacion para el trabajo','Magisterial',4,'A',2017,3,''),(16,'Educaion para el trabajo','Magisterial',4,'C',2017,3,'');

/*Table structure for table `curso_alumno` */

DROP TABLE IF EXISTS `curso_alumno`;

CREATE TABLE `curso_alumno` (
  `ID_CURSO_ALUMNO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CURSO` int(11) NOT NULL,
  `ID_ALUMNO` int(11) NOT NULL,
  PRIMARY KEY (`ID_CURSO_ALUMNO`),
  KEY `fk_CURSO_ALUMNO_ALUMNO1` (`ID_ALUMNO`),
  KEY `fk_CURSO_ALUMNO_CURSO` (`ID_CURSO`),
  CONSTRAINT `fk_CURSO_ALUMNO_ALUMNO1` FOREIGN KEY (`ID_ALUMNO`) REFERENCES `alumno` (`ID_ALUMNO`),
  CONSTRAINT `fk_CURSO_ALUMNO_CURSO` FOREIGN KEY (`ID_CURSO`) REFERENCES `curso` (`ID_CURSO`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `curso_alumno` */

insert  into `curso_alumno`(`ID_CURSO_ALUMNO`,`ID_CURSO`,`ID_ALUMNO`) values (3,2,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,2,25),(26,12,26),(27,12,27),(28,12,28),(29,12,29),(30,12,30),(31,12,31),(32,12,32),(33,12,33),(34,12,34),(35,12,35),(36,12,36),(37,12,37),(38,12,38),(39,12,39),(40,12,40),(41,12,41),(42,12,42),(43,12,43),(44,12,44),(45,12,45);

/*Table structure for table `docente` */

DROP TABLE IF EXISTS `docente`;

CREATE TABLE `docente` (
  `ID_DOCENTE` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APELLIDOS` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GENERO` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  PRIMARY KEY (`ID_DOCENTE`),
  KEY `fk_docente_usuario` (`ID_USUARIO`),
  CONSTRAINT `fk_docente_usuario` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `docente` */

insert  into `docente`(`ID_DOCENTE`,`NOMBRE`,`APELLIDOS`,`GENERO`,`EMAIL`,`ID_USUARIO`) values (1,'Nelys','Mollocondo Pari','F','nelys.mp@gmail.com',1),(2,'Christian','vilca quinonez','M','christian.vilcaq@gmail.com',2),(3,'Lizbeth','Mollocondo Pari','F','liz.mollocondo@gmail.com',3);

/*Table structure for table `evaluacion` */

DROP TABLE IF EXISTS `evaluacion`;

CREATE TABLE `evaluacion` (
  `ID_EVALUACION` int(11) NOT NULL AUTO_INCREMENT,
  `ID_EVALUACION_DEPENDENCIA` int(11) DEFAULT NULL,
  `ID_PERIODO` int(11) NOT NULL,
  `NOMBRE` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPCION` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLOR_FONDO` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLOR_TEXTO` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMULA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ES_FORMULA` bit(1) NOT NULL,
  PRIMARY KEY (`ID_EVALUACION`),
  KEY `fk_EVALUACION_PERIODO` (`ID_PERIODO`),
  CONSTRAINT `fk_EVALUACION_PERIODO` FOREIGN KEY (`ID_PERIODO`) REFERENCES `periodo` (`ID_PERIODO`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `evaluacion` */

insert  into `evaluacion`(`ID_EVALUACION`,`ID_EVALUACION_DEPENDENCIA`,`ID_PERIODO`,`NOMBRE`,`DESCRIPCION`,`COLOR_FONDO`,`COLOR_TEXTO`,`FORMULA`,`ES_FORMULA`) values (13,16,10,'Exp','exposicion','#ffffff','#000000','','\0'),(14,16,10,'EE','Examen de evaluación','#ffffff','#000000','','\0'),(15,16,10,'Asig Tar','Asignacion y tareas','#ffffff','#000000','','\0'),(16,0,10,'Promedio C1','','#337ab7','#ffffff','0.15*idEvaluacion_13+0.7*idEvaluacion_14+0.15*idEvaluacion_15','');

/*Table structure for table `horario` */

DROP TABLE IF EXISTS `horario`;

CREATE TABLE `horario` (
  `ID_HORARIO` int(11) NOT NULL AUTO_INCREMENT,
  `DIA` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HORA_INICIO` time DEFAULT NULL,
  `HORA_FIN` time DEFAULT NULL,
  `ID_CURSO` int(11) NOT NULL,
  PRIMARY KEY (`ID_HORARIO`),
  KEY `fk_HORARIO_CURSO` (`ID_CURSO`),
  CONSTRAINT `fk_HORARIO_CURSO` FOREIGN KEY (`ID_CURSO`) REFERENCES `curso` (`ID_CURSO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `horario` */

/*Table structure for table `nota` */

DROP TABLE IF EXISTS `nota`;

CREATE TABLE `nota` (
  `ID_NOTA` int(11) NOT NULL AUTO_INCREMENT,
  `ID_ALUMNO` int(11) DEFAULT NULL,
  `ID_EVALUACION` int(11) NOT NULL,
  `NOTA_EVALUATIVA` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_NOTA`),
  KEY `FK_ALUMNO_NOTA` (`ID_ALUMNO`),
  KEY `FK_EVALUACION_NOTA` (`ID_EVALUACION`),
  CONSTRAINT `FK_ALUMNO_NOTA` FOREIGN KEY (`ID_ALUMNO`) REFERENCES `alumno` (`ID_ALUMNO`),
  CONSTRAINT `FK_EVALUACION_NOTA` FOREIGN KEY (`ID_EVALUACION`) REFERENCES `evaluacion` (`ID_EVALUACION`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `nota` */

insert  into `nota`(`ID_NOTA`,`ID_ALUMNO`,`ID_EVALUACION`,`NOTA_EVALUATIVA`) values (23,44,13,4),(24,44,14,7),(25,44,15,17);

/*Table structure for table `periodo` */

DROP TABLE IF EXISTS `periodo`;

CREATE TABLE `periodo` (
  `ID_PERIODO` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO_PERIODOS` int(11) DEFAULT NULL,
  `DESCRIPCION` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_CURSO` int(11) NOT NULL,
  PRIMARY KEY (`ID_PERIODO`),
  KEY `fk_PERIODO_CURSO` (`ID_CURSO`),
  CONSTRAINT `fk_PERIODO_CURSO` FOREIGN KEY (`ID_CURSO`) REFERENCES `curso` (`ID_CURSO`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `periodo` */

insert  into `periodo`(`ID_PERIODO`,`NUMERO_PERIODOS`,`DESCRIPCION`,`ID_CURSO`) values (1,1,'ciclo',1),(2,2,'ciclo',1),(3,3,'ciclo',1),(4,4,'ciclo',1),(5,5,'ciclo',1),(6,6,'ciclo',1),(7,1,'Trimestre',2),(8,2,'Trimestre',2),(9,3,'Trimestre',2),(10,1,'Trimestre',12),(11,2,'Trimestre',12),(12,3,'Trimestre',12);

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(4) DEFAULT NULL,
  `role` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `usuario` */

insert  into `usuario`(`id_usuario`,`username`,`password`,`enabled`,`role`) values (1,'nelys.mp@gmail.com','$2a$10$Qat9D7Zn5r83gTG7zu7dVOv0azSvbzVc4N8rHNbs2Ewp8ya1i62XO',1,'ROLE_ADMIN'),(2,'christian.vilcaq@gmail.com','$2a$10$RFRiE6D8WnX0YhnKHkDyqe0yNjXuymXqm2oMk4gAuh7nLHT5X4tW2',0,'ROLE_ADMIN'),(3,'liz.mollocondo@gmail.com','$2a$10$SPEo1UEpSAyvK6RMFYaqTOiW..qqE1ap5x9aJG8zlBBXnQ899s4qq',1,'ROLE_ADMIN');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
