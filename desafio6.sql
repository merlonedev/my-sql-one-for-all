CREATE VIEW faturamento_atual AS
SELECT MIN(p.plano_preco) AS `faturamento_minimo`, MAX(p.plano_preco) faturamento_maximo,
ROUND(AVG(p.plano_preco), 2) faturamento_medio, SUM(p.plano_preco) faturamento_total
FROM spotifyclone.plano p
INNER JOIN spotifyclone.usuario u
ON p.plano_id = u.plano_id;
