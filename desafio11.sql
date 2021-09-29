CREATE VIEW cancoes_premium AS
SELECT
    s.name AS nome, COUNT(us.song_id) AS reproducoes
FROM
    songs AS s
        INNER JOIN
    user_song AS us ON us.song_id = s.song_id
        INNER JOIN
    users AS u ON u.user_id = us.user_id
WHERE
    u.plan_id = 2 OR u.plan_id = 3
GROUP BY `nome`
ORDER BY `nome`;
