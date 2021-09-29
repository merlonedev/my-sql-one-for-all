CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        c.nome_cancao AS 'cancao',
        COUNT(hr.usuario_id) AS 'reproducoes'
    FROM
        SpotifyClone.historico_reproducao AS hr
            INNER JOIN
        SpotifyClone.usuarios AS u ON hr.usuario_id = u.usuario_id
            INNER JOIN
        SpotifyClone.cancoes AS c ON hr.cancao_id = c.cancao_id
    GROUP BY c.nome_cancao
    ORDER BY reproducoes DESC
    LIMIT 2;
