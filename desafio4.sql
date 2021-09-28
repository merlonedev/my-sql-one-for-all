CREATE VIEW top_3_artistas AS
SELECT a.artista, COUNT(asu.usuario_id) AS seguidores FROM SpotifyClone.artistas AS a
INNER JOIN SpotifyClone.artistas_seguidos_usuario AS asu
ON a.artista_id = asu.artista_id
GROUP BY a.artista
ORDER BY seguidores DESC, a.artista
LIMIT 3;
