CREATE VIEW perfil_artistas AS
    SELECT
        seg.artista, ab.titulo AS `album`, seg.seguidores
    FROM
        SpotifyClone.albuns AS `ab`
    JOIN
        (SELECT
            a.nome AS `artista`,
            COUNT(s.usuario_id) AS `seguidores`,
            s.artista_id
        FROM
            SpotifyClone.seguidores AS `s`
        JOIN SpotifyClone.artistas AS `a` ON s.artista_id = a.id
        GROUP BY s.artista_id) AS `seg` ON ab.artista_id = seg.artista_id
    ORDER BY seg.seguidores DESC , seg.artista , `album`;
