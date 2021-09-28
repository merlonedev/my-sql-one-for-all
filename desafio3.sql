CREATE VIEW historico_reproducao_usuarios AS
    SELECT
        u.name AS usuario, s.name AS nome
    FROM
        SpotifyClone.users AS u
            INNER JOIN
        SpotifyClone.user_song AS us ON us.user_id = u.user_id
            INNER JOIN
        SpotifyClone.songs AS s ON s.song_id = us.song_id
    ORDER BY u.name , s.name;
