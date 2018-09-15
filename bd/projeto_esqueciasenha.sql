-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 15-Set-2018 às 16:12
-- Versão do servidor: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projeto_esqueciasenha`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `senha`) VALUES
(1, 'lucas@gmail.com', '698dc19d489c4e4db73e28a713eab07b'),
(2, 'teste@gmail.com', '202cb962ac59075b964b07152d234b70'),
(3, 'samuel@gmail.com', '698dc19d489c4e4db73e28a713eab07b');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios_token`
--

CREATE TABLE `usuarios_token` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `used` tinyint(1) DEFAULT '0',
  `expired_in` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios_token`
--

INSERT INTO `usuarios_token` (`id`, `id_usuario`, `hash`, `used`, `expired_in`) VALUES
(1, 1, 'asdfasdfas', 0, '0000-00-00 00:00:00'),
(2, 1, 'adsfasdfasdf', NULL, '0000-00-00 00:00:00'),
(3, 1, 'adsfasdfasdfas', 0, '0000-00-00 00:00:00'),
(4, 1, 'adfadsfasdf', 0, '2018-09-15 09:41:38'),
(5, 2, '52020abd62569a885dcf068de9ad8dad', 0, '2018-11-15 15:36:00'),
(6, 2, 'd501fc02f38c2fec962b08fe845751b1', 0, '2018-11-15 15:46:00'),
(7, 1, 'a037098839b98181e1051f270cfc4a3b', 1, '2018-11-15 15:56:00'),
(8, 1, '863ee5028b726fc8e18fc9de022b5d45', 0, '2018-11-15 15:59:00'),
(9, 1, 'a074ea0af646ebd4b572903f53e35db7', 0, '2018-11-15 16:01:00'),
(10, 1, 'f19daf8017b27aaf3a47db6b32276c76', 1, '2018-11-15 16:02:00'),
(11, 3, '8f1c655f6f9ee2fa0a5aaa0260e83f1f', 1, '2018-11-15 16:06:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios_token`
--
ALTER TABLE `usuarios_token`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usuarios_token`
--
ALTER TABLE `usuarios_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
