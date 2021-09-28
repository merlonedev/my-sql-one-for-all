DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE Plano(
	id INT NOT NULL AUTO_INCREMENT,
    valor_plano DECIMAL,
    plano VARCHAR(25),
    PRIMARY KEY(id)
)  engine = InnoDB;

INSERT INTO Plano (valor_plano, plano)
  VALUES (0, 'Gratuito'),
		 (7.99, 'Familiar'),
         (5.99, 'Universitário');

CREATE TABLE Artista (
	id INT NOT NULL AUTO_INCREMENT,
	artista_nome VARCHAR(25) NOT NULL,
    PRIMARY KEY(id)
) engine = InnoDB;

INSERT INTO Artista (artista_nome)
	VALUES ('Walter Phoenix'),
		   ('Peter Strong'),
           ('Lance Day'),
           ('Freedie Shannon');


CREATE TABLE Album (
	id INT NOT NULL AUTO_INCREMENT,
    album VARCHAR(50) NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(artista_id) REFERENCES Artista(id)
) engine = InnoDB;

INSERT INTO Album (album, artista_id)
	VALUES ('Envious', 1),
		   ('Exuberant', 1),
           ('Hallowed Steam', 2),
           ('Incandescent', 3),
           ('Temporary Culture', 4);

CREATE TABLE Usuario (
	id INT NOT NULL AUTO_INCREMENT,
    usuario VARCHAR(40),
    idade TINYINT NOT NULL,
    plano_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(plano_id) REFERENCES Plano(id)
) engine = InnoDB;

INSERT INTO Usuario (usuario, idade, plano_id)
	VALUES ('Thati', 23, 1),
		   ('Cintia', 35, 2),
           ('Bill', 20, 3),
           ('Roger', 45, 1);

CREATE TABLE Musicas (
	id INT NOT NULL AUTO_INCREMENT,
    artista_id INT NOT NULL,
    album_id INT NOT NULL,
    musica VARCHAR(60) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (artista_id) REFERENCES Artista (id),
    FOREIGN KEY (album_id) REFERENCES Album (id)
) engine = InnoDB;

INSERT INTO Musicas (artista_id, album_id, musica)
	VALUES(1, 1, 'Soul For Us'),
		  (1, 1, 'Reflections Of Magic'),
          (1, 1, 'Dance With Her Own'),
          (1, 2, 'Troubles Of My Inner Fire'),
          (1, 2, 'Time Fireworks'),
          (2, 3, 'Magic Circus'),
          (2, 3, 'Honey, So Do I'),
          (2, 3, "Sweetie, Let's Go Wild"),
          (2, 3, 'She Knows'),
          (3, 4, 'Fantasy For Me'),
          (3, 4, 'Celebration Of More'),
          (3, 4, 'Rock His Everything'),
          (3, 4, 'Home Forever'),
          (3, 4, 'Diamond Power'),
          (3, 4, "Honey, Let's Be Silly"),
          (4, 5, 'Thang Of Thunder'),
          (4, 5, 'Words Of Her Life'),
          (4, 5, 'Without My Streets');

CREATE TABLE Seguindo_artistas (
	usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (usuario_id, artista_id),
    FOREIGN KEY(usuario_id) REFERENCES Usuario(id),
    FOREIGN KEY(artista_id) REFERENCES Artista(id)
) engine = InnoDB;

INSERT INTO Seguindo_artistas (usuario_id, artista_id)
	VALUES (1, 1),
		   (1, 4),
           (1, 3),
           (2, 1),
           (2, 3),
           (3, 2),
           (3, 1),
           (4, 4);

CREATE TABLE Historico_reproducao (
	usuario_id INT NOT NULL,
    musica_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (usuario_id, musica_id),
    FOREIGN KEY(usuario_id) REFERENCES Usuario(id),
    FOREIGN KEY(musica_id) REFERENCES Musicas(id)
) engine = InnoDB;

INSERT INTO Historico_reproducao (usuario_id, musica_id)
	VALUES (1, 1),
		   (1, 6),
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












