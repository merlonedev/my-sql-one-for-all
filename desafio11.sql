CREATE VIEW SpotifyClone.cancoes_premium AS
    SELECT 
        c.cancao AS nome,
        (SELECT 
                COUNT(*)
            FROM
                SpotifyClone.usuario_historico AS uh
                    INNER JOIN
                SpotifyClone.usuario AS u ON uh.usuario_id = u.id
            WHERE
                cancao_id = c.id
                    AND u.plano_id IN (2 , 3)) AS reproducoes
    FROM
        SpotifyClone.cancao AS c
    WHERE
        (SELECT 
                COUNT(*)
            FROM
                SpotifyClone.usuario_historico AS uh
                    INNER JOIN
                SpotifyClone.usuario AS u ON uh.usuario_id = u.id
            WHERE
                cancao_id = c.id
                    AND u.plano_id IN (2 , 3)) > 0
    ORDER BY nome;
