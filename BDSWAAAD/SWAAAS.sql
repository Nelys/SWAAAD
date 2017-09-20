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
  KEY `fk_actividadpedagogica_curso1` (`ID_CURSO`),
  CONSTRAINT `fk_actividadpedagogica_curso1` FOREIGN KEY (`ID_CURSO`) REFERENCES `curso` (`ID_CURSO`)
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `alumno` */

insert  into `alumno`(`ID_ALUMNO`,`NOMBRES`,`APELLIDOS`,`GENERO`,`EMAIL`,`CONTRASENA`,`NRO_ORDEN`,`NOMBRES_APODERADO`,`APELLIDOS_APODERADO`,`EMAIL_APODERADO`,`IMAGEN`) values (2,'Brenda Laura','Aragón Salinas','F','brenda .aragón @gmail.com','brenda1234',1,'Fernando Carlos','Aragón ','Aragón @hotmail.com',NULL),(3,'Karla Stephany','Aranibar Tila','F','karla .aranibar @gmail.com','karla1234',2,'Josue ','Aranibar ','Aranibar @hotmail.com',NULL),(4,'Rosa Edith','Atayupanqui Dueñas','F','rosa .atayupanqui @gmail.com','rosa1234',3,'Pedro Carlos','Atayupanqui ','Atayupanqui @hotmail.com',NULL),(5,'Grisel Mercedes','Baldárrago Tinoco','F','grisel .baldárrago @gmail.com','grisel1234',4,'Samuel Pedro','Baldárrago ','Baldárrago @hotmail.com',NULL),(6,'Angie Camila','Barriga Fernández','F','angie .barriga @gmail.com','angie1234',5,'Cesar','Barriga ','Barriga @hotmail.com',NULL),(7,'Fiorela Alej','Begazo Vera','F','fiorela .begazo @gmail.com','fiorela1234',6,'Mario','Begazo ','Begazo @hotmail.com',NULL),(8,'Yenifer Pilar','Cahuana Pacha','F','yenifer .cahuana @gmail.com','yenifer1234',7,'Roberto','Cahuana ','Cahuana @hotmail.com',NULL),(9,'Lizbeth Reyna','Cayani Tejada','F','lizbeth .cayani @gmail.com','lizbeth1234',8,'Luis','Cayani ','Cayani @hotmail.com',NULL),(10,'Nicole Fabiola','Cayro Prevate','F','nicole .cayro @gmail.com','nicole1234',9,'Estefano','Cayro ','Cayro @hotmail.com',NULL),(11,'Amanda Rebeca','Cazorla Jiménez','F','amanda .cazorla @gmail.com','amanda1234',10,'David','Cazorla ','Cazorla @hotmail.com',NULL),(12,'Bettsy Brigite','Ccalachua Aquepucho','F','bettsy .ccalachua @gmail.com','bettsy1234',11,'Cesar Luis','Ccalachua ','Ccalachua @hotmail.com',NULL),(13,'Claudia Betsa','Chavez Marin','F','claudia .chavez @gmail.com','claudia1234',12,'Julios Cesar','Chavez ','Chavez @hotmail.com',NULL),(14,'Karina Ximena','Checcori Moina','F','karina .checcori @gmail.com','karina1234',13,'Jhonatan Julio','Checcori ','Checcori @hotmail.com',NULL),(15,'Claudia Patricia','Delgado Frisancho','F','claudia .delgado @gmail.com','claudia1234',14,'Fabricio','Delgado ','Delgado @hotmail.com',NULL),(16,'Mayra Matilde','Díaz Cárdenas','F','mayra .díaz @gmail.com','mayra1234',15,'Tomas','Díaz ','Díaz @hotmail.com',NULL),(17,'Leira Miluska','Enríquez Huayta','F','leira .enríquez @gmail.com','leira1234',16,NULL,'Enríquez ','Enríquez @hotmail.com',NULL),(18,'Allison Yolanda','Escalante Palacios','F','allison .escalante @gmail.com','allison1234',17,NULL,'Escalante ','Escalante @hotmail.com',NULL),(19,'Bianka Lucia','Garcia Ibañez','F','bianka .garcia @gmail.com','bianka1234',18,NULL,'Garcia ','Garcia @hotmail.com',NULL),(20,'Milagros A.','Motta Rondón','F','milagros .motta @gmail.com','milagros1234',19,NULL,'Motta ','Motta @hotmail.com',NULL),(21,'Diana Margior','Núñez Chávez','F','diana .núñez @gmail.com','diana1234',20,NULL,'Núñez ','Núñez @hotmail.com',NULL),(22,'Shirley Patric','Ortiz Delgado','F','shirley .ortiz @gmail.com','shirley1234',21,NULL,'Ortiz ','Ortiz @hotmail.com',NULL),(23,'Ana Paula','Osorio Vargas','F','ana .osorio @gmail.com','ana1234',22,NULL,'Osorio ','Osorio @hotmail.com',NULL),(24,'Lizeth Diana','Peña Villafuerte','F','lizeth .peña @gmail.com','lizeth1234',23,NULL,'Peña ','Peña @hotmail.com',NULL),(25,'Luz Clara','Pillco Ramos','F','luz .pillco @gmail.com','luz1234',24,NULL,'Pillco ','Pillco @hotmail.com',NULL),(26,'Alanys Virginia','Pineda Fernández','F','alanys .pineda @gmail.com','alanys1234',25,NULL,'Pineda ','Pineda @hotmail.com',NULL),(27,'Carla Daniela','Quiroz Condori','F','carla .quiroz @gmail.com','carla1234',26,NULL,'Quiroz ','Quiroz @hotmail.com',NULL),(28,'Yakelyn Pao','Rios Salas','F','yakelyn .rios @gmail.com','yakelyn1234',27,NULL,'Rios ','Rios @hotmail.com',NULL),(29,'Virginia del Carme','Rodríguez Delelis','F','virginia .rodríguez @gmail.com','virginia1234',28,NULL,'Rodríguez ','Rodríguez @hotmail.com',NULL),(30,'Carola Andrea Alex','Rondón De La Cruz','F','carola .rondón @gmail.com','carola1234',29,NULL,'Rondón ','Rondón @hotmail.com',NULL),(31,'Stephanie Alexan','Salas Rodriguez','F','stephanie .salas @gmail.com','stephanie1234',30,NULL,'Salas ','Salas @hotmail.com',NULL),(32,'Luciana Anthua','Smith Postigo','F','luciana .smith @gmail.com','luciana1234',31,NULL,'Smith ','Smith @hotmail.com',NULL),(33,'Jose Manuel','Tejada Mamani','M','jose .tejada @gmail.com','jose1234',32,NULL,'Tejada ','Tejada @hotmail.com',NULL),(34,'Andrea Del Carmen','Valdivia Cisneros','F','andrea .valdivia @gmail.com','andrea1234',33,NULL,'Valdivia ','Valdivia @hotmail.com',NULL),(35,'Rosse Mary','Valdivia Paredes','F','rosse .valdivia @gmail.com','rosse1234',34,NULL,'Valdivia ','Valdivia @hotmail.com',NULL),(36,'Clara Giannella','Valdivia Tinajeros','F','clara .valdivia @gmail.com','clara1234',35,NULL,'Valdivia ','Valdivia @hotmail.com',NULL),(37,'Fabiola Cristin','Valencia Neyra','F','fabiola .valencia @gmail.com','fabiola1234',36,NULL,'Valencia ','Valencia @hotmail.com',NULL),(38,'Richard  A.','Hanco Mamani','M','richard .hanco @gmail.com','richard1234',37,NULL,'Hanco ','Hanco @hotmail.com',NULL),(39,'Denise Antonella','Zevallos Barriga','F','denise .zevallos @gmail.com','denise1234',38,NULL,'Zevallos ','Zevallos @hotmail.com',NULL);

