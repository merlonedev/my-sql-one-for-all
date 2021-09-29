CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        c.cancao_name, COUNT(h.usuario_id) reproducoes
    FROM
        SpotifyClone.cancoes AS c
            INNER JOIN
        SpotifyClone.historico AS h ON c.cancao_id = h.cancao_id
    GROUP BY c.cancao_name
    ORDER BY reproducoes DESC , c.cancao_name
    LIMIT 2;
