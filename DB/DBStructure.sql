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

CREATE TABLE `careers` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `professions_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cursos`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `semesters_id` int(11) NOT NULL,
  `course_rules_id` int(11) NOT NULL,
  `subjects_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `graded_percentage` double NOT NULL,
  `total_gpa` double NOT NULL,
  `current_gpa` double NOT NULL,
  `minimum_grade` double NOT NULL,
  `maximum_grade` double NOT NULL,
  `status` varchar(20) NOT NULL,
  `number_assignments` int(11) DEFAULT NULL,
  `section` int(11) DEFAULT NULL,
  `final_converted_grade` double NOT NULL,
  `number_evaluations` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `evaluaciones`
--

CREATE TABLE `evaluations` (
  `id` int(11) NOT NULL,
  `courses_id` int(11) NOT NULL,
  `evaluation_rules_id` int(11) NOT NULL,
  `percentage` double NOT NULL,
  `grade` double NOT NULL,
  `graded` tinyint(1) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `materias`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `credits` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pendientes`
--

CREATE TABLE `assignments` (
  `id` int(11) NOT NULL,
  `courses_id` int(11) DEFAULT NULL,
  `assignments_id` int(11) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `description` longtext,
  `status` tinyint(1) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profesiones`
--

CREATE TABLE `professions` (
  `id` int(11) NOT NULL,
  `universities_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reglas_curso`
--

CREATE TABLE `course_rules` (
  `id` int(11) NOT NULL,
  `grading_base` double NOT NULL,
  `passing_grade` double NOT NULL,
  `minimum_possible_grade` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reglas_evaluacion`
--

CREATE TABLE `evaluation_rules` (
  `id` int(11) NOT NULL,
  `grading_base` double NOT NULL,
  `passing_grade` double NOT NULL,
  `minimum_possible_grade` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reglas_semestre`
--

CREATE TABLE `semester_rules` (
  `id` int(11) NOT NULL,
  `grading_base` double NOT NULL,
  `passing_grade` double NOT NULL,
  `minimum_possible_grade` double NOT NULL,
  `probation_period_grade` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `semestres`
--

CREATE TABLE `semesters` (
  `id` int(11) NOT NULL,
  `careers_id` int(11) NOT NULL,
  `semester_rules_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `current_gpa` double NOT NULL,
  `start_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `universidades`
--

CREATE TABLE `universities` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `alerts` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carreras`
--
ALTER TABLE `careers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `professions_id` (`professions_id`);

--
-- Indexes for table `cursos`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `semesters_id` (`semesters_id`),
  ADD KEY `course_rules_id` (`course_rules_id`),
  ADD KEY `subjects_id` (`subjects_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `evaluaciones`
--
ALTER TABLE `evaluations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_id` (`courses_id`),
  ADD KEY `evaluation_rules_id` (`evaluation_rules_id`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `materias`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `pendientes`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_id` (`courses_id`),
  ADD KEY `assignments_id` (`assignments_id`),
  ADD KEY `date` (`date`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `profesiones`
--
ALTER TABLE `professions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `universities_id` (`universities_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `reglas_curso`
--
ALTER TABLE `course_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reglas_evaluacion`
--
ALTER TABLE `evaluation_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reglas_semestre`
--
ALTER TABLE `semester_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semestres`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `status` (`status`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `careers_id` (`careers_id`),
  ADD KEY `semester_rules_id` (`semester_rules_id`);

--
-- Indexes for table `universidades`
--
ALTER TABLE `universities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carreras`
--
ALTER TABLE `careers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cursos`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `evaluaciones`
--
ALTER TABLE `evaluations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `materias`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pendientes`
--
ALTER TABLE `assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `profesiones`
--
ALTER TABLE `professions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reglas_curso`
--
ALTER TABLE `course_rules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reglas_evaluacion`
--
ALTER TABLE `evaluation_rules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reglas_semestre`
--
ALTER TABLE `semester_rules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `semestres`
--
ALTER TABLE `semesters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `universidades`
--
ALTER TABLE `universities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;COMMIT;
