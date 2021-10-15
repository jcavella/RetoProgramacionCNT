-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2021 a las 03:52:44
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_servicios`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_atender_paciente`
--

CREATE TABLE `t_atender_paciente` (
  `id` int(11) NOT NULL,
  `consulta_id` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_consulta`
--

CREATE TABLE `t_consulta` (
  `id` int(11) NOT NULL,
  `can_pacientes` int(11) NOT NULL,
  `nombre_especialista` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_consulta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_pacientes`
--

CREATE TABLE `t_pacientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `edad` int(11) NOT NULL,
  `n_historia_clinica` int(11) NOT NULL,
  `prioridad` float DEFAULT NULL,
  `riesgo` float DEFAULT NULL,
  `tiene_dieta` int(1) DEFAULT 0,
  `fumador` int(1) DEFAULT 0,
  `annio_fumador` int(11) DEFAULT 0,
  `rel_peso_est` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `t_pacientes`
--

INSERT INTO `t_pacientes` (`id`, `nombre`, `edad`, `n_historia_clinica`, `prioridad`, `riesgo`, `tiene_dieta`, `fumador`, `annio_fumador`, `rel_peso_est`) VALUES
(6, 'juan', 87, 3434, 8.35, 12.5645, 1, 0, 0, 2),
(7, 'Maria Bello', 23, 10005, 2.5, 0.575, 0, 1, 2, 0),
(8, 'Orlando Chaparra', 90, 10008, 8.5, 12.95, 1, 0, 0, 0),
(9, 'Camila Santos', 10, 54532, 6, 0.6, 0, 0, 0, 4),
(10, 'Patricia Cardona', 35, 87878, 4.5, 1.575, 0, 1, 10, 0),
(11, 'Jose Pardo', 61, 65667, 7.05, 9.6005, 1, 0, 0, 0),
(12, 'Zhaira Avella', 12, 8786554, 5, 0.6, 0, 0, 0, 3),
(29, 'Jose cardenas', 3, 767, 5, 0.15, 0, 0, 0, 2),
(30, 'Martha Sanchez', 16, 676, 3.5, 0.56, 0, 1, 6, 0),
(31, 'Martin moreno', 4, 656564, 6, 0.24, 0, 0, 0, 3),
(32, 'Julio Perez', 90, 76767, 8.5, 12.95, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_tp_consulta`
--

CREATE TABLE `t_tp_consulta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(300) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `t_tp_consulta`
--

INSERT INTO `t_tp_consulta` (`id`, `nombre`) VALUES
(1, 'PEDIATRÍA'),
(2, 'URGENCIAS'),
(5, 'MEDICINA INTEGRAL MI');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `t_atender_paciente`
--
ALTER TABLE `t_atender_paciente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_paciente` (`id_paciente`),
  ADD KEY `fk_cosulta` (`consulta_id`);

--
-- Indices de la tabla `t_consulta`
--
ALTER TABLE `t_consulta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tp_consulta` (`tipo_consulta_id`);

--
-- Indices de la tabla `t_pacientes`
--
ALTER TABLE `t_pacientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `t_tp_consulta`
--
ALTER TABLE `t_tp_consulta`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `t_atender_paciente`
--
ALTER TABLE `t_atender_paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_consulta`
--
ALTER TABLE `t_consulta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_pacientes`
--
ALTER TABLE `t_pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `t_tp_consulta`
--
ALTER TABLE `t_tp_consulta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `t_atender_paciente`
--
ALTER TABLE `t_atender_paciente`
  ADD CONSTRAINT `fk_cosulta` FOREIGN KEY (`consulta_id`) REFERENCES `t_consulta` (`id`),
  ADD CONSTRAINT `fk_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `t_pacientes` (`id`);

--
-- Filtros para la tabla `t_consulta`
--
ALTER TABLE `t_consulta`
  ADD CONSTRAINT `fk_tp_consulta` FOREIGN KEY (`tipo_consulta_id`) REFERENCES `t_tp_consulta` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
