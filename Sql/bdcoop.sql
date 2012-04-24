-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 23-04-2012 a las 05:38:28
-- Versión del servidor: 5.5.16
-- Versión de PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bdcoop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agencia`
--

CREATE TABLE IF NOT EXISTS `agencia` (
  `agencia` int(11) NOT NULL,
  `entidad` int(11) NOT NULL,
  `nombre` int(11) NOT NULL,
  PRIMARY KEY (`agencia`),
  KEY `entidad` (`entidad`),
  KEY `agencia` (`agencia`,`entidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE IF NOT EXISTS `clase` (
  `clase` int(11) NOT NULL,
  `nombre` char(20) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`clase`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `cliente` int(11) NOT NULL,
  `nombre1` char(20) COLLATE latin1_spanish_ci NOT NULL,
  `nombre2` char(20) COLLATE latin1_spanish_ci NOT NULL,
  `apellido1` char(20) COLLATE latin1_spanish_ci NOT NULL,
  `razon_social` char(20) COLLATE latin1_spanish_ci NOT NULL,
  `telefono1` char(12) COLLATE latin1_spanish_ci NOT NULL,
  `telefono2` char(12) COLLATE latin1_spanish_ci NOT NULL,
  `direccion1` char(20) COLLATE latin1_spanish_ci NOT NULL,
  `direccion2` char(20) COLLATE latin1_spanish_ci NOT NULL,
  `celular` char(15) COLLATE latin1_spanish_ci NOT NULL,
  `email` char(15) COLLATE latin1_spanish_ci NOT NULL,
  `tipo_cliente` int(5) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fecha_expdoc` date NOT NULL,
  `apellido2` char(20) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidad`
--

CREATE TABLE IF NOT EXISTS `entidad` (
  `entidad` int(11) NOT NULL,
  `nombre` int(11) NOT NULL,
  PRIMARY KEY (`entidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE IF NOT EXISTS `movimiento` (
  `entidad` int(11) NOT NULL,
  `agencia` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `clase` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `nro_producto` int(11) NOT NULL,
  `comentario` char(30) COLLATE latin1_spanish_ci NOT NULL,
  `cuenta` char(16) COLLATE latin1_spanish_ci NOT NULL,
  `db` decimal(10,0) NOT NULL,
  `cr` decimal(10,0) NOT NULL,
  `saldo` decimal(10,0) NOT NULL,
  `nro_transaccion` int(11) NOT NULL,
  `comprobante` int(11) NOT NULL,
  `nro_registro` int(11) NOT NULL,
  `nro_auditoria` int(11) NOT NULL,
  `nro_conciliacion` int(11) NOT NULL,
  `nro_referencia1` char(20) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `portafolio`
--

CREATE TABLE IF NOT EXISTS `portafolio` (
  `entidad` int(11) NOT NULL,
  `agencia` int(11) NOT NULL,
  `clase` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `nro_producto` int(11) NOT NULL,
  `fecha_apertura` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `fecha_ultimaprorroga` date NOT NULL,
  `fecha_ultliquidacion` date NOT NULL,
  `fecha_ultcausacion` date NOT NULL,
  `fecha_ultcorte` date NOT NULL,
  `saldo_actual` decimal(10,0) NOT NULL,
  `int_pagar` decimal(10,0) NOT NULL,
  `int_causado` decimal(10,0) NOT NULL,
  `tasa_inicial` decimal(10,0) NOT NULL,
  `tasa_mora` decimal(10,0) NOT NULL,
  `plazo` int(11) NOT NULL,
  `tipo_periodo` int(11) NOT NULL,
  `nro_periodo` int(11) NOT NULL,
  `periodos_pasado` int(11) NOT NULL,
  `periodos_pagados` int(11) NOT NULL,
  `tipo_cuota` int(11) NOT NULL,
  `cuota` decimal(10,0) NOT NULL,
  `cuota_interes` decimal(10,0) NOT NULL,
  `cuota_capital` decimal(10,0) NOT NULL,
  KEY `entidad` (`entidad`,`agencia`,`clase`,`tipo`,`producto`,`cliente`),
  KEY `entidad_2` (`entidad`),
  KEY `entidad_3` (`entidad`,`agencia`),
  KEY `entidad_4` (`entidad`,`agencia`,`clase`,`tipo`,`producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `producto` int(11) NOT NULL,
  `nombre` char(20) COLLATE latin1_spanish_ci NOT NULL,
  `entidad` int(11) NOT NULL,
  `agencia` int(11) NOT NULL,
  `clase` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  PRIMARY KEY (`producto`),
  KEY `producto` (`producto`,`entidad`,`agencia`,`clase`,`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`producto`, `nombre`, `entidad`, `agencia`, `clase`, `tipo`) VALUES
(0, '', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE IF NOT EXISTS `tipo` (
  `tipo` int(11) NOT NULL,
  `nombre` char(20) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `usuario` int(11) NOT NULL,
  `entidad` int(11) NOT NULL,
  `agencia` int(11) NOT NULL,
  `nombre` char(1) COLLATE latin1_spanish_ci NOT NULL,
  `apodo` char(1) COLLATE latin1_spanish_ci NOT NULL,
  `clave` char(1) COLLATE latin1_spanish_ci NOT NULL,
  `id_usuario` char(1) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`usuario`,`entidad`,`agencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agencia`
--
ALTER TABLE `agencia`
  ADD CONSTRAINT `agencia_ibfk_1` FOREIGN KEY (`entidad`) REFERENCES `entidad` (`entidad`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
