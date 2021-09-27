DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id_user VARCHAR(15))
RETURNS INT READS SQL DATA
BEGIN
	DECLARE quantity INT;
    SELECT COUNT(*) FROM historic
	WHERE user_id = id_user INTO quantity;
    RETURN quantity;
END $$
DELIMITER ;
