USE SpotifyClone;

DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(20))
BEGIN
SELECT ar.artista, al.album FROM SpotifyClone.artistas AS ar
INNER JOIN SpotifyClone.albuns AS al
ON ar.artista_id = al.artista_id
WHERE artista = nome_artista
ORDER BY al.album;
END $$

DELIMITER ;
