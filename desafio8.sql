DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.user
FOR EACH ROW
BEGIN
	DELETE FROM singer_followers WHERE user_id = OLD.user_id;
    DELETE FROM reproduction_history WHERE user_id = OLD.user_id;
END $$
DELIMITER ;

/* Os códigos abaixo foi só p eu testar se o trigger estava funcionando. */
-- SET SQL_SAFE_UPDATES = 0;
-- DELETE FROM user WHERE user_name LIKE 'Thati';
-- SELECT * FROM user;
-- SELECT * FROM singer_followers;
-- SELECT * FROM reproduction_history;
-- DROP TRIGGER trigger_usuario_delete;
