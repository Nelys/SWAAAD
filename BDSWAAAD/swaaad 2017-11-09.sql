/********************************************************************************
*Descripción           : Creacion de la base de datos (SWAAAD) y tablas         *
*Fecha Creación        : 09/08/2017                                             *
*Parámetros            :                                                        *
*Autores               : Nelys Mollocondo Pari                                  *
*                      : Christian Tony Vilca Quiñonez                          *
*Cambios importantes   : Sep  3 22:04:21 2017                                   *
*                                                                               *
*                                                                               *
*                                                                               *
*********************************************************************************/
CREATE DATABASE IF NOT EXISTS DEFAULT CHARACTER SET utf8 ;

USE `swaaad`;

DROP TABLE IF EXISTS `actividad_pedagogica`;

CREATE TABLE `actividad_pedagogica` (
  `ID_ACTIVIDAD` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA` datetime(6) DEFAULT NULL,
  `DESCRIPCION` varchar(50) DEFAULT NULL,
  `ID_CURSO_ALUMNO` int(11) NOT NULL,
  PRIMARY KEY (`ID_ACTIVIDAD`),
  KEY `FK_CURSO_ACTIVIDADPEDAGOGICA` (`ID_CURSO_ALUMNO`),
  CONSTRAINT `FK_CURSO_ACTIVIDADPEDAGOGICA` FOREIGN KEY (`ID_CURSO_ALUMNO`) REFERENCES `curso_alumno` (`ID_CURSO_ALUMNO`)
)


DROP TABLE IF EXISTS `alumno`;

CREATE TABLE `alumno` (
  `ID_ALUMNO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRES` varchar(50) DEFAULT NULL,
  `APELLIDOS` varchar(50) DEFAULT NULL,
  `GENERO` varchar(1) DEFAULT NULL,
  `EMAIL` varchar(60) DEFAULT NULL,
  `NOMBRES_APODERADO` varchar(50) DEFAULT NULL,
  `APELLIDOS_APODERADO` varchar(50) DEFAULT NULL,
  `EMAIL_APODERADO` varchar(60) DEFAULT NULL,
  `ID_USUARIO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_ALUMNO`),
  KEY `fk_alumno_docente` (`ID_USUARIO`),
  CONSTRAINT `fk_alumno_docente` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`id_usuario`)
) 

DROP TABLE IF EXISTS `asistencia`;

CREATE TABLE `asistencia` (
  `ID_ASISTENCIA` int(11) NOT NULL AUTO_INCREMENT,
  `ESTADO` varchar(2) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `ID_CURSO_ALUMNO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_ASISTENCIA`),
  KEY `FK_CURSOALUMNO_ASISTENCIA` (`ID_CURSO_ALUMNO`),
  CONSTRAINT `FK_CURSOALUMNO_ASISTENCIA` FOREIGN KEY (`ID_CURSO_ALUMNO`) REFERENCES `curso_alumno` (`ID_CURSO_ALUMNO`)
) 

DROP TABLE IF EXISTS `aula_dinamica`;

CREATE TABLE `aula_dinamica` (
  `ID_AULA_DINAMICA` int(11) NOT NULL AUTO_INCREMENT,
  `COORD_X` int(11) DEFAULT NULL,
  `COORD_Y` int(11) DEFAULT NULL,
  `COLOR_TEXTO` varchar(7) DEFAULT NULL,
  `COLOR_FONDO` varchar(7) DEFAULT NULL,
  `ESTADO` bit(1) DEFAULT NULL,
  `ID_CURSO_ALUMNO` int(11) NOT NULL,
  PRIMARY KEY (`ID_AULA_DINAMICA`),
  KEY `fk_AULA_DINAMICA_CURSOALUMNO` (`ID_CURSO_ALUMNO`),
  CONSTRAINT `fk_AULA_DINAMICA_CURSOALUMNO` FOREIGN KEY (`ID_CURSO_ALUMNO`) REFERENCES `curso_alumno` (`ID_CURSO_ALUMNO`)
) 


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
) 


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
) 


DROP TABLE IF EXISTS `docente`;

CREATE TABLE `docente` (
  `ID_DOCENTE` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `APELLIDOS` varchar(50) DEFAULT NULL,
  `GENERO` varchar(1) DEFAULT NULL,
  `EMAIL` varchar(60) DEFAULT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  PRIMARY KEY (`ID_DOCENTE`),
  KEY `fk_docente_usuario` (`ID_USUARIO`),
  CONSTRAINT `fk_docente_usuario` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`id_usuario`)
) 

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
) 

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
) 


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
) 

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `enabled` tinyint(4) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) 

