CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        u.username AS usuario, s.song AS nome
    FROM
        SpotifyClone.users AS u
            JOIN
        SpotifyClone.songs_history AS sh ON u.user_id = sh.user_id
            JOIN
        SpotifyClone.songs AS s ON s.song_id = sh.song_id
    ORDER BY u.username, s.song;
