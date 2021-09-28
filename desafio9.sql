DELIMITER $$

CREATE PROCEDURE SpotifyClone.albuns_do_artista(IN artista_name VARCHAR(100))
BEGIN
SELECT a.nome AS `artista`,
ab.nome AS `album`
FROM SpotifyClone.artista AS a
INNER JOIN SpotifyClone.album AS ab
ON a.artista_id = ab.artista_id WHERE a.nome = artista_name
ORDER BY `album`;
END $$

DELIMITER ;
