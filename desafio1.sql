-- Deletes a database, if exists.
DROP DATABASE IF EXISTS SpotifyClone;
-- Create a database with the specified name.
CREATE DATABASE SpotifyClone;
-- Defines the currently active database for use.
USE SpotifyClone;

-- Deletes a table, if exists.
DROP TABLE IF EXISTS SpotifyClone.Plans;
-- Creates the table Plans.
CREATE TABLE Plans (
	plan_id INT PRIMARY KEY AUTO_INCREMENT,
	plan_name VARCHAR(20) NOT NULL,
	plan_price DECIMAL(5,2) NOT NULL
) ENGINE = InnoDB;

-- Deletes a table, if exists.
DROP TABLE IF EXISTS SpotifyClone.Users;
-- Creates the table Users.
CREATE TABLE Users (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	user_name VARCHAR(100) NOT NULL,
	user_age INT NOT NULL,
	plan_id INT NOT NULL,
FOREIGN KEY (plan_id) REFERENCES Plans (plan_id)
) ENGINE = InnoDB;

-- Deletes a table, if exists.
DROP TABLE IF EXISTS SpotifyClone.Artists;
-- Creates the table Artists.
CREATE TABLE Artists (
	artist_id INT PRIMARY KEY AUTO_INCREMENT,
	artist_name VARCHAR(100) NOT NULL
) ENGINE = InnoDB;

-- Deletes a table, if exists.
DROP TABLE IF EXISTS SpotifyClone.Albums;
-- Creates the table Albums.
CREATE TABLE Albums (
	album_id INT PRIMARY KEY AUTO_INCREMENT,
	album_name VARCHAR(100) NOT NULL,
	artist_id INT NOT NULL,
FOREIGN KEY (artist_id) REFERENCES Artists (artist_id)
) ENGINE = InnoDB;

-- Deletes a table, if exists.
DROP TABLE IF EXISTS SpotifyClone.Musics;
-- Creates the table Musics.
CREATE TABLE Musics (
	music_id INT PRIMARY KEY AUTO_INCREMENT,
	music_name VARCHAR(150) NOT NULL,
	artist_id INT NOT NULL,
	album_id INT NOT NULL,
FOREIGN KEY (artist_id) REFERENCES Artists (artist_id),
FOREIGN KEY (album_id) REFERENCES Albums (album_id)
) ENGINE = InnoDB;

-- Deletes a table, if exists.
DROP TABLE IF EXISTS SpotifyClone.Follow;
-- Creates the table Follow.
CREATE TABLE Follow (
	user_id INT NOT NULL,
	artist_id INT NOT NULL,
CONSTRAINT PRIMARY KEY (user_id, artist_id),
FOREIGN KEY (user_id) REFERENCES Users (user_id),
FOREIGN KEY (artist_id) REFERENCES Artists (artist_id)
) ENGINE = InnoDB;

-- Deletes a table, if exists.
DROP TABLE IF EXISTS SpotifyClone.Historic;
-- Creates the table Historic.
CREATE TABLE Historic (
	music_id INT NOT NULL,
	user_id INT NOT NULL,
CONSTRAINT PRIMARY KEY (music_id, user_id),
FOREIGN KEY (music_id) REFERENCES Musics (music_id),
FOREIGN KEY (user_id) REFERENCES Users (user_id)
) ENGINE = InnoDB;

-- Insert data into table Plans.
INSERT INTO Plans (plan_name, plan_price)
VALUES
	('gratuito', 0.00),
	('universitário', 5.99),
	('familiar', 7.99);
    
-- Insert data into table Users.
INSERT INTO Users (user_name, user_age, plan_id)
VALUES
	('Thati', 23, 1),
	('Cintia', 35, 3),
	('Bill', 20, 2),
	('Roger', 45, 1);
    
-- Insert data into table Artists.
INSERT INTO Artists (artist_name)
VALUES
	('Walter Phoenix'),
	('Peter Strong'),
	('Lance Day'),
	('Freedie Shannon');
    
-- Insert data into table Albums.
INSERT INTO Albums (album_name, artist_id)
VALUES
	('Envious', 1),
	('Exuberant',	1),
	('Hallowed Steam',	2),
	('Incandescent', 3),
	('Temporary Culture', 4);
    
-- Insert data into table Musics.
INSERT INTO Musics (music_name, artist_id, album_id)
VALUES
	('Soul For Us', 1, 1),
	('Reflections Of Magic', 1, 1),
	('Dance With Her Own', 1, 1),
	('Troubles Of My Inner Fire', 1, 2),
	('Time Fireworks', 1, 2),
	('Magic Circus', 2, 3),
	('Honey, So Do I', 2, 3),
	("Sweetie, Let's Go Wild", 2, 3),
	('She Knows', 2, 3),
	('Fantasy For Me', 3, 4),
	('Celebration Of More', 3, 4),
	('Rock His Everything', 3, 4),
	('Home Forever', 3, 4),
	('Diamond Power', 3, 4),
	("Honey, Let's Be Silly", 3, 4),
	('Thang Of Thunder', 4, 5),
	('Words Of Her Life', 4, 5),
	('Without My Streets', 4, 5);
    
-- Insert data into table Follow.
INSERT INTO Follow (user_id, artist_id)
VALUES
	(1, 1),
	(1, 4),
	(1, 3),
	(2, 1),
	(2, 3),
	(3, 2),
	(3, 1),
	(4, 4);

-- Insert data into table Historic.
INSERT INTO Historic (user_id, music_id)
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