CREATE VIEW cancoes_premium AS
    (SELECT 
        s.song_name AS 'nome', COUNT(us.song_id) AS 'reproducoes'
    FROM
        songs s
            JOIN
        user_songs_history us ON us.song_id = s.song_id
            JOIN
        users u ON u.user_id = us.user_id
    WHERE
        u.plan_id IN (2 , 3)
    GROUP BY s.song_name
    ORDER BY s.song_name);
