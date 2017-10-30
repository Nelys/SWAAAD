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
CREATE DATABASE /*!32312 IF NOT EXISTS*/`swaaad` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `swaaad`;

/*Table structure for table `actividad_pedagogica` */

DROP TABLE IF EXISTS `actividad_pedagogica`;

CREATE TABLE `actividad_pedagogica` (
  `ID_ACTIVIDAD` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA` datetime(6) DEFAULT NULL,
  `DESCRIPCION` varchar(50) DEFAULT NULL,
  `RECORDAR` tinyint(1) DEFAULT NULL,
  `ID_CURSO_ALUMNO` int(11) NOT NULL,
  PRIMARY KEY (`ID_ACTIVIDAD`),
  KEY `FK_CURSO_ACTIVIDADPEDAGOGICA` (`ID_CURSO_ALUMNO`),
  CONSTRAINT `FK_CURSO_ACTIVIDADPEDAGOGICA` FOREIGN KEY (`ID_CURSO_ALUMNO`) REFERENCES `curso_alumno` (`ID_CURSO_ALUMNO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `actividad_pedagogica` */

insert  into `actividad_pedagogica`(`ID_ACTIVIDAD`,`FECHA`,`DESCRIPCION`,`RECORDAR`,`ID_CURSO_ALUMNO`) values (1,'2017-10-31 07:40:28.000000','Halloween',1,1);

/*Table structure for table `alumno` */

DROP TABLE IF EXISTS `alumno`;

CREATE TABLE `alumno` (
  `ID_ALUMNO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRES` varchar(50) DEFAULT NULL,
  `APELLIDOS` varchar(50) DEFAULT NULL,
  `GENERO` varchar(1) DEFAULT NULL,
  `EMAIL` varchar(60) DEFAULT NULL,
  `CONTRASENA` varchar(60) DEFAULT NULL,
  `NRO_ORDEN` int(11) DEFAULT NULL,
  `NOMBRES_APODERADO` varchar(50) DEFAULT NULL,
  `APELLIDOS_APODERADO` varchar(50) DEFAULT NULL,
  `EMAIL_APODERADO` varchar(60) DEFAULT NULL,
  `IMAGEN` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_ALUMNO`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

/*Data for the table `alumno` */

insert  into `alumno`(`ID_ALUMNO`,`NOMBRES`,`APELLIDOS`,`GENERO`,`EMAIL`,`CONTRASENA`,`NRO_ORDEN`,`NOMBRES_APODERADO`,`APELLIDOS_APODERADO`,`EMAIL_APODERADO`,`IMAGEN`) values (1,'Brenda Laura','Arag�n Salinas','F','brenda .arag�n @gmail.com','brenda1234',1,'Fernando Carlos','Arag�n ','Arag�n @hotmail.com',NULL),(2,'Karla Stephany','Aranibar Tila','F','karla .aranibar @gmail.com','karla1234',2,'Josue ','Aranibar ','Aranibar @hotmail.com',NULL),(3,'Rosa Edith','Atayupanqui Due�as','F','rosa .atayupanqui @gmail.com','rosa1234',3,'Pedro Carlos','Atayupanqui ','Atayupanqui @hotmail.com',NULL),(4,'Grisel Mercedes','Bald�rrago Tinoco','F','grisel .bald�rrago @gmail.com','grisel1234',4,'Samuel Pedro','Bald�rrago ','Bald�rrago @hotmail.com',NULL),(5,'Angie Camila','Barriga Fern�ndez','F','angie .barriga @gmail.com','angie1234',5,'Cesar','Barriga ','Barriga @hotmail.com',NULL),(6,'Fiorela Alejaa','Begazo Vera',NULL,'fiorela .begazo @gmail.com',NULL,0,NULL,NULL,NULL,NULL),(7,'Yenifer Pilar','Cahuana Pacha','F','yenifer .cahuana @gmail.com','yenifer1234',7,'Roberto','Cahuana ','Cahuana @hotmail.com',NULL),(8,'Lizbeth Reyna','Cayani Tejada','F','lizbeth .cayani @gmail.com','lizbeth1234',8,'Luis','Cayani ','Cayani @hotmail.com',NULL),(9,'Nicole Fabiola','Cayro Prevate','F','nicole .cayro @gmail.com','nicole1234',9,'Estefano','Cayro ','Cayro @hotmail.com',NULL),(10,'Amanda Rebeca','Cazorla Jim�nez','F','amanda .cazorla @gmail.com','amanda1234',10,'David','Cazorla ','Cazorla @hotmail.com',NULL),(11,'Bettsy Brigite','Ccalachua Aquepucho','F','bettsy .ccalachua @gmail.com','bettsy1234',11,'Cesar Luis','Ccalachua ','Ccalachua @hotmail.com',NULL),(12,'Claudia Betsa','Chavez Marin','F','claudia .chavez @gmail.com','claudia1234',12,'Julios Cesar','Chavez ','Chavez @hotmail.com',NULL),(13,'Karina Ximena','Checcori Moina','F','karina .checcori @gmail.com','karina1234',13,'Jhonatan Julio','Checcori ','Checcori @hotmail.com',NULL),(14,'Claudia Patricia','Delgado Frisancho','F','claudia .delgado @gmail.com','claudia1234',14,'Fabricio','Delgado ','Delgado @hotmail.com',NULL),(15,'Mayra Matilde','D�az C�rdenas','F','mayra .d�az @gmail.com','mayra1234',15,'Tomas','D�az ','D�az @hotmail.com',NULL),(16,'Leira Miluska','Enr�quez Huayta','F','leira .enr�quez @gmail.com','leira1234',16,NULL,'Enr�quez ','Enr�quez @hotmail.com',NULL),(17,'Allison Yolanda','Escalante Palacios','F','allison .escalante @gmail.com','allison1234',17,NULL,'Escalante ','Escalante @hotmail.com',NULL),(18,'Bianka Lucia','Garcia Iba�ez','F','bianka .garcia @gmail.com','bianka1234',18,NULL,'Garcia ','Garcia @hotmail.com',NULL),(19,'Milagros A.','Motta Rond�n','F','milagros .motta @gmail.com','milagros1234',19,NULL,'Motta ','Motta @hotmail.com',NULL),(20,'Diana Margior','N��ez Ch�vez','F','diana .n��ez @gmail.com','diana1234',20,NULL,'N��ez ','N��ez @hotmail.com',NULL),(21,'Shirley Patric','Ortiz Delgado','F','shirley .ortiz @gmail.com','shirley1234',21,NULL,'Ortiz ','Ortiz @hotmail.com',NULL),(22,'Ana Paula','Osorio Vargas','F','ana .osorio @gmail.com','ana1234',22,NULL,'Osorio ','Osorio @hotmail.com',NULL),(23,'Lizeth Diana','Pe�a Villafuerte','F','lizeth .pe�a @gmail.com','lizeth1234',23,NULL,'Pe�a ','Pe�a @hotmail.com',NULL),(24,'Luz Clara','Pillco Ramos','F','luz .pillco @gmail.com','luz1234',24,NULL,'Pillco ','Pillco @hotmail.com',NULL),(25,'Alanys Virginia','Pineda Fern�ndez','F','alanys .pineda @gmail.com','alanys1234',25,NULL,'Pineda ','Pineda @hotmail.com',NULL),(26,'Carla Daniela','Quiroz Condori','F','carla .quiroz @gmail.com','carla1234',26,NULL,'Quiroz ','Quiroz @hotmail.com',NULL),(27,'Yakelyn Pao','Rios Salas','F','yakelyn .rios @gmail.com','yakelyn1234',27,NULL,'Rios ','Rios @hotmail.com',NULL),(28,'Virginia del Carme','Rodr�guez Delelis','F','virginia .rodr�guez @gmail.com','virginia1234',28,NULL,'Rodr�guez ','Rodr�guez @hotmail.com',NULL),(29,'Carola Andrea Alex','Rond�n De La Cruz','F','carola .rond�n @gmail.com','carola1234',29,NULL,'Rond�n ','Rond�n @hotmail.com',NULL),(30,'Stephanie Alexan','Salas Rodriguez','F','stephanie .salas @gmail.com','stephanie1234',30,NULL,'Salas ','Salas @hotmail.com',NULL),(31,'Luciana Anthua','Smith Postigo','F','luciana .smith @gmail.com','luciana1234',31,NULL,'Smith ','Smith @hotmail.com',NULL),(32,'Jose Manuel','Tejada Mamani','M','jose .tejada @gmail.com','jose1234',32,NULL,'Tejada ','Tejada @hotmail.com',NULL),(33,'Andrea Del Carmen','Valdivia Cisneros','F','andrea .valdivia @gmail.com','andrea1234',33,NULL,'Valdivia ','Valdivia @hotmail.com',NULL),(34,'Rosse Mary','Valdivia Paredes','F','rosse .valdivia @gmail.com','rosse1234',34,NULL,'Valdivia ','Valdivia @hotmail.com',NULL),(35,'Clara Giannella','Valdivia Tinajeros','F','clara .valdivia @gmail.com','clara1234',35,NULL,'Valdivia ','Valdivia @hotmail.com',NULL),(36,'Fabiola Cristin','Valencia Neyra','F','fabiola .valencia @gmail.com','fabiola1234',36,NULL,'Valencia ','Valencia @hotmail.com',NULL),(37,'Richard  A.','Hanco Mamani','M','richard .hanco @gmail.com','richard1234',37,NULL,'Hanco ','Hanco @hotmail.com',NULL),(38,'Denise Antonella','Zevallos Barriga','F','denise .zevallos @gmail.com','denise1234',38,NULL,'Zevallos ','Zevallos @hotmail.com',NULL),(39,'','',NULL,'',NULL,0,NULL,NULL,NULL,NULL),(40,'aaaa','aaaa',NULL,'aaaaa',NULL,0,NULL,NULL,NULL,NULL),(41,'aaaa','aaaaaa',NULL,'asdf@gmail.com',NULL,0,NULL,NULL,NULL,NULL),(42,'Lizeth Diana','Smith Postigo',NULL,'bbbb@gmail.com',NULL,0,NULL,NULL,NULL,NULL),(43,'Clara Giannella','Valdivia Tinajeros',NULL,'ccccccccc@gmail.com',NULL,0,NULL,NULL,NULL,NULL),(44,'Ana Maria','Sanchez Diaz',NULL,'',NULL,0,NULL,NULL,NULL,NULL),(45,'Ana Maria','Soto saens',NULL,'maria@gmail.com',NULL,0,NULL,NULL,NULL,NULL);

/*Table structure for table `asistencia` */

DROP TABLE IF EXISTS `asistencia`;

CREATE TABLE `asistencia` (
  `ID_ASISTENCIA` int(11) NOT NULL AUTO_INCREMENT,
  `ESTADO` varchar(1) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `ID_CURSO_ALUMNO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_ASISTENCIA`),
  KEY `FK_CURSOALUMNO_ASISTENCIA` (`ID_CURSO_ALUMNO`),
  CONSTRAINT `FK_CURSOALUMNO_ASISTENCIA` FOREIGN KEY (`ID_CURSO_ALUMNO`) REFERENCES `curso_alumno` (`ID_CURSO_ALUMNO`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8;

/*Data for the table `asistencia` */

insert  into `asistencia`(`ID_ASISTENCIA`,`ESTADO`,`FECHA`,`ID_CURSO_ALUMNO`) values (143,'F','2017-10-10',1),(144,'A','2017-10-11',2),(145,'A','2017-10-11',3),(146,'A','2017-10-10',4),(147,'A','2017-10-10',5),(148,'A','2017-11-11',1),(149,'A','2017-11-11',2),(150,'A','2017-11-11',3),(151,'A','2017-11-11',4),(152,'A','2017-11-11',5),(153,'T','2017-12-12',1),(154,'A','2017-12-12',2),(155,'F','2017-12-12',3),(156,'A','2017-12-12',4),(157,'A','2017-12-12',5),(158,'A','2017-10-10',6),(159,'A','2017-10-10',7),(160,'F','2017-10-10',8),(161,'A','2017-10-10',9),(162,'A','2017-10-10',10),(163,'A','2017-11-11',6),(164,'A','2017-11-11',7),(165,'F','2017-11-11',8),(166,'A','2017-11-11',9),(167,'A','2017-11-11',10),(168,'A','2017-12-12',6),(169,'A','2017-12-12',7),(170,'F','2017-12-12',8),(171,'A','2017-12-12',9),(172,'A','2017-12-12',10),(173,'A','2017-09-11',11),(174,'A','2017-09-11',12),(175,'F','2017-09-11',13),(176,'A','2017-09-11',14),(177,'A','2017-09-11',15),(178,'A','2017-10-12',11),(179,'A','2017-10-12',12),(180,'F','2017-10-12',13),(181,'A','2017-10-12',14),(182,'A','2017-10-12',15),(183,'A','2017-11-13',11),(184,'A','2017-11-13',12),(185,'F','2017-11-13',13),(186,'A','2017-11-13',14),(187,'A','2017-11-13',15),(188,NULL,NULL,NULL);

/*Table structure for table `aula_dinamica` */

DROP TABLE IF EXISTS `aula_dinamica`;

CREATE TABLE `aula_dinamica` (
  `ID_AULA_DINAMICA` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CURSO_ALUMNO` int(11) DEFAULT NULL,
  `COORD_X` int(11) DEFAULT NULL,
  `COORD_Y` int(11) DEFAULT NULL,
  `COLOR_TEXTO` varchar(7) DEFAULT NULL,
  `COLOR_FONDO` varchar(7) DEFAULT NULL,
  `ESTADO` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_AULA_DINAMICA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `aula_dinamica` */

insert  into `aula_dinamica`(`ID_AULA_DINAMICA`,`ID_CURSO_ALUMNO`,`COORD_X`,`COORD_Y`,`COLOR_TEXTO`,`COLOR_FONDO`,`ESTADO`) values (1,1,306,296,NULL,'00a857',NULL),(2,1,192,291,NULL,'09619a',NULL),(3,NULL,86,56,NULL,'f18600',NULL),(4,NULL,380,42,NULL,'f13e00',NULL);

/*Table structure for table `curso` */

DROP TABLE IF EXISTS `curso`;

CREATE TABLE `curso` (
  `ID_CURSO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_CURSO` varchar(60) NOT NULL,
  `INSTITUCION` varchar(60) DEFAULT NULL,
  `GRADO` int(11) DEFAULT NULL,
  `SECCION` varchar(1) DEFAULT NULL,
  `ANIO` int(4) DEFAULT NULL,
  `ID_DOCENTE` int(11) NOT NULL,
  PRIMARY KEY (`ID_CURSO`),
  KEY `fk_CURSO_DOCENTE1` (`ID_DOCENTE`),
  CONSTRAINT `fk_CURSO_DOCENTE1` FOREIGN KEY (`ID_DOCENTE`) REFERENCES `docente` (`ID_DOCENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `curso` */

insert  into `curso`(`ID_CURSO`,`NOMBRE_CURSO`,`INSTITUCION`,`GRADO`,`SECCION`,`ANIO`,`ID_DOCENTE`) values (1,'Matematica','Arequipa',5,'E',2017,1),(2,'Ciencia y Abiente','Arequipa',3,'F',2017,1),(3,'Aritmetica','Bryce',1,'C',2017,1),(4,'Matematica','Mu�oz Najar',5,'E',2017,2),(5,'Biologia','Mu�oz Najar',4,'A',2017,2),(6,'Fisica I','Mu�oz Najar',5,'C',2017,2);

/*Table structure for table `curso_alumno` */

DROP TABLE IF EXISTS `curso_alumno`;

CREATE TABLE `curso_alumno` (
  `ID_CURSO_ALUMNO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CURSO` int(11) NOT NULL,
  `ID_ALUMNO` int(11) NOT NULL,
  PRIMARY KEY (`ID_CURSO_ALUMNO`),
  KEY `fk_CURSO_ALUMNO_ALUMNO1` (`ID_ALUMNO`),
  KEY `fk_CURSO_ALUMNO_CURSO_idx` (`ID_CURSO`),
  CONSTRAINT `fk_CURSO_ALUMNO_ALUMNO1` FOREIGN KEY (`ID_ALUMNO`) REFERENCES `alumno` (`ID_ALUMNO`),
  CONSTRAINT `fk_CURSO_ALUMNO_CURSO` FOREIGN KEY (`ID_CURSO`) REFERENCES `curso` (`ID_CURSO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `curso_alumno` */

insert  into `curso_alumno`(`ID_CURSO_ALUMNO`,`ID_CURSO`,`ID_ALUMNO`) values (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,2,1),(7,2,2),(8,2,3),(9,2,4),(10,2,6),(11,3,11),(12,3,12),(13,3,13),(14,3,14),(15,3,15),(16,1,45);

/*Table structure for table `docente` */

DROP TABLE IF EXISTS `docente`;

CREATE TABLE `docente` (
  `ID_DOCENTE` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `APELLIDOS` varchar(50) DEFAULT NULL,
  `GENERO` varchar(1) DEFAULT NULL,
  `EMAIL` varchar(60) DEFAULT NULL,
  `CONTRASENA` varchar(60) DEFAULT NULL,
  `FOTO` varchar(100) DEFAULT NULL,
  `USUARIO` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_DOCENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `docente` */

insert  into `docente`(`ID_DOCENTE`,`NOMBRE`,`APELLIDOS`,`GENERO`,`EMAIL`,`CONTRASENA`,`FOTO`,`USUARIO`) values (1,'Carlos','Supo Mollocondo','M','carlos.supo@gmail.com','123456',NULL,'1'),(2,'Lilian','Arias Lizares','F','LilianLizares@gmail.com','123456',NULL,'2'),(3,'Claudia ','Quispe Ruiz','F','claudiaquispe@gmail.com','123456',NULL,'3'),(4,'Karina Viviana','Prado Umpire','F','KarinVivi@gmail.com','123456',NULL,'4'),(5,'Kelvin','Macedo Ylachoque','M','Kerlvinmacedo@gmail.com','123456',NULL,'5');

/*Table structure for table `evaluacion` */

DROP TABLE IF EXISTS `evaluacion`;

CREATE TABLE `evaluacion` (
  `ID_EVALUACION` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CURSO` int(11) NOT NULL,
  `ID_EVALUACION_DEPENDENCIA` int(11) DEFAULT NULL,
  `NOMBRE` varchar(30) DEFAULT NULL,
  `DESCRIPCION` varchar(60) DEFAULT NULL,
  `COLOR_FONDO` varchar(7) DEFAULT NULL,
  `COLOR_TEXTO` varchar(7) DEFAULT NULL,
  `FORMULA` varchar(255) DEFAULT NULL,
  `ES_FORMULA` bit(1) NOT NULL,
  PRIMARY KEY (`ID_EVALUACION`),
  KEY `FK_CURSO_EVALUACION_idx` (`ID_CURSO`),
  CONSTRAINT `FK_CURSO_EVALUACION` FOREIGN KEY (`ID_CURSO`) REFERENCES `curso` (`ID_CURSO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `evaluacion` */

insert  into `evaluacion`(`ID_EVALUACION`,`ID_CURSO`,`ID_EVALUACION_DEPENDENCIA`,`NOMBRE`,`DESCRIPCION`,`COLOR_FONDO`,`COLOR_TEXTO`,`FORMULA`,`ES_FORMULA`) values (1,1,0,'tarea1','','#ffffff','#000000','idEvaluacion_1idEvaluacion_3','\0'),(2,1,4,'TAREA2','a','#ffffff','#000000','0','\0'),(3,1,0,'TAREA3','a','#ffffff','#000000','0','\0'),(4,1,25,'PROM','a','#e6deac','#000000','(idEvaluacion_1+idEvaluacion_2+idEvaluacion_3)/3',''),(5,2,0,'TAREA1','a','#337ab7','#ffffff',NULL,'\0'),(6,2,8,'TAREA2','a','#000005','#ffffff',NULL,'\0'),(7,2,8,'TAREA3','a','#000006','#ffffff',NULL,'\0'),(8,2,13,'PROM','a','#000007','#ffffff',NULL,'\0'),(9,2,12,'TAREA1','a','#000000','#ffffff',NULL,'\0'),(10,2,12,'TAREA2','a','#000001','#ffffff',NULL,'\0'),(11,2,12,'TAREA3','a','#000002','#ffffff',NULL,'\0'),(12,2,13,'PROM','aa','#000003','#ffffff',NULL,'\0'),(13,2,0,'PROME','a','#000004','#ffffff',NULL,'\0'),(14,2,0,'EXP1','a','#000005','#ffffff',NULL,'\0'),(15,1,17,'TAREA 1','','#ffffff','#000000','','\0'),(16,1,17,'TAREA5','','#ffffff','#000000','','\0'),(17,1,25,'PROM 1','','#5cb85c','#ffffff','idEvaluacion_15+idEvaluacion_16',''),(18,1,20,'EXPO2','','#ffffff','#000000','','\0'),(19,1,20,'EXPO3','','#ffffff','#000000','','\0'),(20,1,25,'EXPO4','','#337ab7','#ffffff','idEvaluacion_18+idEvaluacion_19',''),(25,1,0,'QWER','QWER','#777777','#000000','idEvaluacion_4+idEvaluacion_17+idEvaluacion_20',''),(26,1,0,'aa','asa','#7e4949','#160303','idEvaluacion_1+9',''),(27,1,0,'prueba','prome','#ffffff','#0e0e0e','','\0');

/*Table structure for table `formula` */

DROP TABLE IF EXISTS `formula`;

CREATE TABLE `formula` (
  `ID_EVALUACION` int(11) NOT NULL AUTO_INCREMENT,
  `SISTEMA` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_EVALUACION`),
  KEY `ID_EVALUACION` (`ID_EVALUACION`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `formula` */

insert  into `formula`(`ID_EVALUACION`,`SISTEMA`) values (4,'(ID_1+ID_2+ID_3)/3');

/*Table structure for table `horario` */

DROP TABLE IF EXISTS `horario`;

CREATE TABLE `horario` (
  `ID_HORARIO` int(11) NOT NULL AUTO_INCREMENT,
  `DIA` date DEFAULT NULL,
  `HORA_INICIO` time(6) DEFAULT NULL,
  `HORA_FIN` time(6) DEFAULT NULL,
  `ID_CURSO` int(11) NOT NULL,
  PRIMARY KEY (`ID_HORARIO`),
  KEY `fk_HORARIO_CURSO` (`ID_CURSO`),
  CONSTRAINT `fk_HORARIO_CURSO` FOREIGN KEY (`ID_CURSO`) REFERENCES `curso` (`ID_CURSO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `horario` */

/*Table structure for table `nota` */

DROP TABLE IF EXISTS `nota`;

CREATE TABLE `nota` (
  `ID_NOTA` int(11) NOT NULL AUTO_INCREMENT,
  `ID_ALUMNO` int(11) DEFAULT NULL,
  `ID_EVALUACION` int(11) NOT NULL,
  `NOTA_EVALUATIVA` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_NOTA`),
  KEY `FK_EVALUACION_NOTA_idx` (`ID_EVALUACION`),
  KEY `FK_ALUMNO_NOTA_idx` (`ID_ALUMNO`),
  CONSTRAINT `FK_ALUMNO_NOTA` FOREIGN KEY (`ID_ALUMNO`) REFERENCES `alumno` (`ID_ALUMNO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_EVALUACION_NOTA` FOREIGN KEY (`ID_EVALUACION`) REFERENCES `evaluacion` (`ID_EVALUACION`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

/*Data for the table `nota` */

insert  into `nota`(`ID_NOTA`,`ID_ALUMNO`,`ID_EVALUACION`,`NOTA_EVALUATIVA`) values (1,2,1,20),(2,2,2,7),(3,1,1,7),(4,7,5,16),(5,6,2,15),(6,6,3,20),(7,2,3,13),(8,2,4,10),(9,6,4,14),(10,1,5,4),(11,3,9,6),(12,1,11,0),(13,6,20,16),(14,6,18,2),(15,43,1,1),(16,43,2,1),(21,42,4,1),(22,43,4,1),(23,6,15,8),(24,6,16,20),(25,6,17,28),(26,2,17,4),(27,42,17,7),(28,43,17,4),(29,2,20,1),(30,42,20,1),(31,43,20,1),(32,6,25,58),(33,2,25,15),(34,42,25,9),(35,43,25,6),(36,6,19,14),(37,42,1,2),(38,2,15,3),(39,42,15,2),(40,42,16,5),(41,2,16,1),(42,43,15,2),(43,43,16,2),(44,2,19,1),(45,42,19,3),(46,43,19,1),(47,44,15,2),(48,44,17,2),(49,44,20,0),(50,44,25,2),(51,6,1,8),(52,6,26,17),(53,2,26,22),(54,42,26,11),(55,43,26,10),(56,44,26,9),(57,1,2,2),(58,1,3,6),(59,1,15,4);

/*Table structure for table `pregunta` */

DROP TABLE IF EXISTS `pregunta`;

CREATE TABLE `pregunta` (
  `ID_PREGUNTA` int(11) NOT NULL AUTO_INCREMENT,
  `PREGUNTA` varchar(60) DEFAULT NULL,
  `TEMA` varchar(255) DEFAULT NULL,
  `ID_CURSO` int(11) NOT NULL,
  PRIMARY KEY (`ID_PREGUNTA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pregunta` */

/*Table structure for table `user_roles` */

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`user_role_id`),
  UNIQUE KEY `uni_username_role` (`role`,`username`),
  KEY `fk_username_idx` (`username`),
  CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `user_roles` */

insert  into `user_roles`(`user_role_id`,`username`,`role`) values (3,'luis','ROLE_ADMIN'),(1,'user','ROLE_ADMIN');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `username` varchar(45) NOT NULL,
  `password` varchar(60) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`username`,`password`,`enabled`) values ('luis','$2a$10$5sS4zKvX6sGuiAc2sJj/YukoFw0.oZoZrL2f5Cl4i5OnTh4JxeyWS',1),('user','$2a$10$eGR3JIDoDSX.aJnnJ26L0OUAftI8k3Yc9jgIy3hqR43SlBaasRVFK',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
