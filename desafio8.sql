DELIMITER $

CREATE TRIGGER SpotifyClone.trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.users
FOR EACH ROW

BEGIN
    DELETE FROM SpotifyClone.users_artists AS ua
    WHERE
        OLD.id = ua.user_id;

    DELETE FROM SpotifyClone.users_songs AS us
    WHERE
        OLD.id = us.user_id;
END $

DELIMITER ;

DELETE FROM SpotifyClone.users AS u
WHERE u.name LIKE 'Thati';
