CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        s.title AS cancao, COUNT(us.song_id) AS reproducoes
    FROM
        SpotifyClone.user_song AS us
            JOIN
        SpotifyClone.songs AS s ON us.song_id = s.id
    GROUP BY s.title
    ORDER BY reproducoes DESC , cancao
    LIMIT 2;
