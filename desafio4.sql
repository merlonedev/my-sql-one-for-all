CREATE VIEW top_3_artistas AS
    SELECT 
        a.nome AS artista, COUNT(rs.artista_id) AS seguidores
    FROM
        relacao_seguidores AS rs
            INNER JOIN
        artistas AS a ON a.artista_id = rs.artista_id
    GROUP BY `artista`
    ORDER BY `seguidores` DESC , `artista` ASC
    LIMIT 3;
