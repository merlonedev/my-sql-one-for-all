CREATE VIEW faturamento_atual AS
SELECT
  MIN(P.plan_value) AS `faturamento_minimo`,
  MAX(P.plan_value) AS `faturamento_maximo`,
  ROUND(AVG(P.plan_value), 2) AS `faturamento_medio`,
  SUM(P.plan_value) AS `faturamento_total`
FROM
  SpotifyClone.users AS U
JOIN
  SpotifyClone.plans AS P
ON
  U.plan_id = P.id;
