CREATE VIEW top_3_artistas AS
    SELECT 
        a.artista_name, COUNT(s.usuario_id) seguidores
    FROM
        SpotifyClone.artistas AS a
            INNER JOIN
        SpotifyClone.seguindo AS s ON a.artista_id = s.artista_id
    GROUP BY a.artista_name
    ORDER BY seguidores DESC , a.artista_name
    LIMIT 3;
