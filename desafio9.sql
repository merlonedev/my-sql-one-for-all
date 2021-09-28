USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(60))
BEGIN
SELECT 
    a.artista_nome AS artista,
    alb.album_titulo AS album
FROM
    SpotifyClone.artistas AS a
INNER JOIN SpotifyClone.albuns AS alb
ON alb.artista_id = a.artista_id
WHERE a.artista_nome = nome
ORDER BY alb.album_titulo;
END $$

DELIMITER ;

CALL albuns_do_artista('Walter Phoenix');
