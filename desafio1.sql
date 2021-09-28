DROP SCHEMA IF EXISTS SpotifyClone;
CREATE SCHEMA SpotifyClone;
USE SpotifyClone;

CREATE TABLE Artistas (
    id INT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
)  ENGINE=INNODB;

CREATE TABLE Musicas (
    id INT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    id_artista INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_artista)
        REFERENCES Artistas (id)
)  ENGINE=INNODB;

CREATE TABLE Albuns (
    id INT AUTO_INCREMENT,
    album VARCHAR(50) NOT NULL,
    id_artista INT,
    id_musica INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_artista)
        REFERENCES Artistas (id),
    FOREIGN KEY (id_musica)
        REFERENCES Musicas (id)
)  ENGINE=INNODB;

CREATE TABLE Planos (
    id INT AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    valor INT NOT NULL,
    PRIMARY KEY (id)
)  ENGINE=INNODB;

CREATE TABLE Usuario (
    id INT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    plano_id INT,
    valor_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (plano_id)
        REFERENCES Planos (id),
    FOREIGN KEY (valor_id)
        REFERENCES Planos (id)
)  ENGINE=INNODB;

CREATE TABLE HistoricoReproducao (
    id INT AUTO_INCREMENT,
    id_usuario INT,
    id_cancao INT,
    FOREIGN KEY (id_usuario)
        REFERENCES Usuario (id),
    FOREIGN KEY (id_cancao)
        REFERENCES Musicas (id),
    PRIMARY KEY (id)
)  ENGINE=INNODB;

CREATE TABLE seguindoArtistas (
    id INT AUTO_INCREMENT,
    id_usuario INT,
    id_artista INT,
    FOREIGN KEY (id_usuario)
        REFERENCES Usuario (id),
    FOREIGN KEY (id_artista)
        REFERENCES Artistas (id),
    PRIMARY KEY (id)
)  ENGINE=INNODB;

INSERT INTO Artistas (nome)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

INSERT INTO Musicas (nome, id_artista)
VALUES
  ('Soul For Us', 1),
  ('Reflections Of Magic', 1),
  ('Dance With Her Own', 1),
  ('Troubles Of My Inner Fire', 1),
  ('Time Fireworks', 1),
  ('Magic Circus', 2),
  ('Honey, So Do I', 2),
  ("Sweetie, Let's Go Wild", 2),
  ('She Knows', 2),
  ('Fantasy For Me', 3),
  ('Celebration Of More', 3),
  ('Rock His Everything', 3),
  ('Home Forever', 3),
  ('Diamond Power', 3),
  ("Honey, Let's Be Silly", 3),
  ('Thang Of Thunder', 4),
  ('Words Of Her Life', 4),
  ('Without My Streets', 4);

INSERT INTO Albuns (album, id_artista, id_musica)
VALUES
  ('Envious', 1, 1),
  ('Envious', 1, 2),
  ('Envious', 1, 3),
  ('Exuberant', 1, 4),
  ('Exuberant', 1, 5),
  ('Hallowed Steam', 2, 6),
  ('Hallowed Steam', 2, 7),
  ("Hallowed Steam", 2, 8),
  ('Hallowed Steam', 2, 9),
  ('Incandescent', 3, 10),
  ('Incandescent', 3, 11),
  ('Incandescent', 3, 12),
  ('Incandescent', 3, 13),
  ('Incandescent', 3, 14),
  ("Incandescent", 3, 15),
  ('Temporary Culture', 4, 16),
  ('Temporary Culture', 4, 17),
  ('Temporary Culture', 4, 18);

  INSERT INTO Planos (nome, valor)
  VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO Usuario (nome, idade, plano_id, valor_id)
VALUES
  ('Thati', 23, 4, 4),
  ('Cintia', 35, 5, 4),
  ('Bill', 20, 6, 5),
  ('Roger', 45, 4, 4);

INSERT INTO HistoricoReproducao (id_usuario, id_cancao)
VALUES
  (1, 1),
  (1, 6),
  (1, 14),
  (1, 16),
  (2, 13),
  (2, 17),
  (2, 2),
  (2, 15),
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

INSERT INTO seguindoArtistas (id_usuario, id_artista)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);
