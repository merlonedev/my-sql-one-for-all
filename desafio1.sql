DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE `SpotifyClone`.`Subscriptions` (
    sub_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(20) NOT NULL,
    sub_value DECIMAL(5 , 2 ) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE `SpotifyClone`.`Artists` (
    artist_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    artist VARCHAR(40) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE `SpotifyClone`.`Users` (
    user_id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(40) NOT NULL,
    age INT NOT NULL,
    sub_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (`user_id`),
    FOREIGN KEY (`sub_id`)
        REFERENCES `SpotifyClone`.`Subscriptions` (`sub_id`)
)  ENGINE=INNODB;

CREATE TABLE `SpotifyClone`.`Albums` (
    album_id INT NOT NULL AUTO_INCREMENT,
    album VARCHAR(40) NOT NULL,
    artist_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (`album_id`),
    CONSTRAINT FOREIGN KEY (`artist_id`)
        REFERENCES `SpotifyClone`.`Artists` (`artist_id`)
)  ENGINE=INNODB;

CREATE TABLE `SpotifyClone`.`Tracks` (
    track_id INT NOT NULL AUTO_INCREMENT,
    track VARCHAR(40) NOT NULL,
    album_id INT NOT NULL,
    artist_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (`track_id`),
    CONSTRAINT FOREIGN KEY (`album_id`)
        REFERENCES `SpotifyClone`.`Albums` (`album_id`),
    CONSTRAINT FOREIGN KEY (`artist_id`)
        REFERENCES `SpotifyClone`.`Artists` (`artist_id`)
)  ENGINE=INNODB;

CREATE TABLE `SpotifyClone`.`Reproductions_history` (
    user_id INT NOT NULL,
    track_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (`user_id` , `track_id`),
    CONSTRAINT FOREIGN KEY (`user_id`)
        REFERENCES `SpotifyClone`.`Users` (`user_id`),
    CONSTRAINT FOREIGN KEY (`track_id`)
        REFERENCES `SpotifyClone`.`Tracks` (`track_id`)
)  ENGINE=INNODB;

CREATE TABLE `SpotifyClone`.`Follows` (
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (`user_id` , `artist_id`),
    CONSTRAINT FOREIGN KEY (`user_id`)
        REFERENCES `SpotifyClone`.`Users` (`user_id`),
    CONSTRAINT FOREIGN KEY (`artist_id`)
        REFERENCES `SpotifyClone`.`Artists` (`artist_id`)
)  ENGINE=INNODB;

INSERT INTO `SpotifyClone`.`Subscriptions` (sub_name, sub_value)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO `SpotifyClone`.`Users` (username, age, sub_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

INSERT INTO `SpotifyClone`.`Artists` (artist)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

INSERT INTO `SpotifyClone`.`Albums` (album, artist_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);
  
INSERT INTO `SpotifyClone`.`Tracks` (track, album_id, artist_id)
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
  
INSERT INTO `SpotifyClone`.`Follows` (user_id, artist_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);
  
INSERT INTO `SpotifyClone`.`Reproductions_history` (user_id, track_id)
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
