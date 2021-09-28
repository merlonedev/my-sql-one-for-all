CREATE VIEW SpotifyClone.top_2_hits_do_momento AS
    SELECT 
        c.cancao AS cancao,
        (SELECT 
                COUNT(*)
            FROM
                usuario_historico
            WHERE
                cancao_id = c.id) AS reproducoes
    FROM
        SpotifyClone.cancao AS c
    ORDER BY reproducoes DESC , cancao
    LIMIT 2;
