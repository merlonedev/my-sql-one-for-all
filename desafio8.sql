DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuarios
FOR EACH ROW 
BEGIN
DELETE FROM usuariosArtistas
WHERE usuario_id = OLD.usuario_id;
DELETE FROM usuariosCancoes 
WHERE
    usuario_id = OLD.usuario_id;
END $$

DELIMITER ;
