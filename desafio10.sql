DELIMITER $$ 
CREATE FUNCTION quantidade_musicas_no_historico(userid int) 
RETURNS INT READS SQL DATA 
BEGIN 
  DECLARE qntd_musicas INT;
SELECT
  COUNT(*) AS quantidade_musicas_no_historico
FROM
  historico
WHERE
  user_id = userid INTO qntd_musicas;
RETURN qntd_musicas;

END $$ 
DELIMITER ;
