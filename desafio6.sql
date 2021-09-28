CREATE VIEW faturamento_atual AS
    SELECT 
        ROUND(MIN(pl.plano_preco), 2) AS `faturamento_minimo`,
        ROUND(MAX(pl.plano_preco), 2) AS `faturamento_maximo`,
        ROUND(AVG(pl.plano_preco), 2) AS `faturamento_medio`,
        ROUND(SUM(pl.plano_preco), 2) AS `faturamento_total`
    FROM
        Plano AS pl
INNER JOIN
        SpotifyClone.Usuario AS us ON us.plano_id = pl.plano_id;
