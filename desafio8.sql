DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.tb_usuarios
FOR EACH ROW

BEGIN

DELETE FROM SpotifyClone.tb_cancoes_usuario
WHERE id_usuario = OLD.id_usuario;

DELETE FROM SpotifyClone.tb_artistas_usuarios 
WHERE id_usuario = OLD.id_usuario;

END $$

DELIMITER ;
