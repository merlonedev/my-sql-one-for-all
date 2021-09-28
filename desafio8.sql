DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.users
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.rep_history
WHERE user_id = OLD.user_id;
DELETE FROM SpotifyClone.user_follows 
WHERE
    user_id = OLD.user_id;
END $$

DELIMITER ;
