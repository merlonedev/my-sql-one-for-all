USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id int)
RETURNS int READS SQL DATA
BEGIN
    declare quantidade int;
SELECT 
    COUNT(*)
FROM
    usuario_historico
WHERE
    usuario_id = id INTO quantidade;
    RETURN quantidade;
END $$

DELIMITER ;
