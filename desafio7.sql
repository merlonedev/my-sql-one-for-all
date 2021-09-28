CREATE VIEW perfil_artistas AS
    SELECT 
        art.artista,
        alb.album,
        (SELECT 
                COUNT(*)
            FROM
                SpotifyClone.artista_seguidores aseg
            WHERE
                aseg.artista_id = art.artista_id) AS seguidores
    FROM
        SpotifyClone.artistas art
            JOIN
        SpotifyClone.albuns alb ON art.artista_id = alb.artista_id
    ORDER BY seguidores DESC , artista , album;
