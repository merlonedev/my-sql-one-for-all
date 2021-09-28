CREATE VIEW top_3_artistas AS
    SELECT 
        ar.nome_artista AS artista, COUNT(usuario_id) AS seguidores
    FROM
        artistas_seguidos AS ars
            JOIN
        artistas AS ar ON ars.artista_id = ar.artista_id
    GROUP BY artista
    ORDER BY seguidores DESC , artista
    LIMIT 3;
