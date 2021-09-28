DROP SCHEMA IF EXISTS `SpotifyClone` ;

CREATE SCHEMA IF NOT EXISTS `SpotifyClone` ;
USE `SpotifyClone` ;

DROP TABLE IF EXISTS `SpotifyClone`.`plans` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plans` (
  `plan_id` INT NOT NULL AUTO_INCREMENT,
  `plan_name` VARCHAR(20) NOT NULL,
  `plan_value` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`plan_id`))
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`plans` (plan_name, plan_value)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);

DROP TABLE IF EXISTS `SpotifyClone`.`users` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `age` SMALLINT NOT NULL,
  `plan_id` INT NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_users_1`
    FOREIGN KEY (`plan_id`)
    REFERENCES `SpotifyClone`.`plans` (`plan_id`))
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`users` (username, age, plan_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

DROP TABLE IF EXISTS `SpotifyClone`.`artists` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artists` (
  `artist_id` INT NOT NULL AUTO_INCREMENT,
  `artist_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`artist_id`))
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`artists` (artist_name)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

DROP TABLE IF EXISTS `SpotifyClone`.`albums` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albums` (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `album_name` VARCHAR(50) NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`album_id`),
  CONSTRAINT `fk_albums_1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `SpotifyClone`.`artists` (`artist_id`))
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`albums` (album_name, artist_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

DROP TABLE IF EXISTS `SpotifyClone`.`songs` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`songs` (
  `song_id` INT NOT NULL AUTO_INCREMENT,
  `song_name` VARCHAR(45) NOT NULL,
  `album_id` INT NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`song_id`),
  CONSTRAINT `fk_songs_1`
    FOREIGN KEY (`album_id`)
    REFERENCES `SpotifyClone`.`albums` (`album_id`),
  CONSTRAINT `fk_songs_2`
    FOREIGN KEY (`artist_id`)
    REFERENCES `SpotifyClone`.`artists` (`artist_id`))
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`songs` (song_name, album_id, artist_id)
VALUES
  ('Soul For Us', 1, 1),
  ('Reflections Of Magic', 1, 1),
  ('Dance With Her Own', 1, 1),
  ('Troubles Of My Inner Fire', 2, 1),
  ('Time Fireworks', 2, 1),
  ('Magic Circus', 3, 2),
  ('Honey, So Do I', 3, 2),
  ("Sweetie, Let's Go Wild", 3, 2),
  ('She Knows', 3, 2),
  ('Fantasy For Me', 4, 3),
  ('Celebration Of More', 4, 3),
  ('Rock His Everything', 4, 3),
  ('Home Forever', 4, 3),
  ('Diamond Power', 4, 3),
  ("Honey, Let's Be Silly", 4, 3),
  ('Thang Of Thunder', 5, 4),
  ('Words Of Her Life', 5, 4),
  ('Without My Streets', 5, 4);

DROP TABLE IF EXISTS `SpotifyClone`.`user_songs_history` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`user_songs_history` (
  `user_id` INT NOT NULL,
  `song_id` INT NOT NULL,
  `history_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`user_id`, `song_id`),
  UNIQUE INDEX `history_id_UNIQUE` (`history_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_songs_history_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `SpotifyClone`.`users` (`user_id`),
  CONSTRAINT `fk_user_songs_history_2`
    FOREIGN KEY (`song_id`)
    REFERENCES `SpotifyClone`.`songs` (`song_id`))
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`user_songs_history` (user_id, song_id)
VALUES
  (1, 1),
  (1, 6),
  (1, 14),
  (1, 16),
  (2, 13),
  (2, 17),
  (2, 2),
  (2, 15),
  (3, 4),
  (3, 16),
  (3, 6),
  (4, 3),
  (4, 18),
  (4, 11);

DROP TABLE IF EXISTS `SpotifyClone`.`user_followage` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`user_followage` (
  `user_id` INT NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `artist_id`),
  CONSTRAINT `fk_user_followage_1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `SpotifyClone`.`artists` (`artist_id`),
  CONSTRAINT `fk_user_followage_2`
    FOREIGN KEY (`user_id`)
    REFERENCES `SpotifyClone`.`users` (`user_id`))
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`user_followage` (user_id, artist_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);
