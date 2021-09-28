CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        m.musica_nome AS `cancao`,
        COUNT(m.musica_id) AS `reproducoes`
    FROM
        SpotifyClone.musica AS m
            INNER JOIN
        SpotifyClone.historico AS sh ON m.musica_id = sh.musica_id
    GROUP BY `cancao`
    ORDER BY `reproducoes` DESC , `cancao`
    LIMIT 2;
