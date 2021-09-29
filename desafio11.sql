CREATE VIEW cancoes_premium AS
SELECT
S.song_name AS "nome",
COUNT(H.song_id) AS "reproducoes"
FROM historic AS H
INNER JOIN songs AS S ON S.song_id = H.song_id
INNER JOIN users AS U ON U.user_id = H.user_id
INNER JOIN plans AS P ON P.plan_id = U.plan_id
WHERE P.plan_id IN (2, 3)
GROUP BY S.song_name
ORDER BY 1;
