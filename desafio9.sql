DELIMITER $$

CREATE PROCEDURE SpotifyClone.albuns_do_artista(IN `name` VARCHAR(70))

BEGIN
  SELECT a.artist AS 'artista', al.album AS 'album' 
  FROM SpotifyClone.albums AS al 
  JOIN SpotifyClone.artists AS a 
  ON a.artist_id = al.artist_id 
  WHERE a.artist = `name` 
  ORDER BY artista;
END $$

DELIMITER ;

-- CALL albuns_do_artista('Walter Phoenix');
