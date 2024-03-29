CREATE DATABASE  IF NOT EXISTS `bdalmacen` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bdalmacen`;
-- MySQL dump 10.13  Distrib 5.5.29, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bdalmacen
-- ------------------------------------------------------
-- Server version	5.5.29-0ubuntu0.12.04.1

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
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `codproveedor` int(11) NOT NULL,
  `nomempresa` varchar(50) NOT NULL,
  `nomcontacto` varchar(50) DEFAULT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `ciudad` varchar(20) DEFAULT NULL,
  `codpostal` char(5) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  PRIMARY KEY (`codproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Cooperativa de Quesos \'Las Cabras\'','Antonio del Valle Saavedra ','Calle del Rosal 4','Oviedo','33007','902110011'),(2,'Postres para todos S.L.','Marรญa Reyes','Avda. El rosal s/n','Madrid','28002','912345677'),(3,'La pescadilla S.L.','Antonio Gutiรฉrrez','C/ Calvario 34','Mรกlaga','29017','952230000'),(4,'Todotrigo S.L.','Luisa Pรฉrez','C/ El viento, 34','Fuengirola','29015','952470000'),(5,'Refrescos y bebidas Cantos','Mateo Cantos','Avda. Ischia 12','Estepona','29012','952134567'),(6,'Todo del campo S.L.','Luciano Sรกnchez','C/ Agua 1','Mรกlaga','29014','952610000'),(7,'El matarife S.L.','Cristobal Gรณmez','C/ Los Sitios s/n','Marbella','29600','952770000');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `codproducto` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `codcategoria` int(11) DEFAULT NULL,
  `preciounidad` decimal(19,4) DEFAULT NULL,
  `stock` smallint(6) DEFAULT NULL,
  `pedidos` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`codproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Tรฉ Dharamsala',1,18.0000,39,0),(2,'Cerveza tibetana Barley',1,19.0000,17,50),(7,'Peras secas orgรกnicas del tรญo Bob',7,30.0000,15,10),(9,'Buey Mishi Kobe',6,97.0000,29,10),(10,'Pez espada',8,31.0000,31,0),(11,'Queso Cabrales',4,21.0000,22,40),(12,'Queso Manchego La Pastora',4,38.0000,86,0),(13,'Algas Konbu',8,6.0000,24,10),(14,'Cuajada de judรญas',7,23.2500,35,0),(16,'Postre de merengue Pavlova',3,17.4500,29,10),(17,'Cordero Alice Springs',6,39.0000,0,15),(18,'Langostinos tigre Carnarvon',8,62.5000,42,0),(19,'Pastas de tรฉ de chocolate',3,9.2000,25,10),(20,'Mermelada de Sir Rodney\'s',3,81.0000,40,0),(21,'Bollos de Sir Rodney\'s',3,10.0000,3,55),(22,'Pan de centeno crujiente estilo Gustaf\'s',5,21.0000,104,0),(23,'Pan fino',5,9.0000,61,0),(24,'Refresco Guaranรก Fantรกstica',1,4.5000,20,10),(25,'Crema de chocolate y nueces NuNuCa',3,14.0000,76,0),(26,'Ositos de goma Gumbรคr',3,31.2300,15,10),(27,'Chocolate Schoggi',3,43.9000,49,0),(28,'Col fermentada Rรถssle',7,45.6000,26,10),(29,'Salchicha Thรผringer',6,123.7900,0,15),(30,'Arenque blanco del noroeste',8,25.8900,10,10),(31,'Queso gorgonzola Telino',4,12.5000,0,85),(32,'Queso Mascarpone Fabioli',4,32.0000,9,50),(33,'Queso de cabra',4,2.5000,112,0),(34,'Cerveza Sasquatch',1,14.0000,111,0),(35,'Cerveza negra Steeleye',1,18.0000,20,10),(36,'Escabeche de arenque',8,19.0000,112,0),(37,'Salmรณn ahumado Gravad',8,26.0000,11,60),(38,'Vino Cรดte de Blaye',1,263.5000,17,10),(39,'Licor verde Chartreuse',1,18.0000,69,0),(40,'Carne de cangrejo de Boston',8,18.4000,123,0),(41,'Crema de almejas estilo Nueva Inglaterra',8,9.6500,85,0),(42,'Tallarines de Singapur',5,14.0000,26,10),(43,'Cafรฉ de Malasia',1,46.0000,17,20),(45,'Arenque ahumado',8,9.5000,5,85),(46,'Arenque salado',8,12.0000,95,0),(47,'Galletas Zaanse',3,9.5000,36,0),(48,'Chocolate holandรฉs',3,12.7500,15,80),(49,'Regaliz',3,20.0000,10,70),(50,'Chocolate blanco',3,16.2500,65,0),(51,'Manzanas secas Manjimup',7,53.0000,20,10),(52,'Cereales para Filo',5,7.0000,38,0),(53,'Empanada de carne',6,32.8000,0,15),(54,'Empanada de cerdo',6,7.4500,21,10),(55,'Patรฉ chino',6,24.0000,115,0),(56,'Gnocchi de la abuela Alicia',5,38.0000,21,20),(57,'Raviolis Angelo',5,19.5000,36,0),(58,'***TRIAL MODE***',8,13.2500,62,0),(59,'***TRIAL MODE***',4,55.0000,79,0),(60,'***TRIAL MODE***',4,34.0000,19,10),(62,'***TRIAL MODE**',3,49.3000,17,10),(64,'***TRIAL MODE***',5,33.2500,22,90),(67,'***TRIAL MODE***',1,14.0000,52,0),(68,'***TRIAL MODE***',3,12.5000,6,20),(69,'***TRIAL MODE***',4,36.0000,26,10),(70,'***TRIAL MODE**',1,15.0000,15,20),(71,'***TRIAL MODE***',4,21.5000,26,10),(72,'***TRIAL MODE***',4,34.8000,14,10),(73,'***TRIAL MO',8,15.0000,101,0),(74,'***TRIAL MODE***',7,10.0000,4,35),(75,'***TRIAL MODE***',1,7.7500,125,0),(76,'***TRIAL MODE***',1,18.0000,57,0),(77,'***TRIAL MODE**',2,3.0000,12,12),(78,'***TRIAL MODE***',2,2.5900,35,0),(79,'***TRIAL MODE***',2,5.0000,25,10);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `codcategoria` int(11) NOT NULL,
  `Nomcategoria` varchar(30) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `codproveedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`codcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Bebidas','Gaseosas, cafรฉ, tรฉ, cervezas y maltas',5),(2,'Congelados','Productos congelados',3),(3,'Reposterรญa','Postres, dulces y pan dulce',2),(4,'Lรกcteos','Quesos',1),(5,'Granos/Cereales','Pan, galletas, pasta y cereales',4),(6,'Carnes','Carnes y chacina',7),(7,'Frutas/Verduras','Frutas frescas, frutos secos, verduras y hortalizas',6),(8,'Pescado/Marisco','Pescados, mariscos y algas',3);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysdiagrams`
