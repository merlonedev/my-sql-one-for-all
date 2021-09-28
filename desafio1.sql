DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE users(
  usuario_id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_nome VARCHAR(50) NOT NULL,
  usuario_idade TINYINT NOT NULL,
  plano_id INT NOT NULL,
  CONSTRAINT FOREIGN KEY (plano_id) REFERENCES plano (plano_id)
) engine = InnoDB;

INSERT INTO users(usuario_nome, usuario_idade, plano_id)
VALUES
('Thati', 23, 1),
('Cintia', 35, 3),
('Bill', 20, 2),
('Roger', 45, 1);

CREATE TABLE plano(
  plano_id INT PRIMARY KEY AUTO_INCREMENT,
  plano_type VARCHAR(30) NOT NULL,
  plano_valor DECIMAL (5, 2) NOT NULL,
) engine = InnoDB;

INSERT INTO plano(plano_type, plano_valor)
VALUES
('gratuito', 0.00),
('universitario', 5.99),
('familiar', 7.99);

CREATE TABLE cantor(
  artista_id INT PRIMARY KEY AUTO_INCREMENT,
  artista_name VARCHAR(50) NOT NULL
) engine = InnoDB;

INSERT INTO cantor(artista_nome)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

CREATE TABLE album(
album_id INT PRIMARY KEY AUTO_INCREMENT,
album_name VARCHAR(100) NOT NULL,
artista_id INT NOT NULL,
CONSTRAINT FOREIGN KEY (artista_id) REFERENCES cantor (artista_id)
) engine = InnoDB;

INSERT INTO album (nome_album, artista_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

CREATE TABLE cancoes(
  cancoes_id INT PRIMARY KEY AUTO_INCREMENT,
  cancao_name VARCHAR(100) NOT NULL,
  album_id INT NOT NULL,
  artista_id INT NOT NULL,
  Constraint FOREIGN KEY (album_id) REFERENCES album (album_id),
  FOREIGN KEY (artista_id) REFERENCES cantor (artista_id)
) engine = InnoDB;

INSERT INTO cancoes(cancao_name, album_id, artista_id)
VALUES
("Soul For Us", 1, 1),
("Reflection Of Magic", 1, 1),
("Dance With Her Own", 1, 1),
("Troubles Of My Inner Fire", 2, 1),
("Time Fireworks", 2, 1),
("Magic Circus", 3, 2),
("Honey, So Do I", 3, 2),
("Sweetie, Let's Go Wild", 3, 2),
("She Knows", 3, 2),
("Fantasy For Me", 4, 3),
("Celebration Of More", 4, 3),
("Rock His Everthing", 4, 3),
("Home Forever", 4, 3),
("Diamando Power", 4, 3),
("Honey, Let's Be Silly", 4, 3),
("Thang Of Thunder", 5, 4),
("Words Of Her Life", 5, 4),
("Without My Streets", 5, 4);

CREATE TABLE seguindo(
  usuario_id INT NOT NULL, 
  artista_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY(usuario_id, artista_id),
  FOREIGN KEY (usuario_id) REFERENCES users (usuario_id),
  FOREIGN KEY (artista_id) REFERENCES cantor (artista_id)
) engine = InnoDB;

INSER INTO seguindo (usuario_id, artista_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1), 
(4, 4);

CREATE TABLE historico(
  usuario_id INT NOT NULL,
  cancoes_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY (usuario_id, cancoes_id),
  FOREIGN KEY (usuario_id) REFERENCES users (usuario_id),
  FOREIGN KEY (cancoes_id) REFERENCES cancoes (cancoes_id)
) engine = InnoDB;

INSERT INTO historico (usuario_id, cancoes_id)
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
