CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        u.nome AS `usuario`, c.nome AS `nome`
    FROM
        SpotifyClone.usuarios AS u
            JOIN
        SpotifyClone.usuarios_cancoes AS joined_table ON u.usuario_id = joined_table.usuario_id
            JOIN
        SpotifyClone.cancoes AS c ON c.cancao_id = joined_table.cancao_id order by `usuario` ASC, `nome` ASC;
