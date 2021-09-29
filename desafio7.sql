CREATE VIEW perfil_artistas AS
    SELECT 
        a.nome_artista AS 'artista',
        al.nome_album AS 'album',
        COUNT(al.album_id) AS 'seguidores'
    FROM
        SpotifyClone.albuns AS al
            INNER JOIN
        SpotifyClone.artistas AS a ON al.artist_id = a.artista_id
            INNER JOIN
        SpotifyClone.seguindo_artistas AS sa ON al.artist_id = sa.artista_id
    GROUP BY al.nome_album , a.nome_artista
    ORDER BY seguidores DESC , artista , album;
