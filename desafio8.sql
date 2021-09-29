USE SpotifyClone;
DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
DELETE FROM user_song WHERE user_id = OLD.user_id;
DELETE FROM user_artist WHERE user_id = OLD.user_id;
END $$

DELIMITER ;
