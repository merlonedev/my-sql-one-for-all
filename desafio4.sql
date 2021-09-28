CREATE VIEW top_3_artistas AS
    SELECT 
        A.artista_nome AS artista, COUNT(S.usuario_id) AS seguidores
    FROM
        SpotifyClone.Artista AS A
            INNER JOIN
        SpotifyClone.Seguidores AS S ON A.artista_id = S.artista_id
    GROUP BY A.artista_nome
    ORDER BY `seguidores` DESC , A.artista_nome
    LIMIT 3;
