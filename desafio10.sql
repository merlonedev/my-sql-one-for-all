DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(user_cod INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE result INT;
SELECT COUNT(h.cancao_id) quantidade_musicas_no_historico
FROM SpotifyClone.historico h
WHERE h.user_id = user_cod
INTO result;
RETURN result;
END $$

DELIMITER ;
