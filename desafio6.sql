CREATE VIEW faturamento_atual AS
    SELECT 
        MIN(planos.valor_plano) AS faturamento_minimo,
        MAX(planos.valor_plano) AS faturamento_maximo,
        ROUND(AVG(planos.valor_plano), 2) AS faturamento_medio,
        SUM(planos.valor_plano) AS faturamento_total
    FROM
        usuarios
            JOIN
        planos ON planos.plano_id = usuarios.plano_id;
