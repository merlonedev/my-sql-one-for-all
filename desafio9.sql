USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artistaNome VARCHAR(30))
BEGIN
SELECT 
    a.artista_nome AS artista, alb.album AS album
FROM
    Album AS alb
        JOIN
    Artista AS a ON a.id = alb.artista_id
WHERE
    a.artista_nome = artistaNome
ORDER BY alb.album;
END $$

DELIMITER ;
