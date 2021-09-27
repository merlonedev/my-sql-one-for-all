CREATE VIEW top_2_hits_do_momento AS
SELECT
  c.cancao,
  COUNT(*) AS reproducoes
FROM
  historico h
  JOIN cancoes c ON c.id = h.cancoes_id
GROUP BY
  c.cancao
ORDER BY
  reproducoes DESC,
  c.cancao ASC
LIMIT
  2;
