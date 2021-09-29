DELIMITER $$

CREATE FUNCTION SpotifyClone.quantidade_musicas_no_historico(id INT)

RETURNS INT READS SQL DATA

BEGIN
  DECLARE quantidadeTotal INT;
  SELECT COUNT(*) FROM SpotifyClone.histories 
  WHERE user_id = id INTO quantidadeTotal;
  RETURN quantidadeTotal;
END $$

DELIMITER ;
