USE SpotifyClone;
DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
AFTER DELETE ON usuarios
FOR EACH ROW 
BEGIN
DELETE FROM usuario_artista WHERE usuario_id = OLD.usuario_id;
DELETE FROM usuario_historico 
WHERE
    usuario_id = OLD.usuario_id;
END $$

DELIMITER ;
