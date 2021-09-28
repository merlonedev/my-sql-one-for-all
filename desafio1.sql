DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE subscriptions(
subscription_id INT PRIMARY KEY AUTO_INCREMENT,
subscription_title VARCHAR(50) NOT NULL,
subscription_price DECIMAL(4, 2) NOT NULL
)  engine = InnoDB;

CREATE TABLE users(
user_id INT PRIMARY KEY AUTO_INCREMENT,
user_name VARCHAR(30) NOT NULL,
user_age INT NOT NULL,
subscription_id INT NOT NULL,
FOREIGN KEY (subscription_id) REFERENCES subscriptions(subscription_id)
)  engine = InnoDB;

CREATE TABLE artists(
artist_id INT PRIMARY KEY AUTO_INCREMENT,
artist_name VARCHAR(80) NOT NULL
)  engine = InnoDB;

CREATE TABLE albums(
album_id INT PRIMARY KEY AUTO_INCREMENT,
album_title VARCHAR(80) NOT NULL,
artist_id INT NOT NULL,
FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
)  engine = InnoDB;

CREATE TABLE songs(
song_id INT PRIMARY KEY AUTO_INCREMENT,
song_title VARCHAR(100) NOT NULL,
album_id INT NOT NULL,
artist_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES albums(album_id),
FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
)  engine = InnoDB;

CREATE TABLE rep_history(
user_id INT NOT NULL,
song_id INT NOT NULL,
CONSTRAINT PRIMARY KEY(user_id, song_id),
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (song_id) REFERENCES songs(song_id)
)  engine = InnoDB;

CREATE TABLE user_follows (
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (user_id , artist_id),
    FOREIGN KEY (user_id)
        REFERENCES users (user_id),
    FOREIGN KEY (artist_id)
        REFERENCES artists (artist_id)
)  ENGINE=INNODB;

INSERT INTO subscriptions(subscription_title, subscription_price)
VALUES
("Gratuito", 0.00),
("Universitário", 5.99),
("Familiar", 7.99);

INSERT INTO users(user_name, user_age, subscription_id)
VALUES
("Thati", 23, 1),
("Cintia", 35, 3),
("Bill", 20, 2),
("Roger", 45, 1);

INSERT INTO artists(artist_name)
VALUES
("Walter Phoenix"),
("Peter Strong"),
("Lance Day"),
("Freedie Shannon");

INSERT INTO albums(album_title, artist_id)
VALUES
("Envious", 1),
("Exuberant", 1),
("Hallowed Steam", 2),
("Incandescent", 3),
("Temporary Culture", 4);

INSERT INTO songs(song_title, album_id, artist_id)
VALUES
("Soul For Us", 1, 1),
("Reflections Of Magic", 1, 1),
("Dance With Her Own", 1, 1),
("Troubles Of My Inner Fire", 1, 1),
("Time Fireworks", 1, 1),
("Magic Circus", 3, 2),
("Honey, So Do I", 3, 2),
("Sweetie, Let's Go Wild", 3, 2),
("She Knows", 3, 2),
("Fantasy For Me", 4, 3),
("Celebration Of More", 4, 3),
("Rock His Everything", 4, 3),
("Home Forever", 4, 3),
("Diamond Power", 4, 3),
("Honey, Let's Be Silly", 4, 3),
("Thang Of Thunder", 5, 4),
("Words Of Her Life", 5, 4),
("Without My Streets", 5, 4);

INSERT INTO rep_history(user_id, song_id)
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

INSERT INTO user_follows(user_id, artist_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);
