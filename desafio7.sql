CREATE VIEW perfil_artistas AS
    SELECT 
        a.artista AS 'artista',
        al.album AS 'album',
        COUNT(s.usuario_id) AS 'seguidores'
    FROM
        SpotifyClone.artistas a
            INNER JOIN
        SpotifyClone.albuns al ON al.artista_id = a.artista_id
            INNER JOIN
        SpotifyClone.seguindo s ON s.artista_id = al.artista_id
    GROUP BY `artista` , `album`
    ORDER BY `seguidores` DESC , `artista` , `album`;
