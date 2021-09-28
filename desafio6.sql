CREATE VIEW faturamento_atual
AS SELECT
  MIN(sb.subscription_price) AS 'faturamento_minimo',
  MAX(sb.subscription_price) AS 'faturamento_maximo',
  ROUND((SUM(sb.subscription_price) / COUNT(u.user_id)),2) AS 'faturamento_medio',
  SUM(sb.subscription_price) AS 'faturamento_total'
FROM SpotifyClone.subscriptions AS sb
JOIN SpotifyClone.users AS u
ON sb.subscription_id = u.subscription_id;

-- SELECT * FROM faturamento_atual;
