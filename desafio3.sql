CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        u.nome_usuario AS 'usuario', c.nome_cancao AS 'nome'
    FROM
        SpotifyClone.historico_reproducao AS hr
            INNER JOIN
        SpotifyClone.usuarios AS u ON hr.usuario_id = u.usuario_id
            INNER JOIN
        SpotifyClone.cancoes AS c ON hr.cancao_id = c.cancao_id
    ORDER BY u.nome_usuario , c.nome_cancao;
