CREATE VIEW top_2_hits_do_momento AS
  SELECT S.song_name AS cancao,
    COUNT(HS.user_ID) AS reproducoes
  FROM Songs S
  JOIN HistoriesUsers_Songs HS ON S.song_ID = HS.song_ID
  GROUP BY `cancao`
  ORDER BY `reproducoes` DESC, `cancao`
  LIMIT 2;
