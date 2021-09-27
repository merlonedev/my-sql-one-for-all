CREATE VIEW top_2_hits_do_momento AS
SELECT
S.song_name AS cancao,
COUNT(S.song_id) AS reproducoes
FROM SpotifyClone.songs S
JOIN SpotifyClone.historicoMusicas HM
ON S.song_id = HM.song_id
GROUP BY cancao
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2;
