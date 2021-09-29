DELIMITER $$

CREATE PROCEDURE albuns_do_artista (IN artista_nome VARCHAR(50))
BEGIN
SELECT a.artista, al.album FROM SpotifyClone.artistas  a
INNER JOIN SpotifyClone.albuns  al
ON a.artista_id = al.artista_id
WHERE artista = artista_nome
ORDER BY al.album;
END $$

DELIMITER;
