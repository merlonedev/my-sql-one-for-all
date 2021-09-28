SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP DATABASE IF EXISTS `SpotifyClone` ;

CREATE DATABASE IF NOT EXISTS `SpotifyClone` ;
USE `SpotifyClone` ;

DROP TABLE IF EXISTS `SpotifyClone`.`album` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`album` (
  `id_album` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(250) NOT NULL,
  `id_artista` INT NOT NULL,
  PRIMARY KEY (`id_album`, `id_artista`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE,
  INDEX `fk_album_artista1_idx` (`id_artista` ASC) VISIBLE,
  CONSTRAINT `fk_album_artista1`
    FOREIGN KEY (`id_artista`)
    REFERENCES `SpotifyClone`.`artista` (`id_artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `SpotifyClone`.`artista` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artista` (
  `id_artista` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id_artista`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `SpotifyClone`.`cancao` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`cancao` (
  `id_cancao` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(250) NOT NULL,
  `id_album` INT NOT NULL,
  PRIMARY KEY (`id_cancao`, `id_album`),
  INDEX `fk_cancao_album1_idx` (`id_album` ASC) VISIBLE,
  CONSTRAINT `fk_cancao_album1`
    FOREIGN KEY (`id_album`)
    REFERENCES `SpotifyClone`.`album` (`id_album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `SpotifyClone`.`plano` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plano` (
  `id_plano` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `valor` INT NOT NULL,
  PRIMARY KEY (`id_plano`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE,
  UNIQUE INDEX `valor_UNIQUE` (`valor` ASC) VISIBLE)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `SpotifyClone`.`usuario` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `id_plano` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE,
  INDEX `fk_usuario_plano_idx` (`id_plano` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_plano`
    FOREIGN KEY (`id_plano`)
    REFERENCES `SpotifyClone`.`plano` (`id_plano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `SpotifyClone`.`usuario_ouviu_cancao` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuario_ouviu_cancao` (
  `id_usuario` INT NOT NULL,
  `id_cancao` INT NOT NULL,
  `id_album` INT NOT NULL,
  PRIMARY KEY (`id_usuario`, `id_cancao`, `id_album`),
  INDEX `fk_usuario_has_cancao_cancao1_idx` (`id_cancao` ASC, `id_album` ASC) VISIBLE,
  INDEX `fk_usuario_has_cancao_usuario1_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_has_cancao_usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `SpotifyClone`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_cancao_cancao1`
    FOREIGN KEY (`id_cancao` , `id_album`)
    REFERENCES `SpotifyClone`.`cancao` (`id_cancao` , `id_album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `SpotifyClone`.`usuario_segue_artista` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuario_segue_artista` (
  `id_usuario` INT NOT NULL,
  `id_artista` INT NOT NULL,
  PRIMARY KEY (`id_usuario`, `id_artista`),
  INDEX `fk_usuario_has_artista_artista1_idx` (`id_artista` ASC) VISIBLE,
  INDEX `fk_usuario_has_artista_usuario1_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_has_artista_usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `SpotifyClone`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_artista_artista1`
    FOREIGN KEY (`id_artista`)
    REFERENCES `SpotifyClone`.`artista` (`id_artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO artista (nome)
VALUES
	('Walter Phoenix'),
  ('Freddie Shannon'),
  ('Lance Day'),
  ('Peter Strong');
    
INSERT INTO album (nome, id_artista)
VALUES
	('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 4),
  ('Incandescent', 3),
  ('Temporary Culture', 2);
    
INSERT INTO cancao (nome, id_album)
VALUES
	('Soul For Us', 1),
  ('Reflections Of Magic', 1),
  ('Dance With Her Own', 1),
  ('Troubles Of My Inner Fire', 2),
  ('Time Fireworks', 2),
  ('Magic Circus', 3),
  ('Honey, So Do I', 3),
  ('Sweetie, Let\'s Go Wild', 3),
  ('She Knows', 3),
  ('Fantasy For Me', 4),
  ('Celebration Of More', 4),
  ('Rock His Everything', 4),
  ('Home Forever', 4),
  ('Diamond Power', 4),
  ('Honey, Let\'s Be Silly', 4),
  ('Thang Of Thunder', 5),
  ('Words Of Her Life', 5),
  ('Without My Streets', 5);

INSERT INTO plano (nome, valor)
VALUES
	('gratuito', 0),
  ('universitario', 5.99),
  ('familiar', 7.99);

INSERT INTO usuario (nome, idade, id_plano)
VALUES
	('Thati', 23, 1),
  ('Cintia', 35, 3),
  ('Bill', 20, 2),
  ('Roger', 45, 1);
    
INSERT INTO usuario_segue_artista (id_usuario, id_artista)
VALUES
	(1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 4),
  (3, 1),
  (4, 2);

INSERT INTO usuario_ouviu_cancao (id_usuario, id_cancao, id_album)
VALUES
	(1, 1, 1),
  (1, 6, 3),
  (1, 14, 4),
  (1, 16, 5),
  (2, 13, 4),
  (2, 17, 5),
  (2, 2, 1),
  (2, 15, 4),
  (3, 4, 2),
  (3, 16, 5),
  (3, 6, 3),
  (4, 3, 1),
  (4, 18, 5),
  (4, 11, 4);
