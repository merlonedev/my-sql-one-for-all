CREATE VIEW perfil_artistas
AS
SELECT
  ar.artista
AS
  `artista`,
  al.album
AS
  `album`,
  (
    SELECT
      COUNT(*)
    FROM
      SpotifyClone.seguindo se
    WHERE
      se.artista_id = ar.artista_id
  )
AS
  `seguidores`
FROM
  SpotifyClone.albuns al
INNER JOIN
  SpotifyClone.artistas ar
ON
  ar.artista_id = al.artista_id
ORDER BY
  `seguidores` DESC,
  `artista`,
  `album`;