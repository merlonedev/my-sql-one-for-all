CREATE VIEW faturamento_atual AS
SELECT 
    ROUND(MIN(p.valor), 2) AS 'faturamento_minimo',
    ROUND(MAX(p.valor), 2) AS 'faturamento_maximo',
    ROUND(AVG(p.valor), 2) AS 'faturamento_medio',
    ROUND(SUM(p.valor), 2) AS 'faturamento_total'
FROM
    planos AS p
        JOIN
    usuarios AS u ON u.plano_id = p.id;
