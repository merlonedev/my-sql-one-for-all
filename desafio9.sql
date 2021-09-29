DELIMITER $$

CREATE PROCEDURE albuns_do_artista (IN artist VARCHAR(50))
BEGIN
  SELECT artista AS artista, album AS album
  FROM SpotifyClone.Album AS abm
  INNER JOIN SpotifyClone.Artista AS a
  ON abm.artista_id = a.artista_id
  WHERE a.artista = artist
  ORDER BY album;
END $$
DELIMITER ;
