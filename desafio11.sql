CREATE VIEW cancoes_premium AS
    SELECT 
        cancoes.nome_cancao AS 'nome',
        COUNT(id_usuario) AS 'reproducoes'
    FROM
        tb_cancoes_usuario AS `reproducoes`
            JOIN
        tb_usuarios AS usuarios ON usuarios.usuario_id = reproducoes.id_usuario
            JOIN
        tb_cancoes AS cancoes ON cancoes.id_cancao = reproducoes.id_cancao
    WHERE
        usuarios.id_plano IN (2 , 3)
    GROUP BY cancoes.nome_cancao
    ORDER BY cancoes.nome_cancao ASC;

