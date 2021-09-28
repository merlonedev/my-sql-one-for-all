CREATE VIEW faturamento_atual AS
    SELECT 
        MIN(plano_preco) AS faturamento_minimo,
        MAX(plano_preco) AS faturamento_maximo,
        ROUND(AVG(plano_preco), 2) AS faturamento_medio,
        ROUND(SUM(plano_preco), 2) AS faturamento_total
    FROM
        (SELECT 
            p.plano_preco
        FROM
            SpotifyClone.planos p
        JOIN SpotifyClone.users u ON u.plano_id = p.plano_id) AS faturamento;
