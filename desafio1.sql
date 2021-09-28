CREATE DATABASE SpotifyClone;
USE SpotifyClone;
DROP TABLE IF EXISTS planos;
CREATE TABLE plano (
    id_plano INT AUTO_INCREMENT PRIMARY KEY,
    plano VARCHAR(45),
    valor DEC(3 , 2 )
)  ENGINE=INNODB;

INSERT INTO planos(plano, valor) VALUES 
('gratuito', 0.00), 
('familiar', 7.99), 
('universitário', 5.99);
DROP TABLE IF EXISTS usuario;
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(45),
    idade INT,
    id_plano INT,
    FOREIGN KEY (id_plano)
        REFERENCES planos (id_plano)
)  ENGINE=INNODB;
INSERT INTO usuario(usuario, idade, id_plano) VALUES 
('Thati', 23, 1), 
('Cintia', 35, 2), 
('Bill', 20, 3), 
('Roger', 45, 1);

DROP TABLE IF EXISTS artista;
CREATE TABLE artista (
    id_artista
INT 
    AUTO_INCREMENT
PRIMARY KEY,
    artista VARCHAR(45)
)   ENGINE=INNODB;

CREATE FULLTEXT INDEX index_artista ON artista(artista);

INSERT INTO artista(artista) VALUES 
('Walter Phoenix'), 
('Peter Strong'), 
('Lance Day'), 
('Freedie Shannon');

DROP TABLE IF EXISTS albuns;
CREATE TABLE albuns (
    id_album INT AUTO_INCREMENT PRIMARY KEY,
    album VARCHAR(45),
    id_artista INT,
    FOREIGN KEY (id_artista)
        REFERENCES artistas (id_artista)
)  ENGINE=INNODB;

INSERT INTO albuns(album, id_artista) VALUES 
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

DROP TABLE IF EXISTS musicas;
CREATE TABLE musica (
    id_musica INT AUTO_INCREMENT PRIMARY KEY,
    musica VARCHAR(45),
    id_album INT,
    FOREIGN KEY (id_album)
        REFERENCES albuns (id_album)
)  ENGINE=INNODB;

INSERT INTO musica(musica, id_album) VALUES
('Soul For Us', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 2),
('Time Fireworks', 2),
('Magic Circus', 3),
('Honey, So Do I', 3),
("Sweetie, Let's Go Wild", 3),
('She Knows', 3),
('Fantasy For Me', 4),
('Celebration Of More', 4),
('Rock His Everything', 4),
('Home Forever', 4),
('Diamond Power', 4),
("Honey, Let's Be Silly", 4),
('Thang Of Thunder', 5),
('Words Of Her Life', 5),
('Without My Streets', 5);

DROP TABLE IF EXISTS seguidos_artista;
CREATE TABLE seguidos_artista (
    id_usuario INT,
    id_artista INT,
    CONSTRAINT PRIMARY KEY (id_usuario, id_artista),
    FOREIGN KEY (id_usuario)
        REFERENCES usuarios (id_usuario),
    FOREIGN KEY (id_artista)
        REFERENCES artistas (id_artista)
)  ENGINE=INNODB;

INSERT INTO seguidos_artista VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

DROP TABLE IF EXISTS historico_musicas;
CREATE TABLE historico_musicas (
    id_usuario INT,
    id_musica INT,
    CONSTRAINT PRIMARY KEY (id_usuario, id_musica),
    FOREIGN KEY (id_usuario)
        REFERENCES usuarios (id_usuario),
    FOREIGN KEY (id_musica)
        REFERENCES musicas (id_musica)
)  ENGINE=INNODB;

INSERT INTO historico_musicas VALUES
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
