DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans (
    id_plan INT AUTO_INCREMENT PRIMARY KEY,
    plan VARCHAR(100),
    price DECIMAL(4 , 2 )
)  ENGINE=INNODB;

INSERT INTO plans (plan, price)
VALUES
  ('gratuito', 0.00),
  ('universitário', 5.99),
  ('familiar', 7.99);

CREATE TABLE users (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(200),
    age INT,
    id_plan INT,
    FOREIGN KEY (id_plan)
        REFERENCES plans (id_plan)
)  ENGINE=INNODB;

INSERT INTO users (user_name, age, id_plan)
VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

CREATE TABLE artists (
    id_artist INT AUTO_INCREMENT PRIMARY KEY,
    artist VARCHAR(200)
)  ENGINE=INNODB;

INSERT INTO artists (artist)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

CREATE TABLE albums (
    id_album INT AUTO_INCREMENT PRIMARY KEY,
    album VARCHAR(200),
    id_artist INT,
    FOREIGN KEY (id_artist)
        REFERENCES artists (id_artist)
)  ENGINE=INNODB;

INSERT INTO albums(album, id_artist) VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

CREATE TABLE songs (
    id_song INT AUTO_INCREMENT PRIMARY KEY,
    song VARCHAR(200),
    id_album INT,
    FOREIGN KEY (id_album)
        REFERENCES albums (id_album)
)  ENGINE=INNODB;

INSERT INTO songs(song, id_album) VALUES
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

CREATE TABLE followers (
    id_follower INT AUTO_INCREMENT,
    id_user INT,
    id_artist INT,
    CONSTRAINT PRIMARY KEY (id_follower, id_user, id_artist),
    FOREIGN KEY (id_user)
        REFERENCES users (id_user),
    FOREIGN KEY (id_artist)
        REFERENCES artists (id_artist)
)  ENGINE=INNODB;

INSERT INTO followers (id_user, id_artist)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

CREATE TABLE play_history (
    id_play_history INT AUTO_INCREMENT,
    id_user INT,
    id_song INT,
    CONSTRAINT PRIMARY KEY (id_play_history, id_song, id_user),
    FOREIGN KEY (id_song)
        REFERENCES songs (id_song),
    FOREIGN KEY (id_user)
        REFERENCES users (id_user)
)  ENGINE=INNODB;

INSERT INTO play_history (id_user, id_song)
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
