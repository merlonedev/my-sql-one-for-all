CREATE VIEW perfil_artistas AS
(SELECT
    ar.name AS `artista`,
    al.name AS `album`,
    (
    SELECT
        COUNT(user_id)
    FROM
        SpotifyClone.users_artists AS ua
    WHERE
        ar.id = ua.artist_id
    GROUP BY
        ua.artist_id
    ) AS `seguidores`
FROM
    SpotifyClone.artists AS ar
        JOIN
    SpotifyClone.albums AS al ON ar.id = al.artist_id
ORDER BY `seguidores` DESC, `artista`);
