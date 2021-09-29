CREATE VIEW top_2_hits_do_momento AS
SELECT S.song_name AS "cancao", COUNT(H.user_id) AS "reproducoes"
FROM SpotifyClone.historic AS H
INNER JOIN SpotifyClone.songs AS S
ON S.song_id = H.song_id
GROUP BY S.song_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;
