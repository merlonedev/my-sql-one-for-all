DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON tb_usuarios
FOR EACH ROW

BEGIN

DELETE FROM tb_cancoes_usuario
WHERE id_usuario = OLD.usuario_id;

DELETE FROM tb_artistas_usuarios 
WHERE id_usuario = OLD.usuario_id;

END $$

DELIMITER ;
