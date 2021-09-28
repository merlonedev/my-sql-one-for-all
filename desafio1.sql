-- Desafio 1

DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`planos`(
    plano_id INT NOT NULL AUTO_INCREMENT,
    plano_name VARCHAR(10) NOT NULL,
    plano_value DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (`plano_id`)
) engine = InnoDB;

INSERT INTO `SpotifyClone`.`planos` (plano_name, plano_value)
VALUES
  ('free', 0),
  ('plus', 5.99),
  ('familia', 9.99);

DROP TABLE IF EXISTS `SpotifyClone`.`usuarios` ;

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
  ('Maria', 19, 1),
  ('Marcio', 25, 1),
  ('Casio', 22, 2),
  ('Luana', 38, 2);
 
DROP TABLE IF EXISTS `SpotifyClone`.`artistas` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artistas` (
  `artist_id` INT NOT NULL AUTO_INCREMENT,
  `artist_name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`artist_id`))
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`artistas` (artist_name)
VALUES
  ('Guns'),
  ('Nirvana'),
  ('Legião Urbana'),
  ('Titãs'),
  ('Nando Reis'),
  ('RCásia Eller'),
  ('Marisa Monte'),
  ('Maria Betânia');

DROP TABLE IF EXISTS `SpotifyClone`.`albums` ;

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
  ('Manias de você', 2),
  ('Laços de Horror', 1),
  ('A casa verde-musgo, sem você', 1),
  ('Paz incandescente', 3),
  ('Protelando sem dor', 2),
  ('Perspectiva Social', 4),
  ('A paz e o carnaval', 3);

DROP TABLE IF EXISTS `SpotifyClone`.`musics` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`musics` (
  `music_id` INT NOT NULL AUTO_INCREMENT,
  `music_name` VARCHAR(35) NOT NULL,
  `album_id` INT NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`music_id`),
  INDEX `fk_musics_1_idx` (`album_id` ASC) VISIBLE,
  INDEX `fk_musics_2_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_musics_1`
    FOREIGN KEY (`album_id`)
    REFERENCES `SpotifyClone`.`albums` (`album_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_musics_2`
    FOREIGN KEY (`artist_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`musics` (music_name, album_id, artist_id)
VALUES
  ('Dark Rangers', 1, 1),
  ('Summer of Cries', 1, 1),
  ('The Last Nigth', 2, 1),
  ('Cry in the Wolf', 2, 1),
  ('Blues Skys', 3, 2),
  ('Dance from me', 3, 2),
  ("The suspect", 3, 2),
  ('Block Rain', 3, 2),
  ('Fatal Case', 4, 3),
  ('Love Fatal', 4, 3),
  ('Hearth', 4, 3),
  ('Heells kitchen', 4, 3),
  ('Blue Blood', 4, 3),
  ('I Cant', 4, 3),
  ('The clone of water', 5, 4),
  ('My way', 5, 4),
  ('Print me', 5, 4),
  ('Log my heart', 5, 4);

DROP TABLE IF EXISTS `SpotifyClone`.`historico` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`historico` (
  `user_id` INT NOT NULL,
  `music_id` INT NOT NULL,
  `history_id` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_historico_1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_historico_2_idx` (`music_id` ASC) VISIBLE,
  PRIMARY KEY (`user_id`, `music_id`),
  UNIQUE INDEX `history_id_UNIQUE` (`history_id` ASC) VISIBLE,
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
  (1, 2),
  (1, 4),
  (1, 12),
  (1, 15),
  (1, 11),
  (2, 16),
  (2, 10),
  (2, 3),
  (2, 19),
  (2, 9),
  (3, 3),
  (3, 10),
  (3, 4),
  (3, 6),
  (4, 5),
  (4, 20),
  (4, 9),
  (4, 12);

DROP TABLE IF EXISTS `SpotifyClone`.`user_follow` ;

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
  (1, 2),
  (1, 3),
  (1, 4),
  (2, 2),
  (2, 3),
  (2, 1),
  (3, 2),
  (3, 1),
  (4, 4),
  (4, 3),
  (4, 1);
  