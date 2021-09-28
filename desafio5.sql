CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        m.title AS `cancao`,
        COUNT(m.title) AS `reproducoes`
    FROM
        SpotifyClone.history AS h
            INNER JOIN
        SpotifyClone.musics AS m ON h.music = m.id
    GROUP BY `cancao`
    ORDER BY `reproducoes` DESC , `cancao` ASC
    LIMIT 2;
