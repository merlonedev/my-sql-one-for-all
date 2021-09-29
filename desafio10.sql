DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(idUser INT)
RETURNS INT READS SQL DATA
BEGIN
    DECLARE qtdMusicas INT;
    
SELECT 
    COUNT(Song_ID)
INTO qtdMusicas FROM
    user_songs_listened
WHERE
    User_ID = idUser;
    
    RETURN qtdMusicas;
END $$

DELIMITER ;
