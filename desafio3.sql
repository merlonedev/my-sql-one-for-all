CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        usuarios.usuario, cancoes.cancao
    FROM
        usuariosCancoes
            JOIN
        usuarios ON usuarios.usuario_id = usuariosCancoes.usuario_id
            JOIN
        cancoes ON cancoes.cancao_id = usuariosCancoes.cancao_id
    ORDER BY usuarios.usuario , cancoes.cancao;
