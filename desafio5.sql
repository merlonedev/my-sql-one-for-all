CREATE VIEW top_2_hits_do_momento AS
SELECT m.music_name AS cancao, COUNT(m.music_name) AS reproducoes FROM SpotifyClone.musics AS m
INNER JOIN SpotifyClone.`history` AS h ON h.music_id = m.music_id
GROUP BY h.music_id
ORDER BY COUNT(m.music_name) DESC, m.music_name
LIMIT 2;
