CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;
-- CRIANDO TABELA planos
CREATE TABLE planos (
    plano_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    valor DECIMAL(3,2) NOT NULL
) engine = InnoDB;
-- CRIANDO TABELA usuarios
CREATE TABLE usuarios (
    usuario_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
) engine = InnoDB;
-- CRIANDO TABELA artistas
CREATE TABLE artistas (
    artista_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
    -- album_id INT,
--     FOREIGN KEY (album_id) REFERENCES albuns(album_id)
) engine = InnoDB;
-- CRIANDO TABELA albuns
CREATE TABLE albuns (
    album_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;
-- CRIANDO TABELA cancoes
CREATE TABLE cancoes (
    cancao_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    album_id INT NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albuns(album_id),
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;
-- CRIANDO TABELA usuario_cancoes
CREATE TABLE usuario_cancoes (
    usuario_id INT NOT NULL,
    cancao_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id),
    CONSTRAINT PRIMARY KEY(usuario_id, cancao_id)
) engine = InnoDB;
-- CRIANDO TABELA usuario_artistas
CREATE TABLE usuario_artistas (
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id),
    CONSTRAINT PRIMARY KEY(usuario_id, artista_id)
) engine = InnoDB;
-- POPULANDO TABELA PLANOS
INSERT INTO planos(nome, valor) VALUES('gratuito', 0);
INSERT INTO planos(nome, valor) VALUES ('universitário', 5.99);
INSERT INTO planos(nome, valor) VALUES('familiar', 7.99);
-- POPULANDO TABELA USUARIOS
INSERT INTO usuarios(nome, idade, plano_id) VALUES('Thati', 23, 1);
INSERT INTO usuarios(nome, idade, plano_id) VALUES ('Cintia', 35, 3);
INSERT INTO usuarios(nome, idade, plano_id) VALUES('Bill', 20, 2);
INSERT INTO usuarios(nome, idade, plano_id) VALUES('Roger', 45, 1);
-- POPULANDO TABELA ARTISTAS
INSERT INTO artistas(nome) VALUES('Walter Phoenix');
INSERT INTO artistas(nome) VALUES('Peter Strong');
INSERT INTO artistas(nome) VALUES('Lance Day');
INSERT INTO artistas(nome) VALUES('Freedie Shannon');
-- POPULANDO TABELA ALBUNS
INSERT INTO albuns(nome, artista_id) VALUES('Envious', 1);
INSERT INTO albuns(nome, artista_id) VALUES('Exuberant', 1);
INSERT INTO albuns(nome, artista_id) VALUES('Hallowed Steam', 2);
INSERT INTO albuns(nome, artista_id) VALUES('Incandescent', 3);
INSERT INTO albuns(nome, artista_id) VALUES('Temporary Culture', 4);
-- POPULANDO TABELA CANCOES
INSERT INTO cancoes(nome, album_id, artista_id) VALUES('Soul For Us', 1, 1);
INSERT INTO cancoes(nome, album_id, artista_id) VALUES('Reflections Of Magic', 1, 1);
INSERT INTO cancoes(nome, album_id, artista_id) VALUES('Dance With Her Own', 1, 1);
INSERT INTO cancoes(nome, album_id, artista_id) VALUES('Troubles Of My Inner Fire', 2, 1);
INSERT INTO cancoes(nome, album_id, artista_id) VALUES('Time Fireworks', 2, 1);
INSERT INTO cancoes(nome, album_id, artista_id) VALUES('Magic Circus', 3, 2);
INSERT INTO cancoes(nome, album_id, artista_id) VALUES('Honey, So Do I', 3, 2);
INSERT INTO cancoes(nome, album_id, artista_id) VALUES("Sweetie, Let's Go Wild", 3, 2);
INSERT INTO cancoes(nome, album_id, artista_id) VALUES('She Knows', 3, 2);
INSERT INTO cancoes(nome, album_id, artista_id) VALUES('Fantasy For Me', 3, 3);
INSERT INTO cancoes(nome, album_id, artista_id) VALUES('Celebration Of More', 3, 3);
INSERT INTO cancoes(nome, album_id, artista_id) VALUES('Rock His Everything', 3, 3);
INSERT INTO cancoes(nome, album_id, artista_id) VALUES('Home Forever', 3, 3);
INSERT INTO cancoes(nome, album_id, artista_id) VALUES('Diamond Power', 3, 3);
INSERT INTO cancoes(nome, album_id, artista_id) VALUES("Honey, Let's Be Silly", 3, 3);
INSERT INTO cancoes(nome, album_id, artista_id) VALUES('Thang Of Thunder', 5, 4);
INSERT INTO cancoes(nome, album_id, artista_id) VALUES('Words Of Her Life', 5, 4);
INSERT INTO cancoes(nome, album_id, artista_id) VALUES('Without My Streets', 5, 4);
-- POPULANDO TABELA USUARIO_CANCOES USUARIO 1
INSERT INTO usuario_cancoes(usuario_id, cancao_id) VALUES(1, 1);
INSERT INTO usuario_cancoes(usuario_id, cancao_id) VALUES(1, 6);
INSERT INTO usuario_cancoes(usuario_id, cancao_id) VALUES(1, 14);
INSERT INTO usuario_cancoes(usuario_id, cancao_id) VALUES(1, 16);
-- POPULANDO TABELA USUARIO_CANCOES USUARIO 2
INSERT INTO usuario_cancoes(usuario_id, cancao_id) VALUES(2, 13);
INSERT INTO usuario_cancoes(usuario_id, cancao_id) VALUES(2, 17);
INSERT INTO usuario_cancoes(usuario_id, cancao_id) VALUES(2, 2);
INSERT INTO usuario_cancoes(usuario_id, cancao_id) VALUES(2, 15);
-- POPULANDO TABELA USUARIO_CANCOES USUARIO 3
INSERT INTO usuario_cancoes(usuario_id, cancao_id) VALUES(3, 4);
INSERT INTO usuario_cancoes(usuario_id, cancao_id) VALUES(3, 16);
INSERT INTO usuario_cancoes(usuario_id, cancao_id) VALUES(3, 6);
-- POPULANDO TABELA USUARIO_CANCOES USUARIO 4
INSERT INTO usuario_cancoes(usuario_id, cancao_id) VALUES(4, 3);
INSERT INTO usuario_cancoes(usuario_id, cancao_id) VALUES(4, 18);
INSERT INTO usuario_cancoes(usuario_id, cancao_id) VALUES(4, 11);
-- POPULANDO TABELA USUARIO_ARTISTA USUARIO 1
INSERT INTO usuario_artistas(usuario_id, artista_id) VALUES(1, 1);
INSERT INTO usuario_artistas(usuario_id, artista_id) VALUES(1, 4);
INSERT INTO usuario_artistas(usuario_id, artista_id) VALUES(1, 3);
-- POPULANDO TABELA USUARIO_ARTISTA USUARIO 2
INSERT INTO usuario_artistas(usuario_id, artista_id) VALUES(2, 1);
INSERT INTO usuario_artistas(usuario_id, artista_id) VALUES(2, 3);
-- POPULANDO TABELA USUARIO_ARTISTA USUARIO 3
INSERT INTO usuario_artistas(usuario_id, artista_id) VALUES(3, 2);
INSERT INTO usuario_artistas(usuario_id, artista_id) VALUES(3, 1);
-- POPULANDO TABELA USUARIO_ARTISTA USUARIO 4
INSERT INTO usuario_artistas(usuario_id, artista_id) VALUES(4, 4);
