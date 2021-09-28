DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plano(
plano_id INT AUTO_INCREMENT NOT NULL,
plano VARCHAR(50) NOT NULL,
preco DECIMAL(5, 2) NOT NULL,
PRIMARY KEY(plano_id)
) engine = InnoDB;

CREATE TABLE usuario(
usuario_id INT AUTO_INCREMENT NOT NULL,
nome VARCHAR(200) NOT NULL,
idade INT NOT NULL,
plano_id INT NOT NULL,
PRIMARY KEY(usuario_id),
FOREIGN KEY(plano_id) REFERENCES plano (plano_id)
) engine = InnoDB;

CREATE TABLE artista(
artista_id INT AUTO_INCREMENT NOT NULL,
artista VARCHAR(200) NOT NULL,
PRIMARY KEY(artista_id)
) engine = InnoDB;

CREATE TABLE album(
album_id INT AUTO_INCREMENT NOT NULL,
nome VARCHAR(200) NOT NULL NOT NULL,
artista_id INT NOT NULL,
PRIMARY KEY(album_id),
FOREIGN KEY(artista_id) REFERENCES artista(artista_id)
) engine = InnoDB;

CREATE TABLE seguindoartistas(
usuario_id INT NOT NULL,
artista_id INT NOT NULL,
CONSTRAINT PRIMARY KEY(usuario_id, artista_id),
FOREIGN KEY(usuario_id) REFERENCES usuario (usuario_id),
FOREIGN KEY(artista_id) REFERENCES artista (artista_id)
) engine = InnoDB;

CREATE TABLE cancoes(
cancoes_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
titulo VARCHAR(200) NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY(album_id) REFERENCES album(album_id)
) engine = InnoDB;

CREATE TABLE historico(
usuario_id INT NOT NULL,
cancoes_id INT NOT NULL,
CONSTRAINT PRIMARY KEY(usuario_id, cancoes_id),
FOREIGN KEY(usuario_id) REFERENCES usuario (usuario_id),
FOREIGN KEY(cancoes_id) REFERENCES cancoes (cancoes_id)
) engine = InnoDB;

INSERT INTO plano(plano, preco)
VALUES 
('gratuito', 0.00),
('familiar', 7.99),
('universitário', 5.99);

INSERT INTO usuario(nome, idade, plano_id)
VALUES 
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO artista(artista)
VALUES 
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO album(nome, artista_id)
VALUES 
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO cancoes(titulo, album_id)
VALUES 
('Soul For Us', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 1),
('Time Fireworks', 1),
('Magic Circus', 2),
('Honey, So Do I', 2),
('Sweetie, Let''s Go Wild', 2),
('She Knows', 2),
('Fantasy For Me', 3),
('Celebration Of More', 3),
('Rock His Everything', 3),
('Home Forever', 3),
('Diamond Power', 3),
('Honey, Let''s Be Silly', 3),
('Thang Of Thunder', 4),
('Words Of Her Life', 4),
('Without My Streets', 4);

INSERT INTO seguindoartistas(usuario_id, artista_id)
VALUES 
(1, 1),
(1, 3),
(1, 4),
(2, 3),
(2, 1),
(3, 1),
(3, 2),
(4, 4);

INSERT INTO historico(usuario_id, cancoes_id)
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
