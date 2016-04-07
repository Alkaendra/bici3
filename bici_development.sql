-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 01-04-2016 a las 14:44:07
-- Versión del servidor: 5.5.47-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bici_development`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admins_on_email` (`email`) USING BTREE,
  UNIQUE KEY `index_admins_on_confirmation_token` (`confirmation_token`) USING BTREE,
  UNIQUE KEY `index_admins_on_reset_password_token` (`reset_password_token`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `admins`
--

INSERT INTO `admins` (`id`, `type`, `first_name`, `last_name`, `created_at`, `updated_at`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `confirmation_token`, `confirmed_at`, `confirmation_sent_at`, `unconfirmed_email`) VALUES
(1, 'SuperAdmin', 'Super', 'Admin', '2016-03-14 16:39:00', '2016-04-01 12:41:45', 'superadmin@example.com', '$2a$10$.CHW6.W9ZMcjJ2jo2xjSoOLn4Q6GkiDOWnWWjbI8AVDKbNWufmV7e', NULL, NULL, NULL, 2, '2016-04-01 12:41:45', '2016-03-14 16:41:18', '127.0.0.1', '127.0.0.1', NULL, NULL, NULL, NULL),
(2, 'SuperAdmin', 'Pablo', 'Galeote', '2016-03-14 16:39:00', '2016-03-14 16:39:00', 'pablogaleote@gmail.com', '$2a$10$yXS6f4XqEEUvzy/ZUmSxhuG6EQcQPwANFmd4wGB/tclh36kLJEa/y', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_categories_on_slug` (`slug`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=27 ;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `description`, `image_file_name`, `image_content_type`, `image_file_size`, `image_updated_at`, `meta_description`, `featured`, `created_at`, `updated_at`, `parent_id`) VALUES
(1, 'Bicicletas', 'bicicletas', 'Las mejores para los mejores de las marcas más punteras del mercado', 'bicicletas-bianchi.jpg', 'image/jpeg', 24642, '2016-03-14 16:54:17', NULL, 1, '2016-03-14 16:42:15', '2016-03-14 16:54:18', NULL),
(2, 'Componentes', 'componentes', 'Todo lo que necesitas para mejorar o reponer las partes fundamentales de tu vehículo', 'componentes.jpg', 'image/jpeg', 59553, '2016-03-14 16:55:21', NULL, 1, '2016-03-14 16:43:03', '2016-03-14 16:55:22', NULL),
(3, 'Accesorios', 'accesorios', 'Los complementos que necesitas para llevar tu afición exactamente a dónde tú quieres.', 'accesorios.jpg', 'image/jpeg', 65124, '2016-03-14 16:56:09', NULL, 1, '2016-03-14 16:44:24', '2016-03-14 16:56:09', NULL),
(4, 'Equipamiento', 'equipamiento', 'La equipación completa para ser un señor a los pedales. Lo último en tendencias a tu disposición.', 'equipo.jpg', 'image/jpeg', 220713, '2016-03-14 16:56:31', NULL, 1, '2016-03-14 16:48:10', '2016-03-14 16:56:32', NULL),
(5, 'Entrenamiento', 'entrenamiento', 'Lo que necesitas para superarte a tí mismo, cuidando de tu salud a la vez que practicas tu deporte preferido.', 'entrenamiento.jpg', 'image/jpeg', 30041, '2016-03-14 16:56:44', NULL, 1, '2016-03-14 16:49:29', '2016-03-14 16:56:44', NULL),
(6, 'Bulls bikes', 'bulls-bikes', 'Bicicletas BullsBikes', 'Logo_Bulls_Bike-1-e1451479033105.png', 'image/png', 25703, '2016-03-14 16:59:00', NULL, 1, '2016-03-14 16:58:44', '2016-03-14 16:59:01', 1),
(7, 'Bianchi', 'bianchi', 'Bicicletas Bianchi', 'l58186-bianchi-logo-92649.png', 'image/png', 80995, '2016-03-14 17:00:30', NULL, 1, '2016-03-14 17:00:31', '2016-03-14 17:00:31', 1),
(8, 'Cinzia', 'cinzia', 'Bicicletas Cinzia', 'cinzia-logo.jpg', 'image/jpeg', 5642, '2016-03-14 17:02:11', NULL, 1, '2016-03-14 17:02:11', '2016-03-14 17:02:11', 1),
(9, 'Rydley', 'rydley', 'Bicicletas Rydley', 'ridley-logo.jpg', 'image/jpeg', 31445, '2016-03-14 17:03:00', NULL, 1, '2016-03-14 17:03:01', '2016-03-14 17:03:01', 1),
(10, 'Rocky Mountain', 'rocky-mountain', 'Bicicletas Rocky Mountain', 'rocky-logo.png', 'image/png', 52053, '2016-03-14 17:12:13', NULL, 1, '2016-03-14 17:12:13', '2016-03-14 17:13:14', 1),
(11, 'Cubiertas', 'cubiertas', 'Cubiertas', 'cubiertas.jpeg', 'image/jpeg', 7102, '2016-03-14 17:13:04', NULL, 1, '2016-03-14 17:13:04', '2016-03-14 17:13:04', 2),
(12, 'Pedales', 'pedales', 'Pedales', 'componentes.jpg', 'image/jpeg', 59553, '2016-03-14 17:14:05', NULL, 1, '2016-03-14 17:14:05', '2016-03-14 17:14:05', 2),
(13, 'Bielas/Platos', 'bielas-platos', 'Bielas y Platos', 'bielas-shimano-sora-fc-3550-9v-175mm.jpg', 'image/jpeg', 37682, '2016-03-14 17:15:07', NULL, 1, '2016-03-14 17:15:08', '2016-03-14 17:15:08', 2),
(14, 'Sillines', 'sillines', 'Sillines', 'accesorios.jpg', 'image/jpeg', 65124, '2016-03-14 17:15:45', NULL, 1, '2016-03-14 17:15:45', '2016-03-14 17:15:45', 3),
(15, 'Bolsos', 'bolsos', 'Bolsos bicicleta', 'bolsos.gif', 'image/gif', 36413, '2016-03-14 17:16:45', NULL, 1, '2016-03-14 17:16:45', '2016-03-14 17:16:45', 3),
(16, 'Portabultos', 'portabultos', 'Portabultos', 'portabultos.jpg', 'image/jpeg', 64031, '2016-03-14 17:17:43', NULL, 1, '2016-03-14 17:17:43', '2016-03-14 17:17:43', 3),
(17, 'Varios', 'varios', 'Varios', NULL, NULL, NULL, NULL, NULL, 1, '2016-03-14 17:17:59', '2016-03-14 17:17:59', 3),
(18, 'Maillots', 'maillots', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sed ante vitae mi luctus aliquam. Vestibulum lacus magna, ornare vitae volutpat non, efficitur eu nibh. Sed pulvinar sem ex. Curabitur eros quam, volutpat ac fermentum sed, aliquet ut massa. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Quisque varius tincidunt hendrerit. Maecenas commodo orci sapien, sed venenatis mi suscipit vel. Aenean augue ante, scelerisque quis tortor ac, imperdiet varius urna. Proin sed maximus mauris. Ut mattis nulla eget tortor ullamcorper iaculis. Praesent finibus pharetra odio quis vehicula. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. ', 'maillot.jpg', 'image/jpeg', 201581, '2016-03-14 17:19:37', NULL, 1, '2016-03-14 17:19:37', '2016-03-14 17:19:37', 4),
(19, 'Gafas', 'gafas', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sed ante vitae mi luctus aliquam. Vestibulum lacus magna, ornare vitae volutpat non, efficitur eu nibh. Sed pulvinar sem ex. Curabitur eros quam, volutpat ac fermentum sed, aliquet ut massa. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Quisque varius tincidunt hendrerit. Maecenas commodo orci sapien, sed venenatis mi suscipit vel. Aenean augue ante, scelerisque quis tortor ac, imperdiet varius urna. Proin sed maximus mauris. Ut mattis nulla eget tortor ullamcorper iaculis. Praesent finibus pharetra odio quis vehicula. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. ', 'gafas.jpg', 'image/jpeg', 27365, '2016-03-14 17:20:36', NULL, 1, '2016-03-14 17:20:36', '2016-03-14 17:20:36', 4),
(20, 'Mochilas', 'mochilas', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sed ante vitae mi luctus aliquam. Vestibulum lacus magna, ornare vitae volutpat non, efficitur eu nibh. Sed pulvinar sem ex. Curabitur eros quam, volutpat ac fermentum sed, aliquet ut massa. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Quisque varius tincidunt hendrerit. Maecenas commodo orci sapien, sed venenatis mi suscipit vel. Aenean augue ante, scelerisque quis tortor ac, imperdiet varius urna. Proin sed maximus mauris. Ut mattis nulla eget tortor ullamcorper iaculis. Praesent finibus pharetra odio quis vehicula. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. ', 'Mochila-bicicleta-Chrome-Barrage-Cargo_negro_foto3.jpg', 'image/jpeg', 33842, '2016-03-14 17:21:47', NULL, 1, '2016-03-14 17:21:48', '2016-03-14 17:21:48', 4),
(21, 'Cascos', 'cascos', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sed ante vitae mi luctus aliquam. Vestibulum lacus magna, ornare vitae volutpat non, efficitur eu nibh. Sed pulvinar sem ex. Curabitur eros quam, volutpat ac fermentum sed, aliquet ut massa. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Quisque varius tincidunt hendrerit. Maecenas commodo orci sapien, sed venenatis mi suscipit vel. Aenean augue ante, scelerisque quis tortor ac, imperdiet varius urna. Proin sed maximus mauris. Ut mattis nulla eget tortor ullamcorper iaculis. Praesent finibus pharetra odio quis vehicula. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. ', 'equipo.jpg', 'image/jpeg', 220713, '2016-03-14 17:22:11', NULL, 1, '2016-03-14 17:22:12', '2016-03-14 17:22:12', 4),
(22, 'Zapatillas', 'zapatillas', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sed ante vitae mi luctus aliquam. Vestibulum lacus magna, ornare vitae volutpat non, efficitur eu nibh. Sed pulvinar sem ex. Curabitur eros quam, volutpat ac fermentum sed, aliquet ut massa. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Quisque varius tincidunt hendrerit. Maecenas commodo orci sapien, sed venenatis mi suscipit vel. Aenean augue ante, scelerisque quis tortor ac, imperdiet varius urna. Proin sed maximus mauris. Ut mattis nulla eget tortor ullamcorper iaculis. Praesent finibus pharetra odio quis vehicula. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. ', 'vittoria-presenta-ikon-su-espectacular-ultima-zapatilla-003.jpg', 'image/jpeg', 175695, '2016-03-14 17:23:02', NULL, 1, '2016-03-14 17:23:03', '2016-03-14 17:23:03', 4),
(23, 'Alimentación', 'alimentacion', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sed ante vitae mi luctus aliquam. Vestibulum lacus magna, ornare vitae volutpat non, efficitur eu nibh. Sed pulvinar sem ex. Curabitur eros quam, volutpat ac fermentum sed, aliquet ut massa. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Quisque varius tincidunt hendrerit. Maecenas commodo orci sapien, sed venenatis mi suscipit vel. Aenean augue ante, scelerisque quis tortor ac, imperdiet varius urna. Proin sed maximus mauris. Ut mattis nulla eget tortor ullamcorper iaculis. Praesent finibus pharetra odio quis vehicula. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. ', 'barritas_energeticas.png', 'image/png', 103576, '2016-03-14 17:25:08', NULL, 1, '2016-03-14 17:25:09', '2016-03-14 17:25:09', 5),
(24, 'Pulsómetros', 'pulsometros', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sed ante vitae mi luctus aliquam. Vestibulum lacus magna, ornare vitae volutpat non, efficitur eu nibh. Sed pulvinar sem ex. Curabitur eros quam, volutpat ac fermentum sed, aliquet ut massa. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Quisque varius tincidunt hendrerit. Maecenas commodo orci sapien, sed venenatis mi suscipit vel. Aenean augue ante, scelerisque quis tortor ac, imperdiet varius urna. Proin sed maximus mauris. Ut mattis nulla eget tortor ullamcorper iaculis. Praesent finibus pharetra odio quis vehicula. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. ', 'entrenamiento.jpg', 'image/jpeg', 30041, '2016-03-14 17:25:41', NULL, 1, '2016-03-14 17:25:42', '2016-03-14 17:25:42', 5),
(25, 'Rodillos', 'rodillos', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sed ante vitae mi luctus aliquam. Vestibulum lacus magna, ornare vitae volutpat non, efficitur eu nibh. Sed pulvinar sem ex. Curabitur eros quam, volutpat ac fermentum sed, aliquet ut massa. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Quisque varius tincidunt hendrerit. Maecenas commodo orci sapien, sed venenatis mi suscipit vel. Aenean augue ante, scelerisque quis tortor ac, imperdiet varius urna. Proin sed maximus mauris. Ut mattis nulla eget tortor ullamcorper iaculis. Praesent finibus pharetra odio quis vehicula. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. ', 'rodillos.jpg', 'image/jpeg', 16341, '2016-03-14 17:30:30', NULL, 1, '2016-03-14 17:30:30', '2016-03-14 17:30:30', 5),
(26, 'Medias', 'medias', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sed ante vitae mi luctus aliquam. Vestibulum lacus magna, ornare vitae volutpat non, efficitur eu nibh. Sed pulvinar sem ex. Curabitur eros quam, volutpat ac fermentum sed, aliquet ut massa. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Quisque varius tincidunt hendrerit. Maecenas commodo orci sapien, sed venenatis mi suscipit vel. Aenean augue ante, scelerisque quis tortor ac, imperdiet varius urna. Proin sed maximus mauris. Ut mattis nulla eget tortor ullamcorper iaculis. Praesent finibus pharetra odio quis vehicula. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. ', 'medias.jpg', 'image/jpeg', 22961, '2016-03-14 17:31:38', NULL, 1, '2016-03-14 17:31:38', '2016-03-14 17:31:38', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE IF NOT EXISTS `comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comentario` text COLLATE utf8_unicode_ci,
  `origen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `webimage_id` int(11) DEFAULT NULL,
  `photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `photo_updated_at` datetime DEFAULT NULL,
  `headline` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caption` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_posts_on_slug` (`slug`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_products_on_slug` (`slug`) USING BTREE,
  KEY `index_products_on_category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `project_type_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_projects_on_slug` (`slug`) USING BTREE,
  KEY `index_projects_on_category_id` (`category_id`) USING BTREE,
  KEY `index_projects_on_product_id` (`product_id`) USING BTREE,
  KEY `index_projects_on_project_type_id` (`project_type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `project_types`
--

CREATE TABLE IF NOT EXISTS `project_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_project_types_on_slug` (`slug`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20151015081519'),
('20151015081736'),
('20151015180057'),
('20151017072116'),
('20151017085143'),
('20151018180748'),
('20151020084911'),
('20151020144701'),
('20151021080131'),
('20160310122414'),
('20160314085411');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategories`
--

CREATE TABLE IF NOT EXISTS `subcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `categories_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_subcategories_on_slug` (`slug`) USING BTREE,
  KEY `index_subcategories_on_categories_id` (`categories_id`) USING BTREE,
  KEY `index_subcategories_on_product_id` (`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `super_admin_comentarios`
--

CREATE TABLE IF NOT EXISTS `super_admin_comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `webimages`
--

CREATE TABLE IF NOT EXISTS `webimages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
