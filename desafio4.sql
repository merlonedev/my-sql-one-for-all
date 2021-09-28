CREATE VIEW top_3_artistas AS
SELECT 
    a.artista artista, COUNT(aseg.user_id) seguidores
FROM
    SpotifyClone.artistas a
        INNER JOIN
    SpotifyClone.artista_seguidores aseg ON a.artista_id = aseg.artista_id
GROUP BY a.artista
ORDER BY seguidores DESC , artista ASC
LIMIT 3;
