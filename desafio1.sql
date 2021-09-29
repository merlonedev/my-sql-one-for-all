-- Desafio 1

DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE `planos`(
plano_id INT NOT NULL AUTO_INCREMENT,
plano_name VARCHAR(30) NOT NULL,
plano_value DECIMAL(10,2) NOT NULL,
PRIMARY KEY (`plano_id`)
) engine = InnoDB;

CREATE TABLE `usuarios` (
`user_id` INT NOT NULL AUTO_INCREMENT,
`username` VARCHAR(25) NOT NULL,
`age` INT NOT NULL,
`plano_id` INT NOT NULL,
PRIMARY KEY (`user_id`),
INDEX `fk_users_1_idx` (`plano_id`),
CONSTRAINT `fk_users_1`
FOREIGN KEY (`plano_id`)
REFERENCES `planos` (`plano_id`)
)
ENGINE = InnoDB;

CREATE TABLE `artistas` (
`artist_id` INT NOT NULL AUTO_INCREMENT,
`artist_name` VARCHAR(25) NOT NULL,
PRIMARY KEY (`artist_id`))
ENGINE = InnoDB;

CREATE TABLE `albums` (
`album_id` INT NOT NULL AUTO_INCREMENT,
`album_name` VARCHAR(30) NOT NULL,
`artist_id` INT NOT NULL,
PRIMARY KEY (`album_id`),
INDEX `fk_albums_1_idx` (`artist_id`),
CONSTRAINT `fk_albums_1`
FOREIGN KEY (`artist_id`)
REFERENCES `artistas` (`artist_id`)
)
ENGINE = InnoDB;

CREATE TABLE `musics` (
`music_id` INT NOT NULL AUTO_INCREMENT,
`music_name` VARCHAR(35) NOT NULL,
`album_id` INT NOT NULL,
PRIMARY KEY (`music_id`),
INDEX `fk_musics_1_idx` (`album_id`) ,
CONSTRAINT `fk_musics_1`
FOREIGN KEY (`album_id`)
REFERENCES `albums` (`album_id`)
)
ENGINE = InnoDB;

CREATE TABLE `historico` (
`user_id` INT NOT NULL,
`music_id` INT NOT NULL,
INDEX `fk_historico_1_idx` (`user_id`) ,
INDEX `fk_historico_2_idx` (`music_id`),
PRIMARY KEY (`user_id`, `music_id`),
CONSTRAINT `fk_historico_1`
FOREIGN KEY (`user_id`)
REFERENCES `usuarios` (`user_id`)
ON DELETE CASCADE
ON UPDATE NO ACTION,
CONSTRAINT `fk_historico_2`
FOREIGN KEY (`music_id`)
REFERENCES `musics` (`music_id`)
)
ENGINE = InnoDB;

CREATE TABLE `user_follow` (
`user_id` INT NOT NULL,
`artist_id` INT NOT NULL,
INDEX `fk_user_follow_1_idx` (`artist_id`),
INDEX `fk_user_follow_2_idx` (`user_id`),
PRIMARY KEY (`user_id`, `artist_id`),
CONSTRAINT `fk_user_follow_1`
FOREIGN KEY (`artist_id`)
REFERENCES `artistas` (`artist_id`),
CONSTRAINT `fk_user_follow_2`
FOREIGN KEY (`user_id`)
REFERENCES `usuarios` (`user_id`)
)
ENGINE = InnoDB;


INSERT INTO `artistas`
VALUES
(1,'Walter Phoenix'),
(2,'Peter Strong'),
(3,'Lance Day'),
(4,'Freedie Shannon');

INSERT INTO `albums`
VALUES
(1,'Envious', 1),
(2,'Exuberant', 1),
(3,'Hallowed Steam', 2),
(4,'Incandescent', 3),
(5,'Temporary Culture', 4);

INSERT INTO `planos`
VALUES
(1,'gratuito', 0),
(2,'universitário', 5.99),
(3,'familiar', 7.99);

INSERT INTO `musics`
VALUES
(1,'Soul For Us', 1),
(2,'Reflections Of Magic', 1),
(3,'Dance With Her Own', 1),
(4,'Troubles Of My Inner Fire', 2),
(5,'Time Fireworks', 2),
(6,'Magic Circus', 3),
(7,'Honey, So Do I', 3),
(8,'Let\'s Go Wild', 3),
(9,'She Knows', 3),
(10,'Fantasy For Me', 4),
(11,'Celebration Of More', 4),
(12,'Rock His Everything', 4),
(13,'Home Forever', 4),
(14,'Diamond Power', 4),
(15,'Honey, Let\'s Be Silly', 4),
(16,'Thang Of Thunder', 5),
(17,'Words Of Her Life', 5),
(18,'Without My Streets', 5);

INSERT INTO `usuarios`
VALUES
(1,'Thati', 23, 1),
(2,'Cintia', 35, 2),
(3,'Bill', 20, 3),
(4,'Roger', 45, 1);

INSERT INTO `historico` (user_id, music_id)
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

INSERT INTO `user_follow` (user_id, artist_id)
VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(4, 2),
(1, 3),
(2, 3),
(3, 4);
