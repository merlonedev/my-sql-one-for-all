CREATE VIEW faturamento_atual AS
SELECT 
    ROUND(MIN(p.valor), 2) AS `faturamento_minimo`,
    ROUND(MAX(p.valor), 2) AS `faturamento_maximo`,
    ROUND(AVG(p.valor), 2) AS `faturamento_medio`,
    ROUND(SUM(p.valor), 2) AS `faturamento_total`
FROM
    SpotifyClone.Planos AS p
        JOIN
    SpotifyClone.Usuarios AS u ON u.plano_id = p.id;
