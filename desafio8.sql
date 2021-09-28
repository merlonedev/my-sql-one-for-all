DELIMITER $$ 
CREATE TRIGGER trigger_usuario_delete
AFTER
  DELETE ON user FOR EACH ROW BEGIN
DELETE FROM
  seguindo s
WHERE
  s.user_id = old.id;

DELETE FROM
  historico h
WHERE
  h.user_id = old.id;

END $$ 
DELIMITER;
