CREATE VIEW faturamento_atual AS
    SELECT 
        MIN(valor_plano) AS `faturamento_minimo`,
        MAX(valor_plano) AS `faturamento_maximo`,
        (SELECT 
                ROUND(AVG(p.valor_plano), 2)
            FROM
                Usuario AS u
                    JOIN
                Plano AS p ON u.plano_id = p.id) AS `faturamento_medio`,
        ROUND(SUM(valor_plano), 2) AS `faturamento_total`
    FROM
        Plano;
