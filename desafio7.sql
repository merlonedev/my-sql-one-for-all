CREATE VIEW perfil_artistas AS
SELECT a.artist_name AS artista,
b.album_name AS album,
COUNT(f.artist_id) AS seguidores
FROM SpotifyClone.artists AS a
INNER JOIN SpotifyClone.albums AS b ON b.artist_id = a.artist_id
INNER JOIN SpotifyClone.`follows` as f ON f.artist_id = a.artist_id
GROUP BY f.artist_id, b.album_name
ORDER BY COUNT(f.artist_id) DESC, a.artist_name, b.album_name;
