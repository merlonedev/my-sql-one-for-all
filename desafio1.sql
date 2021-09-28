DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE artists (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL
) engine = InnoDB;

CREATE TABLE albuns (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    artist INT NOT NULL,
    FOREIGN KEY (artist) REFERENCES artists(id)
) engine = InnoDB;

CREATE TABLE plans (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    price FLOAT NOT NULL
) engine = InnoDB;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    age INT NOT NULL,
    plan INT NOT NULL,
    FOREIGN KEY (plan) REFERENCES plans(id)
) engine = InnoDB;

CREATE TABLE musics (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    album INT NOT NULL,
    FOREIGN KEY (album) REFERENCES albuns(id)
) engine = InnoDB;

CREATE TABLE user_history (
    user INT NOT NULL,
    music INT NOT NULL,
    PRIMARY KEY (user, music),
    FOREIGN KEY (user) REFERENCES users(id),
    FOREIGN KEY (music) REFERENCES musics(id)
) engine = InnoDB;

INSERT INTO artists (name)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO albuns(name, artist)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 3);

INSERT INTO plans(name, price)
VALUES
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

INSERT INTO users(name, age, plan)
VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO musics(name, album)
VALUES
('Soul For Us', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 2),
('Time Fireworks', 2),
('Magic Circus', 3),
('Honey, So Do I', 3),
('Sweetie, Let\'s Go Wild', 3),
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

INSERT INTO user_history(user, music)
VALUES
(1, 1),
(1, 6),
(1, 14),
(1, 16),
(2, 13),
(2, 5),
(2, 2),
(2, 15),
(3, 4),
(3, 16),
(3, 6),
(4, 3),
(4, 18),
(4, 11);
