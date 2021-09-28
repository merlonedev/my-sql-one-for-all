CREATE VIEW top_2_hits_do_momento AS
SELECT c.cancao, COUNT(h.cancao_id) reproducoes
FROM
    SpotifyClone.historico h
        INNER JOIN
    SpotifyClone.cancoes c ON c.cancao_id = h.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC , cancao
LIMIT 2;
