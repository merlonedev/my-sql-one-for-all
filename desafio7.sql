CREATE VIEW SpotifyClone.perfil_artistas AS
    SELECT 
        ar.artista AS artista,
        al.album AS album,
        (SELECT 
                COUNT(*)
            FROM
                usuario_seguindo
            WHERE
                artista_id = ar.id) AS seguidores
    FROM
        SpotifyClone.artista AS ar
            INNER JOIN
        SpotifyClone.album AS al ON ar.id = al.artista_id
    ORDER BY seguidores DESC , artista , album;
