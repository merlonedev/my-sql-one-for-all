CREATE VIEW perfil_artistas AS
    SELECT 
        a.nome AS artista,
        ab.nome AS album,
        COUNT(rs.artista_id) AS seguidores
    FROM
        albuns AS ab
            INNER JOIN
        artistas AS a ON a.artista_id = ab.artista_id
            INNER JOIN
        relacao_seguidores AS rs ON rs.artista_id = ab.artista_id
    GROUP BY `album` , `artista`
    ORDER BY `seguidores` DESC , `artista` , `album`;
