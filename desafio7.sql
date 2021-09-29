CREATE VIEW perfil_artistas AS
SELECT
  AR.artist_name AS `artista`,
  AL.album_name AS `album`,
  S.`seguidores` AS `seguidores`
FROM
  SpotifyClone.albums AS AL
JOIN
  SpotifyClone.artists AS AR
ON
  AL.artist_id = AR.id
JOIN
  (
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
  ) AS S
ON
  AR.artist_name = S.`artista`
ORDER BY
  `seguidores` DESC,
  `artista`,
  `album`;
