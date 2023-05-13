-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 13-05-2023 a las 15:31:55
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `carsapidb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquileres`
--

DROP TABLE IF EXISTS `alquileres`;
CREATE TABLE IF NOT EXISTS `alquileres` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_entrega` date DEFAULT NULL,
  `fecha_recogida` date DEFAULT NULL,
  `coche_id` bigint DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5bi9ooiyxqoau2lvg2t75gi54` (`coche_id`),
  KEY `FK9vjcbbsv48t56fwh02hjqdfru` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
CREATE TABLE IF NOT EXISTS `ciudades` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `provincia` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coches`
--

DROP TABLE IF EXISTS `coches`;
CREATE TABLE IF NOT EXISTS `coches` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `disponible` bit(1) DEFAULT NULL,
  `marca` varchar(255) NOT NULL,
  `matricula` varchar(255) NOT NULL,
  `modelo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `coches`
--

INSERT INTO `coches` (`id`, `disponible`, `marca`, `matricula`, `modelo`) VALUES
(3, b'1', 'peugeot', '0344JFW', '508'),
(4, b'0', 'Opel', '2846KWC', 'Corsa'),
(5, b'1', 'peugeot', '2846KWC', '508'),
(6, b'0', 'fsdsg', '0344jfw', '508');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficinas`
--

DROP TABLE IF EXISTS `oficinas`;
CREATE TABLE IF NOT EXISTS `oficinas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `direccion` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `num_trabajadores` int DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `ciudad_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKiaiwrux4oumj31slhxs5fcjgu` (`ciudad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `oficinas`
--

INSERT INTO `oficinas` (`id`, `direccion`, `email`, `nombre`, `num_trabajadores`, `telefono`, `ciudad_id`) VALUES
(2, 'A Cruz Nº 5 - Santiso 36512', 'albertrodtab@gmail.com', 'Lalin', 3, '600623180', NULL),
(5, 'Calle el Palomar', 'utebo.aljosa@aljosa.com', 'Utebo', 8, '456789123', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(255) DEFAULT NULL,
  `dni` varchar(255) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `apellidos`, `dni`, `fecha_nacimiento`, `nombre`) VALUES
(9, 'Rodríguez Taboada', '44091652P', '1988-09-26', 'Alberto'),
(10, 'Rodríguez Taboada', '44091652P', '1988-09-26', 'Alberto'),
(11, 'Rodríguez Taboada', '44091652P', '1988-09-26', 'Alberto');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alquileres`
--
ALTER TABLE `alquileres`
  ADD CONSTRAINT `FK5bi9ooiyxqoau2lvg2t75gi54` FOREIGN KEY (`coche_id`) REFERENCES `coches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK9vjcbbsv48t56fwh02hjqdfru` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `oficinas`
--
ALTER TABLE `oficinas`
  ADD CONSTRAINT `FKiaiwrux4oumj31slhxs5fcjgu` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudades` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
