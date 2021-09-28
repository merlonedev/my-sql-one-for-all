CREATE VIEW top_3_artistas AS
    SELECT 
        AR.artista_nome AS `artista`,
        COUNT(ARS.artista_id) AS `seguidores`
    FROM
        SpotifyClone.artistas AS AR
            INNER JOIN
        SpotifyClone.artistas_seguidos AS ARS ON AR.artista_id = ARS.artista_id
    GROUP BY `artista`
    ORDER BY `seguidores` DESC, `artista` ASC
    LIMIT 3;
