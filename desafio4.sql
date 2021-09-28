CREATE VIEW top_3_artistas AS
SELECT a.artista AS artista, COUNT(sa.user_id) AS seguidores
FROM SpotifyClone.artistas AS a
INNER JOIN SpotifyClone.seguidores AS sa
ON a.artista_id = sa.artista_id
GROUP BY `artista`
ORDER BY `seguidores` DESC, `artista` LIMIT 3;
