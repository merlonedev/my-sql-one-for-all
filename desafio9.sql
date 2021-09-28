DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(50))
BEGIN
SELECT a.nome AS `artista`,
al.nome AS `album`
FROM artistas AS a
INNER JOIN albuns AS al
ON al.artista_id = a.id
WHERE a.nome LIKE nome
ORDER BY `album`;
END $$

DELIMITER ;
