DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.Plano (
  plano_id INT NOT NULL AUTO_INCREMENT,
  plano_nome varchar(30) NOT NULL,
  plano_preco DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (plano_id)
) ENGINE= InnoDB;

INSERT INTO SpotifyClone.Plano(plano_nome,plano_preco) VALUES ('gratuito',0.00),('familiar',7.99),('universitário',5.99);

CREATE TABLE SpotifyClone.Usuario (
  usuario_id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_nome VARCHAR(20) NOT NULL,
  usuario_idade INT NOT NULL,
  plano_id INT NOT NULL,
  FOREIGN KEY (plano_id) REFERENCES SpotifyClone.Plano(plano_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.Usuario(usuario_nome, usuario_idade, plano_id)
  VALUES ('Thati',23,1),('Cintia',35,2),('Bill',20,3),('Roger',45,1);
  
  CREATE TABLE SpotifyClone.Artista (
  artista_id INT PRIMARY KEY AUTO_INCREMENT,
  artista_nome VARCHAR(50) NOT NULL
  );
  
  CREATE TABLE SpotifyClone.Album (
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album_nome VARCHAR(50) NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES SpotifyClone.Artista(artista_id)
  ) engine = InnoDB;
  
  INSERT INTO SpotifyClone.Artista(artista_nome) 
  VALUES ('Walter Phoenix'),('Peter Strong'),('Lance Day'),('Freedie Shannon');
  
  INSERT INTO SpotifyClone.Album(album_nome,artista_id)
  VALUES ('Envious',1),('Exuberant',1),('Hallowed Steam',2),('Incandescent',3),('Temporary Culture',4);
  
  CREATE TABLE SpotifyClone.Cancoes(
  cancao_id INT PRIMARY KEY AUTO_INCREMENT,
  cancao_nome VARCHAR(50) NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES SpotifyClone.Album(album_id)
  ) engine = InnoDB;
  
  INSERT INTO SpotifyClone.Cancoes(cancao_nome,album_id)
  VALUES('Soul For Us',1),('Reflections Of Magic',1),('Dance With Her Own',1),
  ('Troubles Of My Inner Fire',2),('Time Fireworks',2),('Magic Circus',3),
  ('Honey, So Do I',3),("Sweetie, Let's Go Wild",3),('She Knows',3),
  ('Fantasy For Me',4),('Celebration Of More',4),('Rock His Everything',4),
  ('Home Forever',4),('Diamond Power',4),("Honey, Let's Be Silly",4),
  ('Thang Of Thunder',5),('Words Of Her Life',5),('Without My Streets',5);
  
  CREATE TABLE SpotifyClone.Historico(
  cancao_id INT NOT NULL,
  usuario_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY(cancao_id,usuario_id),
  FOREIGN KEY(cancao_id) REFERENCES SpotifyClone.Cancoes(cancao_id),
  FOREIGN KEY(usuario_id) REFERENCES SpotifyClone.Usuario(usuario_id)
  ) engine = InnoDB;
  
  INSERT INTO SpotifyClone.Historico(cancao_id,usuario_id)
  VALUES
  (1,1),(6,1),(14,1),(16,1),
  (13,2),(17,2),(2,2),(15,2)
  ,(4,3),(16,3),(6,3),
  (3,4),(18,4),(11,4);
  
  CREATE TABLE SpotifyClone.Seguidores(
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY (usuario_id,artista_id),
  FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.Usuario(usuario_id),
  FOREIGN KEY (artista_id) REFERENCES SpotifyClone.Artista(artista_id)
  ) engine = InnoDB;
  
  INSERT INTO SpotifyClone.Seguidores(usuario_id,artista_id)
  VALUES(1,1),(1,4),(1,3),(2,1),(2,3),(3,2),(3,1),(4,4);
