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
-- ----------------------------
-- Eliminar Base de Datos
-- ----------------------------
DROP DATABASE IF EXISTS `SWAAAD`;

-- ----------------------------
-- Crear Base de Datos
-- ----------------------------
 CREATE DATABASE IF NOT EXISTS `SWAAAD` CHARACTER SET utf8 COLLATE utf8_general_ci;

-- ----------------------------
-- Usar Base de Datos
-- ----------------------------
 USE `SWAAAD`;


-- ----------------------------
-- Eliminar tablas
-- ----------------------------
 DROP TABLE IF EXISTS `EVALUACION` ;

DROP TABLE IF EXISTS `CAPACIDAD` ;

DROP TABLE IF EXISTS `COMPETENCIA` ;

DROP TABLE IF EXISTS `UNIDAD` ;

DROP TABLE IF EXISTS `HORARIO` ;

DROP TABLE IF EXISTS `AULA` ;

DROP TABLE IF EXISTS `PREGUNTA` ;

DROP TABLE IF EXISTS `PERIODO` ;

DROP TABLE IF EXISTS `ACTIVIDAD_PEDAGOGICA` ;

DROP TABLE IF EXISTS `ASISTENCIA` ;

DROP TABLE IF EXISTS `CURSO_ALUMNO` ;

DROP TABLE IF EXISTS `FORMULA_DETALLE` ;

DROP TABLE IF EXISTS `CURSO` ;

DROP TABLE IF EXISTS `USUARIO` ;

DROP TABLE IF EXISTS `PARTE` ;

DROP TABLE IF EXISTS `FORMULA` ;

DROP TABLE IF EXISTS `ALUMNO` ;

DROP TABLE IF EXISTS `DOCENTE` ;

DROP TABLE IF EXISTS `USUARIO_ROL` ;


-- --------------------------------------------------------------------------------------------------
--                                           PRIMERO
-- --------------------------------------------------------------------------------------------------

-- ----------------------------
-- Estructura de la tabla USUARIO
-- ----------------------------
CREATE TABLE `USUARIO` (
  `USUARIO` VARCHAR (45) NOT NULL,
  `CONTRASENA` VARCHAR (45) NULL,
  `ESTADO` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`USUARIO`)
);
-- ----------------------------
-- Estructura de la tabla DOCENTE
-- ----------------------------
CREATE TABLE `DOCENTE` (
  `ID_DOCENTE` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR (50) NULL DEFAULT NULL,
  `APELLIDOS` VARCHAR (50) NULL DEFAULT NULL,
  `GENERO` VARCHAR (1) NULL DEFAULT NULL,
  `EMAIL` VARCHAR (60) NULL DEFAULT NULL,
  `CONTRASENA` VARCHAR (60) NULL DEFAULT NULL,
  `FOTO` VARCHAR (100) NULL DEFAULT NULL,
  `USUARIO` VARCHAR (45) NOT NULL,
  PRIMARY KEY (`ID_DOCENTE`)
) ;

-- ----------------------------
-- Estructura de la tabla ALUMNO
-- ----------------------------
CREATE TABLE `ALUMNO` (
  `ID_ALUMNO` INT NOT NULL AUTO_INCREMENT,
  `NOMBRES` VARCHAR (50) NULL DEFAULT NULL,
  `APELLIDOS` VARCHAR (50) NULL DEFAULT NULL,
  `GENERO` VARCHAR (1) NULL DEFAULT NULL,
  `EMAIL` VARCHAR (60) NULL DEFAULT NULL,
  `CONTRASENA` VARCHAR (60) NULL DEFAULT NULL,
  `NRO_ORDEN` INT (11) NULL DEFAULT NULL,
  `NOMBRES_APODERADO` VARCHAR (50) NULL DEFAULT NULL,
  `APELLIDOS_APODERADO` VARCHAR (50) NULL DEFAULT NULL,
  `EMAIL_APODERADO` VARCHAR (60) NULL DEFAULT NULL,
  `IMAGEN` VARCHAR (60) NULL,
  PRIMARY KEY (`ID_ALUMNO`)
) ;

-- ----------------------------
-- Estructura de la tabla FORMULA
-- ----------------------------
CREATE TABLE `FORMULA` (
  `ID_FORMULA` INT NOT NULL AUTO_INCREMENT,
  `ID` INT (11) NOT NULL,
  PRIMARY KEY (`ID_FORMULA`)
) ;

