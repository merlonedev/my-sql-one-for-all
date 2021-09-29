CREATE VIEW faturamento_atual AS
    SELECT 
        ROUND(MIN(p.plano_valor), 2) AS faturamento_minimo,
        ROUND(MAX(p.plano_valor), 2) AS faturamento_maximo,
        ROUND(AVG(p.plano_valor), 2) AS faturamento_medio,
        ROUND(SUM(p.plano_valor), 2) AS faturamento_total
    FROM
        SpotifyClone.planos AS p
            INNER JOIN
        SpotifyClone.usuarios AS u ON p.plano_id = u.plano_id;
