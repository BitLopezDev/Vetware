-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-03-2023 a las 19:38:10
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vetware_test`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animals`
--

CREATE TABLE `animals` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `owner_id` int(11) UNSIGNED NOT NULL,
  `ensured` tinyint(1) NOT NULL DEFAULT 0,
  `for_adoption` tinyint(1) NOT NULL DEFAULT 0,
  `belongs_to_vet` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `medical_history` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client_has_animals`
--

CREATE TABLE `client_has_animals` (
  `id` int(10) UNSIGNED NOT NULL,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `animal_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client_owner`
--

CREATE TABLE `client_owner` (
  `id` int(10) UNSIGNED NOT NULL,
  `animal_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` varchar(128) NOT NULL,
  `phone_1` int(16) UNSIGNED NOT NULL,
  `phone_2` int(16) UNSIGNED NOT NULL,
  `is_corp` tinyint(1) NOT NULL DEFAULT 0,
  `vet_asociated` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctors`
--

CREATE TABLE `doctors` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `specialty` varchar(64) NOT NULL DEFAULT 'general veterinarian',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor_has_patients`
--

CREATE TABLE `doctor_has_patients` (
  `id` int(10) UNSIGNED NOT NULL,
  `doctor_id` int(10) UNSIGNED NOT NULL,
  `animal_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `phone` int(16) NOT NULL,
  `address` varchar(128) NOT NULL,
  `charge` varchar(64) NOT NULL,
  `income` int(32) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `local`
--

CREATE TABLE `local` (
  `id` int(11) NOT NULL,
  `chief_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(64) NOT NULL DEFAULT 'general veterinary medicine',
  `location` point NOT NULL,
  `address` varchar(128) NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `local_has_product`
--

CREATE TABLE `local_has_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `local_id` int(11) NOT NULL,
  `stock_per_local` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medical_history`
--

CREATE TABLE `medical_history` (
  `name` varchar(32) NOT NULL,
  `age` float NOT NULL,
  `sex` varchar(16) NOT NULL,
  `specie` varchar(16) NOT NULL,
  `breeds` varchar(32) DEFAULT NULL,
  `size` varchar(16) NOT NULL,
  `weight` decimal(4,0) NOT NULL,
  `has_been_operated` tinyint(1) DEFAULT 0,
  `surgeries` varchar(255) NOT NULL,
  `castrated` tinyint(1) DEFAULT 0,
  `head_doc_id` int(10) UNSIGNED NOT NULL,
  `med_conditions` text NOT NULL,
  `history` text NOT NULL,
  `has_been_abused` tinyint(1) DEFAULT NULL,
  `suspected_abuse` tinyint(1) NOT NULL,
  `dangerous` tinyint(1) NOT NULL DEFAULT 0,
  `danger` text NOT NULL DEFAULT 'not dangerous',
  `lived_on_streets` tinyint(1) NOT NULL,
  `been_in_shelter` tinyint(1) NOT NULL,
  `food_they_eat` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `price` decimal(10,0) UNSIGNED NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `discount_member` decimal(3,0) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `needs_prescription` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `veterinary`
--

CREATE TABLE `veterinary` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `adress` varchar(128) NOT NULL,
  `responsable` varchar(32) NOT NULL,
  `type_and_function` int(11) NOT NULL,
  `location` point NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `veterinary_has_employees`
--

CREATE TABLE `veterinary_has_employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `veterinary_id` int(10) UNSIGNED NOT NULL,
  `local_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_id` (`owner_id`),
  ADD KEY `medical_history` (`medical_history`),
  ADD KEY `name` (`name`),
  ADD KEY `name_2` (`name`);

--
-- Indices de la tabla `client_has_animals`
--
ALTER TABLE `client_has_animals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_id` (`owner_id`),
  ADD KEY `animal_id` (`animal_id`);

--
-- Indices de la tabla `client_owner`
--
ALTER TABLE `client_owner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `animal_id` (`animal_id`),
  ADD KEY `vet_asociated` (`vet_asociated`);

--
-- Indices de la tabla `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indices de la tabla `doctor_has_patients`
--
ALTER TABLE `doctor_has_patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_has_patients_ibfk_1` (`doctor_id`),
  ADD KEY `animal_id` (`animal_id`);

--
-- Indices de la tabla `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indices de la tabla `local`
--
ALTER TABLE `local`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `chief_id` (`chief_id`);

--
-- Indices de la tabla `local_has_product`
--
ALTER TABLE `local_has_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `local_id` (`local_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `medical_history`
--
ALTER TABLE `medical_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `veterinary`
--
ALTER TABLE `veterinary`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `veterinary_has_employees`
--
ALTER TABLE `veterinary_has_employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `veterinary_id` (`veterinary_id`),
  ADD KEY `local_id` (`local_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `client_has_animals`
--
ALTER TABLE `client_has_animals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `client_owner`
--
ALTER TABLE `client_owner`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `doctor_has_patients`
--
ALTER TABLE `doctor_has_patients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `local`
--
ALTER TABLE `local`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `local_has_product`
--
ALTER TABLE `local_has_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `veterinary_has_employees`
--
ALTER TABLE `veterinary_has_employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `animals`
--
ALTER TABLE `animals`
  ADD CONSTRAINT `animals_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `client_has_animals` (`owner_id`),
  ADD CONSTRAINT `animals_ibfk_2` FOREIGN KEY (`id`) REFERENCES `client_has_animals` (`animal_id`);

--
-- Filtros para la tabla `client_has_animals`
--
ALTER TABLE `client_has_animals`
  ADD CONSTRAINT `client_has_animals_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `client_owner` (`id`);

--
-- Filtros para la tabla `client_owner`
--
ALTER TABLE `client_owner`
  ADD CONSTRAINT `client_owner_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `client_has_animals` (`animal_id`),
  ADD CONSTRAINT `client_owner_ibfk_2` FOREIGN KEY (`vet_asociated`) REFERENCES `veterinary` (`id`);

--
-- Filtros para la tabla `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Filtros para la tabla `doctor_has_patients`
--
ALTER TABLE `doctor_has_patients`
  ADD CONSTRAINT `doctor_has_patients_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `doctor_has_patients_ibfk_2` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`id`);

--
-- Filtros para la tabla `local`
--
ALTER TABLE `local`
  ADD CONSTRAINT `local_ibfk_1` FOREIGN KEY (`chief_id`) REFERENCES `employees` (`id`);

--
-- Filtros para la tabla `local_has_product`
--
ALTER TABLE `local_has_product`
  ADD CONSTRAINT `local_has_product_ibfk_1` FOREIGN KEY (`local_id`) REFERENCES `local` (`id`),
  ADD CONSTRAINT `local_has_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `medical_history`
--
ALTER TABLE `medical_history`
  ADD CONSTRAINT `medical_history_ibfk_1` FOREIGN KEY (`name`) REFERENCES `animals` (`name`);

--
-- Filtros para la tabla `veterinary_has_employees`
--
ALTER TABLE `veterinary_has_employees`
  ADD CONSTRAINT `veterinary_has_employees_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `veterinary_has_employees_ibfk_2` FOREIGN KEY (`veterinary_id`) REFERENCES `veterinary` (`id`),
  ADD CONSTRAINT `veterinary_has_employees_ibfk_3` FOREIGN KEY (`local_id`) REFERENCES `local` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
