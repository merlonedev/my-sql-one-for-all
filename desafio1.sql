DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;
CREATE TABLE plan(
plan_id INT PRIMARY KEY AUTO_INCREMENT,
plan_name VARCHAR(50) NOT NULL,
price DOUBLE NOT NULL
) ENGINE = InnoDB;
CREATE TABLE singer(
singer_id INT PRIMARY KEY AUTO_INCREMENT,
singer_name VARCHAR(100) NOT NULL
) ENGINE = InnoDB;
CREATE TABLE user(
user_id INT PRIMARY KEY AUTO_INCREMENT,
user_name VARCHAR(50) NOT NULL,
age INT NOT NULL,
plan_id INT NOT NULL,
FOREIGN KEY (plan_id) REFERENCES plan(plan_id)    
) ENGINE = InnoDB;
CREATE TABLE album(
album_id INT PRIMARY KEY AUTO_INCREMENT,
album_name VARCHAR(100) NOT NULL,
singer_id INT NOT NULL,
FOREIGN KEY (singer_id) REFERENCES singer(singer_id)
) ENGINE = InnoDB;
CREATE TABLE song(
song_id INT PRIMARY KEY AUTO_INCREMENT,
song_name VARCHAR(100) NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES album(album_id)    
) ENGINE = InnoDB;
CREATE TABLE reproduction_history(
user_id INT NOT NULL,
song_id INT NOT NULL,
PRIMARY KEY (user_id, song_id),
FOREIGN KEY (user_id) REFERENCES user(user_id),
FOREIGN KEY (song_id) REFERENCES song(song_id)
) ENGINE = InnoDB;
CREATE TABLE singer_followers(
user_id INT NOT NULL,
singer_id INT NOT NULL,
PRIMARY KEY (user_id, singer_id),
FOREIGN KEY (user_id) REFERENCES user(user_id),
FOREIGN KEY (singer_id) REFERENCES singer(singer_id)
) ENGINE = InnoDB;
INSERT INTO plan(plan_name, price)
VALUES
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);
INSERT INTO singer(singer_name)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');
INSERT INTO user(user_name, plan_id, age)
VALUES
('Thati', 1, 23),
('Cintia', 2, 35),
('Bill', 3, 20),
('Roger', 1, 45);  
INSERT INTO album(album_name, singer_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);  
INSERT INTO song(song_name, album_id)
VALUES
("Soul For Us", 1),
("Reflections Of Magic", 1),
("Dance With Her Own", 1),
("Troubles Of My Inner Fire", 2),
("Time Fireworks", 2),
("Magic Circus", 3),
("Honey, So Do I", 3),
("Sweetie, Let's Go Wild", 3),
("She Knows", 3),
("Fantasy For Me", 4),
("Celebration Of More", 4),
("Rock His Everything", 4),
("Home Forever", 4),
("Diamond Power", 4),
("Honey, Let's Be Silly", 4),
("Thang Of Thunder", 5),
("Words Of Her Life", 5),
("Without My Streets", 5);  
INSERT INTO reproduction_history(user_id, song_id)
VALUES
(1,1),
(1,6),
(1,14),
(1,16),
(2,13),
(2,17),
(2,2),
(2,15),
(3,4),
(3,16),
(3,6),
(4,3),
(4,18),
(4,11);  
INSERT INTO singer_followers(user_id, singer_id)
VALUES
(1,	1),
(1,	4),
(1,	3),
(2,	1),
(2,	3),
(3,	2),
(3,	1),
(4,	4);

