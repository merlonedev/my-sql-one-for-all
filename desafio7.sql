CREATE VIEW perfil_artistas AS
    SELECT
        a.name AS artista,
        al.title AS album,
        COUNT(ua.user_id) AS seguidores
    FROM
        SpotifyClone.artists AS a
            INNER JOIN
        SpotifyClone.albuns AS al ON al.artist_id = a.artist_id
            INNER JOIN
        SpotifyClone.user_artist AS ua ON ua.artist_id = a.artist_id
    GROUP BY `album` , `artista`
    ORDER BY `seguidores` DESC , `artista`, `album`;
