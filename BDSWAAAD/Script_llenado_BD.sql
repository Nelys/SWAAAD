/********************************************************************************
*Descripción           : Script para llenar Base de Datos (SWAAAD)              *
*Fecha Creación        : 12/08/2017                                             *
*Parámetros            :                                                        *
*Autores               : Nelys Mollocondo Pari                                  *
*                      : Christian Tony Vilca Quiñonez                          *
*Cambios importantes   : Sep  3 22:04:21 2017                                   *
*                                                                               *
*                                                                               *
*                                                                               *
*********************************************************************************/
CREATE DATABASE /*!32312 IF NOT EXISTS*/`swaaad` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `swaaad`;

/*Datos para la tala `actividad_pedagogica` */

INSERT  INTO `actividad_pedagogica`(`ID_ACTIVIDAD`,`FECHA`,`DESCRIPCION`,`ID_CURSO_ALUMNO`) VALUES (1,'2017-10-31 07:40:28.000000','Halloween',1);

/*Datos para la tala `alumno` */

INSERT  INTO `alumno`(`ID_ALUMNO`,`NOMBRES`,`APELLIDOS`,`GENERO`,`EMAIL`,`NOMBRES_APODERADO`,`APELLIDOS_APODERADO`,`EMAIL_APODERADO`,`ID_USUARIO`) VALUES (1,'Brenda Laura','Aragón Salinas','F','brenda.aragon@gmail.com','Fernando Carlos','Aragón ','Aragon@hotmail.com',1),(2,'Karla Stephany','Aranibar Tila','F','karla.aranibar@gmail.com','Josue ','Aranibar ','Aranibar @hotmail.com',1),(3,'Rosa Edith','Atayupanqui Dueñas','F','rosa.atayupanqui@gmail.com','Pedro Carlos','Atayupanqui ','Atayupanqui @hotmail.com',1),(4,'Grisel Mercedes','Baldórrago Tinoco','F','grisel.baldorrago@gmail.com','Samuel Pedro','Baldérrago ','Balderrago @hotmail.com',1),(5,'Angie Camila','Barriga Fernández','F','angie.barriga@gmail.com','Cesar','Barriga ','Barriga @hotmail.com',1),(6,'Fiorela Alejaa','Begazo Vera','F','fiorela.begazo@gmail.com',NULL,NULL,NULL,1),(7,'Yenifer Pilar','Cahuana Pacha','F','yenifer.cahuana@gmail.com','Roberto','Cahuana ','Cahuana @hotmail.com',1),(8,'Lizbeth Reyna','Cayani Tejada','F','lizbet.cayani@gmail.com','Luis','Cayani ','Cayani @hotmail.com',1),(9,'Nicole Fabiola','Cayro Prevate','F','nicole.cayro@gmail.com','Estefano','Cayro ','Cayro @hotmail.com',1),(10,'Amanda Rebeca','Cazorla Jiménez','F','amanda.cazorla@gmail.com','David','Cazorla ','Cazorla @hotmail.com',1),(11,'Bettsy Brigite','Ccalachua Aquepucho','F','bettsy.ccalachua@gmail.com','Cesar Luis','Ccalachua ','Ccalachua @hotmail.com',1),(12,'Claudia Betsa','Chavez Marin','F','claudia.chavez@gmail.com','Julios Cesar','Chavez ','Chavez @hotmail.com',1),(13,'Karina Ximena','Checcori Moina','F','karina.checcori@gmail.com','Jhonatan Julio','Checcori ','Checcori @hotmail.com',1),(14,'Claudia Patricia','Delgado Frisancho','F','claudia.delgado@gmail.com','Fabricio','Delgado ','Delgado @hotmail.com',1),(15,'Mayra Matilde','Díaz Cárdenas','F','mayra.diaz@gmail.com','Tomas','Díaz ','Diaz @hotmail.com',1),(16,'Leira Miluska','Enríquez Huayta','F','leira.enriquez@gmail.com',NULL,'Enríquez ','iquez @hotmail.com',1),(17,'Allison Yolanda','Escalante Palacios','F','allison.escalante@gmail.com',NULL,'Escalante ','Escalante @hotmail.com',1),(18,'Bianka Lucia','Garcia Ibaez','F','bianka.garcia@gmail.com',NULL,'Garcia ','Garcia @hotmail.com',1),(19,'Milagros A.','Motta Rondón','F','milagros.motta@gmail.com',NULL,'Motta ','Motta @hotmail.com',1),(20,'Diana Margior','Nuñez Chavez','F','diana.nz@gmail.com',NULL,'Nuñez ','Nunez @hotmail.com',1),(21,'Shirley Patric','Ortiz Delgado','F','shirley.ortiz@gmail.com',NULL,'Ortiz ','Ortiz @hotmail.com',1),(22,'Ana Paula','Osorio Vargas','F','ana.osorio@gmail.com',NULL,'Osorio ','Osorio @hotmail.com',1),(23,'Lizeth Diana','Peña Villafuerte','F','lizeth.pe@gmail.com',NULL,'Peña ','Pea @hotmail.com',1),(24,'Luz Clara','Pillco Ramos','F','luz.pillco@gmail.com',NULL,'Pillco ','Pillco @hotmail.com',1),(25,'Alanys Virginia','Pineda Fernández','F','alanys.pineda@gmail.com',NULL,'Pineda ','Pineda @hotmail.com',1),(26,'Carla Daniela','Quiroz Condori','F','carla.quiroz@gmail.com',NULL,'Quiroz ','Quiroz @hotmail.com',1),(27,'Yakelyn Pao','Rios Salas','F','yakelyn.rios@gmail.com',NULL,'Rios ','Rios @hotmail.com',1),(28,'Virginia del Carme','Rodríguez Delelis','F','virginiarodriguez@gmail.com',NULL,'Rodríguez ','Rodriguez45@hotmail.com',1),(29,'Carola Andrea Alex','Rondón De La Cruz','F','carola.rondon@gmail.com',NULL,'Rondón ','Rond125@hotmail.com',1),(30,'Stephanie Alexan','Salas Rodriguez','F','stephanie.salas@gmail.com',NULL,'Salas ','Salas @hotmail.com',1),(31,'Luciana Anthua','Smith Postigo','F','luciana.smith@gmail.com',NULL,'Smith ','Smith @hotmail.com',1),(32,'Jose Manuel','Tejada Mamani','M','jose.tejad@gmail.com',NULL,'Tejada ','Tejada @hotmail.com',1),(33,'Andrea Del Carmen','Valdivia Cisneros','F','andrea.valdivia@gmail.com',NULL,'Valdivia ','Valdivia @hotmail.com',1),(34,'Rosse Mary','Valdivia Paredes','F','rosse.valdivia@gmail.com',NULL,'Valdivia ','Valdivia @hotmail.com',1),(35,'Clara Giannella','Valdivia Tinajeros','F','clara.valdivi@gmail.com',NULL,'Valdivia ','Valdivia @hotmail.com',1),(36,'Fabiola Cristin','Valencia Neyra','F','fabiola.valencia@gmail.com',NULL,'Valencia ','Valencia @hotmail.com',1),(37,'Richard  A.','Hanco Mamani','M','richardhanco@gmail.com',NULL,'Hanco ','Hanco @hotmail.com',1),(38,'Denise Antonella','Zevallos Barriga','F','denise.zevallos@gmail.com',NULL,'Zevallos ','Zevallos @hotmail.com',1),(39,'Maria','Colia Zapata','F','',NULL,NULL,NULL,1),(40,'aaaa','aaaa','F','aaaaa',NULL,NULL,NULL,1),(41,'aaaa','aaaaaa','F','asdf@gmail.com',NULL,NULL,NULL,1),(42,'Lizeth Diana','Smith Postigo','F','bbbb@gmail.com',NULL,NULL,NULL,1),(43,'Clara Giannella','Valdivia Tinajeros','F','ccccccccc@gmail.com',NULL,NULL,NULL,1),(44,'Ana Maria','Sanchez Diaz','F','',NULL,NULL,NULL,1),(45,'Ana Maria','Soto saens','F','maria@gmail.com',NULL,NULL,NULL,1),(46,'SDFSD','SDFSDF','F',NULL,NULL,NULL,NULL,1);

