DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.users
    FOR EACH ROW
BEGIN
DELETE FROM users_history WHERE user_id = OLD.id;
DELETE FROM users_follows WHERE user_id = OLD.id;
END $$

DELIMITER ;
