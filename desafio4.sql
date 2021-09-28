CREATE VIEW top_3_artistas AS
    SELECT 
        a.nome AS `artista`, COUNT(ua.usuario_id) AS `seguidores`
    FROM
        SpotifyClone.artistas AS a
            JOIN
        SpotifyClone.usuarios_artistas AS ua ON a.artista_id = ua.artista_id
    GROUP BY `artista`
    ORDER BY `seguidores` DESC
    LIMIT 3;
