DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
    BEFORE DELETE ON SpotifyClone.usuarios
    FOR EACH ROW
BEGIN
    DELETE FROM SpotifyClone.historico_musicas
    WHERE usuario_id = OLD.id;
    
    DELETE FROM SpotifyClone.seguidores
    WHERE usuario_id = OLD.id;
END $$    

DELIMITER ;