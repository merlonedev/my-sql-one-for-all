CREATE VIEW historico_reproducao_usuarios AS
SELECT
u.nome AS `usuario`,
c.titulo AS `nome`
FROM usuario AS u
JOIN historico AS h ON h.usuario_id = u.usuario_id
JOIN cancoes AS c ON c.cancoes_id = h.cancoes_id
ORDER BY `usuario`, `nome`;
