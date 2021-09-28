DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE plans(
  id INT PRIMARY KEY AUTO_INCREMENT,
  plan VARCHAR(30) NOT NULL,
  price DECIMAL(5,2) NOT NULL
) engine = InnoDB;

CREATE TABLE users(
  id INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  age INT NOT NULL,
  plan INT NOT NULL,
  FOREIGN KEY (plan) REFERENCES plans(id)
) engine = InnoDB;

CREATE TABLE artists(
  id INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(40) NOT NULL
) engine = InnoDB;

CREATE TABLE `following`(
  user INT NOT NULL,
  artist INT NOT NULL,
  FOREIGN KEY (user) REFERENCES users(id),
  FOREIGN KEY (artist) REFERENCES artists(id),
  PRIMARY KEY(user, artist)
) engine = InnoDB;

CREATE TABLE  albums(
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(60) NOT NULL,
  artist INT NOT NULL,
  FOREIGN KEY (artist) REFERENCES artists(id)
) engine = InnoDB;

CREATE TABLE musics(
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(60) NOT NULL,
  artist INT NOT NULL,
  album INT NOT NULL,
  FOREIGN KEY (artist) REFERENCES artists(id),
  FOREIGN KEY (album) REFERENCES albums(id)
) engine = InnoDB;

CREATE TABLE history(
  music INT NOT NULL,
  user INT NOT NULL,
  FOREIGN KEY (music) REFERENCES musics(id),
  FOREIGN KEY (user) REFERENCES users(id),
  PRIMARY KEY (music, user)
) engine = InnoDB;

INSERT INTO plans (plan, price)
  VALUES
    ("GRATUITO", 0.00),
    ("UNIVERSITÁRIO", 5.99),
    ("FAMÍLIA", 7.99);

INSERT INTO users(`name`, age, plan)
  VALUES
    ("Thati", 23, 1),
    ("Cintia", 35, 2),
    ("Bill", 20, 3),
    ("Roger", 45, 1);

INSERT INTO artists (`name`)
  VALUES
    ("Walter Phoenix"),
    ("Peter Strong"),
    ("Lance Day"),
    ("Freedie Shannon");

INSERT INTO following (user, artist)
  VALUES
    (1,1),
    (1,3),
    (1,4),
    (2,1),
    (2,3),
    (3,2),
    (3,1),
    (4,4);

INSERT INTO albums (title, artist)
  VALUES
    ("Envious", 1),
    ("Exuberant", 1),
    ("Hallowed Steam", 2),
    ("Incandescent", 3),
    ("Temporary Culture", 4);

INSERT INTO musics (title, artist, album)
  VALUES
    ("Soul For Us",1,1),("Reflections Of Magic",1,1),("Dance With Her Own",1,1),
    ("Troubles Of My Inner Fire",1,2),("Time Fireworks",1,2),("Magic Circus",2,3),
    ("Honey, So Do I",2,3),("Sweetie, Let's Go Wild",2,3),("She Knows",2,3),
    ("Fantasy For Me",3,4),("Celebration Of More",3,4),("Rock His Everything",3,4),
    ("Home Forever",3,4),("Diamond Power",3,4),("Honey, Let's Be Silly",3,4),
    ("Thang Of Thunder",4,5),("Words Of Her Life",4,5),("Without My Streets",4,5);

INSERT INTO history (user, music)
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
  