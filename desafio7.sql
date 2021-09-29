CREATE VIEW perfil_artistas AS
    SELECT 
        artistas.artista AS artista,
        albuns.album AS album,
        COUNT(usuariosArtistas.usuario_id) AS seguidores
    FROM
        albuns
            JOIN
        artistas ON albuns.artista_id = artistas.artista_id
            JOIN
        usuariosArtistas ON albuns.artista_id = usuariosArtistas.artista_id
    GROUP BY artista , album
    ORDER BY seguidores DESC , artista , album;
