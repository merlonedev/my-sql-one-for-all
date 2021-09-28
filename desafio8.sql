DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
AFTER DELETE ON SpotifyClone.usuario
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.usuario_historico
WHERE
	usuario_id = old.id;
DELETE FROM SpotifyClone.usuario_seguindo 
WHERE
    usuario_id = old.id;
END $$

DELIMITER ;
