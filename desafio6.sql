CREATE VIEW faturamento_atual AS
    SELECT 
        MIN(sub.subscription_price) AS `faturamento_minimo`,
        MAX(sub.subscription_price) AS `faturamento_maximo`,
        ROUND(AVG(sub.subscription_price), 2) AS `faturamento_medio`,
        SUM(sub.subscription_price) AS `faturamento_total`
    FROM
        SpotifyClone.subscriptions AS sub
            INNER JOIN
        SpotifyClone.users AS users ON sub.subscription_id = users.subscription_id;
