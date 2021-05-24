-- MySQL dump 10.18  Distrib 10.3.27-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pedido
-- ------------------------------------------------------
-- Server version	10.3.27-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `archivo`
--

DROP TABLE IF EXISTS `archivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archivo` (
  `id_archivo` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `ruta` text NOT NULL,
  PRIMARY KEY (`id_archivo`),
  KEY `fk_pedido_a` (`id_pedido`),
  CONSTRAINT `fk_pedido_a` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivo`
--

LOCK TABLES `archivo` WRITE;
/*!40000 ALTER TABLE `archivo` DISABLE KEYS */;
INSERT INTO `archivo` VALUES (1,61,'archivos/pedido_61'),(2,62,'archivos/pedido_archivo_62'),(3,63,'archivos/pedido_archivo_63'),(4,64,'archivos/pedido_archivo_64'),(5,65,'archivos/pedido_archivo_65_Inventario_CSPA_Abril_2018.xls_0.ods'),(6,66,'archivos/pedido_archivo_66_Inventario_CSPA_Abril_2018.xls_0.ods'),(7,67,'archivos/pedido_archivo_67_Inventario_CSPA_Abril_2018.xls_0.ods'),(8,68,'archivos/pedido_archivo_68_LISTADO DE PROVEEDORES DE SALUD-4dic.pdf');
/*!40000 ALTER TABLE `archivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audiencia`
--

DROP TABLE IF EXISTS `audiencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audiencia` (
  `id_audiencia` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id_audiencia`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiencia`
--

LOCK TABLES `audiencia` WRITE;
/*!40000 ALTER TABLE `audiencia` DISABLE KEYS */;
INSERT INTO `audiencia` VALUES (1,'audiencia1'),(2,'audiencia2'),(3,'audiencia3'),(4,'audiencia4'),(5,'audiencia5'),(6,'audiencia6'),(7,'audiencia7'),(8,'audiencia8'),(9,'audiencia9'),(10,'audiencia10');
/*!40000 ALTER TABLE `audiencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audiencia_pedido`
--

DROP TABLE IF EXISTS `audiencia_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audiencia_pedido` (
  `audiencia_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `id_audiencia` int(11) NOT NULL,
  PRIMARY KEY (`audiencia_pedido`),
  KEY `fk_audiencia_pa` (`id_audiencia`),
  KEY `fk_pedido_pa` (`id_pedido`),
  CONSTRAINT `fk_audiencia_pa` FOREIGN KEY (`id_audiencia`) REFERENCES `audiencia` (`id_audiencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_pa` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiencia_pedido`
--

LOCK TABLES `audiencia_pedido` WRITE;
/*!40000 ALTER TABLE `audiencia_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `audiencia_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'categoria1'),(2,'categoria2'),(3,'categoria3'),(4,'categoria4'),(5,'categoria5'),(6,'categoria6'),(7,'categoria7'),(8,'categoria8'),(9,'categoria9'),(10,'categoria10'),(11,'categoria11'),(12,'categoria12');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_pedido`
--

DROP TABLE IF EXISTS `categoria_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_pedido` (
  `id_categoria_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  PRIMARY KEY (`id_categoria_pedido`),
  KEY `fk_categoria_cp` (`id_categoria`),
  KEY `fk_pedido_cp` (`id_pedido`),
  CONSTRAINT `fk_categoria_cp` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_cp` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_pedido`
--

LOCK TABLES `categoria_pedido` WRITE;
/*!40000 ALTER TABLE `categoria_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extension`
--

DROP TABLE IF EXISTS `extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extension` (
  `id_extension` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id_extension`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extension`
--

LOCK TABLES `extension` WRITE;
/*!40000 ALTER TABLE `extension` DISABLE KEYS */;
INSERT INTO `extension` VALUES (1,'extension1'),(2,'extension2'),(3,'extension3'),(4,'extension4'),(5,'extension5'),(6,'extension6'),(7,'extension7'),(8,'extension8'),(9,'extension9'),(10,'extension10'),(11,'extension11');
/*!40000 ALTER TABLE `extension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formato_texto`
--

DROP TABLE IF EXISTS `formato_texto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formato_texto` (
  `id_formato_texto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id_formato_texto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formato_texto`
--

LOCK TABLES `formato_texto` WRITE;
/*!40000 ALTER TABLE `formato_texto` DISABLE KEYS */;
INSERT INTO `formato_texto` VALUES (1,'formato1'),(2,'formato2'),(3,'formato3'),(4,'formato4'),(5,'formato5'),(6,'formato6'),(7,'formato7'),(8,'formato8'),(9,'formato9'),(10,'formato10');
/*!40000 ALTER TABLE `formato_texto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grabacion`
--

DROP TABLE IF EXISTS `grabacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grabacion` (
  `id_grabacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `ruta` text NOT NULL,
  PRIMARY KEY (`id_grabacion`),
  KEY `fk_pedido_g` (`id_pedido`),
  CONSTRAINT `fk_pedido_g` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grabacion`
--

LOCK TABLES `grabacion` WRITE;
/*!40000 ALTER TABLE `grabacion` DISABLE KEYS */;
INSERT INTO `grabacion` VALUES (1,63,'archivos/pedido_grabacion_63'),(2,64,'archivos/pedido_grabacion_64CI.pdf'),(3,65,'archivos/pedido_grabacion__65CI.pdf'),(4,66,'archivos/pedido_grabacion__66CI.pdf'),(5,67,'archivos/pedido_grabacion__67CI.pdf'),(6,68,'archivos/pedido_grabacion__68CI.pdf');
/*!40000 ALTER TABLE `grabacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idioma`
--

DROP TABLE IF EXISTS `idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idioma` (
  `id_idioma` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id_idioma`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idioma`
--

LOCK TABLES `idioma` WRITE;
/*!40000 ALTER TABLE `idioma` DISABLE KEYS */;
INSERT INTO `idioma` VALUES (1,'idioma1'),(2,'idioma2'),(3,'idioma3'),(4,'idioma4'),(5,'idioma5'),(6,'idioma6'),(7,'idioma7'),(8,'idioma8'),(9,'idioma9'),(10,'idioma10');
/*!40000 ALTER TABLE `idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modalidad`
--

DROP TABLE IF EXISTS `modalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modalidad` (
  `id_modalidad` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id_modalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modalidad`
--

LOCK TABLES `modalidad` WRITE;
/*!40000 ALTER TABLE `modalidad` DISABLE KEYS */;
INSERT INTO `modalidad` VALUES (1,'Consurso'),(2,'Proveedor Favorito');
/*!40000 ALTER TABLE `modalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `id_pais` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'pais1'),(2,'pais2'),(3,'pais3'),(4,'pais4'),(5,'pais5'),(6,'pais6'),(7,'pais7'),(8,'pais8'),(9,'pais9'),(10,'pais10');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais_pedido`
--

DROP TABLE IF EXISTS `pais_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais_pedido` (
  `id_pais_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_pais` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  PRIMARY KEY (`id_pais_pedido`),
  KEY `fk_id_pais_pp` (`id_pais`),
  KEY `fk_id_pedido_pp` (`id_pedido`),
  CONSTRAINT `fk_id_pais_pp` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_pedido_pp` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais_pedido`
--

LOCK TABLES `pais_pedido` WRITE;
/*!40000 ALTER TABLE `pais_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pais_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `palabra_pedido`
--

DROP TABLE IF EXISTS `palabra_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `palabra_pedido` (
  `id_palabra_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `palabra` varchar(45) NOT NULL,
  PRIMARY KEY (`id_palabra_pedido`),
  KEY `fk_pedido_pp` (`id_pedido`),
  CONSTRAINT `fk_pedido_pp` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palabra_pedido`
--

LOCK TABLES `palabra_pedido` WRITE;
/*!40000 ALTER TABLE `palabra_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `palabra_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_texto` int(11) NOT NULL,
  `id_formato_texto` int(11) NOT NULL,
  `id_modalidad` int(11) NOT NULL,
  `nombre_proyecto` varchar(200) NOT NULL,
  `id_proposito` int(11) NOT NULL,
  `id_extension` int(11) NOT NULL,
  `id_idioma` int(11) NOT NULL,
  `optimizacion_seo` tinyint(1) DEFAULT NULL,
  `palabra_clave` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `id_perspectiva` int(11) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_tipo_texto` (`id_tipo_texto`),
  KEY `fk_formato_texto` (`id_formato_texto`),
  KEY `fk_modalidad` (`id_modalidad`),
  KEY `fk_proposito` (`id_proposito`),
  KEY `fk_extension` (`id_extension`),
  KEY `fk_idioma` (`id_idioma`),
  KEY `fk_perspectiva` (`id_perspectiva`),
  CONSTRAINT `fk_extension` FOREIGN KEY (`id_extension`) REFERENCES `extension` (`id_extension`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_formato_texto` FOREIGN KEY (`id_formato_texto`) REFERENCES `formato_texto` (`id_formato_texto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idioma` FOREIGN KEY (`id_idioma`) REFERENCES `idioma` (`id_idioma`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_modalidad` FOREIGN KEY (`id_modalidad`) REFERENCES `modalidad` (`id_modalidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_perspectiva` FOREIGN KEY (`id_perspectiva`) REFERENCES `perspectiva` (`id_perspectiva`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_proposito` FOREIGN KEY (`id_proposito`) REFERENCES `proposito` (`id_proposito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipo_texto` FOREIGN KEY (`id_tipo_texto`) REFERENCES `tipo_texto` (`id_tipo_texto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perspectiva`
--

DROP TABLE IF EXISTS `perspectiva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perspectiva` (
  `id_perspectiva` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id_perspectiva`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perspectiva`
--

LOCK TABLES `perspectiva` WRITE;
/*!40000 ALTER TABLE `perspectiva` DISABLE KEYS */;
INSERT INTO `perspectiva` VALUES (1,'Primera  persona del singular (Yo, mí, mi)'),(2,'Primera persona del plural nosotros, nuestro(s), nuestra(s)'),(3,'Segunda Persona formal (usted, su, sus)'),(4,'Segunda Persona informal (Tú, tu, tus)'),(5,'Tercera persona (ellos, ellas, su(s))');
/*!40000 ALTER TABLE `perspectiva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposito`
--

DROP TABLE IF EXISTS `proposito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proposito` (
  `id_proposito` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id_proposito`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposito`
--

LOCK TABLES `proposito` WRITE;
/*!40000 ALTER TABLE `proposito` DISABLE KEYS */;
INSERT INTO `proposito` VALUES (1,'Contenido de Blogs'),(2,'Guiones');
/*!40000 ALTER TABLE `proposito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_texto`
--

DROP TABLE IF EXISTS `tipo_texto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_texto` (
  `id_tipo_texto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id_tipo_texto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_texto`
--

LOCK TABLES `tipo_texto` WRITE;
/*!40000 ALTER TABLE `tipo_texto` DISABLE KEYS */;
INSERT INTO `tipo_texto` VALUES (1,'tipo1'),(2,'tipo2'),(3,'tipo3'),(4,'tipo4'),(5,'tipo5'),(6,'tipo6'),(7,'tipo7'),(8,'tipo8'),(9,'tipo9'),(10,'tipo10');
/*!40000 ALTER TABLE `tipo_texto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-23 23:53:43
