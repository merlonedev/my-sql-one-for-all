CREATE VIEW top_3_artistas AS
SELECT A.nome AS artista, COUNT(USA.id_usuario) AS seguidores
FROM SpotifyClone.usuario_segue_artista USA
LEFT JOIN SpotifyClone.artista A
ON USA.id_artista = A.id_artista
GROUP BY USA.id_artista
ORDER BY seguidores DESC, artista
LIMIT 3;
