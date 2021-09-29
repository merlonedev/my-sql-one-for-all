CREATE VIEW top_3_artistas AS
    SELECT 
        artistas.artista AS artista,
        COUNT(usuarios.usuario_id) AS seguidores
    FROM
        usuariosArtistas
            JOIN
        usuarios ON usuariosArtistas.usuario_id = usuarios.usuario_id
            JOIN
        artistas ON usuariosArtistas.artista_id = artistas.artista_id
    GROUP BY artistas.artista
    ORDER BY seguidores DESC , artistas.artista
    LIMIT 3;
