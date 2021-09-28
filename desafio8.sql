DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.usuario
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.hist_rep
WHERE usuario_id = OLD.usuario_id;
DELETE FROM SpotifyClone.follow
WHERE usuario_id = OLD.usuario_id;
END $$

DELIMITER ;
