CREATE VIEW top_3_artistas AS
    SELECT 
        sing.artista_nome AS `artista`,
        COUNT(follow.usuario_id) AS `seguidores`
    FROM
        SpotifyClone.Seguindo AS follow
            INNER JOIN
        SpotifyClone.Artista AS sing ON sing.artista_id = follow.artista_id
    GROUP BY sing.artista_id
    ORDER BY `seguidores` DESC , `artista` LIMIT 3;
