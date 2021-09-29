USE SpotifyClone;
DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
    AFTER DELETE ON SpotifyClone.usuarios
    FOR EACH ROW
BEGIN
    DELETE FROM SpotifyClone.artistas_usuarios WHERE artistas_usuarios.usuario_id = OLD.usuarios.usuario_id;
    DELETE FROM SpotifyClone.histor_reprod WHERE histor_reprod.usuario_id = OLD.usuarios.usuario_id;
END $$
DELIMITER ;
