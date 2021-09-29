USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(usuario VARCHAR(45))
RETURNS INT READS SQL DATA
BEGIN
DECLARE result INT;
SELECT COUNT(song_id)
FROM
user_song AS us
INNER JOIN
users AS u ON u.user_id = us.user_id
WHERE u.name LIKE CONCAT('%', usuario, '%') INTO result;
RETURN result;
END $$

DELIMITER ;
