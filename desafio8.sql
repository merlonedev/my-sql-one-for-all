DELIMITER $$ 
  CREATE TRIGGER trigger_usuario_delete
  BEFORE DELETE ON SpotifyClone.Usuario
  FOR EACH ROW
  BEGIN 
    DELETE FROM SpotifyClone.Historico
    WHERE usuario_id = OLD.usuario_id;
DELETE FROM SpotifyClone.Seguidores 
WHERE
    usuario_id = OLD.usuario_id;
  END $$
  DELIMITER ;