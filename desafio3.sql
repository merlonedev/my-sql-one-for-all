CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        u.nome AS `usuario`, m.nome AS `nome`
    FROM
        HistoricoReproducao AS h
            INNER JOIN
        Usuario AS u ON h.id_usuario = u.id
            INNER JOIN
        Musicas AS m ON h.id_musica = m.id
    ORDER BY `usuario` , `nome`;
