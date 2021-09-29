CREATE VIEW cancoes_premium AS
SELECT 
  S.song_name AS `nome`,
  COUNT(US.song_id) AS `reproducoes`
FROM
  SpotifyClone.user_song AS US
JOIN
  songs AS S
ON
  US.song_id = S.id
JOIN
  users AS U
ON
  US.user_id = U.id
JOIN
  plans AS P
ON
  U.plan_id = P.id
WHERE
  P.plan_name IN('universitário', 'familiar')
GROUP BY
  US.song_id
ORDER BY
  `nome`;
