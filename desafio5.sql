CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        s.song_name AS cancao, COUNT(user_id) as reproducoes
        from
        SpotfiyClone.songs AS s
            INNER JOIN
        SpotfiyClone.histories AS h ON h.song_id = s.song_id 
        Group by s.song_name
        Order by COUNT(user_id) DESC, s.song_name ASC
        limit 2;
