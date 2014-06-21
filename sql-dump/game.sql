-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Darbinė stotis: localhost
-- Atlikimo laikas: 2014 m. Bir 17 d. 18:14
-- Serverio versija: 5.6.12-log
-- PHP versija: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Duomenų bazė: `game`
--
CREATE DATABASE IF NOT EXISTS `game` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `game`;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `records`
--

CREATE TABLE IF NOT EXISTS `records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `prize` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `step1`
--

CREATE TABLE IF NOT EXISTS `step1` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` varchar(255) NOT NULL,
  `A` varchar(255) NOT NULL,
  `B` varchar(255) NOT NULL,
  `C` varchar(255) NOT NULL,
  `D` varchar(255) NOT NULL,
  `step` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Sukurta duomenų kopija lentelei `step1`
--

INSERT INTO `step1` (`id`, `question`, `answer`, `A`, `B`, `C`, `D`, `step`) VALUES
(1, 'How many rings does Olympic flag have ?', 'A', 'Five', 'Six', 'Four', 'Ten', 100),
(2, 'What did Erno Rubik invent in 1975 ?', 'C', 'Microscope', 'Telegraph', 'Rubik''s Cube', 'Polygraph', 100);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `step2`
--

CREATE TABLE IF NOT EXISTS `step2` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` varchar(255) NOT NULL,
  `A` varchar(255) NOT NULL,
  `B` varchar(255) NOT NULL,
  `C` varchar(255) NOT NULL,
  `D` varchar(255) NOT NULL,
  `step` int(11) NOT NULL DEFAULT '200',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Sukurta duomenų kopija lentelei `step2`
--

INSERT INTO `step2` (`id`, `question`, `answer`, `A`, `B`, `C`, `D`, `step`) VALUES
(1, 'Which country has won the most FIFA World Cups in football?', 'D', 'Argentina', 'Spain', 'Japan', 'Brazil', 200),
(2, 'Which of the following, is the best source of protein ?', 'B', 'Salad', 'Fish', 'Cucumber', 'Grape', 200);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `step3`
--

CREATE TABLE IF NOT EXISTS `step3` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` varchar(255) NOT NULL,
  `A` varchar(255) NOT NULL,
  `B` varchar(255) NOT NULL,
  `C` varchar(255) NOT NULL,
  `D` varchar(255) NOT NULL,
  `step` int(11) NOT NULL DEFAULT '300',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Sukurta duomenų kopija lentelei `step3`
--

INSERT INTO `step3` (`id`, `question`, `answer`, `A`, `B`, `C`, `D`, `step`) VALUES
(1, 'What kind of scientist was Euclid ?', 'C', 'Philosophist', 'Chemist', 'Mathematic', 'Physician', 300),
(2, 'Which of the following, is the longest river in Europe ?', 'D', 'Ural', 'Elbe', 'Oka', 'Volga', 300);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `step4`
--

CREATE TABLE IF NOT EXISTS `step4` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` varchar(255) NOT NULL,
  `A` varchar(255) NOT NULL,
  `B` varchar(255) NOT NULL,
  `C` varchar(255) NOT NULL,
  `D` varchar(255) NOT NULL,
  `step` int(11) NOT NULL DEFAULT '500',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Sukurta duomenų kopija lentelei `step4`
--

INSERT INTO `step4` (`id`, `question`, `answer`, `A`, `B`, `C`, `D`, `step`) VALUES
(1, 'Which of the following, is the biggest moon of the Saturn ?', 'A', 'Titan', 'Rhea', 'Hyperion', 'Iapetus', 500),
(2, 'Which of the following musicians is also known as "King of POP" ?', 'D', 'Frank zappa', 'Freddie mercury', 'George Michael', 'Michael Jackson', 500);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `step5`
--

CREATE TABLE IF NOT EXISTS `step5` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` varchar(255) NOT NULL,
  `A` varchar(255) NOT NULL,
  `B` varchar(255) NOT NULL,
  `C` varchar(255) NOT NULL,
  `D` varchar(255) NOT NULL,
  `step` int(11) NOT NULL DEFAULT '1000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Sukurta duomenų kopija lentelei `step5`
--

