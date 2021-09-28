USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(30))
BEGIN
    SELECT 
    art.artista, alb.album
FROM
    albuns AS alb
        INNER JOIN
    (SELECT 
        *
    FROM
        artistas
    WHERE
        artista = nome) AS art ON art.id = alb.artista_id 
ORDER BY album;
END $$

DELIMITER ;
