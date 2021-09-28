CREATE VIEW top_2_hits_do_momento
AS SELECT
  s.song AS 'cancao',
  COUNT(h.song_id) AS 'reproducoes'
FROM SpotifyClone.songs AS s
JOIN SpotifyClone.histories AS h
ON s.song_id = h.song_id
GROUP BY `cancao`
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2;

-- SELECT * FROM top_2_hits_do_momento;
