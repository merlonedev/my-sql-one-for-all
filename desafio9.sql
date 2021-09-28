DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(50))
BEGIN
SELECT ar.artista, al.album
FROM SpotifyClone.artistas ar
JOIN SpotifyClone.albuns al
ON al.id_artista = ar.id_artista AND MATCH(ar.artista) AGAINST(nome_artista)
ORDER BY 2;
END
$$

DELIMITER ;
