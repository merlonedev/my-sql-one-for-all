USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artista VARCHAR(50))
BEGIN
SELECT 
    a.nome AS `artista`, al.nome AS `album`
FROM
    albuns AS al
        JOIN
    artistas AS a ON a.id = al.artista_id
WHERE
    a.nome = artista
ORDER BY `album`;
END $$

DELIMITER ;
