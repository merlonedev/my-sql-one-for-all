CREATE VIEW faturamento_atual
AS
SELECT
  FORMAT(MIN(p.valor), 2)
AS
  `faturamento_minimo`,
  FORMAT(MAX(p.valor), 2)
AS
  `faturamento_maximo`,
  FORMAT(ROUND(AVG(p.valor), 1), 2)
AS
  `faturamento_medio`,
  FORMAT(SUM(p.valor), 2)
AS
  `faturamento_total`
FROM
  SpotifyClone.usuarios u
INNER JOIN
  SpotifyClone.planos p
ON p.plano_id = u.plano_id;
