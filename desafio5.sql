CREATE VIEW top_2_hits_do_momento AS
SELECT 
    m.nome AS `cancao`,
    COUNT(uh.musica_id) AS `reproducoes`
FROM
    musicas AS m
        JOIN
    usuario_historico AS uh ON uh.musica_id = m.id
GROUP BY `cancao`
ORDER BY `reproducoes` DESC , `cancao`
LIMIT 2;
