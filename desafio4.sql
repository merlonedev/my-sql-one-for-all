CREATE VIEW SpotifyClone.top_3_artistas AS
    SELECT 
        a.artista AS artista,
        (SELECT 
                COUNT(*)
            FROM
                usuario_seguindo
            WHERE
                artista_id = a.id) AS seguidores
    FROM
        SpotifyClone.artista AS a
    ORDER BY seguidores DESC , artista
    LIMIT 3;
