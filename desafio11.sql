CREATE VIEW cancoes_premium AS
SELECT c.nome AS `nome`, COUNT(uh.usuario_id) AS `reproducoes` 
FROM cancoes AS c
INNER JOIN usuario_historico AS uh
ON uh.cancao_id = c.id
INNER JOIN usuarios AS u
ON u.id = uh.usuario_id
WHERE u.plano_id IN (2, 3)
GROUP BY `nome`
ORDER BY `nome`;
