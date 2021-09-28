CREATE VIEW top_3_artistas AS
    SELECT 
        A.artista AS 'artista', COUNT(US.artista_id) AS 'seguidores'
    FROM
        SpotifyClone.usuario_seguindo_artistas AS US
            INNER JOIN
        SpotifyClone.artistas AS A ON A.artista_id = US.artista_id
    GROUP BY artista
    ORDER BY seguidores DESC , artista
    LIMIT 3;
