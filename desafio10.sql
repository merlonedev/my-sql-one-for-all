USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE total_musicas INT;
SELECT 
    COUNT(*)
FROM
    SpotifyClone.usuario_historico
WHERE
    usuario_id = id INTO total_musicas;
    RETURN total_musicas;
END $$

DELIMITER ;
