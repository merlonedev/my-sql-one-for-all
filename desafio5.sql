CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        s.song_name AS cancao, COUNT(uh.song_id) AS reproducoes
    FROM
        songs s
            INNER JOIN
        user_songs_history uh ON s.song_id = uh.song_id
    GROUP BY s.song_name
    ORDER BY COUNT(uh.song_id) DESC , s.song_name
    LIMIT 2;
