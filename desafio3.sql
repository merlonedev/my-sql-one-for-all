CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        (SELECT 
                usuario
            FROM
                SpotifyClone.usuarios u
            WHERE
                u.usuario_id = h.usuario_id) AS `usuario`,
        (SELECT 
                cancao
            FROM
                SpotifyClone.cancoes c
            WHERE
                c.cancao_id = h.cancao_id) AS `nome`
    FROM
        SpotifyClone.hist_reproducoes h
	ORDER BY `usuario`, `nome`
;
