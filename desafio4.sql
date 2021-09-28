CREATE VIEW top_3_artistas AS
SELECT ar.artist_name AS 'artista',
  COUNT(fl.artist_id) AS 'seguidores'
FROM SpotifyClone.artists AS ar
  INNER JOIN SpotifyClone.following_list AS fl ON ar.artist_id = fl.artist_id
GROUP BY fl.artist_id
ORDER BY seguidores DESC, 
  artista
LIMIT 3;
