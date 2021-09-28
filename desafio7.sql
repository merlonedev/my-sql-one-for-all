CREATE VIEW perfil_artistas AS SELECT 
    a.artista_nome AS artista,
    alb.album_titulo AS album,
    COUNT(a_u.artista_id) AS seguidores
FROM
    SpotifyClone.artistas AS a
INNER JOIN SpotifyClone.albuns AS alb
ON alb.artista_id = a.artista_id
INNER JOIN SpotifyClone.artistas_usuarios AS a_u
ON a_u.artista_id = a.artista_id
GROUP BY alb.album_id
ORDER BY seguidores DESC, a.artista_nome, alb.album_titulo;
