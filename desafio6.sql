CREATE VIEW faturamento_atual AS
SELECT min(s.value) AS 'faturamento_minimo',
  max(s.value) AS 'faturamento_maximo',
  ROUND(avg(s.value), 2) AS 'faturamento_medio',
  sum(s.value) AS 'faturamento_total'
FROM SpotifyClone.signatures AS s
  INNER JOIN SpotifyClone.users AS u ON s.signature_id = u.signature_id;
