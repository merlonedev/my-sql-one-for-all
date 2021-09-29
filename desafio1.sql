DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plano (
plano_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
plano VARCHAR(25) NOT NULL,
valor DECIMAL(10, 2) NOT NULL,
PRIMARY KEY (plano_id));

CREATE TABLE usuario (
usuario_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
usuario VARCHAR(20) NOT NULL,
idade INT UNSIGNED NOT NULL,
plano_id INT UNSIGNED NOT NULL,
PRIMARY KEY (usuario_id),
FOREIGN KEY (plano_id) REFERENCES plano (plano_id));

CREATE TABLE artista (
artista_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
artista VARCHAR(25) NOT NULL,
PRIMARY KEY (artista_id));

CREATE TABLE album (
album_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
album VARCHAR(45) NOT NULL,
artista_id INT UNSIGNED NOT NULL,
PRIMARY KEY (album_id),
FOREIGN KEY (artista_id) REFERENCES artista (artista_id));

CREATE TABLE cancao (
cancao_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
cancao VARCHAR(45) NULL,
album_id INT UNSIGNED NOT NULL,
PRIMARY KEY (cancao_id),
FOREIGN KEY (album_id) REFERENCES album (album_id));

CREATE TABLE usuario_artista (
usuario_id INT UNSIGNED NOT NULL,
artista_id INT UNSIGNED NOT NULL,
PRIMARY KEY (usuario_id, artista_id),
FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id),
FOREIGN KEY (artista_id) REFERENCES artista (artista_id));

CREATE TABLE usuario_cancao (
usuario_id INT UNSIGNED NOT NULL,
cancao_id INT UNSIGNED NOT NULL,
PRIMARY KEY (usuario_id, cancao_id),
FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id),
FOREIGN KEY (cancao_id) REFERENCES cancao (cancao_id));

INSERT INTO plano (plano, valor)
VALUES
('gratuito', 0),
('universitario', 5.99),
('familiar', 7.99);

INSERT INTO usuario (usuario, idade, plano_id)
VALUES
('Thati', 23, 1),
('Cintia', 35, 3),
('Bill', 20, 2),
('Roger', 45, 1);

INSERT INTO artista (artista)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO album (album, artista_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO cancao (cancao, album_id)
VALUES 
('Soul For Us', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 2),
('Time Fireworks', 2),
('Magic Circus', 3),
('Honey, So Do I', 3),
('Sweetie Let\'s Go Wild', 3),
('She Knows', 3),
('Fantasy For Me', 4),
('Celebration Of More', 4),
('Rock His Everything', 4),
('Home Forever', 4),
('Diamond Power', 4),
('Honey, Let\'s Be Silly', 4),
('Thang Of Thunder', 5),
('Words Of Her Life', 5),
('Without My Streets', 5);

INSERT INTO usuario_artista (usuario_id, artista_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

INSERT INTO usuario_cancao (usuario_id, cancao_id)
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
