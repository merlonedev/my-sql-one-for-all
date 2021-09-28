CREATE VIEW cancoes_premium
AS
SELECT
  ca.cancao
AS
  `nome`,
  COUNT(re.usuario_id)
AS
  `reproducoes`
FROM
  SpotifyClone.cancoes ca
INNER JOIN
  SpotifyClone.usuarios us
ON us.usuario_id
BETWEEN
  2
AND
  3
INNER JOIN
  SpotifyClone.reproducoes re
ON
  re.usuario_id = us.usuario_id
WHERE
  re.cancao_id = ca.cancao_id
GROUP BY
  `nome`
ORDER BY
`nome`;
