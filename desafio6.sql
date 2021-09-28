CREATE VIEW faturamento_atual AS
    SELECT 
        MIN(P.plano_preco) AS faturamento_minimo,
        MAX(P.plano_preco) AS faturamento_maximo,
        ROUND(AVG(P.plano_preco), 2) AS faturamento_medio,
        SUM(P.plano_preco) AS faturamento_total
    FROM
        SpotifyClone.Plano AS P
            INNER JOIN
        SpotifyClone.Usuario AS U ON U.plano_id = P.plano_id;
