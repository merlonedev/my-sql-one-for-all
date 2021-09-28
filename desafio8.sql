DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuarios
FOR EACH ROW
BEGIN
DELETE FROM usuario_historico WHERE usuario_id = old.id;
DELETE FROM usuario_artista WHERE usuario_id = old.id;
END $$;
DELIMITER ;
