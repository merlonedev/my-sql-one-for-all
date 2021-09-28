CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        mus.musica_nome AS `cancao`,
        COUNT(hist.usuario_id) AS `reproducoes`
    FROM
        SpotifyClone.Historico AS hist
            INNER JOIN
        SpotifyClone.Musica AS mus ON mus.musica_id = hist.musica_id
    GROUP BY `cancao`
    ORDER BY `reproducoes` DESC , `cancao`
    LIMIT 2;
