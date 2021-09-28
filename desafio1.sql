DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;


  -- Creating table artists
  CREATE TABLE artists (
    Artist_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Artist VARCHAR(100)
)  ENGINE=INNODB;

INSERT INTO
  artists(Artist)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

-- Creating table albums
CREATE TABLE albums (
    Album_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Album VARCHAR(100),
    Artist_ID INT NOT NULL,
    FOREIGN KEY (Artist_ID)
        REFERENCES artists (Artist_ID)
)  ENGINE=INNODB;

INSERT INTO
  albums(Album,Artist_ID)
VALUES
('Envious',1),
('Exuberant',1),
('Hallowed Steam',2),
('Incandescent',3),
('Temporary Culture',4);

  

  -- Creating table songs
  CREATE TABLE songs (
    Song_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Song VARCHAR(100),
    Album_ID INT NOT NULL,
    FOREIGN KEY (Album_ID)
        REFERENCES albums (Album_ID)
)  ENGINE=INNODB;

INSERT INTO
  songs(Song,Album_ID)
VALUES
('Soul For Us',1),
('Reflections Of Magic',1),
('Dance With Her Own',1),
('Troubles Of My Inner Fire',2),
('Time Fireworks',2),
('Magic Circus',3),
('Honey, So Do I',3),
('Sweetie, Let\'s Go Wild',3),
('She Knows',3),
('Fantasy For Me',4),
('Celebration Of More',4),
('Rock His Everything',4),
('Home Forever',4),
('Diamond Power',4),
('Honey, Let\'s Be Silly',4),
('Thang Of Thunder',5),
('Words Of Her Life',5),
('Without My Streets',5);


  
-- Creating table plans
  CREATE TABLE plans (
    Plan_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Plan VARCHAR(50),
    PlanValue DECIMAL(5,2) NOT NULL
)  ENGINE=INNODB;

INSERT INTO
  plans(Plan, PlanValue)
VALUES
('gratuito',0),
('familiar',7.99),
('universitário',5.99);


-- Creating table users
  CREATE TABLE users (
    User_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(100),
    Age INT NOT NULL,
    Plan_ID INT NOT NULL,
    FOREIGN KEY (Plan_ID)
        REFERENCES plans (Plan_ID)
)  ENGINE=INNODB;

INSERT INTO
  users(UserName, Age, Plan_ID)
VALUES
('Thati',23,1),
('Cintia',35,2),
('Bill',20,3),
('Roger',45,1);


-- Creating table user_artists_listened
  CREATE TABLE user_artists_listened (
    User_ID INT NOT NULL,
    Artist_ID INT NOT NULL,
    CONSTRAINT PRIMARY KEY (User_ID , Artist_ID),
    FOREIGN KEY (User_ID)
        REFERENCES users (User_ID),
    FOREIGN KEY (Artist_ID)
        REFERENCES artists (Artist_ID)
)  ENGINE=INNODB;

INSERT INTO
  user_artists_listened(User_ID, Artist_ID)
VALUES
(1,1),
(1,4),
(1,3),
(2,1),
(2,3),
(3,2),
(3,1),
(4,4);


-- Creating table user_songs_listened
  CREATE TABLE user_songs_listened (
    User_ID INT NOT NULL,
    Song_ID INT NOT NULL,
    CONSTRAINT PRIMARY KEY (User_ID , Song_ID),
    FOREIGN KEY (User_ID)
        REFERENCES users (User_ID),
    FOREIGN KEY (Song_ID)
        REFERENCES songs (Song_ID)
)  ENGINE=INNODB;

INSERT INTO
  user_songs_listened(User_ID, Song_ID)
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
