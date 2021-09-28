USE SpotifyClone;
DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuarios
FOR EACH ROW
BEGIN
DELETE FROM usuario_seguindo WHERE usuario_id = OLD.id;
DELETE FROM usuario_historico WHERE usuario_id = OLD.id;
END $$

DELIMITER ;
