DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE SpotifyClone.plano(
plano_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
plano_valor DECIMAL(4,2)
) engine = InnoDB;

INSERT INTO SpotifyClone.plano(nome, plano_valor)
VALUES
("Gratuito", 0.00),
("Universitário", 5.99),
("Familiar", 7.99);

CREATE TABLE SpotifyClone.usuario(
usuario_id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
idade INT NOT NULL,
plano_id INT NOT NULL,
FOREIGN KEY (plano_id) REFERENCES plano(plano_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.usuario(nome, idade, plano_id)
VALUES
("Thati", 23, 1),
("Cintia", 35, 2),
("Bill", 20, 3),
("Roger", 45, 1);

CREATE TABLE SpotifyClone.artista(
artista_id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL
) engine = InnoDB;

INSERT INTO SpotifyClone.artista(nome)
VALUES
("Walter Phoenix"),
("Peter Strong"),
("Lance Day"),
("Freedie Shannon");

CREATE TABLE SpotifyClone.album(
album_id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
artista_id INT NOT NULL,
FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.album(nome, artista_id)
VALUES
("Envious", 1),
("Exuberant", 1),
("Hallowed Steam", 2),
("Incandescent", 3),
("Temporary Culture", 4);

CREATE TABLE SpotifyClone.musica(
musica_id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
album_id INT NOT NULL,
artista_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES album(album_id),
FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.musica (nome, album_id, artista_id)
VALUES
("Soul For Us", 1, 1),
("Reflections Of Magic", 1, 1),
("Dance With Her Own", 1, 1),
("Troubles Of My Inner Fire", 2, 1),
("Time Fireworks", 2, 1),
("Magic Circus", 3, 2),
("Honey, So Do I", 3, 2),
("Sweetie, Let’s Go Wild",	3, 2),
("She Knows", 3, 2),
("Fantasy For Me", 4, 3),
("Celebration Of More", 4, 3),
("Rock His Everything", 4, 3),
("Home Forever", 4,	3),
("Diamond Power", 4, 3),
("Honey, Let's Be Silly", 4, 3),
("Thang Of Thunder", 5, 4),
("Words Of Her Life", 5, 4),
("Without My Streets", 5, 4);

CREATE TABLE SpotifyClone.hist_rep(
usuario_id INT NOT NULL,
musica_id INT NOT NULL,
CONSTRAINT PRIMARY KEY(usuario_id, musica_id),
FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
FOREIGN KEY (musica_id) REFERENCES musica(musica_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.hist_rep(usuario_id, musica_id)
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

CREATE TABLE SpotifyClone.follow(
usuario_id INT NOT NULL,
artista_id INT NOT NULL,
CONSTRAINT PRIMARY KEY (usuario_id, artista_id),
FOREIGN KEY(usuario_id) REFERENCES usuario(usuario_id),
FOREIGN KEY(artista_id) REFERENCES artista(artista_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.follow(usuario_id, artista_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);
