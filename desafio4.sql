CREATE VIEW top_3_artistas AS
SELECT
a.artista_name AS artista,
COUNT(*) AS seguidores
FROM SpotifyClone.seguindo_artistas AS s
JOIN SpotifyClone.artistas AS a ON a.artista_id = s.artista_id
GROUP BY artista
ORDER BY seguidores DESC, artista
LIMIT 3;
