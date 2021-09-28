CREATE VIEW top_3_artistas AS
    SELECT 
        a.`name` AS artista, COUNT(ua.user_id) AS seguidores
    FROM
        SpotifyClone.user_artist AS ua
            JOIN
        SpotifyClone.artist AS a ON ua.artist_id = a.id
    GROUP BY a.`name`
    ORDER BY seguidores DESC, artista;
