-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-10-2021 a las 21:07:27
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
-- Base de datos: `bd_persona`
--
CREATE DATABASE IF NOT EXISTS `bd_persona` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bd_persona`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `dni` int(11) NOT NULL,
  `apellidos` varchar(200) NOT NULL,
  `nombres` varchar(200) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `lugarNacimiento` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`dni`, `apellidos`, `nombres`, `fechaNacimiento`, `lugarNacimiento`) VALUES
(1, 'Alabama Moreno', 'Carlos Arturo', '1994-11-10', 'Colombia');

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
  `n_historiaClinica` int(11) NOT NULL,
  `prioridad` int(11) DEFAULT NULL,
  `riesgo` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `t_pacientes`
--

INSERT INTO `t_pacientes` (`id`, `nombre`, `edad`, `n_historiaClinica`, `prioridad`, `riesgo`) VALUES
(1, 'Pedro Larota', 4, 1001, 3, 0.12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_panciano`
--

CREATE TABLE `t_panciano` (
  `id` int(1) NOT NULL,
  `tiene_dieta` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_pjoven`
--

CREATE TABLE `t_pjoven` (
  `id` int(11) NOT NULL,
  `fumador` int(1) NOT NULL,
  `annio_fumador` int(11) DEFAULT 0,
  `id_paciente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_pnino`
--

CREATE TABLE `t_pnino` (
  `id` int(11) NOT NULL,
  `relacion_peso` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_tp_consulta`
--

CREATE TABLE `t_tp_consulta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(300) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`dni`);

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
-- Indices de la tabla `t_panciano`
--
ALTER TABLE `t_panciano`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_paciente_anciano` (`id_paciente`);

--
-- Indices de la tabla `t_pjoven`
--
ALTER TABLE `t_pjoven`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_paciente_joven` (`id_paciente`);

--
-- Indices de la tabla `t_pnino`
--
ALTER TABLE `t_pnino`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_paciente_nino` (`id_paciente`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `t_panciano`
--
ALTER TABLE `t_panciano`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_pjoven`
--
ALTER TABLE `t_pjoven`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_pnino`
--
ALTER TABLE `t_pnino`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_tp_consulta`
--
ALTER TABLE `t_tp_consulta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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

--
-- Filtros para la tabla `t_panciano`
--
ALTER TABLE `t_panciano`
  ADD CONSTRAINT `fk_paciente_anciano` FOREIGN KEY (`id_paciente`) REFERENCES `t_pacientes` (`id`);

--
-- Filtros para la tabla `t_pjoven`
--
ALTER TABLE `t_pjoven`
  ADD CONSTRAINT `fk_paciente_joven` FOREIGN KEY (`id_paciente`) REFERENCES `t_pacientes` (`id`);

--
-- Filtros para la tabla `t_pnino`
--
ALTER TABLE `t_pnino`
  ADD CONSTRAINT `fk_paciente_nino` FOREIGN KEY (`id_paciente`) REFERENCES `t_pacientes` (`id`);
--
-- Base de datos: `bd_servicios`
--
CREATE DATABASE IF NOT EXISTS `bd_servicios` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bd_servicios`;

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
(12, 'Zhaira Avella', 12, 8786554, 5, 0.6, 0, 0, 0, 3);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__bookmark: #1932 - Table 'phpmyadmin.pma__bookmark' doesn't exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__bookmark: #1064 - Algo está equivocado en su sintax cerca 'FROM `phpmyadmin`.`pma__bookmark`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__central_columns: #1932 - Table 'phpmyadmin.pma__central_columns' doesn't exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__central_columns: #1064 - Algo está equivocado en su sintax cerca 'FROM `phpmyadmin`.`pma__central_columns`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__column_info: #1932 - Table 'phpmyadmin.pma__column_info' doesn't exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__column_info: #1064 - Algo está equivocado en su sintax cerca 'FROM `phpmyadmin`.`pma__column_info`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__designer_settings: #1932 - Table 'phpmyadmin.pma__designer_settings' doesn't exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__designer_settings: #1064 - Algo está equivocado en su sintax cerca 'FROM `phpmyadmin`.`pma__designer_settings`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__export_templates: #1932 - Table 'phpmyadmin.pma__export_templates' doesn't exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__export_templates: #1064 - Algo está equivocado en su sintax cerca 'FROM `phpmyadmin`.`pma__export_templates`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__favorite: #1932 - Table 'phpmyadmin.pma__favorite' doesn't exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__favorite: #1064 - Algo está equivocado en su sintax cerca 'FROM `phpmyadmin`.`pma__favorite`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__history: #1932 - Table 'phpmyadmin.pma__history' doesn't exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__history: #1064 - Algo está equivocado en su sintax cerca 'FROM `phpmyadmin`.`pma__history`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__navigationhiding: #1932 - Table 'phpmyadmin.pma__navigationhiding' doesn't exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__navigationhiding: #1064 - Algo está equivocado en su sintax cerca 'FROM `phpmyadmin`.`pma__navigationhiding`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__pdf_pages: #1932 - Table 'phpmyadmin.pma__pdf_pages' doesn't exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__pdf_pages: #1064 - Algo está equivocado en su sintax cerca 'FROM `phpmyadmin`.`pma__pdf_pages`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__recent: #1932 - Table 'phpmyadmin.pma__recent' doesn't exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__recent: #1064 - Algo está equivocado en su sintax cerca 'FROM `phpmyadmin`.`pma__recent`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__relation: #1932 - Table 'phpmyadmin.pma__relation' doesn't exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__relation: #1064 - Algo está equivocado en su sintax cerca 'FROM `phpmyadmin`.`pma__relation`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__savedsearches: #1932 - Table 'phpmyadmin.pma__savedsearches' doesn't exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__savedsearches: #1064 - Algo está equivocado en su sintax cerca 'FROM `phpmyadmin`.`pma__savedsearches`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__table_coords: #1932 - Table 'phpmyadmin.pma__table_coords' doesn't exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__table_coords: #1064 - Algo está equivocado en su sintax cerca 'FROM `phpmyadmin`.`pma__table_coords`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__table_info: #1932 - Table 'phpmyadmin.pma__table_info' doesn't exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__table_info: #1064 - Algo está equivocado en su sintax cerca 'FROM `phpmyadmin`.`pma__table_info`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__table_uiprefs: #1932 - Table 'phpmyadmin.pma__table_uiprefs' doesn't exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__table_uiprefs: #1064 - Algo está equivocado en su sintax cerca 'FROM `phpmyadmin`.`pma__table_uiprefs`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__tracking: #1932 - Table 'phpmyadmin.pma__tracking' doesn't exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__tracking: #1064 - Algo está equivocado en su sintax cerca 'FROM `phpmyadmin`.`pma__tracking`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__userconfig: #1932 - Table 'phpmyadmin.pma__userconfig' doesn't exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__userconfig: #1064 - Algo está equivocado en su sintax cerca 'FROM `phpmyadmin`.`pma__userconfig`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__usergroups: #1932 - Table 'phpmyadmin.pma__usergroups' doesn't exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__usergroups: #1064 - Algo está equivocado en su sintax cerca 'FROM `phpmyadmin`.`pma__usergroups`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__users: #1932 - Table 'phpmyadmin.pma__users' doesn't exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__users: #1064 - Algo está equivocado en su sintax cerca 'FROM `phpmyadmin`.`pma__users`' en la linea 1
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
