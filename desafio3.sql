CREATE VIEW historico_reproducao_usuarios AS
SELECT u.nome AS `usuario`,
c.nome AS `nome`
FROM usuarios AS u
INNER JOIN usuario_historico AS uh
ON uh.usuario_id = u.id
INNER JOIN cancoes AS c
ON c.id = uh.cancao_id
ORDER BY `usuario`, `nome`;
