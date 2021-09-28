DELIMITER $$
CREATE PROCEDURE albuns_do_artista (IN artista VARCHAR(30))
BEGIN
SELECT ar.artista AS artista, al.album AS album
FROM SpotifyClone.artistas AS ar
INNER JOIN SpotifyClone.albuns AS al
ON ar.artista_id = al.artista_id
WHERE ar.artista = artista
ORDER BY `album`;
END $$
DELIMITER ;
