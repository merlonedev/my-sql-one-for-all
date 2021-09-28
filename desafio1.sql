DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
plano_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
plano_name VARCHAR(20) NOT NULL,
valor_plano DOUBLE NOT NULL
) engine = InnoDB;

CREATE TABLE users(
usuario_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
idade INT(11) NOT NULL,
plano_id INT(11) NOT NULL,
FOREIGN KEY (plano_id) REFERENCES planos (plano_id)
) engine = InnoDB;

CREATE TABLE artistas(
artista_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
artista_name VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE albums(
album_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
album_name VARCHAR(50) NOT NULL,
artista_id INT(11),
FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
) engine = InnoDB;

CREATE TABLE cancoes(
cancao_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
cancao_name VARCHAR(50) NOT NULL,
album_id INT(11),
artista_id INT(11),
FOREIGN KEY (album_id) REFERENCES albums (album_id),
FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
) engine = InnoDB;

CREATE TABLE historico_de_reproducoes(
usuario_id INT(11),
cancao_id INT(11),
FOREIGN KEY (usuario_id) REFERENCES users (usuario_id),
FOREIGN KEY (cancao_id) REFERENCES cancoes (cancao_id),
CONSTRAINT PRIMARY KEY(usuario_id, cancao_id)
) engine = InnoDB;

CREATE TABLE seguindo_artistas(
usuario_id INT(11),
artista_id INT(11),
FOREIGN KEY (usuario_id) REFERENCES users (usuario_id),
FOREIGN KEY (artista_id) REFERENCES artistas (artista_id),
CONSTRAINT PRIMARY KEY(usuario_id, artista_id)
) engine = InnoDB;

INSERT INTO planos (plano_name, valor_plano)
VALUES ('gratuito', 0.00),
('familiar', 7.99),
('universitário', '5.99');

INSERT INTO users (name, idade, plano_id)
VALUES ('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO artistas (artista_name)
VALUES ('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO albums(album_name, artista_id)
VALUES ("Envious", 1),
("Exuberant", 1),
("Hallowed Steam", 2),
("Incandescent", 3),
("Temporary Culture", 4);

INSERT INTO cancoes(cancao_name, artista_id, album_id)
VALUES ("Soul For Us", 1, 1),
("Reflections Of Magic", 1, 1),
("Dance With Her Own", 1, 1),
("Troubles Of My Inner Fire", 1, 2),
("Time Fireworks", 1, 2),
("Magic Circus", 2, 3),
("Honey, So Do I", 2, 3),
("Sweetie, Let's Go Wild", 2, 3),
("She Knows", 2, 3),
("Fantasy For Me", 3, 4),
("Celebration Of More", 3, 4),
("Rock His Everything", 3, 4),
("Home Forever", 3, 4),
("Diamond Power", 3, 4),
("Honey, Let's Be Silly", 3, 4),
("Thang Of Thunder", 4, 5),
("Words Of Her Life", 4, 5),
("Without My Streets", 4, 5);

INSERT INTO seguindo_artistas(usuario_id, artista_id)
VALUES (1, 1),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(3, 1),
(3, 2),
(4, 4);

INSERT INTO historico_de_reproducoes(usuario_id, cancao_id)
VALUES (1, 1),
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
