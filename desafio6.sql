CREATE VIEW SpotifyClone.faturamento_atual AS
    SELECT 
        (SELECT 
                FORMAT(MIN(valor), 2)
            FROM
                SpotifyClone.plano) AS faturamento_minimo,
        (SELECT 
                FORMAT(MAX(valor), 2)
            FROM
                SpotifyClone.plano) AS faturamento_maximo,
        (SELECT 
                FORMAT(ROUND(SUM(valor) / 4, 2), 2)
            FROM
                SpotifyClone.plano) AS faturamento_medio,
        (SELECT 
                FORMAT(SUM(valor), 2)
            FROM
                SpotifyClone.plano) AS faturamento_total;
