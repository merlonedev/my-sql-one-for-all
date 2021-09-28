CREATE VIEW historico_reproducao_usuarios
AS
SELECT
	u.usuario
AS
  `usuario`,
  c.cancao
AS
  `nome`
FROM
  SpotifyClone.reproducoes r
INNER JOIN
  SpotifyClone.usuarios u
ON
  u.usuario_id = r.usuario_id
INNER JOIN
  SpotifyClone.cancoes c
ON
  c.cancao_id = r.cancao_id
ORDER BY
  `usuario`, `nome`;
