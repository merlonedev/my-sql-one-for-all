CREATE VIEW top_3_artistas AS
SELECT a.nome AS `artista`,
COUNT(f.artista_id) AS `seguidores`
FROM SpotifyClone.artista AS a
INNER JOIN SpotifyClone.follow AS f
ON a.artista_id = f.artista_id
GROUP BY `artista`
ORDER BY `seguidores` DESC, `artista` ASC
LIMIT 3;
