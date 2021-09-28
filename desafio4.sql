CREATE VIEW SpotifyClone.top_3_artistas AS
    SELECT 
        a.artist AS artista, COUNT(u.user_id) AS seguidores
    FROM
        SpotifyClone.artists AS a
            JOIN
        SpotifyClone.followed AS f ON a.artist_id = f.artist_id
            JOIN
        SpotifyClone.users AS u ON f.user_id = u.user_id
    GROUP BY artista
    ORDER BY seguidores DESC , a.artist
    LIMIT 3;