-- ----------------------------
-- Estructura de la tabla PARTE
-- ----------------------------
CREATE TABLE `PARTE` (
  `ID_PARTE` INT NOT NULL AUTO_INCREMENT,
  `SIGNO` VARCHAR (1) NULL DEFAULT NULL,
  `DESCRIPCION` VARCHAR (10) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_PARTE`)
) ;

-- --------------------------------------------------------------------------------------------------
--                                           SEGUNDO
-- --------------------------------------------------------------------------------------------------

-- -- ----------------------------
-- -- Estructura de la tabla USUARIO_ROL
-- -- ----------------------------
-- CREATE TABLE `USUARIO_ROL` (
--   `ID_USUARIO_ROL` INT NOT NULL AUTO_INCREMENT,
--   `USUARIO` VARCHAR (45) NOT NULL,
--   `ROL` VARCHAR(45) NOT NULL,
--   PRIMARY KEY (`ID_USUARIO_ROL`)
--   UNIQUE KEY uni_usuario_rol (ROL,USUARIO),
--   KEY fk_usuario_idx (USUARIO),
--   CONSTRAINT fk_usuario FOREIGN KEY (USUARIO) REFERENCES usuario (USUARIO)
-- ) ;


-- ----------------------------
-- Estructura de la tabla CURSO
-- ----------------------------
CREATE TABLE `CURSO` (
  `ID_CURSO` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE_CURSO` VARCHAR (60) NOT NULL,
  `INSTITUCION` VARCHAR (60) NULL DEFAULT NULL,
  `GRADO` INT (11) NULL DEFAULT NULL,
  `SECCION` VARCHAR (1) NULL DEFAULT NULL,
  `ANIO` INT (4) NULL,
  `ID_DOCENTE` INT NOT NULL,
  PRIMARY KEY (`ID_CURSO`),
  CONSTRAINT `fk_CURSO_DOCENTE1` FOREIGN KEY (`ID_DOCENTE`) REFERENCES `DOCENTE` (`ID_DOCENTE`)
) ;

-- ----------------------------
-- Estructura de la tabla FORMULA_DETALLE
-- ----------------------------
CREATE TABLE `FORMULA_DETALLE` (
  `ID_FORMULA_DETALLE` INT NOT NULL AUTO_INCREMENT,
  `ITEM` INT (11) NULL DEFAULT NULL,
  `IDEVALUACION` INT (11) NULL DEFAULT NULL,
  `ID_PARTE` INT NOT NULL,
  `ID_FORMULA` INT NOT NULL,
  PRIMARY KEY (`ID_FORMULA_DETALLE`),
  CONSTRAINT `fk_FORMULA_DETALLE_PARTE1` FOREIGN KEY (`ID_PARTE`) REFERENCES `PARTE` (`ID_PARTE`),
  CONSTRAINT `fk_FORMULA_DETALLE_FORMULA1` FOREIGN KEY (`ID_FORMULA`) REFERENCES `FORMULA` (`ID_FORMULA`)
) ;


-- --------------------------------------------------------------------------------------------------
--                                           TERCERO
-- --------------------------------------------------------------------------------------------------
-- ----------------------------

-- Estructura de la tabla CURSO_ALUMNO
-- ----------------------------
CREATE TABLE `CURSO_ALUMNO` (
  `ID_CURSO_ALUMNO` INT NOT NULL AUTO_INCREMENT,
  `ID_ALUMNO` INT NOT NULL,
  `ID_CURSO` INT NOT NULL,
  PRIMARY KEY (`ID_CURSO_ALUMNO`),
  CONSTRAINT `fk_CURSO_ALUMNO_ALUMNO1` FOREIGN KEY (`ID_ALUMNO`) REFERENCES `ALUMNO` (`ID_ALUMNO`), 
  CONSTRAINT `fk_CURSO_ALUMNO_CURSO1` FOREIGN KEY (`ID_CURSO`) REFERENCES `CURSO` (`ID_CURSO`)
) ;

-- --------------------------------------------------------------------------------------------------
--                                           CUARTO
-- --------------------------------------------------------------------------------------------------
-- ----------------------------
-- Estructura de la tabla ASISTENCIA
-- ----------------------------
CREATE TABLE `ASISTENCIA` (
  `ID_ASISTENCIA` INT NOT NULL AUTO_INCREMENT,
  `ESTADO` VARCHAR (1) NULL DEFAULT NULL,
  `ID_CURSO_ALUMNO` INT NOT NULL,
  PRIMARY KEY (`ID_ASISTENCIA`),
  CONSTRAINT `fk_ASISTENCIA_CURSOALUMNO` FOREIGN KEY (`ID_CURSO_ALUMNO`) REFERENCES `CURSO_ALUMNO` (`ID_CURSO_ALUMNO`)
) ;

-- ----------------------------
-- Estructura de la tabla ACTIVIDAD_PEDAGOGICA
-- ----------------------------
CREATE TABLE `ACTIVIDAD_PEDAGOGICA` (
  `ID_ACTIVIDAD` INT NOT NULL AUTO_INCREMENT,
  `FECHA` DATETIME (6) NULL DEFAULT NULL,
  `DESCRIPCION` VARCHAR (50) NULL DEFAULT NULL,
  `RECORDAR` BIT (1) NULL DEFAULT NULL,
  `ID_CURSO` INT NOT NULL,
  PRIMARY KEY (`ID_ACTIVIDAD`),
  CONSTRAINT `fk_actividadpedagogica_curso1` FOREIGN KEY (`ID_CURSO`) REFERENCES `CURSO` (`ID_CURSO`)
) ;

