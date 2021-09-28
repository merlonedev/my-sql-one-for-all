CREATE VIEW top_3_artistas AS
SELECT a.nome AS `artista`,
COUNT(ua.usuario_id) AS `seguidores`
FROM artistas AS a
INNER JOIN usuario_artista AS ua
ON ua.artista_id = a.id
GROUP BY `artista`
ORDER BY `seguidores` DESC, `artista`
LIMIT 3;
