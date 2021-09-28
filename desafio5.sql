CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        cancoes.nome_cancao AS 'cancao',
        COUNT(reproducoes.id_usuario) AS 'reproducoes'
    FROM
        tb_cancoes_usuario AS reproducoes
            JOIN
        tb_usuarios AS usuarios ON usuarios.usuario_id = reproducoes.id_usuario
            JOIN
        tb_cancoes AS cancoes ON cancoes.id_cancao = reproducoes.id_cancao
    GROUP BY cancoes.nome_cancao
    ORDER BY COUNT(reproducoes.id_usuario) DESC , cancoes.nome_cancao ASC
    LIMIT 2;
