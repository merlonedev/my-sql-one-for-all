DROP DATABASE IF EXISTS SpotifyClone;                                                                             
                                                                                                                      
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Account;
DROP TABLE IF EXISTS History;
DROP TABLE IF EXISTS Songs;
DROP TABLE IF EXISTS Followers;
DROP TABLE IF EXISTS Artists;
DROP TABLE IF EXISTS Album;


CREATE DATABASE SpotifyClone;                                                                                                                                                                                      
USE SpotifyClone;

CREATE TABLE Users (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
name VARCHAR(64) NOT NULL);

CREATE TABLE Account (
user_id INT NOT NULL PRIMARY KEY,
premium BOOL NOT NULL DEFAULT 'FALSE');

CREATE TABLE History (
user_id INT NOT NULL PRIMARY KEY,
song_id INT NOT NULL);

CREATE TABLE Songs (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
name VARCHAR(64) NOT NULL,
artist_id INT NOT NULL);

CREATE TABLE Followers (
user_id INT NOT NULL,
artist_id INT NOT NULL,
PRIMARY KEY (user_id,artist_id));

CREATE TABLE Artists (
id INT NOT NULL PRIMARY KEY,
name VARCHAR(64) NOT NULL);

CREATE TABLE Album (
id INT NOT NULL PRIMARY KEY,
song_id INT NOT NULL);


ALTER TABLE Account ADD CONSTRAINT Account_user_id_Users_id FOREIGN KEY (user_id) REFERENCES Users(id);
ALTER TABLE History ADD CONSTRAINT History_user_id_Users_id FOREIGN KEY (user_id) REFERENCES Users(id);
ALTER TABLE History ADD CONSTRAINT History_song_id_Songs_id FOREIGN KEY (song_id) REFERENCES Songs(id);
ALTER TABLE Songs ADD CONSTRAINT Songs_artist_id_Artists_id FOREIGN KEY (artist_id) REFERENCES Artists(id);
ALTER TABLE Followers ADD CONSTRAINT Followers_user_id_Users_id FOREIGN KEY (user_id) REFERENCES Users(id);
ALTER TABLE Followers ADD CONSTRAINT Followers_artist_id_Artists_id FOREIGN KEY (artist_id) REFERENCES Artists(id);
ALTER TABLE Album ADD CONSTRAINT Album_song_id_Songs_id FOREIGN KEY (song_id) REFERENCES Songs(id);
