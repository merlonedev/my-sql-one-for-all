CREATE VIEW top_2_hits_do_momento AS
SELECT
  c.cancao
AS
  `cancao`,
  COUNT(r.usuario_id)
AS
  `reproducoes`
FROM
  SpotifyClone.reproducoes r
INNER JOIN
  SpotifyClone.cancoes c
ON
  c.cancao_id = r.cancao_id
GROUP BY
  `cancao`
ORDER BY
  `reproducoes` DESC,
  `cancao`
LIMIT 2;