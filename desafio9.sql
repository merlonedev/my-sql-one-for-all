DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artista_nome VARCHAR(100))
BEGIN
SELECT art.artista, alb.album FROM SpotifyClone.artistas art
INNER JOIN SpotifyClone.albuns alb
ON art.artista_id = alb.artista_id
WHERE art.artista = artista_nome
ORDER BY alb.album;
END $$

DELIMITER ;
