DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE Plano(
plano_id INT PRIMARY KEY AUTO_INCREMENT,
plano_nome VARCHAR(15) NOT NULL,
plano_preco DECIMAL(5,2) NOT NULL
) engine = InnoDB;

CREATE TABLE Usuario(
usuario_id INT PRIMARY KEY AUTO_INCREMENT,
usuario_nome VARCHAR(50) NOT NULL,
usuario_idade INT NOT NULL,
plano_id INT,
FOREIGN KEY (plano_id) REFERENCES Plano (plano_id)
) engine = InnoDB;

CREATE TABLE Artista(
artista_id INT PRIMARY KEY AUTO_INCREMENT,
artista_nome VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE Album(
album_id INT PRIMARY KEY AUTO_INCREMENT,
album_nome VARCHAR(50) NOT NULL,
artista_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES Artista (artista_id)
) engine = InnoDB;

CREATE TABLE Musica(
musica_id INT PRIMARY KEY AUTO_INCREMENT,
musica_nome VARCHAR(50) NOT NULL,
artista_id INT NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY (artista_id) REFERENCES Artista (artista_id),
FOREIGN KEY (album_id) REFERENCES Album (album_id)
) engine = InnoDB;

CREATE TABLE Seguindo(
usuario_id INT NOT NULL,
artista_id INT NOT NULL,
CONSTRAINT P  RIMARY KEY (usuario_id, artista_id),
FOREIGN KEY (usuario_id) REFERENCES Usuario (usuario_id),
FOREIGN KEY (artista_id) REFERENCES Artista (artista_id)
) engine = InnoDB;

CREATE TABLE Historico(
usuario_id INT NOT NULL,
musica_id INT NOT NULL,
CONSTRAINT PRIMARY KEY (usuario_id, musica_id),
FOREIGN KEY (usuario_id) REFERENCES Usuario (usuario_id),
FOREIGN KEY (musica_id) REFERENCES Musica (musica_id)
) engine = InnoDB;

INSERT INTO Plano (plano_nome, plano_preco)
VALUES
('gratuito', 0),
('universitário', 5.99),
('familiar', 7.99);

INSERT INTO Usuario (usuario_nome, usuario_idade, plano_id)
VALUES
('Thati', 23, 1),
('Cintia', 35, 3),
('Bill', 20, 2),
('Roger', 45, 1);

INSERT INTO Artista (artista_nome)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');
  
INSERT INTO Album (album_nome, artista_id)
VALUES
('Envious', 1),
('Exuberant',	1),
('Hallowed Steam',	2),
('Incandescent', 3),
('Temporary Culture', 4);
    
INSERT INTO Musica (musica_nome, artista_id, album_id)
VALUES
('Soul For Us', 1, 1),
('Reflections Of Magic', 1, 1),
('Dance With Her Own', 1, 1),
('Troubles Of My Inner Fire', 1, 2),
('Time Fireworks', 1, 2),
('Magic Circus', 2, 3),
('Honey, So Do I', 2, 3),
('Sweetie, Let"s Go Wild', 2, 3),
('She Knows', 2, 3),
('Fantasy For Me', 3, 4),
('Celebration Of More', 3, 4),
('Rock His Everything', 3, 4),
('Home Forever', 3, 4),
('Diamond Power', 3, 4),
('Honey, Let"s Be Silly', 3, 4),
('Thang Of Thunder', 4, 5),
('Words Of Her Life', 4, 5),
('Without My Streets', 4, 5);
    
INSERT INTO Seguindo (usuario_id, artista_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);
  
INSERT INTO Historico (usuario_id, musica_id)
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
(4, 11)
