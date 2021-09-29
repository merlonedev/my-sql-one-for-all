USE SpotifyClone;

CREATE TABLE Plano(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Tipo_Plano VARCHAR(20) NOT NULL,
    Valor_Plano DOUBLE NOT NULL
) engine = InnoDB;

CREATE TABLE Usuario(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(10) NOT NULL,
    Idade INT NOT NULL,
    Id_Plano INT NOT NULL,
    FOREIGN KEY(Id_Plano) REFERENCES Plano(Id)
) engine = InnoDB;

CREATE TABLE Artista(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Artista VARCHAR(20) NOT NULL
) engine = InnoDB;

CREATE TABLE Follow(
    Id_Usuario INT NOT NULL,
    Id_Artista INT NOT NULL,
    PRIMARY KEY(Id_Usuario, Id_Artista),
    FOREIGN KEY(Id_Usuario) REFERENCES Usuario(Id),
    FOREIGN KEY(Id_Artista) REFERENCES Artista(Id)
) engine = InnoDB;

CREATE TABLE Album(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Album VARCHAR(20) NOT NULL,
    Id_Artista INT NOT NULL,
    FOREIGN KEY(Id_Artista) REFERENCES Artista(Id)
) engine = InnoDB;

CREATE TABLE Cancoes(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Cancao VARCHAR(50) NOT NULL,
    Id_Album INT NOT NULL,
    Id_Artista INT NOT NULL,
    FOREIGN KEY(Id_Album) REFERENCES Album(Id),
    FOREIGN KEY(Id_Artista) REFERENCES Artista(Id)
) engine = InnoDB;

CREATE TABLE Historico(
    Id_Usuario INT NOT NULL,
    Id_Cancao INT NOT NULL,
PRIMARY KEY(Id_Usuario, Id_Cancao),
    FOREIGN KEY(Id_Usuario) REFERENCES Usuario(Id),
    FOREIGN KEY(Id_Cancao) REFERENCES Cancoes(Id)
) engine = InnoDB;

INSERT INTO Plano(Tipo_Plano, Valor_Plano) -- acho que tem que seguir a sequencia das tabelas criadas
VALUES
  ('gratuito', 0),
  ('universitário', 5.99),
  ('familiar', 7.99); -- pelo ID ser PK auto increment, já se entende que gratuito tem id=1; universitario id=2 e familiar id=3

INSERT INTO Usuario(Nome, Idade, Id_Plano)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 3),
  ('Bill', 20, 2),
  ('Roger', 45, 1);
  
  INSERT INTO Artista(Nome_Artista)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');
  
  INSERT INTO Follow(Id_Usuario, Id_Artista)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);
  
  INSERT INTO Album(Nome_Album, Id_Artista)
VALUES
    ('Envious', 1),
    ('Exuberant',	1),
    ('Hallowed Steam',	2),
    ('Incandescent', 3),
    ('Temporary Culture', 4);
  
  INSERT INTO Cancoes(Nome_Cancao, Id_Album, Id_Artista)
VALUES
    ('Soul For Us', 1, 1),
    ('Reflections Of Magic', 1, 1),
('Dance With Her Own', 1, 1),
    ('Troubles Of My Inner Fire', 2, 1),
    ('Time Fireworks', 2, 1),
    ('Magic Circus', 3, 2),
    ('Honey, So Do I', 3, 2),
    ('Sweetie, Let"s Go Wild', 3, 2),
    ('She Knows', 3, 2),
    ('Fantasy For Me', 4, 3),
    ('Celebration Of More', 4, 3),
    ('Rock His Everything', 4, 3),
    ('Home Forever', 4, 3),
    ('Diamond Power', 4, 3),
    ('Honey, Let"s Be Silly', 4, 3),
    ('Thang Of Thunder', 5, 4),
    ('Words Of Her Life', 5, 4),
    ('Without My Streets', 5, 4);
  
  INSERT INTO Historico(Id_Usuario, Id_Cancao)
VALUES
  (1,1),
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
 
   