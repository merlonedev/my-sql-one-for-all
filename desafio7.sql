CREATE VIEW perfil_artistas AS
    SELECT 
        ar.artista AS `artista`,
        al.album AS `album`,
        (SELECT 
                COUNT(*)
            FROM
                SpotifyClone.usuarios_artistas ua
            WHERE
                ua.artista_id = ar.artista_id) AS `seguidores`
    FROM
        SpotifyClone.artistas ar
            INNER JOIN
        SpotifyClone.albuns al ON ar.artista_id = al.artista_id
    ORDER BY `seguidores` DESC , `artista` , `album`
;
