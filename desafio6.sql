CREATE VIEW faturamento_atual AS
    SELECT 
        CONCAT(MIN(p.valor_plano), '.00') AS `faturamento_minimo`,
        CONCAT(ROUND(MAX(p.valor_plano), 2)) AS `faturamento_maximo`,
        CONCAT(ROUND(AVG(p.valor_plano), 1), '0') AS `faturamento_medio`,
        CONCAT(ROUND(SUM(p.valor_plano), 2)) AS `faturamento_total`
    FROM
        SpotifyClone.usuarios u
            INNER JOIN
        SpotifyClone.planos p ON u.plano_id = p.plano_id
;
