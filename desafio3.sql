CREATE VIEW historico_reproducao_usuarios AS
    SELECT
    s.name AS `nome`,
    u.name AS `usuario`
    FROM SpotifyClone.user_song AS u_s
    JOIN SpotifyClone.users AS u ON u_s.user_id = u.id
    JOIN SpotifyClone.songs AS s ON u_s.song_id = s.id
    ORDER BY `usuario` ASC,`nome` ASC;
