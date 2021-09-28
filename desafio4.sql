CREATE VIEW top_3_artistas AS
    SELECT 
        artist.artist_name AS artista,
        COUNT(follow.user_id) AS seguidores
    FROM
        SpotifyClone.artists AS artist
            INNER JOIN
        SpotifyClone.user_follows AS follow ON artist.artist_id = follow.artist_id
    GROUP BY artista
    ORDER BY seguidores DESC , artista
    LIMIT 3;