-- ----------------------------
-- Estructura de la tabla PERIODO
-- ----------------------------
CREATE TABLE `PERIODO` (
  `ID_PERIODO` INT NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` VARCHAR (50) NULL DEFAULT NULL,
  `ID_CURSO` INT (11) NOT NULL,
  PRIMARY KEY (`ID_PERIODO`),
  CONSTRAINT `fk_PERIODO_CURSO` FOREIGN KEY (`ID_CURSO`) REFERENCES `CURSO` (`ID_CURSO`)
) ;

-- ----------------------------
-- Estructura de la tabla PREGUNTA
-- ----------------------------
CREATE TABLE `PREGUNTA` (
  `ID_PREGUNTA` INT NOT NULL AUTO_INCREMENT,
  `PREGUNTA` VARCHAR (60) NULL DEFAULT NULL,
  `TEMA` VARCHAR (255) NULL DEFAULT NULL,
  `ID_CURSO` INT NOT NULL,
  PRIMARY KEY (`ID_PREGUNTA`),
  CONSTRAINT `fk_PREGUNTA_CURSO` FOREIGN KEY (`ID_CURSO`) REFERENCES `CURSO` (`ID_CURSO`)
) ;

-- ----------------------------
-- Estructura de la tabla AULA
-- ----------------------------
CREATE TABLE `AULA_DINAMICA` (
  `ID_AULA_DINAMICA` INT NOT NULL AUTO_INCREMENT,
  `COORD_X` INT NULL,
  `COORD_Y` INT NULL,
  `COLOR` VARCHAR (7) NULL,
  `ID_CURSO` INT NOT NULL,
  PRIMARY KEY (`ID_AULA_DINAMICA`),
  CONSTRAINT `fk_AULA_DINAMICA_CURSO` FOREIGN KEY (`ID_CURSO`) REFERENCES `CURSO` (`ID_CURSO`)
) ;

-- ----------------------------
-- Estructura de la tabla HORARIO
-- ----------------------------
CREATE TABLE `HORARIO` (
  `ID_HORARIO` INT NOT NULL AUTO_INCREMENT,
  `DIA` DATE NULL DEFAULT NULL,
  `HORA_INICIO` TIME(6) NULL DEFAULT NULL,
  `HORA_FIN` TIME(6) NULL DEFAULT NULL,
  `ID_CURSO` INT NOT NULL,
  PRIMARY KEY (`ID_HORARIO`),
  CONSTRAINT `fk_HORARIO_CURSO` FOREIGN KEY (`ID_CURSO`) REFERENCES `CURSO` (`ID_CURSO`)
) ;

-- --------------------------------------------------------------------------------------------------
--                                           QUINTO
-- --------------------------------------------------------------------------------------------------
-- ----------------------------
-- Estructura de la tabla UNIDAD
-- ----------------------------
CREATE TABLE `UNIDAD` (
  `ID_UNIDAD` INT NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` VARCHAR (60) NULL DEFAULT NULL,
  `ID_PERIODO` INT NOT NULL,
  PRIMARY KEY (`ID_UNIDAD`),
  CONSTRAINT `fk_UNIDAD_PERIODO` FOREIGN KEY (`ID_PERIODO`) REFERENCES `PERIODO` (`ID_PERIODO`)
) ;

-- ----------------------------
-- Estructura de la tabla COMPETENCIA
-- ----------------------------
CREATE TABLE `COMPETENCIA` (
  `ID_COMPETENCIA` INT NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` VARCHAR (60) NULL DEFAULT NULL,
  `ID_UNIDAD` INT NOT NULL,
  PRIMARY KEY (`ID_COMPETENCIA`),
  CONSTRAINT `fk_COMPETENCIA_UNIDAD` FOREIGN KEY (`ID_UNIDAD`) REFERENCES `UNIDAD` (`ID_UNIDAD`)
) ;

-- ----------------------------
-- Estructura de la tabla CAPACIDAD
-- ----------------------------
CREATE TABLE `CAPACIDAD` (
  `ID_CAPACIDAD` INT NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` VARCHAR (60) NULL DEFAULT NULL,
  `ID_COMPETENCIA` INT (255) NOT NULL,
  PRIMARY KEY (`ID_CAPACIDAD`),
  CONSTRAINT `fk_CAPACIDAD_COMPETENCIA` FOREIGN KEY (`ID_COMPETENCIA`) REFERENCES `COMPETENCIA` (`ID_COMPETENCIA`)
) ;

-- ----------------------------
-- Estructura de la tabla NOTA
-- ----------------------------
CREATE TABLE `NOTA` (
  `ID_NOTA` INT NOT NULL AUTO_INCREMENT,
  `NOTA` INT NULL,
  `ID_CURSO_ALUMNO` INT NOT NULL,
  `ID_CAPACIDAD` INT NOT NULL,
  PRIMARY KEY (`ID_NOTA`),
  CONSTRAINT `fk_NOTA_CURSO_ALUMNO` FOREIGN KEY (`ID_CURSO_ALUMNO`) REFERENCES `CURSO_ALUMNO` (`ID_CURSO_ALUMNO`),
  CONSTRAINT `fk_NOTA_CAPACIDAD` FOREIGN KEY (`ID_CAPACIDAD`) REFERENCES `CAPACIDAD` (`ID_CAPACIDAD`)
) ;

