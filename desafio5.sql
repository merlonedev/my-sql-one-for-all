CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        cancoes.cancao AS cancao,
        COUNT(usuariosCancoes.usuario_id) AS reproducoes
    FROM
        usuariosCancoes
            JOIN
        cancoes ON usuariosCancoes.cancao_id = cancoes.cancao_id
    GROUP BY cancao
    ORDER BY reproducoes DESC , cancao
    LIMIT 2;
