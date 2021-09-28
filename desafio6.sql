CREATE VIEW faturamento_atual AS
    SELECT 
        MIN(p.valor) AS faturamento_minimo,
        MAX(p.valor) AS faturamento_maximo,
        ROUND(AVG(p.valor), 2) AS faturamento_medio,
        SUM(p.valor) AS faturamento_total
    FROM
        usuarios AS u
            INNER JOIN
        planos AS p ON p.plano_id = u.plano_id;
