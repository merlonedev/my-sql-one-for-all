DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
  BEFORE DELETE ON SpotifyClone.users
  FOR EACH ROW
  BEGIN
    DELETE FROM SpotifyClone.history WHERE user = OLD.id;
DELETE FROM SpotifyClone.following 
WHERE
    user = OLD.id;
  END $$
DELIMITER ;
