DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.Usuario 
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.Seguindo WHERE OLD.usuario_id = SpotifyClone.Seguindo.usuario_id;
DELETE FROM SpotifyClone.Historico WHERE OLD.usuario_id = SpotifyClone.Seguindo.usuario_id;
END $$
DELIMITER ;
