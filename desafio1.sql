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
