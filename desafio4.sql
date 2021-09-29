CREATE VIEW top_3_artistas AS
SELECT
  A.artist_name AS `artista`,
  COUNT(AU.artist_id) AS `seguidores`
FROM
  SpotifyClone.artist_user AS AU
JOIN
  SpotifyClone.artists AS A
ON
  AU.artist_id = A.id
GROUP BY
  AU.artist_id
ORDER BY
  `seguidores` DESC,
  `artista`
LIMIT 3;
