CREATE VIEW cancoes_premium AS
  SELECT S.song_name AS nome,
    COUNT(US.user_ID) AS reproducoes
  FROM Songs S
  JOIN HistoriesUsers_Songs US ON S.song_ID = US.song_ID
  JOIN Users U ON U.user_ID = US.user_ID
  JOIN Plans P ON U.plan_ID = P.plan_ID
  WHERE P.plan_ID IN(2, 3)
  GROUP BY `nome`
  ORDER BY `nome`;
