CREATE VIEW estatisticas_musicais AS SELECT 
    COUNT(c.cancao_id) AS cancoes,
    COUNT(DISTINCT a.artista_id) AS artistas,
    COUNT(DISTINCT alb.album_id) AS albuns
FROM
    SpotifyClone.cancoes AS c
INNER JOIN SpotifyClone.artistas AS a
ON a.artista_id = c.artista_id
INNER JOIN SpotifyClone.albuns as alb
ON alb.album_id = c.album_id;
