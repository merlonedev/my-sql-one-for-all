CREATE VIEW top_3_artistas AS
    SELECT 
        a.name AS `artista`,
        COUNT(u.name) AS `seguidores`
    FROM
        SpotifyClone.following AS f
            INNER JOIN
        SpotifyClone.artists AS a ON f.artist = a.id
            INNER JOIN
        SpotifyClone.users AS u ON f.user = u.id
    GROUP BY f.artist
    HAVING `seguidores` > 1
    ORDER BY `seguidores` DESC , `artista` ASC
    LIMIT 3;
