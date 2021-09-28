CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        (SELECT 
                cancao
            FROM
                SpotifyClone.cancoes c
            WHERE
                hr.cancao_id = c.cancao_id) AS `cancao`,
        COUNT(usuario_id) AS `reproducoes`
    FROM
        SpotifyClone.hist_reproducoes hr
    GROUP BY cancao_id
    ORDER BY `reproducoes` DESC, `cancao`
    LIMIT 2
;
