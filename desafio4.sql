CREATE VIEW top_3_artistas AS
    SELECT 
        (SELECT 
                artista
            FROM
                SpotifyClone.artistas a
            WHERE
                ua.artista_id = a.artista_id) AS `artista`,
        COUNT(usuario_id) AS `seguidores`
    FROM
        SpotifyClone.usuarios_artistas ua
    GROUP BY artista_id
    ORDER BY `seguidores` DESC, `artista`
    LIMIT 3
;
