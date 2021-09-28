DROP DATABASE IF EXISTS SpotifyClone;

CREATE SCHEMA SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
plano_id TINYINT PRIMARY KEY AUTO_INCREMENT,
tipo_plano VARCHAR(20) NOT NULL,
valor_plano DECIMAL(4,2)
);

CREATE TABLE artistas(
artista_id TINYINT PRIMARY KEY AUTO_INCREMENT,
nome_artista VARCHAR(50) NOT NULL
);

CREATE TABLE usuario(
usuario_id TINYINT PRIMARY KEY AUTO_INCREMENT,
usuario VARCHAR(50) NOT NULL,
idade INT NOT NULL,
plano_id TINYINT,
FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
);

CREATE TABLE seguindoArtistas(
usuario_id TINYINT,
artista_id TINYINT,
PRIMARY KEY (usuario_id, artista_id),
FOREIGN KEY (artista_id) REFERENCES artistas(artista_id),
FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
);

CREATE TABLE albuns(
album_id TINYINT PRIMARY KEY AUTO_INCREMENT,
artista_id TINYINT,
album_name VARCHAR(50) NOT NULL,
FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);

CREATE TABLE songs(
song_id TINYINT PRIMARY KEY AUTO_INCREMENT,
album_id TINYINT,
song_name VARCHAR(50) NOT NULL,
FOREIGN KEY (album_id) REFERENCES albuns(album_id)
);

CREATE TABLE historicoMusicas(
usuario_id TINYINT,
song_id TINYINT,
PRIMARY KEY (usuario_id, song_id),
FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

INSERT INTO planos(tipo_plano, valor_plano)
VALUES
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

INSERT INTO artistas(nome_artista)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO usuario(usuario, idade, plano_id)
VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO seguindoArtistas(usuario_id, artista_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

INSERT INTO albuns(album_name, artista_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO songs(album_id, song_name)
VALUES
(1, "Soul For Us"),
(1, "Reflections Of Magic"),
(1, "Dance With Her Own"),
(2, "Troubles Of My Inner Fire"),
(2, "Time Fireworks"),
(3, "Magic Circus"),
(3, "Honey, So Do I"),
(3, "Sweetie, Let’s Go Wild"),
(3, "She Knows"),
(4, "Fantasy For Me"),
(4, "Celebration Of More"),
(4, "Rock His Everything"),
(4, "Home Forever"),
(4, "Diamond Power"),
(4, "Honey, Let's Be Silly"),
(5, "Thang Of Thunder"),
(5, "Words Of Her Life"),
(5, "Without My Streets");

INSERT INTO historicoMusicas(usuario_id, song_id)
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
