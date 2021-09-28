DROP SCHEMA IF EXISTS `SpotifyClone` ;

CREATE SCHEMA `SpotifyClone` ;

USE `SpotifyClone`;

DROP TABLE IF EXISTS `SpotifyClone`.`planos` ;
CREATE TABLE `SpotifyClone`.`planos` (
  `plano_id` INT NOT NULL AUTO_INCREMENT,
  `plano` VARCHAR(20) NOT NULL,
  `plano_preco` DOUBLE NOT NULL,
  PRIMARY KEY (`plano_id`));

INSERT INTO `SpotifyClone`.`planos` (`plano_id`, `plano`, `plano_preco`) VALUES (1, 'gratuito', 0);
INSERT INTO `SpotifyClone`.`planos` (`plano_id`, `plano`, `plano_preco`) VALUES (2, 'universitario', 5.99);
INSERT INTO `SpotifyClone`.`planos` (`plano_id`, `plano`, `plano_preco`) VALUES (3, 'familiar', 7.99);

DROP TABLE IF EXISTS `SpotifyClone`.`users` ;
CREATE TABLE `SpotifyClone`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `plano_id` INT NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `plano_id`
    FOREIGN KEY (`plano_id`)
    REFERENCES `SpotifyClone`.`planos` (`plano_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

INSERT INTO `SpotifyClone`.`users` (`user_id`, `user`, `idade`, `plano_id`) VALUES (1, 'Thati', 23, 1);
INSERT INTO `SpotifyClone`.`users` (`user_id`, `user`, `idade`, `plano_id`) VALUES (2, 'Cintia', 35, 2);
INSERT INTO `SpotifyClone`.`users` (`user_id`, `user`, `idade`, `plano_id`) VALUES (3, 'Bill', 20, 3);
INSERT INTO `SpotifyClone`.`users` (`user_id`, `user`, `idade`, `plano_id`) VALUES (4, 'Roger', 45, 1);

DROP TABLE IF EXISTS `SpotifyClone`.`artistas` ;
CREATE TABLE `SpotifyClone`.`artistas` (
  `artista_id` INT NOT NULL AUTO_INCREMENT,
  `artista` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`artista_id`));

INSERT INTO `SpotifyClone`.`artistas` (`artista_id`, `artista`) VALUES (1, 'Walter Phoenix');
INSERT INTO `SpotifyClone`.`artistas` (`artista_id`, `artista`) VALUES (2, 'Peter Strong');
INSERT INTO `SpotifyClone`.`artistas` (`artista_id`, `artista`) VALUES (3, 'Lance Day');
INSERT INTO `SpotifyClone`.`artistas` (`artista_id`, `artista`) VALUES (4, 'Freedie Shannon');

DROP TABLE IF EXISTS `SpotifyClone`.`albuns` ;
CREATE TABLE `SpotifyClone`.`albuns` (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `album` VARCHAR(100) NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`album_id`),
  CONSTRAINT `artista_id`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artista_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

INSERT INTO `SpotifyClone`.`albuns` (`album_id`, `album`, `artista_id`) VALUES (1, 'Envious', 1);
INSERT INTO `SpotifyClone`.`albuns` (`album_id`, `album`, `artista_id`) VALUES (2, 'Exuberant', 1);
INSERT INTO `SpotifyClone`.`albuns` (`album_id`, `album`, `artista_id`) VALUES (3, 'Hallowed Steam', 2);
INSERT INTO `SpotifyClone`.`albuns` (`album_id`, `album`, `artista_id`) VALUES (4, 'Incandescent', 3);
INSERT INTO `SpotifyClone`.`albuns` (`album_id`, `album`, `artista_id`) VALUES (5, 'Temporary Culture', 4);

DROP TABLE IF EXISTS `SpotifyClone`.`cancoes` ;
CREATE TABLE `SpotifyClone`.`cancoes` (
  `cancao_id` INT NOT NULL AUTO_INCREMENT,
  `album_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  `cancao` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`cancao_id`),
  CONSTRAINT `fk_album_id`
    FOREIGN KEY (`album_id`)
    REFERENCES `SpotifyClone`.`albuns` (`album_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_artista_id`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artista_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `album_id`, `artista_id`, `cancao`) VALUES (1, 1, 1, 'Soul For Us');
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `album_id`, `artista_id`, `cancao`) VALUES (2, 1, 1, 'Reflections Of Magic');
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `album_id`, `artista_id`, `cancao`) VALUES (3, 1, 1, 'Dance With Her Own');
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `album_id`, `artista_id`, `cancao`) VALUES (4, 2, 1, 'Troubles Of My Inner Fire');
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `album_id`, `artista_id`, `cancao`) VALUES (5, 2, 1, 'Time Fireworks');
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `album_id`, `artista_id`, `cancao`) VALUES (6, 3, 2, 'Magic Circus');
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `album_id`, `artista_id`, `cancao`) VALUES (7, 3, 2, 'Honey, So Do I');
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `album_id`, `artista_id`, `cancao`) VALUES (8, 3, 2, 'Sweetie, Let\'s Go Wild');
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `album_id`, `artista_id`, `cancao`) VALUES (9, 3, 2, 'She Knows');
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `album_id`, `artista_id`, `cancao`) VALUES (10, 4, 3, 'Fantasy For Me');
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `album_id`, `artista_id`, `cancao`) VALUES (11, 4, 3, 'Celebration Of More');
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `album_id`, `artista_id`, `cancao`) VALUES (12, 4, 3, 'Rock His Everything');
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `album_id`, `artista_id`, `cancao`) VALUES (13, 4, 3, 'Home Forever');
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `album_id`, `artista_id`, `cancao`) VALUES (14, 4, 3, 'Diamond Power');
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `album_id`, `artista_id`, `cancao`) VALUES (15, 4, 3, 'Honey, Let\'s Be Silly');
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `album_id`, `artista_id`, `cancao`) VALUES (16, 5, 4, 'Thang Of Thunder');
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `album_id`, `artista_id`, `cancao`) VALUES (17, 5, 4, 'Words Of Her Life');
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `album_id`, `artista_id`, `cancao`) VALUES (18, 5, 4, 'Without My Streets');

