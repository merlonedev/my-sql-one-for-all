USE SpotifyClone;

DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.usuarios
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.artistas_seguidos_usuario
WHERE usuario_id = OLD.usuario_id;
DELETE FROM SpotifyClone.cancoes_reproduzidas_usuario
WHERE usuario_id = OLD.usuario_id;
END $$

DELIMITER ;
