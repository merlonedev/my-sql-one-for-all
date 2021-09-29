DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
DELETE FROM artista_seguidores WHERE user_id = OLD.user_id;
DELETE FROM historico WHERE user_id = OLD.user_id;
END $$
DELIMITER ;
