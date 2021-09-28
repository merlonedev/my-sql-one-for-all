CREATE VIEW perfil_artistas AS
SELECT
ar.artista_name AS artista,
al.album_name AS album,
(SELECT COUNT(*) FROM SpotifyClone.seguindo_artistas as sa WHERE sa.artista_id = al.artista_id) AS seguidores
FROM SpotifyClone.albums AS al
JOIN SpotifyClone.artistas AS ar ON ar.artista_id = al.artista_id
ORDER BY seguidores DESC, artista;
