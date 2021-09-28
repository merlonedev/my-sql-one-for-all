CREATE VIEW top_2_hits_do_momento AS
    SELECT
        s.name AS cancao, COUNT(us.song_id) AS reproducoes
    FROM
        SpotifyClone.songs AS s
            INNER JOIN
        SpotifyClone.user_song AS us ON us.song_id = s.song_id
    GROUP BY us.song_id
    ORDER BY `reproducoes` DESC , `cancao`
    LIMIT 2;
