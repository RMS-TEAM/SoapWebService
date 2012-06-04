-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 29-05-2012 a las 01:07:09
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
  `nombre` char(25) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`agencia`),
  KEY `entidad` (`entidad`),
  KEY `agencia` (`agencia`,`entidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `agencia`
--

INSERT INTO `agencia` (`agencia`, `entidad`, `nombre`) VALUES
(1, 1, 'PARQUE BERRIO'),
(2, 1, 'APARTADO'),
(3, 1, 'MONTERIA'),
(4, 1, 'QUIBDO'),
(5, 1, 'RIONEGRO'),
(6, 1, 'SINCELEJO'),
(7, 1, 'TURBO'),
(8, 1, 'ISTMINA'),
(9, 1, 'CAUCASIA'),
(10, 1, 'PTO BERRIO'),
(201, 2, 'PARQUE BELEN'),
(202, 2, 'BELEN CENTRO'),
(203, 2, 'LA FLORESTA'),
(204, 2, 'SABANETA'),
(205, 2, 'CALDAS'),
(206, 2, 'RIONEGRO'),
(207, 2, 'ALTAVISTA'),
(301, 3, 'AGENCIA CARIBE'),
(302, 3, 'CONSUMO LA AMERICA'),
(401, 4, 'BOYACA LAS BRISAS'),
(402, 4, 'PEDREGAL'),
(403, 4, 'LA ESTRELLA'),
(409, 4, 'CIUDAD BOLIVAR'),
(501, 5, 'AGENCIA UPB'),
(701, 7, 'AGENCIA UNIVERSIDAD'),
(901, 9, 'FODUN BOGOTA'),
(902, 9, 'FODUN MEDELLIN'),
(903, 9, 'FODUN MANIZALES'),
(904, 9, 'FODUN PALMIRA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE IF NOT EXISTS `clase` (
  `clase` int(11) NOT NULL,
  `nombre` char(20) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`clase`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `clase`
--

INSERT INTO `clase` (`clase`, `nombre`) VALUES
(1, 'AHORROS'),
(2, 'CREDITOS'),
(3, 'APORTES'),
(4, 'SEGUROS'),
(5, 'CONVENIOS RECAUDOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `cliente` int(11) NOT NULL,
  `nombre1` char(20) COLLATE latin1_spanish_ci NOT NULL,
  `nombre2` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
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
  `clave` int(4) NOT NULL,
  `entidad` int(11) NOT NULL,
  `ultima_visita` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cliente`),
  KEY `fk_cliente_entidad1` (`entidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cliente`, `nombre1`, `nombre2`, `apellido1`, `razon_social`, `telefono1`, `telefono2`, `direccion1`, `direccion2`, `celular`, `email`, `tipo_cliente`, `fecha_nacimiento`, `fecha_expdoc`, `apellido2`, `clave`, `entidad`, `ultima_visita`) VALUES
