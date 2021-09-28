CREATE VIEW top_2_hits_do_momento AS 
SELECT
a.`name` AS artista,
al.title AS album,
COUNT(f.artist_id) AS seguidores
FROM SpotifyClone.artists AS a
INNER JOIN SpotifyClone.albums AS al
ON a.artist_id = al.artist_id
INNER JOIN SpotifyClone.follow AS f
ON f.artist_id = a.artist_id
GROUP BY album
ORDER BY seguidores DESC, artista, album;
