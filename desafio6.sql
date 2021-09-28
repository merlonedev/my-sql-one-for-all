CREATE VIEW SpotifyClone.faturamento_atual AS
    SELECT 
        (SELECT 
                MIN(valor)
            FROM
                SpotifyClone.plano) AS faturamento_minimo,
        (SELECT 
                MAX(valor)
            FROM
                SpotifyClone.plano) AS faturamento_maximo,
        (SELECT 
                ROUND(SUM(valor) / 4, 2)
            FROM
                SpotifyClone.plano) AS faturamento_medio,
        (SELECT 
                SUM(valor)
            FROM
                SpotifyClone.plano) AS faturamento_total;
