DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE users(
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_name VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  plan_id INT NOT NULL
) engine = innoDB;

CREATE TABLE plans(
  id INT PRIMARY KEY AUTO_INCREMENT,
  plan_name VARCHAR(50) NOT NULL,
  plan_value DOUBLE
) engine = innoDB;

CREATE TABLE artists(
  id INT PRIMARY KEY AUTO_INCREMENT,
  artist_name VARCHAR(50) NOT NULL
) engine = innoDB;

CREATE TABLE albums(
  id INT PRIMARY KEY AUTO_INCREMENT,
  table_name VARCHAR(50) NOT NULL,
  artist_id INT NOT NULL
) engine = innoDB;

CREATE TABLE songs(
  id INT PRIMARY KEY AUTO_INCREMENT,
  song_name VARCHAR(50) NOT NULL,
  album_id INT NOT NULL,
  artist_id INT NOT NULL
) engine = innoDB;

CREATE TABLE artist_user(
  id INT PRIMARY KEY AUTO_INCREMENT,
  artist_id INT NOT NULL,
  user_id INT NOT NULL
) engine = innoDB;

CREATE TABLE user_song(
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  song_id INT NOT NULL
) engine = innoDB;

ALTER TABLE users
ADD FOREIGN KEY (plan_id) REFERENCES plans(id);

ALTER TABLE albums
ADD FOREIGN KEY (artist_id) REFERENCES artists(id);

ALTER TABLE songs
ADD FOREIGN KEY (album_id) REFERENCES albums(id),
ADD FOREIGN KEY (artist_id) REFERENCES artists(id);

ALTER TABLE artist_user
ADD FOREIGN KEY (user_id) REFERENCES users(id),
ADD FOREIGN KEY (artist_id) REFERENCES artists(id);

ALTER TABLE user_song
ADD FOREIGN KEY (user_id) REFERENCES users(id),
ADD FOREIGN KEY (song_id) REFERENCES songs(id);

INSERT INTO plans(plan_name, plan_value)
VALUES
  ('gratuito', 0),
  ('universitário', 5.99),
  ('familiar', 7.99);

INSERT INTO users(user_name, age, plan_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 3),
  ('Bili', 20, 2),
  ('Roger', 45, 1);

INSERT INTO artists(artist_name)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');
