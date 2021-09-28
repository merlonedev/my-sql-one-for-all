CREATE VIEW cancoes_premium AS
    (SELECT 
        s.song_name AS 'nome', COUNT(us.song_id) AS 'reproducoes'
    FROM
        songs s
            JOIN
        user_songs_history us ON us.song_id = s.song_id
    GROUP BY s.song_name
    ORDER BY s.song_name;);
