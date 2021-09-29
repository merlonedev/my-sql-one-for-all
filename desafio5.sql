CREATE VIEW top_2_hits_do_momento AS
SELECT
  S.song_name AS `cancao`, 
  COUNT(US.song_id) AS `reproducoes`
FROM
  SpotifyClone.user_song AS US
JOIN
  SpotifyClone.songs AS S
ON
  US.song_id = S.id
GROUP BY
  US.song_id
ORDER BY
  `reproducoes` DESC,
  `cancao`
LIMIT 2;
