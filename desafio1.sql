DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plano(
    id int auto_increment primary key,
    plano varchar(50) not null,
    valor double not null
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuario(
    id int auto_increment primary key,
    usuario varchar(50) not null,
    idade int not null,
    plano_id int not null,
    foreign key (plano_id) references SpotifyClone.plano (id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artista(
id int auto_increment primary key,
artista varchar(100) not null
);

CREATE TABLE SpotifyClone.album(
id int auto_increment primary key,
album varchar(100) not null,
artista_id int,
foreign key (artista_id) references SpotifyClone.artista (id)
);

CREATE TABLE SpotifyClone.cancao(
id int auto_increment primary key,
cancao varchar(100) not null,
album_id int,
foreign key (album_id) references SpotifyClone.album (id)
);

CREATE TABLE SpotifyClone.usuario_historico(
usuario_id int,
cancao_id int,
constraint primary key(usuario_id, cancao_id),
foreign key (usuario_id) references SpotifyClone.usuario (id),
foreign key (cancao_id) references SpotifyClone.cancao (id)
);

CREATE TABLE SpotifyClone.usuario_seguindo(
usuario_id int,
artista_id int,
constraint primary key(usuario_id, artista_id),
foreign key (usuario_id) references SpotifyClone.usuario (id),
foreign key (artista_id) references SpotifyClone.artista (id)
);

INSERT INTO SpotifyClone.plano (plano, valor)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO SpotifyClone.usuario (usuario, idade, plano_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);
  
INSERT INTO SpotifyClone.artista (artista)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

INSERT INTO SpotifyClone.album (album, artista_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

INSERT INTO SpotifyClone.cancao (cancao, album_id)
VALUES
  ('Soul For Us', 1),
  ('Reflections Of Magic', 1),
  ('Dance With Her Own', 1),
  ('Troubles Of My Inner Fire', 2),
  ('Time Fireworks', 2),
  ('Magic Circus', 3),
  ('Honey, So Do I', 3),
  ('Sweetie, Let''s Go Wild', 3),
  ('She Knows', 3),
  ('Fantasy For Me', 4),
  ('Celebration Of More', 4),
  ('Rock His Everything', 4),
  ('Home Forever', 4),
  ('Diamond Power', 4),
  ('Honey, Let''s Be Silly', 4),
  ('Thang Of Thunder', 5),
  ('Words Of Her Life', 5),
  ('Without My Streets', 5);

INSERT INTO SpotifyClone.usuario_historico (usuario_id, cancao_id)
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

INSERT INTO SpotifyClone.usuario_seguindo(usuario_id, artista_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);
