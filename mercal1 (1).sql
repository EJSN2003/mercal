-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-09-2026 a las 05:34:39
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mercal1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblareadministrativa`
--

CREATE TABLE `tblareadministrativa` (
  `numeroArea` varchar(40) NOT NULL,
  `nombreArea` varchar(100) DEFAULT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  `estatus` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tblareadministrativa`
--

INSERT INTO `tblareadministrativa` (`numeroArea`, `nombreArea`, `departamento`, `estatus`) VALUES
('1', 'alimentos', 'biberes', 1),
('2', 'Ambientales', 'mercal', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblasociacion`
--

CREATE TABLE `tblasociacion` (
  `rifASC` varchar(20) NOT NULL,
  `nombre_asociacion` varchar(80) DEFAULT NULL,
  `direccionASC` varchar(255) DEFAULT NULL,
  `estatus` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tblasociacion`
--

INSERT INTO `tblasociacion` (`rifASC`, `nombre_asociacion`, `direccionASC`, `estatus`) VALUES
('132456', 'PDVAL', 'Avenida las indrustrias', 1),
('2929', 'Ambientales', 'barquisimeto', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblbeneficiario`
--

CREATE TABLE `tblbeneficiario` (
  `cedula` varchar(20) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `sexo` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `parentesco` varchar(100) DEFAULT NULL,
  `estatus` int(1) NOT NULL DEFAULT 1,
  `tbltrabajador_cedula` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tblbeneficiario`
--

INSERT INTO `tblbeneficiario` (`cedula`, `nombre`, `apellido`, `sexo`, `correo`, `telefono`, `fechaNacimiento`, `parentesco`, `estatus`, `tbltrabajador_cedula`) VALUES
('28348946', 'jose', 'miguel', 'Masculino', 'antonisimon17@gmail.com', '04245241224', '2000-02-02', 'Padre', 1, '10779259'),
('29707067', 'freider', 'alvarado', 'Masculino', 'frei21@gmail.com', NULL, '2000-02-02', 'Padre', 0, '9676518');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblconsulta`
--

CREATE TABLE `tblconsulta` (
  `id` int(11) NOT NULL,
  `numeroHistoria` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `motivoConsulta` varchar(255) DEFAULT NULL,
  `cedula_paciente` varchar(20) DEFAULT NULL,
  `estatus` int(1) NOT NULL DEFAULT 1,
  `tblcontroenfermeria_numeroHistoria` varchar(50) DEFAULT NULL,
  `tblmedico_cedula` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcontroenfermeria`
--

CREATE TABLE `tblcontroenfermeria` (
  `numeroHistoria` varchar(50) NOT NULL,
  `cedula` varchar(20) DEFAULT NULL,
  `nombrePaciente` varchar(255) DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `talla` varchar(10) DEFAULT NULL,
  `tension` varchar(20) DEFAULT NULL,
  `temperatura` decimal(4,1) DEFAULT NULL,
  `frecuencia_cardiaca` int(11) DEFAULT NULL,
  `enfermera_turno` varchar(255) DEFAULT NULL,
  `estatus` int(1) NOT NULL DEFAULT 1,
  `tblbeneficiario_cedula` varchar(20) DEFAULT NULL,
  `tbltrabajador_cedula` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tblcontroenfermeria`
--

INSERT INTO `tblcontroenfermeria` (`numeroHistoria`, `cedula`, `nombrePaciente`, `peso`, `talla`, `tension`, `temperatura`, `frecuencia_cardiaca`, `enfermera_turno`, `estatus`, `tblbeneficiario_cedula`, `tbltrabajador_cedula`) VALUES
('HIST-000001', '28348946', '', 70.00, '80', '120/80', 35.0, 23, 'grabriela', 1, NULL, NULL),
('HIST-000002', '10779259', 'pedro parra', 70.00, '170', '120/80', 30.0, 80, 'daniela garcia ', 1, NULL, NULL),
('HIST-000003', '29707067', 'freider alvarado', 80.00, '170', '120/80', 20.0, 90, 'sofia colmenarez', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldiagnosticos`
--

CREATE TABLE `tbldiagnosticos` (
  `id` int(11) NOT NULL,
  `numeroHistoria` varchar(50) DEFAULT NULL,
  `patologia` varchar(255) DEFAULT NULL,
  `tipo_patologia` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_en` timestamp NULL DEFAULT current_timestamp(),
  `estatus` int(1) NOT NULL DEFAULT 1,
  `tblconsulta_id` int(11) DEFAULT NULL,
  `tblmedico_cedula` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbldiagnosticos`
--

INSERT INTO `tbldiagnosticos` (`id`, `numeroHistoria`, `patologia`, `tipo_patologia`, `descripcion`, `creado_en`, `estatus`, `tblconsulta_id`, `tblmedico_cedula`) VALUES
(1, 'HIST-000001', 'Alteración visual', 'Crónica', 'Los objetos del entorno se perciben mucho más pequeños (micropsia), más grandes (macropsia), o más cercanos/lejanos de lo que realmente están,', '2026-09-14 23:32:21', 1, NULL, '28348947'),
(2, 'HIST-000002', 'dolor de cabeza', 'Aguda', 'al paciente le dolia mucho la cabeza y se le realizo tacto suaves al rededor, no es nada grave y se le recetaran unos medicamentos mediante un recipe', '2026-09-15 01:04:12', 1, NULL, '7336681'),
(3, 'HIST-000003', 'dolor de carganta', 'Aguda', 'al paciente le dolia mucho la garganta, se le mando a una clinica por medio de una referencia medica', '2026-09-15 01:07:27', 1, NULL, '7336681');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblentregamedicamentos`
--

CREATE TABLE `tblentregamedicamentos` (
  `id` int(11) NOT NULL,
  `cantidadEntregada` int(11) DEFAULT NULL,
  `fechaEntrega` datetime DEFAULT NULL,
  `estatus` int(1) NOT NULL DEFAULT 1,
  `id_usuario` int(11) DEFAULT NULL,
  `tblrecipedetalle_id` int(11) DEFAULT NULL,
  `tblmedicamentos_numeroMedicamento` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tblentregamedicamentos`
--

INSERT INTO `tblentregamedicamentos` (`id`, `cantidadEntregada`, `fechaEntrega`, `estatus`, `id_usuario`, `tblrecipedetalle_id`, `tblmedicamentos_numeroMedicamento`) VALUES
(1, 1, '2026-09-14 21:53:13', 1, 1, 2, '10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbljornadamedica`
--

CREATE TABLE `tbljornadamedica` (
  `id` int(11) NOT NULL,
  `nombre_jornada` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `lugar` varchar(255) DEFAULT NULL,
  `numero_personas_atendidas` int(11) DEFAULT NULL,
  `estatus` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbljornadamedica`
--

INSERT INTO `tbljornadamedica` (`id`, `nombre_jornada`, `fecha`, `lugar`, `numero_personas_atendidas`, `estatus`) VALUES
(1, 'cardiología', '2026-09-14', 'cc.metropolis', 14, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbljornadamedico`
--

CREATE TABLE `tbljornadamedico` (
  `id` int(11) NOT NULL,
  `estatus` int(1) NOT NULL DEFAULT 1,
  `tbljornadamedica_id` int(11) DEFAULT NULL,
  `tblmedico_cedula` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbljornadamedico`
--

INSERT INTO `tbljornadamedico` (`id`, `estatus`, `tbljornadamedica_id`, `tblmedico_cedula`) VALUES
(1, 1, 1, '7336681');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblmedicamentos`
--

CREATE TABLE `tblmedicamentos` (
  `numeroMedicamento` varchar(50) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `presentacion` varchar(100) DEFAULT NULL,
  `unidadMedida` varchar(50) DEFAULT NULL,
  `cantidadDisponible` int(11) DEFAULT NULL,
  `fechaVencimiento` date DEFAULT NULL,
  `estatus` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tblmedicamentos`
--

INSERT INTO `tblmedicamentos` (`numeroMedicamento`, `nombre`, `tipo`, `presentacion`, `unidadMedida`, `cantidadDisponible`, `fechaVencimiento`, `estatus`) VALUES
('10', 'loratadina', 'Analgésico', 'Tabletas', 'tableta', 9, '2030-02-02', 1),
('12', 'ibuprofeno', 'Antibiótico', 'Tabletas', 'tableta', 3, '2030-02-02', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblmedico`
--

CREATE TABLE `tblmedico` (
  `cedula` varchar(20) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `estatus` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tblmedico`
--

INSERT INTO `tblmedico` (`cedula`, `nombre`, `apellido`, `especialidad`, `telefono`, `estatus`) VALUES
('28348947', 'fre', 'lopez', 'Ginecología', '04212341', 1),
('7336681', 'wilker', 'camacaro', 'general', '0412224569', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblrecipe`
--

CREATE TABLE `tblrecipe` (
  `id` int(11) NOT NULL,
  `indicaciones` text DEFAULT NULL,
  `creado_en` timestamp NULL DEFAULT current_timestamp(),
  `estatus` int(1) NOT NULL DEFAULT 1,
  `tbldiagnosticos_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tblrecipe`
--

INSERT INTO `tblrecipe` (`id`, `indicaciones`, `creado_en`, `estatus`, `tbldiagnosticos_id`) VALUES
(1, 'tomar todo los dias por la noches', '2026-09-14 23:33:26', 1, 1),
(2, 'tomar todas las noches antes de dormir por nueve dias', '2026-09-15 01:11:43', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblrecipedetalle`
--

CREATE TABLE `tblrecipedetalle` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `dosis` varchar(100) DEFAULT NULL,
  `duracion` varchar(100) DEFAULT NULL,
  `estatus` int(1) NOT NULL DEFAULT 1,
  `tblrecipe_id` int(11) DEFAULT NULL,
  `tblmedicamentos_numeroMedicamento` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tblrecipedetalle`
--

INSERT INTO `tblrecipedetalle` (`id`, `cantidad`, `dosis`, `duracion`, `estatus`, `tblrecipe_id`, `tblmedicamentos_numeroMedicamento`) VALUES
(1, 1, '500', '8', 1, 1, '12'),
(2, 1, '10', '9', 1, 2, '10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblreferenciamedica`
--

CREATE TABLE `tblreferenciamedica` (
  `id` int(11) NOT NULL,
  `ente_externo` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `creado_en` timestamp NULL DEFAULT current_timestamp(),
  `estatus` int(1) NOT NULL DEFAULT 1,
  `tbldiagnosticos_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tblreferenciamedica`
--

INSERT INTO `tblreferenciamedica` (`id`, `ente_externo`, `fecha`, `creado_en`, `estatus`, `tbldiagnosticos_id`) VALUES
(2, 'juan', '2026-12-02', '2026-09-14 23:37:00', 1, 1),
(3, 'cdi de la avenida 20 entre calle 30 y 31', '2026-09-14', '2026-09-15 01:19:25', 1, 3),
(4, 'cdi de la avenida 20 entre calle 30 y 31', '2026-09-15', '2026-09-15 01:57:52', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbltrabajador`
--

CREATE TABLE `tbltrabajador` (
  `cedula` varchar(15) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `sexo` varchar(20) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `tblareadministrativa_numeroArea` varchar(40) DEFAULT NULL,
  `estatus` int(1) NOT NULL DEFAULT 1,
  `tblasociacion_rifASC` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbltrabajador`
--

INSERT INTO `tbltrabajador` (`cedula`, `nombre`, `apellido`, `sexo`, `fechaNacimiento`, `email`, `telefono`, `cargo`, `tblareadministrativa_numeroArea`, `estatus`, `tblasociacion_rifASC`) VALUES
('10779259', 'pedro', 'parra', 'Masculino', '2000-02-02', 'pedro281@gmail.com', '04122245681', 'contador', '2', 1, NULL),
('28348946', 'antony', 'rojas', 'Masculino', '2000-02-02', 'antonisimon17@gmail.com', '04245241224', 'docente', NULL, 1, '2929'),
('9676518', 'jose', 'gonzales', 'Masculino', '2000-02-02', 'jose123@gmail.com', '042452241231', 'administrador ', '1', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblusuarios`
--

CREATE TABLE `tblusuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `cedula` varchar(20) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `clave` varchar(255) NOT NULL,
  `rol` varchar(50) NOT NULL DEFAULT 'usuario',
  `estatus` int(1) NOT NULL DEFAULT 1,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tblusuarios`
--

INSERT INTO `tblusuarios` (`id`, `usuario`, `cedula`, `nombre`, `apellido`, `correo`, `telefono`, `clave`, `rol`, `estatus`, `creado_en`) VALUES
(1, 'admin', '28348947', 'Administrador', 'Sistema', 'admin@mercal.gob.ve', NULL, '$2y$10$xWdGazXPSORm9lYSYfRNx.TxSJhmjoL46TePu7UM1ACfl2eMXFbkm', 'administrador', 1, '2026-09-14 22:58:03'),
(2, 'adminprivado', '28348946', 'Admin', 'Privado', 'adminprivado@mercal.gob.ve', NULL, '$2y$10$xWdGazXPSORm9lYSYfRNx.TxSJhmjoL46TePu7UM1ACfl2eMXFbkm', 'administrador', 1, '2026-09-14 22:58:03');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblareadministrativa`
--
ALTER TABLE `tblareadministrativa`
  ADD PRIMARY KEY (`numeroArea`);

--
-- Indices de la tabla `tblasociacion`
--
ALTER TABLE `tblasociacion`
  ADD PRIMARY KEY (`rifASC`);

--
-- Indices de la tabla `tblbeneficiario`
--
ALTER TABLE `tblbeneficiario`
  ADD PRIMARY KEY (`cedula`),
  ADD KEY `idx_tblbeneficiario_trabajador` (`tbltrabajador_cedula`);

--
-- Indices de la tabla `tblconsulta`
--
ALTER TABLE `tblconsulta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tblconsulta_enfermeria` (`tblcontroenfermeria_numeroHistoria`),
  ADD KEY `idx_tblconsulta_medico` (`tblmedico_cedula`);

--
-- Indices de la tabla `tblcontroenfermeria`
--
ALTER TABLE `tblcontroenfermeria`
  ADD PRIMARY KEY (`numeroHistoria`),
  ADD KEY `idx_tblcontroenfermeria_beneficiario` (`tblbeneficiario_cedula`),
  ADD KEY `idx_tblcontroenfermeria_trabajador` (`tbltrabajador_cedula`);

--
-- Indices de la tabla `tbldiagnosticos`
--
ALTER TABLE `tbldiagnosticos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tbldiagnosticos_consulta` (`tblconsulta_id`),
  ADD KEY `idx_tbldiagnosticos_medico` (`tblmedico_cedula`);

--
-- Indices de la tabla `tblentregamedicamentos`
--
ALTER TABLE `tblentregamedicamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tblentregamedicamentos_detalle` (`tblrecipedetalle_id`),
  ADD KEY `idx_tblentregamedicamentos_medicamento` (`tblmedicamentos_numeroMedicamento`);

--
-- Indices de la tabla `tbljornadamedica`
--
ALTER TABLE `tbljornadamedica`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbljornadamedico`
--
ALTER TABLE `tbljornadamedico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tbljornadamedico_jornada` (`tbljornadamedica_id`),
  ADD KEY `idx_tbljornadamedico_medico` (`tblmedico_cedula`);

--
-- Indices de la tabla `tblmedicamentos`
--
ALTER TABLE `tblmedicamentos`
  ADD PRIMARY KEY (`numeroMedicamento`);

--
-- Indices de la tabla `tblmedico`
--
ALTER TABLE `tblmedico`
  ADD PRIMARY KEY (`cedula`);

--
-- Indices de la tabla `tblrecipe`
--
ALTER TABLE `tblrecipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tblrecipe_diagnostico` (`tbldiagnosticos_id`);

--
-- Indices de la tabla `tblrecipedetalle`
--
ALTER TABLE `tblrecipedetalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tblrecipedetalle_recipe` (`tblrecipe_id`),
  ADD KEY `idx_tblrecipedetalle_medicamento` (`tblmedicamentos_numeroMedicamento`);

--
-- Indices de la tabla `tblreferenciamedica`
--
ALTER TABLE `tblreferenciamedica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tblreferenciamedica_diagnostico` (`tbldiagnosticos_id`);

--
-- Indices de la tabla `tbltrabajador`
--
ALTER TABLE `tbltrabajador`
  ADD PRIMARY KEY (`cedula`),
  ADD KEY `idx_tbltrabajador_rif` (`tblasociacion_rifASC`),
  ADD KEY `idx_tbltrabajador_area` (`tblareadministrativa_numeroArea`),
  ADD KEY `tblareadministrativa_numeroArea` (`tblareadministrativa_numeroArea`);

--
-- Indices de la tabla `tblusuarios`
--
ALTER TABLE `tblusuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tblconsulta`
--
ALTER TABLE `tblconsulta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbldiagnosticos`
--
ALTER TABLE `tbldiagnosticos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tblentregamedicamentos`
--
ALTER TABLE `tblentregamedicamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbljornadamedica`
--
ALTER TABLE `tbljornadamedica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbljornadamedico`
--
ALTER TABLE `tbljornadamedico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tblrecipe`
--
ALTER TABLE `tblrecipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tblrecipedetalle`
--
ALTER TABLE `tblrecipedetalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tblreferenciamedica`
--
ALTER TABLE `tblreferenciamedica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tblusuarios`
--
ALTER TABLE `tblusuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tblbeneficiario`
--
ALTER TABLE `tblbeneficiario`
  ADD CONSTRAINT `fk_tblbeneficiario_trabajador` FOREIGN KEY (`tbltrabajador_cedula`) REFERENCES `tbltrabajador` (`cedula`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tblconsulta`
--
ALTER TABLE `tblconsulta`
  ADD CONSTRAINT `fk_tblconsulta_enfermeria` FOREIGN KEY (`tblcontroenfermeria_numeroHistoria`) REFERENCES `tblcontroenfermeria` (`numeroHistoria`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblconsulta_medico` FOREIGN KEY (`tblmedico_cedula`) REFERENCES `tblmedico` (`cedula`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tblcontroenfermeria`
--
ALTER TABLE `tblcontroenfermeria`
  ADD CONSTRAINT `fk_tblcontroenfermeria_beneficiario` FOREIGN KEY (`tblbeneficiario_cedula`) REFERENCES `tblbeneficiario` (`cedula`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblcontroenfermeria_trabajador` FOREIGN KEY (`tbltrabajador_cedula`) REFERENCES `tbltrabajador` (`cedula`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbldiagnosticos`
--
ALTER TABLE `tbldiagnosticos`
  ADD CONSTRAINT `fk_tbldiagnosticos_consulta` FOREIGN KEY (`tblconsulta_id`) REFERENCES `tblconsulta` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbldiagnosticos_medico` FOREIGN KEY (`tblmedico_cedula`) REFERENCES `tblmedico` (`cedula`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tblentregamedicamentos`
--
ALTER TABLE `tblentregamedicamentos`
  ADD CONSTRAINT `fk_tblentregamedicamentos_detalle` FOREIGN KEY (`tblrecipedetalle_id`) REFERENCES `tblrecipedetalle` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblentregamedicamentos_medicamento` FOREIGN KEY (`tblmedicamentos_numeroMedicamento`) REFERENCES `tblmedicamentos` (`numeroMedicamento`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbljornadamedico`
--
ALTER TABLE `tbljornadamedico`
  ADD CONSTRAINT `fk_tbljornadamedico_jornada` FOREIGN KEY (`tbljornadamedica_id`) REFERENCES `tbljornadamedica` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbljornadamedico_medico` FOREIGN KEY (`tblmedico_cedula`) REFERENCES `tblmedico` (`cedula`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tblrecipe`
--
ALTER TABLE `tblrecipe`
  ADD CONSTRAINT `fk_tblrecipe_diagnostico` FOREIGN KEY (`tbldiagnosticos_id`) REFERENCES `tbldiagnosticos` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tblrecipedetalle`
--
ALTER TABLE `tblrecipedetalle`
  ADD CONSTRAINT `fk_tblrecipedetalle_medicamento` FOREIGN KEY (`tblmedicamentos_numeroMedicamento`) REFERENCES `tblmedicamentos` (`numeroMedicamento`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tblrecipedetalle_recipe` FOREIGN KEY (`tblrecipe_id`) REFERENCES `tblrecipe` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tblreferenciamedica`
--
ALTER TABLE `tblreferenciamedica`
  ADD CONSTRAINT `fk_tblreferenciamedica_diagnostico` FOREIGN KEY (`tbldiagnosticos_id`) REFERENCES `tbldiagnosticos` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbltrabajador`
--
ALTER TABLE `tbltrabajador`
  ADD CONSTRAINT `fk_tbltrabajador_asociacion` FOREIGN KEY (`tblasociacion_rifASC`) REFERENCES `tblasociacion` (`rifASC`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbltrabajador_ibfk_1` FOREIGN KEY (`tblareadministrativa_numeroArea`) REFERENCES `tblareadministrativa` (`numeroArea`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
