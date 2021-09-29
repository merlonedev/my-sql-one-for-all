CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        m.nome AS `cancao`, COUNT(h.id_usuario) AS `reproducoes`
    FROM
        HistoricoReproducao AS h
            INNER JOIN
        Musicas AS m ON h.id_musica = m.id
    GROUP BY m.nome
    ORDER BY `reproducoes` DESC , `cancao`
    LIMIT 2;
