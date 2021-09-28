CREATE VIEW perfil_artistas AS
    SELECT 
        a.nome_artista AS artista,
        b.nome_album AS album,
        COUNT(b.nome_album) AS seguidores
    FROM
        ARTISTAS a
            JOIN
        ALBUNS b ON a.artista_id = b.artista_id
            JOIN
        USUARIO_ARTISTAS ua ON ua.artista_id = a.artista_id
    GROUP BY b.nome_album , a.nome_artista
    ORDER BY seguidores DESC , artista , album ASC;
