CREATE VIEW cancoes_premium AS
    SELECT 
        s.song_name AS nome, COUNT(h.user_id) AS reproducoes
    FROM
        SpotfiyClone.histories AS h 
        INNER JOIN SpotfiyClone.songs as s on s.song_id = h.song_id
        INNER JOIN SpotfiyClone.users as u on u.user_id = h.user_id
        where plan_id in (2, 3)
        group by s.song_name
        order by s.song_name ASC;
