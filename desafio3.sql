CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        us.usuario_nome AS `usuario`, mus.musica_nome AS `nome`
    FROM
        SpotifyClone.Historico AS hist
            INNER JOIN
        SpotifyClone.Usuario AS us ON us.usuario_id = hist.usuario_id
            INNER JOIN
        SpotifyClone.Musica AS mus ON mus.musica_id = hist.musica_id
    ORDER BY `usuario` , `nome`;
