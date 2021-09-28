CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        u.name AS usuario, s.name AS nome
    FROM
        SpotifyClone.users u
            JOIN
        SpotifyClone.users_history h ON h.user_id = u.id
            JOIN
        SpotifyClone.songs s ON s.id = h.song_id
ORDER BY usuario, nome;
