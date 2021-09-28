USE SpotifyClone;

DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico (id_usuario VARCHAR(20))
RETURNS INT READS SQL DATA
BEGIN
DECLARE total_musicas INT;
SELECT COUNT(cancao_id) FROM SpotifyClone.cancoes_reproduzidas_usuario AS cru
INNER JOIN usuarios AS u
ON u.usuario_id = cru.usuario_id
WHERE u.usuario_id = id_usuario
INTO total_musicas;
RETURN total_musicas;
END $$

DELIMITER ;
