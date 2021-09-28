DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE Artistas(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Albuns(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES Artistas(id)
);

CREATE TABLE Planos(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    valor DECIMAL(5,2) NOT NULL
);

CREATE TABLE Usuarios(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES Planos(id)
);

CREATE TABLE Musicas(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    artista_id INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES Artistas(id),
    FOREIGN KEY (album_id) REFERENCES Albuns(id)
);

CREATE TABLE Usuario_Artista(
	usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY (usuario_id, artista_id),
    FOREIGN KEY (artista_id) REFERENCES Artistas(id),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id) ON DELETE CASCADE
);

CREATE TABLE Usuario_Historico(
	usuario_id INT NOT NULL,
    musica_id INT NOT NULL,
    PRIMARY KEY (usuario_id, musica_id),
    FOREIGN KEY (musica_id) REFERENCES Musicas(id),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id) ON DELETE CASCADE
);

INSERT INTO Artistas (nome)
VALUES
	('Walter Phoenix'),
    ('Freedie Shannon'),
    ('Lance Day'),
    ('Peter Strong');
    
INSERT INTO Albuns (nome, artista_id)
VALUES
	('Envious', 1),
    ('Exuberant', 1),
    ('Hallowed Steam', 4),
    ('Incandescent', 3),
    ('Temporary Culture', 2);
    
INSERT INTO Planos (nome, valor)
VALUES
	('gratuito', 0),
    ('familiar', 7.99),
	('universitário', 5.99);
    
INSERT INTO Usuarios (nome, idade, plano_id)
VALUES
	('Thati', 23, 1),
    ('Cintia', 35, 2),
    ('Bill', 20, 3),
    ('Roger', 45, 1);

INSERT INTO Musicas (nome, artista_id, album_id)
VALUES
	('Celebration Of More', 3, 4),
    ('Dance With Her Own', 1, 1),
    ('Diamond Power', 3, 4),
	('Fantasy For Me', 3, 4),
	('Home Forever', 3, 4),
	('Honey, Let\'s Be Silly', 3, 4),
	('Honey, So Do I', 4, 2),
	('Magic Circus', 4, 3),
	('Reflections Of Magic', 1, 1),
	('Rock His Everything', 3, 4),
	('She Knows', 4, 3),
	('Soul For Us', 1, 1),
	('Sweetie, Let\'s Go Wild', 4, 2),
	('Thang Of Thunder', 2, 5),
	('Time Fireworks', 1, 2),
	('Troubles Of My Inner Fire', 1, 2),
	('Without My Streets', 2, 5),
	('Words Of Her Life', 2, 5);

INSERT INTO Usuario_Artista (usuario_id, artista_id)
VALUES
	(1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 4),
    (3, 1),
    (4, 2);
    
INSERT INTO Usuario_Historico (usuario_id, musica_id)
VALUES
	(1, 12),
	(1, 8),
	(1, 3),
	(1, 14),
	(2, 5),
	(2, 18),
	(2, 9),
	(2, 6),
	(3, 16),
	(3, 14),
	(3, 8),
	(4, 2),
	(4, 17),
	(4, 1);
