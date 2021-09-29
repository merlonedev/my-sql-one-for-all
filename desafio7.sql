CREATE VIEW perfil_artistas AS
    SELECT 
        a.name AS artista,
        al.name AS album,
        (SELECT 
                COUNT(*)
            FROM
                SpotifyClone.users_follows f
            WHERE
                f.artist_id = a.id) AS seguidores
    FROM
        SpotifyClone.artists a
            JOIN
        SpotifyClone.albums al ON al.artist_id = a.id
	ORDER BY seguidores DESC , artista , album;
