CREATE VIEW faturamento_atual AS
    SELECT 
        MIN(valor) AS faturamento_minimo,
        MAX(valor) AS faturamento_maximo,
        ROUND(AVG(valor), 2) AS faturamento_medio,
        ROUND(SUM(valor), 2) AS faturamento_total
    FROM
        (SELECT 
            p.valor
        FROM
            SpotifyClone.planos p
        JOIN SpotifyClone.usuarios u ON u.id_plano = p.id_plano) AS faturamento;
