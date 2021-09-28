DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(usuarioId INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE numeroDeMusicas INT;
SELECT COUNT(*) AS `quantidade_musicas_no_historico`
FROM usuario_historico
WHERE usuario_id = usuarioId
INTO numeroDeMusicas;
RETURN numeroDeMusicas;
END $$

DELIMITER ;
