CREATE VIEW cancoes_premium AS
SELECT m.music_name AS nome,
COUNT(h.music_id) AS reproducoes
FROM SpotifyClone.musics AS m
INNER JOIN SpotifyClone.`history` AS h ON h.music_id = m.music_id
INNER JOIN SpotifyClone.users AS u ON h.user_id = u.user_id
WHERE u.plan_id = 2 OR u.plan_id = 3
GROUP BY h.music_id
ORDER BY m.music_name;
