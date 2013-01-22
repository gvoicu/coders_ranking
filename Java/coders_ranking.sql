-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 06, 2013 at 09:31 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `coders_ranking`
--

-- --------------------------------------------------------

--
-- Table structure for table `banned_users`
--

CREATE TABLE IF NOT EXISTS `banned_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` text NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `banned_words`
--

CREATE TABLE IF NOT EXISTS `banned_words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `banned_words`
--

INSERT INTO `banned_words` (`id`, `word`) VALUES
(1, 'porn'),
(2, 'violence'),
(3, 'conspire'),
(4, 'hacking');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE IF NOT EXISTS `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `name`) VALUES
(1, 'The Definitive ANTLR Reference'),
(2, 'Programming interviews.Exposed');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `email`, `message`) VALUES
(1, 'gigi@gmail.com', 'Dinamo bate tot'),
(2, 'gigi@steaua.com', 'Vedem noi in campionat'),
(3, 'lala@lala.com', 'Eu nu sunt de acord'),
(4, 'lala@lala.com', 'Eu nu sunt de acord'),
(5, 'lala@lala.com', 'Eu nu sunt de acord'),
(6, 'lala@lala.com', 'Eu nu sunt de acord'),
(7, 'lala@lala.com', 'Eu nu sunt de acord'),
(8, 'lala@lala.com', 'm-ai auzit'),
(9, 'lala@lala.com', 'm-ai auzit'),
(10, 'lala@lala.com', 'm-ai auzit'),
(11, 'lala@lala.com', 'm-ai auzit'),
(12, 'lala@lala.com', 'm-ai auzit'),
(13, 'lala@lala.com', 'lala'),
(14, 'lala@lala.com', 'pare?'),
(15, 'lala@lala.com', 'tot eu'),
(16, 'pajarcu.petre@gmail.com', 'Eu nu'),
(17, 'pajarcu.petre@gmail.com', 'Mesaj nou');

-- --------------------------------------------------------

--
-- Table structure for table `dictionar`
--

CREATE TABLE IF NOT EXISTS `dictionar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `english` text NOT NULL,
  `roman` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `dictionar`
--

INSERT INTO `dictionar` (`id`, `english`, `roman`) VALUES
(1, 'ranking', 'clasament'),
(2, 'points', 'puncte'),
(3, 'account', 'cont'),
(4, 'username', 'nume utilizator'),
(5, 'password', 'parola'),
(6, 'profile picture', 'imagine de profil'),
(7, 'choose', 'alege'),
(8, 'wishlist', 'lista cu dorinte'),
(9, 'your own', 'propria-ti'),
(10, 'Hopefully', 'Sa speram'),
(11, 'shares', 'impartaseste');

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE IF NOT EXISTS `games` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `name`) VALUES
(1, 'Sorry, I only play outside :P'),
(2, 'Football Manager');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `location`) VALUES
(1, '/assets/images/Blossom-pics-blossom-powerpuff-girls-12673815-676-955.jpg'),
(2, '/assets/images/c++.jpg'),
(3, '/assets/images/champ.jpg'),
(4, '/assets/images/dep_1230624-Beautiful-woman-silhouette-with-a-flower.jpg'),
(5, '/assets/images/dep_13448956-Yoga-silhouette.jpg'),
(6, '/assets/images/depositphotos_2576535-Beautiful-woman-silhouette.jpg'),
(7, '/assets/images/java.jpg'),
(8, '/assets/images/HTML5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` text NOT NULL,
  `title` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `email`, `title`, `message`) VALUES
