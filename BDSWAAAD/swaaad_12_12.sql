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
  `FECHA` datetime(6) DEFAULT NULL,
  `DESCRIPCION` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_CURSO` int(11) NOT NULL,
  PRIMARY KEY (`ID_ACTIVIDAD`),
  KEY `FK_CURSO_ACTIVIDADPEDAGOGICA` (`ID_CURSO`),
  CONSTRAINT `FK_CURSO_ACTIVIDADPEDAGOGICA` FOREIGN KEY (`ID_CURSO`) REFERENCES `curso` (`ID_CURSO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `actividad_pedagogica` */

insert  into `actividad_pedagogica`(`ID_ACTIVIDAD`,`FECHA`,`DESCRIPCION`,`ID_CURSO`) values (1,'2017-12-06 00:00:00.000000','Revisión de tarea',1);

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
  `ID_USUARIO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_ALUMNO`),
  KEY `fk_alumno_usuario` (`ID_USUARIO`),
  CONSTRAINT `fk_alumno_usuario` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `alumno` */

insert  into `alumno`(`ID_ALUMNO`,`NOMBRES`,`APELLIDOS`,`GENERO`,`EMAIL`,`NOMBRES_APODERADO`,`APELLIDOS_APODERADO`,`EMAIL_APODERADO`,`ID_USUARIO`) values (1,'Ana Maria','Copelo Sanchez',NULL,'ana@gmail.com','','','',NULL),(2,'Ruth ','Salazar Sucapuca',NULL,'rutsalazar@gmail.com','','','',NULL),(3,'Luis','Condori',NULL,'luis@hotmail.com',NULL,NULL,NULL,NULL),(4,'nelys','mollocondo','','','','','',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `asistencia` */

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `aula_dinamica` */

insert  into `aula_dinamica`(`ID_AULA_DINAMICA`,`COORD_X`,`COORD_Y`,`COLOR_TEXTO`,`COLOR_FONDO`,`ESTADO`,`ID_CURSO_ALUMNO`) values (16,19,27,'dd0707','fff200','\0',2),(17,90,26,'55e569','5111aa','\0',1);

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
  PRIMARY KEY (`ID_CURSO`),
  KEY `fk_CURSO_DOCENTE1` (`ID_DOCENTE`),
  CONSTRAINT `fk_CURSO_DOCENTE1` FOREIGN KEY (`ID_DOCENTE`) REFERENCES `docente` (`ID_DOCENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `curso` */

insert  into `curso`(`ID_CURSO`,`NOMBRE_CURSO`,`INSTITUCION`,`GRADO`,`SECCION`,`ANIO`,`ID_DOCENTE`) values (1,'Matematica','Arequipa',5,'E',2017,1),(2,'Aritmetica','Mendel',3,'A',2017,1),(3,'Seguridad informática','San Martin',4,'F',2017,1);

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
  CONSTRAINT `fk_CURSO_ALUMNO_CURSO` FOREIGN KEY (`ID_CURSO`) REFERENCES `curso` (`ID_CURSO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `curso_alumno` */

insert  into `curso_alumno`(`ID_CURSO_ALUMNO`,`ID_CURSO`,`ID_ALUMNO`) values (1,1,1),(2,1,2),(3,2,3),(4,1,4);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `docente` */

insert  into `docente`(`ID_DOCENTE`,`NOMBRE`,`APELLIDOS`,`GENERO`,`EMAIL`,`ID_USUARIO`) values (1,'Nelys','Mollocondo Pari','F','nelys.mp@gmail.com',1),(2,'Christian','vilca quinonez','M','christian.vilcaq@gmail.com',2);

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
  KEY `fk_EVALUACION_PERIODO1` (`ID_PERIODO`),
  CONSTRAINT `fk_EVALUACION_PERIODO1` FOREIGN KEY (`ID_PERIODO`) REFERENCES `periodo` (`ID_PERIODO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `evaluacion` */

/*Table structure for table `horario` */

DROP TABLE IF EXISTS `horario`;

CREATE TABLE `horario` (
  `ID_HORARIO` int(11) NOT NULL AUTO_INCREMENT,
  `DIA` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HORA_INICIO` time(6) DEFAULT NULL,
  `HORA_FIN` time(6) DEFAULT NULL,
  `ID_CURSO` int(11) NOT NULL,
  PRIMARY KEY (`ID_HORARIO`),
  KEY `fk_HORARIO_CURSO` (`ID_CURSO`),
  CONSTRAINT `fk_HORARIO_CURSO` FOREIGN KEY (`ID_CURSO`) REFERENCES `curso` (`ID_CURSO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `horario` */

insert  into `horario`(`ID_HORARIO`,`DIA`,`HORA_INICIO`,`HORA_FIN`,`ID_CURSO`) values (1,'Lunes','09:50:00.000000','11:50:00.000000',1),(2,'Lunes','09:50:00.000000','11:50:00.000000',1),(3,'Lunes','09:50:00.000000','11:50:00.000000',1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `nota` */

/*Table structure for table `periodo` */

DROP TABLE IF EXISTS `periodo`;

CREATE TABLE `periodo` (
  `ID_PERIODO` int(11) NOT NULL,
  `NUMERO_PERIODOS` int(11) DEFAULT NULL,
  `DESCRIPCION` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_CURSO` int(11) NOT NULL,
  PRIMARY KEY (`ID_PERIODO`),
  KEY `fk_PERIODO_CURSO` (`ID_CURSO`),
  CONSTRAINT `fk_PERIODO_CURSO` FOREIGN KEY (`ID_CURSO`) REFERENCES `curso` (`ID_CURSO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `periodo` */

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(4) DEFAULT NULL,
  `role` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `usuario` */

insert  into `usuario`(`id_usuario`,`username`,`password`,`enabled`,`role`) values (1,'nelys.mp@gmail.com','$2a$10$Qat9D7Zn5r83gTG7zu7dVOv0azSvbzVc4N8rHNbs2Ewp8ya1i62XO',1,'ROLE_ADMIN'),(2,'christian.vilcaq@gmail.com','$2a$10$RFRiE6D8WnX0YhnKHkDyqe0yNjXuymXqm2oMk4gAuh7nLHT5X4tW2',0,'ROLE_ADMIN');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
