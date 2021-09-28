CREATE VIEW perfil_artistas AS
SELECT 
  si.singer_name AS 'artista',
  a.album_name AS 'album',
  COUNT(*) AS 'seguidores'
FROM
  SpotifyClone.singer AS si
JOIN
  SpotifyClone.singer_followers AS sf ON sf.singer_id = si.singer_id
JOIN
  SpotifyClone.album AS a ON a.singer_id = si.singer_id
GROUP BY a.album_id
ORDER BY seguidores DESC , artista , album;
