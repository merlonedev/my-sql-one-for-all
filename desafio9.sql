DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN art_name VARCHAR(50))
BEGIN
SELECT a.artist_name AS artista, b.album_name AS album
FROM SpotifyClone.artists AS a
INNER JOIN SpotifyClone.albums AS b ON b.artist_id = a.artist_id
WHERE a.artist_name = art_name;
END $$
DELIMITER ;
