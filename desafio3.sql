CREATE VIEW estatisticas_musicais AS
  SELECT
    u.user_name AS `usuario`,
    s.song_name AS `nome`
  FROM
    SpotifyClone.user_songs AS us
  JOIN SpotifyClone.users AS u ON us.id_user = u.id_user
  JOIN SpotifyClone.songs AS s ON us.id_song = s.id_song
  ORDER BY `usuario`, `nome`;
