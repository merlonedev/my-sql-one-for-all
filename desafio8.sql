DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
AFTER DELETE ON users
FOR EACH ROW
BEGIN
    DELETE FROM followed WHERE user_id = OLD.user_id;
    DELETE FROM songs_history WHERE user_id = OLD.user_id;
END $$

DELIMITER ;