/*Table structure for table `asistencia` */

DROP TABLE IF EXISTS `asistencia`;

CREATE TABLE `asistencia` (
  `ID_ASISTENCIA` int(11) NOT NULL AUTO_INCREMENT,
  `ESTADO` varchar(1) DEFAULT NULL,
  `ID_CURSO_ALUMNO` int(11) NOT NULL,
  PRIMARY KEY (`ID_ASISTENCIA`),
  KEY `fk_ASISTENCIA_CURSOALUMNO` (`ID_CURSO_ALUMNO`),
  CONSTRAINT `fk_ASISTENCIA_CURSOALUMNO` FOREIGN KEY (`ID_CURSO_ALUMNO`) REFERENCES `curso_alumno` (`ID_CURSO_ALUMNO`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8;

/*Data for the table `asistencia` */

insert  into `asistencia`(`ID_ASISTENCIA`,`ESTADO`,`ID_CURSO_ALUMNO`) values (115,'A',117),(116,'A',117),(117,'A',117),(118,'A',117),(119,'A',117),(120,'A',117),(121,'A',118),(122,'A',118),(123,'F',118),(124,'A',119),(125,'A',119),(126,'A',119),(127,'T',120),(128,'A',120),(129,'A',120),(130,'A',121),(131,'F',121),(132,'A',121),(133,'A',122),(134,'T',122),(135,'T',122),(136,'A',123),(137,'A',123),(138,'A',123),(139,'A',124),(140,'A',124),(141,'A',124),(142,'A',125),(143,'A',125),(144,'A',125),(145,'A',126),(146,'A',126),(147,'A',126),(148,'A',127),(149,'A',127),(150,'A',127),(151,'A',128),(152,'A',128),(153,'A',128),(154,'A',128),(155,'A',128),(156,'A',128),(157,'A',128),(158,'A',129),(159,'A',129),(160,'A',129),(161,'A',129),(162,'A',129),(163,'A',130),(164,'A',130),(165,'A',130),(166,'A',131),(167,'A',131),(168,'A',131),(169,'A',132),(170,'A',132),(171,'A',132),(172,'A',133),(173,'A',133),(174,'A',133),(175,'A',134),(176,'A',134),(177,'A',134),(178,'A',135),(179,'A',135),(180,'A',135),(181,'A',135),(182,'A',135),(183,'A',135),(184,'A',136),(185,'A',136),(186,'A',136),(187,'A',137),(188,'A',137),(189,'A',137),(190,'A',138),(191,'A',138),(192,'A',138),(193,'A',139),(194,'A',139),(195,'A',139),(196,'A',140),(197,'A',140),(198,'A',140),(199,'A',141),(200,'A',141),(201,'A',141),(202,'A',142),(203,'A',142),(204,'A',142),(205,'A',143),(206,'A',143),(207,'A',143),(208,'A',144),(209,'A',144),(210,'A',144),(211,'A',145),(212,'A',145),(213,'A',145),(214,'A',146),(215,'A',146),(216,'A',146),(217,'A',147),(218,'A',147),(219,'A',147),(220,'A',147),(221,'A',147),(222,'A',147),(223,'A',147),(224,'A',147),(225,'A',147),(226,'A',147),(227,'A',147),(228,'A',147);

/*Table structure for table `aula_dinamica` */

DROP TABLE IF EXISTS `aula_dinamica`;

CREATE TABLE `aula_dinamica` (
  `ID_AULA_DINAMICA` int(11) NOT NULL AUTO_INCREMENT,
  `COORD_X` int(11) DEFAULT NULL,
  `COORD_Y` int(11) DEFAULT NULL,
  `COLOR` varchar(7) DEFAULT NULL,
  `ID_CURSO` int(11) NOT NULL,
  PRIMARY KEY (`ID_AULA_DINAMICA`),
  KEY `fk_AULA_DINAMICA_CURSO` (`ID_CURSO`),
  CONSTRAINT `fk_AULA_DINAMICA_CURSO` FOREIGN KEY (`ID_CURSO`) REFERENCES `curso` (`ID_CURSO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `aula_dinamica` */

/*Table structure for table `capacidad` */

DROP TABLE IF EXISTS `capacidad`;

CREATE TABLE `capacidad` (
  `ID_CAPACIDAD` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(60) DEFAULT NULL,
  `ID_COMPETENCIA` int(255) NOT NULL,
  PRIMARY KEY (`ID_CAPACIDAD`),
  KEY `fk_CAPACIDAD_COMPETENCIA` (`ID_COMPETENCIA`),
  CONSTRAINT `fk_CAPACIDAD_COMPETENCIA` FOREIGN KEY (`ID_COMPETENCIA`) REFERENCES `competencia` (`ID_COMPETENCIA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `capacidad` */

/*Table structure for table `competencia` */

DROP TABLE IF EXISTS `competencia`;

CREATE TABLE `competencia` (
  `ID_COMPETENCIA` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(60) DEFAULT NULL,
  `ID_UNIDAD` int(11) NOT NULL,
  PRIMARY KEY (`ID_COMPETENCIA`),
  KEY `fk_COMPETENCIA_UNIDAD` (`ID_UNIDAD`),
  CONSTRAINT `fk_COMPETENCIA_UNIDAD` FOREIGN KEY (`ID_UNIDAD`) REFERENCES `unidad` (`ID_UNIDAD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `competencia` */

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `curso` */

insert  into `curso`(`ID_CURSO`,`NOMBRE_CURSO`,`INSTITUCION`,`GRADO`,`SECCION`,`ANIO`,`ID_DOCENTE`) values (17,'Matematica','Arequipa',5,'E',2015,1),(18,'Ciencia y Abiente','Arequipa',3,'F',2017,5),(19,'Aritmetica','Bryce',1,'C',2016,3),(20,'Matematica','Muñoz Najar',5,'E',2015,4),(21,'Biologia','Muñoz Najar',4,'A',2017,5),(22,'Fisica I','Muñoz Najar',5,'C',2017,1);

/*Table structure for table `curso_alumno` */

DROP TABLE IF EXISTS `curso_alumno`;

CREATE TABLE `curso_alumno` (
  `ID_CURSO_ALUMNO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CURSO` int(11) NOT NULL,
  `ID_ALUMNO` int(11) NOT NULL,
  PRIMARY KEY (`ID_CURSO_ALUMNO`),
  KEY `fk_CURSO_ALUMNO_ALUMNO1` (`ID_ALUMNO`),
  KEY `fk_CURSO_ALUMNO_CURSO1` (`ID_CURSO`),
  CONSTRAINT `fk_CURSO_ALUMNO_ALUMNO1` FOREIGN KEY (`ID_ALUMNO`) REFERENCES `alumno` (`ID_ALUMNO`),
  CONSTRAINT `fk_CURSO_ALUMNO_CURSO1` FOREIGN KEY (`ID_CURSO`) REFERENCES `curso` (`ID_CURSO`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;

/*Data for the table `curso_alumno` */

insert  into `curso_alumno`(`ID_CURSO_ALUMNO`,`ID_CURSO`,`ID_ALUMNO`) values (77,17,2),(116,17,3),(117,17,2),(118,17,3),(119,17,4),(120,17,5),(121,17,6),(122,17,7),(123,17,8),(124,17,9),(125,17,10),(126,18,11),(127,18,12),(128,18,13),(129,18,14),(130,18,15),(131,18,16),(132,18,17),(133,18,18),(134,18,19),(135,18,20),(136,18,21),(137,19,22),(138,19,23),(139,19,24),(140,19,25),(141,19,26),(142,19,27),(143,19,28),(144,19,29),(145,19,30),(146,19,31),(147,19,32),(148,19,33),(149,20,34),(150,20,35),(151,20,36),(152,20,37),(153,20,38),(154,20,39);

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

insert  into `docente`(`ID_DOCENTE`,`NOMBRE`,`APELLIDOS`,`GENERO`,`EMAIL`,`CONTRASENA`,`FOTO`,`USUARIO`) values (1,'Carlos','Supo Mollocondo','M','carlos.supo@gmail.com','123456',NULL,''),(2,'Lilian','Arias Lizares','F','LilianLizares@gmail.com','123456',NULL,''),(3,'Claudia ','Quispe Ruiz','F','claudiaquispe@gmail.com','123456',NULL,''),(4,'Karina Viviana','Prado Umpire','F','KarinVivi@gmail.com','123456',NULL,''),(5,'Kelvin','Macedo Ylachoque','M','Kerlvinmacedo@gmail.com','123456',NULL,'');

/*Table structure for table `formula` */

DROP TABLE IF EXISTS `formula`;

CREATE TABLE `formula` (
  `ID_FORMULA` int(11) NOT NULL AUTO_INCREMENT,
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`ID_FORMULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `formula` */

/*Table structure for table `formula_detalle` */

DROP TABLE IF EXISTS `formula_detalle`;

CREATE TABLE `formula_detalle` (
  `ID_FORMULA_DETALLE` int(11) NOT NULL AUTO_INCREMENT,
  `ITEM` int(11) DEFAULT NULL,
  `IDEVALUACION` int(11) DEFAULT NULL,
  `ID_PARTE` int(11) NOT NULL,
  `ID_FORMULA` int(11) NOT NULL,
  PRIMARY KEY (`ID_FORMULA_DETALLE`),
  KEY `fk_FORMULA_DETALLE_PARTE1` (`ID_PARTE`),
  KEY `fk_FORMULA_DETALLE_FORMULA1` (`ID_FORMULA`),
  CONSTRAINT `fk_FORMULA_DETALLE_FORMULA1` FOREIGN KEY (`ID_FORMULA`) REFERENCES `formula` (`ID_FORMULA`),
  CONSTRAINT `fk_FORMULA_DETALLE_PARTE1` FOREIGN KEY (`ID_PARTE`) REFERENCES `parte` (`ID_PARTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `formula_detalle` */

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
  `NOTA` int(11) DEFAULT NULL,
  `ID_CURSO_ALUMNO` int(11) NOT NULL,
  `ID_CAPACIDAD` int(11) NOT NULL,
  PRIMARY KEY (`ID_NOTA`),
  KEY `fk_NOTA_CURSO_ALUMNO` (`ID_CURSO_ALUMNO`),
  KEY `fk_NOTA_CAPACIDAD` (`ID_CAPACIDAD`),
  CONSTRAINT `fk_NOTA_CAPACIDAD` FOREIGN KEY (`ID_CAPACIDAD`) REFERENCES `capacidad` (`ID_CAPACIDAD`),
  CONSTRAINT `fk_NOTA_CURSO_ALUMNO` FOREIGN KEY (`ID_CURSO_ALUMNO`) REFERENCES `curso_alumno` (`ID_CURSO_ALUMNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `nota` */

/*Table structure for table `parte` */

DROP TABLE IF EXISTS `parte`;

CREATE TABLE `parte` (
  `ID_PARTE` int(11) NOT NULL AUTO_INCREMENT,
  `SIGNO` varchar(1) DEFAULT NULL,
  `DESCRIPCION` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID_PARTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `parte` */

/*Table structure for table `periodo` */

DROP TABLE IF EXISTS `periodo`;

CREATE TABLE `periodo` (
  `ID_PERIODO` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(50) DEFAULT NULL,
  `ID_CURSO` int(11) NOT NULL,
  PRIMARY KEY (`ID_PERIODO`),
  KEY `fk_PERIODO_CURSO` (`ID_CURSO`),
  CONSTRAINT `fk_PERIODO_CURSO` FOREIGN KEY (`ID_CURSO`) REFERENCES `curso` (`ID_CURSO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `periodo` */

/*Table structure for table `pregunta` */

DROP TABLE IF EXISTS `pregunta`;

CREATE TABLE `pregunta` (
  `ID_PREGUNTA` int(11) NOT NULL AUTO_INCREMENT,
  `PREGUNTA` varchar(60) DEFAULT NULL,
  `TEMA` varchar(255) DEFAULT NULL,
  `ID_CURSO` int(11) NOT NULL,
  PRIMARY KEY (`ID_PREGUNTA`),
  KEY `fk_PREGUNTA_CURSO` (`ID_CURSO`),
  CONSTRAINT `fk_PREGUNTA_CURSO` FOREIGN KEY (`ID_CURSO`) REFERENCES `curso` (`ID_CURSO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pregunta` */

/*Table structure for table `unidad` */

DROP TABLE IF EXISTS `unidad`;

CREATE TABLE `unidad` (
  `ID_UNIDAD` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(60) DEFAULT NULL,
  `ID_PERIODO` int(11) NOT NULL,
  PRIMARY KEY (`ID_UNIDAD`),
  KEY `fk_UNIDAD_PERIODO` (`ID_PERIODO`),
  CONSTRAINT `fk_UNIDAD_PERIODO` FOREIGN KEY (`ID_PERIODO`) REFERENCES `periodo` (`ID_PERIODO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `unidad` */

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `USUARIO` varchar(45) NOT NULL,
  `CONTRASENA` varchar(45) DEFAULT NULL,
  `ESTADO` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `usuario` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
