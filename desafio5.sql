CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        c.cancao, COUNT(h.usuario_id) reproducoes
    FROM
        SpotifyClone.cancoes AS c
            INNER JOIN
        SpotifyClone.historico AS h ON c.cancao_id = h.cancao_id
    GROUP BY c.cancao
    ORDER BY reproducoes DESC , c.cancao
    LIMIT 2;
