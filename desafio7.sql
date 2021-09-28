CREATE VIEW perfil_artistas AS
    SELECT 
        artists.artist_name AS artista,
        albums.album_title AS album,
        COUNT(follow.artist_id) AS seguidores
    FROM
        SpotifyClone.artists AS artists
            INNER JOIN
        SpotifyClone.albums AS albums ON artists.artist_id = albums.artist_id
            INNER JOIN
        SpotifyClone.user_follows AS follow ON artists.artist_id = follow.artist_id
    GROUP BY artista , album
    ORDER BY seguidores DESC , artista , album;
