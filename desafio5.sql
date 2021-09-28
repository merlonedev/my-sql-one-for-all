CREATE VIEW top_2_hits_do_momento AS
SELECT s.nome AS `cancao`,
COUNT(h.musica_id) AS `reproducoes`
FROM SpotifyClone.musica AS s
INNER JOIN SpotifyClone.hist_rep AS h
ON s.musica_id = h.musica_id
GROUP BY `cancao`
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2;
