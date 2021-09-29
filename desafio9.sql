USE SpotifyClone;

DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN artist VARCHAR(64))
BEGIN
  SELECT 
    ar.artist_name AS `artista`,
    al.album_name AS `album`
  FROM 
    SpotifyClone.albums AS al
  JOIN SpotifyClone.artists AS ar ON ar.id_artist = al.id_artist
  WHERE ar.artist_name = artist
  ORDER BY `album`;
END $$
DELIMITER ;

CALL albuns_do_artista('Walter Phoenix');