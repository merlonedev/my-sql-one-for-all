CREATE VIEW historico_reproducao_usuarios
AS SELECT
  u.user AS 'usuario', 
  s.song AS 'nome' 
FROM SpotifyClone.users AS u
JOIN SpotifyClone.histories AS h
ON u.user_id = h.user_id
JOIN SpotifyClone.songs AS s
ON h.song_id = s.song_id
ORDER BY `usuario`, `nome`;

-- SELECT * FROM historico_reproducao_usuarios;
