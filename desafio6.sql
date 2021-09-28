CREATE VIEW faturamento_atual AS
    SELECT 
        MIN(s.subscribe_value) AS faturamento_minimo,
        MAX(s.subscribe_value) AS faturamento_maximo,
        ROUND(AVG(s.subscribe_value), 2) AS faturamento_medio,
        SUM(s.subscribe_value) AS faturamento_total
    FROM
        SpotifyClone.subscribe AS s
            JOIN
        SpotifyClone.users AS u ON u.subscribe_id = s.subscribe_id;
