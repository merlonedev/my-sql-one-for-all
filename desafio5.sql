CREATE VIEW top_2_hits_do_momento AS 
  SELECT
    s.song_name AS `cancao`,
    COUNT(us.id_user) AS `reproducoes`
  FROM
    SpotifyClone.user_songs AS us
  JOIN SpotifyClone.songs AS s ON us.id_song = s.id_song
  GROUP BY `cancao`
  ORDER BY `reproducoes` DESC, `cancao`
  LIMIT 2;
