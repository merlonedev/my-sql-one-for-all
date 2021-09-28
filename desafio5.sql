CREATE VIEW top_2_hits_do_momento AS
SELECT
c.titulo AS `cancao`,
COUNT(*) AS `reproducoes`
FROM  cancoes AS c
JOIN historico AS h ON h.cancoes_id = c.cancoes_id
GROUP BY `cancao`
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2;
