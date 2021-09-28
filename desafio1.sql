DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE `SpotifyClone`.`plans` (
  `plan_id` INT NOT NULL AUTO_INCREMENT,
  `plan_name` VARCHAR(20) NOT NULL,
  `plan_value` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`plan_id`))
ENGINE = InnoDB;

CREATE TABLE `SpotifyClone`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `age` SMALLINT NOT NULL,
  `plan_id` INT NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_users_1`
    FOREIGN KEY (`plan_id`)
    REFERENCES `SpotifyClone`.`plans` (`plan_id`))
ENGINE = InnoDB;

CREATE TABLE `SpotifyClone`.`artists` (
  `artist_id` INT NOT NULL AUTO_INCREMENT,
  `artist_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`artist_id`))
ENGINE = InnoDB;

CREATE TABLE `SpotifyClone`.`albums` (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `album_name` VARCHAR(50) NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`album_id`),
  CONSTRAINT `fk_albums_1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `SpotifyClone`.`artists` (`artist_id`))
ENGINE = InnoDB;

CREATE TABLE `SpotifyClone`.`songs` (
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

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`user_songs_history` (
  `user_id` INT NOT NULL,
  `song_id` INT NOT NULL,
  CONSTRAINT PRIMARY KEY (`user_id`, `song_id`),
  CONSTRAINT `fk_user_songs_history_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `SpotifyClone`.`users` (`user_id`),
  CONSTRAINT `fk_user_songs_history_2`
    FOREIGN KEY (`song_id`)
    REFERENCES `SpotifyClone`.`songs` (`song_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`user_followage` (
  `user_id` INT NOT NULL,
  `artist_id` INT NOT NULL,
  CONSTRAINT PRIMARY KEY (`user_id`, `artist_id`),
  CONSTRAINT `fk_user_followage_1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `SpotifyClone`.`artists` (`artist_id`),
  CONSTRAINT `fk_user_followage_2`
    FOREIGN KEY (`user_id`)
    REFERENCES `SpotifyClone`.`users` (`user_id`))
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`plans` (plan_name, plan_value)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitÃ¡rio', 5.99);

INSERT INTO `SpotifyClone`.`users` (username, age, plan_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

INSERT INTO `SpotifyClone`.`artists` (artist_name)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

INSERT INTO `SpotifyClone`.`albums` (album_name, artist_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

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