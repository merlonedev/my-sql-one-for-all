USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(50))
BEGIN
SELECT a.nome AS 'artista', al.nome AS 'album'
    FROM SpotifyClone.artista AS a
    JOIN
    SpotifyClone.albuns AS al ON a.artista_id = al.artista_id
    WHERE a.nome = nome_artista
    ORDER BY al.nome;
END $$

DELIMITER ;
