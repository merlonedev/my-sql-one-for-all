CREATE VIEW perfil_artistas AS
    SELECT 
        artistas.nome_artista AS `artista`,
        albuns.album AS `album`,
        (SELECT 
                COUNT(seguidores.id_usuario)
            FROM
                tb_artistas_usuarios AS `seguidores`
            WHERE
                seguidores.id_artista = albuns.id_artista) AS `seguidores`
    FROM
        tb_artistas AS `artistas`
            INNER JOIN
        tb_albuns AS `albuns` ON albuns.id_artista = artistas.id_artista
    ORDER BY `seguidores` DESC , `artista` ASC, `album` ASC;
