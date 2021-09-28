CREATE VIEW perfil_artistas AS
SELECT
  a.artista,
  al.album,
  COUNT(*) AS seguidores
FROM
  seguindo s
  JOIN artista a ON s.artista_id = a.id
  JOIN album al ON al.artista_id = s.artista_id
GROUP BY
  a.artista,
  al.album
ORDER BY
  seguidores DESC,
  a.artista ASC,
  al.album ASC;