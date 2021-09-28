CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        mu.nome_musica AS cancao,
        COUNT(mr.usuario_id) AS reproducoes
    FROM
        musicas_reproduzidas AS mr
            JOIN
        musicas AS mu ON mr.musica_id = mu.musica_id
    GROUP BY cancao
    ORDER BY reproducoes DESC , cancao
    LIMIT 2;
