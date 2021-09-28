USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantidade INT;
SELECT 
    COUNT(uh.musica_id)
FROM
    usuario_historico AS uh
        JOIN
    usuarios AS u ON u.id = uh.usuario_id
WHERE
    u.id = id
GROUP BY uh.usuario_id INTO quantidade;
RETURN quantidade;
END $$

DELIMITER ;
