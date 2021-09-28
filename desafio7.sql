CREATE VIEW perfil_artistas AS
    SELECT 
        ar.`name` AS `artista`,
        al.title AS `album`,
        (SELECT 
                COUNT(f.`user`)
            FROM
                SpotifyClone.`following` AS f
            WHERE
                f.artist = al.artist) AS `seguidores`
    FROM
        SpotifyClone.albums AS al
            INNER JOIN
        SpotifyClone.artists AS ar ON ar.id = al.artist
    ORDER BY `seguidores` DESC , `artista` , `album`;
