CREATE VIEW cancoes_premium AS
    SELECT 
        s.name AS nome, COUNT(h.user_id) AS reproducoes
    FROM
        SpotifyClone.songs s
            JOIN
        SpotifyClone.users_history h ON h.song_id = s.id
            JOIN
        SpotifyClone.users u ON u.id = h.user_id
            JOIN
        SpotifyClone.plans p ON u.plan_id = p.id
    WHERE
        p.id <> 1
    GROUP BY nome
    ORDER BY nome;
