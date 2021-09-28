DELIMITER $$ 
CREATE PROCEDURE albuns_do_artista(IN name_input VARCHAR(50))
BEGIN
SELECT
ar.artista_name AS artista,
al.album_name AS album
FROM SpotifyClone.albums AS al
JOIN SpotifyClone.artistas AS ar ON ar.artista_id = al.artista_id
WHERE ar.artista_name = name_input
ORDER BY album;
END $$
DELIMITER ; 
