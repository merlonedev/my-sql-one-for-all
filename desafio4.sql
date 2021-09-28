CREATE VIEW SpotifyClone.top_3_artistas AS
    SELECT 
        a.artista, s.seguidores
    FROM
        SpotifyClone.artistas AS a
            INNER JOIN
        (SELECT 
            artista_id, COUNT(*) AS seguidores
        FROM
            SpotifyClone.usuario_artistas
        GROUP BY artista_id) AS s ON s.artista_id = a.id
    ORDER BY s.seguidores DESC , a.artista
    LIMIT 3;
