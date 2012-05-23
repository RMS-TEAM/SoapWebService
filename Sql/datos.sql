-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 23-05-2012 a las 01:50:18
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

--
-- Volcado de datos para la tabla `clase`
--

INSERT INTO `clase` (`clase`, `nombre`) VALUES
(1, 'AHORROS'),
(2, 'CREDITOS'),
(3, 'APORTES'),
(4, 'SEGUROS'),
(5, 'CONVENIOS RECAUDOS');

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cliente`, `entidad`, `nombre1`, `nombre2`, `apellido1`, `razon_social`, `telefono1`, `telefono2`, `direccion1`, `direccion2`, `celular`, `email`, `tipo_cliente`, `fecha_nacimiento`, `fecha_expdoc`, `apellido2`, `clave`) VALUES
(71171321, 0, 'NELSON', 'HERNAN', 'ESPINOSA', '', '11111111', '11111112', 'CR 55 NRO 55-72', 'CR 34 NRO 22-12', '3187759039', 'NHESPINOSA@UNE.', 1, '2012-04-02', '2012-04-17', 'VERGARA', 0);

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

--
-- Volcado de datos para la tabla `portafolio`
--

INSERT INTO `portafolio` (`entidad`, `agencia`, `clase`, `tipo`, `producto`, `cliente`, `nro_producto`, `fecha_apertura`, `fecha_vencimiento`, `fecha_ultimaprorroga`, `fecha_ultliquidacion`, `fecha_ultcausacion`, `fecha_ultcorte`, `saldo_actual`, `int_pagar`, `int_causado`, `tasa_inicial`, `tasa_mora`, `plazo`, `tipo_periodo`, `nro_periodo`, `periodos_pasado`, `periodos_pagados`, `tipo_cuota`, `cuota`, `cuota_interes`, `cuota_capital`) VALUES
(1, 1, 1, 1, 1, 71171321, 1, '2012-01-09', '2013-04-11', '0000-00-00', '2012-04-27', '2012-03-29', '2012-04-27', 1000000, 100000, 20000, 18, 0, 12, 1, 12, 3, 0, 1, 20000, 0, 0),
(1, 1, 1, 3, 3, 71171321, 2, '2011-01-31', '2013-01-31', '0000-00-00', '2012-03-31', '0000-00-00', '0000-00-00', 2000000, 250000, 120000, 19, 0, 24, 1, 24, 14, 0, 0, 0, 0, 0),
(1, 1, 1, 1, 1, 71171321, 1, '2012-01-09', '2013-04-11', '0000-00-00', '2012-04-27', '2012-03-29', '2012-04-27', 1000000, 100000, 20000, 18, 0, 12, 1, 12, 3, 0, 1, 20000, 0, 0),
(1, 1, 1, 3, 3, 71171321, 2, '2011-01-31', '2013-01-31', '0000-00-00', '2012-03-31', '0000-00-00', '0000-00-00', 2000000, 250000, 120000, 19, 0, 24, 1, 24, 14, 0, 0, 0, 0, 0),
(1, 1, 2, 4, 202, 71171321, 6, '2011-04-28', '2012-12-28', '0000-00-00', '2012-04-26', '2012-03-31', '2012-04-27', 3000000, 200000, 10000, 27, 30, 36, 1, 36, 18, 17, 1, 250000, 120000, 130000);

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

--
-- Volcado de datos para la tabla `token`
--

INSERT INTO `token` (`user_token`) VALUES
('61i3l03fmh4qincfmrbcap910b 1335557684675'),
('co6lln5e42q9ndban0tfqn460a 1337729333860');

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario`, `entidad`, `agencia`, `nombre`, `apodo`, `clave`, `id_usuario`) VALUES
(1, 1, 1, 'N', 'N', '1', 'N'),
(12, 1, 1, 'n', '', '1', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
