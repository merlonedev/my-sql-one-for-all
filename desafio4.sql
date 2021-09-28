CREATE VIEW top_3_artistas AS
    SELECT 
        t2.artist AS `artista`, COUNT(t1.user_id) AS `seguidores`
    FROM
        SpotifyClone.follows AS `t1`
            INNER JOIN
        SpotifyClone.artists AS `t2` ON t1.artist_id = t2.artist_id
    GROUP BY `artista`
    ORDER BY `seguidores` DESC , `artista` ASC
    LIMIT 3;
