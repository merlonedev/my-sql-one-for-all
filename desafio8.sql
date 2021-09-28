USE SpotifyClone;

DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
	BEFORE DELETE ON SpotifyClone.users
    FOR EACH ROW
BEGIN
	DELETE FROM SpotifyClone.user_artist
    WHERE user_id = OLD.id;
    DELETE FROM SpotifyClone.user_song
    WHERE user_id = OLD.id;
END $$
DELIMITER ;

DELETE FROM SpotifyClone.users WHERE id = 1;