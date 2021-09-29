USE SpotifyClone;
DELIMITER $$

CREATE TRIGGER
  trigger_usuario_delete
BEFORE DELETE ON Users
FOR EACH ROW
BEGIN
  DELETE FROM FollowUsers_Artists WHERE user_ID = OLD.user_ID;
  DELETE FROM HistoriesUsers_Songs WHERE user_ID = OLD.user_ID;
END $$

DELIMITER ;
