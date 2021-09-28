DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id NVARCHAR(100))
RETURNS INT READS SQL DATA
BEGIN 
DECLARE quantidade_musicas_no_historico INT;
SELECT 
    COUNT(uh.user_id)
FROM
    users u
        INNER JOIN
    user_songs_history uh ON u.user_id = uh.user_id
WHERE
    uh.user_id = id INTO quantidade_musicas_no_historico;
RETURN quantidade_musicas_no_historico;
END $$

DELIMITER ;
