DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE `tb_planos` (
  `id_plano` int NOT NULL AUTO_INCREMENT,
  `nome_plano` varchar(45) NOT NULL,
  `valor_plano` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_plano`),
  UNIQUE KEY `id_plano_UNIQUE` (`id_plano`)
)ENGINE=InnoDB;

CREATE TABLE `tb_artistas` (
  `id_artista` int NOT NULL AUTO_INCREMENT,
  `nome_artista` varchar(45) NOT NULL,
  PRIMARY KEY (`id_artista`),
  UNIQUE KEY `id_artista_UNIQUE` (`id_artista`)
) ENGINE=InnoDB;

CREATE TABLE `tb_usuarios` (
  `usuario_id` int AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `idade` int NOT NULL,
  `id_plano` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`usuario_id`),
  KEY `id_plano_idx` (`id_plano`),
  CONSTRAINT `fk_id_plano` FOREIGN KEY (`id_plano`) REFERENCES `tb_planos` (`id_plano`)
) ENGINE=InnoDB;

CREATE TABLE `tb_albuns` (
  `album_id` int NOT NULL AUTO_INCREMENT,
  `album` varchar(45) NOT NULL,
  `id_artista` int NOT NULL,
  PRIMARY KEY (`album_id`),
  UNIQUE KEY `album_id_UNIQUE` (`album_id`),
  KEY `id_artista_idx` (`id_artista`),
  CONSTRAINT `fk_id_artista` FOREIGN KEY (`id_artista`) REFERENCES `tb_artistas` (`id_artista`) ON UPDATE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE `tb_cancoes` (
  `id_cancao` int NOT NULL AUTO_INCREMENT,
  `nome_cancao` varchar(70) NOT NULL,
  `album_id` int NOT NULL,
  PRIMARY KEY (`id_cancao`),
  UNIQUE KEY `id_cancao_UNIQUE` (`id_cancao`),
  KEY `fk_album_idD_idx` (`album_id`),
  CONSTRAINT `fk_album_idD` FOREIGN KEY (`album_id`) REFERENCES `tb_albuns` (`album_id`)
) ENGINE=InnoDB;

CREATE TABLE `tb_cancoes_usuario` (
  `id_usuario` int NOT NULL,
  `id_cancao` int NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_cancao`),
  KEY `fk_cancao_id_idx` (`id_cancao`),
  CONSTRAINT `cancao_id_fk` FOREIGN KEY (`id_cancao`) REFERENCES `tb_cancoes` (`id_cancao`),
  CONSTRAINT `usuario_id_fk` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuarios` (`usuario_id`)
) ENGINE=InnoDB;


CREATE TABLE `tb_artistas_usuarios` (
  `id_usuario` int NOT NULL,
  `id_artista` int NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_artista`),
  KEY `id_artista_idx` (`id_artista`),
  CONSTRAINT `fk_artista_id` FOREIGN KEY (`id_artista`) REFERENCES `tb_artistas` (`id_artista`),
  CONSTRAINT `fk_usuario_id` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuarios` (`usuario_id`)
) ENGINE=InnoDB;



INSERT INTO `tb_planos` VALUES (1,'gratuito',0.00),(2,'familiar',7.99),(3,'universitario',5.99);
INSERT INTO `tb_artistas` VALUES (1,'Walter Phoenix'),(2,'Freedie Shannon'),(3,'Lance Day'),(4,'Peter Strong');
INSERT INTO `tb_usuarios` VALUES (1,'Thati',23,1),(2,'Cintia',35,2),(3,'Bill',20,3),(4,'Roger',45,1);
INSERT INTO `tb_artistas_usuarios` VALUES (1,1),(2,1),(3,1),(1,2),(4,2),(1,3),(2,3),(3,4);
INSERT INTO `tb_albuns` VALUES (1,'Envious',1),(2,'Exuberant',1),(3,'Hallowed Steam',4),(4,'Incandescent',3),(5,'Temporary Culture',2);
INSERT INTO `tb_cancoes` VALUES (1,'Soul For Us',1),(2,'Reflections Of Magic',1),(3,'Dance With Her Own',1),(4,'Troubles Of My Inner Fire',2),(5,'Time Fireworks',2),(6,'Magic Circus',3),(7,'Honey, So Do I',3),(8,'Sweetie, Let\'s Go Wild',3),(9,'She Knows',3),(10,'Fantasy For Me',4),(11,'Celebration Of More',4),(12,'Rock His Everything',4),(13,'Home Forever',4),(14,'Diamond Power',4),(15,'Honey, Let\'s Be Silly',4),(16,'Thang Of Thunder',5),(17,'Words Of Her Life',5),(18,'Without My Streets',5);
INSERT INTO `tb_cancoes_usuario` VALUES (1,1),(2,2),(4,3),(3,4),(1,6),(3,6),(4,11),(2,13),(1,14),(2,15),(1,16),(3,16),(2,17),(4,18);
