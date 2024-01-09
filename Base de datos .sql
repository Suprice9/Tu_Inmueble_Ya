-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2024 at 08:13 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tuinmuebleya`
--

-- --------------------------------------------------------

--
-- Table structure for table `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_tipo_de_servicio` int(11) NOT NULL,
  `Id_inmueble` int(11) NOT NULL,
  `Precio` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `factura`
--

INSERT INTO `factura` (`id`, `id_usuario`, `id_tipo_de_servicio`, `Id_inmueble`, `Precio`) VALUES
(3, 25, 2, 5, 'RD$4,500,000.00');

-- --------------------------------------------------------

--
-- Table structure for table `inmueble`
--

CREATE TABLE `inmueble` (
  `id_inmueble` int(11) NOT NULL,
  `idTipoDeInmueble` int(11) NOT NULL,
  `habitaciones` int(11) NOT NULL,
  `baños` int(11) NOT NULL,
  `metros` varchar(100) NOT NULL,
  `Decripcion` varchar(50) NOT NULL,
  `Lugar` varchar(52) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inmueble`
--

INSERT INTO `inmueble` (`id_inmueble`, `idTipoDeInmueble`, `habitaciones`, `baños`, `metros`, `Decripcion`, `Lugar`) VALUES
(5, 1, 4, 2, '120 mts²', 'Espacioso Apartamento', 'Distrito Nacional');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_de_inmueble`
--

CREATE TABLE `tipo_de_inmueble` (
  `Id` int(11) NOT NULL,
  `Nombre_del_inmueble` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tipo_de_inmueble`
--

INSERT INTO `tipo_de_inmueble` (`Id`, `Nombre_del_inmueble`) VALUES
(1, 'Apartamento'),
(2, 'Villa'),
(3, 'Casa'),
(4, 'Oficina 	'),
(7, 'Edificio'),
(8, 'Casa Duplex'),
(9, 'Plaza'),
(10, 'Hotel');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_de_servicio`
--

CREATE TABLE `tipo_de_servicio` (
  `Id` int(11) NOT NULL,
  `Servicio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tipo_de_servicio`
--

INSERT INTO `tipo_de_servicio` (`Id`, `Servicio`) VALUES
(1, 'Venta'),
(2, 'Rentar');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `Id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `cedula` varchar(100) DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `contrasena` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`Id`, `nombre`, `apellido`, `cedula`, `correo_electronico`, `contrasena`) VALUES
(1, 'wilmer', 'Villar', '40233373301-9', 'Wilmervillar@gmail.com', 'wilm3r123'),
(2, 'Samuel', 'Lopez', '6541651651651', 'Samuel@hotmail.com', '12345'),
(25, 'samuel', 'dasdas', '5616165', 'Samuel@hotmail.com', '12345'),
(26, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vista_factura`
-- (See below for the actual view)
--
CREATE TABLE `vista_factura` (
`Id` int(11)
,`nombre` varchar(100)
,`apellido` varchar(100)
,`cedula` varchar(100)
,`correo_electronico` varchar(100)
,`contrasena` varchar(100)
,`habitaciones` int(11)
,`baños` int(11)
,`metros` varchar(100)
,`Decripcion` varchar(50)
,`Lugar` varchar(52)
,`Servicio` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure for view `vista_factura`
--
DROP TABLE IF EXISTS `vista_factura`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_factura`  AS SELECT `u`.`Id` AS `Id`, `u`.`nombre` AS `nombre`, `u`.`apellido` AS `apellido`, `u`.`cedula` AS `cedula`, `u`.`correo_electronico` AS `correo_electronico`, `u`.`contrasena` AS `contrasena`, `i`.`habitaciones` AS `habitaciones`, `i`.`baños` AS `baños`, `i`.`metros` AS `metros`, `i`.`Decripcion` AS `Decripcion`, `i`.`Lugar` AS `Lugar`, `ts`.`Servicio` AS `Servicio` FROM (((`factura` `f` join `usuario` `u` on(`f`.`id_usuario` = `u`.`Id`)) join `tipo_de_servicio` `ts` on(`f`.`id_tipo_de_servicio` = `ts`.`Id`)) join `inmueble` `i` on(`f`.`Id_inmueble` = `i`.`id_inmueble`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ID_Usuario` (`id_usuario`),
  ADD KEY `FK_ID_Inmueble` (`Id_inmueble`),
  ADD KEY `FK_ID_Tipo_De_Servicio` (`id_tipo_de_servicio`);

--
-- Indexes for table `inmueble`
--
ALTER TABLE `inmueble`
  ADD PRIMARY KEY (`id_inmueble`),
  ADD KEY `FK_ID_Tipo_De_Inmueble` (`idTipoDeInmueble`);

--
-- Indexes for table `tipo_de_inmueble`
--
ALTER TABLE `tipo_de_inmueble`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tipo_de_servicio`
--
ALTER TABLE `tipo_de_servicio`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inmueble`
--
ALTER TABLE `inmueble`
  MODIFY `id_inmueble` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tipo_de_inmueble`
--
ALTER TABLE `tipo_de_inmueble`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tipo_de_servicio`
--
ALTER TABLE `tipo_de_servicio`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `factura_ibfk_3` FOREIGN KEY (`Id_inmueble`) REFERENCES `inmueble` (`id_inmueble`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `factura_ibfk_4` FOREIGN KEY (`id_tipo_de_servicio`) REFERENCES `tipo_de_servicio` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inmueble`
--
ALTER TABLE `inmueble`
  ADD CONSTRAINT `inmueble_ibfk_1` FOREIGN KEY (`idTipoDeInmueble`) REFERENCES `tipo_de_inmueble` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
