CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.planos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    plano VARCHAR(50) NOT NULL,
    valor DECIMAL(5,2) NOT NULL
);

INSERT INTO SpotifyClone.planos(plano, valor)
VALUES('gratuito', 0.00),
    ('universitário', 5.99),
    ('familiar', 7.99);

CREATE TABLE SpotifyClone.usuarios(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    plano_id INT,
    
    FOREIGN KEY (plano_id) REFERENCES planos(id)
);

INSERT INTO SpotifyClone.usuarios(nome, idade, plano_id)
VALUES('Thati', 23, 1),
    ('Cintia', 35, 3),
    ('Bill', 20, 2),
    ('Roger', 45, 1);

CREATE TABLE SpotifyClone.artistas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

INSERT INTO SpotifyClone.artistas(nome)
VALUES('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon');

CREATE TABLE SpotifyClone.albuns(
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50) NOT NULL,
    artista_id INT,
    
    FOREIGN KEY (artista_id) REFERENCES artistas(id)
);

INSERT INTO SpotifyClone.albuns(titulo, artista_id)
VALUES('Envious', 1),
    ('Exuberant', 1),
    ('Hallowed Steam', 2),
    ('Incandescent', 3),
    ('Temporary Culture', 4);

CREATE TABLE SpotifyClone.musicas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50) NOT NULL,
    artista_id INT,
    album_id INT,
    
    FOREIGN KEY (artista_id) REFERENCES artistas(id),
    FOREIGN KEY (album_id) REFERENCES albuns(id)
);

INSERT INTO SpotifyClone.musicas(titulo, artista_id, album_id)
VALUES("Soul For Us", 1, 1),
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

CREATE TABLE SpotifyClone.seguidores(
    usuario_id INT,
    artista_id INT,
    
    CONSTRAINT PRIMARY KEY(usuario_id, artista_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (artista_id) REFERENCES artistas(id)    
);

INSERT INTO SpotifyClone.seguidores(usuario_id, artista_id)
VALUES(1, 1),
    (1, 3),
    (1, 4),
    (2, 1),
    (2, 3),
    (3, 1),
    (3, 2),
    (4, 4);

CREATE TABLE SpotifyClone.historico_musicas(
    usuario_id INT,
    musica_id INT,
    
    CONSTRAINT PRIMARY KEY(usuario_id, musica_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (musica_id) REFERENCES musicas(id)    
);

INSERT INTO SpotifyClone.historico_musicas(usuario_id, musica_id)
VALUES(1, 1),
    (1, 6),
    (1, 14),
    (1, 16),
    (2, 2),
    (2, 13),
    (2, 15),
    (2, 17),
    (3, 4),
    (3, 6),
    (3, 16),
    (4, 3),
    (4, 11),
    (4, 18);
