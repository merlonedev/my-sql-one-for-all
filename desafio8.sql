DELIMITER $$ 
CREATE TRIGGER trigger_usuario_delete
BEFORE
  DELETE ON user FOR EACH ROW BEGIN
DELETE FROM
  seguindo 
WHERE
  OLD.id = user_id;
DELETE FROM
  historico
WHERE
  OLD.id = user_id;
END $$ 
DELIMITER ;
