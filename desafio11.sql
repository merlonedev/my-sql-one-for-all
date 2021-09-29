CREATE VIEW cancoes_premium AS
    SELECT 
        c.nome_cancao AS 'nome',
        COUNT(u.nome_usuario) AS 'reproducoes'
    FROM
        SpotifyClone.historico_reproducao AS hr
            INNER JOIN
        SpotifyClone.usuarios AS u ON hr.usuario_id = u.usuario_id
            INNER JOIN
        SpotifyClone.cancoes AS c ON hr.cancao_id = c.cancao_id
            INNER JOIN
        SpotifyClone.planos AS p ON u.plano_id = p.plano_id
    WHERE
        p.plano = 'familiar'
            OR p.plano = 'universitário'
    GROUP BY nome
    ORDER BY nome;
