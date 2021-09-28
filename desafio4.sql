CREATE VIEW SpotifyClone.top_3_artistas AS
(SELECT
    a.name AS `artista`,
    (
    SELECT
        COUNT(user_id)
    FROM
        SpotifyClone.users_artists AS ua
    WHERE
        a.id = ua.artist_id
    GROUP BY
        ua.artist_id
    ) AS `seguidores`
FROM
    SpotifyClone.artists AS a
ORDER BY `seguidores` DESC, `artista`
LIMIT 3);
