CREATE VIEW perfil_artistas AS
    (SELECT 
        ar.artista,
        al.album,
        (SELECT 
                COUNT(*)
            FROM
                usuarios_seguindo us
            WHERE
                us.id_artista = ar.id_artista) AS seguidores
    FROM
        SpotifyClone.artistas ar
            JOIN
        SpotifyClone.albuns al ON al.id_artista = ar.id_artista
    ORDER BY 3 DESC , 1 , 2);
