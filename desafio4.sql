CREATE VIEW top_3_artistas AS
    SELECT 
        a.artista_nome AS artista,
        COUNT(sa.usuario_id) AS seguidores
    FROM
        Artista AS a
            INNER JOIN
        Seguindo_artistas AS sa ON sa.artista_id = a.id
    GROUP BY a.artista_nome
    HAVING seguidores >= 2
    ORDER BY seguidores DESC , artista ASC;
