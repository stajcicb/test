-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 27, 2018 at 11:13 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `etf_psi2018_k2`
--

-- --------------------------------------------------------

--
-- Table structure for table `drzi_predmet`
--

DROP TABLE IF EXISTS `drzi_predmet`;
CREATE TABLE IF NOT EXISTS `drzi_predmet` (
  `korisnickoime` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `sifrapredmet` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`korisnickoime`,`sifrapredmet`),
  KEY `sifrapredmet` (`sifrapredmet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `drzi_predmet`
--

INSERT INTO `drzi_predmet` (`korisnickoime`, `sifrapredmet`) VALUES
('bojic', 'si3psi'),
('draskovic', 'si3psi'),
('sekularac', 'si3psi'),
('bojic', 'si3ts'),
('draskovic', 'si3ts'),
('draskovic', 'si4pia'),
('nbosko', 'si4pia'),
('bojic', 'si4pp1'),
('sekularac', 'si4sab');

-- --------------------------------------------------------

--
-- Table structure for table `nastavnik`
--

DROP TABLE IF EXISTS `nastavnik`;
CREATE TABLE IF NOT EXISTS `nastavnik` (
  `username` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `ime` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `prezime` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `titula` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `zvanje` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`username`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nastavnik`
--

INSERT INTO `nastavnik` (`username`, `password`, `ime`, `prezime`, `titula`, `zvanje`) VALUES
('bojic', 'dragan123', 'Dragan', 'Bojic', 'Dr', 'vanredni prof.'),
('draskovic', 'drazen123', 'Drazen', 'Draskovic', 'MSc', 'asistent u nastavi'),
('nbosko', 'bosko123', 'Bosko', 'Nikolic', 'Dr', 'redovni prof.'),
('sekularac', 'tasha123', 'Tamara', 'Sekularac', 'BSc', 'saradnik u nastavi');

-- --------------------------------------------------------

--
-- Table structure for table `polaganje`
--

DROP TABLE IF EXISTS `polaganje`;
CREATE TABLE IF NOT EXISTS `polaganje` (
  `idprijave` int(11) NOT NULL AUTO_INCREMENT,
  `user_student` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `user_nastavnik` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `sifra_predmet` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `ocena` int(11) NOT NULL,
  PRIMARY KEY (`idprijave`),
  KEY `user_student` (`user_student`),
  KEY `user_nastavnik` (`user_nastavnik`),
  KEY `sifra_predmet` (`sifra_predmet`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `polaganje`
--

INSERT INTO `polaganje` (`idprijave`, `user_student`, `user_nastavnik`, `sifra_predmet`, `ocena`) VALUES
(1, 'jova', 'bojic', 'si3psi', 9),
(2, 'petar', 'draskovic', 'si3psi', 8);

-- --------------------------------------------------------

--
-- Table structure for table `predmet`
--

DROP TABLE IF EXISTS `predmet`;
CREATE TABLE IF NOT EXISTS `predmet` (
  `sifra` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `naziv` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ESPB` int(11) NOT NULL,
  `tip` varchar(1) COLLATE utf8_unicode_ci NOT NULL COMMENT 'o - obavezni, i - izborni',
  `semestar` int(11) NOT NULL,
  PRIMARY KEY (`sifra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `predmet`
--

INSERT INTO `predmet` (`sifra`, `naziv`, `ESPB`, `tip`, `semestar`) VALUES
('si3kdp', 'Konkurentno i distribuirano programiranje', 6, 'o', 6),
('si3psi', 'Prinicipi softverskog inzenjerstva', 6, 'o', 6),
('si3ts', 'Testiranje softvera', 6, 'i', 5),
('si4pia', 'Programiranje Internet aplikacija', 5, 'o', 7),
('si4pp1', 'Programski prevodioci 1', 6, 'o', 7),
('si4sab', 'Softverski alati baza podataka', 5, 'i', 8);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `username` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `ime` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `prezime` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `godina_upisa` int(11) NOT NULL,
  `broj_indeksa` int(11) NOT NULL,
  `odsek` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`username`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`username`, `password`, `ime`, `prezime`, `godina_upisa`, `broj_indeksa`, `odsek`) VALUES
('jova', 'sifra123', 'Jovan', 'Jovanovic', 2016, 133, 'SI'),
('jovana', 'sifra123', 'Jovana', 'Jovanovic', 2015, 122, 'RTI'),
('milana', 'sifra123', 'Milana', 'Milanovic', 2016, 244, 'RTI'),
('petar', 'sifra123', 'Petar', 'Petrovic', 2015, 396, 'SI');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `drzi_predmet`
--
ALTER TABLE `drzi_predmet`
  ADD CONSTRAINT `drzi_predmet_ibfk_1` FOREIGN KEY (`korisnickoime`) REFERENCES `nastavnik` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `drzi_predmet_ibfk_2` FOREIGN KEY (`sifrapredmet`) REFERENCES `predmet` (`sifra`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `polaganje`
--
ALTER TABLE `polaganje`
  ADD CONSTRAINT `polaganje_ibfk_1` FOREIGN KEY (`user_student`) REFERENCES `student` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `polaganje_ibfk_2` FOREIGN KEY (`user_nastavnik`) REFERENCES `nastavnik` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `polaganje_ibfk_3` FOREIGN KEY (`sifra_predmet`) REFERENCES `predmet` (`sifra`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
