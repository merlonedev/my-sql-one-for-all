      CREATE VIEW historico_reproducao_usuario AS
    SELECT 
        u.usuario_name, c.cancao_name AS nome
    FROM
        SpotifyClone.usuarios AS u
            INNER JOIN
        SpotifyClone.historico AS h ON h.usuario_id = u.usuario_id
            INNER JOIN
        SpotifyClone.cancoes AS c ON h.cancao_id = c.cancao_id
    ORDER BY u.usuario_name , c.cancao_name;
