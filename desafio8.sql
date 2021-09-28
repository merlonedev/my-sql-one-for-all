delimiter $$

CREATE TRIGGER trigger_usuario_delete 
BEFORE DELETE on users
FOR EACH ROW
BEGIN
	DELETE FROM histories where old.user_id = histories.user_id;
    DELETE FROM user_follow where old.user_id = user_follow.user_id;
END $$

delimiter ;
