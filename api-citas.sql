-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 01, 2020 at 09:16 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api-citas`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_conf_confirmacion_servicio`
--

CREATE TABLE `app_conf_confirmacion_servicio` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_local_servicio` int(11) DEFAULT NULL,
  `id_periodo` int(11) DEFAULT NULL,
  `id_tiempo_desde` int(11) DEFAULT NULL,
  `id_tiempo_hasta` int(11) DEFAULT NULL,
  `id_tiempo_cancelacion` int(11) DEFAULT NULL,
  `tiempo_ultimo_aviso` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_conf_prereserva`
--

CREATE TABLE `app_conf_prereserva` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_entidad` int(11) NOT NULL,
  `id_local` int(11) NOT NULL,
  `id_local_servicio` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_conf_prereserva`
--

INSERT INTO `app_conf_prereserva` (`id`, `id_entidad`, `id_local`, `id_local_servicio`, `tiempo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 2, 2, 120, '2020-09-01 20:25:00', '2020-09-01 20:28:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_actividades`
--

CREATE TABLE `app_dat_actividades` (
  `id` int(10) UNSIGNED NOT NULL,
  `denominacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_dat_actividades`
--

INSERT INTO `app_dat_actividades` (`id`, `denominacion`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Cita', 'aquellos servicios que se prestan con un caracter sistematico. ejemplo turnos para el servicio de pe…', '2020-07-07 23:39:52', '2020-07-07 23:39:52', NULL),
(2, 'Restaurante', 'servicios del tipo restaurante para la reservacion de mesas y cantidad de personas etc. tambien pued…', '2020-07-07 23:39:52', '2020-07-07 23:39:52', NULL),
(3, 'Alojamiento', 'Servicios del corte de alojamiento y otros asociados a el principal.', '2020-07-07 23:39:52', '2020-07-07 23:39:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_agenda`
--

CREATE TABLE `app_dat_agenda` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_recurso_servicio` int(11) DEFAULT NULL,
  `fecha_inicio_cita` timestamp NULL DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `fecha_fin_cita` timestamp NULL DEFAULT NULL,
  `id_usuario_wso2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `id_nom_categoria_uso` int(11) DEFAULT NULL,
  `id_dat_plan_agenda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_dat_agenda`
--

INSERT INTO `app_dat_agenda` (`id`, `id_recurso_servicio`, `fecha_inicio_cita`, `id_cliente`, `fecha_fin_cita`, `id_usuario_wso2`, `created_at`, `updated_at`, `deleted_at`, `id_nom_categoria_uso`, `id_dat_plan_agenda`) VALUES
(315, NULL, NULL, 80, NULL, 'jesusd0897@gmail.com', '2020-07-07 23:43:00', '2020-07-09 23:04:43', NULL, NULL, NULL),
(321, NULL, NULL, 86, NULL, 'jesusd0897@gmail.com', '2020-07-08 21:28:57', '2020-07-08 21:28:57', NULL, NULL, NULL),
(322, NULL, NULL, 87, NULL, 'jesusd0897@gmail.com', '2020-07-08 23:46:28', '2020-07-08 23:46:28', NULL, NULL, NULL),
(326, NULL, NULL, 91, NULL, 'jesusd0897@gmail.com', '2020-07-08 22:37:00', '2020-07-09 23:05:23', NULL, NULL, NULL),
(327, NULL, NULL, 92, NULL, 'jesusd0897@gmail.com', '2020-07-08 23:00:00', '2020-07-09 23:05:11', NULL, NULL, NULL),
(331, NULL, NULL, 96, NULL, 'jesusd0897@gmail.com', '2020-07-09 14:21:51', '2020-07-09 14:21:51', NULL, NULL, NULL),
(337, NULL, NULL, 102, NULL, 'ylbg@nauta.cu', '2020-07-10 04:15:52', '2020-07-10 04:15:52', NULL, NULL, NULL),
(340, NULL, NULL, 105, NULL, 'jesusd0897@gmail.com', '2020-07-10 21:39:23', '2020-07-10 21:39:23', NULL, NULL, NULL),
(341, NULL, NULL, 106, NULL, 'jvelazquez@xetid.cu', '2020-07-11 02:30:56', '2020-07-11 02:30:56', NULL, NULL, NULL),
(342, NULL, NULL, 107, NULL, 'jesusd0897@gmail.com', '2020-07-12 05:44:06', '2020-07-12 05:44:06', NULL, NULL, NULL),
(350, NULL, NULL, 115, NULL, 'ymejias@dppfvc.co.cu', '2020-07-16 03:16:13', '2020-07-16 03:16:13', NULL, NULL, NULL),
(351, NULL, NULL, 116, NULL, 'jesusd0897@gmail.com', '2020-07-16 05:56:20', '2020-07-16 05:56:20', NULL, NULL, NULL),
(354, NULL, NULL, 119, NULL, 'jvelazquez@xetid.cu', '2020-07-22 09:34:08', '2020-07-22 09:34:08', NULL, NULL, NULL),
(355, NULL, NULL, 120, NULL, 'jesusd0897@gmail.com', '2020-08-05 12:51:45', '2020-08-05 12:51:45', NULL, NULL, NULL),
(360, NULL, NULL, 125, NULL, 'ygonzalezp@uclv.cu', '2020-08-05 16:00:04', '2020-08-05 16:00:04', NULL, NULL, NULL),
(361, NULL, NULL, 126, NULL, 'jvelazquez@xetid.cu', '2020-08-06 02:15:22', '2020-08-06 02:15:22', NULL, NULL, NULL),
(362, NULL, NULL, 127, NULL, 'yosney@xetid.cu', '2020-08-06 14:19:44', '2020-08-06 14:19:44', NULL, NULL, NULL),
(364, NULL, NULL, 129, NULL, 'fernandojose@xetid.cu', '2020-08-06 14:56:33', '2020-08-06 14:56:33', NULL, NULL, NULL),
(365, NULL, NULL, 130, NULL, 'Ygonzalezp@uclv.cu', '2020-08-06 15:04:36', '2020-08-06 15:04:36', NULL, NULL, NULL),
(368, NULL, NULL, 133, NULL, 'ygonzalezp@uclv.cu', '2020-08-06 20:16:22', '2020-08-06 20:16:22', NULL, NULL, NULL),
(369, NULL, NULL, 134, NULL, 'ygonzalezp@uclv.cu', '2020-08-06 20:29:28', '2020-08-06 20:29:28', NULL, NULL, NULL),
(370, NULL, NULL, 135, NULL, 'ygonzalezp@uclv.cu', '2020-08-07 19:50:43', '2020-08-07 19:50:43', NULL, NULL, NULL),
(371, NULL, NULL, 136, NULL, 'yosney@xetid.cu', '2020-08-07 21:22:23', '2020-08-07 21:22:23', NULL, NULL, NULL),
(374, NULL, NULL, 139, NULL, 'jesusd0897@gmail.com', '2020-08-08 20:29:45', '2020-08-08 20:29:45', NULL, NULL, NULL),
(375, NULL, NULL, 140, NULL, 'fernandojose@xetid.cu', '2020-08-11 11:11:55', '2020-08-11 11:11:55', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_agenda_cambiada`
--

CREATE TABLE `app_dat_agenda_cambiada` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_agenda` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `fecha_inicio_cita` timestamp NULL DEFAULT NULL,
  `fecha_inicio_cita_old` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_agenda_interrupcion`
--

CREATE TABLE `app_dat_agenda_interrupcion` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_agenda` int(11) DEFAULT NULL,
  `id_interrupcion` int(11) DEFAULT NULL,
  `notificacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_agenda_prioridad`
--

CREATE TABLE `app_dat_agenda_prioridad` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_agenda_prioridad` int(11) DEFAULT NULL,
  `id_agenda` int(11) DEFAULT NULL,
  `id_prioridad` int(11) DEFAULT NULL,
  `fecha_cambio_estado` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_cliente`
--

CREATE TABLE `app_dat_cliente` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_dat_cliente`
--

INSERT INTO `app_dat_cliente` (`id`, `nombre`, `apellidos`, `ci`, `telefono`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES
(80, 'Fernando', 'Castellanos Borroto', '96060714801', '54590236', 'fernandojose@xetid.cu', '2020-07-07 23:43:36', '2020-07-07 23:43:36', NULL),
(81, 'sdghnesrthj', 'rdethertherthj', '35135131351', '31351351', 'dretfhdfhj@xcdfd.dfg', '2020-07-08 05:07:30', '2020-07-08 05:07:30', NULL),
(82, 'dtheswdthsdth', 'swdghsdh', '51561641686', '31315135', 'dsfhsdrrh@zsdxfgsg.ddf', '2020-07-08 05:12:47', '2020-07-08 05:12:47', NULL),
(83, 'swdghnewrthj', 'sdethwthweth', '64684136841', '56416135', 'dfthdsth@dgh.gfh', '2020-07-08 05:14:19', '2020-07-08 05:14:19', NULL),
(84, 'asdrvfgasfbg', 'asfbasfb', '35153131353', '36413135', 'sdrfgh@xdfsgsg.sdg', '2020-07-08 05:34:14', '2020-07-08 05:34:14', NULL),
(85, 'sdrfghadreshg', 'sdfbhawdfsh', '64181686843', '35641313', 'sdrfghsdhg@xsfgsrg.sdgf', '2020-07-08 05:39:13', '2020-07-08 05:39:13', NULL),
(86, 'egfhkjrtu', 'reyhewrthwertyh', '65163138136', '35135135', 'dftgh@drfhdsrh.frtg', '2020-07-08 21:28:57', '2020-07-08 21:28:57', NULL),
(87, 'srthewth', 'sewthweth', '16846846464', '56416163', 'xdfthsd@DSF.DF', '2020-07-08 23:46:28', '2020-07-08 23:46:28', NULL),
(88, 'ERTHSDTH', 'SDGHSDH', '56846841641', '64163163', 'DTHS@DFH.DRT', '2020-07-08 23:48:15', '2020-07-08 23:48:15', NULL),
(89, 'erthewrth', 'wtehwrhwh', '23423523523', '23423423', 'sdfbhsdh@drfh.fg', '2020-07-09 02:59:59', '2020-07-09 02:59:59', NULL),
(90, 'sdghdfgjd', 'fgjhdefghdfgh', '13213213213', '13213213', 'sdfhsdh@sdfgsg.fg', '2020-07-09 03:15:58', '2020-07-09 03:15:58', NULL),
(91, 'Fernando', 'Castellanos Borroto', '96060714801', '54590236', 'fernandojose@xetid.cu', '2020-07-08 22:37:42', '2020-07-08 22:37:42', NULL),
(92, 'Fernando', 'Castellanos Borroto', '96060714801', '54590236', 'fernandojose@xetid.cu', '2020-07-08 23:00:12', '2020-07-08 23:00:12', NULL),
(93, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-07-09 04:29:54', '2020-07-09 04:29:54', NULL),
(94, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-07-09 04:39:05', '2020-07-09 04:39:05', NULL),
(95, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-07-09 04:46:23', '2020-07-09 04:46:23', NULL),
(96, 'Jesús Daniel', 'Saura', '97082610763', '53699424', 'jesusd0897@gmail.com', '2020-07-09 14:21:51', '2020-07-09 14:21:51', NULL),
(97, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-07-09 22:03:44', '2020-07-09 22:03:44', NULL),
(98, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-07-10 00:14:33', '2020-07-10 00:14:33', NULL),
(99, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-07-10 00:20:10', '2020-07-10 00:20:10', NULL),
(100, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-07-10 00:20:32', '2020-07-10 00:20:32', NULL),
(101, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-07-10 00:29:13', '2020-07-10 00:29:13', NULL),
(102, 'Yeralys', 'Li', '12346597087', '58510523', 'ylbg@nauta.cu', '2020-07-10 04:15:52', '2020-07-10 04:15:52', NULL),
(103, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-07-10 04:26:09', '2020-07-10 04:26:09', NULL),
(104, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-07-10 04:55:31', '2020-07-10 04:55:31', NULL),
(105, 'Jesús Daniel', 'Saura', '97082610763', '53699424', 'jesusd0897@gmail.com', '2020-07-10 21:39:23', '2020-07-10 21:39:23', NULL),
(106, 'Jandro', 'Velazquez Hernandez', '90010232384', '52152847', 'jvelazquez@xetid.cu', '2020-07-11 02:30:56', '2020-07-11 02:30:56', NULL),
(107, 'Jesús D', 'Saura Díaz', '97082610763', '53699424', 'jesusd0897@gmail.com', '2020-07-12 05:44:06', '2020-07-12 05:44:06', NULL),
(108, 'Jesús D', 'Saura Díaz', '97082610763', '53699424', 'jesusd0897@gmail.com', '2020-07-12 12:31:23', '2020-07-12 12:31:23', NULL),
(109, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-07-13 22:39:25', '2020-07-13 22:39:25', NULL),
(110, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-07-13 22:43:36', '2020-07-13 22:43:36', NULL),
(111, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-07-13 22:51:36', '2020-07-13 22:51:36', NULL),
(112, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-07-13 23:15:44', '2020-07-13 23:15:44', NULL),
(113, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-07-14 23:16:22', '2020-07-14 23:16:22', NULL),
(114, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-07-15 23:29:50', '2020-07-15 23:29:50', NULL),
(115, 'Yunelkys', 'Mejias Chacón', '71021715314', '52158115', 'ymejias@dppfvc.co.cu', '2020-07-16 03:16:13', '2020-07-16 03:16:13', NULL),
(116, 'Jesús D', 'Saura Díaz', '97082610763', '53699424', 'jesusd0897@gmail.com', '2020-07-16 05:56:20', '2020-07-16 05:56:20', NULL),
(117, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-07-21 23:27:02', '2020-07-21 23:27:02', NULL),
(118, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-07-21 23:43:25', '2020-07-21 23:43:25', NULL),
(119, 'Jandro', 'Velazquez Hernandez', '90010232384', '52152847', 'jvelazquez@xetid.cu', '2020-07-22 09:34:08', '2020-07-22 09:34:08', NULL),
(120, 'Jesús Daniel', 'Saura Díaz', '97082610763', '53699424', 'jesusd0897@gmail.com', '2020-08-05 12:51:45', '2020-08-05 12:51:45', NULL),
(121, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-08-05 13:12:44', '2020-08-05 13:12:44', NULL),
(122, 'Fernando', 'Castellanos Borroto', '96060714801', '54590236', 'fernandojose@xetid.cu', '2020-08-05 16:42:34', '2020-08-05 16:42:34', NULL),
(123, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-08-05 14:02:24', '2020-08-05 14:02:24', NULL),
(124, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-08-05 14:59:26', '2020-08-05 14:59:26', NULL),
(125, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-08-05 16:00:04', '2020-08-05 16:00:04', NULL),
(126, 'Jandro', 'Velazquez Hernandez', '90010232384', '52152847', 'jvelazquez@xetid.cu', '2020-08-06 02:15:22', '2020-08-06 02:15:22', NULL),
(127, 'Yosney', 'Hernández Hernández', '83100709965', '52149951', 'yosney@xetid.cu', '2020-08-06 14:19:44', '2020-08-06 14:19:44', NULL),
(128, 'Jesús D.', 'Saura Díaz', '97082610763', '53699424', 'jesusd0897@gmail.com', '2020-08-06 14:21:26', '2020-08-06 14:21:26', NULL),
(129, 'Fernando', 'Castellanos Borroto', '96060714801', '54590236', 'fernandojose@xetid.cu', '2020-08-06 14:56:33', '2020-08-06 14:56:33', NULL),
(130, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-08-06 15:04:36', '2020-08-06 15:04:36', NULL),
(131, 'Jesús D.', 'Saura Díaz', '97082610763', '53699424', 'jesusd0897@gmail.com', '2020-08-06 16:20:03', '2020-08-06 16:20:03', NULL),
(132, 'Jesús D.', 'Saura Díaz', '97082610763', '53699424', 'jesusd0897@gmail.com', '2020-08-06 16:22:57', '2020-08-06 16:22:57', NULL),
(133, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-08-06 20:16:22', '2020-08-06 20:16:22', NULL),
(134, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-08-06 20:29:28', '2020-08-06 20:29:28', NULL),
(135, 'Yoelvis', 'Gonzalez Pérez', '92121234063', '53765120', 'ygonzalezp@uclv.cu', '2020-08-07 19:50:43', '2020-08-07 19:50:43', NULL),
(136, 'Yosney', 'Hernández Hernández', '83100709965', '52149951', 'yosney@xetid.cu', '2020-08-07 21:22:23', '2020-08-07 21:22:23', NULL),
(137, 'Jesús D.', 'Saura Díaz', '97082610763', '53699424', 'jesusd0897@gmail.com', '2020-08-08 16:41:39', '2020-08-08 16:41:39', NULL),
(138, 'Jesús D.', 'Saura Díaz', '97082610763', '53699424', 'jesusd0897@gmail.com', '2020-08-08 16:44:26', '2020-08-08 16:44:26', NULL),
(139, 'Jesús D.', 'Saura Díaz', '97082610763', '53699424', 'jesusd0897@gmail.com', '2020-08-08 20:29:45', '2020-08-08 20:29:45', NULL),
(140, 'Fernando', 'Castellanos Borroto', '96060714801', '54590236', 'fernandojose@xetid.cu', '2020-08-11 11:11:55', '2020-08-11 11:11:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_distribucion_recursos`
--

CREATE TABLE `app_dat_distribucion_recursos` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_recurso_servicio` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_distribucion_turnos`
--

CREATE TABLE `app_dat_distribucion_turnos` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_turno_servicio` int(11) DEFAULT NULL,
  `id_prioridad` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `id_nom_categoria_uso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_entidades`
--

CREATE TABLE `app_dat_entidades` (
  `id` int(10) UNSIGNED NOT NULL,
  `denominacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_dpa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_organismo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_nom_branch_sector` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_dat_entidades`
--

INSERT INTO `app_dat_entidades` (`id`, `denominacion`, `telefono`, `email`, `direccion`, `id_dpa`, `id_organismo`, `id_nom_branch_sector`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Dirección Municipal de Planificación Física Santa Clara', '34534534', 'entidad1@citas.cu', 'Direccion 1', '1', '1', '1', '2020-07-07 23:39:00', '2020-08-11 14:54:50', NULL),
(2, 'Dirección Municipal de Planificación Física 2', '3453452334', 'entidad2@citas.cu', 'Direccion 2', '1', '1', '1', '2020-07-07 23:39:00', '2020-08-11 14:55:20', NULL),
(3, 'Empresa de restaurante y Recreación de santa Clara', '42205448', 'recreacion@gcomvc.cu', 'Calle Maceo Esq. Juaquín', '1', '2', '3', '2020-08-11 14:57:32', '2020-08-11 14:57:32', '2021-01-31 16:54:00');

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_entidades_categorias`
--

CREATE TABLE `app_dat_entidades_categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_entidad` int(11) NOT NULL,
  `id_nom_categoria_uso` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_dat_entidades_categorias`
--

INSERT INTO `app_dat_entidades_categorias` (`id`, `id_entidad`, `id_nom_categoria_uso`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2020-07-07 23:39:51', '2020-07-07 23:39:51', NULL),
(2, 2, 2, '2020-07-07 23:39:51', '2020-07-07 23:39:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_interrupciones`
--

CREATE TABLE `app_dat_interrupciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_recurso_servicio` int(11) DEFAULT NULL,
  `id_turno_servicio` int(11) DEFAULT NULL,
  `id_motivo_interrupcion` int(11) DEFAULT NULL,
  `fecha_desde` timestamp NULL DEFAULT NULL,
  `fecha_hasta` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_dat_interrupciones`
--

INSERT INTO `app_dat_interrupciones` (`id`, `id_recurso_servicio`, `id_turno_servicio`, `id_motivo_interrupcion`, `fecha_desde`, `fecha_hasta`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 1, 1, '2020-06-12 10:05:00', '2020-06-23 10:05:00', '2020-06-12 22:26:17', '2020-07-08 03:03:28', '2020-07-08 03:03:28');

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_locales`
--

CREATE TABLE `app_dat_locales` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_entidad` int(11) NOT NULL,
  `denominacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_dpa` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `latitud` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitud` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruta_imagen_vista_previa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruta_imagen_principal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruta_imagen_secundaria` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_dat_locales`
--

INSERT INTO `app_dat_locales` (`id`, `id_entidad`, `denominacion`, `id_dpa`, `email`, `direccion`, `telefono`, `created_at`, `updated_at`, `deleted_at`, `latitud`, `longitud`, `descripcion`, `ruta_imagen_vista_previa`, `ruta_imagen_principal`, `ruta_imagen_secundaria`) VALUES
(1, 1, 'Oficina de Trámites 1', 92946, 'local11@citas.cu', 'Calle Leoncio Vidal No 2342 e/ Ave. Maceo y Ave. Colón', '3423123124', '2020-07-07 23:39:00', '2020-08-11 15:03:22', NULL, '', '', '', '', '', ''),
(2, 2, 'Oficina de Trámites 2', 92946, 'local12@citas.cu', 'Calle Cuba No. 10879 e/ 4ta y 6ta', '34231224', '2020-07-07 23:39:00', '2020-08-11 15:06:55', NULL, '', '', '', '', '', ''),
(3, 1, 'Centro Recreativo Somos Jóvenes', 92946, 'somosjovenes@gecomvc.cu', 'Avenida Liberación No. 2343', '42203265', '2020-07-11 15:36:00', '2020-08-11 15:56:24', NULL, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_locales_servicios`
--

CREATE TABLE `app_dat_locales_servicios` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_local` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `confirmacion` int(11) NOT NULL,
  `precio` decimal(8,2) NOT NULL,
  `dias_de_publicacion` int(11) NOT NULL,
  `dias_de_planificacion` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_dat_locales_servicios`
--

INSERT INTO `app_dat_locales_servicios` (`id`, `id_local`, `id_servicio`, `confirmacion`, `precio`, `dias_de_publicacion`, `dias_de_planificacion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, '32.00', 3, 5, '2020-07-07 23:39:50', '2020-07-07 23:39:50', NULL),
(2, 2, 2, 1, '32.00', 3, 5, '2020-07-07 23:39:50', '2020-07-07 23:39:50', NULL),
(3, 3, 3, 1, '5.00', 7, 10, '2020-08-11 15:46:08', '2020-08-11 15:46:08', NULL),
(4, 3, 4, 1, '5.00', 7, 10, '2020-08-11 15:46:46', '2020-08-11 15:46:46', NULL),
(5, 3, 5, 1, '5.00', 7, 10, '2020-08-11 15:47:16', '2020-08-11 15:47:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_plan_agenda`
--

CREATE TABLE `app_dat_plan_agenda` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_dat_plan_servicio` int(11) DEFAULT NULL,
  `id_dat_agenda` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `id_recurso_servicio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_dat_plan_agenda`
--

INSERT INTO `app_dat_plan_agenda` (`id`, `id_dat_plan_servicio`, `id_dat_agenda`, `created_at`, `updated_at`, `deleted_at`, `id_recurso_servicio`) VALUES
(251, 73, 314, '2020-07-07 20:30:40', '2020-07-08 03:05:29', '2020-07-08 03:05:29', 1),
(252, 80, 315, '2020-07-07 23:43:36', '2020-07-07 23:43:36', NULL, 1),
(253, 80, 316, '2020-07-08 05:07:30', '2020-07-08 05:07:30', NULL, 1),
(254, 81, 317, '2020-07-08 05:12:47', '2020-07-08 05:12:47', NULL, 2),
(255, 80, 318, '2020-07-08 05:14:19', '2020-07-08 05:14:19', NULL, 1),
(256, 80, 319, '2020-07-08 05:34:15', '2020-07-08 05:34:15', NULL, 1),
(257, 80, 320, '2020-07-08 05:39:13', '2020-07-08 05:39:13', NULL, 1),
(258, 80, 321, '2020-07-08 21:28:57', '2020-07-08 21:28:57', NULL, 1),
(259, 80, 322, '2020-07-08 23:46:28', '2020-07-08 23:46:28', NULL, 1),
(260, 80, 323, '2020-07-08 23:48:15', '2020-07-08 23:48:15', NULL, 1),
(261, 80, 324, '2020-07-09 02:59:59', '2020-07-09 02:59:59', NULL, 1),
(262, 80, 325, '2020-07-09 03:15:58', '2020-07-09 03:15:58', NULL, 1),
(263, 80, 326, '2020-07-08 22:37:42', '2020-07-08 22:37:42', NULL, 1),
(264, 80, 327, '2020-07-08 23:00:12', '2020-07-08 23:00:12', NULL, 1),
(265, 80, 328, '2020-07-09 04:29:54', '2020-07-09 04:29:54', NULL, 1),
(266, 80, 329, '2020-07-09 04:39:05', '2020-07-09 04:39:05', NULL, 1),
(267, 80, 330, '2020-07-09 04:46:23', '2020-07-09 04:46:23', NULL, 1),
(268, 81, 331, '2020-07-09 14:21:51', '2020-07-09 14:21:51', NULL, 2),
(269, 80, 332, '2020-07-09 22:03:44', '2020-07-09 22:03:44', NULL, 1),
(270, 82, 333, '2020-07-10 00:14:33', '2020-07-10 00:14:33', NULL, 1),
(271, 82, 334, '2020-07-10 00:20:10', '2020-07-10 00:20:10', NULL, 1),
(272, 82, 335, '2020-07-10 00:20:32', '2020-07-10 00:20:32', NULL, 1),
(273, 82, 336, '2020-07-10 00:29:13', '2020-07-10 00:29:13', NULL, 1),
(274, 83, 337, '2020-07-10 04:15:52', '2020-07-10 04:15:52', NULL, 2),
(275, 82, 338, '2020-07-10 04:26:09', '2020-07-10 04:26:09', NULL, 1),
(276, 82, 339, '2020-07-10 04:55:31', '2020-07-10 04:55:31', NULL, 1),
(277, 82, 340, '2020-07-10 21:39:23', '2020-07-10 21:39:23', NULL, 1),
(278, 83, 341, '2020-07-11 02:30:56', '2020-07-11 02:30:56', NULL, 2),
(279, 83, 342, '2020-07-12 05:44:06', '2020-07-12 05:44:06', NULL, 2),
(280, 83, 343, '2020-07-12 12:31:23', '2020-07-12 12:31:23', NULL, 2),
(281, 82, 344, '2020-07-13 22:39:25', '2020-07-13 22:39:25', NULL, 1),
(282, 82, 345, '2020-07-13 22:43:36', '2020-07-13 22:43:36', NULL, 1),
(283, 82, 346, '2020-07-13 22:51:36', '2020-07-13 22:51:36', NULL, 1),
(284, 82, 347, '2020-07-13 23:15:44', '2020-07-13 23:15:44', NULL, 1),
(285, 82, 348, '2020-07-14 23:16:22', '2020-07-14 23:16:22', NULL, 1),
(286, 94, 349, '2020-07-15 23:29:50', '2020-07-15 23:29:50', NULL, 1),
(287, 94, 350, '2020-07-16 03:16:13', '2020-07-16 03:16:13', NULL, 1),
(288, 94, 351, '2020-07-16 05:56:20', '2020-07-16 05:56:20', NULL, 1),
(289, 94, 352, '2020-07-21 23:27:02', '2020-07-21 23:27:02', NULL, 1),
(290, 94, 353, '2020-07-21 23:43:25', '2020-07-21 23:43:25', NULL, 1),
(291, 94, 354, '2020-07-22 09:34:08', '2020-07-22 09:34:08', NULL, 1),
(292, 139, 355, '2020-08-05 12:51:45', '2020-08-05 12:51:45', NULL, 2),
(293, 136, 356, '2020-08-05 13:12:44', '2020-08-05 13:12:44', NULL, 1),
(294, 136, 357, '2020-08-05 16:42:34', '2020-08-05 16:42:34', NULL, 1),
(295, 136, 358, '2020-08-05 14:02:24', '2020-08-05 14:02:24', NULL, 1),
(296, 136, 359, '2020-08-05 14:59:26', '2020-08-05 14:59:26', NULL, 1),
(297, 136, 360, '2020-08-05 16:00:04', '2020-08-05 16:00:04', NULL, 1),
(298, 138, 361, '2020-08-06 02:15:22', '2020-08-06 02:15:22', NULL, 1),
(299, 139, 362, '2020-08-06 14:19:44', '2020-08-06 14:19:44', NULL, 2),
(300, 136, 363, '2020-08-06 14:21:26', '2020-08-06 14:21:26', NULL, 1),
(301, 136, 364, '2020-08-06 14:56:33', '2020-08-06 14:56:33', NULL, 1),
(302, 136, 365, '2020-08-06 15:04:36', '2020-08-06 15:04:36', NULL, 1),
(303, 138, 366, '2020-08-06 16:20:03', '2020-08-06 16:20:03', NULL, 1),
(304, 139, 367, '2020-08-06 16:22:57', '2020-08-06 16:22:57', NULL, 2),
(305, 138, 368, '2020-08-06 20:16:22', '2020-08-06 20:16:22', NULL, 1),
(306, 138, 369, '2020-08-06 20:29:28', '2020-08-06 20:29:28', NULL, 1),
(307, 136, 370, '2020-08-07 19:50:43', '2020-08-07 19:50:43', NULL, 1),
(308, 136, 371, '2020-08-07 21:22:23', '2020-08-07 21:22:23', NULL, 1),
(309, 136, 372, '2020-08-08 16:41:39', '2020-08-08 16:41:39', NULL, 1),
(310, 139, 373, '2020-08-08 16:44:26', '2020-08-08 16:44:26', NULL, 2),
(311, 139, 374, '2020-08-08 20:29:45', '2020-08-08 20:29:45', NULL, 2),
(312, 150, 375, '2020-08-11 11:11:55', '2020-08-11 11:11:55', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_plan_prereserva`
--

CREATE TABLE `app_dat_plan_prereserva` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_dat_prereserva` int(11) NOT NULL,
  `id_dat_plan_servicios` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_plan_servicios`
--

CREATE TABLE `app_dat_plan_servicios` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_turno_servicio` int(11) DEFAULT NULL,
  `id_nom_categoria_uso` int(11) DEFAULT NULL,
  `fecha_reservacion` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `cantidad` int(11) DEFAULT 0,
  `publico` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_dat_plan_servicios`
--

INSERT INTO `app_dat_plan_servicios` (`id`, `id_turno_servicio`, `id_nom_categoria_uso`, `fecha_reservacion`, `created_at`, `updated_at`, `deleted_at`, `cantidad`, `publico`) VALUES
(57, 1, 1, '2020-06-17 00:00:00', '2020-06-12 18:07:05', '2020-06-12 23:28:54', '2020-06-12 23:28:54', 50, NULL),
(58, 1, 1, '2020-06-17 00:00:00', '2020-06-12 18:08:52', '2020-06-16 22:50:25', '2020-06-16 22:50:25', 50, NULL),
(59, 1, 1, '2020-06-21 00:00:00', '2020-06-16 23:09:57', '2020-06-16 23:41:59', '2020-06-16 23:41:59', 50, 1),
(60, 1, 1, '2020-06-21 00:00:00', '2020-06-16 23:46:00', '2020-06-17 00:12:33', '2020-06-17 00:12:33', 50, 1),
(61, 1, 1, '2020-06-22 00:00:00', '2020-06-17 00:03:51', '2020-06-17 00:12:33', '2020-06-17 00:12:33', 50, NULL),
(62, 1, 1, '2020-06-22 00:00:00', '2020-06-17 00:12:38', '2020-06-17 00:40:33', '2020-06-17 00:40:33', 50, 1),
(63, 1, 1, '2020-06-22 00:00:00', '2020-06-17 00:40:37', '2020-06-17 00:41:49', '2020-06-17 00:41:49', 50, 1),
(64, 1, 1, '2020-06-22 00:00:00', '2020-06-17 00:42:00', '2020-07-01 23:54:42', '2020-07-01 23:54:42', 50, 1),
(65, 1, 1, '2020-06-23 04:00:00', '2020-06-18 22:25:26', '2020-07-01 23:54:42', '2020-07-01 23:54:42', 50, NULL),
(66, 1, 1, '2020-07-13 13:17:00', '2020-06-23 17:18:00', '2020-07-01 23:54:42', '2020-07-01 23:54:42', 40, 1),
(67, 1, 1, '2020-07-11 11:21:00', '2020-06-26 23:42:59', '2020-07-01 23:54:42', '2020-07-01 23:54:42', 60, 1),
(68, 1, 1, '2020-08-05 11:21:00', '2020-06-26 23:43:00', '2020-07-01 23:54:42', '2020-07-01 23:54:42', 100, 1),
(69, 1, 1, '2020-08-08 11:22:00', '2020-06-26 23:43:36', '2020-07-01 23:54:42', '2020-07-01 23:54:42', 200, 1),
(70, 1, 1, '2020-07-06 00:00:00', '2020-07-01 23:34:02', '2020-07-01 23:54:42', '2020-07-01 23:54:42', 50, NULL),
(71, 1, 1, '2020-07-06 00:00:00', '2020-07-01 18:33:35', '2020-07-02 00:15:43', '2020-07-02 00:15:43', 50, NULL),
(72, 1, 1, '2020-07-07 00:00:00', '2020-07-02 00:00:00', '2020-07-08 03:05:16', '2020-07-08 03:05:16', 50, 1),
(73, 1, 1, '2020-07-08 00:00:00', '2020-07-03 00:00:00', '2020-07-08 03:05:16', '2020-07-08 03:05:16', 50, 1),
(74, 1, 1, '2020-07-09 00:00:00', '2020-07-04 00:00:01', '2020-07-08 03:05:16', '2020-07-08 03:05:16', 50, NULL),
(75, 1, 1, '2020-07-10 00:00:00', '2020-07-05 00:00:01', '2020-07-08 03:05:16', '2020-07-08 03:05:16', 50, NULL),
(76, 1, 1, '2020-07-11 00:00:00', '2020-07-06 00:00:02', '2020-07-08 03:05:16', '2020-07-08 03:05:16', 50, NULL),
(77, 1, 1, '2020-07-12 00:00:00', '2020-07-07 00:00:01', '2020-07-08 03:05:16', '2020-07-08 03:05:16', 50, NULL),
(78, 1, 1, '2020-07-13 00:00:00', '2020-07-08 00:00:01', '2020-07-08 03:05:16', '2020-07-08 03:05:16', 50, NULL),
(79, 4, 5, '2020-07-30 14:39:00', '2020-07-08 03:00:49', '2020-07-08 03:05:16', '2020-07-08 03:05:16', 54, 1),
(80, 1, 1, '2020-07-08 00:00:00', '2020-07-08 03:06:00', '2020-07-11 00:00:01', NULL, 50, 1),
(81, 2, 2, '2020-07-08 00:00:00', '2020-07-08 05:02:00', '2020-07-14 23:18:25', NULL, 35, 1),
(82, 1, 1, '2020-07-14 00:00:00', '2020-07-09 00:00:00', '2020-07-14 23:18:15', NULL, 35, 1),
(83, 2, 2, '2020-07-14 00:00:00', '2020-07-09 00:00:00', '2020-07-09 23:07:38', NULL, 35, 1),
(84, 1, 1, '2020-07-15 00:00:00', '2020-07-10 00:00:02', '2020-07-10 00:00:02', NULL, 35, NULL),
(85, 2, 2, '2020-07-15 00:00:00', '2020-07-10 00:00:02', '2020-07-10 00:00:02', NULL, 35, NULL),
(86, 1, 1, '2020-07-16 00:00:00', '2020-07-11 00:00:01', '2020-07-11 00:00:01', NULL, 35, NULL),
(87, 2, 2, '2020-07-16 00:00:00', '2020-07-11 00:00:01', '2020-07-11 00:00:01', NULL, 35, NULL),
(88, 1, 1, '2020-07-17 00:00:00', '2020-07-12 00:00:02', '2020-07-12 00:00:02', NULL, 35, NULL),
(89, 2, 2, '2020-07-17 00:00:00', '2020-07-12 00:00:02', '2020-07-12 00:00:02', NULL, 35, NULL),
(90, 1, 1, '2020-07-18 00:00:00', '2020-07-13 00:00:02', '2020-07-13 00:00:02', NULL, 35, NULL),
(91, 2, 2, '2020-07-18 00:00:00', '2020-07-13 00:00:02', '2020-07-13 00:00:02', NULL, 35, NULL),
(92, 1, 1, '2020-07-19 00:00:00', '2020-07-14 00:00:02', '2020-07-14 00:00:02', NULL, 35, NULL),
(93, 2, 2, '2020-07-19 00:00:00', '2020-07-14 00:00:02', '2020-07-14 00:00:02', NULL, 35, NULL),
(94, 1, 1, '2020-07-23 10:57:00', '2020-07-14 23:18:00', '2020-07-14 23:19:04', NULL, 50, 1),
(95, 2, 1, '2020-07-28 10:57:00', '2020-07-14 23:18:49', '2020-07-14 23:18:49', NULL, 40, 1),
(96, 1, 1, '2020-07-20 00:00:00', '2020-07-15 00:00:02', '2020-07-15 00:00:02', NULL, 35, NULL),
(97, 2, 2, '2020-07-20 00:00:00', '2020-07-15 00:00:02', '2020-07-15 00:00:02', NULL, 35, NULL),
(98, 1, 1, '2020-07-21 00:00:00', '2020-07-16 00:00:02', '2020-07-16 00:00:02', NULL, 35, NULL),
(99, 2, 2, '2020-07-21 00:00:00', '2020-07-16 00:00:02', '2020-07-16 00:00:02', NULL, 35, NULL),
(100, 1, 1, '2020-07-22 00:00:00', '2020-07-17 00:00:02', '2020-07-17 00:00:02', NULL, 35, NULL),
(101, 2, 2, '2020-07-22 00:00:00', '2020-07-17 00:00:02', '2020-07-17 00:00:02', NULL, 35, NULL),
(102, 1, 1, '2020-07-23 00:00:00', '2020-07-18 00:00:02', '2020-07-18 00:00:02', NULL, 35, NULL),
(103, 2, 2, '2020-07-23 00:00:00', '2020-07-18 00:00:02', '2020-07-18 00:00:02', NULL, 35, NULL),
(104, 1, 1, '2020-07-24 00:00:00', '2020-07-19 00:00:02', '2020-07-19 00:00:02', NULL, 35, NULL),
(105, 2, 2, '2020-07-24 00:00:00', '2020-07-19 00:00:02', '2020-07-19 00:00:02', NULL, 35, NULL),
(106, 1, 1, '2020-07-25 00:00:00', '2020-07-20 00:00:02', '2020-07-20 00:00:02', NULL, 35, NULL),
(107, 2, 2, '2020-07-25 00:00:00', '2020-07-20 00:00:02', '2020-07-20 00:00:02', NULL, 35, NULL),
(108, 1, 1, '2020-07-26 00:00:00', '2020-07-21 00:00:02', '2020-07-21 00:00:02', NULL, 35, NULL),
(109, 2, 2, '2020-07-26 00:00:00', '2020-07-21 00:00:02', '2020-07-21 00:00:02', NULL, 35, NULL),
(110, 1, 1, '2020-07-27 00:00:00', '2020-07-22 00:00:02', '2020-07-22 00:00:02', NULL, 35, NULL),
(111, 2, 2, '2020-07-27 00:00:00', '2020-07-22 00:00:02', '2020-07-22 00:00:02', NULL, 35, NULL),
(112, 1, 1, '2020-07-28 00:00:00', '2020-07-23 00:00:02', '2020-07-23 00:00:02', NULL, 35, NULL),
(113, 2, 2, '2020-07-28 00:00:00', '2020-07-23 00:00:02', '2020-07-23 00:00:02', NULL, 35, NULL),
(114, 1, 1, '2020-07-29 00:00:00', '2020-07-24 00:00:02', '2020-07-24 00:00:02', NULL, 35, NULL),
(115, 2, 2, '2020-07-29 00:00:00', '2020-07-24 00:00:02', '2020-07-24 00:00:02', NULL, 35, NULL),
(116, 1, 1, '2020-07-30 00:00:00', '2020-07-25 00:00:01', '2020-07-25 00:00:01', NULL, 35, NULL),
(117, 2, 2, '2020-07-30 00:00:00', '2020-07-25 00:00:01', '2020-07-25 00:00:01', NULL, 35, NULL),
(118, 1, 1, '2020-07-31 00:00:00', '2020-07-26 00:00:02', '2020-07-26 00:00:02', NULL, 35, NULL),
(119, 2, 2, '2020-07-31 00:00:00', '2020-07-26 00:00:02', '2020-07-26 00:00:02', NULL, 35, NULL),
(120, 1, 1, '2020-08-01 00:00:00', '2020-07-27 00:00:01', '2020-07-27 00:00:01', NULL, 35, NULL),
(121, 2, 2, '2020-08-01 00:00:00', '2020-07-27 00:00:01', '2020-07-27 00:00:01', NULL, 35, NULL),
(122, 1, 1, '2020-08-02 00:00:00', '2020-07-28 00:00:02', '2020-07-28 00:00:02', NULL, 35, NULL),
(123, 2, 2, '2020-08-02 00:00:00', '2020-07-28 00:00:02', '2020-07-28 00:00:02', NULL, 35, NULL),
(124, 1, 1, '2020-08-03 00:00:00', '2020-07-29 00:00:02', '2020-07-29 00:00:02', NULL, 35, NULL),
(125, 2, 2, '2020-08-03 00:00:00', '2020-07-29 00:00:02', '2020-07-29 00:00:02', NULL, 35, NULL),
(126, 1, 1, '2020-08-04 00:00:00', '2020-07-30 00:00:02', '2020-07-30 00:00:02', NULL, 35, NULL),
(127, 2, 2, '2020-08-04 00:00:00', '2020-07-30 00:00:02', '2020-07-30 00:00:02', NULL, 35, NULL),
(128, 1, 1, '2020-08-05 00:00:00', '2020-07-31 00:00:02', '2020-07-31 00:00:02', NULL, 35, NULL),
(129, 2, 2, '2020-08-05 00:00:00', '2020-07-31 00:00:02', '2020-07-31 00:00:02', NULL, 35, NULL),
(130, 1, 1, '2020-08-06 00:00:00', '2020-08-01 00:00:01', '2020-08-01 00:00:01', NULL, 35, NULL),
(131, 2, 2, '2020-08-06 00:00:00', '2020-08-01 00:00:01', '2020-08-01 00:00:01', NULL, 35, NULL),
(132, 1, 1, '2020-08-07 00:00:00', '2020-08-02 00:00:02', '2020-08-02 00:00:02', NULL, 35, NULL),
(133, 2, 2, '2020-08-07 00:00:00', '2020-08-02 00:00:02', '2020-08-02 00:00:02', NULL, 35, NULL),
(134, 1, 1, '2020-08-08 00:00:00', '2020-08-03 00:00:02', '2020-08-03 00:00:02', NULL, 35, NULL),
(135, 2, 2, '2020-08-08 00:00:00', '2020-08-03 00:00:02', '2020-08-03 00:00:02', NULL, 35, NULL),
(136, 1, 1, '2020-08-09 00:00:00', '2020-08-04 00:00:00', '2020-08-05 03:10:45', NULL, 35, 1),
(137, 2, 2, '2020-08-09 00:00:00', '2020-08-04 00:00:00', '2020-08-05 03:11:53', NULL, 35, 1),
(138, 1, 1, '2020-08-10 00:00:00', '2020-08-05 00:00:00', '2020-08-05 03:11:46', NULL, 35, 1),
(139, 2, 2, '2020-08-10 00:00:00', '2020-08-05 00:00:00', '2020-08-05 03:11:32', NULL, 35, 1),
(140, 1, 1, '2020-08-11 00:00:00', '2020-08-06 00:00:01', '2020-08-06 00:00:01', NULL, 35, NULL),
(141, 2, 2, '2020-08-11 00:00:00', '2020-08-06 00:00:01', '2020-08-06 00:00:01', NULL, 35, NULL),
(142, 1, 1, '2020-08-12 00:00:00', '2020-08-07 00:00:02', '2020-08-07 00:00:02', NULL, 35, NULL),
(143, 2, 2, '2020-08-12 00:00:00', '2020-08-07 00:00:02', '2020-08-07 00:00:02', NULL, 35, NULL),
(144, 1, 1, '2020-08-13 00:00:00', '2020-08-08 00:00:01', '2020-08-08 00:00:01', NULL, 35, NULL),
(145, 2, 2, '2020-08-13 00:00:00', '2020-08-08 00:00:01', '2020-08-08 00:00:01', NULL, 35, NULL),
(146, 1, 1, '2020-08-14 00:00:00', '2020-08-09 00:00:02', '2020-08-09 00:00:02', NULL, 35, NULL),
(147, 2, 2, '2020-08-14 00:00:00', '2020-08-09 00:00:02', '2020-08-09 00:00:02', NULL, 35, NULL),
(148, 1, 1, '2020-08-15 00:00:00', '2020-08-10 00:00:02', '2020-08-10 00:00:02', NULL, 35, NULL),
(149, 2, 2, '2020-08-15 00:00:00', '2020-08-10 00:00:00', '2020-08-11 12:45:35', NULL, 35, 1),
(150, 1, 1, '2020-08-16 00:00:00', '2020-08-11 00:00:00', '2020-08-11 12:44:51', NULL, 35, 1),
(151, 2, 2, '2020-08-26 00:00:00', '2020-08-11 00:00:00', '2020-08-11 12:44:40', NULL, 35, 1),
(152, 2, 2, '2020-08-16 00:00:00', '2020-08-11 12:45:02', '2020-08-11 12:45:02', NULL, 35, NULL),
(153, 3, 3, '2020-08-21 00:00:00', '2020-08-11 18:11:02', '2020-08-11 18:11:02', NULL, 20, NULL),
(154, 4, 4, '2020-08-21 00:00:00', '2020-08-11 18:14:02', '2020-08-11 18:14:02', NULL, 20, NULL),
(155, 5, 5, '2020-08-21 00:00:00', '2020-08-11 18:14:02', '2020-08-11 18:14:02', NULL, 20, NULL),
(156, 6, 6, '2020-08-21 00:00:00', '2020-08-11 18:15:02', '2020-08-11 18:15:02', NULL, 20, NULL),
(157, 7, 7, '2020-08-21 00:00:00', '2020-08-11 18:15:02', '2020-08-11 18:15:02', NULL, 20, NULL),
(158, 8, 8, '2020-08-21 00:00:00', '2020-08-11 18:15:02', '2020-08-11 18:15:02', NULL, 20, NULL),
(159, 9, 9, '2020-08-21 00:00:00', '2020-08-11 18:16:02', '2020-08-11 18:16:02', NULL, 20, NULL),
(160, 10, 10, '2020-08-21 00:00:00', '2020-08-11 18:16:02', '2020-08-11 18:16:02', NULL, 20, NULL),
(161, 11, 11, '2020-08-21 00:00:00', '2020-08-11 18:16:02', '2020-08-11 18:16:02', NULL, 20, NULL),
(162, 12, 12, '2020-08-21 00:00:00', '2020-08-11 18:17:02', '2020-08-11 18:17:02', NULL, 20, NULL),
(163, 13, 13, '2020-08-21 00:00:00', '2020-08-11 18:17:02', '2020-08-11 18:17:02', NULL, 20, NULL),
(164, 14, 14, '2020-08-21 00:00:00', '2020-08-11 18:17:02', '2020-08-11 18:17:02', NULL, 20, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_prereserva`
--

CREATE TABLE `app_dat_prereserva` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_plan_servicio` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_dat_prereserva`
--

INSERT INTO `app_dat_prereserva` (`id`, `id_plan_servicio`, `cantidad`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 80, 4, '2020-09-01 21:14:02', '2020-09-01 21:14:02', NULL),
(2, 81, 5, '2020-09-01 21:16:39', '2020-09-01 21:16:39', NULL),
(3, 80, 7, '2020-09-01 21:36:18', '2020-09-01 21:36:18', NULL),
(4, 80, 7, '2020-09-01 21:37:10', '2020-09-01 21:37:10', NULL),
(5, 80, 7, '2020-09-01 21:37:39', '2020-09-01 21:37:39', NULL),
(6, 80, 7, '2020-09-01 21:38:38', '2020-09-01 21:38:38', NULL),
(7, 80, 7, '2020-09-01 21:43:30', '2020-09-01 21:43:30', NULL),
(8, 80, 7, '2020-09-01 21:44:14', '2020-09-01 21:44:14', NULL),
(9, 80, 7, '2020-09-01 21:44:54', '2020-09-01 21:44:54', NULL),
(10, 81, 5, '2020-09-01 23:48:54', '2020-09-01 23:48:54', NULL),
(11, 81, 5, '2020-09-01 23:49:56', '2020-09-01 23:49:56', NULL),
(12, 81, 5, '2020-09-01 23:50:25', '2020-09-01 23:50:25', NULL),
(13, 81, 5, '2020-09-01 23:50:42', '2020-09-01 23:50:42', NULL),
(14, 81, 5, '2020-09-01 23:53:58', '2020-09-01 23:53:58', NULL),
(15, 81, 5, '2020-09-01 23:54:07', '2020-09-01 23:54:07', NULL),
(16, 81, 5, '2020-09-01 23:55:46', '2020-09-01 23:55:46', NULL),
(17, 81, 5, '2020-09-01 23:56:29', '2020-09-01 23:56:29', NULL),
(18, 81, 5, '2020-09-01 23:56:36', '2020-09-01 23:56:36', NULL),
(19, 81, 5, '2020-09-01 23:56:53', '2020-09-01 23:56:53', NULL),
(20, 81, 5, '2020-09-01 23:57:24', '2020-09-01 23:57:24', NULL),
(21, 81, 5, '2020-09-01 23:57:31', '2020-09-01 23:57:31', NULL),
(22, 81, 5, '2020-09-01 23:57:36', '2020-09-01 23:57:36', NULL),
(23, 81, 5, '2020-09-01 23:57:44', '2020-09-01 23:57:44', NULL),
(24, 81, 5, '2020-09-01 23:57:55', '2020-09-01 23:57:55', NULL),
(25, 81, 5, '2020-09-01 23:58:22', '2020-09-01 23:58:22', NULL),
(26, 81, 5, '2020-09-01 23:58:26', '2020-09-01 23:58:26', NULL),
(27, 81, 5, '2020-09-01 23:58:32', '2020-09-01 23:58:32', NULL),
(28, 81, 5, '2020-09-01 23:59:02', '2020-09-01 23:59:02', NULL),
(29, 81, 5, '2020-09-01 23:59:17', '2020-09-01 23:59:17', NULL),
(30, 81, 5, '2020-09-01 23:59:19', '2020-09-01 23:59:19', NULL),
(31, 81, 5, '2020-09-01 23:59:20', '2020-09-01 23:59:20', NULL),
(32, 81, 5, '2020-09-01 23:59:22', '2020-09-01 23:59:22', NULL),
(33, 81, 5, '2020-09-01 23:59:24', '2020-09-01 23:59:24', NULL),
(34, 81, 5, '2020-09-01 23:59:26', '2020-09-01 23:59:26', NULL),
(35, 81, 5, '2020-09-01 23:59:28', '2020-09-01 23:59:28', NULL),
(36, 81, 5, '2020-09-01 23:59:31', '2020-09-01 23:59:31', NULL),
(37, 81, 5, '2020-09-01 23:59:33', '2020-09-01 23:59:33', NULL),
(38, 81, 5, '2020-09-02 00:00:09', '2020-09-02 00:00:09', NULL),
(39, 81, 5, '2020-09-02 00:03:29', '2020-09-02 00:03:29', NULL),
(40, 81, 5, '2020-09-02 00:03:32', '2020-09-02 00:03:32', NULL),
(41, 81, 5, '2020-09-02 00:03:34', '2020-09-02 00:03:34', NULL),
(42, 81, 5, '2020-09-02 00:03:38', '2020-09-02 00:03:38', NULL),
(43, 81, 5, '2020-09-02 00:08:20', '2020-09-02 00:08:20', NULL),
(44, 81, 5, '2020-09-02 00:08:24', '2020-09-02 00:08:24', NULL),
(45, 81, 5, '2020-09-02 00:08:46', '2020-09-02 00:08:46', NULL),
(46, 81, 5, '2020-09-02 00:08:49', '2020-09-02 00:08:49', NULL),
(47, 81, 5, '2020-09-02 00:08:50', '2020-09-02 00:08:50', NULL),
(48, 81, 5, '2020-09-02 00:08:52', '2020-09-02 00:08:52', NULL),
(49, 81, 5, '2020-09-02 00:08:54', '2020-09-02 00:08:54', NULL),
(50, 81, 5, '2020-09-02 00:08:56', '2020-09-02 00:08:56', NULL),
(51, 81, 5, '2020-09-02 00:08:58', '2020-09-02 00:08:58', NULL),
(52, 81, 5, '2020-09-02 00:08:59', '2020-09-02 00:08:59', NULL),
(53, 81, 5, '2020-09-02 00:09:01', '2020-09-02 00:09:01', NULL),
(54, 81, 5, '2020-09-02 00:09:04', '2020-09-02 00:09:04', NULL),
(55, 81, 5, '2020-09-02 00:09:49', '2020-09-02 00:09:49', NULL),
(56, 81, 5, '2020-09-02 00:09:53', '2020-09-02 00:09:53', NULL),
(57, 81, 5, '2020-09-02 00:09:56', '2020-09-02 00:09:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_recurso`
--

CREATE TABLE `app_dat_recurso` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_tipo_recurso` int(11) NOT NULL,
  `denominacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_entidad` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_dat_recurso`
--

INSERT INTO `app_dat_recurso` (`id`, `id_tipo_recurso`, `denominacion`, `id_entidad`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Recurso 1', 1, '2020-07-07 23:39:50', '2020-07-07 23:39:50', NULL),
(2, 2, 'Recurso 2', 2, '2020-07-07 23:39:50', '2020-07-07 23:39:50', NULL),
(3, 5, 'Comensales', 1, '2020-08-11 17:40:51', '2020-08-11 17:40:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_recursos_servicios`
--

CREATE TABLE `app_dat_recursos_servicios` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_rec` int(11) NOT NULL,
  `id_recurso` int(11) NOT NULL,
  `id_turno_servicio` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_dat_recursos_servicios`
--

INSERT INTO `app_dat_recursos_servicios` (`id`, `id_rec`, `id_recurso`, `id_turno_servicio`, `cantidad`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 35, '2020-07-07 23:39:50', '2020-07-07 23:39:50', NULL),
(2, 2, 2, 2, 35, '2020-07-07 23:39:50', '2020-07-07 23:39:50', NULL),
(3, 1, 3, 3, 20, '2020-08-11 18:10:28', '2020-08-11 18:10:28', NULL),
(4, 1, 3, 4, 20, '2020-08-11 18:13:04', '2020-08-11 18:13:04', NULL),
(5, 1, 3, 5, 20, '2020-08-11 18:13:21', '2020-08-11 18:13:21', NULL),
(6, 1, 3, 6, 20, '2020-08-11 18:14:14', '2020-08-11 18:14:14', NULL),
(7, 1, 3, 7, 20, '2020-08-11 18:14:38', '2020-08-11 18:14:38', NULL),
(8, 1, 3, 8, 20, '2020-08-11 18:14:56', '2020-08-11 18:14:56', NULL),
(9, 1, 3, 9, 20, '2020-08-11 18:15:16', '2020-08-11 18:15:16', NULL),
(10, 1, 3, 10, 20, '2020-08-11 18:15:35', '2020-08-11 18:15:35', NULL),
(11, 1, 3, 11, 20, '2020-08-11 18:15:51', '2020-08-11 18:15:51', NULL),
(12, 1, 3, 12, 20, '2020-08-11 18:16:10', '2020-08-11 18:16:10', NULL),
(13, 1, 3, 13, 20, '2020-08-11 18:16:30', '2020-08-11 18:16:30', NULL),
(14, 1, 3, 14, 20, '2020-08-11 18:16:49', '2020-08-11 18:16:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_recurso_eventual`
--

CREATE TABLE `app_dat_recurso_eventual` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_rec` int(11) DEFAULT NULL,
  `id_recurso` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_turno_servicio` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_recurso_general`
--

CREATE TABLE `app_dat_recurso_general` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_dat_recurso_general`
--

INSERT INTO `app_dat_recurso_general` (`id`, `tipo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Recurso General 1', '2020-07-07 23:39:50', '2020-07-07 23:39:50', NULL),
(2, 'Recurso General 2', '2020-07-07 23:39:50', '2020-07-07 23:39:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_servicios`
--

CREATE TABLE `app_dat_servicios` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_entidad` int(11) NOT NULL,
  `denominacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `ruta_imagen_vista_previa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruta_imagen_principal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruta_imagen_secundaria` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_dat_servicios`
--

INSERT INTO `app_dat_servicios` (`id`, `id_entidad`, `denominacion`, `descripcion`, `created_at`, `updated_at`, `deleted_at`, `ruta_imagen_vista_previa`, `ruta_imagen_principal`, `ruta_imagen_secundaria`) VALUES
(1, 1, 'Comparecencia', 'Presentación de documentos legales originales para dar continuidad al trámite solicitado con anterioridad', '2020-07-07 23:39:00', '2020-08-11 15:10:38', NULL, '', '', ''),
(2, 2, 'Servicio 2', 'Descripcion 2', '2020-07-07 23:39:50', '2020-07-07 23:39:50', NULL, '', '', ''),
(3, 1, 'Restaurante Buffet', 'Restaurante buffet', '2020-08-11 15:41:27', '2020-08-11 15:41:27', NULL, '', '', ''),
(4, 1, 'Restaurante de comida Italiana', 'Comida italiana (Pizza, Espaguetis, Canelones, Crema de queso, etc..)', '2020-08-11 15:43:23', '2020-08-11 15:43:23', NULL, '', '', ''),
(5, 1, 'Restaurante Internacional', 'Comida internacional a la carta.', '2020-08-11 15:44:15', '2020-08-11 15:44:15', NULL, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_servicio_real`
--

CREATE TABLE `app_dat_servicio_real` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_agenda` int(11) DEFAULT NULL,
  `id_rec` int(11) DEFAULT NULL,
  `fecha_real` timestamp NULL DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_turnos`
--

CREATE TABLE `app_dat_turnos` (
  `id` int(10) UNSIGNED NOT NULL,
  `denominacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_entidad` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_dat_turnos`
--

INSERT INTO `app_dat_turnos` (`id`, `denominacion`, `id_entidad`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Turno 1', 1, '2020-07-07 23:39:51', '2020-07-07 23:39:51', NULL),
(2, 'Turno 2', 2, '2020-07-07 23:39:51', '2020-07-07 23:39:51', NULL),
(3, 'Almuerzo 12:00 M', 1, '2020-08-11 17:41:34', '2020-08-11 17:41:34', NULL),
(4, 'Almuerzo 01:00 PM', 1, '2020-08-11 17:42:09', '2020-08-11 17:42:09', NULL),
(5, 'Cena 07:00 PM', 1, '2020-08-11 17:42:36', '2020-08-11 17:42:36', NULL),
(6, 'Cena 09:00 PM', 1, '2020-08-11 17:42:56', '2020-08-11 17:42:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_turnos_servicios`
--

CREATE TABLE `app_dat_turnos_servicios` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_local_servicio` int(11) NOT NULL,
  `id_turno` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_dat_turnos_servicios`
--

INSERT INTO `app_dat_turnos_servicios` (`id`, `id_local_servicio`, `id_turno`, `orden`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 0, '2020-07-07 23:39:51', '2020-07-07 23:39:51', NULL),
(2, 2, 2, 0, '2020-07-07 23:39:51', '2020-07-07 23:39:51', NULL),
(3, 3, 3, 1, '2020-08-11 17:50:55', '2020-08-11 17:50:55', NULL),
(4, 4, 3, 1, '2020-08-11 17:51:12', '2020-08-11 17:51:12', NULL),
(5, 5, 3, 1, '2020-08-11 17:51:31', '2020-08-11 17:51:31', NULL),
(6, 3, 4, 2, '2020-08-11 17:51:47', '2020-08-11 17:51:47', NULL),
(7, 4, 4, 2, '2020-08-11 17:52:01', '2020-08-11 17:52:01', NULL),
(8, 5, 4, 2, '2020-08-11 17:52:19', '2020-08-11 17:52:19', NULL),
(9, 3, 5, 3, '2020-08-11 17:52:34', '2020-08-11 17:52:34', NULL),
(10, 4, 5, 3, '2020-08-11 17:52:50', '2020-08-11 17:52:50', NULL),
(11, 5, 5, 3, '2020-08-11 17:53:00', '2020-08-11 17:53:50', NULL),
(12, 3, 6, 4, '2020-08-11 17:54:04', '2020-08-11 17:54:04', NULL),
(13, 4, 6, 4, '2020-08-11 17:54:17', '2020-08-11 17:54:17', NULL),
(14, 5, 6, 4, '2020-08-11 17:54:28', '2020-08-11 17:54:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_dat_valoraciones`
--

CREATE TABLE `app_dat_valoraciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_plan_agenda` int(11) DEFAULT NULL,
  `valoracion` smallint(6) DEFAULT NULL,
  `comentario` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_local_servicio` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `id_usuario_wso2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_dat_valoraciones`
--

INSERT INTO `app_dat_valoraciones` (`id`, `id_plan_agenda`, `valoracion`, `comentario`, `id_local_servicio`, `created_at`, `updated_at`, `deleted_at`, `id_usuario_wso2`) VALUES
(1, 250, 3, 'Esto es un comentario random', 1, '2020-07-07 18:38:58', '2020-07-08 00:17:44', '2020-07-08 00:17:44', NULL),
(2, 250, 3, 'Esto es un comentario random', 1, '2020-07-07 18:54:01', '2020-07-08 00:17:44', '2020-07-08 00:17:44', NULL),
(3, 250, 3, 'Esto es un comentario random', 1, '2020-07-07 20:04:47', '2020-07-08 01:31:46', '2020-07-08 01:31:46', NULL),
(4, 250, 1, 'Esto es un comentario random 641686488', 1, '2020-07-07 20:17:09', '2020-07-08 02:01:04', '2020-07-08 02:01:04', 'fernandojose@xetid.cu'),
(5, 314, 3, 'Esto es un comentario random 1233045890', 1, '2020-07-07 20:35:54', '2020-07-08 03:05:37', '2020-07-08 03:05:37', 'fernandojose@xetid.cu'),
(6, 315, 5, 'Esto es un comentario random 312202320', 1, '2020-07-08 22:17:28', '2020-07-08 22:17:28', NULL, 'fernandojose@xetid.cu');

-- --------------------------------------------------------

--
-- Table structure for table `app_estadisticas`
--

CREATE TABLE `app_estadisticas` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_local_servicio` int(11) DEFAULT NULL,
  `valoracion_promedio` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_mensaje`
--

CREATE TABLE `app_mensaje` (
  `id` int(10) UNSIGNED NOT NULL,
  `texto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_nom_tipo_mensaje` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_nom_branch_sectors`
--

CREATE TABLE `app_nom_branch_sectors` (
  `id` int(10) UNSIGNED NOT NULL,
  `denominacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_nom_branch_sectors`
--

INSERT INTO `app_nom_branch_sectors` (`id`, `denominacion`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Trámites de la vivienda', '', '2020-07-07 23:39:51', '2020-07-07 23:39:51', NULL),
(2, 'Servicios Tecnicos y del Hogar', '', '2020-07-07 23:39:51', '2020-07-07 23:39:51', NULL),
(3, 'Restaurante y Recreacion', '', '2020-07-07 23:39:51', '2020-07-07 23:39:51', NULL),
(4, 'Alojamiento', '', '2020-07-07 23:39:51', '2020-07-07 23:39:51', NULL),
(5, 'Registro central Comercial', '', '2020-07-07 23:39:51', '2020-07-07 23:39:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_nom_categoria_uso`
--

CREATE TABLE `app_nom_categoria_uso` (
  `id` int(10) UNSIGNED NOT NULL,
  `denominacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_nom_categoria_uso`
--

INSERT INTO `app_nom_categoria_uso` (`id`, `denominacion`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Público', '', '2020-07-07 23:39:00', '2020-08-11 18:00:04', NULL),
(2, 'Reserva de la administración', 'Reserva de la administración para situaciones emergentes', '2020-07-07 23:39:00', '2020-08-11 18:00:54', NULL),
(3, 'Categoria de uso 3', '', '2020-07-07 23:39:51', '2020-07-07 23:39:51', NULL),
(4, 'Categoria de uso 4', '', '2020-07-07 23:39:51', '2020-07-07 23:39:51', NULL),
(5, 'Categoria de uso 5', '', '2020-07-07 23:39:51', '2020-07-07 23:39:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_nom_motivo_interrupcion`
--

CREATE TABLE `app_nom_motivo_interrupcion` (
  `id` int(10) UNSIGNED NOT NULL,
  `denominacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_nom_motivo_interrupcion`
--

INSERT INTO `app_nom_motivo_interrupcion` (`id`, `denominacion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Problemas personales del especialista', '2020-07-07 23:39:51', '2020-07-07 23:39:51', NULL),
(2, 'Rotura del equipo', '2020-07-07 23:39:51', '2020-07-07 23:39:51', NULL),
(3, 'Alarma ciclonica', '2020-07-07 23:39:51', '2020-07-07 23:39:51', NULL),
(4, 'Pandemia', '2020-07-07 23:39:51', '2020-07-07 23:39:51', NULL),
(5, 'Epidemia', '2020-07-07 23:39:51', '2020-07-07 23:39:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_nom_organismo`
--

CREATE TABLE `app_nom_organismo` (
  `id` int(10) UNSIGNED NOT NULL,
  `denominacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_nom_organismo`
--

INSERT INTO `app_nom_organismo` (`id`, `denominacion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Instituto de Planificación Física', '2020-07-07 23:39:51', '2020-07-07 23:39:51', NULL),
(2, 'Ministerio de Comercio Interior', '2020-07-07 23:39:51', '2020-07-07 23:39:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_nom_periodo`
--

CREATE TABLE `app_nom_periodo` (
  `id` int(10) UNSIGNED NOT NULL,
  `denominacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_nom_periodo`
--

INSERT INTO `app_nom_periodo` (`id`, `denominacion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Horas', '2020-07-07 23:39:52', '2020-07-07 23:39:52', NULL),
(2, 'Dias', '2020-07-07 23:39:52', '2020-07-07 23:39:52', NULL),
(3, 'Meses', '2020-07-07 23:39:52', '2020-07-07 23:39:52', NULL),
(4, 'Semanas', '2020-07-07 23:39:52', '2020-07-07 23:39:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_nom_prioridad`
--

CREATE TABLE `app_nom_prioridad` (
  `id` int(10) UNSIGNED NOT NULL,
  `denominacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nivel` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_nom_prioridad`
--

INSERT INTO `app_nom_prioridad` (`id`, `denominacion`, `descripcion`, `nivel`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Normal', 'esta es la prioridad todos las agendas por defecto.', 1, '2020-07-07 23:39:52', '2020-07-07 23:39:52', NULL),
(2, 'Media', 'esta prioridad la toman aquellas agendas que por una ves debieron cambiar su fecha prevista.', 2, '2020-07-07 23:39:52', '2020-07-07 23:39:52', NULL),
(3, 'Alta', 'Esta es la prioridad de las agendas que se han tenido que cambiar 2 veces.', 3, '2020-07-07 23:39:52', '2020-07-07 23:39:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_nom_tipo_mensaje`
--

CREATE TABLE `app_nom_tipo_mensaje` (
  `id` int(10) UNSIGNED NOT NULL,
  `denominacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_nom_tipo_mensaje`
--

INSERT INTO `app_nom_tipo_mensaje` (`id`, `denominacion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'informativo', '2020-07-07 23:39:52', '2020-07-07 23:39:52', NULL),
(2, 'alerta', '2020-07-07 23:39:52', '2020-07-07 23:39:52', NULL),
(3, 'interactivo', '2020-07-07 23:39:52', '2020-07-07 23:39:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_nom_tipo_recurso`
--

CREATE TABLE `app_nom_tipo_recurso` (
  `id` int(10) UNSIGNED NOT NULL,
  `denominacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_nom_tipo_recurso`
--

INSERT INTO `app_nom_tipo_recurso` (`id`, `denominacion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Material gastable', '2020-07-07 23:39:52', '2020-07-07 23:39:52', NULL),
(2, 'Material inmueble', '2020-07-07 23:39:52', '2020-07-07 23:39:52', NULL),
(3, 'Material herramienta', '2020-07-07 23:39:52', '2020-07-07 23:39:52', NULL),
(4, 'Humano', '2020-07-07 23:39:52', '2020-07-07 23:39:52', NULL),
(5, 'Sillas', '2020-07-11 14:46:00', '2020-08-11 17:39:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_notificaciones`
--

CREATE TABLE `app_notificaciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_agenda` int(11) DEFAULT NULL,
  `id_mensaje` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 4, 'id_local_servicio', 'text', 'Id Local Servicio', 0, 1, 1, 1, 1, 1, '{}', 2),
(24, 4, 'id_periodo', 'text', 'Id Periodo', 0, 1, 1, 1, 1, 1, '{}', 3),
(25, 4, 'id_tiempo_desde', 'text', 'Id Tiempo Desde', 0, 1, 1, 1, 1, 1, '{}', 4),
(26, 4, 'id_tiempo_hasta', 'text', 'Id Tiempo Hasta', 0, 1, 1, 1, 1, 1, '{}', 5),
(27, 4, 'id_tiempo_cancelacion', 'text', 'Id Tiempo Cancelacion', 0, 1, 1, 1, 1, 1, '{}', 6),
(30, 4, 'tiempo_ultimo_aviso', 'timestamp', 'Tiempo Ultimo Aviso', 0, 1, 1, 1, 1, 1, '{}', 9),
(31, 4, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 10),
(32, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(33, 5, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(35, 5, 'id_recurso_servicio', 'text', 'Id Recurso Servicio', 0, 1, 1, 1, 1, 1, '{}', 3),
(37, 5, 'id_cliente', 'text', 'Id Cliente', 0, 1, 1, 1, 1, 1, '{}', 5),
(39, 5, 'id_usuario_wso2', 'text', 'Id Usuario Wso2', 0, 1, 1, 1, 1, 1, '{}', 7),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(42, 6, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(43, 6, 'id_agenda', 'text', 'Id Agenda', 0, 1, 1, 1, 1, 1, '{}', 2),
(47, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(48, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(49, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(50, 7, 'id_agenda', 'text', 'Id Agenda', 0, 1, 1, 1, 1, 1, '{}', 2),
(51, 7, 'id_interrupcion', 'text', 'Id Interrupcion', 0, 1, 1, 1, 1, 1, '{}', 3),
(52, 7, 'notificacion', 'text', 'Notificacion', 0, 1, 1, 1, 1, 1, '{}', 4),
(53, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(54, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(55, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(56, 8, 'id_agenda_prioridad', 'text', 'Id Agenda Prioridad', 0, 1, 1, 1, 1, 1, '{}', 2),
(57, 8, 'id_agenda', 'text', 'Id Agenda', 0, 1, 1, 1, 1, 1, '{}', 3),
(58, 8, 'id_prioridad', 'text', 'Id Prioridad', 0, 1, 1, 1, 1, 1, '{}', 4),
(59, 8, 'fecha_cambio_estado', 'timestamp', 'Fecha Cambio Estado', 0, 1, 1, 1, 1, 1, '{}', 5),
(60, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(61, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(62, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(63, 9, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{}', 2),
(64, 9, 'apellidos', 'text', 'Apellidos', 0, 1, 1, 1, 1, 1, '{}', 3),
(65, 9, 'ci', 'text', 'Ci', 1, 1, 1, 1, 1, 1, '{}', 4),
(66, 9, 'telefono', 'text', 'Telefono', 0, 1, 1, 1, 1, 1, '{}', 5),
(67, 9, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 6),
(68, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(69, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(70, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(71, 10, 'id_recurso_servicio', 'text', 'Id Recurso Servicio', 0, 1, 1, 1, 1, 1, '{}', 2),
(72, 10, 'cantidad', 'text', 'Cantidad', 0, 1, 1, 1, 1, 1, '{}', 3),
(73, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(74, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(75, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(76, 11, 'id_turno_servicio', 'text', 'Id Turno Servicio', 0, 1, 1, 1, 1, 1, '{}', 2),
(77, 11, 'id_prioridad', 'text', 'Id Prioridad', 0, 1, 1, 1, 1, 1, '{}', 3),
(78, 11, 'cantidad', 'text', 'Cantidad', 0, 1, 1, 1, 1, 1, '{}', 4),
(79, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(80, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(81, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(82, 13, 'id_recurso_servicio', 'text', 'Id Recurso Servicio', 0, 1, 1, 1, 1, 1, '{}', 2),
(83, 13, 'id_turno_servicio', 'text', 'Id Turno Servicio', 0, 1, 1, 1, 1, 1, '{}', 3),
(84, 13, 'id_motivo_interrupcion', 'text', 'Id Motivo Interrupcion', 0, 1, 1, 1, 1, 1, '{}', 4),
(85, 13, 'fecha_desde', 'timestamp', 'Fecha Desde', 0, 1, 1, 1, 1, 1, '{}', 5),
(86, 13, 'fecha_hasta', 'timestamp', 'Fecha Hasta', 0, 1, 1, 1, 1, 1, '{}', 6),
(87, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(88, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(89, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(90, 16, 'id_tipo_recurso', 'text', 'Id Tipo Recurso', 0, 1, 1, 1, 1, 1, '{}', 2),
(91, 16, 'denominacion', 'text', 'Denominacion', 0, 1, 1, 1, 1, 1, '{}', 3),
(94, 16, 'id_entidad', 'text', 'Id Entidad', 0, 1, 1, 1, 1, 1, '{}', 6),
(95, 16, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(96, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(97, 17, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(98, 17, 'id_rec', 'text', 'Id Rec', 0, 1, 1, 1, 1, 1, '{}', 2),
(99, 17, 'id_recurso', 'text', 'Id Recurso', 0, 1, 1, 1, 1, 1, '{}', 3),
(102, 17, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(103, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(104, 18, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(105, 18, 'tipo', 'text', 'Tipo', 0, 1, 1, 1, 1, 1, '{}', 2),
(106, 18, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(107, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(108, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(109, 19, 'id_rec', 'text', 'Id Rec', 0, 1, 1, 1, 1, 1, '{}', 2),
(110, 19, 'id_recurso', 'text', 'Id Recurso', 0, 1, 1, 1, 1, 1, '{}', 3),
(113, 19, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(114, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(115, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(116, 20, 'id_agenda', 'text', 'Id Agenda', 0, 1, 1, 1, 1, 1, '{}', 2),
(117, 20, 'id_rec', 'text', 'Id Rec', 0, 1, 1, 1, 1, 1, '{}', 3),
(118, 20, 'fecha_real', 'timestamp', 'Fecha Real', 0, 1, 1, 1, 1, 1, '{}', 4),
(119, 20, 'fecha_registro', 'timestamp', 'Fecha Registro', 0, 1, 1, 1, 1, 1, '{}', 5),
(120, 20, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(121, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(122, 21, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(123, 21, 'id_entidad', 'text', 'Id Entidad', 1, 1, 1, 1, 1, 1, '{}', 2),
(125, 21, 'denominacion', 'text', 'Denominacion', 1, 1, 1, 1, 1, 1, '{}', 4),
(126, 21, 'descripcion', 'text', 'Descripcion', 1, 1, 1, 1, 1, 1, '{}', 5),
(129, 21, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(130, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(131, 22, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(132, 22, 'denominacion', 'text', 'Denominacion', 0, 1, 1, 1, 1, 1, '{}', 2),
(135, 22, 'id_entidad', 'text', 'Id Entidad', 0, 1, 1, 1, 1, 1, '{}', 5),
(136, 22, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(137, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(138, 23, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(139, 23, 'id_local_servicio', 'text', 'Id Local Servicio', 0, 1, 1, 1, 1, 1, '{}', 2),
(140, 23, 'id_turno', 'text', 'Id Turno', 0, 1, 1, 1, 1, 1, '{}', 3),
(143, 23, 'orden', 'text', 'Orden', 0, 1, 1, 1, 1, 1, '{}', 6),
(144, 23, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(145, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(146, 24, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(147, 24, 'texto', 'text', 'Texto', 0, 1, 1, 1, 1, 1, '{}', 2),
(148, 24, 'id_nom_tipo_mensaje', 'text', 'Id Nom Tipo Mensaje', 0, 1, 1, 1, 1, 1, '{}', 3),
(149, 24, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(150, 24, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(151, 25, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(152, 25, 'denominacion', 'text', 'Denominacion', 0, 1, 1, 1, 1, 1, '{}', 2),
(153, 25, 'descripcion', 'text', 'Descripcion', 0, 1, 1, 1, 1, 1, '{}', 3),
(154, 25, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(155, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(156, 26, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(157, 26, 'denominacion', 'text', 'Denominacion', 0, 1, 1, 1, 1, 1, '{}', 2),
(158, 26, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(159, 26, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(160, 28, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(161, 28, 'denominacion', 'text', 'Denominacion', 0, 1, 1, 1, 1, 1, '{}', 2),
(164, 28, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(165, 28, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(166, 29, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(167, 29, 'denominacion', 'text', 'Denominacion', 0, 1, 1, 1, 1, 1, '{}', 2),
(168, 29, 'descripcion', 'text', 'Descripcion', 0, 1, 1, 1, 1, 1, '{}', 3),
(169, 29, 'nivel', 'text', 'Nivel', 0, 1, 1, 1, 1, 1, '{}', 4),
(170, 29, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(171, 29, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(172, 30, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(173, 30, 'denominacion', 'text', 'Denominacion', 0, 1, 1, 1, 1, 1, '{}', 2),
(174, 30, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(175, 30, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(176, 31, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(177, 31, 'denominacion', 'text', 'Denominacion', 0, 1, 1, 1, 1, 1, '{}', 2),
(178, 31, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(179, 31, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(180, 33, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(181, 33, 'id_agenda', 'text', 'Id Agenda', 0, 1, 1, 1, 1, 1, '{}', 2),
(182, 33, 'id_mensaje', 'text', 'Id Mensaje', 0, 1, 1, 1, 1, 1, '{}', 3),
(183, 33, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(184, 33, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(185, 4, 'app_conf_confirmacion_servicio_belongsto_app_dat_locales_servicio_relationship', 'relationship', 'app_dat_locales_servicios', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatLocalesServicio\",\"table\":\"app_dat_locales_servicios\",\"type\":\"belongsTo\",\"column\":\"id_local_servicio\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(186, 4, 'app_conf_confirmacion_servicio_belongsto_app_nom_periodo_relationship', 'relationship', 'app_nom_periodo', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppNomPeriodo\",\"table\":\"app_nom_periodo\",\"type\":\"belongsTo\",\"column\":\"id_periodo\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(187, 4, 'app_conf_confirmacion_servicio_hasone_app_nom_periodo_relationship', 'relationship', 'app_nom_periodo', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppNomPeriodo\",\"table\":\"app_nom_periodo\",\"type\":\"hasOne\",\"column\":\"id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(188, 4, 'app_conf_confirmacion_servicio_belongsto_app_nom_periodo_relationship_1', 'relationship', 'app_nom_periodo', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppNomPeriodo\",\"table\":\"app_nom_periodo\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(189, 4, 'app_conf_confirmacion_servicio_belongsto_app_nom_periodo_relationship_2', 'relationship', 'app_nom_periodo', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppNomPeriodo\",\"table\":\"app_nom_periodo\",\"type\":\"belongsTo\",\"column\":\"id_tiempo_cancelacion\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16),
(190, 4, 'app_conf_confirmacion_servicio_belongsto_app_nom_periodo_relationship_3', 'relationship', 'app_nom_periodo', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppNomPeriodo\",\"table\":\"app_nom_periodo\",\"type\":\"belongsTo\",\"column\":\"id_tiempo_cancelacion\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 17),
(192, 5, 'app_dat_agenda_belongsto_app_dat_recursos_servicio_relationship', 'relationship', 'app_dat_recursos_servicios', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatRecursosServicio\",\"table\":\"app_dat_recursos_servicios\",\"type\":\"belongsTo\",\"column\":\"id_recurso_servicio\",\"key\":\"id\",\"label\":\"id_recurso\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(193, 5, 'app_dat_agenda_belongsto_app_dat_cliente_relationship', 'relationship', 'app_dat_cliente', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatCliente\",\"table\":\"app_dat_cliente\",\"type\":\"belongsTo\",\"column\":\"id_cliente\",\"key\":\"id\",\"label\":\"ci\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(194, 6, 'app_dat_agenda_cambiada_belongsto_app_dat_agenda_relationship', 'relationship', 'app_dat_agenda', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatAgenda\",\"table\":\"app_dat_agenda\",\"type\":\"belongsTo\",\"column\":\"id_agenda\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(195, 7, 'app_dat_agenda_interrupcion_belongsto_app_dat_agenda_relationship', 'relationship', 'app_dat_agenda', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatAgenda\",\"table\":\"app_dat_agenda\",\"type\":\"belongsTo\",\"column\":\"id_agenda\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(196, 7, 'app_dat_agenda_interrupcion_belongsto_app_dat_interrupcione_relationship', 'relationship', 'app_dat_interrupciones', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatInterrupcione\",\"table\":\"app_dat_interrupciones\",\"type\":\"belongsTo\",\"column\":\"id_interrupcion\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(197, 8, 'app_dat_agenda_prioridad_belongsto_app_dat_agenda_relationship', 'relationship', 'app_dat_agenda', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatAgenda\",\"table\":\"app_dat_agenda\",\"type\":\"belongsTo\",\"column\":\"id_agenda_prioridad\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(198, 8, 'app_dat_agenda_prioridad_belongsto_app_nom_prioridad_relationship', 'relationship', 'app_nom_prioridad', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppNomPrioridad\",\"table\":\"app_nom_prioridad\",\"type\":\"belongsTo\",\"column\":\"id_prioridad\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(199, 10, 'app_dat_distribucion_recurso_belongsto_app_dat_recursos_servicio_relationship', 'relationship', 'app_dat_recursos_servicios', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatRecursosServicio\",\"table\":\"app_dat_recursos_servicios\",\"type\":\"belongsTo\",\"column\":\"id_recurso_servicio\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(200, 11, 'app_dat_distribucion_turno_belongsto_app_dat_turnos_servicio_relationship', 'relationship', 'app_dat_turnos_servicios', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatTurnosServicio\",\"table\":\"app_dat_turnos_servicios\",\"type\":\"belongsTo\",\"column\":\"id_turno_servicio\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(201, 11, 'app_dat_distribucion_turno_belongsto_app_nom_prioridad_relationship', 'relationship', 'app_nom_prioridad', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppNomPrioridad\",\"table\":\"app_nom_prioridad\",\"type\":\"belongsTo\",\"column\":\"id_prioridad\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(202, 27, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(203, 27, 'denominacion', 'text', 'Denominacion', 0, 1, 1, 1, 1, 1, '{}', 2),
(204, 27, 'descripcion', 'text', 'Descripcion', 0, 1, 1, 1, 1, 1, '{}', 3),
(207, 27, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(208, 27, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(209, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(210, 12, 'denominacion', 'text', 'Denominacion', 0, 1, 1, 1, 1, 1, '{}', 2),
(211, 12, 'telefono', 'text', 'Telefono', 0, 1, 1, 1, 1, 1, '{}', 3),
(212, 12, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 4),
(213, 12, 'direccion', 'text', 'Direccion', 0, 1, 1, 1, 1, 1, '{}', 5),
(214, 12, 'id_dpa', 'text', 'Id Dpa', 0, 1, 1, 1, 1, 1, '{}', 6),
(215, 12, 'id_organismo', 'text', 'Id Organismo', 0, 1, 1, 1, 1, 1, '{}', 7),
(216, 12, 'id_nom_branch_sector', 'text', 'Id Nom Branch Sector', 0, 1, 1, 1, 1, 1, '{}', 8),
(217, 12, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 9),
(218, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(219, 12, 'app_dat_entidade_belongsto_app_nom_organismo_relationship', 'relationship', 'app_nom_organismo', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppNomOrganismo\",\"table\":\"app_nom_organismo\",\"type\":\"belongsTo\",\"column\":\"id_organismo\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(220, 12, 'app_dat_entidade_belongsto_app_nom_branch_sector_relationship', 'relationship', 'app_nom_branch_sectors', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppNomBranchSector\",\"table\":\"app_nom_branch_sectors\",\"type\":\"belongsTo\",\"column\":\"id_nom_branch_sector\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(221, 13, 'app_dat_interrupcione_belongsto_app_dat_recursos_servicio_relationship', 'relationship', 'app_dat_recursos_servicios', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatRecursosServicio\",\"table\":\"app_dat_recursos_servicios\",\"type\":\"belongsTo\",\"column\":\"id_recurso_servicio\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(222, 13, 'app_dat_interrupcione_belongsto_app_dat_turnos_servicio_relationship', 'relationship', 'app_dat_turnos_servicios', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatTurnosServicio\",\"table\":\"app_dat_turnos_servicios\",\"type\":\"belongsTo\",\"column\":\"id_turno_servicio\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(223, 13, 'app_dat_interrupcione_belongsto_app_nom_motivo_interrupcion_relationship', 'relationship', 'app_nom_motivo_interrupcion', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppNomMotivoInterrupcion\",\"table\":\"app_nom_motivo_interrupcion\",\"type\":\"belongsTo\",\"column\":\"id_motivo_interrupcion\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(224, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(225, 14, 'id_entidad', 'text', 'Id Entidad', 0, 1, 1, 1, 1, 1, '{}', 2),
(226, 14, 'denominacion', 'text', 'Denominacion', 0, 1, 1, 1, 1, 1, '{}', 3),
(229, 14, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(230, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(231, 14, 'app_dat_locale_belongsto_app_dat_entidade_relationship', 'relationship', 'app_dat_entidades', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatEntidade\",\"table\":\"app_dat_entidades\",\"type\":\"belongsTo\",\"column\":\"id_entidad\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(232, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(233, 15, 'id_local', 'text', 'Id Local', 0, 1, 1, 1, 1, 1, '{}', 2),
(234, 15, 'id_servicio', 'text', 'Id Servicio', 0, 1, 1, 1, 1, 1, '{}', 3),
(237, 15, 'confirmacion', 'text', 'Confirmacion', 0, 1, 1, 1, 1, 1, '{}', 6),
(238, 15, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(239, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(240, 15, 'app_dat_locales_servicio_belongsto_app_dat_locale_relationship', 'relationship', 'app_dat_locales', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatLocale\",\"table\":\"app_dat_locales\",\"type\":\"belongsTo\",\"column\":\"id_local\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(241, 15, 'app_dat_locales_servicio_belongsto_app_dat_servicio_relationship', 'relationship', 'app_dat_servicios', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatServicio\",\"table\":\"app_dat_servicios\",\"type\":\"belongsTo\",\"column\":\"id_servicio\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(242, 16, 'app_dat_recurso_belongsto_app_nom_tipo_recurso_relationship', 'relationship', 'app_nom_tipo_recurso', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppNomTipoRecurso\",\"table\":\"app_nom_tipo_recurso\",\"type\":\"belongsTo\",\"column\":\"id_tipo_recurso\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(243, 16, 'app_dat_recurso_belongsto_app_dat_entidade_relationship', 'relationship', 'app_dat_entidades', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatEntidade\",\"table\":\"app_dat_entidades\",\"type\":\"belongsTo\",\"column\":\"id_entidad\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(244, 17, 'app_dat_recurso_eventual_belongsto_app_dat_recurso_general_relationship', 'relationship', 'app_dat_recurso_general', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatRecursoGeneral\",\"table\":\"app_dat_recurso_general\",\"type\":\"belongsTo\",\"column\":\"id_rec\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(245, 17, 'app_dat_recurso_eventual_belongsto_app_dat_turnos_servicio_relationship', 'relationship', 'app_dat_turnos_servicios', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatTurnosServicio\",\"table\":\"app_dat_turnos_servicios\",\"type\":\"belongsTo\",\"column\":\"id_turno_servicio\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(246, 17, 'app_dat_recurso_eventual_belongsto_app_dat_recurso_relationship', 'relationship', 'app_dat_recurso', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatRecurso\",\"table\":\"app_dat_recurso\",\"type\":\"belongsTo\",\"column\":\"id_recurso\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(247, 17, 'id_turno_servicio', 'text', 'Id Turno Servicio', 0, 1, 1, 1, 1, 1, '{}', 8),
(248, 19, 'app_dat_recursos_servicio_belongsto_app_dat_recurso_general_relationship', 'relationship', 'app_dat_recurso_general', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatRecursoGeneral\",\"table\":\"app_dat_recurso_general\",\"type\":\"belongsTo\",\"column\":\"id_rec\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(249, 19, 'app_dat_recursos_servicio_belongsto_app_dat_turnos_servicio_relationship', 'relationship', 'app_dat_turnos_servicios', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatTurnosServicio\",\"table\":\"app_dat_turnos_servicios\",\"type\":\"belongsTo\",\"column\":\"id_turno_servicio\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(250, 19, 'app_dat_recursos_servicio_belongsto_app_dat_recurso_relationship', 'relationship', 'app_dat_recurso', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatRecurso\",\"table\":\"app_dat_recurso\",\"type\":\"belongsTo\",\"column\":\"id_recurso\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(251, 19, 'id_turno_servicio', 'text', 'Id Turno Servicio', 0, 1, 1, 1, 1, 1, '{}', 8),
(252, 20, 'app_dat_servicio_real_belongsto_app_dat_agenda_relationship', 'relationship', 'app_dat_agenda', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatAgenda\",\"table\":\"app_dat_agenda\",\"type\":\"belongsTo\",\"column\":\"id_agenda\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(253, 20, 'app_dat_servicio_real_belongsto_app_dat_recurso_general_relationship', 'relationship', 'app_dat_recurso_general', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatRecursoGeneral\",\"table\":\"app_dat_recurso_general\",\"type\":\"belongsTo\",\"column\":\"id_rec\",\"key\":\"id\",\"label\":\"tipo\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(254, 21, 'app_dat_servicio_belongsto_app_dat_entidade_relationship', 'relationship', 'app_dat_entidades', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatEntidade\",\"table\":\"app_dat_entidades\",\"type\":\"belongsTo\",\"column\":\"id_entidad\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(256, 22, 'app_dat_turno_belongsto_app_dat_entidade_relationship', 'relationship', 'app_dat_entidades', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatEntidade\",\"table\":\"app_dat_entidades\",\"type\":\"belongsTo\",\"column\":\"id_entidad\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(257, 23, 'app_dat_turnos_servicio_belongsto_app_dat_locales_servicio_relationship', 'relationship', 'app_dat_locales_servicios', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatLocalesServicio\",\"table\":\"app_dat_locales_servicios\",\"type\":\"belongsTo\",\"column\":\"id_local_servicio\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(258, 23, 'app_dat_turnos_servicio_belongsto_app_dat_turno_relationship', 'relationship', 'app_dat_turnos', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatTurno\",\"table\":\"app_dat_turnos\",\"type\":\"belongsTo\",\"column\":\"id_turno\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(259, 24, 'app_mensaje_belongsto_app_nom_tipo_mensaje_relationship', 'relationship', 'app_nom_tipo_mensaje', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppNomTipoMensaje\",\"table\":\"app_nom_tipo_mensaje\",\"type\":\"belongsTo\",\"column\":\"id_nom_tipo_mensaje\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(260, 33, 'app_notificacione_belongsto_app_dat_agenda_relationship', 'relationship', 'app_dat_agenda', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatAgenda\",\"table\":\"app_dat_agenda\",\"type\":\"belongsTo\",\"column\":\"id_agenda\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(261, 33, 'app_notificacione_belongsto_app_mensaje_relationship', 'relationship', 'app_mensaje', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppMensaje\",\"table\":\"app_mensaje\",\"type\":\"belongsTo\",\"column\":\"id_mensaje\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(262, 4, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 10),
(263, 5, 'fecha_inicio_cita', 'timestamp', 'Fecha Inicio Cita', 0, 1, 1, 1, 1, 1, '{}', 4),
(264, 5, 'fecha_fin_cita', 'timestamp', 'Fecha Fin Cita', 0, 1, 1, 1, 1, 1, '{}', 6),
(265, 5, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 10),
(266, 5, 'id_nom_categoria_uso', 'text', 'Id Nom Categoria Uso', 0, 1, 1, 1, 1, 1, '{}', 11),
(267, 6, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 5),
(268, 6, 'fecha_inicio_cita', 'timestamp', 'Fecha Inicio Cita', 0, 1, 1, 1, 1, 1, '{}', 6),
(269, 6, 'fecha_inicio_cita_old', 'timestamp', 'Fecha Inicio Cita Old', 0, 1, 1, 1, 1, 1, '{}', 7),
(270, 7, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 7),
(271, 8, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 8),
(272, 9, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 9),
(273, 10, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 6),
(274, 11, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 7),
(275, 12, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 11),
(276, 13, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 9),
(277, 14, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 6),
(278, 15, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 7),
(279, 34, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(280, 34, 'id_turno_servicio', 'text', 'Id Turno Servicio', 0, 1, 1, 1, 1, 1, '{}', 2),
(281, 34, 'id_nom_categoria_uso', 'text', 'Id Nom Categoria Uso', 0, 1, 1, 1, 1, 1, '{}', 3),
(282, 34, 'fecha_reservacion', 'timestamp', 'Fecha Reservacion', 0, 1, 1, 1, 1, 1, '{}', 4),
(283, 34, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(284, 34, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(285, 34, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 7),
(286, 16, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 7),
(287, 17, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 7),
(288, 25, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 6),
(289, 24, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 6),
(290, 23, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 7),
(291, 22, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 6),
(292, 20, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 8),
(293, 33, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 6),
(294, 26, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 5),
(295, 27, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 6),
(296, 28, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 5),
(297, 29, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 7),
(298, 30, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 5),
(299, 32, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(300, 32, 'denominacion', 'text', 'Denominacion', 0, 1, 1, 1, 1, 1, '{}', 2),
(301, 32, 'descripcion', 'text', 'Descripcion', 0, 1, 1, 1, 1, 1, '{}', 3),
(302, 32, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(303, 32, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(304, 32, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 6),
(306, 34, 'app_dat_plan_servicio_belongsto_app_dat_turnos_servicio_relationship', 'relationship', 'app_dat_turnos_servicios', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatTurnosServicio\",\"table\":\"app_dat_turnos_servicios\",\"type\":\"belongsTo\",\"column\":\"id_turno_servicio\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(307, 34, 'app_dat_plan_servicio_belongsto_app_nom_categoria_uso_relationship', 'relationship', 'app_nom_categoria_uso', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppNomCategoriaUso\",\"table\":\"app_nom_categoria_uso\",\"type\":\"belongsTo\",\"column\":\"id_nom_categoria_uso\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(308, 35, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(309, 35, 'id_entidad', 'text', 'Id Entidad', 0, 1, 1, 1, 1, 1, '{}', 2),
(310, 35, 'id_nom_categoria_uso', 'text', 'Id Nom Categoria Uso', 0, 1, 1, 1, 1, 1, '{}', 3),
(311, 35, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(312, 35, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(313, 35, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 6),
(314, 35, 'app_dat_entidades_categoria_belongsto_app_dat_entidade_relationship', 'relationship', 'app_dat_entidades', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatEntidade\",\"table\":\"app_dat_entidades\",\"type\":\"belongsTo\",\"column\":\"id_entidad\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(315, 35, 'app_dat_entidades_categoria_belongsto_app_nom_categoria_uso_relationship', 'relationship', 'app_nom_categoria_uso', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppNomCategoriaUso\",\"table\":\"app_nom_categoria_uso\",\"type\":\"belongsTo\",\"column\":\"id_nom_categoria_uso\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(316, 11, 'id_nom_categoria_uso', 'text', 'Id Nom Categoria Uso', 0, 1, 1, 1, 1, 1, '{}', 8),
(317, 11, 'app_dat_distribucion_turno_belongsto_app_nom_categoria_uso_relationship', 'relationship', 'app_nom_categoria_uso', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppNomCategoriaUso\",\"table\":\"app_nom_categoria_uso\",\"type\":\"belongsTo\",\"column\":\"id_nom_categoria_uso\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":null}', 9),
(318, 28, 'fecha_inicio', 'timestamp', 'Fecha Inicio', 0, 1, 1, 1, 1, 1, '{}', 6),
(319, 28, 'fecha_fin', 'timestamp', 'Fecha Fin', 0, 1, 1, 1, 1, 1, '{}', 7),
(320, 21, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 8),
(321, 36, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(322, 36, 'denominacion', 'text', 'Denominacion', 0, 1, 1, 1, 1, 1, '{}', 2),
(323, 36, 'descripcion', 'text', 'Descripcion', 0, 1, 1, 1, 1, 1, '{}', 3),
(324, 36, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(325, 36, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(326, 36, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 6),
(327, 5, 'app_dat_agenda_belongsto_app_dat_plan_servicio_relationship', 'relationship', 'app_dat_plan_servicios', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatPlanAgenda\",\"table\":\"app_dat_plan_agenda\",\"type\":\"belongsTo\",\"column\":\"id_dat_plan_agenda\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(329, 5, 'app_dat_agenda_belongsto_app_nom_categoria_uso_relationship', 'relationship', 'app_nom_categoria_uso', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppNomCategoriaUso\",\"table\":\"app_nom_categoria_uso\",\"type\":\"belongsTo\",\"column\":\"id_nom_categoria_uso\",\"key\":\"id\",\"label\":\"denominacion\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(330, 19, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 7),
(331, 15, 'precio', 'text', 'Precio', 0, 1, 1, 1, 1, 1, '{}', 8),
(332, 14, 'id_dpa', 'text', 'Id Dpa', 0, 1, 1, 1, 1, 1, '{}', 7),
(333, 14, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 8),
(334, 14, 'direccion', 'text', 'Direccion', 0, 1, 1, 1, 1, 1, '{}', 9),
(335, 14, 'telefono', 'text', 'Telefono', 0, 1, 1, 1, 1, 1, '{}', 10),
(336, 34, 'cantidad', 'text', 'Cantidad', 0, 1, 1, 1, 1, 1, '{}', 8),
(337, 37, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(338, 37, 'id_dat_plan_servicio', 'text', 'Id Dat Plan Servicio', 0, 1, 1, 1, 1, 1, '{}', 2),
(340, 37, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(341, 37, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(342, 37, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 6),
(343, 37, 'app_dat_plan_agenda_belongsto_app_dat_plan_servicio_relationship', 'relationship', 'app_dat_plan_servicios', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatPlanServicio\",\"table\":\"app_dat_plan_servicios\",\"type\":\"belongsTo\",\"column\":\"id_dat_plan_servicio\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(344, 37, 'app_dat_plan_agenda_belongsto_app_dat_agenda_relationship', 'relationship', 'app_dat_agenda', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatAgenda\",\"table\":\"app_dat_agenda\",\"type\":\"belongsTo\",\"column\":\"id_dat_agenda\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(345, 37, 'id_dat_agenda', 'text', 'Id Dat Agenda', 0, 1, 1, 1, 1, 1, '{}', 3),
(346, 5, 'id_dat_plan_agenda', 'text', 'Id Dat Plan Agenda', 0, 1, 1, 1, 1, 1, '{}', 11),
(347, 19, 'cantidad', 'text', 'Cantidad', 0, 1, 1, 1, 1, 1, '{}', 8),
(349, 15, 'dias_de_planificacion', 'text', 'Dias De Planificacion', 0, 1, 1, 1, 1, 1, '{}', 10),
(351, 34, 'publico', 'checkbox', 'Publico', 0, 1, 1, 1, 1, 1, '{}', 9),
(352, 15, 'dias_de_publicacion', 'text', 'Dias De Publicacion', 0, 1, 1, 1, 1, 1, '{}', 9),
(353, 38, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(355, 38, 'valoracion', 'text', 'Valoracion', 0, 1, 1, 1, 1, 1, '{}', 3),
(356, 38, 'comentario', 'text', 'Comentario', 0, 1, 1, 1, 1, 1, '{}', 4),
(357, 38, 'id_local_servicio', 'text', 'Id Local Servicio', 0, 1, 1, 1, 1, 1, '{}', 5),
(358, 38, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(359, 38, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(360, 38, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 8),
(361, 38, 'id_usuario_wso2', 'text', 'Id Usuario Wso2', 0, 1, 1, 1, 1, 1, '{}', 9),
(362, 38, 'id_plan_agenda', 'text', 'Id Plan Agenda', 0, 1, 1, 1, 1, 1, '{}', 2),
(363, 39, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(364, 39, 'id_local_servicio', 'text', 'Id Local Servicio', 0, 1, 1, 1, 1, 1, '{}', 2),
(365, 39, 'valoracion_promedio', 'text', 'Valoracion Promedio', 0, 1, 1, 1, 1, 1, '{}', 3),
(366, 39, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(367, 39, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(368, 39, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 6),
(369, 41, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(370, 41, 'denominacion', 'text', 'Denominacion', 1, 1, 1, 1, 1, 1, '{}', 2),
(371, 41, 'descripcion', 'text', 'Descripcion', 1, 1, 1, 1, 1, 1, '{}', 3),
(372, 41, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 1, 1, '{}', 4),
(373, 41, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(374, 41, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 6),
(382, 47, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(383, 47, 'id_plan_servicio', 'text', 'Id Plan Servicio', 1, 1, 1, 1, 1, 1, '{}', 2),
(385, 47, 'cantidad', 'text', 'Cantidad', 1, 1, 1, 1, 1, 1, '{}', 4),
(386, 47, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(387, 47, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(388, 47, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 7),
(389, 47, 'app_dat_prereserva_belongsto_app_dat_plan_servicio_relationship', 'relationship', 'app_dat_plan_servicios', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatPlanServicio\",\"table\":\"app_dat_plan_servicios\",\"type\":\"belongsTo\",\"column\":\"id_plan_servicio\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(391, 49, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(392, 49, 'id_entidad', 'text', 'Id Entidad', 1, 1, 1, 1, 1, 1, '{}', 2),
(393, 49, 'id_local', 'text', 'Id Local', 1, 1, 1, 1, 1, 1, '{}', 3),
(394, 49, 'id_local_servicio', 'text', 'Id Local Servicio', 1, 1, 1, 1, 1, 1, '{}', 4),
(395, 49, 'tiempo', 'text', 'Tiempo', 0, 1, 1, 1, 1, 1, '{}', 5),
(396, 49, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(397, 49, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(398, 49, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 8),
(399, 49, 'app_conf_prereserva_belongsto_app_dat_entidade_relationship', 'relationship', 'app_dat_entidades', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatEntidade\",\"table\":\"app_dat_entidades\",\"type\":\"belongsTo\",\"column\":\"id_entidad\",\"key\":\"denominacion\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(400, 49, 'app_conf_prereserva_belongsto_app_dat_locale_relationship', 'relationship', 'app_dat_locales', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatLocale\",\"table\":\"app_dat_locales\",\"type\":\"belongsTo\",\"column\":\"id_local\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(401, 49, 'app_conf_prereserva_belongsto_app_dat_locales_servicio_relationship', 'relationship', 'app_dat_locales_servicios', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatLocalesServicio\",\"table\":\"app_dat_locales_servicios\",\"type\":\"belongsTo\",\"column\":\"id_local_servicio\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(402, 50, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(403, 50, 'id_dat_prereserva', 'text', 'Id Dat Prereserva', 1, 1, 1, 1, 1, 1, '{}', 2),
(404, 50, 'id_dat_plan_servicios', 'text', 'Id Dat Plan Servicios', 1, 1, 1, 1, 1, 1, '{}', 3),
(405, 50, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(406, 50, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(407, 50, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 6),
(408, 50, 'app_dat_plan_prereserva_belongsto_app_dat_prereserva_relationship', 'relationship', 'app_dat_prereserva', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatPrereserva\",\"table\":\"app_dat_prereserva\",\"type\":\"belongsTo\",\"column\":\"id_dat_prereserva\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(409, 50, 'app_dat_plan_prereserva_belongsto_app_dat_plan_servicio_relationship', 'relationship', 'app_dat_plan_servicios', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\AppDatPlanServicio\",\"table\":\"app_dat_plan_servicios\",\"type\":\"belongsTo\",\"column\":\"id_dat_plan_servicios\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"app_conf_confirmacion_servicio\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2020-04-11 15:09:49', '2020-04-11 15:09:49'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-04-11 15:09:49', '2020-04-11 15:09:49'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2020-04-11 15:09:49', '2020-04-11 15:09:49'),
(4, 'app_conf_confirmacion_servicio', 'app-conf-confirmacion-servicio', 'App Conf Confirmacion Servicio', 'App Conf Confirmacion Servicios', NULL, 'App\\Models\\AppConfConfirmacionServicio', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:03:01', '2020-04-16 18:27:28'),
(5, 'app_dat_agenda', 'app-dat-agenda', 'App Dat Agenda', 'App Dat Agendas', NULL, 'App\\Models\\AppDatAgenda', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:03:22', '2020-05-23 22:31:07'),
(6, 'app_dat_agenda_cambiada', 'app-dat-agenda-cambiada', 'App Dat Agenda Cambiada', 'App Dat Agenda Cambiadas', NULL, 'App\\Models\\AppDatAgendaCambiada', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:03:32', '2020-08-26 21:31:49'),
(7, 'app_dat_agenda_interrupcion', 'app-dat-agenda-interrupcion', 'App Dat Agenda Interrupcion', 'App Dat Agenda Interrupcions', NULL, 'App\\Models\\AppDatAgendaInterrupcion', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:03:37', '2020-04-16 18:28:23'),
(8, 'app_dat_agenda_prioridad', 'app-dat-agenda-prioridad', 'App Dat Agenda Prioridad', 'App Dat Agenda Prioridads', NULL, 'App\\Models\\AppDatAgendaPrioridad', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:03:43', '2020-04-16 18:28:28'),
(9, 'app_dat_cliente', 'app-dat-cliente', 'App Dat Cliente', 'App Dat Clientes', NULL, 'App\\Models\\AppDatCliente', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:03:53', '2020-05-30 04:21:40'),
(10, 'app_dat_distribucion_recursos', 'app-dat-distribucion-recursos', 'App Dat Distribucion Recurso', 'App Dat Distribucion Recursos', NULL, 'App\\Models\\AppDatDistribucionRecurso', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:04:25', '2020-04-16 18:28:51'),
(11, 'app_dat_distribucion_turnos', 'app-dat-distribucion-turnos', 'App Dat Distribucion Turno', 'App Dat Distribucion Turnos', NULL, 'App\\Models\\AppDatDistribucionTurno', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:04:31', '2020-04-16 18:49:01'),
(12, 'app_dat_entidades', 'app-dat-entidades', 'App Dat Entidade', 'App Dat Entidades', NULL, 'App\\Models\\AppDatEntidade', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:04:36', '2020-04-16 18:29:03'),
(13, 'app_dat_interrupciones', 'app-dat-interrupciones', 'App Dat Interrupcione', 'App Dat Interrupciones', NULL, 'App\\Models\\AppDatInterrupcione', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:04:43', '2020-04-16 18:29:12'),
(14, 'app_dat_locales', 'app-dat-locales', 'App Dat Locale', 'App Dat Locales', NULL, 'App\\Models\\AppDatLocale', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:04:48', '2020-05-30 04:22:33'),
(15, 'app_dat_locales_servicios', 'app-dat-locales-servicios', 'App Dat Locales Servicio', 'App Dat Locales Servicios', NULL, 'App\\Models\\AppDatLocalesServicio', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:04:56', '2020-06-16 23:13:46'),
(16, 'app_dat_recurso', 'app-dat-recurso', 'App Dat Recurso', 'App Dat Recursos', NULL, 'App\\Models\\AppDatRecurso', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:05:11', '2020-04-16 18:29:38'),
(17, 'app_dat_recurso_eventual', 'app-dat-recurso-eventual', 'App Dat Recurso Eventual', 'App Dat Recurso Eventuals', NULL, 'App\\Models\\AppDatRecursoEventual', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:05:17', '2020-04-16 18:30:22'),
(18, 'app_dat_recurso_general', 'app-dat-recurso-general', 'App Dat Recurso General', 'App Dat Recurso Generals', NULL, 'App\\Models\\AppDatRecursoGeneral', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-04-11 22:05:32', '2020-04-11 22:05:32'),
(19, 'app_dat_recursos_servicios', 'app-dat-recursos-servicios', 'App Dat Recursos Servicio', 'App Dat Recursos Servicios', NULL, 'App\\Models\\AppDatRecursosServicio', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:06:19', '2020-05-29 21:51:25'),
(20, 'app_dat_servicio_real', 'app-dat-servicio-real', 'App Dat Servicio Real', 'App Dat Servicio Reals', NULL, 'App\\Models\\AppDatServicioReal', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:06:29', '2020-04-16 18:30:16'),
(21, 'app_dat_servicios', 'app-dat-servicios', 'App Dat Servicio', 'App Dat Servicios', NULL, 'App\\Models\\AppDatServicio', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:06:34', '2020-08-26 02:26:46'),
(22, 'app_dat_turnos', 'app-dat-turnos', 'App Dat Turno', 'App Dat Turnos', NULL, 'App\\Models\\AppDatTurno', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:06:40', '2020-04-16 18:30:10'),
(23, 'app_dat_turnos_servicios', 'app-dat-turnos-servicios', 'App Dat Turnos Servicio', 'App Dat Turnos Servicios', NULL, 'App\\Models\\AppDatTurnosServicio', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:06:48', '2020-05-04 18:40:41'),
(24, 'app_mensaje', 'app-mensaje', 'App Mensaje', 'App Mensajes', NULL, 'App\\Models\\AppMensaje', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:06:57', '2020-04-16 18:30:00'),
(25, 'app_nom_branch_sectors', 'app-nom-branch-sectors', 'App Nom Branch Sector', 'App Nom Branch Sectors', NULL, 'App\\Models\\AppNomBranchSector', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:07:11', '2020-04-16 18:29:54'),
(26, 'app_nom_motivo_interrupcion', 'app-nom-motivo-interrupcion', 'App Nom Motivo Interrupcion', 'App Nom Motivo Interrupcions', NULL, 'App\\Models\\AppNomMotivoInterrupcion', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:07:17', '2020-04-16 18:31:16'),
(27, 'app_nom_organismo', 'app-nom-organismo', 'App Nom Organismo', 'App Nom Organismos', NULL, 'App\\Models\\AppNomOrganismo', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"denominacion\",\"order_display_column\":\"denominacion\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:07:22', '2020-04-16 18:31:20'),
(28, 'app_nom_periodo', 'app-nom-periodo', 'App Nom Periodo', 'App Nom Periodos', NULL, 'App\\Models\\AppNomPeriodo', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:07:28', '2020-04-16 19:02:07'),
(29, 'app_nom_prioridad', 'app-nom-prioridad', 'App Nom Prioridad', 'App Nom Prioridads', NULL, 'App\\Models\\AppNomPrioridad', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:07:55', '2020-04-16 18:31:29'),
(30, 'app_nom_tipo_mensaje', 'app-nom-tipo-mensaje', 'App Nom Tipo Mensaje', 'App Nom Tipo Mensajes', NULL, 'App\\Models\\AppNomTipoMensaje', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:08:13', '2020-04-16 18:31:34'),
(31, 'app_nom_tipo_recurso', 'app-nom-tipo-recurso', 'App Nom Tipo Recurso', 'App Nom Tipo Recursos', NULL, 'App\\Models\\AppNomTipoRecurso', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-04-11 22:08:23', '2020-04-11 22:08:23'),
(32, 'app_nom_tipo_servicios', 'app-nom-tipo-servicios', 'App Nom Tipo Servicio', 'App Nom Tipo Servicios', NULL, 'App\\Models\\AppNomTipoServicio', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:08:32', '2020-04-16 18:34:18'),
(33, 'app_notificaciones', 'app-notificaciones', 'App Notificacione', 'App Notificaciones', NULL, 'App\\Models\\AppNotificacione', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 22:08:38', '2020-04-16 18:31:04'),
(34, 'app_dat_plan_servicios', 'app-dat-plan-servicios', 'App Dat Plan Servicio', 'App Dat Plan Servicios', NULL, 'App\\Models\\AppDatPlanServicio', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-16 18:29:28', '2020-06-16 22:58:56'),
(35, 'app_dat_entidades_categorias', 'app-dat-entidades-categorias', 'App Dat Entidades Categoria', 'App Dat Entidades Categorias', NULL, 'App\\Models\\AppDatEntidadesCategoria', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-16 18:43:45', '2020-05-04 19:16:26'),
(36, 'app_nom_categoria_uso', 'app-nom-categoria-uso', 'App Nom Categoria Uso', 'App Nom Categoria Usos', NULL, 'App\\Models\\AppNomCategoriaUso', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-05-04 19:15:59', '2020-05-04 19:15:59'),
(37, 'app_dat_plan_agenda', 'app-dat-plan-agenda', 'App Dat Plan Agenda', 'App Dat Plan Agendas', NULL, 'App\\Models\\AppDatPlanAgenda', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-05-23 16:55:36', '2020-05-23 19:25:59'),
(38, 'app_dat_valoraciones', 'app-dat-valoraciones', 'App Dat Valoracion', 'App Dat Valoraciones', NULL, 'App\\Models\\AppDatValoracion', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-07-07 23:09:31', '2020-07-08 00:17:36'),
(39, 'app_estadisticas', 'app-estadisticas', 'App Estadistica', 'App Estadisticas', NULL, 'App\\Models\\AppEstadistica', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-07-08 02:16:26', '2020-07-08 02:18:16'),
(41, 'app_dat_actividades', 'app-dat-actividades', 'App Dat Actividades', 'App Dat Actividades', NULL, 'App\\Models\\AppDatActividades', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-08-26 02:33:40', '2020-08-26 02:39:04'),
(47, 'app_dat_prereserva', 'app-dat-prereserva', 'App Dat Prereserva', 'App Dat Prereservas', NULL, 'App\\Models\\AppDatPrereserva', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-08-26 21:29:26', '2020-09-01 20:02:26'),
(49, 'app_conf_prereserva', 'app-conf-prereserva', 'App Conf Prereserva', 'App Conf Prereservas', NULL, 'App\\Models\\AppConfPrereserva', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-09-01 19:17:42', '2020-09-01 20:28:58'),
(50, 'app_dat_plan_prereserva', 'app-dat-plan-prereserva', 'App Dat Plan Prereserva', 'App Dat Plan Prereservas', NULL, 'App\\Models\\AppDatPlanPrereserva', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-09-01 20:19:16', '2020-09-01 20:23:47');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-04-11 15:09:50', '2020-04-11 15:09:50');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-04-11 15:09:50', '2020-04-11 15:09:50', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 4, '2020-04-11 15:09:50', '2020-04-11 23:32:08', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2020-04-11 15:09:50', '2020-04-11 15:09:50', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2020-04-11 15:09:50', '2020-04-11 15:09:50', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 5, '2020-04-11 15:09:50', '2020-04-11 23:32:08', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2020-04-11 15:09:50', '2020-04-11 23:32:09', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2020-04-11 15:09:50', '2020-04-11 23:32:09', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2020-04-11 15:09:50', '2020-04-11 23:32:09', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2020-04-11 15:09:50', '2020-04-11 23:32:09', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 6, '2020-04-11 15:09:50', '2020-04-11 23:32:09', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2020-04-11 15:09:54', '2020-04-11 23:32:09', 'voyager.hooks', NULL),
(12, 1, 'App Conf Confirmacion Servicios', '', '_self', NULL, NULL, 42, 1, '2020-04-11 22:03:01', '2020-04-11 23:34:23', 'voyager.app-conf-confirmacion-servicio.index', NULL),
(13, 1, 'App Dat Agendas', '', '_self', NULL, NULL, 42, 2, '2020-04-11 22:03:22', '2020-04-11 23:34:23', 'voyager.app-dat-agenda.index', NULL),
(14, 1, 'App Dat Agenda Cambiadas', '', '_self', NULL, NULL, 42, 3, '2020-04-11 22:03:32', '2020-04-11 23:34:23', 'voyager.app-dat-agenda-cambiada.index', NULL),
(15, 1, 'App Dat Agenda Interrupcions', '', '_self', NULL, NULL, 42, 4, '2020-04-11 22:03:37', '2020-04-11 23:34:23', 'voyager.app-dat-agenda-interrupcion.index', NULL),
(16, 1, 'App Dat Agenda Prioridads', '', '_self', NULL, NULL, 42, 5, '2020-04-11 22:03:43', '2020-04-11 23:34:23', 'voyager.app-dat-agenda-prioridad.index', NULL),
(17, 1, 'App Dat Clientes', '', '_self', NULL, NULL, 42, 6, '2020-04-11 22:03:53', '2020-04-11 23:34:23', 'voyager.app-dat-cliente.index', NULL),
(18, 1, 'App Dat Distribucion Recursos', '', '_self', NULL, NULL, 42, 8, '2020-04-11 22:04:26', '2020-04-11 23:34:23', 'voyager.app-dat-distribucion-recursos.index', NULL),
(19, 1, 'App Dat Distribucion Turnos', '', '_self', NULL, NULL, 42, 9, '2020-04-11 22:04:31', '2020-04-11 23:34:23', 'voyager.app-dat-distribucion-turnos.index', NULL),
(20, 1, 'App Dat Entidades', '', '_self', NULL, NULL, 42, 10, '2020-04-11 22:04:37', '2020-04-11 23:34:23', 'voyager.app-dat-entidades.index', NULL),
(21, 1, 'App Dat Interrupciones', '', '_self', NULL, NULL, 42, 7, '2020-04-11 22:04:43', '2020-04-11 23:34:23', 'voyager.app-dat-interrupciones.index', NULL),
(22, 1, 'App Dat Locales', '', '_self', NULL, NULL, 42, 11, '2020-04-11 22:04:49', '2020-04-11 23:34:23', 'voyager.app-dat-locales.index', NULL),
(23, 1, 'App Dat Locales Servicios', '', '_self', NULL, NULL, 42, 12, '2020-04-11 22:04:56', '2020-04-11 23:34:23', 'voyager.app-dat-locales-servicios.index', NULL),
(24, 1, 'App Dat Recursos', '', '_self', NULL, NULL, 42, 13, '2020-04-11 22:05:11', '2020-04-11 23:34:23', 'voyager.app-dat-recurso.index', NULL),
(25, 1, 'App Dat Recurso Eventuals', '', '_self', NULL, NULL, 42, 14, '2020-04-11 22:05:17', '2020-04-11 23:34:24', 'voyager.app-dat-recurso-eventual.index', NULL),
(26, 1, 'App Dat Recurso Generals', '', '_self', NULL, NULL, 42, 15, '2020-04-11 22:05:32', '2020-04-11 23:34:24', 'voyager.app-dat-recurso-general.index', NULL),
(27, 1, 'App Dat Recursos Servicios', '', '_self', NULL, NULL, 42, 16, '2020-04-11 22:06:19', '2020-04-11 23:34:24', 'voyager.app-dat-recursos-servicios.index', NULL),
(28, 1, 'App Dat Servicio Reals', '', '_self', NULL, NULL, 42, 20, '2020-04-11 22:06:29', '2020-04-11 23:34:24', 'voyager.app-dat-servicio-real.index', NULL),
(29, 1, 'App Dat Servicios', '', '_self', NULL, NULL, 42, 19, '2020-04-11 22:06:35', '2020-04-11 23:34:24', 'voyager.app-dat-servicios.index', NULL),
(30, 1, 'App Dat Turnos', '', '_self', NULL, NULL, 42, 18, '2020-04-11 22:06:40', '2020-04-11 23:34:24', 'voyager.app-dat-turnos.index', NULL),
(31, 1, 'App Dat Turnos Servicios', '', '_self', NULL, NULL, 42, 17, '2020-04-11 22:06:48', '2020-04-11 23:34:24', 'voyager.app-dat-turnos-servicios.index', NULL),
(32, 1, 'App Mensajes', '', '_self', NULL, NULL, 44, 1, '2020-04-11 22:06:57', '2020-04-11 23:34:56', 'voyager.app-mensaje.index', NULL),
(33, 1, 'App Nom Branch Sectors', '', '_self', NULL, NULL, 43, 1, '2020-04-11 22:07:11', '2020-04-11 23:33:01', 'voyager.app-nom-branch-sectors.index', NULL),
(34, 1, 'App Nom Motivo Interrupcions', '', '_self', NULL, NULL, 43, 3, '2020-04-11 22:07:17', '2020-05-04 19:21:11', 'voyager.app-nom-motivo-interrupcion.index', NULL),
(35, 1, 'App Nom Organismos', '', '_self', NULL, NULL, 43, 4, '2020-04-11 22:07:22', '2020-05-04 19:21:11', 'voyager.app-nom-organismo.index', NULL),
(36, 1, 'App Nom Periodos', '', '_self', NULL, NULL, 43, 9, '2020-04-11 22:07:28', '2020-05-04 19:21:11', 'voyager.app-nom-periodo.index', NULL),
(37, 1, 'App Nom Prioridads', '', '_self', NULL, NULL, 43, 8, '2020-04-11 22:07:55', '2020-05-04 19:21:11', 'voyager.app-nom-prioridad.index', NULL),
(38, 1, 'App Nom Tipo Mensajes', '', '_self', NULL, NULL, 43, 7, '2020-04-11 22:08:13', '2020-05-04 19:21:11', 'voyager.app-nom-tipo-mensaje.index', NULL),
(39, 1, 'App Nom Tipo Recursos', '', '_self', NULL, NULL, 43, 6, '2020-04-11 22:08:23', '2020-05-04 19:21:11', 'voyager.app-nom-tipo-recurso.index', NULL),
(40, 1, 'App Nom Tipo Servicios', '', '_self', NULL, NULL, 43, 5, '2020-04-11 22:08:32', '2020-05-04 19:21:11', 'voyager.app-nom-tipo-servicios.index', NULL),
(41, 1, 'App Notificaciones', '', '_self', NULL, NULL, 44, 2, '2020-04-11 22:08:38', '2020-04-11 23:35:00', 'voyager.app-notificaciones.index', NULL),
(42, 1, 'Negocio', '', '_self', 'voyager-company', '#000000', NULL, 7, '2020-04-11 23:32:27', '2020-04-11 23:36:15', NULL, ''),
(43, 1, 'Nomencladores', '', '_self', 'voyager-params', '#000000', NULL, 8, '2020-04-11 23:32:38', '2020-04-11 23:37:36', NULL, ''),
(44, 1, 'Notificaciones', '', '_self', 'voyager-paper-plane', '#000000', NULL, 9, '2020-04-11 23:34:46', '2020-04-11 23:38:04', NULL, ''),
(45, 1, 'App Dat Plan Servicios', '', '_self', NULL, NULL, 42, 21, '2020-04-16 18:29:28', '2020-04-16 19:06:55', 'voyager.app-dat-plan-servicios.index', NULL),
(46, 1, 'App Dat Entidades Categorias', '', '_self', NULL, NULL, 42, 22, '2020-04-16 18:43:45', '2020-04-16 19:07:00', 'voyager.app-dat-entidades-categorias.index', NULL),
(47, 1, 'App Nom Categoria Usos', '', '_self', NULL, NULL, 43, 2, '2020-05-04 19:15:59', '2020-05-04 19:21:11', 'voyager.app-nom-categoria-uso.index', NULL),
(48, 1, 'App Dat Plan Agendas', '', '_self', NULL, NULL, NULL, 10, '2020-05-23 16:55:37', '2020-05-23 16:55:37', 'voyager.app-dat-plan-agenda.index', NULL),
(49, 1, 'App Dat Valoraciones', '', '_self', NULL, NULL, NULL, 11, '2020-07-07 23:09:31', '2020-07-07 23:09:31', 'voyager.app-dat-valoraciones.index', NULL),
(50, 1, 'App Estadisticas', '', '_self', NULL, NULL, NULL, 12, '2020-07-08 02:16:26', '2020-07-08 02:16:26', 'voyager.app-estadisticas.index', NULL),
(51, 1, 'App Dat Actividades', '', '_self', NULL, NULL, NULL, 13, '2020-08-26 02:33:41', '2020-08-26 02:33:41', 'voyager.app-dat-actividades.index', NULL),
(53, 1, 'App Dat Prereservas', '', '_self', NULL, NULL, NULL, 14, '2020-08-26 21:29:26', '2020-08-26 21:29:26', 'voyager.app-dat-prereserva.index', NULL),
(54, 1, 'App Conf Prereservas', '', '_self', NULL, NULL, NULL, 15, '2020-09-01 19:17:42', '2020-09-01 19:17:42', 'voyager.app-conf-prereserva.index', NULL),
(55, 1, 'App Dat Plan Prereservas', '', '_self', NULL, NULL, NULL, 16, '2020-09-01 20:19:17', '2020-09-01 20:19:17', 'voyager.app-dat-plan-prereserva.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(7, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(8, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(9, '2016_06_01_000004_create_oauth_clients_table', 1),
(10, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(11, '2016_10_21_190000_create_roles_table', 1),
(12, '2016_10_21_190000_create_settings_table', 1),
(13, '2016_11_30_135954_create_permission_table', 1),
(14, '2016_11_30_141208_create_permission_role_table', 1),
(15, '2016_12_26_201236_data_types__add__server_side', 1),
(16, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(17, '2017_01_14_005015_create_translations_table', 1),
(18, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(19, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(20, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(21, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(22, '2017_08_05_000000_add_group_to_settings_table', 1),
(23, '2017_11_26_013050_add_user_role_relationship', 1),
(24, '2017_11_26_015000_create_user_roles_table', 1),
(25, '2018_03_11_000000_add_user_settings', 1),
(26, '2018_03_14_000000_add_details_to_data_types_table', 1),
(27, '2018_03_16_000000_make_settings_value_nullable', 1),
(28, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-04-11 15:09:51', '2020-04-11 15:09:51'),
(2, 'browse_bread', NULL, '2020-04-11 15:09:51', '2020-04-11 15:09:51'),
(3, 'browse_database', NULL, '2020-04-11 15:09:51', '2020-04-11 15:09:51'),
(4, 'browse_media', NULL, '2020-04-11 15:09:51', '2020-04-11 15:09:51'),
(5, 'browse_compass', NULL, '2020-04-11 15:09:51', '2020-04-11 15:09:51'),
(6, 'browse_menus', 'menus', '2020-04-11 15:09:51', '2020-04-11 15:09:51'),
(7, 'read_menus', 'menus', '2020-04-11 15:09:51', '2020-04-11 15:09:51'),
(8, 'edit_menus', 'menus', '2020-04-11 15:09:51', '2020-04-11 15:09:51'),
(9, 'add_menus', 'menus', '2020-04-11 15:09:51', '2020-04-11 15:09:51'),
(10, 'delete_menus', 'menus', '2020-04-11 15:09:51', '2020-04-11 15:09:51'),
(11, 'browse_roles', 'roles', '2020-04-11 15:09:51', '2020-04-11 15:09:51'),
(12, 'read_roles', 'roles', '2020-04-11 15:09:51', '2020-04-11 15:09:51'),
(13, 'edit_roles', 'roles', '2020-04-11 15:09:51', '2020-04-11 15:09:51'),
(14, 'add_roles', 'roles', '2020-04-11 15:09:51', '2020-04-11 15:09:51'),
(15, 'delete_roles', 'roles', '2020-04-11 15:09:51', '2020-04-11 15:09:51'),
(16, 'browse_users', 'users', '2020-04-11 15:09:51', '2020-04-11 15:09:51'),
(17, 'read_users', 'users', '2020-04-11 15:09:51', '2020-04-11 15:09:51'),
(18, 'edit_users', 'users', '2020-04-11 15:09:51', '2020-04-11 15:09:51'),
(19, 'add_users', 'users', '2020-04-11 15:09:51', '2020-04-11 15:09:51'),
(20, 'delete_users', 'users', '2020-04-11 15:09:51', '2020-04-11 15:09:51'),
(21, 'browse_settings', 'settings', '2020-04-11 15:09:52', '2020-04-11 15:09:52'),
(22, 'read_settings', 'settings', '2020-04-11 15:09:52', '2020-04-11 15:09:52'),
(23, 'edit_settings', 'settings', '2020-04-11 15:09:52', '2020-04-11 15:09:52'),
(24, 'add_settings', 'settings', '2020-04-11 15:09:52', '2020-04-11 15:09:52'),
(25, 'delete_settings', 'settings', '2020-04-11 15:09:52', '2020-04-11 15:09:52'),
(26, 'browse_hooks', NULL, '2020-04-11 15:09:54', '2020-04-11 15:09:54'),
(27, 'browse_app_conf_confirmacion_servicio', 'app_conf_confirmacion_servicio', '2020-04-11 22:03:01', '2020-04-11 22:03:01'),
(28, 'read_app_conf_confirmacion_servicio', 'app_conf_confirmacion_servicio', '2020-04-11 22:03:01', '2020-04-11 22:03:01'),
(29, 'edit_app_conf_confirmacion_servicio', 'app_conf_confirmacion_servicio', '2020-04-11 22:03:01', '2020-04-11 22:03:01'),
(30, 'add_app_conf_confirmacion_servicio', 'app_conf_confirmacion_servicio', '2020-04-11 22:03:01', '2020-04-11 22:03:01'),
(31, 'delete_app_conf_confirmacion_servicio', 'app_conf_confirmacion_servicio', '2020-04-11 22:03:01', '2020-04-11 22:03:01'),
(32, 'browse_app_dat_agenda', 'app_dat_agenda', '2020-04-11 22:03:22', '2020-04-11 22:03:22'),
(33, 'read_app_dat_agenda', 'app_dat_agenda', '2020-04-11 22:03:22', '2020-04-11 22:03:22'),
(34, 'edit_app_dat_agenda', 'app_dat_agenda', '2020-04-11 22:03:22', '2020-04-11 22:03:22'),
(35, 'add_app_dat_agenda', 'app_dat_agenda', '2020-04-11 22:03:22', '2020-04-11 22:03:22'),
(36, 'delete_app_dat_agenda', 'app_dat_agenda', '2020-04-11 22:03:22', '2020-04-11 22:03:22'),
(37, 'browse_app_dat_agenda_cambiada', 'app_dat_agenda_cambiada', '2020-04-11 22:03:32', '2020-04-11 22:03:32'),
(38, 'read_app_dat_agenda_cambiada', 'app_dat_agenda_cambiada', '2020-04-11 22:03:32', '2020-04-11 22:03:32'),
(39, 'edit_app_dat_agenda_cambiada', 'app_dat_agenda_cambiada', '2020-04-11 22:03:32', '2020-04-11 22:03:32'),
(40, 'add_app_dat_agenda_cambiada', 'app_dat_agenda_cambiada', '2020-04-11 22:03:32', '2020-04-11 22:03:32'),
(41, 'delete_app_dat_agenda_cambiada', 'app_dat_agenda_cambiada', '2020-04-11 22:03:32', '2020-04-11 22:03:32'),
(42, 'browse_app_dat_agenda_interrupcion', 'app_dat_agenda_interrupcion', '2020-04-11 22:03:37', '2020-04-11 22:03:37'),
(43, 'read_app_dat_agenda_interrupcion', 'app_dat_agenda_interrupcion', '2020-04-11 22:03:37', '2020-04-11 22:03:37'),
(44, 'edit_app_dat_agenda_interrupcion', 'app_dat_agenda_interrupcion', '2020-04-11 22:03:37', '2020-04-11 22:03:37'),
(45, 'add_app_dat_agenda_interrupcion', 'app_dat_agenda_interrupcion', '2020-04-11 22:03:37', '2020-04-11 22:03:37'),
(46, 'delete_app_dat_agenda_interrupcion', 'app_dat_agenda_interrupcion', '2020-04-11 22:03:37', '2020-04-11 22:03:37'),
(47, 'browse_app_dat_agenda_prioridad', 'app_dat_agenda_prioridad', '2020-04-11 22:03:43', '2020-04-11 22:03:43'),
(48, 'read_app_dat_agenda_prioridad', 'app_dat_agenda_prioridad', '2020-04-11 22:03:43', '2020-04-11 22:03:43'),
(49, 'edit_app_dat_agenda_prioridad', 'app_dat_agenda_prioridad', '2020-04-11 22:03:43', '2020-04-11 22:03:43'),
(50, 'add_app_dat_agenda_prioridad', 'app_dat_agenda_prioridad', '2020-04-11 22:03:43', '2020-04-11 22:03:43'),
(51, 'delete_app_dat_agenda_prioridad', 'app_dat_agenda_prioridad', '2020-04-11 22:03:43', '2020-04-11 22:03:43'),
(52, 'browse_app_dat_cliente', 'app_dat_cliente', '2020-04-11 22:03:53', '2020-04-11 22:03:53'),
(53, 'read_app_dat_cliente', 'app_dat_cliente', '2020-04-11 22:03:53', '2020-04-11 22:03:53'),
(54, 'edit_app_dat_cliente', 'app_dat_cliente', '2020-04-11 22:03:53', '2020-04-11 22:03:53'),
(55, 'add_app_dat_cliente', 'app_dat_cliente', '2020-04-11 22:03:53', '2020-04-11 22:03:53'),
(56, 'delete_app_dat_cliente', 'app_dat_cliente', '2020-04-11 22:03:53', '2020-04-11 22:03:53'),
(57, 'browse_app_dat_distribucion_recursos', 'app_dat_distribucion_recursos', '2020-04-11 22:04:25', '2020-04-11 22:04:25'),
(58, 'read_app_dat_distribucion_recursos', 'app_dat_distribucion_recursos', '2020-04-11 22:04:25', '2020-04-11 22:04:25'),
(59, 'edit_app_dat_distribucion_recursos', 'app_dat_distribucion_recursos', '2020-04-11 22:04:25', '2020-04-11 22:04:25'),
(60, 'add_app_dat_distribucion_recursos', 'app_dat_distribucion_recursos', '2020-04-11 22:04:25', '2020-04-11 22:04:25'),
(61, 'delete_app_dat_distribucion_recursos', 'app_dat_distribucion_recursos', '2020-04-11 22:04:25', '2020-04-11 22:04:25'),
(62, 'browse_app_dat_distribucion_turnos', 'app_dat_distribucion_turnos', '2020-04-11 22:04:31', '2020-04-11 22:04:31'),
(63, 'read_app_dat_distribucion_turnos', 'app_dat_distribucion_turnos', '2020-04-11 22:04:31', '2020-04-11 22:04:31'),
(64, 'edit_app_dat_distribucion_turnos', 'app_dat_distribucion_turnos', '2020-04-11 22:04:31', '2020-04-11 22:04:31'),
(65, 'add_app_dat_distribucion_turnos', 'app_dat_distribucion_turnos', '2020-04-11 22:04:31', '2020-04-11 22:04:31'),
(66, 'delete_app_dat_distribucion_turnos', 'app_dat_distribucion_turnos', '2020-04-11 22:04:31', '2020-04-11 22:04:31'),
(67, 'browse_app_dat_entidades', 'app_dat_entidades', '2020-04-11 22:04:37', '2020-04-11 22:04:37'),
(68, 'read_app_dat_entidades', 'app_dat_entidades', '2020-04-11 22:04:37', '2020-04-11 22:04:37'),
(69, 'edit_app_dat_entidades', 'app_dat_entidades', '2020-04-11 22:04:37', '2020-04-11 22:04:37'),
(70, 'add_app_dat_entidades', 'app_dat_entidades', '2020-04-11 22:04:37', '2020-04-11 22:04:37'),
(71, 'delete_app_dat_entidades', 'app_dat_entidades', '2020-04-11 22:04:37', '2020-04-11 22:04:37'),
(72, 'browse_app_dat_interrupciones', 'app_dat_interrupciones', '2020-04-11 22:04:43', '2020-04-11 22:04:43'),
(73, 'read_app_dat_interrupciones', 'app_dat_interrupciones', '2020-04-11 22:04:43', '2020-04-11 22:04:43'),
(74, 'edit_app_dat_interrupciones', 'app_dat_interrupciones', '2020-04-11 22:04:43', '2020-04-11 22:04:43'),
(75, 'add_app_dat_interrupciones', 'app_dat_interrupciones', '2020-04-11 22:04:43', '2020-04-11 22:04:43'),
(76, 'delete_app_dat_interrupciones', 'app_dat_interrupciones', '2020-04-11 22:04:43', '2020-04-11 22:04:43'),
(77, 'browse_app_dat_locales', 'app_dat_locales', '2020-04-11 22:04:48', '2020-04-11 22:04:48'),
(78, 'read_app_dat_locales', 'app_dat_locales', '2020-04-11 22:04:48', '2020-04-11 22:04:48'),
(79, 'edit_app_dat_locales', 'app_dat_locales', '2020-04-11 22:04:48', '2020-04-11 22:04:48'),
(80, 'add_app_dat_locales', 'app_dat_locales', '2020-04-11 22:04:49', '2020-04-11 22:04:49'),
(81, 'delete_app_dat_locales', 'app_dat_locales', '2020-04-11 22:04:49', '2020-04-11 22:04:49'),
(82, 'browse_app_dat_locales_servicios', 'app_dat_locales_servicios', '2020-04-11 22:04:56', '2020-04-11 22:04:56'),
(83, 'read_app_dat_locales_servicios', 'app_dat_locales_servicios', '2020-04-11 22:04:56', '2020-04-11 22:04:56'),
(84, 'edit_app_dat_locales_servicios', 'app_dat_locales_servicios', '2020-04-11 22:04:56', '2020-04-11 22:04:56'),
(85, 'add_app_dat_locales_servicios', 'app_dat_locales_servicios', '2020-04-11 22:04:56', '2020-04-11 22:04:56'),
(86, 'delete_app_dat_locales_servicios', 'app_dat_locales_servicios', '2020-04-11 22:04:56', '2020-04-11 22:04:56'),
(87, 'browse_app_dat_recurso', 'app_dat_recurso', '2020-04-11 22:05:11', '2020-04-11 22:05:11'),
(88, 'read_app_dat_recurso', 'app_dat_recurso', '2020-04-11 22:05:11', '2020-04-11 22:05:11'),
(89, 'edit_app_dat_recurso', 'app_dat_recurso', '2020-04-11 22:05:11', '2020-04-11 22:05:11'),
(90, 'add_app_dat_recurso', 'app_dat_recurso', '2020-04-11 22:05:11', '2020-04-11 22:05:11'),
(91, 'delete_app_dat_recurso', 'app_dat_recurso', '2020-04-11 22:05:11', '2020-04-11 22:05:11'),
(92, 'browse_app_dat_recurso_eventual', 'app_dat_recurso_eventual', '2020-04-11 22:05:17', '2020-04-11 22:05:17'),
(93, 'read_app_dat_recurso_eventual', 'app_dat_recurso_eventual', '2020-04-11 22:05:17', '2020-04-11 22:05:17'),
(94, 'edit_app_dat_recurso_eventual', 'app_dat_recurso_eventual', '2020-04-11 22:05:17', '2020-04-11 22:05:17'),
(95, 'add_app_dat_recurso_eventual', 'app_dat_recurso_eventual', '2020-04-11 22:05:17', '2020-04-11 22:05:17'),
(96, 'delete_app_dat_recurso_eventual', 'app_dat_recurso_eventual', '2020-04-11 22:05:17', '2020-04-11 22:05:17'),
(97, 'browse_app_dat_recurso_general', 'app_dat_recurso_general', '2020-04-11 22:05:32', '2020-04-11 22:05:32'),
(98, 'read_app_dat_recurso_general', 'app_dat_recurso_general', '2020-04-11 22:05:32', '2020-04-11 22:05:32'),
(99, 'edit_app_dat_recurso_general', 'app_dat_recurso_general', '2020-04-11 22:05:32', '2020-04-11 22:05:32'),
(100, 'add_app_dat_recurso_general', 'app_dat_recurso_general', '2020-04-11 22:05:32', '2020-04-11 22:05:32'),
(101, 'delete_app_dat_recurso_general', 'app_dat_recurso_general', '2020-04-11 22:05:32', '2020-04-11 22:05:32'),
(102, 'browse_app_dat_recursos_servicios', 'app_dat_recursos_servicios', '2020-04-11 22:06:19', '2020-04-11 22:06:19'),
(103, 'read_app_dat_recursos_servicios', 'app_dat_recursos_servicios', '2020-04-11 22:06:19', '2020-04-11 22:06:19'),
(104, 'edit_app_dat_recursos_servicios', 'app_dat_recursos_servicios', '2020-04-11 22:06:19', '2020-04-11 22:06:19'),
(105, 'add_app_dat_recursos_servicios', 'app_dat_recursos_servicios', '2020-04-11 22:06:19', '2020-04-11 22:06:19'),
(106, 'delete_app_dat_recursos_servicios', 'app_dat_recursos_servicios', '2020-04-11 22:06:19', '2020-04-11 22:06:19'),
(107, 'browse_app_dat_servicio_real', 'app_dat_servicio_real', '2020-04-11 22:06:29', '2020-04-11 22:06:29'),
(108, 'read_app_dat_servicio_real', 'app_dat_servicio_real', '2020-04-11 22:06:29', '2020-04-11 22:06:29'),
(109, 'edit_app_dat_servicio_real', 'app_dat_servicio_real', '2020-04-11 22:06:29', '2020-04-11 22:06:29'),
(110, 'add_app_dat_servicio_real', 'app_dat_servicio_real', '2020-04-11 22:06:29', '2020-04-11 22:06:29'),
(111, 'delete_app_dat_servicio_real', 'app_dat_servicio_real', '2020-04-11 22:06:29', '2020-04-11 22:06:29'),
(112, 'browse_app_dat_servicios', 'app_dat_servicios', '2020-04-11 22:06:34', '2020-04-11 22:06:34'),
(113, 'read_app_dat_servicios', 'app_dat_servicios', '2020-04-11 22:06:34', '2020-04-11 22:06:34'),
(114, 'edit_app_dat_servicios', 'app_dat_servicios', '2020-04-11 22:06:35', '2020-04-11 22:06:35'),
(115, 'add_app_dat_servicios', 'app_dat_servicios', '2020-04-11 22:06:35', '2020-04-11 22:06:35'),
(116, 'delete_app_dat_servicios', 'app_dat_servicios', '2020-04-11 22:06:35', '2020-04-11 22:06:35'),
(117, 'browse_app_dat_turnos', 'app_dat_turnos', '2020-04-11 22:06:40', '2020-04-11 22:06:40'),
(118, 'read_app_dat_turnos', 'app_dat_turnos', '2020-04-11 22:06:40', '2020-04-11 22:06:40'),
(119, 'edit_app_dat_turnos', 'app_dat_turnos', '2020-04-11 22:06:40', '2020-04-11 22:06:40'),
(120, 'add_app_dat_turnos', 'app_dat_turnos', '2020-04-11 22:06:40', '2020-04-11 22:06:40'),
(121, 'delete_app_dat_turnos', 'app_dat_turnos', '2020-04-11 22:06:40', '2020-04-11 22:06:40'),
(122, 'browse_app_dat_turnos_servicios', 'app_dat_turnos_servicios', '2020-04-11 22:06:48', '2020-04-11 22:06:48'),
(123, 'read_app_dat_turnos_servicios', 'app_dat_turnos_servicios', '2020-04-11 22:06:48', '2020-04-11 22:06:48'),
(124, 'edit_app_dat_turnos_servicios', 'app_dat_turnos_servicios', '2020-04-11 22:06:48', '2020-04-11 22:06:48'),
(125, 'add_app_dat_turnos_servicios', 'app_dat_turnos_servicios', '2020-04-11 22:06:48', '2020-04-11 22:06:48'),
(126, 'delete_app_dat_turnos_servicios', 'app_dat_turnos_servicios', '2020-04-11 22:06:48', '2020-04-11 22:06:48'),
(127, 'browse_app_mensaje', 'app_mensaje', '2020-04-11 22:06:57', '2020-04-11 22:06:57'),
(128, 'read_app_mensaje', 'app_mensaje', '2020-04-11 22:06:57', '2020-04-11 22:06:57'),
(129, 'edit_app_mensaje', 'app_mensaje', '2020-04-11 22:06:57', '2020-04-11 22:06:57'),
(130, 'add_app_mensaje', 'app_mensaje', '2020-04-11 22:06:57', '2020-04-11 22:06:57'),
(131, 'delete_app_mensaje', 'app_mensaje', '2020-04-11 22:06:57', '2020-04-11 22:06:57'),
(132, 'browse_app_nom_branch_sectors', 'app_nom_branch_sectors', '2020-04-11 22:07:11', '2020-04-11 22:07:11'),
(133, 'read_app_nom_branch_sectors', 'app_nom_branch_sectors', '2020-04-11 22:07:11', '2020-04-11 22:07:11'),
(134, 'edit_app_nom_branch_sectors', 'app_nom_branch_sectors', '2020-04-11 22:07:11', '2020-04-11 22:07:11'),
(135, 'add_app_nom_branch_sectors', 'app_nom_branch_sectors', '2020-04-11 22:07:11', '2020-04-11 22:07:11'),
(136, 'delete_app_nom_branch_sectors', 'app_nom_branch_sectors', '2020-04-11 22:07:11', '2020-04-11 22:07:11'),
(137, 'browse_app_nom_motivo_interrupcion', 'app_nom_motivo_interrupcion', '2020-04-11 22:07:17', '2020-04-11 22:07:17'),
(138, 'read_app_nom_motivo_interrupcion', 'app_nom_motivo_interrupcion', '2020-04-11 22:07:17', '2020-04-11 22:07:17'),
(139, 'edit_app_nom_motivo_interrupcion', 'app_nom_motivo_interrupcion', '2020-04-11 22:07:17', '2020-04-11 22:07:17'),
(140, 'add_app_nom_motivo_interrupcion', 'app_nom_motivo_interrupcion', '2020-04-11 22:07:17', '2020-04-11 22:07:17'),
(141, 'delete_app_nom_motivo_interrupcion', 'app_nom_motivo_interrupcion', '2020-04-11 22:07:17', '2020-04-11 22:07:17'),
(142, 'browse_app_nom_organismo', 'app_nom_organismo', '2020-04-11 22:07:22', '2020-04-11 22:07:22'),
(143, 'read_app_nom_organismo', 'app_nom_organismo', '2020-04-11 22:07:22', '2020-04-11 22:07:22'),
(144, 'edit_app_nom_organismo', 'app_nom_organismo', '2020-04-11 22:07:22', '2020-04-11 22:07:22'),
(145, 'add_app_nom_organismo', 'app_nom_organismo', '2020-04-11 22:07:22', '2020-04-11 22:07:22'),
(146, 'delete_app_nom_organismo', 'app_nom_organismo', '2020-04-11 22:07:22', '2020-04-11 22:07:22'),
(147, 'browse_app_nom_periodo', 'app_nom_periodo', '2020-04-11 22:07:28', '2020-04-11 22:07:28'),
(148, 'read_app_nom_periodo', 'app_nom_periodo', '2020-04-11 22:07:28', '2020-04-11 22:07:28'),
(149, 'edit_app_nom_periodo', 'app_nom_periodo', '2020-04-11 22:07:28', '2020-04-11 22:07:28'),
(150, 'add_app_nom_periodo', 'app_nom_periodo', '2020-04-11 22:07:28', '2020-04-11 22:07:28'),
(151, 'delete_app_nom_periodo', 'app_nom_periodo', '2020-04-11 22:07:28', '2020-04-11 22:07:28'),
(152, 'browse_app_nom_prioridad', 'app_nom_prioridad', '2020-04-11 22:07:55', '2020-04-11 22:07:55'),
(153, 'read_app_nom_prioridad', 'app_nom_prioridad', '2020-04-11 22:07:55', '2020-04-11 22:07:55'),
(154, 'edit_app_nom_prioridad', 'app_nom_prioridad', '2020-04-11 22:07:55', '2020-04-11 22:07:55'),
(155, 'add_app_nom_prioridad', 'app_nom_prioridad', '2020-04-11 22:07:55', '2020-04-11 22:07:55'),
(156, 'delete_app_nom_prioridad', 'app_nom_prioridad', '2020-04-11 22:07:55', '2020-04-11 22:07:55'),
(157, 'browse_app_nom_tipo_mensaje', 'app_nom_tipo_mensaje', '2020-04-11 22:08:13', '2020-04-11 22:08:13'),
(158, 'read_app_nom_tipo_mensaje', 'app_nom_tipo_mensaje', '2020-04-11 22:08:13', '2020-04-11 22:08:13'),
(159, 'edit_app_nom_tipo_mensaje', 'app_nom_tipo_mensaje', '2020-04-11 22:08:13', '2020-04-11 22:08:13'),
(160, 'add_app_nom_tipo_mensaje', 'app_nom_tipo_mensaje', '2020-04-11 22:08:13', '2020-04-11 22:08:13'),
(161, 'delete_app_nom_tipo_mensaje', 'app_nom_tipo_mensaje', '2020-04-11 22:08:13', '2020-04-11 22:08:13'),
(162, 'browse_app_nom_tipo_recurso', 'app_nom_tipo_recurso', '2020-04-11 22:08:23', '2020-04-11 22:08:23'),
(163, 'read_app_nom_tipo_recurso', 'app_nom_tipo_recurso', '2020-04-11 22:08:23', '2020-04-11 22:08:23'),
(164, 'edit_app_nom_tipo_recurso', 'app_nom_tipo_recurso', '2020-04-11 22:08:23', '2020-04-11 22:08:23'),
(165, 'add_app_nom_tipo_recurso', 'app_nom_tipo_recurso', '2020-04-11 22:08:23', '2020-04-11 22:08:23'),
(166, 'delete_app_nom_tipo_recurso', 'app_nom_tipo_recurso', '2020-04-11 22:08:23', '2020-04-11 22:08:23'),
(167, 'browse_app_nom_tipo_servicios', 'app_nom_tipo_servicios', '2020-04-11 22:08:32', '2020-04-11 22:08:32'),
(168, 'read_app_nom_tipo_servicios', 'app_nom_tipo_servicios', '2020-04-11 22:08:32', '2020-04-11 22:08:32'),
(169, 'edit_app_nom_tipo_servicios', 'app_nom_tipo_servicios', '2020-04-11 22:08:32', '2020-04-11 22:08:32'),
(170, 'add_app_nom_tipo_servicios', 'app_nom_tipo_servicios', '2020-04-11 22:08:32', '2020-04-11 22:08:32'),
(171, 'delete_app_nom_tipo_servicios', 'app_nom_tipo_servicios', '2020-04-11 22:08:32', '2020-04-11 22:08:32'),
(172, 'browse_app_notificaciones', 'app_notificaciones', '2020-04-11 22:08:38', '2020-04-11 22:08:38'),
(173, 'read_app_notificaciones', 'app_notificaciones', '2020-04-11 22:08:38', '2020-04-11 22:08:38'),
(174, 'edit_app_notificaciones', 'app_notificaciones', '2020-04-11 22:08:38', '2020-04-11 22:08:38'),
(175, 'add_app_notificaciones', 'app_notificaciones', '2020-04-11 22:08:38', '2020-04-11 22:08:38'),
(176, 'delete_app_notificaciones', 'app_notificaciones', '2020-04-11 22:08:38', '2020-04-11 22:08:38'),
(177, 'browse_app_dat_plan_servicios', 'app_dat_plan_servicios', '2020-04-16 18:29:28', '2020-04-16 18:29:28'),
(178, 'read_app_dat_plan_servicios', 'app_dat_plan_servicios', '2020-04-16 18:29:28', '2020-04-16 18:29:28'),
(179, 'edit_app_dat_plan_servicios', 'app_dat_plan_servicios', '2020-04-16 18:29:28', '2020-04-16 18:29:28'),
(180, 'add_app_dat_plan_servicios', 'app_dat_plan_servicios', '2020-04-16 18:29:28', '2020-04-16 18:29:28'),
(181, 'delete_app_dat_plan_servicios', 'app_dat_plan_servicios', '2020-04-16 18:29:28', '2020-04-16 18:29:28'),
(182, 'browse_app_dat_entidades_categorias', 'app_dat_entidades_categorias', '2020-04-16 18:43:45', '2020-04-16 18:43:45'),
(183, 'read_app_dat_entidades_categorias', 'app_dat_entidades_categorias', '2020-04-16 18:43:45', '2020-04-16 18:43:45'),
(184, 'edit_app_dat_entidades_categorias', 'app_dat_entidades_categorias', '2020-04-16 18:43:45', '2020-04-16 18:43:45'),
(185, 'add_app_dat_entidades_categorias', 'app_dat_entidades_categorias', '2020-04-16 18:43:45', '2020-04-16 18:43:45'),
(186, 'delete_app_dat_entidades_categorias', 'app_dat_entidades_categorias', '2020-04-16 18:43:45', '2020-04-16 18:43:45'),
(187, 'browse_app_nom_categoria_uso', 'app_nom_categoria_uso', '2020-05-04 19:15:59', '2020-05-04 19:15:59'),
(188, 'read_app_nom_categoria_uso', 'app_nom_categoria_uso', '2020-05-04 19:15:59', '2020-05-04 19:15:59'),
(189, 'edit_app_nom_categoria_uso', 'app_nom_categoria_uso', '2020-05-04 19:15:59', '2020-05-04 19:15:59'),
(190, 'add_app_nom_categoria_uso', 'app_nom_categoria_uso', '2020-05-04 19:15:59', '2020-05-04 19:15:59'),
(191, 'delete_app_nom_categoria_uso', 'app_nom_categoria_uso', '2020-05-04 19:15:59', '2020-05-04 19:15:59'),
(192, 'browse_app_dat_plan_agenda', 'app_dat_plan_agenda', '2020-05-23 16:55:36', '2020-05-23 16:55:36'),
(193, 'read_app_dat_plan_agenda', 'app_dat_plan_agenda', '2020-05-23 16:55:36', '2020-05-23 16:55:36'),
(194, 'edit_app_dat_plan_agenda', 'app_dat_plan_agenda', '2020-05-23 16:55:36', '2020-05-23 16:55:36'),
(195, 'add_app_dat_plan_agenda', 'app_dat_plan_agenda', '2020-05-23 16:55:36', '2020-05-23 16:55:36'),
(196, 'delete_app_dat_plan_agenda', 'app_dat_plan_agenda', '2020-05-23 16:55:36', '2020-05-23 16:55:36'),
(197, 'browse_app_dat_valoraciones', 'app_dat_valoraciones', '2020-07-07 23:09:31', '2020-07-07 23:09:31'),
(198, 'read_app_dat_valoraciones', 'app_dat_valoraciones', '2020-07-07 23:09:31', '2020-07-07 23:09:31'),
(199, 'edit_app_dat_valoraciones', 'app_dat_valoraciones', '2020-07-07 23:09:31', '2020-07-07 23:09:31'),
(200, 'add_app_dat_valoraciones', 'app_dat_valoraciones', '2020-07-07 23:09:31', '2020-07-07 23:09:31'),
(201, 'delete_app_dat_valoraciones', 'app_dat_valoraciones', '2020-07-07 23:09:31', '2020-07-07 23:09:31'),
(202, 'browse_app_estadisticas', 'app_estadisticas', '2020-07-08 02:16:26', '2020-07-08 02:16:26'),
(203, 'read_app_estadisticas', 'app_estadisticas', '2020-07-08 02:16:26', '2020-07-08 02:16:26'),
(204, 'edit_app_estadisticas', 'app_estadisticas', '2020-07-08 02:16:26', '2020-07-08 02:16:26'),
(205, 'add_app_estadisticas', 'app_estadisticas', '2020-07-08 02:16:26', '2020-07-08 02:16:26'),
(206, 'delete_app_estadisticas', 'app_estadisticas', '2020-07-08 02:16:26', '2020-07-08 02:16:26'),
(207, 'browse_app_dat_actividades', 'app_dat_actividades', '2020-08-26 02:33:41', '2020-08-26 02:33:41'),
(208, 'read_app_dat_actividades', 'app_dat_actividades', '2020-08-26 02:33:41', '2020-08-26 02:33:41'),
(209, 'edit_app_dat_actividades', 'app_dat_actividades', '2020-08-26 02:33:41', '2020-08-26 02:33:41'),
(210, 'add_app_dat_actividades', 'app_dat_actividades', '2020-08-26 02:33:41', '2020-08-26 02:33:41'),
(211, 'delete_app_dat_actividades', 'app_dat_actividades', '2020-08-26 02:33:41', '2020-08-26 02:33:41'),
(217, 'browse_app_dat_prereserva', 'app_dat_prereserva', '2020-08-26 21:29:26', '2020-08-26 21:29:26'),
(218, 'read_app_dat_prereserva', 'app_dat_prereserva', '2020-08-26 21:29:26', '2020-08-26 21:29:26'),
(219, 'edit_app_dat_prereserva', 'app_dat_prereserva', '2020-08-26 21:29:26', '2020-08-26 21:29:26'),
(220, 'add_app_dat_prereserva', 'app_dat_prereserva', '2020-08-26 21:29:26', '2020-08-26 21:29:26'),
(221, 'delete_app_dat_prereserva', 'app_dat_prereserva', '2020-08-26 21:29:26', '2020-08-26 21:29:26'),
(222, 'browse_app_conf_prereserva', 'app_conf_prereserva', '2020-09-01 19:17:42', '2020-09-01 19:17:42'),
(223, 'read_app_conf_prereserva', 'app_conf_prereserva', '2020-09-01 19:17:42', '2020-09-01 19:17:42'),
(224, 'edit_app_conf_prereserva', 'app_conf_prereserva', '2020-09-01 19:17:42', '2020-09-01 19:17:42'),
(225, 'add_app_conf_prereserva', 'app_conf_prereserva', '2020-09-01 19:17:42', '2020-09-01 19:17:42'),
(226, 'delete_app_conf_prereserva', 'app_conf_prereserva', '2020-09-01 19:17:42', '2020-09-01 19:17:42'),
(227, 'browse_app_dat_plan_prereserva', 'app_dat_plan_prereserva', '2020-09-01 20:19:16', '2020-09-01 20:19:16'),
(228, 'read_app_dat_plan_prereserva', 'app_dat_plan_prereserva', '2020-09-01 20:19:16', '2020-09-01 20:19:16'),
(229, 'edit_app_dat_plan_prereserva', 'app_dat_plan_prereserva', '2020-09-01 20:19:16', '2020-09-01 20:19:16'),
(230, 'add_app_dat_plan_prereserva', 'app_dat_plan_prereserva', '2020-09-01 20:19:17', '2020-09-01 20:19:17'),
(231, 'delete_app_dat_plan_prereserva', 'app_dat_plan_prereserva', '2020-09-01 20:19:17', '2020-09-01 20:19:17');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1),
(161, 1),
(162, 1),
(163, 1),
(164, 1),
(165, 1),
(166, 1),
(167, 1),
(168, 1),
(169, 1),
(170, 1),
(171, 1),
(172, 1),
(173, 1),
(174, 1),
(175, 1),
(176, 1),
(177, 1),
(178, 1),
(179, 1),
(180, 1),
(181, 1),
(182, 1),
(183, 1),
(184, 1),
(185, 1),
(186, 1),
(187, 1),
(188, 1),
(189, 1),
(190, 1),
(191, 1),
(192, 1),
(193, 1),
(194, 1),
(195, 1),
(196, 1),
(197, 1),
(198, 1),
(199, 1),
(200, 1),
(201, 1),
(202, 1),
(203, 1),
(204, 1),
(205, 1),
(206, 1),
(207, 1),
(208, 1),
(209, 1),
(210, 1),
(211, 1),
(217, 1),
(218, 1),
(219, 1),
(220, 1),
(221, 1),
(222, 1),
(223, 1),
(224, 1),
(225, 1),
(226, 1),
(227, 1),
(228, 1),
(229, 1),
(230, 1),
(231, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2020-04-11 15:09:50', '2020-04-11 15:09:50'),
(2, 'user', 'Normal User', '2020-04-11 15:09:50', '2020-04-11 15:09:50');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'fcastellanos', 'fcastellanos@uclv.cu', 'users/default.png', NULL, '$2y$10$G1OFxjXlwHLrZyHRYA/rXe5KxmmEN2ndvp5mrlPmAgSjan4SoqzLm', NULL, NULL, '2020-04-11 15:11:29', '2020-04-11 15:11:29'),
(2, 1, 'Dairo', 'dlmollinedo@xetid.cu', 'users/default.png', NULL, '$2y$10$5O0n/vdp7DI8i1qm/iAfhuNLWkNocAeMFpJYcnoSpEkpCDdMJVgwa', 'OrKFA8SdWUUqZ56MWxqptemb6YI7kFOyQJEMDM850ILgEgGZc4euf6Q5f9W0', '{\"locale\":\"en\"}', '2020-08-11 13:29:26', '2020-08-11 13:29:26');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_conf_confirmacion_servicio`
--
ALTER TABLE `app_conf_confirmacion_servicio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_conf_prereserva`
--
ALTER TABLE `app_conf_prereserva`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dat_actividades`
--
ALTER TABLE `app_dat_actividades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_dat_actividades_denominacion_unique` (`denominacion`);

--
-- Indexes for table `app_dat_agenda`
--
ALTER TABLE `app_dat_agenda`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dat_agenda_cambiada`
--
ALTER TABLE `app_dat_agenda_cambiada`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dat_agenda_interrupcion`
--
ALTER TABLE `app_dat_agenda_interrupcion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dat_agenda_prioridad`
--
ALTER TABLE `app_dat_agenda_prioridad`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dat_cliente`
--
ALTER TABLE `app_dat_cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dat_distribucion_recursos`
--
ALTER TABLE `app_dat_distribucion_recursos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dat_distribucion_turnos`
--
ALTER TABLE `app_dat_distribucion_turnos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dat_entidades`
--
ALTER TABLE `app_dat_entidades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_dat_entidades_denominacion_unique` (`denominacion`);

--
-- Indexes for table `app_dat_entidades_categorias`
--
ALTER TABLE `app_dat_entidades_categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dat_interrupciones`
--
ALTER TABLE `app_dat_interrupciones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dat_locales`
--
ALTER TABLE `app_dat_locales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dat_locales_servicios`
--
ALTER TABLE `app_dat_locales_servicios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dat_plan_agenda`
--
ALTER TABLE `app_dat_plan_agenda`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dat_plan_prereserva`
--
ALTER TABLE `app_dat_plan_prereserva`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dat_plan_servicios`
--
ALTER TABLE `app_dat_plan_servicios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dat_prereserva`
--
ALTER TABLE `app_dat_prereserva`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dat_recurso`
--
ALTER TABLE `app_dat_recurso`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dat_recursos_servicios`
--
ALTER TABLE `app_dat_recursos_servicios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dat_recurso_eventual`
--
ALTER TABLE `app_dat_recurso_eventual`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dat_recurso_general`
--
ALTER TABLE `app_dat_recurso_general`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dat_servicios`
--
ALTER TABLE `app_dat_servicios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dat_servicio_real`
--
ALTER TABLE `app_dat_servicio_real`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dat_turnos`
--
ALTER TABLE `app_dat_turnos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dat_turnos_servicios`
--
ALTER TABLE `app_dat_turnos_servicios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dat_valoraciones`
--
ALTER TABLE `app_dat_valoraciones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_estadisticas`
--
ALTER TABLE `app_estadisticas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_mensaje`
--
ALTER TABLE `app_mensaje`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_nom_branch_sectors`
--
ALTER TABLE `app_nom_branch_sectors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_nom_categoria_uso`
--
ALTER TABLE `app_nom_categoria_uso`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_nom_motivo_interrupcion`
--
ALTER TABLE `app_nom_motivo_interrupcion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_nom_organismo`
--
ALTER TABLE `app_nom_organismo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_nom_periodo`
--
ALTER TABLE `app_nom_periodo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_nom_prioridad`
--
ALTER TABLE `app_nom_prioridad`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_nom_tipo_mensaje`
--
ALTER TABLE `app_nom_tipo_mensaje`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_nom_tipo_recurso`
--
ALTER TABLE `app_nom_tipo_recurso`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_notificaciones`
--
ALTER TABLE `app_notificaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_conf_confirmacion_servicio`
--
ALTER TABLE `app_conf_confirmacion_servicio`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_conf_prereserva`
--
ALTER TABLE `app_conf_prereserva`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app_dat_actividades`
--
ALTER TABLE `app_dat_actividades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `app_dat_agenda`
--
ALTER TABLE `app_dat_agenda`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=376;

--
-- AUTO_INCREMENT for table `app_dat_agenda_cambiada`
--
ALTER TABLE `app_dat_agenda_cambiada`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_dat_agenda_interrupcion`
--
ALTER TABLE `app_dat_agenda_interrupcion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_dat_agenda_prioridad`
--
ALTER TABLE `app_dat_agenda_prioridad`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_dat_cliente`
--
ALTER TABLE `app_dat_cliente`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `app_dat_distribucion_recursos`
--
ALTER TABLE `app_dat_distribucion_recursos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_dat_distribucion_turnos`
--
ALTER TABLE `app_dat_distribucion_turnos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_dat_entidades`
--
ALTER TABLE `app_dat_entidades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `app_dat_entidades_categorias`
--
ALTER TABLE `app_dat_entidades_categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_dat_interrupciones`
--
ALTER TABLE `app_dat_interrupciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app_dat_locales`
--
ALTER TABLE `app_dat_locales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `app_dat_locales_servicios`
--
ALTER TABLE `app_dat_locales_servicios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `app_dat_plan_agenda`
--
ALTER TABLE `app_dat_plan_agenda`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=313;

--
-- AUTO_INCREMENT for table `app_dat_plan_prereserva`
--
ALTER TABLE `app_dat_plan_prereserva`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_dat_plan_servicios`
--
ALTER TABLE `app_dat_plan_servicios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `app_dat_prereserva`
--
ALTER TABLE `app_dat_prereserva`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `app_dat_recurso`
--
ALTER TABLE `app_dat_recurso`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `app_dat_recursos_servicios`
--
ALTER TABLE `app_dat_recursos_servicios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `app_dat_recurso_eventual`
--
ALTER TABLE `app_dat_recurso_eventual`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_dat_recurso_general`
--
ALTER TABLE `app_dat_recurso_general`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_dat_servicios`
--
ALTER TABLE `app_dat_servicios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `app_dat_servicio_real`
--
ALTER TABLE `app_dat_servicio_real`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_dat_turnos`
--
ALTER TABLE `app_dat_turnos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `app_dat_turnos_servicios`
--
ALTER TABLE `app_dat_turnos_servicios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `app_dat_valoraciones`
--
ALTER TABLE `app_dat_valoraciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `app_estadisticas`
--
ALTER TABLE `app_estadisticas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_mensaje`
--
ALTER TABLE `app_mensaje`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_nom_branch_sectors`
--
ALTER TABLE `app_nom_branch_sectors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `app_nom_categoria_uso`
--
ALTER TABLE `app_nom_categoria_uso`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `app_nom_motivo_interrupcion`
--
ALTER TABLE `app_nom_motivo_interrupcion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `app_nom_organismo`
--
ALTER TABLE `app_nom_organismo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_nom_periodo`
--
ALTER TABLE `app_nom_periodo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `app_nom_prioridad`
--
ALTER TABLE `app_nom_prioridad`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `app_nom_tipo_mensaje`
--
ALTER TABLE `app_nom_tipo_mensaje`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `app_nom_tipo_recurso`
--
ALTER TABLE `app_nom_tipo_recurso`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `app_notificaciones`
--
ALTER TABLE `app_notificaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=410;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
