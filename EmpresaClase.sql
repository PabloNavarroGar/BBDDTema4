CREATE DATABASE  IF NOT EXISTS `empresaclase` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `empresaclase`;
-- MySQL dump 10.13  Distrib 5.5.28, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: empresa_clase
-- ------------------------------------------------------
-- Server version	5.5.28-0ubuntu0.12.04.3

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
-- Table structure for table `centros`
--

DROP TABLE IF EXISTS `centros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centros` (
  `numce` int(11) NOT NULL,
  `nomce` varchar(60) NOT NULL,
  `dirce` varchar(60) NOT NULL,
  `codpostal` char(5) NOT NULL DEFAULT '00000',
  CONSTRAINT pk_centros PRIMARY KEY (`numce`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centros`
--

LOCK TABLES `centros` WRITE;
/*!40000 ALTER TABLE `centros` DISABLE KEYS */;
INSERT INTO `centros` VALUES (10,' SEDE CENTRAL',' C.ALCALA, 820, MADRID 28090','28090'),(20,' RELACION CON CLIENTES',' C.ATOCHA, 405, MADRID','28078'),(30,'GESTIÓN CENTROS SUR','C/ Real nº 18, 29680- Estepona','29680');
/*!40000 ALTER TABLE `centros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamentos` (
  `numde` int(11) NOT NULL,
  `numce` int(11) NOT NULL,
  `presude` decimal(10,2) NOT NULL,
  `depende` int(11) DEFAULT NULL,
  `nomde` varchar(60) NOT NULL,
  CONSTRAINT pk_departamentos PRIMARY KEY (`numde`),
  CONSTRAINT fk_deptos_centros FOREIGN KEY (`numce`) REFERENCES `centros`(`numce`)
	ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT fk_deptos_depen FOREIGN KEY (`depende`) REFERENCES `departamentos`(`numde`)
	ON DELETE NO ACTION ON UPDATE NO ACTION

  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (100,10,129000.00,NULL,'DIRECCION GENERAL'),(110,20,100000.00,100,'DIRECC.COMERCIAL'),(111,10,90000.00,110,'SECTOR INDUSTRIAL'),(112,20,175000.00,110,'SECTOR SERVICIOS'),(120,10,50000.00,100,'ORGANIZACION'),(121,10,74000.00,120,'PERSONAL'),(122,10,68000.00,120,'PROCESO DE DATOS'),(130,10,85000.00,100,'FINANZAS'),(131,20,15000.00,110,'Publicidad');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `numem` int(11) NOT NULL,
  `numde` int(11) DEFAULT NULL,
  `extelem` char(3) DEFAULT NULL,
  `fecnaem` date NOT NULL,
  `fecinem` date NOT NULL,
  `salarem` decimal(7,2) DEFAULT NULL,
  `comisem` decimal(7,2) DEFAULT NULL,
  `numhiem` tinyint(3) DEFAULT NULL,
  `nomem` varchar(20) DEFAULT NULL,
  `ape1em` varchar(20) DEFAULT NULL,
  `ape2em` varchar(20) DEFAULT NULL,
  `dniem` char(9) DEFAULT NULL,
  `userem` char(12) DEFAULT NULL,
  `passem` char(12) DEFAULT NULL,
  CONSTRAINT pk_empleados PRIMARY KEY (`numem`),
  CONSTRAINT fk_empleados_deptos FOREIGN KEY (`numde`) REFERENCES `departamentos`(`numde`)
	ON DELETE NO ACTION ON UPDATE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (110,121,'350','2065-02-17','1985-03-15',1000.00,NULL,2,'PEPITA','PEREZ','GÓMEZ','25012345a','sa',''),(120,112,'840','1970-09-10','1995-10-01',1200.00,NULL,3,'JUAN','LOPEZ',NULL,'12000111a',NULL,''),(130,112,'810','1958-03-01','1988-03-01',987.00,NULL,1,'ANA','GARCIA',NULL,'23089765a',NULL,''),(150,121,'340','1972-01-15','2001-01-15',856.00,NULL,0,'JULIA','VARGAS',NULL,'12345678b',NULL,''),(160,111,'740','1969-03-18','2002-03-18',998.00,NULL,4,'PEPA','CANALES',NULL,NULL,NULL,NULL),(180,110,'505','1971-02-11','1998-02-11',1967.00,NULL,5,'JUANA','RODRIGUEZ',NULL,NULL,NULL,NULL),(190,121,'350','1969-01-22','1997-01-22',1174.00,NULL,0,'LUISA','GOMEZ','SÁNCHEZ',NULL,NULL,NULL),(210,100,'200','1964-02-24','1986-02-24',3000.00,NULL,3,'CESAR','PONS',NULL,NULL,NULL,NULL),(240,111,'760','1959-03-01','1987-03-01',2145.00,110.00,1,'MARIO','LASA',NULL,NULL,NULL,NULL),(250,100,'250','1954-07-12','1976-07-12',3123.00,110.00,2,'LUCIANO','TEROL',NULL,NULL,NULL,NULL),(260,100,'220','1960-09-10','1979-09-10',1896.00,NULL,0,'JULIO','PEREZ',NULL,NULL,NULL,NULL),(270,112,'800','1979-10-08','2003-10-08',1215.00,110.00,2,'AUREO','AGUIRRE',NULL,NULL,NULL,NULL),(280,130,'410','1964-02-15','2000-02-15',978.00,NULL,2,'MARCOS','PEREZ',NULL,NULL,NULL,NULL),(285,122,'620','1966-09-10','1989-09-10',867.00,110.00,4,'JULIANA','VEIGA',NULL,NULL,NULL,NULL),(290,120,'910','1962-10-08','1981-10-08',865.00,50.00,2,'PILAR','GALVEZ',NULL,NULL,NULL,NULL),(310,130,'480','1971-01-15','1993-01-15',1125.00,NULL,3,'LAVINIA','SANZ',NULL,NULL,NULL,NULL),(320,122,'620','1957-02-05','1978-02-05',1235.00,NULL,0,'ADRIANA','ALBA',NULL,NULL,NULL,NULL),(330,112,'850','1949-03-01','1972-03-01',998.76,100.00,6,'ANTONIO','LOPEZ',NULL,NULL,NULL,NULL),(350,122,'610','1949-09-10','1984-09-10',864.00,NULL,3,'OCTAVIO','GARCIA',NULL,NULL,NULL,NULL),(360,111,'750','1958-10-28','1978-10-10',1724.00,80.00,5,'DOROTEA','FLOR',NULL,NULL,NULL,NULL),(370,121,'360','1967-06-22','1987-01-20',999.99,NULL,0,'OTILIA','POLO',NULL,NULL,NULL,NULL),(380,112,'880','1968-03-30','1988-01-01',1111.00,NULL,3,'GLORIA','GUIL',NULL,NULL,NULL,NULL),(390,110,'500','1966-02-19','1986-10-08',1435.00,NULL,0,'AUGUSTO','GARCIA',NULL,NULL,NULL,NULL),(400,111,'780','1969-08-18','1987-11-01',1198.00,NULL,2,'CORNELIO','SANZ',NULL,NULL,NULL,NULL),(410,120,'910','1968-07-14','1988-10-13',735.00,NULL,1,'DORINDA','LARA',NULL,NULL,NULL,NULL),(420,130,'450','1966-10-22','1988-10-13',968.00,90.00,1,'FABIOLA','RUIZ',NULL,NULL,NULL,NULL),(430,122,'650','1967-10-26','1988-11-19',1196.00,NULL,2,'MICAELA','MARTIN',NULL,NULL,NULL,NULL),(440,111,'760','1966-09-26','1988-11-19',882.00,100.00,1,'CARMEN','MORAN',NULL,NULL,NULL,NULL),(450,112,'880','1966-10-21','1986-02-28',1112.00,NULL,NULL,'LUCRECIA','LARA',NULL,NULL,NULL,NULL),(480,111,'760','1965-04-04','1986-02-28',1265.00,100.00,2,'AZUCENA','MUÑOZ',NULL,NULL,NULL,NULL),(490,112,'880','1964-06-06','1986-02-28',2178.00,100.00,1,'CLAUDIA','FIERRO',NULL,NULL,NULL,NULL),(500,111,'750','1965-10-08','1988-01-01',1009.00,NULL,NULL,'VALERIANA','MORA',NULL,NULL,NULL,NULL),(510,110,'550','1966-05-04','1987-01-01',1532.00,NULL,NULL,'LIVIA','DURAN',NULL,NULL,NULL,NULL),(550,111,'780','1970-01-10','1986-11-01',1245.00,120.00,2,'DIANA','PINO',NULL,NULL,NULL,NULL),(560,111,'780','1980-09-10','2000-11-10',999.00,NULL,1,'HONORIA','TORRES',NULL,NULL,NULL,NULL),(561,131,'930','1967-06-12','2012-01-24',2040.00,150.00,2,'Rosa','del Campo',NULL,NULL,NULL,NULL),(562,131,'940','1972-02-12','2012-01-24',1428.00,1428.00,1,'Pedro','González',NULL,NULL,NULL,NULL),(563,122,'970','1980-10-05','2012-01-30',1836.00,395.76,NULL,'Pedro','González',NULL,NULL,NULL,NULL),(890,121,'111','1900-01-01','1950-01-01',3060.00,2040.00,NULL,'eva','tortosa','perez',NULL,'eeee',NULL),(891,121,'111','1900-01-01','1950-01-01',2040.00,2040.00,NULL,'eva','tortosa','perez',NULL,'eeee',NULL),(999,121,'213','1900-01-01','1950-01-01',2040.00,2040.00,NULL,'eva2','tortosa',NULL,NULL,'qq',NULL);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `dirigir`
--

DROP TABLE IF EXISTS `dirigir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dirigir` (
  `numdepto` int(11) NOT NULL,
  `numempdirec` int(11) NOT NULL,
  `fecinidir` date NOT NULL,
  `fecfindir` date DEFAULT NULL,
  `tipodir` char(1) NOT NULL,
  CONSTRAINT pk_dirigir PRIMARY KEY (`numdepto`,`numempdirec`,`fecinidir`),

  CONSTRAINT fk_dirigir_deptos FOREIGN KEY (`numdepto`) REFERENCES `departamentos`(`numde`)
	ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT fk_dirigir_empleados FOREIGN KEY (`numempdirec`) REFERENCES `empleados`(`numem`)
	ON DELETE NO ACTION ON UPDATE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dirigir`
--

LOCK TABLES `dirigir` WRITE;
/*!40000 ALTER TABLE `dirigir` DISABLE KEYS */;
INSERT INTO `dirigir` VALUES (100,250,'1989-01-01',NULL,'P'),(100,260,'1979-09-10','1988-12-31','p'),(110,180,'1999-05-12','2009-12-31','F'),(110,390,'2010-01-01',NULL,'P'),(111,180,'2010-01-01',NULL,'f'),(112,330,'1989-01-01',NULL,'f'),(120,290,'1985-12-12',NULL,'p'),(121,150,'2003-08-03',NULL,'f'),(122,350,'1986-09-01',NULL,'p'),(130,310,'1994-04-15',NULL,'p'),(131,561,'2012-01-24','2013-01-24','p');
/*!40000 ALTER TABLE `dirigir` ENABLE KEYS */;
UNLOCK TABLES;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-01-14 12:22:34


-- 1.Obtener todos los datos de todos los empleados.

select *
from empleados;

-- 2.Obtener la extensión telefónica de “Juan López”.
select empleados.extelem as telefono

from empleados

where nomem = 'Juan' and ape1em = 'López';
-- se puede usar lo siguiente
-- where concat(empleados.nomem, ' ' , empleados.ape1em) = 'Juan López';
-- 3.Obtener el nombre completo de los empleados que tienen más de un hijo.

select nomem,ape1em,ape2em
from empleados

where numhiem > 1;
-- 4.Obtener el nombre completo y en una sola columna de los empleados que tienen entre 1 y 3 hijos.
select concat(nomem,ape1em,ape2em) as numHijos1a3
from empleados

where numhiem between 1 and 3;
-- 5.Obtener el nombre completo y en una sola columna de los empleados sin comisión.
select concat(nomem,ape1em,ape2em) as sinComision
from empleados

where comisem is null;
-- 6.Obtener la dirección del centro de trabajo “Sede Central”.
select dirce as direccionDelCentro
from centros
where nomce  = 'Sede Central';
-- 7.Obtener el nombre de los departamentos que tienen más de 6000 € de presupuesto.
select nomde as nombreDepartamento
from departamentos
where presude > 6000;
-- 8O.btener el nombre de los departamentos que tienen de presupuesto 6000 € o más.
-- 9O.btener el nombre completo y en una sola columna de los empleados que llevan trabajando en nuestra empresa más de 1 año. (Añade filas nuevas para poder comprobar que tu consulta funciona).

select concat(nomem,ape1em,ape2em) as nombreCompleto
from empleados
where fecinem > 1;
-- 10.Obtener el nombre completo y en una sola columna de los empleados que llevan trabajando en nuestra empresa entre 1 y tres años. (Añade filas nuevas para poder comprobar que tu consulta funciona).
select concat(nomem,ape1em,ape2em) as nombreCompleto
from empleados
where fecinem between 1 and 3;

/*
concact es una funcion que concadena cadenas, y el ws, es lo mismo pero por cada 2 cadenas 
*/
 delimiter $$
 drop procedure if exists nuestraExtension $$
 create procedure  nuestraExtenseion
 (nombre varchar (60),
 ape1 varchar(60)
 )
 begin
 select empleados.extelem as telefono

from empleados

where nomem = nombre and ape1em = ape1 ;
 
 end $$
 -- hay que usar el delimiter con el dolar y en el end ponerlo
 -- y cerrarlo con delimiter ; Creamos 2 delimiter para hacer bloques de codigo
 delimiter ;
 
 call nuestraExtension ('Juan','López')