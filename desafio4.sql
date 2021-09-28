CREATE VIEW top_3_artistas AS
SELECT
a.nome AS artista,
COUNT(ua.id_usuario) AS seguidores
FROM SpotifyClone.artista AS a
INNER JOIN SpotifyClone.usuario_artista AS ua ON ua.id_artista = a.id_artista
GROUP BY artista
ORDER BY seguidores DESC, artista
LIMIT 3;
