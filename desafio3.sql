CREATE VIEW historico_reproducao_usuarios AS
    SELECT
        u.nome AS `usuario`,
        m.titulo AS `nome`
    FROM
        SpotifyClone.historico_musicas AS `h`
    JOIN SpotifyClone.usuarios AS `u`
    ON h.usuario_id = u.id
    JOIN SpotifyClone.musicas AS `m`
    ON h.musica_id = m.id
    ORDER BY `USUARIO`, `nome`;
