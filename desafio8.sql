DELIMITER  $$ 

CREATE TRIGGER trigger_usuario_delete
  BEFORE DELETE ON spotifyclone.usuario
  FOR EACH ROW
BEGIN
  DELETE FROM spotifyclone.seguindo WHERE usuario_id = OLD.usuario_id;
  DELETE FROM spotifyclone.historico WHERE usuario_id = OLD.usuario_id;
END $$
DELIMITER ;

  