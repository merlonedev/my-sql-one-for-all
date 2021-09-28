CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        us.usuario_nome AS `usuario`, m.musica_nome AS `nome`
    FROM
        SpotifyClone.Historico AS spothist
            INNER JOIN
        SpotifyClone.Usuario AS us ON us.usuario_id = spothist.usuario_id
            INNER JOIN
        SpotifyClone.Musica AS m ON m.musica_id = spothist.musica_id
    ORDER BY `usuario` , `nome`;
