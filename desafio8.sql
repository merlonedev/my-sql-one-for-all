DELIMITER  $$ 

CREATE TRIGGER trigger_usuario_delete
  BEFORE DELETE ON SpotifyClone.Usuario
  FOR EACH ROW
BEGIN
  DELETE FROM Seguindo WHERE OLD.usuario_id = usuario_id;
  DELETE FROM Historico WHERE OLD.usuario_id = usuario_id;
END $$
DELIMITER ;
