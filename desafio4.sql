CREATE VIEW top_3_artistas AS
SELECT artist_name AS artista,
COUNT(a.artist_name) AS seguidores FROM artists AS a
INNER JOIN `follows` AS f ON f.artist_id = a.artist_id
GROUP BY a.artist_name
ORDER BY COUNT(a.artist_name) DESC, a.artist_name
LIMIT 3;
