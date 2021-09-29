CREATE VIEW cancoes_premium AS
    SELECT 
        c.nome AS `nome`,
        (SELECT 
                COUNT(uc.usuario_id)
            FROM
                SpotifyClone.usuarios_cancoes AS uc
            WHERE
                uc.usuario_id IN (2 , 3)
                    AND c.cancao_id = uc.cancao_id) AS `reproducoes`
    FROM
        SpotifyClone.cancoes AS c
    WHERE
        (SELECT 
                COUNT(uc.usuario_id)
            FROM
                SpotifyClone.usuarios_cancoes AS uc
            WHERE
                uc.usuario_id IN (2 , 3)
                    AND c.cancao_id = uc.cancao_id) > 0 order by `nome`;	
