DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuarios
FOR EACH ROW
BEGIN
DELETE FROM relacao_seguidores WHERE usuario_id = OLD.usuario_id;
DELETE FROM historico_reproducao WHERE usuario_id = OLD.usuario_id;
END $$
DELIMITER ;
