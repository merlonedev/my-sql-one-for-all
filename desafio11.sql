CREATE VIEW cancoes_premium AS
    SELECT
        m.titulo AS `nome`,
        COUNT(hm.usuario_id) AS `reproducoes`
    FROM
        SpotifyClone.historico_musicas AS `hm`
    JOIN SpotifyClone.musicas AS `m` ON hm.musica_id = m.id
    JOIN SpotifyClone.usuarios AS `u` ON hm.usuario_id = u.id
    WHERE u.plano_id = 2 OR u.plano_id = 3
    GROUP BY m.titulo
    ORDER BY m.titulo;
