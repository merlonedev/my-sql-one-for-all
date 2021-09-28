CREATE VIEW SpotifyClone.top_2_hits_do_momento AS
    SELECT 
        c.cancao, r.reproducoes
    FROM
        SpotifyClone.cancoes AS c
            INNER JOIN
        (SELECT 
            cancao_id, COUNT(*) AS reproducoes
        FROM
            SpotifyClone.usuario_cancoes
        GROUP BY cancao_id) AS r ON c.id = r.cancao_id
    ORDER BY r.reproducoes DESC , c.cancao
    LIMIT 2;
