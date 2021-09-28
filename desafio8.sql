USE SpotifyClone;
DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
AFTER DELETE ON Usuarios
FOR EACH ROW
BEGIN
DELETE FROM Usuario_Artista WHERE usuario_id = OLD.id;
DELETE FROM Usuario_Historico WHERE usuario_id = OLD.id;
END $$

DELIMITER ;
