-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 03/06/2025 às 05:33
-- Versão do servidor: 9.1.0
-- Versão do PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `fabricadecampeoes`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `adm`
--

DROP TABLE IF EXISTS `adm`;
CREATE TABLE IF NOT EXISTS `adm` (
  `idAdmin` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`idAdmin`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `adm`
--

INSERT INTO `adm` (`idAdmin`, `nome`, `email`, `senha`, `telefone`) VALUES
(1, 'master', 'fabricadecampeoestcc@gmail.com', '6797f82f504379e72c59879b12594d39', '62911112222');

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) DEFAULT NULL,
  `dimensoes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `tipo`, `dimensoes`) VALUES
(1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidade`
--

DROP TABLE IF EXISTS `cidade`;
CREATE TABLE IF NOT EXISTS `cidade` (
  `idCidade` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `idEstado` int DEFAULT NULL,
  PRIMARY KEY (`idCidade`),
  KEY `idEstado` (`idEstado`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `cidade`
--

INSERT INTO `cidade` (`idCidade`, `descricao`, `idEstado`) VALUES
(10, 'Capital', 11),
(11, 'Capital', 12),
(12, 'Capital', 14),
(13, 'Capital', 15),
(14, 'Capital', 17);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `cpfCnpj` varchar(20) DEFAULT NULL,
  `dataNasc` date DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nome`, `cpfCnpj`, `dataNasc`, `senha`) VALUES
(21, 'Teste', '77788899944', '2025-05-01', 'd54d1702ad0f8326224b817c796763c9'),
(22, 'ademirzinho', '0112578964', '2025-05-30', 'e10adc3949ba59abbe56e057f20f883e'),
(23, 'saul', '0123456789', '2024-02-01', '81dc9bdb52d04dc20036dbd8313ed055'),
(24, 'usuario', '77788899944', '2025-05-08', '827ccb0eea8a706c4c34a16891f84e7b'),
(25, 'Rogers', '77788899944', '2025-05-07', '827ccb0eea8a706c4c34a16891f84e7b'),
(26, 'Default', '77788899944', '2025-05-03', '3dba52fcf7afd1d73a04c9ea70de6416');

-- --------------------------------------------------------

--
-- Estrutura para tabela `email`
--

DROP TABLE IF EXISTS `email`;
CREATE TABLE IF NOT EXISTS `email` (
  `idEmail` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `idCliente` int DEFAULT NULL,
  PRIMARY KEY (`idEmail`),
  KEY `idCliente` (`idCliente`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `email`
--

INSERT INTO `email` (`idEmail`, `email`, `idCliente`) VALUES
(20, 'teste@teste.com', 21),
(21, 'juninho@gmail', 22),
(22, 'saulmateusinho@gmail.com', 23),
(23, 'teste@teste.com', 24),
(24, 'userdefault@gmail.com', 25),
(25, 'fabricadecampeoestcc@gmail.com', 26);

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco`
--

DROP TABLE IF EXISTS `endereco`;
CREATE TABLE IF NOT EXISTS `endereco` (
  `idEndereco` int NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(100) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `idCliente` int DEFAULT NULL,
  `idCidade` int DEFAULT NULL,
  PRIMARY KEY (`idEndereco`),
  KEY `idCliente` (`idCliente`),
  KEY `idCidade` (`idCidade`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `endereco`
--

INSERT INTO `endereco` (`idEndereco`, `logradouro`, `complemento`, `idCliente`, `idCidade`) VALUES
(26, 'go', '', 21, 1),
(27, 'go', '', 22, 1),
(28, NULL, '', 23, 1),
(29, 'R340', '', 24, 1),
(30, 'R340', '', 25, 1),
(31, 'R340', '', 26, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `entrega`
--

DROP TABLE IF EXISTS `entrega`;
CREATE TABLE IF NOT EXISTS `entrega` (
  `idEntrega` int NOT NULL AUTO_INCREMENT,
  `status` varchar(50) DEFAULT NULL,
  `dataPrevisao` date DEFAULT NULL,
  `idPedido` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idEntrega`),
  KEY `idPedido` (`idPedido`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `entrega`
--

INSERT INTO `entrega` (`idEntrega`, `status`, `dataPrevisao`, `idPedido`) VALUES
(37, 'enviado', '2025-06-23', '2025-05-29#6838e962c840a'),
(36, 'enviado', '2025-06-23', '2025-05-30#68392e4f4a345'),
(35, 'enviado', '2025-06-23', '2025-05-29#6838ee1093ae3'),
(34, 'enviado', '2025-06-23', '2025-05-26#6835111b3373f'),
(33, 'enviado', '2025-06-23', '2025-05-26#6835111b3373f');

-- --------------------------------------------------------

--
-- Estrutura para tabela `estado`
--

DROP TABLE IF EXISTS `estado`;
CREATE TABLE IF NOT EXISTS `estado` (
  `idEstado` int NOT NULL AUTO_INCREMENT,
  `UF` char(2) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `estado`
--

INSERT INTO `estado` (`idEstado`, `UF`, `descricao`) VALUES
(11, 'AL', 'AL'),
(12, 'SP', 'SP'),
(13, 'SP', 'SP'),
(14, 'RJ', 'RJ'),
(15, 'PA', 'PA'),
(16, 'PA', 'PA'),
(17, 'PR', 'PR');

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque`
--

DROP TABLE IF EXISTS `estoque`;
CREATE TABLE IF NOT EXISTS `estoque` (
  `idEstoque` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idEstoque`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `estoque`
--

INSERT INTO `estoque` (`idEstoque`, `descricao`) VALUES
(78, 'Caneta Tinteiro Cor Azul');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(200) DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `idCliente` int DEFAULT NULL,
  `idEstoque` int DEFAULT NULL,
  `dtPedido` datetime DEFAULT NULL,
  `vlCompra` decimal(11,2) DEFAULT NULL,
  `avaliaCompra` int DEFAULT NULL,
  `protCompra` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `idCliente` (`idCliente`),
  KEY `idEstoque` (`idEstoque`)
) ENGINE=MyISAM AUTO_INCREMENT=159 DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`idPedido`, `descricao`, `quantidade`, `idCliente`, `idEstoque`, `dtPedido`, `vlCompra`, `avaliaCompra`, `protCompra`) VALUES
(73, 'convite para eventos', 1, 24, 9, '2025-05-26 21:37:32', 19.99, 1, '2025-05-26#6835094c12df1'),
(74, 'banner', 1, 24, 5, '2025-05-15 21:43:06', 59.99, 4, '2025-05-26#68350a9abb060'),
(75, 'logo time', 1, 24, 6, '2025-05-26 21:44:04', 80.99, 5, '2025-05-26#68350ad4881aa'),
(76, 'Etiqueta Adesiva Térmica', 1, 24, 1, '2025-05-26 21:48:14', 8.90, 2, '2025-05-26#68350bce637e2'),
(77, 'banner', 1, 24, 5, '2025-05-15 21:48:52', 59.99, 5, '2025-05-26#68350bf40e527'),
(78, 'Etiqueta Adesiva Térmica', 1, 24, 1, '2025-05-26 21:49:17', 8.90, 5, '2025-05-26#68350c0d0e23a'),
(79, 'Etiqueta Papel Couchê', 1, 24, 2, '2025-05-26 21:49:17', 19.90, 5, '2025-05-26#68350c0d0e23a'),
(80, 'Etiqueta Adesiva Térmica', 1, 25, 1, '2025-05-26 21:51:08', 8.90, 5, '2025-05-26#68350c7cef16f'),
(81, 'Etiqueta Papel Couchê', 2, 25, 2, '2025-05-26 21:51:08', 39.80, 5, '2025-05-26#68350c7cef16f'),
(82, 'Etiqueta Adesiva Térmica', 1, 25, 1, '2025-05-26 21:52:02', 8.90, 5, '2025-05-26#68350cb2cacd3'),
(83, 'Etiqueta Papel Couchê', 2, 25, 2, '2025-05-26 21:52:02', 39.80, 5, '2025-05-26#68350cb2cacd3'),
(84, 'convite para eventos', 1, 25, 9, '2025-05-16 21:52:02', 19.99, 5, '2025-05-26#68350cb2cacd3'),
(85, 'Etiqueta Adesiva Térmica', 1, 25, 1, '2025-05-26 21:53:19', 8.90, 5, '2025-05-26#68350cff71d27'),
(86, 'Etiqueta Papel Couchê', 2, 25, 2, '2025-05-26 21:53:19', 39.80, 5, '2025-05-26#68350cff71d27'),
(87, 'convite para eventos', 1, 25, 9, '2025-05-26 21:53:19', 19.99, 5, '2025-05-26#68350cff71d27'),
(88, 'Etiqueta Adesiva Térmica', 1, 25, 1, '2025-05-26 21:56:51', 8.90, 4, '2025-05-26#68350dd3c496b'),
(89, 'Etiqueta Adesiva Térmica', 1, 25, 1, '2025-05-26 22:07:49', 8.90, 5, '2025-05-26#683510654fc49'),
(90, 'Etiqueta Adesiva Térmica', 1, 25, 1, '2025-05-26 22:08:26', 8.90, 5, '2025-05-26#6835108a5edde'),
(91, 'Etiqueta Adesiva Térmica', 1, 25, 1, '2025-05-26 22:10:51', 8.90, 3, '2025-05-26#6835111b3373f'),
(92, 'Etiqueta Papel Couchê', 1, 25, 2, '2025-05-30 22:10:51', 19.90, 3, '2025-05-26#6835111b3373f'),
(93, 'banner', 1, 25, 5, '2025-05-26 22:14:49', 59.99, 5, '2025-05-26#6835120967738'),
(94, 'Etiqueta Papel Couchê', 1, 25, 2, '2025-05-26 22:36:35', 19.90, 5, '2025-05-26#6835172351400'),
(95, 'Etiqueta Papel Couchê', 1, 25, 2, '2025-05-26 22:46:24', 19.90, 5, '2025-05-26#68351970cfe54'),
(96, 'logo time', 1, 25, 6, '2025-05-27 00:55:37', 80.99, 5, '2025-05-27#683537b93044f'),
(97, 'Etiqueta Papel Couchê', 10, 25, 2, '2025-05-27 01:38:48', 199.00, 0, '2025-05-27#683541d8f07ec'),
(98, 'cartão visita', 1, 25, 4, '2025-05-27 01:38:48', 11.90, 0, '2025-05-27#683541d8f07ec'),
(99, 'cartão visita', 10, 25, 4, '2025-05-27 01:42:33', 119.00, 5, '2025-05-27#683542b9e33c9'),
(100, 'logo time', 5, 25, 6, '2025-05-27 01:49:52', 404.95, 4, '2025-05-27#6835447082f1a'),
(101, 'Etiqueta Papel Couchê', 3, 25, 2, '2025-05-27 01:50:36', 59.70, 5, '2025-05-27#6835449cb1a74'),
(102, 'embalagem', 3, 25, 8, '2025-05-27 01:51:14', 113.70, 1, '2025-05-27#683544c2d7c25'),
(103, 'banner', 3, 25, 5, '2025-05-27 01:51:50', 179.97, 2, '2025-05-27#683544e6d17f9'),
(104, 'convite para eventos', 9, 25, 9, '2025-05-27 03:30:05', 179.91, 1, '2025-05-27#68355bed4984f'),
(105, 'cartão visita', 1, 26, 4, '2025-05-28 22:18:01', 11.90, 5, '2025-05-28#6837b5c954e79'),
(106, 'Etiqueta BOPP Transparente', 1, 26, 3, '2025-05-28 22:18:01', 20.90, 5, '2025-05-28#6837b5c954e79'),
(107, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-28 22:23:02', 8.90, 2, '2025-05-28#6837b6f6ed05b'),
(108, 'Etiqueta Papel Couchê', 1, 26, 2, '2025-05-28 22:29:08', 19.90, 5, '2025-05-28#6837b864f1da5'),
(109, 'Etiqueta Papel Couchê', 1, 26, 2, '2025-05-28 22:33:09', 19.90, 1, '2025-05-28#6837b95589142'),
(110, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-28 22:35:16', 8.90, 1, '2025-05-28#6837b9d4d47a0'),
(111, 'Etiqueta Papel Couchê', 1, 26, 2, '2025-05-28 22:42:28', 19.90, 3, '2025-05-28#6837bb849c0bc'),
(112, 'Etiqueta Papel Couchê', 1, 26, 2, '2025-05-28 22:43:23', 19.90, 1, '2025-05-28#6837bbbbd2b00'),
(113, 'Etiqueta Papel Couchê', 1, 26, 2, '2025-05-28 22:44:59', 19.90, 5, '2025-05-28#6837bc1bbe47a'),
(114, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-28 22:47:03', 8.90, 1, '2025-05-28#6837bc9783593'),
(115, 'Etiqueta Papel Couchê', 1, 26, 2, '2025-05-28 22:50:36', 19.90, 1, '2025-05-28#6837bd6c587de'),
(116, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-28 22:52:36', 8.90, 3, '2025-05-28#6837bde4e9cea'),
(117, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-28 22:54:17', 8.90, 1, '2025-05-28#6837be49ded9a'),
(118, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-28 22:55:28', 8.90, 1, '2025-05-28#6837be90c3d77'),
(119, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-28 22:59:16', 8.90, 1, '2025-05-28#6837bf74eaa2d'),
(120, 'Etiqueta Papel Couchê', 1, 26, 2, '2025-05-28 22:59:46', 19.90, 1, '2025-05-28#6837bf9212ad1'),
(121, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-28 23:00:09', 8.90, 1, '2025-05-28#6837bfa991d02'),
(122, 'Etiqueta Papel Couchê', 1, 26, 2, '2025-05-28 23:01:17', 19.90, 1, '2025-05-28#6837bfed8535a'),
(123, 'Etiqueta Papel Couchê', 1, 26, 2, '2025-05-28 23:03:12', 19.90, 1, '2025-05-28#6837c060e9135'),
(124, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-28 23:50:52', 8.90, 1, '2025-05-28#6837cb8ce0964'),
(125, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-28 23:52:18', 8.90, 1, '2025-05-28#6837cbe220b5d'),
(126, 'Etiqueta BOPP Transparente', 1, 26, 3, '2025-05-28 23:57:35', 20.90, 1, '2025-05-28#6837cd1f3f86d'),
(127, 'Etiqueta BOPP Transparente', 1, 26, 3, '2025-05-28 23:58:08', 20.90, 1, '2025-05-28#6837cd4003416'),
(128, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-29 00:01:08', 8.90, 1, '2025-05-29#6837cdf4a1900'),
(129, 'Etiqueta Papel Couchê', 1, 26, 2, '2025-05-29 01:08:09', 19.90, 1, '2025-05-29#6837dda9048cb'),
(130, 'Etiqueta Papel Couchê', 1, 26, 2, '2025-05-29 01:08:38', 19.90, 1, '2025-05-29#6837ddc639501'),
(131, 'Etiqueta Papel Couchê', 1, 26, 2, '2025-05-29 01:10:12', 19.90, 1, '2025-05-29#6837de24af137'),
(132, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-29 01:12:59', 8.90, 1, '2025-05-29#6837decb8a2f7'),
(133, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-29 01:15:07', 8.90, 1, '2025-05-29#6837df4b9f2cb'),
(134, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-29 01:18:25', 8.90, 1, '2025-05-29#6837e011f0495'),
(135, 'logo time', 1, 26, 6, '2025-05-29 19:48:23', 80.99, 1, '2025-05-29#6838e4375d627'),
(136, 'Etiqueta Papel Couchê', 1, 26, 2, '2025-05-29 19:55:13', 19.90, 1, '2025-05-29#6838e5d139007'),
(137, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-29 19:58:07', 8.90, 2, '2025-05-29#6838e67fda04d'),
(138, 'Etiqueta Papel Couchê', 1, 26, 2, '2025-05-29 19:58:27', 19.90, 1, '2025-05-29#6838e69384ed5'),
(139, 'Etiqueta BOPP Transparente', 1, 26, 3, '2025-05-29 19:59:27', 20.90, 1, '2025-05-29#6838e6cf92d7f'),
(140, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-29 20:02:03', 8.90, 1, '2025-05-29#6838e76bdc67d'),
(141, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-29 20:03:06', 8.90, 1, '2025-05-29#6838e7aac2d1f'),
(142, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-29 20:07:49', 8.90, 1, '2025-05-29#6838e8c5d6131'),
(143, 'Etiqueta Papel Couchê', 1, 26, 2, '2025-05-29 20:10:26', 19.90, 2, '2025-05-29#6838e962c840a'),
(144, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-29 20:12:09', 8.90, 1, '2025-05-29#6838e9c96a890'),
(145, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-29 20:13:43', 8.90, 1, '2025-05-29#6838ea27b5ce7'),
(146, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-29 20:14:23', 8.90, 1, '2025-05-29#6838ea4fe1d20'),
(147, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-29 20:16:39', 8.90, 1, '2025-05-29#6838ead7b7ecd'),
(148, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-29 20:18:57', 8.90, 1, '2025-05-29#6838eb61188ec'),
(149, 'Etiqueta Papel Couchê', 1, 26, 2, '2025-05-29 20:21:45', 19.90, 1, '2025-05-29#6838ec0985fcf'),
(150, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-29 20:22:28', 8.90, 1, '2025-05-29#6838ec3493981'),
(151, 'Etiqueta Papel Couchê', 1, 26, 2, '2025-05-29 20:25:02', 19.90, 1, '2025-05-29#6838ecceb1768'),
(152, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-29 20:26:06', 8.90, 1, '2025-05-29#6838ed0e6fa82'),
(153, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-29 20:30:24', 8.90, 1, '2025-05-29#6838ee1093ae3'),
(154, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-29 20:33:31', 8.90, 1, '2025-05-29#6838eecbb9221'),
(155, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-29 20:36:05', 8.90, 1, '2025-05-29#6838ef65b1e5e'),
(156, 'Etiqueta Adesiva Térmica', 1, 26, 1, '2025-05-29 20:36:33', 8.90, 1, '2025-05-29#6838ef810df66'),
(157, 'logo time', 1, 26, 6, '2025-05-30 00:51:53', 80.99, 1, '2025-05-30#68392b599b7b2'),
(158, 'cartão visita', 1, 26, 4, '2025-05-30 01:04:31', 11.90, 3, '2025-05-30#68392e4f4a345');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE IF NOT EXISTS `produto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `idCategoria` int DEFAULT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `idCategoria` (`idCategoria`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`idProduto`, `nome`, `descricao`, `preco`, `imagem`, `idCategoria`, `quantidade`) VALUES
(1, 'Etiqueta Adesiva Térmica', 'Etiqueta', 8.00, NULL, NULL, 1410),
(2, 'Etiqueta Papel Couchê', 'Etiqueta', 19.00, NULL, NULL, 1284),
(3, 'Etiqueta BOPP Transparente', 'Etiqueta', 20.00, NULL, NULL, 1973),
(4, 'cartão visita', 'Cartão', 11.00, NULL, NULL, 2901),
(5, 'banner', 'banner', 59.00, NULL, NULL, 4946),
(6, 'logo em geral', 'Logo', 80.99, NULL, NULL, 2937),
(7, 'cartão aniverssario', 'Cartão', 10.90, NULL, NULL, 500),
(8, 'embalagem', 'embalagem', 37.90, NULL, NULL, 9973),
(9, 'convites para eventos', 'Convite', 19.99, NULL, NULL, -54),
(16, 'Caneta', 'Caneta Tinteiro Cor Azul', 3.00, NULL, NULL, 200);

-- --------------------------------------------------------

--
-- Estrutura para tabela `telefone`
--

DROP TABLE IF EXISTS `telefone`;
CREATE TABLE IF NOT EXISTS `telefone` (
  `idTelefone` int NOT NULL AUTO_INCREMENT,
  `numero` varchar(15) DEFAULT NULL,
  `idCliente` int DEFAULT NULL,
  PRIMARY KEY (`idTelefone`),
  KEY `idCliente` (`idCliente`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `telefone`
--

INSERT INTO `telefone` (`idTelefone`, `numero`, `idCliente`) VALUES
(19, '99911112222', 21),
(20, '123456789', 22),
(21, '123456789', 23),
(22, '99911112222', 24),
(23, '99911112222', 25),
(24, '99911112222', 26);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `idCliente` int DEFAULT NULL,
  `senha` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idCliente` (`idCliente`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `idCliente`, `senha`) VALUES
(7, 21, 'd54d1702ad0f8326224b817c796763c9'),
(8, 22, 'e10adc3949ba59abbe56e057f20f883e'),
(9, 23, '81dc9bdb52d04dc20036dbd8313ed055'),
(10, 24, '827ccb0eea8a706c4c34a16891f84e7b'),
(11, 25, '827ccb0eea8a706c4c34a16891f84e7b'),
(12, 26, '827ccb0eea8a706c4c34a16891f84e7b');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
