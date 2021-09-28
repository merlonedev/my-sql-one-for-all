DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

-- Table plano
DROP TABLE IF EXISTS plano;

CREATE TABLE IF NOT EXISTS plano(
id_plano INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
valor DECIMAL(5,2) NULL,
PRIMARY KEY (id_plano)
) ENGINE = InnoDB;

-- Table usuario
DROP TABLE IF EXISTS usuario;

CREATE TABLE IF NOT EXISTS usuario(
id_usuario INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
idade INT NULL,
id_plano INT NOT NULL,
PRIMARY KEY (id_usuario),
FOREIGN KEY (id_plano) REFERENCES plano(id_plano)
) ENGINE = InnoDB;

-- Table artista
DROP TABLE IF EXISTS artista;

CREATE TABLE IF NOT EXISTS artista(
id_artista INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
PRIMARY KEY (id_artista)
) ENGINE = InnoDB;

-- Table album
DROP TABLE IF EXISTS album;

CREATE TABLE IF NOT EXISTS album(
id_album INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
id_artista INT NOT NULL,
PRIMARY KEY (id_album),
FOREIGN KEY (id_artista) REFERENCES artista(id_artista)
) ENGINE = InnoDB;

-- Table musicas
DROP TABLE IF EXISTS musicas;

CREATE TABLE IF NOT EXISTS musicas(
id_musica INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
id_album INT NOT NULL,
PRIMARY KEY (id_musica),
FOREIGN KEY (id_album) REFERENCES album(id_album)
) ENGINE = InnoDB;

-- Table usuario_artista
DROP TABLE IF EXISTS usuario_artista;

CREATE TABLE IF NOT EXISTS usuario_artista(
id_usuario INT NOT NULL,
id_artista INT NOT NULL,
PRIMARY KEY (id_usuario, id_artista),
FOREIGN KEY (id_artista) REFERENCES artista(id_artista),
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE
) ENGINE = InnoDB;

-- Table usuario_musicas
DROP TABLE IF EXISTS usuario_musicas;

CREATE TABLE IF NOT EXISTS usuario_musicas(
id_usuario INT NOT NULL,
id_musica INT NOT NULL,
PRIMARY KEY (id_usuario, id_musica),
FOREIGN KEY (id_musica) REFERENCES musicas(id_musica),
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE
) ENGINE = InnoDB;

-- Inserts
INSERT INTO plano (nome, valor)
VALUES
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

INSERT INTO usuario (nome, idade, id_plano)
VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO artista (nome)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');
  
INSERT INTO album (nome, id_artista)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO musicas (nome, id_album)
VALUES
('Soul For Us', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 2),
('Time Fireworks', 2),
('Magic Circus', 3),
('Honey, So Do I', 3),
('Sweetie, Let\'s Go Wild', 3),
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

INSERT INTO usuario_artista (id_usuario, id_artista)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

INSERT INTO usuario_musicas (id_usuario, id_musica)
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
(4, 8),
(4, 11);
