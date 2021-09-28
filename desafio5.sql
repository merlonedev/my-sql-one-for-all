CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        m.nome AS cancao, COUNT(hp.musica_id) AS reproducoes
    FROM
        historico_reproducao AS hp
            INNER JOIN
        musicas AS m ON m.musica_id = hp.musica_id
    GROUP BY `cancao`
    ORDER BY `reproducoes` DESC , `cancao`
    LIMIT 2;
