CREATE VIEW top_2_hits_do_momento AS
    (SELECT 
        s.song_name AS 'cancao', COUNT(us.song_id) AS 'reproducoes'
    FROM
        songs s
            JOIN
        user_songs_history us ON us.song_id = s.song_id
    GROUP BY us.song_id
    ORDER BY COUNT(us.song_id) DESC , s.song_name ASC
    LIMIT 2);

