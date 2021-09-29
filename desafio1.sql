DROP SCHEMA IF EXISTS SpotifyClone;
CREATE SCHEMA SpotifyClone;
USE SpotifyClone;

CREATE TABLE Artistas (
    id INT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
)  ENGINE=INNODB;

CREATE TABLE Albuns (
    id INT AUTO_INCREMENT,
    album VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
)  ENGINE=INNODB;

CREATE TABLE Musicas (
    id INT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    id_artista INT,
    id_album INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_artista)
        REFERENCES Artistas (id),
    FOREIGN KEY (id_album)
        REFERENCES Albuns (id)
)  ENGINE=INNODB;

CREATE TABLE Planos (
    id INT AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    valor DOUBLE NOT NULL,
    PRIMARY KEY (id)
)  ENGINE=INNODB;

CREATE TABLE Usuario (
    id INT AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    idade INT NOT NULL,
    plano_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (plano_id)
        REFERENCES Planos (id)
)  ENGINE=INNODB;

CREATE TABLE HistoricoReproducao (
    id_usuario INT,
    id_musica INT,
    FOREIGN KEY (id_usuario)
        REFERENCES Usuario (id),
    FOREIGN KEY (id_musica)
        REFERENCES Musicas (id)
)  ENGINE=INNODB;

CREATE TABLE seguindoArtistas (
    id_usuario INT,
    id_artista INT,
    FOREIGN KEY (id_usuario)
        REFERENCES Usuario (id),
    FOREIGN KEY (id_artista)
        REFERENCES Artistas (id)
)  ENGINE=INNODB;

INSERT INTO Artistas (nome)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

INSERT INTO Albuns (album)
VALUES
  ('Envious'),
  ('Exuberant'),
  ('Hallowed Steam'),
  ('Incandescent'),
  ('Temporary Culture');

INSERT INTO Musicas (nome, id_artista, id_album)
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

  INSERT INTO Planos (nome, valor)
  VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO Usuario (nome, idade, plano_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

INSERT INTO HistoricoReproducao (id_usuario, id_musica)
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
