DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE IF NOT EXISTS PLANO (
    plano_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    valor VARCHAR(5)
)  ENGINE=INNODB;

INSERT INTO PLANO (valor) VALUES 
(0.00),
(7.99),
(5.99);

CREATE TABLE IF NOT EXISTS USUARIO (
    usuario_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(30),
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id)
        REFERENCES PLANO (plano_id)
)  ENGINE=INNODB;

INSERT INTO USUARIO (usuario, idade, plano_id) VALUES 
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill',20, 3),
('Roger',45, 1);

CREATE TABLE IF NOT EXISTS ARTISTAS (
    artista_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_artista VARCHAR(100)
)  ENGINE=INNODB;

INSERT INTO ARTISTAS (nome_artista ) VALUES 
("Walter Phoenix"),	
("Freedie Shannon"),	
("Lance Day"),	
("Peter Strong");	

CREATE TABLE IF NOT EXISTS ALBUNS (
    album_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_album VARCHAR(100),
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id)
        REFERENCES ARTISTAS (artista_id)
)  ENGINE=INNODB;

INSERT INTO ALBUNS (nome_album, artista_id ) VALUES 
("Envious",	1),
("Exuberant",	1),
("Hallowed Steam",	4),
("Incandescent",	3),
("Temporary Culture",	2);

CREATE TABLE IF NOT EXISTS CANCOES (
    cancoes_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    album_id INT NOT NULL,
    nome_cancao VARCHAR(300),
    FOREIGN KEY (album_id)
        REFERENCES ALBUNS (album_id)
)  ENGINE=INNODB;

INSERT INTO CANCOES (album_id, nome_cancao ) VALUES 
(1,	"Soul For Us"),	
(1,	"Reflections Of Magic"),	
(1,	"Dance With Her Own"),	
(2,	"Troubles Of My Inner Fire"),	
(2,	"Time Fireworks"),	
(3,	"Magic Circus"),	
(3,	"Honey, So Do I"),	
(3,	 "Sweetie, Let's Go Wild"),	
(3,	 "She Knows"),	
(4,	"Fantasy For Me"),	
(4,	"Celebration Of More"),	
(4,	 "Rock His Everything"),	
(4,	 "Home Forever"),	
(4,	"Diamond Power"),	
(4,	 "Honey, Let's Be Silly"),	
(5,	"Thang Of Thunder"),	
(5,	"Words Of Her Life"),	
(5,	 "Without My Streets");

CREATE TABLE IF NOT EXISTS USUARIO_MUSICAS (
    usuario_id INT NOT NULL,
    musica_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (usuario_id , musica_id),
    FOREIGN KEY (usuario_id)
        REFERENCES USUARIO (usuario_id),
    FOREIGN KEY (musica_id)
        REFERENCES CANCOES (cancoes_id)
)  ENGINE=INNODB;

INSERT INTO USUARIO_MUSICAS (usuario_id, musica_id ) VALUES 
(1,	1),
(1,	6),
(1,	14),
(1,	16),
(2,	13),
(2,	17),
(2,	2),
(2,	15),
(3,	4),
(3,	16),
(3,	6),
(4,	3),
(4,	18),
(4,	11);

CREATE TABLE IF NOT EXISTS USUARIO_ARTISTAS (
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (usuario_id , artista_id),
    FOREIGN KEY (usuario_id)
        REFERENCES USUARIO (usuario_id),
    FOREIGN KEY (artista_id)
        REFERENCES ARTISTAS (artista_id)
)  ENGINE=INNODB;

INSERT INTO USUARIO_ARTISTAS (usuario_id, artista_id ) VALUES 
(1,	1),
(1,	2),
(1,	3),
(2,	1),
(2,	3),
(3,	4),
(3,	1),
(4,	2);




