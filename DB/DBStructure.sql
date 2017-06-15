-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2017 at 11:55 PM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `cornettodb`
--
CREATE DATABASE IF NOT EXISTS `cornettodb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cornettodb`;

-- --------------------------------------------------------

--
-- Table structure for table `carreras`
--

CREATE TABLE `carreras` (
  `id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL,
  `profesiones_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cursos`
--

CREATE TABLE `cursos` (
  `id` int(11) NOT NULL,
  `semestres_id` int(11) NOT NULL,
  `reglas_curso_id` int(11) NOT NULL,
  `materias_id` int(11) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `porcentaje_evaluado` double NOT NULL,
  `promedio_total` double NOT NULL,
  `promedio_actual` double NOT NULL,
  `nota_minima` double NOT NULL,
  `nota_maxima` double NOT NULL,
  `estado` varchar(20) NOT NULL,
  `numero_pendientes` int(11) DEFAULT NULL,
  `seccion` int(11) DEFAULT NULL,
  `nota_final_convertida` double NOT NULL,
  `numero_evaluaciones` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `evaluaciones`
--

CREATE TABLE `evaluaciones` (
  `id` int(11) NOT NULL,
  `cursos_id` int(11) NOT NULL,
  `reglas_evaluacion_id` int(11) NOT NULL,
  `porcentaje` double NOT NULL,
  `nota` double NOT NULL,
  `evaluado` tinyint(1) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `materias`
--

CREATE TABLE `materias` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `creditos` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pendientes`
--

CREATE TABLE `pendientes` (
  `id` int(11) NOT NULL,
  `cursos_id` int(11) DEFAULT NULL,
  `pendientes_id` int(11) DEFAULT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` longtext,
  `estado` tinyint(1) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profesiones`
--

CREATE TABLE `profesiones` (
  `id` int(11) NOT NULL,
  `universidades_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reglas_curso`
--

CREATE TABLE `reglas_curso` (
  `id` int(11) NOT NULL,
  `nota_base` double NOT NULL,
  `nota_aprobar` double NOT NULL,
  `nota_minima_posible` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reglas_evaluacion`
--

CREATE TABLE `reglas_evaluacion` (
  `id` int(11) NOT NULL,
  `nota_base` double NOT NULL,
  `nota_aprobar` double NOT NULL,
  `nota_minima_posible` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reglas_semestre`
--

CREATE TABLE `reglas_semestre` (
  `id` int(11) NOT NULL,
  `nota_base` double NOT NULL,
  `nota_aprobar` double NOT NULL,
  `nota_minima_posible` double NOT NULL,
  `nota_periodo_prueba` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `semestres`
--

CREATE TABLE `semestres` (
  `id` int(11) NOT NULL,
  `carreras_id` int(11) NOT NULL,
  `reglas_semestre_id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `promedio_actual` double NOT NULL,
  `fecha_inicio` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `universidades`
--

CREATE TABLE `universidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `alertas` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios_id` (`usuarios_id`),
  ADD KEY `profesiones_id` (`profesiones_id`);

--
-- Indexes for table `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `semestres_id` (`semestres_id`),
  ADD KEY `reglas_curso_id` (`reglas_curso_id`),
  ADD KEY `materias_id` (`materias_id`),
  ADD KEY `nombre` (`nombre`);

--
-- Indexes for table `evaluaciones`
--
ALTER TABLE `evaluaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cursos_id` (`cursos_id`),
  ADD KEY `reglas_evaluacion_id` (`reglas_evaluacion_id`),
  ADD KEY `fecha` (`fecha`);

--
-- Indexes for table `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codigo` (`codigo`);

--
-- Indexes for table `pendientes`
--
ALTER TABLE `pendientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cursos_id` (`cursos_id`),
  ADD KEY `pendientes_id` (`pendientes_id`),
  ADD KEY `fecha` (`fecha`),
  ADD KEY `nombre` (`nombre`);

--
-- Indexes for table `profesiones`
--
ALTER TABLE `profesiones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `universidades_id` (`universidades_id`),
  ADD KEY `nombre` (`nombre`);

--
-- Indexes for table `reglas_curso`
--
ALTER TABLE `reglas_curso`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reglas_evaluacion`
--
ALTER TABLE `reglas_evaluacion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reglas_semestre`
--
ALTER TABLE `reglas_semestre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semestres`
--
ALTER TABLE `semestres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nombre` (`nombre`),
  ADD KEY `estado` (`estado`),
  ADD KEY `fecha_inicio` (`fecha_inicio`),
  ADD KEY `carreras_id` (`carreras_id`),
  ADD KEY `reglas_semestre_id` (`reglas_semestre_id`);

--
-- Indexes for table `universidades`
--
ALTER TABLE `universidades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carreras`
--
ALTER TABLE `carreras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `evaluaciones`
--
ALTER TABLE `evaluaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `materias`
--
ALTER TABLE `materias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pendientes`
--
ALTER TABLE `pendientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `profesiones`
--
ALTER TABLE `profesiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reglas_curso`
--
ALTER TABLE `reglas_curso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reglas_evaluacion`
--
ALTER TABLE `reglas_evaluacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reglas_semestre`
--
ALTER TABLE `reglas_semestre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `semestres`
--
ALTER TABLE `semestres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `universidades`
--
ALTER TABLE `universidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;COMMIT;
