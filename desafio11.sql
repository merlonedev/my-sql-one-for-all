CREATE VIEW cancoes_premium AS
SELECT
	s.name AS `nome`,
    COUNT(s.name) AS `reproducoes`
FROM SpotifyClone.user_song AS us
JOIN SpotifyClone.songs AS s ON us.song_id = s.id
JOIN SpotifyClone.users AS u ON us.user_id = u.id
WHERE u.plan IN(2, 3)
GROUP BY s.name
ORDER BY `nome`;
