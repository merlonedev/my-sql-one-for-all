CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        m.musica AS cancao, COUNT(hr.musica_id) AS reproducoes
    FROM
        Musicas AS m
            INNER JOIN
        Historico_reproducao AS hr ON m.id = hr.musica_id
    GROUP BY m.musica
    ORDER BY reproducoes DESC , cancao ASC
    LIMIT 2;
