CREATE VIEW perfil_artistas AS
    SELECT 
        art.nome AS `artista`,
        alb.nome AS `album`,
        (SELECT 
                COUNT(ua.usuario_id)
            FROM
                SpotifyClone.usuarios_artistas AS ua
            WHERE
                art.artista_id = ua.artista_id) AS `seguidores`
    FROM
        SpotifyClone.albuns AS alb
            JOIN
        SpotifyClone.artistas AS art ON art.artista_id = alb.artista_id
    ORDER BY `seguidores` DESC , `artista` ASC , `album` ASC;
