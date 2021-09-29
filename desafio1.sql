DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE Planos(
plano_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
plano VARCHAR(45),
valor DECIMAL(3,2)
);

CREATE TABLE Artista(
artista_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
artista VARCHAR(100)
);

CREATE TABLE Album(
album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(100),
artista_id INT NOT NULL,
FOREIGN KEY(artista_id) REFERENCES SpotifyClone.Artista (artista_id)
);

CREATE TABLE Usuario(
usuario_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
usuario VARCHAR(50),
idade INT,
plano_id INT NOT NULL,
FOREIGN KEY (plano_id) REFERENCES SpotifyClone.Planos (plano_id)
);

CREATE TABLE Musicas(
musica_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
musica VARCHAR(100),
album_id INT NOT NULL,
artista_id INT NOT NULL,
FOREIGN KEY(album_id) REFERENCES SpotifyClone.Album (album_id),
FOREIGN KEY(artista_id) REFERENCES SpotifyClone.Artista (artista_id)
);

CREATE TABLE Historico_de_reproducao(
usuario_id INT NOT NULL,
musica_id INT NOT NULL,
PRIMARY KEY (musica_id, usuario_id),
FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.Usuario (usuario_id),
FOREIGN KEY (musica_id) REFERENCES SpotifyClone.Musicas (musica_id)
);

CREATE TABLE Seguindo_artista(
usuario_id INT NOT NULL,
artista_id INT NOT NULL,
PRIMARY KEY (usuario_id, artista_id),
FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.Usuario (usuario_id),
FOREIGN KEY (artista_id) REFERENCES SpotifyClone.Artista (artista_id)
);

INSERT INTO Planos(plano_id, plano, valor)
VALUES(1, 'gratuito', 0),
(2, 'familiar', 7.99),
(3,'universitario', 5.99);

INSERT INTO Artista(artista_id, artista)
VALUES(1, 'Walter Phoenix'),
(2, 'Peter Strong'),
(3, 'Lance Day'),
(4, 'Freedie Shannon');

INSERT INTO Album(album_id, titulo, artista_id)
VALUES(1,'Envious', 1),
(2, 'Exuberant', 1),
(3, 'Hallowed Steam', 2),
(4, 'Incandescent', 3),
(5, 'Temporary Culture', 4);

INSERT INTO Usuario(usuario_id, usuario, idade, plano_id)
VALUES(1, 'Thati', 23 , 1),
(2, 'Cintia', 35, 2),
(3, 'Bill', 20, 3),
(4, 'Roger',45 , 1);

INSERT INTO Musicas(musica_id, musica, album_id, artista_id)
VALUES(1,"Soul For Us", 1, 1),
(2, "Reflections Of Magic", 1, 1),
(3, "Dance With Her Own", 1, 1),
(4, "Troubles Of My Inner Fire", 2, 1),
(5, "Time Fireworks", 2, 1),
(6, "Magic Circus", 3, 2),
(7, "Honey, So Do I", 3, 2),
(8, "Sweetie, Let's Go Wild", 3, 2),
(9, "She Knows", 3, 2),
(10, "Fantasy For Me", 4, 3),
(11, "Celebration Of More", 4, 3),
(12, "Rock His Everything", 4, 3),
(13, "Home Forever", 4, 3),
(14, "Diamond Power", 4, 3),
(15, "Honey, Let's Be Silly", 4, 3),
(16, "Thang Of Thunder", 5, 4),
(17, "Words Of Her Life", 5, 4),
(18, "Without My Streets", 5, 4);

INSERT INTO Historico_de_reproducao(usuario_id, musica_id)
VALUES(1, 1),
(1, 6),
(1, 14),
(1, 16),
(2, 7),
(2, 17),
(2, 2),
(2, 15),
(3, 4),
(3, 16),
(3, 6),
(4, 3),
(4, 18),
(4, 11);

INSERT INTO Seguindo_artista(usuario_id, artista_id)
VALUES(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);
