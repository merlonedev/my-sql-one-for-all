CREATE VIEW top_3_artistas AS
    (SELECT 
        a.artist_name AS 'artista',
        COUNT(uf.artist_id) AS 'seguidores'
    FROM
        artists a
            JOIN
        user_followage uf ON a.artist_id = uf.artist_id
    GROUP BY uf.artist_id
    ORDER BY COUNT(uf.artist_id) DESC , a.artist_name ASC
    LIMIT 3);
