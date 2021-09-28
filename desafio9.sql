DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artist_name VARCHAR(50))
BEGIN
SELECT arti.artist_name AS artista,
album.album_title AS album
FROM SpotifyClone.artists AS arti
INNER JOIN SpotifyClone.albums AS album
ON arti.artist_id = album.artist_id
WHERE arti.artist_name = artist_name
ORDER BY album; 
END $$

DELIMITER ;
