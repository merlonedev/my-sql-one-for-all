    SELECT 
        m.musica_nome AS `cancao`,
        COUNT(m.musica_id) AS `reproducoes`
    FROM
        SpotifyClone.Historico AS sh
            INNER JOIN
        SpotifyClone.Musica AS m ON m.musica_id = sh.musica_id
    GROUP BY `cancao`
    ORDER BY `reproducoes` DESC , `cancao`
    LIMIT 2;
