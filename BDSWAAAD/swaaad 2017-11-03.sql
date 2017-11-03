/*
Navicat MySQL Data Transfer

Source Server         : localhost.MySQL
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : swaaad

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-11-03 17:00:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for actividad_pedagogica
-- ----------------------------
DROP TABLE IF EXISTS `actividad_pedagogica`;
CREATE TABLE `actividad_pedagogica` (
  `ID_ACTIVIDAD` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA` datetime(6) DEFAULT NULL,
  `DESCRIPCION` varchar(50) DEFAULT NULL,
  `ID_CURSO_ALUMNO` int(11) NOT NULL,
  PRIMARY KEY (`ID_ACTIVIDAD`),
  KEY `FK_CURSO_ACTIVIDADPEDAGOGICA` (`ID_CURSO_ALUMNO`),
  CONSTRAINT `FK_CURSO_ACTIVIDADPEDAGOGICA` FOREIGN KEY (`ID_CURSO_ALUMNO`) REFERENCES `curso_alumno` (`ID_CURSO_ALUMNO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of actividad_pedagogica
-- ----------------------------
INSERT INTO `actividad_pedagogica` VALUES ('1', '2017-10-31 07:40:28.000000', 'Halloween', '1');

-- ----------------------------
-- Table structure for alumno
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alumno
-- ----------------------------
INSERT INTO `alumno` VALUES ('1', 'Brenda Laura', 'Arag�n Salinas', 'F', 'brenda .arag�n @gmail.com', 'Fernando Carlos', 'Arag�n ', 'Arag�n @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('2', 'Karla Stephany', 'Aranibar Tila', 'F', 'karla .aranibar @gmail.com', 'Josue ', 'Aranibar ', 'Aranibar @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('3', 'Rosa Edith', 'Atayupanqui Due�as', 'F', 'rosa .atayupanqui @gmail.com', 'Pedro Carlos', 'Atayupanqui ', 'Atayupanqui @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('4', 'Grisel Mercedes', 'Bald�rrago Tinoco', 'F', 'grisel .bald�rrago @gmail.com', 'Samuel Pedro', 'Bald�rrago ', 'Bald�rrago @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('5', 'Angie Camila', 'Barriga Fern�ndez', 'F', 'angie .barriga @gmail.com', 'Cesar', 'Barriga ', 'Barriga @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('6', 'Fiorela Alejaa', 'Begazo Vera', null, 'fiorela .begazo @gmail.com', null, null, null, '1');
INSERT INTO `alumno` VALUES ('7', 'Yenifer Pilar', 'Cahuana Pacha', 'F', 'yenifer .cahuana @gmail.com', 'Roberto', 'Cahuana ', 'Cahuana @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('8', 'Lizbeth Reyna', 'Cayani Tejada', 'F', 'lizbeth .cayani @gmail.com', 'Luis', 'Cayani ', 'Cayani @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('9', 'Nicole Fabiola', 'Cayro Prevate', 'F', 'nicole .cayro @gmail.com', 'Estefano', 'Cayro ', 'Cayro @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('10', 'Amanda Rebeca', 'Cazorla Jim�nez', 'F', 'amanda .cazorla @gmail.com', 'David', 'Cazorla ', 'Cazorla @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('11', 'Bettsy Brigite', 'Ccalachua Aquepucho', 'F', 'bettsy .ccalachua @gmail.com', 'Cesar Luis', 'Ccalachua ', 'Ccalachua @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('12', 'Claudia Betsa', 'Chavez Marin', 'F', 'claudia .chavez @gmail.com', 'Julios Cesar', 'Chavez ', 'Chavez @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('13', 'Karina Ximena', 'Checcori Moina', 'F', 'karina .checcori @gmail.com', 'Jhonatan Julio', 'Checcori ', 'Checcori @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('14', 'Claudia Patricia', 'Delgado Frisancho', 'F', 'claudia .delgado @gmail.com', 'Fabricio', 'Delgado ', 'Delgado @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('15', 'Mayra Matilde', 'D�az C�rdenas', 'F', 'mayra .d�az @gmail.com', 'Tomas', 'D�az ', 'D�az @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('16', 'Leira Miluska', 'Enr�quez Huayta', 'F', 'leira .enr�quez @gmail.com', null, 'Enr�quez ', 'Enr�quez @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('17', 'Allison Yolanda', 'Escalante Palacios', 'F', 'allison .escalante @gmail.com', null, 'Escalante ', 'Escalante @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('18', 'Bianka Lucia', 'Garcia Iba�ez', 'F', 'bianka .garcia @gmail.com', null, 'Garcia ', 'Garcia @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('19', 'Milagros A.', 'Motta Rond�n', 'F', 'milagros .motta @gmail.com', null, 'Motta ', 'Motta @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('20', 'Diana Margior', 'N��ez Ch�vez', 'F', 'diana .n��ez @gmail.com', null, 'N��ez ', 'N��ez @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('21', 'Shirley Patric', 'Ortiz Delgado', 'F', 'shirley .ortiz @gmail.com', null, 'Ortiz ', 'Ortiz @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('22', 'Ana Paula', 'Osorio Vargas', 'F', 'ana .osorio @gmail.com', null, 'Osorio ', 'Osorio @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('23', 'Lizeth Diana', 'Pe�a Villafuerte', 'F', 'lizeth .pe�a @gmail.com', null, 'Pe�a ', 'Pe�a @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('24', 'Luz Clara', 'Pillco Ramos', 'F', 'luz .pillco @gmail.com', null, 'Pillco ', 'Pillco @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('25', 'Alanys Virginia', 'Pineda Fern�ndez', 'F', 'alanys .pineda @gmail.com', null, 'Pineda ', 'Pineda @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('26', 'Carla Daniela', 'Quiroz Condori', 'F', 'carla .quiroz @gmail.com', null, 'Quiroz ', 'Quiroz @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('27', 'Yakelyn Pao', 'Rios Salas', 'F', 'yakelyn .rios @gmail.com', null, 'Rios ', 'Rios @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('28', 'Virginia del Carme', 'Rodr�guez Delelis', 'F', 'virginia .rodr�guez @gmail.com', null, 'Rodr�guez ', 'Rodr�guez @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('29', 'Carola Andrea Alex', 'Rond�n De La Cruz', 'F', 'carola .rond�n @gmail.com', null, 'Rond�n ', 'Rond�n @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('30', 'Stephanie Alexan', 'Salas Rodriguez', 'F', 'stephanie .salas @gmail.com', null, 'Salas ', 'Salas @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('31', 'Luciana Anthua', 'Smith Postigo', 'F', 'luciana .smith @gmail.com', null, 'Smith ', 'Smith @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('32', 'Jose Manuel', 'Tejada Mamani', 'M', 'jose .tejada @gmail.com', null, 'Tejada ', 'Tejada @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('33', 'Andrea Del Carmen', 'Valdivia Cisneros', 'F', 'andrea .valdivia @gmail.com', null, 'Valdivia ', 'Valdivia @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('34', 'Rosse Mary', 'Valdivia Paredes', 'F', 'rosse .valdivia @gmail.com', null, 'Valdivia ', 'Valdivia @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('35', 'Clara Giannella', 'Valdivia Tinajeros', 'F', 'clara .valdivia @gmail.com', null, 'Valdivia ', 'Valdivia @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('36', 'Fabiola Cristin', 'Valencia Neyra', 'F', 'fabiola .valencia @gmail.com', null, 'Valencia ', 'Valencia @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('37', 'Richard  A.', 'Hanco Mamani', 'M', 'richard .hanco @gmail.com', null, 'Hanco ', 'Hanco @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('38', 'Denise Antonella', 'Zevallos Barriga', 'F', 'denise .zevallos @gmail.com', null, 'Zevallos ', 'Zevallos @hotmail.com', '1');
INSERT INTO `alumno` VALUES ('39', '', '', null, '', null, null, null, '1');
INSERT INTO `alumno` VALUES ('40', 'aaaa', 'aaaa', null, 'aaaaa', null, null, null, '1');
INSERT INTO `alumno` VALUES ('41', 'aaaa', 'aaaaaa', null, 'asdf@gmail.com', null, null, null, '1');
INSERT INTO `alumno` VALUES ('42', 'Lizeth Diana', 'Smith Postigo', null, 'bbbb@gmail.com', null, null, null, '1');
INSERT INTO `alumno` VALUES ('43', 'Clara Giannella', 'Valdivia Tinajeros', null, 'ccccccccc@gmail.com', null, null, null, '1');
INSERT INTO `alumno` VALUES ('44', 'Ana Maria', 'Sanchez Diaz', null, '', null, null, null, '1');
INSERT INTO `alumno` VALUES ('45', 'Ana Maria', 'Soto saens', null, 'maria@gmail.com', null, null, null, '1');
INSERT INTO `alumno` VALUES ('46', 'SDFSD', 'SDFSDF', null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for asistencia
-- ----------------------------
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

-- ----------------------------
-- Records of asistencia
-- ----------------------------

-- ----------------------------
-- Table structure for aula_dinamica
-- ----------------------------
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aula_dinamica
-- ----------------------------

-- ----------------------------
-- Table structure for curso
-- ----------------------------
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

-- ----------------------------
-- Records of curso
-- ----------------------------
INSERT INTO `curso` VALUES ('1', 'Matematica', 'Arequipa', '5', 'E', '2017', '1');
INSERT INTO `curso` VALUES ('2', 'Ciencia y Abiente', 'Arequipa', '3', 'F', '2017', '1');
INSERT INTO `curso` VALUES ('3', 'Aritmetica', 'Bryce', '1', 'C', '2017', '1');
INSERT INTO `curso` VALUES ('4', 'Matematica', 'Mu�oz Najar', '5', 'E', '2017', '2');
INSERT INTO `curso` VALUES ('5', 'Biologia', 'Mu�oz Najar', '4', 'A', '2017', '2');
INSERT INTO `curso` VALUES ('6', 'Fisica I', 'Mu�oz Najar', '5', 'C', '2017', '2');

-- ----------------------------
-- Table structure for curso_alumno
-- ----------------------------
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

-- ----------------------------
-- Records of curso_alumno
-- ----------------------------
INSERT INTO `curso_alumno` VALUES ('1', '1', '1');
INSERT INTO `curso_alumno` VALUES ('2', '1', '2');
INSERT INTO `curso_alumno` VALUES ('3', '1', '3');
INSERT INTO `curso_alumno` VALUES ('4', '1', '4');
INSERT INTO `curso_alumno` VALUES ('5', '1', '5');
INSERT INTO `curso_alumno` VALUES ('6', '2', '1');
INSERT INTO `curso_alumno` VALUES ('7', '2', '2');
INSERT INTO `curso_alumno` VALUES ('8', '2', '3');
INSERT INTO `curso_alumno` VALUES ('9', '2', '4');
INSERT INTO `curso_alumno` VALUES ('10', '2', '6');
INSERT INTO `curso_alumno` VALUES ('11', '3', '11');
INSERT INTO `curso_alumno` VALUES ('12', '3', '12');
INSERT INTO `curso_alumno` VALUES ('13', '3', '13');
INSERT INTO `curso_alumno` VALUES ('14', '3', '14');
INSERT INTO `curso_alumno` VALUES ('15', '3', '15');
INSERT INTO `curso_alumno` VALUES ('16', '1', '45');

-- ----------------------------
-- Table structure for docente
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of docente
-- ----------------------------
INSERT INTO `docente` VALUES ('1', 'Carlos', 'Supo Mollocondo', 'M', 'carlos.supo@gmail.com', '1');
INSERT INTO `docente` VALUES ('2', 'Lilian', 'Arias Lizares', 'F', 'LilianLizares@gmail.com', '2');
INSERT INTO `docente` VALUES ('3', 'Claudia ', 'Quispe Ruiz', 'F', 'claudiaquispe@gmail.com', '1');
INSERT INTO `docente` VALUES ('4', 'Karina Viviana', 'Prado Umpire', 'F', 'KarinVivi@gmail.com', '1');
INSERT INTO `docente` VALUES ('5', 'Kelvin', 'Macedo Ylachoque', 'M', 'Kerlvinmacedo@gmail.com', '1');

-- ----------------------------
-- Table structure for evaluacion
-- ----------------------------
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

-- ----------------------------
-- Records of evaluacion
-- ----------------------------
INSERT INTO `evaluacion` VALUES ('1', '1', '0', 'tarea1', '', '#ffffff', '#000000', 'idEvaluacion_1idEvaluacion_3', '\0');
INSERT INTO `evaluacion` VALUES ('2', '1', '4', 'TAREA2', 'a', '#ffffff', '#000000', '0', '\0');
INSERT INTO `evaluacion` VALUES ('3', '1', '0', 'TAREA3', 'a', '#ffffff', '#000000', '0', '\0');
INSERT INTO `evaluacion` VALUES ('4', '1', '25', 'PROM', 'a', '#e6deac', '#000000', '(idEvaluacion_1+idEvaluacion_2+idEvaluacion_3)/3', '');
INSERT INTO `evaluacion` VALUES ('5', '2', '0', 'TAREA1', 'a', '#337ab7', '#ffffff', null, '\0');
INSERT INTO `evaluacion` VALUES ('6', '2', '8', 'TAREA2', 'a', '#000005', '#ffffff', null, '\0');
INSERT INTO `evaluacion` VALUES ('7', '2', '8', 'TAREA3', 'a', '#000006', '#ffffff', null, '\0');
INSERT INTO `evaluacion` VALUES ('8', '2', '13', 'PROM', 'a', '#000007', '#ffffff', null, '\0');
INSERT INTO `evaluacion` VALUES ('9', '2', '12', 'TAREA1', 'a', '#000000', '#ffffff', null, '\0');
INSERT INTO `evaluacion` VALUES ('10', '2', '12', 'TAREA2', 'a', '#000001', '#ffffff', null, '\0');
INSERT INTO `evaluacion` VALUES ('11', '2', '12', 'TAREA3', 'a', '#000002', '#ffffff', null, '\0');
INSERT INTO `evaluacion` VALUES ('12', '2', '13', 'PROM', 'aa', '#000003', '#ffffff', null, '\0');
INSERT INTO `evaluacion` VALUES ('13', '2', '0', 'PROME', 'a', '#000004', '#ffffff', null, '\0');
INSERT INTO `evaluacion` VALUES ('14', '2', '0', 'EXP1', 'a', '#000005', '#ffffff', null, '\0');
INSERT INTO `evaluacion` VALUES ('15', '1', '17', 'TAREA 1', '', '#ffffff', '#000000', '', '\0');
INSERT INTO `evaluacion` VALUES ('16', '1', '17', 'TAREA5', '', '#ffffff', '#000000', '', '\0');
INSERT INTO `evaluacion` VALUES ('17', '1', '25', 'PROM 1', '', '#5cb85c', '#ffffff', 'idEvaluacion_15+idEvaluacion_16', '');
INSERT INTO `evaluacion` VALUES ('18', '1', '20', 'EXPO2', '', '#ffffff', '#000000', '', '\0');
INSERT INTO `evaluacion` VALUES ('19', '1', '20', 'EXPO3', '', '#ffffff', '#000000', '', '\0');
INSERT INTO `evaluacion` VALUES ('20', '1', '25', 'EXPO4', '', '#337ab7', '#ffffff', 'idEvaluacion_18+idEvaluacion_19', '');
INSERT INTO `evaluacion` VALUES ('25', '1', '0', 'QWER', 'QWER', '#777777', '#000000', 'idEvaluacion_4+idEvaluacion_17+idEvaluacion_20', '');
INSERT INTO `evaluacion` VALUES ('26', '1', '0', 'aa', 'asa', '#7e4949', '#160303', 'idEvaluacion_1+9', '');
INSERT INTO `evaluacion` VALUES ('27', '1', '0', 'prueba', 'prome', '#ffffff', '#0e0e0e', '', '\0');

-- ----------------------------
-- Table structure for horario
-- ----------------------------
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

-- ----------------------------
-- Records of horario
-- ----------------------------

-- ----------------------------
-- Table structure for nota
-- ----------------------------
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

-- ----------------------------
-- Records of nota
-- ----------------------------
INSERT INTO `nota` VALUES ('1', '2', '1', '20');
INSERT INTO `nota` VALUES ('2', '2', '2', '7');
INSERT INTO `nota` VALUES ('3', '1', '1', '7');
INSERT INTO `nota` VALUES ('4', '7', '5', '16');
INSERT INTO `nota` VALUES ('5', '6', '2', '15');
INSERT INTO `nota` VALUES ('6', '6', '3', '20');
INSERT INTO `nota` VALUES ('7', '2', '3', '13');
INSERT INTO `nota` VALUES ('8', '2', '4', '10');
INSERT INTO `nota` VALUES ('9', '6', '4', '14');
INSERT INTO `nota` VALUES ('10', '1', '5', '4');
INSERT INTO `nota` VALUES ('11', '3', '9', '6');
INSERT INTO `nota` VALUES ('12', '1', '11', '0');
INSERT INTO `nota` VALUES ('13', '6', '20', '16');
INSERT INTO `nota` VALUES ('14', '6', '18', '2');
INSERT INTO `nota` VALUES ('15', '43', '1', '1');
INSERT INTO `nota` VALUES ('16', '43', '2', '1');
INSERT INTO `nota` VALUES ('21', '42', '4', '1');
INSERT INTO `nota` VALUES ('22', '43', '4', '1');
INSERT INTO `nota` VALUES ('23', '6', '15', '8');
INSERT INTO `nota` VALUES ('24', '6', '16', '20');
INSERT INTO `nota` VALUES ('25', '6', '17', '28');
INSERT INTO `nota` VALUES ('26', '2', '17', '4');
INSERT INTO `nota` VALUES ('27', '42', '17', '7');
INSERT INTO `nota` VALUES ('28', '43', '17', '4');
INSERT INTO `nota` VALUES ('29', '2', '20', '1');
INSERT INTO `nota` VALUES ('30', '42', '20', '1');
INSERT INTO `nota` VALUES ('31', '43', '20', '1');
INSERT INTO `nota` VALUES ('32', '6', '25', '58');
INSERT INTO `nota` VALUES ('33', '2', '25', '15');
INSERT INTO `nota` VALUES ('34', '42', '25', '9');
INSERT INTO `nota` VALUES ('35', '43', '25', '6');
INSERT INTO `nota` VALUES ('36', '6', '19', '14');
INSERT INTO `nota` VALUES ('37', '42', '1', '2');
INSERT INTO `nota` VALUES ('38', '2', '15', '3');
INSERT INTO `nota` VALUES ('39', '42', '15', '2');
INSERT INTO `nota` VALUES ('40', '42', '16', '5');
INSERT INTO `nota` VALUES ('41', '2', '16', '1');
INSERT INTO `nota` VALUES ('42', '43', '15', '2');
INSERT INTO `nota` VALUES ('43', '43', '16', '2');
INSERT INTO `nota` VALUES ('44', '2', '19', '1');
INSERT INTO `nota` VALUES ('45', '42', '19', '3');
INSERT INTO `nota` VALUES ('46', '43', '19', '1');
INSERT INTO `nota` VALUES ('47', '44', '15', '2');
INSERT INTO `nota` VALUES ('48', '44', '17', '2');
INSERT INTO `nota` VALUES ('49', '44', '20', '0');
INSERT INTO `nota` VALUES ('50', '44', '25', '2');
INSERT INTO `nota` VALUES ('51', '6', '1', '8');
INSERT INTO `nota` VALUES ('52', '6', '26', '17');
INSERT INTO `nota` VALUES ('53', '2', '26', '22');
INSERT INTO `nota` VALUES ('54', '42', '26', '11');
INSERT INTO `nota` VALUES ('55', '43', '26', '10');
INSERT INTO `nota` VALUES ('56', '44', '26', '9');
INSERT INTO `nota` VALUES ('57', '1', '2', '2');
INSERT INTO `nota` VALUES ('58', '1', '3', '6');
INSERT INTO `nota` VALUES ('59', '1', '15', '4');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `enabled` tinyint(4) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1', 'luis@gmail.com', '$2a$10$eGR3JIDoDSX.aJnnJ26L0OUAftI8k3Yc9jgIy3hqR43SlBaasRVFK', '1', 'ROLE_ADMIN');
INSERT INTO `usuario` VALUES ('2', 'nelys@gmail.com', '$2a$10$eGR3JIDoDSX.aJnnJ26L0OUAftI8k3Yc9jgIy3hqR43SlBaasRVFK', '1', 'ROLE_ADMIN');
