CREATE VIEW top_3_artistas AS
SELECT
  a.artista,
  COUNT(*) AS seguidores
FROM
  seguindo s
  JOIN artista a ON a.id = s.artista_id
GROUP BY
  s.artista_id
ORDER BY
  seguidores DESC,
  a.artista ASC
LIMIT
  3;
