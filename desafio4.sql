CREATE VIEW top_3_artistas AS
SELECT 
name artista,
(SELECT COUNT(*)
  FROM SpotifyClone.follower_artist
  WHERE artist_id = a.artist_id
  GROUP BY artist_id) seguidores
FROM SpotifyClone.artists a
ORDER BY seguidores DESC, artista
LIMIT 3;
