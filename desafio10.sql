DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(user_id_param int)
RETURNS INT READS SQL DATA
BEGIN
    DECLARE total_songs_history INT;
    SELECT COUNT(user_id)
    FROM SpotifyClone.user_song
    WHERE user_id = user_id_param INTO total_songs_history;
    RETURN total_songs_history;
END $$

DELIMITER ;
