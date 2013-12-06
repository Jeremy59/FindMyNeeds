-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Ven 06 Décembre 2013 à 05:40
-- Version du serveur: 5.5.31
-- Version de PHP: 5.4.19-1~dotdeb.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `c0findmyneeds`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `description` text NOT NULL,
  `restrictionage` int(11) NOT NULL,
  `idcatutilisateur` int(11) NOT NULL,
  `idcatarticle` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idcatarticle` (`idcatarticle`),
  KEY `idcatutilisateur` (`idcatutilisateur`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Structure de la table `avisarticles`
--

CREATE TABLE IF NOT EXISTS `avisarticles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `date` date NOT NULL,
  `note` smallint(6) NOT NULL,
  `description` text NOT NULL,
  `idarticle` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idarticle` (`idarticle`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Structure de la table `avisvendeurs`
--

CREATE TABLE IF NOT EXISTS `avisvendeurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `date` date NOT NULL,
  `note` smallint(6) NOT NULL,
  `description` text NOT NULL,
  `idvendeur` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idvendeur` (`idvendeur`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Structure de la table `categoriearticle`
--

CREATE TABLE IF NOT EXISTS `categoriearticle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Structure de la table `categorieutilisateur`
--

CREATE TABLE IF NOT EXISTS `categorieutilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Structure de la table `concerne`
--

CREATE TABLE IF NOT EXISTS `concerne` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idmot` int(11) NOT NULL,
  `idarticle` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idarticle` (`idarticle`),
  KEY `idmot` (`idmot`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Structure de la table `localisation`
--

CREATE TABLE IF NOT EXISTS `localisation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lattitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Structure de la table `motscles`
--

CREATE TABLE IF NOT EXISTS `motscles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mot` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Structure de la table `setrouve`
--

CREATE TABLE IF NOT EXISTS `setrouve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idarticle` int(11) NOT NULL,
  `idlocalisation` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idlocalisation` (`idlocalisation`),
  KEY `idarticle` (`idarticle`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Structure de la table `vend`
--

CREATE TABLE IF NOT EXISTS `vend` (
  `idvente` int(11) NOT NULL AUTO_INCREMENT,
  `idvendeur` int(11) NOT NULL,
  `idarticle` int(11) NOT NULL,
  `lien` text NOT NULL,
  `prix` int(11) NOT NULL,
  PRIMARY KEY (`idvente`),
  KEY `idvendeur` (`idvendeur`),
  KEY `idarticle` (`idarticle`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Structure de la table `vendeurs`
--

CREATE TABLE IF NOT EXISTS `vendeurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `adresse` text NOT NULL,
  `codepostal` int(11) NOT NULL,
  `site` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `ccatutilart` FOREIGN KEY (`idcatarticle`) REFERENCES `categoriearticle` (`id`),
  ADD CONSTRAINT `ccatutilutil` FOREIGN KEY (`idcatutilisateur`) REFERENCES `categorieutilisateur` (`id`);

--
-- Contraintes pour la table `avisarticles`
--
ALTER TABLE `avisarticles`
  ADD CONSTRAINT `cidarticle` FOREIGN KEY (`idarticle`) REFERENCES `articles` (`id`);

--
-- Contraintes pour la table `avisvendeurs`
--
ALTER TABLE `avisvendeurs`
  ADD CONSTRAINT `cidvendeur` FOREIGN KEY (`idvendeur`) REFERENCES `vendeurs` (`id`);

--
-- Contraintes pour la table `concerne`
--
ALTER TABLE `concerne`
  ADD CONSTRAINT `cidarticle3` FOREIGN KEY (`idarticle`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `cidmot` FOREIGN KEY (`idmot`) REFERENCES `motscles` (`id`);

--
-- Contraintes pour la table `setrouve`
--
ALTER TABLE `setrouve`
  ADD CONSTRAINT `csetrouveloca` FOREIGN KEY (`idlocalisation`) REFERENCES `localisation` (`id`),
  ADD CONSTRAINT `csetrouveart` FOREIGN KEY (`idarticle`) REFERENCES `articles` (`id`);

--
-- Contraintes pour la table `vend`
--
ALTER TABLE `vend`
  ADD CONSTRAINT `cidarticle2` FOREIGN KEY (`idarticle`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `cidvendeur1` FOREIGN KEY (`idvendeur`) REFERENCES `vendeurs` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
