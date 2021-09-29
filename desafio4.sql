CREATE VIEW top_3_artistas AS
    SELECT 
        a.nome_artista AS 'artista',
        COUNT(sa.artista_id) AS 'seguidores'
    FROM
        SpotifyClone.seguindo_artistas AS sa
            INNER JOIN
        SpotifyClone.artistas AS a ON sa.artista_id = a.artista_id
    GROUP BY a.nome_artista
    ORDER BY seguidores DESC , a.nome_artista
    LIMIT 3;