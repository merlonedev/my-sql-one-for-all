DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
    plano_id INT PRIMARY KEY,
    plano VARCHAR(20) NOT NULL,
    valor_plano DOUBLE(3, 2)
) engine = InnoDB;

CREATE TABLE usuarios(
    usuario_id INT PRIMARY KEY,
    usuario VARCHAR(20) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES planos (plano_id)
) engine = InnoDB;

CREATE TABLE artistas(
    artista_id INT PRIMARY KEY,
    artista VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE albums(
    album_id INT PRIMARY KEY,
    album VARCHAR(50) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
) engine = InnoDB;

CREATE TABLE cancoes(
    cancao_id INT PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums (album_id)
) engine = InnoDB;

CREATE TABLE usuario_artista(
    usuario_id INT,
    artista_id INT,
    CONSTRAINT PRIMARY KEY(usuario_id, artista_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
) engine = InnoDB;

CREATE TABLE historico(
    usuario_id INT,
    cancao_id INT,
    CONSTRAINT PRIMARY KEY(usuario_id, cancao_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes (artista_id)
) engine = InnoDB;

INSERT INTO usuarios (usuario_id, usuario, idade, plano_id)
VALUES
  (1, 'Thati', 23, 1),
  (2, 'Cintia', 35, 2),
  (3, 'Bill', 20, 3),
  (4, 'Roger', 45, 1);

INSERT INTO planos (plano_id, plano, valor_plano)
VALUES
  (1, 'gratuito', 0),
  (2, 'familiar', 7,99),
  (3, 'universitário', 5,99);
  
INSERT INTO artistas (artista_id, artista)
VALUES
  (1, 'Walter Phoenix'),
  (2, 'Peter Strong'),
  (3, 'Lance Day'),
  (4, 'Freedie Shannon');

INSERT INTO albums (album_id, album, artista_id)
VALUES
  (1, 'Envious', 1),
  (2, 'Exuberant', 1),
  (3, 'Hallowed Steam', 2),
  (4, 'Incandescent', 3),
  (5, 'Temporary CUlture', 4);
  
INSERT INTO cancoes (cancao_id, titulo, album_id)
VALUES
  (1, 'Soul For Us', 1),
  (2, 'Magic Circus', 3),
  (3, 'Diamond Power', 4),
  (4, 'Thang Of Thunder', 5),
  (5, 'Home Forever', 4),
  (6, 'Words Of Her Life', 5),
  (7, 'Reflections Of Magic', 1),
  (8, "Honey, Let's Be Silly", 4),
  (9, 'Troubles Of My Inner Fire', 2),
  (10, 'Dance With Her Own', 1),
  (11, 'Without My Streets', 5),
  (12, 'Celebration Of More', 4),
  (13, 'Time Fireworks', 2),
  (14, 'Rock His Everything', 4),
  (15, 'Fantasy For Me', 4)
  (16, 'Honey, So Do I', 3),
  (17, "Sweetie, Let's Go Wild", 3),
  (18, 'She Knows', 3);

INSERT INTO historico (usuario_id, cancao_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (1, 4),
  (2, 5),
  (2, 6),
  (2, 7),
  (2, 8),
  (3, 9),
  (3, 4),
  (3, 2),
  (4, 10),
  (4, 11),
  (4, 12);
  
INSERT INTO usuario_artista (usuario_id, artista_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 3),
  (2, 1),
  (3, 2),
  (3, 1),
  (4, 4);
