CREATE VIEW top_3_artistas AS
    SELECT 
        at.artist_name AS artista, COUNT(uf.artist_id) AS seguidores
    FROM
        artists at
            INNER JOIN
        user_followage uf ON at.artist_id = uf.artist_id
    GROUP BY at.artist_name
    ORDER BY COUNT(uf.artist_id) DESC , at.artist_name
    LIMIT 3;
