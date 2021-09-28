CREATE VIEW faturamento_atual AS
SELECT MIN(p.valor) AS `faturamento_minimo`,
MAX(p.valor) AS `faturamento_maximo`,
ROUND((SUM(p.valor) / COUNT(u.id)), 2) AS `faturamento_medio`,
SUM(p.valor) AS `faturamento_total`
FROM planos AS p
INNER JOIN usuarios AS u
ON u.plano_id = p.id;
