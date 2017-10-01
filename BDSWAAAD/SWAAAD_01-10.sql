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
  `RECORDAR` bit(1) DEFAULT NULL,
  `ID_CURSO` int(11) NOT NULL,
  PRIMARY KEY (`ID_ACTIVIDAD`),
  KEY `FK_CURSO_ACTIVIDADPEDIDAGICA` (`ID_CURSO`),
  CONSTRAINT `FK_CURSO_ACTIVIDADPEDIDAGICA` FOREIGN KEY (`ID_CURSO`) REFERENCES `curso` (`ID_CURSO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `actividad_pedagogica` */

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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

/*Data for the table `alumno` */

insert  into `alumno`(`ID_ALUMNO`,`NOMBRES`,`APELLIDOS`,`GENERO`,`EMAIL`,`CONTRASENA`,`NRO_ORDEN`,`NOMBRES_APODERADO`,`APELLIDOS_APODERADO`,`EMAIL_APODERADO`,`IMAGEN`) values (1,'Brenda Laura','Arag�n Salinas','F','brenda .arag�n @gmail.com','brenda1234',1,'Fernando Carlos','Arag�n ','Arag�n @hotmail.com',NULL),(2,'Karla Stephany','Aranibar Tila','F','karla .aranibar @gmail.com','karla1234',2,'Josue ','Aranibar ','Aranibar @hotmail.com',NULL),(3,'Rosa Edith','Atayupanqui Due�as','F','rosa .atayupanqui @gmail.com','rosa1234',3,'Pedro Carlos','Atayupanqui ','Atayupanqui @hotmail.com',NULL),(4,'Grisel Mercedes','Bald�rrago Tinoco','F','grisel .bald�rrago @gmail.com','grisel1234',4,'Samuel Pedro','Bald�rrago ','Bald�rrago @hotmail.com',NULL),(5,'Angie Camila','Barriga Fern�ndez','F','angie .barriga @gmail.com','angie1234',5,'Cesar','Barriga ','Barriga @hotmail.com',NULL),(6,'Fiorela Alej','Begazo Vera','F','fiorela .begazo @gmail.com','fiorela1234',6,'Mario','Begazo ','Begazo @hotmail.com',NULL),(7,'Yenifer Pilar','Cahuana Pacha','F','yenifer .cahuana @gmail.com','yenifer1234',7,'Roberto','Cahuana ','Cahuana @hotmail.com',NULL),(8,'Lizbeth Reyna','Cayani Tejada','F','lizbeth .cayani @gmail.com','lizbeth1234',8,'Luis','Cayani ','Cayani @hotmail.com',NULL),(9,'Nicole Fabiola','Cayro Prevate','F','nicole .cayro @gmail.com','nicole1234',9,'Estefano','Cayro ','Cayro @hotmail.com',NULL),(10,'Amanda Rebeca','Cazorla Jim�nez','F','amanda .cazorla @gmail.com','amanda1234',10,'David','Cazorla ','Cazorla @hotmail.com',NULL),(11,'Bettsy Brigite','Ccalachua Aquepucho','F','bettsy .ccalachua @gmail.com','bettsy1234',11,'Cesar Luis','Ccalachua ','Ccalachua @hotmail.com',NULL),(12,'Claudia Betsa','Chavez Marin','F','claudia .chavez @gmail.com','claudia1234',12,'Julios Cesar','Chavez ','Chavez @hotmail.com',NULL),(13,'Karina Ximena','Checcori Moina','F','karina .checcori @gmail.com','karina1234',13,'Jhonatan Julio','Checcori ','Checcori @hotmail.com',NULL),(14,'Claudia Patricia','Delgado Frisancho','F','claudia .delgado @gmail.com','claudia1234',14,'Fabricio','Delgado ','Delgado @hotmail.com',NULL),(15,'Mayra Matilde','D�az C�rdenas','F','mayra .d�az @gmail.com','mayra1234',15,'Tomas','D�az ','D�az @hotmail.com',NULL),(16,'Leira Miluska','Enr�quez Huayta','F','leira .enr�quez @gmail.com','leira1234',16,NULL,'Enr�quez ','Enr�quez @hotmail.com',NULL),(17,'Allison Yolanda','Escalante Palacios','F','allison .escalante @gmail.com','allison1234',17,NULL,'Escalante ','Escalante @hotmail.com',NULL),(18,'Bianka Lucia','Garcia Iba�ez','F','bianka .garcia @gmail.com','bianka1234',18,NULL,'Garcia ','Garcia @hotmail.com',NULL),(19,'Milagros A.','Motta Rond�n','F','milagros .motta @gmail.com','milagros1234',19,NULL,'Motta ','Motta @hotmail.com',NULL),(20,'Diana Margior','N��ez Ch�vez','F','diana .n��ez @gmail.com','diana1234',20,NULL,'N��ez ','N��ez @hotmail.com',NULL),(21,'Shirley Patric','Ortiz Delgado','F','shirley .ortiz @gmail.com','shirley1234',21,NULL,'Ortiz ','Ortiz @hotmail.com',NULL),(22,'Ana Paula','Osorio Vargas','F','ana .osorio @gmail.com','ana1234',22,NULL,'Osorio ','Osorio @hotmail.com',NULL),(23,'Lizeth Diana','Pe�a Villafuerte','F','lizeth .pe�a @gmail.com','lizeth1234',23,NULL,'Pe�a ','Pe�a @hotmail.com',NULL),(24,'Luz Clara','Pillco Ramos','F','luz .pillco @gmail.com','luz1234',24,NULL,'Pillco ','Pillco @hotmail.com',NULL),(25,'Alanys Virginia','Pineda Fern�ndez','F','alanys .pineda @gmail.com','alanys1234',25,NULL,'Pineda ','Pineda @hotmail.com',NULL),(26,'Carla Daniela','Quiroz Condori','F','carla .quiroz @gmail.com','carla1234',26,NULL,'Quiroz ','Quiroz @hotmail.com',NULL),(27,'Yakelyn Pao','Rios Salas','F','yakelyn .rios @gmail.com','yakelyn1234',27,NULL,'Rios ','Rios @hotmail.com',NULL),(28,'Virginia del Carme','Rodr�guez Delelis','F','virginia .rodr�guez @gmail.com','virginia1234',28,NULL,'Rodr�guez ','Rodr�guez @hotmail.com',NULL),(29,'Carola Andrea Alex','Rond�n De La Cruz','F','carola .rond�n @gmail.com','carola1234',29,NULL,'Rond�n ','Rond�n @hotmail.com',NULL),(30,'Stephanie Alexan','Salas Rodriguez','F','stephanie .salas @gmail.com','stephanie1234',30,NULL,'Salas ','Salas @hotmail.com',NULL),(31,'Luciana Anthua','Smith Postigo','F','luciana .smith @gmail.com','luciana1234',31,NULL,'Smith ','Smith @hotmail.com',NULL),(32,'Jose Manuel','Tejada Mamani','M','jose .tejada @gmail.com','jose1234',32,NULL,'Tejada ','Tejada @hotmail.com',NULL),(33,'Andrea Del Carmen','Valdivia Cisneros','F','andrea .valdivia @gmail.com','andrea1234',33,NULL,'Valdivia ','Valdivia @hotmail.com',NULL),(34,'Rosse Mary','Valdivia Paredes','F','rosse .valdivia @gmail.com','rosse1234',34,NULL,'Valdivia ','Valdivia @hotmail.com',NULL),(35,'Clara Giannella','Valdivia Tinajeros','F','clara .valdivia @gmail.com','clara1234',35,NULL,'Valdivia ','Valdivia @hotmail.com',NULL),(36,'Fabiola Cristin','Valencia Neyra','F','fabiola .valencia @gmail.com','fabiola1234',36,NULL,'Valencia ','Valencia @hotmail.com',NULL),(37,'Richard  A.','Hanco Mamani','M','richard .hanco @gmail.com','richard1234',37,NULL,'Hanco ','Hanco @hotmail.com',NULL),(38,'Denise Antonella','Zevallos Barriga','F','denise .zevallos @gmail.com','denise1234',38,NULL,'Zevallos ','Zevallos @hotmail.com',NULL),(39,'','',NULL,'',NULL,0,NULL,NULL,NULL,NULL),(40,'aaaa','aaaa',NULL,'aaaaa',NULL,0,NULL,NULL,NULL,NULL),(41,'aaaa','aaaaaa',NULL,'asdf@gmail.com',NULL,0,NULL,NULL,NULL,NULL),(42,'Lizeth Diana','Smith Postigo',NULL,'bbbb@gmail.com',NULL,0,NULL,NULL,NULL,NULL),(43,'Clara Giannella','Valdivia Tinajeros',NULL,'ccccccccc@gmail.com',NULL,0,NULL,NULL,NULL,NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `asistencia` */

/*Table structure for table `aula_dinamica` */

DROP TABLE IF EXISTS `aula_dinamica`;

CREATE TABLE `aula_dinamica` (
  `ID_AULA_DINAMICA` int(11) NOT NULL AUTO_INCREMENT,
  `X` int(11) DEFAULT NULL,
  `Y` int(11) DEFAULT NULL,
  `COLOR` varchar(7) DEFAULT NULL,
  `ID_CURSO` int(11) NOT NULL,
  PRIMARY KEY (`ID_AULA_DINAMICA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `aula_dinamica` */

insert  into `aula_dinamica`(`ID_AULA_DINAMICA`,`X`,`Y`,`COLOR`,`ID_CURSO`) values (1,306,296,'00a857',1),(2,192,291,'09619a',1),(3,82,225,'f18600',1),(4,79,86,'f13e00',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `curso_alumno` */

insert  into `curso_alumno`(`ID_CURSO_ALUMNO`,`ID_CURSO`,`ID_ALUMNO`) values (1,1,6),(2,1,2),(3,3,8),(4,2,1),(5,2,3),(6,2,4),(7,1,42),(8,1,43);

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
  `NOMBRE` varchar(60) DEFAULT NULL,
  `DESCRIPCION` varchar(30) DEFAULT NULL,
  `COLOR_FONDO` varchar(7) DEFAULT NULL,
  `COLOR_TEXTO` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`ID_EVALUACION`),
  KEY `FK_CURSO_EVALUACION_idx` (`ID_CURSO`),
  CONSTRAINT `FK_CURSO_EVALUACION` FOREIGN KEY (`ID_CURSO`) REFERENCES `curso` (`ID_CURSO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `evaluacion` */

insert  into `evaluacion`(`ID_EVALUACION`,`ID_CURSO`,`ID_EVALUACION_DEPENDENCIA`,`NOMBRE`,`DESCRIPCION`,`COLOR_FONDO`,`COLOR_TEXTO`) values (1,1,0,'TAREA1','a','#337ab7','#ffffff'),(2,1,0,'TAREA2','a','#5cb85c','#ffffff'),(3,1,4,'TAREA3','a','#5bc0de','#ffffff'),(4,1,13,'PROM','a','#f0ad4e','#ffffff'),(5,2,0,'TAREA1','a','#337ab7','#ffffff'),(6,2,8,'TAREA2','a','#000005','#ffffff'),(7,2,8,'TAREA3','a','#000006','#ffffff'),(8,2,13,'PROM','a','#000007','#ffffff'),(9,2,12,'TAREA1','a','#000000','#ffffff'),(10,2,12,'TAREA2','a','#000001','#ffffff'),(11,2,12,'TAREA3','a','#000002','#ffffff'),(12,2,13,'PROM','aa','#000003','#ffffff'),(13,2,0,'PROME','a','#000004','#ffffff'),(14,2,0,'EXP1','a','#000005','#ffffff'),(15,1,0,'TAREA 4','','#337ab7','#ffffff'),(16,1,0,'TAREA5','','#f0ad4e','#ffffff'),(17,1,0,'EXPO 1','','#5cb85c','#ffffff'),(18,1,0,'EXPO2','','#777777','#ffffff'),(19,1,0,'EXPO3','','#ebebeb','#000000'),(20,1,0,'EXPO4','','#337ab7','#ffffff');

/*Table structure for table `formula` */

DROP TABLE IF EXISTS `formula`;

CREATE TABLE `formula` (
  `ID_EVALUACION` int(11) NOT NULL,
  `SISTEMA` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  KEY `FK_CURSO_HORARIO` (`ID_CURSO`),
  CONSTRAINT `FK_CURSO_HORARIO` FOREIGN KEY (`ID_CURSO`) REFERENCES `curso` (`ID_CURSO`)
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `nota` */

insert  into `nota`(`ID_NOTA`,`ID_ALUMNO`,`ID_EVALUACION`,`NOTA_EVALUATIVA`) values (1,2,1,13),(2,2,2,5),(3,6,1,16),(4,7,5,16),(5,6,2,6),(6,6,3,1),(7,2,3,6),(8,2,4,2),(9,6,4,6),(10,1,5,4),(11,3,9,6),(12,1,11,0),(13,6,20,14);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user_roles` */

insert  into `user_roles`(`user_role_id`,`username`,`role`) values (1,'user','ROLE_ADMIN');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `username` varchar(45) NOT NULL,
  `password` varchar(60) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`username`,`password`,`enabled`) values ('user','$2a$10$5sS4zKvX6sGuiAc2sJj/YukoFw0.oZoZrL2f5Cl4i5OnTh4JxeyWS',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
