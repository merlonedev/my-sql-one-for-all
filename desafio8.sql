DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
DELETE FROM `history` WHERE user_id = OLD.user_id;
DELETE FROM `follows` WHERE user_id = OLD.user_id;
END $$
DELIMITER ;
