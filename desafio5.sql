CREATE VIEW top_2_hits_do_momento AS
SELECT c.nome AS `cancao`,
COUNT(uh.cancao_id) AS `reproducoes`
FROM cancoes AS c
INNER JOIN usuario_historico AS uh
ON uh.cancao_id = c.id
GROUP BY `cancao`
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2;
