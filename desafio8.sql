DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.`user`
FOR EACH ROW
BEGIN
	DELETE FROM SpotifyClone.user_artist WHERE OLD.id = user_id;
    DELETE FROM SpotifyClone.user_song WHERE OLD.id = user_id;
END $$

DELIMITER ;
