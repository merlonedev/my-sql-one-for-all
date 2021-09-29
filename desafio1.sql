DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE Plano (
plano_id INT PRIMARY KEY AUTO_INCREMENT,
plano VARCHAR(15) NOT NULL,
valor DECIMAL(3,2) DEFAULT 0
) ENGINE = InnoDB;

CREATE TABLE Usuario(
usuario_id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
idade INT NOT NULL,
plano_id INT NOT NULL,
FOREIGN KEY (plano_id) REFERENCES Plano (plano_id) 
) ENGINE = InnoDB;

CREATE TABLE Artista(
  artista_id INT PRIMARY KEY AUTO_INCREMENT,
  artista VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE Usuario_Artista(
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY(usuario_id, artista_id),
  FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id),
  FOREIGN KEY (artista_id) REFERENCES Artista(artista_id)
  ) engine = InnoDB;

CREATE TABLE Album(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album VARCHAR(50) NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES Artista(artista_id)
) engine = InnoDB;

CREATE TABLE Cancao(
  cancao_id INT PRIMARY KEY AUTO_INCREMENT,
  cancao VARCHAR(30) NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES Album(album_id)
) engine = InnoDB;

CREATE TABLE Usuario_Cancao(
  usuario_id INT NOT NULL,
  cancao_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY (usuario_id , cancao_id),
  FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id),
  FOREIGN KEY (cancao_id) REFERENCES Cancao(cancao_id)
) engine = InnoDB;

INSERT INTO Plano(plano) 
VALUES
('gratuito');
INSERT INTO Plano(plano, valor) VALUES('universitário', 5.99);
INSERT INTO Plano(plano, valor) VALUES('familiar', 7.99);

INSERT INTO Usuario (nome, idade, plano_id)
VALUES
('Thati', 23, 1),
('Cintia', 35, 3),
('Bill', 20, 2),
('Roger', 45, 1);

INSERT INTO Artista (artista)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO Usuario_Artista (usuario_id, artista_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

INSERT INTO Album (artista_id, album)
VALUES
(1, 'Envious'),
(1, 'Exuberant'),
(2, 'Hallowed Steam'),
(3, 'Incandescent'),
(4, 'Temporary Culture');

INSERT INTO Cancao (album_id, cancao)
VALUES
(1, 'Soul For Us'),	
(1, 'Reflections Of Magic'),
(1, 'Dance With Her Own'),
(2, 'Troubles Of My Inner Fire'),
(2, 'Time Fireworks'),
(3, 'Magic Circus'),
(3, 'Honey, So Do I'),
(3, 'Sweetie, Let''s Go Wild'),
(3, 'She Knows'),
(4, 'Fantasy For Me'),
(4, 'Celebration Of More'),
(4, 'Rock His Everything'),
(4, 'Home Forever'),
(4, 'Diamond Power'),
(4, 'Honey, Let''s Be Silly'),
(5, 'Thang Of Thunder'),
(5, 'Words Of Her Life'),
(5, 'Without My Streets');

INSERT INTO Usuario_Cancao(usuario_id, cancao_id)
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