(1, 'gigi@steaua.com', 'SteauaRomania', 'Vreau primul 11 de la steaua'),
(2, 'gigi@steaua.com', 'SampionLeague', 'Vreau Totul in SampionLeague'),
(3, 'lala@lala.com', 'lala', 'lungu'),
(4, 'lala@lala.com', 'bubbles', 'flowers'),
(5, 'lala@lala.com', 'ploaia', 'spam'),
(6, 'gigi@steaua.com', 'Hello', 'mees'),
(7, 'gigi@steaua.com', 'hello', '2'),
(8, 'gigi@steaua.com', '', ''),
(9, 'pajarcu.petre@gmail.com', 'Hello', 'Salut, Sunt nou pe aici'),
(10, 'pajarcu.petre@gmail.com', 'Hello', 'Salut, Sunt nou pe aici'),
(11, 'pajarcu.petre@gmail.com', 'Hello', 'Salut, Sunt nou pe aici'),
(12, 'pajarcu.petre@gmail.com', 'hack _me', ''),
(13, 'pajarcu.petre@gmail.com', 'hack ', ''),
(14, 'pajarcu.petre@gmail.com', '', 'hack'),
(15, 'pajarcu.petre@gmail.com', 'conspire', ''),
(16, 'pajarcu.petre@gmail.com', 'conspire', '');

-- --------------------------------------------------------

--
-- Table structure for table `progr_languages`
--

CREATE TABLE IF NOT EXISTS `progr_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `progr_languages`
--

INSERT INTO `progr_languages` (`id`, `name`) VALUES
(1, 'Java'),
(2, 'Python'),
(34, 'C#');

-- --------------------------------------------------------

--
-- Table structure for table `rel_posts_comments`
--

CREATE TABLE IF NOT EXISTS `rel_posts_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_posts` int(11) NOT NULL,
  `id_comments` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `rel_posts_comments`
--

INSERT INTO `rel_posts_comments` (`id`, `id_posts`, `id_comments`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 3),
(5, 6, 3),
(6, 7, 3),
(7, 8, 3),
(8, 1, 8),
(9, 2, 8),
(10, 6, 8),
(11, 7, 8),
(12, 8, 8),
(13, 2, 13),
(14, 7, 14),
(15, 3, 15),
(16, 9, 16),
(17, 1, 17);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `email` text NOT NULL,
  `birthday` text NOT NULL,
  `password_hash` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `birthday`, `password_hash`) VALUES
(1, 'default', 'default', 'pajarcu.petre@gmail.com', 'default', 'default'),
(2, 'default', 'defaul', 'gigi@steaua.com', 'default', 'default'),
(3, 'Andra', 'Lungu', 'lungu.andra@gmail.com', '28091990', '1418f38f11db420937b98aa24fad581'),
(20, 'Blossom', 'Powerpuff', 'b_power@gmail.com', '1102000', 'fe75bd65ff48b91c35fe8ff842f986c'),
(21, 'Gigi', 'Frone', 'gigi@gmail.com', '09121992', 'ecc8fe7ad80dfe93cde35448b1d581'),
(22, 'Vadim', 'Tudor', 'tudor@vadim', '11111943', '81dc9bdb52d04dc2036dbd8313ed055'),
(23, 'Gigi', 'Becali', 'gigi@steaua.com', '25121968', 'ecc8fe7ad80dfe93cde35448b1d581'),
(24, 'lala', 'lala', 'lala@lala.com', '', '5f4dcc3b5aa765d61d8327deb882cf99'),
(25, 'eu', 'tu', 'eu@tu.org', '', '2e3817293fc275dbee74bd71ce6eb056'),
(26, 'nana', 'nana', 'nana@na', '', '518d5f341534f5c6c21977f12f6989'),
(27, 'Petre', 'Pajarcu', 'pajarcu.petre@gmail.com', '15121989', '12d5d22ffcb12037ae684c2c8c98df');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE IF NOT EXISTS `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` text NOT NULL,
  `id_image` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `id_amazon` int(11) NOT NULL,
  `id_game` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`id`, `email`, `id_image`, `id_lang`, `id_amazon`, `id_game`) VALUES
(1, 'lungu.andra@gmail.com', -1, -1, -1, -1),
(2, 'b_power@gmail.com', -1, -1, -1, -1),
(3, 'gigi@gmail.com', -1, -1, -1, -1),
(4, 'tudor@vadim', -1, -1, -1, -1),
(5, 'gigi@steaua.com', 3, 2, 1, 2),
(6, 'lala@lala.com', 4, 34, 2, 1),
(7, 'eu@tu.org', 5, 24, -1, -1),
(8, 'nana@na', 4, 34, 2, 1),
(9, 'pajarcu.petre@gmail.com', 5, 2, 1, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