DROP TABLE IF EXISTS `SpotifyClone`.`artista_seguidores` ;
CREATE TABLE `SpotifyClone`.`artista_seguidores` (
  `user_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `artista_id`),
  CONSTRAINT `fk_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `SpotifyClone`.`users` (`user_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `artista_id_fk`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artista_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

INSERT INTO `SpotifyClone`.`artista_seguidores` (`user_id`, `artista_id`) VALUES (1, 1);
INSERT INTO `SpotifyClone`.`artista_seguidores` (`user_id`, `artista_id`) VALUES (1, 4);
INSERT INTO `SpotifyClone`.`artista_seguidores` (`user_id`, `artista_id`) VALUES (1, 3);
INSERT INTO `SpotifyClone`.`artista_seguidores` (`user_id`, `artista_id`) VALUES (2, 1);
INSERT INTO `SpotifyClone`.`artista_seguidores` (`user_id`, `artista_id`) VALUES (2, 3);
INSERT INTO `SpotifyClone`.`artista_seguidores` (`user_id`, `artista_id`) VALUES (3, 2);
INSERT INTO `SpotifyClone`.`artista_seguidores` (`user_id`, `artista_id`) VALUES (3, 1);
INSERT INTO `SpotifyClone`.`artista_seguidores` (`user_id`, `artista_id`) VALUES (4, 4);

DROP TABLE IF EXISTS `SpotifyClone`.`historico` ;
CREATE TABLE `SpotifyClone`.`historico` (
  `user_id` INT NOT NULL,
  `cancao_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `cancao_id`),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `SpotifyClone`.`users` (`user_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `cancao_id`
    FOREIGN KEY (`cancao_id`)
    REFERENCES `SpotifyClone`.`cancoes` (`cancao_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
;

INSERT INTO `SpotifyClone`.`historico` (`user_id`, `cancao_id`) VALUES (1, 1);
INSERT INTO `SpotifyClone`.`historico` (`user_id`, `cancao_id`) VALUES (1, 6);
INSERT INTO `SpotifyClone`.`historico` (`user_id`, `cancao_id`) VALUES (1, 14);
INSERT INTO `SpotifyClone`.`historico` (`user_id`, `cancao_id`) VALUES (1, 16);
INSERT INTO `SpotifyClone`.`historico` (`user_id`, `cancao_id`) VALUES (2, 13);
INSERT INTO `SpotifyClone`.`historico` (`user_id`, `cancao_id`) VALUES (2, 17);
INSERT INTO `SpotifyClone`.`historico` (`user_id`, `cancao_id`) VALUES (2, 2);
INSERT INTO `SpotifyClone`.`historico` (`user_id`, `cancao_id`) VALUES (2, 15);
INSERT INTO `SpotifyClone`.`historico` (`user_id`, `cancao_id`) VALUES (3, 4);
INSERT INTO `SpotifyClone`.`historico` (`user_id`, `cancao_id`) VALUES (3, 16);
INSERT INTO `SpotifyClone`.`historico` (`user_id`, `cancao_id`) VALUES (3, 6);
INSERT INTO `SpotifyClone`.`historico` (`user_id`, `cancao_id`) VALUES (4, 3);
INSERT INTO `SpotifyClone`.`historico` (`user_id`, `cancao_id`) VALUES (4, 18);
INSERT INTO `SpotifyClone`.`historico` (`user_id`, `cancao_id`) VALUES (4, 11);
