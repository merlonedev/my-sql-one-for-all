DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON Usuario
FOR EACH ROW
BEGIN
DELETE FROM Historico_reproducao
WHERE OLD.id = usuario_id;
DELETE FROM Seguindo_artistas
WHERE OLD.id = usuario_id;
END $$

DELIMITER ;
