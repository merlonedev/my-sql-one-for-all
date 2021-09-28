DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE planos(
	plano_id INT PRIMARY KEY AUTO_INCREMENT,
  plano VARCHAR(16) NOT NULL,
  valor FLOAT NOT NULL
)engine=InnoDB;

CREATE TABLE usuarios(
	usuario_id INT PRIMARY KEY AUTO_INCREMENT,
  usuario VARCHAR(16) NOT NULL,
  idade INT NOT NULL,
  plano_id INT,
  FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
)engine=InnoDB;

CREATE TABLE cancoes(
	cancao_id INT PRIMARY KEY AUTO_INCREMENT,
  cancao VARCHAR(64) NOT NULL
)engine=InnoDB;

CREATE TABLE artistas(
	artista_id INT PRIMARY KEY AUTO_INCREMENT,
  artista VARCHAR(32)
)engine=InnoDB;

CREATE TABLE albuns(
	album_id INT PRIMARY KEY AUTO_INCREMENT,
  album VARCHAR(64) NOT NULL,
  artista_id INT,
  FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
)engine=InnoDB;

CREATE TABLE reproducoes(
	cancao_id INT,
  usuario_id INT,
  PRIMARY KEY(cancao_id, usuario_id),
  FOREIGN KEY(cancao_id) REFERENCES cancoes(cancao_id),
  FOREIGN KEY(usuario_id) REFERENCES usuarios(usuario_id)
)engine=InnoDB;

CREATE TABLE seguindo(
	artista_id INT,
  usuario_id INT,
  PRIMARY KEY(artista_id, usuario_id),
  FOREIGN KEY(artista_id) REFERENCES artistas(artista_id),
  FOREIGN KEY(usuario_id) REFERENCES usuarios(usuario_id)
)engine=InnoDB;

INSERT INTO planos(plano, valor)
VALUES
	('gratuito', 0.00),
	('universitario', 5.99),
  ('familiar', 7.99);
    
INSERT INTO usuarios(usuario, idade, plano_id)
VALUES
	('Thati', 23, 1),
	('Cintia', 35, 3),
	('Bill', 20, 2),
	('Roger', 45, 1);
    
INSERT INTO cancoes(cancao)
VALUES
	('Sou'),
	('Magic Circus'),
	('Diamong Power'),
	('Thang Of Thunder'),
	('Home Forever'),
	('Words Of Her Life'),
	('Reflections Of Magic'),
	('Honey, Let\'s Be Silly'),
	('Troubles Of My Inner Fire'),
	('Dance With Her Own'),
	('Without My Streets'),
	('Celebration Of More'),
	('Time Fireworks'),
	('Honey, So Do I'),
	('Sweetie, Let\'s Go Wild'),
	('She Knows'),
	('Fantasy For Me'),
	('Rock His Everything');
    
INSERT INTO artistas(artista)
VALUES
	('Walter Phoenix'),
	('Peter Strong'),
	('Lance Day'),
	('Freedie Shanno');
    
INSERT INTO albuns(album, artista_id)
VALUES
	('Envious', 1),
	('Exuberant', 1),
	('Hallowed Steam', 2),
	('Incandescent', 3),
	('Temporary Culture', 4);
    
INSERT INTO reproducoes(cancao_id, usuario_id)
VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 2),
	(6, 2),
	(7, 2),
	(8, 2),
	(9, 3),
	(4, 3),
	(2, 3),
	(10, 4),
	(11, 4),
	(12, 4);
    
INSERT INTO seguindo(usuario_id, artista_id)
VALUES
	(1, 1),
	(1, 4),
	(1, 3),
	(2, 1),
	(2, 3),
	(3, 2),
	(3, 1),
	(4, 4);
