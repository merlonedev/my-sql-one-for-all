DROP SCHEMA IF EXISTS SpotifyClone;

CREATE SCHEMA SpotifyClone;

USE SpotifyClone;

CREATE TABLE artista (
  id_artista INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(250) NOT NULL,
  PRIMARY KEY (id_artista)
) ENGINE = InnoDB;

CREATE TABLE album (
  id_album INT AUTO_INCREMENT,
  nome VARCHAR(250) NOT NULL,
  id_artista INT NOT NULL,
  PRIMARY KEY (id_album),
  FOREIGN KEY (id_artista) REFERENCES artista(id_artista)
) ENGINE = InnoDB;

CREATE TABLE cancao (
  id_cancao INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(250) NOT NULL,
  id_album INT NOT NULL,
  PRIMARY KEY (id_cancao),
  FOREIGN KEY (id_album) REFERENCES album(id_album)
) ENGINE = InnoDB;

CREATE TABLE plano (
  id_plano INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  valor INT NOT NULL,
  PRIMARY KEY (id_plano)
) ENGINE = InnoDB;

CREATE TABLE usuario (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  idade INT NOT NULL,
  id_plano INT NOT NULL,
  PRIMARY KEY (id_usuario),
  FOREIGN KEY (id_plano) REFERENCES plano(id_plano)
) ENGINE = InnoDB;

CREATE TABLE usuario_ouviu_cancao (
  id_usuario INT NOT NULL,
  id_cancao INT NOT NULL,
  PRIMARY KEY (id_usuario, id_cancao),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY (id_cancao) REFERENCES cancao(id_cancao)
) ENGINE = InnoDB;

CREATE TABLE usuario_segue_artista (
  id_usuario INT NOT NULL,
  id_artista INT NOT NULL,
  PRIMARY KEY (id_usuario, id_artista),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY (id_artista) REFERENCES artista(id_artista)
) ENGINE = InnoDB;

INSERT INTO artista (nome)
VALUES
('Walter Phoenix'),
('Freddie Shannon'),
('Lance Day'),
('Peter Strong');
    
INSERT INTO album (nome, id_artista)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 4),
('Incandescent', 3),
('Temporary Culture', 2);
    
INSERT INTO cancao (nome, id_album)
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

INSERT INTO plano (nome, valor)
VALUES
('gratuito', 0),
('universitario', 5.99),
('familiar', 7.99);

INSERT INTO usuario (nome, idade, id_plano)
VALUES
('Thati', 23, 1),
('Cintia', 35, 3),
('Bill', 20, 2),
('Roger', 45, 1);
    
INSERT INTO usuario_segue_artista (id_usuario, id_artista)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 4),
(3, 1),
(4, 2);

INSERT INTO usuario_ouviu_cancao (id_usuario, id_cancao)
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
