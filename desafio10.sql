DELIMITER $$

CREATE FUNCTION
  quantidade_musicas_no_historico(id_input INT)
RETURNS INT READS SQL DATA
BEGIN
  DECLARE qntd_musicas INT;
  SELECT COUNT(US.song_ID)
  FROM Users U
  JOIN HistoriesUsers_Songs US ON U.user_ID = US.user_ID
  WHERE U.user_ID = id_input
  GROUP BY U.user_name
  INTO qntd_musicas;
  RETURN qntd_musicas;
END $$

DELIMITER ;
