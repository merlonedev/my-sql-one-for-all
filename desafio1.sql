DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos (
    plano_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(40) NOT NULL,
    valor DECIMAL(3, 2) NOT NULL
);

CREATE TABLE artistas (
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    artista_nome VARCHAR(60) NOT NULL
);

CREATE TABLE albuns (
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_titulo VARCHAR(50) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
);

CREATE TABLE cancoes (
    cancao_id INT PRIMARY KEY AUTO_INCREMENT,
    cancao_titulo VARCHAR(60) NOT NULL,
    album_id INT NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albuns (album_id),
    FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
);

CREATE TABLE usuarios (
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_nome VARCHAR(60) NOT NULL,
    usuario_idade INT NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES planos (plano_id)
);

CREATE TABLE histor_reprod (
    cancao_id INT,
    usuario_id INT,
    CONSTRAINT PRIMARY KEY(cancao_id, usuario_id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes (cancao_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id)
);

CREATE TABLE artistas_usuarios (
    artista_id INT,
    usuario_id INT,
    CONSTRAINT PRIMARY KEY(artista_id, usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artistas (artista_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id)
);

INSERT INTO planos
    (tipo, valor)
VALUES
    ('gratuito', 0),
    ('familiar', 7.99),
    ('universitário', 5.99);

INSERT INTO artistas
    (artista_nome)
VALUES
    ('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon');

INSERT INTO albuns
    (album_titulo, artista_id)
VALUES
    ('Envious', 1),
    ('Exuberant', 1),
    ('Hallowed Steam', 2),
    ('Incandescent', 3),
    ('Temporary Culture', 4);

INSERT INTO cancoes
    (cancao_titulo, album_id, artista_id)
VALUES
    ('Soul For Us', 1, 1),
    ('Reflections Of Magic', 1, 1),
    ('Dance With Her Own', 1, 1),
    ('Troubles Of My Inner Fire', 2, 1),
    ('Time Fireworks', 2, 1),
    ('Magic Circus', 3, 2),
    ('Honey, So Do I', 3, 2),
    ('Sweetie, Let\'s Go Wild', 3, 2),
    ('She Knows', 3, 2),
    ('Fantasy For Me', 4, 3),
    ('Celebration Of More', 4, 3),
    ('Rock His Everything', 4, 3),
    ('Home Forever', 4, 3),
    ('Diamond Power', 4, 3),
    ('Honey, Let\'s Be Silly', 4, 3),
    ('Thang Of Thunder', 5, 4),
    ('Words Of Her Life', 5, 4),
    ('Without My Streets', 5, 4);

INSERT INTO usuarios
    (usuario_nome, usuario_idade, plano_id)
VALUES
    ('Thati', 23, 1),
    ('Cintia', 35, 2),
    ('Bill', 20, 3),
    ('Roger', 45, 1);

INSERT INTO histor_reprod
    (cancao_id, usuario_id)
VALUES
    (1, 1),
    (6, 1),
    (14, 1),
    (16, 1),
    (13, 2),
    (17, 2),
    (2, 2),
    (15, 2),
    (4, 3),
    (16, 3),
    (6, 3),
    (3, 4),
    (18, 4),
    (11, 4);

INSERT INTO artistas_usuarios
    (artista_id, usuario_id)
VALUES
    (1, 1),
    (4, 1),
    (3, 1),
    (1, 2),
    (3, 2),
    (2, 3),
    (1, 3),
    (4, 4);
