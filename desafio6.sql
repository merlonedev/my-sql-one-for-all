CREATE VIEW faturamento_atual AS
    SELECT 
        CAST(MIN(p.valor) AS DECIMAL(7,2)) AS `faturamento_minimo`,
        CAST(MAX(p.valor) AS DECIMAL(7,2)) AS `faturamento_maximo`,
        CAST(ROUND(SUM(p.valor) / COUNT(u.id), 2)AS DECIMAL(7,2)) AS `faturamento_medio`,
        CAST(SUM(p.valor) AS DECIMAL(7,2)) AS `faturamento_total`
    FROM
        Planos AS p
        JOIN
        Usuario AS u ON u.plano_id = p.id
