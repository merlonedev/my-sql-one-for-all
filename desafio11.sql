CREATE VIEW cancoes_premium AS
(SELECT
    DISTINCT `premium_songs`.`song_name` AS `nome`,
    `premium_songs`.`reproducoes`
FROM
    (
    SELECT
        (
        SELECT
            s.name
        FROM
            SpotifyClone.songs AS s
        WHERE
            us.song_id = s.id
        ) AS `song_name`,
        COUNT(us.user_id) AS `reproducoes`
    FROM
        SpotifyClone.users_songs AS us
    WHERE
		us.user_id IN
        (
        SELECT
            u.id
        FROM
            SpotifyClone.users AS u
        WHERE
            u.plan_id IN (2, 3)
        )
    GROUP BY
        us.song_id
    ) AS `premium_songs`
        JOIN
    SpotifyClone.users
ORDER BY `nome`);
