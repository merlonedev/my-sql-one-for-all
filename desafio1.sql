DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos (
plano_id INT PRIMARY KEY AUTO_INCREMENT,
tipo VARCHAR(100) NOT NULL,
valor DECIMAL(13,2)
) ENGINE=INNODB;

CREATE TABLE usuarios (
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id)
        REFERENCES planos (plano_id)
)  ENGINE=INNODB;

CREATE TABLE artistas (
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    artista_nome VARCHAR(100) NOT NULL    
)  ENGINE=INNODB;

CREATE TABLE album (
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_nome VARCHAR(100) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id)
        REFERENCES artistas (artista_id)
)  ENGINE=INNODB;

CREATE TABLE musicas (
    musica_id INT PRIMARY KEY AUTO_INCREMENT,
    musica_nome VARCHAR(100) NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES album (album_id)
)  ENGINE=INNODB;

CREATE TABLE reproducoes (
    usuario_id INT NOT NULL,
    musica_id INT NOT NULL,
    PRIMARY KEY (usuario_id , musica_id),
    FOREIGN KEY (usuario_id)
        REFERENCES usuarios (usuario_id),
    FOREIGN KEY (musica_id)
        REFERENCES musicas (musica_id)
)  ENGINE=INNODB;

CREATE TABLE artistas_seguidos (
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY (usuario_id, artista_id),
    FOREIGN KEY (usuario_id)
        REFERENCES usuarios (usuario_id),
    FOREIGN KEY (artista_id)
        REFERENCES artistas (artista_id)
)  ENGINE=INNODB;

INSERT INTO planos (tipo, valor) VALUES ('gratuito', 0);
INSERT INTO planos (tipo, valor) VALUES ('universitário', 5.99);
INSERT INTO planos (tipo, valor) VALUES ('familiar', 7.99);

INSERT INTO usuarios (usuario_nome, idade, plano_id) VALUES ('Thati', 23, 1);
INSERT INTO usuarios (usuario_nome, idade, plano_id) VALUES ('Cintia', 35, 3);
INSERT INTO usuarios (usuario_nome, idade, plano_id) VALUES ('Bill', 20, 2);
INSERT INTO usuarios (usuario_nome, idade, plano_id) VALUES ('Roger', 45, 1);

INSERT INTO artistas (artista_nome) VALUES('Freedie Shannon');
INSERT INTO artistas (artista_nome) VALUES('Lance Day');
INSERT INTO artistas (artista_nome) VALUES('Peter Strong');
INSERT INTO artistas (artista_nome) VALUES('Walter Phoenix');

INSERT INTO album (album_nome, artista_id) VALUES ('Envious', 4);
INSERT INTO album (album_nome, artista_id) VALUES ('Exuberant', 4); 
INSERT INTO album (album_nome, artista_id) VALUES ('Hallowed Steam', 3);
INSERT INTO album (album_nome, artista_id) VALUES ('Incandescent', 2);
INSERT INTO album (album_nome, artista_id) VALUES ('Temporary Culture', 1);

INSERT INTO musicas (musica_nome, album_id) VALUES ('Soul For Us', 1);
INSERT INTO musicas (musica_nome, album_id) VALUES ('Reflections Of Magic', 1);
INSERT INTO musicas (musica_nome, album_id) VALUES ('Dance With Her Own', 1);

INSERT INTO musicas (musica_nome, album_id) VALUES ('Troubles Of My Inner Fire', 2);
INSERT INTO musicas (musica_nome, album_id) VALUES ('Time Fireworks', 2);

INSERT INTO musicas (musica_nome, album_id) VALUES ('Magic Circus', 3);
INSERT INTO musicas (musica_nome, album_id) VALUES ('Honey, So Do I', 3);
INSERT INTO musicas (musica_nome, album_id) VALUES ('Sweetie, Let\'s Go Wild', 3);
INSERT INTO musicas (musica_nome, album_id) VALUES ('She Knows', 3);

INSERT INTO musicas (musica_nome, album_id) VALUES ('Fantasy For Me', 4);
INSERT INTO musicas (musica_nome, album_id) VALUES ('Celebration Of More', 4);
INSERT INTO musicas (musica_nome, album_id) VALUES ('Rock His Everything', 4);
INSERT INTO musicas (musica_nome, album_id) VALUES ('Home Forever', 4);
INSERT INTO musicas (musica_nome, album_id) VALUES ('Diamond Power', 4);
INSERT INTO musicas (musica_nome, album_id) VALUES ('Honey, Let\'s Be Silly', 4);

INSERT INTO musicas (musica_nome, album_id) VALUES ('Thang Of Thunder', 5);
INSERT INTO musicas (musica_nome, album_id) VALUES ('Words Of Her Life', 5);
INSERT INTO musicas (musica_nome, album_id) VALUES ('Without My Streets', 5);

INSERT INTO reproducoes (usuario_id, musica_id) VALUES (1, 1), (1, 6), (1, 14), (1, 16);
INSERT INTO reproducoes (usuario_id, musica_id) VALUES (2, 13), (2, 17), (2, 2), (2, 15);
INSERT INTO reproducoes (usuario_id, musica_id) VALUES (3, 4), (3, 16), (3, 6);
INSERT INTO reproducoes (usuario_id, musica_id) VALUES (4, 3), (4, 18), (4, 11);

INSERT INTO artistas_seguidos (usuario_id, artista_id) VALUES (1, 4), (1, 1), (1, 2);
INSERT INTO artistas_seguidos (usuario_id, artista_id) VALUES (2, 4), (2, 2);
INSERT INTO artistas_seguidos (usuario_id, artista_id) VALUES (3, 3), (3, 4);
INSERT INTO artistas_seguidos (usuario_id, artista_id) VALUES (4, 1);
