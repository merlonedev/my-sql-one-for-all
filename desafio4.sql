CREATE VIEW top_3_artistas AS
    SELECT 
        a.name AS artista, COUNT(f.user_id) AS seguidores
    FROM
        SpotifyClone.artists a
            JOIN
        SpotifyClone.users_follows f ON a.id = f.artist_id
    GROUP BY artista
    ORDER BY seguidores DESC, artista
    LIMIT 3;
