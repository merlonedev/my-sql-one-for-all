DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN artist_name VARCHAR(50))
BEGIN
SELECT a.name artista, ab.name album
FROM SpotifyClone.artists a
JOIN SpotifyClone.albums ab ON a.artist_id = ab.artist_id
WHERE a.name LIKE CONCAT('%', artist_name, '%')
ORDER BY album;
END $$
DELIMITER ;
