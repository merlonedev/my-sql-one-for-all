DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE artista(
	artista_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(50) NOT NULL
)engine = InnoDB;
CREATE TABLE plano(
	plano_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    plano VARCHAR(15) NOT NULL,
    valor FLOAT NOT NULL
)engine = InnoDB;
CREATE TABLE usuario(
	usuario_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    plano_id INT NOT NULL,
    nome VARCHAR(30) NOT NULL,
    idade INT NOT NULL,
    FOREIGN KEY(plano_id) REFERENCES plano(plano_id)
)engine = InnoDB;
CREATE TABLE usuario_artista_seguindo(
	usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY(usuario_id, artista_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
    ) engine = InnoDB;
CREATE TABLE album(
	album_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    artista_id INT NOT NULL,
    nome_album VARCHAR(20) NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
)engine = InnoDB;
CREATE TABLE cancoes(
	cancao_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    artista_id INT NOT NULL,
    album_id INT NOT NULL,
    nome_cancao VARCHAR(25) NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artista(artista_id),
    FOREIGN KEY (album_id) REFERENCES album(album_id)
)engine = InnoDB;
CREATE TABLE usuario_cancao_historico(
	usuario_id INT NOT NULL,
    cancao_id INT NOT NULL,
    PRIMARY KEY (usuario_id, cancao_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id)
)engine = InnoDB;

INSERT INTO plano (plano, valor) VALUES	('gratuito', '0'), ('universitário', '5.99'), ('familiar', '7.99');
INSERT INTO usuario (plano_id, nome, idade)	VALUES ('1', 'Thati', '23'),('3', 'Cintia', '35'),('2', 'Bill', '20'),('1', 'Roger', '45');
INSERT INTO artista (nome)	VALUES ('Walter Phoenix'),('Peter Strong'),('Lance Day'),('Freedie Shannon');
INSERT INTO album (artista_id, nome_album) VALUES ('1', 'Envious'),('1', 'Exuberant'),('2','Hallowed Steam'),('3','Incandescent'),('4','Temporary Culture');
INSERT INTO cancoes (artista_id, album_id, nome_cancao) VALUES (1, 1,'Soul For Us'),(1, 1,'Reflections Of Magic'),(1, 1,'Dance With Her Own'),(1, 2,'Troubles Of My Inner Fire'),
	(1, 2,'Time Fireworks'),(2, 3,'Magic Circus'),(2, 3,'Honey, So Do I'),(2, 3,"Sweetie, Let's Go Wild"),(2, 3,"She Knows"),(3, 4,"Fantasy For Me"),(3, 4,"Celebration Of More"),
	(3, 4,"Rock His Everything"),(3, 4,"Home Forever"),(3, 4,"Diamond Power"),(3, 4,"Honey, Let's Be Silly"),(4, 5,"Thang Of Thunder"),(4, 5,"Words Of Her Life"),(4, 5,"Without My Streets");
INSERT INTO usuario_artista_seguindo (usuario_id, artista_id) VALUES ('1', '1'),('1', '4'),('1', '3'),('2', '1'),('2', '3'),('3', '2'),('3', '1'),('4', '4');
INSERT INTO usuario_cancao_historico (usuario_id, cancao_id) VALUES ('1', '1'),('1', '6'),('1', '14'),('1','16'),('2', '13'),('2', '17'),('2', '2'),('2', '15'),('3', '4'),('3', '16'),('3', '6'),('4', '3'),
	('4', '18'),('4', '11');
