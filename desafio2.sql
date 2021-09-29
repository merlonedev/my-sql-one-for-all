CREATE VIEW estatisticas_musicais AS SELECT
  COUNT(c.cancao_id) AS cancoes,
  COUNT(DISTINCT a.artista_id) AS artistas,
  COUNT(DISTINCT ab.album_id) AS albuns
FROM SpotifyClone.Cancao AS c
INNER JOIN SpotifyClone.Album AS ab
ON ab.album_id = c.album_id
INNER JOIN SpotifyClone.Artista AS a
ON ab.artista_id = a.artista_id;
