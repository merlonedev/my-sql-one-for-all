CREATE VIEW faturamento_atual AS
SELECT
MIN(planos.valor) AS faturamento_minimo, MAX(planos.valor) AS faturamento_maximo,
(SELECT ROUND(AVG(planos.valor), 2)
FROM usuarios JOIN planos
ON usuarios.plano_id = planos.plano_id) AS faturamento_medio,
SUM(planos.valor) AS faturamento_total
FROM planos;
-- DROP VIEW faturamento_atual;