/*Datos para la tala `asistencia` */

INSERT  INTO `asistencia`(`ID_ASISTENCIA`,`ESTADO`,`FECHA`,`ID_CURSO_ALUMNO`) VALUES (25,'FJ','2017-11-04',1),(26,'FJ','2017-11-04',2),(27,'FJ','2017-11-04',3),(28,'A','2017-11-04',4),(29,'A','2017-11-04',5),(30,'A','2017-11-04',16),(31,'TJ','2017-11-06',1),(32,'T','2017-11-06',2),(33,'FJ','2017-11-06',3),(34,'FJ','2017-11-06',4),(35,'A','2017-11-06',5),(36,'A','2017-11-06',16),(37,'A','2017-11-08',1),(38,'A','2017-11-08',2),(39,'A','2017-11-08',3),(40,'A','2017-11-08',4),(41,'A','2017-11-08',5),(42,'A','2017-11-08',16);

/*Datos para la tala `aula_dinamica` */

INSERT  INTO `aula_dinamica`(`ID_AULA_DINAMICA`,`COORD_X`,`COORD_Y`,`COLOR_TEXTO`,`COLOR_FONDO`,`ESTADO`,`ID_CURSO_ALUMNO`) VALUES (1,163,183,NULL,'00a857','',1),(2,257,92,'','ce3131','',2),(3,356,161,'','f186','',3),(4,67,76,NULL,'00a857','',5);

