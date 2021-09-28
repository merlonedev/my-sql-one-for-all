CREATE VIEW cancoes_premium AS
    SELECT 
        s.song_name AS nome, COUNT(uh.song_id) AS reproducoes
    FROM
        songs s
            INNER JOIN
        user_songs_history uh ON s.song_id = uh.song_id
            INNER JOIN
        users u ON u.user_id = uh.user_id
    WHERE
        u.plan_id IN (2 , 3)
    GROUP BY s.song_name
    ORDER BY s.song_name;