--

DROP TABLE IF EXISTS `sysdiagrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysdiagrams` (
  `diagram_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 NOT NULL,
  `principal_id` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `definition` longblob,
  PRIMARY KEY (`diagram_id`),
  UNIQUE KEY `UK_principal_name` (`principal_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysdiagrams`
--

LOCK TABLES `sysdiagrams` WRITE;
/*!40000 ALTER TABLE `sysdiagrams` DISABLE KEYS */;
INSERT INTO `sysdiagrams` VALUES (1,'ESQUEMA_RELACIONAL',1,1,'ะฯ เกฑ\Zแ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0>\0 \0	\0 \0\0\0\0\0\0\0\0\0\0\0 \0\0\0 \0\0\0\0\0\0\0\0 \0\0 \0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0	\0\0\0\n\0\0\0 \0\0\0\r\0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0R\0o\0o\0t\0 \0E\0n\0t\0r\0y\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0 \0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ำ ” ๛ฬ  \0\0\0€ \0\0\0\0\0\0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ฎ \0\0\0\0\0\0o\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0   \0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0ษ\0\0\0\0\0\0 \0C\0o\0m\0p\0O\0b\0j\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0C\0\0\0_\0\0\0\0\0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0	\0\0\0\n\0\0\0 \0\0\0\0\0\0\r\0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0\Z\0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0!\0\0\0\"\0\0\0#\0\0\0$\0\0\0%\0\0\0&\0\0\0\'\0\0\0(\0\0\0)\0\0\0*\0\0\0+\0\0\0,\0\0\0-\0\0\0.\0\0\0/\0\0\00\0\0\01\0\0\02\0\0\03\0\0\04\0\0\05\0\0\06\0\0\07\0\0\08\0\0\09\0\0\0:\0\0\0;\0\0\0<\0\0\0=\0\0\0>\0\0\0?\0\0\0@\0\0\0A\0\0\0B\0\0\0D\0\0\0F\0\0\0G\0\0\0H\0\0\0I\0\0\0J\0\0\0K\0\0\0L\0\0\0M\0\0\0N\0\0\0O\0\0\0P\0\0\0Q\0\0\0R\0\0\0S\0\0\0T\0\0\0U\0\0\0V\0\0\0W\0\0\0X\0\0\0Y\0\0\0Z\0\0\0[\0\0\0\\\0\0\0]\0\0\0^\0\0\0_\0\0\0`\0\0\0a\0\0\0b\0\0\0c\0\0\0d\0\0\0e\0\0\0f\0\0\0g\0\0\0h\0\0\0i\0\0\0j\0\0\0k\0\0\0l\0\0\0m\0\0\0n\0\0\0q\0\0\0r\0\0\0s\0\0\0t\0\0\0u\0\0\0v\0\0\0w\0\0\0x\0\0\0y\0\0\0z\0\0\0{\0\0\0|\0\0\0\0 4\0\n P \0\0€ \0\0\0 \0K\0\0\0 \0\0\0\0}\0\0ชd\0\0ฦ9\0\0` \0\0 a\0\0ภเฅ๖€[ ๑•ะ ฐ \0ช\0ฝห\\\0\0 \00\0\0\0\0 \0\0 \0\0\08\0+\0\0\0	\0\0\0ูๆฐ้  ะ ญQ\0 ษ W9๔;   aวC…5) แีR๘ 2}ฒุb•B  \'<%ขฺ-\0\0,\0C \0\0\0\0\0\0\0\0\0\0SDMา  ั  c\0`—า฿H4ษาwywุ  p\0 [ \r \0\0,\0C \0\0\0\0\0\0\0\0\0\0QDMา  ั  c\0`—า฿H4ษาwywุ  p\0 [ \r \n\0\0\0ด \0\0\0  \0\0\04\0ฅ	\0\0 \0\0€ \0\0\0ฆ \0\0\0€\0\0\n\0\0€SchGrid\0n(\0\0x \0\0categorias\0\0\0\00\0ฅ	\0\0 \0\0€ \0\0\0  \0\0\0€\0\0 \0\0€SchGrid\0f!\0\0 ๙pedidos\0\0\04\0ฅ	\0\0 \0\0€ \0\0\0ค \0\0\0€\0\0	\0\0€SchGrid\0jJ\0\0 ๙productoss\0\0\0\04\0ฅ	\0\0 \0\0€ \0\0\0จ \0\0\0€\0\0 \0\0€SchGrid\0H๔๘๘proveedores\0\0\0l\0ฅ	\0\0 \0\0€ \0\0\0b\0\0\0 €\0\0C\0\0€Control\0#D\0\0ณ \0\0Relaci๓n \'FK_productos_categorias\' entre \'categorias\' y \'productos\'\0\0\0(\0ต \0\0 \0\0€ \0\0\01\0\0\0a\0\0\0 €\0\0Control\0iF\0\0\"\Z\0\0\0\0h\0ฅ	\0\0 \0\0€ \0\0\0R\0\0\0 €\0\0=\0\0€Control\0h>\0\0 ๘Relaci๓n \'FK_pedidos_productos\' entre \'productos\' y \'pedidos\'\0\0\0\0\0(\0ต \0\0 \0\0€	\0\0\01\0\0\0[\0\0\0 €\0\0Control\0>\0\0 ๘\0\0p\0ฅ	\0\0 \0\0€\n\0\0\0b\0\0\0 €\0\0G\0\0€Control\0J \0\0ญ \0\0Relaci๓n \'FK_categorias_proveedores\' entre \'proveedores\' y \'categorias\'s\0\0(\0ต \0\0 \0\0€ \0\0\01\0\0\0e\0\0\0 €\0\0Control\0- \0\0๓ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0!C4  \0\0\0. \0\0\r \0\0xV4  \0\0\0  \0\0c\0a\0t\0e\0g\0o\0r\0i\0a\0s\0\0\0r\0e\0r\0,\0 \0V\0e\0r\0s\0i\0o\0n\0=\01\00\0.\00\0.\00\0.\00\0,\0 \0C\0u\0l\0t\0u\0r\0e\0=\0n\0e\0u\0t\0r\0a\0l\0,\0 \0P\0u\0b\0l\0i\0c\0K\0e\0y\0T\0o\0k\0e\0n\0=\08\09\08\04\05\0d\0c\0d\08\00\08\00\0c\0c\09\01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0 \0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\0 :\0\0k \0\0\0\0\0\0- \0\0 \0\0\0\0\0\0 \0\0\0  \0\0ไ\0\0 \n\0\0  \0\0e \0\0  \0\0  \0\0  \0\0 \0\0  \0\0a \0\0พ \0\0\0\0\0\0 \0\0\0. \0\0\r \0\0\0\0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0  \0\0ฤ \0\0\0\0\0\0 \0\0\0฿\Z\0\0E \0\0\0\0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0  \0\0ไ\0\0 \0\0\0\0\0\0\0฿\Z\0\0๖ \0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0 \0\0\0  \0\0ไ\0\0\0\0\0\0\0\0\0\0}F\0\0C3\0\0\0\0\0\0\0\0\0\0\r\0\0\0 \0\0\0 \0\0\0  \0\0ไ\0\0< \0\0`	\0\0xV4  \0\0\0^\0\0\0 \0\0\0 \0\0\0 \0\0\0\0\0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0	\0\0\0\n\0\0\0 \0\0\0d\0b\0o\0\0\0 \0\0\0c\0a\0t\0e\0g\0o\0r\0i\0a\0s\0\0\0!C4  \0\0\0. \0\0v \0\0xV4  \0\0\0  \0\0p\0e\0d\0i\0d\0o\0s\0\0\0a\0t\0a\0,\0 \0V\0e\0r\0s\0i\0o\0n\0=\02\0.\00\0.\00\0.\00\0,\0 \0C\0u\0l\0t\0u\0r\0e\0=\0n\0e\0u\0t\0r\0a\0l\0,\0 \0P\0u\0b\0l\0i\0c\0K\0e\0y\0T\0o\0k\0e\0n\0=\0b\07\07\0a\05\0c\05\06\01\09\03\04\0e\00\08\09\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0 \0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\0 :\0\0k \0\0\0\0\0\0- \0\0 \0\0\0\0\0\0 \0\0\0  \0\0ไ\0\0 \n\0\0  \0\0e \0\0  \0\0  \0\0  \0\0 \0\0  \0\0a \0\0พ \0\0\0\0\0\0 \0\0\0. \0\0v \0\0\0\0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0  \0\0ฤ \0\0\0\0\0\0 \0\0\0฿\Z\0\0E \0\0\0\0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0  \0\0ไ\0\0 \0\0\0\0\0\0\0฿\Z\0\0๖ \0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0 \0\0\0  \0\0ไ\0\0\0\0\0\0\0\0\0\0}F\0\0C3\0\0\0\0\0\0\0\0\0\0\r\0\0\0 \0\0\0 \0\0\0  \0\0ไ\0\0< \0\0`	\0\0xV4  \0\0\0X\0\0\0 \0\0\0 \0\0\0 \0\0\0\0\0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0	\0\0\0\n\0\0\0 \0\0\0d\0b\0o\0\0\0 \0\0\0p\0e\0d\0i\0d\0o\0s\0\0\0!C4  \0\0\0. \0\0เ\Z\0\0xV4  \0\0\0  \0\0p\0r\0o\0d\0u\0c\0t\0o\0s\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0 \0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\0 :\0\0บ\"\0\0\0\0\0\0- \0\0 \0\0\0\0\0\0 \0\0\0  \0\0ไ\0\0 \n\0\0  \0\0e \0\0  \0\0  \0\0  \0\0 \0\0  \0\0a \0\0พ \0\0\0\0\0\0 \0\0\0. \0\0เ\Z\0\0\0\0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0  \0\0ฤ \0\0\0\0\0\0 \0\0\0฿\Z\0\0E \0\0\0\0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0  \0\0ไ\0\0 \0\0\0\0\0\0\0฿\Z\0\0๖ \0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0 \0\0\0  \0\0ไ\0\0\0\0\0\0\0\0\0\0}F\0\0C3\0\0\0\0\0\0\0\0\0\0\r\0\0\0 \0\0\0 \0\0\0  \0\0ไ\0\0< \0\0`	\0\0xV4  \0\0\0\\\0\0\0 \0\0\0 \0\0\0 \0\0\0\0\0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0	\0\0\0\n\0\0\0 \0\0\0d\0b\0o\0\0\0\n\0\0\0p\0r\0o\0d\0u\0c\0t\0o\0s\0\0\0!C4  \0\0\0. \0\0I \0\0xV4  \0\0\0  \0\0p\0r\0o\0v\0e\0e\0d\0o\0r\0e\0s\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0 \0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\0 :\0\0	&\0\0\0\0\0\0- \0\0	\0\0\0\0\0\0 \0\0\0  \0\0ไ\0\0 \n\0\0  \0\0e \0\0  \0\0  \0\0  \0\0 \0\0  \0\0a \0\0พ \0\0\0\0\0\0 \0\0\0. \0\0I \0\0\0\0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0  \0\0ฤ \0\0\0\0\0\0 \0\0\0฿\Z\0\0E \0\0\0\0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0  \0\0ไ\0\0 \0\0\0\0\0\0\0฿\Z\0\0๖ \0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0 \0\0\0  \0\0ไ\0\0\0\0\0\0\0\0\0\0}F\0\0C3\0\0\0\0\0\0\0\0\0\0\r\0\0\0 \0\0\0 \0\0\0  \0\0ไ\0\0< \0\0`	\0\0xV4  \0\0\0`\0\0\0 \0\0\0 \0\0\0 \0\0\0\0\0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0	\0\0\0\n\0\0\0 \0\0\0d\0b\0o\0\0\0\0\0\0p\0r\0o\0v\0e\0e\0d\0o\0r\0e\0s\0\0\0 \0 \0บE\0\0x \0\0บE\0\0s \0\0\0K\0\0s \0\0\0K\0\0n \0\0\0\0\0\0 \0\0\0๐๐๐\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0 \0\0\0\0\0\0\0iF\0\0\"\Z\0\0พ\r\0\0X \0\0!\0\0\0 \0\0 \0\0พ\r\0\0X \0\0 \0\0\0\0\0 \0\0€ \0\0€ \0\0\0 \0 \0\0\0  DB \0 Tahoma \0F\0K\0_\0p\0r\0o\0d\0u\0c\0t\0o\0s\0_\0c\0a\0t\0e\0g\0o\0r\0i\0a\0s\0 \0 \0jJ\0\0$๚”?\0\0$๚\0\0\0\0 \0\0\0๐๐๐\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0	\0\0\0\0\0\0\0>\0\0 ๘G\0\0X \0\02\0\0\0 \0\0 \0\0G\0\0X \0\0 \0\0\0\0\0\0 \0\0€ \0\0\0 \0 \0\0\0  DB \0 Tahoma \0F\0K\0_\0p\0e\0d\0i\0d\0o\0s\0_\0p\0r\0o\0d\0u\0c\0t\0o\0s\0 \0 \0v \0\0D \0\0r \0\0D \0\0r \0\0  \0\0n(\0\0  \0\0\0\0\0\0 \0\0\0๐๐๐\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0 \0\0\0\0\0\0\0- \0\0๓ \0\05 \0\0X \0\0 \0\0\0 \0\0 \0\05 \0\0X \0\0 \0\0\0\0\0\0 \0\0€ \0\0\0 \0 \0\0\0  DB \0 Tahoma \0F\0K\0_\0c\0a\0t\0e\0g\0o\0r\0i\0a\0s\0_\0p\0r\0o\0v\0e\0e\0d\0o\0r\0e\0s\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0 \n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0Microsoft DDS Form 2.0\0 \0\0\0Embedded Object\0\0\0\0\0๔9ฒq\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ภเฅ๖ \0&\0\0\0s\0c\0h\0_\0l\0a\0b\0e\0l\0s\0_\0v\0i\0s\0i\0b\0l\0e\0\0\0 \0\0\0 \0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ะ \0\0 \0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0 \0\0\0 \0 \0 \0D\0d\0s\0S\0t\0r\0e\0a\0m\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0 \0 \0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0E\0\0\0{\n\0\0\0\0\0\0S\0c\0h\0e\0m\0a\0 \0U\0D\0V\0 \0D\0e\0f\0a\0u\0l\0t\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0&\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0o\0\0\0 \0\0\0\0\0\0\0D\0S\0R\0E\0F\0-\0S\0C\0H\0E\0M\0A\0-\0C\0O\0N\0T\0E\0N\0T\0S\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0,\0   \0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0p\0\0\0  \0\0\0\0\0\0S\0c\0h\0e\0m\0a\0 \0U\0D\0V\0 \0D\0e\0f\0a\0u\0l\0t\0 \0P\0o\0s\0t\0 \0V\06\0\0\0\0\0\0\0\0\0\0\0\0\06\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0}\0\0\0 \0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0 \0\0\0 \0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\03\03\00\00\0,\01\0,\02\07\00\00\0,\05\0,\01\08\00\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0 \0\0\0 \0 \0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\07\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0 \0\0\0 \0 \0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\03\00\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0 \0\0\0 \0 \0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\03\00\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0 \0\0\0 \0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\03\03\00\00\0,\01\02\0,\03\09\00\00\0,\01\01\0,\02\04\00\00\0\0\0 \0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ะ \0\0 \0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0 \0\0\0 \0 \0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0 \0\0\0 \0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\03\03\00\00\0,\01\0,\02\07\00\00\0,\05\0,\01\08\00\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0 \0\0\0 \0 \0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\07\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0 \0\0\0 \0 \0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\03\00\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0 \0\0\0 \0 \0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\03\00\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0 \0\0\0 \0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\03\03\00\00\0,\01\02\0,\03\09\00\00\0,\01\01\0,\02\04\00\00\0\0\0 \0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ะ \0\0 \0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0 \0\0\0 \0 \0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0 \0\0\0 \0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\03\03\00\00\0,\01\0,\02\07\00\00\0,\05\0,\01\08\00\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0 \0\0\0 \0 \0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\07\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0 \0\0\0 \0 \0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\03\00\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0 \0\0\0 \0 \0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\03\00\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0 \0\0\0 \0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\03\03\00\00\0,\01\02\0,\03\09\00\00\0,\01\01\0,\02\04\00\00\0\0\0 \0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ะ \0\0 \0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0 \0\0\0 \0 \0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0 \0\0\0 \0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\03\03\00\00\0,\01\0,\02\07\00\00\0,\05\0,\01\08\00\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0 \0\0\0 \0 \0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\07\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0 \0\0\0 \0 \0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\03\00\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0 \0\0\0 \0 \0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\03\00\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0 \0\0\0 \0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\03\03\00\00\0,\01\02\0,\03\09\00\00\0,\01\01\0,\02\04\00\00\0\0\0 \0\0\0 \0\0\0\0\0\0\0@\0\0\0  \0\0 \0\0\0d\0b\0o\0\0\0F\0K\0_\0p\0r\0o\0d\0u\0c\0t\0o\0s\0_\0c\0a\0t\0e\0g\0o\0r\0i\0a\0s\0\0\0\0\0\0\0\0\0\0\0ฤ \0\0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0 ำ=\n ำ=\n\0\0\0\0\0\0\0\0ญ \0\0 \0\0 \0\0\0 \0\0\0\0\0\0\0:\0\0\0  \0\0 \0\0\0d\0b\0o\0\0\0F\0K\0_\0p\0e\0d\0i\0d\0o\0s\0_\0p\0r\0o\0d\0u\0c\0t\0o\0s\0\0\0\0\0\0\0\0\0\0\0ฤ \0\0\0\0	\0\0\0	\0\0\0 \0\0\0 \0\0\0 ั=\n ั=\n\0\0\0\0\0\0\0\0ญ \0\0 \0\0\n\0\0\0\n\0\0\0\0\0\0\0D\0\0\0  \0\0 \0\0\0d\0b\0o\0\0\0F\0K\0_\0c\0a\0t\0e\0g\0o\0r\0i\0a\0s\0_\0p\0r\0o\0v\0e\0e\0d\0o\0r\0e\0s\0\0\0\0\0\0\0\0\0\0\0ฤ \0\0\0\0 \0\0\0 \0\0\0\n\0\0\0 \0\0\0 ุ=\nุุ=\n\0\0\0\0\0\0\0\0ญ \0\0 \0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0b\0\0\0 \0\0\0 \0\0\0 \0\0\0 \0\0\0d\0\0\0e\0\0\0\n\0\0\0 \0\0\0 \0\0\0ว\0\0\0d\0\0\0\0\0\0\0\0 \0 \0\0\0\0\0\0\0\0\0\0 \0\0\0Naผ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ๆฐ้  ะ ญQ\0 ษ W9\0\0 \0ps ” ๛ฬ   \0\0 HE\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ฆ \0\0D\0a\0t\0a\0 \0S\0o\0u\0r\0c\0e\0=\0P\0R\0O\0F\0E\0S\0O\0R\0-\0P\0C\0\\\0M\0S\0S\0Q\0L\0S\0E\0R\0V\0E\0R\0_\0P\0R\0O\0F\0;\0I\0n\0i\0t\0i\0a\0l\0 \0C\0a\0t\0a\0l\0o\0g\0=\0B\0D\0A\0L\0M\0A\0C\0E\0N\0;\0P\0e\0r\0s\0i\0s\0t\0 \0S\0e\0c\0u\0r\0i\0t\0y\0 \0I\0n\0f\0o\0=\0T\0r\0u\0e\0;\0U\0s\0e\0r\0 \0I\0D\0=\0s\0a\0;\0M\0u\0l\0t\0i\0p\0l\0e\0A\0c\0t\0i\0v\0e\0R\0e\0s\0u\0l\0t\0S\0e\0t\0s\0=\0F\0a\0l\0s\0e\0;\0P\0a\0c\0k\0e\0t\0 \0S\0i\0z\0e\0=\04\00\09\06\0;\0A\0p\0p\0l\0i\0c\0a\0t\0i\0o\0n\0 \0N\0a\0m\0e\0=\0\"\0M\0i\0c\0r\0o\0s\0o\0f\0t\0 \0S\0Q\0L\0 \0S\0e\0r\0v\0e\0r\0 \0M\0a\0n\0a\0g\0e\0m\0e\0n\0t\0 \0S\0t\0u\0d\0i\0o\0\"\0\0\0\0€ \0&\0\0\0E\0S\0Q\0U\0E\0M\0A\0_\0R\0E\0L\0A\0C\0I\0O\0N\0A\0L\0\0\0\0 &\0 \0\0\0c\0a\0t\0e\0g\0o\0r\0i\0a\0s\0\0\0 \0\0\0d\0b\0o\0\0\0\0 &\0 \0\0\0p\0e\0d\0i\0d\0o\0s\0\0\0 \0\0\0d\0b\0o\0\0\0\0 &\0 \0\0\0p\0r\0o\0d\0u\0c\0t\0o\0s\0\0\0 \0\0\0d\0b\0o\0\0\0\0 $\0 \0\0\0p\0r\0o\0v\0e\0e\0d\0o\0r\0e\0s\0\0\0 \0\0\0d\0b\0o\0\0\0 \0\0\0ึ…	ณปk๒E ธ7 d๐2p \0N\0\0\0{\01\06\03\04\0C\0D\0D\07\0-\00\08\08\08\0-\04\02\0E\03\0-\09\0F\0A\02\0-\0B\06\0D\03\02\05\06\03\0B\09\01\0D\0}\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0 \0\0\0\0\0\0\0\0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0b R ');
/*!40000 ALTER TABLE `sysdiagrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `codpedido` int(11) NOT NULL,
  `fecpedido` datetime DEFAULT NULL,
  `fecentrega` datetime DEFAULT NULL,
  `codproducto` int(11) DEFAULT NULL,
  `cantidad` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`codpedido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (10249,'1996-07-05 00:00:00','1996-08-16 00:00:00',2,20),(10250,'1996-07-08 00:00:00','1996-08-05 00:00:00',31,70),(10251,'1996-07-08 00:00:00','1996-08-05 00:00:00',11,30),(10252,'1996-07-09 00:00:00','1996-08-06 00:00:00',21,18),(10253,'1996-07-10 00:00:00','1996-07-24 00:00:00',2,15),(10254,'1996-07-11 00:00:00','1996-08-08 00:00:00',32,10),(10256,'1996-07-15 00:00:00','1996-08-12 00:00:00',2,5),(10259,'1996-07-18 00:00:00','1996-08-15 00:00:00',21,5),(10262,'1996-07-22 00:00:00','1996-08-19 00:00:00',37,20),(10264,'1996-07-24 00:00:00','1996-08-21 00:00:00',21,7),(10266,'1996-07-26 00:00:00','1996-09-06 00:00:00',32,15),(10269,'1996-07-31 00:00:00','1996-08-14 00:00:00',21,10),(10271,'1996-08-01 00:00:00','1996-08-29 00:00:00',32,15),(10275,'1996-08-07 00:00:00','1996-09-04 00:00:00',45,15),(10286,'1996-08-21 00:00:00','1996-09-18 00:00:00',37,30),(10287,'1996-08-22 00:00:00','1996-09-19 00:00:00',43,10),(10288,'1996-08-23 00:00:00','1996-09-20 00:00:00',45,20),(10293,'1996-08-29 00:00:00','1996-09-26 00:00:00',48,30),(10296,'1996-09-03 00:00:00','1996-10-01 00:00:00',45,35),(10303,'1996-09-11 00:00:00','1996-10-09 00:00:00',49,20),(10307,'1996-09-17 00:00:00','1996-10-15 00:00:00',56,10),(10309,'1996-09-19 00:00:00','1996-10-17 00:00:00',64,20),(10310,'1996-09-20 00:00:00','1996-10-18 00:00:00',74,20),(10312,'1996-09-23 00:00:00','1996-10-21 00:00:00',48,40),(10314,'1996-09-25 00:00:00','1996-10-23 00:00:00',64,30),(10316,'1996-09-27 00:00:00','1996-10-25 00:00:00',49,40),(10318,'1996-10-01 00:00:00','1996-10-29 00:00:00',70,5),(10319,'1996-10-02 00:00:00','1996-10-30 00:00:00',68,10),(10322,'1996-10-04 00:00:00','1996-11-01 00:00:00',64,30),(10325,'1996-10-09 00:00:00','2006-10-23 00:00:00',70,5),(10326,'2012-05-08 09:48:44',NULL,17,5),(10327,'2012-05-08 09:48:44',NULL,21,5),(10328,'2012-05-08 09:48:44',NULL,29,5),(10329,'2012-05-08 09:48:44',NULL,31,5),(10330,'2012-05-08 09:48:44',NULL,45,5),(10331,'2012-05-08 09:48:44',NULL,53,5),(10332,'2012-05-08 09:48:44',NULL,74,5),(10333,'2012-05-08 09:59:46',NULL,2,10),(10334,'2012-05-08 09:59:46',NULL,7,10),(10335,'2012-05-08 09:59:46',NULL,9,10),(10336,'2012-05-08 09:59:46',NULL,11,10),(10337,'2012-05-08 09:59:46',NULL,13,10),(10338,'2012-05-08 09:59:46',NULL,16,10),(10339,'2012-05-08 09:59:46',NULL,17,10),(10340,'2012-05-08 09:59:46',NULL,19,10),(10341,'2012-05-08 09:59:46',NULL,21,10),(10342,'2012-05-08 09:59:46',NULL,24,10),(10343,'2012-05-08 09:59:46',NULL,26,10),(10344,'2012-05-08 09:59:46',NULL,28,10),(10345,'2012-05-08 09:59:46',NULL,29,10);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-19  9:36:53

alter table productos
	add constraint fk_productos_categorias foreign key (codcategoria)
		references categorias (codcategoria);


alter table categorias
	add constraint fk_categorias_proveedores foreign key (codproveedor)
		references proveedores (codproveedor);


alter table pedidos
	add constraint fk_pedidos_productos foreign key (codproducto)
		references productos (codproducto);
-- Plantilla de funciones

 delimiter $$
 drop function if exists nuestraExtension2 $$
 create function  nuestraExtenseion2
 (nombre varchar (60),
 ape1 varchar(60)
 )
 returns char(3)
 begin
 
 declare extension char(3);
 
 set extesion = (select empleados.extelem,direccion 
				from empleados 
				where noem = nombre and ape1em = ape1
                );
      return extension;          
 /* return (select empleados.extelem,direccion 
 from empleados 
 where noem = nombre and ape1em = ape1 )*/
 
 end $$
 delimiter ;
 select devuelveExtension('Juan','Lopez');
 set @miExtension = devuelveExtension('Juan','Lopez');
 select @miExtension2;
 call nuestraExtension2('Juan','López');        
        
        -- Ejercicios Relacion 5 y 6, usando manual de mysql 12, en concreto 12.4,12.5y 12.6
