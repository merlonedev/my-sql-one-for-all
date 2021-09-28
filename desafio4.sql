CREATE VIEW top_3_artistas
AS SELECT
  artist AS 'artista',
  COUNT(f.user_id) AS `seguidores`
FROM SpotifyClone.artists AS a
JOIN SpotifyClone.`following` AS f
ON a.artist_id = f.artist_id
GROUP BY a.artist_id
ORDER BY `seguidores` DESC, artist
LIMIT 3;

-- SELECT * FROM top_3_artistas;
