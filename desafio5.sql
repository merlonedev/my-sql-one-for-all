CREATE VIEW top_2_hits_do_momento AS SELECT 
    c.cancao_titulo AS cancao,
    COUNT(h.cancao_id) AS reproducoes
FROM
    SpotifyClone.cancoes AS c
INNER JOIN SpotifyClone.histor_reprod as h
ON h.cancao_id = c.cancao_id
GROUP BY c.cancao_titulo
ORDER BY reproducoes DESC, c.cancao_titulo
LIMIT 2;
