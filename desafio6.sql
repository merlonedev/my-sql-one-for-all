CREATE VIEW faturamento_atual AS 
  SELECT
    ROUND(MIN(p.plan_cost), 2) AS `faturamento_minimo`,
    ROUND(MAX(p.plan_cost), 2) AS `faturamento_maximo`,
    ROUND(AVG(p.plan_cost), 2) AS `faturamento_medio`,
    ROUND(SUM(p.plan_cost), 2) AS `faturamento_total`
  FROM
    SpotifyClone.users AS u
  JOIN SpotifyClone.plans AS p ON u.id_plan = p.id_plan;
