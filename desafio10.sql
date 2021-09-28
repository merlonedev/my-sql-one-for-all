DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(u_id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantidade_de_musicas INT;
SELECT 
COUNT(usuario_id)
FROM
historico_reproducao
WHERE
usuario_id = u_id INTO quantidade_de_musicas;
RETURN quantidade_de_musicas;
END $$
DELIMITER ;
