CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        users.user_name AS usuario, song.song_title AS nome
    FROM
        SpotifyClone.users AS users
            INNER JOIN
        SpotifyClone.rep_history AS his ON users.user_id = his.user_id
            INNER JOIN
        SpotifyClone.songs AS song ON his.song_id = song.song_id
    ORDER BY usuario , nome;
    
SELECT * FROM historico_reproducao_usuarios;
