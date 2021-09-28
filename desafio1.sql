DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos (
    plano_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    plano VARCHAR(50) NOT NULL,
    valor DECIMAL(5 , 2 )
);

INSERT INTO planos(plano, valor)
VALUES('gratuito', 0.00), ('familiar', 7.99), ('universitário', 5.99);

CREATE TABLE usuarios (
    usuario_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(50),
    idade INT,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id)
        REFERENCES planos (plano_id)
);

INSERT INTO usuarios(nome_usuario, idade, plano_id)
VALUES('Thati', 23, 1), ('Cintia', 35, 2), ('Bill', 20, 3), ('Roger', 45, 1);

CREATE TABLE artistas (
    artista_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_artista VARCHAR(50)
);

INSERT INTO artistas(nome_artista)
VALUES('Walter Phoenix'), ('Peter Strong'), ('Lance Day'), ('Freedie Shannon');

CREATE TABLE albuns (
    album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_album VARCHAR(50),
    artist_id INT,
    FOREIGN KEY (artist_id)
        REFERENCES artistas (artista_id)
);

INSERT INTO albuns(nome_album, artist_id)
VALUES('Envious', 1), ('Exuberant', 1), ('Hallowed Steam', 2), ('Incandescent', 3), ('Temporary Culture', 4);
    
CREATE TABLE cancoes (
    cancao_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_cancao VARCHAR(250),
    artista_id INT,
    album_id INT,
    FOREIGN KEY (artista_id)
        REFERENCES artistas (artista_id),
    FOREIGN KEY (album_id)
        REFERENCES albuns (album_id)
);

INSERT INTO cancoes(nome_cancao, artista_id, album_id)
VALUES('Soul For Us', 1, 1),
('Reflections Of Magic', 1, 1),
('Dance With Her Own', 1, 1),
('Troubles Of My Inner Fire', 1, 2),
('Time Fireworks', 1, 2),
('Magic Circus', 2, 3),
('Honey, So Do I', 2, 3),
("Sweetie, Let's Go Wild", 2, 3),
('She Knows', 2, 3),
('Fantasy For Me', 3, 4),
('Celebration Of More', 3, 4),
('Rock His Everything', 3, 4),
('Home Forever', 3, 4),
('Diamond Power', 3, 4),
("Honey, Let's Be Silly", 3, 4),
('Thang Of Thunder', 4, 5),
('Words Of Her Life', 4, 5),
('Without My Streets', 4, 5);
      
CREATE TABLE historico_reproducao (
    usuario_id INT,
    cancao_id INT,
    CONSTRAINT PRIMARY KEY (usuario_id , cancao_id),
    FOREIGN KEY (usuario_id)
        REFERENCES usuarios (usuario_id),
    FOREIGN KEY (cancao_id)
        REFERENCES cancoes (cancao_id)
);

INSERT INTO historico_reproducao(usuario_id, cancao_id)
VALUES(1, 1), (1, 6), (1, 14), (1, 16), (2, 13), (2, 17), (2, 2), (2, 15), (3, 4), (3, 16), (3, 6), (4, 3), (4, 18), (4, 11);

CREATE TABLE seguindo_artistas (
    usuario_id INT,
    artista_id INT,
    CONSTRAINT PRIMARY KEY (usuario_id , artista_id),
    FOREIGN KEY (usuario_id)
        REFERENCES usuarios (usuario_id),
    FOREIGN KEY (artista_id)
        REFERENCES artistas (artista_id)
);

INSERT INTO seguindo_artistas(usuario_id, artista_id)
VALUES(1, 1), (1, 4), (1, 3), (2, 1), (2, 3), (3, 2), (3, 1), (4, 4);
