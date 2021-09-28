CREATE VIEW perfil_artistas AS
SELECT a.artist artista, am.album album,
(SELECT COUNT(ua.user_id) FROM user_artist ua
WHERE a.artist_id = ua.artist_id) seguidores
FROM artists a
JOIN albums am ON am.artist_id = a.artist_id
ORDER BY seguidores DESC, artista, album;
