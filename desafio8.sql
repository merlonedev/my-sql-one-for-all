USE SpotifyClone;

DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuarios
FOR EACH ROW
BEGIN
DELETE FROM relacao_seguidores AS rs WHERE usuario_id = OLD.usuario_id;
DELETE FROM historico_reproducao AS hr WHERE usuario_id = OLD.usuario_id;
END $$
DELIMITER ;
