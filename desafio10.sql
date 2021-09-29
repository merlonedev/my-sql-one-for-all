USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(user_id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE result INT;
SELECT COUNT(song_id)
FROM
user_song AS us
WHERE us.user_id = user_id INTO result;
RETURN result;
END $$

DELIMITER ;
