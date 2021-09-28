CREATE VIEW top_2_hits_do_momento AS
SELECT m.musica AS cancao, COUNT(hr.user_id) AS reproducoes
FROM SpotifyClone.musicas AS m
INNER JOIN SpotifyClone.historic AS hr
ON m.musica_id = hr.musica_id
GROUP BY `cancao` ORDER BY `reproducoes` DESC, `cancao` LIMIT 2;
