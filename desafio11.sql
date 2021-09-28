CREATE VIEW cancoes_premium AS
SELECT
m.name nome,
COUNT(h.music_id) reproducoes
FROM SpotifyClone.history h
JOIN SpotifyClone.users u
ON (h.user_id = u.user_id) AND (u.plan_id = 2 OR u.plan_id = 3)
JOIN SpotifyClone.musics m ON h.music_id = m.music_id
GROUP BY nome
ORDER BY nome;
