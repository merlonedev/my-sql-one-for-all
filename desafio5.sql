CREATE VIEW top_2_hits_do_momento AS
  SELECT 
        songs.song_title AS cancao,
        COUNT(his.song_id) AS reproducoes
    FROM
        SpotifyClone.songs AS songs
            INNER JOIN
        SpotifyClone.rep_history AS his ON songs.song_id = his.song_id
    GROUP BY cancao
    ORDER BY reproducoes DESC , cancao
    LIMIT 2;
