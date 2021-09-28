DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE total INT;
SELECT COUNT(*) FROM historico
WHERE usuario_id = id INTO total;
RETURN total;
END $$
DELIMITER ;
