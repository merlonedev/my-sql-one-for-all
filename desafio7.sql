CREATE VIEW perfil_artistas AS
    SELECT 
        (SELECT 
                artista
            FROM
                SpotifyClone.artistas
            WHERE
                a.artista_id = artista_id) AS artista,
        album,
        (SELECT 
                COUNT(usuario_id)
            FROM
                SpotifyClone.artistas_seguidos_usuario
            WHERE
                a.artista_id = artista_id) AS seguidores
    FROM
        SpotifyClone.albuns AS a
    ORDER BY seguidores DESC , artista , album;
