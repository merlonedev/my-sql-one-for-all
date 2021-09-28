CREATE VIEW perfil_artistas AS
SELECT 
a.name artista,
ab.name album,
COUNT(f.artist_id) seguidores
FROM SpotifyClone.artists a
JOIN SpotifyClone.albums ab ON a.artist_id = ab.artist_id
JOIN SpotifyClone.follower_artist f ON a.artist_id = f.artist_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista, album;
