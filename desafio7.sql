CREATE VIEW perfil_artistas AS
    SELECT 
        ar.nome_artista AS artista,
        al.nome_album AS album,
        (SELECT 
                COUNT(usuario_id)
            FROM
                artistas_seguidos AS ars
            WHERE
                ar.artista_id = ars.artista_id) AS seguidores
    FROM
        artistas AS ar
            JOIN
        albuns AS al ON ar.artista_id = al.artista_id
    ORDER BY seguidores DESC , artista , album;
