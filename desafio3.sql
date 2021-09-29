CREATE VIEW historico_reproducao_usuarios AS
SELECT
  U.user_name AS `usuario`,
  S.song_name AS `nome`
FROM
  user_song AS US
JOIN
  SpotifyClone.users AS U
ON
  US.user_id = U.id
JOIN
  SpotifyClone.songs as S
ON
  US.song_id = S.id
ORDER BY
  `usuario`,
  `nome`;
