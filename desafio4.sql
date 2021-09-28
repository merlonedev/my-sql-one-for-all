CREATE VIEW top_3_artistas
AS
SELECT
  a.artista
AS
  `artista`,
  COUNT(s.usuario_id)
AS
  `seguidores`
FROM
  SpotifyClone.seguindo s
INNER JOIN
  SpotifyClone.artistas a
ON
  a.artista_id = s.artista_id
GROUP BY
  `artista`
ORDER BY
  `seguidores`
DESC,
  `artista`
LIMIT 3;