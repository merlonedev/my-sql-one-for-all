CREATE VIEW top_2_hits_do_momento AS
SELECT
cancoes.nome AS cancao, count(usuarios.nome) AS reproducoes
FROM usuario_cancoes
JOIN
usuarios ON usuario_cancoes.usuario_id = usuarios.usuario_id
JOIN
cancoes ON cancoes.cancao_id = usuario_cancoes.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;
-- DROP VIEW top_2_hits_do_momento;
