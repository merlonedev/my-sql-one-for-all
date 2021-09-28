CREATE VIEW perfil_artistas AS
    SELECT 
        a.artist AS artista,
        al.album AS album,
        COUNT(a.artist) AS seguidores
    FROM
        SpotifyClone.artists AS a
            JOIN
        SpotifyClone.albuns AS al ON a.artist_id = al.artist_id
            JOIN
        SpotifyClone.followed AS f ON a.artist_id = f.artist_id
    GROUP BY artista , album
    ORDER BY seguidores DESC , artista , album;
