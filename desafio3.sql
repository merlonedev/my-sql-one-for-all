CREATE VIEW historico_reproducao_usuarios AS
    (SELECT 
        u.name usuario, m.title nome
    FROM
        SpotifyClone.history AS h
            INNER JOIN
        SpotifyClone.users AS u ON h.user = u.id
            INNER JOIN
        SpotifyClone.musics AS m ON h.music = m.id
    ORDER BY 1 , 2);
