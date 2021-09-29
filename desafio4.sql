CREATE VIEW top_3_artistas AS 
SELECT 
name AS artista,
COUNT(ua.user_id) AS seguidores
FROM
SpotifyClone.artists AS a
JOIN
SpotifyClone.users_artists AS ua ON a.artist_id = ua.artist_id
GROUP BY artista
ORDER BY seguidores DESC, artista ASC
LIMIT 3;
