DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE subscriptions(
  subscription_id INT NOT NULL AUTO_INCREMENT,
  subscription varchar(50) NOT NULL,
  subscription_price DECIMAL(4,2),
  PRIMARY KEY(subscription_id)
  ) engine = InnoDB;

INSERT INTO subscriptions (subscription_id, subscription, subscription_price)
VALUES
  (1, 'Gratuito', 0 ),
  (2, 'Universitário', 5.99 ),
  (3, 'Familiar', 7.99);

CREATE TABLE users(
  user_id INT NOT NULL AUTO_INCREMENT,
  `user` VARCHAR(20) NOT NULL,
  age INT NOT NULL,
  subscription_id INT NOT NULL,
  PRIMARY KEY(user_id),
  FOREIGN KEY(subscription_id) REFERENCES subscriptions (subscription_id)
) engine = InnoDB;

INSERT INTO `users` (user_id,`user`, age, subscription_id)
VALUES
  (1, 'Thati', 23, 1),
  (2, 'Cintia', 35, 3),
  (3, 'Bill', 20, 2),
  (4, 'Roger', 45, 1);

CREATE TABLE artists(
  artist_id INT NOT NULL AUTO_INCREMENT,
  artist VARCHAR(50), 
  PRIMARY KEY (artist_id)
) engine = InnoDB;

INSERT INTO artists (artist_id, artist)
VALUES
    (1, 'Walter Phoenix'),
    (2, 'Peter Strong'),
    (3, 'Lance Day'),
    (4, 'Freedie Shannon');

CREATE TABLE albums(
  album_id INT NOT NULL AUTO_INCREMENT,
  album VARCHAR(50) NOT NULL,
  artist_id INT NOT NULL,
  PRIMARY KEY(album_id),
  FOREIGN KEY(artist_id) REFERENCES artists(artist_id)
) engine = InnoDB;

INSERT INTO albums (album_id, album, artist_id)
VALUES
  (1,'Envious', 1),
  (2, 'Exuberant', 1),
  (3, 'Hallowed Steam', 2),
  (4, 'Incandescent', 3),
  (5, 'Temporary Culture', 4);

CREATE TABLE songs(
  song_id INT NOT NULL AUTO_INCREMENT,
  song VARCHAR(50),
  album_id INT NOT NULL,
  artist_id INT NOT NULL,
  PRIMARY KEY(song_id),
  FOREIGN KEY (album_id) REFERENCES albums(album_id), 
  FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
) engine = InnoDB;

INSERT INTO songs (song_id, song, album_id, artist_id)
VALUES
    (1, 'Soul For Us', 1, 1),
    (2,	'Reflections Of Magic', 1, 1),
    (3,	'Dance With Her Own', 1, 1),
    (4,	'Troubles Of My Inner Fire', 2,	1),
    (5, 'Time Fireworks', 2, 1),
    (6,	'Magic Circus',	3, 2),
    (7,	'Honey, So Do I', 3, 2),
    (8,	'Sweetie, Let’s Go Wild', 3, 2),
    (9,	'She Knows', 3,	2),
    (10, 'Fantasy For Me', 4, 3),
    (11, 'Celebration Of More', 4, 3),
    (12, 'Rock His Everything', 4, 3),
    (13, 'Home Forever', 4,	3),
    (14, 'Diamond Power', 4, 3),
    (15, "Honey, Let's Be Silly", 4, 3),
    (16, 'Thang Of Thunder', 5, 4),
    (17, 'Words Of Her Life', 5, 4),
    (18, 'Without My Streets', 5, 4);

CREATE TABLE `following`(
  user_id INT NOT NULL,
  artist_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY (user_id, artist_id),
  FOREIGN KEY(user_id) REFERENCES users(user_id),
  FOREIGN KEY(artist_id) REFERENCES artists(artist_id)    
) engine = InnoDB;

INSERT INTO `following` (user_id, artist_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);

CREATE TABLE histories(
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY (user_id, song_id),
  FOREIGN KEY(user_id) REFERENCES users(user_id),
  FOREIGN KEY(song_id) REFERENCES songs(song_id)
) engine = InnoDB;

INSERT INTO histories (user_id, song_id)
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
  