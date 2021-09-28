DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
  BEFORE DELETE ON usuarios
  FOR EACH ROW
BEGIN

DELETE FROM usuarios_seguindo 
WHERE 
    id_usuario = OLD.id_usuario;

DELETE FROM historico_musicas 
WHERE
    id_usuario = OLD.id_usuario;

END
$$

DELIMITER ;