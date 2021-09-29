DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
RETURN
  (SELECT COUNT(*) AS quantidade_musicas_no_historico
  FROM SpotifyClone.usuario_ouviu_cancao
  WHERE id_usuario = 3);
END $$

DELIMITER ;
