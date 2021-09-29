CREATE VIEW top_3_artistas AS
    SELECT 
        a.artista, COUNT(s.usuario_id) seguidores
    FROM
        SpotifyClone.artistas AS a
            INNER JOIN
        SpotifyClone.seguindo AS s ON a.artista_id = s.artista_id
    GROUP BY a.artista
    ORDER BY seguidores DESC , a.artista
    LIMIT 3;
