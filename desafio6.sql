CREATE VIEW faturamento_atual AS
    SELECT 
        CONCAT(MIN(p.valor_plano), '.00') AS faturamento_minimo,
        ROUND(MAX(p.valor_plano), 2) AS faturamento_maximo,
        CONCAT(ROUND(AVG(p.valor_plano), 2), '0') AS faturamento_medio,
        ROUND(SUM(p.valor_plano), 2) AS faturamento_total
    FROM
        SpotifyClone.planos AS p
            INNER JOIN
        SpotifyClone.usuarios AS u ON p.plano_id = u.plano_id;
