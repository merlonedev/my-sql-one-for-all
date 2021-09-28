CREATE VIEW cancoes_premium AS
    SELECT 
        m.title AS `nome`, COUNT(h.`user`) AS `reproducoes`
    FROM
        SpotifyClone.history AS h
            INNER JOIN
        SpotifyClone.musics AS m ON h.music = m.id
            INNER JOIN
        SpotifyClone.users AS u ON h.`user` = u.id
            AND u.plan IN (2 , 3)
    GROUP BY `nome`
    ORDER BY `nome`;
