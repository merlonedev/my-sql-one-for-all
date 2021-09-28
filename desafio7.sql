CREATE VIEW perfil_artistas AS
    SELECT 
        a.artista_nome AS artista,
        al.album AS album,
        COUNT(seg.usuario_id) AS seguidores
    FROM
        Artista AS a
            INNER JOIN
        Album AS al ON a.id = al.artista_id
            INNER JOIN
        Seguindo_artistas AS seg ON a.id = seg.artista_id
    GROUP BY a.artista_nome , al.album
    ORDER BY seguidores DESC , artista ASC;
