CREATE VIEW perfil_artistas AS
SELECT ART.artista_nome AS artista, ALB.album_nome AS album, COUNT(S.usuario_id) AS seguidores
FROM SpotifyClone.Artista AS ART
INNER JOIN SpotifyClone.Album AS ALB
ON ALB.artista_id = ART.artista_id
INNER JOIN SpotifyClone.Seguidores AS S
ON S.artista_id = ALB.artista_id
GROUP BY ART.artista_nome, ALB.album_nome
ORDER BY seguidores DESC, ART.artista_nome, ALB.album_nome;
