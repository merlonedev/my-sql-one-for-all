DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON tb_usuarios
FOR EACH ROW

BEGIN

DELETE FROM tb_cancoes_usuario
WHERE id_usuario = OLD.id_usuario;

DELETE FROM tb_artistas_usuarios 
WHERE id_usuario = OLD.id_usuario;

END $$

DELIMITER ;
