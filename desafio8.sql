DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
DELETE FROM user_songs_history
WHERE user_id = OLD.user_id;
DELETE FROM user_followage
WHERE user_id = OLD.user_id;
END $$

DELIMITER ;
