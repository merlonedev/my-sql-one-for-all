CREATE VIEW cancoes_premium AS
    SELECT 
        s.songs AS nome, COUNT(sh.songs_id) AS reproducoes
    FROM
        SpotifyClone.songs_history AS sh
            JOIN
        SpotifyClone.users AS u ON (sh.user_id = u.user_id)
            AND (u.subscribe_id = 2 OR u.subscribe_id = 3)
            JOIN
        SpotifyClone.songs AS s ON sh.music_id = s.music_id
    GROUP BY nome
    ORDER BY nome;