INSERT INTO `step5` (`id`, `question`, `answer`, `A`, `B`, `C`, `D`, `step`) VALUES
(1, 'What do you call someone who doesn''''t believe in god ?', 'A', 'Atheist', 'Agnostic', 'Theist', 'Skeptic', 1000),
(2, 'Which animal, is the fastest animal in the world ?', 'B', 'Lion', 'Cheetah', 'Greyhound', 'Horse', 1000);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `step6`
--

CREATE TABLE IF NOT EXISTS `step6` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` varchar(255) NOT NULL,
  `A` varchar(255) NOT NULL,
  `B` varchar(255) NOT NULL,
  `C` varchar(255) NOT NULL,
  `D` varchar(255) NOT NULL,
  `step` int(11) NOT NULL DEFAULT '2000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Sukurta duomenų kopija lentelei `step6`
--

INSERT INTO `step6` (`id`, `question`, `answer`, `A`, `B`, `C`, `D`, `step`) VALUES
(1, 'Which of the following, is the largest company by revenue ?', 'A', 'Wal-Mart', 'BP', 'Apple', 'Shell', 2000),
(2, 'How many percent of earth, is covered by water ?', 'D', '50', '80', '62', '71', 2000);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `step7`
--

CREATE TABLE IF NOT EXISTS `step7` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` varchar(255) NOT NULL,
  `A` varchar(255) NOT NULL,
  `B` varchar(255) NOT NULL,
  `C` varchar(255) NOT NULL,
  `D` varchar(255) NOT NULL,
  `step` int(11) NOT NULL DEFAULT '4000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Sukurta duomenų kopija lentelei `step7`
--

INSERT INTO `step7` (`id`, `question`, `answer`, `A`, `B`, `C`, `D`, `step`) VALUES
(1, 'What year did 9/11 happen ?', 'B', '1999', '2001', '2004', '2000', 4000),
(2, 'Who were the defeated finalists at Euro 2008 ?', 'A', 'Germany', 'England', 'France', 'Poland', 4000);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `step8`
--

CREATE TABLE IF NOT EXISTS `step8` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` varchar(255) NOT NULL,
  `A` varchar(255) NOT NULL,
  `B` varchar(255) NOT NULL,
  `C` varchar(255) NOT NULL,
  `D` varchar(255) NOT NULL,
  `step` int(11) NOT NULL DEFAULT '8000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Sukurta duomenų kopija lentelei `step8`
--

INSERT INTO `step8` (`id`, `question`, `answer`, `A`, `B`, `C`, `D`, `step`) VALUES
(1, 'How many independent countries border the Caspian sea ?', 'D', 'Four', 'Six', 'Two', 'Five', 8000),
(2, 'What is the Closest Planet to Earth?', 'A', 'Venus', 'Mars', 'Jupiter', 'Saturn', 8000);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `step9`
--

CREATE TABLE IF NOT EXISTS `step9` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` varchar(255) NOT NULL,
  `A` varchar(255) NOT NULL,
  `B` varchar(255) NOT NULL,
  `C` varchar(255) NOT NULL,
  `D` varchar(255) NOT NULL,
  `step` int(11) NOT NULL DEFAULT '16000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Sukurta duomenų kopija lentelei `step9`
--

INSERT INTO `step9` (`id`, `question`, `answer`, `A`, `B`, `C`, `D`, `step`) VALUES
(1, 'How many teeth do adult human have in their mouth ?', 'C', '30', '38', '32', '28', 16000),
(2, 'What country declared independence from Serbia in 2008 ?', 'B', 'Albania', 'Kosovo', 'Montenegro', 'Macedonia', 16000);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `step10`
--

CREATE TABLE IF NOT EXISTS `step10` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` varchar(255) NOT NULL,
  `A` varchar(255) NOT NULL,
  `B` varchar(255) NOT NULL,
  `C` varchar(255) NOT NULL,
  `D` varchar(255) NOT NULL,
  `step` int(11) NOT NULL DEFAULT '32000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Sukurta duomenų kopija lentelei `step10`
--

INSERT INTO `step10` (`id`, `question`, `answer`, `A`, `B`, `C`, `D`, `step`) VALUES
(1, 'Who invented Mobile phone?', 'A', 'Martin Cooper', 'Alexander Graham Bell', 'Thomas Edison', 'Albert Einstein', 32000),
(2, 'Which football club in England has won the most trophies ?', 'D', 'Liverpool', 'Chelsea', 'Arsenal', 'Manchester United', 32000);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `step11`
--

CREATE TABLE IF NOT EXISTS `step11` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` varchar(255) NOT NULL,
  `A` varchar(255) NOT NULL,
  `B` varchar(255) NOT NULL,
  `C` varchar(255) NOT NULL,
  `D` varchar(255) NOT NULL,
  `step` int(11) NOT NULL DEFAULT '64000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Sukurta duomenų kopija lentelei `step11`
--

INSERT INTO `step11` (`id`, `question`, `answer`, `A`, `B`, `C`, `D`, `step`) VALUES
(1, 'Entomology is the science that studies ?', 'C', 'The formation of rocks', 'Behavior of human beings', 'Insects', 'Computers', 64000),
(2, 'Grand Central Terminal, Park Avenue, New York is the world''s ?', 'B', 'Highest railway station', 'Largest railway station', 'Longest railway station', 'Largest airport', 64000);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `step12`
--

CREATE TABLE IF NOT EXISTS `step12` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` varchar(255) NOT NULL,
  `A` varchar(255) NOT NULL,
  `B` varchar(255) NOT NULL,
  `C` varchar(255) NOT NULL,
  `D` varchar(255) NOT NULL,
  `step` int(11) NOT NULL DEFAULT '125000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Sukurta duomenų kopija lentelei `step12`
--

INSERT INTO `step12` (`id`, `question`, `answer`, `A`, `B`, `C`, `D`, `step`) VALUES
(1, 'Hitler party which came into power in 1933 is known as ?', 'A', 'Nazi Party', 'Labour Party', 'Ku-Klux-Klan', 'Democratic Party', 125000),
(2, 'Epsom (England) is the place associated with ?', 'B', 'Polo', 'Horse racing', 'Shooting', 'Snooker', 125000);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `step13`
--

CREATE TABLE IF NOT EXISTS `step13` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` varchar(255) NOT NULL,
  `A` varchar(255) NOT NULL,
  `B` varchar(255) NOT NULL,
  `C` varchar(255) NOT NULL,
  `D` varchar(255) NOT NULL,
  `step` int(11) NOT NULL DEFAULT '250000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Sukurta duomenų kopija lentelei `step13`
--

INSERT INTO `step13` (`id`, `question`, `answer`, `A`, `B`, `C`, `D`, `step`) VALUES
(1, 'First human heart transplant operation conducted by Dr. Christian Bernard on Louis Washkansky, was conducted in ?', 'D', '1965', '1964', '1969', '1967', 250000),
(2, 'First Afghan War took place in ?', 'C', '1835', '1832', '1839', '1840', 250000);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `step14`
--

CREATE TABLE IF NOT EXISTS `step14` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` varchar(255) NOT NULL,
  `A` varchar(255) NOT NULL,
  `B` varchar(255) NOT NULL,
  `C` varchar(255) NOT NULL,
  `D` varchar(255) NOT NULL,
  `step` int(11) NOT NULL DEFAULT '500000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Sukurta duomenų kopija lentelei `step14`
--

INSERT INTO `step14` (`id`, `question`, `answer`, `A`, `B`, `C`, `D`, `step`) VALUES
(1, 'First China War was fought between ?', 'B', 'China and France', 'China and Britain', 'China and Egypt', 'China and Greek', 500000),
(2, 'Each year World Red Cross and Red Crescent Day is celebrated on ?', 'A', 'May 8', 'May 18', 'May 1', 'May 25', 500000);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `step15`
--

CREATE TABLE IF NOT EXISTS `step15` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` varchar(255) NOT NULL,
  `A` varchar(255) NOT NULL,
  `B` varchar(255) NOT NULL,
  `C` varchar(255) NOT NULL,
  `D` varchar(255) NOT NULL,
  `step` int(11) NOT NULL DEFAULT '1000000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Sukurta duomenų kopija lentelei `step15`
--

INSERT INTO `step15` (`id`, `question`, `answer`, `A`, `B`, `C`, `D`, `step`) VALUES
(1, 'In which year of First World War Germany declared war on Russia and France ?', 'B', '1913', '1914', '1915', '1916', 1000000),
(2, 'In a normal human body, the total number of red blood cells is ?', 'D', '20 trillion', '10 trillion', '15 trillion', '30 trillion', 1000000);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
