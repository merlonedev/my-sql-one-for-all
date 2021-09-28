DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(codigo_usuario INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE qtd_musicas INT;
SELECT 
    COUNT(*)
FROM
    musicas_reproduzidas
WHERE
    usuario_id = codigo_usuario
GROUP BY usuario_id INTO qtd_musicas;
    RETURN qtd_musicas;
END $$

DELIMITER ;