(1, 'NELSON', 'HERNAN', 'ESPINOSA', '', '11111111', '11111112', 'CR 55 NRO 55-72', 'CR 34 NRO 22-12', '3187759039', 'NHESPINOSA@UNE.', 1, '2012-04-02', '2012-04-17', 'VERGARA', 0, 1, '2012-05-28 21:46:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidad`
--

CREATE TABLE IF NOT EXISTS `entidad` (
  `entidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(30) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`entidad`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `entidad`
--

INSERT INTO `entidad` (`entidad`, `nombre`) VALUES
(1, 'COOPETRABAN'),
(2, 'Cooperativa Belen'),
(3, 'AYC COLANTA'),
(4, 'CREARCOOP'),
(5, 'COOPERATIVA UPB'),
(6, 'JURISCOOP'),
(7, 'COOPRUDEA'),
(8, 'UTRAHUILCA'),
(9, 'FODUN'),
(10, 'VISIONAMOS');

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
  `nro_referencia1` char(20) COLLATE latin1_spanish_ci NOT NULL,
  KEY `entidad` (`entidad`),
  KEY `entidad_2` (`entidad`),
  KEY `cliente` (`cliente`),
  KEY `clase` (`clase`),
  KEY `tipo` (`tipo`),
  KEY `producto` (`producto`),
  KEY `agencia` (`agencia`),
  KEY `nro_producto` (`nro_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `movimiento`
--

INSERT INTO `movimiento` (`entidad`, `agencia`, `cliente`, `clase`, `tipo`, `producto`, `nro_producto`, `comentario`, `cuenta`, `db`, `cr`, `saldo`, `nro_transaccion`, `comprobante`, `nro_registro`, `nro_auditoria`, `nro_conciliacion`, `nro_referencia1`) VALUES
(1, 1, 1, 1, 1, 0, 1, 'nada', 'mono', 78, 754, 87, 765, 98, 765, 34, 78, '65'),
(1, 1, 1, 1, 1, 0, 2, 'mompirri', 'monin', 456, 333, 111, 3333, 444, 999, 0, 43, 'qwe'),
(1, 1, 1, 1, 1, 0, 6, 'pedrito', 'escomoso', 8765, 3456, 8765, 23456, 9876, 2345, 8765, 3456, 'dff'),
(1, 1, 1, 1, 3, 0, 1, 'Mosco', 'Mosquera', 843, 3456, 8765, 2345, 876, 345, 87, 45, 'dff'),
(1, 10, 1, 1, 1, 1, 1, 'james', 'mondalete', 56, 87, 45, 765, 345, 76, 5456, 876, '345');

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
  `fecha_apertura` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_vencimiento` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_ultimaprorroga` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_ultliquidacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_ultcausacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_ultcorte` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
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
  PRIMARY KEY (`nro_producto`),
  KEY `entidad` (`entidad`,`agencia`,`clase`,`tipo`,`producto`,`cliente`),
  KEY `entidad_2` (`entidad`),
  KEY `entidad_3` (`entidad`,`agencia`),
  KEY `entidad_4` (`entidad`,`agencia`,`clase`,`tipo`,`producto`),
  KEY `agencia` (`agencia`,`clase`,`tipo`,`producto`,`cliente`),
  KEY `clase` (`clase`),
  KEY `tipo` (`tipo`),
  KEY `producto` (`producto`),
  KEY `cliente` (`cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `portafolio`
--

INSERT INTO `portafolio` (`entidad`, `agencia`, `clase`, `tipo`, `producto`, `cliente`, `nro_producto`, `fecha_apertura`, `fecha_vencimiento`, `fecha_ultimaprorroga`, `fecha_ultliquidacion`, `fecha_ultcausacion`, `fecha_ultcorte`, `saldo_actual`, `int_pagar`, `int_causado`, `tasa_inicial`, `tasa_mora`, `plazo`, `tipo_periodo`, `nro_periodo`, `periodos_pasado`, `periodos_pagados`, `tipo_cuota`, `cuota`, `cuota_interes`, `cuota_capital`) VALUES
(1, 1, 1, 1, 1, 1, 1, '2012-01-09 05:00:00', '2013-04-11 05:00:00', '0000-00-00 00:00:00', '2012-04-27 05:00:00', '2012-03-29 05:00:00', '2012-04-27 05:00:00', 1000000, 100000, 20000, 18, 0, 12, 1, 12, 3, 0, 1, 20000, 0, 0),
(1, 1, 1, 3, 3, 1, 2, '2011-01-31 05:00:00', '2013-01-31 05:00:00', '0000-00-00 00:00:00', '2012-03-31 05:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2000000, 250000, 120000, 19, 0, 24, 1, 24, 14, 0, 0, 0, 0, 0),
(1, 1, 2, 4, 202, 1, 6, '2011-04-28 05:00:00', '2012-12-28 05:00:00', '0000-00-00 00:00:00', '2012-04-26 05:00:00', '2012-03-31 05:00:00', '2012-04-27 05:00:00', 3000000, 200000, 10000, 27, 30, 36, 1, 36, 18, 17, 1, 250000, 120000, 130000);

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
  KEY `producto` (`producto`,`entidad`,`agencia`,`clase`,`tipo`),
  KEY `entidad` (`entidad`),
  KEY `agencia` (`agencia`),
  KEY `clase` (`clase`),
  KEY `tipo` (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`producto`, `nombre`, `entidad`, `agencia`, `clase`, `tipo`) VALUES
(0, '', 0, 0, 0, 0),
(1, 'APORTES', 1, 1, 3, 9),
(2, 'MULTIDIARIO', 1, 1, 1, 1),
(3, 'MULTIAHORRO', 1, 1, 1, 2),
(4, 'CDAT', 1, 1, 1, 3),
(201, 'LIBRE INVERSION', 1, 1, 2, 4),
(202, 'VEHICULO', 1, 1, 2, 4),
(203, 'ROTATIVO', 1, 1, 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE IF NOT EXISTS `tipo` (
  `tipo` int(11) NOT NULL,
  `nombre` char(20) COLLATE latin1_spanish_ci NOT NULL,
  `clase` int(11) NOT NULL,
  PRIMARY KEY (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`tipo`, `nombre`, `clase`) VALUES
(1, 'A LA VISTA', 1),
(2, 'CONTRACTUAL', 1),
(3, 'A TERMINO', 1),
(4, 'CONSUMO', 2),
(5, 'COMERCIAL', 2),
(6, 'HIPOTECARIO', 2),
(8, 'MICROCREDITO', 2),
(9, 'APORTES', 3),
(10, 'SEGURO FUNERARIOS', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `token`
--

CREATE TABLE IF NOT EXISTS `token` (
  `cliente` int(11) NOT NULL,
  `user_token` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`user_token`),
  KEY `cliente` (`cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `token`
--

INSERT INTO `token` (`cliente`, `user_token`) VALUES
(1, 'n14mno230mjdo83cift8dlc1a 1338244483176'),
(1, 'r6bug0kjn5k1m7l50q2iekmb1r 1338245932472');

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
  `clave` int(4) NOT NULL,
  `id_usuario` char(1) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`usuario`),
  KEY `entidad` (`entidad`),
  KEY `agencia` (`agencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario`, `entidad`, `agencia`, `nombre`, `apodo`, `clave`, `id_usuario`) VALUES
(1, 1, 1, 'N', 'N', 1, 'N'),
(12, 1, 1, 'n', '', 1, '');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agencia`
--
ALTER TABLE `agencia`
  ADD CONSTRAINT `agencia_ibfk_1` FOREIGN KEY (`entidad`) REFERENCES `entidad` (`entidad`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`entidad`) REFERENCES `entidad` (`entidad`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD CONSTRAINT `movimiento_ibfk_18` FOREIGN KEY (`nro_producto`) REFERENCES `portafolio` (`nro_producto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `movimiento_ibfk_12` FOREIGN KEY (`entidad`) REFERENCES `entidad` (`entidad`) ON UPDATE CASCADE,
  ADD CONSTRAINT `movimiento_ibfk_13` FOREIGN KEY (`agencia`) REFERENCES `agencia` (`agencia`) ON UPDATE CASCADE,
  ADD CONSTRAINT `movimiento_ibfk_14` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`cliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `movimiento_ibfk_15` FOREIGN KEY (`clase`) REFERENCES `clase` (`clase`) ON UPDATE CASCADE,
  ADD CONSTRAINT `movimiento_ibfk_16` FOREIGN KEY (`tipo`) REFERENCES `tipo` (`tipo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `movimiento_ibfk_17` FOREIGN KEY (`producto`) REFERENCES `producto` (`producto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `portafolio`
--
ALTER TABLE `portafolio`
  ADD CONSTRAINT `portafolio_ibfk_3` FOREIGN KEY (`entidad`) REFERENCES `entidad` (`entidad`) ON UPDATE CASCADE,
  ADD CONSTRAINT `portafolio_ibfk_4` FOREIGN KEY (`agencia`) REFERENCES `agencia` (`agencia`) ON UPDATE CASCADE,
  ADD CONSTRAINT `portafolio_ibfk_5` FOREIGN KEY (`clase`) REFERENCES `clase` (`clase`) ON UPDATE CASCADE,
  ADD CONSTRAINT `portafolio_ibfk_6` FOREIGN KEY (`tipo`) REFERENCES `tipo` (`tipo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `portafolio_ibfk_7` FOREIGN KEY (`producto`) REFERENCES `producto` (`producto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `portafolio_ibfk_8` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`cliente`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `token_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`cliente`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`entidad`) REFERENCES `entidad` (`entidad`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_4` FOREIGN KEY (`agencia`) REFERENCES `agencia` (`agencia`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
