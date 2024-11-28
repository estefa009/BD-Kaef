-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2024 at 04:51 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kaef3`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrador`
--

CREATE TABLE `administrador` (
  `cod_admin` int(11) NOT NULL,
  `cod_usua` int(11) NOT NULL,
  `estado_admin` enum('ACTIVO','INACTIVO') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `administrador`
--

INSERT INTO `administrador` (`cod_admin`, `cod_usua`, `estado_admin`) VALUES
(1, 1, 'ACTIVO');

-- --------------------------------------------------------

--
-- Table structure for table `asignacionenvio`
--

CREATE TABLE `asignacionenvio` (
  `cod_asignacion` int(11) NOT NULL,
  `cod_admin` int(11) NOT NULL,
  `cod_domi` int(11) NOT NULL,
  `cod_producto` int(11) DEFAULT NULL,
  `fecha_hora_asignada` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categoriainsumo`
--

CREATE TABLE `categoriainsumo` (
  `cod_categoria` int(11) NOT NULL,
  `nom_categoria` enum('LACTEOS','HARINAS','COBERTURAS','TOPPINGS') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categoriainsumo`
--

INSERT INTO `categoriainsumo` (`cod_categoria`, `nom_categoria`) VALUES
(1, ''),
(3, ''),
(4, 'TOPPINGS');

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `cod_cliente` int(11) NOT NULL,
  `cod_usua` int(11) NOT NULL,
  `direc_cliente` varchar(30) NOT NULL,
  `celular` varchar(10) NOT NULL,
  `tipo_doc` enum('C.C','C.E','T.I') NOT NULL,
  `num_doc` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `domiciliario`
--

CREATE TABLE `domiciliario` (
  `cod_domi` int(11) NOT NULL,
  `cod_usua` int(11) NOT NULL,
  `estado_admin` enum('ACTIVO','INACTIVO') NOT NULL,
  `tipo_doc` enum('C.C','C.E') NOT NULL,
  `num_doc` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `domiciliario`
--

INSERT INTO `domiciliario` (`cod_domi`, `cod_usua`, `estado_admin`, `tipo_doc`, `num_doc`) VALUES
(1, 2, 'ACTIVO', 'C.C', '1000506337');

-- --------------------------------------------------------

--
-- Table structure for table `entradas`
--

CREATE TABLE `entradas` (
  `cod_entrada` int(11) NOT NULL,
  `cod_proveedor` int(11) NOT NULL,
  `cod_insumo` int(11) NOT NULL,
  `cnt_entrada` int(5) NOT NULL,
  `fecha_caducidad` date NOT NULL,
  `fecha_hora_entrada` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `envio`
--

CREATE TABLE `envio` (
  `cod_envio` int(11) NOT NULL,
  `cod_asignacion` int(11) DEFAULT NULL,
  `fecha_hora_asignada` datetime DEFAULT current_timestamp(),
  `fecha_hora_entrega` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tarifa_envio` double NOT NULL,
  `segunda fecha  de entrega` timestamp NULL DEFAULT current_timestamp(),
  `estado_envio` enum('ENTREGADO','EN CAMINO','PENDIENTE','NO RECIBIDO') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `insumo`
--

CREATE TABLE `insumo` (
  `cod_insumo` int(11) NOT NULL,
  `nomb_insumo` varchar(50) NOT NULL,
  `cnt_insumo` int(11) NOT NULL,
  `cod_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pago`
--

CREATE TABLE `pago` (
  `cod_pago` int(11) NOT NULL,
  `precio_total` int(11) NOT NULL,
  `fecha_hora_pago` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado_pago` enum('PENDIENTE','DENEGADO','PAGADO') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produccion`
--

CREATE TABLE `produccion` (
  `cod_produccion` int(11) NOT NULL,
  `cod_admin` int(11) NOT NULL,
  `cod_venta` int(11) NOT NULL,
  `cod_salida` int(11) NOT NULL,
  `estado_produccion` enum('PENDIENTE','EN PROCESO','FINALIZADO') NOT NULL,
  `descip_produccion` varchar(100) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cnt_produccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `cod_producto` int(11) NOT NULL,
  `nomb_pro` varchar(50) NOT NULL,
  `descr_pro` varchar(50) NOT NULL,
  `cnt_pro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
--

CREATE TABLE `proveedor` (
  `cod_proveedor` int(11) NOT NULL,
  `nom_proveedor` varchar(20) NOT NULL,
  `telefono_proveedor` varchar(13) NOT NULL,
  `novedad_proveedor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proveedor`
--

INSERT INTO `proveedor` (`cod_proveedor`, `nom_proveedor`, `telefono_proveedor`, `novedad_proveedor`) VALUES
(2, 'Luisana', '3026982043', 'Azucar'),
(4, 'carlos torres', '3192747970', 'harinas y leche');

-- --------------------------------------------------------

--
-- Table structure for table `relacion_product_producc`
--

CREATE TABLE `relacion_product_producc` (
  `cod_relacion` int(11) NOT NULL,
  `cod_producto` int(11) NOT NULL,
  `cod_produccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salida`
--

CREATE TABLE `salida` (
  `cod_salida` int(11) NOT NULL,
  `cod_insumo` int(11) NOT NULL,
  `cnt_salida` int(11) NOT NULL,
  `fecha_hora_salida` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `cod_usuario` int(11) NOT NULL,
  `nom_usua` varchar(15) NOT NULL,
  `apell_usua` varchar(20) NOT NULL,
  `email_usua` varchar(40) NOT NULL,
  `passw_usua` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`cod_usuario`, `nom_usua`, `apell_usua`, `email_usua`, `passw_usua`) VALUES
(1, 'Estefania', 'Villa', 'evilla.bravo@gmail.com', 'zelda001'),
(2, 'Gustavo', 'Rojas', 'andres@gmail.com', 'zelda002'),
(3, 'carlexy', 'aragort', 'jannyaragort@gmail.com', '1233');

-- --------------------------------------------------------

--
-- Table structure for table `venta`
--

CREATE TABLE `venta` (
  `cod_venta` int(11) NOT NULL,
  `cod_cliente` int(11) NOT NULL,
  `cod_pago` int(11) DEFAULT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cnt_vnt` int(11) NOT NULL,
  `descripcion` varchar(40) NOT NULL,
  `prec_vent` int(11) NOT NULL,
  `precioIva_vent` int(11) NOT NULL,
  `preciTo_vent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`cod_admin`),
  ADD KEY `cod_usua` (`cod_usua`);

--
-- Indexes for table `asignacionenvio`
--
ALTER TABLE `asignacionenvio`
  ADD PRIMARY KEY (`cod_asignacion`),
  ADD KEY `cod_admin` (`cod_admin`),
  ADD KEY `cod_domi` (`cod_domi`),
  ADD KEY `asignacionenvio_ibfk_3` (`cod_producto`);

--
-- Indexes for table `categoriainsumo`
--
ALTER TABLE `categoriainsumo`
  ADD PRIMARY KEY (`cod_categoria`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cod_cliente`),
  ADD KEY `cod_usua` (`cod_usua`);

--
-- Indexes for table `domiciliario`
--
ALTER TABLE `domiciliario`
  ADD PRIMARY KEY (`cod_domi`),
  ADD KEY `cod_usua` (`cod_usua`);

--
-- Indexes for table `entradas`
--
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`cod_entrada`),
  ADD KEY `cod_proveedor` (`cod_proveedor`),
  ADD KEY `cod_insumo` (`cod_insumo`);

--
-- Indexes for table `envio`
--
ALTER TABLE `envio`
  ADD PRIMARY KEY (`cod_envio`),
  ADD KEY `envio_ibfk_1` (`cod_asignacion`);

--
-- Indexes for table `insumo`
--
ALTER TABLE `insumo`
  ADD PRIMARY KEY (`cod_insumo`),
  ADD KEY `cod_categoria` (`cod_categoria`);

--
-- Indexes for table `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`cod_pago`);

--
-- Indexes for table `produccion`
--
ALTER TABLE `produccion`
  ADD PRIMARY KEY (`cod_produccion`),
  ADD KEY `cod_admin` (`cod_admin`),
  ADD KEY `cod_venta` (`cod_venta`),
  ADD KEY `cod_salida` (`cod_salida`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`cod_producto`);

--
-- Indexes for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`cod_proveedor`);

--
-- Indexes for table `relacion_product_producc`
--
ALTER TABLE `relacion_product_producc`
  ADD PRIMARY KEY (`cod_relacion`),
  ADD KEY `cod_producto` (`cod_producto`),
  ADD KEY `cod_produccion` (`cod_produccion`);

--
-- Indexes for table `salida`
--
ALTER TABLE `salida`
  ADD PRIMARY KEY (`cod_salida`),
  ADD KEY `cod_insumo` (`cod_insumo`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cod_usuario`);

--
-- Indexes for table `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`cod_venta`),
  ADD KEY `cod_cliente` (`cod_cliente`),
  ADD KEY `cod_pago` (`cod_pago`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrador`
--
ALTER TABLE `administrador`
  MODIFY `cod_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `asignacionenvio`
--
ALTER TABLE `asignacionenvio`
  MODIFY `cod_asignacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categoriainsumo`
--
ALTER TABLE `categoriainsumo`
  MODIFY `cod_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cod_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `domiciliario`
--
ALTER TABLE `domiciliario`
  MODIFY `cod_domi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `entradas`
--
ALTER TABLE `entradas`
  MODIFY `cod_entrada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `envio`
--
ALTER TABLE `envio`
  MODIFY `cod_envio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `insumo`
--
ALTER TABLE `insumo`
  MODIFY `cod_insumo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pago`
--
ALTER TABLE `pago`
  MODIFY `cod_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produccion`
--
ALTER TABLE `produccion`
  MODIFY `cod_produccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `cod_producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `cod_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `relacion_product_producc`
--
ALTER TABLE `relacion_product_producc`
  MODIFY `cod_relacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salida`
--
ALTER TABLE `salida`
  MODIFY `cod_salida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `cod_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `venta`
--
ALTER TABLE `venta`
  MODIFY `cod_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`cod_usua`) REFERENCES `usuario` (`cod_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `asignacionenvio`
--
ALTER TABLE `asignacionenvio`
  ADD CONSTRAINT `asignacionenvio_ibfk_1` FOREIGN KEY (`cod_admin`) REFERENCES `administrador` (`cod_admin`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asignacionenvio_ibfk_2` FOREIGN KEY (`cod_domi`) REFERENCES `domiciliario` (`cod_domi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asignacionenvio_ibfk_3` FOREIGN KEY (`cod_producto`) REFERENCES `producto` (`cod_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`cod_usua`) REFERENCES `usuario` (`cod_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `domiciliario`
--
ALTER TABLE `domiciliario`
  ADD CONSTRAINT `domiciliario_ibfk_1` FOREIGN KEY (`cod_usua`) REFERENCES `usuario` (`cod_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `entradas`
--
ALTER TABLE `entradas`
  ADD CONSTRAINT `entradas_ibfk_1` FOREIGN KEY (`cod_proveedor`) REFERENCES `proveedor` (`cod_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `entradas_ibfk_2` FOREIGN KEY (`cod_insumo`) REFERENCES `insumo` (`cod_insumo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `envio`
--
ALTER TABLE `envio`
  ADD CONSTRAINT `envio_ibfk_1` FOREIGN KEY (`cod_asignacion`) REFERENCES `asignacionenvio` (`cod_asignacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `insumo`
--
ALTER TABLE `insumo`
  ADD CONSTRAINT `insumo_ibfk_1` FOREIGN KEY (`cod_categoria`) REFERENCES `categoriainsumo` (`cod_categoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `produccion`
--
ALTER TABLE `produccion`
  ADD CONSTRAINT `produccion_ibfk_1` FOREIGN KEY (`cod_admin`) REFERENCES `administrador` (`cod_admin`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `produccion_ibfk_2` FOREIGN KEY (`cod_venta`) REFERENCES `venta` (`cod_venta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `produccion_ibfk_3` FOREIGN KEY (`cod_salida`) REFERENCES `salida` (`cod_salida`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `relacion_product_producc`
--
ALTER TABLE `relacion_product_producc`
  ADD CONSTRAINT `relacion_product_producc_ibfk_1` FOREIGN KEY (`cod_producto`) REFERENCES `producto` (`cod_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relacion_product_producc_ibfk_2` FOREIGN KEY (`cod_produccion`) REFERENCES `produccion` (`cod_produccion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salida`
--
ALTER TABLE `salida`
  ADD CONSTRAINT `salida_ibfk_1` FOREIGN KEY (`cod_insumo`) REFERENCES `insumo` (`cod_insumo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `cod_pago` FOREIGN KEY (`cod_pago`) REFERENCES `pago` (`cod_pago`),
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`cod_cliente`) REFERENCES `cliente` (`cod_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
