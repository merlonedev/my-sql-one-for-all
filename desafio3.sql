CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        username AS usuario, song_name AS nome
    FROM
        users u
            INNER JOIN
        user_songs_history uh ON u.user_id = uh.user_id
            INNER JOIN
        songs s ON uh.song_id = s.song_id
    ORDER BY username , song_name;
