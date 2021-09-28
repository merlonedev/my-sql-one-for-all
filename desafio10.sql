DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantidade INT;
SELECT 
    COUNT(*)
FROM
    SpotifyClone.historico_musicas hm
WHERE
    hm.id_usuario = id INTO quantidade;
RETURN quantidade;
END
$$

DELIMITER ;
