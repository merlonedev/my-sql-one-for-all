CREATE VIEW cancoes_premium AS
    SELECT 
        mus.musica_nome AS `nome`,
        COUNT(hist.usuario_id) AS `reproducoes`
    FROM
        SpotifyClone.Historico AS hist
            INNER JOIN
        SpotifyClone.Musica AS mus ON mus.musica_id = hist.musica_id
            INNER JOIN
        SpotifyClone.Usuario AS us ON us.usuario_id = hist.usuario_id
    WHERE
        plano_id IN (2 , 3)
    GROUP BY `nome`
    ORDER BY `nome`;
