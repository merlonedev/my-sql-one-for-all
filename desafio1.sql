DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans (
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    price DECIMAL(5 , 2 ) NOT NULL
);

CREATE TABLE artists (
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE albuns (
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id)
        REFERENCES artists (artist_id)
);

CREATE TABLE songs (
    song_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(60) NOT NULL,
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (artist_id)
        REFERENCES artists (artist_id),
    FOREIGN KEY (album_id)
        REFERENCES albuns (album_id)
);

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    age INT,
    plan_id INT NOT NULL,
    FOREIGN KEY (plan_id)
        REFERENCES plans (plan_id)
);

CREATE TABLE user_artist (
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (user_id)
        REFERENCES users (user_id),
    FOREIGN KEY (artist_id)
        REFERENCES artists (artist_id)
);

CREATE TABLE user_song (
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    FOREIGN KEY (user_id)
        REFERENCES users (user_id),
    FOREIGN KEY (song_id)
        REFERENCES songs (song_id)
);

INSERT INTO plans(name, price)
VALUES
          ('Gratuito', 0),
          ('Familiar', 7.99),
          ('Universitário', 5.99);

INSERT INTO artists(name)
VALUES
        ('Walter Phoenix'),
          ('Peter Strong'),
          ('Lance Day'),
          ('Freedie Shannon');

INSERT INTO users(name, age, plan_id)
VALUES
        ('Thati', 23, 1),
          ('Cintia', 35, 2),
          ('Bill', 20, 3),
          ('Roger', 45, 1);

INSERT INTO albuns(title, artist_id)
VALUES
        ('Envious', 1),
          ('Exuberant', 1),
          ('Hallowed Steam', 2),
          ('Incandescent', 3),
          ('Temporary Culture', 4);

INSERT INTO songs(name, artist_id, album_id)
VALUES
      ('Soul For Us', 1, 1),
        ('Reflections Of Magic', 1, 1),
        ('Dance With Her Own', 1, 1),
        ('Troubles Of My Inner Fire', 1, 2),
        ('Time Fireworks', 1, 2),
        ('Magic Circus', 2, 3),
        ('Honey, So Do I', 2, 3),
        ('Sweetie, Lest\'s Go Wild', 2, 3),
        ('She Knows', 2, 3),
        ('Fantasy For Me', 3, 4),
        ('Celebration Of More', 3, 4),
        ('Rock His Everything', 3, 4),
        ('Home Forever', 3, 4),
        ('Diamond Power', 3, 4),
        ('Honey, Let\'s Be Silly', 3, 4),
        ('Thang Of Thunder', 4, 5),
        ('Words Of Her Life', 4, 5),
        ('Without My Streets', 4, 5);

INSERT INTO user_artist(user_id, artist_id)
VALUES
        (1, 1),
        (1, 4),
        (1, 3),
        (2, 1),
        (2, 3),
        (3, 2),
        (3, 1),
        (4, 4);

INSERT INTO user_song(user_id, song_id)
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