/*Datos para la tala `curso` */

INSERT  INTO `curso`(`ID_CURSO`,`NOMBRE_CURSO`,`INSTITUCION`,`GRADO`,`SECCION`,`ANIO`,`ID_DOCENTE`) VALUES (1,'Matematica','Arequipa',5,'E',2017,1),(2,'Ciencia y Abiente','Arequipa',3,'F',2017,1),(3,'Aritmetica','Bryce',1,'C',2017,1),(4,'Matematica','Muñoz Najar',5,'E',2017,2),(5,'Biologia','Muñoz Najar',4,'A',2017,2),(6,'Fisica I','Muñoz Najar',5,'C',2017,2);

/*Datos para la tala `curso_alumno` */

INSERT  INTO `curso_alumno`(`ID_CURSO_ALUMNO`,`ID_CURSO`,`ID_ALUMNO`) VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,2,1),(7,2,2),(8,2,3),(9,2,4),(10,2,6),(11,3,11),(12,3,12),(13,3,13),(14,3,14),(15,3,15),(16,1,45);

/*Datos para la tala `docente` */

INSERT  INTO `docente`(`ID_DOCENTE`,`NOMBRE`,`APELLIDOS`,`GENERO`,`EMAIL`,`ID_USUARIO`) VALUES (1,'Carlos','Supo Mollocondo','M','carlos.supo@gmail.com',1),(2,'Lilian','Arias Lizares','F','LilianLizares@gmail.com',2),(5,'Christian','Vilca','M','chritian.vilcaq@gmail.com',5),(7,'Nelys','Mollocondo Pari','F','nelys.mp@gmail.com',7),(8,'Christian','vilca quinonez','F','chris@gmail.com',8);

/*Datos para la tala `evaluacion` */

