-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 26-04-2012 a las 23:52:24
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
  `nombre` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`agencia`),
  UNIQUE KEY `agencia_2` (`agencia`),
  KEY `entidad` (`entidad`),
  KEY `agencia` (`agencia`,`entidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `agencia`
--

INSERT INTO `agencia` (`agencia`, `entidad`, `nombre`) VALUES
(1, 1, 'belen'),
(2, 1, 'poblado');

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
(1, 'oe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `cliente` int(11) NOT NULL,
  `nombre1` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `nombre2` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `apellido1` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `razon_social` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `telefono1` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `telefono2` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `direccion1` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `direccion2` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `celular` int(25) NOT NULL,
  `email` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `tipo_cliente` int(5) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fecha_expdoc` date NOT NULL,
  `apellido2` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cliente`, `nombre1`, `nombre2`, `apellido1`, `razon_social`, `telefono1`, `telefono2`, `direccion1`, `direccion2`, `celular`, `email`, `tipo_cliente`, `fecha_nacimiento`, `fecha_expdoc`, `apellido2`) VALUES
(110501289, 'Juan', 'Sebastian', 'Velez', '', '2879837', '', 'calle 1 sur 56-27 envigado', 'no tiene', 2147483647, 'jvelezpo@eafit.', 0, '2012-04-01', '2012-04-16', 'posada'),
(1101728492, 'Ruben', 'Dario', 'Espinosa', '', '3184567890', '2876789', 'calle 27A No 18-26 la estrella ', 'no tiene', 2147483647, 'rderoldan1@gmai', 0, '2012-04-09', '2012-04-02', 'Roldan'),
(1104012269, 'James', 'David', ' Benitez', '', '3016334096', '', 'calle 4 sur No 48-11', 'sincelejo', 2147483647, 'jbenite4@eafit.', 1, '2002-05-13', '2008-04-14', 'Turizo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidad`
--

CREATE TABLE IF NOT EXISTS `entidad` (
  `entidad` int(11) NOT NULL,
  `nombre` varchar(11) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`entidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `entidad`
--

INSERT INTO `entidad` (`entidad`, `nombre`) VALUES
(1, 'Cooprudea'),
(2, 'Colanta');

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
  PRIMARY KEY (`nro_transaccion`)
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
  KEY `entidad_4` (`entidad`,`agencia`,`clase`,`tipo`,`producto`),
  KEY `agencia` (`agencia`,`clase`,`tipo`,`producto`,`cliente`),
  KEY `clase` (`clase`),
  KEY `tipo` (`tipo`,`producto`,`cliente`),
  KEY `producto` (`producto`),
  KEY `cliente` (`cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `portafolio`
--

INSERT INTO `portafolio` (`entidad`, `agencia`, `clase`, `tipo`, `producto`, `cliente`, `nro_producto`, `fecha_apertura`, `fecha_vencimiento`, `fecha_ultimaprorroga`, `fecha_ultliquidacion`, `fecha_ultcausacion`, `fecha_ultcorte`, `saldo_actual`, `int_pagar`, `int_causado`, `tasa_inicial`, `tasa_mora`, `plazo`, `tipo_periodo`, `nro_periodo`, `periodos_pasado`, `periodos_pagados`, `tipo_cuota`, `cuota`, `cuota_interes`, `cuota_capital`) VALUES
(1, 1, 1, 1, 0, 1104012269, 1, '2012-04-01', '2012-04-04', '2012-04-05', '2012-04-07', '2012-04-09', '2012-04-12', 200, 100, 10, 0, 0, 12, 1, 12, 8, 9, 1, 5, 7, 13);

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
  `clase` int(11) NOT NULL,
  PRIMARY KEY (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`tipo`, `nombre`, `clase`) VALUES
(1, 'lll', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `token`
--

CREATE TABLE IF NOT EXISTS `token` (
  `user_token` varchar(255) NOT NULL,
  PRIMARY KEY (`user_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `token`
--

INSERT INTO `token` (`user_token`) VALUES
('efvk6jatikm2f084l2dhj53v7d 1335476964630'),
('ie71a27jauj1vp9lp5l2c2qgg4 1335476217208');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `usuario` int(11) NOT NULL,
  `entidad` int(11) NOT NULL,
  `agencia` int(11) NOT NULL,
  `nombre` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `apodo` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `clave` int(4) NOT NULL,
  `id_usuario` char(1) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`usuario`,`entidad`,`agencia`),
  KEY `usuario` (`usuario`),
  KEY `entidad` (`entidad`),
  KEY `agencia` (`agencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario`, `entidad`, `agencia`, `nombre`, `apodo`, `clave`, `id_usuario`) VALUES
(0, 1, 2, '', '', 0, ''),
(1104012269, 1, 2, 'pascual', 'mostro', 1234, '');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agencia`
--
ALTER TABLE `agencia`
  ADD CONSTRAINT `agencia_ibfk_1` FOREIGN KEY (`entidad`) REFERENCES `entidad` (`entidad`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `portafolio`
--
ALTER TABLE `portafolio`
  ADD CONSTRAINT `portafolio_ibfk_34` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`cliente`),
  ADD CONSTRAINT `portafolio_ibfk_29` FOREIGN KEY (`entidad`) REFERENCES `entidad` (`entidad`),
  ADD CONSTRAINT `portafolio_ibfk_30` FOREIGN KEY (`agencia`) REFERENCES `agencia` (`agencia`),
  ADD CONSTRAINT `portafolio_ibfk_31` FOREIGN KEY (`clase`) REFERENCES `clase` (`clase`),
  ADD CONSTRAINT `portafolio_ibfk_32` FOREIGN KEY (`tipo`) REFERENCES `tipo` (`tipo`),
  ADD CONSTRAINT `portafolio_ibfk_33` FOREIGN KEY (`producto`) REFERENCES `producto` (`producto`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_7` FOREIGN KEY (`agencia`) REFERENCES `agencia` (`agencia`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_5` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`usuario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_6` FOREIGN KEY (`entidad`) REFERENCES `entidad` (`entidad`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
