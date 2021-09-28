CREATE VIEW perfil_artistas AS
SELECT
a.nome AS artista,
al.nome AS album,
COUNT(ua.id_usuario) AS seguidores
FROM SpotifyClone.artista AS a
INNER JOIN SpotifyClone.album AS al ON a.id_artista = al.id_artista
INNER JOIN SpotifyClone.usuario_artista AS ua ON ua.id_artista = a.id_artista
GROUP BY album, artista
ORDER BY seguidores DESC, artista, album;
