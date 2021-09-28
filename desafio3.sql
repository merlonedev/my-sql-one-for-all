CREATE VIEW historico_reproducao_usuarios AS
SELECT 
usuarios.nome AS `usuario`, cancoes.nome AS `nome`
FROM usuario_cancoes
JOIN
usuarios ON usuario_cancoes.usuario_id = usuarios.usuario_id
JOIN
cancoes ON cancoes.cancao_id = usuario_cancoes.cancao_id
ORDER BY usuario ASC, nome ASC;
-- DROP VIEW historico_reproducao_usuarios;