use bdalmacen;
-- Relacion 5
-- Ejercicio1 Obtener todos los productos que comiencen por una letra determinada.
-- Para sacar el diagrama es en arriba en Database Reverse engineer, next todo seleccionamos la bbdd que queremos
-- y next a todo
delimiter $$
-- El drop tiene el dolar del delimiter
drop procedure if exists ejercicio5_1 $$
create procedure  ejercicio5_1
(letra char (1))
-- A partir del begin es el cuerpo de prodedimiento lo que queremos que haga
begin 
 select *
	from productos
    where descripcion like concat(letra,'%');
end $$

delimiter ;

call ejercicio5_1('Q');

-- Ejercicio2 

/*Se ha diseñado un sistema para que los proveedores puedan acceder a ciertos datos, 
la contraseña que se les da es el teléfono de la empresa al revés. 
Se pide elaborar un procedimiento almacenado que dado un proveedor 
obtenga su contraseña y la muestre en los resultados.*/

delimiter $$
 drop function if exists nuestraExtension2 $$
 create function  nuestraExtenseion2
 (
 ape1 varchar(60)
 )
 returns char(1)
 begin
 
 declare extension char(3);
 
 set extesion = (select empleados.extelem,direccion 
				from empleados 
				where noem = nombre and ape1em = ape1
                );
      return extension;          
 /* return (select empleados.extelem,direccion 
 from empleados 
 where noem = nombre and ape1em = ape1 )*/
 
 end $$
 delimiter ;
