CREATE VIEW faturamento_atual AS
SELECT 
MIN(p.valor) AS faturamento_minimo,
MAX(p.valor) AS faturamento_maximo,
concat(round(avg(p.valor), 2), '') AS faturamento_medio,
concat(round(SUM(p.valor),2), '') AS faturamento_total
FROM
USUARIO u
JOIN
PLANO p ON u.plano_id = p.plano_id;
