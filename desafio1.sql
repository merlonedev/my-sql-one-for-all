DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plano(
    id INT NOT NULL AUTO_INCREMENT,
    plano varchar(45) NOT NULL,
    valor_plano DECIMAL(3,2),
    PRIMARY KEY(id)
) engine = InnoDB;

INSERT INTO plano (plano, valor_plano)
VALUES
  ('Gratuito', 0.00 ),
  ('Universitário', 5.99 ),
  ('Familiar', 7.99);

CREATE TABLE user(
    id INT NOT NULL AUTO_INCREMENT,
    usuario VARCHAR(45) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(plano_id) REFERENCES plano (id)
) engine = InnoDB;

INSERT INTO user (usuario, idade, plano_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 3),
  ('Bill', 20, 2),
  ('Roger', 45, 1);

CREATE TABLE artista(
    id INT NOT NULL AUTO_INCREMENT,
    artista VARCHAR(45), 
    PRIMARY KEY (id)
) engine = InnoDB;

INSERT INTO artista (artista)
VALUES
    ('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon');

CREATE TABLE album(
    id INT NOT NULL AUTO_INCREMENT,
    album VARCHAR(45) NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(artista_id) REFERENCES artista(id)
) engine = InnoDB;

INSERT INTO album (album, artista_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

CREATE TABLE cancoes(
    id INT NOT NULL AUTO_INCREMENT,
    cancao VARCHAR(50),
    album_id INT NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (album_id) REFERENCES album (id), 
    FOREIGN KEY (artista_id) REFERENCES artista (id)
) engine = InnoDB;

INSERT INTO cancoes (cancao, album_id, artista_id)
VALUES
    ('Soul For Us', 1, 1),
    ('Reflections Of Magic', 1, 1),
    ('Dance With Her Own', 1, 1),
    ('Troubles Of My Inner Fire', 2,	1),
    ('Time Fireworks', 2, 1),
    ('Magic Circus',	3, 2),
    ('Honey, So Do I', 3, 2),
    ('Sweetie, Let’s Go Wild',	3, 2),
    ('She Knows', 3,	2),
    ('Fantasy For Me', 4, 3),
    ('Celebration Of More', 4, 3),
    ('Rock His Everything', 4, 3),
    ('Home Forever', 4,	3),
    ('Diamond Power', 4,	3),
    ("Honey, Let's Be Silly", 4, 3),
    ('Thang Of Thunder',	5, 4),
    ('Words Of Her Life', 5,	4),
    ('Without My Streets', 5, 4);

CREATE TABLE seguindo(
    user_id INT NOT NULL,
    artista_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (user_id, artista_id),
    FOREIGN KEY(user_id) REFERENCES user(id),
    FOREIGN KEY(artista_id) REFERENCES artista(id)
) engine = InnoDB;

INSERT INTO seguindo (user_id, artista_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);

CREATE TABLE historico(
    user_id INT NOT NULL,
    cancoes_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (user_id, cancoes_id),
    FOREIGN KEY(user_id) REFERENCES user(id),
    FOREIGN KEY(cancoes_id) REFERENCES cancoes(id)
) engine = InnoDB;

INSERT INTO historico (user_id, cancoes_id)
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
