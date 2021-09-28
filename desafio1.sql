CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE IF NOT EXISTS planos(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(20) NOT NULL,
valor DECIMAL(5, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS usuarios(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
idade INT NOT NULL,
plano_id INT NOT NULL,
FOREIGN KEY (plano_id) REFERENCES planos(id)
);

CREATE TABLE IF NOT EXISTS artistas(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS albuns(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
artista_id INT NOT NULL,
FOREIGN KEY (artista_id) REFERENCES artistas(id)
);

CREATE TABLE IF NOT EXISTS usuario_artista(
usuario_id INT NOT NULL,
artista_id INT NOT NULL,
FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
FOREIGN KEY (artista_id) REFERENCES artistas(id),
CONSTRAINT PRIMARY KEY (usuario_id, artista_id)
);

CREATE TABLE IF NOT EXISTS cancoes(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES albuns(id)
);

CREATE TABLE IF NOT EXISTS usuario_historico(
usuario_id INT NOT NULL,
cancao_id INT NOT NULL,
data_reproducao DATETIME NOT NULL,
FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
FOREIGN KEY (cancao_id) REFERENCES cancoes(id),
CONSTRAINT PRIMARY KEY (usuario_id, cancao_id)
);

INSERT INTO planos(nome, valor) VALUES
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

INSERT INTO usuarios(nome, idade, plano_id) VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO artistas(nome) VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO albuns(nome, artista_id) VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO usuario_artista(usuario_id, artista_id) VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(3, 1),
(3, 2),
(4, 4);

INSERT INTO cancoes(nome, album_id) VALUES
('Soul For Us', 1),
('Dance With Her Own', 1),
('Reflections Of Magic', 1),
('Troubles Of My Inner Fire', 2),
('Time Fireworks', 2),
('Magic Circus', 3),
('She Knows', 3),
('Sweetie, Let\'s Go Wild', 3),
('Honey, So Do I', 3),
('Fantasy For Me', 4),
('Honey, Let\'s Be Silly', 4),
('Diamond Power', 4),
('Home Forever', 4),
('Rock His Everything', 4),
('Celebration Of More', 4),
('Thang Of Thunder', 5),
('Without My Streets', 5),
('Words Of Her Life', 5);

INSERT INTO usuario_historico(usuario_id, cancao_id, data_reproducao) VALUES
(1, 1, NOW()),
(1, 6, NOW()),
(1, 12, NOW()),
(1, 16, NOW()),
(2, 13, NOW()),
(2, 18, NOW()),
(2, 3, NOW()),
(2, 11, NOW()),
(3, 4, NOW()),
(3, 16, NOW()),
(3, 6, NOW()),
(4, 2, NOW()),
(4, 17, NOW()),
(4, 15, NOW());
