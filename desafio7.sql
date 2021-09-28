CREATE VIEW perfil_artistas AS
    SELECT 
    art.`name` AS artista,
    alb.title AS album,
    COUNT(ua.artist_id) AS seguidores
FROM
    SpotifyClone.artist AS art
        JOIN
    SpotifyClone.album AS alb ON art.id = alb.artist_id
        JOIN
    SpotifyClone.user_artist AS ua ON art.id = ua.artist_id
GROUP BY art.id , alb.title
ORDER BY seguidores DESC , artista , album;
