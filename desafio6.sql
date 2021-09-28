CREATE VIEW faturamento_atual AS
    SELECT 
        MIN(pl.plano_preco) AS faturamento_minimo,
        MAX(pl.plano_preco) AS faturamento_maximo,
        ROUND(AVG(pl.plano_preco), 2) AS faturamento_medio,
        SUM(pl.plano_preco) AS faturamento_total
    FROM
        Plano AS pl
INNER JOIN
        SpotifyClone.Usuario AS us ON us.plano_id = pl.plano_id;