CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        C.cancao_nome AS cancao, COUNT(H.usuario_id) AS reproducoes
    FROM
        SpotifyClone.Cancoes AS C
            INNER JOIN
        SpotifyClone.Historico AS H ON C.cancao_id = H.cancao_id
    GROUP BY C.cancao_nome
    ORDER BY `reproducoes` DESC , C.cancao_nome
    LIMIT 2;
    
