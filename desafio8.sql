DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
    BEFORE DELETE ON SpotifyClone.usuarios
    FOR EACH ROW
BEGIN
    DELETE
        FROM SpotifyClone.usuario_seguindo_artistas
WHERE
    OLD.usuario_id = id_usuario;
DELETE FROM SpotifyClone.usuario_historico_reproducoes
WHERE
    OLD.usuario_id = id_usuario;
END $$
DELIMITER ;
