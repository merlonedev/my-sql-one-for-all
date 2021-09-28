USE SpotifyClone;

DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuarios
FOR EACH ROW
BEGIN
DELETE FROM usuario_artistas WHERE usuario_id = OLD.ID;
DELETE FROM usuario_cancoes WHERE usuario_id = OLD.ID;
END $$
DELIMITER ;

SELECT * FROM usuarios;
