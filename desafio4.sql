CREATE VIEW top_3_artistas AS SELECT 
    a.artista_nome AS artista,
    COUNT(a_u.usuario_id) AS seguidores
FROM
    SpotifyClone.artistas AS a
INNER JOIN SpotifyClone.artistas_usuarios AS a_u
ON a_u.artista_id = a.artista_id
GROUP BY a.artista_id
ORDER BY seguidores DESC, a.artista_nome
LIMIT 3;
