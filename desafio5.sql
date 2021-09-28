CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        c.nome AS `cancao`, COUNT(uc.usuario_id) AS `reproducoes`
    FROM
        SpotifyClone.cancoes AS c
            JOIN
        SpotifyClone.usuarios_cancoes AS uc ON c.cancao_id = uc.cancao_id
    GROUP BY `cancao`
    ORDER BY `reproducoes` DESC, `cancao` ASC
    LIMIT 2;
