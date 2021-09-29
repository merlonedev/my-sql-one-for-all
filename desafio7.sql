CREATE VIEW perfil_artistas AS
SELECT ART.nome AS artista,
ALB.nome AS album,
COUNT(USA.id_usuario) AS seguidores
FROM SpotifyClone.album ALB
INNER JOIN SpotifyClone.artista ART
ON ALB.id_artista = ART.id_artista
INNER JOIN SpotifyClone.usuario_segue_artista USA
ON ALB.id_artista = USA.id_artista
GROUP BY ALB.id_album
ORDER BY seguidores DESC, artista, album;
