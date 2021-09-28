CREATE VIEW top_2_hits_do_momento AS
SELECT
c.cancao_name AS cancao,
COUNT(*) AS reproducoes
FROM SpotifyClone.historico_de_reproducoes AS h
JOIN SpotifyClone.cancoes AS c ON c.cancao_id = h.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;
