CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        s.name AS cancao, COUNT(h.user_id) AS reproducoes
    FROM
        SpotifyClone.songs s
            JOIN
        SpotifyClone.users_history h ON s.id = h.song_id
    GROUP BY cancao
    ORDER BY reproducoes DESC , cancao
    LIMIT 2;
