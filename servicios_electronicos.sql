CREATE DATABASE  IF NOT EXISTS `servicioselectronicos` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `servicioselectronicos`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: servicioselectronicos
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(50) NOT NULL,
  `apellidos_cliente` varchar(100) NOT NULL,
  `telefono_cliente` varchar(20) NOT NULL,
  `dni_cliente` varchar(10) NOT NULL,
  `direccion_cliente` varchar(10) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `correo` int(11) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_servicio`
--

DROP TABLE IF EXISTS `detalle_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_servicio` (
  `idDetalleServicio` int(11) NOT NULL AUTO_INCREMENT,
  `precio_reparacion` decimal(18,3) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fechaRecojo` date NOT NULL,
  `total` decimal(18,3) NOT NULL,
  `idProductoReparacion` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  PRIMARY KEY (`idDetalleServicio`),
  KEY `idProductoReparacion` (`idProductoReparacion`),
  KEY `idEmpleado` (`idEmpleado`),
  CONSTRAINT `detalle_servicio_ibfk_1` FOREIGN KEY (`idProductoReparacion`) REFERENCES `producto_reparacion` (`idProductoReparacion`),
  CONSTRAINT `detalle_servicio_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_servicio`
--

LOCK TABLES `detalle_servicio` WRITE;
/*!40000 ALTER TABLE `detalle_servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_venta` (
  `idDetalleVenta` int(11) NOT NULL AUTO_INCREMENT,
  `idProductoVenta` int(11) NOT NULL,
  `unidades` int(11) NOT NULL,
  `subtotal` decimal(18,3) NOT NULL,
  `total` decimal(18,3) NOT NULL,
  PRIMARY KEY (`idDetalleVenta`),
  KEY `idProductoVenta` (`idProductoVenta`),
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`idProductoVenta`) REFERENCES `producto_venta` (`idProductoVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento` (
  `idDocumento` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_pedido` date NOT NULL,
  `idDetalleVenta` int(11) NOT NULL,
  `idDetalleServicio` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `idTipoDocumento` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idDocumento`),
  KEY `idEmpresa` (`idEmpresa`),
  KEY `idEmpleado` (`idEmpleado`),
  KEY `idDetalleVenta` (`idDetalleVenta`),
  KEY `idCliente` (`idCliente`),
  KEY `idTipoDocumento` (`idTipoDocumento`),
  KEY `idDetalleServicio` (`idDetalleServicio`),
  CONSTRAINT `documento_ibfk_1` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`),
  CONSTRAINT `documento_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  CONSTRAINT `documento_ibfk_3` FOREIGN KEY (`idDetalleVenta`) REFERENCES `detalle_venta` (`idDetalleVenta`),
  CONSTRAINT `documento_ibfk_4` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `documento_ibfk_5` FOREIGN KEY (`idTipoDocumento`) REFERENCES `tipodocumento` (`idTipoDocumento`),
  CONSTRAINT `documento_ibfk_6` FOREIGN KEY (`idDetalleServicio`) REFERENCES `detalle_servicio` (`idDetalleServicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empleado` varchar(50) NOT NULL,
  `apellidos_empleado` varchar(100) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `fechaNacimiento` date NOT NULL,
  `correo` int(11) NOT NULL,
  `idTipoEmpleado` int(11) NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  KEY `idTipoEmpleado` (`idTipoEmpleado`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`idTipoEmpleado`) REFERENCES `tipoempleado` (`idTipoEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `idEmpresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(45) NOT NULL,
  `telefono_empresa` varchar(10) NOT NULL,
  `correo_empresa` varchar(45) NOT NULL,
  `horario_atencion` varchar(45) NOT NULL,
  `direccion_empresa` varchar(10) NOT NULL,
  `ruc` varchar(45) NOT NULL,
  PRIMARY KEY (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_reparacion`
--

DROP TABLE IF EXISTS `producto_reparacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto_reparacion` (
  `idProductoReparacion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionReparacion` varchar(60) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `precio` decimal(18,3) NOT NULL,
  PRIMARY KEY (`idProductoReparacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_reparacion`
--

LOCK TABLES `producto_reparacion` WRITE;
/*!40000 ALTER TABLE `producto_reparacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_reparacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_venta`
--

DROP TABLE IF EXISTS `producto_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto_venta` (
  `idProductoVenta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(45) NOT NULL,
  `precio` decimal(18,3) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`idProductoVenta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_venta`
--

LOCK TABLES `producto_venta` WRITE;
/*!40000 ALTER TABLE `producto_venta` DISABLE KEYS */;
INSERT INTO `producto_venta` VALUES (1,'bombilla',3.500,'Linux',23);
/*!40000 ALTER TABLE `producto_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodocumento`
--

DROP TABLE IF EXISTS `tipodocumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipodocumento` (
  `idTipoDocumento` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`idTipoDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodocumento`
--

LOCK TABLES `tipodocumento` WRITE;
/*!40000 ALTER TABLE `tipodocumento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipodocumento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoempleado`
--

DROP TABLE IF EXISTS `tipoempleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoempleado` (
  `idTipoEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoEmpleado` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoempleado`
--

LOCK TABLES `tipoempleado` WRITE;
/*!40000 ALTER TABLE `tipoempleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoempleado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-16 15:56:04
