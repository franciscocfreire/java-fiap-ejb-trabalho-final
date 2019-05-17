/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema fiap
--

CREATE DATABASE IF NOT EXISTS prova;
USE prova;

--
-- Definition of table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
CREATE TABLE `avaliacao` (
  `codigo` int(6) unsigned NOT NULL auto_increment,
  `codigodisciplina` int(7) unsigned NOT NULL default '0',
  `descricao` varchar(50) NOT NULL default '',
  `datacriacao` date NOT NULL default '0000-00-00',
  `status` char(1) NOT NULL default 'N',
  PRIMARY KEY  (`codigo`),
  KEY `istatus` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `avaliacao`
--

/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
INSERT INTO `avaliacao` (`codigo`,`codigodisciplina`,`descricao`,`datacriacao`,`status`) VALUES 
 (1,1,'Avaliação Final - 18SCJ','2012-08-20','N');
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;


--
-- Definition of table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
CREATE TABLE `disciplina` (
  `codigo` int(3) unsigned NOT NULL auto_increment,
  `nome` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`codigo`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `disciplina`
--

/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` (`codigo`,`nome`) VALUES 
 (1,'EJB'),
 (2,'Web Services');
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;


--
-- Definition of table `questao`
--

DROP TABLE IF EXISTS `questao`;
CREATE TABLE `questao` (
  `codigo` int(7) unsigned NOT NULL auto_increment,
  `codigoavaliacao` int(7) unsigned NOT NULL default '0',
  `descricao` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`codigo`),
  KEY `icodigoavaliacao` (`codigoavaliacao`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questao`
--

/*!40000 ALTER TABLE `questao` DISABLE KEYS */;
INSERT INTO `questao` (`codigo`,`codigoavaliacao`,`descricao`) VALUES 
 (1,1,'Qual o tipo de objeto resultante da execução de um comando SQL usando a API JDBC?'),
 (2,1,'Qual o método do objeto Connection é usado para desabilitar a transação automática?');
/*!40000 ALTER TABLE `questao` ENABLE KEYS */;


--
-- Definition of table `resposta`
--

DROP TABLE IF EXISTS `resposta`;
CREATE TABLE `resposta` (
  `codigo` int(7) unsigned NOT NULL auto_increment,
  `codigoquestao` int(7) unsigned NOT NULL default '0',
  `descricao` varchar(60) NOT NULL default '',
  PRIMARY KEY  (`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resposta`
--

/*!40000 ALTER TABLE `resposta` DISABLE KEYS */;
INSERT INTO `resposta` (`codigo`,`codigoquestao`,`descricao`) VALUES 
 (1,1,'Prepared Statement'),
 (2,1,'Statement'),
 (3,1,'ResultSet'),
 (4,1,'Collection'),
 (5,1,'Transaction'),
 (6,2,'setAutoCommit(false)'),
 (7,2,'setAutoCommit(true)'),
 (8,2,'setTransaction(true)'),
 (9,2,'setTransaction(false)'),
 (10,2,'setRollback()');
/*!40000 ALTER TABLE `resposta` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;