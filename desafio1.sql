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
  album_name VARCHAR(50) NOT NULL,
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

INSERT INTO albums(album_name, artist_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

INSERT INTO songs(song_name, album_id, artist_id)
VALUES
  ('Soul For Us', 1, 1),
  ('Reflections Of Magic', 1, 1),
  ('Dance With Her Own', 1, 1),
  ('Troubles Of My Inner Fire', 2, 1),
  ('Time Fireworks', 2, 1),
  ('Magic Circus', 3, 2),
  ('Honey, So Do I', 3, 2),
  ("Sweetie, Let's Go Wild", 3, 2),
  ('She Knows', 3, 2),
  ('Fantasy For Me', 4, 3),
  ('Celebration Of More', 4, 3),
  ('Rock His Everything', 4, 3),
  ('Home Forever', 4, 3),
  ('Diamond Power', 4, 3),
  ("Honey, Let's Be Silly", 4, 3),
  ('Thang Of Thunder', 5, 4),
  ('Words Of Her Life', 5, 4),
  ('Without My Streets', 5, 4);
