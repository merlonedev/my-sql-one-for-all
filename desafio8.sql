DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
AFTER DELETE ON Usuario
FOR EACH ROW
BEGIN
	DELETE FROM Historico_reproducao AS hr
    WHERE hr.usuario_id = OLD.id;
    
    DELETE FROM Seguindo_artistas AS sa
    WHERE sa.usuario_id = OLD.id;
END $$

DELIMITER ;
