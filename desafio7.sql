CREATE VIEW SpotifyClone.perfil_artistas AS
    SELECT 
        a.artista, alb.album, s.seguidores
    FROM
        SpotifyClone.artistas AS a
            INNER JOIN
        (SELECT 
            artista_id, COUNT(*) AS seguidores
        FROM
            SpotifyClone.usuario_artistas
        GROUP BY artista_id) AS s ON s.artista_id = a.id
            INNER JOIN
        SpotifyClone.albuns AS alb ON alb.artista_id = a.id
    ORDER BY s.seguidores DESC , a.artista , alb.album;
