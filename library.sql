-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2022 at 08:50 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `isbn` int(5) NOT NULL,
  `nom` varchar(250) NOT NULL,
  `auteur` varchar(250) NOT NULL,
  `categorie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`isbn`, `nom`, `auteur`, `categorie`) VALUES
(1, 'book1', 'a1', 'horror'),
(2, 'book2', 'a2', 'romance'),
(3, 'book3', 'a3', 'horror'),
(4, 'book4', 'a4', 'romance'),
(5, 'book5', 'a5', 'horror'),
(6, 'book6', 'a6', 'horror'),
(7, 'book7', 'a7', 'horror');

-- --------------------------------------------------------

--
-- Table structure for table `emprunts`
--

CREATE TABLE `emprunts` (
  `id_emprunteur` int(30) NOT NULL,
  `isbn_livre` int(11) NOT NULL,
  `duree_emprunt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emprunts`
--

INSERT INTO `emprunts` (`id_emprunteur`, `isbn_livre`, `duree_emprunt`) VALUES
(8, 1, 14),
(8, 1, 14),
(8, 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `nom` varchar(256) NOT NULL,
  `prenom` varchar(256) NOT NULL,
  `username` varchar(30) NOT NULL,
  `type` varchar(30) DEFAULT 'membre',
  `password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nom`, `prenom`, `username`, `type`, `password`) VALUES
(1, 'khalil', 'sbai', 'ksbai', 'membre', '12345678'),
(2, 'john', 'king', 'johnk', 'membre', '12345678'),
(3, 'kim', 'jon', 'kim', 'admin', 'kim'),
(4, 'big', 'jon', 'biggie', 'membre', 'big2'),
(5, 'em', 'marsh', 'emmarsh', 'membre', '12345678'),
(6, 'ali', 'jim', 'ajim', 'admin', 'hello'),
(7, 'admin', 'admin', 'admin', 'admin', 'admin'),
(8, 'user', 'user', 'user', 'membre', 'user'),
(9, 'kami', 'kami', 'kami2d', 'membre', 'kamio'),
(10, 'kami', 'sdgdsg', 'sdgsdg', 'membre', 'sdg'),
(11, 'sdg', 'gsdg', 'g', 'membre', 'sdg'),
(13, 'rezgui', 'rayen', 'rayen', 'membre', 'azer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`isbn`);

--
-- Indexes for table `emprunts`
--
ALTER TABLE `emprunts`
  ADD KEY `id_emprunteur` (`id_emprunteur`),
  ADD KEY `isbn_livre` (`isbn_livre`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `isbn` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `emprunts`
--
ALTER TABLE `emprunts`
  ADD CONSTRAINT `emprunts_ibfk_1` FOREIGN KEY (`id_emprunteur`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `emprunts_ibfk_2` FOREIGN KEY (`isbn_livre`) REFERENCES `books` (`isbn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
