CREATE VIEW cancoes_premium AS
    SELECT 
        s.title AS nome, COUNT(us.song_id) AS reproducoes
    FROM
        SpotifyClone.user AS u
            JOIN
        SpotifyClone.user_song AS us ON u.id = us.user_id
            JOIN
        SpotifyClone.songs AS s ON us.song_id = s.id
    WHERE
        u.plan_id IN (2 , 3)
    GROUP BY nome
    ORDER BY nome;
