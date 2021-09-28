CREATE VIEW historico_reproducao_usuarios AS
  SELECT U.user_name AS usuario,
    song_name AS nome
  FROM Users U
  JOIN HistoriesUsers_Artists H ON U.user_ID = H.user_ID
  JOIN Songs S ON H.song_ID = S.song_ID
  ORDER BY `usuario`, `nome`;
