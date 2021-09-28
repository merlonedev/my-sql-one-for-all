DROP VIEW IF EXISTS historico_reproducao_usuarios;

CREATE VIEW historico_reproducao_usuarios AS
SELECT
    u.name AS `usuario`, s.name AS `nome`
FROM
    SpotifyClone.users AS u
        JOIN
    SpotifyClone.users_songs AS us ON u.id = us.user_id
        JOIN
    SpotifyClone.songs AS s ON s.id = us.song_id
ORDER BY u.name, s.name;
