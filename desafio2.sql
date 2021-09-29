CREATE VIEW estatisticas_musicais AS
SELECT
  COUNT(id) AS `cancoes`,
  (SELECT COUNT(id) FROM SpotifyClone.artists) AS `artistas`,
  (SELECT COUNT(Id) FROM SpotifyClone.albums)  AS `albuns`
FROM
  SpotifyClone.songs;
