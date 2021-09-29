CREATE VIEW faturamento_atual AS
    SELECT 
        MIN(PlanValue) AS 'faturamento_minimo',
        MAX(PlanValue) AS 'faturamento_maximo',
        ROUND(AVG(PlanValue), 2) AS 'faturamento_medio',
        SUM(PlanValue) AS 'faturamento_total'
    FROM
        plans
            JOIN
        users ON users.Plan_ID = plans.Plan_ID;
