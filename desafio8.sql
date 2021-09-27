DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.usuario
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.seguindoArtistas
WHERE OLD.usuario_id = usuario_id;
DELETE FROM SpotifyClone.historicoMusicas
WHERE OLD.usuario_id = usuario_id;
END $$
DELIMITER ;
