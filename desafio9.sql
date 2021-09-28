DELIMITER $$
CREATE PROCEDURE albuns_do_artista (IN artist VARCHAR(50))
BEGIN
SELECT
a.`name` AS artista,
al.title AS album
FROM SpotifyClone.artists AS a
INNER JOIN SpotifyClone.albums AS al
ON al.artist_id = a.artist_id
WHERE artista = artist
ORDER BY album;
END $$
DELIMITER ;
