DELIMITTER $$

CREATE FUNCTION quantidade_musicas_no_historico(userId INT)

  RETURNS INT READS SQL DATA 
  BEGIN
    DECLARE total INT;
    
SELECT COUNT(h.user_id)
  FROM SpotifyClone.history AS h
  WHERE h.user_id = userId INTO total;
RETURN total;

END $$

DELIMITTER ;
