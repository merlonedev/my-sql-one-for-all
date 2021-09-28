CREATE VIEW perfil_artistas AS
SELECT ar.artist_name AS 'artista',
  al.album_title AS 'album',
  COUNT(fl.artist_id) AS 'seguidores'
FROM SpotifyClone.artists AS ar
  INNER JOIN SpotifyClone.albums AS al ON ar.artist_id = al.artist_id
  INNER JOIN SpotifyClone.following_list AS fl ON fl.artist_id = ar.artist_id
GROUP BY al.album_id
ORDER BY seguidores DESC,
  artista,
  album;
