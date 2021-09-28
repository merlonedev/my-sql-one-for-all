CREATE VIEW top_3_artistas AS
SELECT 
a.artist_name AS artista, COUNT(uf.user_id) as seguidores
from
SpotifyClone.artists AS a
INNER JOIN
SpotifyClone.user_follow AS uf ON a.artist_id = uf.artist_id 
Group by a.artist_name
Order by COUNT(uf.user_id) DESC, a.artist_name ASC
limit 3;
