CREATE VIEW top_3_artistas AS
SELECT A.artist_name AS "artista",
COUNT(F.user_id) AS "seguidores"
FROM SpotifyClone.follower AS F
INNER JOIN SpotifyClone.artists AS A ON F.artist_id = A.artist_id
GROUP BY A.artist_id
ORDER BY seguidores DESC, artista
LIMIT 3;