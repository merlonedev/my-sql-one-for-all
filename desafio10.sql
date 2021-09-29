DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
  DECLARE result INT;
  SELECT
    COUNT(*)
  FROM
    SpotifyClone.user_song
  WHERE
    user_id = id INTO result;
  RETURN result;
END $$

DELIMITER ;
