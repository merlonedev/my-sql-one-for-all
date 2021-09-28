DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN Artist VARCHAR(50))
  BEGIN
  SELECT ART.artista_nome AS artista, ALB.album_nome AS album
  FROM SpotifyClone.Artista AS ART
  INNER JOIN SpotifyClone.Album AS ALB
  ON ART.artista_id = ALB.artista_id
  WHERE ART.artista_nome = Artist;
  END $$
  
  DELIMITER ; 
  
  