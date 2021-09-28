CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        M.musica_nome AS `cancao`,
        COUNT(R.musica_id) AS `reproducoes`
    FROM
        SpotifyClone.musicas AS M
            INNER JOIN
        SpotifyClone.reproducoes AS R ON M.musica_id = R.musica_id
    GROUP BY `cancao`
    ORDER BY `reproducoes` DESC , `cancao` ASC
    LIMIT 2;
