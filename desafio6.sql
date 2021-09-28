CREATE VIEW faturamento_atual AS
    SELECT 
        ROUND(MIN(plan.plano_preco), 2) AS `faturamento_minimo`,
        ROUND(MAX(plan.plano_preco), 2) AS `faturamento_maximo`,
        ROUND(AVG(plan.plano_preco), 2) AS `faturamento_medio`,
        ROUND(SUM(plan.plano_preco), 2) AS `faturamento_total`
    FROM
        Plano AS plan
  INNER JOIN
        SpotifyClone.Usuario AS us ON us.plano_id = plan.plano_id;
