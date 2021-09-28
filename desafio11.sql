CREATE VIEW cancoes_premium AS
  SELECT
    s.song_name AS `nome`,
    COUNT(us.id_user) AS `reproducoes`
  FROM
    SpotifyClone.user_songs AS us
  JOIN SpotifyClone.users AS u ON us.id_user = u.id_user
  JOIN SpotifyClone.songs AS s ON us.id_song = s.id_song
  WHERE u.id_plan != 1
  GROUP BY `nome`
  ORDER BY `nome`;
