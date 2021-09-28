DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE artists(
    id_artist INT AUTO_INCREMENT,
    artist_name VARCHAR(64) NOT NULL,
    PRIMARY KEY (id_artist)
) engine = InnoDB;

CREATE TABLE plans(
    id_plan INT AUTO_INCREMENT,
    plan_name VARCHAR(16) NOT NULL,
    plan_cost DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (id_plan)
) engine = InnoDB;

CREATE TABLE users(
    id_user INT AUTO_INCREMENT,
    user_name VARCHAR(64) NOT NULL,
    user_age INT NOT NULL,
    id_plan INT,
    PRIMARY KEY (id_user),
    FOREIGN KEY (id_plan) REFERENCES plans (id_plan)
) engine = InnoDB;

CREATE TABLE albums(
    id_album INT AUTO_INCREMENT,
    album_name VARCHAR(64) NOT NULL,
    id_artist INT,
    PRIMARY KEY (id_album),
    FOREIGN KEY (id_artist) REFERENCES artists (id_artist)
) engine = InnoDB;

CREATE TABLE songs(
    id_song INT AUTO_INCREMENT,
    song_name VARCHAR(128) NOT NULL,
    id_album INT,
    PRIMARY KEY (id_song),
    FOREIGN KEY (id_album) REFERENCES albums (id_album)
) engine = InnoDB;

CREATE TABLE user_artists(
    id_user INT,
    id_artist INT,
    PRIMARY KEY (id_user, id_artist),
    FOREIGN KEY (id_user) REFERENCES users (id_user),
    FOREIGN KEY (id_artist) REFERENCES artists (id_artist)
) engine = InnoDB;

CREATE TABLE user_songs(
    id_user INT,
    id_song INT,
    PRIMARY KEY (id_user, id_song),
    FOREIGN KEY (id_user) REFERENCES users (id_user),
    FOREIGN KEY (id_song) REFERENCES songs (id_song)
) engine = InnoDB;

INSERT INTO artists (artist_name)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');
  
INSERT INTO plans (plan_name, plan_cost)
VALUES
  ('gratuito', 0),
  ('universitário', 5.99),
  ('familiar', 7.99);

INSERT INTO users (user_name, user_age, id_plan)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 3),
  ('Bill', 20, 2),
  ('Roger', 45, 1);
  
INSERT INTO albums (album_name, id_artist)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

INSERT INTO songs (song_name, id_album)
VALUES
  ('Soul For Us', 1),
  ('Reflections Of Magic', 1),
  ('Dance With Her Own', 1),
  ('Troubles Of My Inner Fire', 2),
  ('Time Fireworks', 2),
  ('Magic Circus', 3),
  ('Honey, So Do I', 3),
  ("Sweetie, Let's Go Wild", 3),
  ('She Knows', 3),
  ('Fantasy For Me', 4),
  ('Celebration Of More', 4),
  ('Rock His Everything', 4),
  ('Home Forever', 4),
  ('Diamond Power', 4),
  ("Honey, Let's Be Silly", 4),
  ('Thang Of Thunder', 5),
  ('Words Of Her Life', 5),
  ('Without My Streets', 5);

INSERT INTO user_artists (id_user, id_artist)
VALUES
  (1, 1),
  (1, 3),
  (1, 4),
  (2, 1),
  (2, 3),
  (3, 1),
  (3, 2),
  (4, 4);

INSERT INTO user_songs (id_user, id_song)
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
