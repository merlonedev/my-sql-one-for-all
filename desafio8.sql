DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
DELETE FROM user_artist 
WHERE OLD.user_id = user_id;
DELETE FROM historic
WHERE OLD.user_id = user_id;
END $$
DELIMITER ;
