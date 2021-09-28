DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(50))
BEGIN
SELECT a.artista AS `artista`,
alb.nome AS `album`
FROM artista AS a
JOIN album AS alb ON alb.artista_id = a.artista_id
WHERE nome_artista = a.artista
ORDER BY `artista`;
END $$
DELIMITER ;
