CREATE VIEW top_2_hits_do_momento AS
  SELECT s.name AS `cancao`,
  COUNT(u_s.song_id) AS `reproducoes`
  FROM SpotifyClone.user_song AS u_s
  JOIN SpotifyClone.songs AS s ON u_s.song_id = s.id
  GROUP BY `cancao`
  ORDER BY `reproducoes` DESC, `cancao` ASC LIMIT 2;
