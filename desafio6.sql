CREATE VIEW faturamento_atual AS
SELECT
MIN(P.plan_value) AS "faturamento_minimo",
MAX(P.plan_value) AS "faturamento_maximo",
ROUND(SUM(P.plan_value) / COUNT(U.user_id), 2) AS "faturamento_medio",
SUM(P.plan_value) AS "faturamento_total"
FROM plans AS P
INNER JOIN users AS U
ON P.plan_id = U.plan_id;