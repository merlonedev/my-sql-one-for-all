-- Desafio 8

DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
AFTER DELETE ON usuarios
FOR EACH ROW
BEGIN
  DELETE FROM user_follow WHERE user_id = OLD.user_id;
  DELETE FROM historico WHERE user_id = OLD.user_id;
END $$

DELIMITER ;