INSERT  INTO `evaluacion`(`ID_EVALUACION`,`ID_CURSO`,`ID_EVALUACION_DEPENDENCIA`,`NOMBRE`,`DESCRIPCION`,`COLOR_FONDO`,`COLOR_TEXTO`,`FORMULA`,`ES_FORMULA`) VALUES (1,1,28,'tarea1','','#ffffff','#000000','idEvaluacion_1idEvaluacion_3','\0'),(2,1,28,'TAREA2','a','#ffffff','#000000','0','\0'),(3,1,28,'TAREA3','a','#ffffff','#000000','0','\0'),(4,1,25,'PROM','a','#e6deac','#000000','(idEvaluacion_1+idEvaluacion_2+idEvaluacion_3)/3',''),(5,2,0,'TAREA1','a','#337ab7','#ffffff',NULL,'\0'),(6,2,8,'TAREA2','a','#000005','#ffffff',NULL,'\0'),(7,2,8,'TAREA3','a','#000006','#ffffff',NULL,'\0'),(8,2,13,'PROM','a','#000007','#ffffff',NULL,'\0'),(9,2,12,'TAREA1','a','#000000','#ffffff',NULL,'\0'),(10,2,12,'TAREA2','a','#000001','#ffffff',NULL,'\0'),(11,2,12,'TAREA3','a','#000002','#ffffff',NULL,'\0'),(12,2,13,'PROM','aa','#000003','#ffffff',NULL,'\0'),(13,2,0,'PROME','a','#000004','#ffffff',NULL,'\0'),(14,2,0,'EXP1','a','#000005','#ffffff',NULL,'\0'),(15,1,17,'TAREA 1','','#ffffff','#000000','','\0'),(16,1,17,'TAREA5','','#ffffff','#000000','','\0'),(17,1,25,'PROM 1','','#5cb85c','#ffffff','idEvaluacion_15+idEvaluacion_16',''),(18,1,20,'EXPO2','','#ffffff','#000000','','\0'),(19,1,20,'EXPO3','','#ffffff','#000000','','\0'),(20,1,25,'EXPO4','','#337ab7','#ffffff','idEvaluacion_18+idEvaluacion_19',''),(25,1,0,'QWER','QWER','#777777','#000000','idEvaluacion_4+idEvaluacion_17+idEvaluacion_20',''),(26,1,0,'aa','asa','#7e4949','#160303','idEvaluacion_1+9',''),(27,1,0,'prueba','prome','#ffffff','#0e0e0e','','\0'),(28,1,0,'Prueba promedio','Probando promedio','','','idEvaluacion_1(0.30)+idEvaluacion_3(0.30)+idEvaluacion_2(0.40)','');

/*Datos para la tala `horario` */

/*Datos para la tala `nota` */

INSERT  INTO `nota`(`ID_NOTA`,`ID_ALUMNO`,`ID_EVALUACION`,`NOTA_EVALUATIVA`) VALUES (1,2,1,20),(2,2,2,7),(3,1,1,7),(4,7,5,16),(5,6,2,15),(6,6,3,20),(7,2,3,13),(8,2,4,10),(9,6,4,14),(10,1,5,4),(11,3,9,6),(12,1,11,0),(13,6,20,16),(14,6,18,2),(15,43,1,1),(16,43,2,1),(21,42,4,1),(22,43,4,1),(23,6,15,8),(24,6,16,20),(25,6,17,28),(26,2,17,4),(27,42,17,7),(28,43,17,4),(29,2,20,1),(30,42,20,1),(31,43,20,1),(32,6,25,58),(33,2,25,15),(34,42,25,9),(35,43,25,6),(36,6,19,14),(37,42,1,2),(38,2,15,3),(39,42,15,2),(40,42,16,5),(41,2,16,1),(42,43,15,2),(43,43,16,2),(44,2,19,1),(45,42,19,3),(46,43,19,1),(47,44,15,2),(48,44,17,2),(49,44,20,0),(50,44,25,2),(51,6,1,8),(52,6,26,17),(53,2,26,22),(54,42,26,11),(55,43,26,10),(56,44,26,9),(57,1,2,2),(58,1,3,6),(59,1,15,4);

/*Datos para la tala `usuario` */

INSERT  INTO `usuario`(`id_usuario`,`username`,`password`,`enabled`,`role`) VALUES (1,'luis@gmail.com','$2a$10$eGR3JIDoDSX.aJnnJ26L0OUAftI8k3Yc9jgIy3hqR43SlBaasRVFK',1,'ROLE_ADMIN'),(2,'nelys@gmail.com','$2a$10$eGR3JIDoDSX.aJnnJ26L0OUAftI8k3Yc9jgIy3hqR43SlBaasRVFK',1,'ROLE_ADMIN'),(5,'chritian.vilcaq@gmail.com','$2a$10$6IJM02gwn3bjvHhWa7jCROiu49sol5Ow.d.Ue3kDuw4sFoIjghj1u',0,'ROLE_ADMIN'),(7,'nelys.mp@gmail.com','$2a$10$q7cRVNIluKgq.iGRbFM9D.lr2i3OXBgm1LMqSz0woJfCtcs/gzium',1,'ROLE_ADMIN'),(8,'chris@gmail.com','$2a$10$eBqEwp9U48GlrPwR87aILO0P7bMc6HsL.jsFw6kACoxEy3Uspqh9e',0,'ROLE_ADMIN');
