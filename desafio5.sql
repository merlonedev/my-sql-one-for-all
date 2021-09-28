CREATE VIEW SpotifyClone.top_2_hits_do_momento AS
(SELECT
    s.name AS `cancao`,
    (
    SELECT
        COUNT(user_id)
    FROM
        SpotifyClone.users_songs AS us
    WHERE
        s.id = us.song_id
    GROUP BY
        us.song_id
    ) AS `reproducoes`
FROM
    SpotifyClone.songs AS s
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2);
