DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
    plano_id TINYINT PRIMARY KEY AUTO_INCREMENT,
    plano VARCHAR(15) NOT NULL,
    valor_plano DOUBLE NOT NULL
) engine = InnoDB;

CREATE TABLE usuarios(
    usuario_id TINYINT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(10) NOT NULL,
    idade TINYINT,
    plano_id TINYINT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
) engine = InnoDB;

CREATE TABLE artistas(
    artista_id TINYINT PRIMARY KEY AUTO_INCREMENT,
    artista VARCHAR(20) NOT NULL
) engine = InnoDB;

CREATE TABLE albuns(
    album_id TINYINT PRIMARY KEY AUTO_INCREMENT,
    album VARCHAR(20) NOT NULL,
    artista_id TINYINT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE cancoes(
    cancao_id TINYINT PRIMARY KEY AUTO_INCREMENT,
    cancao VARCHAR(40) NOT NULL,
    album_id TINYINT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albuns(album_id)
) engine = InnoDB;

CREATE TABLE cancoes_reproduzidas_usuario(
    usuario_id TINYINT,
    cancao_id TINYINT,
    PRIMARY KEY (usuario_id, cancao_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id)
) engine = InnoDB;

CREATE TABLE artistas_seguidos_usuario(
    usuario_id TINYINT,
    artista_id TINYINT,
    PRIMARY KEY (usuario_id, artista_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

INSERT INTO tabela1 (coluna1, coluna2)
VALUES
  ('exemplo de dados 1', 'exemplo de dados A'),
  ('exemplo de dados 2', 'exemplo de dados B'),
  ('exemplo de dados 3', 'exemplo de dados C');

INSERT INTO tabela2 (coluna1, coluna2)
VALUES
  ('exemplo de dados 1', 'exemplo de dados X'),
  ('exemplo de dados 2', 'exemplo de dados Y');
