DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(userID INT)
  RETURNS INT READS SQL DATA
  BEGIN
  DECLARE historyCount INT;
SELECT 
    COUNT(h.music)
FROM
    SpotifyClone.`history` AS h
WHERE
    h.`user` = userID INTO historyCount;
  RETURN historyCount;
  END $$
DELIMITER ;
