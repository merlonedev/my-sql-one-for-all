CREATE VIEW perfil_artistas AS
    SELECT 
        art.artista_nome AS `artista`,
        alb.album_nome AS `album`,
        COUNT(seg.usuario_id) AS `seguidores`
    FROM
        SpotifyClone.Artista AS art
            INNER JOIN
        SpotifyClone.Album AS alb ON alb.artista_id = art.artista_id
            INNER JOIN
        SpotifyClone.Seguindo AS seg ON seg.artista_id = art.artista_id
    GROUP BY `artista` , `album`
    ORDER BY `seguidores` DESC , `artista` , `album`;
