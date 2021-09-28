USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantity INT;
SELECT 
    COUNT(uh.musica_id)
FROM
    Usuario_Historico AS uh
        JOIN
    Usuarios AS u ON u.id = uh.usuario_id
WHERE
    u.id = id
GROUP BY uh.usuario_id INTO quantity;
RETURN quantity;
END $$

DELIMITER ;
