DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(150))
BEGIN
SELECT 
a.nome AS artista, ab.nome AS album
FROM
albuns AS ab
INNER JOIN
artistas AS a ON a.artista_id = ab.artista_id
WHERE
a.nome LIKE (nome_artista);
END $$
DELIMITER ;
