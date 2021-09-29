DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.Usuario
FOR EACH ROW
BEGIN
  DELETE FROM SpotifyClone.Usuario_Cancao
  WHERE OLD.usuario_id = usuario_id;
  DELETE FROM SpotifyClone.Usuario_Artista
  WHERE OLD.usuario_id = usuario_id;
END $$

DELIMITER ;