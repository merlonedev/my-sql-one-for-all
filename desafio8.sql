DELIMITER $$

CREATE TRIGGER `trigger_usuario_delete`     
  BEFORE DELETE ON `users`     
  FOR EACH ROW     
BEGIN
DELETE FROM user_artists_listened 
WHERE 
    User_ID = OLD.User_ID;
    
DELETE FROM user_songs_listened 
WHERE
    User_ID = OLD.User_ID;
END $$

DELIMITER ;
