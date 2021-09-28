CREATE VIEW top_3_artistas AS
    SELECT 
        art.artista_nome AS `artista`,
        COUNT(seg.usuario_id) AS `seguidores`
    FROM
        SpotifyClone.Seguindo AS seg
            INNER JOIN
        SpotifyClone.Artista AS art ON art.artista_id = seg.artista_id
    GROUP BY art.artista_id
    ORDER BY `seguidores` DESC , `artista` LIMIT 3;
