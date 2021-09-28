CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        s.song AS cancao, COUNT(sh.song_id) AS reproducoes
    FROM
        SpotifyClone.songs AS s
            JOIN
        SpotifyClone.songs_history AS sh ON s.song_id = sh.song_id
    GROUP BY cancao
    ORDER BY reproducoes DESC , cancao
    LIMIT 2;
