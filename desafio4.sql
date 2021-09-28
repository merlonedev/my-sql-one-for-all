CREATE VIEW top_3_artistas AS
    SELECT 
        a.nome_artista AS artista,
        COUNT(ua.artista_id) AS seguidores
    FROM
        ARTISTAS a
            JOIN
        USUARIO_ARTISTAS ua ON a.artista_id = ua.artista_id
    GROUP BY artista
    ORDER BY seguidores DESC , artista ASC
    LIMIT 3;
    