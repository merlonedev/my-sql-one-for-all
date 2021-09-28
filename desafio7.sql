CREATE VIEW perfil_artistas AS
    SELECT 
        sing.artista_nome AS `artista`,
        alb.album_nome AS `album`,
        COUNT(follow.usuario_id) AS `seguidores`
    FROM
        SpotifyClone.Artista AS sing
            INNER JOIN
        SpotifyClone.Album AS alb ON alb.artista_id = sing.artista_id
            INNER JOIN
        SpotifyClone.Seguindo AS follow ON follow.artista_id = sing.artista_id
    GROUP BY `artista` , `album`
    ORDER BY `seguidores` DESC , `artista` , `album`;
