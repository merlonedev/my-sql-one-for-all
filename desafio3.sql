CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        u.`name` AS usuario, s.title AS nome
    FROM
        SpotifyClone.user_song AS us
            JOIN
        SpotifyClone.`user` AS u ON us.user_id = u.id
            JOIN
        SpotifyClone.songs AS s ON us.song_id = s.id
    ORDER BY usuario, nome;
