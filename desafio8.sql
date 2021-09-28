DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
    AFTER DELETE ON usuarios
    FOR EACH ROW
BEGIN
    DELETE FROM artistas_usuarios WHERE usuario_id = OLD.usuario_id;
    DELETE FROM histor_reprod WHERE usuario_id = OLD.usuario_id;
END $$
DELIMITER ;
