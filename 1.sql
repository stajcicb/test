-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2018 at 02:09 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `etfbaza-2018k2-drazen`
--

-- --------------------------------------------------------

--
-- Table structure for table `drzi_predmet`
--

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
('nastavnik', 'si3psi'),
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
-- Table structure for table `korisnik`
--

CREATE TABLE IF NOT EXISTS `korisnik` (
  `username` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `ime` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `prezime` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`username`, `password`, `ime`, `prezime`, `email`) VALUES
('nastavnik', 'sifra321', 'Nastavnik', 'Nastavnikovic', 'nastavnik@etf.rs'),
('bojic', 'dragan123', 'Dragan', 'Bojic', 'bojic@etf.rs'),
('draskovic', 'drasko123', 'Dražen', 'Drašković', 'draskovic@etf.rs'),
('nbosko', 'bosko123', 'Boško', 'Nikolić', 'nbosko@etf.rs'),
('sekularac', 'tamara321', 'Tamara', 'Šekularac', 'tasha@etf.rs');

-- --------------------------------------------------------

--
-- Table structure for table `nastavnik`
--

CREATE TABLE IF NOT EXISTS `nastavnik` (
  `username` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `titula` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `zvanje` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`username`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nastavnik`
--

INSERT INTO `nastavnik` (`username`, `titula`, `zvanje`) VALUES
('nastavnik', 'Dr', 'redovni prof.'),
('bojic', 'Dr', 'vanredni prof.'),
('draskovic', 'MSc', 'asistent u nastavi'),
('nbosko', 'Dr', 'redovni prof.'),
('sekularac', 'BSc', 'saradnik u nastavi');

-- --------------------------------------------------------

--
-- Table structure for table `polaganje`
--

CREATE TABLE IF NOT EXISTS `polaganje` (
  `idprijave` int(11) NOT NULL AUTO_INCREMENT,
  `user_student` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `user_nastavnik` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `sifra_predmet` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `datum_unosa` date NOT NULL,
  `ocena` int(11) NOT NULL,
  `ponistio` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idprijave`),
  KEY `user_student` (`user_student`),
  KEY `user_nastavnik` (`user_nastavnik`),
  KEY `sifra_predmet` (`sifra_predmet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `predmet`
--

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
-- Table structure for table `slusa_predmet`
--

CREATE TABLE IF NOT EXISTS `slusa_predmet` (
  `korisnickoime` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `sifrapredmet` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`korisnickoime`,`sifrapredmet`),
  KEY `sifrapredmet` (`sifrapredmet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `username` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `godina_upisa` int(11) NOT NULL,
  `broj_indeksa` int(11) NOT NULL,
  `odsek` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`username`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `drzi_predmet`
--
ALTER TABLE `drzi_predmet`
  ADD CONSTRAINT `drzi_predmet_ibfk_2` FOREIGN KEY (`sifrapredmet`) REFERENCES `predmet` (`sifra`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `drzi_predmet_ibfk_1` FOREIGN KEY (`korisnickoime`) REFERENCES `korisnik` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nastavnik`
--
ALTER TABLE `nastavnik`
  ADD CONSTRAINT `nastavnik_ibfk_1` FOREIGN KEY (`username`) REFERENCES `korisnik` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `polaganje`
--
ALTER TABLE `polaganje`
  ADD CONSTRAINT `polaganje_ibfk_3` FOREIGN KEY (`sifra_predmet`) REFERENCES `predmet` (`sifra`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `polaganje_ibfk_1` FOREIGN KEY (`user_student`) REFERENCES `student` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `polaganje_ibfk_2` FOREIGN KEY (`user_nastavnik`) REFERENCES `nastavnik` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `slusa_predmet`
--
ALTER TABLE `slusa_predmet`
  ADD CONSTRAINT `slusa_predmet_ibfk_2` FOREIGN KEY (`sifrapredmet`) REFERENCES `predmet` (`sifra`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `slusa_predmet_ibfk_1` FOREIGN KEY (`korisnickoime`) REFERENCES `korisnik` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`username`) REFERENCES `korisnik` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
