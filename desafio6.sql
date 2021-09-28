CREATE VIEW faturamento_atual AS
    SELECT 
        MIN(pl.valor_plano) AS 'faturamento_minimo',
        MAX(pl.valor_plano) AS 'faturamento_maximo',
        ROUND(AVG(pl.valor_plano), 2) AS 'faturamento_medio',
        SUM(pl.valor_plano) AS 'faturamento_total'
    FROM
        usuarios AS us
            JOIN
        planos AS pl ON us.plano_id = pl.plano_id;
