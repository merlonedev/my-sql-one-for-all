CREATE VIEW SpotifyClone.faturamento_atual AS
    SELECT 
        FORMAT(MIN(valor), 2) AS faturamento_minimo,
        FORMAT(MAX(valor), 2) AS faturamento_maximo,
        FORMAT(AVG(valor), 2) AS faturamento_medio,
        FORMAT(SUM(valor), 2) AS faturamento_total
    FROM
        SpotifyClone.usuarios AS u
            INNER JOIN
        SpotifyClone.planos AS p ON u.plano_id = p.id;
