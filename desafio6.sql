CREATE VIEW faturamento_atual AS
SELECT MIN(s.plano_valor) AS `faturamento_minimo`,
MAX(s.plano_valor) AS `faturamento_maximo`,
ROUND(AVG(s.plano_valor),2) AS `faturamento_medio`,
SUM(s.plano_valor) AS `faturamento_total`
FROM SpotifyClone.plano AS s
INNER JOIN SpotifyClone.usuario AS u
ON s.plano_id = u.plano_id;
