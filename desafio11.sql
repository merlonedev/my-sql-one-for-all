CREATE VIEW cancoes_premium AS
    SELECT 
        s.song AS nome, COUNT(sh.song_id) AS reproducoes
    FROM
        SpotifyClone.songs_history AS sh
            JOIN
        SpotifyClone.users AS u ON (sh.user_id = u.user_id)
            AND (u.subscribe_id = 2 OR u.subscribe_id = 3)
            JOIN
        SpotifyClone.songs AS s ON sh.song_id = s.song_id
    GROUP BY nome
    ORDER BY nome;
