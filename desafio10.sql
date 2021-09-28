DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(var_usuario_id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantidade_musica INT;
SELECT
  COUNT(*)
FROM
  SpotifyClone.reproducoes
WHERE usuario_id = var_usuario_id
INTO quantidade_musica;
RETURN quantidade_musica;
END $$

DELIMITER ;
