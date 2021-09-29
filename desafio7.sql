-- Desafio 7

CREATE VIEW perfil_artistas AS
SELECT 
ar.artist_name AS artista,
al.album_name AS album,
COUNT(uf.artist_id) AS seguidores
FROM
albums al
  INNER JOIN
artistas ar ON al.artist_id = ar.artist_id
  INNER JOIN
user_follow uf ON ar.artist_id = uf.artist_id
GROUP BY ar.artist_name , al.album_name
ORDER BY COUNT(uf.artist_id) DESC , ar.artist_name , al.album_name;
