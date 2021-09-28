DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE
ON usuario
FOR EACH ROW
BEGIN
DELETE FROM seguindoartistas WHERE usuario_id = OLD.usuario_id;
DELETE FROM historico WHERE usuario_id = OLD.usuario_id;
END $$
DELIMITER ;
