CREATE VIEW faturamento_atual AS
	SELECT
		MIN(p.value) faturamento_minimo,
		MAX(p.value) faturamento_maximo,
		ROUND(AVG(p.value), 2) faturamento_medio,
        ROUND(SUM(p.value), 2) faturamento_total
	FROM plans p
    JOIN users u ON u.plan_id = p.plan_id;
