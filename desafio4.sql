CREATE VIEW top_3_artistas AS
    SELECT
        a.nome AS `artista`,
        COUNT(s.usuario_id) AS `seguidores`
    FROM
        SpotifyClone.seguidores AS `s`
    JOIN SpotifyClone.artistas AS `a`
    ON s.artista_id = a.id
    GROUP BY `artista`
    ORDER BY `seguidores` DESC, `artista`
    LIMIT 3;
