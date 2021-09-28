CREATE VIEW top_3_artistas AS
SELECT
a.artista AS `artista`,
COUNT(*) AS `seguidores`
FROM seguindoartistas AS s
JOIN usuario AS u ON u.usuario_id = s.usuario_id
JOIN artista AS a ON a.artista_id = s.artista_id
GROUP BY `artista`
ORDER BY `seguidores` DESC, `artista`
LIMIT 3;
