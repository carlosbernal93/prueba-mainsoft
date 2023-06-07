-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.11-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para prueba_mainsoft
CREATE DATABASE IF NOT EXISTS `prueba_mainsoft` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `prueba_mainsoft`;

-- Volcando estructura para tabla prueba_mainsoft.ciudades
CREATE TABLE IF NOT EXISTS `ciudades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitud` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitud` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla prueba_mainsoft.ciudades: ~2 rows (aproximadamente)
INSERT INTO `ciudades` (`id`, `nombre`, `latitud`, `longitud`, `created_at`, `updated_at`) VALUES
	(1, 'Miami', '25.7741728', '-80.19362', NULL, NULL),
	(2, 'Orlando', '28.5421109', '-81.3790304', NULL, NULL),
	(3, 'New York', '40.7127281', '-74.0060152', NULL, NULL);

-- Volcando estructura para tabla prueba_mainsoft.historial_ciudades
CREATE TABLE IF NOT EXISTS `historial_ciudades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ciudad_id` int(11) NOT NULL,
  `humedad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dia` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla prueba_mainsoft.historial_ciudades: ~22 rows (aproximadamente)
INSERT INTO `historial_ciudades` (`id`, `ciudad_id`, `humedad`, `dia`, `created_at`, `updated_at`) VALUES
	(1, 1, '91', '2023-06-07 06:15:53', '2023-06-07 11:15:53', '2023-06-07 11:15:53'),
	(2, 2, '83', '2023-06-07 06:15:53', '2023-06-07 11:15:53', '2023-06-07 11:15:53'),
	(3, 3, '55', '2023-06-07 06:15:53', '2023-06-07 11:15:53', '2023-06-07 11:15:53'),
	(4, 1, '91', '2023-06-07 06:28:31', '2023-06-07 11:28:31', '2023-06-07 11:28:31'),
	(5, 2, '84', '2023-06-07 06:28:31', '2023-06-07 11:28:31', '2023-06-07 11:28:31'),
	(6, 3, '56', '2023-06-07 06:28:31', '2023-06-07 11:28:31', '2023-06-07 11:28:31'),
	(55, 1, '90', '2023-06-07 06:59:36', '2023-06-07 11:59:36', '2023-06-07 11:59:36'),
	(56, 2, '86', '2023-06-07 06:59:36', '2023-06-07 11:59:36', '2023-06-07 11:59:36'),
	(57, 3, '58', '2023-06-07 06:59:36', '2023-06-07 11:59:36', '2023-06-07 11:59:36'),
	(58, 1, '90', '2023-06-07 07:00:33', '2023-06-07 12:00:33', '2023-06-07 12:00:33'),
	(59, 2, '86', '2023-06-07 07:00:33', '2023-06-07 12:00:33', '2023-06-07 12:00:33'),
	(60, 3, '58', '2023-06-07 07:00:33', '2023-06-07 12:00:33', '2023-06-07 12:00:33'),
	(61, 1, '90', '2023-06-07 07:11:18', '2023-06-07 12:11:18', '2023-06-07 12:11:18'),
	(62, 2, '86', '2023-06-07 07:11:18', '2023-06-07 12:11:18', '2023-06-07 12:11:18'),
	(63, 3, '58', '2023-06-07 07:11:18', '2023-06-07 12:11:18', '2023-06-07 12:11:18'),
	(64, 1, '90', '2023-06-07 07:12:14', '2023-06-07 12:12:14', '2023-06-07 12:12:14'),
	(65, 2, '86', '2023-06-07 07:12:14', '2023-06-07 12:12:14', '2023-06-07 12:12:14'),
	(66, 3, '58', '2023-06-07 07:12:14', '2023-06-07 12:12:14', '2023-06-07 12:12:14'),
	(67, 1, '91', '2023-06-07 07:15:23', '2023-06-07 12:15:23', '2023-06-07 12:15:23'),
	(68, 2, '86', '2023-06-07 07:15:23', '2023-06-07 12:15:23', '2023-06-07 12:15:23'),
	(69, 3, '57', '2023-06-07 07:15:23', '2023-06-07 12:15:23', '2023-06-07 12:15:23'),
	(70, 1, '91', '2023-06-07 07:15:52', '2023-06-07 12:15:52', '2023-06-07 12:15:52'),
	(71, 2, '86', '2023-06-07 07:15:53', '2023-06-07 12:15:53', '2023-06-07 12:15:53'),
	(72, 3, '57', '2023-06-07 07:15:53', '2023-06-07 12:15:53', '2023-06-07 12:15:53'),
	(73, 1, '74', '2023-06-07 14:07:00', '2023-06-07 19:07:00', '2023-06-07 19:07:00'),
	(74, 2, '76', '2023-06-07 14:07:00', '2023-06-07 19:07:00', '2023-06-07 19:07:00'),
	(75, 3, '51', '2023-06-07 14:07:00', '2023-06-07 19:07:00', '2023-06-07 19:07:00');

-- Volcando estructura para tabla prueba_mainsoft.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla prueba_mainsoft.migrations: ~0 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2023_06_07_021909_create_table_ciudades', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
