USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(num INT)
RETURNS INT READS SQL DATA
BEGIN
    DECLARE num_rec INT;
    SELECT COUNT(h.usuario_id) AS qtd
    FROM SpotifyClone.histor_reprod AS h
    WHERE h.usuario_id = num
    INTO num_rec;
    RETURN num_rec;
END $$

DELIMITER ;
