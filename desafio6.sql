CREATE VIEW faturamento_atual AS
    SELECT 
    ROUND(MIN(p.`value`), 2) AS faturamento_minimo,
    ROUND(MAX(p.`value`), 2) AS faturamento_maximo,
    ROUND(AVG(p.`value`), 2) AS faturamento_medio,
    ROUND(SUM(p.`value`), 2) AS faturamento_total
FROM
    SpotifyClone.plans AS p
        JOIN
    SpotifyClone.user AS u ON p.id = u.plan_id;
