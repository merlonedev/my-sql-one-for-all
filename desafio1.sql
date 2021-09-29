-- Desafio 1

DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`planos`(
plano_id INT NOT NULL AUTO_INCREMENT,
plano_name VARCHAR(30) NOT NULL,
plano_value DECIMAL(5,2) NOT NULL,
PRIMARY KEY (`plano_id`)
) engine = InnoDB;

INSERT INTO `SpotifyClone`.`planos` (plano_name, plano_value)
VALUES
('gratuito', 0),
('universitário', 5.99),
('familiar', 7.99);

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuarios` (
`user_id` INT NOT NULL AUTO_INCREMENT,
`username` VARCHAR(25) NOT NULL,
`age` SMALLINT NOT NULL,
`plano_id` INT NOT NULL,
PRIMARY KEY (`user_id`),
INDEX `fk_users_1_idx` (`plano_id` ASC) VISIBLE,
CONSTRAINT `fk_users_1`
FOREIGN KEY (`plano_id`)
REFERENCES `SpotifyClone`.`planos` (`plano_id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`usuarios` (username, age, plano_id)
VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artistas` (
`artist_id` INT NOT NULL AUTO_INCREMENT,
`artist_name` VARCHAR(25) NOT NULL,
PRIMARY KEY (`artist_id`))
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`artistas` (artist_name)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albums` (
`album_id` INT NOT NULL AUTO_INCREMENT,
`album_name` VARCHAR(30) NOT NULL,
`artist_id` INT NOT NULL,
PRIMARY KEY (`album_id`),
INDEX `fk_albums_1_idx` (`artist_id` ASC) VISIBLE,
CONSTRAINT `fk_albums_1`
FOREIGN KEY (`artist_id`)
REFERENCES `SpotifyClone`.`artistas` (`artist_id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`albums` (album_name, artist_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`musics` (
`music_id` INT NOT NULL AUTO_INCREMENT,
`music_name` VARCHAR(35) NOT NULL,
`album_id` INT NOT NULL,
PRIMARY KEY (`music_id`),
INDEX `fk_musics_1_idx` (`album_id` ASC) VISIBLE,
CONSTRAINT `fk_musics_1`
FOREIGN KEY (`album_id`)
REFERENCES `SpotifyClone`.`albums` (`album_id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`musics` (music_name, album_id)
VALUES
('Soul For Us', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 2),
('Time Fireworks', 2),
('Magic Circus', 3),
('Honey, So Do I', 3),
('Let\'s Go Wild', 3),
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

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`historico` (
`user_id` INT NOT NULL,
`music_id` INT NOT NULL,
INDEX `fk_historico_1_idx` (`user_id` ASC) VISIBLE,
INDEX `fk_historico_2_idx` (`music_id` ASC) VISIBLE,
PRIMARY KEY (`user_id`, `music_id`),
CONSTRAINT `fk_historico_1`
FOREIGN KEY (`user_id`)
REFERENCES `SpotifyClone`.`usuarios` (`user_id`)
ON DELETE CASCADE
ON UPDATE NO ACTION,
CONSTRAINT `fk_historico_2`
FOREIGN KEY (`music_id`)
REFERENCES `SpotifyClone`.`musics` (`music_id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`historico` (user_id, music_id)
VALUES
(1, 1),
(2, 2),
(4, 3),
(3, 4),
(1, 6),
(3, 6),
(4, 11),
(2, 13),
(1, 14),
(2, 15),
(1, 16),
(3, 16),
(2, 17),
(4, 18);
  
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`user_follow` (
`user_id` INT NOT NULL,
`artist_id` INT NOT NULL,
INDEX `fk_user_follow_1_idx` (`artist_id` ASC) VISIBLE,
INDEX `fk_user_follow_2_idx` (`user_id` ASC) VISIBLE,
PRIMARY KEY (`user_id`, `artist_id`),
CONSTRAINT `fk_user_follow_1`
FOREIGN KEY (`artist_id`)
REFERENCES `SpotifyClone`.`artistas` (`artist_id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_user_follow_2`
FOREIGN KEY (`user_id`)
REFERENCES `SpotifyClone`.`usuarios` (`user_id`)
ON DELETE CASCADE
ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`user_follow` (user_id, artist_id)
VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(4, 2),
(1, 3),
(2, 3),
(3, 4);
