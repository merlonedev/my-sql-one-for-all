CREATE VIEW top_3_artistas AS 
SELECT
a.nome AS 'artista',
COUNT(s.artista_id) AS 'seguidores'
FROM SpotifyClone.artista as a
JOIN usuario_artista_seguindo AS s
ON a.artista_id = s.artista_id
GROUP BY a.nome
ORDER BY COUNT(artista_id) DESC, a.nome
LIMIT 3;
