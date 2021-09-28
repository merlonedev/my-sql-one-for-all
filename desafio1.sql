DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE Artists(
  artist_ID INT PRIMARY KEY AUTO_INCREMENT,
  artist_name VARCHAR(50) NOT NULL
);
INSERT INTO Artists(artist_name)
  VALUES ('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon');
    
CREATE TABLE Plans(
  plan_ID INT PRIMARY KEY AUTO_INCREMENT,
  plan_name VARCHAR(15) NOT NULL,
  price DECIMAL(5,2) NOT NULL
);
INSERT INTO Plans(plan_name, price)
VALUES('Gratuito', 0),
  ('Familiar', 7.99),
  ('Universitário', 5.99);
  
CREATE TABLE Albums(
  album_ID INT PRIMARY KEY AUTO_INCREMENT,
  album_name VARCHAR(50) NOT NULL,
  artist_ID INT NOT NULL,
  FOREIGN KEY(artist_ID) REFERENCES Artists(artist_ID)
);
INSERT INTO Albums(album_name, artist_ID)
VALUES("Envious", 1),
("Exuberant", 1),
("Hallowed Steam", 2),
("Incandescent", 3),
("Temporary Culture", 4);

CREATE TABLE Users(
  user_ID INT PRIMARY KEY AUTO_INCREMENT,
  user_name VARCHAR(30) NOT NULL,
  age INT NOT NULL,
  plan_ID INT NOT NULL,
  FOREIGN KEY(plan_ID) REFERENCES Plans(plan_ID)
);
INSERT INTO Users(user_name, age, plan_ID)
VALUES('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);
  
CREATE TABLE Songs(
  song_ID INT PRIMARY KEY AUTO_INCREMENT,
  song_name VARCHAR(50) NOT NULL,
  album_ID INT NOT NULL,
  artist_ID INT NOT NULL,
  FOREIGN KEY(album_ID) REFERENCES Albums(album_ID),
  FOREIGN KEY(artist_ID) REFERENCES Artists(artist_ID)
);
INSERT INTO Songs(song_name, album_ID, artist_ID)
VALUES("Soul For Us", 1, 1),
  ("Reflections Of Magic", 1, 1),
  ("Dance With Her Own", 1, 1),
  ("Troubles Of My Inner Fire", 2, 1),
  ("Time Fireworks", 2, 1),
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
  
CREATE TABLE FollowUsers_Artists(
  user_ID INT NOT NULL,
  artist_ID INT NOT NULL,
  CONSTRAINT PRIMARY KEY(user_ID, artist_ID),
  FOREIGN KEY(user_ID) REFERENCES Users(user_ID),
  FOREIGN KEY(artist_ID) REFERENCES Artists(artist_ID)
);
INSERT INTO FollowUsers_Artists (user_ID, artist_ID) 
VALUES(1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);
  
CREATE TABLE HistoriesUsers_Artists(
  history_ID INT UNIQUE AUTO_INCREMENT,
  user_ID INT NOT NULL,
  song_ID INT NOT NULL,
  CONSTRAINT PRIMARY KEY(user_ID, song_ID),
  FOREIGN KEY(user_ID) REFERENCES Users(user_ID),
  FOREIGN KEY(song_ID) REFERENCES Songs(song_ID)
);
INSERT INTO HistoriesUsers_Artists(user_ID, song_ID)
VALUES(1, 1),
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
