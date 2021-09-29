DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plano (
  plano_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  plano VARCHAR(25) NOT NULL,
  valor VARCHAR(45) NOT NULL,
  PRIMARY KEY (plano_id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE usuario (
  usuario_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  usuario VARCHAR(20) NOT NULL,
  idade INT UNSIGNED NOT NULL,
  plano_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (usuario_id),
  INDEX fk_usuario_idx (plano_id ASC) VISIBLE,
  CONSTRAINT fk_usuario_plano
    FOREIGN KEY (plano_id)
    REFERENCES SpotifyClone.plano (plano_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE artista (
  artista_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  artista VARCHAR(25) NOT NULL,
  PRIMARY KEY (artista_id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE album (
  album_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  album VARCHAR(45) NOT NULL,
  artista_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (album_id),
  INDEX fk_album_idx (artista_id ASC) VISIBLE,
  CONSTRAINT fk_album
    FOREIGN KEY (artista_id)
    REFERENCES SpotifyClone.artista (artista_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE cancao (
  cancao_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  cancao VARCHAR(45) NULL,
  album_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (cancao_id),
  INDEX fk_cancao_idx (album_id ASC) VISIBLE,
  CONSTRAINT fk_cancao
    FOREIGN KEY (album_id)
    REFERENCES SpotifyClone.album (album_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE usuario_artista (
  usuario_id INT UNSIGNED NOT NULL,
  artista_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (usuario_id, artista_id),
  INDEX fk_usuario_artista_artista_idx (artista_id ASC) VISIBLE,
  INDEX fk_usuario_artista_usuario_idx (usuario_id ASC) VISIBLE,
  CONSTRAINT fk_usuario_artista_usuario
    FOREIGN KEY (usuario_id)
    REFERENCES SpotifyClone.usuario (usuario_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_usuario_artista_artista
    FOREIGN KEY (artista_id)
    REFERENCES SpotifyClone.artista (artista_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE usuario_cancao (
  usuario_id INT UNSIGNED NOT NULL,
  cancao_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (usuario_id, cancao_id),
  INDEX fk_usuario_cancao_cancao_idx (cancao_id ASC) VISIBLE,
  INDEX fk_usuario_cancao_usuario_idx (usuario_id ASC) VISIBLE,
  CONSTRAINT fk_usuario_cancao_usuario
    FOREIGN KEY (usuario_id)
    REFERENCES SpotifyClone.usuario (usuario_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_usuario_cancao_cancao
    FOREIGN KEY (cancao_id)
    REFERENCES SpotifyClone.cancao (cancao_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO plano (plano_id, plano, valor)
VALUES
(1, 'gratuito', 0),
(2, 'universitario', 5.99),
(3, 'familiar', 7.99);

INSERT INTO usuario (usuario_id, usuario, idade, plano_id)
VALUES
(1, 'Thati', 23, 1),
(2, 'Cinthia', 35, 3),
(3, 'Bill', 20, 2),
(4, 'Roger', 45, 1);

INSERT INTO artista (artista_id, artista)
VALUES
(1, 'Walter Phoenix'),
(2, 'Peter Strong'),
(3, 'Lance Day'),
(4, 'Freedie Shannon');

INSERT INTO album (album_id, album, artista_id)
VALUES
(1, 'Envious', 1),
(2, 'Exuberant', 1),
(3, 'Hallowed Steam', 2),
(4, 'Incandescent', 3),
(5, 'Temporary Culture', 4);

INSERT INTO cancao (cancao_id, cancao, album_id)
VALUES 
(1, 'Soul For Us', 1),
(2, 'Reflections Of Magic', 1),
(3, 'Dance With Her Own', 1),
(4, 'Troubles Of My Inner Fire', 2),
(5, 'Time Fireworks', 2),
(6, 'Magic Circus', 3),
(7, 'Honey, So Do I', 3),
(8, 'Sweetie Let\'s Go Wild', 3),
(9, 'She Knows', 3),
(10, 'Fantasy For Me', 4),
(11, 'Celebration Of More', 4),
(12, 'Rock His Everything', 4),
(13, 'Home Forever', 4),
(14, 'Diamond Power', 4),
(15, 'Honey, Let\'s Be Silly', 4),
(16, 'Thang Of Thunder', 5),
(17, 'Words Of Her Life', 5),
(18, 'Without My Streets', 5);

INSERT INTO usuario_artista (usuario_id, artista_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

INSERT INTO usuario_cancao (usuario_id, cancao_id)
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
