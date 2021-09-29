DELIMITER $

CREATE TRIGGER SpotifyClone.trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.users
FOR EACH ROW

BEGIN
    DELETE FROM SpotifyClone.users_artists
    WHERE
        OLD.id = user_id;

    DELETE FROM SpotifyClone.users_songs
    WHERE
        OLD.id = user_id;
END $

DELIMITER ;

DELETE FROM SpotifyClone.users AS u
WHERE u.name LIKE 'Thati';
