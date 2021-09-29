-- Desafio 4

CREATE VIEW SpotifyClone.top_3_artistas AS
SELECT 
  a.artist_name AS artista, COUNT(u.user_id) AS seguidores
FROM
  SpotifyClone.artistas AS a
      JOIN
  SpotifyClone.user_follow AS f ON a.artist_id = f.artist_id
      JOIN
  SpotifyClone.usuarios AS u ON f.user_id = u.user_id
GROUP BY artista
ORDER BY seguidores DESC , a.artist_name
LIMIT 3;
