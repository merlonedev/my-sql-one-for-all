DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE
ON SpotifyClone.usuario
FOR EACH ROW
BEGIN
  DELETE FROM SpotifyClone.usuario_ouviu_cancao
  WHERE id_usuario = OLD.id_usuario;
  DELETE FROM SpotifyClone.usuario_segue_artista
  WHERE id_usuario = OLD.id_usuario;
END
$$
DELIMITER ;
