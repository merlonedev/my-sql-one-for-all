DELIMITTER $$

CREATE PROCEDURE albuns_do_artista (IN artist VARCHAR(75)) 
BEGIN
  SELECT 
    a.artist_name AS 'artista',
    al.album_title AS 'album'
  FROM SpotifyClone.artists AS a
    INNER JOIN 
      SpotifyClone.albums AS al
    ON a.artist_id = al.artist_id
  WHERE 
    a.artist_name = artist
  ORDER BY album;

END $$

DELIMITTER ;
