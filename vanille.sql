-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 09 Octobre 2017 à 11:13
-- Version du serveur :  5.6.15-log
-- Version de PHP :  5.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `vanille`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE IF NOT EXISTS `administrateur` (
  `ADM_id` int(2) NOT NULL,
  `nom` char(32) NOT NULL,
  `mdp` char(32) NOT NULL,
  PRIMARY KEY (`ADM_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `administrateur`
--

INSERT INTO `administrateur` (`ADM_id`, `nom`, `mdp`) VALUES
(1, 'admin1', 'A_Dmin?1'),
(2, 'admin2', 'B_dmin!2');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `CAT_id` char(3) NOT NULL,
  `libelle` char(32) DEFAULT NULL,
  PRIMARY KEY (`CAT_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`CAT_id`, `libelle`) VALUES
('bon', 'Bonbons'),
('car', 'Caramels'),
('cho', 'Chocolats');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE IF NOT EXISTS `commande` (
  `CDE_id` int(3) NOT NULL,
  `datecommande` date DEFAULT NULL,
  `nomPrenomClient` char(32) DEFAULT NULL,
  `adresseRueClient` char(32) DEFAULT NULL,
  `cpClient` char(5) DEFAULT NULL,
  `villeClient` char(32) DEFAULT NULL,
  `mailClient` char(50) DEFAULT NULL,
  PRIMARY KEY (`CDE_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `contenir`
--

CREATE TABLE IF NOT EXISTS `contenir` (
  `idcommande` int(3) NOT NULL,
  `idProduit` char(5) NOT NULL,
  PRIMARY KEY (`idcommande`,`idProduit`),
  KEY `I_FK_CONTENIR_Commande` (`idcommande`),
  KEY `I_FK_CONTENIR_Produit` (`idProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE IF NOT EXISTS `produit` (
  `PDT_id` char(5) NOT NULL,
  `description` char(50) DEFAULT NULL,
  `prix` decimal(10,2) DEFAULT NULL,
  `image` char(32) DEFAULT NULL,
  `idCategorie` char(3) NOT NULL,
  PRIMARY KEY (`PDT_id`),
  KEY `I_FK_Produit_CATEGORIE` (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`PDT_id`, `description`, `prix`, `image`, `idCategorie`) VALUES
('BO01', 'Bonbons acidulés Lot 3 Kg', '43.00', 'images/bonbons/bonbon1.png', 'bon'),
('BO02', 'Berlingots en vrac Lot 2Kg', '25.00', 'images/bonbons/bonbon2.png', 'bon'),
('BO03', 'Bonbons menthe Lot 3Kg', '33.00', 'images/bonbons/bonbon3.png', 'bon'),
('BO04', 'Sucettes festives Lot 3Kg', '48.00', 'images/bonbons/bonbon4.png', 'bon'),
('BO05', 'Bonbons surprise Lot 1Kg', '14.00', 'images/bonbons/bonbon5.png', 'bon'),
('BO06', 'Smarties Lot 3Kg', '18.00', 'images/bonbons/bonbon6.png', 'bon'),
('BO07', 'Nounours colorés Lot 2Kg', '24.00', 'images/bonbons/bonbon7.png', 'bon'),
('CA01', 'Caramels Beurre salé  lot 2Kg', '36.00', 'images/caramels/caramel1.png', 'car'),
('CA02', 'Caramels Vanille  lot 1Kg', '13.00', 'images/caramels/caramel2.png', 'car'),
('CA03', 'Caramel tablette Lot 3Kg', '30.00', 'images/caramels/caramel3.png', 'car'),
('CA04', 'Caramels parfumés Lot 2Kg', '41.00', 'images/caramels/caramel4.png', 'car'),
('CA05', 'Caramels croquants Lot 1Kg', '18.00', 'images/caramels/caramel5.png', 'car'),
('CA06', 'Caramels surprise Lot 3 Kg', '48.00', 'images/caramels/caramel6.png', 'car'),
('CH01', 'Chocolats Pralinés lot 1Kg', '17.00', 'images/chocolats/choco1.png', 'cho'),
('CH02', 'Oeufs en chocolat Lot 2Kg', '26.00', 'images/chocolats/choco2.png', 'cho'),
('CH03', 'Fagots au chocolat lot 1Kg', '17.00', 'images/chocolats/choco3.png', 'cho'),
('CH04', 'Chocolats amande Lot 2Kg', '45.00', 'images/chocolats/choco4.png', 'cho'),
('CH05', 'Noir Intense Lot 3Kg', '55.00', 'images/chocolats/choco5.png', 'cho'),
('CH06', 'Vanille Chocolat lot 1Kg', '23.00', 'images/chocolats/choco6.png', 'cho'),
('CH07', 'Trésor de Chocolats  lot 2Kg', '65.00', 'images/chocolats/choco7.png', 'cho'),
('CH08', 'Truffes délice lot 2Kg', '43.00', 'images/chocolats/choco8.png', 'cho');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `contenir`
--
ALTER TABLE `contenir`
  ADD CONSTRAINT `contenir_fk_1` FOREIGN KEY (`idcommande`) REFERENCES `commande` (`CDE_id`),
  ADD CONSTRAINT `contenir_fk_2` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`PDT_id`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`CAT_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
