DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE subscribe (
    subscribe_id INT NOT NULL PRIMARY KEY,
    title VARCHAR(50) not null,
    subscribe_value DECIMAL(3 , 2 ) not null
);

INSERT INTO subscribe(subscribe_id, title, subscribe_value)
    VALUES
    (1, 'gratuito', 0),
    (2, 'familiar', 7.99),
    (3, 'universitário', 5.99);

CREATE TABLE users (
    user_id INT NOT NULL PRIMARY KEY,
    username VARCHAR(100),
    age INT NOT NULL,
    subscribe_id INT NOT NULL,
    FOREIGN KEY (subscribe_id)
        REFERENCES subscribe (subscribe_id)
);

INSERT INTO users(user_id, username, age, subscribe_id)
    VALUES
    (1, 'Thati', 23, 1),
    (2, 'Cintia', 35, 2),
    (3, 'Bill', 20, 3),
    (4, 'Roger', 45, 1);

CREATE TABLE artists (
    artist_id INT NOT NULL PRIMARY KEY,
    artist VARCHAR(50)
);

INSERT INTO artists(artist_id, artist)
    VALUES
    (1, 'Walter Phoenix'),
    (2, 'Freedie Shannon'),
    (3, 'Lance Day'),
    (4, 'Peter Strong');

CREATE TABLE followed (
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY (user_id , artist_id),
    FOREIGN KEY (user_id)
        REFERENCES users (user_id),
    FOREIGN KEY (artist_id)
        REFERENCES artists (artist_id)
);

INSERT INTO followed (user_id, artist_id)
    VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 4),
    (3, 1),
    (4, 2);

CREATE TABLE albuns (
    album_id INT NOT NULL PRIMARY KEY,
    album VARCHAR(70) NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id)
        REFERENCES artists (artist_id)
);

INSERT INTO albuns (album_id, album, artist_id)
    VALUES
    (1, 'Envious', 1),
    (2, 'Exuberant', 1),
    (3, 'Hallowed Steam', 2),
    (4, 'Incandescent', 3),
    (5, 'Temporary Culture', 4);

CREATE TABLE songs (
    song_id INT NOT NULL PRIMARY KEY,
    song VARCHAR(70),
    album_id INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (album_id)
        REFERENCES albuns (album_id),
    FOREIGN KEY (artist_id)
        REFERENCES artists (artist_id)
);

INSERT INTO songs (song_id, song, album_id, artist_id)
    VALUES 
    (1, 'Soul For Us', 1, 1),
    (2, 'Reflections Of Magic', 1, 1),
    (3, 'Dance With Her Own', 1, 1),
    (4, 'Troubles Of My Inner Fire', 2, 1),
    (5, 'Time', 2, 1),
    (6, 'Magic Circus', 3, 4),
    (7, 'Honey, So Do I', 3, 4), 
    (8, 'Sweetie, Let\'s Go Wild', 3, 4),
    (9, 'She Knows', 3, 4),
    (10, 'Fantasy For Me', 4, 3),
    (11, 'Celebration Of More', 4, 3), 
    (12, 'Rock His Everything', 4, 3), 
    (13, 'Home Forever', 4, 3),
    (14, 'Diamond Power', 4, 3),
    (15, 'Honey, Let\'s Be Silly', 4, 3),
    (16, 'Thang Of Thunder', 5, 2),
    (17, 'Words Of Her Life', 5, 2), 
    (18, 'Without My Streets', 5, 2);

CREATE TABLE songs_history (
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    PRIMARY KEY (user_id , song_id),
    FOREIGN KEY (user_id)
        REFERENCES users (user_id),
    FOREIGN KEY (song_id)
        REFERENCES songs (song_id)
);

INSERT INTO songs_history (user_id, song_id)
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
