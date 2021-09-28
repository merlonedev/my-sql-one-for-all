DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
	plano_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    plano VARCHAR(50) NOT NULL,
    valor DECIMAL(5,2)
);

INSERT INTO planos(plano, valor)
VALUES('gratuito', 0.00),
	  ('familiar', 7.99),
	  ('universitário', 5.99);

CREATE TABLE usuarios(
	usuario_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(50),
    idade INT,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
);

INSERT INTO usuarios(nome_usuario, idade, plano_id)
VALUES('Thati', 23, 1),
	  ('Cintia', 35, 2),
      ('Bill', 20, 3),
      ('Roger', 45, 1);
      
CREATE TABLE artistas(
	artista_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_artista VARCHAR(50)
);

INSERT INTO artistas(nome_artista)
VALUES('Walter Phoenix'),
	  ('Peter Strong'),
      ('Lance Day'),
      ('Freedie Shannon');

CREATE TABLE albuns(
	album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_album VARCHAR(50)
);

INSERT INTO albuns(nome_album)
VALUES('Envious'),
	  ('Exuberant'),
      ('Hallowed Steam'),
      ('Incandescent'),
      ('Temporary Culture');
      
